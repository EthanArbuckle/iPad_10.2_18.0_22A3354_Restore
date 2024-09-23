@implementation CNACAccountProvider

+ (id)providerWithStore:(id)a3
{
  id v3;
  _CNACAccountStoreBasedProvider *v4;

  v3 = a3;
  v4 = -[_CNACAccountStoreBasedProvider initWithAccountStore:]([_CNACAccountStoreBasedProvider alloc], "initWithAccountStore:", v3);

  return v4;
}

+ (id)providerWithAccounts:(id)a3
{
  id v3;
  _CNACAccountStaticProvider *v4;

  v3 = a3;
  v4 = -[_CNACAccountStaticProvider initWithAccounts:]([_CNACAccountStaticProvider alloc], "initWithAccounts:", v3);

  return v4;
}

- (id)allAccountTypes
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)accountsWithAccountType:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)childAccountsForAccount:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)isAccountSyncable:(id)a3
{
  return 0;
}

- (BOOL)isAnyAccountSyncableIgnoringAccount:(id)a3
{
  return 0;
}

@end
