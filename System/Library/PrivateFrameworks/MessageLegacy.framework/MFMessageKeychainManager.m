@implementation MFMessageKeychainManager

+ (void)initialize
{
  if (!_keychainLock)
    _keychainLock = objc_msgSend(objc_alloc(MEMORY[0x1E0D460A8]), "initWithName:andDelegate:", CFSTR("keychainLock"), 0);
}

+ (id)_passwordForHost:(id)a3 username:(id)a4 port:(int)a5 keychainProtocol:(__CFString *)a6
{
  const __CFAllocator *v9;
  CFNumberRef v10;
  __CFDictionary *Mutable;
  OSStatus v12;
  void *v13;
  BOOL v14;
  id v15;
  CFTypeRef cf;
  int valuePtr;

  valuePtr = a5;
  if (objc_msgSend(a3, "length") && objc_msgSend(a4, "length"))
  {
    v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v10 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
    Mutable = CFDictionaryCreateMutable(v9, 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CB8]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B50], a3);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6AC8], v10);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6AD0], a6);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68F8], a4);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD7018], (const void *)*MEMORY[0x1E0C9AE50]);
    cf = 0;
    v12 = SecItemCopyMatching(Mutable, &cf);
    CFRelease(v10);
    CFRelease(Mutable);
    v13 = 0;
    if (v12)
      v14 = 1;
    else
      v14 = cf == 0;
    if (!v14)
    {
      v15 = objc_alloc(MEMORY[0x1E0CB3940]);
      v13 = (void *)objc_msgSend(v15, "initWithData:encoding:", cf, 4);
      CFRelease(cf);
    }
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

+ (id)passwordForHost:(id)a3 username:(id)a4 port:(int)a5 keychainProtocol:(void *)a6
{
  uint64_t v7;
  void *v11;

  v7 = *(_QWORD *)&a5;
  objc_msgSend((id)_keychainLock, "mf_waitForLock");
  v11 = (void *)objc_msgSend(a1, "_passwordForHost:username:port:keychainProtocol:", a3, a4, v7, a6);
  objc_msgSend((id)_keychainLock, "unlock");
  return v11;
}

+ (void)setPassword:(id)a3 forHost:(id)a4 username:(id)a5 port:(int)a6 keychainProtocol:(void *)a7 keychainAccessibility:(void *)a8
{
  const __CFAllocator *v14;
  CFNumberRef v15;
  CFNumberRef v16;
  uint64_t v17;
  const void *v18;
  __CFDictionary *Mutable;
  __CFDictionary *v20;
  const void *v21;
  const void *v22;
  __CFDictionary *v23;
  __CFDictionary *v24;
  void *v25;
  CFTypeRef result;
  unsigned int valuePtr;

  valuePtr = a6;
  objc_msgSend((id)_keychainLock, "mf_waitForLock");
  v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v15 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
  if (v15)
  {
    v16 = v15;
    if (objc_msgSend(a4, "length"))
    {
      if (objc_msgSend(a5, "length"))
      {
        if (objc_msgSend(a3, "length"))
        {
          v17 = objc_msgSend(a3, "dataUsingEncoding:", 4);
          if (v17)
          {
            v18 = (const void *)v17;
            v25 = (void *)objc_msgSend(a1, "_passwordForHost:username:port:keychainProtocol:", a4, a5, valuePtr, a7);
            Mutable = CFDictionaryCreateMutable(v14, 0, 0, 0);
            if (Mutable)
            {
              v20 = Mutable;
              CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CB8]);
              CFDictionaryAddValue(v20, (const void *)*MEMORY[0x1E0CD6B50], a4);
              CFDictionaryAddValue(v20, (const void *)*MEMORY[0x1E0CD6AC8], v16);
              CFDictionaryAddValue(v20, (const void *)*MEMORY[0x1E0CD6AD0], a7);
              CFDictionaryAddValue(v20, (const void *)*MEMORY[0x1E0CD68F8], a5);
              v21 = (const void *)*MEMORY[0x1E0CD6B80];
              v22 = (const void *)*MEMORY[0x1E0C9AE50];
              CFDictionaryAddValue(v20, (const void *)*MEMORY[0x1E0CD6B80], (const void *)*MEMORY[0x1E0C9AE50]);
              if (v25)
              {
                if ((objc_msgSend(v25, "isEqualToString:", a3) & 1) == 0)
                {
                  v23 = CFDictionaryCreateMutable(v14, 0, 0, 0);
                  if (v23)
                  {
                    v24 = v23;
                    CFDictionaryAddValue(v23, (const void *)*MEMORY[0x1E0CD70D8], v18);
                    CFDictionaryAddValue(v24, (const void *)*MEMORY[0x1E0CD68A0], a8);
                    CFDictionaryAddValue(v24, v21, v22);
                    SecItemUpdate(v20, v24);
                    CFRelease(v24);
                  }
                }
              }
              else
              {
                result = 0;
                CFDictionaryAddValue(v20, (const void *)*MEMORY[0x1E0CD70D8], v18);
                CFDictionaryAddValue(v20, (const void *)*MEMORY[0x1E0CD68A0], a8);
                SecItemAdd(v20, &result);
              }
              CFRelease(v20);
            }
          }
        }
      }
    }
    CFRelease(v16);
  }
  objc_msgSend((id)_keychainLock, "unlock");
}

