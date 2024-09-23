@implementation MCKeychain

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
      MCErrorArray(CFSTR("KEYCHAIN_ERROR_CANNOT_CREATE_QUERY"), v19, v20, v21, v22, v23, v24, v25, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCKeychainErrorDomain"), 6002, v28, CFSTR("MCFatalError"));
      *a9 = (id)objc_claimAutoreleasedReturnValue();

    }
    Mutable = 0;
  }

  return Mutable;
}

+ (id)stringFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 useSystemKeychain:(BOOL)a7 outError:(id *)a8
{
  return (id)objc_msgSend(a1, "stringFromService:account:label:description:group:useSystemKeychain:outError:", a3, a4, a5, a6, 0, a7, a8);
}

+ (id)stringFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 useSystemKeychain:(BOOL)a8 outError:(id *)a9
{
  void *v9;
  void *v10;
  void *v11;

  +[MCKeychain dataFromService:account:label:description:group:useSystemKeychain:outError:](MCKeychain, "dataFromService:account:label:description:group:useSystemKeychain:outError:", a3, a4, a5, a6, a7, a8, a9);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", objc_msgSend(objc_retainAutorelease(v9), "bytes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)setString:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 useSystemKeychain:(BOOL)a8 outError:(id *)a9
{
  uint64_t v10;

  LOBYTE(v10) = a8;
  return objc_msgSend(a1, "setString:forService:account:label:description:group:useSystemKeychain:outError:", a3, a4, a5, a6, a7, 0, v10, a9);
}

+ (BOOL)setString:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 group:(id)a8 useSystemKeychain:(BOOL)a9 outError:(id *)a10
{
  uint64_t v11;

  LOWORD(v11) = a9;
  return objc_msgSend(a1, "setString:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:", a3, a4, a5, a6, a7, *MEMORY[0x1E0CD68B0], a8, v11, a10);
}

+ (BOOL)setString:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 access:(void *)a8 group:(id)a9 useSystemKeychain:(BOOL)a10 sysBound:(BOOL)a11 outError:(id *)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  BOOL v23;
  uint64_t v25;

  v17 = a9;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v25) = __PAIR16__(a11, a10);
  v23 = +[MCKeychain setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:](MCKeychain, "setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:", v22, v21, v20, v19, v18, a8, v17, v25, a12);

  return v23;
}

+ (BOOL)setData:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 useSystemKeychain:(BOOL)a8 outError:(id *)a9
{
  uint64_t v10;

  LOBYTE(v10) = a8;
  return objc_msgSend(a1, "setData:forService:account:label:description:access:useSystemKeychain:outError:", a3, a4, a5, a6, a7, *MEMORY[0x1E0CD68B0], v10, a9);
}

+ (BOOL)setData:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 access:(void *)a8 useSystemKeychain:(BOOL)a9 outError:(id *)a10
{
  uint64_t v11;

  LOWORD(v11) = a9;
  return objc_msgSend(a1, "setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:", a3, a4, a5, a6, a7, a8, 0, v11, a10);
}

