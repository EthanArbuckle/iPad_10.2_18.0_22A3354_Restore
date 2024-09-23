@implementation BKDevice

uint64_t __19__BKDevice_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidateConnection");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_xpcClient, 0);
}

+ (BKDevice)deviceWithDescriptor:(id)a3 error:(id *)a4
{
  char *v6;
  NSObject *v7;
  NSObject *v8;
  BiometricKitXPCClient *v9;
  BiometricKitXPCClient *v10;
  uint64_t v11;
  __objc2_class **v12;
  NSObject *v13;
  id *v14;
  id *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  NSObject *v25;
  int v26;
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  kdebug_trace();
  v7 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 138412290;
    v27 = v6;
    _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_DEFAULT, "BKDevice::deviceWithDescriptor: %@\n", (uint8_t *)&v26, 0xCu);
  }
  if (!v6)
  {
    if (__osLog)
      v25 = __osLog;
    else
      v25 = v7;
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    v26 = 136316162;
    v27 = "descriptor";
    v28 = 2048;
    v29 = 0;
    v30 = 2080;
    v31 = &unk_1AF575226;
    v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
    v34 = 1024;
    v35 = 66;
    goto LABEL_53;
  }
  v9 = -[BiometricKitXPCClient initWithDeviceType:clientType:]([BiometricKitXPCClient alloc], "initWithDeviceType:clientType:", objc_msgSend(v6, "type"), 2);
  if (!v9)
  {
    if (__osLog)
      v25 = __osLog;
    else
      v25 = v7;
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    v26 = 136316162;
    v27 = "client";
    v28 = 2048;
    v29 = 0;
    v30 = 2080;
    v31 = &unk_1AF575226;
    v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
    v34 = 1024;
    v35 = 69;
LABEL_53:
    _os_log_impl(&dword_1AF533000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v26, 0x30u);
LABEL_54:
    v10 = 0;
    goto LABEL_30;
  }
  v10 = v9;
  v11 = objc_msgSend(v6, "type");
  if (v11 == 2)
  {
    v12 = off_1E5F832B8;
    if (+[BKDevicePearl deviceAvailableWithFailure:](BKDevicePearl, "deviceAvailableWithFailure:", 0))
      goto LABEL_17;
    if (__osLog)
      v13 = __osLog;
    else
      v13 = v7;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    v26 = 136316162;
    v27 = "[BKDevicePearl deviceAvailableWithFailure:((void *)0)]";
    v28 = 2048;
    v29 = 0;
    v30 = 2080;
    v31 = &unk_1AF575226;
    v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
    v34 = 1024;
    v35 = 79;
LABEL_29:
    _os_log_impl(&dword_1AF533000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v26, 0x30u);
LABEL_30:
    setError((id)1, a4);
    goto LABEL_31;
  }
  if (v11 != 1)
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = v7;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    v26 = 136316162;
    v27 = "0";
    v28 = 2048;
    v29 = 0;
    v30 = 2080;
    v31 = &unk_1AF575226;
    v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
    v34 = 1024;
    v35 = 92;
    goto LABEL_29;
  }
  v12 = off_1E5F832C0;
  if (!+[BKDeviceTouchID deviceAvailableWithFailure:](BKDeviceTouchID, "deviceAvailableWithFailure:", 0))
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = v7;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    v26 = 136316162;
    v27 = "[BKDeviceTouchID deviceAvailableWithFailure:((void *)0)]";
    v28 = 2048;
    v29 = 0;
    v30 = 2080;
    v31 = &unk_1AF575226;
    v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
    v34 = 1024;
    v35 = 73;
    goto LABEL_29;
  }
LABEL_17:
  v14 = (id *)objc_alloc_init(*v12);
  if (!v14)
  {
LABEL_31:
    if (__osLogTrace)
      v20 = __osLogTrace;
    else
      v20 = v7;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = v20;
      v22 = -[BiometricKitXPCClient connectionId](v10, "connectionId");
      if (a4)
        v23 = *a4;
      else
        v23 = 0;
      v26 = 138412802;
      v27 = 0;
      v28 = 2048;
      v29 = v22;
      v30 = 2112;
      v31 = v23;
      _os_log_impl(&dword_1AF533000, v21, OS_LOG_TYPE_ERROR, "BKDevice::deviceWithDescriptor: -> %@ (_cid %lu) %@\n", (uint8_t *)&v26, 0x20u);

    }
    v15 = 0;
    goto LABEL_42;
  }
  v15 = v14;
  -[BiometricKitXPCClient setDelegate:](v10, "setDelegate:", v14);
  objc_storeStrong(v15 + 1, v10);
  objc_storeStrong(v15 + 4, a3);
  if (__osLogTrace)
    v16 = __osLogTrace;
  else
    v16 = v7;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    v18 = -[BiometricKitXPCClient connectionId](v10, "connectionId");
    if (a4)
      v19 = *a4;
    else
      v19 = 0;
    v26 = 138412802;
    v27 = (const char *)v15;
    v28 = 2048;
    v29 = v18;
    v30 = 2112;
    v31 = v19;
    _os_log_impl(&dword_1AF533000, v17, OS_LOG_TYPE_DEFAULT, "BKDevice::deviceWithDescriptor: -> %@ (_cid %lu) %@\n", (uint8_t *)&v26, 0x20u);

  }
LABEL_42:
  kdebug_trace();

  return (BKDevice *)v15;
}

- (void)dealloc
{
  BiometricKitXPCClient *v3;
  NSObject *v4;
  BiometricKitXPCClient *v5;
  BiometricKitXPCClient *xpcClient;
  objc_super v7;
  _QWORD block[4];
  BiometricKitXPCClient *v9;

  objc_storeWeak((id *)&self->_delegate, 0);
  -[BiometricKitXPCClient setDelegate:](self->_xpcClient, "setDelegate:", 0);
  v3 = self->_xpcClient;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __19__BKDevice_dealloc__block_invoke;
  block[3] = &unk_1E5F83D50;
  v9 = v3;
  v5 = v3;
  dispatch_async(v4, block);

  xpcClient = self->_xpcClient;
  self->_xpcClient = 0;

  v7.receiver = self;
  v7.super_class = (Class)BKDevice;
  -[BKDevice dealloc](&v7, sel_dealloc);
}

+ (BOOL)deviceAvailableWithFailure:(BOOL *)a3
{
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (__osLog)
    v3 = __osLog;
  else
    v3 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 136316162;
    v6 = "0";
    v7 = 2048;
    v8 = 0;
    v9 = 2080;
    v10 = &unk_1AF575226;
    v11 = 2080;
    v12 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
    v13 = 1024;
    v14 = 50;
    _os_log_impl(&dword_1AF533000, v3, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v5, 0x30u);
  }
  return 0;
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id WeakRetained;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1AF533000, v6, OS_LOG_TYPE_DEFAULT, "BKDevice::setDelegate %@\n", (uint8_t *)&v9, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_delegate, v4);
    -[BiometricKitXPCClient registerDelegate:](self->_xpcClient, "registerDelegate:", v4 != 0);
  }
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = v5;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_DEFAULT, "BKDevice::setDelegate -> void\n", (uint8_t *)&v9, 2u);
  }

}

- (id)dispatchQueue
{
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v3;
  id v4;

  queue = self->_queue;
  if (queue)
  {
    v3 = queue;
  }
  else
  {
    v3 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
    v4 = MEMORY[0x1E0C80D38];
  }
  return v3;
}

- (id)createEnrollOperationWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  BKEnrollOperation *v7;
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
    _os_log_impl(&dword_1AF533000, v6, OS_LOG_TYPE_DEFAULT, "BKDevice::createEnrollOperation\n", (uint8_t *)&v16, 2u);
  }
  v7 = -[BKEnrollOperation initWithDevice:]([BKEnrollOperation alloc], "initWithDevice:", self);
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
      _os_log_impl(&dword_1AF533000, v10, v11, "BKDevice::createEnrollOperation -> %@ %@\n", (uint8_t *)&v16, 0x16u);
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
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v24 = 1024;
      v25 = 170;
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
  BKMatchOperation *v7;
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
    _os_log_impl(&dword_1AF533000, v6, OS_LOG_TYPE_DEFAULT, "BKDevice::createMatchOperation\n", (uint8_t *)&v16, 2u);
  }
  v7 = -[BKMatchOperation initWithDevice:]([BKMatchOperation alloc], "initWithDevice:", self);
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
      _os_log_impl(&dword_1AF533000, v10, v11, "BKDevice::createMatchOperation -> %@ %@\n", (uint8_t *)&v16, 0x16u);
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
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v24 = 1024;
      v25 = 191;
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
  BKPresenceDetectOperation *v7;
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
    _os_log_impl(&dword_1AF533000, v6, OS_LOG_TYPE_DEFAULT, "BKDevice::createPresenceDetectOperation\n", (uint8_t *)&v16, 2u);
  }
  v7 = -[BKOperation initWithDevice:]([BKPresenceDetectOperation alloc], "initWithDevice:", self);
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
      _os_log_impl(&dword_1AF533000, v10, v11, "BKDevice::createPresenceDetectOperation -> %@ %@\n", (uint8_t *)&v16, 0x16u);
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
      v17 = "pdetOp";
      v18 = 2048;
      v19 = 0;
      v20 = 2080;
      v21 = &unk_1AF575226;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v24 = 1024;
      v25 = 212;
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

- (id)protectedConfigurationForUser:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  NSObject *v7;
  NSObject *v8;
  BiometricKitXPCClient *xpcClient;
  NSObject *v10;
  void *v11;
  BKUserProtectedConfiguration *v12;
  BKUserProtectedConfiguration *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  int v18;
  _BYTE v19[18];
  __int16 v20;
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v5 = *(_QWORD *)&a3;
  v26 = *MEMORY[0x1E0C80C00];
  v7 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v10 = v8;
    v18 = 67109376;
    *(_DWORD *)v19 = v5;
    *(_WORD *)&v19[4] = 2048;
    *(_QWORD *)&v19[6] = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEFAULT, "BKDevice::protectedConfigurationForUser: %d (_cid %lu)\n", (uint8_t *)&v18, 0x12u);

  }
  -[BiometricKitXPCClient getProtectedConfigurationForUser:](self->_xpcClient, "getProtectedConfigurationForUser:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = -[BKUserProtectedConfiguration initWithDictionary:effective:]([BKUserProtectedConfiguration alloc], "initWithDictionary:effective:", v11, 0);
    if (v12)
    {
      v13 = v12;
      if (__osLogTrace)
        v14 = __osLogTrace;
      else
        v14 = v7;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138543362;
        *(_QWORD *)v19 = v13;
        _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_DEFAULT, "BKDevice::protectedConfigurationForUser: -> %{public}@\n", (uint8_t *)&v18, 0xCu);
      }
      goto LABEL_25;
    }
  }
  else
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = v7;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = 136316162;
      *(_QWORD *)v19 = "cfgDict";
      *(_WORD *)&v19[8] = 2048;
      *(_QWORD *)&v19[10] = 0;
      v20 = 2080;
      v21 = &unk_1AF575226;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v24 = 1024;
      v25 = 233;
      _os_log_impl(&dword_1AF533000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
    setError((id)1, a4);
  }
  if (__osLogTrace)
    v16 = __osLogTrace;
  else
    v16 = v7;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v18 = 138543362;
    *(_QWORD *)v19 = 0;
    _os_log_impl(&dword_1AF533000, v16, OS_LOG_TYPE_ERROR, "BKDevice::protectedConfigurationForUser: -> %{public}@\n", (uint8_t *)&v18, 0xCu);
  }
  v13 = 0;
LABEL_25:

  return v13;
}

- (id)effectiveProtectedConfigurationForUser:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  NSObject *v7;
  NSObject *v8;
  BiometricKitXPCClient *xpcClient;
  NSObject *v10;
  void *v11;
  BKUserProtectedConfiguration *v12;
  BKUserProtectedConfiguration *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  int v18;
  _BYTE v19[18];
  __int16 v20;
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v5 = *(_QWORD *)&a3;
  v26 = *MEMORY[0x1E0C80C00];
  v7 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v10 = v8;
    v18 = 67109376;
    *(_DWORD *)v19 = v5;
    *(_WORD *)&v19[4] = 2048;
    *(_QWORD *)&v19[6] = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEFAULT, "BKDevice::effectiveProtectedConfigurationForUser: %d (_cid %lu)\n", (uint8_t *)&v18, 0x12u);

  }
  -[BiometricKitXPCClient getProtectedConfigurationForUser:](self->_xpcClient, "getProtectedConfigurationForUser:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = -[BKUserProtectedConfiguration initWithDictionary:effective:]([BKUserProtectedConfiguration alloc], "initWithDictionary:effective:", v11, 1);
    if (v12)
    {
      v13 = v12;
      if (__osLogTrace)
        v14 = __osLogTrace;
      else
        v14 = v7;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138543362;
        *(_QWORD *)v19 = v13;
        _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_DEFAULT, "BKDevice::effectiveProtectedConfigurationForUser: -> %{public}@\n", (uint8_t *)&v18, 0xCu);
      }
      goto LABEL_25;
    }
  }
  else
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = v7;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = 136316162;
      *(_QWORD *)v19 = "cfgDict";
      *(_WORD *)&v19[8] = 2048;
      *(_QWORD *)&v19[10] = 0;
      v20 = 2080;
      v21 = &unk_1AF575226;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v24 = 1024;
      v25 = 255;
      _os_log_impl(&dword_1AF533000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
    setError((id)1, a4);
  }
  if (__osLogTrace)
    v16 = __osLogTrace;
  else
    v16 = v7;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v18 = 138543362;
    *(_QWORD *)v19 = 0;
    _os_log_impl(&dword_1AF533000, v16, OS_LOG_TYPE_ERROR, "BKDevice::effectiveProtectedConfigurationForUser: -> %{public}@\n", (uint8_t *)&v18, 0xCu);
  }
  v13 = 0;
