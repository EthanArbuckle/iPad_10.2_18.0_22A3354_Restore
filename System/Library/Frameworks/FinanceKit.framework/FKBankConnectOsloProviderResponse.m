@implementation FKBankConnectOsloProviderResponse

- (id)accountForPrimaryIdentifier:(id)a3
{
  return -[NSDictionary objectForKey:](self->_primaryAccountIdentifiersToAccounts, "objectForKey:", a3);
}

- (id)balanceForPrimaryIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_primaryAccountIdentifiersToAccounts, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "balance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)primaryAccountIdentifiers
{
  return -[NSDictionary allKeys](self->_primaryAccountIdentifiersToAccounts, "allKeys");
}

- (FKBankConnectOsloProviderResponse)initWithDictionary:(id)a3
{
  id v4;
  FKBankConnectOsloProviderResponse *v5;
  FKBankConnectOsloProviderResponse *v6;
  uint64_t v7;
  NSDictionary *primaryAccountIdentifiersToAccounts;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FKBankConnectOsloProviderResponse;
  v5 = -[FKBankConnectOsloProviderResponse init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_isErrorResponse = 0;
    v7 = objc_msgSend(v4, "copy");
    primaryAccountIdentifiersToAccounts = v6->_primaryAccountIdentifiersToAccounts;
    v6->_primaryAccountIdentifiersToAccounts = (NSDictionary *)v7;

  }
  return v6;
}

- (unint64_t)count
{
  if (self->_isErrorResponse)
    return 1;
  else
    return -[NSDictionary count](self->_primaryAccountIdentifiersToAccounts, "count");
}

- (id)description
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; %@>"),
    objc_opt_class(),
    self,
    self->_primaryAccountIdentifiersToAccounts);
  return v3;
}

- (id)initForError
{
  FKBankConnectOsloProviderResponse *v2;
  FKBankConnectOsloProviderResponse *v3;
  NSDictionary *primaryAccountIdentifiersToAccounts;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FKBankConnectOsloProviderResponse;
  v2 = -[FKBankConnectOsloProviderResponse init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isErrorResponse = 1;
    primaryAccountIdentifiersToAccounts = v2->_primaryAccountIdentifiersToAccounts;
    v2->_primaryAccountIdentifiersToAccounts = (NSDictionary *)MEMORY[0x24BDBD1B8];

  }
  return v3;
}

- (BOOL)isErrorResponse
{
  return self->_isErrorResponse;
}

- (void)setIsErrorResponse:(BOOL)a3
{
  self->_isErrorResponse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAccountIdentifiersToAccounts, 0);
}

@end
