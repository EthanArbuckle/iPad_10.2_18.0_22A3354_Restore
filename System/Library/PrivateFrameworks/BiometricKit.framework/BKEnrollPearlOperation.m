@implementation BKEnrollPearlOperation

- (BKEnrollPearlOperation)initWithDevice:(id)a3
{
  BKEnrollPearlOperation *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKEnrollPearlOperation;
  result = -[BKEnrollOperation initWithDevice:](&v4, sel_initWithDevice_, a3);
  if (result)
    result->_enrollmentType = 1;
  return result;
}

- (id)enrollResultInfoWithServerIdentity:(id)a3 details:(id)a4
{
  id v6;
  id v7;
  BKEnrollPearlResultInfo *v8;
  void *v9;
  BKEnrollPearlResultInfo *v10;

  v6 = a4;
  v7 = a3;
  v8 = [BKEnrollPearlResultInfo alloc];
  -[BKOperation device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[BKEnrollPearlResultInfo initWithServerIdentity:details:device:](v8, "initWithServerIdentity:details:device:", v7, v6, v9);

  return v10;
}

- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4
{
  uint64_t v5;
  NSObject *v7;
  NSObject *v8;
  BKEnrollPearlOperation *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD *v20;
  void *v21;
  char v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  char v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *log;
  NSObject *loga;
  objc_super v38;
  _QWORD v39[6];
  _QWORD block[6];
  _QWORD v41[5];
  int v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v5 = *(_QWORD *)&a3;
  v49 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v7 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v44) = v5;
    _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_DEFAULT, "BKEnrollPearlOperation::statusMessage: %u\n", buf, 8u);
  }
  if ((_DWORD)v5 == 1055)
  {
    v9 = self;
    v10 = 2;
    goto LABEL_10;
  }
  if ((_DWORD)v5 == 1054)
  {
    v9 = self;
    v10 = 5;
LABEL_10:
    -[BKOperation changeState:](v9, "changeState:", v10);
    goto LABEL_11;
  }
  if ((v5 - 63) <= 1)
  {
    -[BKOperation delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0)
      goto LABEL_11;
    if (__osLog)
      v14 = __osLog;
    else
      v14 = v7;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      -[BKOperation delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKOperation delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v44 = v16;
      v45 = 2112;
      v46 = v17;
      v47 = 1024;
      LODWORD(v48) = v5 == 63;
      _os_log_impl(&dword_1AF533000, v15, OS_LOG_TYPE_DEFAULT, "BKEnrollPearlOperation::statusMessage: %p(%@) faceDetectStateChanged: %d\n", buf, 0x1Cu);

    }
    -[BKOperation dispatchQueue](self, "dispatchQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __47__BKEnrollPearlOperation_statusMessage_client___block_invoke;
    v41[3] = &unk_1E5F843A8;
    v41[4] = self;
    v42 = v5;
    v20 = v41;
LABEL_33:
    dispatch_async(v18, v20);

    goto LABEL_11;
  }
  if ((v5 - 100) <= 0xFF)
  {
    -[BKOperation delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_opt_respondsToSelector();

    if ((v22 & 1) == 0)
      goto LABEL_11;
    v23 = ((100 * (_WORD)v5 - 10000) & 0xFFFCu) / 0xFF;
    if (__osLog)
      v24 = __osLog;
    else
      v24 = v7;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      log = v24;
      -[BKOperation delegate](self, "delegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKOperation delegate](self, "delegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v44 = v25;
      v45 = 2112;
      v46 = v26;
      v47 = 2048;
      v48 = ((100 * (_WORD)v5 - 10000) & 0xFFFCu) / 0xFF;
      _os_log_impl(&dword_1AF533000, log, OS_LOG_TYPE_DEFAULT, "BKEnrollPearlOperation::statusMessage: %p(%@) progressedWithInfo: %ld\n", buf, 0x20u);

      v23 = ((100 * (_WORD)v5 - 10000) & 0xFFFCu) / 0xFF;
    }
    -[BKOperation dispatchQueue](self, "dispatchQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__BKEnrollPearlOperation_statusMessage_client___block_invoke_301;
    block[3] = &unk_1E5F83C10;
    block[4] = self;
    block[5] = v23;
    v20 = block;
    goto LABEL_33;
  }
  v27 = v5 - 1056;
  if ((v5 - 1056) <= 0x19 && ((1 << v27) & 0x2A61163) != 0)
  {
    -[BKOperation delegate](self, "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_opt_respondsToSelector();

    if ((v29 & 1) != 0)
    {
      if (v27 > 0x19)
        v30 = 2;
      else
        v30 = qword_1AF575010[v27];
      if (__osLog)
        v31 = __osLog;
      else
        v31 = v7;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        loga = v31;
        -[BKOperation delegate](self, "delegate");
        v32 = v30;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[BKOperation delegate](self, "delegate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v44 = v33;
        v45 = 2112;
        v46 = v34;
        v47 = 2048;
        v48 = v32;
        _os_log_impl(&dword_1AF533000, loga, OS_LOG_TYPE_DEFAULT, "BKEnrollPearlOperation::statusMessage: %p(%@) failedWithReason: %ld\n", buf, 0x20u);

        v30 = v32;
      }
      -[BKOperation dispatchQueue](self, "dispatchQueue");
      v35 = objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __47__BKEnrollPearlOperation_statusMessage_client___block_invoke_305;
      v39[3] = &unk_1E5F83C10;
      v39[4] = self;
      v39[5] = v30;
      dispatch_async(v35, v39);

    }
    -[BKOperation operationEndsWithReason:](self, "operationEndsWithReason:", 3);
  }
LABEL_11:
  v38.receiver = self;
  v38.super_class = (Class)BKEnrollPearlOperation;
  -[BKEnrollOperation statusMessage:client:](&v38, sel_statusMessage_client_, v5, a4);
  if (__osLogTrace)
    v11 = __osLogTrace;
  else
    v11 = v7;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v11, OS_LOG_TYPE_DEFAULT, "BKEnrollPearlOperation::statusMessage: -> void\n", buf, 2u);
  }
  kdebug_trace();
}

void __47__BKEnrollPearlOperation_statusMessage_client___block_invoke(uint64_t a1)
{
  uint64_t v2;
  BKFaceDetectStateInfo *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = -[BKFaceDetectStateInfo initWithPresenceState:]([BKFaceDetectStateInfo alloc], "initWithPresenceState:", *(_DWORD *)(a1 + 40) == 63);
  objc_msgSend(v4, "operation:faceDetectStateChanged:", v2, v3);

}

void __47__BKEnrollPearlOperation_statusMessage_client___block_invoke_301(uint64_t a1)
{
  uint64_t v2;
  BKEnrollPearlProgressInfo *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = -[BKEnrollPearlProgressInfo initWithPercents:]([BKEnrollPearlProgressInfo alloc], "initWithPercents:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "enrollOperation:progressedWithInfo:", v2, v3);

}

void __47__BKEnrollPearlOperation_statusMessage_client___block_invoke_305(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enrollOperation:failedWithReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)enrollUpdate:(id)a3 client:(unint64_t)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  char *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  char v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  char *v28;
  void *v29;
  uint64_t v30;
  char *v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[6];
  _QWORD block[5];
  id v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  kdebug_trace();
  if (!v5)
  {
    if (__osLog)
      v34 = __osLog;
    else
      v34 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_DWORD *)buf = 136316162;
    v41 = "enrollData";
    v42 = 2048;
    v43 = 0;
    v44 = 2080;
    v45 = &unk_1AF575226;
    v46 = 2080;
    v47 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
    v48 = 1024;
    v49 = 798;
LABEL_42:
    _os_log_impl(&dword_1AF533000, v34, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_21;
  }
  v6 = objc_msgSend(v5, "length");
  if (v6 <= 0x31)
  {
    if (__osLog)
      v34 = __osLog;
    else
      v34 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_DWORD *)buf = 136316162;
    v41 = "dataLength >= __builtin_offsetof(pearl_enrollment_info_t, poseBinStatus)";
    v42 = 2048;
    v43 = 0;
    v44 = 2080;
    v45 = &unk_1AF575226;
    v46 = 2080;
    v47 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
    v48 = 1024;
    v49 = 801;
    goto LABEL_42;
  }
  v7 = v6;
  v8 = objc_msgSend(objc_retainAutorelease(v5), "bytes");
  if (!v8)
  {
    if (__osLog)
      v34 = __osLog;
    else
      v34 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_DWORD *)buf = 136316162;
    v41 = "enrollInfo";
    v42 = 2048;
    v43 = 0;
    v44 = 2080;
    v45 = &unk_1AF575226;
    v46 = 2080;
    v47 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
    v48 = 1024;
    v49 = 804;
    goto LABEL_42;
  }
  v9 = v8;
  if (v7 < *(unsigned __int16 *)(v8 + 48) * (unint64_t)*(unsigned __int16 *)(v8 + 46) + 50)
  {
    if (__osLog)
      v34 = __osLog;
    else
      v34 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_DWORD *)buf = 136316162;
    v41 = "dataLength >= __builtin_offsetof(pearl_enrollment_info_t, poseBinStatus) + (uint64_t)enrollInfo->pitchBinsCoun"
          "t * enrollInfo->yawBinsCount";
    v42 = 2048;
    v43 = 0;
    v44 = 2080;
    v45 = &unk_1AF575226;
    v46 = 2080;
    v47 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
    v48 = 1024;
    v49 = 805;
    goto LABEL_42;
  }
  -[BKOperation delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v12 = -[BKFaceDetectStateInfo initFromFaceInfo:]([BKFaceDetectStateInfo alloc], "initFromFaceInfo:", v9 + 4);
    -[BKOperation dispatchQueue](self, "dispatchQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__BKEnrollPearlOperation_enrollUpdate_client___block_invoke;
    block[3] = &unk_1E5F84358;
    block[4] = self;
    v39 = v12;
    v14 = v12;
    dispatch_async(v13, block);

  }
  -[BKOperation delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    v17 = (void *)*(unsigned __int16 *)(v9 + 2);
    if (__osLog)
      v18 = __osLog;
    else
      v18 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      -[BKOperation delegate](self, "delegate");
      v20 = (char *)objc_claimAutoreleasedReturnValue();
      -[BKOperation delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v41 = v20;
      v42 = 2112;
      v43 = v21;
      v44 = 2048;
      v45 = v17;
      _os_log_impl(&dword_1AF533000, v19, OS_LOG_TYPE_DEFAULT, "BKEnrollPearlOperation::enrollUpdate: %p(%@) percentCompleted: %ld\n", buf, 0x20u);

    }
    -[BKOperation dispatchQueue](self, "dispatchQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __46__BKEnrollPearlOperation_enrollUpdate_client___block_invoke_312;
    v37[3] = &unk_1E5F83C10;
    v37[4] = self;
    v37[5] = v17;
    dispatch_async(v22, v37);

  }
  -[BKOperation delegate](self, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_opt_respondsToSelector();

  if ((v24 & 1) != 0)
  {
    v25 = -[BKEnrollPearlProgressInfo initFromEnrollInfo:]([BKEnrollPearlProgressInfo alloc], "initFromEnrollInfo:", v9);
    if (__osLog)
      v26 = __osLog;
    else
      v26 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = v26;
      -[BKOperation delegate](self, "delegate");
      v28 = (char *)objc_claimAutoreleasedReturnValue();
      -[BKOperation delegate](self, "delegate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v25, "percentageCompleted");
      objc_msgSend(v25, "enrolledPoses");
      v31 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v41 = v28;
      v42 = 2112;
      v43 = v29;
      v44 = 2048;
      v45 = (void *)v30;
      v46 = 2112;
      v47 = v31;
      _os_log_impl(&dword_1AF533000, v27, OS_LOG_TYPE_DEFAULT, "BKEnrollPearlOperation::enrollUpdate: %p(%@) progressedWithInfo: percentageCompleted=%ld enrolledPoses=%@\n", buf, 0x2Au);

    }
    -[BKOperation dispatchQueue](self, "dispatchQueue");
    v32 = objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __46__BKEnrollPearlOperation_enrollUpdate_client___block_invoke_313;
    v35[3] = &unk_1E5F84358;
    v35[4] = self;
    v36 = v25;
    v33 = v25;
    dispatch_async(v32, v35);

  }
LABEL_21:
  kdebug_trace();

}

void __46__BKEnrollPearlOperation_enrollUpdate_client___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "operation:faceDetectStateChanged:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __46__BKEnrollPearlOperation_enrollUpdate_client___block_invoke_312(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enrollOperation:percentCompleted:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __46__BKEnrollPearlOperation_enrollUpdate_client___block_invoke_313(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enrollOperation:progressedWithInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)enrollFeedback:(id)a3 client:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    *(_DWORD *)buf = 136316162;
    v18 = "enrollData";
    v19 = 2048;
    v20 = 0;
    v21 = 2080;
    v22 = &unk_1AF575226;
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
    v25 = 1024;
    v26 = 844;
LABEL_22:
    _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_6;
  }
  if ((unint64_t)objc_msgSend(v5, "length") <= 0x29)
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    *(_DWORD *)buf = 136316162;
    v18 = "dataLength >= sizeof(pearl_face_detect_info_t)";
    v19 = 2048;
    v20 = 0;
    v21 = 2080;
    v22 = &unk_1AF575226;
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
    v25 = 1024;
    v26 = 847;
    goto LABEL_22;
  }
  v7 = objc_msgSend(objc_retainAutorelease(v6), "bytes");
  if (v7)
  {
    v8 = v7;
    -[BKOperation delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = -[BKFaceDetectStateInfo initFromFaceInfo:]([BKFaceDetectStateInfo alloc], "initFromFaceInfo:", v8);
      -[BKOperation dispatchQueue](self, "dispatchQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __48__BKEnrollPearlOperation_enrollFeedback_client___block_invoke;
      v15[3] = &unk_1E5F84358;
      v15[4] = self;
      v16 = v11;
      v13 = v11;
      dispatch_async(v12, v15);

    }
    goto LABEL_6;
  }
  if (__osLog)
    v14 = __osLog;
  else
    v14 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v18 = "info";
    v19 = 2048;
    v20 = 0;
    v21 = 2080;
    v22 = &unk_1AF575226;
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
    v25 = 1024;
    v26 = 850;
    goto LABEL_22;
  }
