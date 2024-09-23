@implementation LAKeyStoreBackendQueryBuilder

- (id)createQueryForKeyWithIdentifier:(id)a3 domain:(id)a4 acl:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __SecAccessControl *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[4];
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[LAKeyStoreBackendQueryBuilder _commonKeyParams]((uint64_t)self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0CD6A50];
  v13 = *MEMORY[0x1E0CD6A90];
  v25[0] = *MEMORY[0x1E0CD6A38];
  v25[1] = v13;
  v26[0] = v12;
  v26[1] = v10;
  v14 = *MEMORY[0x1E0CD6A20];
  v26[2] = &unk_1E7087F18;
  v15 = *MEMORY[0x1E0CD6FC0];
  v25[2] = v14;
  v25[3] = v15;
  v23[0] = *MEMORY[0x1E0CD6890];
  v16 = +[LASecAccessControl deserializeACL:](LASecAccessControl, "deserializeACL:", v8);

  v17 = *MEMORY[0x1E0CD69D8];
  v24[0] = v16;
  v24[1] = MEMORY[0x1E0C9AAB0];
  v18 = *MEMORY[0x1E0CD6908];
  v23[1] = v17;
  v23[2] = v18;
  objc_msgSend(v9, "dataUsingEncoding:", 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v24[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addEntriesFromDictionary:", v21);
  return v11;
}

- (id)_commonKeyParams
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[LAKeyStoreBackendQueryBuilder _commonQueryParams](a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0CD6CC0];
  v3 = *MEMORY[0x1E0CD6B98];
  v7[0] = *MEMORY[0x1E0CD6C98];
  v7[1] = v3;
  v4 = *MEMORY[0x1E0CD6BA0];
  v8[0] = v2;
  v8[1] = v4;
  v7[2] = *MEMORY[0x1E0CD69F8];
  v8[2] = *MEMORY[0x1E0CD6A00];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addEntriesFromDictionary:", v5);

  return v1;
}

- (id)fetchQueryForKeyWithIdentifier:(id)a3 domain:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[LAKeyStoreBackendQueryBuilder _commonKeyParams]((uint64_t)self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CD6A90];
  v17[0] = v7;
  v10 = *MEMORY[0x1E0CD6908];
  v16[0] = v9;
  v16[1] = v10;
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *MEMORY[0x1E0CD7028];
  v16[2] = *MEMORY[0x1E0CD7010];
  v16[3] = v12;
  v16[4] = *MEMORY[0x1E0CD6F30];
  v17[1] = v11;
  v17[2] = MEMORY[0x1E0C9AAB0];
  v13 = *MEMORY[0x1E0CD6F40];
  v17[3] = MEMORY[0x1E0C9AAB0];
  v17[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addEntriesFromDictionary:", v14);
  return v8;
}

- (id)fetchQueryForKeyWithPublicKeyHash:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[LAKeyStoreBackendQueryBuilder _commonKeyParams]((uint64_t)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CD7010];
  v11[0] = *MEMORY[0x1E0CD6900];
  v11[1] = v6;
  v7 = *MEMORY[0x1E0CD6F30];
  v11[2] = *MEMORY[0x1E0CD7028];
  v11[3] = v7;
  v12[0] = v4;
  v12[1] = MEMORY[0x1E0C9AAB0];
  v8 = *MEMORY[0x1E0CD6F40];
  v12[2] = MEMORY[0x1E0C9AAB0];
  v12[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addEntriesFromDictionary:", v9);
  return v5;
}

- (id)fetchQueryForKeysWithDomain:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[LAKeyStoreBackendQueryBuilder _commonKeyParams]((uint64_t)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = *MEMORY[0x1E0CD6908];
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *MEMORY[0x1E0CD7028];
  v11[1] = *MEMORY[0x1E0CD7010];
  v11[2] = v7;
  v11[3] = *MEMORY[0x1E0CD6F30];
  v12[0] = v6;
  v12[1] = MEMORY[0x1E0C9AAB0];
  v8 = *MEMORY[0x1E0CD6F38];
  v12[2] = MEMORY[0x1E0C9AAB0];
  v12[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v9);

  return v5;
}

