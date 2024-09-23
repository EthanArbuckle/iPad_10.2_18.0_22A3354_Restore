@implementation BKDevicePearl

+ (BOOL)deviceAvailableWithFailure:(BOOL *)a3
{
  NSObject *v4;
  NSObject *v5;
  char v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;
  int v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v4 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v5 = __osLogTrace;
  else
    v5 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_1AF533000, v5, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::deviceAvailableWithFailure\n", (uint8_t *)&v11, 2u);
  }
  if ((isEphemeralMultiUser() & 1) != 0)
    goto LABEL_15;
  v6 = isFaceIDPlatform();
  if (a3)
    *a3 = 0;
  if ((v6 & 1) == 0)
  {
LABEL_15:
    if (__osLogTrace)
      v9 = __osLogTrace;
    else
      v9 = v4;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 67109120;
      v12 = 0;
      _os_log_impl(&dword_1AF533000, v9, OS_LOG_TYPE_ERROR, "BKDevicePearl::deviceAvailableWithFailure -> %d\n", (uint8_t *)&v11, 8u);
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
      v11 = 67109120;
      v12 = 1;
      _os_log_impl(&dword_1AF533000, v7, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::deviceAvailableWithFailure -> %d\n", (uint8_t *)&v11, 8u);
    }
  }
  kdebug_trace();
  return v8;
}

- (int64_t)pearlState
{
  return -[BKDevicePearl deviceStateWithStatus:](self, "deviceStateWithStatus:", -[BiometricKitXPCClient getDeviceState](self->super._xpcClient, "getDeviceState"));
}

- (id)createEnrollOperationWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  BKEnrollPearlOperation *v7;
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
    _os_log_impl(&dword_1AF533000, v6, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::createEnrollOperation\n", (uint8_t *)&v16, 2u);
  }
  v7 = -[BKEnrollPearlOperation initWithDevice:]([BKEnrollPearlOperation alloc], "initWithDevice:", self);
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
      _os_log_impl(&dword_1AF533000, v10, v11, "BKDevicePearl::createEnrollOperation -> %@ %@\n", (uint8_t *)&v16, 0x16u);
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
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      v24 = 1024;
      v25 = 1330;
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
  BKMatchPearlOperation *v7;
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
    _os_log_impl(&dword_1AF533000, v6, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::createMatchOperation\n", (uint8_t *)&v16, 2u);
  }
  v7 = -[BKMatchOperation initWithDevice:]([BKMatchPearlOperation alloc], "initWithDevice:", self);
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
      _os_log_impl(&dword_1AF533000, v10, v11, "BKDevicePearl::createMatchOperation -> %@ %@\n", (uint8_t *)&v16, 0x16u);
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
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      v24 = 1024;
      v25 = 1351;
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
  BKFaceDetectOperation *v7;
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
    _os_log_impl(&dword_1AF533000, v6, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::createPresenceDetectOperation\n", (uint8_t *)&v16, 2u);
  }
  v7 = -[BKFaceDetectOperation initWithDevice:]([BKFaceDetectOperation alloc], "initWithDevice:", self);
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
      _os_log_impl(&dword_1AF533000, v10, v11, "BKDevicePearl::createPresenceDetectOperation -> %@ %@\n", (uint8_t *)&v16, 0x16u);
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
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      v24 = 1024;
      v25 = 1372;
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