+ (void)removePasswordForHost:(id)a3 username:(id)a4 port:(int)a5 keychainProtocol:(void *)a6
{
  const __CFAllocator *v9;
  CFNumberRef v10;
  __CFDictionary *Mutable;
  int valuePtr;

  valuePtr = a5;
  objc_msgSend((id)_keychainLock, "mf_waitForLock");
  if (objc_msgSend(a3, "length") && objc_msgSend(a4, "length"))
  {
    v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v10 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
    Mutable = CFDictionaryCreateMutable(v9, 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CB8]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B50], a3);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6AC8], v10);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6AD0], a6);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68F8], a4);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B80], (const void *)*MEMORY[0x1E0C9AE50]);
    SecItemDelete(Mutable);
    CFRelease(v10);
    CFRelease(Mutable);
  }
  objc_msgSend((id)_keychainLock, "unlock");
}

+ (id)_passwordForGenericAccount:(id)a3 service:(id)a4 error:(id *)a5
{
  __CFDictionary *Mutable;
  OSStatus v9;
  BOOL v10;
  OSStatus v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  id v15;
  void *v16;
  CFTypeRef result;
  uint8_t buf[4];
  OSStatus v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "length") && objc_msgSend(a4, "length"))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CA8]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68F8], a3);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B58], a4);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD7018], (const void *)*MEMORY[0x1E0C9AE50]);
    result = 0;
    v9 = SecItemCopyMatching(Mutable, &result);
    if (v9)
      v10 = 1;
    else
      v10 = result == 0;
    if (v10)
    {
      v11 = v9;
      v12 = MFLogGeneral();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (v13)
        {
          *(_DWORD *)buf = 67109120;
          v20 = v11;
          _os_log_impl(&dword_1C8839000, v12, OS_LOG_TYPE_DEFAULT, "#Warning SecItemCopyMatching result: %d", buf, 8u);
        }
        if (!a5)
        {
          v16 = 0;
          goto LABEL_20;
        }
        v14 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v11, 0);
        v16 = 0;
      }
      else
      {
        if (v13)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C8839000, v12, OS_LOG_TYPE_DEFAULT, "SecItemCopyMatching succeeded with empty results", buf, 2u);
        }
        v14 = 0;
        v16 = 0;
        if (!a5)
          goto LABEL_20;
      }
    }
    else
    {
      v15 = objc_alloc(MEMORY[0x1E0CB3940]);
      v16 = (void *)objc_msgSend(v15, "initWithData:encoding:", result, 4);
      CFRelease(result);
      if (!a5)
        goto LABEL_20;
      v14 = 0;
    }
    *a5 = v14;
LABEL_20:
    CFRelease(Mutable);
    return v16;
  }
  v16 = 0;
  return v16;
}

+ (id)passwordForServiceName:(id)a3 accountName:(id)a4 synchronizable:(BOOL)a5 error:(id *)a6
{
  void *v10;

  objc_msgSend((id)_keychainLock, "mf_waitForLock", a3, a4, a5);
  v10 = (void *)objc_msgSend(a1, "_passwordForGenericAccount:service:error:", a4, a3, a6);
  objc_msgSend((id)_keychainLock, "unlock");
  return v10;
}

+ (id)passwordForServiceName:(id)a3 accountName:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "passwordForServiceName:accountName:synchronizable:error:", a3, a4, 1, a5);
}

+ (id)passwordForServiceName:(id)a3 accountName:(id)a4
{
  return (id)objc_msgSend(a1, "passwordForServiceName:accountName:error:", a3, a4, 0);
}

+ (BOOL)addPassword:(id)a3 forServiceName:(id)a4 accountName:(id)a5 keychainAccessibility:(void *)a6 synchronizable:(BOOL)a7 error:(id *)a8
{
  _BOOL8 v9;
  const void *v14;
  __CFDictionary *Mutable;
  OSStatus v16;
  NSObject *v17;
  CFTypeRef result;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v9 = a7;
  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)_keychainLock, "mf_waitForLock");
  if (objc_msgSend(a4, "length") && objc_msgSend(a3, "length") && objc_msgSend(a5, "length"))
  {
    v14 = (const void *)objc_msgSend(a3, "dataUsingEncoding:", 4);
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CA8]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68F8], a5);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B58], a4);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B80], (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9));
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD70D8], v14);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68A0], a6);
    result = 0;
    v16 = SecItemAdd(Mutable, &result);
    if (v16)
    {
      v17 = MFLogGeneral();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v21 = v16;
        _os_log_impl(&dword_1C8839000, v17, OS_LOG_TYPE_DEFAULT, "#Warning SecItemAdd result: %ld", buf, 0xCu);
      }
    }
    CFRelease(Mutable);
  }
  else
  {
    v16 = -25291;
  }
  objc_msgSend((id)_keychainLock, "unlock");
  if (a8 && v16)
    *a8 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v16, 0);
  return v16 == 0;
}

