@implementation BKDefaults

+ (id)device
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[BKDeviceManager availableDevices](BKDeviceManager, "availableDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v9 = 0;
    +[BKDevice deviceWithDescriptor:error:](BKDevice, "deviceWithDescriptor:error:", v3, &v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v9;
    if (!v4)
    {
      if (__osLog)
        v6 = __osLog;
      else
        v6 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v11 = v3;
        v12 = 2112;
        v13 = v5;
        _os_log_impl(&dword_1AF533000, v6, OS_LOG_TYPE_ERROR, "Cannot instantiate device with descriptor %@, error %@\n", buf, 0x16u);
      }
    }

  }
  else
  {
    if (__osLog)
      v7 = __osLog;
    else
      v7 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF533000, v7, OS_LOG_TYPE_ERROR, "Cannot find any biometric device\n", buf, 2u);
    }
    v4 = 0;
  }

  return v4;
}

+ (id)numberForKey:(id)a3 withError:(id *)a4
{
  char *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v6;
    _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_DEFAULT, "BKDevice::numberForKey:%@\n", buf, 0xCu);
  }
  objc_msgSend(a1, "device");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    v11 = *(void **)(v9 + 8);
    v25 = 0;
    v12 = objc_msgSend(v11, "getPreferencesValue:forKey:", &v25, v6);
    v13 = v25;
    v14 = v13;
    if (!(_DWORD)v12)
    {
      if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        if (__osLog)
          v24 = __osLog;
        else
          v24 = v7;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v27 = "!result || [result isKindOfClass:[NSNumber class]]";
          v28 = 2048;
          v29 = 0;
          v30 = 2080;
          v31 = &unk_1AF575226;
          v32 = 2080;
          v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDefaults.m";
          v34 = 1024;
          v35 = 50;
          _os_log_impl(&dword_1AF533000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        setErrorWithOSStatus((id)0x16, a4);
        v15 = 0;
      }
      else
      {
        v15 = v14;
      }
      if (__osLogTrace)
        v16 = __osLogTrace;
      else
        v16 = v7;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        if (a4)
          v17 = *a4;
        else
          v17 = 0;
        *(_DWORD *)buf = 138412802;
        v27 = v6;
        v28 = 2112;
        v29 = v15;
        v30 = 2112;
        v31 = v17;
        _os_log_impl(&dword_1AF533000, v16, OS_LOG_TYPE_DEFAULT, "BKDevice::numberForKey:%@ -> %@ %@\n", buf, 0x20u);
      }
      goto LABEL_19;
    }
    if (__osLog)
      v21 = __osLog;
    else
      v21 = v7;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v27 = "err == 0 ";
      v28 = 2048;
      v29 = (id)(int)v12;
      v30 = 2080;
      v31 = &unk_1AF575226;
      v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDefaults.m";
      v34 = 1024;
      v35 = 49;
      _os_log_impl(&dword_1AF533000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (__osLog)
      v20 = __osLog;
    else
      v20 = v7;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v27 = "device";
      v28 = 2048;
      v29 = 0;
      v30 = 2080;
      v31 = &unk_1AF575226;
      v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDefaults.m";
      v34 = 1024;
      v35 = 47;
      _os_log_impl(&dword_1AF533000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v14 = 0;
    v12 = 263;
  }
  setErrorWithOSStatus((id)v12, a4);
  if (__osLogTrace)
    v22 = __osLogTrace;
  else
    v22 = v7;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    if (a4)
      v23 = *a4;
    else
      v23 = 0;
    *(_DWORD *)buf = 138412802;
    v27 = v6;
    v28 = 2112;
    v29 = 0;
    v30 = 2112;
    v31 = v23;
    _os_log_impl(&dword_1AF533000, v22, OS_LOG_TYPE_ERROR, "BKDevice::numberForKey:%@ -> %@ %@\n", buf, 0x20u);
  }
  v15 = 0;
LABEL_19:
  v18 = v15;

  return v18;
}

