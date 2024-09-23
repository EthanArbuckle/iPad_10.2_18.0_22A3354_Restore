@implementation NPKAssertionWrapper

- (NPKAssertionWrapper)initWithAssertion:(id)a3 invalidator:(id)a4
{
  id v7;
  id v8;
  NPKAssertionWrapper *v9;
  uint64_t v10;
  NSUUID *wrapperUUID;
  uint64_t v12;
  id assertionInvalidator;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NPKAssertionWrapper;
  v9 = -[NPKAssertionWrapper init](&v15, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v10 = objc_claimAutoreleasedReturnValue();
    wrapperUUID = v9->_wrapperUUID;
    v9->_wrapperUUID = (NSUUID *)v10;

    objc_storeStrong((id *)&v9->_assertion, a3);
    v12 = MEMORY[0x2199B6780](v8);
    assertionInvalidator = v9->_assertionInvalidator;
    v9->_assertionInvalidator = (id)v12;

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[NPKAssertionWrapper invalidateAssertionExpected:](self, "invalidateAssertionExpected:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NPKAssertionWrapper;
  -[NPKAssertionWrapper dealloc](&v3, sel_dealloc);
}

- (BOOL)invalidateAssertionExpected:(BOOL)a3
{
  NSObject *assertion;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id assertionInvalidator;
  int v12;
  NSObject *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  assertion = self->_assertion;
  if (assertion)
  {
    if (!a3)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

      if (v6)
      {
        pk_General_log();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = self->_assertion;
          v12 = 138412290;
          v13 = v8;
          _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Warning: Unexpected invalidation of assertion:%@", (uint8_t *)&v12, 0xCu);
        }

      }
    }
    (*((void (**)(void))self->_assertionInvalidator + 2))();
    v9 = self->_assertion;
    self->_assertion = 0;

    assertionInvalidator = self->_assertionInvalidator;
    self->_assertionInvalidator = 0;

  }
  return assertion != 0;
}

- (id)description
{
  NSObject *assertion;
  __CFString *v4;
  void *v5;

  assertion = self->_assertion;
  if (assertion)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(", assertion:%@"), assertion);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_24CFF06D8;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p> {UUID:%@%@}"), objc_opt_class(), self, self->_wrapperUUID, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSObject)assertion
{
  return self->_assertion;
}

- (NSUUID)wrapperUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrapperUUID, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong(&self->_assertionInvalidator, 0);
}

@end