+ (void)setPassword:(id)a3 forServiceName:(id)a4 accountName:(id)a5 keychainAccessibility:(void *)a6
{
  const void *v11;
  const __CFAllocator *v12;
  __CFDictionary *Mutable;
  const void *v14;
  const void *v15;
  void *v16;
  __CFDictionary *v17;
  OSStatus v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  OSStatus v22;
  OSStatus v23;
  NSObject *v24;
  CFTypeRef result;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)_keychainLock, "mf_waitForLock");
  if (objc_msgSend(a4, "length") && objc_msgSend(a3, "length") && objc_msgSend(a5, "length"))
  {
    v11 = (const void *)objc_msgSend(a3, "dataUsingEncoding:", 4);
    v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CA8]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68F8], a5);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B58], a4);
    v14 = (const void *)*MEMORY[0x1E0CD6B80];
    v15 = (const void *)*MEMORY[0x1E0C9AE50];
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B80], (const void *)*MEMORY[0x1E0C9AE50]);
    v16 = (void *)objc_msgSend(a1, "_passwordForGenericAccount:service:error:", a5, a4, 0);
    if (v16)
    {
      if ((objc_msgSend(v16, "isEqualToString:", a3) & 1) != 0)
        goto LABEL_15;
      v17 = CFDictionaryCreateMutable(v12, 0, 0, 0);
      CFDictionaryAddValue(v17, (const void *)*MEMORY[0x1E0CD70D8], v11);
      CFDictionaryAddValue(v17, (const void *)*MEMORY[0x1E0CD68A0], a6);
      CFDictionaryAddValue(v17, v14, v15);
      v18 = SecItemUpdate(Mutable, v17);
      if (v17)
        CFRelease(v17);
      if (!v18)
        goto LABEL_15;
      v19 = MFLogGeneral();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_DWORD *)buf = 134217984;
      v27 = v18;
      v20 = "#Warning SecItemUpdate result: %ld";
      v21 = v19;
    }
    else
    {
      result = 0;
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD70D8], v11);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68A0], a6);
      v22 = SecItemAdd(Mutable, &result);
      if (!v22)
        goto LABEL_15;
      v23 = v22;
      v24 = MFLogGeneral();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_DWORD *)buf = 134217984;
      v27 = v23;
      v20 = "#Warning SecItemAdd result: %ld";
      v21 = v24;
    }
    _os_log_impl(&dword_1C8839000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
LABEL_15:
    CFRelease(Mutable);
  }
  objc_msgSend((id)_keychainLock, "unlock");
}

+ (void)removePasswordForServiceName:(id)a3 accountName:(id)a4
{
  __CFDictionary *Mutable;
  OSStatus v7;
  OSStatus v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)_keychainLock, "mf_waitForLock");
  if (objc_msgSend(a3, "length") && objc_msgSend(a4, "length"))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CA8]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68F8], a4);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B58], a3);
    v7 = SecItemDelete(Mutable);
    if (v7)
    {
      v8 = v7;
      v9 = MFLogGeneral();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 134217984;
        v11 = v8;
        _os_log_impl(&dword_1C8839000, v9, OS_LOG_TYPE_DEFAULT, "#Warning SecItemDelete result: %ld", (uint8_t *)&v10, 0xCu);
      }
    }
    CFRelease(Mutable);
  }
  objc_msgSend((id)_keychainLock, "unlock");
}

+ (__SecPolicy)copySMIMESigningPolicyForAddress:(id)a3
{
  void *v3;
  __SecPolicy *SMIME;

  v3 = (void *)objc_msgSend(a3, "mf_copyUncommentedAddress");
  SMIME = (__SecPolicy *)SecPolicyCreateSMIME();

  return SMIME;
}

+ (__SecPolicy)copySMIMEEncryptionPolicyForAddress:(id)a3
{
  void *v3;
  __SecPolicy *SMIME;

  v3 = (void *)objc_msgSend(a3, "mf_copyUncommentedAddress");
  SMIME = (__SecPolicy *)SecPolicyCreateSMIME();

  return SMIME;
}

+ (__SecIdentity)copyIdentityForPersistentReference:(id)a3 error:(id *)a4
{
  void *v5;
  const __CFDictionary *v6;
  OSStatus v7;
  void *v8;
  __SecIdentity *result;
  CFTypeRef cf;
  void *values[3];
  void *keys[4];

  keys[3] = *(void **)MEMORY[0x1E0C80C00];
  if (a4)
    *a4 = 0;
  cf = 0;
  if (!a3)
    return 0;
  v5 = (void *)*MEMORY[0x1E0CD70E0];
  keys[0] = *(void **)MEMORY[0x1E0CD6C98];
  keys[1] = v5;
  keys[2] = *(void **)MEMORY[0x1E0CD7028];
  values[0] = *(void **)MEMORY[0x1E0CD6CB0];
  values[1] = a3;
  values[2] = *(void **)MEMORY[0x1E0C9AE50];
  v6 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, (const void **)values, 3, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v7 = SecItemCopyMatching(v6, &cf);
  CFRelease(v6);
  if (!v7)
    return (__SecIdentity *)cf;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v7, 0);
  if (a4)
    *a4 = v8;
  result = (__SecIdentity *)cf;
  if (cf)
  {
    CFRelease(cf);
    return 0;
  }
  return result;
}

