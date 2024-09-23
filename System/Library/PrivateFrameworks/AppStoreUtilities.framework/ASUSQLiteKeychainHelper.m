@implementation ASUSQLiteKeychainHelper

+ (id)fetchKeyWithIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  __CFDictionary *Mutable;
  const void *v8;
  uint64_t v9;
  BOOL v10;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  CFTypeRef result;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.app-store-utilities.encryption"), a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_self();
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 3, 0, 0);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE8FA8], v5);

  v8 = (const void *)*MEMORY[0x24BDBD270];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE90B0], (const void *)*MEMORY[0x24BDBD270]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9220], (const void *)*MEMORY[0x24BDE9230]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE94C8], v8);
  result = 0;
  v9 = SecItemCopyMatching(Mutable, &result);
  if ((_DWORD)v9)
    v10 = 1;
  else
    v10 = result == 0;
  if (!v10)
  {
    v13 = objc_alloc(MEMORY[0x24BDBCE50]);
    v14 = (void *)objc_msgSend(v13, "initWithBase64EncodedData:options:", result, 0);
    CFRelease(result);
    v15 = 0;
    if (!a4)
      goto LABEL_17;
    goto LABEL_15;
  }
  if ((_DWORD)v9 == -25300 || (_DWORD)v9 == 0)
  {
    v18 = *MEMORY[0x24BDD0BA0];
    v19[0] = CFSTR("SecItemCopyMatching succeeded with empty results");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASUSQLiteErrorDomain"), 5, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = (void *)+[ASUSQLiteKeychainHelper _copyErrorForOSStatus:](v6, v9);
  }
  v14 = 0;
  if (a4)
  {
LABEL_15:
    if (!v14)
      *a4 = objc_retainAutorelease(v15);
  }
LABEL_17:
  CFRelease(Mutable);

  return v14;
}

+ (BOOL)storeKey:(id)a3 withIdentifier:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __CFDictionary *Mutable;
  uint64_t v14;
  void *v15;
  id v16;

  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = a3;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.app-store-utilities.encryption"), a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  v11 = objc_opt_self();
  objc_msgSend(v10, "base64EncodedDataWithOptions:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 7, 0, 0);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE8FA8], v9);

  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE90A0], CFSTR("App Store User Data Encryption"));
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE90B0], (const void *)*MEMORY[0x24BDBD270]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9220], (const void *)*MEMORY[0x24BDE9230]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9550], v12);
  SecItemDelete(Mutable);
  v14 = SecItemAdd(Mutable, 0);
  CFRelease(Mutable);
  if ((_DWORD)v14)
  {
    v15 = (void *)+[ASUSQLiteKeychainHelper _copyErrorForOSStatus:](v11, v14);
    v16 = v15;
    if (a5)
    {
      v16 = objc_retainAutorelease(v15);
      *a5 = v16;
    }
  }
  else
  {
    v16 = 0;
  }

  return (_DWORD)v14 == 0;
}

+ (uint64_t)_copyErrorForOSStatus:(uint64_t)a1
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  objc_opt_self();
  v3 = (__CFString *)SecCopyErrorMessageString(a2, 0);
  if (v3)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Keychain failed to return value (error %d): %@"), a2, v3);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Keychain failed to return value (error %d)"), a2, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD1540];
  v10 = *MEMORY[0x24BDD0BA0];
  v11[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("ASUSQLiteErrorDomain"), 4, v6);
  v7 = objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
