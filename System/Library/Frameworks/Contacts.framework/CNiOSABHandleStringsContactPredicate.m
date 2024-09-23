@implementation CNiOSABHandleStringsContactPredicate

- (BOOL)cn_supportsEncodedFetching
{
  return 1;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  -[CNHandleStringsContactPredicate handleStrings](self, "handleStrings", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 1282, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNiOSABHandleStringsContactPredicate handlesPredicateWithMap:](self, "handlesPredicateWithMap:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CF5D88], "predicateForNoContacts");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CF5D88], "predicateForNoContacts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

- (id)handlesPredicateWithMap:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (void *)MEMORY[0x1E0D13A70];
  v5 = a3;
  -[CNHandleStringsContactPredicate handleStrings](self, "handleStrings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "classificationOfHandleStrings:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "emailAddresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "phoneNumbers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unknown");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_cn_each:", &__block_literal_global_5_1);

  v11 = (void *)MEMORY[0x1E0CF5D88];
  -[CNHandleStringsContactPredicate containerIdentifiers](self, "containerIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateForContactsMatchingPhoneNumbers:emailAddresses:containerIdentifiers:map:", v9, v8, v12, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)cn_supportsNativeSorting
{
  return 0;
}

- (BOOL)cn_supportsNativeBatchFetch
{
  return 0;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v11 = a4;
  -[CNHandleStringsContactPredicate handleStrings](self, "handleStrings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 1282, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
      v15 = 0;
    }
    -[CNiOSABHandleStringsContactPredicate handlesPredicateWithMap:](self, "handlesPredicateWithMap:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "peopleForPredicate:sortOrder:addressBook:", v17, objc_msgSend(v11, "sortOrder"), a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    populateMatchInfoFromMap_block_invoke((uint64_t)v16, v14, v15, v16);
    if (a5)
      *a5 = objc_retainAutorelease(v14);

  }
  else
  {
    if (a7)
    {
      +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 400, 0);
      *a7 = (__CFError *)objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (__CFArray *)v16;
}

+ (id)peopleForPredicate:(id)a3 sortOrder:(unsigned int)a4 addressBook:(void *)a5
{
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    v5 = (void *)ABAddressBookCopyAllPeopleForBufferPredicate();
    v6 = v5;
    if (v5)
      v7 = v5;
    else
      v7 = (id)MEMORY[0x1E0C9AA60];

  }
  else
  {
    v7 = (id)MEMORY[0x1E0C9AA60];
  }
  return v7;
}

@end