+ (id)persistentReferenceForIdentity:(__SecIdentity *)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  const __CFDictionary *v7;
  OSStatus v8;
  void *v9;
  void *v10;
  CFTypeRef v12;
  void *values[4];
  void *keys[5];

  keys[4] = *(void **)MEMORY[0x1E0C80C00];
  if (a4)
    *a4 = 0;
  v12 = 0;
  if (a3)
  {
    v5 = (void *)*MEMORY[0x1E0CD70E8];
    keys[0] = *(void **)MEMORY[0x1E0CD6C98];
    keys[1] = v5;
    v6 = (void *)*MEMORY[0x1E0CD6898];
    keys[2] = *(void **)MEMORY[0x1E0CD7020];
    keys[3] = v6;
    values[0] = *(void **)MEMORY[0x1E0CD6CB0];
    values[1] = a3;
    values[2] = *(void **)MEMORY[0x1E0C9AE50];
    values[3] = CFSTR("com.apple.identities");
    v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, (const void **)values, 4, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v8 = SecItemCopyMatching(v7, &v12);
    CFRelease(v7);
    if (v8)
    {
      v9 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v8, 0);
      if (a4)
        *a4 = v9;
    }
    v10 = (void *)v12;
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (BOOL)_matchSSLClientIdentity:(__SecIdentity *)a3 withHostname:(id)a4
{
  _BOOL4 v5;
  const __CFArray *v6;
  CFIndex Count;
  CFIndex v8;
  CFIndex v9;
  const void *v10;
  const void *v11;
  const void *ValueAtIndex;
  CFTypeID v13;
  const void *v14;
  const void *v15;
  const __CFArray *v16;
  CFTypeID v17;
  CFIndex v18;
  CFIndex v19;
  uint64_t v20;
  const void *v21;
  CFTypeID v22;
  const void *Value;
  const __CFString *v24;
  CFTypeID v25;
  const __CFString *theString;
  CFTypeRef cf2;
  void *key;
  CFTypeRef v30;
  SecCertificateRef certificateRef;

  certificateRef = 0;
  if (SecIdentityCopyCertificate(a3, &certificateRef)
    || (v6 = (const __CFArray *)SecCertificateCopyProperties(), CFRelease(certificateRef), !v6))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    Count = CFArrayGetCount(v6);
    if (Count < 1)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      v8 = Count;
      theString = (const __CFString *)a4;
      v9 = 0;
      v10 = (const void *)*MEMORY[0x1E0CD6FC8];
      v11 = (const void *)*MEMORY[0x1E0CD6FD8];
      cf2 = (CFTypeRef)*MEMORY[0x1E0CD6FE8];
      key = (void *)*MEMORY[0x1E0CD6FE0];
      v30 = (CFTypeRef)*MEMORY[0x1E0CD6FF0];
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v6, v9);
        v13 = CFGetTypeID(ValueAtIndex);
        if (v13 == CFDictionaryGetTypeID()
          && (v14 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, v10)) != 0
          && CFEqual(v14, CFSTR("1.2.840.113635.100.6.7"))
          && (v15 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, v11)) != 0
          && CFEqual(v15, cf2)
          && (v16 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, key),
              v17 = CFGetTypeID(v16),
              v17 == CFArrayGetTypeID())
          && (v18 = CFArrayGetCount(v16), v18 >= 1))
        {
          v19 = v18;
          v20 = 1;
          do
          {
            v21 = CFArrayGetValueAtIndex(v16, v20 - 1);
            v22 = CFGetTypeID(v21);
            v5 = v22 == CFDictionaryGetTypeID()
              && (Value = CFDictionaryGetValue((CFDictionaryRef)v21, v11)) != 0
              && CFEqual(Value, v30)
              && (v24 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v21, key),
                  v25 = CFGetTypeID(v24),
                  v25 == CFStringGetTypeID())
              && CFStringHasSuffix(theString, v24) != 0;
            if (v20 >= v19)
              break;
            ++v20;
          }
          while (!v5);
        }
        else
        {
          v5 = 0;
        }
        ++v9;
      }
      while (v9 < v8 && !v5);
    }
    CFRelease(v6);
  }
  return v5;
}

+ (__SecIdentity)copyClientSSLIdentityForHostName:(id)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  const __CFDictionary *v9;
  OSStatus v10;
  void *v11;
  CFIndex Count;
  CFIndex v13;
  CFIndex v14;
  const void *ValueAtIndex;
  CFTypeRef cf;
  void *values[4];
  void *keys[5];

  keys[4] = *(void **)MEMORY[0x1E0C80C00];
  if (a4)
    *a4 = 0;
  if (!a3)
    return 0;
  keys[0] = *(void **)MEMORY[0x1E0CD6C98];
  keys[1] = keys[0];
  v7 = (void *)*MEMORY[0x1E0CD6F30];
  keys[2] = *(void **)MEMORY[0x1E0CD7028];
  keys[3] = v7;
  values[0] = *(void **)MEMORY[0x1E0CD6CB0];
  values[1] = values[0];
  v8 = (void *)*MEMORY[0x1E0CD6F38];
  values[2] = *(void **)MEMORY[0x1E0C9AE50];
  values[3] = v8;
  v9 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, (const void **)values, 4, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  cf = 0;
  v10 = SecItemCopyMatching(v9, &cf);
  CFRelease(v9);
  if (v10)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v10, 0);
    if (a4)
      *a4 = v11;
    if (cf)
      CFRelease(cf);
    return 0;
  }
  if (!cf)
    return 0;
  Count = CFArrayGetCount((CFArrayRef)cf);
  if (Count < 1)
  {
LABEL_14:
    ValueAtIndex = 0;
  }
  else
  {
    v13 = Count;
    v14 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)cf, v14);
      if (objc_msgSend(a1, "_matchSSLClientIdentity:withHostname:", ValueAtIndex, a3))
        break;
      if (v13 == ++v14)
        goto LABEL_14;
    }
    CFRetain(ValueAtIndex);
  }
  CFRelease(cf);
  return (__SecIdentity *)ValueAtIndex;
}

+ (id)copyAllSigningIdentitiesForAddress:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__MFMessageKeychainManager_copyAllSigningIdentitiesForAddress_error___block_invoke;
  v10[3] = &unk_1E81CBAE0;
  v10[5] = a3;
  v10[6] = &v11;
  v10[4] = a1;
  v5 = (void *)objc_msgSend(a1, "_copyAllIdentitiesWithError:usingBlock:", a4, v10);
  v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = objc_msgSend(v5, "count");
    v8 = v12[3];
    *(_DWORD *)buf = 134218498;
    v16 = v7;
    v17 = 2048;
    v18 = v8;
    v19 = 2112;
    v20 = a3;
    _os_log_impl(&dword_1C8839000, v6, OS_LOG_TYPE_INFO, "#SMIMEErrors Found %lu (out of %lu) matching signing identities for \"%@\", buf, 0x20u);
  }
  _Block_object_dispose(&v11, 8);
  return v5;
}

uint64_t __69__MFMessageKeychainManager_copyAllSigningIdentitiesForAddress_error___block_invoke(uint64_t a1, uint64_t a2)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  return objc_msgSend(*(id *)(a1 + 32), "validateSigningIdentity:forAddress:error:", a2, *(_QWORD *)(a1 + 40), 0);
}