+ (BOOL)setData:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 access:(void *)a8 group:(id)a9 useSystemKeychain:(BOOL)a10 sysBound:(BOOL)a11 outError:(id *)a12
{
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  BOOL v26;
  uint64_t v28;

  v17 = (void *)MEMORY[0x1E0D44770];
  v18 = a9;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  objc_msgSend(v17, "sharedConfiguration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "personaID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v28) = v25 != 0;
  LOWORD(v28) = __PAIR16__(a11, a10);
  v26 = +[MCKeychain setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:enforcePersonalPersona:outError:](MCKeychain, "setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:enforcePersonalPersona:outError:", v23, v22, v21, v20, v19, a8, v18, v28, a12);

  return v26;
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
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  BOOL v54;
  uint64_t v56;
  void *v57;
  _QWORD v58[4];
  id v59;
  id v60;
  __int128 *v61;
  void *v62;
  __CFDictionary *v63;
  id v64;
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  void *v68;
  __int128 v69;
  uint64_t v70;
  int v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a9;
  v57 = v19;
  if (objc_msgSend(v18, "length"))
  {
    v64 = 0;
    v31 = +[MCKeychain _newQueryWithService:account:label:description:group:useSystemKeychain:outError:](MCKeychain, "_newQueryWithService:account:label:description:group:useSystemKeychain:outError:", v19, v20, v21, v22, v23, a10, &v64);
    v32 = v64;
    if (v32)
    {
      v33 = v32;
      if (v31)
        CFRelease(v31);
      goto LABEL_17;
    }
    LOBYTE(v56) = a12;
    +[MCKeychain dataFromService:account:label:description:group:useSystemKeychain:enforcePersonalPersona:outError:](MCKeychain, "dataFromService:account:label:description:group:useSystemKeychain:enforcePersonalPersona:outError:", v19, v20, v21, v22, v23, a10, v56, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v69 = 0;
    *((_QWORD *)&v69 + 1) = &v69;
    v70 = 0x2020000000;
    v71 = 0;
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __131__MCKeychain_setData_forService_account_label_description_access_group_useSystemKeychain_sysBound_enforcePersonalPersona_outError___block_invoke;
    v58[3] = &unk_1E41E0990;
    v37 = v36;
    v59 = v37;
    v60 = v18;
    v61 = &v69;
    v62 = a8;
    v63 = v31;
    v38 = MEMORY[0x1A1AF040C](v58);
    v39 = (void *)v38;
    if (a12)
    {
      objc_msgSend(MEMORY[0x1E0D1C1F0], "performBlockUnderPersonalPersona:", v38);
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
      v40 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v66 = "+[MCKeychain setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:enforceP"
              "ersonalPersona:outError:]";
        v67 = 2112;
        v68 = v33;
        _os_log_impl(&dword_19ECC4000, v40, OS_LOG_TYPE_ERROR, "%s: Failed to execute the block under personal persona. Error: %@", buf, 0x16u);
      }
    }
    else if (*(_DWORD *)(*((_QWORD *)&v69 + 1) + 24))
    {
      v41 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), *(unsigned int *)(*((_QWORD *)&v69 + 1) + 24));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      MCErrorArray(CFSTR("KEYCHAIN_ERROR_CODE_P_CODE"), v43, v44, v45, v46, v47, v48, v49, v42);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCKeychainErrorDomain"), 6000, v50, CFSTR("MCFatalError"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v33 = 0;
    }

    _Block_object_dispose(&v69, 8);
  }
  else
  {
    v34 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("KEYCHAIN_ERROR_EMPTY_DATA"), v24, v25, v26, v27, v28, v29, v30, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCKeychainErrorDomain"), 6001, v35, CFSTR("MCFatalError"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!v33)
  {
    v54 = 1;
    goto LABEL_23;
  }
LABEL_17:
  if (a13)
    *a13 = objc_retainAutorelease(v33);
  v51 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    v52 = v51;
    objc_msgSend(v33, "MCVerboseDescription");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v69) = 138543362;
    *(_QWORD *)((char *)&v69 + 4) = v53;
    _os_log_impl(&dword_19ECC4000, v52, OS_LOG_TYPE_ERROR, "Failed to set data in keychain. Error: %{public}@", (uint8_t *)&v69, 0xCu);

  }
  v54 = 0;
LABEL_23:

  return v54;
}

void __131__MCKeychain_setData_forService_account_label_description_access_group_useSystemKeychain_sysBound_enforcePersonalPersona_outError___block_invoke(uint64_t a1)
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

+ (id)dataFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 useSystemKeychain:(BOOL)a7 outError:(id *)a8
{
  return (id)objc_msgSend(a1, "dataFromService:account:label:description:group:useSystemKeychain:outError:", a3, a4, a5, a6, 0, a7, a8);
}

