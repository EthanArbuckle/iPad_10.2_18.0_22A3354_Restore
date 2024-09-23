@implementation MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep

void ___ef_log_MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep");
  v1 = (void *)_ef_log_MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep_log;
  _ef_log_MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep_log = (uint64_t)v0;

}

+ (BOOL)runWithConnection:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  char v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  id v18;

  v6 = a3;
  if ((objc_msgSend(a1, "_deleteExistingBusinessesWithConnection:error:", v6, a4) & 1) != 0)
  {
    v18 = 0;
    objc_msgSend(a1, "_getGroupableAndUngroupableAddresses:connection:error:", &v18, v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v18;
    if (v7)
    {
      objc_msgSend(a1, "_groupAddresses:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __87__MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep_runWithConnection_error___block_invoke;
      v16 = &unk_1E4E8D078;
      v10 = v9;
      v17 = v10;
      objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &v13);
      v11 = objc_msgSend(a1, "_persistBusinesses:connection:error:", v10, v6, a4, v13, v14, v15, v16);
      if ((v11 & 1) != 0)
        objc_msgSend(a1, "_resetGroupingDefault");

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __87__MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep_runWithConnection_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  v5 = a3;
  objc_msgSend(v5, "emailAddressValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "simpleAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v5, "stringValue");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  v11 = (void *)MEMORY[0x1E0D1EF38];
  objc_msgSend(v10, "lowercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pairWithFirst:second:", v12, &stru_1E4F1C8F8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v15 = objc_msgSend(v14, "mutableCopy");

      v14 = (id)v15;
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v15, v13);
    }
  }
  else
  {
    v14 = objc_alloc_init(MEMORY[0x1E0D1EF08]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
  }
  objc_msgSend(v14, "addIndex:", objc_msgSend(v16, "longLongValue"));

}

+ (BOOL)_deleteExistingBusinessesWithConnection:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFE0]), "initWithTable:", CFSTR("businesses"));
  if ((objc_msgSend(v5, "executeDeleteStatement:error:", v6, a4) & 1) != 0)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFE0]), "initWithTable:", CFSTR("business_categories"));
    v8 = objc_msgSend(v5, "executeDeleteStatement:error:", v7, a4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_getGroupableAndUngroupableAddresses:(id *)a3 connection:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("ROWID"), CFSTR("addresses"));
  objc_msgSend(v11, "addResultColumn:", CFSTR("address"));
  objc_msgSend(v11, "addResultColumn:", CFSTR("comment"));
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __117__MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep__getGroupableAndUngroupableAddresses_connection_error___block_invoke;
  v16[3] = &unk_1E4E8AED8;
  v12 = v10;
  v17 = v12;
  v19 = a1;
  v13 = v9;
  v18 = v13;
  if ((objc_msgSend(v8, "executeSelectStatement:withBlock:error:", v11, v16, a5) & 1) != 0)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v12);
    v14 = v13;
  }
  else
  {
    v14 = 0;
    if (a3)
      *a3 = 0;
  }

  return v14;
}

void __117__MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep__getGroupableAndUngroupableAddresses_connection_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "objectAtIndexedSubscript:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6C0]), "initWithString:", v7);
  objc_msgSend(v10, "setDisplayName:", v9);
  objc_msgSend(v10, "emailAddressValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "simpleAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v11, "highLevelDomain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(*(id *)(a1 + 48), "_shouldUseSimpleAddressForHighLevelDomain:displayName:", v13, v9);
    v15 = 40;
    if (v14)
      v15 = 32;
    objc_msgSend(*(id *)(a1 + v15), "setObject:forKeyedSubscript:", v11, v5);
  }
  else
  {
    objc_msgSend(v11, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v13;
    if (!v13)
    {
      objc_msgSend(v10, "stringValue");
      v17 = objc_claimAutoreleasedReturnValue();
      v2 = (void *)v17;
      if (v17)
        v16 = (void *)v17;
      else
        v16 = v7;
    }
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v16, v5);
    if (!v13)

  }
}

+ (BOOL)_shouldUseSimpleAddressForHighLevelDomain:(id)a3 displayName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length")
    && (objc_msgSend(v7, "ef_stringByTrimmingWhitespaceAndNewlineCharacters"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "length"),
        v8,
        v9))
  {
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_commonDomains");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "containsObject:", v12);

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

+ (id)_commonDomains
{
  if (_commonDomains_onceToken != -1)
    dispatch_once(&_commonDomains_onceToken, &__block_literal_global_31_0);
  return (id)_commonDomains_sCommonDomains;
}

void __77__MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep__commonDomains__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E4F69478);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_commonDomains_sCommonDomains;
  _commonDomains_sCommonDomains = v0;

}

+ (id)_groupAddresses:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep__groupAddresses___block_invoke;
  v11[3] = &unk_1E4E8D078;
  v6 = v4;
  v12 = v6;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v11);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __79__MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep__groupAddresses___block_invoke_2;
  v9[3] = &unk_1E4E8D0E8;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);

  return v7;
}

void __79__MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep__groupAddresses___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(v5, "emailAddressValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "highLevelDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
  }
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, v10);

}

void __79__MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep__groupAddresses___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _MFDisplayNameGroupingTrie *v7;
  uint64_t v8;
  _MFDisplayNameGroupingTrie *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  _MFDisplayNameGroupingTrie *v18;

  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(_MFDisplayNameGroupingTrie);
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __79__MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep__groupAddresses___block_invoke_3;
  v17[3] = &unk_1E4E8D078;
  v9 = v7;
  v18 = v9;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v17);
  -[_MFDisplayNameGroupingTrie findGroups](v9, "findGroups");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __79__MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep__groupAddresses___block_invoke_4;
  v13[3] = &unk_1E4E8D0C0;
  v11 = v6;
  v14 = v11;
  v12 = v5;
  v15 = v12;
  v16 = *(id *)(a1 + 32);
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v13);

}

