BOOL amfi_developer_mode_status()
{
  uint64_t v2;
  size_t v3;

  v2 = 0;
  v3 = 8;
  return !sysctlbyname("security.mac.amfi.developer_mode_status", &v2, &v3, 0, 0) && v2 == 1;
}

uint64_t AMFIExecutionPreflight(void *a1, int a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  AMFIError *v17;
  NSObject *v18;
  AMFIPathValidator_ios *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  AMFIError *v24;
  AMFIError *v25;
  BOOL v26;
  AMFIError *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  AMFIError *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  AMFIError *v44;
  int v45;
  AMFIPathValidator_ios *v46;
  uint64_t v47;
  uint64_t v48;
  AMFIError *v49;
  NSObject *v50;
  uint64_t v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  _QWORD *v61;
  _BYTE buf[12];
  __int16 v63;
  id v64;
  __int16 v65;
  id v66;
  __int16 v67;
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a3;
  if ((a2 - 2) < 4 || a2 == 11)
  {
    v9 = v7;
    v10 = v8;
    v11 = v10;
    v60 = v8;
    v61 = a4;
    v59 = v9;
    if (!v10 || !objc_msgSend(v10, "count"))
    {
      v19 = -[AMFIPathValidator_ios initWithURL:]([AMFIPathValidator_ios alloc], "initWithURL:", v9);
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      goto LABEL_12;
    }
    v12 = v9;
    v58 = v11;
    objc_msgSend(v58, "objectForKey:", CFSTR("sliceOffset"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v14 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = objc_retainAutorelease(v15);

    v57 = v12;
    if (v14 && !v16)
    {
      v17 = -[AMFIError initWithAMFIErrorCode:withURL:]([AMFIError alloc], "initWithAMFIErrorCode:withURL:", -404, v12);
      +[AMFIFMKLog generic](AMFIFMKLog, "generic");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        AMFIExecutionPreflight_cold_4();
      goto LABEL_50;
    }
    objc_msgSend(v58, "objectForKey:", CFSTR("cpuType"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v14 = v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v33 = v14;
    else
      v33 = 0;
    v34 = objc_retainAutorelease(v33);

    if (v14 && !v34)
    {
      v17 = -[AMFIError initWithAMFIErrorCode:withURL:]([AMFIError alloc], "initWithAMFIErrorCode:withURL:", -404, v12);
      +[AMFIFMKLog generic](AMFIFMKLog, "generic");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        AMFIExecutionPreflight_cold_5();
      goto LABEL_50;
    }
    v56 = v34;
    objc_msgSend(v58, "objectForKey:", CFSTR("cpuSubType"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v36 = v35;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v37 = v36;
    else
      v37 = 0;
    v38 = objc_retainAutorelease(v37);

    if (v36 && !v56)
    {
      v17 = -[AMFIError initWithAMFIErrorCode:withURL:]([AMFIError alloc], "initWithAMFIErrorCode:withURL:", -404, v57);
      +[AMFIFMKLog generic](AMFIFMKLog, "generic");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        AMFIExecutionPreflight_cold_6();
      v14 = v36;
      goto LABEL_50;
    }
    v55 = v38;
    objc_msgSend(v58, "objectForKey:", CFSTR("flags"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v40 = v39;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v41 = v40;
    else
      v41 = 0;
    v42 = objc_retainAutorelease(v41);

    if (v40)
    {
      v43 = v56;
      if (!v56)
      {
        v17 = -[AMFIError initWithAMFIErrorCode:withURL:]([AMFIError alloc], "initWithAMFIErrorCode:withURL:", -404, v57);
        +[AMFIFMKLog generic](AMFIFMKLog, "generic");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          AMFIExecutionPreflight_cold_7();
LABEL_49:
        v14 = v40;
LABEL_50:
        v40 = v14;

        v44 = objc_retainAutorelease(v17);
        v16 = 0;
        v14 = 0;
        v36 = 0;
        v42 = 0;
        v45 = 0;
LABEL_51:

        v20 = v16;
        v21 = v14;
        v22 = v36;
        v23 = v42;
        v24 = v44;
        if (!v45)
          goto LABEL_59;
        if (v20)
        {
          v46 = [AMFIPathValidator_ios alloc];
          v47 = objc_msgSend(v20, "unsignedLongLongValue");
          if (v23)
            v48 = -[AMFIPathValidator_ios initWithURL:withFileOffset:withFlags:](v46, "initWithURL:withFileOffset:withFlags:", v57, v47, objc_msgSend(v23, "intValue"));
          else
            v48 = -[AMFIPathValidator_ios initWithURL:withFileOffset:](v46, "initWithURL:withFileOffset:", v57, v47);
          v19 = (AMFIPathValidator_ios *)v48;
LABEL_12:
          v25 = v24;
          *(_QWORD *)buf = v24;
          v26 = -[AMFIPathValidator_ios validateWithError:](v19, "validateWithError:", buf);
          v24 = (AMFIError *)*(id *)buf;

          if (v26)
          {
            v27 = 0;
            v28 = 1;
            v29 = v59;
            goto LABEL_60;
          }
LABEL_59:
          v29 = v59;
          v24 = objc_retainAutorelease(v24);
          v28 = 0;
          v27 = v24;
LABEL_60:

          v31 = v27;
          v8 = v60;
          a4 = v61;
          if (!v61)
            goto LABEL_63;
          goto LABEL_61;
        }
        if (v21)
        {
          v49 = -[AMFIError initWithAMFIErrorCode:withURL:]([AMFIError alloc], "initWithAMFIErrorCode:withURL:", -404, v57);

          +[AMFIFMKLog generic](AMFIFMKLog, "generic");
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            AMFIExecutionPreflight_cold_2();
        }
        else
        {
          if (v23)
          {
            v19 = -[AMFIPathValidator_ios initWithURL:withFlags:]([AMFIPathValidator_ios alloc], "initWithURL:withFlags:", v57, objc_msgSend(v23, "intValue"));
            v20 = 0;
            v21 = 0;
            goto LABEL_12;
          }
          v49 = -[AMFIError initWithAMFIErrorCode:withURL:]([AMFIError alloc], "initWithAMFIErrorCode:withURL:", -404, v57);

          +[AMFIFMKLog generic](AMFIFMKLog, "generic");
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            AMFIExecutionPreflight_cold_2();
          v23 = 0;
        }

        v20 = 0;
        v24 = v49;
        goto LABEL_59;
      }
    }
    else
    {
      v43 = v56;
      if (!v56)
      {
        if (!v55)
        {
          v14 = 0;
          v36 = 0;
          v44 = 0;
          v40 = 0;
          goto LABEL_45;
        }
LABEL_47:
        v17 = -[AMFIError initWithAMFIErrorCode:withURL:]([AMFIError alloc], "initWithAMFIErrorCode:withURL:", -404, v57);
        +[AMFIFMKLog generic](AMFIFMKLog, "generic");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v57, "path");
          v52 = objc_claimAutoreleasedReturnValue();
          v53 = v43;
          v54 = (void *)v52;
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = v53;
          v63 = 2112;
          v64 = v55;
          v65 = 2112;
          v66 = v16;
          v67 = 2112;
          v68 = v52;
          _os_log_error_impl(&dword_1DF2FC000, v18, OS_LOG_TYPE_ERROR, "Invalid options combination cpuType: (%@) cpuSubType: (%@) sliceOffset: (%@) for: %@", buf, 0x2Au);

        }
        goto LABEL_49;
      }
    }
    if (v55 && !v16)
    {
      v44 = 0;
LABEL_45:
      v45 = 1;
      goto LABEL_51;
    }
    goto LABEL_47;
  }
  +[AMFIFMKLog generic](AMFIFMKLog, "generic");
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    AMFIExecutionPreflight_cold_1(v7, a2, v30);

  v31 = -[AMFIError initWithAMFIErrorCode:withURL:]([AMFIError alloc], "initWithAMFIErrorCode:withURL:", -403, v7);
  v28 = 0;
  if (a4)
  {
LABEL_61:
    if ((v28 & 1) == 0)
      *a4 = objc_retainAutorelease(v31);
  }
LABEL_63:

  return v28;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_3(uint64_t a1, uint64_t a2)
{
  return a2;
}

id hexStringForData(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  char *v7;
  int v8;
  void *v9;

  v1 = a1;
  v2 = v1;
  if (v1
    && (v3 = objc_msgSend(v1, "length"),
        v4 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v2), "bytes"),
        (v5 = malloc_type_calloc((2 * v3) | 1, 1uLL, 0x56FDA653uLL)) != 0))
  {
    v6 = v5;
    if (v3)
    {
      v7 = (char *)v5;
      do
      {
        v8 = *v4++;
        sprintf(v7, "%2.2x", v8);
        v7 += 2;
        --v3;
      }
      while (v3);
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    free(v6);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t NSErrorToAMFIReturn(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "domain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AppleMobileFileIntegrityError"));

    if (v4)
    {
      v5 = objc_msgSend(v2, "code");
      v6 = 7;
      switch(v5)
      {
        case -409:
          v6 = 13;
          break;
        case -408:
          v6 = 8;
          break;
        case -407:
          v6 = 12;
          break;
        case -406:
          break;
        default:
          if (v5 == -440)
            v6 = 14;
          else
            v6 = 1;
          break;
      }
    }
    else
    {
      objc_msgSend(v2, "domain");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

      if (v8)
        v6 = 9;
      else
        v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t matchIn(uint64_t a1, char *__s2)
{
  const char *v2;
  uint64_t i;
  size_t v5;

  v2 = *(const char **)(a1 + 8);
  if (!v2)
    return 0;
  for (i = a1; *(_BYTE *)i; i += 16)
  {
    v5 = strlen(v2);
    if (!strncmp(v2, __s2, v5))
      return 1;
LABEL_7:
    v2 = *(const char **)(i + 24);
    if (!v2)
      return 0;
  }
  if (strcmp(v2, __s2))
    goto LABEL_7;
  return 1;
}

CFIndex AMFICopySwiftPlaygroundsSigningKey(__SecKey **a1)
{
  uint64_t v2;
  __SecKey *v3;
  NSObject *v4;
  CFIndex Code;
  __CFDictionary *Mutable;
  __CFDictionary *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *ValueAtIndex;
  NSObject *v20;
  CFTypeID v21;
  CFTypeID TypeID;
  const __CFArray *v23;
  CFIndex Count;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CFTypeID v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  const __CFAllocator *v37;
  CFNumberRef v38;
  CFNumberRef v39;
  SecAccessControlRef v40;
  SecAccessControlRef v41;
  CFNumberRef v42;
  __CFDictionary *v43;
  __CFDictionary *v44;
  const void *v45;
  SecKeyRef RandomKey;
  SecKeyRef v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  SecKeyRef v59;
  SecKeyRef v60;
  uint64_t v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  CFIndex Length;
  const UInt8 *BytePtr;
  NSObject *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  __CFError *v80;
  const __CFString *v81;
  const char *CStringPtr;
  NSObject *v83;
  NSObject *v84;
  NSObject *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint8_t v92[12];
  int v93;
  uint8_t valuePtr[16];
  uint8_t buf[8];

  v2 = SecKeyCopySystemKey();
  if (v2)
  {
    v3 = (__SecKey *)v2;
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DF2FC000, v4, OS_LOG_TYPE_DEFAULT, "found local signing key as a system key", buf, 2u);
    }

    goto LABEL_5;
  }
  *(_QWORD *)buf = 0;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable)
  {
    v8 = Mutable;
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CC0]);
    v9 = (const void *)*MEMORY[0x1E0C9AE50];
    CFDictionaryAddValue(v8, (const void *)*MEMORY[0x1E0CD6958], (const void *)*MEMORY[0x1E0C9AE50]);
    CFDictionaryAddValue(v8, (const void *)*MEMORY[0x1E0CD7028], v9);
    CFDictionaryAddValue(v8, (const void *)*MEMORY[0x1E0CD6A90], CFSTR("com.apple.swift-playgrounds.local-signing-key"));
    CFDictionaryAddValue(v8, (const void *)*MEMORY[0x1E0CD6898], CFSTR("com.apple.local-signing"));
    CFDictionaryAddValue(v8, (const void *)*MEMORY[0x1E0CD70A8], v9);
    v10 = SecItemCopyMatching(v8, (CFTypeRef *)buf);
    if ((_DWORD)v10)
    {
      v11 = v10;
      +[AMFIFMKLog generic](AMFIFMKLog, "generic");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        AMFICopySwiftPlaygroundsSigningKey_cold_20(v11, v12, v13, v14, v15, v16, v17, v18);
LABEL_14:

      CFRelease(v8);
      ValueAtIndex = 0;
      goto LABEL_39;
    }
    v21 = CFGetTypeID(*(CFTypeRef *)buf);
    TypeID = CFArrayGetTypeID();
    v23 = *(const __CFArray **)buf;
    if (v21 == TypeID)
    {
      *(_QWORD *)buf = 0;
      Count = CFArrayGetCount(v23);
      if (!Count)
      {
        +[AMFIFMKLog generic](AMFIFMKLog, "generic");
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          AMFICopySwiftPlaygroundsSigningKey_cold_17();

        ValueAtIndex = 0;
        LODWORD(v11) = -25300;
        goto LABEL_37;
      }
      v25 = Count;
      if (Count >= 2)
      {
        +[AMFIFMKLog generic](AMFIFMKLog, "generic");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          AMFICopySwiftPlaygroundsSigningKey_cold_18(v25, v26, v27, v28, v29, v30, v31, v32);
        LODWORD(v11) = -67843;

        ValueAtIndex = 0;
LABEL_37:
        CFRelease(v8);
        if (v23)
          CFRelease(v23);
        goto LABEL_39;
      }
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(v23, 0);
      CFRetain(ValueAtIndex);
    }
    else
    {
      v33 = CFGetTypeID(*(CFTypeRef *)buf);
      if (v33 != SecKeyGetTypeID())
      {
        LODWORD(v11) = -67843;
        +[AMFIFMKLog generic](AMFIFMKLog, "generic");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          AMFICopySwiftPlaygroundsSigningKey_cold_19();
        goto LABEL_14;
      }
      v23 = 0;
      ValueAtIndex = *(void **)buf;
      *(_QWORD *)buf = 0;
    }
    CFRetain(ValueAtIndex);
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)valuePtr = 0;
      _os_log_impl(&dword_1DF2FC000, v35, OS_LOG_TYPE_DEFAULT, "successfully copied local signing private key from keychain", valuePtr, 2u);
    }

    if (ValueAtIndex)
      CFRelease(ValueAtIndex);
    LODWORD(v11) = 0;
    goto LABEL_37;
  }
  +[AMFIFMKLog generic](AMFIFMKLog, "generic");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    AMFICopySwiftPlaygroundsSigningKey_cold_16();

  ValueAtIndex = 0;
  LODWORD(v11) = -26276;
LABEL_39:
  if (*(_QWORD *)buf)
    CFRelease(*(CFTypeRef *)buf);
  if (!(_DWORD)v11)
    goto LABEL_74;
  if ((_DWORD)v11 == -67843)
  {
    Code = 4294899453;
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      AMFICopySwiftPlaygroundsSigningKey_cold_15();
LABEL_73:
    v3 = 0;
    goto LABEL_77;
  }
  v93 = 1;
  *(_DWORD *)valuePtr = 384;
  *(_QWORD *)buf = 0;
  v37 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v38 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, valuePtr);
  if (!v38)
  {
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      AMFICopySwiftPlaygroundsSigningKey_cold_8();

    goto LABEL_60;
  }
  v39 = v38;
  v40 = SecAccessControlCreateWithFlags(v37, (CFTypeRef)*MEMORY[0x1E0CD68B0], 0, 0);
  if (!v40)
  {
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      AMFICopySwiftPlaygroundsSigningKey_cold_9();

    CFRelease(v39);
LABEL_60:
    Code = 4294941020;
    goto LABEL_68;
  }
  v41 = v40;
  v42 = CFNumberCreate(v37, kCFNumberIntType, &v93);
  if (v42)
  {
    v43 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (v43)
    {
      v44 = v43;
      CFDictionaryAddValue(v43, (const void *)*MEMORY[0x1E0CD6A38], (const void *)*MEMORY[0x1E0CD6A50]);
      CFDictionaryAddValue(v44, (const void *)*MEMORY[0x1E0CD6A20], v39);
      v45 = (const void *)*MEMORY[0x1E0C9AE50];
      CFDictionaryAddValue(v44, (const void *)*MEMORY[0x1E0CD69D8], (const void *)*MEMORY[0x1E0C9AE50]);
      CFDictionaryAddValue(v44, (const void *)*MEMORY[0x1E0CD6A90], CFSTR("com.apple.swift-playgrounds.local-signing-key"));
      CFDictionaryAddValue(v44, (const void *)*MEMORY[0x1E0CD6898], CFSTR("com.apple.local-signing"));
      CFDictionaryAddValue(v44, (const void *)*MEMORY[0x1E0CD70A8], v45);
      CFDictionaryAddValue(v44, (const void *)*MEMORY[0x1E0CD6890], v41);
      CFDictionaryAddValue(v44, (const void *)*MEMORY[0x1E0CD6B90], v42);
      RandomKey = SecKeyCreateRandomKey(v44, (CFErrorRef *)buf);
      if (RandomKey)
      {
        v47 = RandomKey;
        CFRetain(RandomKey);
        +[AMFIFMKLog generic](AMFIFMKLog, "generic");
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v92 = 0;
          _os_log_impl(&dword_1DF2FC000, v48, OS_LOG_TYPE_DEFAULT, "successfully created local signing private key in keychain", v92, 2u);
        }

        CFRelease(v47);
        Code = 0;
        ValueAtIndex = v47;
      }
      else
      {
        v80 = *(__CFError **)buf;
        if (*(_QWORD *)buf)
        {
          v81 = CFErrorCopyFailureReason(*(CFErrorRef *)buf);
          Code = CFErrorGetCode(v80);
          if (v81)
          {
            CStringPtr = CFStringGetCStringPtr(v81, 0x8000100u);
            +[AMFIFMKLog generic](AMFIFMKLog, "generic");
            v83 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
              AMFICopySwiftPlaygroundsSigningKey_cold_14((uint64_t)CStringPtr, Code, v83);

            CFRelease(v81);
          }
          else
          {
            +[AMFIFMKLog generic](AMFIFMKLog, "generic");
            v85 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
              AMFICopySwiftPlaygroundsSigningKey_cold_13(Code, v85, v86, v87, v88, v89, v90, v91);

          }
        }
        else
        {
          +[AMFIFMKLog generic](AMFIFMKLog, "generic");
          v84 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
            AMFICopySwiftPlaygroundsSigningKey_cold_12();

          Code = 4294941020;
        }
      }
      CFRelease(v44);
      goto LABEL_66;
    }
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      AMFICopySwiftPlaygroundsSigningKey_cold_11();
  }
  else
  {
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      AMFICopySwiftPlaygroundsSigningKey_cold_10();
  }

  Code = 4294941020;
