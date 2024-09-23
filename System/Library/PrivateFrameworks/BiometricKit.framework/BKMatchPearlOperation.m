@implementation BKMatchPearlOperation

- (id)optionsDictionaryWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  BKIdentity *preAugmentationCheckIdentity;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v13;
  NSObject *v14;
  objc_super v15;
  uint8_t buf[4];
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
  v15.receiver = self;
  v15.super_class = (Class)BKMatchPearlOperation;
  -[BKMatchOperation optionsDictionaryWithError:](&v15, sel_optionsDictionaryWithError_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v17 = "superOptions";
      v18 = 2048;
      v19 = 0;
      v20 = 2080;
      v21 = &unk_1AF575226;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      v24 = 1024;
      v25 = 1037;
      _os_log_impl(&dword_1AF533000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v7 = 0;
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (self->_longTimeout)
    objc_msgSend(v6, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("BKOptionMatchLongTimeout"));
  if (self->_shouldAutoRetry)
    objc_msgSend(v7, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("BKOptionMatchAutoRetry"));
  if (self->_preAugmentationCheck)
    objc_msgSend(v7, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("BKOptionMatchPreAugmentationCheck"));
  preAugmentationCheckIdentity = self->_preAugmentationCheckIdentity;
  if (!preAugmentationCheckIdentity)
    goto LABEL_11;
  -[BKIdentity serverIdentity](preAugmentationCheckIdentity, "serverIdentity");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v17 = "serverIdentity";
      v18 = 2048;
      v19 = 0;
      v20 = 2080;
      v21 = &unk_1AF575226;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      v24 = 1024;
      v25 = 1058;
      _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setError((id)1, a3);
LABEL_27:
    v11 = 0;
    goto LABEL_14;
  }
  v10 = (void *)v9;
  objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("BKOptionMatchPreAugmentationCheckIdentity"));

LABEL_11:
  if (self->_fullFaceOnly)
    objc_msgSend(v7, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("BKOptionMatchFullFaceOnly"));
  v7 = v7;
  v11 = v7;
LABEL_14:

  return v11;
}

- (BOOL)startNewMatchAttemptWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  BiometricKitXPCClient *xpcClient;
  NSObject *v8;
  BKMatchPearlOperation *v9;
  void *v10;
  NSObject *v11;
  id v12;
  BOOL v13;
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
    xpcClient = self->super.super._xpcClient;
    v8 = v6;
    v18 = 134217984;
    *(_QWORD *)v19 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_DEFAULT, "BKMatchPearlOperation::startNewMatchAttemptWithError (_cid %lu)\n", (uint8_t *)&v18, 0xCu);

  }
  v9 = self;
  objc_sync_enter(v9);
  if (-[BKOperation state](v9, "state") == 5)
  {
    v10 = (void *)-[BiometricKitXPCClient startNewMatchAttempt](v9->super.super._xpcClient, "startNewMatchAttempt");
    if (!(_DWORD)v10)
    {
      BKLogEvent(0x40001u);
      objc_sync_exit(v9);

      if (__osLogTrace)
        v11 = __osLogTrace;
      else
        v11 = v5;
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        return 1;
      if (a3)
        v12 = *a3;
      else
        v12 = 0;
      v18 = 67109634;
      v13 = 1;
      *(_DWORD *)v19 = 1;
      *(_WORD *)&v19[4] = 1024;
      *(_DWORD *)&v19[6] = 0;
      *(_WORD *)v20 = 2112;
      *(_QWORD *)&v20[2] = v12;
      _os_log_impl(&dword_1AF533000, v11, OS_LOG_TYPE_DEFAULT, "BKMatchPearlOperation::startNewMatchAttemptWithError -> %d(%{errno}d) %@\n", (uint8_t *)&v18, 0x18u);
      return v13;
    }
    if (__osLog)
      v15 = __osLog;
    else
      v15 = v5;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = 136316162;
      *(_QWORD *)v19 = "err == 0 ";
      *(_WORD *)&v19[8] = 2048;
      *(_QWORD *)v20 = (int)v10;
      *(_WORD *)&v20[8] = 2080;
      v21 = &unk_1AF575226;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      v24 = 1024;
      v25 = 1093;
      _os_log_impl(&dword_1AF533000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
    setErrorWithOSStatus(v10, a3);
  }
  else
  {
    setError((id)1, a3);
    LODWORD(v10) = 0;
  }
  objc_sync_exit(v9);

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
    *(_DWORD *)&v19[6] = (_DWORD)v10;
    *(_WORD *)v20 = 2112;
    *(_QWORD *)&v20[2] = v17;
    _os_log_impl(&dword_1AF533000, v16, OS_LOG_TYPE_ERROR, "BKMatchPearlOperation::startNewMatchAttemptWithError -> %d(%{errno}d) %@\n", (uint8_t *)&v18, 0x18u);
  }
  return 0;
}

