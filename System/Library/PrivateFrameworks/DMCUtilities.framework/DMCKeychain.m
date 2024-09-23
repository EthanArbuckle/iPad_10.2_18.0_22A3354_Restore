@implementation DMCKeychain

+ (id)stringFromServiceData:(id)a3
{
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", objc_msgSend(objc_retainAutorelease(a3), "bytes"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)dataFromString:(id)a3
{
  return (id)objc_msgSend(a3, "dataUsingEncoding:", 4);
}

+ (BOOL)setData:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 access:(void *)a8 group:(id)a9 useSystemKeychain:(BOOL)a10 sysBound:(BOOL)a11 enforcePersonalPersona:(BOOL)a12 outError:(id *)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __CFDictionary *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  BOOL v53;
  uint64_t v55;
  void *v56;
  _QWORD v57[4];
  id v58;
  id v59;
  __int128 *v60;
  void *v61;
  __CFDictionary *v62;
  id v63;
  uint8_t buf[4];
  const char *v65;
  __int16 v66;
  void *v67;
  __int128 v68;
  uint64_t v69;
  int v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a9;
  v56 = v19;
  if (objc_msgSend(v18, "length"))
  {
    v63 = 0;
    v31 = +[DMCKeychain _newQueryWithService:account:label:description:group:useSystemKeychain:outError:](DMCKeychain, "_newQueryWithService:account:label:description:group:useSystemKeychain:outError:", v19, v20, v21, v22, v23, a10, &v63);
    v32 = v63;
    if (v32)
    {
      v33 = v32;
      if (v31)
        CFRelease(v31);
      goto LABEL_17;
    }
    LOBYTE(v55) = a12;
    +[DMCKeychain dataFromService:account:label:description:group:useSystemKeychain:enforcePersonalPersona:outError:](DMCKeychain, "dataFromService:account:label:description:group:useSystemKeychain:enforcePersonalPersona:outError:", v19, v20, v21, v22, v23, a10, v55, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v68 = 0;
    *((_QWORD *)&v68 + 1) = &v68;
    v69 = 0x2020000000;
    v70 = 0;
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __132__DMCKeychain_setData_forService_account_label_description_access_group_useSystemKeychain_sysBound_enforcePersonalPersona_outError___block_invoke;
    v57[3] = &unk_1E4D37698;
    v37 = v36;
    v58 = v37;
    v59 = v18;
    v60 = &v68;
    v61 = a8;
    v62 = v31;
    v38 = MEMORY[0x1A85A3C10](v57);
    v39 = (void *)v38;
    if (a12)
    {
      +[DMCPersonaHelper performBlockUnderPersonalPersona:](DMCPersonaHelper, "performBlockUnderPersonalPersona:", v38);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      (*(void (**)(uint64_t))(v38 + 16))(v38);
      v33 = 0;
    }
    CFRelease(v31);
    if (v33)
    {
      v40 = *DMCLogObjects();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v65 = "+[DMCKeychain setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:enforce"
              "PersonalPersona:outError:]";
        v66 = 2112;
        v67 = v33;
        _os_log_impl(&dword_1A4951000, v40, OS_LOG_TYPE_ERROR, "%s: Failed to execute the block under personal persona. Error: %@", buf, 0x16u);
      }
    }
    else if (*(_DWORD *)(*((_QWORD *)&v68 + 1) + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), *(unsigned int *)(*((_QWORD *)&v68 + 1) + 24));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      DMCErrorArray(CFSTR("KEYCHAIN_ERROR_CODE_P_CODE_%@"), v42, v43, v44, v45, v46, v47, v48, v41);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "DMCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("DMCKeychainErrorDomain"), 6000, v49, CFSTR("DMCFatalError"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v33 = 0;
    }

    _Block_object_dispose(&v68, 8);
  }
  else
  {
    v34 = (void *)MEMORY[0x1E0CB35C8];
    DMCErrorArray(CFSTR("KEYCHAIN_ERROR_EMPTY_DATA"), v24, v25, v26, v27, v28, v29, v30, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "DMCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("DMCKeychainErrorDomain"), 6001, v35, CFSTR("DMCFatalError"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!v33)
  {
    v53 = 1;
    goto LABEL_23;
  }
LABEL_17:
  if (a13)
    *a13 = objc_retainAutorelease(v33);
  v50 = *DMCLogObjects();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
  {
    v51 = v50;
    objc_msgSend(v33, "DMCVerboseDescription");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v68) = 138543362;
    *(_QWORD *)((char *)&v68 + 4) = v52;
    _os_log_impl(&dword_1A4951000, v51, OS_LOG_TYPE_ERROR, "Failed to set data in keychain. Error: %{public}@", (uint8_t *)&v68, 0xCu);

  }
  v53 = 0;
LABEL_23:

  return v53;
}