LABEL_6:

}

void __48__BKEnrollPearlOperation_enrollFeedback_client___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "operation:faceDetectStateChanged:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)optionsDictionaryWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  BKIdentity *augmentedIdentity;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v15;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)BKEnrollPearlOperation;
  -[BKEnrollOperation optionsDictionaryWithError:](&v16, sel_optionsDictionaryWithError_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v18 = "superOptions";
      v19 = 2048;
      v20 = 0;
      v21 = 2080;
      v22 = &unk_1AF575226;
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      v25 = 1024;
      v26 = 874;
      _os_log_impl(&dword_1AF533000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v7 = 0;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (self->_clientToComplete)
    objc_msgSend(v6, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("BKOptionEnrollClientToComplete"));
  if ((unint64_t)(self->_enrollmentType - 1) >= 3)
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_DWORD *)buf = 136316162;
    v18 = "0";
    v19 = 2048;
    v20 = 0;
    v21 = 2080;
    v22 = &unk_1AF575226;
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
    v25 = 1024;
    v26 = 891;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("BKOptionFaceIDEnrollType"));

  augmentedIdentity = self->_augmentedIdentity;
  if (augmentedIdentity)
  {
    -[BKIdentity serverIdentity](augmentedIdentity, "serverIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("BKOptionEnrollAugmentedIdentity"));

  }
  if (self->_enrollmentType != 3)
    goto LABEL_10;
  if (self->_periocularGlassesRequirement >= 3uLL)
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_DWORD *)buf = 136316162;
    v18 = "0";
    v19 = 2048;
    v20 = 0;
    v21 = 2080;
    v22 = &unk_1AF575226;
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
    v25 = 1024;
    v26 = 909;