+ (id)copyAllEncryptionIdentitiesForAddress:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__MFMessageKeychainManager_copyAllEncryptionIdentitiesForAddress_error___block_invoke;
  v10[3] = &unk_1E81CBAE0;
  v10[5] = a3;
  v10[6] = &v11;
  v10[4] = a1;
  v5 = (void *)objc_msgSend(a1, "_copyAllIdentitiesWithError:usingBlock:", a4, v10);
  v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = objc_msgSend(v5, "count");
    v8 = v12[3];
    *(_DWORD *)buf = 134218498;
    v16 = v7;
    v17 = 2048;
    v18 = v8;
    v19 = 2112;
    v20 = a3;
    _os_log_impl(&dword_1C8839000, v6, OS_LOG_TYPE_INFO, "#SMIMEErrors Found %lu (out of %lu) matching encryption identities for \"%@\", buf, 0x20u);
  }
  _Block_object_dispose(&v11, 8);
  return v5;
}

uint64_t __72__MFMessageKeychainManager_copyAllEncryptionIdentitiesForAddress_error___block_invoke(uint64_t a1, uint64_t a2)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  return objc_msgSend(*(id *)(a1 + 32), "validateEncryptionIdentity:forAddress:error:", a2, *(_QWORD *)(a1 + 40), 0);
}

+ (id)_copyAllIdentitiesWithError:(id *)a3 usingBlock:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  const __CFDictionary *v9;
  OSStatus v10;
  CFIndex Count;
  void *v12;
  CFIndex i;
  const void *ValueAtIndex;
  void *v15;
  NSObject *v16;
  CFTypeRef result;
  uint8_t buf[4];
  uint64_t v20;
  void *values[4];
  void *keys[5];

  keys[4] = *(void **)MEMORY[0x1E0C80C00];
  v6 = (void *)*MEMORY[0x1E0CD6F30];
  keys[0] = *(void **)MEMORY[0x1E0CD6C98];
  keys[1] = v6;
  v7 = (void *)*MEMORY[0x1E0CD6898];
  keys[2] = *(void **)MEMORY[0x1E0CD7028];
  keys[3] = v7;
  v8 = (void *)*MEMORY[0x1E0CD6F38];
  values[0] = *(void **)MEMORY[0x1E0CD6CB0];
  values[1] = v8;
  values[2] = *(void **)MEMORY[0x1E0C9AE50];
  values[3] = CFSTR("com.apple.identities");
  v9 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, (const void **)values, 4, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  result = 0;
  v10 = SecItemCopyMatching(v9, &result);
  CFRelease(v9);
  if (v10 != -25300 && v10)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v10, 0);
    if (a3)
      *a3 = v15;
    if (result)
      CFRelease(result);
    v16 = MFLogGeneral();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v20 = v10;
      _os_log_impl(&dword_1C8839000, v16, OS_LOG_TYPE_INFO, "#SMIMEErrors SecItemCopyMatching returned %ld", buf, 0xCu);
    }
    return 0;
  }
  if (!result)
    return 0;
  Count = CFArrayGetCount((CFArrayRef)result);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", Count);
  if (Count >= 1)
  {
    for (i = 0; i != Count; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)result, i);
      if (!a4 || (*((unsigned int (**)(id, const void *))a4 + 2))(a4, ValueAtIndex))
        objc_msgSend(v12, "addObject:", ValueAtIndex);
    }
  }
  CFRelease(result);
  if (a3 && v12 && *a3)
    *a3 = 0;
  return v12;
}

+ (BOOL)validateSigningIdentity:(__SecIdentity *)a3 forAddress:(id)a4 error:(id *)a5
{
  const void *v9;

  v9 = (const void *)objc_msgSend(a1, "copySMIMESigningPolicyForAddress:", a4);
  LOBYTE(a5) = objc_msgSend(a1, "_validateIdentity:forAddress:policy:usage:error:", a3, a4, v9, 1, a5);
  CFRelease(v9);
  return (char)a5;
}

+ (BOOL)validateEncryptionIdentity:(__SecIdentity *)a3 forAddress:(id)a4 error:(id *)a5
{
  const void *v9;

  v9 = (const void *)objc_msgSend(a1, "copySMIMEEncryptionPolicyForAddress:", a4);
  LOBYTE(a5) = objc_msgSend(a1, "_validateIdentity:forAddress:policy:usage:error:", a3, a4, v9, 4, a5);
  CFRelease(v9);
  return (char)a5;
}

+ (BOOL)_validateIdentity:(__SecIdentity *)a3 forAddress:(id)a4 policy:(__SecPolicy *)a5 usage:(unsigned int)a6 error:(id *)a7
{
  void *v12;
  uint64_t v13;
  OSStatus v14;
  OSStatus v15;
  BOOL v16;
  void *v17;
  void *v18;
  CFTypeRef cf;
  SecCertificateRef certificateRef;

  v12 = (void *)objc_msgSend(a1, "newTrustManager");
  v13 = objc_msgSend(a4, "mf_uncommentedAddress");
  certificateRef = 0;
  v14 = SecIdentityCopyCertificate(a3, &certificateRef);
  if (certificateRef)
  {
    cf = 0;
    v15 = SecTrustCreateWithCertificates(certificateRef, a5, (SecTrustRef *)&cf);
    if (!cf)
    {
      if (!v15
        || a7 && *a7
        || (v18 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v15, 0), !a7))
      {
        v16 = 0;
      }
      else
      {
        v16 = 0;
        *a7 = v18;
      }
      goto LABEL_24;
    }
    if (objc_msgSend(v12, "actionForSMIMETrust:sender:", cf, v13)
      && (SecCertificateGetKeyUsage() & a6) != 0)
    {
      v16 = 1;
LABEL_23:
      CFRelease(cf);
LABEL_24:
      CFRelease(certificateRef);
      goto LABEL_25;
    }
    if (a7)
    {
      if (!*a7)
      {
        v16 = 0;
        *a7 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MFMessageKeychainManagerCertificateDeniedDomain"), 0, 0);
        goto LABEL_23;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MFMessageKeychainManagerCertificateDeniedDomain"), 0, 0);
    }
    v16 = 0;
    goto LABEL_23;
  }
  if (!v14
    || a7 && *a7
    || (v17 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v14, 0), !a7))
  {
    v16 = 0;
  }
  else
  {
    v16 = 0;
    *a7 = v17;
  }
