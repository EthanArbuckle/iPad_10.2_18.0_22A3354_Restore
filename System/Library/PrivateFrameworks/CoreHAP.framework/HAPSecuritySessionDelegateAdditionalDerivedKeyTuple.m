@implementation HAPSecuritySessionDelegateAdditionalDerivedKeyTuple

- (HAPSecuritySessionDelegateAdditionalDerivedKeyTuple)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HAPSecuritySessionDelegateAdditionalDerivedKeyTuple)initWithName:(id)a3 saltData:(id)a4 infoData:(id)a5
{
  id v8;
  id v9;
  id v10;
  HAPSecuritySessionDelegateAdditionalDerivedKeyTuple *v11;
  uint64_t v12;
  NSString *name;
  uint64_t v14;
  NSData *saltData;
  uint64_t v16;
  NSData *infoData;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HAPSecuritySessionDelegateAdditionalDerivedKeyTuple;
  v11 = -[HAPSecuritySessionDelegateAdditionalDerivedKeyTuple init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    saltData = v11->_saltData;
    v11->_saltData = (NSData *)v14;

    v16 = objc_msgSend(v10, "copy");
    infoData = v11->_infoData;
    v11->_infoData = (NSData *)v16;

  }
  return v11;
}

- (NSString)name
{
  return self->_name;
}

- (NSData)saltData
{
  return self->_saltData;
}

- (NSData)infoData
{
  return self->_infoData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoData, 0);
  objc_storeStrong((id *)&self->_saltData, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)new
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

@end
