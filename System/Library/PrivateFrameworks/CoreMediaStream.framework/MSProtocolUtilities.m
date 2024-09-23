@implementation MSProtocolUtilities

+ (id)Win32SHA1OfUDID:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  size_t v6;
  void *v7;
  void *v8;
  CC_SHA1_CTX v10;
  unsigned __int8 md[20];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  memset(&v10, 0, sizeof(v10));
  CC_SHA1_Init(&v10);
  CC_SHA1_Update(&v10, &Win32SHA1OfUDID___prepend, 3u);
  v4 = objc_retainAutorelease(v3);
  v5 = (const char *)objc_msgSend(v4, "UTF8String");
  v6 = strlen(v5);
  if (v6 >= 0xFFFFFFFF)
    __assert_rtn("+[MSProtocolUtilities Win32SHA1OfUDID:]", "MSProtocolUtilities.m", 54, "udidLength < UINT32_MAX");
  CC_SHA1_Update(&v10, v5, v6);
  CC_SHA1_Final(md, &v10);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", md, 20, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "MSHexString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)deviceInfoDictForPersonID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD block[5];

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__MSProtocolUtilities_deviceInfoDictForPersonID___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (deviceInfoDictForPersonID__once != -1)
    dispatch_once(&deviceInfoDictForPersonID__once, block);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MSPlatform();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UDID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("UDID"));

  if (deviceInfoDictForPersonID__clientInfo)
    objc_msgSend(v5, "setObject:forKey:", deviceInfoDictForPersonID__clientInfo, CFSTR("clientInfo"));
  MSPlatform();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    MSPlatform();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pushTokenForPersonID:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("pushToken"));

  }
  MSPlatform();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "authTokenForPersonID:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("authToken"));

  return v5;
}

+ (id)retryAfterDateBasedOnRetryAfterHeaderString:(id)a3
{
  __CFString *v3;
  const __CFCharacterSet *v4;
  CFDateRef DateFromString;
  CFDateRef v6;
  int v7;
  int v8;
  CFAbsoluteTime Current;
  CFDateRef v10;
  double v11;
  int v13;
  _BYTE v14[18];
  uint64_t v15;
  CFRange v16;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  if (!v3)
    goto LABEL_25;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_25;
  if (_nonNumericNonSpaceCharacterSet_onceToken != -1)
    dispatch_once(&_nonNumericNonSpaceCharacterSet_onceToken, &__block_literal_global_70);
  v4 = (const __CFCharacterSet *)_nonNumericNonSpaceCharacterSet_charSet_5767;
  v16.length = CFStringGetLength(v3);
  v16.location = 0;
  if (CFStringFindCharacterFromSet(v3, v4, v16, 0, 0))
  {
    if (_retryAfterDateFormatter_once_5768 != -1)
      dispatch_once(&_retryAfterDateFormatter_once_5768, &__block_literal_global_73);
    DateFromString = CFDateFormatterCreateDateFromString(0, (CFDateFormatterRef)_retryAfterDateFormatter_df_5769, v3, 0);
    if (DateFromString)
    {
      v6 = DateFromString;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v13 = 138543618;
        *(_QWORD *)v14 = v3;
        *(_WORD *)&v14[8] = 2114;
        *(_QWORD *)&v14[10] = v6;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Found a retry-after header with a date string: %{public}@. Date: %{public}@", (uint8_t *)&v13, 0x16u);
      }
      goto LABEL_15;
    }
  }
  v7 = -[__CFString intValue](v3, "intValue");
  if (v7 < 1 || (v8 = v7, Current = CFAbsoluteTimeGetCurrent(), (v10 = CFDateCreate(0, Current + (double)v8)) == 0))
  {
LABEL_25:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v13 = 138543362;
      *(_QWORD *)v14 = v3;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Found a retry-after header that could not be parsed: %{public}@", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_21;
  }
  v6 = v10;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v13 = 67109378;
    *(_DWORD *)v14 = v8;
    *(_WORD *)&v14[4] = 2114;
    *(_QWORD *)&v14[6] = v6;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Found a retry-after header with a relative interval of %d seconds. Date: %{public}@", (uint8_t *)&v13, 0x12u);
  }