- (BOOL)enableAutoRetry:(BOOL)a3 error:(id *)a4
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
  v7 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super.super._xpcClient;
    v10 = v8;
    v20 = 67109376;
    *(_DWORD *)v21 = v5;
    *(_WORD *)&v21[4] = 2048;
    *(_QWORD *)&v21[6] = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEFAULT, "BKMatchPearlOperation::enableAutoRetry: %u (_cid %lu)\n", (uint8_t *)&v20, 0x12u);

  }
  v11 = (void *)-[BiometricKitXPCClient enableMatchAutoRetry:](self->super.super._xpcClient, "enableMatchAutoRetry:", v5);
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
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      v25 = 1024;
      v26 = 1118;
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
      _os_log_impl(&dword_1AF533000, v14, v15, "BKMatchPearlOperation::enableAutoRetry -> %d(%{errno}d) %@\n", (uint8_t *)&v20, 0x18u);
    }
  }
  return (_DWORD)v11 == 0;
}

- (BOOL)pauseFaceDetectTimer:(BOOL)a3 error:(id *)a4
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
  v7 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super.super._xpcClient;
    v10 = v8;
    v20 = 67109376;
    *(_DWORD *)v21 = v5;
    *(_WORD *)&v21[4] = 2048;
    *(_QWORD *)&v21[6] = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEFAULT, "BKMatchPearlOperation::pauseFaceDetectTimer: %u (_cid %lu)\n", (uint8_t *)&v20, 0x12u);

  }
  v11 = (void *)-[BiometricKitXPCClient pauseFaceDetectTimer:](self->super.super._xpcClient, "pauseFaceDetectTimer:", v5);
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
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      v25 = 1024;
      v26 = 1141;
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
      _os_log_impl(&dword_1AF533000, v14, v15, "BKMatchPearlOperation::pauseFaceDetectTimer -> %d(%{errno}d) %@\n", (uint8_t *)&v20, 0x18u);
    }
  }
  return (_DWORD)v11 == 0;
}

