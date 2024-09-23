@implementation BKDeviceTouchID

+ (BOOL)deviceAvailableWithFailure:(BOOL *)a3
{
  NSObject *v4;
  NSObject *v5;
  char v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;
  BOOL v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v4 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v5 = __osLogTrace;
  else
    v5 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v5, OS_LOG_TYPE_DEFAULT, "BKDeviceTouchID::deviceAvailableWithFailure\n", buf, 2u);
  }
  v11 = 0;
  if ((isEphemeralMultiUser() & 1) != 0)
    goto LABEL_15;
  v6 = isTouchIDPlatformWithFailure(&v11);
  if (a3)
    *a3 = v11;
  if ((v6 & 1) == 0)
  {
LABEL_15:
    if (__osLogTrace)
      v9 = __osLogTrace;
    else
      v9 = v4;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      v13 = 0;
      v14 = 1024;
      v15 = v11;
      _os_log_impl(&dword_1AF533000, v9, OS_LOG_TYPE_ERROR, "BKDeviceTouchID::deviceAvailableWithFailure -> %d (%u)\n", buf, 0xEu);
    }
    v8 = 0;
  }
  else
  {
    if (__osLogTrace)
      v7 = __osLogTrace;
    else
      v7 = v4;
    v8 = 1;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v13 = 1;
      v14 = 1024;
      v15 = v11;
      _os_log_impl(&dword_1AF533000, v7, OS_LOG_TYPE_DEFAULT, "BKDeviceTouchID::deviceAvailableWithFailure -> %d (%u)\n", buf, 0xEu);
    }
  }
  kdebug_trace();
  return v8;
}

- (id)createEnrollOperationWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  BKEnrollTouchIDOperation *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  NSObject *v13;
  NSObject *v14;
  id v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v5 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1AF533000, v6, OS_LOG_TYPE_DEFAULT, "BKDeviceTouchID::createEnrollOperation\n", (uint8_t *)&v16, 2u);
  }
  v7 = -[BKEnrollTouchIDOperation initWithDevice:]([BKEnrollTouchIDOperation alloc], "initWithDevice:", self);
  if (v7)
  {
    if (__osLogTrace)
      v8 = __osLogTrace;
    else
      v8 = v5;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v9 = *a3;
      else
        v9 = 0;
      v16 = 138412546;
      v17 = (const char *)v7;
      v18 = 2112;
      v19 = v9;
      v10 = v8;
      v11 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
      _os_log_impl(&dword_1AF533000, v10, v11, "BKDeviceTouchID::createEnrollOperation -> %@ %@\n", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = v5;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = 136316162;
      v17 = "enrollOp";
      v18 = 2048;
      v19 = 0;
      v20 = 2080;
      v21 = &unk_1AF575226;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDeviceTouchID.m";
      v24 = 1024;
      v25 = 420;
      _os_log_impl(&dword_1AF533000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
    }
    setError((id)1, a3);
    if (__osLogTrace)
      v14 = __osLogTrace;
    else
      v14 = v5;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      if (a3)
        v15 = *a3;
      else
        v15 = 0;
      v16 = 138412546;
      v17 = 0;
      v18 = 2112;
      v19 = v15;
      v10 = v14;
      v11 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }
  kdebug_trace();
  return v7;
}

- (id)createExtendEnrollTouchIDOperationWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  BKExtendEnrollTouchIDOperation *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  NSObject *v13;
  NSObject *v14;
  id v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v5 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1AF533000, v6, OS_LOG_TYPE_DEFAULT, "BKDeviceTouchID::createExtendEnrollTouchIDOperationWithError\n", (uint8_t *)&v16, 2u);
  }
  v7 = -[BKOperation initWithDevice:]([BKExtendEnrollTouchIDOperation alloc], "initWithDevice:", self);
  if (v7)
  {
    if (__osLogTrace)
      v8 = __osLogTrace;
    else
      v8 = v5;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v9 = *a3;
      else
        v9 = 0;
      v16 = 138412546;
      v17 = (const char *)v7;
      v18 = 2112;
      v19 = v9;
      v10 = v8;
      v11 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
      _os_log_impl(&dword_1AF533000, v10, v11, "BKDeviceTouchID::createExtendEnrollTouchIDOperationWithError -> %@ %@\n", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = v5;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = 136316162;
      v17 = "extEnrollOp";
      v18 = 2048;
      v19 = 0;
      v20 = 2080;
      v21 = &unk_1AF575226;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDeviceTouchID.m";
      v24 = 1024;
      v25 = 441;
      _os_log_impl(&dword_1AF533000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
    }
    setError((id)1, a3);
    if (__osLogTrace)
      v14 = __osLogTrace;
    else
      v14 = v5;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      if (a3)
        v15 = *a3;
      else
        v15 = 0;
      v16 = 138412546;
      v17 = 0;
      v18 = 2112;
      v19 = v15;
      v10 = v14;
      v11 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }
  kdebug_trace();
  return v7;
}