LABEL_16:
    _os_log_impl(&dword_1AF533000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_17:
    setError((id)1, a3);
LABEL_18:
    v12 = 0;
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("BKOptionFaceIDEnrollGlassesRequirement"));

LABEL_10:
  v7 = v7;
  v12 = v7;
LABEL_19:

  return v12;
}

- (BOOL)startWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  BiometricKitXPCClient *xpcClient;
  NSObject *v8;
  unsigned __int8 v9;
  BOOL v10;
  NSObject *v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  objc_super v17;
  uint8_t buf[4];
  _DWORD v19[7];

  *(_QWORD *)&v19[5] = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v5 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super.super._xpcClient;
    v8 = v6;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v19 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_DEFAULT, "BKEnrollPearlOperation:start (_cid %lu)\n", buf, 0xCu);

  }
  v17.receiver = self;
  v17.super_class = (Class)BKEnrollPearlOperation;
  v9 = -[BKOperation startWithError:](&v17, sel_startWithError_, a3);
  v10 = v9;
  if (__osLogTrace)
    v11 = __osLogTrace;
  else
    v11 = v5;
  if ((v9 & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v12 = *a3;
      else
        v12 = 0;
      *(_DWORD *)buf = 67109378;
      v19[0] = 1;
      LOWORD(v19[1]) = 2112;
      *(_QWORD *)((char *)&v19[1] + 2) = v12;
      v14 = v11;
      v15 = OS_LOG_TYPE_DEFAULT;
LABEL_20:
      _os_log_impl(&dword_1AF533000, v14, v15, "BKEnrollPearlOperation:start -> %d %@\n", buf, 0x12u);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    if (a3)
      v13 = *a3;
    else
      v13 = 0;
    *(_DWORD *)buf = 67109378;
    v19[0] = 0;
    LOWORD(v19[1]) = 2112;
    *(_QWORD *)((char *)&v19[1] + 2) = v13;
    v14 = v11;
    v15 = OS_LOG_TYPE_ERROR;
    goto LABEL_20;
  }
  kdebug_trace();
  return v10;
}