+ (id)dataFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 useSystemKeychain:(BOOL)a8 outError:(id *)a9
{
  _BOOL8 v9;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;

  v9 = a8;
  v13 = (void *)MEMORY[0x1E0D44770];
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v13, "sharedConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "personaID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v22) = v19 != 0;
  +[MCKeychain dataFromService:account:label:description:group:useSystemKeychain:enforcePersonalPersona:outError:](MCKeychain, "dataFromService:account:label:description:group:useSystemKeychain:enforcePersonalPersona:outError:", v17, v16, v15, v14, 0, v9, v22, a9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
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
  void *v36;
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
  v53[1] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v46 = 0;
  v20 = +[MCKeychain _newQueryWithService:account:label:description:group:useSystemKeychain:outError:](MCKeychain, "_newQueryWithService:account:label:description:group:useSystemKeychain:outError:", v15, v16, v17, v18, v19, v10, &v46);
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
    v41[2] = __112__MCKeychain_dataFromService_account_label_description_group_useSystemKeychain_enforcePersonalPersona_outError___block_invoke;
    v41[3] = &unk_1E41E09B8;
    v41[5] = &v51;
    v41[6] = v20;
    v41[4] = &v42;
    objc_msgSend(MEMORY[0x1E0D1C1F0], "performBlockUnderPersonalPersona:", v41);
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
    v24 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "+[MCKeychain dataFromService:account:label:description:group:useSystemKeychain:enforcePersonalPersona:outError:]";
      v49 = 2112;
      v50 = v22;
      _os_log_impl(&dword_19ECC4000, v24, OS_LOG_TYPE_ERROR, "%s: Failed to execute the block under personal persona. Error: %@", buf, 0x16u);
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
    MCErrorArray(CFSTR("KEYCHAIN_ERROR_CODE_P_CODE"), v28, v29, v30, v31, v32, v33, v34, v27);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCKeychainErrorDomain"), 6000, v35, CFSTR("MCFatalError"));
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
  v36 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    v37 = v36;
    objc_msgSend(v22, "MCVerboseDescription");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v51) = 138543362;
    *(_QWORD *)((char *)&v51 + 4) = v38;
    _os_log_impl(&dword_19ECC4000, v37, OS_LOG_TYPE_ERROR, "Cannot retrieve item from keychain. Error: %{public}@", (uint8_t *)&v51, 0xCu);

  }
  v39 = 0;
LABEL_21:

  return v39;
}

uint64_t __112__MCKeychain_dataFromService_account_label_description_group_useSystemKeychain_enforcePersonalPersona_outError___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = SecItemCopyMatching(*(CFDictionaryRef *)(a1 + 48), (CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (void)removeItemForService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 useSystemKeychain:(BOOL)a7 group:(id)a8
{
  _BOOL8 v8;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;

  v8 = a7;
  v13 = (void *)MEMORY[0x1E0D44770];
  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  objc_msgSend(v13, "sharedConfiguration");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "personaID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCKeychain removeItemForService:account:label:description:useSystemKeychain:enforcePersonalPersona:group:](MCKeychain, "removeItemForService:account:label:description:useSystemKeychain:enforcePersonalPersona:group:", v18, v17, v16, v15, v8, v19 != 0, v14);

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
  v10 = +[MCKeychain _newQueryWithService:account:label:description:group:useSystemKeychain:outError:](MCKeychain, "_newQueryWithService:account:label:description:group:useSystemKeychain:outError:", a3, a4, a5, a6, a9, a7, 0);
  if (v10)
  {
    v11 = v10;
    if (a8)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __108__MCKeychain_removeItemForService_account_label_description_useSystemKeychain_enforcePersonalPersona_group___block_invoke;
      v15[3] = &__block_descriptor_40_e5_v8__0l;
      v15[4] = v10;
      objc_msgSend(MEMORY[0x1E0D1C1F0], "performBlockUnderPersonalPersona:", v15);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        v14 = _MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v17 = "+[MCKeychain removeItemForService:account:label:description:useSystemKeychain:enforcePersonalPersona:group:]";
          v18 = 2112;
          v19 = v13;
          _os_log_impl(&dword_19ECC4000, v14, OS_LOG_TYPE_ERROR, "%s: Failed to execute the block under personal persona. Error: %@", buf, 0x16u);
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

uint64_t __108__MCKeychain_removeItemForService_account_label_description_useSystemKeychain_enforcePersonalPersona_group___block_invoke(uint64_t a1)
{
  return SecItemDelete(*(CFDictionaryRef *)(a1 + 32));
}

+ (void)copyItemWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0D44770];
  v6 = a3;
  objc_msgSend(v5, "sharedConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "personaID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[MCKeychain copyItemWithPersistentID:useSystemKeychain:enforcePersonalPersona:](MCKeychain, "copyItemWithPersistentID:useSystemKeychain:enforcePersonalPersona:", v6, v4, v8 != 0);

  return v9;
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
  void *v12;
  NSObject *v13;
  OSStatus v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  CFTypeRef v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  _QWORD v35[2];
  _QWORD v36[3];

  v5 = a5;
  v6 = a4;
  v36[2] = *MEMORY[0x1E0C80C00];
  v7 = (char *)a3;
  v8 = *MEMORY[0x1E0CD7028];
  v35[0] = *MEMORY[0x1E0CD70E0];
  v35[1] = v8;
  v36[0] = v7;
  v36[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (v6)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD70C0]);
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  if (!v5)
  {
    v14 = SecItemCopyMatching((CFDictionaryRef)v10, &v30);
    *((_DWORD *)v24 + 6) = v14;
    goto LABEL_10;
  }
  v11 = (void *)MEMORY[0x1E0D1C1F0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __80__MCKeychain_copyItemWithPersistentID_useSystemKeychain_enforcePersonalPersona___block_invoke;
  v19[3] = &unk_1E41E0A00;
  v21 = &v23;
  v20 = v10;
  v22 = &v27;
  objc_msgSend(v11, "performBlockUnderPersonalPersona:", v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v14 = *((_DWORD *)v24 + 6);
LABEL_10:
    if (v14 == -25300)
    {
      v17 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543618;
        v32 = v7;
        v33 = 1024;
        LODWORD(v34) = v6;
        _os_log_impl(&dword_19ECC4000, v17, OS_LOG_TYPE_DEBUG, "Couldn't get item with ID: %{public}@ system keychain: %d", buf, 0x12u);
      }
    }
    else if (v14)
    {
      v15 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v32 = v7;
        _os_log_impl(&dword_19ECC4000, v15, OS_LOG_TYPE_ERROR, "Cannot retrieve item with persistent ID %{public}@", buf, 0xCu);
      }
      goto LABEL_14;
    }
    v16 = (void *)v28[3];
    goto LABEL_18;
  }
  v13 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v32 = "+[MCKeychain copyItemWithPersistentID:useSystemKeychain:enforcePersonalPersona:]";
    v33 = 2112;
    v34 = v12;
    _os_log_impl(&dword_19ECC4000, v13, OS_LOG_TYPE_ERROR, "%s: Failed to execute the block under personal persona. Error: %@", buf, 0x16u);
  }

LABEL_14:
  v16 = 0;
LABEL_18:
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v16;
}

