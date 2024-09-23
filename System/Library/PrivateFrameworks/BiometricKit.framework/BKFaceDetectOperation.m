@implementation BKFaceDetectOperation

- (BKFaceDetectOperation)initWithDevice:(id)a3
{
  BKFaceDetectOperation *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKFaceDetectOperation;
  result = -[BKOperation initWithDevice:](&v4, sel_initWithDevice_, a3);
  if (result)
  {
    result->_mode = 2;
    result->_timeout = -1.0;
  }
  return result;
}

- (void)startBioOperation:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  BiometricKitXPCClient *xpcClient;
  NSObject *v10;
  void *v11;
  void *v12;
  int64_t mode;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BiometricKitXPCClient *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v4 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  kdebug_trace();
  v7 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super.super._xpcClient;
    v10 = v8;
    *(_DWORD *)buf = 134217984;
    v26 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEFAULT, "BKFaceDetectOperation::startBioOperation (_cid %lu)\n", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  mode = self->_mode;
  if (mode == 1)
  {
    v14 = &unk_1E5F8D398;
    goto LABEL_10;
  }
  if (mode == 2)
  {
    v14 = &unk_1E5F8D3B0;
LABEL_10:
    objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("BKOptionPresenceDetectMode"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeout);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v15, CFSTR("BKOptionPresenceDetectTimeout"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_highPriority);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v16, CFSTR("BKOptionPresenceDetectHighPriority"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_eyeRelief);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v17, CFSTR("BKOptionPresenceDetectEyeRelief"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_motionDetect);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v18, CFSTR("BKOptionPresenceDetectMotion"));

    v19 = self->super.super._xpcClient;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __49__BKFaceDetectOperation_startBioOperation_reply___block_invoke;
    v23[3] = &unk_1E5F83DE0;
    v24 = v6;
    -[BiometricKitXPCClient detectPresenceWithOptions:async:withReply:](v19, "detectPresenceWithOptions:async:withReply:", v12, v4, v23);
    v20 = v24;
    goto LABEL_17;
  }
  if (__osLog)
    v21 = __osLog;
  else
    v21 = v7;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v26 = "0";
    v27 = 2048;
    v28 = 0;
    v29 = 2080;
    v30 = &unk_1AF575226;
    v31 = 2080;
    v32 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
    v33 = 1024;
    v34 = 479;
    _os_log_impl(&dword_1AF533000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  +[BKErrorHelper errorWithCode:](BKErrorHelper, "errorWithCode:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v20);
LABEL_17:

  if (__osLogTrace)
    v22 = __osLogTrace;
  else
    v22 = v7;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v22, OS_LOG_TYPE_DEFAULT, "BKFaceDetectOperation::startBioOperation -> void\n", buf, 2u);
  }
  kdebug_trace();

}

void __49__BKFaceDetectOperation_startBioOperation_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if ((_DWORD)a2)
  {
    +[BKErrorHelper errorWithOSStatus:](BKErrorHelper, "errorWithOSStatus:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32), 1, 0);
  }
}

- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4
{
  -[BKFaceDetectOperation statusMessage:details:client:](self, "statusMessage:details:client:", *(_QWORD *)&a3, 0, a4);
}