void __132__DMCKeychain_setData_forService_account_label_description_access_group_useSystemKeychain_sysBound_enforcePersonalPersona_outError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const __CFDictionary *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    if ((objc_msgSend(v2, "isEqualToData:", *(_QWORD *)(a1 + 40)) & 1) == 0)
    {
      v3 = *(_QWORD *)(a1 + 40);
      v4 = *MEMORY[0x1E0CD68A0];
      v7[0] = *MEMORY[0x1E0CD70D8];
      v7[1] = v4;
      v5 = *(_QWORD *)(a1 + 56);
      v8[0] = v3;
      v8[1] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
      v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = SecItemUpdate(*(CFDictionaryRef *)(a1 + 64), v6);

    }
  }
  else
  {
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 64), (const void *)*MEMORY[0x1E0CD70D8], *(const void **)(a1 + 40));
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 64), (const void *)*MEMORY[0x1E0CD68A0], *(const void **)(a1 + 56));
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 64), (const void *)*MEMORY[0x1E0CD6B90], MEMORY[0x1E0C9AAB0]);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = SecItemAdd(*(CFDictionaryRef *)(a1 + 64), 0);
  }
}

+ (id)dataFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 useSystemKeychain:(BOOL)a8 enforcePersonalPersona:(BOOL)a9 outError:(id *)a10
{
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  __CFDictionary *v20;
  id v21;
  void *v22;
  OSStatus v23;
  NSObject *v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  __CFDictionary *v39;
  _QWORD v41[7];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  int v45;
  id v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  void *v50;
  __int128 v51;
  uint64_t v52;
  CFTypeRef v53[3];

  v10 = a8;
  v53[2] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v46 = 0;
  v20 = +[DMCKeychain _newQueryWithService:account:label:description:group:useSystemKeychain:outError:](DMCKeychain, "_newQueryWithService:account:label:description:group:useSystemKeychain:outError:", v15, v16, v17, v18, v19, v10, &v46);
  v21 = v46;
  if (v21)
  {
    v22 = v21;
    if (v20)
    {
      CFRelease(v20);
      v20 = 0;
    }
    goto LABEL_16;
  }
  CFDictionaryAddValue(v20, (const void *)*MEMORY[0x1E0CD7018], (const void *)*MEMORY[0x1E0C9AE50]);
  *(_QWORD *)&v51 = 0;
  *((_QWORD *)&v51 + 1) = &v51;
  v52 = 0x2020000000;
  v53[0] = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  if (a9)
  {
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __113__DMCKeychain_dataFromService_account_label_description_group_useSystemKeychain_enforcePersonalPersona_outError___block_invoke;
    v41[3] = &unk_1E4D376C0;
    v41[5] = &v51;
    v41[6] = v20;
    v41[4] = &v42;
    +[DMCPersonaHelper performBlockUnderPersonalPersona:](DMCPersonaHelper, "performBlockUnderPersonalPersona:", v41);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = SecItemCopyMatching(v20, v53);
    v22 = 0;
    *((_DWORD *)v43 + 6) = v23;
  }
  CFRelease(v20);
  if (v22)
  {
    v24 = *DMCLogObjects();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "+[DMCKeychain dataFromService:account:label:description:group:useSystemKeychain:enforcePersonalPersona:outError:]";
      v49 = 2112;
      v50 = v22;
      _os_log_impl(&dword_1A4951000, v24, OS_LOG_TYPE_ERROR, "%s: Failed to execute the block under personal persona. Error: %@", buf, 0x16u);
    }
  }
  else
  {
    v25 = *((_DWORD *)v43 + 6);
    if (v25 == -25300 || !v25)
    {
      v22 = 0;
      v20 = *(__CFDictionary **)(*((_QWORD *)&v51 + 1) + 24);
      goto LABEL_15;
    }
    v26 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), *((unsigned int *)v43 + 6));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    DMCErrorArray(CFSTR("KEYCHAIN_ERROR_CODE_P_CODE_%@"), v28, v29, v30, v31, v32, v33, v34, v27);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "DMCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("DMCKeychainErrorDomain"), 6000, v35, CFSTR("DMCFatalError"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v20 = 0;