- (id)queryIdentityMigrationFailureForUser:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  NSObject *v7;
  NSObject *v8;
  BiometricKitXPCClient *xpcClient;
  NSObject *v10;
  int v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  unsigned __int8 v21;
  uint8_t buf[4];
  _BYTE v23[18];
  __int16 v24;
  void *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v5 = *(_QWORD *)&a3;
  v30 = *MEMORY[0x1E0C80C00];
  v7 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super._xpcClient;
    v10 = v8;
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v23 = v5;
    *(_WORD *)&v23[4] = 2048;
    *(_QWORD *)&v23[6] = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::queryIdentityMigrationFailureForUser: %u (_cid %lu)\n", buf, 0x12u);

  }
  v21 = 0;
  v11 = -[BiometricKitXPCClient queryIdentityMigrationFailureForUser:failed:clear:](self->super._xpcClient, "queryIdentityMigrationFailureForUser:failed:clear:", v5, &v21, 0);
  if (v11)
  {
    v16 = (void *)v11;
    if (__osLog)
      v17 = __osLog;
    else
      v17 = v7;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v23 = "err == 0 ";
      *(_WORD *)&v23[8] = 2048;
      *(_QWORD *)&v23[10] = v16;
      v24 = 2080;
      v25 = &unk_1AF575226;
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      v28 = 1024;
      v29 = 1394;
      _os_log_impl(&dword_1AF533000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setErrorWithOSStatus(v16, a4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v21);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      if (__osLogTrace)
        v14 = __osLogTrace;
      else
        v14 = v7;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        if (a4)
          v15 = *a4;
        else
          v15 = 0;
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v23 = v13;
        *(_WORD *)&v23[8] = 2112;
        *(_QWORD *)&v23[10] = v15;
        _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::queryIdentityMigrationFailureForUser -> %@ %@\n", buf, 0x16u);
      }
      return v13;
    }
  }
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
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v23 = 0;
    *(_WORD *)&v23[8] = 2112;
    *(_QWORD *)&v23[10] = v19;
    _os_log_impl(&dword_1AF533000, v18, OS_LOG_TYPE_ERROR, "BKDevicePearl::queryIdentityMigrationFailureForUser -> %@ %@\n", buf, 0x16u);
  }
  v13 = 0;
  return v13;
}

- (BOOL)clearIdentityMigrationFailureForUser:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  NSObject *v7;
  NSObject *v8;
  BiometricKitXPCClient *xpcClient;
  NSObject *v10;
  int v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  NSObject *v18;
  NSObject *v19;
  id v20;
  int v21;
  _BYTE v22[18];
  __int16 v23;
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v5 = *(_QWORD *)&a3;
  v29 = *MEMORY[0x1E0C80C00];
  v7 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super._xpcClient;
    v10 = v8;
    v21 = 67109376;
    *(_DWORD *)v22 = v5;
    *(_WORD *)&v22[4] = 2048;
    *(_QWORD *)&v22[6] = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::clearIdentityMigrationFailureForUser: %u (_cid %lu)\n", (uint8_t *)&v21, 0x12u);

  }
  v11 = -[BiometricKitXPCClient queryIdentityMigrationFailureForUser:failed:clear:](self->super._xpcClient, "queryIdentityMigrationFailureForUser:failed:clear:", v5, 0, 1);
  v12 = (void *)v11;
  if (v11)
  {
    if (__osLog)
      v18 = __osLog;
    else
      v18 = v7;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v21 = 136316162;
      *(_QWORD *)v22 = "err == 0 ";
      *(_WORD *)&v22[8] = 2048;
      *(_QWORD *)&v22[10] = v12;
      v23 = 2080;
      v24 = &unk_1AF575226;
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      v27 = 1024;
      v28 = 1415;
      _os_log_impl(&dword_1AF533000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
    }
    setErrorWithOSStatus(v12, a4);
    if (__osLogTrace)
      v19 = __osLogTrace;
    else
      v19 = v7;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      if (a4)
        v20 = *a4;
      else
        v20 = 0;
      v21 = 67109378;
      *(_DWORD *)v22 = 0;
      *(_WORD *)&v22[4] = 2112;
      *(_QWORD *)&v22[6] = v20;
      v15 = v19;
      v16 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }
  else
  {
    if (__osLogTrace)
      v13 = __osLogTrace;
    else
      v13 = v7;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if (a4)
        v14 = *a4;
      else
        v14 = 0;
      v21 = 67109378;
      *(_DWORD *)v22 = 1;
      *(_WORD *)&v22[4] = 2112;
      *(_QWORD *)&v22[6] = v14;
      v15 = v13;
      v16 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
      _os_log_impl(&dword_1AF533000, v15, v16, "BKDevicePearl::clearIdentityMigrationFailureForUser -> %d %@\n", (uint8_t *)&v21, 0x12u);
    }
  }
  return (_DWORD)v12 == 0;
}

- (id)supportsPeriocularEnrollmentWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  BiometricKitXPCClient *xpcClient;
  NSObject *v8;
  int v9;
  uint64_t v10;
  char *v11;
  NSObject *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  unsigned __int8 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super._xpcClient;
    v8 = v6;
    *(_DWORD *)buf = 134217984;
    v21 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::supportsPeriocularEnrollmentWithError (_cid %lu)\n", buf, 0xCu);

  }
  v19 = 0;
  v9 = -[BiometricKitXPCClient isPeriocularEnrollmentSupported:](self->super._xpcClient, "isPeriocularEnrollmentSupported:", &v19);
  if (v9)
  {
    v14 = (void *)v9;
    if (__osLog)
      v15 = __osLog;
    else
      v15 = v5;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v21 = "err == 0 ";
      v22 = 2048;
      v23 = v14;
      v24 = 2080;
      v25 = &unk_1AF575226;
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      v28 = 1024;
      v29 = 1439;
      _os_log_impl(&dword_1AF533000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setErrorWithOSStatus(v14, a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v19);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (char *)v10;
      if (__osLogTrace)
        v12 = __osLogTrace;
      else
        v12 = v5;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        if (a3)
          v13 = *a3;
        else
          v13 = 0;
        *(_DWORD *)buf = 138412546;
        v21 = v11;
        v22 = 2112;
        v23 = v13;
        _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::supportsPeriocularEnrollmentWithError -> %@ %@\n", buf, 0x16u);
      }
      return v11;
    }
  }
  if (__osLogTrace)
    v16 = __osLogTrace;
  else
    v16 = v5;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    if (a3)
      v17 = *a3;
    else
      v17 = 0;
    *(_DWORD *)buf = 138412546;
    v21 = 0;
    v22 = 2112;
    v23 = v17;
    _os_log_impl(&dword_1AF533000, v16, OS_LOG_TYPE_ERROR, "BKDevicePearl::supportsPeriocularEnrollmentWithError -> %@ %@\n", buf, 0x16u);
  }
  v11 = 0;
  return v11;
}

- (id)periocularMatchStateWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  BiometricKitXPCClient *xpcClient;
  NSObject *v8;
  int v9;
  uint64_t v10;
  char *v11;
  NSObject *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint64_t v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super._xpcClient;
    v8 = v6;
    *(_DWORD *)buf = 134217984;
    v21 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::periocularMatchStateWithError (_cid %lu)\n", buf, 0xCu);

  }
  v19 = 0;
  v9 = -[BiometricKitXPCClient getPeriocularMatchState:state:](self->super._xpcClient, "getPeriocularMatchState:state:", 0xFFFFFFFFLL, &v19);
  if (v9)
  {
    v14 = (void *)v9;
    if (__osLog)
      v15 = __osLog;
    else
      v15 = v5;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v21 = "err == 0 ";
      v22 = 2048;
      v23 = v14;
      v24 = 2080;
      v25 = &unk_1AF575226;
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      v28 = 1024;
      v29 = 1461;
      _os_log_impl(&dword_1AF533000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setErrorWithOSStatus(v14, a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19 & 0x3F);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (char *)v10;
      if (__osLogTrace)
        v12 = __osLogTrace;
      else
        v12 = v5;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        if (a3)
          v13 = *a3;
        else
          v13 = 0;
        *(_DWORD *)buf = 138412546;
        v21 = v11;
        v22 = 2112;
        v23 = v13;
        _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::periocularMatchStateWithError -> %@ %@\n", buf, 0x16u);
      }
      return v11;
    }
  }
  if (__osLogTrace)
    v16 = __osLogTrace;
  else
    v16 = v5;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    if (a3)
      v17 = *a3;
    else
      v17 = 0;
    *(_DWORD *)buf = 138412546;
    v21 = 0;
    v22 = 2112;
    v23 = v17;
    _os_log_impl(&dword_1AF533000, v16, OS_LOG_TYPE_ERROR, "BKDevicePearl::periocularMatchStateWithError -> %@ %@\n", buf, 0x16u);
  }
  v11 = 0;
  return v11;
}