LABEL_15:
  -[__CFDate timeIntervalSinceNow](v6, "timeIntervalSinceNow");
  if (v11 <= 0.0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543362;
      *(_QWORD *)v14 = v6;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Received a retry-after date which occurs in the past: %{public}@. Ignoring.", (uint8_t *)&v13, 0xCu);
    }

LABEL_21:
    v6 = 0;
  }

  return v6;
}

+ (id)appleIDSession
{
  if (appleIDSession_onceToken != -1)
    dispatch_once(&appleIDSession_onceToken, &__block_literal_global_5766);
  return (id)appleIDSession_session;
}

+ (id)_urlSession
{
  if (_urlSession_onceToken != -1)
    dispatch_once(&_urlSession_onceToken, &__block_literal_global_14_5760);
  return (id)_urlSession_session;
}

+ (void)fetchMPSStateWithBaseAvailabilityURL:(id)a3 personID:(id)a4 originalLibrarySize:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  const __CFData *v20;
  __CFString *v21;
  void *v22;
  uint64_t v23;
  MPSStateRequest *v24;
  CFStringRef SHA1StringOfUDID;
  NSObject *v26;
  __CFString *v27;
  id v28;
  __CFString *v29;
  __CFString *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  __CFString *v35;
  void *v36;
  __CFString *v37;
  __CFString *v38;
  __CFString *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  __CFString *v48;
  _QWORD v49[4];
  __CFString *v50;
  id v51;
  id v52;
  _QWORD v53[4];
  MPSStateRequest *v54;
  NSObject *v55;
  _QWORD v56[4];
  MPSStateRequest *v57;
  NSObject *v58;
  uint8_t buf[4];
  CFStringRef v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v43 = a6;
  v11 = a5;
  objc_msgSend(a3, "URLByAppendingPathComponent:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLByAppendingPathComponent:", CFSTR("sharedstreams"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLByAppendingPathComponent:", CFSTR("mpsstate"));
  v14 = objc_claimAutoreleasedReturnValue();

  v46 = (void *)v14;
  objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v14);
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = a1;
  objc_msgSend(a1, "deviceInfoDictForPersonID:", v10);
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v60 = v17;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "deviceInfo %@", buf, 0xCu);
  }
  -[__CFString objectForKey:](v17, "objectForKey:", CFSTR("authToken"));
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v10, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dataUsingEncoding:", 4);
    v20 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    v21 = (__CFString *)MSPCUCreateBase64StringFromData(v20);
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("X-MobileMe-AuthToken %@"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", v22, CFSTR("authorization"));

    }
  }
  -[__CFString objectForKey:](v17, "objectForKey:", CFSTR("clientInfo"));
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
    objc_msgSend(v16, "setObject:forKey:", v23, CFSTR("X-MMe-Client-Info"));
  v40 = (void *)v23;
  v47 = v10;
  objc_msgSend(v16, "setObject:forKey:", CFSTR("application/protobuf"), CFSTR("Content-Type"));
  v45 = v16;
  -[__CFString setAllHTTPHeaderFields:](v15, "setAllHTTPHeaderFields:", v16);
  v24 = objc_alloc_init(MPSStateRequest);
  -[__CFString objectForKey:](v17, "objectForKey:", CFSTR("UDID"));
  v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
  SHA1StringOfUDID = createSHA1StringOfUDID(v39);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v60 = SHA1StringOfUDID;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Setting MPS deviceID: %@", buf, 0xCu);
  }
  v38 = (__CFString *)SHA1StringOfUDID;
  -[MPSStateRequest setMPSDeviceID:](v24, "setMPSDeviceID:", SHA1StringOfUDID);
  v26 = dispatch_group_create();
  objc_msgSend(getCKContainerClass(), "containerWithIdentifier:", CFSTR("com.apple.photos.cloud"));
  v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v60 = v27;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "iCPLContainer is %p", buf, 0xCu);
    }
    dispatch_group_enter(v26);
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __105__MSProtocolUtilities_fetchMPSStateWithBaseAvailabilityURL_personID_originalLibrarySize_completionBlock___block_invoke;
    v56[3] = &unk_1E95BC108;
    v57 = v24;
    v58 = v26;
    -[__CFString fetchCurrentDeviceIDWithCompletionHandler:](v27, "fetchCurrentDeviceIDWithCompletionHandler:", v56);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v60 = 0;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "iCPLContainer is %p", buf, 0xCu);
  }
  objc_msgSend(getCKContainerClass(), "containerWithIdentifier:", CFSTR("com.apple.backup.ios"));
  v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)v18;
  if (v48)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v60 = v48;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "backupContainer is %p", buf, 0xCu);
    }
    dispatch_group_enter(v26);
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __105__MSProtocolUtilities_fetchMPSStateWithBaseAvailabilityURL_personID_originalLibrarySize_completionBlock___block_invoke_40;
    v53[3] = &unk_1E95BC108;
    v54 = v24;
    v55 = v26;
    -[__CFString fetchCurrentDeviceIDWithCompletionHandler:](v48, "fetchCurrentDeviceIDWithCompletionHandler:", v53);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v60 = 0;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "backupContainer is %p", buf, 0xCu);
  }
  v44 = v17;
  v28 = objc_alloc_init(MEMORY[0x1E0D4E0A8]);
  objc_msgSend(v28, "backupDeviceUUID");
  v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    -[MPSStateRequest setBackupDeviceUUID:](v24, "setBackupDeviceUUID:", v29);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v29;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Setting Backup deviceUUID: %@", buf, 0xCu);
    }
  }
  v37 = v27;
  objc_msgSend(v28, "backupDeviceUDID");
  v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    -[MPSStateRequest setBackupDeviceUDID:](v24, "setBackupDeviceUDID:", v30);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v30;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Setting Backup deviceUDID: %@", buf, 0xCu);
    }
  }
  dispatch_group_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
  v31 = objc_msgSend(v11, "longLongValue");

  -[MPSStateRequest setOriginalLibrarySize:](v24, "setOriginalLibrarySize:", v31);
  -[MPSStateRequest data](v24, "data");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString setHTTPBody:](v15, "setHTTPBody:", v32);
  -[__CFString setHTTPMethod:](v15, "setHTTPMethod:", CFSTR("POST"));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v60 = v15;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Request %@", buf, 0xCu);
  }
  objc_msgSend((id)objc_opt_class(), "_urlSession");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __105__MSProtocolUtilities_fetchMPSStateWithBaseAvailabilityURL_personID_originalLibrarySize_completionBlock___block_invoke_44;
  v49[3] = &unk_1E95BC130;
  v50 = v15;
  v51 = v43;
  v52 = v41;
  v34 = v43;
  v35 = v15;
  objc_msgSend(v33, "dataTaskWithRequest:completionHandler:", v35, v49);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "resume");
}