LABEL_25:

  return v13;
}

- (id)systemProtectedConfigurationWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  BiometricKitXPCClient *xpcClient;
  NSObject *v8;
  void *v9;
  BKSystemProtectedConfiguration *v10;
  BKSystemProtectedConfiguration *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v8 = v6;
    v16 = 134217984;
    v17 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_DEFAULT, "BKDevice::systemProtectedConfiguration (_cid %lu)\n", (uint8_t *)&v16, 0xCu);

  }
  -[BiometricKitXPCClient getSystemProtectedConfiguration](self->_xpcClient, "getSystemProtectedConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = -[BKSystemProtectedConfiguration initWithDictionary:]([BKSystemProtectedConfiguration alloc], "initWithDictionary:", v9);
    if (v10)
    {
      v11 = v10;
      if (__osLogTrace)
        v12 = __osLogTrace;
      else
        v12 = v5;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138543362;
        v17 = (const char *)v11;
        _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_DEFAULT, "BKDevice::systemProtectedConfiguration: -> %{public}@\n", (uint8_t *)&v16, 0xCu);
      }
      goto LABEL_25;
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
      v17 = "cfgDict";
      v18 = 2048;
      v19 = 0;
      v20 = 2080;
      v21 = &unk_1AF575226;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v24 = 1024;
      v25 = 277;
      _os_log_impl(&dword_1AF533000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
    }
    setError((id)1, a3);
  }
  if (__osLogTrace)
    v14 = __osLogTrace;
  else
    v14 = v5;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v16 = 138543362;
    v17 = 0;
    _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_ERROR, "BKDevice::systemProtectedConfiguration: -> %{public}@\n", (uint8_t *)&v16, 0xCu);
  }
  v11 = 0;
LABEL_25:

  return v11;
}

- (void)setProtectedConfiguration:(id)a3 forUser:(unsigned int)a4 credentialSet:(id)a5 async:(BOOL)a6 reply:(id)a7
{
  _BOOL8 v8;
  uint64_t v10;
  char *v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  BiometricKitXPCClient *xpcClient;
  NSObject *v18;
  void *v19;
  BiometricKitXPCClient *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  const __CFString *v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  _BYTE v31[20];
  _BYTE v32[10];
  int v33;
  uint64_t v34;

  v8 = a6;
  v10 = *(_QWORD *)&a4;
  v34 = *MEMORY[0x1E0C80C00];
  v12 = (char *)a3;
  v13 = a5;
  v14 = a7;
  v15 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v16 = __osLogTrace;
  else
    v16 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v18 = v16;
    *(_DWORD *)buf = 138544386;
    v29 = v12;
    v30 = 1024;
    *(_DWORD *)v31 = v10;
    *(_WORD *)&v31[4] = 2048;
    *(_QWORD *)&v31[6] = v13;
    *(_WORD *)&v31[14] = 1024;
    *(_DWORD *)&v31[16] = v8;
    *(_WORD *)v32 = 2048;
    *(_QWORD *)&v32[2] = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v18, OS_LOG_TYPE_DEFAULT, "BKDevice::setProtectedConfiguration:forUser:credentialSet: %{public}@ %d %p (async %u, _cid %lu)\n", buf, 0x2Cu);

  }
  if (v12)
  {
    if (v13)
    {
      v26 = CFSTR("BKOptionAuthWithCredentialSet");
      v27 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }
    v20 = self->_xpcClient;
    objc_msgSend(v12, "dictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __72__BKDevice_setProtectedConfiguration_forUser_credentialSet_async_reply___block_invoke;
    v24[3] = &unk_1E5F83DE0;
    v25 = v14;
    -[BiometricKitXPCClient setProtectedConfiguration:forUser:withOptions:async:withReply:](v20, "setProtectedConfiguration:forUser:withOptions:async:withReply:", v21, v10, v19, v8, v24);

  }
  else
  {
    if (__osLog)
      v23 = __osLog;
    else
      v23 = v15;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v29 = "configuration";
      v30 = 2048;
      *(_QWORD *)v31 = 0;
      *(_WORD *)&v31[8] = 2080;
      *(_QWORD *)&v31[10] = &unk_1AF575226;
      *(_WORD *)&v31[18] = 2080;
      *(_QWORD *)v32 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      *(_WORD *)&v32[8] = 1024;
      v33 = 295;
      _os_log_impl(&dword_1AF533000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    +[BKErrorHelper errorWithCode:](BKErrorHelper, "errorWithCode:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v14 + 2))(v14, 0, v19);
  }

  if (__osLogTrace)
    v22 = __osLogTrace;
  else
    v22 = v15;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v22, OS_LOG_TYPE_DEFAULT, "BKDevice::setProtectedConfiguration:forUser:credentialSet: -> void\n", buf, 2u);
  }

}

void __72__BKDevice_setProtectedConfiguration_forUser_credentialSet_async_reply___block_invoke(uint64_t a1, uint64_t a2)
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
      _os_log_impl(&dword_1AF533000, v4, OS_LOG_TYPE_ERROR, "BKDevice::setProtectedConfiguration:forUser:credentialSet: -> reply(%d, %@)\n", (uint8_t *)&v6, 0x12u);
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
      _os_log_impl(&dword_1AF533000, v5, OS_LOG_TYPE_DEFAULT, "BKDevice::setProtectedConfiguration:forUser:credentialSet: -> reply(%d, %@)\n", (uint8_t *)&v6, 0x12u);
    }
    v3 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)setProtectedConfiguration:(id)a3 forUser:(unsigned int)a4 credentialSet:(id)a5 error:(id *)a6
{
  uint64_t v8;
  id v10;
  id v11;
  char v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__BKDevice_setProtectedConfiguration_forUser_credentialSet_error___block_invoke;
  v14[3] = &unk_1E5F84458;
  v14[4] = &v21;
  v14[5] = &v15;
  -[BKDevice setProtectedConfiguration:forUser:credentialSet:async:reply:](self, "setProtectedConfiguration:forUser:credentialSet:async:reply:", v10, v8, v11, 0, v14);
  if (a6)
    *a6 = objc_retainAutorelease((id)v16[5]);
  v12 = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v12;
}

void __66__BKDevice_setProtectedConfiguration_forUser_credentialSet_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)setProtectedConfiguration:(id)a3 forUser:(unsigned int)a4 credentialSet:(id)a5 reply:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = *(_QWORD *)&a4;
  v10 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__BKDevice_setProtectedConfiguration_forUser_credentialSet_reply___block_invoke;
  v12[3] = &unk_1E5F844A8;
  v13 = v10;
  v11 = v10;
  -[BKDevice setProtectedConfiguration:forUser:credentialSet:async:reply:](self, "setProtectedConfiguration:forUser:credentialSet:async:reply:", a3, v7, a5, 1, v12);

}

void __66__BKDevice_setProtectedConfiguration_forUser_credentialSet_reply___block_invoke(uint64_t a1, char a2, void *a3)
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
  block[2] = __66__BKDevice_setProtectedConfiguration_forUser_credentialSet_reply___block_invoke_2;
  block[3] = &unk_1E5F84480;
  v7 = *(id *)(a1 + 32);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __66__BKDevice_setProtectedConfiguration_forUser_credentialSet_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)setSystemProtectedConfiguration:(id)a3 credentialSet:(id)a4 async:(BOOL)a5 reply:(id)a6
{
  _BOOL8 v7;
  char *v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  NSObject *v13;
  NSObject *v14;
  BiometricKitXPCClient *xpcClient;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  BiometricKitXPCClient *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  _QWORD v33[4];
  void (**v34)(id, _QWORD, void *);
  const __CFString *v35;
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  _BYTE v42[18];
  __int16 v43;
  int v44;
  uint64_t v45;

  v7 = a5;
  v45 = *MEMORY[0x1E0C80C00];
  v10 = (char *)a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD, void *))a6;
  v13 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v14 = __osLogTrace;
  else
    v14 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v16 = v14;
    *(_DWORD *)buf = 138544130;
    v38 = v10;
    v39 = 2048;
    v40 = v11;
    v41 = 1024;
    *(_DWORD *)v42 = v7;
    *(_WORD *)&v42[4] = 2048;
    *(_QWORD *)&v42[6] = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v16, OS_LOG_TYPE_DEFAULT, "BKDevice::setSystemProtectedConfiguration:credentialSet: %{public}@ %p (async %u, _cid %lu)\n", buf, 0x26u);

  }
  if (!v10)
  {
    if (__osLog)
      v30 = __osLog;
    else
      v30 = v13;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v38 = "configuration";
      v39 = 2048;
      v40 = 0;
      v41 = 2080;
      *(_QWORD *)v42 = &unk_1AF575226;
      *(_WORD *)&v42[8] = 2080;
      *(_QWORD *)&v42[10] = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v43 = 1024;
      v44 = 356;
      _os_log_impl(&dword_1AF533000, v30, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v31 = 1;
    goto LABEL_46;
  }
  objc_msgSend(v10, "unlockTokenMaxLifetime");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v10, "unlockTokenMaxLifetime");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "intValue");

    if (v19 <= 0)
    {
      if (__osLog)
        v32 = __osLog;
      else
        v32 = v13;
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        goto LABEL_45;
      *(_DWORD *)buf = 136316162;
      v38 = "[configuration.unlockTokenMaxLifetime intValue] > 0";
      v39 = 2048;
      v40 = 0;
      v41 = 2080;
      *(_QWORD *)v42 = &unk_1AF575226;
      *(_WORD *)&v42[8] = 2080;
      *(_QWORD *)&v42[10] = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v43 = 1024;
      v44 = 361;
      goto LABEL_44;
    }
  }
  objc_msgSend(v10, "bioMatchLifespan");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v10, "bioMatchLifespan");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "intValue");

    if (v22 <= 0)
    {
      if (__osLog)
        v32 = __osLog;
      else
        v32 = v13;
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        goto LABEL_45;
      *(_DWORD *)buf = 136316162;
      v38 = "[configuration.bioMatchLifespan intValue] > 0";
      v39 = 2048;
      v40 = 0;
      v41 = 2080;
      *(_QWORD *)v42 = &unk_1AF575226;
      *(_WORD *)&v42[8] = 2080;
      *(_QWORD *)&v42[10] = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v43 = 1024;
      v44 = 364;
      goto LABEL_44;
    }
  }
  objc_msgSend(v10, "passcodeInputLifespan");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v10, "passcodeInputLifespan");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "intValue");

    if (v25 <= 0)
    {
      if (__osLog)
        v32 = __osLog;
      else
        v32 = v13;
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        goto LABEL_45;
      *(_DWORD *)buf = 136316162;
      v38 = "[configuration.passcodeInputLifespan intValue] > 0";
      v39 = 2048;
      v40 = 0;
      v41 = 2080;
      *(_QWORD *)v42 = &unk_1AF575226;
      *(_WORD *)&v42[8] = 2080;
      *(_QWORD *)&v42[10] = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v43 = 1024;
      v44 = 367;
LABEL_44:
      _os_log_impl(&dword_1AF533000, v32, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_45:
      v31 = 3;
LABEL_46:
      +[BKErrorHelper errorWithCode:](BKErrorHelper, "errorWithCode:", v31);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0, v26);
      goto LABEL_17;
    }
  }
  if (v11)
  {
    v35 = CFSTR("BKOptionAuthWithCredentialSet");
    v36 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }
  v27 = self->_xpcClient;
  objc_msgSend(v10, "dictionary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __70__BKDevice_setSystemProtectedConfiguration_credentialSet_async_reply___block_invoke;
  v33[3] = &unk_1E5F83DE0;
  v34 = v12;
  -[BiometricKitXPCClient setSystemProtectedConfiguration:withOptions:async:withReply:](v27, "setSystemProtectedConfiguration:withOptions:async:withReply:", v28, v26, v7, v33);

LABEL_17:
  if (__osLogTrace)
    v29 = __osLogTrace;
  else
    v29 = v13;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v29, OS_LOG_TYPE_DEFAULT, "BKDevice::setSystemProtectedConfiguration:credentialSet: -> void\n", buf, 2u);
  }

}