- (id)matchResultInfoWithServerIdentity:(id)a3 details:(id)a4
{
  id v6;
  id v7;
  BKMatchPearlResultInfo *v8;
  void *v9;
  BKMatchPearlResultInfo *v10;

  v6 = a4;
  v7 = a3;
  v8 = [BKMatchPearlResultInfo alloc];
  -[BKOperation device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[BKMatchPearlResultInfo initWithServerIdentity:details:device:](v8, "initWithServerIdentity:details:device:", v7, v6, v9);

  return v10;
}

- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4
{
  -[BKMatchPearlOperation statusMessage:details:client:](self, "statusMessage:details:client:", *(_QWORD *)&a3, 0, a4);
}

- (void)statusMessage:(unsigned int)a3 details:(id)a4 client:(unint64_t)a5
{
  uint64_t v6;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BKMatchPearlOperation *v16;
  uint64_t v17;
  void *v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  char v26;
  BKFaceOcclusionInfo *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  NSObject *v33;
  BKFaceOcclusionInfo *v34;
  void *v35;
  void *v36;
  char v37;
  BKFaceWUPoseEligibilityInfo *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  NSObject *v44;
  void *v45;
  char v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  char v51;
  uint64_t v52;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  NSObject *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  NSObject *v67;
  NSObject *v68;
  os_log_t log;
  NSObject *loga;
  objc_super v71;
  _QWORD v72[6];
  _QWORD block[5];
  id v74;
  int v75;
  _QWORD v76[6];
  _QWORD v77[5];
  BKFaceWUPoseEligibilityInfo *v78;
  _QWORD v79[5];
  BKFaceOcclusionInfo *v80;
  _QWORD v81[6];
  uint8_t buf[4];
  _BYTE v83[18];
  __int16 v84;
  uint64_t v85;
  uint64_t v86;

  v6 = *(_QWORD *)&a3;
  v86 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  kdebug_trace();
  v9 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v83 = v6;
    *(_WORD *)&v83[4] = 2112;
    *(_QWORD *)&v83[6] = v8;
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEFAULT, "BKMatchPearlOperation::statusMessage: %u, details = %@\n", buf, 0x12u);
  }
  BKLogCode(1, v6);
  switch((int)v6)
  {
    case 1067:
      -[BKOperation delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        if (v8)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BKStatusDetailFaceDetectFeedback"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
            v15 = __faceDetectFeedback(objc_msgSend(v13, "integerValue"));
          else
            v15 = 1;

        }
        else
        {
          v15 = 1;
        }
        if (__osLog)
          v58 = __osLog;
        else
          v58 = v9;
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          v59 = v58;
          -[BKOperation delegate](self, "delegate");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          -[BKOperation delegate](self, "delegate");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)v83 = v60;
          *(_WORD *)&v83[8] = 2112;
          *(_QWORD *)&v83[10] = v61;
          v84 = 2048;
          v85 = v15;
          _os_log_impl(&dword_1AF533000, v59, OS_LOG_TYPE_DEFAULT, "BKMatchPearlOperation::statusMessage: %p(%@) providedFeedback: %ld\n", buf, 0x20u);

        }
        -[BKOperation dispatchQueue](self, "dispatchQueue");
        v62 = objc_claimAutoreleasedReturnValue();
        v81[0] = MEMORY[0x1E0C809B0];
        v81[1] = 3221225472;
        v81[2] = __54__BKMatchPearlOperation_statusMessage_details_client___block_invoke;
        v81[3] = &unk_1E5F83C10;
        v81[4] = self;
        v81[5] = v15;
        dispatch_async(v62, v81);

      }
      goto LABEL_85;
    case 1068:
    case 1069:
    case 1070:
    case 1073:
    case 1074:
      goto LABEL_14;
    case 1071:
      -[BKOperation delegate](self, "delegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_opt_respondsToSelector();

      if ((v26 & 1) == 0)
        goto LABEL_85;
      v27 = -[BKFaceOcclusionInfo initWithDictionary:]([BKFaceOcclusionInfo alloc], "initWithDictionary:", v8);
      if (__osLog)
        v28 = __osLog;
      else
        v28 = v9;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = v28;
        -[BKOperation delegate](self, "delegate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[BKOperation delegate](self, "delegate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = -[BKFaceOcclusionInfo hasFaceOcclusion](v27, "hasFaceOcclusion");
        *(_DWORD *)buf = 134218498;
        *(_QWORD *)v83 = v30;
        *(_WORD *)&v83[8] = 2112;
        *(_QWORD *)&v83[10] = v31;
        v84 = 1024;
        LODWORD(v85) = v32;
        _os_log_impl(&dword_1AF533000, v29, OS_LOG_TYPE_DEFAULT, "BKMatchPearlOperation::statusMessage: %p(%@) providedFaceOcclusionInfo: hasFaceOcclusion=%d\n", buf, 0x1Cu);

      }
      -[BKOperation dispatchQueue](self, "dispatchQueue");
      v33 = objc_claimAutoreleasedReturnValue();
      v79[0] = MEMORY[0x1E0C809B0];
      v79[1] = 3221225472;
      v79[2] = __54__BKMatchPearlOperation_statusMessage_details_client___block_invoke_383;
      v79[3] = &unk_1E5F84358;
      v79[4] = self;
      v80 = v27;
      v34 = v27;
      dispatch_async(v33, v79);

      v35 = v80;
      goto LABEL_36;
    case 1072:
      -[BKOperation delegate](self, "delegate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_opt_respondsToSelector();

      if ((v37 & 1) == 0)
        goto LABEL_85;
      v38 = -[BKFaceWUPoseEligibilityInfo initWithDictionary:]([BKFaceWUPoseEligibilityInfo alloc], "initWithDictionary:", v8);
      if (__osLog)
        v39 = __osLog;
      else
        v39 = v9;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = v39;
        -[BKOperation delegate](self, "delegate");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[BKOperation delegate](self, "delegate");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = -[BKFaceWUPoseEligibilityInfo isEligible](v38, "isEligible");
        *(_DWORD *)buf = 134218498;
        *(_QWORD *)v83 = v41;
        *(_WORD *)&v83[8] = 2112;
        *(_QWORD *)&v83[10] = v42;
        v84 = 1024;
        LODWORD(v85) = v43;
        _os_log_impl(&dword_1AF533000, v40, OS_LOG_TYPE_DEFAULT, "BKMatchPearlOperation::statusMessage: %p(%@) providedFaceWUPoseEligibilityInfo: isEligible=%d\n", buf, 0x1Cu);

      }
      -[BKOperation dispatchQueue](self, "dispatchQueue");
      v44 = objc_claimAutoreleasedReturnValue();
      v77[0] = MEMORY[0x1E0C809B0];
      v77[1] = 3221225472;
      v77[2] = __54__BKMatchPearlOperation_statusMessage_details_client___block_invoke_387;
      v77[3] = &unk_1E5F84358;
      v77[4] = self;
      v78 = v38;
      v34 = v38;
      dispatch_async(v44, v77);

      v35 = v78;
LABEL_36:

      goto LABEL_85;
    case 1075:
      -[BKOperation delegate](self, "delegate");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_opt_respondsToSelector();

      if ((v46 & 1) != 0)
      {
        if (v8)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BKStatusDetailPSRequestReason"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "integerValue");
          if ((unint64_t)(v48 - 1) >= 5)
            v49 = 0;
          else
            v49 = v48;

        }
        else
        {
          v49 = 0;
        }
        if (__osLog)
          v53 = __osLog;
        else
          v53 = v9;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          v54 = v53;
          -[BKOperation delegate](self, "delegate");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[BKOperation delegate](self, "delegate");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)v83 = v55;
          *(_WORD *)&v83[8] = 2112;
          *(_QWORD *)&v83[10] = v56;
          v84 = 2048;
          v85 = v49;
          _os_log_impl(&dword_1AF533000, v54, OS_LOG_TYPE_DEFAULT, "BKMatchPearlOperation::statusMessage: %p(%@) requestedPasscodeShortcutWithReason: reason=%ld\n", buf, 0x20u);

        }
        -[BKOperation dispatchQueue](self, "dispatchQueue");
        v57 = objc_claimAutoreleasedReturnValue();
        v76[0] = MEMORY[0x1E0C809B0];
        v76[1] = 3221225472;
        v76[2] = __54__BKMatchPearlOperation_statusMessage_details_client___block_invoke_392;
        v76[3] = &unk_1E5F83C10;
        v76[4] = self;
        v76[5] = v49;
        dispatch_async(v57, v76);

      }
      goto LABEL_85;
    default:
      if ((_DWORD)v6 == 1053)
      {
        v16 = self;
        v17 = 2;
        goto LABEL_44;
      }
      if ((_DWORD)v6 == 1052)
      {
        v16 = self;
        v17 = 5;
LABEL_44:
        -[BKOperation changeState:](v16, "changeState:", v17);
        goto LABEL_85;
      }