- (BOOL)completeWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  BiometricKitXPCClient *xpcClient;
  NSObject *v8;
  int v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  NSObject *v16;
  NSObject *v17;
  id v18;
  int v19;
  _BYTE v20[18];
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v5 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super.super._xpcClient;
    v8 = v6;
    v19 = 134217984;
    *(_QWORD *)v20 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_DEFAULT, "BKEnrollPearlOperation:complete (_cid %lu)\n", (uint8_t *)&v19, 0xCu);

  }
  v9 = -[BiometricKitXPCClient completeEnrollment](self->super.super._xpcClient, "completeEnrollment");
  v10 = (void *)v9;
  if (v9)
  {
    if (__osLog)
      v16 = __osLog;
    else
      v16 = v5;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = 136316162;
      *(_QWORD *)v20 = "err == 0 ";
      *(_WORD *)&v20[8] = 2048;
      *(_QWORD *)&v20[10] = v10;
      v21 = 2080;
      v22 = &unk_1AF575226;
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      v25 = 1024;
      v26 = 954;
      _os_log_impl(&dword_1AF533000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
    }
    setErrorWithOSStatus(v10, a3);
    if (__osLogTrace)
      v17 = __osLogTrace;
    else
      v17 = v5;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      if (a3)
        v18 = *a3;
      else
        v18 = 0;
      v19 = 67109378;
      *(_DWORD *)v20 = 0;
      *(_WORD *)&v20[4] = 2112;
      *(_QWORD *)&v20[6] = v18;
      v13 = v17;
      v14 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }
  else
  {
    if (__osLogTrace)
      v11 = __osLogTrace;
    else
      v11 = v5;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v12 = *a3;
      else
        v12 = 0;
      v19 = 67109378;
      *(_DWORD *)v20 = 1;
      *(_WORD *)&v20[4] = 2112;
      *(_QWORD *)&v20[6] = v12;
      v13 = v11;
      v14 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
      _os_log_impl(&dword_1AF533000, v13, v14, "BKEnrollPearlOperation:complete -> %d %@\n", (uint8_t *)&v19, 0x12u);
    }
  }
  kdebug_trace();
  return (_DWORD)v10 == 0;
}

