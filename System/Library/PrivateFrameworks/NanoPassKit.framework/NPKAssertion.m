@implementation NPKAssertion

- (NPKAssertion)initWithType:(unint64_t)a3 reason:(id)a4
{
  id v7;
  NPKAssertion *v8;
  NPKAssertion *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NPKAssertion;
  v8 = -[NPKAssertion init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_reason, a4);
    v9->_state = 0;
  }

  return v9;
}

- (BOOL)isAcquired
{
  return -[NPKAssertion state](self, "state") == 1;
}

- (void)acquireWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  unint64_t state;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  NPKAssertion *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  state = self->_state;
  if (!state)
  {
    v10 = 0;
    v11 = 1;
    self->_state = 1;
    if (!v4)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (state == 1)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      pk_General_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = self;
        _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Attempt to acquire assertion that has already been acquired: %@", (uint8_t *)&v12, 0xCu);
      }

    }
  }
  -[NPKAssertion _errorWithUnderlyingError:](self, "_errorWithUnderlyingError:", CFSTR("Assertion already taken. Cannot acquire an assertion more than once"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  if (v5)
LABEL_8:
    ((void (**)(_QWORD, uint64_t, void *))v5)[2](v5, v11, v10);
LABEL_9:

}

- (void)invalidateWithCompletion:(id)a3
{
  void (**v4)(id, BOOL, void *);
  unint64_t state;
  void *v6;
  void (**v7)(id, BOOL, void *);

  v4 = (void (**)(id, BOOL, void *))a3;
  state = self->_state;
  v7 = v4;
  if (state == 1)
  {
    v6 = 0;
    self->_state = 2;
    if (!v4)
      goto LABEL_6;
    goto LABEL_5;
  }
  -[NPKAssertion _errorWithUnderlyingError:](self, "_errorWithUnderlyingError:", CFSTR("Cannot invalidate an unaquired or invalid assertion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
LABEL_5:
    v7[2](v7, state == 1, v6);
LABEL_6:

}

- (id)_errorWithUnderlyingError:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *MEMORY[0x24BDD0FC8]);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.NPKAssertionErrorDomain"), 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