LABEL_14:
      if ((v6 - 63) > 1)
      {
        if ((v6 - 1059) <= 0x17 && ((1 << (v6 - 35)) & 0xA80453) != 0)
        {
          -[BKOperation delegate](self, "delegate");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_opt_respondsToSelector();

          if ((v51 & 1) != 0)
          {
            v52 = 1;
            if ((int)v6 > 1077)
            {
              switch((_DWORD)v6)
              {
                case 0x436:
                  v52 = 9;
                  break;
                case 0x438:
                  v52 = 10;
                  break;
                case 0x43A:
                  v52 = 11;
                  break;
              }
            }
            else
            {
              switch((int)v6)
              {
                case 1059:
                  v52 = 3;
                  break;
                case 1060:
                  v52 = 4;
                  break;
                case 1063:
                  v52 = 5;
                  break;
                case 1065:
                  v52 = 6;
                  break;
                case 1069:
                  v52 = 7;
                  break;
                default:
                  break;
              }
            }
            if (__osLog)
              v63 = __osLog;
            else
              v63 = v9;
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
            {
              loga = v63;
              -[BKOperation delegate](self, "delegate");
              v64 = v52;
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              -[BKOperation delegate](self, "delegate");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218498;
              *(_QWORD *)v83 = v65;
              *(_WORD *)&v83[8] = 2112;
              *(_QWORD *)&v83[10] = v66;
              v84 = 2048;
              v85 = v64;
              _os_log_impl(&dword_1AF533000, loga, OS_LOG_TYPE_DEFAULT, "BKMatchPearlOperation::statusMessage: %p(%@) failedWithReason: %ld\n", buf, 0x20u);

              v52 = v64;
            }
            -[BKOperation dispatchQueue](self, "dispatchQueue");
            v67 = objc_claimAutoreleasedReturnValue();
            v72[0] = MEMORY[0x1E0C809B0];
            v72[1] = 3221225472;
            v72[2] = __54__BKMatchPearlOperation_statusMessage_details_client___block_invoke_396;
            v72[3] = &unk_1E5F83C10;
            v72[4] = self;
            v72[5] = v52;
            dispatch_async(v67, v72);

          }
          -[BKOperation operationEndsWithReason:](self, "operationEndsWithReason:", 3);
        }
      }
      else
      {
        -[BKOperation delegate](self, "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_opt_respondsToSelector();

        if ((v19 & 1) != 0)
        {
          if (__osLog)
            v20 = __osLog;
          else
            v20 = v9;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(log) = v6 == 63;
            v21 = v20;
            -[BKOperation delegate](self, "delegate");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[BKOperation delegate](self, "delegate");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218498;
            *(_QWORD *)v83 = v22;
            *(_WORD *)&v83[8] = 2112;
            *(_QWORD *)&v83[10] = v23;
            v84 = 1024;
            LODWORD(v85) = (_DWORD)log;
            _os_log_impl(&dword_1AF533000, v21, OS_LOG_TYPE_DEFAULT, "BKMatchPearlOperation::statusMessage: %p(%@) faceDetectStateChanged: %d\n", buf, 0x1Cu);

          }
          -[BKOperation dispatchQueue](self, "dispatchQueue", log);
          v24 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __54__BKMatchPearlOperation_statusMessage_details_client___block_invoke_393;
          block[3] = &unk_1E5F84578;
          block[4] = self;
          v75 = v6;
          v74 = v8;
          dispatch_async(v24, block);

        }
      }
      v71.receiver = self;
      v71.super_class = (Class)BKMatchPearlOperation;
      -[BKMatchOperation statusMessage:client:](&v71, sel_statusMessage_client_, v6, a5);
