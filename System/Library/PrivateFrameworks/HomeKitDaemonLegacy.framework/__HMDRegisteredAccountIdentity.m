@implementation __HMDRegisteredAccountIdentity

- (__HMDRegisteredAccountIdentity)initWithIdentity:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (__HMDRegisteredAccountIdentity)initWithIdentity:(id)a3 account:(id)a4
{
  id v7;
  __HMDRegisteredAccountIdentity *v8;
  __HMDRegisteredAccountIdentity *v9;
  __HMDRegisteredAccountIdentity *v10;
  objc_super v12;

  v7 = a4;
  if (v7)
  {
    v12.receiver = self;
    v12.super_class = (Class)__HMDRegisteredAccountIdentity;
    v8 = -[__HMDRegisteredIdentity initWithIdentity:](&v12, sel_initWithIdentity_, a3);
    v9 = v8;
    if (v8)
      objc_storeStrong((id *)&v8->_account, a4);
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (HMDAccount)account
{
  return (HMDAccount *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
