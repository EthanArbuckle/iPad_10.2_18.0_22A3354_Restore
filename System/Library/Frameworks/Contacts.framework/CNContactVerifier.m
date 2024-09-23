@implementation CNContactVerifier

+ (id)os_log
{
  if (os_log_cn_once_token_0_3 != -1)
    dispatch_once(&os_log_cn_once_token_0_3, &__block_literal_global_20);
  return (id)os_log_cn_once_object_0_3;
}

void __27__CNContactVerifier_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "CNContactVerifier");
  v1 = (void *)os_log_cn_once_object_0_3;
  os_log_cn_once_object_0_3 = (uint64_t)v0;

}

+ (BOOL)isValidContact:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void (**v10)(void *, _QWORD);
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  int v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  void (**v25)(void *, _QWORD);
  _QWORD aBlock[4];
  id v27;
  id v28;
  uint64_t *v29;
  BOOL v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 1;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__CNContactVerifier_isValidContact_error___block_invoke;
  aBlock[3] = &unk_1E29F87E0;
  v8 = v5;
  v27 = v8;
  v30 = a4 != 0;
  v9 = v6;
  v28 = v9;
  v29 = &v31;
  v10 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  objc_msgSend(v8, "availableKeyDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == 0;

  if (v12)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    +[CN writableContactProperties](CN, "writableContactProperties", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v35, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v14);
          v10[2](v10, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v35, 16);
      }
      while (v15);
    }
  }
  else
  {
    objc_msgSend(v8, "keyVector");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v7;
    v24[1] = 3221225472;
    v24[2] = __42__CNContactVerifier_isValidContact_error___block_invoke_2;
    v24[3] = &unk_1E29F8808;
    v25 = v10;
    objc_msgSend(v13, "enumeratePropertiesUsingBlock:", v24);

    v14 = v25;
  }

  v18 = *((unsigned __int8 *)v32 + 24);
  if (!*((_BYTE *)v32 + 24) && a4)
  {
    +[CNErrorFactory validationErrorByAggregatingValidationErrors:](CNErrorFactory, "validationErrorByAggregatingValidationErrors:", v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v31, 8);
  return v18 != 0;
}

void __42__CNContactVerifier_isValidContact_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "key");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  LOBYTE(v5) = objc_msgSend(v4, "isValidValue:error:", v6, &v19);

  v7 = v19;
  v8 = v7;
  if ((v5 & 1) == 0)
  {
    if (v7 && *(_BYTE *)(a1 + 56))
    {
      objc_msgSend(v7, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");

      v20[0] = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("CNInvalidRecords"));

      v12 = *(void **)(a1 + 40);
      v13 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v8, "domain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v8, "code");
      v16 = (void *)objc_msgSend(v10, "copy");
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v17);

    }
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (*(_BYTE *)(v18 + 24))
      *(_BYTE *)(v18 + 24) = 0;
  }

}

uint64_t __42__CNContactVerifier_isValidContact_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)arePropertiesOfContactAuthorized:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void (**v27)(void *, void *);
  char v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD aBlock[5];
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[2];
  _QWORD v40[2];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35 = 0;
  v36[0] = &v35;
  v36[1] = 0x3032000000;
  v36[2] = __Block_byref_object_copy__4;
  v36[3] = __Block_byref_object_dispose__4;
  v37 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__CNContactVerifier_arePropertiesOfContactAuthorized_error___block_invoke;
  aBlock[3] = &unk_1E29F8830;
  aBlock[4] = &v35;
  v27 = (void (**)(void *, void *))_Block_copy(aBlock);
  +[CN restrictedProperties](CN, "restrictedProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasBeenPersisted");
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v48, 16);
  if (!v7)
  {
    v28 = 1;
LABEL_23:
    v20 = obj;
    goto LABEL_24;
  }
  v8 = *(_QWORD *)v31;
  v28 = 1;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v31 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
      objc_msgSend(v10, "key");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v4, "areKeysAvailable:", v12);

      if (v13)
      {
        objc_msgSend(v10, "CNValueForContact:", v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          objc_msgSend(v4, "snapshot");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "CNValueForContact:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v10, "nilValue");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if ((objc_msgSend(v10, "isValue:equalToEmptyEquivalentOrValue:", v14, v16) & 1) == 0)
        {
          objc_msgSend(a1, "os_log");
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v10, "key");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v42 = v19;
            v43 = 2114;
            v44 = v14;
            v45 = 2114;
            v46 = v16;
            _os_log_debug_impl(&dword_18F8BD000, v17, OS_LOG_TYPE_DEBUG, "UnauthorizedKey:%{public}@, value:%{public}@, snapshotValue:%{public}@", buf, 0x20u);

          }
          if (!a4)
          {

            v28 = 0;
            goto LABEL_23;
          }
          objc_msgSend(v10, "key");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v27[2](v27, v18);

          v28 = 0;
        }

      }
    }
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v48, 16);
    if (v7)
      continue;
    break;
  }

  if (!((a4 == 0) | v28 & 1))
  {
    if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
    {
      v20 = 0;
    }
    else
    {
      objc_msgSend(a1, "os_log");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        +[CNContactVerifier arePropertiesOfContactAuthorized:error:].cold.1((uint64_t)v36, v22);

      v23 = *(_QWORD *)(v36[0] + 40);
      v38 = v4;
      v39[0] = CFSTR("CNKeyPaths");
      v39[1] = CFSTR("CNInvalidRecords");
      v40[0] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v40[1] = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 102, v20);
    v28 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

  }
  _Block_object_dispose(&v35, 8);

  return v28 & 1;
}

void __60__CNContactVerifier_arePropertiesOfContactAuthorized_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v8 = v3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v3 = v8;
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(v4, "addObject:", v3);

}

+ (void)arePropertiesOfContactAuthorized:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_18F8BD000, a2, OS_LOG_TYPE_ERROR, "CNErrorCodeUnauthorizedKeys:%{public}@", (uint8_t *)&v3, 0xCu);
}

@end