LABEL_66:
  CFRelease(v41);
  CFRelease(v39);
  if (v42)
    CFRelease(v42);
LABEL_68:
  if (*(_QWORD *)buf)
    CFRelease(*(CFTypeRef *)buf);
  if ((_DWORD)Code)
  {
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      AMFICopySwiftPlaygroundsSigningKey_cold_7(Code, v36, v52, v53, v54, v55, v56, v57);
    goto LABEL_73;
  }
LABEL_74:
  v3 = (__SecKey *)ValueAtIndex;
  CFRetain(ValueAtIndex);
  +[AMFIFMKLog generic](AMFIFMKLog, "generic");
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DF2FC000, v36, OS_LOG_TYPE_DEFAULT, "successfully copied local signing private key", buf, 2u);
  }
  Code = 0;
LABEL_77:

  if (ValueAtIndex)
    CFRelease(ValueAtIndex);
  if ((_DWORD)Code)
  {
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      AMFICopySwiftPlaygroundsSigningKey_cold_6();
    goto LABEL_101;
  }
  *(_QWORD *)buf = 0;
  v59 = SecKeyCopyPublicKey(v3);
  if (!v59)
  {
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      AMFICopySwiftPlaygroundsSigningKey_cold_2();

    Code = 4294941020;
    goto LABEL_99;
  }
  v60 = v59;
  v61 = SecKeyCopyPublicBytes();
  if ((_DWORD)v61)
  {
    Code = v61;
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      AMFICopySwiftPlaygroundsSigningKey_cold_5(Code, v62, v63, v64, v65, v66, v67, v68);
    goto LABEL_96;
  }
  Length = CFDataGetLength(*(CFDataRef *)buf);
  if (Length != 97)
  {
    v73 = Length;
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      AMFICopySwiftPlaygroundsSigningKey_cold_4(v73, v62, v74, v75, v76, v77, v78, v79);
    goto LABEL_95;
  }
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)buf);
  Code = amfi_interface_set_local_signing_public_key(BytePtr);
  +[AMFIFMKLog generic](AMFIFMKLog, "generic");
  v72 = objc_claimAutoreleasedReturnValue();
  v62 = v72;
  if ((_DWORD)Code)
  {
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      AMFICopySwiftPlaygroundsSigningKey_cold_3(v62);
LABEL_95:
    Code = 4294941020;
    goto LABEL_96;
  }
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)valuePtr = 0;
    _os_log_impl(&dword_1DF2FC000, v62, OS_LOG_TYPE_DEFAULT, "added local signing public key to AMFI", valuePtr, 2u);
    Code = 0;
  }
LABEL_96:

  CFRelease(v60);
  if (*(_QWORD *)buf)
    CFRelease(*(CFTypeRef *)buf);
  if ((_DWORD)Code)
  {
LABEL_99:
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      AMFICopySwiftPlaygroundsSigningKey_cold_1();
LABEL_101:

    if (!v3)
      return Code;
    goto LABEL_8;
  }
LABEL_5:
  if (a1)
  {
    *a1 = v3;
    CFRetain(v3);
  }
  Code = 0;
  if (v3)
LABEL_8:
    CFRelease(v3);
  return Code;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

const __CFString *errorStringForAMFIErrorCode(uint64_t a1)
{
  if ((unint64_t)(a1 + 430) > 0x1D)
    return CFSTR("An unknown error was encountered");
  else
    return off_1EA986820[a1 + 430];
}

uint64_t errorCodeForMISError(int a1)
{
  NSObject *v2;

  if ((a1 + 402620399) < 0xE && ((0x2237u >> (a1 - 17)) & 1) != 0)
    return qword_1DF308508[a1 + 402620399];
  +[AMFIFMKLog generic](AMFIFMKLog, "generic");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    errorCodeForMISError_cold_1(a1, v2);

  return -400;
}

uint64_t AMFIShouldShowDeveloperModeSettings()
{
  void *v0;
  char v1;
  _BOOL8 v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  if (amfi_developer_mode_status())
    return 1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "fileExistsAtPath:", CFSTR("/private/var/tmp/show_dev_mode"));

  if ((v1 & 1) != 0)
    return 1;
  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v2 = !MISEnumerateMatchingProfiles() && *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void sub_1DF2FFCE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t amfi_interface_cdhash_in_trustcache(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t result;

  result = 22;
  if (a1 && a2 == 20 && a3)
  {
    *a3 = 0;
    result = __sandbox_ms();
    if ((_DWORD)result)
      return *__error();
    else
      *a3 = 0;
  }
  return result;
}

uint64_t amfi_interface_query_bootarg_state(_QWORD *a1)
{
  uint64_t result;

  if (!a1)
    return 22;
  *a1 = 0;
  result = __sandbox_ms();
  if ((_DWORD)result)
    return *__error();
  *a1 = 0;
  return result;
}

uint64_t amfi_interface_get_local_signing_private_key(_BYTE *a1)
{
  uint64_t result;
  _OWORD __s2[9];
  char v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  memset(__s2, 0, sizeof(__s2));
  if (!a1)
    return 22;
  a1[144] = 0;
  *((_OWORD *)a1 + 7) = 0uLL;
  *((_OWORD *)a1 + 8) = 0uLL;
  *((_OWORD *)a1 + 5) = 0uLL;
  *((_OWORD *)a1 + 6) = 0uLL;
  *((_OWORD *)a1 + 3) = 0uLL;
  *((_OWORD *)a1 + 4) = 0uLL;
  *((_OWORD *)a1 + 1) = 0uLL;
  *((_OWORD *)a1 + 2) = 0uLL;
  *(_OWORD *)a1 = 0uLL;
  result = __sandbox_ms();
  if (!(_DWORD)result)
    return 2 * (memcmp(a1, __s2, 0x91uLL) == 0);
  return result;
}

