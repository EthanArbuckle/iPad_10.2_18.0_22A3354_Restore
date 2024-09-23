@implementation CRKConcreteIDSAccount

- (CRKConcreteIDSAccount)initWithAccount:(id)a3
{
  id v4;
  CRKConcreteIDSAccount *v5;
  CRKConcreteIDSAccount *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRKConcreteIDSAccount;
  v5 = -[CRKConcreteIDSAccount init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[CRKConcreteIDSAccount updateWithAccount:](v5, "updateWithAccount:", v4);

  return v6;
}

- (void)updateWithAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CRKConcreteIDSAccount account](self, "account");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v7)
  {
    -[CRKConcreteIDSAccount account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeDelegate:", self);

    -[CRKConcreteIDSAccount setAccount:](self, "setAccount:", v7);
    -[CRKConcreteIDSAccount account](self, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addDelegate:queue:", self, MEMORY[0x24BDAC9B8]);

    -[CRKConcreteIDSAccount updateIsActive](self, "updateIsActive");
  }

}

- (void)updateIsActive
{
  int v3;
  void *v4;
  int v5;
  id v6;

  v3 = -[CRKConcreteIDSAccount isActive](self, "isActive");
  -[CRKConcreteIDSAccount account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isActive");

  if (v3 != v5)
  {
    -[CRKConcreteIDSAccount account](self, "account");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CRKConcreteIDSAccount setActive:](self, "setActive:", objc_msgSend(v6, "isActive"));

  }
}

- (NSString)loginID
{
  void *v2;
  void *v3;

  -[CRKConcreteIDSAccount account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loginID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)account:(id)a3 isActiveChanged:(BOOL)a4
{
  NSObject *v5;
  int v6;
  CRKConcreteIDSAccount *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[CRKConcreteIDSAccount updateIsActive](self, "updateIsActive", a3, a4);
  if (_CRKLogASM_onceToken_17 != -1)
    dispatch_once(&_CRKLogASM_onceToken_17, &__block_literal_global_47);
  v5 = _CRKLogASM_logObj_17;
  if (os_log_type_enabled((os_log_t)_CRKLogASM_logObj_17, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_218C99000, v5, OS_LOG_TYPE_INFO, "%{public}@ : Account activity did change.", (uint8_t *)&v6, 0xCu);
  }
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CRKConcreteIDSAccount loginID](self, "loginID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CRKConcreteIDSAccount isActive](self, "isActive");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { loginID = %@, isActive = %@ }>"), v4, self, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (IDSAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