void __70__BKDevice_setSystemProtectedConfiguration_credentialSet_async_reply___block_invoke(uint64_t a1, uint64_t a2)
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
      _os_log_impl(&dword_1AF533000, v4, OS_LOG_TYPE_ERROR, "BKDevice::setSystemProtectedConfiguration:credentialSet: -> reply(%d, %@)\n", (uint8_t *)&v6, 0x12u);
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
      _os_log_impl(&dword_1AF533000, v5, OS_LOG_TYPE_DEFAULT, "BKDevice::setSystemProtectedConfiguration:credentialSet: -> reply(%d, %@)\n", (uint8_t *)&v6, 0x12u);
    }
    v3 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)setSystemProtectedConfiguration:(id)a3 credentialSet:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  char v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__BKDevice_setSystemProtectedConfiguration_credentialSet_error___block_invoke;
  v12[3] = &unk_1E5F84458;
  v12[4] = &v19;
  v12[5] = &v13;
  -[BKDevice setSystemProtectedConfiguration:credentialSet:async:reply:](self, "setSystemProtectedConfiguration:credentialSet:async:reply:", v8, v9, 0, v12);
  if (a5)
    *a5 = objc_retainAutorelease((id)v14[5]);
  v10 = *((_BYTE *)v20 + 24);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __64__BKDevice_setSystemProtectedConfiguration_credentialSet_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)setSystemProtectedConfiguration:(id)a3 credentialSet:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__BKDevice_setSystemProtectedConfiguration_credentialSet_reply___block_invoke;
  v10[3] = &unk_1E5F844A8;
  v11 = v8;
  v9 = v8;
  -[BKDevice setSystemProtectedConfiguration:credentialSet:async:reply:](self, "setSystemProtectedConfiguration:credentialSet:async:reply:", a3, a4, 1, v10);

}

void __64__BKDevice_setSystemProtectedConfiguration_credentialSet_reply___block_invoke(uint64_t a1, char a2, void *a3)
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
  block[2] = __64__BKDevice_setSystemProtectedConfiguration_credentialSet_reply___block_invoke_2;
  block[3] = &unk_1E5F84480;
  v7 = *(id *)(a1 + 32);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __64__BKDevice_setSystemProtectedConfiguration_credentialSet_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (BOOL)bioLockoutState:(int64_t *)a3 forUser:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  NSObject *v9;
  NSObject *v10;
  BiometricKitXPCClient *xpcClient;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int64_t v15;
  id v16;
  BOOL v17;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  int64_t v24;
  id v25;
  uint64_t v26;
  uint8_t buf[4];
  _BYTE v28[28];
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v6 = *(_QWORD *)&a4;
  v33 = *MEMORY[0x1E0C80C00];
  v9 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v12 = v10;
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)v28 = a3;
    *(_WORD *)&v28[8] = 1024;
    *(_DWORD *)&v28[10] = v6;
    *(_WORD *)&v28[14] = 2048;
    *(_QWORD *)&v28[16] = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_DEFAULT, "BKDevice::bioLockoutState:forUser: %p %d (_cid %lu)\n", buf, 0x1Cu);

  }
  v26 = -1;
  if (a3)
  {
    v13 = -[BiometricKitXPCClient getBioLockoutState:forUser:](self->_xpcClient, "getBioLockoutState:forUser:", &v26, v6);
    if (v13)
    {
      v20 = (void *)v13;
      if (__osLog)
        v21 = __osLog;
      else
        v21 = v9;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v28 = "err == 0 ";
        *(_WORD *)&v28[8] = 2048;
        *(_QWORD *)&v28[10] = v20;
        *(_WORD *)&v28[18] = 2080;
        *(_QWORD *)&v28[20] = &unk_1AF575226;
        v29 = 2080;
        v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
        v31 = 1024;
        v32 = 436;
        _os_log_impl(&dword_1AF533000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      setErrorWithOSStatus(v20, a5);
    }
    else
    {
      if (+[BKDevice lockoutState:fromDeviceLockoutState:error:](BKDevice, "lockoutState:fromDeviceLockoutState:error:", a3, v26, a5))
      {
        if (__osLogTrace)
          v14 = __osLogTrace;
        else
          v14 = v9;
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          return 1;
        v15 = *a3;
        if (a5)
          v16 = *a5;
        else
          v16 = 0;
        *(_DWORD *)buf = 67109634;
        v17 = 1;
        *(_DWORD *)v28 = 1;
        *(_WORD *)&v28[4] = 2048;
        *(_QWORD *)&v28[6] = v15;
        *(_WORD *)&v28[14] = 2112;
        *(_QWORD *)&v28[16] = v16;
        _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_DEFAULT, "BKDevice::bioLockoutState:forUser: -> %d %ld %@\n", buf, 0x1Cu);
        return v17;
      }
      if (__osLog)
        v22 = __osLog;
      else
        v22 = v9;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v28 = "result";
        *(_WORD *)&v28[8] = 2048;
        *(_QWORD *)&v28[10] = 0;
        *(_WORD *)&v28[18] = 2080;
        *(_QWORD *)&v28[20] = &unk_1AF575226;
        v29 = 2080;
        v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
        v31 = 1024;
        v32 = 439;
        _os_log_impl(&dword_1AF533000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
  }
  else
  {
    if (__osLog)
      v19 = __osLog;
    else
      v19 = v9;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v28 = "state";
      *(_WORD *)&v28[8] = 2048;
      *(_QWORD *)&v28[10] = 0;
      *(_WORD *)&v28[18] = 2080;
      *(_QWORD *)&v28[20] = &unk_1AF575226;
      v29 = 2080;
      v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v31 = 1024;
      v32 = 433;
      _os_log_impl(&dword_1AF533000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setError((id)1, a5);
  }
  if (__osLogTrace)
    v23 = __osLogTrace;
  else
    v23 = v9;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    if (a3)
      v24 = *a3;
    else
      v24 = 0;
    if (a5)
      v25 = *a5;
    else
      v25 = 0;
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v28 = 0;
    *(_WORD *)&v28[4] = 2048;
    *(_QWORD *)&v28[6] = v24;
    *(_WORD *)&v28[14] = 2112;
    *(_QWORD *)&v28[16] = v25;
    _os_log_impl(&dword_1AF533000, v23, OS_LOG_TYPE_ERROR, "BKDevice::bioLockoutState:forUser: -> %d %ld %@\n", buf, 0x1Cu);
  }
  return 0;
}

- (BOOL)extendedBioLockoutState:(int64_t *)a3 forUser:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  NSObject *v9;
  NSObject *v10;
  BiometricKitXPCClient *xpcClient;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int64_t v15;
  id v16;
  BOOL v17;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  int64_t v24;
  id v25;
  uint64_t v26;
  uint8_t buf[4];
  _BYTE v28[28];
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v6 = *(_QWORD *)&a4;
  v33 = *MEMORY[0x1E0C80C00];
  v9 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v12 = v10;
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)v28 = a3;
    *(_WORD *)&v28[8] = 1024;
    *(_DWORD *)&v28[10] = v6;
    *(_WORD *)&v28[14] = 2048;
    *(_QWORD *)&v28[16] = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_DEFAULT, "BKDevice::extendedBioLockoutState:forUser: %p %d (_cid %lu)\n", buf, 0x1Cu);

  }
  v26 = -1;
  if (a3)
  {
    v13 = -[BiometricKitXPCClient getBioLockoutState:forUser:](self->_xpcClient, "getBioLockoutState:forUser:", &v26, v6);
    if (v13)
    {
      v20 = (void *)v13;
      if (__osLog)
        v21 = __osLog;
      else
        v21 = v9;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v28 = "err == 0 ";
        *(_WORD *)&v28[8] = 2048;
        *(_QWORD *)&v28[10] = v20;
        *(_WORD *)&v28[18] = 2080;
        *(_QWORD *)&v28[20] = &unk_1AF575226;
        v29 = 2080;
        v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
        v31 = 1024;
        v32 = 464;
        _os_log_impl(&dword_1AF533000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      setErrorWithOSStatus(v20, a5);
    }
    else
    {
      if (+[BKDevice extendedLockoutState:fromDeviceLockoutState:error:](BKDevice, "extendedLockoutState:fromDeviceLockoutState:error:", a3, v26, a5))
      {
        if (__osLogTrace)
          v14 = __osLogTrace;
        else
          v14 = v9;
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          return 1;
        v15 = *a3;
        if (a5)
          v16 = *a5;
        else
          v16 = 0;
        *(_DWORD *)buf = 67109634;
        v17 = 1;
        *(_DWORD *)v28 = 1;
        *(_WORD *)&v28[4] = 2048;
        *(_QWORD *)&v28[6] = v15;
        *(_WORD *)&v28[14] = 2112;
        *(_QWORD *)&v28[16] = v16;
        _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_DEFAULT, "BKDevice::extendedBioLockoutState:forUser: -> %d %ld %@\n", buf, 0x1Cu);
        return v17;
      }
      if (__osLog)
        v22 = __osLog;
      else
        v22 = v9;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v28 = "result";
        *(_WORD *)&v28[8] = 2048;
        *(_QWORD *)&v28[10] = 0;
        *(_WORD *)&v28[18] = 2080;
        *(_QWORD *)&v28[20] = &unk_1AF575226;
        v29 = 2080;
        v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
        v31 = 1024;
        v32 = 467;
        _os_log_impl(&dword_1AF533000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
  }
  else
  {
    if (__osLog)
      v19 = __osLog;
    else
      v19 = v9;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v28 = "state";
      *(_WORD *)&v28[8] = 2048;
      *(_QWORD *)&v28[10] = 0;
      *(_WORD *)&v28[18] = 2080;
      *(_QWORD *)&v28[20] = &unk_1AF575226;
      v29 = 2080;
      v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v31 = 1024;
      v32 = 461;
      _os_log_impl(&dword_1AF533000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setError((id)1, a5);
  }
  if (__osLogTrace)
    v23 = __osLogTrace;
  else
    v23 = v9;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    if (a3)
      v24 = *a3;
    else
      v24 = 0;
    if (a5)
      v25 = *a5;
    else
      v25 = 0;
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v28 = 0;
    *(_WORD *)&v28[4] = 2048;
    *(_QWORD *)&v28[6] = v24;
    *(_WORD *)&v28[14] = 2112;
    *(_QWORD *)&v28[16] = v25;
    _os_log_impl(&dword_1AF533000, v23, OS_LOG_TYPE_ERROR, "BKDevice::extendedBioLockoutState:forUser: -> %d %ld %@\n", buf, 0x1Cu);
  }
  return 0;
}

- (BOOL)expressModeState:(int64_t *)a3 forUser:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  NSObject *v9;
  NSObject *v10;
  BiometricKitXPCClient *xpcClient;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int64_t v15;
  id v16;
  BOOL v17;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  int64_t v23;
  id v24;
  int v25;
  _BYTE v26[28];
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v6 = *(_QWORD *)&a4;
  v31 = *MEMORY[0x1E0C80C00];
  v9 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v12 = v10;
    v25 = 134218496;
    *(_QWORD *)v26 = a3;
    *(_WORD *)&v26[8] = 1024;
    *(_DWORD *)&v26[10] = v6;
    *(_WORD *)&v26[14] = 2048;
    *(_QWORD *)&v26[16] = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_DEFAULT, "BKDevice::expressModeState:forUser: %p %d (_cid %lu)\n", (uint8_t *)&v25, 0x1Cu);

  }
  if (a3)
  {
    v13 = -[BiometricKitXPCClient getExpressModeState:forUser:](self->_xpcClient, "getExpressModeState:forUser:", a3, v6);
    if (!v13)
    {
      if (__osLogTrace)
        v14 = __osLogTrace;
      else
        v14 = v9;
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        return 1;
      v15 = *a3;
      if (a5)
        v16 = *a5;
      else
        v16 = 0;
      v25 = 67109634;
      v17 = 1;
      *(_DWORD *)v26 = 1;
      *(_WORD *)&v26[4] = 2048;
      *(_QWORD *)&v26[6] = v15;
      *(_WORD *)&v26[14] = 2112;
      *(_QWORD *)&v26[16] = v16;
      _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_DEFAULT, "BKDevice::expressModeState:forUser: -> %d %ld %@\n", (uint8_t *)&v25, 0x1Cu);
      return v17;
    }
    v20 = (void *)v13;
    if (__osLog)
      v21 = __osLog;
    else
      v21 = v9;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v25 = 136316162;
      *(_QWORD *)v26 = "err == 0 ";
      *(_WORD *)&v26[8] = 2048;
      *(_QWORD *)&v26[10] = v20;
      *(_WORD *)&v26[18] = 2080;
      *(_QWORD *)&v26[20] = &unk_1AF575226;
      v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v29 = 1024;
      v30 = 491;
      _os_log_impl(&dword_1AF533000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v25, 0x30u);
    }
    setErrorWithOSStatus(v20, a5);
  }
  else
  {
    if (__osLog)
      v19 = __osLog;
    else
      v19 = v9;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v25 = 136316162;
      *(_QWORD *)v26 = "state";
      *(_WORD *)&v26[8] = 2048;
      *(_QWORD *)&v26[10] = 0;
      *(_WORD *)&v26[18] = 2080;
      *(_QWORD *)&v26[20] = &unk_1AF575226;
      v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v29 = 1024;
      v30 = 488;
      _os_log_impl(&dword_1AF533000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v25, 0x30u);
    }
    setError((id)1, a5);
  }
  if (__osLogTrace)
    v22 = __osLogTrace;
  else
    v22 = v9;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    if (a3)
      v23 = *a3;
    else
      v23 = 0;
    if (a5)
      v24 = *a5;
    else
      v24 = 0;
    v25 = 67109634;
    *(_DWORD *)v26 = 0;
    *(_WORD *)&v26[4] = 2048;
    *(_QWORD *)&v26[6] = v23;
    *(_WORD *)&v26[14] = 2112;
    *(_QWORD *)&v26[16] = v24;
    _os_log_impl(&dword_1AF533000, v22, OS_LOG_TYPE_ERROR, "BKDevice::expressModeState:forUser: -> %d %ld %@\n", (uint8_t *)&v25, 0x1Cu);
  }
  return 0;
}

