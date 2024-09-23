@implementation IDSTransactionLogTaskHandlerAccountInfo

- (IDSTransactionLogTaskHandlerAccountInfo)initWithAccountIdentity:(id)a3 aliasToAccountsMap:(id)a4 serviceName:(id)a5
{
  id v9;
  id v10;
  id v11;
  IDSTransactionLogTaskHandlerAccountInfo *v12;
  IDSTransactionLogTaskHandlerAccountInfo *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IDSTransactionLogTaskHandlerAccountInfo;
  v12 = -[IDSTransactionLogTaskHandlerAccountInfo init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accountIdentity, a3);
    objc_storeStrong((id *)&v13->_aliasToAccountsMap, a4);
    objc_storeStrong((id *)&v13->_serviceName, a5);
  }

  return v13;
}

- (id)accountForAlias:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[IDSTransactionLogTaskHandlerAccountInfo aliasToAccountsMap](self, "aliasToAccountsMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (ENAccountIdentity)accountIdentity
{
  return self->_accountIdentity;
}

- (NSDictionary)aliasToAccountsMap
{
  return self->_aliasToAccountsMap;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_aliasToAccountsMap, 0);
  objc_storeStrong((id *)&self->_accountIdentity, 0);
}

@end