uint64_t __80__MCKeychain_copyItemWithPersistentID_useSystemKeychain_enforcePersonalPersona___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = SecItemCopyMatching(*(CFDictionaryRef *)(a1 + 32), (CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (__SecCertificate)copyCertificateWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  __SecCertificate *v9;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0D44770];
  v6 = a3;
  objc_msgSend(v5, "sharedConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "personaID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[MCKeychain copyCertificateWithPersistentID:useSystemKeychain:enforcePersonalPersona:](MCKeychain, "copyCertificateWithPersistentID:useSystemKeychain:enforcePersonalPersona:", v6, v4, v8 != 0);

  return v9;
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
          v20[2] = __87__MCKeychain_copyCertificateWithPersistentID_useSystemKeychain_enforcePersonalPersona___block_invoke;
          v20[3] = &unk_1E41E0A28;
          v20[4] = &v21;
          v20[5] = v10;
          objc_msgSend(MEMORY[0x1E0D1C1F0], "performBlockUnderPersonalPersona:", v20);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = _MCLogObjects;
            if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v26 = "+[MCKeychain copyCertificateWithPersistentID:useSystemKeychain:enforcePersonalPersona:]";
              v27 = 2112;
              v28 = v13;
              _os_log_impl(&dword_19ECC4000, v14, OS_LOG_TYPE_ERROR, "%s: Failed to execute the block under personal persona. Error: %@", buf, 0x16u);
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
        v15 = (id)_MCLogObjects;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = CFGetTypeID(v10);
          v17 = (__CFString *)CFCopyTypeIDDescription(v16);
          *(_DWORD *)buf = 138543618;
          v26 = v8;
          v27 = 2114;
          v28 = v17;
          _os_log_impl(&dword_19ECC4000, v15, OS_LOG_TYPE_ERROR, "Certificate with persistent ID: %{public}@ has unexpected type: %{public}@", buf, 0x16u);

        }
        CFRelease(v10);
      }
    }
  }
  v18 = v22[3];
  _Block_object_dispose(&v21, 8);

  return v18;
}

uint64_t __87__MCKeychain_copyCertificateWithPersistentID_useSystemKeychain_enforcePersonalPersona___block_invoke(uint64_t a1)
{
  return SecIdentityCopyCertificate(*(SecIdentityRef *)(a1 + 40), (SecCertificateRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

+ (id)copyCertificatesWithPersistentIDs:(id)a3 useSystemKeychain:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __SecCertificate *v13;
  __SecCertificate *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = +[MCKeychain copyCertificateWithPersistentID:useSystemKeychain:](MCKeychain, "copyCertificateWithPersistentID:useSystemKeychain:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12), v4, (_QWORD)v17);
          if (!v13)
          {

            v15 = 0;
            goto LABEL_14;
          }
          v14 = v13;
          objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v10)
          continue;
        break;
      }
    }

  }
  else
  {
    v7 = 0;
  }
  v7 = v7;
  v15 = v7;