- (id)periocularMatchStateForUser:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  NSObject *v7;
  NSObject *v8;
  BiometricKitXPCClient *xpcClient;
  NSObject *v10;
  int v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  uint64_t v22;
  uint8_t buf[4];
  _BYTE v24[18];
  __int16 v25;
  void *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v5 = *(_QWORD *)&a3;
  v31 = *MEMORY[0x1E0C80C00];
  v7 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super._xpcClient;
    v10 = v8;
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v24 = v5;
    *(_WORD *)&v24[4] = 2048;
    *(_QWORD *)&v24[6] = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::periocularMatchStateForUser %u (_cid %lu)\n", buf, 0x12u);

  }
  v22 = 0;
  if ((_DWORD)v5 == -1)
  {
    if (__osLog)
      v16 = __osLog;
    else
      v16 = v7;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v24 = "userID != 4294967295U";
      *(_WORD *)&v24[8] = 2048;
      *(_QWORD *)&v24[10] = 0;
      v25 = 2080;
      v26 = &unk_1AF575226;
      v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      v29 = 1024;
      v30 = 1482;
      _os_log_impl(&dword_1AF533000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setError((id)1, a4);
  }
  else
  {
    v11 = -[BiometricKitXPCClient getPeriocularMatchState:state:](self->super._xpcClient, "getPeriocularMatchState:state:", v5, &v22);
    if (v11)
    {
      v17 = (void *)v11;
      if (__osLog)
        v18 = __osLog;
      else
        v18 = v7;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v24 = "err == 0 ";
        *(_WORD *)&v24[8] = 2048;
        *(_QWORD *)&v24[10] = v17;
        v25 = 2080;
        v26 = &unk_1AF575226;
        v27 = 2080;
        v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
        v29 = 1024;
        v30 = 1485;
        _os_log_impl(&dword_1AF533000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      setErrorWithOSStatus(v17, a4);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v22 & 0x3F);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        if (__osLogTrace)
          v14 = __osLogTrace;
        else
          v14 = v7;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          if (a4)
            v15 = *a4;
          else
            v15 = 0;
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v24 = v13;
          *(_WORD *)&v24[8] = 2112;
          *(_QWORD *)&v24[10] = v15;
          _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::periocularMatchStateForUser -> %@ %@\n", buf, 0x16u);
        }
        return v13;
      }
    }
  }
  if (__osLogTrace)
    v19 = __osLogTrace;
  else
    v19 = v7;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    if (a4)
      v20 = *a4;
    else
      v20 = 0;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v24 = 0;
    *(_WORD *)&v24[8] = 2112;
    *(_QWORD *)&v24[10] = v20;
    _os_log_impl(&dword_1AF533000, v19, OS_LOG_TYPE_ERROR, "BKDevicePearl::periocularMatchStateForUser -> %@ %@\n", buf, 0x16u);
  }
  v13 = 0;
  return v13;
}

