@implementation DAContactsAccountProvider

+ (id)providerWithContactStore:(id)a3
{
  id v3;
  _DAContactsAccountContactsProvider *v4;

  v3 = a3;
  v4 = -[_DAContactsAccountContactsProvider initWithContactStore:]([_DAContactsAccountContactsProvider alloc], "initWithContactStore:", v3);

  return v4;
}

+ (id)providerWithAddressBook:(void *)a3
{
  return -[_DAContactsAccountABLegacyProvider initWithAddressBook:]([_DAContactsAccountABLegacyProvider alloc], "initWithAddressBook:", a3);
}

- (id)fetchedAccountWithExternalIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("fetchedAccountWithExternalIdentifier: is abstract"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (id)accountByCreatingAccountWithExternalIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("accountByCreatingAccountWithExternalIdentifier: is abstract"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (id)allAccounts
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("allAccounts: is abstract"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)accountForContainerWithIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("accountForContainerWithIdentifier: is abstract"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

@end