- (id)identitiesDatabaseUUIDForUser:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
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
  id v18;
  int v19;
  _BYTE v20[18];
  uint64_t v21;

  v5 = *(_QWORD *)&a3;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v10 = v8;
    v19 = 67109376;
    *(_DWORD *)v20 = v5;
    *(_WORD *)&v20[4] = 2048;
    *(_QWORD *)&v20[6] = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEFAULT, "BKDevice::identitiesDatabaseUUIDForUser: %d (_cid %lu)\n", (uint8_t *)&v19, 0x12u);

  }
  -[BiometricKitXPCClient getIdentitiesDatabaseUUIDForUser:](self->_xpcClient, "getIdentitiesDatabaseUUIDForUser:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
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
      v19 = 138412546;
      *(_QWORD *)v20 = v11;
      *(_WORD *)&v20[8] = 2112;
      *(_QWORD *)&v20[10] = v13;
      v14 = v12;
      v15 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
      _os_log_impl(&dword_1AF533000, v14, v15, "BKDevice::identitiesDatabaseUUIDForUser: -> %@ %@\n", (uint8_t *)&v19, 0x16u);
    }
  }
  else
  {
    setError((id)1, a4);
    if (__osLogTrace)
      v17 = __osLogTrace;
    else
      v17 = v7;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      if (a4)
        v18 = *a4;
      else
        v18 = 0;
      v19 = 138412546;
      *(_QWORD *)v20 = 0;
      *(_WORD *)&v20[8] = 2112;
      *(_QWORD *)&v20[10] = v18;
      v14 = v17;
      v15 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }
  return v11;
}

- (id)identitiesDatabaseHashForUser:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
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
  id v18;
  int v19;
  _BYTE v20[18];
  uint64_t v21;

  v5 = *(_QWORD *)&a3;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v10 = v8;
    v19 = 67109376;
    *(_DWORD *)v20 = v5;
    *(_WORD *)&v20[4] = 2048;
    *(_QWORD *)&v20[6] = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEFAULT, "BKDevice::identitiesDatabaseHashForUser: %d (_cid %lu)\n", (uint8_t *)&v19, 0x12u);

  }
  -[BiometricKitXPCClient getIdentitiesDatabaseHashForUser:](self->_xpcClient, "getIdentitiesDatabaseHashForUser:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
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
      v19 = 138412546;
      *(_QWORD *)v20 = v11;
      *(_WORD *)&v20[8] = 2112;
      *(_QWORD *)&v20[10] = v13;
      v14 = v12;
      v15 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
      _os_log_impl(&dword_1AF533000, v14, v15, "BKDevice::identitiesDatabaseHashForUser: -> %@ %@\n", (uint8_t *)&v19, 0x16u);
    }
  }
  else
  {
    setError((id)1, a4);
    if (__osLogTrace)
      v17 = __osLogTrace;
    else
      v17 = v7;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      if (a4)
        v18 = *a4;
      else
        v18 = 0;
      v19 = 138412546;
      *(_QWORD *)v20 = 0;
      *(_WORD *)&v20[8] = 2112;
      *(_QWORD *)&v20[10] = v18;
      v14 = v17;
      v15 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }
  return v11;
}

- (BOOL)dropAllUnlockTokensWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  BiometricKitXPCClient *xpcClient;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  NSObject *v15;
  NSObject *v16;
  id v17;
  int v18;
  _BYTE v19[10];
  _BYTE v20[10];
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v8 = v6;
    v18 = 134217984;
    *(_QWORD *)v19 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_DEFAULT, "BKDevice::dropAllUnlockTokens (_cid %lu)\n", (uint8_t *)&v18, 0xCu);

  }
  v9 = (void *)-[BiometricKitXPCClient dropUnlockToken](self->_xpcClient, "dropUnlockToken");
  if ((_DWORD)v9)
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = v5;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = 136316162;
      *(_QWORD *)v19 = "err == 0 ";
      *(_WORD *)&v19[8] = 2048;
      *(_QWORD *)v20 = (int)v9;
      *(_WORD *)&v20[8] = 2080;
      v21 = &unk_1AF575226;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v24 = 1024;
      v25 = 551;
      _os_log_impl(&dword_1AF533000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
    setErrorWithOSStatus(v9, a3);
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
      v18 = 67109634;
      *(_DWORD *)v19 = 0;
      *(_WORD *)&v19[4] = 1024;
      *(_DWORD *)&v19[6] = (_DWORD)v9;
      *(_WORD *)v20 = 2112;
      *(_QWORD *)&v20[2] = v17;
      v12 = v16;
      v13 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }
  else
  {
    if (__osLogTrace)
      v10 = __osLogTrace;
    else
      v10 = v5;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v11 = *a3;
      else
        v11 = 0;
      v18 = 67109634;
      *(_DWORD *)v19 = 1;
      *(_WORD *)&v19[4] = 1024;
      *(_DWORD *)&v19[6] = 0;
      *(_WORD *)v20 = 2112;
      *(_QWORD *)&v20[2] = v11;
      v12 = v10;
      v13 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
      _os_log_impl(&dword_1AF533000, v12, v13, "BKDevice::dropAllUnlockTokens -> %d(%{errno}d) %@\n", (uint8_t *)&v18, 0x18u);
    }
  }
  return (_DWORD)v9 == 0;
}

- (BOOL)forceBioLockoutForAllUsersWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  BiometricKitXPCClient *xpcClient;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  NSObject *v15;
  NSObject *v16;
  id v17;
  int v18;
  _BYTE v19[10];
  _BYTE v20[10];
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v8 = v6;
    v18 = 134217984;
    *(_QWORD *)v19 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_DEFAULT, "BKDevice::forceBioLockoutForAllUsers (_cid %lu)\n", (uint8_t *)&v18, 0xCu);

  }
  v9 = (void *)-[BiometricKitXPCClient forceBioLockoutForUser:withOptions:](self->_xpcClient, "forceBioLockoutForUser:withOptions:", 0xFFFFFFFFLL, 0);
  if ((_DWORD)v9)
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = v5;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = 136316162;
      *(_QWORD *)v19 = "err == 0 ";
      *(_WORD *)&v19[8] = 2048;
      *(_QWORD *)v20 = (int)v9;
      *(_WORD *)&v20[8] = 2080;
      v21 = &unk_1AF575226;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v24 = 1024;
      v25 = 573;
      _os_log_impl(&dword_1AF533000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
    setErrorWithOSStatus(v9, a3);
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
      v18 = 67109634;
      *(_DWORD *)v19 = 0;
      *(_WORD *)&v19[4] = 1024;
      *(_DWORD *)&v19[6] = (_DWORD)v9;
      *(_WORD *)v20 = 2112;
      *(_QWORD *)&v20[2] = v17;
      v12 = v16;
      v13 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }
  else
  {
    if (__osLogTrace)
      v10 = __osLogTrace;
    else
      v10 = v5;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v11 = *a3;
      else
        v11 = 0;
      v18 = 67109634;
      *(_DWORD *)v19 = 1;
      *(_WORD *)&v19[4] = 1024;
      *(_DWORD *)&v19[6] = 0;
      *(_WORD *)v20 = 2112;
      *(_QWORD *)&v20[2] = v11;
      v12 = v10;
      v13 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
      _os_log_impl(&dword_1AF533000, v12, v13, "BKDevice::dropAllUnlockTokens -> %d(%{errno}d) %@\n", (uint8_t *)&v18, 0x18u);
    }
  }
  return (_DWORD)v9 == 0;
}

- (BOOL)forceBioLockoutForUser:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  NSObject *v7;
  NSObject *v8;
  BiometricKitXPCClient *xpcClient;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  BOOL v14;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  int v21;
  _BYTE v22[20];
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v5 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x1E0C80C00];
  v7 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v10 = v8;
    v21 = 67109376;
    *(_DWORD *)v22 = v5;
    *(_WORD *)&v22[4] = 2048;
    *(_QWORD *)&v22[6] = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEFAULT, "BKDevice::forceBioLockoutForUser: %d (_cid %lu)\n", (uint8_t *)&v21, 0x12u);

  }
  if ((_DWORD)v5 == -1)
  {
    if (__osLog)
      v16 = __osLog;
    else
      v16 = v7;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v21 = 136316162;
      *(_QWORD *)v22 = "userID != 4294967295U";
      *(_WORD *)&v22[8] = 2048;
      *(_QWORD *)&v22[10] = 0;
      *(_WORD *)&v22[18] = 2080;
      v23 = &unk_1AF575226;
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v26 = 1024;
      v27 = 594;
      _os_log_impl(&dword_1AF533000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
    }
    setError((id)1, a4);
    LODWORD(v17) = 0;
  }
  else
  {
    v11 = (void *)-[BiometricKitXPCClient forceBioLockoutForUser:withOptions:](self->_xpcClient, "forceBioLockoutForUser:withOptions:", v5, 0);
    if (!(_DWORD)v11)
    {
      if (__osLogTrace)
        v12 = __osLogTrace;
      else
        v12 = v7;
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        return 1;
      if (a4)
        v13 = *a4;
      else
        v13 = 0;
      v21 = 67109634;
      v14 = 1;
      *(_DWORD *)v22 = 1;
      *(_WORD *)&v22[4] = 1024;
      *(_DWORD *)&v22[6] = 0;
      *(_WORD *)&v22[10] = 2112;
      *(_QWORD *)&v22[12] = v13;
      _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_DEFAULT, "BKDevice::forceBioLockoutForUser: -> %d(%{errno}d) %@\n", (uint8_t *)&v21, 0x18u);
      return v14;
    }
    v17 = v11;
    if (__osLog)
      v18 = __osLog;
    else
      v18 = v7;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v21 = 136316162;
      *(_QWORD *)v22 = "err == 0 ";
      *(_WORD *)&v22[8] = 2048;
      *(_QWORD *)&v22[10] = (int)v17;
      *(_WORD *)&v22[18] = 2080;
      v23 = &unk_1AF575226;
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v26 = 1024;
      v27 = 597;
      _os_log_impl(&dword_1AF533000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
    }
    setErrorWithOSStatus(v17, a4);
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
    v21 = 67109634;
    *(_DWORD *)v22 = 0;
    *(_WORD *)&v22[4] = 1024;
    *(_DWORD *)&v22[6] = (_DWORD)v17;
    *(_WORD *)&v22[10] = 2112;
    *(_QWORD *)&v22[12] = v20;
    _os_log_impl(&dword_1AF533000, v19, OS_LOG_TYPE_ERROR, "BKDevice::forceBioLockoutForUser: -> %d(%{errno}d) %@\n", (uint8_t *)&v21, 0x18u);
  }
  return 0;
}