LABEL_85:
      if (__osLogTrace)
        v68 = __osLogTrace;
      else
        v68 = v9;
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AF533000, v68, OS_LOG_TYPE_DEFAULT, "BKMatchPearlOperation::statusMessage: -> void\n", buf, 2u);
      }
      kdebug_trace();

      return;
  }
}

void __54__BKMatchPearlOperation_statusMessage_details_client___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "matchOperation:providedFeedback:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __54__BKMatchPearlOperation_statusMessage_details_client___block_invoke_383(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "matchOperation:providedFaceOcclusionInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __54__BKMatchPearlOperation_statusMessage_details_client___block_invoke_387(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "matchOperation:providedFaceWUPoseEligibilityInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __54__BKMatchPearlOperation_statusMessage_details_client___block_invoke_392(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "matchOperation:requestedPasscodeShortcutWithReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __54__BKMatchPearlOperation_statusMessage_details_client___block_invoke_393(uint64_t a1)
{
  uint64_t v2;
  BKFaceDetectStateInfo *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = -[BKFaceDetectStateInfo initWithPresenceState:details:]([BKFaceDetectStateInfo alloc], "initWithPresenceState:details:", *(_DWORD *)(a1 + 48) == 63, *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "operation:faceDetectStateChanged:", v2, v3);

}

void __54__BKMatchPearlOperation_statusMessage_details_client___block_invoke_396(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "matchOperation:failedWithReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (BOOL)longTimeout
{
  return self->_longTimeout;
}

- (void)setLongTimeout:(BOOL)a3
{
  self->_longTimeout = a3;
}

- (BOOL)shouldAutoRetry
{
  return self->_shouldAutoRetry;
}

- (void)setShouldAutoRetry:(BOOL)a3
{
  self->_shouldAutoRetry = a3;
}

- (BOOL)preAugmentationCheck
{
  return self->_preAugmentationCheck;
}

- (void)setPreAugmentationCheck:(BOOL)a3
{
  self->_preAugmentationCheck = a3;
}

- (BKIdentity)preAugmentationCheckIdentity
{
  return self->_preAugmentationCheckIdentity;
}

- (void)setPreAugmentationCheckIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_preAugmentationCheckIdentity, a3);
}

- (BOOL)fullFaceOnly
{
  return self->_fullFaceOnly;
}

- (void)setFullFaceOnly:(BOOL)a3
{
  self->_fullFaceOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preAugmentationCheckIdentity, 0);
}

@end