- (BOOL)suspendWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  BiometricKitXPCClient *xpcClient;
  NSObject *v8;
  int v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  NSObject *v16;
  NSObject *v17;
  id v18;
  int v19;
  _BYTE v20[18];
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v5 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super.super._xpcClient;
    v8 = v6;
    v19 = 134217984;
    *(_QWORD *)v20 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_DEFAULT, "BKEnrollPearlOperation:suspend (_cid %lu)\n", (uint8_t *)&v19, 0xCu);

  }
  v9 = -[BiometricKitXPCClient suspendEnrollment:](self->super.super._xpcClient, "suspendEnrollment:", 1);
  v10 = (void *)v9;
  if (v9)
  {
    if (__osLog)
      v16 = __osLog;
    else
      v16 = v5;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = 136316162;
      *(_QWORD *)v20 = "err == 0 ";
      *(_WORD *)&v20[8] = 2048;
      *(_QWORD *)&v20[10] = v10;
      v21 = 2080;
      v22 = &unk_1AF575226;
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      v25 = 1024;
      v26 = 978;
      _os_log_impl(&dword_1AF533000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
    }
    setErrorWithOSStatus(v10, a3);
    if (__osLogTrace)
      v17 = __osLogTrace;
    else
      v17 = v5;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      if (a3)
        v18 = *a3;
      else
        v18 = 0;
      v19 = 67109378;
      *(_DWORD *)v20 = 0;
      *(_WORD *)&v20[4] = 2112;
      *(_QWORD *)&v20[6] = v18;
      v13 = v17;
      v14 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }
  else
  {
    if (__osLogTrace)
      v11 = __osLogTrace;
    else
      v11 = v5;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v12 = *a3;
      else
        v12 = 0;
      v19 = 67109378;
      *(_DWORD *)v20 = 1;
      *(_WORD *)&v20[4] = 2112;
      *(_QWORD *)&v20[6] = v12;
      v13 = v11;
      v14 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
      _os_log_impl(&dword_1AF533000, v13, v14, "BKEnrollPearlOperation:suspend -> %d %@\n", (uint8_t *)&v19, 0x12u);
    }
  }
  kdebug_trace();
  return (_DWORD)v10 == 0;
}