+ (id)stringForKey:(id)a3 withError:(id *)a4
{
  char *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v6;
    _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_DEFAULT, "BKDevice::stringForKey:%@\n", buf, 0xCu);
  }
  objc_msgSend(a1, "device");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    v11 = *(void **)(v9 + 8);
    v25 = 0;
    v12 = objc_msgSend(v11, "getPreferencesValue:forKey:", &v25, v6);
    v13 = v25;
    v14 = v13;
    if (!(_DWORD)v12)
    {
      if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        if (__osLog)
          v24 = __osLog;
        else
          v24 = v7;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v27 = "!result || [result isKindOfClass:[NSString class]]";
          v28 = 2048;
          v29 = 0;
          v30 = 2080;
          v31 = &unk_1AF575226;
          v32 = 2080;
          v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDefaults.m";
          v34 = 1024;
          v35 = 71;
          _os_log_impl(&dword_1AF533000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        setErrorWithOSStatus((id)0x16, a4);
        v15 = 0;
      }
      else
      {
        v15 = v14;
      }
      if (__osLogTrace)
        v16 = __osLogTrace;
      else
        v16 = v7;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        if (a4)
          v17 = *a4;
        else
          v17 = 0;
        *(_DWORD *)buf = 138412802;
        v27 = v6;
        v28 = 2112;
        v29 = v15;
        v30 = 2112;
        v31 = v17;
        _os_log_impl(&dword_1AF533000, v16, OS_LOG_TYPE_DEFAULT, "BKDevice::stringForKey:%@ -> %@ %@\n", buf, 0x20u);
      }
      goto LABEL_19;
    }
    if (__osLog)
      v21 = __osLog;
    else
      v21 = v7;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v27 = "err == 0 ";
      v28 = 2048;
      v29 = (id)(int)v12;
      v30 = 2080;
      v31 = &unk_1AF575226;
      v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDefaults.m";
      v34 = 1024;
      v35 = 70;
      _os_log_impl(&dword_1AF533000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    if (__osLog)
      v20 = __osLog;
    else
      v20 = v7;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v27 = "device";
      v28 = 2048;
      v29 = 0;
      v30 = 2080;
      v31 = &unk_1AF575226;
      v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDefaults.m";
      v34 = 1024;
      v35 = 68;
      _os_log_impl(&dword_1AF533000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v14 = 0;
    v12 = 263;
  }
  setErrorWithOSStatus((id)v12, a4);
  if (__osLogTrace)
    v22 = __osLogTrace;
  else
    v22 = v7;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    if (a4)
      v23 = *a4;
    else
      v23 = 0;
    *(_DWORD *)buf = 138412802;
    v27 = v6;
    v28 = 2112;
    v29 = 0;
    v30 = 2112;
    v31 = v23;
    _os_log_impl(&dword_1AF533000, v22, OS_LOG_TYPE_ERROR, "BKDevice::stringForKey:%@ -> %@ %@\n", buf, 0x20u);
  }
  v15 = 0;
LABEL_19:
  v18 = v15;

  return v18;
}

+ (BOOL)setNumber:(id)a3 forKey:(id)a4 withError:(id *)a5
{
  char *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  BOOL v17;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  int v24;
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  _BYTE v29[18];
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = (char *)a3;
  v9 = a4;
  v10 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v11 = __osLogTrace;
  else
    v11 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138412546;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_1AF533000, v11, OS_LOG_TYPE_DEFAULT, "BKDevice::setNumber:%@ forKey:%@\n", (uint8_t *)&v24, 0x16u);
  }
  objc_msgSend(a1, "device");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
  {
    v14 = objc_msgSend(*(id *)(v12 + 8), "setPreferencesValue:forKey:", v8, v9);
    if (!(_DWORD)v14)
    {
      if (__osLogTrace)
        v15 = __osLogTrace;
      else
        v15 = v10;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        if (a5)
          v16 = *a5;
        else
          v16 = 0;
        v24 = 138413058;
        v25 = v8;
        v26 = 2112;
        v27 = v9;
        v28 = 1024;
        v17 = 1;
        *(_DWORD *)v29 = 1;
        *(_WORD *)&v29[4] = 2112;
        *(_QWORD *)&v29[6] = v16;
        _os_log_impl(&dword_1AF533000, v15, OS_LOG_TYPE_DEFAULT, "BKDevice::setNumber:%@ forKey:%@ -> %d %@\n", (uint8_t *)&v24, 0x26u);
      }
      else
      {
        v17 = 1;
      }
      goto LABEL_17;
    }
    v20 = v14;
    if (__osLog)
      v21 = __osLog;
    else
      v21 = v10;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v24 = 136316162;
      v25 = "err == 0 ";
      v26 = 2048;
      v27 = (id)(int)v20;
      v28 = 2080;
      *(_QWORD *)v29 = &unk_1AF575226;
      *(_WORD *)&v29[8] = 2080;
      *(_QWORD *)&v29[10] = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDefaults.m";
      v30 = 1024;
      v31 = 90;
      _os_log_impl(&dword_1AF533000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v24, 0x30u);
    }
  }
  else
  {
    if (__osLog)
      v19 = __osLog;
    else
      v19 = v10;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v24 = 136316162;
      v25 = "device";
      v26 = 2048;
      v27 = 0;
      v28 = 2080;
      *(_QWORD *)v29 = &unk_1AF575226;
      *(_WORD *)&v29[8] = 2080;
      *(_QWORD *)&v29[10] = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDefaults.m";
      v30 = 1024;
      v31 = 88;
      _os_log_impl(&dword_1AF533000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v24, 0x30u);
    }
    v20 = 263;
  }
  setErrorWithOSStatus((id)v20, a5);
  if (__osLogTrace)
    v22 = __osLogTrace;
  else
    v22 = v10;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    if (a5)
      v23 = *a5;
    else
      v23 = 0;
    v24 = 138413058;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    v28 = 1024;
    *(_DWORD *)v29 = 0;
    *(_WORD *)&v29[4] = 2112;
    *(_QWORD *)&v29[6] = v23;
    _os_log_impl(&dword_1AF533000, v22, OS_LOG_TYPE_ERROR, "BKDevice::setNumber:%@ forKey:%@ -> %d %@\n", (uint8_t *)&v24, 0x26u);
  }
  v17 = 0;
