@implementation NUStoreFrontProvider

- (NUStoreFrontProvider)initWithAppleAccount:(id)a3
{
  id v5;
  NUStoreFrontProvider *v6;
  NUStoreFrontProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUStoreFrontProvider;
  v6 = -[NUStoreFrontProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_appleAccount, a3);

  return v7;
}

- (NSString)storeFrontIdentifier
{
  void *v2;
  void *v3;

  -[NUStoreFrontProvider appleAccount](self, "appleAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentStoreFrontID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (FCAppleAccount)appleAccount
{
  return self->_appleAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleAccount, 0);
}

@end