LABEL_15:
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v51, 8);
  if (!v22)
  {
    v20 = v20;
    v39 = v20;
    goto LABEL_21;
  }
LABEL_16:
  if (a10)
    *a10 = objc_retainAutorelease(v22);
  v36 = *DMCLogObjects();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    v37 = v36;
    objc_msgSend(v22, "DMCVerboseDescription");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v51) = 138543362;
    *(_QWORD *)((char *)&v51 + 4) = v38;
    _os_log_impl(&dword_1A4951000, v37, OS_LOG_TYPE_ERROR, "Cannot retrieve item from keychain. Error: %{public}@", (uint8_t *)&v51, 0xCu);

  }
  v39 = 0;
LABEL_21:

  return v39;
}

uint64_t __113__DMCKeychain_dataFromService_account_label_description_group_useSystemKeychain_enforcePersonalPersona_outError___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = SecItemCopyMatching(*(CFDictionaryRef *)(a1 + 48), (CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (id)saveItem:(void *)a3 withLabel:(id)a4 group:(id)a5 useSystemKeychain:(BOOL)a6 enforcePersonalPersona:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  int v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  int v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  void *v48;
  _QWORD v49[4];
  _QWORD v50[5];

  v7 = a7;
  v8 = a6;
  v50[4] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = *MEMORY[0x1E0CD6898];
  v49[0] = *MEMORY[0x1E0CD70E8];
  v49[1] = v13;
  v14 = *MEMORY[0x1E0CD68A0];
  v49[2] = *MEMORY[0x1E0CD7020];
  v49[3] = v14;
  v50[0] = a3;
  v50[1] = v12;
  v15 = *MEMORY[0x1E0CD68D0];
  v50[2] = MEMORY[0x1E0C9AAB0];
  v50[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  if (v8)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD70C0]);
  if (v11)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CD6A90]);
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__2;
  v39 = __Block_byref_object_dispose__2;
  v40 = 0;
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __81__DMCKeychain_saveItem_withLabel_group_useSystemKeychain_enforcePersonalPersona___block_invoke;
  v30 = &unk_1E4D376E8;
  v32 = &v41;
  v18 = v17;
  v33 = &v35;
  v34 = 0;
  v31 = v18;
  v19 = MEMORY[0x1A85A3C10](&v27);
  v20 = (void *)v19;
  if (v7)
  {
    +[DMCPersonaHelper performBlockUnderPersonalPersona:](DMCPersonaHelper, "performBlockUnderPersonalPersona:", v19, v27, v28, v29, v30);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = *DMCLogObjects();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v46 = "+[DMCKeychain saveItem:withLabel:group:useSystemKeychain:enforcePersonalPersona:]";
        v47 = 2112;
        v48 = v21;
        _os_log_impl(&dword_1A4951000, v22, OS_LOG_TYPE_ERROR, "%s: Failed to execute the block under personal persona. Error: %@", buf, 0x16u);
      }

      goto LABEL_14;
    }
  }
  else
  {
    (*(void (**)(uint64_t))(v19 + 16))(v19);
  }
  if (!*((_DWORD *)v42 + 6))
  {
    v25 = (id)v36[5];
    goto LABEL_16;
  }
  v23 = *DMCLogObjects();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v24 = *((_DWORD *)v42 + 6);
    *(_DWORD *)buf = 67109120;
    LODWORD(v46) = v24;
    _os_log_impl(&dword_1A4951000, v23, OS_LOG_TYPE_ERROR, "Could not store item in keychain. Error: %d", buf, 8u);
  }
