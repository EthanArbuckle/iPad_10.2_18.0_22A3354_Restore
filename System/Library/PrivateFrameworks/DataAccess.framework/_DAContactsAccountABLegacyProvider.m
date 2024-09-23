@implementation _DAContactsAccountABLegacyProvider

- (_DAContactsAccountABLegacyProvider)initWithAddressBook:(void *)a3
{
  _DAContactsAccountABLegacyProvider *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_DAContactsAccountABLegacyProvider;
  v4 = -[_DAContactsAccountABLegacyProvider init](&v6, sel_init);
  if (v4)
    v4->_addressBook = (void *)CFRetain(a3);
  return v4;
}

- (void)dealloc
{
  void *addressBook;
  objc_super v4;

  addressBook = self->_addressBook;
  if (addressBook)
  {
    CFRelease(addressBook);
    self->_addressBook = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_DAContactsAccountABLegacyProvider;
  -[_DAContactsAccountABLegacyProvider dealloc](&v4, sel_dealloc);
}

- (id)fetchedAccountWithExternalIdentifier:(id)a3
{
  id v4;
  const void *v5;
  DAABLegacyAccount *v6;

  v4 = a3;
  -[_DAContactsAccountABLegacyProvider addressBook](self, "addressBook");
  v5 = (const void *)ABAddressBookCopyAccountWithIdentifier();

  if (v5)
    v6 = -[DAABLegacyAccount initWithABAccout:]([DAABLegacyAccount alloc], "initWithABAccout:", CFAutorelease(v5));
  else
    v6 = 0;
  return v6;
}

- (id)accountByCreatingAccountWithExternalIdentifier:(id)a3
{
  id v4;
  DAABLegacyAccount *v5;

  v4 = a3;
  v5 = (DAABLegacyAccount *)ABAccountCreate();
  if (v5)
  {
    ABAccountSetIdentifier();
    ABAddressBookAddRecord(-[_DAContactsAccountABLegacyProvider addressBook](self, "addressBook"), v5, 0);
    -[_DAContactsAccountABLegacyProvider addressBook](self, "addressBook");
    ABAddressBookProcessAddedRecords();
    -[_DAContactsAccountABLegacyProvider addressBook](self, "addressBook");
    ABDatabaseIntegrityCheckWithAddressBook();
    v5 = -[DAABLegacyAccount initWithABAccout:]([DAABLegacyAccount alloc], "initWithABAccout:", CFAutorelease(v5));
  }

  return v5;
}

- (id)allAccounts
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  DAABLegacyAccount *v10;
  DAABLegacyAccount *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[_DAContactsAccountABLegacyProvider addressBook](self, "addressBook");
  v2 = (void *)ABAddressBookCopyArrayOfAllAccounts();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = [DAABLegacyAccount alloc];
        v11 = -[DAABLegacyAccount initWithABAccout:](v10, "initWithABAccout:", v9, (_QWORD)v13);
        objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)accountForContainerWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  DAABLegacyAccount *AccountForSource;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_DAContactsAccountABLegacyProvider addressBook](self, "addressBook");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)ABAddressBookCopySourcesWithUUIDs();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_DAContactsAccountABLegacyProvider addressBook](self, "addressBook");
    AccountForSource = (DAABLegacyAccount *)ABAddressBookGetAccountForSource();
    if (AccountForSource)
      AccountForSource = -[DAABLegacyAccount initWithABAccout:]([DAABLegacyAccount alloc], "initWithABAccout:", AccountForSource);
  }
  else
  {
    AccountForSource = 0;
  }

  return AccountForSource;
}

- (void)addressBook
{
  return self->_addressBook;
}

@end