uint64_t amfi_interface_get_local_signing_public_key(_BYTE *a1)
{
  uint64_t result;
  _OWORD __s2[6];
  char v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  memset(__s2, 0, sizeof(__s2));
  if (!a1)
    return 22;
  a1[96] = 0;
  *((_OWORD *)a1 + 4) = 0uLL;
  *((_OWORD *)a1 + 5) = 0uLL;
  *((_OWORD *)a1 + 2) = 0uLL;
  *((_OWORD *)a1 + 3) = 0uLL;
  *(_OWORD *)a1 = 0uLL;
  *((_OWORD *)a1 + 1) = 0uLL;
  result = __sandbox_ms();
  if (!(_DWORD)result)
    return 2 * (memcmp(a1, __s2, 0x61uLL) == 0);
  return result;
}

uint64_t amfi_interface_set_local_signing_public_key(const void *a1)
{
  _OWORD __s2[6];
  char v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  memset(__s2, 0, sizeof(__s2));
  if (!a1 || !memcmp(a1, __s2, 0x61uLL))
    return 22;
  else
    return __sandbox_ms();
}

uint64_t amfi_interface_authorize_local_signing()
{
  return __sandbox_ms();
}

BOOL amfi_developer_mode_resolved()
{
  uint64_t v2;
  size_t v3;

  v2 = 0;
  v3 = 8;
  return !sysctlbyname("security.mac.amfi.developer_mode_resolved", &v2, &v3, 0, 0) && v2 == 1;
}

uint64_t amfi_launch_constraint_set_spawnattr(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a2 && (unint64_t)(a3 - 1) <= 0x3FFE)
    return posix_spawnattr_setmacpolicyinfo_np();
  else
    return 22;
}

uint64_t amfi_launch_constraint_matches_process(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  int *v4;
  uint64_t result;
  int v6;
  _QWORD v7[129];

  v4 = (int *)a4;
  v7[128] = *MEMORY[0x1E0C80C00];
  if (a2 && a3)
  {
    if (a3 <= 0x4000)
    {
      bzero(v7, 0x400uLL);
      v6 = 5;
      if (!v4)
        v4 = &v6;
      if (!__sandbox_ms() && !*v4)
        return 1;
    }
    else if (a4)
    {
      result = 0;
      *(_DWORD *)a4 = 5;
      strcpy((char *)(a4 + 4), "Constraint too large");
      return result;
    }
  }
  else if (a4)
  {
    result = 0;
    *(_DWORD *)a4 = 5;
    strcpy((char *)(a4 + 4), "No Constraint provided");
    return result;
  }
  return 0;
}

uint64_t amfi_restricted_execution_mode_enable()
{
  return __sandbox_ms();
}

BOOL amfi_restricted_execution_mode_status()
{
  return __sandbox_ms() == 0;
}

uint64_t validateCodeSigningFlags(void (**a1)(int *, uint64_t), uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_DWORD *)a1;
  if ((*(_DWORD *)a1 - 1) >= 2)
  {
    if (v2 == 8)
    {
      v3 = -738426648;
      goto LABEL_6;
    }
    if (v2 != 4)
    {
      v4 = 15;
      goto LABEL_10;
    }
  }
  v3 = -3203661632;
LABEL_6:
  if ((a2 & v3) == 0)
    return 1;
  v4 = 14;
LABEL_10:
  a1[9]((int *)a1, v4);
  return 0;
}

const char *LWCRTypeVerificationBackend_errorStringForCode(int a1)
{
  if ((a1 - 1) > 0xE)
    return "Success";
  else
    return off_1EA986B18[a1 - 1];
}

BOOL LWCRTypeVerificationBackend_verifyRequirements(uint64_t a1, uint64_t a2)
{
  char v3;

  return verifyAndOrDictionary(a1, a2, &v3);
}

BOOL verifyAndOrDictionary(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  unsigned int v6;
  _BOOL8 v7;
  void (*v8)(uint64_t, _QWORD *);
  int v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  *a3 = 0;
  if ((*(unsigned int (**)(uint64_t))(a1 + 16))(a2) != 32)
  {
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 3);
    return 0;
  }
  v6 = *(_DWORD *)(a1 + 4) + 1;
  *(_DWORD *)(a1 + 4) = v6;
  if (v6 >= 6)
  {
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 13);
    return 0;
  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x2000000000;
  v19 = 1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 0;
  v8 = *(void (**)(uint64_t, _QWORD *))(a1 + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 0x40000000;
  v11[2] = __verifyAndOrDictionary_block_invoke;
  v11[3] = &unk_1EA986990;
  v11[5] = &v16;
  v11[6] = a1;
  v11[4] = &v12;
  v8(a2, v11);
  v9 = *((_DWORD *)v13 + 6);
  if (v9 == 1)
  {
    *a3 = 1;
  }
  else if (!v9 && *((_BYTE *)v17 + 24))
  {
    *((_BYTE *)v17 + 24) = 0;
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 12);
  }
  --*(_DWORD *)(a1 + 4);
  v7 = *((_BYTE *)v17 + 24) != 0;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v7;
}

BOOL LWCRTypeVerificationBackend_verifyLWCR(uint64_t a1, uint64_t a2)
{
  void (*v4)(uint64_t, _QWORD *);
  uint64_t v5;
  _BOOL8 v6;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  if ((*(unsigned int (**)(uint64_t))(a1 + 16))(a2) == 32)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2000000000;
    v20 = 1;
    v13 = 0;
    v14 = &v13;
    v15 = 0x2000000000;
    v16 = 0;
    v9 = 0;
    v10 = &v9;
    v11 = 0x2000000000;
    v12 = 0;
    v4 = *(void (**)(uint64_t, _QWORD *))(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 0x40000000;
    v8[2] = __LWCRTypeVerificationBackend_verifyLWCR_block_invoke;
    v8[3] = &unk_1EA986968;
    v8[4] = &v17;
    v8[5] = &v13;
    v8[6] = &v9;
    v8[7] = a1;
    v4(a2, v8);
    if (*((_BYTE *)v18 + 24))
    {
      v5 = v14[3];
      if (!v5 || (v6 = 1, v5 == 127) && *(_DWORD *)a1 == 2)
      {
        if (*((_BYTE *)v10 + 24))
        {
          v6 = 1;
        }
        else
        {
          (*(void (**)(uint64_t, const char *))(a1 + 56))(a1, "ccat");
          *((_BYTE *)v18 + 24) = 0;
          (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 12);
          v6 = *((_BYTE *)v18 + 24) != 0;
        }
      }
    }
    else
    {
      v6 = 0;
    }
    _Block_object_dispose(&v9, 8);
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 2);
    return 0;
  }
  return v6;
}

BOOL __verifyAndOrDictionary_block_invoke(_QWORD *a1, char *a2, uint64_t a3)
{
  char v7;
  char v8;

  (*(void (**)(void))(a1[6] + 56))();
  v8 = 0;
  if (*a2 == 36)
  {
    if (verifyFactLessOperator(a1[6], a2, a3, &v8, &v7))
    {
LABEL_3:
      (*(void (**)(void))(a1[6] + 64))();
      ++*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
      return 1;
    }
  }
  else if (verifyFactName(a1[6], a2, a3, &v8))
  {
    goto LABEL_3;
  }
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  return *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) != 0;
}

uint64_t verifyFactLessOperator(uint64_t a1, char *a2, uint64_t a3, _BYTE *a4, _BYTE *a5)
{
  void (*v11)(uint64_t, _QWORD *);
  _BOOL8 v12;
  int IsKnownForCategory;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  *a4 = 0;
  *a5 = 0;
  if (!keyIsKnownFactlessDictOperator(a2) && !keyIsKnownOperatorArrayOperator((_BOOL8)a2))
  {
    IsKnownForCategory = keyIsKnownForCategory(a2, *(_DWORD *)a1);
    if (IsKnownForCategory == 1)
    {
      *a4 = 1;
    }
    else if (!IsKnownForCategory)
    {
      (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 4);
      return 0;
    }
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 1);
    return 0;
  }
  if (keyIsKnownBooleanOperator((_BOOL8)a2))
    return verifyAndOrDictionary(a1, a3, a5);
  if (!strcmp(a2, "$optional"))
    return verifyOptionalDictionary(a1, a3, 0);
  if (keyIsKnownOperatorArrayOperator((_BOOL8)a2))
  {
    if ((*(unsigned int (**)(uint64_t))(a1 + 16))(a3) == 16)
    {
      v19 = 0;
      v20 = &v19;
      v21 = 0x2000000000;
      v22 = 1;
      v15 = 0;
      v16 = &v15;
      v17 = 0x2000000000;
      v18 = 0;
      v11 = *(void (**)(uint64_t, _QWORD *))(a1 + 48);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 0x40000000;
      v14[2] = __verifyOperatorArray_block_invoke;
      v14[3] = &unk_1EA986A58;
      v14[5] = &v15;
      v14[6] = a1;
      v14[4] = &v19;
      v11(a3, v14);
      if (*((_DWORD *)v16 + 6) == 1)
        *a5 = 1;
      v12 = *((_BYTE *)v20 + 24) != 0;
      _Block_object_dispose(&v15, 8);
      _Block_object_dispose(&v19, 8);
      return v12;
    }
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 3);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 10);
  }
  return 0;
}

BOOL verifyFactName(uint64_t a1, char *__s1, uint64_t a3, _BYTE *a4)
{
  int v8;
  uint64_t IsKnownForCategory;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v16;
  uint64_t v17;
  int v18;
  _BYTE *v19;
  uint64_t v20;
  unsigned int v21;
  int v22;
  int v23;
  int v24;
  void (*v25)(uint64_t, _QWORD *);
  uint64_t v26;
  _QWORD v27[7];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  _QWORD v32[3];
  int v33;

  *a4 = 0;
  v26 = 0;
  v8 = *(_DWORD *)a1;
  IsKnownForCategory = factIsKnownForCategory(__s1, *(_DWORD *)a1, &v26);
  if ((_DWORD)IsKnownForCategory == 1)
  {
    v13 = keyIsKnownForCategory(__s1, v8);
    v10 = v13;
    if ((_DWORD)v13 == 1)
    {
      *a4 = 1;
    }
    else if (!(_DWORD)v13)
    {
      (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 4);
      return 0;
    }
LABEL_10:
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, v10);
    return 0;
  }
  v10 = IsKnownForCategory;
  if ((_DWORD)IsKnownForCategory)
    goto LABEL_10;
  v11 = v26;
  v12 = *(_DWORD *)(v26 + 12);
  switch(v12)
  {
    case 1:
      if (((*(uint64_t (**)(uint64_t, uint64_t))(a1 + 16))(a3, IsKnownForCategory) & 1) == 0)
        goto LABEL_32;
      return 1;
    case 2:
      v22 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 16))(a3, IsKnownForCategory);
      if ((v22 & 2) != 0)
        return 1;
      if (v22 != 32)
        goto LABEL_32;
      v16 = a1;
      v17 = a3;
      v18 = 2;
      goto LABEL_30;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_16;
    case 4:
      v23 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 16))(a3, IsKnownForCategory);
      if (v23 == 4)
        return 1;
      if (v23 != 32)
        goto LABEL_32;
      v16 = a1;
      v17 = a3;
      v18 = 4;
      goto LABEL_30;
    case 8:
      v24 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 16))(a3, IsKnownForCategory);
      if (v24 == 8)
        return 1;
      if (v24 != 32)
        goto LABEL_32;
      v16 = a1;
      v17 = a3;
      v18 = 8;
LABEL_30:
      v19 = a4;
      v20 = 0;
      return verifyFactOperatorDictionary(v16, v17, v18, v19, 0, v20);
    default:
      if (v12 == 64)
      {
        if ((*(unsigned int (**)(uint64_t, uint64_t))(a1 + 16))(a3, IsKnownForCategory) == 32)
        {
          v16 = a1;
          v17 = a3;
          v18 = 64;
          v19 = a4;
          v20 = v11;
          return verifyFactOperatorDictionary(v16, v17, v18, v19, 0, v20);
        }
LABEL_32:
        (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 3);
        return 0;
      }
LABEL_16:
      if (!__s1 || strcmp(__s1, (const char *)kKnownQueryFacts))
        return 0;
      if ((*(unsigned int (**)(uint64_t))(a1 + 16))(a3) != 32)
        goto LABEL_32;
      v21 = *(_DWORD *)(a1 + 4) + 1;
      *(_DWORD *)(a1 + 4) = v21;
      if (v21 >= 6)
      {
        (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 13);
        return 0;
      }
      v32[0] = 0;
      v32[1] = v32;
      v32[2] = 0x2000000000;
      v33 = 0;
      v28 = 0;
      v29 = &v28;
      v30 = 0x2000000000;
      v31 = 1;
      v25 = *(void (**)(uint64_t, _QWORD *))(a1 + 40);
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 0x40000000;
      v27[2] = __verifyQueryTypeFact_block_invoke;
      v27[3] = &unk_1EA986AA8;
      v27[5] = &v28;
      v27[6] = a1;
      v27[4] = v32;
      v25(a3, v27);
      --*(_DWORD *)(a1 + 4);
      v14 = *((_BYTE *)v29 + 24) != 0;
      _Block_object_dispose(&v28, 8);
      _Block_object_dispose(v32, 8);
      return v14;
  }
}

