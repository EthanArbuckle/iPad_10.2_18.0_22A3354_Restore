@implementation CNiOSABSocialProfileContactPredicate

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
  return 0;
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
  -[CNiOSABSocialProfileContactPredicate cn_copyPeopleInAddressBook:fetchRequest:matchInfos:environment:nserror:](self, "cn_copyPeopleInAddressBook:fetchRequest:matchInfos:environment:nserror:", a3, a4, a5, a6, &v15);
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
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a6;
  if (a5)
    *a5 = 0;
  +[CN socialProfilesDescription](CN, "socialProfilesDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSocialProfileContactPredicate socialProfile](self, "socialProfile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend((id)objc_msgSend(v13, "ABMultiValueValueFromCNLabeledValueValue:", v14), "mutableCopy");

  v16 = *MEMORY[0x1E0CF5F80];
  objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0CF5F80]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count"))
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v17, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%%%@%%"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setObject:forKey:", v20, v16);
  }
  else if (v17)
  {
    objc_msgSend(v15, "removeObjectForKey:", v16);
  }
  objc_msgSend(MEMORY[0x1E0CF5D80], "personPredicateWithValue:comparison:forProperty:", v15, 0, *MEMORY[0x1E0CF6208]);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v21)
  {
    v33[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = a5;
    v25 = v13;
    v26 = v12;
    v27 = objc_msgSend(v11, "sortOrder");
    v28 = objc_msgSend(v11, "options");
    v29 = v27;
    v12 = v26;
    v13 = v25;
    +[CNiOSFetchExecution contactsMatchingPredicates:sortOrdering:matchInfos:options:addressBook:environment:error:](CNiOSFetchExecution, "contactsMatchingPredicates:sortOrdering:matchInfos:options:addressBook:environment:error:", v23, v29, v24, v28, a3, v12, a7);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    CNSetError(a7, 400, 0);
    v30 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v30;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  return 0;
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
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForContactsMatchingSocialProfile:]"));
  -[CNSocialProfileContactPredicate socialProfile](self, "socialProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("socialProfile"), v5);

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
  v8[2] = __48__CNiOSABSocialProfileContactPredicate_isEqual___block_invoke;
  v8[3] = &unk_1E29F7D70;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v6, self, v8, 0);

  return (char)self;
}

uint64_t __48__CNiOSABSocialProfileContactPredicate_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "socialProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "socialProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

@end
