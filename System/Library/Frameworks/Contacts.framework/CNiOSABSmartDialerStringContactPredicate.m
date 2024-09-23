@implementation CNiOSABSmartDialerStringContactPredicate

- (CNiOSABSmartDialerStringContactPredicate)initWithString:(id)a3
{
  id v4;
  CNiOSABSmartDialerStringContactPredicate *v5;
  uint64_t v6;
  NSString *smartDialerString;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNiOSABSmartDialerStringContactPredicate;
  v5 = -[CNPredicate init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    smartDialerString = v5->_smartDialerString;
    v5->_smartDialerString = (NSString *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABSmartDialerStringContactPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABSmartDialerStringContactPredicate *v5;
  void *v6;
  uint64_t v7;
  NSString *smartDialerString;
  CNiOSABSmartDialerStringContactPredicate *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABSmartDialerStringContactPredicate;
  v5 = -[CNPredicate initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_smartDialerString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    smartDialerString = v5->_smartDialerString;
    v5->_smartDialerString = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABSmartDialerStringContactPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_smartDialerString, CFSTR("_smartDialerString"), v5.receiver, v5.super_class);

}

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

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v15;

  v15 = 0;
  -[CNiOSABSmartDialerStringContactPredicate cn_copyPeopleInAddressBook:fetchRequest:matchInfos:environment:nserror:](self, "cn_copyPeopleInAddressBook:fetchRequest:matchInfos:environment:nserror:", a3, a4, a5, a6, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  v10 = v9;
  if (v8)
  {
    v11 = v8;
  }
  else if (a7)
  {
    v12 = objc_msgSend(v9, "code");
    objc_msgSend(v10, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", v12, v13);
    *a7 = (__CFError *)objc_claimAutoreleasedReturnValue();

  }
  return (__CFArray *)v8;
}

- (id)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 nserror:(id *)a7
{
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a6;
  v14 = *MEMORY[0x1E0D13848];
  -[CNiOSABSmartDialerStringContactPredicate smartDialerString](self, "smartDialerString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = (*(uint64_t (**)(uint64_t, void *))(v14 + 16))(v14, v15);

  if ((_DWORD)v14)
  {
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 400, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a7)
      *a7 = objc_retainAutorelease(v16);

    v18 = 0;
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CF5D80];
    -[CNiOSABSmartDialerStringContactPredicate smartDialerString](self, "smartDialerString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "personPredicateWithSmartDialerStringLike:addressBook:", v20, a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v24[0] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
    +[CNiOSFetchExecution contactsMatchingPredicates:sortOrdering:matchInfos:options:addressBook:environment:error:](CNiOSFetchExecution, "contactsMatchingPredicates:sortOrdering:matchInfos:options:addressBook:environment:error:", v22, objc_msgSend(v12, "sortOrder"), a5, objc_msgSend(v12, "options"), a3, v13, a7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)

  }
  return v18;
}

- (id)cn_fetchPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 progressiveResults:(id)a5 completion:(id)a6 environment:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = *MEMORY[0x1E0D13848];
  -[CNiOSABSmartDialerStringContactPredicate smartDialerString](self, "smartDialerString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = (*(uint64_t (**)(uint64_t, void *))(v16 + 16))(v16, v17);

  if ((v16 & 1) != 0)
  {
    v18 = 0;
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CF5D80];
    -[CNiOSABSmartDialerStringContactPredicate smartDialerString](self, "smartDialerString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "personPredicateWithSmartDialerStringLike:addressBook:", v20, a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v24[0] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
    +[CNiOSFetchExecution contactsMatchingPredicates:sortOrdering:options:addressBook:progressiveResults:completion:environment:](CNiOSFetchExecution, "contactsMatchingPredicates:sortOrdering:options:addressBook:progressiveResults:completion:environment:", v22, objc_msgSend(v12, "sortOrder"), objc_msgSend(v12, "options"), a3, v13, v14, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)

  }
  return v18;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  uint64_t v7;
  void *v8;
  uint64_t WordTokenizer;
  uint64_t SearchCollator;
  void *v11;
  void *v12;
  void *v13;

  v7 = *MEMORY[0x1E0D13848];
  -[CNiOSABSmartDialerStringContactPredicate smartDialerString](self, "smartDialerString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  if ((_DWORD)v7)
  {
    CNSetError(a5, 400, 0);
LABEL_5:
    v13 = 0;
    return v13;
  }
  if (!ABCFTSIsEnabled())
    goto LABEL_5;
  WordTokenizer = ABAddressBookGetWordTokenizer();
  SearchCollator = ABAddressBookGetSearchCollator();
  v11 = (void *)MEMORY[0x1E0CF5D88];
  -[CNiOSABSmartDialerStringContactPredicate smartDialerString](self, "smartDialerString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateForContactsMatchingSmartDialerString:tokenizer:collator:", v12, WordTokenizer, SearchCollator);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForContactsMatchingSmartDialerString:]"));
  -[CNiOSABSmartDialerStringContactPredicate smartDialerString](self, "smartDialerString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("smartDialerString"), v5);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A40];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__CNiOSABSmartDialerStringContactPredicate_isEqual___block_invoke;
  v8[3] = &unk_1E29F7D70;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v6, self, v8, 0);

  return (char)self;
}

uint64_t __52__CNiOSABSmartDialerStringContactPredicate_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "smartDialerString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "smartDialerString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

- (unint64_t)hash
{
  _QWORD v3[5];

  v3[1] = 3221225472;
  v3[2] = __48__CNiOSABSmartDialerStringContactPredicate_hash__block_invoke;
  v3[3] = &unk_1E29F7D98;
  v3[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  return objc_msgSend(MEMORY[0x1E0D13A78], "hashWithBlocks:", v3, 0);
}

uint64_t __48__CNiOSABSmartDialerStringContactPredicate_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "smartDialerString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

- (NSString)smartDialerString
{
  return self->_smartDialerString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartDialerString, 0);
}

@end
