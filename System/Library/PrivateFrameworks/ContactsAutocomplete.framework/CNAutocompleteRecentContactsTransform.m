@implementation CNAutocompleteRecentContactsTransform

+ (id)transformForRequest:(id)a3 library:(id)a4
{
  id v6;
  id v7;
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

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "priorityDomainForSorting");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendingAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAutocompleteResultFactory factoryWithPriorityDomain:sendingAddress:](CNAutocompleteResultFactory, "factoryWithPriorityDomain:sendingAddress:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNAutocompleteResultFactory factoryWithPriorityDomain:sendingAddress:](CNAutocompleteResultFactory, "factoryWithPriorityDomain:sendingAddress:", 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v7, "fetchContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "otherAddressesAlreadyChosen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_cn_map:", CNAutocompleteResultAddressStringForHashingTransform);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "searchString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "resultTransformWithFactory:membersFactory:chosenAddressHashes:searchString:library:", v10, v11, v16, v17, v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)resultTransformWithFactory:(id)a3 membersFactory:(id)a4 chosenAddressHashes:(id)a5 searchString:(id)a6 library:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __124__CNAutocompleteRecentContactsTransform_resultTransformWithFactory_membersFactory_chosenAddressHashes_searchString_library___block_invoke;
  v28 = &unk_1E70DF5F0;
  v29 = v12;
  v30 = v13;
  v31 = v14;
  v32 = v15;
  v33 = v16;
  v34 = a1;
  v17 = v16;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  v22 = _Block_copy(&v25);
  v23 = (void *)objc_msgSend(v22, "copy", v25, v26, v27, v28);

  return v23;
}

uint64_t __124__CNAutocompleteRecentContactsTransform_resultTransformWithFactory_membersFactory_chosenAddressHashes_searchString_library___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 72), "autocompleteResultForRecent:factory:membersFactory:chosenAddressHashes:searchString:library:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

+ (id)autocompleteResultForRecent:(id)a3 factory:(id)a4 membersFactory:(id)a5 chosenAddressHashes:(id)a6 searchString:(id)a7 library:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v27[4];
  id v28;
  id v29;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a4;
  objc_msgSend(v14, "kind");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqual:", *MEMORY[0x1E0D18210]);

  if (v21)
    objc_msgSend(a1, "groupAutocompleteResultForRecent:factory:membersFactory:chosenAddressHashes:searchString:", v14, v19, v15, v16, v17);
  else
    objc_msgSend(a1, "contactAutocompleteResultForRecent:factory:completesChosenGroup:", v14, v19, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v14, "contactID"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setRecentsIdentifier:", v23);

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __133__CNAutocompleteRecentContactsTransform_autocompleteResultForRecent_factory_membersFactory_chosenAddressHashes_searchString_library___block_invoke;
  v27[3] = &unk_1E70DF618;
  v28 = v18;
  v29 = v14;
  v24 = v14;
  v25 = v18;
  objc_msgSend(v22, "setIgnoreResultBlock:", v27);

  return v22;
}

uint64_t __133__CNAutocompleteRecentContactsTransform_autocompleteResultForRecent_factory_membersFactory_chosenAddressHashes_searchString_library___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v16[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v6 = objc_msgSend(v4, "removeRecentContacts:error:", v5, &v11);
  v7 = v11;

  if ((v6 & 1) == 0)
  {
    CNALoggingContextDebug();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1B9950000, v8, OS_LOG_TYPE_DEFAULT, "Can't ignore recent: %@, with error: %@", buf, 0x16u);
    }

    if (a2)
      *a2 = objc_retainAutorelease(v7);
  }

  return v6;
}