- (void)statusMessage:(unsigned int)a3 details:(id)a4 client:(unint64_t)a5
{
  uint64_t v6;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  BKFaceDetectOperation *v26;
  uint64_t v27;
  NSObject *v28;
  objc_super v29;
  _QWORD v30[5];
  id v31;
  _QWORD block[5];
  id v33;
  int v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  _BOOL4 v40;
  uint64_t v41;

  v6 = *(_QWORD *)&a3;
  v41 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  kdebug_trace();
  v9 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v36) = v6;
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEFAULT, "BKFaceDetectOperation::statusMessage: %u\n", buf, 8u);
  }
  if ((int)v6 > 1050)
  {
    if ((_DWORD)v6 != 1051)
    {
      if ((_DWORD)v6 != 1076)
        goto LABEL_29;
      -[BKOperation delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_opt_respondsToSelector();

      if ((v20 & 1) == 0)
        goto LABEL_29;
      if (__osLog)
        v21 = __osLog;
      else
        v21 = v9;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = v21;
        -[BKOperation delegate](self, "delegate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[BKOperation delegate](self, "delegate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v36 = v23;
        v37 = 2112;
        v38 = v24;
        _os_log_impl(&dword_1AF533000, v22, OS_LOG_TYPE_DEFAULT, "BKFaceDetectOperation::statusMessage: %p(%@) motionDetectStateChanged\n", buf, 0x16u);

      }
      -[BKOperation dispatchQueue](self, "dispatchQueue");
      v25 = objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __54__BKFaceDetectOperation_statusMessage_details_client___block_invoke_220;
      v30[3] = &unk_1E5F84358;
      v30[4] = self;
      v31 = v8;
      dispatch_async(v25, v30);

      v18 = v31;
LABEL_24:

      goto LABEL_29;
    }
    v26 = self;
    v27 = 4;
    goto LABEL_28;
  }
  if ((v6 - 63) < 2)
  {
    -[BKOperation delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0)
      goto LABEL_29;
    if (__osLog)
      v13 = __osLog;
    else
      v13 = v9;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      -[BKOperation delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKOperation delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v36 = v15;
      v37 = 2112;
      v38 = v16;
      v39 = 1024;
      v40 = v6 == 63;
      _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_DEFAULT, "BKFaceDetectOperation::statusMessage: %p(%@) faceDetectStateChanged: %d\n", buf, 0x1Cu);

    }
    -[BKOperation dispatchQueue](self, "dispatchQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__BKFaceDetectOperation_statusMessage_details_client___block_invoke;
    block[3] = &unk_1E5F84578;
    block[4] = self;
    v34 = v6;
    v33 = v8;
    dispatch_async(v17, block);

    v18 = v33;
    goto LABEL_24;
  }
  if ((_DWORD)v6 == 1050)
  {
    v26 = self;
    v27 = 1;
LABEL_28:
    -[BKOperation operationEndsWithReason:](v26, "operationEndsWithReason:", v27);
  }
LABEL_29:
  v29.receiver = self;
  v29.super_class = (Class)BKFaceDetectOperation;
  -[BKOperation statusMessage:client:](&v29, sel_statusMessage_client_, v6, a5);
  if (__osLogTrace)
    v28 = __osLogTrace;
  else
    v28 = v9;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v28, OS_LOG_TYPE_DEFAULT, "BKFaceDetectOperation::statusMessage: -> void\n", buf, 2u);
  }
  kdebug_trace();

}

void __54__BKFaceDetectOperation_statusMessage_details_client___block_invoke(uint64_t a1)
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

void __54__BKFaceDetectOperation_statusMessage_details_client___block_invoke_220(uint64_t a1)
{
  uint64_t v2;
  BKMotionDetectStateInfo *v3;
  void *v4;
  BKMotionDetectStateInfo *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = [BKMotionDetectStateInfo alloc];
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("BKStatusDetailMotionDetectStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BKMotionDetectStateInfo initWithMotionMatrix:](v3, "initWithMotionMatrix:", v4);
  objc_msgSend(v6, "operation:motionDetectStateChanged:", v2, v5);

}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (BOOL)highPriority
{
  return self->_highPriority;
}

- (void)setHighPriority:(BOOL)a3
{
  self->_highPriority = a3;
}

- (BOOL)eyeRelief
{
  return self->_eyeRelief;
}

- (void)setEyeRelief:(BOOL)a3
{
  self->_eyeRelief = a3;
}

- (BOOL)motionDetect
{
  return self->_motionDetect;
}

- (void)setMotionDetect:(BOOL)a3
{
  self->_motionDetect = a3;
}

@end
