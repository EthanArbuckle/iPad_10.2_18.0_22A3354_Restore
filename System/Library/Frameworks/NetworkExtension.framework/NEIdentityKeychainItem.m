@implementation NEIdentityKeychainItem

- (NEIdentityKeychainItem)initWithPassword:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5
{

  return 0;
}

- (NEIdentityKeychainItem)initWithData:(id)a3 domain:(int64_t)a4 accessGroup:(id)a5
{

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[NEKeychainItem persistentReference](self, "persistentReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NEKeychainItem domain](self, "domain");
  -[NEKeychainItem accessGroup](self, "accessGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithPersistentReference:domain:accessGroup:", v5, v6, v7);

  return v8;
}

- (id)copyPassword
{
  return 0;
}

- (id)copyData
{
  return 0;
}

- (id)copyQueryWithReturnTypes:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NEKeychainItem persistentReference](self, "persistentReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (v4)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CB0], *MEMORY[0x1E0CD6C98]);
    -[NEKeychainItem persistentReference](self, "persistentReference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (_QWORD *)MEMORY[0x1E0CD70E0];
  }
  else
  {
    -[NEKeychainItem identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_8;
    objc_msgSend(v5, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CB0], *MEMORY[0x1E0CD6C98]);
    -[NEKeychainItem identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (_QWORD *)MEMORY[0x1E0CD6A90];
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *v8);

LABEL_8:
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    v14 = MEMORY[0x1E0C9AAB0];
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15++), (_QWORD)v17);
      }
      while (v12 != v15);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD70C0]);
  return v5;
}