- (BOOL)resumeWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  BiometricKitXPCClient *xpcClient;
  NSObject *v8;
  int v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  NSObject *v16;
  NSObject *v17;
  id v18;
  int v19;
  _BYTE v20[18];
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v5 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super.super._xpcClient;
    v8 = v6;
    v19 = 134217984;
    *(_QWORD *)v20 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_DEFAULT, "BKEnrollPearlOperation:resume (_cid %lu)\n", (uint8_t *)&v19, 0xCu);

  }
  v9 = -[BiometricKitXPCClient suspendEnrollment:](self->super.super._xpcClient, "suspendEnrollment:", 0);
  v10 = (void *)v9;
  if (v9)
  {
    if (__osLog)
      v16 = __osLog;
    else
      v16 = v5;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = 136316162;
      *(_QWORD *)v20 = "err == 0 ";
      *(_WORD *)&v20[8] = 2048;
      *(_QWORD *)&v20[10] = v10;
      v21 = 2080;
      v22 = &unk_1AF575226;
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      v25 = 1024;
      v26 = 1002;
      _os_log_impl(&dword_1AF533000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
    }
    setErrorWithOSStatus(v10, a3);
    if (__osLogTrace)
      v17 = __osLogTrace;
    else
      v17 = v5;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      if (a3)
        v18 = *a3;
      else
        v18 = 0;
      v19 = 67109378;
      *(_DWORD *)v20 = 0;
      *(_WORD *)&v20[4] = 2112;
      *(_QWORD *)&v20[6] = v18;
      v13 = v17;
      v14 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }
  else
  {
    if (__osLogTrace)
      v11 = __osLogTrace;
    else
      v11 = v5;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v12 = *a3;
      else
        v12 = 0;
      v19 = 67109378;
      *(_DWORD *)v20 = 1;
      *(_WORD *)&v20[4] = 2112;
      *(_QWORD *)&v20[6] = v12;
      v13 = v11;
      v14 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
      _os_log_impl(&dword_1AF533000, v13, v14, "BKEnrollPearlOperation:resume -> %d %@\n", (uint8_t *)&v19, 0x12u);
    }
  }
  kdebug_trace();
  return (_DWORD)v10 == 0;
}

- (int64_t)enrollmentType
{
  return self->_enrollmentType;
}

- (void)setEnrollmentType:(int64_t)a3
{
  self->_enrollmentType = a3;
}

- (BOOL)clientToComplete
{
  return self->_clientToComplete;
}

- (void)setClientToComplete:(BOOL)a3
{
  self->_clientToComplete = a3;
}

- (BKIdentity)augmentedIdentity
{
  return self->_augmentedIdentity;
}

- (void)setAugmentedIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_augmentedIdentity, a3);
}

- (int64_t)periocularGlassesRequirement
{
  return self->_periocularGlassesRequirement;
}

- (void)setPeriocularGlassesRequirement:(int64_t)a3
{
  self->_periocularGlassesRequirement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_augmentedIdentity, 0);
}

@end