BOOL keyIsKnownBooleanOperator(_BOOL8 result)
{
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;

  if (result)
  {
    v1 = (const char *)result;
    if (!strcmp((const char *)result, (const char *)kKnownBooleanOperators))
    {
      return 1;
    }
    else
    {
      v2 = 0;
      do
      {
        v3 = v2;
        if (v2 == 8)
          break;
        v4 = strcmp(v1, *(const char **)((char *)&kKnownBooleanOperators + v2 + 8));
        v2 = v3 + 8;
      }
      while (v4);
      return v3 == 0;
    }
  }
  return result;
}

BOOL verifyOptionalDictionary(uint64_t a1, uint64_t a2, int a3)
{
  unsigned int v6;
  _BOOL8 v7;
  void (*v8)(uint64_t, _QWORD *);
  void (*v9)(uint64_t, _QWORD *);
  _QWORD v11[7];
  _QWORD v12[8];
  _QWORD v13[3];
  int v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  _BYTE v22[8];

  if ((*(unsigned int (**)(uint64_t))(a1 + 16))(a2) != 32)
  {
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 3);
    return 0;
  }
  v6 = *(_DWORD *)(a1 + 4) + 1;
  *(_DWORD *)(a1 + 4) = v6;
  if (v6 < 6)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2000000000;
    v22[0] = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x2000000000;
    v18 = 1;
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2000000000;
    v14 = 0;
    if (a3)
    {
      if (verifyFactOperatorDictionary(a1, a2, a3, v22, 1, 0))
      {
        --*(_DWORD *)(a1 + 4);
        v7 = 1;
LABEL_14:
        _Block_object_dispose(v13, 8);
        _Block_object_dispose(&v15, 8);
        _Block_object_dispose(&v19, 8);
        return v7;
      }
      if (*((_BYTE *)v20 + 24))
      {
        (*(void (**)(uint64_t))(a1 + 64))(a1);
        v9 = *(void (**)(uint64_t, _QWORD *))(a1 + 40);
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 0x40000000;
        v11[2] = __verifyOptionalDictionary_block_invoke_2;
        v11[3] = &unk_1EA9869E0;
        v11[4] = v13;
        v11[5] = &v15;
        v11[6] = a1;
        v9(a2, v11);
      }
      else
      {
        *((_BYTE *)v16 + 24) = 0;
      }
    }
    else
    {
      v8 = *(void (**)(uint64_t, _QWORD *))(a1 + 40);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 0x40000000;
      v12[2] = __verifyOptionalDictionary_block_invoke;
      v12[3] = &unk_1EA9869B8;
      v12[4] = v13;
      v12[5] = &v15;
      v12[6] = &v19;
      v12[7] = a1;
      v8(a2, v12);
    }
    --*(_DWORD *)(a1 + 4);
    v7 = *((_BYTE *)v16 + 24) != 0;
    goto LABEL_14;
  }
  (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 13);
  return 0;
}

BOOL keyIsKnownOperatorArrayOperator(_BOOL8 result)
{
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;

  if (result)
  {
    v1 = (const char *)result;
    if (!strcmp((const char *)result, (const char *)kKnownOperatorArrayOperators))
    {
      return 1;
    }
    else
    {
      v2 = 0;
      do
      {
        v3 = v2;
        if (v2 == 8)
          break;
        v4 = strcmp(v1, *(const char **)((char *)&kKnownOperatorArrayOperators + v2 + 8));
        v2 = v3 + 8;
      }
      while (v4);
      return v3 == 0;
    }
  }
  return result;
}

uint64_t keyIsKnownForCategory(char *a1, int a2)
{
  uint64_t result;
  uint64_t v4;

  v4 = 0;
  result = factIsKnownForCategory(a1, a2, &v4);
  if ((_DWORD)result == 1)
    return !keyIsKnownOperator(a1);
  return result;
}

BOOL keyIsKnownFactlessDictOperator(const char *a1)
{
  return keyIsKnownBooleanOperator((_BOOL8)a1) || strcmp(a1, "$optional") == 0;
}

uint64_t __verifyOptionalDictionary_block_invoke(_QWORD *a1, char *a2, uint64_t a3)
{
  void (*v6)(void);
  uint64_t result;

  (*(void (**)(void))(a1[7] + 56))();
  if (*(int *)(*(_QWORD *)(a1[4] + 8) + 24) >= 1)
  {
    v6 = *(void (**)(void))(a1[7] + 72);
LABEL_3:
    v6();
LABEL_4:
    result = 0;
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
    return result;
  }
  if (*a2 == 36)
  {
    if (keyIsKnownOperator(a2))
    {
      v6 = *(void (**)(void))(a1[7] + 72);
      goto LABEL_3;
    }
  }
  else if (!verifyFactName(a1[7], a2, a3, (_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
         && !*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    goto LABEL_4;
  }
  (*(void (**)(void))(a1[7] + 64))();
  ++*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  return 1;
}

BOOL keyIsKnownOperator(const char *a1)
{
  uint64_t v3;

  if (keyIsKnownNumericOnlyOperator((_BOOL8)a1))
    return 1;
  if (a1)
  {
    if (!strcmp(a1, (const char *)kKnownMultiUseFactOperators[0]))
      return 1;
    v3 = 0;
    while (v3 != 1)
    {
      if (!strcmp(a1, (const char *)kKnownMultiUseFactOperators[++v3]))
      {
        if (v3 == 1)
          return 1;
        break;
      }
    }
  }
  if (!strcmp(a1, "$query") || keyIsKnownFactlessDictOperator(a1))
    return 1;
  return keyIsKnownOperatorArrayOperator((_BOOL8)a1);
}

BOOL verifyFactOperatorDictionary(uint64_t a1, uint64_t a2, int a3, _BYTE *a4, char a5, uint64_t a6)
{
  unsigned int v12;
  _BOOL8 v13;
  void (*v14)(uint64_t, _QWORD *);
  _QWORD v16[9];
  int v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[3];
  int v24;

  *a4 = 0;
  if ((*(unsigned int (**)(uint64_t))(a1 + 16))(a2) == 32)
  {
    v12 = *(_DWORD *)(a1 + 4) + 1;
    *(_DWORD *)(a1 + 4) = v12;
    if (v12 < 6)
    {
      v23[0] = 0;
      v23[1] = v23;
      v23[2] = 0x2000000000;
      v24 = 0;
      v19 = 0;
      v20 = &v19;
      v21 = 0x2000000000;
      v22 = 1;
      v14 = *(void (**)(uint64_t, _QWORD *))(a1 + 40);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 0x40000000;
      v16[2] = __verifyFactOperatorDictionary_block_invoke;
      v16[3] = &unk_1EA986A08;
      v16[4] = v23;
      v16[5] = &v19;
      v18 = a5;
      v17 = a3;
      v16[6] = a1;
      v16[7] = a4;
      v16[8] = a6;
      v14(a2, v16);
      --*(_DWORD *)(a1 + 4);
      v13 = *((_BYTE *)v20 + 24) != 0;
      _Block_object_dispose(&v19, 8);
      _Block_object_dispose(v23, 8);
      return v13;
    }
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 13);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 3);
  }
  return 0;
}

uint64_t __verifyOptionalDictionary_block_invoke_2(_QWORD *a1, const char *a2)
{
  void (*v4)(void);
  uint64_t result;

  (*(void (**)(void))(a1[6] + 56))();
  if (*(int *)(*(_QWORD *)(a1[4] + 8) + 24) >= 1)
  {
    v4 = *(void (**)(void))(a1[6] + 72);
LABEL_7:
    v4();
    result = 0;
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
    return result;
  }
  if (*a2 != 36 || keyIsKnownFactlessDictOperator(a2) || keyIsKnownOperatorArrayOperator((_BOOL8)a2))
  {
    v4 = *(void (**)(void))(a1[6] + 72);
    goto LABEL_7;
  }
  (*(void (**)(void))(a1[6] + 64))();
  ++*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  return 1;
}

BOOL keyIsKnownNumericOnlyOperator(_BOOL8 result)
{
  const char *v1;
  unint64_t v2;
  unint64_t v3;
  int v4;

  if (result)
  {
    v1 = (const char *)result;
    if (!strcmp((const char *)result, (const char *)kKnownNumericOnlyOperators[0]))
    {
      return 1;
    }
    else
    {
      v2 = 0;
      do
      {
        v3 = v2;
        if (v2 == 3)
          break;
        v4 = strcmp(v1, (const char *)kKnownNumericOnlyOperators[v2 + 1]);
        v2 = v3 + 1;
      }
      while (v4);
      return v3 < 3;
    }
  }
  return result;
}

uint64_t __verifyFactOperatorDictionary_block_invoke(uint64_t a1, char *a2, uint64_t a3)
{
  void (*v6)(void);
  uint64_t result;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, _QWORD *);
  int v13;
  BOOL IsKnownNumericOnlyOperator;
  int IsKnownForCategory;
  uint64_t v16;
  _QWORD v17[6];
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 56))();
  if (*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) >= 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 72);
LABEL_3:
    v6();
    return 0;
  }
  if (!strcmp(a2, "$optional"))
  {
    if (*(_BYTE *)(a1 + 76))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      goto LABEL_13;
    }
    result = verifyOptionalDictionary(*(_QWORD *)(a1 + 48), a3, *(unsigned int *)(a1 + 72));
    if (!(_DWORD)result)
      goto LABEL_39;
    goto LABEL_26;
  }
  v8 = *(_DWORD *)(a1 + 72);
  if ((v8 & 0xE) == 0)
  {
    if ((v8 & 0x40) == 0)
      goto LABEL_38;
    if (!a2 || strcmp(a2, (const char *)kKnownFlagSetOnlyOperators))
    {
      v10 = *(_QWORD *)(a1 + 48);
LABEL_27:
      IsKnownForCategory = keyIsKnownForCategory(a2, *(_DWORD *)v10);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      if (IsKnownForCategory == 1)
      {
        **(_BYTE **)(a1 + 56) = 1;
LABEL_32:
        v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 72);
        goto LABEL_3;
      }
      if (IsKnownForCategory)
        goto LABEL_32;
LABEL_13:
      v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 72);
      goto LABEL_3;
    }
    if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 48) + 16))(a3) & 2) == 0)
      goto LABEL_36;
    if (*(_QWORD *)(a1 + 64))
    {
      v16 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 48) + 24))(a3);
      if (((*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 48), v16) & 1) == 0)
        goto LABEL_38;
    }
LABEL_26:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 64))();
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    return 1;
  }
  if (!strcmp(a2, "$in"))
  {
    v11 = *(_QWORD *)(a1 + 48);
    if ((*(unsigned int (**)(uint64_t))(v11 + 16))(a3) != 16)
    {
      (*(void (**)(uint64_t, uint64_t))(v11 + 72))(v11, 3);
      goto LABEL_38;
    }
    v19 = 0;
    v20 = &v19;
    v21 = 0x2000000000;
    v22 = 1;
    (*(void (**)(uint64_t, const char *))(v11 + 56))(v11, "Array");
    v12 = *(void (**)(uint64_t, _QWORD *))(v11 + 48);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 0x40000000;
    v17[2] = __verifyInArray_block_invoke;
    v17[3] = &unk_1EA986A30;
    v18 = v8;
    v17[4] = &v19;
    v17[5] = v11;
    v12(a3, v17);
    if (!*((_BYTE *)v20 + 24))
    {
      _Block_object_dispose(&v19, 8);
      goto LABEL_38;
    }
    (*(void (**)(uint64_t))(v11 + 64))(v11);
    v13 = *((unsigned __int8 *)v20 + 24);
    _Block_object_dispose(&v19, 8);
    if (!v13)
      goto LABEL_38;
    goto LABEL_26;
  }
  if ((v8 & 2) != 0)
  {
    IsKnownNumericOnlyOperator = keyIsKnownNumericOnlyOperator((_BOOL8)a2);
    v10 = *(_QWORD *)(a1 + 48);
    if (IsKnownNumericOnlyOperator)
    {
      if ((*(_DWORD *)(a1 + 72) & (*(unsigned int (**)(uint64_t))(v10 + 16))(a3)) != 0)
        goto LABEL_26;
LABEL_36:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 72);
      goto LABEL_3;
    }
    goto LABEL_27;
  }
  v9 = keyIsKnownForCategory(a2, **(_DWORD **)(a1 + 48));
  if (v9 == 1)
  {
    **(_BYTE **)(a1 + 56) = 1;
    goto LABEL_34;
  }
  if (v9)
  {
LABEL_34:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 72))();
    goto LABEL_38;
  }
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 72))(*(_QWORD *)(a1 + 48), 6);
LABEL_38:
  result = 0;