- (void)sync
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  const __CFDictionary *v9;
  void *v10;
  void *v11;
  const __CFDictionary *v12;
  OSStatus v13;
  OSStatus v14;
  NSObject *v15;
  void *v16;
  CFTypeRef v17;
  CFTypeID TypeID;
  __CFString *v19;
  __CFString *v20;
  NEIdentityKeychainItem *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const __CFDictionary *v28;
  uint64_t v29;
  uint64_t v30;
  const __CFDictionary *v31;
  void *v32;
  const __CFDictionary *v33;
  OSStatus v34;
  OSStatus v35;
  NSObject *v36;
  const char *v37;
  const char *v38;
  NSObject *v39;
  uint32_t v40;
  OSStatus v41;
  OSStatus v42;
  const char *v43;
  void *v44;
  CFTypeRef result;
  id v46;
  _BYTE buf[12];
  __int16 v48;
  NSObject *v49;
  __int16 v50;
  OSStatus v51;
  uint64_t v52;
  void *v53;
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[2];
  uint64_t v57;
  _QWORD v58[2];
  uint64_t v59;
  uint64_t v60;
  _QWORD v61[3];

  v61[1] = *MEMORY[0x1E0C80C00];
  -[NEKeychainItem persistentReference](self, "persistentReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[NEKeychainItem identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v46 = 0;
      v5 = -[NEKeychainItem copyDataFromKeychainItem:outData:outIdentifier:outPersistentReference:](self, 0, 0, &v46);
      v6 = v46;
      if (v5)
        -[NEKeychainItem setPersistentReference:](self, "setPersistentReference:", v6);

    }
  }
  -[NEKeychainItem persistentReference](self, "persistentReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    result = 0;
    v61[0] = *MEMORY[0x1E0CD7028];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NEIdentityKeychainItem copyQueryWithReturnTypes:](self, "copyQueryWithReturnTypes:", v8);

    if (!SecItemCopyMatching(v9, &result))
    {
      v17 = result;
      TypeID = SecIdentityGetTypeID();
      if (v17)
      {
        if (CFGetTypeID(v17) == TypeID)
        {
          *(_QWORD *)buf = 0;
          if (!SecIdentityCopyCertificate((SecIdentityRef)result, (SecCertificateRef *)buf))
          {
            v19 = (__CFString *)SecCertificateCopySubjectSummary(*(SecCertificateRef *)buf);
            v20 = v19;
            if (self)
            {
              v21 = self;
              objc_sync_enter(v21);
              objc_storeStrong((id *)&v21->super._identifier, v19);
              objc_sync_exit(v21);

            }
            CFRelease(*(CFTypeRef *)buf);
          }
        }
      }
    }
    if (result)
      CFRelease(result);
    -[NEKeychainItem accessGroup](self, "accessGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_40;
    result = 0;
    v60 = *MEMORY[0x1E0CD7010];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NEIdentityKeychainItem copyQueryWithReturnTypes:](self, "copyQueryWithReturnTypes:", v11);

    v13 = SecItemCopyMatching(v12, &result);
    if (v13)
    {
      v14 = v13;
      ne_log_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        -[NEKeychainItem persistentReference](self, "persistentReference");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v16;
        v48 = 1024;
        LODWORD(v49) = v14;
        _os_log_error_impl(&dword_19BD16000, v15, OS_LOG_TYPE_ERROR, "Cannot update access group, failed to find item with persistent reference %@: %d", buf, 0x12u);

      }
      goto LABEL_37;
    }
    v15 = (id)result;
    if (isa_nsdictionary(v15))
    {
      v22 = *MEMORY[0x1E0CD6B30];
      -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B30]);
      v23 = objc_claimAutoreleasedReturnValue();
      if (isa_nsdata(v23))
      {
        v25 = *MEMORY[0x1E0CD6CA0];
        v56[0] = *MEMORY[0x1E0CD6C98];
        v24 = v56[0];
        v56[1] = v22;
        v58[0] = v25;
        v58[1] = v23;
        v57 = *MEMORY[0x1E0CD70C0];
        v26 = v57;
        v59 = *MEMORY[0x1E0C9AE50];
        v27 = v59;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v56, 3);
        v28 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        v29 = *MEMORY[0x1E0CD6CC0];
        v30 = *MEMORY[0x1E0CD6900];
        v54[0] = v24;
        v54[1] = v30;
        v55[0] = v29;
        v55[1] = v23;
        v54[2] = v26;
        v55[2] = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 3);
        v31 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        v52 = *MEMORY[0x1E0CD6898];
        -[NEKeychainItem accessGroup](self, "accessGroup");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v32;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
        v33 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

        v34 = SecItemUpdate(v28, v33);
        if (v34)
        {
          v35 = v34;
          ne_log_obj();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            -[NEKeychainItem accessGroup](self, "accessGroup");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v44;
            v48 = 2112;
            v49 = v23;
            v50 = 1024;
            v51 = v35;
            v37 = "Failed to update the access group to %@ for certificate %@: %d";
LABEL_45:
            _os_log_error_impl(&dword_19BD16000, v36, OS_LOG_TYPE_ERROR, v37, buf, 0x1Cu);

          }
        }
        else
        {
          v41 = SecItemUpdate(v31, v33);
          if (!v41)
          {
LABEL_34:

            goto LABEL_35;
          }
          v42 = v41;
          ne_log_obj();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            -[NEKeychainItem accessGroup](self, "accessGroup");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v44;
            v48 = 2112;
            v49 = v23;
            v50 = 1024;
            v51 = v42;
            v37 = "Failed to update the access group to %@ for key %@: %d";
            goto LABEL_45;
          }
        }

        goto LABEL_34;
      }
      ne_log_obj();
      v28 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
      {
LABEL_35:

        goto LABEL_36;
      }
      *(_WORD *)buf = 0;
      v38 = "Cannot update access group, identity has no public key hash attribute";
      v39 = v28;
      v40 = 2;
    }
    else
    {
      ne_log_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
LABEL_36:

LABEL_37:
        -[NEKeychainItem setAccessGroup:](self, "setAccessGroup:", 0);
        if (result)
          CFRelease(result);

LABEL_40:
        goto LABEL_41;
      }
      -[NEKeychainItem persistentReference](self, "persistentReference");
      v28 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v28;
      v38 = "Cannot update access group, failed to fetch attributes for persistent reference %@";
      v39 = v23;
      v40 = 12;
    }
    _os_log_error_impl(&dword_19BD16000, v39, OS_LOG_TYPE_ERROR, v38, buf, v40);
    goto LABEL_35;
  }
LABEL_41:
  -[NEKeychainItem setData:](self, "setData:", 0);
  if (self)
    objc_setProperty_atomic_copy(self, v43, 0, 72);
}

