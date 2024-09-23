@implementation CNiOSABFullTextSearchContactPredicate

- (CNiOSABFullTextSearchContactPredicate)initWithSearchString:(id)a3 containerIdentifiers:(id)a4 groupIdentifiers:(id)a5
{
  CNiOSABFullTextSearchContactPredicate *v5;
  CNiOSABFullTextSearchContactPredicate *v6;
  CNiOSABFullTextSearchContactPredicate *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNiOSABFullTextSearchContactPredicate;
  v5 = -[CNFullTextSearchContactPredicate initWithSearchString:containerIdentifiers:groupIdentifiers:](&v9, sel_initWithSearchString_containerIdentifiers_groupIdentifiers_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[CNPredicate setAugmentMainStoreResults:](v5, "setAugmentMainStoreResults:", 0);
    v7 = v6;
  }

  return v6;
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
  return 0;
}

- (id)_predicatesWithAddressBook:(void *)a3 environment:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v38 = a4;
  -[CNFullTextSearchContactPredicate groupIdentifiers](self, "groupIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v8 = 0;
LABEL_5:
    -[CNFullTextSearchContactPredicate containerIdentifiers](self, "containerIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[CNFullTextSearchContactPredicate containerIdentifiers](self, "containerIdentifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)ABAddressBookCopySourcesWithUUIDs();

      if (!v12)
      {
        v9 = 0;
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {
      v12 = 0;
    }
    v36 = v12;
    objc_msgSend(v12, "_cn_partition:", &__block_literal_global_29);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v8;
    objc_msgSend(v8, "_cn_partition:", &__block_literal_global_1_1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "second");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "second");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v13;
    objc_msgSend(v13, "first");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v14;
    objc_msgSend(v14, "first");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_cn_map:", &__block_literal_global_3_4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v40 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v38, "abPredicateRunner");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNFullTextSearchContactPredicate searchString](self, "searchString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "personPredicateWithNameLike:inSource:addressBook:", v26, v24, a3);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "_cn_addNonNilObject:", v27);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v21);
    }

    if (!objc_msgSend(v19, "count") || objc_msgSend(v33, "count") || objc_msgSend(v32, "count"))
    {
      objc_msgSend(v38, "abPredicateRunner");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFullTextSearchContactPredicate searchString](self, "searchString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "personPredicateWithNameLike:inGroups:sources:addressBook:", v29, v32, v33, a3);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_cn_addNonNilObject:", v30);

    }
    v8 = v37;
    goto LABEL_21;
  }
  -[CNFullTextSearchContactPredicate groupIdentifiers](self, "groupIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)ABAddressBookCopyGroupsWithUUIDs();

  if (v8)
    goto LABEL_5;
  v9 = 0;
LABEL_22:

  return v9;
}

uint64_t __80__CNiOSABFullTextSearchContactPredicate__predicatesWithAddressBook_environment___block_invoke()
{
  return ABSourceIsRemote();
}

uint64_t __80__CNiOSABFullTextSearchContactPredicate__predicatesWithAddressBook_environment___block_invoke_2(int a1, ABRecordRef group)
{
  ABRecordRef v2;
  uint64_t IsRemote;

  v2 = ABGroupCopySource(group);
  IsRemote = ABSourceIsRemote();
  if (v2)
    CFRelease(v2);
  return IsRemote;
}

ABRecordRef __80__CNiOSABFullTextSearchContactPredicate__predicatesWithAddressBook_environment___block_invoke_3(int a1, ABRecordRef group)
{
  return (id)ABGroupCopySource(group);
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
  -[CNiOSABFullTextSearchContactPredicate cn_copyPeopleInAddressBook:fetchRequest:matchInfos:environment:nserror:](self, "cn_copyPeopleInAddressBook:fetchRequest:matchInfos:environment:nserror:", a3, a4, a5, a6, &v15);
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

  v12 = a4;
  v13 = a6;
  v14 = *MEMORY[0x1E0D13848];
  -[CNFullTextSearchContactPredicate searchString](self, "searchString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = (*(uint64_t (**)(uint64_t, void *))(v14 + 16))(v14, v15);

  if ((_DWORD)v14)
  {
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 400, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = 0;
    if (a7)
      *a7 = objc_retainAutorelease(v16);
  }
  else
  {
    -[CNiOSABFullTextSearchContactPredicate _predicatesWithAddressBook:environment:](self, "_predicatesWithAddressBook:environment:", a3, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count"))
    {
      +[CNiOSFetchExecution contactsMatchingPredicates:sortOrdering:matchInfos:options:addressBook:environment:error:](CNiOSFetchExecution, "contactsMatchingPredicates:sortOrdering:matchInfos:options:addressBook:environment:error:", v17, objc_msgSend(v12, "sortOrder"), a5, objc_msgSend(v12, "options"), a3, v13, a7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a5)
        *a5 = 0;
      v18 = (void *)MEMORY[0x1E0C9AA60];
    }
  }

  return v18;
}

- (id)cn_fetchPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 progressiveResults:(id)a5 completion:(id)a6 environment:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, _QWORD);
  id v15;
  void *v16;
  void *v17;

  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, _QWORD))a6;
  v15 = a7;
  -[CNiOSABFullTextSearchContactPredicate _predicatesWithAddressBook:environment:](self, "_predicatesWithAddressBook:environment:", a3, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count"))
  {
    +[CNiOSFetchExecution contactsMatchingPredicates:sortOrdering:options:addressBook:progressiveResults:completion:environment:](CNiOSFetchExecution, "contactsMatchingPredicates:sortOrdering:options:addressBook:progressiveResults:completion:environment:", v16, objc_msgSend(v12, "sortOrder"), objc_msgSend(v12, "options"), a3, v13, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v14)
      v14[2](v14, 0);
    v17 = 0;
  }

  return v17;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  return 0;
}

@end