LABEL_14:

  return v15;
}

+ (__SecIdentity)copyIdentityWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  __SecIdentity *v9;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0D44770];
  v6 = a3;
  objc_msgSend(v5, "sharedConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "personaID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[MCKeychain copyIdentityWithPersistentID:useSystemKeychain:enforcePersonalPersona:](MCKeychain, "copyIdentityWithPersistentID:useSystemKeychain:enforcePersonalPersona:", v6, v4, v8 != 0);

  return v9;
}

+ (__SecIdentity)copyIdentityWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4 enforcePersonalPersona:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  const void *v9;
  const void *v10;
  CFTypeID v11;
  void *v12;
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
      v12 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v13 = v12;
        v14 = CFGetTypeID(v10);
        v15 = (__CFString *)CFCopyTypeIDDescription(v14);
        v17 = 138543618;
        v18 = v8;
        v19 = 2114;
        v20 = v15;
        _os_log_impl(&dword_19ECC4000, v13, OS_LOG_TYPE_ERROR, "Identity with persistent ID: %{public}@ has unexpected type: %{public}@", (uint8_t *)&v17, 0x16u);

      }
      CFRelease(v10);
      v10 = 0;
    }
  }

  return (__SecIdentity *)v10;
}

+ (id)saveItem:(void *)a3 withLabel:(id)a4 group:(id)a5 useSystemKeychain:(BOOL)a6
{
  _BOOL8 v6;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a6;
  v9 = (void *)MEMORY[0x1E0D44770];
  v10 = a5;
  v11 = a4;
  objc_msgSend(v9, "sharedConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "personaID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCKeychain saveItem:withLabel:group:useSystemKeychain:enforcePersonalPersona:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:enforcePersonalPersona:", a3, v11, v10, v6, v13 != 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)saveItem:(void *)a3 withLabel:(id)a4 group:(id)a5 useSystemKeychain:(BOOL)a6 accessibility:(__CFString *)a7
{
  _BOOL8 v8;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a6;
  v11 = (void *)MEMORY[0x1E0D44770];
  v12 = a5;
  v13 = a4;
  objc_msgSend(v11, "sharedConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "personaID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCKeychain saveItem:withLabel:group:useSystemKeychain:enforcePersonalPersona:accessibility:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:enforcePersonalPersona:accessibility:", a3, v13, v12, v8, v15 != 0, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)saveItem:(void *)a3 withLabel:(id)a4 group:(id)a5 useSystemKeychain:(BOOL)a6 enforcePersonalPersona:(BOOL)a7
{
  _BOOL8 v7;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a6;
  v10 = (void *)MEMORY[0x1E0D44770];
  v11 = a5;
  v12 = a4;
  objc_msgSend(v10, "sharedConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "personaID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCKeychain saveItem:withLabel:group:useSystemKeychain:enforcePersonalPersona:accessibility:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:enforcePersonalPersona:accessibility:", a3, v12, v11, v7, v14 != 0, *MEMORY[0x1E0CD68D0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)saveItem:(void *)a3 withLabel:(id)a4 group:(id)a5 useSystemKeychain:(BOOL)a6 enforcePersonalPersona:(BOOL)a7 accessibility:(__CFString *)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  int v25;
  id v26;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  int v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  void *v49;
  _QWORD v50[4];
  _QWORD v51[5];

  v9 = a7;
  v10 = a6;
  v51[4] = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = *MEMORY[0x1E0CD6898];
  v50[0] = *MEMORY[0x1E0CD70E8];
  v50[1] = v15;
  v51[0] = a3;
  v51[1] = v14;
  v16 = *MEMORY[0x1E0CD68A0];
  v50[2] = *MEMORY[0x1E0CD7020];
  v50[3] = v16;
  v51[2] = MEMORY[0x1E0C9AAB0];
  v51[3] = a8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  if (v10)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD70C0]);
  if (v13)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CD6A90]);
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy_;
  v40 = __Block_byref_object_dispose_;
  v41 = 0;
  v28 = MEMORY[0x1E0C809B0];
  v29 = 3221225472;
  v30 = __94__MCKeychain_saveItem_withLabel_group_useSystemKeychain_enforcePersonalPersona_accessibility___block_invoke;
  v31 = &unk_1E41E0A50;
  v33 = &v42;
  v19 = v18;
  v34 = &v36;
  v35 = 0;
  v32 = v19;
  v20 = MEMORY[0x1A1AF040C](&v28);
  v21 = (void *)v20;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D1C1F0], "performBlockUnderPersonalPersona:", v20, v28, v29, v30, v31);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v47 = "+[MCKeychain saveItem:withLabel:group:useSystemKeychain:enforcePersonalPersona:accessibility:]";
        v48 = 2112;
        v49 = v22;
        _os_log_impl(&dword_19ECC4000, v23, OS_LOG_TYPE_ERROR, "%s: Failed to execute the block under personal persona. Error: %@", buf, 0x16u);
      }

      goto LABEL_14;
    }
  }
  else
  {
    (*(void (**)(uint64_t))(v20 + 16))(v20);
  }
  if (!*((_DWORD *)v43 + 6))
  {
    v26 = (id)v37[5];
    goto LABEL_16;
  }
  v24 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    v25 = *((_DWORD *)v43 + 6);
    *(_DWORD *)buf = 67109120;
    LODWORD(v47) = v25;
    _os_log_impl(&dword_19ECC4000, v24, OS_LOG_TYPE_ERROR, "Could not store certificate in keychain. Error: %d", buf, 8u);
  }