LABEL_14:
  v25 = 0;
LABEL_16:

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  return v25;
}

void __81__DMCKeychain_saveItem_withLabel_group_useSystemKeychain_enforcePersonalPersona___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = SecItemAdd(*(CFDictionaryRef *)(a1 + 32), (CFTypeRef *)(a1 + 56));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = *(_QWORD *)(a1 + 56);

  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == -25299)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0CD6A90]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0CD68A0]);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = SecItemCopyMatching(*(CFDictionaryRef *)(a1 + 32), (CFTypeRef *)(a1 + 56));
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = *(_QWORD *)(a1 + 56);

    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == -25300)
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0CD6898]);
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = SecItemCopyMatching(*(CFDictionaryRef *)(a1 + 32), (CFTypeRef *)(a1 + 56));
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = *(_QWORD *)(a1 + 56);

    }
  }
}

+ (void)removeItemForService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 useSystemKeychain:(BOOL)a7 enforcePersonalPersona:(BOOL)a8 group:(id)a9
{
  __CFDictionary *v10;
  __CFDictionary *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v10 = +[DMCKeychain _newQueryWithService:account:label:description:group:useSystemKeychain:outError:](DMCKeychain, "_newQueryWithService:account:label:description:group:useSystemKeychain:outError:", a3, a4, a5, a6, a9, a7, 0);
  if (v10)
  {
    v11 = v10;
    if (a8)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __109__DMCKeychain_removeItemForService_account_label_description_useSystemKeychain_enforcePersonalPersona_group___block_invoke;
      v15[3] = &__block_descriptor_40_e5_v8__0l;
      v15[4] = v10;
      +[DMCPersonaHelper performBlockUnderPersonalPersona:](DMCPersonaHelper, "performBlockUnderPersonalPersona:", v15);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        v14 = *DMCLogObjects();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v17 = "+[DMCKeychain removeItemForService:account:label:description:useSystemKeychain:enforcePersonalPersona:group:]";
          v18 = 2112;
          v19 = v13;
          _os_log_impl(&dword_1A4951000, v14, OS_LOG_TYPE_ERROR, "%s: Failed to execute the block under personal persona. Error: %@", buf, 0x16u);
        }

      }
    }
    else
    {
      SecItemDelete(v10);
    }
    CFRelease(v11);
  }
}

uint64_t __109__DMCKeychain_removeItemForService_account_label_description_useSystemKeychain_enforcePersonalPersona_group___block_invoke(uint64_t a1)
{
  return SecItemDelete(*(CFDictionaryRef *)(a1 + 32));
}

+ (__CFDictionary)_newQueryWithService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 useSystemKeychain:(BOOL)a8 outError:(id *)a9
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __CFDictionary *Mutable;
  void *v27;
  void *v28;

  v9 = a8;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (objc_msgSend(v14, "length"))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CA8]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B58], v14);
    if (objc_msgSend(v15, "length"))
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68F8], v15);
    if (objc_msgSend(v16, "length"))
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6A90], v16);
    if (objc_msgSend(v17, "length"))
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD69A0], v17);
    if (objc_msgSend(v18, "length"))
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6898], v18);
    if (v9)
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD70C0], MEMORY[0x1E0C9AAB0]);
  }
  else
  {
    if (a9)
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      DMCErrorArray(CFSTR("KEYCHAIN_ERROR_CANNOT_CREATE_QUERY"), v19, v20, v21, v22, v23, v24, v25, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "DMCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("DMCKeychainErrorDomain"), 6002, v28, CFSTR("DMCFatalError"));
      *a9 = (id)objc_claimAutoreleasedReturnValue();

    }
    Mutable = 0;
  }

  return Mutable;
}