- (BOOL)forceBioLockoutIfLockedForUser:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  NSObject *v7;
  NSObject *v8;
  BiometricKitXPCClient *xpcClient;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  BOOL v14;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  int v21;
  _BYTE v22[20];
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v5 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x1E0C80C00];
  v7 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v10 = v8;
    v21 = 67109376;
    *(_DWORD *)v22 = v5;
    *(_WORD *)&v22[4] = 2048;
    *(_QWORD *)&v22[6] = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEFAULT, "BKDevice::forceBioLockoutIfLockedForUser: %d (_cid %lu)\n", (uint8_t *)&v21, 0x12u);

  }
  if ((_DWORD)v5 == -1)
  {
    if (__osLog)
      v16 = __osLog;
    else
      v16 = v7;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v21 = 136316162;
      *(_QWORD *)v22 = "userID != 4294967295U";
      *(_WORD *)&v22[8] = 2048;
      *(_QWORD *)&v22[10] = 0;
      *(_WORD *)&v22[18] = 2080;
      v23 = &unk_1AF575226;
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v26 = 1024;
      v27 = 618;
      _os_log_impl(&dword_1AF533000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
    }
    setError((id)1, a4);
    LODWORD(v17) = 0;
  }
  else
  {
    v11 = (void *)-[BiometricKitXPCClient forceBioLockoutForUser:withOptions:](self->_xpcClient, "forceBioLockoutForUser:withOptions:", v5, &unk_1E5F8D2E8);
    if (!(_DWORD)v11)
    {
      if (__osLogTrace)
        v12 = __osLogTrace;
      else
        v12 = v7;
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        return 1;
      if (a4)
        v13 = *a4;
      else
        v13 = 0;
      v21 = 67109634;
      v14 = 1;
      *(_DWORD *)v22 = 1;
      *(_WORD *)&v22[4] = 1024;
      *(_DWORD *)&v22[6] = 0;
      *(_WORD *)&v22[10] = 2112;
      *(_QWORD *)&v22[12] = v13;
      _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_DEFAULT, "BKDevice::forceBioLockoutIfLockedForUser: -> %d(%{errno}d) %@\n", (uint8_t *)&v21, 0x18u);
      return v14;
    }
    v17 = v11;
    if (__osLog)
      v18 = __osLog;
    else
      v18 = v7;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v21 = 136316162;
      *(_QWORD *)v22 = "err == 0 ";
      *(_WORD *)&v22[8] = 2048;
      *(_QWORD *)&v22[10] = (int)v17;
      *(_WORD *)&v22[18] = 2080;
      v23 = &unk_1AF575226;
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v26 = 1024;
      v27 = 621;
      _os_log_impl(&dword_1AF533000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
    }
    setErrorWithOSStatus(v17, a4);
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
    v21 = 67109634;
    *(_DWORD *)v22 = 0;
    *(_WORD *)&v22[4] = 1024;
    *(_DWORD *)&v22[6] = (_DWORD)v17;
    *(_WORD *)&v22[10] = 2112;
    *(_QWORD *)&v22[12] = v20;
    _os_log_impl(&dword_1AF533000, v19, OS_LOG_TYPE_ERROR, "BKDevice::forceBioLockoutIfLockedForUser: -> %d(%{errno}d) %@\n", (uint8_t *)&v21, 0x18u);
  }
  return 0;
}

- (id)identityForUUID:(id)a3 error:(id *)a4
{
  char *v6;
  NSObject *v7;
  NSObject *v8;
  BiometricKitXPCClient *xpcClient;
  NSObject *v10;
  void *v11;
  BKIdentity *v12;
  BKIdentity *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  int v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v10 = v8;
    v20 = 138412546;
    v21 = v6;
    v22 = 2048;
    v23 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEFAULT, "BKDevice::identityForUUID: %@ (_cid %lu)\n", (uint8_t *)&v20, 0x16u);

  }
  -[BiometricKitXPCClient getIdentityFromUUID:](self->_xpcClient, "getIdentityFromUUID:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = -[BKIdentity initWithServerIdentity:device:]([BKIdentity alloc], "initWithServerIdentity:device:", v11, self);
    if (v12)
    {
      v13 = v12;
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
        v20 = 138412546;
        v21 = (const char *)v13;
        v22 = 2112;
        v23 = (uint64_t)v15;
        _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_DEFAULT, "BKDevice::identityForUUID: -> %@ %@\n", (uint8_t *)&v20, 0x16u);
      }
      goto LABEL_31;
    }
  }
  else
  {
    if (__osLog)
      v16 = __osLog;
    else
      v16 = v7;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v20 = 136316162;
      v21 = "serverIdentity";
      v22 = 2048;
      v23 = 0;
      v24 = 2080;
      v25 = &unk_1AF575226;
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v28 = 1024;
      v29 = 643;
      _os_log_impl(&dword_1AF533000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
    }
    setError((id)1, a4);
  }
  if (__osLogTrace)
    v17 = __osLogTrace;
  else
    v17 = v7;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    if (a4)
      v18 = *a4;
    else
      v18 = 0;
    v20 = 138412546;
    v21 = 0;
    v22 = 2112;
    v23 = (uint64_t)v18;
    _os_log_impl(&dword_1AF533000, v17, OS_LOG_TYPE_ERROR, "BKDevice::identityForUUID: -> %@ %@\n", (uint8_t *)&v20, 0x16u);
  }
  v13 = 0;
LABEL_31:

  return v13;
}

- (void)updateIdentity:(id)a3 async:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  BiometricKitXPCClient *xpcClient;
  NSObject *v13;
  BiometricKitXPCClient *v14;
  void *v15;
  id v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v6 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v11 = __osLogTrace;
  else
    v11 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v13 = v11;
    *(_DWORD *)buf = 138412802;
    v21 = v8;
    v22 = 1024;
    v23 = v6;
    v24 = 2048;
    v25 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v13, OS_LOG_TYPE_DEFAULT, "BKDevice::updateIdentity: %@ (async %u, _cid %lu)\n", buf, 0x1Cu);

  }
  v14 = self->_xpcClient;
  objc_msgSend(v8, "serverIdentity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __39__BKDevice_updateIdentity_async_reply___block_invoke;
  v18[3] = &unk_1E5F83DE0;
  v16 = v9;
  v19 = v16;
  -[BiometricKitXPCClient updateIdentity:withOptions:async:withReply:](v14, "updateIdentity:withOptions:async:withReply:", v15, 0, v6, v18);

  if (__osLogTrace)
    v17 = __osLogTrace;
  else
    v17 = v10;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v17, OS_LOG_TYPE_DEFAULT, "BKDevice::updateIdentity: -> void\n", buf, 2u);
  }

}

void __39__BKDevice_updateIdentity_async_reply___block_invoke(uint64_t a1, uint64_t a2)
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
      _os_log_impl(&dword_1AF533000, v4, OS_LOG_TYPE_ERROR, "BKDevice::updateIdentity: -> reply(%d, %@)\n", (uint8_t *)&v6, 0x12u);
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
      _os_log_impl(&dword_1AF533000, v5, OS_LOG_TYPE_DEFAULT, "BKDevice::updateIdentity: -> reply(%d, %@)\n", (uint8_t *)&v6, 0x12u);
    }
    v3 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)updateIdentity:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __33__BKDevice_updateIdentity_error___block_invoke;
  v9[3] = &unk_1E5F84458;
  v9[4] = &v16;
  v9[5] = &v10;
  -[BKDevice updateIdentity:async:reply:](self, "updateIdentity:async:reply:", v6, 0, v9);
  if (a4)
    *a4 = objc_retainAutorelease((id)v11[5]);
  v7 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

void __33__BKDevice_updateIdentity_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)updateIdentity:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__BKDevice_updateIdentity_reply___block_invoke;
  v8[3] = &unk_1E5F844A8;
  v9 = v6;
  v7 = v6;
  -[BKDevice updateIdentity:async:reply:](self, "updateIdentity:async:reply:", a3, 1, v8);

}

void __33__BKDevice_updateIdentity_reply___block_invoke(uint64_t a1, char a2, void *a3)
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
  block[2] = __33__BKDevice_updateIdentity_reply___block_invoke_2;
  block[3] = &unk_1E5F84480;
  v7 = *(id *)(a1 + 32);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __33__BKDevice_updateIdentity_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)removeIdentity:(id)a3 async:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  BiometricKitXPCClient *xpcClient;
  NSObject *v13;
  BiometricKitXPCClient *v14;
  void *v15;
  id v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v6 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v11 = __osLogTrace;
  else
    v11 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v13 = v11;
    *(_DWORD *)buf = 138412802;
    v21 = v8;
    v22 = 1024;
    v23 = v6;
    v24 = 2048;
    v25 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v13, OS_LOG_TYPE_DEFAULT, "BKDevice::removeIdentity: %@ (async %u, _cid %lu)\n", buf, 0x1Cu);

  }
  v14 = self->_xpcClient;
  objc_msgSend(v8, "serverIdentity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __39__BKDevice_removeIdentity_async_reply___block_invoke;
  v18[3] = &unk_1E5F83DE0;
  v16 = v9;
  v19 = v16;
  -[BiometricKitXPCClient removeIdentity:withOptions:async:withReply:](v14, "removeIdentity:withOptions:async:withReply:", v15, 0, v6, v18);

  if (__osLogTrace)
    v17 = __osLogTrace;
  else
    v17 = v10;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v17, OS_LOG_TYPE_DEFAULT, "BKDevice::removeIdentity: -> void\n", buf, 2u);
  }

}

void __39__BKDevice_removeIdentity_async_reply___block_invoke(uint64_t a1, uint64_t a2)
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
      _os_log_impl(&dword_1AF533000, v4, OS_LOG_TYPE_ERROR, "BKDevice::removeIdentity: -> reply(%d, %@)\n", (uint8_t *)&v6, 0x12u);
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
      _os_log_impl(&dword_1AF533000, v5, OS_LOG_TYPE_DEFAULT, "BKDevice::removeIdentity: -> reply(%d, %@)\n", (uint8_t *)&v6, 0x12u);
    }
    v3 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)removeIdentity:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __33__BKDevice_removeIdentity_error___block_invoke;
  v9[3] = &unk_1E5F84458;
  v9[4] = &v16;
  v9[5] = &v10;
  -[BKDevice removeIdentity:async:reply:](self, "removeIdentity:async:reply:", v6, 0, v9);
  if (a4)
    *a4 = objc_retainAutorelease((id)v11[5]);
  v7 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

void __33__BKDevice_removeIdentity_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)removeIdentity:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__BKDevice_removeIdentity_reply___block_invoke;
  v8[3] = &unk_1E5F844A8;
  v9 = v6;
  v7 = v6;
  -[BKDevice removeIdentity:async:reply:](self, "removeIdentity:async:reply:", a3, 1, v8);

}

void __33__BKDevice_removeIdentity_reply___block_invoke(uint64_t a1, char a2, void *a3)
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
  block[2] = __33__BKDevice_removeIdentity_reply___block_invoke_2;
  block[3] = &unk_1E5F84480;
  v7 = *(id *)(a1 + 32);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __33__BKDevice_removeIdentity_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)removeAllIdentitiesForUser:(unsigned int)a3 async:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  NSObject *v9;
  NSObject *v10;
  BiometricKitXPCClient *xpcClient;
  NSObject *v12;
  BiometricKitXPCClient *v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v5 = a4;
  v6 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v12 = v10;
    *(_DWORD *)buf = 67109632;
    v19 = v6;
    v20 = 1024;
    v21 = v5;
    v22 = 2048;
    v23 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_DEFAULT, "BKDevice::removeAllIdentitiesForUser: %d (async %u, _cid %lu)\n", buf, 0x18u);

  }
  v13 = self->_xpcClient;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __51__BKDevice_removeAllIdentitiesForUser_async_reply___block_invoke;
  v16[3] = &unk_1E5F83DE0;
  v14 = v8;
  v17 = v14;
  -[BiometricKitXPCClient removeAllIdentitiesForUser:withOptions:async:withReply:](v13, "removeAllIdentitiesForUser:withOptions:async:withReply:", v6, 0, v5, v16);
  if (__osLogTrace)
    v15 = __osLogTrace;
  else
    v15 = v9;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v15, OS_LOG_TYPE_DEFAULT, "BKDevice::removeAllIdentitiesForUser: -> void\n", buf, 2u);
  }

}

void __51__BKDevice_removeAllIdentitiesForUser_async_reply___block_invoke(uint64_t a1, uint64_t a2)
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
      _os_log_impl(&dword_1AF533000, v4, OS_LOG_TYPE_ERROR, "BKDevice::removeAllIdentitiesForUser: -> reply(%d, %@)\n", (uint8_t *)&v6, 0x12u);
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
      _os_log_impl(&dword_1AF533000, v5, OS_LOG_TYPE_DEFAULT, "BKDevice::removeAllIdentitiesForUser: -> reply(%d, %@)\n", (uint8_t *)&v6, 0x12u);
    }
    v3 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)removeAllIdentitiesForUser:(unsigned int)a3 error:(id *)a4
{
  char v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__BKDevice_removeAllIdentitiesForUser_error___block_invoke;
  v7[3] = &unk_1E5F84458;
  v7[4] = &v14;
  v7[5] = &v8;
  -[BKDevice removeAllIdentitiesForUser:async:reply:](self, "removeAllIdentitiesForUser:async:reply:", *(_QWORD *)&a3, 0, v7);
  if (a4)
    *a4 = objc_retainAutorelease((id)v9[5]);
  v5 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __45__BKDevice_removeAllIdentitiesForUser_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)removeAllIdentitiesForUser:(unsigned int)a3 reply:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__BKDevice_removeAllIdentitiesForUser_reply___block_invoke;
  v8[3] = &unk_1E5F844A8;
  v9 = v6;
  v7 = v6;
  -[BKDevice removeAllIdentitiesForUser:async:reply:](self, "removeAllIdentitiesForUser:async:reply:", v4, 1, v8);

}