LABEL_39:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

BOOL __verifyInArray_block_invoke(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;

  v3 = *(_DWORD *)(a1 + 48) & (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 40) + 16))(a2);
  if (!v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    (*(void (**)(void))(v4 + 72))();
  }
  return v3 != 0;
}

uint64_t __verifyOperatorArray_block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, _QWORD *);
  int v6;
  uint64_t result;
  _QWORD v8[8];
  _QWORD v9[4];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  _QWORD v14[3];
  int v15;

  v4 = a1[6];
  if ((*(unsigned int (**)(uint64_t))(v4 + 16))(a2) == 16)
  {
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2000000000;
    v15 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 1;
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2000000000;
    v9[3] = 0;
    v5 = *(void (**)(uint64_t, _QWORD *))(v4 + 48);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 0x40000000;
    v8[2] = __verifyOperatorArrayTuple_block_invoke;
    v8[3] = &unk_1EA986A80;
    v8[4] = v14;
    v8[5] = &v10;
    v8[6] = v9;
    v8[7] = v4;
    v5(a2, v8);
    v6 = *((unsigned __int8 *)v11 + 24);
    _Block_object_dispose(v9, 8);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(v14, 8);
    if (v6)
    {
      ++*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
      return 1;
    }
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v4 + 72))(v4, 3);
  }
  result = 0;
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
  return result;
}

uint64_t __verifyOperatorArrayTuple_block_invoke(_QWORD *a1, uint64_t a2)
{
  int v4;
  int v5;
  uint64_t v6;
  char *v7;
  BOOL IsKnownFactlessDictOperator;
  uint64_t v9;
  uint64_t result;
  void (*v11)(void);
  uint64_t v12;
  char v13;
  char v14;

  v4 = (*(uint64_t (**)(uint64_t))(a1[7] + 16))(a2);
  v5 = *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  if (v5 != 1)
  {
    if (!v5)
    {
      v6 = a1[7];
      if (v4 == 4)
      {
        *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = (*(uint64_t (**)(uint64_t))(v6 + 32))(a2);
        v7 = *(char **)(*(_QWORD *)(a1[6] + 8) + 24);
        IsKnownFactlessDictOperator = keyIsKnownFactlessDictOperator(v7);
        v9 = a1[7];
        if (IsKnownFactlessDictOperator)
        {
          (*(void (**)(uint64_t, char *))(v9 + 56))(v9, v7);
LABEL_9:
          ++*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
          return 1;
        }
        if (keyIsKnownForCategory(v7, *(_DWORD *)v9))
          v12 = 1;
        else
          v12 = 4;
        (*(void (**)(_QWORD, uint64_t))(a1[7] + 72))(a1[7], v12);
      }
      else
      {
        (*(void (**)(_QWORD, uint64_t))(v6 + 72))(a1[7], 2);
      }
      goto LABEL_18;
    }
    v11 = *(void (**)(void))(a1[7] + 72);
LABEL_13:
    v11();
LABEL_18:
    result = 0;
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
    return result;
  }
  if (v4 != 32)
  {
    v11 = *(void (**)(void))(a1[7] + 72);
    goto LABEL_13;
  }
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = verifyFactLessOperator(a1[7], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24), a2, &v14, &v13);
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    (*(void (**)(void))(a1[7] + 64))();
    goto LABEL_9;
  }
  return 0;
}

uint64_t factIsKnownForCategory(char *__s1, int a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v7;

  result = 10;
  if (__s1 && a3)
  {
    v7 = 0;
    while (strcmp(__s1, (&kKnownFacts)[v7]))
    {
      v7 += 3;
      if (v7 == 66)
        return 1;
    }
    if (((uint64_t)(&kKnownFacts)[v7 + 1] & a2) != 0)
    {
      result = 0;
      *a3 = &(&kKnownFacts)[v7];
    }
    else
    {
      return 9;
    }
  }
  return result;
}

uint64_t __verifyQueryTypeFact_block_invoke(_QWORD *a1, const char *a2, uint64_t a3)
{
  void (*v6)(void);
  uint64_t result;
  uint64_t v8;
  int v9;
  void (*v10)(uint64_t, _QWORD *);
  int v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  (*(void (**)(void))(a1[6] + 56))();
  if (*(int *)(*(_QWORD *)(a1[4] + 8) + 24) >= 1)
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
    v6 = *(void (**)(void))(a1[6] + 72);
LABEL_5:
    v6();
    return 0;
  }
  if (strcmp(a2, "$query"))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
    v6 = *(void (**)(void))(a1[6] + 72);
    goto LABEL_5;
  }
  v8 = a1[6];
  v9 = (*(uint64_t (**)(uint64_t))(v8 + 16))(a3);
  (*(void (**)(uint64_t, const char *))(v8 + 56))(v8, "Query Array");
  if (v9 == 16)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2000000000;
    v16 = 1;
    v10 = *(void (**)(uint64_t, _QWORD *))(v8 + 48);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 0x40000000;
    v12[2] = __verifyQueryArray_block_invoke;
    v12[3] = &unk_1EA986AD0;
    v12[4] = &v13;
    v12[5] = v8;
    v10(a3, v12);
    if (*((_BYTE *)v14 + 24))
    {
      (*(void (**)(uint64_t))(v8 + 64))(v8);
      v11 = *((unsigned __int8 *)v14 + 24);
      _Block_object_dispose(&v13, 8);
      if (v11)
      {
        ++*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
        (*(void (**)(void))(a1[6] + 64))();
        return 1;
      }
    }
    else
    {
      _Block_object_dispose(&v13, 8);
    }
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v8 + 72))(v8, 3);
  }
  result = 0;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  return result;
}

BOOL __verifyQueryArray_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, _QWORD *);
  BOOL v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)(a1 + 40) + 16))(a2) == 16)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 56))();
    v4 = *(_QWORD *)(a1 + 40);
    if ((*(unsigned int (**)(uint64_t))(v4 + 16))(a2) == 16)
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2000000000;
      v16 = 1;
      v9 = 0;
      v10 = &v9;
      v11 = 0x2000000000;
      v12 = 0;
      v5 = *(void (**)(uint64_t, _QWORD *))(v4 + 48);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 0x40000000;
      v8[2] = __verifyQueryTuple_block_invoke;
      v8[3] = &unk_1EA986AF8;
      v8[4] = &v9;
      v8[5] = &v13;
      v8[6] = v4;
      v5(a2, v8);
      if (*((_DWORD *)v10 + 6) == 2)
      {
        v6 = *((_BYTE *)v14 + 24) != 0;
      }
      else
      {
        v6 = 0;
        *((_BYTE *)v14 + 24) = 0;
      }
      _Block_object_dispose(&v9, 8);
      _Block_object_dispose(&v13, 8);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v4 + 72))(v4, 2);
      v6 = 0;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 64))();
      return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != 0;
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 72))();
  }
  return 0;
}

BOOL __verifyQueryTuple_block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(void);
  char v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  if (*(int *)(*(_QWORD *)(a1[4] + 8) + 24) >= 2)
  {
    v3 = a1[6];
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
    v4 = *(void (**)(void))(v3 + 72);
LABEL_5:
    v4();
    return *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) != 0;
  }
  v5 = (*(uint64_t (**)(uint64_t))(a1[6] + 16))(a2);
  v6 = *(_QWORD *)(a1[4] + 8);
  v7 = *(_DWORD *)(v6 + 24);
  if (!(v7 | v5 & 2))
  {
    v8 = a1[6];
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
    v4 = *(void (**)(void))(v8 + 72);
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 24) = v7 + 1;
  return 1;
}

uint64_t AMFIInitiateDataMigration()
{
  id v0;
  void *v1;
  uint64_t v2;

  v0 = +[AMFIConnection newConnection](AMFIConnection, "newConnection");
  objc_msgSend(v0, "initiateDataMigration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = NSErrorToAMFIReturn(v1);

  return v2;
}

uint64_t AMFIGetSEPDeviceState(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = +[AMFIConnection newConnection](AMFIConnection, "newConnection");
  v8 = 0;
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "getSEPStateWithError:", &v8);
    v4 = v8;
    v13 = v9;
    v14 = v10;
    v15 = v11;
    v16 = v12;

    if (v4)
    {
      v5 = NSErrorToAMFIReturn(v4);

      return v5;
    }
  }
  else
  {
    v16 = 0;
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
  }
  v5 = 0;
  if (a1)
  {
    v6 = v14;
    *(_OWORD *)a1 = v13;
    *(_OWORD *)(a1 + 16) = v6;
    *(_OWORD *)(a1 + 32) = v15;
    *(_BYTE *)(a1 + 48) = v16;
  }
  return v5;
}

uint64_t AMFIProfileRequiresReboot(void *a1, _BYTE *a2)
{
  id v3;
  NSObject *v4;
  uint64_t ProfileAuxiliarySignature;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (!v3)
  {
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      AMFIProfileRequiresReboot_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_14;
  }
  if (!a2)
  {
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      AMFIProfileRequiresReboot_cold_2(v9, v17, v18, v19, v20, v21, v22, v23);
LABEL_14:

    v7 = 0;
    ProfileAuxiliarySignature = 7;
    goto LABEL_15;
  }
  *a2 = 0;
  +[AMFIFMKLog generic](AMFIFMKLog, "generic");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "AMFIProfileRequiresReboot";
    v28 = 2112;
    v29 = v3;
    _os_log_impl(&dword_1DF2FC000, v4, OS_LOG_TYPE_DEFAULT, "[%s] request for profile: %@", buf, 0x16u);
  }

  ProfileAuxiliarySignature = _getProfileAuxiliarySignature(v3);
  v6 = 0;
  v7 = v6;
  if ((_DWORD)ProfileAuxiliarySignature)
  {
    if (v6)
    {
      +[AMFIFMKLog generic](AMFIFMKLog, "generic");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v27 = "AMFIProfileRequiresReboot";
        v28 = 2112;
        v29 = v3;
        _os_log_impl(&dword_1DF2FC000, v8, OS_LOG_TYPE_DEFAULT, "[%s] auxiliary signature exists: %@", buf, 0x16u);
      }

      ProfileAuxiliarySignature = 0;
    }
    else if ((_os_feature_enabled_impl() & 1) != 0)
    {
      ProfileAuxiliarySignature = 0;
      v7 = 0;
      *a2 = 1;
    }
    else
    {
      +[AMFIFMKLog generic](AMFIFMKLog, "generic");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "AMFIProfileRequiresReboot";
        _os_log_impl(&dword_1DF2FC000, v25, OS_LOG_TYPE_DEFAULT, "[%s] PreBoard flow disabled", buf, 0xCu);
      }

      ProfileAuxiliarySignature = 0;
      v7 = 0;
    }
  }
LABEL_15:

  return ProfileAuxiliarySignature;
}

uint64_t _getProfileAuxiliarySignature(void *a1)
{
  id v1;
  NSObject *v2;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  MISCopyProvisioningProfile();
  +[AMFIFMKLog generic](AMFIFMKLog, "generic");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    _getProfileAuxiliarySignature_cold_2();

  return 0;
}

void sub_1DF302644(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
  _Unwind_Resume(exception_object);
}

uint64_t AMFIProfileScheduleTrust(void *a1)
{
  id v1;
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v14;
  NSObject *v15;
  char v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v16 = 0;
  +[AMFIFMKLog generic](AMFIFMKLog, "generic");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v1)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "AMFIProfileScheduleTrust";
      v19 = 2112;
      v20 = v1;
      _os_log_impl(&dword_1DF2FC000, v3, OS_LOG_TYPE_DEFAULT, "%s: attempting to schedule profile: %@", buf, 0x16u);
    }

    v4 = AMFIProfileRequiresReboot(v1, &v16);
    if ((_DWORD)v4)
    {
      v5 = v4;
      +[AMFIFMKLog generic](AMFIFMKLog, "generic");
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        AMFIProfileScheduleTrust_cold_4();
    }
    else if (v16)
    {
      v14 = +[AMFIConnection newConnection](AMFIConnection, "newConnection");
      objc_msgSend(v14, "stageProfileForUuid:", v1);
      v3 = objc_claimAutoreleasedReturnValue();

      if (!v3)
      {
        v5 = 0;
        goto LABEL_11;
      }
      +[AMFIFMKLog generic](AMFIFMKLog, "generic");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        AMFIProfileScheduleTrust_cold_3();

      v5 = NSErrorToAMFIReturn(v3);
    }
    else
    {
      +[AMFIFMKLog generic](AMFIFMKLog, "generic");
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        AMFIProfileScheduleTrust_cold_2();
      v5 = 11;
    }
  }
  else
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      AMFIProfileScheduleTrust_cold_1(v3, v6, v7, v8, v9, v10, v11, v12);
    v5 = 7;
  }