+ (__SecIdentity)copyIdentityWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4 enforcePersonalPersona:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  const void *v9;
  const void *v10;
  CFTypeID v11;
  NSObject *v12;
  NSObject *v13;
  CFTypeID v14;
  __CFString *v15;
  int v17;
  id v18;
  __int16 v19;
  __CFString *v20;
  uint64_t v21;

  v5 = a5;
  v6 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (const void *)objc_msgSend(a1, "copyItemWithPersistentID:useSystemKeychain:enforcePersonalPersona:", v8, v6, v5);
  v10 = v9;
  if (v9)
  {
    v11 = CFGetTypeID(v9);
    if (v11 != SecIdentityGetTypeID())
    {
      v12 = *DMCLogObjects();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = v12;
        v14 = CFGetTypeID(v10);
        v15 = (__CFString *)CFCopyTypeIDDescription(v14);
        v17 = 138543618;
        v18 = v8;
        v19 = 2114;
        v20 = v15;
        _os_log_impl(&dword_1A4951000, v13, OS_LOG_TYPE_ERROR, "Identity with persistent ID: %{public}@ has unexpected type: %{public}@", (uint8_t *)&v17, 0x16u);

      }
      CFRelease(v10);
      v10 = 0;
    }
  }

  return (__SecIdentity *)v10;
}

+ (void)copyItemWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4 enforcePersonalPersona:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  OSStatus v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  CFTypeRef v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v5 = a5;
  v6 = a4;
  v35[2] = *MEMORY[0x1E0C80C00];
  v7 = (char *)a3;
  v8 = *MEMORY[0x1E0CD7028];
  v34[0] = *MEMORY[0x1E0CD70E0];
  v34[1] = v8;
  v35[0] = v7;
  v35[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (v6)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD70C0]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0CD7010]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v8);
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  if (!v5)
  {
    v13 = SecItemCopyMatching((CFDictionaryRef)v10, &v29);
    *((_DWORD *)v23 + 6) = v13;
    goto LABEL_10;
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __81__DMCKeychain_copyItemWithPersistentID_useSystemKeychain_enforcePersonalPersona___block_invoke;
  v18[3] = &unk_1E4D37710;
  v20 = &v22;
  v19 = v10;
  v21 = &v26;
  +[DMCPersonaHelper performBlockUnderPersonalPersona:](DMCPersonaHelper, "performBlockUnderPersonalPersona:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v13 = *((_DWORD *)v23 + 6);
LABEL_10:
    if (v13 == -25300)
    {
      v16 = *DMCLogObjects();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543618;
        v31 = v7;
        v32 = 1024;
        LODWORD(v33) = v6;
        _os_log_impl(&dword_1A4951000, v16, OS_LOG_TYPE_DEBUG, "Couldn't get item with ID: %{public}@ system keychain: %d", buf, 0x12u);
      }
    }
    else if (v13)
    {
      v14 = *DMCLogObjects();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v31 = v7;
        _os_log_impl(&dword_1A4951000, v14, OS_LOG_TYPE_ERROR, "Cannot retrieve item with persistent ID %{public}@", buf, 0xCu);
      }
      goto LABEL_14;
    }
    v15 = (void *)v27[3];
    goto LABEL_18;
  }
  v12 = *DMCLogObjects();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "+[DMCKeychain copyItemWithPersistentID:useSystemKeychain:enforcePersonalPersona:]";
    v32 = 2112;
    v33 = v11;
    _os_log_impl(&dword_1A4951000, v12, OS_LOG_TYPE_ERROR, "%s: Failed to execute the block under personal persona. Error: %@", buf, 0x16u);
  }

LABEL_14:
  v15 = 0;
LABEL_18:
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v15;
}

