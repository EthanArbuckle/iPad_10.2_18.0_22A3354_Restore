@implementation CNiOSABEmailAddressContactPredicate

- (BOOL)cn_supportsEncodedFetching
{
  return 1;
}

- (BOOL)_inputsAreValid
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[CNEmailAddressContactPredicate emailAddresses](self, "emailAddresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[CNEmailAddressContactPredicate emailAddresses](self, "emailAddresses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CNiOSABEmailAddressContactPredicate _stringsAreNonEmpty:](self, "_stringsAreNonEmpty:", v4);

  }
  else
  {
    v5 = 0;
  }

  -[CNEmailAddressContactPredicate groupIdentifiers](self, "groupIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    -[CNEmailAddressContactPredicate groupIdentifiers](self, "groupIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CNiOSABEmailAddressContactPredicate _stringsAreNonEmpty:](self, "_stringsAreNonEmpty:", v7);

  }
  else
  {
    v8 = 1;
  }

  return v5 && v8;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  if (-[CNiOSABEmailAddressContactPredicate _inputsAreValid](self, "_inputsAreValid", a3, a4))
  {
    v7 = (void *)MEMORY[0x1E0CF5D88];
    v8 = *MEMORY[0x1E0CF5F98];
    -[CNEmailAddressContactPredicate emailAddresses](self, "emailAddresses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNEmailAddressContactPredicate groupIdentifiers](self, "groupIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateForContactsMatchingMultivalueProperty:values:groupIdentifiers:containerIdentifiers:limitToOneResult:map:", v8, v9, v10, 0, -[CNEmailAddressContactPredicate returnsMultipleResults](self, "returnsMultipleResults") ^ 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    CNSetError(a5, 400, 0);
    v11 = 0;
  }
  return v11;
}

- (BOOL)_stringsAreNonEmpty:(id)a3
{
  id v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__CNiOSABEmailAddressContactPredicate__stringsAreNonEmpty___block_invoke;
  v6[3] = &unk_1E29FBE38;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __59__CNiOSABEmailAddressContactPredicate__stringsAreNonEmpty___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "length");
  if (!result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (BOOL)cn_supportsNativeSorting
{
  return 1;
}

- (BOOL)cn_supportsNativeBatchFetch
{
  return 0;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __CFArray *v15;

  v9 = a4;
  if (-[CNiOSABEmailAddressContactPredicate _inputsAreValid](self, "_inputsAreValid"))
  {
    v10 = (void *)MEMORY[0x1E0CF5D88];
    v11 = *MEMORY[0x1E0CF5F98];
    -[CNEmailAddressContactPredicate emailAddresses](self, "emailAddresses");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNEmailAddressContactPredicate groupIdentifiers](self, "groupIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateForContactsMatchingMultivalueProperty:values:groupIdentifiers:containerIdentifiers:limitToOneResult:map:", v11, v12, v13, 0, -[CNEmailAddressContactPredicate returnsMultipleResults](self, "returnsMultipleResults") ^ 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "sortOrder");
    v15 = (__CFArray *)ABAddressBookCopyAllPeopleForBufferPredicate();

  }
  else if (a7)
  {
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 400, 0);
    v15 = 0;
    *a7 = (__CFError *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