LABEL_11:
  return v5;
}

uint64_t AMFIProfileGetScheduledProfile(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  id v21;
  CFTypeRef cf;

  cf = 0;
  if (!a1)
  {
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      AMFIProfileGetScheduledProfile_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
    v7 = 0;
    v8 = 0;
    v3 = 0;
    v6 = 7;
    goto LABEL_23;
  }
  v2 = +[AMFIConnection newConnection](AMFIConnection, "newConnection");
  v21 = 0;
  objc_msgSend(v2, "getStagedProfileWithError:", &v21);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v21;

  if (!v4)
  {
    if (MISCopyProvisioningProfile())
      v17 = 1;
    else
      v17 = cf == 0;
    if (v17)
    {
      +[AMFIFMKLog generic](AMFIFMKLog, "generic");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        AMFIProfileGetScheduledProfile_cold_4();
    }
    else
    {
      MISProvisioningProfileGetTeamIdentifier();
      v18 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v18;
      if (v18)
      {
        MISProfileGetValue();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_storeStrong((id *)a1, v3);
          objc_storeStrong((id *)(a1 + 8), v7);
          v8 = v19;
          v6 = 0;
          v9 = *(NSObject **)(a1 + 16);
          *(_QWORD *)(a1 + 16) = v8;
LABEL_23:

          v4 = 0;
          goto LABEL_24;
        }
        +[AMFIFMKLog generic](AMFIFMKLog, "generic");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          AMFIProfileGetScheduledProfile_cold_3();
LABEL_22:
        v8 = 0;
        v6 = 5;
        goto LABEL_23;
      }
      +[AMFIFMKLog generic](AMFIFMKLog, "generic");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        AMFIProfileGetScheduledProfile_cold_2();
    }
    v7 = 0;
    goto LABEL_22;
  }
  +[AMFIFMKLog generic](AMFIFMKLog, "generic");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    AMFIProfileGetScheduledProfile_cold_5();

  v6 = NSErrorToAMFIReturn(v4);
  v7 = 0;
  v8 = 0;
LABEL_24:

  if (cf)
    CFRelease(cf);
  return v6;
}

void sub_1DF302AA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
  _Unwind_Resume(exception_object);
}

uint64_t AMFIProfileCommitProfile(void *a1)
{
  id v1;
  NSObject *v2;
  _BOOL4 v3;
  const char *v4;
  NSObject *v5;
  uint32_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  +[AMFIFMKLog generic](AMFIFMKLog, "generic");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (!v3)
      goto LABEL_7;
    v12 = 136315394;
    v13 = "AMFIProfileCommitProfile";
    v14 = 2112;
    v15 = v1;
    v4 = "[%s] attempting to commit profile: %@";
    v5 = v2;
    v6 = 22;
  }
  else
  {
    if (!v3)
      goto LABEL_7;
    v12 = 136315138;
    v13 = "AMFIProfileCommitProfile";
    v4 = "[%s] attempting to remove staged profile";
    v5 = v2;
    v6 = 12;
  }
  _os_log_impl(&dword_1DF2FC000, v5, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v12, v6);
LABEL_7:

  v7 = +[AMFIConnection newConnection](AMFIConnection, "newConnection");
  objc_msgSend(v7, "commitProfileForUuid:", v1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      AMFIProfileCommitProfile_cold_1();

    v10 = NSErrorToAMFIReturn(v8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t AMFIProfileSetTrust(unsigned int a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  v4 = AMFIProfileSetTrustWithOptions(v3, a1, 0);

  return v4;
}

uint64_t AMFIProfileSetTrustWithOptions(void *a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int ProfileAuxiliarySignature;
  id v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v21;
  NSObject *v22;
  _DWORD buf[3];
  __int16 v24;
  id v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  if (!v5)
  {
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      AMFIProfileSetTrustWithOptions_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    goto LABEL_11;
  }
  if ((a2 - 1) >= 2)
  {
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      AMFIProfileSetTrustWithOptions_cold_4(a2, v10);
LABEL_11:
    v8 = 0;
    v18 = 7;
LABEL_12:

    v19 = 0;
    goto LABEL_13;
  }
  +[AMFIFMKLog generic](AMFIFMKLog, "generic");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    buf[0] = 136315650;
    *(_QWORD *)&buf[1] = "AMFIProfileSetTrustWithOptions";
    v24 = 2112;
    v25 = v5;
    v26 = 1024;
    v27 = a2;
    _os_log_impl(&dword_1DF2FC000, v6, OS_LOG_TYPE_DEFAULT, "[%s] attempting to set trust: %@ | %u", (uint8_t *)buf, 0x1Cu);
  }

  ProfileAuxiliarySignature = _getProfileAuxiliarySignature(v5);
  v8 = 0;
  if (ProfileAuxiliarySignature)
  {
    v9 = MISCopyProvisioningProfile();
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      buf[0] = 136315650;
      *(_QWORD *)&buf[1] = "AMFIProfileSetTrustWithOptions";
      v24 = 2112;
      v25 = v5;
      v26 = 1024;
      v27 = v9;
      _os_log_impl(&dword_1DF2FC000, v10, OS_LOG_TYPE_DEFAULT, "[%s] unable to copy profile: %@ | %d", (uint8_t *)buf, 0x1Cu);
    }
    v18 = 6;
    goto LABEL_12;
  }
  v21 = +[AMFIConnection newConnection](AMFIConnection, "newConnection");
  objc_msgSend(v21, "setTrustForUuid:withSignature:withSignType:", v5, 0, a2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      AMFIProfileSetTrustWithOptions_cold_2();

    v18 = NSErrorToAMFIReturn(v19);
  }
  else
  {
    v18 = 0;
  }
LABEL_13:

  return v18;
}

void sub_1DF303044(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, CFTypeRef cf)
{
  void *v12;

  if (cf)
    CFRelease(cf);

  _Unwind_Resume(a1);
}

uint64_t AMFIProfileRemoveTrust(void *a1)
{
  id v1;
  NSObject *v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  +[AMFIFMKLog generic](AMFIFMKLog, "generic");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v1)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315394;
      v16 = "AMFIProfileRemoveTrust";
      v17 = 2112;
      v18 = v1;
      _os_log_impl(&dword_1DF2FC000, v3, OS_LOG_TYPE_DEFAULT, "[%s] attempting to remove trust: %@", (uint8_t *)&v15, 0x16u);
    }

    v4 = +[AMFIConnection newConnection](AMFIConnection, "newConnection");
    objc_msgSend(v4, "removeTrustforUuid:", v1);
    v3 = objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v6 = 0;
      goto LABEL_13;
    }
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      AMFIProfileRemoveTrust_cold_2();

    v6 = NSErrorToAMFIReturn(v3);
  }
  else
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      AMFIProfileRemoveTrust_cold_1(v3, v7, v8, v9, v10, v11, v12, v13);
    v6 = 7;
  }

LABEL_13:
  return v6;
}

uint64_t AMFISupervisedModeSetState(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[AMFIFMKLog generic](AMFIFMKLog, "generic");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "AMFISupervisedModeSetState";
    v10 = 1024;
    v11 = a1;
    _os_log_impl(&dword_1DF2FC000, v2, OS_LOG_TYPE_DEFAULT, "[%s] setting supervised state: %u", (uint8_t *)&v8, 0x12u);
  }

  v3 = +[AMFIConnection newConnection](AMFIConnection, "newConnection");
  objc_msgSend(v3, "setSupervisedState:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      AMFISupervisedModeSetState_cold_1();

    v6 = NSErrorToAMFIReturn(v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t AMFIDemoModeSetState(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[AMFIFMKLog generic](AMFIFMKLog, "generic");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "AMFIDemoModeSetState";
    v10 = 1024;
    v11 = a1;
    _os_log_impl(&dword_1DF2FC000, v2, OS_LOG_TYPE_DEFAULT, "[%s] setting demo state: %u", (uint8_t *)&v8, 0x12u);
  }

  v3 = +[AMFIConnection newConnection](AMFIConnection, "newConnection");
  objc_msgSend(v3, "setDemoState:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      AMFIDemoModeSetState_cold_1();

    v6 = NSErrorToAMFIReturn(v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t AMFIMDMModeEnroll(void *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  +[AMFIFMKLog generic](AMFIFMKLog, "generic");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "AMFIMDMModeEnroll";
    _os_log_impl(&dword_1DF2FC000, v2, OS_LOG_TYPE_DEFAULT, "[%s] enabling MDM state", (uint8_t *)&v8, 0xCu);
  }

  v3 = +[AMFIConnection newConnection](AMFIConnection, "newConnection");
  objc_msgSend(v3, "setManagedState:", v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      AMFIMDMModeEnroll_cold_1();

    v6 = NSErrorToAMFIReturn(v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t AMFIMDMModeRemove()
{
  NSObject *v0;
  id v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[AMFIFMKLog generic](AMFIFMKLog, "generic");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "AMFIMDMModeRemove";
    _os_log_impl(&dword_1DF2FC000, v0, OS_LOG_TYPE_DEFAULT, "[%s] removing MDM state", (uint8_t *)&v6, 0xCu);
  }

  v1 = +[AMFIConnection newConnection](AMFIConnection, "newConnection");
  objc_msgSend(v1, "removeManagedState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    +[AMFIFMKLog generic](AMFIFMKLog, "generic");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      AMFIMDMModeRemove_cold_1();

    v4 = NSErrorToAMFIReturn(v2);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x1Cu);
}

BOOL LWCRTypeVerificationNSDictionary(void *a1, int a2, _QWORD *a3)
{
  id v5;
  void *v6;
  _BOOL8 v7;
  _DWORD v9[2];
  void *v10;
  uint64_t (*v11)(void *);
  uint64_t (*v12)();
  uint64_t (*v13)(void *);
  void (*v14)(void *, void *);
  void (*v15)(void *, void *);
  void (*v16)(uint64_t, uint64_t);
  uint64_t (*v17)(uint64_t);
  uint64_t (*v18)(uint64_t, uint64_t);

  v5 = a1;
  v6 = (void *)objc_opt_new();
  v10 = v6;
  v11 = typeMaskForNSType;
  v12 = integerValueForNSNumber;
  v13 = stringValueForNSString;
  v14 = iterateDictionary;
  v15 = iterateArray;
  v9[0] = a2;
  v9[1] = 0;
  v16 = pushKeyContext;
  v17 = popKeyContext;
  v18 = setError;
  v7 = LWCRTypeVerificationBackend_verifyLWCR((uint64_t)v9, (uint64_t)v5);

  if (a3 && !v7)
  {
    objc_msgSend(v6, "synthesizeError");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

uint64_t typeMaskForNSType(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = 32;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v2 = 16;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v2 = 4;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v2 = 8;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if ((unint64_t)objc_msgSend(v1, "longLongValue") >= 2)
              v2 = 2;
            else
              v2 = 3;
          }
          else
          {
            v2 = 0;
          }
        }
      }
    }
  }

  return v2;
}

uint64_t stringValueForNSString(void *a1)
{
  return objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
}

void iterateDictionary(void *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __iterateDictionary_block_invoke;
  v5[3] = &unk_1EA986B98;
  v6 = v3;
  v4 = v3;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void iterateArray(void *a1, void *a2)
{
  unsigned int (**v3)(id, _QWORD);
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = a1;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v7)
        objc_enumerationMutation(v4);
      if (!v3[2](v3, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8)))
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

}

void pushKeyContext(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = *(id *)(a1 + 8);
  objc_msgSend(v3, "stringWithUTF8String:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushKey:", v5);

}

uint64_t popKeyContext(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 8), "popKey");
}

uint64_t setError(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 8), "setError:", a2);
}

