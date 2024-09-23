@implementation BKLocalization

+ (id)getLocalizedString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  objc_msgSend(v4, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/BiometricSupport.framework"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "getLocalizedString:fromStringTable:withBundle:", v5, CFSTR("biometrickitd"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)getLocalizedString:(id)a3 fromFile:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x24BDD1488];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/BiometricSupport.framework"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "getLocalizedString:fromStringTable:withBundle:", v8, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (void)reportLocalizationABC
{
  NSObject *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  BiometricAutoBugCapture *v5;
  BiometricAutoBugCapture *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = MEMORY[0x24BDACB70];
  if (__osLog)
    v3 = __osLog;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_2148C7000, v3, OS_LOG_TYPE_DEFAULT, "BKLocalization reportLocalizationABC start\n", (uint8_t *)&v11, 2u);
  }
  v4 = dispatch_queue_create("com.apple.biometrickitd.bkLocAbcQueue", 0);
  if (!v4)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = v2;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v11 = 136316162;
    v12 = "bkLocalizationABCDispatchQueue";
    v13 = 2048;
    v14 = 0;
    v15 = 2080;
    v16 = &unk_21491C593;
    v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BiometricSupportUserNotification.m";
    v19 = 1024;
    v20 = 373;
LABEL_30:
    _os_log_impl(&dword_2148C7000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v11, 0x30u);
    goto LABEL_14;
  }
  v5 = -[BiometricAutoBugCapture initWithDomain:process:dispatchQueue:]([BiometricAutoBugCapture alloc], "initWithDomain:process:dispatchQueue:", CFSTR("BiometricSupport"), CFSTR("biometrickitd"), v4);
  if (!v5)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = v2;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v11 = 136316162;
    v12 = "bkLocalizationABC";
    v13 = 2048;
    v14 = 0;
    v15 = 2080;
    v16 = &unk_21491C593;
    v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BiometricSupportUserNotification.m";
    v19 = 1024;
    v20 = 376;
    goto LABEL_30;
  }
  v6 = v5;
  v7 = -[BiometricAutoBugCapture sendAutoBugCaptureEvent:](v5, "sendAutoBugCaptureEvent:", 4099);
  if (__osLog)
    v8 = __osLog;
  else
    v8 = v2;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 67109120;
    LODWORD(v12) = v7;
    _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_DEFAULT, "BKLocalization sendAutoBugCaptureEvent status %d\n", (uint8_t *)&v11, 8u);
  }

LABEL_14:
  if (__osLog)
    v9 = __osLog;
  else
    v9 = v2;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_2148C7000, v9, OS_LOG_TYPE_DEFAULT, "BKLocalization reportLocalizationABC finish\n", (uint8_t *)&v11, 2u);
  }

}

+ (id)getLocalizedString:(id)a3 fromStringTable:(id)a4 withBundle:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  int v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "getLocalizedStringOrNil:fromStringTable:withBundle:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11 || objc_msgSend(v11, "isEqualToString:", v8))
  {
    objc_msgSend(v10, "pathForResource:ofType:", v9, CFSTR("loctable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x24BDACB70];
    if (__osLog)
      v15 = __osLog;
    else
      v15 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)MEMORY[0x24BDD1580];
      v17 = v15;
      objc_msgSend(v16, "defaultManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412546;
      v26 = v13;
      v27 = 1024;
      LODWORD(v28) = objc_msgSend(v18, "fileExistsAtPath:", v13);
      _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_DEFAULT, "BKLocalization Loctable path='%@' exists=%d\n", (uint8_t *)&v25, 0x12u);

    }
    objc_msgSend(v10, "localizedStringForKey:value:table:localization:", v8, 0, v9, CFSTR("en"));
    v19 = (id)objc_claimAutoreleasedReturnValue();

    if (__osLog)
      v20 = __osLog;
    else
      v20 = v14;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_retainAutorelease(v19);
      v22 = v20;
      v23 = objc_msgSend(v21, "UTF8String");
      v25 = 138412546;
      v26 = v8;
      v27 = 2080;
      v28 = v23;
      _os_log_impl(&dword_2148C7000, v22, OS_LOG_TYPE_DEFAULT, "BKLocalization fallback to en: \"%@\" => \"%s\"\n", (uint8_t *)&v25, 0x16u);

    }
    if (!v19)
      v19 = v8;
    objc_msgSend(a1, "reportLocalizationABC");

    v12 = v19;
  }

  return v12;
}