void __45__BKDevice_removeAllIdentitiesForUser_reply___block_invoke(uint64_t a1, char a2, void *a3)
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
  block[2] = __45__BKDevice_removeAllIdentitiesForUser_reply___block_invoke_2;
  block[3] = &unk_1E5F84480;
  v7 = *(id *)(a1 + 32);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __45__BKDevice_removeAllIdentitiesForUser_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (id)identitiesWithError:(id *)a3
{
  NSObject *v4;
  NSObject *v5;
  BiometricKitXPCClient *xpcClient;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  BKIdentity *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v5 = __osLogTrace;
  else
    v5 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v7 = v5;
    v8 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    *(_DWORD *)buf = 134217984;
    v34 = (const char *)v8;
    _os_log_impl(&dword_1AF533000, v7, OS_LOG_TYPE_DEFAULT, "BKDevice::identities (_cid %lu)\n", buf, 0xCu);

  }
  -[BiometricKitXPCClient identities:](self->_xpcClient, "identities:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v11);
          v16 = -[BKIdentity initWithServerIdentity:device:]([BKIdentity alloc], "initWithServerIdentity:device:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), self);
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v13);
    }

    if (v10)
    {
      if (__osLogTrace)
        v17 = __osLogTrace;
      else
        v17 = v4;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v17;
        v19 = objc_msgSend(v10, "count");
        v20 = a3;
        if (a3)
          v20 = *a3;
        *(_DWORD *)buf = 134218498;
        v34 = (const char *)v19;
        v35 = 2114;
        v36 = v10;
        v37 = 2112;
        v38 = v20;
        _os_log_impl(&dword_1AF533000, v18, OS_LOG_TYPE_DEFAULT, "BKDevice::identities -> %lu: %{public}@ %@\n", buf, 0x20u);

      }
      goto LABEL_36;
    }
  }
  else
  {
    if (__osLog)
      v21 = __osLog;
    else
      v21 = v4;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v34 = "serverIdentities";
      v35 = 2048;
      v36 = 0;
      v37 = 2080;
      v38 = &unk_1AF575226;
      v39 = 2080;
      v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v41 = 1024;
      v42 = 830;
      _os_log_impl(&dword_1AF533000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setError((id)1, a3);
  }
  if (__osLogTrace)
    v22 = __osLogTrace;
  else
    v22 = v4;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v23 = v22;
    v24 = objc_msgSend(0, "count");
    v25 = a3;
    if (a3)
      v25 = *a3;
    *(_DWORD *)buf = 134218498;
    v34 = (const char *)v24;
    v35 = 2114;
    v36 = 0;
    v37 = 2112;
    v38 = v25;
    _os_log_impl(&dword_1AF533000, v23, OS_LOG_TYPE_ERROR, "BKDevice::identities -> %lu: %{public}@ %@\n", buf, 0x20u);

  }
  v10 = 0;
LABEL_36:

  return v10;
}

- (id)identitiesForUser:(unsigned int)a3 error:(id *)a4
{
  uint64_t v4;
  NSObject *v6;
  NSObject *v7;
  BiometricKitXPCClient *xpcClient;
  NSObject *v9;
  uint64_t v10;
  BiometricKitXPCClient *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  BKIdentity *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  _BYTE v36[18];
  __int16 v37;
  void *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  const __CFString *v43;
  _QWORD v44[4];

  v4 = *(_QWORD *)&a3;
  v44[1] = *MEMORY[0x1E0C80C00];
  v6 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v7 = __osLogTrace;
  else
    v7 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v9 = v7;
    v10 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v36 = v4;
    *(_WORD *)&v36[4] = 2048;
    *(_QWORD *)&v36[6] = v10;
    _os_log_impl(&dword_1AF533000, v9, OS_LOG_TYPE_DEFAULT, "BKDevice::identitiesForUser: %d (_cid %lu)\n", buf, 0x12u);

  }
  v11 = self->_xpcClient;
  v43 = CFSTR("BKFilterUserID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BiometricKitXPCClient identities:](v11, "identities:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = v6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v17 = v14;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v31 != v20)
            objc_enumerationMutation(v17);
          v22 = -[BKIdentity initWithServerIdentity:device:]([BKIdentity alloc], "initWithServerIdentity:device:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i), self);
          objc_msgSend(v16, "addObject:", v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v19);
    }

    v6 = v15;
    if (v16)
    {
      if (__osLogTrace)
        v23 = __osLogTrace;
      else
        v23 = v15;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = a4;
        if (a4)
          v24 = *a4;
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v36 = v16;
        *(_WORD *)&v36[8] = 2112;
        *(_QWORD *)&v36[10] = v24;
        _os_log_impl(&dword_1AF533000, v23, OS_LOG_TYPE_DEFAULT, "BKDevice::identitiesForUser: -> %@ %@\n", buf, 0x16u);
      }
      goto LABEL_36;
    }
  }
  else
  {
    if (__osLog)
      v25 = __osLog;
    else
      v25 = v6;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v36 = "serverIdentities";
      *(_WORD *)&v36[8] = 2048;
      *(_QWORD *)&v36[10] = 0;
      v37 = 2080;
      v38 = &unk_1AF575226;
      v39 = 2080;
      v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v41 = 1024;
      v42 = 856;
      _os_log_impl(&dword_1AF533000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setError((id)1, a4);
  }
  if (__osLogTrace)
    v26 = __osLogTrace;
  else
    v26 = v6;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v27 = a4;
    if (a4)
      v27 = *a4;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v36 = 0;
    *(_WORD *)&v36[8] = 2112;
    *(_QWORD *)&v36[10] = v27;
    _os_log_impl(&dword_1AF533000, v26, OS_LOG_TYPE_ERROR, "BKDevice::identitiesForUser: -> %@ %@\n", buf, 0x16u);
  }
  v16 = 0;
LABEL_36:

  return v16;
}

- (id)maxIdentityCountWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  BiometricKitXPCClient *xpcClient;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v8 = v6;
    v20 = 134217984;
    v21 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_DEFAULT, "BKDevice::maxIdentityCount (_cid %lu)\n", (uint8_t *)&v20, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[BiometricKitXPCClient getMaxIdentityCount:](self->_xpcClient, "getMaxIdentityCount:", 0));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (__osLogTrace)
    v11 = __osLogTrace;
  else
    v11 = v5;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = objc_msgSend(v10, "integerValue");
      if (a3)
        v14 = *a3;
      else
        v14 = 0;
      v20 = 134218242;
      v21 = v13;
      v22 = 2112;
      v23 = v14;
      v17 = v12;
      v18 = OS_LOG_TYPE_DEFAULT;
LABEL_20:
      _os_log_impl(&dword_1AF533000, v17, v18, "BKDevice::maxIdentityCount -> %ld %@\n", (uint8_t *)&v20, 0x16u);

    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = v11;
    v15 = objc_msgSend(0, "integerValue");
    if (a3)
      v16 = *a3;
    else
      v16 = 0;
    v20 = 134218242;
    v21 = v15;
    v22 = 2112;
    v23 = v16;
    v17 = v12;
    v18 = OS_LOG_TYPE_ERROR;
    goto LABEL_20;
  }
  return v10;
}

- (id)freeIdentityCountForUser:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  NSObject *v7;
  NSObject *v8;
  BiometricKitXPCClient *xpcClient;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  int v22;
  _BYTE v23[18];
  uint64_t v24;

  v5 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x1E0C80C00];
  v7 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v10 = v8;
    v22 = 67109376;
    *(_DWORD *)v23 = v5;
    *(_WORD *)&v23[4] = 2048;
    *(_QWORD *)&v23[6] = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEFAULT, "BKDevice::freeIdentityCountForUser: %d (_cid %lu)\n", (uint8_t *)&v22, 0x12u);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[BiometricKitXPCClient getFreeIdentityCount:forUser:](self->_xpcClient, "getFreeIdentityCount:forUser:", 0, v5));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (__osLogTrace)
    v13 = __osLogTrace;
  else
    v13 = v7;
  if (v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      v15 = objc_msgSend(v12, "integerValue");
      if (a4)
        v16 = *a4;
      else
        v16 = 0;
      v22 = 134218242;
      *(_QWORD *)v23 = v15;
      *(_WORD *)&v23[8] = 2112;
      *(_QWORD *)&v23[10] = v16;
      v19 = v14;
      v20 = OS_LOG_TYPE_DEFAULT;
LABEL_20:
      _os_log_impl(&dword_1AF533000, v19, v20, "BKDevice::freeIdentityCountForUser: -> %ld %@\n", (uint8_t *)&v22, 0x16u);

    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = v13;
    v17 = objc_msgSend(0, "integerValue");
    if (a4)
      v18 = *a4;
    else
      v18 = 0;
    v22 = 134218242;
    *(_QWORD *)v23 = v17;
    *(_WORD *)&v23[8] = 2112;
    *(_QWORD *)&v23[10] = v18;
    v19 = v14;
    v20 = OS_LOG_TYPE_ERROR;
    goto LABEL_20;
  }
  return v12;
}

- (BOOL)biometryAvailability:(int64_t *)a3 forUser:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  NSObject *v9;
  NSObject *v10;
  BiometricKitXPCClient *xpcClient;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int64_t v15;
  id v16;
  BOOL v17;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  int64_t v24;
  id v25;
  uint64_t v26;
  uint8_t buf[4];
  _BYTE v28[28];
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v6 = *(_QWORD *)&a4;
  v33 = *MEMORY[0x1E0C80C00];
  v9 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v12 = v10;
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)v28 = a3;
    *(_WORD *)&v28[8] = 1024;
    *(_DWORD *)&v28[10] = v6;
    *(_WORD *)&v28[14] = 2048;
    *(_QWORD *)&v28[16] = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_DEFAULT, "BKDevice::biometryAvailability:forUser: %p %d (_cid %lu)\n", buf, 0x1Cu);

  }
  v26 = 0;
  if (a3)
  {
    v13 = -[BiometricKitXPCClient getBiometryAvailability:forUser:](self->_xpcClient, "getBiometryAvailability:forUser:", &v26, v6);
    if (v13)
    {
      v20 = (void *)v13;
      if (__osLog)
        v21 = __osLog;
      else
        v21 = v9;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v28 = "err == 0 ";
        *(_WORD *)&v28[8] = 2048;
        *(_QWORD *)&v28[10] = v20;
        *(_WORD *)&v28[18] = 2080;
        *(_QWORD *)&v28[20] = &unk_1AF575226;
        v29 = 2080;
        v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
        v31 = 1024;
        v32 = 921;
        _os_log_impl(&dword_1AF533000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      setErrorWithOSStatus(v20, a5);
    }
    else
    {
      if (+[BKDevice biometryAvailabilityInfo:fromDeviceInfo:error:](BKDevice, "biometryAvailabilityInfo:fromDeviceInfo:error:", a3, v26, a5))
      {
        if (__osLogTrace)
          v14 = __osLogTrace;
        else
          v14 = v9;
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          return 1;
        v15 = *a3;
        if (a5)
          v16 = *a5;
        else
          v16 = 0;
        *(_DWORD *)buf = 67109634;
        v17 = 1;
        *(_DWORD *)v28 = 1;
        *(_WORD *)&v28[4] = 2048;
        *(_QWORD *)&v28[6] = v15;
        *(_WORD *)&v28[14] = 2112;
        *(_QWORD *)&v28[16] = v16;
        _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_DEFAULT, "BKDevice::biometryAvailability:forUser: -> %d %ld %@\n", buf, 0x1Cu);
        return v17;
      }
      if (__osLog)
        v22 = __osLog;
      else
        v22 = v9;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v28 = "result";
        *(_WORD *)&v28[8] = 2048;
        *(_QWORD *)&v28[10] = 0;
        *(_WORD *)&v28[18] = 2080;
        *(_QWORD *)&v28[20] = &unk_1AF575226;
        v29 = 2080;
        v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
        v31 = 1024;
        v32 = 924;
        _os_log_impl(&dword_1AF533000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
  }
  else
  {
    if (__osLog)
      v19 = __osLog;
    else
      v19 = v9;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v28 = "info";
      *(_WORD *)&v28[8] = 2048;
      *(_QWORD *)&v28[10] = 0;
      *(_WORD *)&v28[18] = 2080;
      *(_QWORD *)&v28[20] = &unk_1AF575226;
      v29 = 2080;
      v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v31 = 1024;
      v32 = 918;
      _os_log_impl(&dword_1AF533000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setError((id)1, a5);
  }
  if (__osLogTrace)
    v23 = __osLogTrace;
  else
    v23 = v9;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    if (a3)
      v24 = *a3;
    else
      v24 = 0;
    if (a5)
      v25 = *a5;
    else
      v25 = 0;
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v28 = 0;
    *(_WORD *)&v28[4] = 2048;
    *(_QWORD *)&v28[6] = v24;
    *(_WORD *)&v28[14] = 2112;
    *(_QWORD *)&v28[16] = v25;
    _os_log_impl(&dword_1AF533000, v23, OS_LOG_TYPE_ERROR, "BKDevice::biometryAvailability:forUser: -> %d %ld %@\n", buf, 0x1Cu);
  }
  return 0;
}

- (id)lastMatchEventWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  BiometricKitXPCClient *xpcClient;
  NSObject *v8;
  BiometricKitXPCClient *v9;
  int v10;
  id v11;
  uint64_t v12;
  char *v13;
  NSObject *v14;
  id v15;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v8 = v6;
    *(_DWORD *)buf = 134217984;
    v24 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_DEFAULT, "BKDevice::lastMatchEventWithError: (_cid %lu)\n", buf, 0xCu);

  }
  v9 = self->_xpcClient;
  v22 = 0;
  v10 = -[BiometricKitXPCClient getLastMatchEvent:](v9, "getLastMatchEvent:", &v22);
  v11 = v22;
  if (v10)
  {
    v17 = (void *)v10;
    if (__osLog)
      v18 = __osLog;
    else
      v18 = v5;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v24 = "err == 0 ";
      v25 = 2048;
      v26 = v17;
      v27 = 2080;
      v28 = &unk_1AF575226;
      v29 = 2080;
      v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v31 = 1024;
      v32 = 947;
      _os_log_impl(&dword_1AF533000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setErrorWithOSStatus(v17, a3);
  }
  else
  {
    +[BKMatchEvent matchEventWithDictionary:device:error:](BKMatchEvent, "matchEventWithDictionary:device:error:", v11, self, a3);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (char *)v12;
      if (__osLogTrace)
        v14 = __osLogTrace;
      else
        v14 = v5;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        if (a3)
          v15 = *a3;
        else
          v15 = 0;
        *(_DWORD *)buf = 138412546;
        v24 = v13;
        v25 = 2112;
        v26 = v15;
        _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_DEFAULT, "BKDevice::lastMatchEventWithError: -> %@ %@\n", buf, 0x16u);
      }
      goto LABEL_16;
    }
    if (__osLog)
      v19 = __osLog;
    else
      v19 = v5;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v24 = "matchEvent";
      v25 = 2048;
      v26 = 0;
      v27 = 2080;
      v28 = &unk_1AF575226;
      v29 = 2080;
      v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v31 = 1024;
      v32 = 950;
      _os_log_impl(&dword_1AF533000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  if (__osLogTrace)
    v20 = __osLogTrace;
  else
    v20 = v5;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    if (a3)
      v21 = *a3;
    else
      v21 = 0;
    *(_DWORD *)buf = 138412546;
    v24 = 0;
    v25 = 2112;
    v26 = v21;
    _os_log_impl(&dword_1AF533000, v20, OS_LOG_TYPE_ERROR, "BKDevice::lastMatchEventWithError: -> %@ %@\n", buf, 0x16u);
  }
  v13 = 0;
