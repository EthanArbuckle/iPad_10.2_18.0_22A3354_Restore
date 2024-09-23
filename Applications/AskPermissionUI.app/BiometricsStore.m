@implementation BiometricsStore

+ (void)removeToken
{
  const __CFDictionary *v3;
  uint64_t v4;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;

  v3 = (const __CFDictionary *)objc_msgSend(a1, "_copyKeychainQuery");
  v4 = SecItemDelete(v3);
  if ((_DWORD)v4 == -25303 || (_DWORD)v4 == -25300 || (_DWORD)v4 == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](APLogConfig, "sharedDaemonConfig"));
    if (!v7)
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "OSLogObject"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = (id)objc_opt_class(a1);
      v9 = v16;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Removed biometrics token data from keychain", (uint8_t *)&v15, 0xCu);

    }
  }
  else
  {
    v10 = v4;
    v11 = objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](APLogConfig, "sharedDaemonConfig"));
    v7 = (void *)v11;
    if (!v11)
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "OSLogObject"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_opt_class(a1);
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v10));
      v15 = 138543618;
      v16 = v12;
      v17 = 2114;
      v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to remove biometrics token data from keychain. Status: %{public}@", (uint8_t *)&v15, 0x16u);

    }
  }

  CFRelease(v3);
}

+ (id)retreiveTokenWithAction:(int64_t)a3 error:(id *)a4
{
  __CFDictionary *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  CFTypeRef result;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;
  void *v34;

  v6 = (__CFDictionary *)objc_msgSend(a1, "_copyKeychainQuery", a3);
  CFDictionaryAddValue(v6, kSecReturnData, kCFBooleanTrue);
  result = 0;
  v7 = SecItemCopyMatching(v6, &result);
  v8 = (void *)result;
  if (result)
    v9 = (_DWORD)v7 == 0;
  else
    v9 = 0;
  if (v9)
  {
    v23 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", result, 134217984);

    CFRelease(v6);
    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](APLogConfig, "sharedDaemonConfig"));
      if (!v24)
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "OSLogObject"));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (void *)objc_opt_class(a1);
        *(_DWORD *)buf = 138543362;
        v30 = v26;
        v27 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: Retrieved biometrics token data from keychain", buf, 0xCu);

      }
    }
    return v23;
  }
  else
  {
    v10 = v7;
    v11 = (__CFString *)SecCopyErrorMessageString(v7, 0);
    v12 = APErrorDomain;
    v33 = APKeychainErrorCodeUserInfoKey;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v10));
    v34 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
    v15 = APCustomError(v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](APLogConfig, "sharedDaemonConfig"));
    if (!v17)
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "OSLogObject"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_opt_class(a1);
      v20 = v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v10));
      *(_DWORD *)buf = 138543618;
      v30 = v19;
      v31 = 2114;
      v32 = v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve biometrics token data from keychain. Status: %{public}@", buf, 0x16u);

    }
    if (a4)
      *a4 = objc_retainAutorelease(v16);

    CFRelease(v6);
    return 0;
  }
}

+ (void)storeToken:(id)a3
{
  id v4;
  void *v5;
  __CFDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;

  v4 = a3;
  objc_msgSend(a1, "removeToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataUsingEncoding:", 4));

  v6 = (__CFDictionary *)objc_msgSend(a1, "_copyKeychainQuery");
  CFDictionaryAddValue(v6, kSecValueData, v5);
  v7 = SecItemAdd(v6, 0);
  v8 = objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](APLogConfig, "sharedDaemonConfig"));
  v9 = (void *)v8;
  if ((_DWORD)v7)
  {
    if (!v8)
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "OSLogObject"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_opt_class(a1);
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7));
      v15 = 138543618;
      v16 = v11;
      v17 = 2114;
      v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to save biometrics token data to keychain. Status: %{public}@", (uint8_t *)&v15, 0x16u);

    }
  }
  else
  {
    if (!v8)
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "OSLogObject"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = (id)objc_opt_class(a1);
      v14 = v16;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Saved biometrics token data to keychain", (uint8_t *)&v15, 0xCu);

    }
  }

  CFRelease(v6);
}

+ (__CFDictionary)_copyKeychainQuery
{
  __CFDictionary *Mutable;
  SecAccessControlRef v3;

  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, kSecAttrService, CFSTR("com.apple.AskPermission.biometricsToken"));
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
  v3 = SecAccessControlCreateWithFlags(0, kSecAttrAccessibleWhenUnlockedThisDeviceOnly, 2uLL, 0);
  CFDictionaryAddValue(Mutable, kSecAttrAccessControl, v3);
  CFRelease(v3);
  return Mutable;
}

@end