uint64_t __81__DMCKeychain_copyItemWithPersistentID_useSystemKeychain_enforcePersonalPersona___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = SecItemCopyMatching(*(CFDictionaryRef *)(a1 + 32), (CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (__SecCertificate)copyCertificateWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4 enforcePersonalPersona:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  char *v8;
  __SecCertificate *v9;
  __SecCertificate *v10;
  CFTypeID v11;
  CFTypeID v12;
  __CFString *v13;
  NSObject *v14;
  NSObject *v15;
  CFTypeID v16;
  __CFString *v17;
  __SecCertificate *v18;
  _QWORD v20[6];
  uint64_t v21;
  SecCertificateRef *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  __CFString *v28;
  uint64_t v29;

  v5 = a5;
  v6 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = (char *)a3;
  v21 = 0;
  v22 = (SecCertificateRef *)&v21;
  v23 = 0x2020000000;
  v24 = 0;
  v9 = (__SecCertificate *)objc_msgSend(a1, "copyItemWithPersistentID:useSystemKeychain:enforcePersonalPersona:", v8, v6, v5);
  v10 = v9;
  if (v9)
  {
    v11 = CFGetTypeID(v9);
    if (v11 == SecCertificateGetTypeID())
    {
      v22[3] = v10;
    }
    else
    {
      v12 = CFGetTypeID(v10);
      if (v12 == SecIdentityGetTypeID())
      {
        if (v5)
        {
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __88__DMCKeychain_copyCertificateWithPersistentID_useSystemKeychain_enforcePersonalPersona___block_invoke;
          v20[3] = &unk_1E4D37738;
          v20[4] = &v21;
          v20[5] = v10;
          +[DMCPersonaHelper performBlockUnderPersonalPersona:](DMCPersonaHelper, "performBlockUnderPersonalPersona:", v20);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = *DMCLogObjects();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v26 = "+[DMCKeychain copyCertificateWithPersistentID:useSystemKeychain:enforcePersonalPersona:]";
              v27 = 2112;
              v28 = v13;
              _os_log_impl(&dword_1A4951000, v14, OS_LOG_TYPE_ERROR, "%s: Failed to execute the block under personal persona. Error: %@", buf, 0x16u);
            }
          }
        }
        else
        {
          SecIdentityCopyCertificate(v10, v22 + 3);
          v13 = 0;
        }
        CFRelease(v10);

      }
      else
      {
        v15 = (id)*DMCLogObjects();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = CFGetTypeID(v10);
          v17 = (__CFString *)CFCopyTypeIDDescription(v16);
          *(_DWORD *)buf = 138543618;
          v26 = v8;
          v27 = 2114;
          v28 = v17;
          _os_log_impl(&dword_1A4951000, v15, OS_LOG_TYPE_ERROR, "Certificate with persistent ID: %{public}@ has unexpected type: %{public}@", buf, 0x16u);

        }
        CFRelease(v10);
      }
    }
  }
  v18 = v22[3];
  _Block_object_dispose(&v21, 8);

  return v18;
}

uint64_t __88__DMCKeychain_copyCertificateWithPersistentID_useSystemKeychain_enforcePersonalPersona___block_invoke(uint64_t a1)
{
  return SecIdentityCopyCertificate(*(SecIdentityRef *)(a1 + 40), (SecCertificateRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

+ (id)copyCertificatesWithPersistentIDs:(id)a3 useSystemKeychain:(BOOL)a4 enforcePersonalPersona:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __SecCertificate *v15;
  __SecCertificate *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v5 = a5;
  v6 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_msgSend(v7, "count");
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      while (2)
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = +[DMCKeychain copyCertificateWithPersistentID:useSystemKeychain:enforcePersonalPersona:](DMCKeychain, "copyCertificateWithPersistentID:useSystemKeychain:enforcePersonalPersona:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14), v6, v5, (_QWORD)v19);
          if (!v15)
          {

            v17 = 0;
            goto LABEL_14;
          }
          v16 = v15;
          objc_msgSend(v9, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v12)
          continue;
        break;
      }
    }

  }
  else
  {
    v9 = 0;
  }
  v9 = v9;
  v17 = v9;
LABEL_14:

  return v17;
}