LABEL_14:
  v26 = 0;
LABEL_16:

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v26;
}

void __94__MCKeychain_saveItem_withLabel_group_useSystemKeychain_enforcePersonalPersona_accessibility___block_invoke(uint64_t a1)
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

+ (void)removeItemWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0D44770];
  v6 = a3;
  objc_msgSend(v5, "sharedConfiguration");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "personaID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCKeychain removeItemWithPersistentID:useSystemKeychain:enforcePersonalPersona:](MCKeychain, "removeItemWithPersistentID:useSystemKeychain:enforcePersonalPersona:", v6, v4, v7 != 0);

}

+ (void)removeItemWithPersistentID:(id)a3 useSystemKeychain:(BOOL)a4 enforcePersonalPersona:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;
  _QWORD v31[4];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  _QWORD v36[2];
  _QWORD v37[3];

  v5 = a5;
  v6 = a4;
  v37[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = *MEMORY[0x1E0CD7010];
  v36[0] = *MEMORY[0x1E0CD70E0];
  v36[1] = v8;
  v37[0] = v7;
  v37[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (v6)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD70C0]);
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __82__MCKeychain_removeItemWithPersistentID_useSystemKeychain_enforcePersonalPersona___block_invoke;
  v22 = &unk_1E41E0A78;
  v11 = v10;
  v23 = v11;
  v25 = v31;
  v26 = &v27;
  v12 = v7;
  v24 = v12;
  v13 = MEMORY[0x1A1AF040C](&v19);
  v14 = (void *)v13;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D1C1F0], "performBlockUnderPersonalPersona:", v13, v19, v20, v21, v22, v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v33 = "+[MCKeychain removeItemWithPersistentID:useSystemKeychain:enforcePersonalPersona:]";
        v34 = 2112;
        v35 = v15;
        _os_log_impl(&dword_19ECC4000, v16, OS_LOG_TYPE_ERROR, "%s: Failed to execute the block under personal persona. Error: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    (*(void (**)(uint64_t))(v13 + 16))(v13);
    v15 = 0;
  }
  v17 = *((_DWORD *)v28 + 6);
  if (v17 != -25300)
  {
    if (v17)
    {
      v18 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v33 = (const char *)v12;
        _os_log_impl(&dword_19ECC4000, v18, OS_LOG_TYPE_ERROR, "Could not remove identity or certificate with persistent id %{public}@ - error ignored.", buf, 0xCu);
      }
    }
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(v31, 8);

}

void __82__MCKeychain_removeItemWithPersistentID_useSystemKeychain_enforcePersonalPersona___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!SecItemCopyMatching(*(CFDictionaryRef *)(a1 + 32), (CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)))
  {
    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6898]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lockdown-identities")) & 1) != 0)
    {
      v4 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v5 = *(_QWORD *)(a1 + 40);
        v6 = 138543362;
        v7 = v5;
        _os_log_impl(&dword_19ECC4000, v4, OS_LOG_TYPE_ERROR, "Didn't remove lockdown identity with persistent id %{public}@", (uint8_t *)&v6, 0xCu);
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0CD7010]);
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = SecItemDelete(*(CFDictionaryRef *)(a1 + 32));
    }

  }
}

