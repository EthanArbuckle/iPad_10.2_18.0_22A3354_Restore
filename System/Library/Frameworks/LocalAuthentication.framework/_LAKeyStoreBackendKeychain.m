@implementation _LAKeyStoreBackendKeychain

- (BOOL)createKeyWithQuery:(id)a3 error:(id *)a4
{
  SecKeyRef v5;
  CFErrorRef v6;
  BOOL v7;
  CFErrorRef error;

  error = 0;
  v5 = SecKeyCreateRandomKey((CFDictionaryRef)a3, &error);
  if (v5)
    CFRelease(v5);
  v6 = error;
  if (a4 && error)
  {
    *a4 = objc_retainAutorelease(error);
    v6 = error;
  }
  v7 = v6 == 0;

  return v7;
}

- (BOOL)createGenericPasswordWithQuery:(id)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;

  v5 = SecItemAdd((CFDictionaryRef)a3, 0);
  if ((_DWORD)v5)
  {
    +[LAAuthorizationError genericErrorWithStatus:](LAAuthorizationError, "genericErrorWithStatus:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      if (v6)
      {
        +[LAAuthorizationError genericErrorWithStatus:](LAAuthorizationError, "genericErrorWithStatus:", v5);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  return (_DWORD)v5 == 0;
}

- (id)fetchItemWithQuery:(id)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  CFTypeRef result;

  result = 0;
  v5 = SecItemCopyMatching((CFDictionaryRef)a3, &result);
  v6 = (void *)result;
  if ((_DWORD)v5)
  {
    if (result)
      CFRelease(result);
    +[LAAuthorizationError genericErrorWithStatus:](LAAuthorizationError, "genericErrorWithStatus:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0C9AA70];
    if (a4 && v7)
    {
      +[LAAuthorizationError genericErrorWithStatus:](LAAuthorizationError, "genericErrorWithStatus:", v5);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0C9AA70];
    }
  }
  return v6;
}

- (id)fetchItemsWithQuery:(id)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  CFTypeRef result;

  result = 0;
  v5 = SecItemCopyMatching((CFDictionaryRef)a3, &result);
  v6 = (void *)result;
  if ((_DWORD)v5)
  {
    if (result)
      CFRelease(result);
    +[LAAuthorizationError genericErrorWithStatus:](LAAuthorizationError, "genericErrorWithStatus:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0C9AA60];
    if (a4 && v7)
    {
      +[LAAuthorizationError genericErrorWithStatus:](LAAuthorizationError, "genericErrorWithStatus:", v5);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
  return v6;
}

- (BOOL)removeItemsWithQuery:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = SecItemDelete((CFDictionaryRef)a3);
  v6 = v5;
  if ((_DWORD)v5 != -25300)
  {
    if ((_DWORD)v5)
    {
      +[LAAuthorizationError genericErrorWithStatus:](LAAuthorizationError, "genericErrorWithStatus:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (a4)
      {
        if (v7)
        {
          +[LAAuthorizationError genericErrorWithStatus:](LAAuthorizationError, "genericErrorWithStatus:", v6);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }
  return !(_DWORD)v6 || (_DWORD)v6 == -25300;
}

@end