+ (BOOL)storeAttestationKey:(__SecKey *)a3 withGroup:(id)a4 label:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  SecAccessControlRef v11;
  OSStatus v12;
  NSObject *v13;
  _DWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0C99E08];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", a3, *MEMORY[0x1E0CD70E8]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CD6898]);

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CD6A90]);
  v11 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x1E0CD68D0], 0x40000000uLL, 0);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CD6890]);
  CFRelease(v11);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD70C0]);
  v12 = SecItemAdd((CFDictionaryRef)v10, 0);
  if (v12)
  {
    v13 = *DMCLogObjects();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15[0] = 67109120;
      v15[1] = v12;
      _os_log_impl(&dword_1A4951000, v13, OS_LOG_TYPE_ERROR, "Could not store attestation key in keychain. Error: %d", (uint8_t *)v15, 8u);
    }
  }

  return v12 == 0;
}

+ (__SecKey)retrieveAttestationKeyWithGroup:(id)a3 label:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  OSStatus v10;
  OSStatus v11;
  NSObject *v12;
  __SecKey *v13;
  CFTypeRef result;
  uint8_t buf[4];
  OSStatus v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CC0], *MEMORY[0x1E0CD6C98]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CD6898]);

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CD6A90]);
  v9 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD70C0]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CD7028]);
  result = 0;
  v10 = SecItemCopyMatching((CFDictionaryRef)v8, &result);
  if (v10)
  {
    v11 = v10;
    v12 = *DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v17 = v11;
      _os_log_impl(&dword_1A4951000, v12, OS_LOG_TYPE_ERROR, "Could not retrieve attestation key from keychain. Error: %d", buf, 8u);
    }
    v13 = 0;
  }
  else
  {
    v13 = (__SecKey *)result;
  }

  return v13;
}

+ (BOOL)deleteAttestationKeyWithGroup:(id)a3 label:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  OSStatus v9;
  NSObject *v10;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CC0], *MEMORY[0x1E0CD6C98]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CD6898]);

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CD6A90]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD70C0]);
  v9 = SecItemDelete((CFDictionaryRef)v8);
  if (v9)
  {
    v10 = *DMCLogObjects();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12[0] = 67109120;
      v12[1] = v9;
      _os_log_impl(&dword_1A4951000, v10, OS_LOG_TYPE_ERROR, "Could not delete attestation key from keychain. Error: %d", (uint8_t *)v12, 8u);
    }
  }

  return v9 == 0;
}

+ (BOOL)storeAttestationCert:(__SecCertificate *)a3 withGroup:(id)a4 label:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  OSStatus v11;
  NSObject *v12;
  _DWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0C99E08];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", a3, *MEMORY[0x1E0CD70E8]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CD6898]);

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CD6A90]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD68D0], *MEMORY[0x1E0CD68A0]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD70C0]);
  v11 = SecItemAdd((CFDictionaryRef)v10, 0);
  if (v11)
  {
    v12 = *DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14[0] = 67109120;
      v14[1] = v11;
      _os_log_impl(&dword_1A4951000, v12, OS_LOG_TYPE_ERROR, "Could not store attestation cert in keychain. Error: %d", (uint8_t *)v14, 8u);
    }
  }

  return v11 == 0;
}

+ (__SecCertificate)retrieveAttestationCertWithGroup:(id)a3 label:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  OSStatus v10;
  OSStatus v11;
  NSObject *v12;
  __SecCertificate *v13;
  CFTypeRef result;
  uint8_t buf[4];
  OSStatus v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CA0], *MEMORY[0x1E0CD6C98]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CD6898]);

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CD6A90]);
  v9 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD70C0]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CD7028]);
  result = 0;
  v10 = SecItemCopyMatching((CFDictionaryRef)v8, &result);
  if (v10)
  {
    v11 = v10;
    v12 = *DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v17 = v11;
      _os_log_impl(&dword_1A4951000, v12, OS_LOG_TYPE_ERROR, "Could not retrieve attestation cert from keychain. Error: %d", buf, 8u);
    }
    v13 = 0;
  }
  else
  {
    v13 = (__SecCertificate *)result;
  }

  return v13;
}

