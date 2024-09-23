@implementation AMSAccountsChangedResult

- (AMSAccountsChangedResult)initWithAccount:(id)a3
{
  id v5;
  AMSAccountsChangedResult *v6;
  AMSAccountsChangedResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSAccountsChangedResult;
  v6 = -[AMSAccountsChangedResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (NSString)hashedDescription
{
  void *v2;
  void *v3;

  -[AMSAccountsChangedResult account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hashedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (ACAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