+ (BOOL)itemExistsInKeychain:(void *)a3 useSystemKeychain:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0D44770], "sharedConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "personaID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = +[MCKeychain itemExistsInKeychain:useSystemKeychain:enforcePersonalPersona:](MCKeychain, "itemExistsInKeychain:useSystemKeychain:enforcePersonalPersona:", a3, v4, v7 != 0);

  return v4;
}

+ (BOOL)itemExistsInKeychain:(void *)a3 useSystemKeychain:(BOOL)a4 enforcePersonalPersona:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  BOOL v13;
  OSStatus v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;
  CFTypeRef result;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v5 = a5;
  v6 = a4;
  v30[2] = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0CD7020];
  v29[0] = *MEMORY[0x1E0CD70E8];
  v29[1] = v7;
  v30[0] = a3;
  v30[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (v6)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD70C0]);
  result = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  if (!v5)
  {
    v14 = SecItemCopyMatching((CFDictionaryRef)v9, &result);
    *((_DWORD *)v21 + 6) = v14;
    if (result)
      CFRelease(result);
    goto LABEL_10;
  }
  v10 = (void *)MEMORY[0x1E0D1C1F0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__MCKeychain_itemExistsInKeychain_useSystemKeychain_enforcePersonalPersona___block_invoke;
  v16[3] = &unk_1E41E0AA0;
  v18 = &v20;
  v17 = v9;
  v19 = 0;
  objc_msgSend(v10, "performBlockUnderPersonalPersona:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_10:
    v13 = *((_DWORD *)v21 + 6) == 0;
    goto LABEL_11;
  }
  v12 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "+[MCKeychain itemExistsInKeychain:useSystemKeychain:enforcePersonalPersona:]";
    v27 = 2112;
    v28 = v11;
    _os_log_impl(&dword_19ECC4000, v12, OS_LOG_TYPE_ERROR, "%s: Failed to execute the block under personal persona. Error: %@", buf, 0x16u);
  }

  v13 = 0;
LABEL_11:
  _Block_object_dispose(&v20, 8);

  return v13;
}

uint64_t __76__MCKeychain_itemExistsInKeychain_useSystemKeychain_enforcePersonalPersona___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = SecItemCopyMatching(*(CFDictionaryRef *)(a1 + 32), (CFTypeRef *)(a1 + 48));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (id)stringFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 outError:(id *)a7
{
  return +[MCKeychain stringFromService:account:label:description:useSystemKeychain:outError:](MCKeychain, "stringFromService:account:label:description:useSystemKeychain:outError:", a3, a4, a5, a6, 0, a7);
}

+ (id)stringFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 outError:(id *)a8
{
  return +[MCKeychain stringFromService:account:label:description:group:useSystemKeychain:outError:](MCKeychain, "stringFromService:account:label:description:group:useSystemKeychain:outError:", a3, a4, a5, a6, a7, 0, a8);
}

+ (BOOL)setString:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 group:(id)a8 outError:(id *)a9
{
  uint64_t v10;

  LOBYTE(v10) = 0;
  return +[MCKeychain setString:forService:account:label:description:group:useSystemKeychain:outError:](MCKeychain, "setString:forService:account:label:description:group:useSystemKeychain:outError:", a3, a4, a5, a6, a7, a8, v10, a9);
}

+ (BOOL)setString:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 access:(void *)a8 group:(id)a9 outError:(id *)a10
{
  uint64_t v11;

  LOWORD(v11) = 0;
  return +[MCKeychain setString:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:](MCKeychain, "setString:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:", a3, a4, a5, a6, a7, a8, a9, v11, a10);
}

+ (BOOL)setString:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 outError:(id *)a8
{
  return +[MCKeychain setString:forService:account:label:description:useSystemKeychain:outError:](MCKeychain, "setString:forService:account:label:description:useSystemKeychain:outError:", a3, a4, a5, a6, a7, 0, a8);
}

+ (id)dataFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 outError:(id *)a7
{
  return +[MCKeychain dataFromService:account:label:description:useSystemKeychain:outError:](MCKeychain, "dataFromService:account:label:description:useSystemKeychain:outError:", a3, a4, a5, a6, 0, a7);
}

+ (id)dataFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 outError:(id *)a8
{
  return +[MCKeychain dataFromService:account:label:description:group:useSystemKeychain:outError:](MCKeychain, "dataFromService:account:label:description:group:useSystemKeychain:outError:", a3, a4, a5, a6, a7, 0, a8);
}