+ (id)getLocalizedStringOrNil:(id)a3 fromStringTable:(id)a4 withBundle:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  const char *v32;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  _BYTE v40[18];
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v10 = (void *)CFPreferencesCopyValue(CFSTR("AppleLanguages"), (CFStringRef)*MEMORY[0x24BDBD568], CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD570]);
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (!objc_msgSend(v10, "count"))
        {
          v11 = (__osLog ? __osLog : MEMORY[0x24BDACB70]);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_DEFAULT, "BKLocalization getLocalizedStringOrNil: languagePreferences are empty\n", buf, 2u);
          }
        }
        v12 = (void *)MEMORY[0x24BDD1488];
        objc_msgSend(v9, "localizations");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "preferredLocalizationsFromArray:forPreferences:", v13, v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (__osLog)
          v15 = __osLog;
        else
          v15 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = v15;
          v17 = objc_msgSend(v14, "count");
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v40 = v17;
          *(_WORD *)&v40[4] = 2112;
          *(_QWORD *)&v40[6] = v14;
          _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_DEFAULT, "BKLocalization preferred Localizations total: %d contents %@\n", buf, 0x12u);

        }
        v34 = v10;
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v18 = v14;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v36;
LABEL_17:
          v22 = 0;
          while (1)
          {
            if (*(_QWORD *)v36 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v22);
            objc_msgSend(v9, "localizedStringForKey:value:table:localization:", v7, 0, v8, v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = (__osLog ? __osLog : MEMORY[0x24BDACB70]);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              v26 = objc_retainAutorelease(v23);
              v27 = v25;
              v28 = objc_msgSend(v26, "UTF8String");
              v29 = objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
              *(_DWORD *)buf = 136315650;
              *(_QWORD *)v40 = v28;
              *(_WORD *)&v40[8] = 2112;
              *(_QWORD *)&v40[10] = v7;
              v41 = 2080;
              v42 = v29;
              _os_log_impl(&dword_2148C7000, v27, OS_LOG_TYPE_DEFAULT, "BKLocalization [%s] \"%@\" => \"%s\"\n", buf, 0x20u);

            }
            if (v24)
              break;
            if (v20 == ++v22)
            {
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
              if (v20)
                goto LABEL_17;
              goto LABEL_28;
            }
          }
        }
        else
        {
LABEL_28:
          v24 = 0;
        }

        v10 = v34;
        goto LABEL_48;
      }
      if (__osLog)
        v31 = __osLog;
      else
        v31 = MEMORY[0x24BDACB70];
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
LABEL_47:
        v24 = 0;
LABEL_48:

        goto LABEL_49;
      }
      *(_WORD *)buf = 0;
      v32 = "BKLocalization languagePreferences are not kind of NSArray\n";
    }
    else
    {
      if (__osLog)
        v31 = __osLog;
      else
        v31 = MEMORY[0x24BDACB70];
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        goto LABEL_47;
      *(_WORD *)buf = 0;
      v32 = "BKLocalization languagePreferences are not available\n";
    }
    _os_log_impl(&dword_2148C7000, v31, OS_LOG_TYPE_ERROR, v32, buf, 2u);
    goto LABEL_47;
  }
  if (__osLog)
    v30 = __osLog;
  else
    v30 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2148C7000, v30, OS_LOG_TYPE_ERROR, "BKLocalization getLocalizedStringOrNil: bundle is nil\n", buf, 2u);
  }
  v24 = 0;
LABEL_49:

  return v24;
}

@end
