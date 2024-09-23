@implementation BKMatchTouchIDOperation

- (id)optionsDictionaryWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[4];
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
  v10.receiver = self;
  v10.super_class = (Class)BKMatchTouchIDOperation;
  -[BKMatchOperation optionsDictionaryWithError:](&v10, sel_optionsDictionaryWithError_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (self->_requireFingerOff)
      objc_msgSend(v5, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("BKOptionMatchRequireFingerOff"));
    v7 = v6;
  }
  else
  {
    if (__osLog)
      v9 = __osLog;
    else
      v9 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v12 = "superOptions";
      v13 = 2048;
      v14 = 0;
      v15 = 2080;
      v16 = &unk_1AF575226;
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDeviceTouchID.m";
      v19 = 1024;
      v20 = 328;
      _os_log_impl(&dword_1AF533000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v7 = 0;
  }

  return v7;
}

- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4
{
  uint64_t v5;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  objc_super v19;
  _QWORD block[6];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v5 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v7 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v22) = v5;
    _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_DEFAULT, "BKMatchTouchIDOperation::statusMessage: %u\n", buf, 8u);
  }
  v9 = __statusToFingerprintCaptureError(v5);
  if (v9)
  {
    v10 = v9;
    -[BKOperation delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      if (__osLog)
        v13 = __osLog;
      else
        v13 = v7;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v13;
        -[BKOperation delegate](self, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[BKOperation delegate](self, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v22 = v15;
        v23 = 2112;
        v24 = v16;
        v25 = 2048;
        v26 = v10;
        _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_DEFAULT, "BKMatchTouchIDOperation::statusMessage: %p(%@) encounteredCaptureError: %ld\n", buf, 0x20u);

      }
      -[BKOperation dispatchQueue](self, "dispatchQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__BKMatchTouchIDOperation_statusMessage_client___block_invoke;
      block[3] = &unk_1E5F83C10;
      block[4] = self;
      block[5] = v10;
      dispatch_async(v17, block);

    }
  }
  v19.receiver = self;
  v19.super_class = (Class)BKMatchTouchIDOperation;
  -[BKMatchOperation statusMessage:client:](&v19, sel_statusMessage_client_, v5, a4);
  if (__osLogTrace)
    v18 = __osLogTrace;
  else
    v18 = v7;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v18, OS_LOG_TYPE_DEFAULT, "BKMatchTouchIDOperation::statusMessage: -> void\n", buf, 2u);
  }
  kdebug_trace();
}

void __48__BKMatchTouchIDOperation_statusMessage_client___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fingerprintCaptureOperation:encounteredCaptureError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (BOOL)requireFingerOff
{
  return self->_requireFingerOff;
}

- (void)setRequireFingerOff:(BOOL)a3
{
  self->_requireFingerOff = a3;
}

@end
