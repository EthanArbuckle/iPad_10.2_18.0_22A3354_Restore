@implementation BKEnrollTouchIDOperation

- (BKEnrollTouchIDOperation)initWithDevice:(id)a3
{
  BKEnrollTouchIDOperation *v3;
  BKEnrollTouchIDOperation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKEnrollTouchIDOperation;
  v3 = -[BKEnrollOperation initWithDevice:](&v6, sel_initWithDevice_, a3);
  v4 = v3;
  if (v3)
    ComponentSetInit(&v3->_compSet.count);
  return v4;
}

- (void)dealloc
{
  double v3;
  objc_super v4;

  v3 = ComponentSetRelease(&self->_compSet.count);
  v4.receiver = self;
  v4.super_class = (Class)BKEnrollTouchIDOperation;
  -[BKOperation dealloc](&v4, sel_dealloc, v3);
}

- (BOOL)startWithError:(id *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKEnrollTouchIDOperation;
  return -[BKOperation startWithError:](&v4, sel_startWithError_, a3);
}

- (id)createEnrollProgressInfo:(unsigned int)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v9;
  int v10;
  _BYTE v11[9696];
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  _OWORD v22[191];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  memset(v22, 0, 512);
  memset(&v11[480], 0, 32);
  -[BiometricKitXPCClient pullAlignmentData](self->super.super._xpcClient, "pullAlignmentData", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    if (__osLog)
      v9 = __osLog;
    else
      v9 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    v12 = 136316162;
    v13 = "alignmentData";
    v14 = 2048;
    v15 = 0;
    v16 = 2080;
    v17 = &unk_1AF575226;
    v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDeviceTouchID.m";
    v20 = 1024;
    v21 = 110;
    goto LABEL_26;
  }
  objc_msgSend(v4, "getBytes:length:", v22, 3060);
  if (SWORD3(v22[0]) >= 300)
  {
    if (__osLog)
      v9 = __osLog;
    else
      v9 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    v12 = 136316162;
    v13 = "topology.nodeAdded < 300";
    v14 = 2048;
    v15 = 0;
    v16 = 2080;
    v17 = &unk_1AF575226;
    v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDeviceTouchID.m";
    v20 = 1024;
    v21 = 114;
    goto LABEL_26;
  }
  v6 = ComponentSetUpdate();
  if (v6)
  {
    v10 = v6;
    if (__osLog)
      v9 = __osLog;
    else
      v9 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    v12 = 136316162;
    v13 = "err == 0 ";
    v14 = 2048;
    v15 = v10;
    v16 = 2080;
    v17 = &unk_1AF575226;
    v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDeviceTouchID.m";
    v20 = 1024;
    v21 = 117;
    goto LABEL_26;
  }
  GenerateEnrollProgressInfo((uint64_t)v11, a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (__osLog)
      v9 = __osLog;
    else
      v9 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    v12 = 136316162;
    v13 = "info != ((void *)0)";
    v14 = 2048;
    v15 = 0;
    v16 = 2080;
    v17 = &unk_1AF575226;
    v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDeviceTouchID.m";
    v20 = 1024;
    v21 = 122;
LABEL_26:
    _os_log_impl(&dword_1AF533000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
LABEL_27:
    v7 = 0;
  }

  return v7;
}

- (void)enrollResult:(id)a3 details:(id)a4 client:(unint64_t)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKEnrollTouchIDOperation;
  -[BKEnrollOperation enrollResult:details:client:](&v5, sel_enrollResult_details_client_, a3, a4, a5);
}

- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4
{
  uint64_t v5;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  objc_super v23;
  _QWORD v24[6];
  _QWORD block[5];
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v5 = *(_QWORD *)&a3;
  v33 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v7 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v28) = v5;
    _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_DEFAULT, "BKEnrollTouchIDOperation::statusMessage: %u\n", buf, 8u);
  }
  if ((v5 - 100) > 0xFF)
  {
    v13 = __statusToFingerprintCaptureError(v5);
    if (v13)
    {
      v14 = v13;
      -[BKOperation delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        if (__osLog)
          v17 = __osLog;
        else
          v17 = v7;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = v17;
          -[BKOperation delegate](self, "delegate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[BKOperation delegate](self, "delegate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v28 = v19;
          v29 = 2112;
          v30 = v20;
          v31 = 2048;
          v32 = v14;
          _os_log_impl(&dword_1AF533000, v18, OS_LOG_TYPE_DEFAULT, "BKEnrollTouchIDOperation::statusMessage: %p(%@) encounteredCaptureError: %ld\n", buf, 0x20u);

        }
        -[BKOperation dispatchQueue](self, "dispatchQueue");
        v21 = objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __49__BKEnrollTouchIDOperation_statusMessage_client___block_invoke_17;
        v24[3] = &unk_1E5F83C10;
        v24[4] = self;
        v24[5] = v14;
        dispatch_async(v21, v24);

      }
    }
  }
  else
  {
    -[BKEnrollTouchIDOperation createEnrollProgressInfo:](self, "createEnrollProgressInfo:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKOperation delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[BKOperation dispatchQueue](self, "dispatchQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49__BKEnrollTouchIDOperation_statusMessage_client___block_invoke;
      block[3] = &unk_1E5F84358;
      block[4] = self;
      v26 = v9;
      dispatch_async(v12, block);

    }
  }
  v23.receiver = self;
  v23.super_class = (Class)BKEnrollTouchIDOperation;
  -[BKEnrollOperation statusMessage:client:](&v23, sel_statusMessage_client_, v5, a4);
  if (__osLogTrace)
    v22 = __osLogTrace;
  else
    v22 = v7;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v22, OS_LOG_TYPE_DEFAULT, "BKEnrollTouchIDOperation::statusMessage: -> void\n", buf, 2u);
  }
  kdebug_trace();
}

void __49__BKEnrollTouchIDOperation_statusMessage_client___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enrollOperation:progressedWithTouchIDInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __49__BKEnrollTouchIDOperation_statusMessage_client___block_invoke_17(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fingerprintCaptureOperation:encounteredCaptureError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)homeButtonPressed:(unint64_t)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v5 = __osLogTrace;
  else
    v5 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v5, OS_LOG_TYPE_DEFAULT, "BKEnrollTouchIDOperation::homeButtonPressed\n", buf, 2u);
  }
  -[BKOperation delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    if (__osLog)
      v8 = __osLog;
    else
      v8 = v4;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      -[BKOperation delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKOperation delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_1AF533000, v9, OS_LOG_TYPE_DEFAULT, "BKEnrollTouchIDOperation::homeButtonPressed: %p(%@) homeButtonPressedInEnrollOperation\n", buf, 0x16u);

    }
    -[BKOperation dispatchQueue](self, "dispatchQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__BKEnrollTouchIDOperation_homeButtonPressed___block_invoke;
    block[3] = &unk_1E5F83D50;
    block[4] = self;
    dispatch_async(v12, block);

  }
  if (__osLogTrace)
    v13 = __osLogTrace;
  else
    v13 = v4;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v13, OS_LOG_TYPE_DEFAULT, "BKEnrollTouchIDOperation::homeButtonPressed: -> void\n", buf, 2u);
  }
}

void __46__BKEnrollTouchIDOperation_homeButtonPressed___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "touchIDButtonPressedInOperation:", *(_QWORD *)(a1 + 32));

}

@end