LABEL_25:

  return v16;
}

+ (__SecCertificate)copyEncryptionCertificateForAddress:(id)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFAllocator *v11;
  const __CFDictionary *v12;
  OSStatus v13;
  uint64_t v14;
  const __CFDictionary *v15;
  OSStatus v16;
  void *v17;
  OSStatus v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  uint8_t *v22;
  const char *v23;
  __SecCertificate *v24;
  CFTypeRef result;
  CFTypeRef cf;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  uint64_t v30;
  void *v31[3];
  _BYTE v32[24];
  void *values[4];
  void *keys[5];

  keys[4] = *(void **)MEMORY[0x1E0C80C00];
  cf = 0;
  v5 = objc_msgSend(a3, "mf_uncommentedAddress");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("S/MIME Encryption for %@"), v5);
  v7 = *MEMORY[0x1E0CD6C98];
  v8 = (void *)*MEMORY[0x1E0CD68F8];
  keys[0] = *(void **)MEMORY[0x1E0CD6C98];
  keys[1] = v8;
  v9 = (void *)*MEMORY[0x1E0CD6898];
  keys[2] = *(void **)MEMORY[0x1E0CD7018];
  keys[3] = v9;
  values[0] = *(void **)MEMORY[0x1E0CD6CA8];
  values[1] = v6;
  v10 = (void *)*MEMORY[0x1E0C9AE50];
  values[2] = *(void **)MEMORY[0x1E0C9AE50];
  values[3] = CFSTR("com.apple.mobilemail.smime");
  v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v12 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, (const void **)values, 4, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);

  result = 0;
  v13 = SecItemCopyMatching(v12, &result);
  if (result)
  {
    v14 = *MEMORY[0x1E0CD70E0];
    *(_QWORD *)v32 = v7;
    *(_QWORD *)&v32[8] = v14;
    *(_QWORD *)&v32[16] = *MEMORY[0x1E0CD7028];
    v31[0] = *(void **)MEMORY[0x1E0CD6CA0];
    v31[1] = (void *)result;
    v31[2] = v10;
    v15 = CFDictionaryCreate(v11, (const void **)v32, (const void **)v31, 3, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CFRelease(result);
    v16 = SecItemCopyMatching(v15, &cf);
    CFRelease(v15);
    if (v16)
    {
      v17 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v16, 0);
      if (a4)
        *a4 = v17;
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
    }
    else if (cf)
    {
      goto LABEL_15;
    }
    SecItemDelete(v12);
LABEL_15:
    v20 = MFLogGeneral();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v23 = "a";
      if (!cf)
        v23 = "no";
      *(_DWORD *)buf = 136315394;
      v28 = v23;
      v29 = 2112;
      v30 = v5;
      v21 = "#SMIMEErrors Found %s certificate for \"%@\".";
      v22 = buf;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  v18 = v13;
  if (v13 != -25300)
  {
    if (v13)
    {
      v19 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v13, 0);
      if (a4)
        *a4 = v19;
    }
  }
  v20 = MFLogGeneral();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v32 = 138412546;
    *(_QWORD *)&v32[4] = v5;
    *(_WORD *)&v32[12] = 2048;
    *(_QWORD *)&v32[14] = v18;
    v21 = "#SMIMEErrors Found no certificates for \"%@\" (%ld)";
    v22 = v32;
LABEL_19:
    _os_log_impl(&dword_1C8839000, v20, OS_LOG_TYPE_INFO, v21, v22, 0x16u);
  }
LABEL_20:
  CFRelease(v12);
  v24 = (__SecCertificate *)cf;
  if (a4 && cf)
  {
    if (*a4)
      *a4 = 0;
  }
  return v24;
}

+ (id)_addCertificate:(__SecCertificate *)a3 persistent:(id *)a4
{
  void *v5;
  void *v6;
  const __CFDictionary *v7;
  OSStatus v8;
  void *v9;
  id v10;
  void *values[4];
  void *keys[5];

  keys[4] = *(void **)MEMORY[0x1E0C80C00];
  v5 = (void *)*MEMORY[0x1E0CD70E8];
  keys[0] = *(void **)MEMORY[0x1E0CD6C98];
  keys[1] = v5;
  v6 = (void *)*MEMORY[0x1E0CD6898];
  keys[2] = *(void **)MEMORY[0x1E0CD7020];
  keys[3] = v6;
  values[0] = *(void **)MEMORY[0x1E0CD6CA0];
  values[1] = a3;
  values[2] = *(void **)MEMORY[0x1E0C9AE50];
  values[3] = CFSTR("com.apple.mobilemail.smime");
  v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, (const void **)values, 4, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v8 = SecItemAdd(v7, (CFTypeRef *)a4);
  if (v8 == -25299)
    v8 = SecItemCopyMatching(v7, (CFTypeRef *)a4);
  CFRelease(v7);
  if (!v8)
  {
    v9 = 0;
    if (!a4)
      return v9;
    goto LABEL_5;
  }
  v9 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v8, 0);
  if (a4)