- (id)createMatchOperationWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  BKMatchTouchIDOperation *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  NSObject *v13;
  NSObject *v14;
  id v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v5 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1AF533000, v6, OS_LOG_TYPE_DEFAULT, "BKDeviceTouchID::createMatchOperation\n", (uint8_t *)&v16, 2u);
  }
  v7 = -[BKMatchOperation initWithDevice:]([BKMatchTouchIDOperation alloc], "initWithDevice:", self);
  if (v7)
  {
    if (__osLogTrace)
      v8 = __osLogTrace;
    else
      v8 = v5;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v9 = *a3;
      else
        v9 = 0;
      v16 = 138412546;
      v17 = (const char *)v7;
      v18 = 2112;
      v19 = v9;
      v10 = v8;
      v11 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
      _os_log_impl(&dword_1AF533000, v10, v11, "BKDeviceTouchID::createMatchOperation -> %@ %@\n", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = v5;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = 136316162;
      v17 = "matchOp";
      v18 = 2048;
      v19 = 0;
      v20 = 2080;
      v21 = &unk_1AF575226;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDeviceTouchID.m";
      v24 = 1024;
      v25 = 462;
      _os_log_impl(&dword_1AF533000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
    }
    setError((id)1, a3);
    if (__osLogTrace)
      v14 = __osLogTrace;
    else
      v14 = v5;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      if (a3)
        v15 = *a3;
      else
        v15 = 0;
      v16 = 138412546;
      v17 = 0;
      v18 = 2112;
      v19 = v15;
      v10 = v14;
      v11 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }
  kdebug_trace();
  return v7;
}

- (id)createPresenceDetectOperationWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  BKFingerDetectOperation *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  NSObject *v13;
  NSObject *v14;
  id v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v5 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1AF533000, v6, OS_LOG_TYPE_DEFAULT, "BKDeviceTouchID::createPresenceDetectOperation\n", (uint8_t *)&v16, 2u);
  }
  v7 = -[BKOperation initWithDevice:]([BKFingerDetectOperation alloc], "initWithDevice:", self);
  if (v7)
  {
    if (__osLogTrace)
      v8 = __osLogTrace;
    else
      v8 = v5;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v9 = *a3;
      else
        v9 = 0;
      v16 = 138412546;
      v17 = (const char *)v7;
      v18 = 2112;
      v19 = v9;
      v10 = v8;
      v11 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
      _os_log_impl(&dword_1AF533000, v10, v11, "BKDeviceTouchID::createPresenceDetectOperation -> %@ %@\n", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = v5;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = 136316162;
      v17 = "fdetOp";
      v18 = 2048;
      v19 = 0;
      v20 = 2080;
      v21 = &unk_1AF575226;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDeviceTouchID.m";
      v24 = 1024;
      v25 = 483;
      _os_log_impl(&dword_1AF533000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
    }
    setError((id)1, a3);
    if (__osLogTrace)
      v14 = __osLogTrace;
    else
      v14 = v5;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      if (a3)
        v15 = *a3;
      else
        v15 = 0;
      v16 = 138412546;
      v17 = 0;
      v18 = 2112;
      v19 = v15;
      v10 = v14;
      v11 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }
  kdebug_trace();
  return v7;
}

- (BOOL)enableBackgroundFingerDetection:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  NSObject *v7;
  NSObject *v8;
  BiometricKitXPCClient *xpcClient;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  NSObject *v17;
  NSObject *v18;
  id v19;
  int v20;
  _BYTE v21[20];
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v5 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v7 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super._xpcClient;
    v10 = v8;
    v20 = 67109376;
    *(_DWORD *)v21 = v5;
    *(_WORD *)&v21[4] = 2048;
    *(_QWORD *)&v21[6] = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEFAULT, "BKDeviceTouchID::enableBackgroundFingerDetection: %d (_cid %lu)\n", (uint8_t *)&v20, 0x12u);

  }
  v11 = (void *)-[BiometricKitXPCClient enableBackgroundFdet:](self->super._xpcClient, "enableBackgroundFdet:", v5);
  if ((_DWORD)v11)
  {
    if (__osLog)
      v17 = __osLog;
    else
      v17 = v7;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v20 = 136316162;
      *(_QWORD *)v21 = "err == 0 ";
      *(_WORD *)&v21[8] = 2048;
      *(_QWORD *)&v21[10] = (int)v11;
      *(_WORD *)&v21[18] = 2080;
      v22 = &unk_1AF575226;
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDeviceTouchID.m";
      v25 = 1024;
      v26 = 505;
      _os_log_impl(&dword_1AF533000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
    }
    setErrorWithOSStatus(v11, a4);
    if (__osLogTrace)
      v18 = __osLogTrace;
    else
      v18 = v7;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      if (a4)
        v19 = *a4;
      else
        v19 = 0;
      v20 = 67109634;
      *(_DWORD *)v21 = 0;
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)&v21[6] = (_DWORD)v11;
      *(_WORD *)&v21[10] = 2112;
      *(_QWORD *)&v21[12] = v19;
      v14 = v18;
      v15 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }
  else
  {
    if (__osLogTrace)
      v12 = __osLogTrace;
    else
      v12 = v7;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (a4)
        v13 = *a4;
      else
        v13 = 0;
      v20 = 67109634;
      *(_DWORD *)v21 = 1;
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)&v21[6] = 0;
      *(_WORD *)&v21[10] = 2112;
      *(_QWORD *)&v21[12] = v13;
      v14 = v12;
      v15 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
      _os_log_impl(&dword_1AF533000, v14, v15, "BKDeviceTouchID::enableBackgroundFingerDetection: -> %d %{errno}d %@\n", (uint8_t *)&v20, 0x18u);
    }
  }
  kdebug_trace();
  return (_DWORD)v11 == 0;
}

@end