+ (BOOL)setData:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 outError:(id *)a8
{
  return +[MCKeychain setData:forService:account:label:description:useSystemKeychain:outError:](MCKeychain, "setData:forService:account:label:description:useSystemKeychain:outError:", a3, a4, a5, a6, a7, 0, a8);
}

+ (BOOL)setData:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 access:(void *)a8 outError:(id *)a9
{
  uint64_t v10;

  LOBYTE(v10) = 0;
  return +[MCKeychain setData:forService:account:label:description:access:useSystemKeychain:outError:](MCKeychain, "setData:forService:account:label:description:access:useSystemKeychain:outError:", a3, a4, a5, a6, a7, a8, v10, a9);
}

+ (BOOL)setData:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 access:(void *)a8 group:(id)a9 outError:(id *)a10
{
  uint64_t v11;

  LOWORD(v11) = 0;
  return +[MCKeychain setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:](MCKeychain, "setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:", a3, a4, a5, a6, a7, a8, a9, v11, a10);
}

+ (void)removeItemForService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7
{
  +[MCKeychain removeItemForService:account:label:description:useSystemKeychain:group:](MCKeychain, "removeItemForService:account:label:description:useSystemKeychain:group:", a3, a4, a5, a6, 0, a7);
}

+ (void)copyItemWithPersistentID:(id)a3
{
  return +[MCKeychain copyItemWithPersistentID:useSystemKeychain:](MCKeychain, "copyItemWithPersistentID:useSystemKeychain:", a3, 0);
}

+ (__SecCertificate)copyCertificateWithPersistentID:(id)a3
{
  return +[MCKeychain copyCertificateWithPersistentID:useSystemKeychain:](MCKeychain, "copyCertificateWithPersistentID:useSystemKeychain:", a3, 0);
}

+ (__SecIdentity)copyIdentityWithPersistentID:(id)a3
{
  return +[MCKeychain copyIdentityWithPersistentID:useSystemKeychain:](MCKeychain, "copyIdentityWithPersistentID:useSystemKeychain:", a3, 0);
}

+ (id)saveItem:(void *)a3 withLabel:(id)a4 group:(id)a5
{
  return +[MCKeychain saveItem:withLabel:group:useSystemKeychain:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:", a3, a4, a5, 0);
}

+ (void)removeItemWithPersistentID:(id)a3
{
  +[MCKeychain removeItemWithPersistentID:useSystemKeychain:](MCKeychain, "removeItemWithPersistentID:useSystemKeychain:", a3, 0);
}

+ (BOOL)itemExistsInKeychain:(void *)a3
{
  return +[MCKeychain itemExistsInKeychain:useSystemKeychain:](MCKeychain, "itemExistsInKeychain:useSystemKeychain:", a3, 0);
}

+ (id)canonicalPersistentReferenceForItemWithPersistentReference:(id)a3 inSystemKeychain:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  OSStatus v9;
  void *v10;
  OSStatus v11;
  NSObject *v12;
  id v13;
  int v14;
  uint64_t v15;
  _BOOL4 v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  CFTypeRef result;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v4 = a4;
  v27[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *MEMORY[0x1E0CD7020];
  v26[0] = *MEMORY[0x1E0CD70E0];
  v26[1] = v6;
  v27[0] = v5;
  v27[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (v4)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD70C0]);
  result = 0;
  v9 = SecItemCopyMatching((CFDictionaryRef)v8, &result);
  v10 = (void *)result;
  if (!v9)
  {
    v14 = objc_msgSend((id)result, "isEqualToData:", v5);
    v15 = _MCLogObjects;
    v16 = os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        *(_DWORD *)buf = 138543362;
        v23 = v5;
        v17 = "Persistent reference %{public}@ is canonical!";
        v18 = v15;
        v19 = 12;
LABEL_12:
        _os_log_impl(&dword_19ECC4000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
      }
    }
    else if (v16)
    {
      *(_DWORD *)buf = 138543618;
      v23 = v5;
      v24 = 2114;
      v25 = v10;
      v17 = "Persistent reference %{public}@ has canonical reference %{public}@";
      v18 = v15;
      v19 = 22;
      goto LABEL_12;
    }
    v13 = v10;
    goto LABEL_14;
  }
  v11 = v9;
  v12 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v23 = v5;
    v24 = 1024;
    LODWORD(v25) = v11;
    _os_log_impl(&dword_19ECC4000, v12, OS_LOG_TYPE_ERROR, "Unable to lookup item with persistent reference: %{public}@. Error: %d", buf, 0x12u);
  }
  v13 = 0;
LABEL_14:

  return v13;
}

@end