LABEL_17:

  return v17;
}

+ (BOOL)setString:(id)a3 forKey:(id)a4 withError:(id *)a5
{
  char *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  BOOL v17;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  int v24;
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  _BYTE v29[18];
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = (char *)a3;
  v9 = a4;
  v10 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v11 = __osLogTrace;
  else
    v11 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138412546;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_1AF533000, v11, OS_LOG_TYPE_DEFAULT, "BKDevice::setString:%@ forKey:%@\n", (uint8_t *)&v24, 0x16u);
  }
  objc_msgSend(a1, "device");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
  {
    v14 = objc_msgSend(*(id *)(v12 + 8), "setPreferencesValue:forKey:", v8, v9);
    if (!(_DWORD)v14)
    {
      if (__osLogTrace)
        v15 = __osLogTrace;
      else
        v15 = v10;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        if (a5)
          v16 = *a5;
        else
          v16 = 0;
        v24 = 138413058;
        v25 = v8;
        v26 = 2112;
        v27 = v9;
        v28 = 1024;
        v17 = 1;
        *(_DWORD *)v29 = 1;
        *(_WORD *)&v29[4] = 2112;
        *(_QWORD *)&v29[6] = v16;
        _os_log_impl(&dword_1AF533000, v15, OS_LOG_TYPE_DEFAULT, "BKDevice::setString:%@ forKey:%@ -> %d %@\n", (uint8_t *)&v24, 0x26u);
      }
      else
      {
        v17 = 1;
      }
      goto LABEL_17;
    }
    v20 = v14;
    if (__osLog)
      v21 = __osLog;
    else
      v21 = v10;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v24 = 136316162;
      v25 = "err == 0 ";
      v26 = 2048;
      v27 = (id)(int)v20;
      v28 = 2080;
      *(_QWORD *)v29 = &unk_1AF575226;
      *(_WORD *)&v29[8] = 2080;
      *(_QWORD *)&v29[10] = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDefaults.m";
      v30 = 1024;
      v31 = 109;
      _os_log_impl(&dword_1AF533000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v24, 0x30u);
    }
  }
  else
  {
    if (__osLog)
      v19 = __osLog;
    else
      v19 = v10;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v24 = 136316162;
      v25 = "device";
      v26 = 2048;
      v27 = 0;
      v28 = 2080;
      *(_QWORD *)v29 = &unk_1AF575226;
      *(_WORD *)&v29[8] = 2080;
      *(_QWORD *)&v29[10] = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDefaults.m";
      v30 = 1024;
      v31 = 107;
      _os_log_impl(&dword_1AF533000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v24, 0x30u);
    }
    v20 = 263;
  }
  setErrorWithOSStatus((id)v20, a5);
  if (__osLogTrace)
    v22 = __osLogTrace;
  else
    v22 = v10;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    if (a5)
      v23 = *a5;
    else
      v23 = 0;
    v24 = 138413058;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    v28 = 1024;
    *(_DWORD *)v29 = 0;
    *(_WORD *)&v29[4] = 2112;
    *(_QWORD *)&v29[6] = v23;
    _os_log_impl(&dword_1AF533000, v22, OS_LOG_TYPE_ERROR, "BKDevice::setString:%@ forKey:%@ -> %d %@\n", (uint8_t *)&v24, 0x26u);
  }
  v17 = 0;
LABEL_17:

  return v17;
}

@end
