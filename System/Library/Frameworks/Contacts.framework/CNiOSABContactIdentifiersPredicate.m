@implementation CNiOSABContactIdentifiersPredicate

- (BOOL)cn_supportsEncodedFetching
{
  return 1;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[CNContactsWithIdentifiersPredicate identifiers](self, "identifiers", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    -[CNContactsWithIdentifiersPredicate internalIdentifiersForStoreWithIdentifier:](self, "internalIdentifiersForStoreWithIdentifier:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      v10 = (void *)MEMORY[0x1E0CF5D88];
      objc_msgSend(v9, "allObjects");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "predicateForContactsWithUUIDs:ignoreUnifiedIdentifiers:", v11, -[CNiOSABContactIdentifiersPredicate ignoreUnifiedIdentifiers](self, "ignoreUnifiedIdentifiers"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    CNSetError(a5, 400, 0);
    v12 = 0;
  }
  return v12;
}

- (BOOL)ignoreUnifiedIdentifiers
{
  return self->_ignoreUnifiedIdentifiers;
}

- (CNiOSABContactIdentifiersPredicate)initWithIdentifiers:(id)a3 ignoreUnifiedIdentifiers:(BOOL)a4
{
  CNiOSABContactIdentifiersPredicate *v5;
  CNiOSABContactIdentifiersPredicate *v6;
  CNiOSABContactIdentifiersPredicate *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNiOSABContactIdentifiersPredicate;
  v5 = -[CNContactsWithIdentifiersPredicate initWithIdentifiers:](&v9, sel_initWithIdentifiers_, a3);
  v6 = v5;
  if (v5)
  {
    v5->_ignoreUnifiedIdentifiers = a4;
    v7 = v5;
  }

  return v6;
}

- (BOOL)cn_supportsNativeSorting
{
  return 0;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __CFArray *v13;

  -[CNContactsWithIdentifiersPredicate identifiers](self, "identifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    -[CNContactsWithIdentifiersPredicate internalIdentifiersForStoreWithIdentifier:](self, "internalIdentifiersForStoreWithIdentifier:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "count")
      || (objc_msgSend(v11, "allObjects"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = (__CFArray *)ABAddressBookCopyPeopleWithUUIDs(),
          v12,
          !v13))
    {
      v13 = CFArrayCreate(0, 0, 0, MEMORY[0x1E0C9B378]);
    }

  }
  else if (a7)
  {
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 400, 0);
    v13 = 0;
    *a7 = (__CFError *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v13;
}

@end