LABEL_16:

  return v13;
}

- (BOOL)deviceHardwareState:(unint64_t *)a3 error:(id *)a4
{
  NSObject *v7;
  NSObject *v8;
  BiometricKitXPCClient *xpcClient;
  NSObject *v10;
  int v11;
  NSObject *v12;
  unint64_t v13;
  id v14;
  BOOL v15;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  unint64_t v21;
  id v22;
  unsigned int v23;
  uint8_t buf[4];
  _BYTE v25[28];
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v10 = v8;
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)v25 = a3;
    *(_WORD *)&v25[8] = 2048;
    *(_QWORD *)&v25[10] = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEFAULT, "BKDevice::deviceHardwareState: %p (_cid %lu)\n", buf, 0x16u);

  }
  v23 = 0;
  if (a3)
  {
    v11 = -[BiometricKitXPCClient getDeviceHardwareState:](self->_xpcClient, "getDeviceHardwareState:", &v23);
    if (!v11)
    {
      if (v23 < 3)
        *a3 = v23;
      if (__osLogTrace)
        v12 = __osLogTrace;
      else
        v12 = v7;
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        return 1;
      v13 = *a3;
      if (a4)
        v14 = *a4;
      else
        v14 = 0;
      *(_DWORD *)buf = 67109634;
      v15 = 1;
      *(_DWORD *)v25 = 1;
      *(_WORD *)&v25[4] = 2048;
      *(_QWORD *)&v25[6] = v13;
      *(_WORD *)&v25[14] = 2112;
      *(_QWORD *)&v25[16] = v14;
      _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_DEFAULT, "BKDevice::deviceHardwareState: -> %d %ld %@\n", buf, 0x1Cu);
      return v15;
    }
    v18 = (void *)v11;
    if (__osLog)
      v19 = __osLog;
    else
      v19 = v7;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v25 = "err == 0 ";
      *(_WORD *)&v25[8] = 2048;
      *(_QWORD *)&v25[10] = v18;
      *(_WORD *)&v25[18] = 2080;
      *(_QWORD *)&v25[20] = &unk_1AF575226;
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v28 = 1024;
      v29 = 973;
      _os_log_impl(&dword_1AF533000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setErrorWithOSStatus(v18, a4);
  }
  else
  {
    if (__osLog)
      v17 = __osLog;
    else
      v17 = v7;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v25 = "outState";
      *(_WORD *)&v25[8] = 2048;
      *(_QWORD *)&v25[10] = 0;
      *(_WORD *)&v25[18] = 2080;
      *(_QWORD *)&v25[20] = &unk_1AF575226;
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v28 = 1024;
      v29 = 970;
      _os_log_impl(&dword_1AF533000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setError((id)1, a4);
  }
  if (__osLogTrace)
    v20 = __osLogTrace;
  else
    v20 = v7;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    if (a3)
      v21 = *a3;
    else
      v21 = 0;
    if (a4)
      v22 = *a4;
    else
      v22 = 0;
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v25 = 0;
    *(_WORD *)&v25[4] = 2048;
    *(_QWORD *)&v25[6] = v21;
    *(_WORD *)&v25[14] = 2112;
    *(_QWORD *)&v25[16] = v22;
    _os_log_impl(&dword_1AF533000, v20, OS_LOG_TYPE_ERROR, "BKDevice::deviceHardwareState: -> %d %ld %@\n", buf, 0x1Cu);
  }
  return 0;
}

- (id)accessoryGroupsWithError:(id *)a3
{
  NSObject *v4;
  NSObject *v5;
  BiometricKitXPCClient *xpcClient;
  NSObject *v7;
  uint64_t v8;
  BiometricKitXPCClient *v9;
  int v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  BKAccessoryGroup *v19;
  void *v20;
  BKAccessoryGroup *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t v36[128];
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v5 = __osLogTrace;
  else
    v5 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v7 = v5;
    v8 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    *(_DWORD *)buf = 134217984;
    v38 = (const char *)v8;
    _os_log_impl(&dword_1AF533000, v7, OS_LOG_TYPE_DEFAULT, "BKDevice::accessoryGroupsWithError: (_cid %lu)\n", buf, 0xCu);

  }
  v9 = self->_xpcClient;
  v35 = 0;
  v10 = -[BiometricKitXPCClient listAccessories:](v9, "listAccessories:", &v35);
  v11 = v35;
  if (v10)
  {
    v24 = (void *)v10;
    if (__osLog)
      v25 = __osLog;
    else
      v25 = v4;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v38 = "err == 0 ";
      v39 = 2048;
      v40 = v24;
      v41 = 2080;
      v42 = &unk_1AF575226;
      v43 = 2080;
      v44 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v45 = 1024;
      v46 = 1003;
      _os_log_impl(&dword_1AF533000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setErrorWithOSStatus(v24, a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          v19 = [BKAccessoryGroup alloc];
          objc_msgSend(v18, "group");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[BKAccessoryGroup initWithServerAccessoryGroup:device:](v19, "initWithServerAccessoryGroup:device:", v20, self);
          objc_msgSend(v12, "addObject:", v21);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v15);
    }

    v4 = MEMORY[0x1E0C81028];
    if (v12)
    {
      if (__osLogTrace)
        v22 = __osLogTrace;
      else
        v22 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = a3;
        if (a3)
          v23 = *a3;
        *(_DWORD *)buf = 138412546;
        v38 = (const char *)v12;
        v39 = 2112;
        v40 = v23;
        _os_log_impl(&dword_1AF533000, v22, OS_LOG_TYPE_DEFAULT, "BKDevice::accessoryGroupsWithError: -> %@ %@\n", buf, 0x16u);
      }
      goto LABEL_36;
    }
  }
  if (__osLogTrace)
    v26 = __osLogTrace;
  else
    v26 = v4;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v27 = a3;
    if (a3)
      v27 = *a3;
    *(_DWORD *)buf = 138412546;
    v38 = 0;
    v39 = 2112;
    v40 = v27;
    _os_log_impl(&dword_1AF533000, v26, OS_LOG_TYPE_ERROR, "BKDevice::accessoryGroupsWithError: -> %@ %@\n", buf, 0x16u);
  }
  v12 = 0;
LABEL_36:
  objc_msgSend(v12, "allObjects");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)accessoriesWithError:(id *)a3
{
  NSObject *v4;
  NSObject *v5;
  BiometricKitXPCClient *xpcClient;
  NSObject *v7;
  uint64_t v8;
  BiometricKitXPCClient *v9;
  int v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  BKAccessory *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  uint8_t v33[128];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v5 = __osLogTrace;
  else
    v5 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v7 = v5;
    v8 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    *(_DWORD *)buf = 134217984;
    v35 = (const char *)v8;
    _os_log_impl(&dword_1AF533000, v7, OS_LOG_TYPE_DEFAULT, "BKDevice::accessoriesWithError: (_cid %lu)\n", buf, 0xCu);

  }
  v9 = self->_xpcClient;
  v32 = 0;
  v10 = -[BiometricKitXPCClient listAccessories:](v9, "listAccessories:", &v32);
  v11 = v32;
  if (v10)
  {
    v22 = (void *)v10;
    if (__osLog)
      v23 = __osLog;
    else
      v23 = v4;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v35 = "err == 0 ";
      v36 = 2048;
      v37 = v22;
      v38 = 2080;
      v39 = &unk_1AF575226;
      v40 = 2080;
      v41 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v42 = 1024;
      v43 = 1029;
      _os_log_impl(&dword_1AF533000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setErrorWithOSStatus(v22, a3);
  }
  else
  {
    v12 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v14 = v11;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          v19 = -[BKAccessory initWithServerAccessory:device:]([BKAccessory alloc], "initWithServerAccessory:device:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), self);
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v16);
    }

    v4 = v12;
    if (v13)
    {
      if (__osLogTrace)
        v20 = __osLogTrace;
      else
        v20 = v12;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = a3;
        if (a3)
          v21 = *a3;
        *(_DWORD *)buf = 138412546;
        v35 = (const char *)v13;
        v36 = 2112;
        v37 = v21;
        _os_log_impl(&dword_1AF533000, v20, OS_LOG_TYPE_DEFAULT, "BKDevice::accessoriesWithError: -> %@ %@\n", buf, 0x16u);
      }
      goto LABEL_36;
    }
  }
  if (__osLogTrace)
    v24 = __osLogTrace;
  else
    v24 = v4;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v25 = a3;
    if (a3)
      v25 = *a3;
    *(_DWORD *)buf = 138412546;
    v35 = 0;
    v36 = 2112;
    v37 = v25;
    _os_log_impl(&dword_1AF533000, v24, OS_LOG_TYPE_ERROR, "BKDevice::accessoriesWithError: -> %@ %@\n", buf, 0x16u);
  }
  v13 = 0;
LABEL_36:

  return v13;
}