- (id)removeQueryForKeysWithDomain:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[LAKeyStoreBackendQueryBuilder _commonKeyParams]((uint64_t)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CD6908];
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v7);

  return v5;
}

- (id)createQueryForGenericPasswordWithIdentifier:(id)a3 domain:(id)a4 data:(id)a5 protectedBy:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  __SecAccessControl *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v22[6];
  _QWORD v23[7];

  v23[6] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[LAKeyStoreBackendQueryBuilder _commonGenericPasswordParams]((uint64_t)self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = *MEMORY[0x1E0CD6890];
  v15 = +[LASecAccessControl allowAllACL](LASecAccessControl, "allowAllACL");
  v16 = *MEMORY[0x1E0CD6A90];
  v23[0] = v15;
  v23[1] = v13;
  v17 = *MEMORY[0x1E0CD68F8];
  v22[1] = v16;
  v22[2] = v17;
  v18 = *MEMORY[0x1E0CD6B58];
  v23[2] = v13;
  v23[3] = v12;
  v19 = *MEMORY[0x1E0CD69B0];
  v22[3] = v18;
  v22[4] = v19;
  v22[5] = *MEMORY[0x1E0CD70D8];
  v23[4] = v10;
  v23[5] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addEntriesFromDictionary:", v20);
  return v14;
}

- (id)_commonGenericPasswordParams
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[LAKeyStoreBackendQueryBuilder _commonQueryParams](a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0CD6C98];
  v6[0] = *MEMORY[0x1E0CD69C0];
  v6[1] = v2;
  v3 = *MEMORY[0x1E0CD6CA8];
  v7[0] = MEMORY[0x1E0C9AAB0];
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addEntriesFromDictionary:", v4);

  return v1;
}

- (id)fetchQueryForGenericPasswordWithIdentifier:(id)a3 domain:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[6];
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[LAKeyStoreBackendQueryBuilder _commonGenericPasswordParams]((uint64_t)self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CD68F8];
  v15[0] = *MEMORY[0x1E0CD6A90];
  v15[1] = v9;
  v16[0] = v7;
  v16[1] = v7;
  v10 = *MEMORY[0x1E0CD7010];
  v15[2] = *MEMORY[0x1E0CD6B58];
  v15[3] = v10;
  v11 = *MEMORY[0x1E0CD6F30];
  v15[4] = *MEMORY[0x1E0CD7018];
  v15[5] = v11;
  v16[2] = v6;
  v16[3] = MEMORY[0x1E0C9AAB0];
  v12 = *MEMORY[0x1E0CD6F40];
  v16[4] = MEMORY[0x1E0C9AAB0];
  v16[5] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addEntriesFromDictionary:", v13);
  return v8;
}

- (id)fetchQueryForGenericPasswordsWithDomain:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[LAKeyStoreBackendQueryBuilder _commonGenericPasswordParams]((uint64_t)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CD7010];
  v11[0] = *MEMORY[0x1E0CD6B58];
  v11[1] = v6;
  v7 = *MEMORY[0x1E0CD6F30];
  v11[2] = *MEMORY[0x1E0CD7018];
  v11[3] = v7;
  v12[0] = v4;
  v12[1] = MEMORY[0x1E0C9AAB0];
  v8 = *MEMORY[0x1E0CD6F38];
  v12[2] = MEMORY[0x1E0C9AAB0];
  v12[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addEntriesFromDictionary:", v9);
  return v5;
}

- (id)removeQueryForGenericPasswordsWithDomain:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[LAKeyStoreBackendQueryBuilder _commonGenericPasswordParams]((uint64_t)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CD6B58];
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addEntriesFromDictionary:", v6);
  return v5;
}

- (id)_commonQueryParams
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v1 = *MEMORY[0x1E0CD70A8];
  v5[0] = *MEMORY[0x1E0CD6998];
  v5[1] = v1;
  v6[0] = CFSTR("APLA");
  v6[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  return v3;
}

@end
