@implementation SUUIJSAppleAccount

- (SUUIJSAppleAccount)initWithACAccount:(id)a3
{
  id v5;
  SUUIJSAppleAccount *v6;
  SUUIJSAppleAccount *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIJSAppleAccount;
  v6 = -[SUUIJSAppleAccount init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (NSString)accountDescription
{
  return -[ACAccount accountDescription](self->_account, "accountDescription");
}

- (NSString)DSID
{
  return (NSString *)-[ACAccount aa_personID](self->_account, "aa_personID");
}

- (NSString)identifier
{
  return -[ACAccount identifier](self->_account, "identifier");
}

- (NSString)username
{
  return -[ACAccount username](self->_account, "username");
}

- (ACAccount)nativeAccount
{
  return (ACAccount *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nativeAccount, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
