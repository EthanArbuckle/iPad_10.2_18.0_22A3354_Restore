@implementation MSPContact

+ (id)properties
{
  if (qword_1ED328410 != -1)
    dispatch_once(&qword_1ED328410, &__block_literal_global_8);
  return (id)_MergedGlobals_40;
}

void __24__MSPContact_properties__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[15];

  v10[14] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x1E0C96790];
  v10[0] = v0;
  v10[1] = v1;
  v2 = *MEMORY[0x1E0C96780];
  v10[2] = *MEMORY[0x1E0C966D0];
  v10[3] = v2;
  v3 = *MEMORY[0x1E0C96798];
  v10[4] = *MEMORY[0x1E0C966C0];
  v10[5] = v3;
  v4 = *MEMORY[0x1E0C967D8];
  v10[6] = *MEMORY[0x1E0C967A0];
  v10[7] = v4;
  v5 = *MEMORY[0x1E0C967D0];
  v10[8] = *MEMORY[0x1E0C967E0];
  v10[9] = v5;
  v6 = *MEMORY[0x1E0C966A8];
  v10[10] = *MEMORY[0x1E0C967B8];
  v10[11] = v6;
  v7 = *MEMORY[0x1E0C96898];
  v10[12] = *MEMORY[0x1E0C967C0];
  v10[13] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 14);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)_MergedGlobals_40;
  _MergedGlobals_40 = v8;

}

+ (void)contactWithAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  v29 = 0;
  v8 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v9 = objc_alloc(MEMORY[0x1E0C97210]);
  +[MSPContact properties](MSPContact, "properties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithKeysToFetch:", v10);

  objc_msgSend(v11, "setSortOrder:", 1);
  v12 = objc_msgSend(v6, "containsString:", CFSTR("@"));
  v13 = (void *)MEMORY[0x1E0C97200];
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactMatchingEmailAddress:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPredicate:", v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "predicateForContactsMatchingPhoneNumber:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPredicate:", v15);

  }
  v23 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __54__MSPContact_contactWithAccountIdentifier_completion___block_invoke;
  v22[3] = &unk_1E6651FB8;
  v22[4] = &v24;
  objc_msgSend(v8, "enumerateContactsWithFetchRequest:error:usingBlock:", v11, &v23, v22);
  v16 = v23;
  if (v16)
  {
    MSPGetSharedTripLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v16;
      _os_log_impl(&dword_1B39C0000, v17, OS_LOG_TYPE_ERROR, "error resolving contact: %@", buf, 0xCu);
    }

  }
  if (v7)
  {
    MSPGetSharedTripLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = (void *)v25[5];
      *(_DWORD *)buf = 138412290;
      v31 = v19;
      _os_log_impl(&dword_1B39C0000, v18, OS_LOG_TYPE_INFO, "contactWithAddress contact %@", buf, 0xCu);
    }

    objc_msgSend(a1, "shortName:", v25[5]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v25[5], "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v20, v21);

  }
  _Block_object_dispose(&v24, 8);

}

void __54__MSPContact_contactWithAccountIdentifier_completion___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;
  id v7;

  v6 = a2;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v6 = v7;
    *a3 = 1;
  }

}

+ (id)shortName:(id)a3
{
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", a3, 1000);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