BOOL LWCRTypeVerificationNSDictionary_RequirementsOnly(void *a1, int a2, _QWORD *a3)
{
  id v5;
  void *v6;
  _BOOL8 v7;
  _DWORD v9[2];
  void *v10;
  uint64_t (*v11)(void *);
  uint64_t (*v12)();
  uint64_t (*v13)(void *);
  void (*v14)(void *, void *);
  void (*v15)(void *, void *);
  void (*v16)(uint64_t, uint64_t);
  uint64_t (*v17)(uint64_t);
  uint64_t (*v18)(uint64_t, uint64_t);

  v5 = a1;
  v6 = (void *)objc_opt_new();
  v10 = v6;
  v11 = typeMaskForNSType;
  v12 = integerValueForNSNumber;
  v13 = stringValueForNSString;
  v14 = iterateDictionary;
  v15 = iterateArray;
  v9[0] = a2;
  v9[1] = 0;
  v16 = pushKeyContext;
  v17 = popKeyContext;
  v18 = setError;
  v7 = LWCRTypeVerificationBackend_verifyRequirements((uint64_t)v9, (uint64_t)v5);

  if (a3 && !v7)
  {
    objc_msgSend(v6, "synthesizeError");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void __iterateDictionary_block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 32);
  v10 = objc_retainAutorelease(v7);
  v9 = a3;
  LOBYTE(v8) = (*(uint64_t (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, objc_msgSend(v10, "UTF8String"), v9);

  *a4 = v8 ^ 1;
}

uint64_t __AMFIGetSecurityBootModeWithPath(void *a1, _QWORD *a2)
{
  io_registry_entry_t v3;
  io_object_t v4;
  id CFProperty;
  uint64_t v6;

  v3 = IORegistryEntryFromPath(*MEMORY[0x1E0CBBAA8], (const char *)objc_msgSend(objc_retainAutorelease(a1), "cStringUsingEncoding:", 4));
  if (!v3)
  {
    CFProperty = 0;
    goto LABEL_6;
  }
  v4 = v3;
  CFProperty = (id)IORegistryEntryCreateCFProperty(v3, CFSTR("security-mode-change-enable"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  IOObjectRelease(v4);
  if (!CFProperty)
  {
LABEL_6:
    v6 = 5;
    goto LABEL_8;
  }
  if (a2)
  {
    CFProperty = objc_retainAutorelease(CFProperty);
    v6 = 0;
    *a2 = CFProperty;
  }
  else
  {
    v6 = 0;
  }
LABEL_8:

  return v6;
}

uint64_t AMFICompleteSecurityBootMode(unsigned int a1)
{
  mach_port_t v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  io_object_t v5;
  kern_return_t v6;
  id v7;
  id v8;
  uint64_t v10;
  io_connect_t connect;

  connect = 0;
  v10 = a1;
  v2 = *MEMORY[0x1E0CBBAA8];
  v3 = IOServiceMatching("AppleMobileFileIntegrity");
  MatchingService = IOServiceGetMatchingService(v2, v3);
  v5 = MatchingService;
  if (MatchingService)
  {
    v6 = IOServiceOpen(MatchingService, *MEMORY[0x1E0C83DA0], 0, &connect);
    if (!v6)
    {
      v6 = IOConnectCallScalarMethod(connect, 0x10u, &v10, 1u, 0, 0);
      if (a1 - 1 <= 1)
      {
        v7 = +[AMFIConnection newConnection](AMFIConnection, "newConnection", v10);
        v8 = (id)objc_msgSend(v7, "initiateDeveloperModeDaemons");

      }
    }
  }
  else
  {
    v6 = -536870212;
  }
  if (connect)
    IOServiceClose(connect);
  if (v5)
    IOObjectRelease(v5);
  return 4 * (v6 != 0);
}

uint64_t AMFIArmSecurityBootMode(unsigned int a1)
{
  mach_port_t v1;
  const __CFDictionary *v2;
  io_service_t MatchingService;
  io_object_t v4;
  kern_return_t v5;
  io_connect_t v6;
  uint64_t v8;
  io_connect_t connect;

  connect = 0;
  v8 = a1;
  v1 = *MEMORY[0x1E0CBBAA8];
  v2 = IOServiceMatching("AppleMobileFileIntegrity");
  MatchingService = IOServiceGetMatchingService(v1, v2);
  if (MatchingService)
  {
    v4 = MatchingService;
    v5 = IOServiceOpen(MatchingService, *MEMORY[0x1E0C83DA0], 0, &connect);
    v6 = connect;
    if (v5)
    {
      if (!connect)
      {
LABEL_5:
        IOObjectRelease(v4);
        return 4 * (v5 != 0);
      }
    }
    else
    {
      v5 = IOConnectCallScalarMethod(connect, 0xBu, &v8, 1u, 0, 0);
      v6 = connect;
      if (!connect)
        goto LABEL_5;
    }
    IOServiceClose(v6);
    goto LABEL_5;
  }
  return 4;
}

uint64_t AMFIGetSecurityBootMode(_DWORD *a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v6;
  int v7;

  v7 = 0;
  v6 = 0;
  v2 = __AMFIGetSecurityBootModeWithPath(CFSTR("IODeviceTree:/chosen"), &v6);
  v3 = v6;
  v4 = v3;
  if (!(_DWORD)v2)
  {
    if (objc_msgSend(v3, "length") == 4)
    {
      objc_msgSend(v4, "getBytes:length:", &v7, 4);
      v2 = 0;
      if (a1)
        *a1 = v7;
    }
    else
    {
      v2 = 6;
    }
  }

  return v2;
}

uint64_t AMFIGetSecurityBootModeArmed(int *a1)
{
  unsigned int v2;
  id v3;
  int v4;
  id v5;
  void *v6;
  unint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  id v12;

  v12 = 0;
  v2 = __AMFIGetSecurityBootModeWithPath(CFSTR("IODeviceTree:/options"), &v12);
  v3 = v12;
  if (v2)
  {
    v4 = 0;
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);
    *__error() = 0;
    v5 = objc_retainAutorelease(v6);
    v7 = strtoul((const char *)objc_msgSend(v5, "cStringUsingEncoding:", 4), 0, 0);
    v8 = *__error();
    v9 = -1;
    if (v7 < 0xFFFFFFFF)
      v9 = v7;
    if (v8)
      v2 = 3;
    else
      v2 = 0;
    if (v8)
      v4 = 0;
    else
      v4 = v9;
  }
  if (v2 == 5)
    v10 = 0;
  else
    v10 = v2;
  if (a1 && !(_DWORD)v10)
  {
    if (v2 == 5)
      v4 = 0;
    *a1 = v4;
  }

  return v10;
}

uint64_t AMFIDeveloperModeCommit(int a1)
{
  uint32_t v1;
  mach_port_t v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  io_object_t v5;
  kern_return_t v6;
  io_connect_t v7;
  io_connect_t connect;

  connect = 0;
  if (a1)
    v1 = 14;
  else
    v1 = 12;
  v2 = *MEMORY[0x1E0CBBAA8];
  v3 = IOServiceMatching("AppleMobileFileIntegrity");
  MatchingService = IOServiceGetMatchingService(v2, v3);
  if (MatchingService)
  {
    v5 = MatchingService;
    v6 = IOServiceOpen(MatchingService, *MEMORY[0x1E0C83DA0], 0, &connect);
    v7 = connect;
    if (v6)
    {
      if (!connect)
      {
LABEL_8:
        IOObjectRelease(v5);
        return 4 * (v6 != 0);
      }
    }
    else
    {
      v6 = IOConnectCallScalarMethod(connect, v1, 0, 0, 0, 0);
      v7 = connect;
      if (!connect)
        goto LABEL_8;
    }
    IOServiceClose(v7);
    goto LABEL_8;
  }
  return 4;
}

BOOL LWCRTypeVerificationXPCDictionary(uint64_t a1, int a2, char **a3)
{
  _BOOL8 v5;
  _BOOL8 v6;
  _DWORD v8[2];
  uint64_t *v9;
  uint64_t (*v10)();
  int64_t (__cdecl *v11)(xpc_object_t);
  const char *(__cdecl *v12)(xpc_object_t);
  BOOL (*v13)(void *, uint64_t);
  BOOL (*v14)(void *, uint64_t);
  void (*v15)(uint64_t, const char *);
  uint64_t (*v16)(uint64_t);
  uint64_t (*v17)(uint64_t, int);
  uint64_t v18;
  xpc_object_t v19;
  unint64_t v20;

  v20 = 0xAAAAAAAAAAAAAAAALL;
  v8[0] = a2;
  v8[1] = 0;
  v9 = &v18;
  v10 = typeMaskForXPCObj;
  v11 = integerValueForXPCObj;
  v12 = stringValueForXPCObj;
  v13 = iterateDictionary_0;
  v14 = iterateArray_0;
  v15 = pushKeyContext_0;
  v16 = popKeyContext_0;
  v17 = setError_0;
  v18 = 0;
  v19 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v19 = xpc_array_create(0, 0);
  LODWORD(v20) = 0;
  v5 = LWCRTypeVerificationBackend_verifyLWCR((uint64_t)v8, a1);
  v6 = v5;
  if (a3 && !v5)
    *a3 = LWCRTypeErrorContextSynthesizeError((uint64_t)&v18);
  xpc_release(v19);
  return v6;
}

uint64_t typeMaskForXPCObj()
{
  uint64_t v0;

  v0 = MEMORY[0x1E0BFDB7C]();
  if (v0 == MEMORY[0x1E0C812F8])
    return 32;
  if (v0 == MEMORY[0x1E0C812C8])
    return 16;
  if (v0 == MEMORY[0x1E0C81390])
    return 4;
  if (v0 == MEMORY[0x1E0C812E8])
    return 8;
  if (v0 == MEMORY[0x1E0C812D0])
    return 1;
  return 2 * (v0 == MEMORY[0x1E0C81328]);
}

BOOL iterateDictionary_0(void *a1, uint64_t a2)
{
  _QWORD applier[5];

  applier[0] = MEMORY[0x1E0C809B0];
  applier[1] = 0x40000000;
  applier[2] = __iterateDictionary_block_invoke_0;
  applier[3] = &unk_1EA986BC0;
  applier[4] = a2;
  return xpc_dictionary_apply(a1, applier);
}

BOOL iterateArray_0(void *a1, uint64_t a2)
{
  _QWORD applier[5];

  applier[0] = MEMORY[0x1E0C809B0];
  applier[1] = 0x40000000;
  applier[2] = __iterateArray_block_invoke;
  applier[3] = &unk_1EA986BE8;
  applier[4] = a2;
  return xpc_array_apply(a1, applier);
}

void pushKeyContext_0(uint64_t a1, const char *a2)
{
  uint64_t v2;
  size_t v4;

  if (a2)
  {
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      if (*(_QWORD *)v2 >= xpc_array_get_count(*(xpc_object_t *)(v2 + 8)))
        v4 = -1;
      else
        v4 = *(_QWORD *)v2;
      xpc_array_set_string(*(xpc_object_t *)(v2 + 8), v4, a2);
      ++*(_QWORD *)v2;
    }
  }
}

uint64_t popKeyContext_0(uint64_t result)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(result + 8);
  if (v1)
  {
    if (*v1)
      --*v1;
  }
  return result;
}

uint64_t setError_0(uint64_t result, int a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  if (v2)
    *(_DWORD *)(v2 + 16) = a2;
  return result;
}

char *LWCRTypeErrorContextSynthesizeError(uint64_t a1)
{
  char *v2;
  int v3;
  const char *v4;
  unsigned int v5;
  size_t v6;
  unint64_t v7;

  if (!a1)
    return 0;
  v2 = (char *)malloc_type_calloc(1uLL, 0x804uLL, 0x10000406A7154B6uLL);
  if (v2)
  {
    v3 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)v2 = v3;
    v4 = LWCRTypeVerificationBackend_errorStringForCode(v3);
    v5 = snprintf(v2 + 4, 0x800uLL, "Error: %s, Context: ", v4);
    if (*(_QWORD *)a1)
    {
      if (v5 <= 0x7FF)
      {
        v6 = 0;
        do
        {
          if (v6 && (unint64_t)__strlcat_chk() > 0x7FF)
            break;
          xpc_array_get_string(*(xpc_object_t *)(a1 + 8), v6);
          v7 = __strlcat_chk();
          if (++v6 >= *(_QWORD *)a1)
            break;
        }
        while (v7 < 0x800);
      }
    }
  }
  return v2;
}

