@implementation FPFetchLatestVersionForFileAtURL

void __FPFetchLatestVersionForFileAtURL_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void (*v15)(void);
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[5];

  v38[4] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v38[0] = CFSTR("NSFileProviderInternalErrorDomain");
    v38[1] = CFSTR("NSFileProviderErrorDomain");
    v10 = *MEMORY[0x1E0CB2FE0];
    v38[2] = *MEMORY[0x1E0CB28A8];
    v38[3] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fp_unwrappedErrorForDomains:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("NSFileProviderInternalErrorDomain")))
    {
      v14 = objc_msgSend(v12, "code");

      if (v14 != 16)
      {
        v15 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_12:
        v15();

        goto LABEL_29;
      }
    }
    else
    {

    }
    v15 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_12;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D25D48], "manager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 32);
    v37 = 0;
    objc_msgSend(v16, "permanentStorageForItemAtURL:allocateIfNone:error:", v17, 0, &v37);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v37;

    if (v18)
    {
      v20 = *MEMORY[0x1E0D25D00];
      v36 = v19;
      objc_msgSend(v18, "additionWithName:inNameSpace:error:", v7, v20, &v36);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v36;

      if (v21)
      {
        v35 = v22;
        v23 = (void *)MEMORY[0x1E0CB3648];
        if (v8)
        {
          v24 = objc_alloc(MEMORY[0x1E0CB3648]);
          v25 = *(_QWORD *)(a1 + 32);
          objc_msgSend(v21, "name");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "url");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)objc_msgSend(v24, "_initWithFileURL:library:clientID:name:contentsURL:isBackup:revision:", v25, 0, 0, v26, v27, 0, 0);

        }
        else
        {
          v31 = *(_QWORD *)(a1 + 32);
          objc_msgSend(v21, "persistentIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "versionOfItemAtURL:forPersistentIdentifier:", v31, v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
        }

        if (v28)
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        }
        else
        {
          fp_current_or_default_log();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            __FPFetchLatestVersionForFileAtURL_block_invoke_cold_3();

          v33 = *(_QWORD *)(a1 + 40);
          FPItemNotFoundErrorAtURL(*(void **)(a1 + 32));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, void *))(v33 + 16))(v33, 0, v34);

        }
        v22 = v35;
      }
      else
      {
        fp_current_or_default_log();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          __FPFetchLatestVersionForFileAtURL_block_invoke_cold_2();

        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }

      v19 = v22;
    }
    else
    {
      fp_current_or_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        __FPFetchLatestVersionForFileAtURL_block_invoke_cold_1();

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
LABEL_29:

}

void __FPFetchLatestVersionForFileAtURL_block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1A0A34000, v0, OS_LOG_TYPE_ERROR, "[ERROR] Couldn't get storage after received version - %@", v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

void __FPFetchLatestVersionForFileAtURL_block_invoke_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_23();
  _os_log_error_impl(&dword_1A0A34000, v0, OS_LOG_TYPE_ERROR, "[ERROR] Couldn't find addition with name %@ - %@", v1, 0x16u);
  OUTLINED_FUNCTION_3();
}

void __FPFetchLatestVersionForFileAtURL_block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_37(&dword_1A0A34000, v0, v1, "[ERROR] Couldn't look up file version by persistent identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

@end