- (id)connectedAccessoriesWithError:(id *)a3
{
  NSObject *v4;
  NSObject *v5;
  BiometricKitXPCClient *xpcClient;
  NSObject *v7;
  uint64_t v8;
  BiometricKitXPCClient *v9;
  int v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  BKAccessory *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  uint8_t v34[128];
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v5 = __osLogTrace;
  else
    v5 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v7 = v5;
    v8 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    *(_DWORD *)buf = 134217984;
    v36 = (const char *)v8;
    _os_log_impl(&dword_1AF533000, v7, OS_LOG_TYPE_DEFAULT, "BKDevice::connectedAccessoriesWithError: (_cid %lu)\n", buf, 0xCu);

  }
  v9 = self->_xpcClient;
  v33 = 0;
  v10 = -[BiometricKitXPCClient listAccessories:](v9, "listAccessories:", &v33);
  v11 = v33;
  if (v10)
  {
    v23 = (void *)v10;
    if (__osLog)
      v24 = __osLog;
    else
      v24 = v4;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v36 = "err == 0 ";
      v37 = 2048;
      v38 = v23;
      v39 = 2080;
      v40 = &unk_1AF575226;
      v41 = 2080;
      v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v43 = 1024;
      v44 = 1055;
      _os_log_impl(&dword_1AF533000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setErrorWithOSStatus(v23, a3);
  }
  else
  {
    v12 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v14 = v11;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v30 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if ((objc_msgSend(v19, "flags") & 2) != 0)
          {
            v20 = -[BKAccessory initWithServerAccessory:device:]([BKAccessory alloc], "initWithServerAccessory:device:", v19, self);
            objc_msgSend(v13, "addObject:", v20);

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v16);
    }

    v4 = v12;
    if (v13)
    {
      if (__osLogTrace)
        v21 = __osLogTrace;
      else
        v21 = v12;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = a3;
        if (a3)
          v22 = *a3;
        *(_DWORD *)buf = 138412546;
        v36 = (const char *)v13;
        v37 = 2112;
        v38 = v22;
        _os_log_impl(&dword_1AF533000, v21, OS_LOG_TYPE_DEFAULT, "BKDevice::connectedAccessoriesWithError: -> %@ %@\n", buf, 0x16u);
      }
      goto LABEL_38;
    }
  }
  if (__osLogTrace)
    v25 = __osLogTrace;
  else
    v25 = v4;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = a3;
    if (a3)
      v26 = *a3;
    *(_DWORD *)buf = 138412546;
    v36 = 0;
    v37 = 2112;
    v38 = v26;
    _os_log_impl(&dword_1AF533000, v25, OS_LOG_TYPE_ERROR, "BKDevice::connectedAccessoriesWithError: -> %@ %@\n", buf, 0x16u);
  }
  v13 = 0;
LABEL_38:

  return v13;
}

- (id)identitiesForUser:(unsigned int)a3 accessoryGroup:(id)a4 error:(id *)a5
{
  uint64_t v5;
  id v7;
  NSObject *v8;
  NSObject *v9;
  BiometricKitXPCClient *xpcClient;
  NSObject *v11;
  BiometricKitXPCClient *v12;
  void *v13;
  void *v14;
  void *v15;
  BKDevice *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  BKIdentity *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  _BYTE v42[28];
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  const __CFString *v47;
  _QWORD v48[4];

  v5 = *(_QWORD *)&a3;
  v48[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v9 = __osLogTrace;
  else
    v9 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v11 = v9;
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v42 = v5;
    *(_WORD *)&v42[4] = 2112;
    *(_QWORD *)&v42[6] = v7;
    *(_WORD *)&v42[14] = 2048;
    *(_QWORD *)&v42[16] = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v11, OS_LOG_TYPE_DEFAULT, "BKDevice::identitiesForUser:accessoryGroup: %d %@ (_cid %lu)\n", buf, 0x1Cu);

  }
  v12 = self->_xpcClient;
  v47 = CFSTR("BKFilterUserID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BiometricKitXPCClient identities:](v12, "identities:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = self;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v34 = v15;
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v37 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v22, "accessory");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "group");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v7, "isEqualToServerAccessoryGroup:", v24);

          if (v25)
          {
            v26 = -[BKIdentity initWithServerIdentity:device:]([BKIdentity alloc], "initWithServerIdentity:device:", v22, v16);
            objc_msgSend(v35, "addObject:", v26);

          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v19);
    }

    v15 = v34;
    v8 = MEMORY[0x1E0C81028];
    if (v35)
    {
      if (__osLogTrace)
        v27 = __osLogTrace;
      else
        v27 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = a5;
        if (a5)
          v28 = *a5;
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v42 = v35;
        *(_WORD *)&v42[8] = 2112;
        *(_QWORD *)&v42[10] = v28;
        _os_log_impl(&dword_1AF533000, v27, OS_LOG_TYPE_DEFAULT, "BKDevice::identitiesForUser:accessoryGroup: -> %@ %@\n", buf, 0x16u);
      }
      goto LABEL_38;
    }
  }
  else
  {
    if (__osLog)
      v29 = __osLog;
    else
      v29 = v8;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v42 = "serverIdentities";
      *(_WORD *)&v42[8] = 2048;
      *(_QWORD *)&v42[10] = 0;
      *(_WORD *)&v42[18] = 2080;
      *(_QWORD *)&v42[20] = &unk_1AF575226;
      v43 = 2080;
      v44 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v45 = 1024;
      v46 = 1082;
      _os_log_impl(&dword_1AF533000, v29, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setError((id)1, a5);
  }
  if (__osLogTrace)
    v30 = __osLogTrace;
  else
    v30 = v8;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    v31 = a5;
    if (a5)
      v31 = *a5;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v42 = 0;
    *(_WORD *)&v42[8] = 2112;
    *(_QWORD *)&v42[10] = v31;
    _os_log_impl(&dword_1AF533000, v30, OS_LOG_TYPE_ERROR, "BKDevice::identitiesForUser:accessoryGroup: -> %@ %@\n", buf, 0x16u);
  }
  v35 = 0;
LABEL_38:

  return v35;
}

- (id)freeIdentityCountForUser:(unsigned int)a3 accessoryGroup:(id)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  NSObject *v9;
  NSObject *v10;
  BiometricKitXPCClient *xpcClient;
  NSObject *v12;
  BiometricKitXPCClient *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  uint64_t v28;
  uint8_t buf[4];
  _BYTE v30[18];
  __int16 v31;
  void *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v6 = *(_QWORD *)&a3;
  v37 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v12 = v10;
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v30 = v6;
    *(_WORD *)&v30[4] = 2048;
    *(_QWORD *)&v30[6] = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_DEFAULT, "BKDevice::freeIdentityCountForUser:accessoryGroup: %d (_cid %lu)\n", buf, 0x12u);

  }
  v28 = 0;
  v13 = self->_xpcClient;
  objc_msgSend(v8, "serverAccessoryGroup");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[BiometricKitXPCClient getFreeIdentityCount:forUser:accessoryGroup:](v13, "getFreeIdentityCount:forUser:accessoryGroup:", &v28, v6, v14);

  if (v15)
  {
    if (__osLog)
      v22 = __osLog;
    else
      v22 = v9;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v30 = "err == 0 ";
      *(_WORD *)&v30[8] = 2048;
      *(_QWORD *)&v30[10] = v15;
      v31 = 2080;
      v32 = &unk_1AF575226;
      v33 = 2080;
      v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v35 = 1024;
      v36 = 1110;
      _os_log_impl(&dword_1AF533000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setErrorWithOSStatus((id)v15, a5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v28);
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      if (__osLogTrace)
        v18 = __osLogTrace;
      else
        v18 = v9;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = v18;
        v20 = objc_msgSend(v17, "integerValue");
        if (a5)
          v21 = *a5;
        else
          v21 = 0;
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)v30 = v20;
        *(_WORD *)&v30[8] = 2112;
        *(_QWORD *)&v30[10] = v21;
        _os_log_impl(&dword_1AF533000, v19, OS_LOG_TYPE_DEFAULT, "BKDevice::freeIdentityCountForUser:accessoryGroup: -> %ld %@\n", buf, 0x16u);

      }
      goto LABEL_31;
    }
  }
  if (__osLogTrace)
    v23 = __osLogTrace;
  else
    v23 = v9;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v24 = v23;
    v25 = objc_msgSend(0, "integerValue");
    if (a5)
      v26 = *a5;
    else
      v26 = 0;
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)v30 = v25;
    *(_WORD *)&v30[8] = 2112;
    *(_QWORD *)&v30[10] = v26;
    _os_log_impl(&dword_1AF533000, v24, OS_LOG_TYPE_ERROR, "BKDevice::freeIdentityCountForUser:accessoryGroup: -> %ld %@\n", buf, 0x16u);

  }
  v17 = 0;
LABEL_31:

  return v17;
}

- (void)statusMessage:(unsigned int)a3 details:(id)a4 client:(unint64_t)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v6 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if ((_DWORD)v6 == 500)
  {
    -[BKDevice delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      +[BKMatchEvent matchEventWithDictionary:device:error:](BKMatchEvent, "matchEventWithDictionary:device:error:", v8, self, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        if (__osLog)
          v12 = __osLog;
        else
          v12 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = v12;
          -[BKDevice delegate](self, "delegate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[BKDevice delegate](self, "delegate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218754;
          v20 = v14;
          v21 = 2112;
          v22 = v15;
          v23 = 1024;
          v24 = objc_msgSend(v11, "result");
          v25 = 2048;
          v26 = objc_msgSend(v11, "timeStamp");
          _os_log_impl(&dword_1AF533000, v13, OS_LOG_TYPE_DEFAULT, "BKDevice::statusMessage: %p(%@) matchEventOccurred: result=%u, timeStamp=%llu\n", buf, 0x26u);

        }
        -[BKDevice dispatchQueue](self, "dispatchQueue");
        v16 = objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __41__BKDevice_statusMessage_details_client___block_invoke;
        v17[3] = &unk_1E5F84358;
        v17[4] = self;
        v18 = v11;
        dispatch_async(v16, v17);

      }
    }
  }
  else
  {
    -[BKDevice statusMessage:client:](self, "statusMessage:client:", v6, a5);
  }

}

void __41__BKDevice_statusMessage_details_client___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device:matchEventOccurred:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (BOOL)isDelegate
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = WeakRetained != 0;

  return v3;
}

+ (BOOL)lockoutState:(int64_t *)a3 fromDeviceLockoutState:(int64_t)a4 error:(id *)a5
{
  int64_t v6;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if ((a4 & 0x40) != 0)
    {
      v6 = 6;
    }
    else if ((a4 & 0x100) != 0)
    {
      v6 = 7;
    }
    else if ((a4 & 0x10) != 0)
    {
      v6 = 2;
    }
    else if ((a4 & 2) != 0)
    {
      v6 = 3;
    }
    else if ((a4 & 4) != 0)
    {
      v6 = 4;
    }
    else if ((a4 & 8) != 0)
    {
      v6 = 1;
    }
    else if ((a4 & 0x800) != 0)
    {
      v6 = 8;
    }
    else
    {
      v6 = 5;
    }
    *a3 = v6;
  }
  else
  {
    if (__osLog)
      v9 = __osLog;
    else
      v9 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136316162;
      v11 = "state";
      v12 = 2048;
      v13 = 0;
      v14 = 2080;
      v15 = &unk_1AF575226;
      v16 = 2080;
      v17 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v18 = 1024;
      v19 = 1244;
      _os_log_impl(&dword_1AF533000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v10, 0x30u);
    }
    setError((id)1, a5);
  }
  return a3 != 0;
}

+ (BOOL)extendedLockoutState:(int64_t *)a3 fromDeviceLockoutState:(int64_t)a4 error:(id *)a5
{
  unint64_t v6;
  uint64_t v7;
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

  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = a4 & 6 | ((unint64_t)a4 >> 2) & 0x40 | ((unint64_t)a4 >> 3) & 8 | ((unint64_t)a4 >> 4) & 1;
    *a3 = v6;
    v7 = v6;
    if ((a4 & 8) == 0)
    {
      v7 = v6 | 0x10;
      *a3 = v6 | 0x10;
      if ((a4 & 0x800) != 0)
      {
        v7 = v6 | 0x90;
        *a3 = v6 | 0x90;
      }
    }
    if ((a4 & 0x200) == 0)
      *a3 = v7 | 0x20;
  }
  else
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 136316162;
      v12 = "state";
      v13 = 2048;
      v14 = 0;
      v15 = 2080;
      v16 = &unk_1AF575226;
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      v19 = 1024;
      v20 = 1293;
      _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v11, 0x30u);
    }
    setError((id)1, a5);
  }
  return a3 != 0;
}

+ (BOOL)biometryAvailabilityInfo:(int64_t *)a3 fromDeviceInfo:(int64_t)a4 error:(id *)a5
{
  BOOL result;
  int64_t v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    switch(a4)
    {
      case 3:
        v7 = 3;
        break;
      case 2:
        v7 = 2;
        break;
      case 1:
        result = 1;
        *a3 = 1;
        return result;
      default:
        if (__osLog)
          v8 = __osLog;
        else
          v8 = MEMORY[0x1E0C81028];
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          goto LABEL_15;
        v9 = 136316162;
        v10 = "0";
        v11 = 2048;
        v12 = 0;
        v13 = 2080;
        v14 = &unk_1AF575226;
        v15 = 2080;
        v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
        v17 = 1024;
        v18 = 1349;
        goto LABEL_14;
    }
    *a3 = v7;
    return 1;
  }
  if (__osLog)
    v8 = __osLog;
  else
    v8 = MEMORY[0x1E0C81028];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  v9 = 136316162;
  v10 = "info";
  v11 = 2048;
  v12 = 0;
  v13 = 2080;
  v14 = &unk_1AF575226;
  v15 = 2080;
  v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
  v17 = 1024;
  v18 = 1342;
LABEL_14:
  _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
LABEL_15:
  setError((id)1, a5);
  return 0;
}

- (BKDeviceDelegate)delegate
{
  return (BKDeviceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BKDeviceDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
}

@end