+ (id)copyIdentities:(id)a3 fromDomain:(int64_t)a4
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  OSStatus v9;
  OSStatus v10;
  NSObject *v11;
  id v12;
  CFTypeRef v14;
  CFTypeID TypeID;
  CFIndex v16;
  const __CFArray *v17;
  _UNKNOWN **v18;
  __SecIdentity *ValueAtIndex;
  CFTypeID v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CFTypeRef v26;
  CFTypeID v27;
  CFTypeRef v28;
  NSObject *v29;
  CFTypeID v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  id v34;
  CFTypeRef result;
  uint8_t buf[4];
  CFTypeID v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  result = 0;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CB0], *MEMORY[0x1E0CD6C98]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7028]);
  if (v4)
  {
    v6 = *MEMORY[0x1E0CD70E0];
    v7 = v5;
    v8 = v4;
  }
  else
  {
    v8 = (id)*MEMORY[0x1E0CD6F38];
    v6 = *MEMORY[0x1E0CD6F30];
    v7 = v5;
  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v6);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD70C0]);
  v9 = SecItemCopyMatching((CFDictionaryRef)v5, &result);
  if (v9)
  {
    v10 = v9;
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    *(_DWORD *)buf = 67109120;
    LODWORD(v37) = v10;
    v31 = "SecItemCopyMatching failed: %d";
    v32 = v11;
    v33 = 8;
    goto LABEL_35;
  }
  v14 = result;
  TypeID = CFArrayGetTypeID();
  if (v14 && CFGetTypeID(v14) == TypeID)
  {
    v34 = v4;
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v16 = 0;
    v12 = 0;
    v17 = (const __CFArray *)result;
    v18 = &off_1E3CBB000;
    while (v16 < CFArrayGetCount(v17))
    {
      ValueAtIndex = (__SecIdentity *)CFArrayGetValueAtIndex(v17, v16);
      v20 = SecIdentityGetTypeID();
      if (ValueAtIndex && CFGetTypeID(ValueAtIndex) == v20)
      {
        v21 = (void *)+[NEIdentityKeychainItem copyPropertiesForIdentity:persistentReference:]((uint64_t)v18[402], ValueAtIndex, 0);
        v22 = v21;
        if (v21)
        {
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("persistent-reference"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v24)
          {
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("persistent-reference"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v22, v25);

            if (!v12)
              v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v12, "addObject:", v22, v34);
            v18 = &off_1E3CBB000;
          }

        }
      }
      ++v16;
    }
    v4 = v34;
  }
  else
  {
    v26 = result;
    v27 = SecIdentityGetTypeID();
    if (!v26 || CFGetTypeID(v26) != v27)
    {
      v28 = result;
      ne_log_obj();
      v29 = objc_claimAutoreleasedReturnValue();
      v11 = v29;
      if (!v28)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19BD16000, v11, OS_LOG_TYPE_INFO, "SecItemCopyMatching returned NULL while searching for identities", buf, 2u);
        }
        goto LABEL_6;
      }
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
LABEL_6:
        v12 = 0;
        goto LABEL_7;
      }
      v30 = CFGetTypeID(result);
      *(_DWORD *)buf = 134217984;
      v37 = v30;
      v31 = "SecItemCopyMatching returned an unsupported type (%lu) when searching for identities";
      v32 = v11;
      v33 = 12;
LABEL_35:
      _os_log_error_impl(&dword_19BD16000, v32, OS_LOG_TYPE_ERROR, v31, buf, v33);
      goto LABEL_6;
    }
    v11 = +[NEIdentityKeychainItem copyPropertiesForIdentity:persistentReference:]((uint64_t)NEIdentityKeychainItem, (__SecIdentity *)result, v4);
    if (!v11)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_7:

  if (result)
    CFRelease(result);

  return v12;
}

+ (id)importPKCS12Data:(id)a3 passphrase:(id)a4
{
  const __CFData *v5;
  id v6;
  void *v7;
  uint64_t v8;
  const __CFDictionary *v9;
  __CFArray *v10;
  const __CFAllocator *v12;
  __CFDictionary *Mutable;
  CFMutableArrayRef v14;
  BOOL v15;
  const __CFDictionary *ValueAtIndex;
  CFIndex v17;
  const void *v18;
  const void *v19;
  const void *v20;
  const void *v21;
  const void *v22;
  SecCertificateRef CertificateAtIndex;
  OSStatus v24;
  __SecTrust *trust;
  __CFArray *theArray;
  void *key;
  CFIndex CertificateCount;
  __SecCertificate *Value;
  CFTypeRef result;
  CFArrayRef items;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v5 = (const __CFData *)a3;
  v6 = a4;
  v7 = v6;
  if (!v6)
  {
    v10 = 0;
    goto LABEL_7;
  }
  v8 = *MEMORY[0x1E0CD6D58];
  items = 0;
  v32 = v8;
  v33[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (v9 && !SecPKCS12Import(v5, v9, &items))
  {
    v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v14 = CFArrayCreateMutable(v12, 0, MEMORY[0x1E0C9B378]);
    v10 = 0;
    theArray = v14;
    if (Mutable)
      v15 = v14 == 0;
    else
      v15 = 1;
    if (v15)
      goto LABEL_5;
    if (CFArrayGetCount(items))
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(items, 0);
      Value = (__SecCertificate *)CFDictionaryGetValue(ValueAtIndex, (const void *)*MEMORY[0x1E0CD6D60]);
      trust = (__SecTrust *)CFDictionaryGetValue(ValueAtIndex, (const void *)*MEMORY[0x1E0CD6D68]);
      CertificateCount = SecTrustGetCertificateCount(trust);
      if (CertificateCount >= 1)
      {
        v17 = 0;
        key = (void *)*MEMORY[0x1E0CD70E8];
        v18 = (const void *)*MEMORY[0x1E0CD7020];
        v19 = (const void *)*MEMORY[0x1E0C9AE50];
        v20 = (const void *)*MEMORY[0x1E0CD68A0];
        v21 = (const void *)*MEMORY[0x1E0CD68A8];
        v22 = (const void *)*MEMORY[0x1E0CD70C0];
        do
        {
          result = 0;
          CertificateAtIndex = Value;
          if (v17)
            CertificateAtIndex = SecTrustGetCertificateAtIndex(trust, v17);
          CFDictionarySetValue(Mutable, key, CertificateAtIndex);
          CFDictionarySetValue(Mutable, v18, v19);
          CFDictionarySetValue(Mutable, v20, v21);
          CFDictionarySetValue(Mutable, v22, v19);
          v24 = SecItemAdd(Mutable, &result);
          if (v24 == -25299)
          {
            CFDictionaryRemoveValue(Mutable, v20);
            v24 = SecItemCopyMatching(Mutable, &result);
          }
          if (!v24 && result)
          {
            CFArrayAppendValue(theArray, result);
            CFRelease(result);
          }
          ++v17;
        }
        while (CertificateCount != v17);
      }
      CFRelease(Mutable);
      CFRelease(items);
      v10 = theArray;
      goto LABEL_5;
    }
  }
  v10 = 0;
LABEL_5:

LABEL_7:
  return v10;
}