void __79__MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep__groupAddresses___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(a3, "emailAddressValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertDisplayName:addressID:", v7, objc_msgSend(v8, "longLongValue"));

}

void __79__MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep__groupAddresses___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emailAddressValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayName");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = &stru_1E4F1C8F8;
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0D1EF38], "pairWithFirst:second:", *(_QWORD *)(a1 + 40), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v12, v11);

}

+ (BOOL)_persistBusinesses:(id)a3 connection:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id *v19;
  char v20;
  BOOL v21;
  id obj;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD *v27;
  uint64_t *v28;
  uint64_t *v29;
  BOOL v30;
  _QWORD v31[4];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  _BYTE v42[24];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "_existingBusinessAddressesForConnection:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = objc_msgSend(v10, "count") != 0;
    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v41 = 1;
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__15;
    v36 = __Block_byref_object_dispose__15;
    v37 = 0;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v31[3] = 1;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __99__MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep__persistBusinesses_connection_error___block_invoke;
    v24[3] = &unk_1E4E8D138;
    v27 = v31;
    v28 = &v38;
    v13 = v9;
    v25 = v13;
    v29 = &v32;
    v30 = v12;
    v14 = v11;
    v26 = v14;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v24);
    if (*((_BYTE *)v39 + 24) && objc_msgSend(v14, "count"))
    {
      _ef_log_MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep();
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep _persistBusinesses:connection:error:].cold.1((uint64_t)v42, objc_msgSend(v14, "count"), v15);

      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFE0]), "initWithTable:", CFSTR("business_addresses"));
      objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("address"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "in:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setWhere:", v18);

      v19 = (id *)(v33 + 5);
      obj = (id)v33[5];
      v20 = objc_msgSend(v13, "executeDeleteStatement:error:", v16, &obj);
      objc_storeStrong(v19, obj);
      *((_BYTE *)v39 + 24) = v20;

    }
    if (a5)
      *a5 = objc_retainAutorelease((id)v33[5]);
    v21 = *((_BYTE *)v39 + 24) != 0;

    _Block_object_dispose(v31, 8);
    _Block_object_dispose(&v32, 8);

    _Block_object_dispose(&v38, 8);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

void __99__MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep__persistBusinesses_connection_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  char v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  id v31;
  id obj;

  v7 = a2;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:", CFSTR("businesses"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("ROWID"));

  objc_msgSend(v7, "first");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("domain"));

  objc_msgSend(v7, "second");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("address_comment"));

  v13 = *(void **)(a1 + 32);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v14 + 40);
  v15 = objc_msgSend(v13, "executeInsertStatement:error:", v9, &obj);
  objc_storeStrong((id *)(v14 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v15;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    goto LABEL_7;
  if (*(_BYTE *)(a1 + 72))
  {
    v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F058]), "initWithTable:", CFSTR("business_addresses"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("business"));

    objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("address"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "in:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWhereClause:", v19);

    v20 = *(void **)(a1 + 32);
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v31 = *(id *)(v21 + 40);
    LOBYTE(v19) = objc_msgSend(v20, "executeUpdateStatement:error:", v16, &v31);
    objc_storeStrong((id *)(v21 + 40), v31);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (_BYTE)v19;
    objc_msgSend(*(id *)(a1 + 40), "removeIndexes:", v8);
  }
  else
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F008]), "initWithTable:", CFSTR("business_addresses"));
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __99__MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep__persistBusinesses_connection_error___block_invoke_2;
    v28[3] = &unk_1E4E8D110;
    v16 = v22;
    v23 = *(_QWORD *)(a1 + 48);
    v29 = v16;
    v30 = v23;
    objc_msgSend(v8, "enumerateIndexesUsingBlock:", v28);
    v24 = *(void **)(a1 + 32);
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v27 = *(id *)(v25 + 40);
    v26 = objc_msgSend(v24, "executeInsertStatement:error:", v16, &v27);
    objc_storeStrong((id *)(v25 + 40), v27);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v26;

  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  else
LABEL_7:
    *a4 = 1;

}

void __99__MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep__persistBusinesses_connection_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "addValue");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, CFSTR("business"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("address"));

}

+ (id)_existingBusinessAddressesForConnection:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0D1EF08]);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F040]), "initWithResultColumn:table:", CFSTR("address"), CFSTR("business_addresses"));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __109__MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep__existingBusinessAddressesForConnection_error___block_invoke;
  v12[3] = &unk_1E4E8A048;
  v8 = v6;
  v13 = v8;
  if (objc_msgSend(v5, "executeSelectStatement:withBlock:error:", v7, v12, a4))
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  return v10;
}

void __109__MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep__existingBusinessAddressesForConnection_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "databaseIDValue");

  objc_msgSend(*(id *)(a1 + 32), "addIndex:", v4);
}

+ (void)_resetGroupingDefault
{
  if (_resetGroupingDefault_onceToken != -1)
    dispatch_once(&_resetGroupingDefault_onceToken, &__block_literal_global_72);
  objc_msgSend((id)_resetGroupingDefault_userDefaults, "removeObjectForKey:", CFSTR("PreferredGroupedSenderGroupingLogic"));
}

void __84__MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep__resetGroupingDefault__block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.mail"));

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("group.com.apple.mail"));
  v3 = (void *)_resetGroupingDefault_userDefaults;
  _resetGroupingDefault_userDefaults = v2;

}

+ (void)_persistBusinesses:(uint64_t)a1 connection:(uint64_t)a2 error:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a3, (uint64_t)a3, "%lu business addresses not updated. Deleting.", (uint8_t *)a1);
}

@end