+ (BOOL)deleteAttestationCertWithGroup:(id)a3 label:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  OSStatus v9;
  NSObject *v10;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CA0], *MEMORY[0x1E0CD6C98]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CD6898]);

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CD6A90]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD70C0]);
  v9 = SecItemDelete((CFDictionaryRef)v8);
  if (v9)
  {
    v10 = *DMCLogObjects();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12[0] = 67109120;
      v12[1] = v9;
      _os_log_impl(&dword_1A4951000, v10, OS_LOG_TYPE_ERROR, "Could not delete attestation cert from keychain. Error: %d", (uint8_t *)v12, 8u);
    }
  }

  return v9 == 0;
}

+ (__SecIdentity)retrieveAttestationIdentityWithGroup:(id)a3 label:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  OSStatus v10;
  OSStatus v11;
  NSObject *v12;
  __SecIdentity *v13;
  CFTypeRef result;
  uint8_t buf[4];
  OSStatus v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CB0], *MEMORY[0x1E0CD6C98]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CD6898]);

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CD6A90]);
  v9 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD70C0]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CD7028]);
  result = 0;
  v10 = SecItemCopyMatching((CFDictionaryRef)v8, &result);
  if (v10)
  {
    v11 = v10;
    v12 = *DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v17 = v11;
      _os_log_impl(&dword_1A4951000, v12, OS_LOG_TYPE_ERROR, "Could not retrieve attestation identity from keychain. Error: %d", buf, 8u);
    }
    v13 = 0;
  }
  else
  {
    v13 = (__SecIdentity *)result;
  }

  return v13;
}

+ (BOOL)storeAttestationMetadata:(id)a3 withGroup:(id)a4 service:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  OSStatus v12;
  NSObject *v13;
  _DWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0C99E08];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CD70D8]);

  objc_msgSend(v11, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CA8], *MEMORY[0x1E0CD6C98]);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CD6898]);

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CD6B58]);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD68D0], *MEMORY[0x1E0CD68A0]);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD70C0]);
  v12 = SecItemAdd((CFDictionaryRef)v11, 0);
  if (v12)
  {
    v13 = *DMCLogObjects();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15[0] = 67109120;
      v15[1] = v12;
      _os_log_impl(&dword_1A4951000, v13, OS_LOG_TYPE_ERROR, "Could not store attestation metadata in keychain. Error: %d", (uint8_t *)v15, 8u);
    }
  }

  return v12 == 0;
}

+ (id)retrieveAttestationMetadataWithGroup:(id)a3 service:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  OSStatus v10;
  OSStatus v11;
  NSObject *v12;
  void *v13;
  CFTypeRef result;
  uint8_t buf[4];
  OSStatus v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CA8], *MEMORY[0x1E0CD6C98]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CD6898]);

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CD6B58]);
  v9 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD70C0]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CD7028]);
  result = 0;
  v10 = SecItemCopyMatching((CFDictionaryRef)v8, &result);
  if (v10)
  {
    v11 = v10;
    v12 = *DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v17 = v11;
      _os_log_impl(&dword_1A4951000, v12, OS_LOG_TYPE_ERROR, "Could not retrieve attestation metadata from keychain. Error: %d", buf, 8u);
    }
    v13 = 0;
  }
  else
  {
    v13 = (id)result;
  }

  return v13;
}

+ (BOOL)deleteAttestationMetadataWithGroup:(id)a3 service:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  OSStatus v9;
  NSObject *v10;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CA8], *MEMORY[0x1E0CD6C98]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CD6898]);

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CD6B58]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD70C0]);
  v9 = SecItemDelete((CFDictionaryRef)v8);
  if (v9)
  {
    v10 = *DMCLogObjects();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12[0] = 67109120;
      v12[1] = v9;
      _os_log_impl(&dword_1A4951000, v10, OS_LOG_TYPE_ERROR, "Could not delete attestation metadata from keychain. Error: %d", (uint8_t *)v12, 8u);
    }
  }

  return v9 == 0;
}

@end