- (void)removePeriocularEnrollmentsForUser:(unsigned int)a3 identityUUID:(id)a4 removeAll:(BOOL)a5 async:(BOOL)a6 reply:(id)a7
{
  _BOOL8 v8;
  _BOOL4 v9;
  uint64_t v10;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  BiometricKitXPCClient *xpcClient;
  NSObject *v17;
  void *v18;
  void *v19;
  BiometricKitXPCClient *v20;
  id v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  id v28;
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  _BOOL4 v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v8 = a6;
  v9 = a5;
  v10 = *(_QWORD *)&a3;
  v35 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a7;
  v14 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v15 = __osLogTrace;
  else
    v15 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super._xpcClient;
    v17 = v15;
    *(_DWORD *)buf = 67110146;
    v26 = v10;
    v27 = 2112;
    v28 = v12;
    v29 = 1024;
    v30 = v9;
    v31 = 1024;
    v32 = v8;
    v33 = 2048;
    v34 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v17, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::removePeriocularEnrollmentsForUser:%u identityUUID:%@ removeAll:%u (async %u, _cid %lu)\n", buf, 0x28u);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("BKRemovePOTemplatesIdentityUserID"));

  if (v12)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v12, CFSTR("BKRemovePOTemplatesIdentityUUID"));
  if (v9)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("BKRemovePOTemplatesRemoveAll"));
  v20 = self->super._xpcClient;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __87__BKDevicePearl_removePeriocularEnrollmentsForUser_identityUUID_removeAll_async_reply___block_invoke;
  v23[3] = &unk_1E5F83DE0;
  v21 = v13;
  v24 = v21;
  -[BiometricKitXPCClient removePeriocularTemplatesWithOptions:async:withReply:](v20, "removePeriocularTemplatesWithOptions:async:withReply:", v18, v8, v23);
  if (__osLogTrace)
    v22 = __osLogTrace;
  else
    v22 = v14;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v22, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::removePeriocularEnrollmentsForUser: -> void\n", buf, 2u);
  }

}

void __87__BKDevicePearl_removePeriocularEnrollmentsForUser_identityUUID_removeAll_async_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  int v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((_DWORD)a2)
  {
    +[BKErrorHelper errorWithOSStatus:](BKErrorHelper, "errorWithOSStatus:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (__osLogTrace)
      v4 = __osLogTrace;
    else
      v4 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 67109378;
      v7 = 0;
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_1AF533000, v4, OS_LOG_TYPE_ERROR, "BKDevicePearl::removePeriocularEnrollmentsFromIdentity: -> reply(%d, %@)\n", (uint8_t *)&v6, 0x12u);
    }
  }
  else
  {
    if (__osLogTrace)
      v5 = __osLogTrace;
    else
      v5 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 67109378;
      v7 = 1;
      v8 = 2112;
      v9 = 0;
      _os_log_impl(&dword_1AF533000, v5, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::removePeriocularEnrollmentsFromIdentity: -> reply(%d, %@)\n", (uint8_t *)&v6, 0x12u);
    }
    v3 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)removePeriocularEnrollmentsFromIdentity:(id)a3 removeAll:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  void *v10;
  char v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v6 = a4;
  v8 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  v9 = objc_msgSend(v8, "userID");
  objc_msgSend(v8, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__BKDevicePearl_removePeriocularEnrollmentsFromIdentity_removeAll_error___block_invoke;
  v13[3] = &unk_1E5F84458;
  v13[4] = &v20;
  v13[5] = &v14;
  -[BKDevicePearl removePeriocularEnrollmentsForUser:identityUUID:removeAll:async:reply:](self, "removePeriocularEnrollmentsForUser:identityUUID:removeAll:async:reply:", v9, v10, v6, 0, v13);

  if (a5)
    *a5 = objc_retainAutorelease((id)v15[5]);
  v11 = *((_BYTE *)v21 + 24);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __73__BKDevicePearl_removePeriocularEnrollmentsFromIdentity_removeAll_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)removePeriocularEnrollmentsFromIdentity:(id)a3 removeAll:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = objc_msgSend(v9, "userID");
  objc_msgSend(v9, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__BKDevicePearl_removePeriocularEnrollmentsFromIdentity_removeAll_reply___block_invoke;
  v13[3] = &unk_1E5F844A8;
  v14 = v8;
  v12 = v8;
  -[BKDevicePearl removePeriocularEnrollmentsForUser:identityUUID:removeAll:async:reply:](self, "removePeriocularEnrollmentsForUser:identityUUID:removeAll:async:reply:", v10, v11, v5, 1, v13);

}

