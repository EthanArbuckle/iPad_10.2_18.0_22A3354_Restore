@implementation CNiOSABContactWithNamePredicate

- (BOOL)cn_supportsNativeSorting
{
  return 0;
}

- (BOOL)cn_supportsNativeBatchFetch
{
  return 0;
}

- (BOOL)cn_supportsEncodedFetching
{
  return 1;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  uint64_t v10;
  void *v11;
  __CFArray *v12;
  __CFString *v13;

  v10 = *MEMORY[0x1E0D13848];
  -[CNContactWithNamePredicate name](self, "name", a3, a4, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = (*(uint64_t (**)(uint64_t, void *))(v10 + 16))(v10, v11);

  if ((_DWORD)v10)
  {
    if (a7)
    {
      +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 400, 0);
      v12 = 0;
      *a7 = (__CFError *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    -[CNContactWithNamePredicate name](self, "name");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v12 = ABAddressBookCopyPeopleWithName(a3, v13);

    if (!v12)
      return CFArrayCreate(0, 0, 0, MEMORY[0x1E0C9B378]);
  }
  return v12;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t WordTokenizer;
  uint64_t SearchCollator;
  void *v13;
  void *v14;
  void *v15;

  v8 = *MEMORY[0x1E0D13848];
  -[CNContactWithNamePredicate name](self, "name", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = (*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  if ((_DWORD)v8)
  {
    CNSetError(a5, 400, 0);
    v10 = 0;
  }
  else
  {
    if (ABCFTSIsEnabled())
    {
      WordTokenizer = ABAddressBookGetWordTokenizer();
      SearchCollator = ABAddressBookGetSearchCollator();
      v13 = (void *)MEMORY[0x1E0CF5D88];
      -[CNContactWithNamePredicate name](self, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "predicateForContactsMatchingText:tokenizer:collator:matchNameFieldsOnly:", v14, WordTokenizer, SearchCollator, 1);
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0CF5D88];
      -[CNContactWithNamePredicate name](self, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "predicateForContactsMatchingName:addressBook:", v14, a3);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

@end