BOOL LWCRTypeVerificationXPCDictionary_RequirementsOnly(uint64_t a1, int a2, char **a3)
{
  _BOOL8 v5;
  _BOOL8 v6;
  _DWORD v8[2];
  uint64_t *v9;
  uint64_t (*v10)();
  int64_t (__cdecl *v11)(xpc_object_t);
  const char *(__cdecl *v12)(xpc_object_t);
  BOOL (*v13)(void *, uint64_t);
  BOOL (*v14)(void *, uint64_t);
  void (*v15)(uint64_t, const char *);
  uint64_t (*v16)(uint64_t);
  uint64_t (*v17)(uint64_t, int);
  uint64_t v18;
  xpc_object_t v19;
  unint64_t v20;

  v20 = 0xAAAAAAAAAAAAAAAALL;
  v8[0] = a2;
  v8[1] = 0;
  v9 = &v18;
  v10 = typeMaskForXPCObj;
  v11 = integerValueForXPCObj;
  v12 = stringValueForXPCObj;
  v13 = iterateDictionary_0;
  v14 = iterateArray_0;
  v15 = pushKeyContext_0;
  v16 = popKeyContext_0;
  v17 = setError_0;
  v18 = 0;
  v19 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v19 = xpc_array_create(0, 0);
  LODWORD(v20) = 0;
  v5 = LWCRTypeVerificationBackend_verifyRequirements((uint64_t)v8, a1);
  v6 = v5;
  if (a3 && !v5)
    *a3 = LWCRTypeErrorContextSynthesizeError((uint64_t)&v18);
  xpc_release(v19);
  return v6;
}

uint64_t __iterateDictionary_block_invoke_0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __iterateArray_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1DF3049F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1DF304C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DF304E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1DF3050E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1DF3052F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DF3054D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1DF3056E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DF3058AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DF305A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DF305BE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DF305D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DF305F24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DF3060AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AMFIExecutionPreflight_cold_1(void *a1, int a2, NSObject *a3)
{
  void *v5;
  _DWORD v6[2];
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 67109378;
  v6[1] = a2;
  v7 = 2112;
  v8 = v5;
  _os_log_error_impl(&dword_1DF2FC000, a3, OS_LOG_TYPE_ERROR, "Error cannot evaluate unknown platform (%d) for: %@", (uint8_t *)v6, 0x12u);

  OUTLINED_FUNCTION_2();
}

void AMFIExecutionPreflight_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4();
  objc_msgSend((id)OUTLINED_FUNCTION_3(v0, v1), "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DF2FC000, v3, v4, "Unexpected option(s) in dictionary: %@ for: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void AMFIExecutionPreflight_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4();
  objc_msgSend((id)OUTLINED_FUNCTION_3(v0, v1), "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DF2FC000, v3, v4, "Invalid slice offset (%@) for: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void AMFIExecutionPreflight_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4();
  objc_msgSend((id)OUTLINED_FUNCTION_3(v0, v1), "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DF2FC000, v3, v4, "Invalid cpu type (%@) for: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void AMFIExecutionPreflight_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4();
  objc_msgSend((id)OUTLINED_FUNCTION_3(v0, v1), "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DF2FC000, v3, v4, "Invalid cpu sub type (%@) for: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void AMFIExecutionPreflight_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4();
  objc_msgSend((id)OUTLINED_FUNCTION_3(v0, v1), "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DF2FC000, v3, v4, "Invalid flags (%@) for: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void AMFICopySwiftPlaygroundsSigningKey_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DF2FC000, v0, v1, "unable to add public key to AMFI", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void AMFICopySwiftPlaygroundsSigningKey_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DF2FC000, v0, v1, "unable to extract public key from local signing private key", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void AMFICopySwiftPlaygroundsSigningKey_cold_3(NSObject *a1)
{
  int v2;
  int *v3;
  char *v4;
  _DWORD v5[2];
  __int16 v6;
  char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *__error();
  v3 = __error();
  v4 = strerror(*v3);
  v5[0] = 67109378;
  v5[1] = v2;
  v6 = 2080;
  v7 = v4;
  _os_log_error_impl(&dword_1DF2FC000, a1, OS_LOG_TYPE_ERROR, "unable to add public key to AMFI: %d (%s)", (uint8_t *)v5, 0x12u);
}

void AMFICopySwiftPlaygroundsSigningKey_cold_4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1DF2FC000, a2, a3, "unexpected public key length: %lu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void AMFICopySwiftPlaygroundsSigningKey_cold_5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_1DF2FC000, a2, a3, "unable to extract public key bytes from public key: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void AMFICopySwiftPlaygroundsSigningKey_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DF2FC000, v0, v1, "unable to find local signing key on the system", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void AMFICopySwiftPlaygroundsSigningKey_cold_7(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_1DF2FC000, a2, a3, "the local signing private key is not available: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void AMFICopySwiftPlaygroundsSigningKey_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DF2FC000, v0, v1, "unable to allocate a CFNumberRef for the key size", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void AMFICopySwiftPlaygroundsSigningKey_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DF2FC000, v0, v1, "unable to allocate a SecAccessControlRef for the key access control", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void AMFICopySwiftPlaygroundsSigningKey_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DF2FC000, v0, v1, "unable to allocate a CFNumberRef for the system boundary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void AMFICopySwiftPlaygroundsSigningKey_cold_11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DF2FC000, v0, v1, "unable to allocate a CFMutableDictionaryRef for the key parameters", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void AMFICopySwiftPlaygroundsSigningKey_cold_12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DF2FC000, v0, v1, "SecKeyCreate error: <unknown>", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void AMFICopySwiftPlaygroundsSigningKey_cold_13(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1DF2FC000, a2, a3, "SecKeyCreate error: %ld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void AMFICopySwiftPlaygroundsSigningKey_cold_14(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a2;
  v5 = 2080;
  v6 = a1;
  _os_log_error_impl(&dword_1DF2FC000, log, OS_LOG_TYPE_ERROR, "SecKeyCreate error: %ld (%s)", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_5();
}

void AMFICopySwiftPlaygroundsSigningKey_cold_15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DF2FC000, v0, v1, "found untrusted object in the keychain", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void AMFICopySwiftPlaygroundsSigningKey_cold_16()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DF2FC000, v0, v1, "unable to allocate a CFMutableDictionaryRef for the keyQuery", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void AMFICopySwiftPlaygroundsSigningKey_cold_17()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DF2FC000, v0, v1, "found no local signing keys in keychain", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void AMFICopySwiftPlaygroundsSigningKey_cold_18(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1DF2FC000, a2, a3, "found multiple (%ld) local signing keys in keychain", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void AMFICopySwiftPlaygroundsSigningKey_cold_19()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DF2FC000, v0, v1, "SecItemCopyMatching returned unknown object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void AMFICopySwiftPlaygroundsSigningKey_cold_20(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_1DF2FC000, a2, a3, "unable to find local signing key in keychain: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void errorCodeForMISError_cold_1(int a1, NSObject *a2)
{
  id v3;
  _DWORD v4[2];
  __int16 v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4[0] = 67109378;
  v4[1] = a1;
  v5 = 2112;
  v6 = (id)MISCopyErrorStringForErrorCode();
  v3 = v6;
  _os_log_error_impl(&dword_1DF2FC000, a2, OS_LOG_TYPE_ERROR, "Unexpected MISError (0x%x): %@", (uint8_t *)v4, 0x12u);

}

void AMFIProfileRequiresReboot_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1DF2FC000, a1, a3, "[%s] profile UUID must be provided", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void AMFIProfileRequiresReboot_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1DF2FC000, a1, a3, "[%s] must capture reboot requirement", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void _getProfileAuxiliarySignature_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1DF2FC000, v0, v1, "[%s] missing Team ID: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void _getProfileAuxiliarySignature_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_0(&dword_1DF2FC000, v0, v1, "[%s] missing profile: %@ | %u", v2);
  OUTLINED_FUNCTION_6();
}

void AMFIProfileScheduleTrust_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1DF2FC000, a1, a3, "[%s] profile UUID must be provided", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void AMFIProfileScheduleTrust_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1DF2FC000, v0, v1, "[%s] no reboot requirement: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void AMFIProfileScheduleTrust_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1DF2FC000, v0, v1, "[%s] unable to stage profile: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void AMFIProfileScheduleTrust_cold_4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_0(&dword_1DF2FC000, v0, v1, "[%s] unable to check for reboot: %@ | %u", v2);
  OUTLINED_FUNCTION_6();
}

void AMFIProfileGetScheduledProfile_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1DF2FC000, a1, a3, "[%s] must capture scheduled profile", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void AMFIProfileGetScheduledProfile_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1DF2FC000, v0, v1, "[%s] missing Team ID: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void AMFIProfileGetScheduledProfile_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1DF2FC000, v0, v1, "[%s] missing Team Name: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void AMFIProfileGetScheduledProfile_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1DF2FC000, v0, v1, "[%s] missing profile: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void AMFIProfileGetScheduledProfile_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1DF2FC000, v0, v1, "[%s] unable to acquire staged profile: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void AMFIProfileCommitProfile_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1DF2FC000, v0, v1, "[%s] unable to commit profile: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void AMFIProfileSetTrustWithOptions_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1DF2FC000, a1, a3, "[%s] profile UUID must be provided", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void AMFIProfileSetTrustWithOptions_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1DF2FC000, v0, v1, "[%s] unable to set trust: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void AMFIProfileSetTrustWithOptions_cold_3()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0_1();
  v4 = v0;
  v5 = v1;
  _os_log_error_impl(&dword_1DF2FC000, v2, OS_LOG_TYPE_ERROR, "[%s] unable to create aux-sig: %@ | %@ (not-fatal)", (uint8_t *)v3, 0x20u);
  OUTLINED_FUNCTION_6();
}

void AMFIProfileSetTrustWithOptions_cold_4(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "AMFIProfileSetTrustWithOptions";
  v4 = 1024;
  v5 = a1;
  _os_log_error_impl(&dword_1DF2FC000, a2, OS_LOG_TYPE_ERROR, "[%s] unknown trust type: %u", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_5();
}

void AMFIProfileRemoveTrust_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1DF2FC000, a1, a3, "[%s] profile UUID must be provided", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void AMFIProfileRemoveTrust_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1DF2FC000, v0, v1, "[%s] unable to remove trust: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void AMFISupervisedModeSetState_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1DF2FC000, v0, v1, "[%s] unable to set state: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void AMFIDemoModeSetState_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1DF2FC000, v0, v1, "[%s] unable to set state: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void AMFIMDMModeEnroll_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1DF2FC000, v0, v1, "[%s] unable to enable MDM: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

void AMFIMDMModeRemove_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1DF2FC000, v0, v1, "[%s] unable to remove MDM: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFStringRef CFErrorCopyFailureReason(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x1E0C98638](err);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1E0C98660](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x1E0CBAD88](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1E0CBB918](*(_QWORD *)&mainPort, path);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1E0CBB9D0](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1E0CBBA10](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t MISCopyAuxiliarySignature()
{
  return MEMORY[0x1E0DE7178]();
}

uint64_t MISCopyErrorStringForErrorCode()
{
  return MEMORY[0x1E0DE7180]();
}

uint64_t MISCopyProvisioningProfile()
{
  return MEMORY[0x1E0DE7188]();
}

uint64_t MISEnumerateMatchingProfiles()
{
  return MEMORY[0x1E0DE71A0]();
}

uint64_t MISProfileCreateDataRepresentation()
{
  return MEMORY[0x1E0DE71C0]();
}

uint64_t MISProfileGetValue()
{
  return MEMORY[0x1E0DE71D8]();
}

uint64_t MISProfileIsDEREncoded()
{
  return MEMORY[0x1E0DE71E0]();
}

uint64_t MISProfileSupportsAuxiliarySignature()
{
  return MEMORY[0x1E0DE71E8]();
}

uint64_t MISProvisioningProfileGetTeamIdentifier()
{
  return MEMORY[0x1E0DE7200]();
}

uint64_t MISValidateSignatureAndCopyInfo()
{
  return MEMORY[0x1E0DE7248]();
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x1E0CD5EA8](allocator, protection, flags, error);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6298](query, result);
}

uint64_t SecKeyCopyPublicBytes()
{
  return MEMORY[0x1E0CD6310]();
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x1E0CD6318](key);
}

uint64_t SecKeyCopySystemKey()
{
  return MEMORY[0x1E0CD6330]();
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1E0CD6388](parameters, error);
}

CFTypeID SecKeyGetTypeID(void)
{
  return MEMORY[0x1E0CD63E8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __sandbox_ms()
{
  return MEMORY[0x1E0C80BC0]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1E0C80C40]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t posix_spawnattr_setmacpolicyinfo_np()
{
  return MEMORY[0x1E0C84B98]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85460](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85698](__str, __endptr, *(_QWORD *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1E0C85E70](xarray, index);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  MEMORY[0x1E0C85ED0](xarray, index, string);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1E0C86570](xint);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