+ (uint64_t)copyPropertiesForIdentity:(void *)a3 persistentReference:
{
  id v4;
  uint64_t v5;
  OSStatus v6;
  OSStatus v7;
  NSObject *v8;
  uint64_t v9;
  __SecCertificate *v10;
  const __CFDictionary *v11;
  CFTypeRef v12;
  CFTypeID TypeID;
  CFTypeID v14;
  CFTypeID v15;
  NSObject *v16;
  _BOOL4 v17;
  CFTypeID v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  CFTypeRef result;
  _QWORD v24[2];
  _QWORD v25[2];
  uint8_t v26[4];
  CFTypeID v27;
  SecCertificateRef certificateRef[3];
  _BYTE buf[24];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_self();
  if (v4)
    goto LABEL_2;
  objc_opt_self();
  result = 0;
  v10 = (__SecCertificate *)*MEMORY[0x1E0CD70E8];
  certificateRef[0] = *(SecCertificateRef *)MEMORY[0x1E0CD7020];
  certificateRef[1] = v10;
  *(_QWORD *)buf = MEMORY[0x1E0C9AAB0];
  *(_QWORD *)&buf[8] = a2;
  certificateRef[2] = *(SecCertificateRef *)MEMORY[0x1E0CD70C0];
  *(_QWORD *)&buf[16] = *MEMORY[0x1E0C9AE50];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, certificateRef, 3);
  v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (SecItemCopyMatching(v11, &result))
    goto LABEL_19;
  v12 = result;
  TypeID = CFDataGetTypeID();
  if (!v12)
  {
    v4 = (id)result;
LABEL_14:
    ne_log_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      if (v17)
      {
        v18 = CFGetTypeID(result);
        *(_DWORD *)v26 = 134217984;
        v27 = v18;
        v19 = "SecItemCopyMatching returned an object with an unexpected type (%lu) when getting an identity's persistent reference";
        v20 = v16;
        v21 = 12;
LABEL_25:
        _os_log_error_impl(&dword_19BD16000, v20, OS_LOG_TYPE_ERROR, v19, v26, v21);
      }
    }
    else if (v17)
    {
      *(_WORD *)v26 = 0;
      v19 = "SecItemCopyMatching returned NULL when getting an identity's persistent reference";
      v20 = v16;
      v21 = 2;
      goto LABEL_25;
    }

LABEL_19:
    if (result)
      CFRelease(result);

    v4 = 0;
    goto LABEL_22;
  }
  v14 = TypeID;
  v15 = CFGetTypeID(v12);
  v4 = (id)result;
  if (v15 != v14)
    goto LABEL_14;

  if (!v4)
  {
LABEL_22:
    v9 = 0;
    goto LABEL_23;
  }
LABEL_2:
  certificateRef[0] = 0;
  v6 = SecIdentityCopyCertificate(a2, certificateRef);
  if (v6)
  {
    v7 = v6;
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v7;
      _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "%@: failed to get the certificate from an identity: %d", buf, 0x12u);
    }
    v9 = 0;
  }
  else
  {
    v8 = SecCertificateCopyData(certificateRef[0]);
    CFRelease(certificateRef[0]);
    v24[0] = CFSTR("persistent-reference");
    v24[1] = CFSTR("certificate-data");
    v25[0] = v4;
    v25[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v9 = objc_claimAutoreleasedReturnValue();
  }

LABEL_23:
  return v9;
}

@end
