@implementation CNiOSABExternalUUIDContactPredicate

- (BOOL)cn_supportsNativeSorting
{
  return 1;
}

- (BOOL)cn_supportsNativeBatchFetch
{
  return 0;
}

- (BOOL)cn_supportsEncodedFetching
{
  return 1;
}

- (BOOL)_inputsAreValid
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;

  -[CNExternalUUIDContactPredicate externalUUIDs](self, "externalUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  -[CNExternalUUIDContactPredicate externalUUIDs](self, "externalUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_cn_all:", &__block_literal_global_147);

  return v6;
}

_QWORD *__54__CNiOSABExternalUUIDContactPredicate__inputsAreValid__block_invoke()
{
  return (*(_QWORD *(**)(_QWORD *__return_ptr))(*MEMORY[0x1E0D13850] + 16))(MEMORY[0x1E0D13850]);
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  __CFArray *v13;

  v9 = a4;
  if (-[CNiOSABExternalUUIDContactPredicate _inputsAreValid](self, "_inputsAreValid"))
  {
    v10 = (void *)MEMORY[0x1E0CF5D88];
    -[CNExternalUUIDContactPredicate externalUUIDs](self, "externalUUIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateForContactsWithExternalUUIDs:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "sortOrder");
    v13 = (__CFArray *)ABAddressBookCopyAllPeopleForBufferPredicate();

  }
  else if (a7)
  {
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 400, 0);
    v13 = 0;
    *a7 = (__CFError *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  void *v9;

  if (-[CNiOSABExternalUUIDContactPredicate _inputsAreValid](self, "_inputsAreValid", a3, a4))
  {
    v7 = (void *)MEMORY[0x1E0CF5D88];
    -[CNExternalUUIDContactPredicate externalUUIDs](self, "externalUUIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateForContactsWithExternalUUIDs:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    CNSetError(a5, 400, 0);
    v9 = 0;
  }
  return v9;
}

@end