+ (void)applyUserDefaultOverridesToResponse:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForKey:", CFSTR("MPSStateResponseOverride"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(":"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count") == 6)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setHasRetryAfterSeconds:", objc_msgSend(v8, "BOOLValue"));

      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setRetryAfterSeconds:", objc_msgSend(v9, "integerValue"));

      objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setHasMpsAction:", objc_msgSend(v10, "BOOLValue"));

      objc_msgSend(v7, "objectAtIndexedSubscript:", 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setMpsAction:", objc_msgSend(v11, "intValue"));

      objc_msgSend(v7, "objectAtIndexedSubscript:", 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setHasIcplAction:", objc_msgSend(v12, "BOOLValue"));

      objc_msgSend(v7, "objectAtIndexedSubscript:", 5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setIcplAction:", objc_msgSend(v13, "intValue"));

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138543618;
        v15 = v3;
        v16 = 2114;
        v17 = CFSTR("MPSStateResponseOverride");
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Overriding MPS state response to %{public}@ because %{public}@ user default is set", (uint8_t *)&v14, 0x16u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v14 = 138543362;
      v15 = v7;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Invalid override string, unexpected item count: %{public}@", (uint8_t *)&v14, 0xCu);
    }

  }
}

void __105__MSProtocolUtilities_fetchMPSStateWithBaseAvailabilityURL_personID_originalLibrarySize_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setICPLDeviceID:", v5);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Setting iCPL deviceID: %@ Error: %@", (uint8_t *)&v7, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __105__MSProtocolUtilities_fetchMPSStateWithBaseAvailabilityURL_personID_originalLibrarySize_completionBlock___block_invoke_40(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setBackupDeviceID:", v5);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Setting Backup deviceID: %@ Error: %@", (uint8_t *)&v7, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __105__MSProtocolUtilities_fetchMPSStateWithBaseAvailabilityURL_personID_originalLibrarySize_completionBlock___block_invoke_44(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  MPSStateResponse *v8;
  id v9;
  void *v10;
  MPSStateResponse *v11;
  MPSStateResponse *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  MPSStateResponse *v16;
  uint8_t buf[4];
  MPSStateResponse *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Response %@", buf, 0xCu);
    }
    v12 = v8;
    v13 = -[MPSStateResponse statusCode](v12, "statusCode");
    if (v13 == 200)
    {
      if (v7)
      {
        v11 = -[MPSStateResponse initWithData:]([MPSStateResponse alloc], "initWithData:", v7);
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v18 = v11;
          _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "MPSStateResponse %{public}@", buf, 0xCu);
        }
        objc_msgSend(*(id *)(a1 + 48), "applyUserDefaultOverridesToResponse:", v11);
        v10 = 0;
        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "MSErrorWithDomain:code:description:", CFSTR("MSASProtocolErrorDomain"), 4, CFSTR("Missing data in the response"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Missing data from response", buf, 2u);
      }
    }
    else
    {
      v14 = v13;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid status code %ld in the response"), v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "MSErrorWithDomain:code:description:", CFSTR("MSASProtocolErrorDomain"), 4, v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v18 = (MPSStateResponse *)v14;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Invalid status code %ld, ignoring", buf, 0xCu);
      }

    }
    v11 = 0;