+ (id)groupAutocompleteResultForRecent:(id)a3 factory:(id)a4 membersFactory:(id)a5 chosenAddressHashes:(id)a6 searchString:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  BOOL v33;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v12, "displayName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v12, "countOfRecents");
  objc_msgSend(v12, "mostRecentDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "count"))
    goto LABEL_12;
  v37 = a1;
  v38 = v13;
  v39 = v16;
  objc_msgSend(v12, "members");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_cn_filter:", &__block_literal_global_16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_cn_indexBy:", &__block_literal_global_7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v22, "allKeys");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setWithArray:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "isSubsetOfSet:", v25))
  {
    objc_msgSend(v25, "minusSet:", v15);
    if (objc_msgSend(v25, "count") != 1)
    {
LABEL_11:

      v13 = v38;
      v16 = v39;
      a1 = v37;
LABEL_12:
      LOBYTE(v35) = 0;
      objc_msgSend(v13, "recentResultWithDisplayName:value:lastSendingAddress:dateCount:date:group:completesChosenGroup:", v17, 0, 0, v18, v19, 1, v35);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __130__CNAutocompleteRecentContactsTransform_groupAutocompleteResultForRecent_factory_membersFactory_chosenAddressHashes_searchString___block_invoke_13;
      v40[3] = &unk_1E70DF6C8;
      v41 = v12;
      v43 = a1;
      v42 = v14;
      objc_msgSend(v32, "setMembersProvider:", v40);

      goto LABEL_13;
    }
    objc_msgSend(v25, "anyObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = v27;
    objc_msgSend(v27, "kind");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isEqual:", *MEMORY[0x1E0D18210]);
    if ((v30 & 1) != 0)
    {

      v31 = v28;
LABEL_10:

      goto LABEL_11;
    }
    v36 = v28;
    v33 = _block_invoke(v30, v28, v39);

    v31 = v36;
    if (!v33)
      goto LABEL_10;
    v13 = v38;
    objc_msgSend(v37, "contactAutocompleteResultForRecent:factory:completesChosenGroup:", v36, v38, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v32 = 0;
    v13 = v38;
  }

  v16 = v39;
LABEL_13:

  return v32;
}

BOOL __130__CNAutocompleteRecentContactsTransform_groupAutocompleteResultForRecent_factory_membersFactory_chosenAddressHashes_searchString___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

id __130__CNAutocompleteRecentContactsTransform_groupAutocompleteResultForRecent_factory_membersFactory_chosenAddressHashes_searchString___block_invoke_2(uint64_t a1, void *a2)
{
  void (**v2)(uint64_t, void *);
  void *v3;
  void *v4;

  v2 = (void (**)(uint64_t, void *))CNAutocompleteResultAddressStringForHashingTransform;
  objc_msgSend(a2, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2]((uint64_t)v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __130__CNAutocompleteRecentContactsTransform_groupAutocompleteResultForRecent_factory_membersFactory_chosenAddressHashes_searchString___block_invoke_13(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  __int128 v7;
  _QWORD v8[4];
  __int128 v9;

  objc_msgSend(*(id *)(a1 + 32), "members");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_filter:", &__block_literal_global_14_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __130__CNAutocompleteRecentContactsTransform_groupAutocompleteResultForRecent_factory_membersFactory_chosenAddressHashes_searchString___block_invoke_15;
  v8[3] = &unk_1E70DF6A0;
  v7 = *(_OWORD *)(a1 + 40);
  v4 = (id)v7;
  v9 = v7;
  objc_msgSend(v3, "_cn_map:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    v5 = (void *)MEMORY[0x1E0C9AA60];

  return v5;
}

uint64_t __130__CNAutocompleteRecentContactsTransform_groupAutocompleteResultForRecent_factory_membersFactory_chosenAddressHashes_searchString___block_invoke_15(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "contactAutocompleteResultForRecent:factory:completesChosenGroup:", a2, *(_QWORD *)(a1 + 32), 0);
}

+ (id)contactAutocompleteResultForRecent:(id)a3 factory:(id)a4 completesChosenGroup:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  CNAutocompleteResultValue *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "countOfRecents");
  objc_msgSend(v8, "mostRecentDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastSendingAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(CNAutocompleteResultValue);
  objc_msgSend(v8, "address");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteResultValue setAddress:](v13, "setAddress:", v14);

  v15 = objc_msgSend((id)objc_opt_class(), "addressTypeForRecentContact:", v8);
  -[CNAutocompleteResultValue setAddressType:](v13, "setAddressType:", v15);
  LOBYTE(v18) = a5;
  objc_msgSend(v7, "recentResultWithDisplayName:value:lastSendingAddress:dateCount:date:group:completesChosenGroup:", v9, v13, v12, v10, v11, 0, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (int64_t)addressTypeForRecentContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)*MEMORY[0x1E0D18208];
  objc_msgSend(v3, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "isEqual:", v5);

  if ((v4 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v7 = (void *)*MEMORY[0x1E0D18228];
    objc_msgSend(v3, "kind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend(v7, "isEqual:", v8);

    if ((v7 & 1) != 0)
    {
      v6 = 2;
    }
    else
    {
      v9 = (void *)*MEMORY[0x1E0D18218];
      objc_msgSend(v3, "kind");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v9) = objc_msgSend(v9, "isEqual:", v10);

      if ((v9 & 1) != 0)
      {
        v6 = 3;
      }
      else
      {
        CNALoggingContextDebug();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v13 = 138412290;
          v14 = v3;
          _os_log_impl(&dword_1B9950000, v11, OS_LOG_TYPE_DEFAULT, "Unknown address type for recent contact: %@ ", (uint8_t *)&v13, 0xCu);
        }

        v6 = 0;
      }
    }
  }

  return v6;
}

- (NSString)priorityDomainForSorting
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPriorityDomainForSorting:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)sendingAddress
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSendingAddress:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSArray)otherAddressesAlreadyChosen
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOtherAddressesAlreadyChosen:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)searchString
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSearchString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (CRRecentContactsLibrary)library
{
  return (CRRecentContactsLibrary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLibrary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_otherAddressesAlreadyChosen, 0);
  objc_storeStrong((id *)&self->_sendingAddress, 0);
  objc_storeStrong((id *)&self->_priorityDomainForSorting, 0);
}

@end
