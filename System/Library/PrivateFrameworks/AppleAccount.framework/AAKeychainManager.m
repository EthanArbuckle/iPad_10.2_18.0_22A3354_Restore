@implementation AAKeychainManager

+ (id)passwordForServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5
{
  id v7;
  id v8;
  id v9;
  __CFDictionary *Mutable;
  OSStatus v11;
  BOOL v12;
  OSStatus v13;
  NSObject *v14;
  const char *v15;
  id v16;
  void *v17;
  NSObject *v18;
  uint32_t v19;
  CFTypeRef result;
  uint8_t buf[4];
  OSStatus v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "length") && objc_msgSend(v8, "length"))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CA8]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68F8], v8);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B58], v7);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD7018], (const void *)*MEMORY[0x1E0C9AE50]);
    if (v9)
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6898], v9);
    result = 0;
    v11 = SecItemCopyMatching(Mutable, &result);
    if (v11)
      v12 = 1;
    else
      v12 = result == 0;
    if (!v12)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB3940]);
      v17 = (void *)objc_msgSend(v16, "initWithData:encoding:", result, 4);
      CFRelease(result);
LABEL_22:
      CFRelease(Mutable);
      goto LABEL_23;
    }
    v13 = v11;
    if (v11)
    {
      if (v11 == -25308)
      {
        _AALogSystem();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v15 = "SecItemCopyMatching Error: errInteractionNotAllowed - The keychain is inaccessible. It may be locked.";
LABEL_17:
          v18 = v14;
          v19 = 2;
LABEL_20:
          _os_log_impl(&dword_19EACA000, v18, OS_LOG_TYPE_DEFAULT, v15, buf, v19);
        }
      }
      else
      {
        _AALogSystem();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          v23 = v13;
          v24 = 2112;
          v25 = v7;
          v26 = 2112;
          v27 = v8;
          v15 = "SecItemCopyMatching result: %d - keychain item %@ - username %@";
          v18 = v14;
          v19 = 28;
          goto LABEL_20;
        }
      }
    }
    else
    {
      _AALogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v15 = "SecItemCopyMatching succeeded with empty results";
        goto LABEL_17;
      }
    }

    v17 = 0;
    goto LABEL_22;
  }
  v17 = 0;
LABEL_23:

  return v17;
}

+ (void)initialize
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v3 = (void *)_aa_keychainLock;
  _aa_keychainLock = (uint64_t)v2;

}

+ (void)setPassword:(id)a3 forServiceName:(id)a4 username:(id)a5 accessGroup:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  const __CFAllocator *v14;
  __CFDictionary *Mutable;
  void *v16;
  OSStatus v17;
  OSStatus v18;
  NSObject *v19;
  __CFDictionary *v20;
  OSStatus v21;
  NSObject *v22;
  void *v23;
  uint8_t buf[4];
  OSStatus v25;
  CFTypeRef result[2];

  result[1] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend((id)_aa_keychainLock, "lock");
  if (objc_msgSend(v10, "length") && objc_msgSend(v9, "length") && objc_msgSend(v11, "length"))
  {
    objc_msgSend(v9, "dataUsingEncoding:", 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CA8]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68F8], v11);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B58], v10);
    if (v12)
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6898], v12);
    objc_msgSend((id)objc_opt_class(), "passwordForServiceName:username:accessGroup:", v10, v11, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68A0], (const void *)*MEMORY[0x1E0CD68A8]);
      result[0] = 0;
      v23 = v13;
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD70D8], v13);
      v17 = SecItemAdd(Mutable, result);
      if (!v17)
      {
LABEL_18:
        CFRelease(Mutable);

        goto LABEL_19;
      }
      v18 = v17;
      _AALogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v25 = v18;
        _os_log_impl(&dword_19EACA000, v19, OS_LOG_TYPE_DEFAULT, "SecItemAdd result: %d", buf, 8u);
      }

      v13 = v23;
    }
    if ((objc_msgSend(v16, "isEqualToString:", v9) & 1) == 0)
    {
      v20 = CFDictionaryCreateMutable(v14, 0, 0, 0);
      CFDictionaryAddValue(v20, (const void *)*MEMORY[0x1E0CD70D8], v13);
      CFDictionaryAddValue(v20, (const void *)*MEMORY[0x1E0CD68A0], (const void *)*MEMORY[0x1E0CD68A8]);
      v21 = SecItemUpdate(Mutable, v20);
      if (v20)
        CFRelease(v20);
      if (v21)
      {
        _AALogSystem();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(result[0]) = 67109120;
          HIDWORD(result[0]) = v21;
          _os_log_impl(&dword_19EACA000, v22, OS_LOG_TYPE_DEFAULT, "SecItemUpdate result: %d", (uint8_t *)result, 8u);
        }

      }
    }
    goto LABEL_18;
  }
LABEL_19:
  objc_msgSend((id)_aa_keychainLock, "unlock");

}

+ (void)removePasswordForService:(id)a3 username:(id)a4 accessGroup:(id)a5
{
  id v7;
  id v8;
  __CFDictionary *Mutable;
  id value;

  value = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend((id)_aa_keychainLock, "lock");
  if (objc_msgSend(value, "length") && objc_msgSend(v7, "length"))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CA8]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68F8], v7);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B58], value);
    if (v8)
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6898], v8);
    SecItemDelete(Mutable);
    CFRelease(Mutable);
  }
  objc_msgSend((id)_aa_keychainLock, "unlock");

}

@end