LABEL_16:

    goto LABEL_17;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v16 = *(MPSStateResponse **)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v18 = v16;
    v19 = 2112;
    v20 = v9;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Received error for request %@: %@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "MSErrorWithDomain:code:description:underlyingError:", CFSTR("MSASProtocolErrorDomain"), 10, CFSTR("received an error from server"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
LABEL_17:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __34__MSProtocolUtilities__urlSession__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C92CA0], "defaultSessionConfiguration");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00140]), "initWithIdentifier:", CFSTR("com.apple.mediastream"));
  objc_msgSend(v3, "set_appleIDContext:", v0);

  objc_msgSend(MEMORY[0x1E0C92C98], "sessionWithConfiguration:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_urlSession_session;
  _urlSession_session = v1;

}

void __37__MSProtocolUtilities_appleIDSession__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D00140]), "initWithIdentifier:", CFSTR("com.apple.mediastream"));
  v1 = (void *)appleIDSession_session;
  appleIDSession_session = v0;

}

void __49__MSProtocolUtilities_deviceInfoDictForPersonID___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "infoDictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", *MEMORY[0x1E0C9AE78]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("CFBundleShortVersionString"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%@"), v12, v1);
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  MSPlatform();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hardwareString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MSPlatform();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "OSString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MSPlatform();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appBundleInfoString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@><%@><%@ (%@)>"), v5, v7, v2, v9);
  v11 = (void *)deviceInfoDictForPersonID__clientInfo;
  deviceInfoDictForPersonID__clientInfo = v10;

}

@end