LABEL_5:
    v10 = *a4;
  return v9;
}

+ (__SecCertificate)_copyCertificateForPersistent:(id)a3 error:(id *)a4
{
  void *v5;
  const __CFDictionary *v6;
  OSStatus v7;
  void *v9;
  __SecCertificate *v11;
  void *values[3];
  void *keys[4];

  keys[3] = *(void **)MEMORY[0x1E0C80C00];
  v5 = (void *)*MEMORY[0x1E0CD70E0];
  keys[0] = *(void **)MEMORY[0x1E0CD6C98];
  keys[1] = v5;
  keys[2] = *(void **)MEMORY[0x1E0CD7028];
  values[0] = *(void **)MEMORY[0x1E0CD6CA0];
  values[1] = a3;
  values[2] = *(void **)MEMORY[0x1E0C9AE50];
  v6 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, (const void **)values, 3, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v11 = 0;
  v7 = SecItemCopyMatching(v6, (CFTypeRef *)&v11);
  CFRelease(v6);
  if (a4)
  {
    if (v7 == -25300 || v7 == 0)
      v9 = 0;
    else
      v9 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v7, 0);
    *a4 = v9;
  }
  return v11;
}

+ (id)_addPersistentMapping:(id)a3 forAddress:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFDictionary *v10;
  OSStatus v11;
  void *v12;
  id v13;
  const __CFDictionary *v14;
  id v16;
  void *values[4];
  void *keys[5];

  keys[4] = *(void **)MEMORY[0x1E0C80C00];
  v16 = a3;
  v5 = objc_msgSend(a4, "mf_uncommentedAddress");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("S/MIME Encryption for %@"), v5);
  v7 = (void *)*MEMORY[0x1E0CD68F8];
  keys[0] = *(void **)MEMORY[0x1E0CD6C98];
  keys[1] = v7;
  v8 = *MEMORY[0x1E0CD70D8];
  v9 = (void *)*MEMORY[0x1E0CD6898];
  keys[2] = *(void **)MEMORY[0x1E0CD70D8];
  keys[3] = v9;
  values[0] = *(void **)MEMORY[0x1E0CD6CA8];
  values[1] = v6;
  values[2] = a3;
  values[3] = CFSTR("com.apple.mobilemail.smime");
  v10 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, (const void **)values, 4, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);

  v11 = SecItemAdd(v10, 0);
  if (v11 == -25299)
  {
    v12 = (void *)-[__CFDictionary mutableCopy](v10, "mutableCopy");
    objc_msgSend(v12, "removeObjectForKey:", v8);
    v13 = objc_alloc(MEMORY[0x1E0C99D80]);
    v14 = (const __CFDictionary *)objc_msgSend(v13, "initWithObjects:forKeys:count:", &v16, MEMORY[0x1E0CD70D8], 1);
    v11 = SecItemUpdate((CFDictionaryRef)v12, v14);

  }
  CFRelease(v10);
  if (v11)
    return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v11, 0);
  else
    return 0;
}

+ (id)_removeCertificateForPersistent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFAllocator *v8;
  const __CFDictionary *v9;
  OSStatus v10;
  CFIndex Count;
  unint64_t v12;
  const void *ValueAtIndex;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  CFIndex v17;
  const void *v18;
  void *v19;
  const __CFDictionary *v20;
  OSStatus v21;
  CFArrayRef theArray;
  void *v25[2];
  void *v26[2];
  void *values[4];
  void *keys[5];

  keys[4] = *(void **)MEMORY[0x1E0C80C00];
  v4 = (void *)*MEMORY[0x1E0CD6C98];
  v5 = (void *)*MEMORY[0x1E0CD7018];
  keys[0] = *(void **)MEMORY[0x1E0CD6C98];
  keys[1] = v5;
  v6 = (void *)*MEMORY[0x1E0CD6898];
  keys[2] = *(void **)MEMORY[0x1E0CD6F30];
  keys[3] = v6;
  v7 = (void *)*MEMORY[0x1E0C9AE50];
  values[0] = *(void **)MEMORY[0x1E0CD6CA8];
  values[1] = v7;
  values[2] = *(void **)MEMORY[0x1E0CD6F38];
  values[3] = CFSTR("com.apple.mobilemail.smime");
  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v9 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, (const void **)values, 4, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  theArray = 0;
  v10 = SecItemCopyMatching(v9, (CFTypeRef *)&theArray);
  CFRelease(v9);
  if (v10 != -25300 && v10)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2F90];
    v16 = v10;
  }
  else
  {
    if (theArray)
    {
      Count = CFArrayGetCount(theArray);
      if (Count)
      {
        v12 = Count;
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, 0);
        if (CFEqual(ValueAtIndex, a3))
        {
          CFRelease(theArray);
          return 0;
        }
        v17 = 1;
        while (v12 != v17)
        {
          v18 = CFArrayGetValueAtIndex(theArray, v17++);
          if (CFEqual(v18, a3))
          {
            CFRelease(theArray);
            if (v17 - 1 >= v12)
              goto LABEL_14;
            return 0;
          }
        }
      }
      CFRelease(theArray);
    }
LABEL_14:
    v19 = (void *)*MEMORY[0x1E0CD70E0];
    v26[0] = v4;
    v26[1] = v19;
    v25[0] = *(void **)MEMORY[0x1E0CD6CA0];
    v25[1] = a3;
    v20 = CFDictionaryCreate(v8, (const void **)v26, (const void **)v25, 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v21 = SecItemDelete(v20);
    CFRelease(v20);
    if (v21 == -25300 || v21 == 0)
      return 0;
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2F90];
    v16 = v21;
  }
  return (id)objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, v16, 0);
}