void __73__BKDevicePearl_removePeriocularEnrollmentsFromIdentity_removeAll_reply___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__BKDevicePearl_removePeriocularEnrollmentsFromIdentity_removeAll_reply___block_invoke_2;
  block[3] = &unk_1E5F84480;
  v7 = *(id *)(a1 + 32);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __73__BKDevicePearl_removePeriocularEnrollmentsFromIdentity_removeAll_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (BOOL)removePeriocularEnrollmentsForUser:(unsigned int)a3 removeAll:(BOOL)a4 error:(id *)a5
{
  char v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__BKDevicePearl_removePeriocularEnrollmentsForUser_removeAll_error___block_invoke;
  v8[3] = &unk_1E5F84458;
  v8[4] = &v15;
  v8[5] = &v9;
  -[BKDevicePearl removePeriocularEnrollmentsForUser:identityUUID:removeAll:async:reply:](self, "removePeriocularEnrollmentsForUser:identityUUID:removeAll:async:reply:", *(_QWORD *)&a3, 0, a4, 0, v8);
  if (a5)
    *a5 = objc_retainAutorelease((id)v10[5]);
  v6 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __68__BKDevicePearl_removePeriocularEnrollmentsForUser_removeAll_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)removePeriocularEnrollmentsForUser:(unsigned int)a3 removeAll:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__BKDevicePearl_removePeriocularEnrollmentsForUser_removeAll_reply___block_invoke;
  v10[3] = &unk_1E5F844A8;
  v11 = v8;
  v9 = v8;
  -[BKDevicePearl removePeriocularEnrollmentsForUser:identityUUID:removeAll:async:reply:](self, "removePeriocularEnrollmentsForUser:identityUUID:removeAll:async:reply:", v6, 0, v5, 1, v10);

}

void __68__BKDevicePearl_removePeriocularEnrollmentsForUser_removeAll_reply___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__BKDevicePearl_removePeriocularEnrollmentsForUser_removeAll_reply___block_invoke_2;
  block[3] = &unk_1E5F84480;
  v7 = *(id *)(a1 + 32);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __68__BKDevicePearl_removePeriocularEnrollmentsForUser_removeAll_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (BOOL)setTemplate:(id)a3 forIdentity:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  BiometricKitXPCClient *xpcClient;
  NSObject *v13;
  BiometricKitXPCClient *v14;
  void *v15;
  int v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  NSObject *v22;
  NSObject *v23;
  id v24;
  int v25;
  _BYTE v26[18];
  __int16 v27;
  void *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v11 = __osLogTrace;
  else
    v11 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super._xpcClient;
    v13 = v11;
    v25 = 134217984;
    *(_QWORD *)v26 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v13, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::setTemplate (_cid %lu)\n", (uint8_t *)&v25, 0xCu);

  }
  v14 = self->super._xpcClient;
  objc_msgSend(v9, "serverIdentity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[BiometricKitXPCClient setTemplate:forIdentity:](v14, "setTemplate:forIdentity:", v8, v15);

  if (v16)
  {
    if (__osLog)
      v22 = __osLog;
    else
      v22 = v10;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v25 = 136316162;
      *(_QWORD *)v26 = "err == 0 ";
      *(_WORD *)&v26[8] = 2048;
      *(_QWORD *)&v26[10] = v16;
      v27 = 2080;
      v28 = &unk_1AF575226;
      v29 = 2080;
      v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      v31 = 1024;
      v32 = 1610;
      _os_log_impl(&dword_1AF533000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v25, 0x30u);
    }
    setErrorWithOSStatus((id)v16, a5);
    if (__osLogTrace)
      v23 = __osLogTrace;
    else
      v23 = v10;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      if (a5)
        v24 = *a5;
      else
        v24 = 0;
      v25 = 67109378;
      *(_DWORD *)v26 = 0;
      *(_WORD *)&v26[4] = 2112;
      *(_QWORD *)&v26[6] = v24;
      v19 = v23;
      v20 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }
  else
  {
    if (__osLogTrace)
      v17 = __osLogTrace;
    else
      v17 = v10;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      if (a5)
        v18 = *a5;
      else
        v18 = 0;
      v25 = 67109378;
      *(_DWORD *)v26 = 1;
      *(_WORD *)&v26[4] = 2112;
      *(_QWORD *)&v26[6] = v18;
      v19 = v17;
      v20 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
      _os_log_impl(&dword_1AF533000, v19, v20, "BKDevicePearl::setTemplate -> %d %@\n", (uint8_t *)&v25, 0x12u);
    }
  }

  return v16 == 0;
}

- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4
{
  uint64_t v4;
  NSObject *v6;
  NSObject *v7;
  int64_t v8;
  int64_t v9;
  void *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD *v14;
  int64_t v15;
  int64_t v16;
  void *v17;
  char v18;
  NSObject *v19;
  _QWORD v20[6];
  _QWORD v21[6];
  uint8_t buf[4];
  int v23;
  uint64_t v24;

  v4 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v7 = __osLogTrace;
  else
    v7 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v23 = v4;
    _os_log_impl(&dword_1AF533000, v7, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::statusMessage: %u\n", buf, 8u);
  }
  if ((int)v4 <= 1010)
  {
    if ((v4 - 1001) >= 0xA)
      goto LABEL_16;
    goto LABEL_8;
  }
  if ((v4 - 1011) >= 5)
  {
    if ((_DWORD)v4 != 1070 && (_DWORD)v4 != 1066)
      goto LABEL_16;
LABEL_8:
    v8 = -[BKDevicePearl deviceEventWithStatus:](self, "deviceEventWithStatus:", v4);
    if (!v8)
      goto LABEL_16;
    v9 = v8;
    -[BKDevice delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0)
      goto LABEL_16;
    -[BKDevice dispatchQueue](self, "dispatchQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __38__BKDevicePearl_statusMessage_client___block_invoke;
    v21[3] = &unk_1E5F83C10;
    v21[4] = self;
    v21[5] = v9;
    v14 = v21;
    goto LABEL_15;
  }
  v15 = -[BKDevicePearl deviceStateWithStatus:](self, "deviceStateWithStatus:", v4);
  if (!v15)
    goto LABEL_16;
  v16 = v15;
  -[BKDevice delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) == 0)
    goto LABEL_16;
  -[BKDevice dispatchQueue](self, "dispatchQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __38__BKDevicePearl_statusMessage_client___block_invoke_2;
  v20[3] = &unk_1E5F83C10;
  v20[4] = self;
  v20[5] = v16;
  v14 = v20;
LABEL_15:
  dispatch_async(v12, v14);

LABEL_16:
  if (__osLogTrace)
    v19 = __osLogTrace;
  else
    v19 = v6;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v19, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::statusMessage: -> void\n", buf, 2u);
  }
}

void __38__BKDevicePearl_statusMessage_client___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device:pearlEventOccurred:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __38__BKDevicePearl_statusMessage_client___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device:pearlStateChanged:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (int64_t)deviceEventWithStatus:(unsigned int)a3
{
  int64_t result;
  int64_t v4;

  switch(a3)
  {
    case 0x3E9u:
      result = 1;
      break;
    case 0x3EAu:
      result = 2;
      break;
    case 0x3EBu:
      result = 3;
      break;
    case 0x3ECu:
      result = 4;
      break;
    case 0x3EDu:
      result = 5;
      break;
    case 0x3EEu:
      result = 6;
      break;
    case 0x3EFu:
      result = 7;
      break;
    case 0x3F0u:
      result = 8;
      break;
    case 0x3F1u:
      result = 9;
      break;
    case 0x3F2u:
      result = 10;
      break;
    default:
      v4 = 11;
      if (a3 != 1070)
        v4 = 0;
      if (a3 == 1066)
        result = 12;
      else
        result = v4;
      break;
  }
  return result;
}

- (int64_t)deviceStateWithStatus:(unsigned int)a3
{
  uint64_t v3;

  v3 = a3 - 1011;
  if (v3 < 5)
    return v3 + 1;
  else
    return 0;
}

@end