+ (id)saveEncryptionCertificate:(__SecCertificate *)a3 forAddress:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFDictionary *v10;
  OSStatus v11;
  uint64_t v12;
  const void *v13;
  const void *SHA1Digest;
  const void *v15;
  _BOOL4 v16;
  uint64_t v17;
  OSStatus v18;
  NSObject *v19;
  _BOOL4 v20;
  id v21;
  CFTypeRef result;
  void *v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  void *values[4];
  void *keys[5];

  keys[4] = *(void **)MEMORY[0x1E0C80C00];
  v23 = 0;
  v6 = objc_msgSend(a4, "mf_uncommentedAddress");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("S/MIME Encryption for %@"), v6);
  v8 = (void *)*MEMORY[0x1E0CD68F8];
  keys[0] = *(void **)MEMORY[0x1E0CD6C98];
  keys[1] = v8;
  v9 = (void *)*MEMORY[0x1E0CD6898];
  keys[2] = *(void **)MEMORY[0x1E0CD7018];
  keys[3] = v9;
  values[0] = *(void **)MEMORY[0x1E0CD6CA8];
  values[1] = v7;
  values[2] = *(void **)MEMORY[0x1E0C9AE50];
  values[3] = CFSTR("com.apple.mobilemail.smime");
  v10 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, (const void **)values, 4, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);

  result = 0;
  v11 = SecItemCopyMatching(v10, &result);
  if (v11 != -25300 && v11)
  {
    v23 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v11, 0);
    goto LABEL_22;
  }
  if (a3)
  {
    if (!result)
    {
      v17 = 0;
      v16 = 1;
      goto LABEL_16;
    }
    v12 = objc_msgSend(a1, "_copyCertificateForPersistent:error:", result, &v23);
    if (!v12)
      goto LABEL_22;
    v13 = (const void *)v12;
    SHA1Digest = (const void *)SecCertificateGetSHA1Digest();
    v15 = (const void *)SecCertificateGetSHA1Digest();
    v16 = CFEqual(SHA1Digest, v15) == 0;
    CFRelease(v13);
    v17 = (uint64_t)v23;
    if (!v16)
    {
LABEL_16:
      if (!v16)
        goto LABEL_22;
      goto LABEL_17;
    }
  }
  else
  {
    v17 = 0;
    v16 = 0;
  }
  if (v17)
    goto LABEL_16;
  v18 = SecItemDelete(v10);
  if (v18 && v18 != -25300)
  {
    v17 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v18, 0);
    v23 = (void *)v17;
    if (!v16)
      goto LABEL_22;
  }
  else
  {
    objc_msgSend(a1, "_removeCertificateForPersistent:", result);
    v17 = (uint64_t)v23;
    if (!v16)
      goto LABEL_22;
  }
LABEL_17:
  if (!v17)
  {
    v23 = (void *)objc_msgSend(a1, "_addCertificate:persistent:", a3, &result);
    if (!v23)
    {
      v23 = (void *)objc_msgSend(a1, "_addPersistentMapping:forAddress:", result, v6);
      if (v23)
        objc_msgSend(a1, "_removeCertificateForPersistent:", result);
    }
  }
LABEL_22:
  CFRelease(v10);
  if (!v23)
    return 0;
  v19 = MFLogGeneral();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
  v21 = v23;
  if (v20)
  {
    *(_DWORD *)buf = 138412546;
    v25 = v6;
    v26 = 2112;
    v27 = v23;
    _os_log_error_impl(&dword_1C8839000, v19, OS_LOG_TYPE_ERROR, "#SMIMEErrors Error saving encryption certificate for \"%@\": %@", buf, 0x16u);
    return v23;
  }
  return v21;
}

+ (int)_actionForCertificate:(__SecCertificate *)a3 policy:(__SecPolicy *)a4 uncommentedAddress:(id)a5
{
  void *v7;
  int v8;
  SecTrustRef trust;

  trust = 0;
  SecTrustCreateWithCertificates(a3, a4, &trust);
  if (!trust)
    return 0;
  v7 = (void *)objc_msgSend(a1, "newTrustManager");
  v8 = objc_msgSend(v7, "actionForSMIMETrust:sender:", trust, a5);

  CFRelease(trust);
  return v8;
}

+ (int)actionForSigningIdentity:(__SecIdentity *)a3 address:(id)a4
{
  uint64_t v6;
  const void *v7;
  int v8;
  SecCertificateRef certificateRef;

  certificateRef = 0;
  SecIdentityCopyCertificate(a3, &certificateRef);
  if (!certificateRef)
    return 0;
  v6 = objc_msgSend(a4, "mf_uncommentedAddress");
  v7 = (const void *)objc_msgSend(a1, "copySMIMESigningPolicyForAddress:", v6);
  v8 = objc_msgSend(a1, "_actionForCertificate:policy:uncommentedAddress:", certificateRef, v7, v6);
  CFRelease(v7);
  CFRelease(certificateRef);
  return v8;
}

+ (int)actionForEncryptionCertificate:(__SecCertificate *)a3 address:(id)a4
{
  uint64_t v6;
  const void *v7;

  v6 = objc_msgSend(a4, "mf_uncommentedAddress");
  v7 = (const void *)objc_msgSend(a1, "copySMIMEEncryptionPolicyForAddress:", v6);
  LODWORD(a3) = objc_msgSend(a1, "_actionForCertificate:policy:uncommentedAddress:", a3, v7, v6);
  CFRelease(v7);
  return (int)a3;
}

+ (id)newTrustManager
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D588]), "initWithAccessGroup:", CFSTR("com.apple.mobilemail.smime"));
}

@end
