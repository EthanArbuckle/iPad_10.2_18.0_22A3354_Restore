@implementation AWPearlAttentionStreamer

- (id)initForUnitTest:(BOOL)a3 queue:(id)a4
{
  id v7;
  AWPearlAttentionStreamer *v8;
  AWPearlAttentionStreamer *v9;
  BKDevicePearl *v10;
  BKDevicePearl *pearlDevice;
  NSObject **p_queue;
  id notificationBlock;
  id callbackBlock;
  uint64_t v15;
  int *v16;
  void *v17;
  int *v18;
  void *v19;
  id *v20;
  id *v21;
  AWPearlAttentionStreamer *v22;
  int *v23;
  NSObject *v24;
  int *v25;
  NSObject *v26;
  _QWORD v28[4];
  int *v29;
  _QWORD handler[4];
  int *v31;
  _QWORD v32[4];
  int *v33;
  _QWORD v34[4];
  int *v35;
  _QWORD block[4];
  int *v37;
  id v38;
  dispatch_once_t predicate;
  id location;
  objc_super v41;

  v7 = a4;
  v41.receiver = self;
  v41.super_class = (Class)AWPearlAttentionStreamer;
  v8 = -[AWPearlAttentionStreamer init](&v41, sel_init);
  v9 = v8;
  if (!v8)
  {
LABEL_13:
    v22 = v9;
    goto LABEL_14;
  }
  v8->_unitTest = a3;
  if (a3)
  {
    +[AWUnitTestPearlDevice sharedDevice](AWUnitTestPearlDevice, "sharedDevice");
    v10 = (BKDevicePearl *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (getPearlDevice_onceToken != -1)
      dispatch_once(&getPearlDevice_onceToken, &__block_literal_global_162);
    v10 = (BKDevicePearl *)(id)getPearlDevice_result;
  }
  pearlDevice = v9->_pearlDevice;
  v9->_pearlDevice = v10;

  p_queue = (NSObject **)&v9->_queue;
  objc_storeStrong((id *)&v9->_queue, a4);
  if (v9->_pearlDevice)
  {
    notificationBlock = v9->_notificationBlock;
    v9->_notificationBlock = 0;

    v9->_attentionStreamerRunning = 0;
    callbackBlock = v9->_callbackBlock;
    v9->_callbackBlock = 0;

    v9->_eyeReliefStarted = 0;
    v9->_matchOrEnrollOperationActive = 0;
    objc_initWeak(&location, v9);
    predicate = 0;
    v15 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke;
    block[3] = &unk_1E5F8E458;
    v16 = v9;
    v37 = v16;
    objc_copyWeak(&v38, &location);
    dispatch_once(&predicate, block);
    objc_msgSend(v16, "setIsAttentionAwareFeaturesEnabled:", _AXSAttentionAwarenessFeaturesEnabled() != 0);
    if (v9->_unitTest)
    {
      *((_WORD *)v16 + 40) = 1;
      objc_msgSend(v16, "unitTestDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v15;
      v34[1] = 3221225472;
      v34[2] = __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke_10;
      v34[3] = &unk_1E5F8E718;
      v18 = v16;
      v35 = v18;
      objc_msgSend(v17, "setDisplayCallback:", v34);

      objc_msgSend(v18, "unitTestDevice");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v15;
      v32[1] = 3221225472;
      v32[2] = __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke_3;
      v32[3] = &unk_1E5F8E718;
      v33 = v18;
      objc_msgSend(v19, "setSmartCoverCallback:", v32);
      v20 = (id *)&v35;
      v21 = (id *)&v33;

    }
    else
    {
      v23 = v16 + 21;
      v24 = *p_queue;
      handler[0] = v15;
      handler[1] = 3221225472;
      handler[2] = __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke_5;
      handler[3] = &unk_1E5F8E740;
      v25 = v16;
      v31 = v25;
      notify_register_dispatch("com.apple.BiometricKit.activeOperation", v23, v24, handler);
      v20 = (id *)&v31;
      v26 = *p_queue;
      v28[0] = v15;
      v28[1] = 3221225472;
      v28[2] = __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke_14;
      v28[3] = &unk_1E5F8EC18;
      v21 = (id *)&v29;
      v29 = v25;
      dispatch_async(v26, v28);
    }

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
    goto LABEL_13;
  }
  v22 = 0;
LABEL_14:

  return v22;
}

- (void)setNotificationHandler:(id)a3
{
  id v4;
  void *v5;
  id notificationBlock;
  id v7;

  v4 = a3;
  if (!v4)
    __assert_rtn("-[AWPearlAttentionStreamer setNotificationHandler:]", "PearlAttentionStreamer.m", 219, "notificationBlock != nil");
  v7 = v4;
  v5 = (void *)MEMORY[0x1B5DF9110]();
  notificationBlock = self->_notificationBlock;
  self->_notificationBlock = v5;

}

- (id)streamEventWithBlock:(id)a3 options:(id)a4 operationStartFailedBlock:(id)a5
{
  BOOL var0;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString **v14;
  uint64_t *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  unint64_t v22;
  double v23;
  unint64_t v24;
  double v25;
  unint64_t v26;
  double v27;
  NSObject *v28;
  unint64_t v29;
  double v30;
  unint64_t v31;
  double v32;
  id v33;
  BKDevicePearl *pearlDevice;
  BKFaceDetectOperation *v35;
  BKFaceDetectOperation *pendingPresenceOperation;
  BKFaceDetectOperation *v37;
  void *v38;
  id callbackBlock;
  BKFaceDetectOperation *v40;
  void *v41;
  unint64_t v42;
  double v43;
  _QWORD v44[5];
  id v45;
  id v46;
  uint8_t buf[4];
  double v48;
  __int16 v49;
  id v50;
  uint64_t v51;
  const __CFString *v52;
  uint64_t v53;
  const __CFString *v54;
  uint64_t v55;
  const __CFString *v56;
  uint64_t v57;
  _QWORD v58[2];

  var0 = a4.var0;
  v58[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!-[AWPearlAttentionStreamer isAttentionAwareFeaturesEnabled](self, "isAttentionAwareFeaturesEnabled"))
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v22 = absTimeNS();
        if (v22 == -1)
          v23 = INFINITY;
        else
          v23 = (double)v22 / 1000000000.0;
        *(_DWORD *)buf = 134217984;
        v48 = v23;
        _os_log_error_impl(&dword_1AF589000, v16, OS_LOG_TYPE_ERROR, "%13.5f: User has AttentionAware features off, cannot start streaming operation with Pearl", buf, 0xCu);
      }

    }
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2FE0];
    v57 = *MEMORY[0x1E0CB2D50];
    v58[0] = CFSTR(" Attention Aware Features turned OFF");
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = (const __CFString **)v58;
    v15 = &v57;
    goto LABEL_21;
  }
  if (!self->_displayOn)
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v26 = absTimeNS();
        if (v26 == -1)
          v27 = INFINITY;
        else
          v27 = (double)v26 / 1000000000.0;
        *(_DWORD *)buf = 134217984;
        v48 = v27;
        _os_log_error_impl(&dword_1AF589000, v17, OS_LOG_TYPE_ERROR, "%13.5f: Display OFF, not starting attention stream", buf, 0xCu);
      }

    }
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2FE0];
    v55 = *MEMORY[0x1E0CB2D50];
    v56 = CFSTR(" Display OFF");
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = &v56;
    v15 = &v55;
    goto LABEL_21;
  }
  if (self->_smartCoverClosed)
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v24 = absTimeNS();
        if (v24 == -1)
          v25 = INFINITY;
        else
          v25 = (double)v24 / 1000000000.0;
        *(_DWORD *)buf = 134217984;
        v48 = v25;
        _os_log_error_impl(&dword_1AF589000, v10, OS_LOG_TYPE_ERROR, "%13.5f: Smart cover closed, not starting attention stream", buf, 0xCu);
      }

    }
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2FE0];
    v53 = *MEMORY[0x1E0CB2D50];
    v54 = CFSTR(" Smart cover closed");
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = &v54;
    v15 = &v53;
LABEL_21:
    objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 1);
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 1, v19);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (self->_matchOrEnrollOperationActive)
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v31 = absTimeNS();
        if (v31 == -1)
          v32 = INFINITY;
        else
          v32 = (double)v31 / 1000000000.0;
        *(_DWORD *)buf = 134217984;
        v48 = v32;
        _os_log_error_impl(&dword_1AF589000, v18, OS_LOG_TYPE_ERROR, "%13.5f: Match or enroll operation underway, not starting attention stream", buf, 0xCu);
      }

    }
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2FE0];
    v51 = *MEMORY[0x1E0CB2D50];
    v52 = CFSTR(" Match or enroll operation ongoing");
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = &v52;
    v15 = &v51;
    goto LABEL_21;
  }
  if (self->_attentionStreamerRunning)
  {
    if (!var0 || self->_eyeReliefStarted)
    {
      v20 = 0;
      goto LABEL_23;
    }
    if (currentLogLevel >= 6)
    {
      _AALog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = absTimeNS();
        if (v29 == -1)
          v30 = INFINITY;
        else
          v30 = (double)v29 / 1000000000.0;
        *(_DWORD *)buf = 134217984;
        v48 = v30;
        _os_log_impl(&dword_1AF589000, v28, OS_LOG_TYPE_DEFAULT, "%13.5f: Cancelling current stream and starting one with EyeRelief", buf, 0xCu);
      }

    }
    v33 = -[AWPearlAttentionStreamer cancelEventStream](self, "cancelEventStream");
  }
  -[BKDevicePearl setQueue:](self->_pearlDevice, "setQueue:", self->_queue);
  -[BKDevicePearl setDelegate:](self->_pearlDevice, "setDelegate:", self);
  pearlDevice = self->_pearlDevice;
  v46 = 0;
  -[BKDevicePearl createPresenceDetectOperationWithError:](pearlDevice, "createPresenceDetectOperationWithError:", &v46);
  v35 = (BKFaceDetectOperation *)objc_claimAutoreleasedReturnValue();
  v20 = v46;
  pendingPresenceOperation = self->_pendingPresenceOperation;
  self->_pendingPresenceOperation = v35;

  v37 = self->_pendingPresenceOperation;
  if (v37)
  {
    -[BKFaceDetectOperation setDelegate:](v37, "setDelegate:", self);
    -[BKFaceDetectOperation setQueue:](self->_pendingPresenceOperation, "setQueue:", self->_queue);
    -[BKFaceDetectOperation setMode:](self->_pendingPresenceOperation, "setMode:", 1);
    -[BKFaceDetectOperation setEyeRelief:](self->_pendingPresenceOperation, "setEyeRelief:", var0);
    if (v8)
    {
      v38 = (void *)MEMORY[0x1B5DF9110](v8);
      callbackBlock = self->_callbackBlock;
      self->_callbackBlock = v38;

    }
    v40 = self->_pendingPresenceOperation;
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __83__AWPearlAttentionStreamer_streamEventWithBlock_options_operationStartFailedBlock___block_invoke;
    v44[3] = &unk_1E5F8DDA8;
    v44[4] = self;
    v45 = v9;
    -[BKFaceDetectOperation startWithReply:](v40, "startWithReply:", v44);
    v41 = v45;
    v19 = v20;

    v20 = v19;
  }
  else
  {
    if (currentLogLevel < 3)
      goto LABEL_23;
    _AALog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v42 = absTimeNS();
      if (v42 == -1)
        v43 = INFINITY;
      else
        v43 = (double)v42 / 1000000000.0;
      *(_DWORD *)buf = 134218242;
      v48 = v43;
      v49 = 2112;
      v50 = v20;
      _os_log_error_impl(&dword_1AF589000, v19, OS_LOG_TYPE_ERROR, "%13.5f: Creating presence detect operation failed with error: %@", buf, 0x16u);
    }
  }
LABEL_22:

LABEL_23:
  return v20;
}

- (id)cancelEventStream
{
  BKFaceDetectOperation *v3;
  BKFaceDetectOperation *v4;
  BKFaceDetectOperation *pendingPresenceOperation;
  id callbackBlock;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD block[4];
  BKFaceDetectOperation *v12;
  AWPearlAttentionStreamer *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_attentionStreamerRunning)
  {
    v3 = self->_pendingPresenceOperation;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__AWPearlAttentionStreamer_cancelEventStream__block_invoke;
    block[3] = &unk_1E5F8EC40;
    v12 = v3;
    v13 = self;
    v4 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    pendingPresenceOperation = self->_pendingPresenceOperation;
    self->_pendingPresenceOperation = 0;

    self->_attentionStreamerRunning = 0;
    callbackBlock = self->_callbackBlock;
    self->_callbackBlock = 0;

    self->_eyeReliefStarted = 0;
    v7 = 0;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2FE0];
    v14 = *MEMORY[0x1E0CB2D50];
    v15[0] = CFSTR(" Attention streamer not running");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v4 = (BKFaceDetectOperation *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 3, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- ($EB925890EBEBD6850280D1FB85A9BD43)getStreamerOptions
{
  return ($EB925890EBEBD6850280D1FB85A9BD43)(self->_eyeReliefStarted | ((self->_pendingPresenceOperation != 0) << 8));
}

- (BOOL)attentionStreamerRunning
{
  return self->_attentionStreamerRunning;
}

- (void)setIsAttentionAwareFeaturesEnabled:(BOOL)a3
{
  self->_isAttentionAwareFeaturesEnabled = a3;
}

- (BOOL)isAttentionAwareFeaturesEnabled
{
  return self->_isAttentionAwareFeaturesEnabled;
}

- (void)sendNotification:(unint64_t)a3
{
  void (**notificationBlock)(id, unint64_t);

  notificationBlock = (void (**)(id, unint64_t))self->_notificationBlock;
  if (notificationBlock)
    notificationBlock[2](notificationBlock, a3);
}

- (void)setSmartCoverState:(BOOL)a3
{
  _BOOL4 smartCoverClosed;
  NSObject *v5;
  unint64_t v6;
  double v7;
  const char *v8;
  id v9;
  int v10;
  double v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  smartCoverClosed = self->_smartCoverClosed;
  if (smartCoverClosed != a3)
  {
    self->_smartCoverClosed = a3;
    smartCoverClosed = a3;
    if (currentLogLevel >= 6)
    {
      _AALog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = absTimeNS();
        if (v6 == -1)
          v7 = INFINITY;
        else
          v7 = (double)v6 / 1000000000.0;
        v8 = "Closed";
        if (!self->_smartCoverClosed)
          v8 = "Opened";
        v10 = 134218242;
        v11 = v7;
        v12 = 2080;
        v13 = v8;
        _os_log_impl(&dword_1AF589000, v5, OS_LOG_TYPE_DEFAULT, "%13.5f: Smart cover state changed to %s", (uint8_t *)&v10, 0x16u);
      }

      smartCoverClosed = self->_smartCoverClosed;
    }
  }
  if (smartCoverClosed && self->_attentionStreamerRunning)
  {
    v9 = -[AWPearlAttentionStreamer cancelEventStream](self, "cancelEventStream");
    (*((void (**)(void))self->_notificationBlock + 2))();
  }
}

- (void)setDisplayState:(BOOL)a3
{
  _BOOL4 displayOn;
  _BOOL4 v5;
  NSObject *v6;
  unint64_t v7;
  double v8;
  const char *v9;
  id v10;
  int v11;
  double v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  displayOn = self->_displayOn;
  if (displayOn != a3)
  {
    v5 = a3;
    self->_displayOn = a3;
    displayOn = a3;
    if (currentLogLevel >= 6)
    {
      _AALog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = absTimeNS();
        if (v7 == -1)
          v8 = INFINITY;
        else
          v8 = (double)v7 / 1000000000.0;
        v9 = "OFF";
        if (v5)
          v9 = "ON";
        v11 = 134218242;
        v12 = v8;
        v13 = 2080;
        v14 = v9;
        _os_log_impl(&dword_1AF589000, v6, OS_LOG_TYPE_DEFAULT, "%13.5f: Display state changed to %s", (uint8_t *)&v11, 0x16u);
      }

      displayOn = self->_displayOn;
    }
  }
  if (!displayOn && self->_attentionStreamerRunning)
  {
    v10 = -[AWPearlAttentionStreamer cancelEventStream](self, "cancelEventStream");
    (*((void (**)(void))self->_notificationBlock + 2))();
  }
}

- (void)operation:(id)a3 faceDetectStateChanged:(id)a4
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  AWPearlAttentionStreamer *v12;
  unint64_t v13;
  void *v14;
  float v15;
  float v16;
  void *v17;
  float v18;
  float v19;
  NSObject *v20;
  unint64_t v21;
  double v22;
  BKFaceDetectOperation *pendingPresenceOperation;
  const char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  unint64_t v30;
  double v31;
  NSObject *v32;
  unint64_t v33;
  double v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  AWFaceDetectAttentionEvent *v40;
  unint64_t v41;
  double v42;
  void (**callbackBlock)(id, NSObject *);
  AWPearlAttentionStreamer *v44;
  void *v45;
  void *v46;
  int v47;
  int v48;
  unint64_t v49;
  int v50;
  id v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _OWORD v57[4];
  float v58;
  float v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  uint8_t buf[4];
  double v64;
  __int16 v65;
  AWPearlAttentionStreamer *v66;
  __int16 v67;
  id v68;
  __int16 v69;
  BKFaceDetectOperation *v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  AWPearlAttentionStreamer *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  double v86;
  __int16 v87;
  double v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v51 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  memset(v57, 0, sizeof(v57));
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v7 = objc_msgSend(v6, "faceDetected");
  objc_msgSend(v6, "pitch");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "yaw");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "roll");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "orientation");
  if ((unint64_t)(v10 - 1) >= 4)
    v11 = 0;
  else
    v11 = v10;
  v49 = v11;
  objc_msgSend(v6, "distance");
  v12 = (AWPearlAttentionStreamer *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v6, "eyeReliefStatus");
  switch(v13)
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
      v50 = 0;
      break;
    default:
      v13 = 0;
      v50 = 1;
      break;
  }
  objc_msgSend(v6, "attentionScore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  v16 = v15 / 10.0;
  v58 = v15 / 10.0;

  objc_msgSend(v6, "faceDetectionScore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatValue");
  v19 = v18;
  v59 = v18;

  v62 = 0;
  v61 = 0u;
  v60 = 0u;
  if (currentLogLevel >= 7)
  {
    _AALog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = absTimeNS();
      v45 = v9;
      v46 = v8;
      v44 = v12;
      if (v21 == -1)
        v22 = INFINITY;
      else
        v22 = (double)v21 / 1000000000.0;
      pendingPresenceOperation = self->_pendingPresenceOperation;
      if (v7)
        v24 = "FACE FOUND";
      else
        v24 = "FACE NOT FOUND";
      getFaceDetectOrientationDescription(v49);
      v25 = objc_claimAutoreleasedReturnValue();
      getEyeReliefFaceStateDescription(v13);
      v47 = v7;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134221058;
      v64 = v22;
      v65 = 2112;
      v66 = self;
      v67 = 2048;
      v68 = v51;
      v69 = 2048;
      v70 = pendingPresenceOperation;
      v71 = 2080;
      v72 = v24;
      v73 = 2112;
      v74 = v52;
      v75 = 2112;
      v76 = v8;
      v77 = 2112;
      v78 = v9;
      v79 = 2112;
      v80 = v25;
      v27 = (void *)v25;
      v81 = 2112;
      v12 = v44;
      v82 = v44;
      v83 = 2112;
      v84 = v26;
      v85 = 2048;
      v86 = v16;
      v87 = 2048;
      v88 = v19;
      _os_log_impl(&dword_1AF589000, v20, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ operation %p currentOperation %p faceDetectStateChanged %s pitch: %@ yaw: %@ roll: %@ orientation: %@ distance: %@ eyeReliefFaceState:%@ attentionScore: %ffaceDetectionScore: %f", buf, 0x84u);

      v7 = v47;
    }

  }
  LOBYTE(v53) = v7;
  memset_pattern16(v57, &unk_1AF5B9140, 0x40uLL);
  *(_QWORD *)&v56 = v13;
  -[AWPearlAttentionStreamer doubleValue](v12, "doubleValue");
  *((_QWORD *)&v55 + 1) = v28;
  if (!self->_eyeReliefStarted)
    goto LABEL_30;
  if (!v50)
  {
    if (currentLogLevel >= 6)
    {
      _AALog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = absTimeNS();
        v48 = v7;
        if (v33 == -1)
          v34 = INFINITY;
        else
          v34 = (double)v33 / 1000000000.0;
        getEyeReliefFaceStateDescription(v13);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v64 = v34;
        v65 = 2112;
        v66 = v12;
        v67 = 2112;
        v68 = v35;
        _os_log_impl(&dword_1AF589000, v32, OS_LOG_TYPE_DEFAULT, "%13.5f: Distance from EyeRelief network: %@ EyeReliefState: %@", buf, 0x20u);

        v7 = v48;
      }

    }
LABEL_30:
    if (v7)
    {
      objc_msgSend(v52, "doubleValue");
      *((_QWORD *)&v53 + 1) = v36;
      objc_msgSend(v8, "doubleValue");
      *(_QWORD *)&v54 = v37;
      objc_msgSend(v9, "doubleValue");
      *((_QWORD *)&v54 + 1) = v38;
      *(_QWORD *)&v55 = v49;
    }
    v39 = 5;
    if (!self->_eyeReliefStarted)
      v39 = 1;
    *((_QWORD *)&v56 + 1) = v39;
    v40 = [AWFaceDetectAttentionEvent alloc];
    v41 = absTimeNS();
    if (v41 == -1)
      v42 = INFINITY;
    else
      v42 = (double)v41 / 1000000000.0;
    v29 = -[AWFaceDetectAttentionEvent initWithTimestamp:tagIndex:faceMetadata:](v40, "initWithTimestamp:tagIndex:faceMetadata:", 0, &v53, v42, v44, v45, v46);
    callbackBlock = (void (**)(id, NSObject *))self->_callbackBlock;
    if (callbackBlock)
      callbackBlock[2](callbackBlock, v29);
    goto LABEL_39;
  }
  if (currentLogLevel >= 3)
  {
    _AALog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = absTimeNS();
      if (v30 == -1)
        v31 = INFINITY;
      else
        v31 = (double)v30 / 1000000000.0;
      *(_DWORD *)buf = 134217984;
      v64 = v31;
      _os_log_error_impl(&dword_1AF589000, v29, OS_LOG_TYPE_ERROR, "%13.5f: Invalid eyeRelief frame handed up to this layer. Don't pass this up", buf, 0xCu);
    }
LABEL_39:

  }
}

- (void)operation:(id)a3 finishedWithReason:(int64_t)a4
{
  id v6;
  NSObject *v7;
  unint64_t v8;
  double v9;
  char *v10;
  id v11;
  uint8_t buf[4];
  double v13;
  __int16 v14;
  id v15;
  __int16 v16;
  char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (currentLogLevel >= 6)
  {
    _AALog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = absTimeNS();
      if (v8 == -1)
        v9 = INFINITY;
      else
        v9 = (double)v8 / 1000000000.0;
      if ((unint64_t)(a4 - 1) >= 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown BKOperationEndReason %llu"), a4);
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v10 = (char *)objc_msgSend(v11, "UTF8String");

      }
      else
      {
        v10 = off_1E5F8DDE8[a4 - 1];
      }
      *(_DWORD *)buf = 134218498;
      v13 = v9;
      v14 = 2112;
      v15 = v6;
      v16 = 2080;
      v17 = v10;
      _os_log_impl(&dword_1AF589000, v7, OS_LOG_TYPE_DEFAULT, "%13.5f: Operation %@ cancelled due to reason: %s", buf, 0x20u);
    }

  }
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    -[AWPearlAttentionStreamer sendNotification:](self, "sendNotification:", 1);
    self->_attentionStreamerRunning = 0;
  }

}

- (id)unitTestDevice
{
  return self->_pearlDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_notificationBlock, 0);
  objc_storeStrong(&self->_callbackBlock, 0);
  objc_storeStrong((id *)&self->_finishingPresenceOperation, 0);
  objc_storeStrong((id *)&self->_pendingPresenceOperation, 0);
  objc_storeStrong((id *)&self->_pearlDevice, 0);
}

void __45__AWPearlAttentionStreamer_cancelEventStream__block_invoke(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  double v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  if (currentLogLevel >= 6)
  {
    _AALog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = absTimeNS();
      if (v3 == -1)
        v4 = INFINITY;
      else
        v4 = (double)v3 / 1000000000.0;
      v6 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v7 = 134218498;
      v8 = v4;
      v9 = 2112;
      v10 = v5;
      v11 = 2048;
      v12 = v6;
      _os_log_impl(&dword_1AF589000, v2, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ cancelled presence operation %p", (uint8_t *)&v7, 0x20u);
    }

  }
}

void __83__AWPearlAttentionStreamer_streamEventWithBlock_options_operationStartFailedBlock___block_invoke(uint64_t a1, int a2, void *a3)
{
  char *v5;
  NSObject *v6;
  unint64_t v7;
  double v8;
  NSObject *v9;
  unint64_t v10;
  double v11;
  uint64_t v12;
  void *v13;
  int v14;
  const char *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[4];
  char *v25;
  id v26;
  uint8_t buf[4];
  double v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    if (currentLogLevel >= 6)
    {
      _AALog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = absTimeNS();
        if (v7 == -1)
          v8 = INFINITY;
        else
          v8 = (double)v7 / 1000000000.0;
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(void **)(v12 + 16);
        v14 = objc_msgSend(v13, "eyeRelief");
        v15 = "without";
        *(_DWORD *)buf = 134218754;
        v29 = 2112;
        v28 = v8;
        if (v14)
          v15 = "with";
        v30 = v12;
        v31 = 2048;
        v32 = v13;
        v33 = 2080;
        v34 = v15;
        _os_log_impl(&dword_1AF589000, v6, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ presence operation %p successfully started for streaming %s eyeRelief", buf, 0x2Au);
      }

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 1;
    v16 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "eyeRelief");
    v17 = *(_QWORD *)(a1 + 32);
    if (v16)
      *(_BYTE *)(v17 + 64) = 1;
    else
      *(_BYTE *)(v17 + 64) = 0;
  }
  else
  {
    if (currentLogLevel >= 6)
    {
      _AALog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = absTimeNS();
        if (v10 == -1)
          v11 = INFINITY;
        else
          v11 = (double)v10 / 1000000000.0;
        v18 = *(_QWORD *)(a1 + 32);
        v19 = *(void **)(v18 + 16);
        *(_DWORD *)buf = 134218754;
        v28 = v11;
        v29 = 2112;
        v30 = v18;
        v31 = 2048;
        v32 = v19;
        v33 = 2112;
        v34 = v5;
        _os_log_impl(&dword_1AF589000, v9, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ failed to start presence operation %p: %@ for streaming", buf, 0x2Au);
      }

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 0;
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(void **)(v20 + 32);
    *(_QWORD *)(v20 + 32) = 0;

    v22 = *(void **)(a1 + 40);
    v23 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __83__AWPearlAttentionStreamer_streamEventWithBlock_options_operationStartFailedBlock___block_invoke_29;
    v24[3] = &unk_1E5F8EB38;
    v26 = v22;
    v25 = v5;
    dispatch_async(v23, v24);

  }
}

uint64_t __83__AWPearlAttentionStreamer_streamEventWithBlock_options_operationStartFailedBlock___block_invoke_29(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (int *)(v2 + 68);
  v4 = *(NSObject **)(v2 + 56);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke_2;
  v5[3] = &unk_1E5F8DD40;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  v6 = *(id *)(a1 + 32);
  notify_register_dispatch("com.apple.AttentionAwareness.SupportedEventsChanged", v3, v4, v5);

  objc_destroyWeak(&v7);
}

void __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke_10(uint64_t a1, char a2)
{
  _QWORD *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  v3 = *(_QWORD **)(a1 + 32);
  v4 = v3[7];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke_2_11;
  v5[3] = &unk_1E5F8EB88;
  v6 = v3;
  v7 = a2;
  dispatch_sync(v4, v5);

}

void __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke_3(uint64_t a1, char a2)
{
  _QWORD *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  v3 = *(_QWORD **)(a1 + 32);
  v4 = v3[7];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke_4;
  v5[3] = &unk_1E5F8EB88;
  v6 = v3;
  v7 = a2;
  dispatch_sync(v4, v5);

}

uint64_t __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke_5(uint64_t a1, int token)
{
  uint64_t result;
  uint64_t v4;
  NSObject *v5;
  unint64_t v6;
  double v7;
  uint64_t state64;
  uint8_t buf[4];
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  state64 = 0;
  result = notify_get_state(token, &state64);
  v4 = *(_QWORD *)(a1 + 32);
  if (state64 - 1 > 1)
  {
    *(_BYTE *)(v4 + 88) = 0;
  }
  else
  {
    *(_BYTE *)(v4 + 88) = 1;
    result = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(result + 48))
    {
      if (currentLogLevel >= 6)
      {
        _AALog();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v6 = absTimeNS();
          if (v6 == -1)
            v7 = INFINITY;
          else
            v7 = (double)v6 / 1000000000.0;
          *(_DWORD *)buf = 134217984;
          v10 = v7;
          _os_log_impl(&dword_1AF589000, v5, OS_LOG_TYPE_DEFAULT, "%13.5f: Match or enroll operation initiated when a stream was running, cancelling stream and sending a notification to clients", buf, 0xCu);
        }

        result = *(_QWORD *)(a1 + 32);
      }
      objc_msgSend((id)result, "sendNotification:", 1);
      return (uint64_t)(id)objc_msgSend(*(id *)(a1 + 32), "cancelEventStream");
    }
  }
  return result;
}

uint64_t __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSmartCoverState:", BKSHIDServicesIsSmartCoverClosed() != 0);
}

uint64_t __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSmartCoverState:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke_2_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDisplayState:", *(unsigned __int8 *)(a1 + 40));
}

void __50__AWPearlAttentionStreamer_initForUnitTest_queue___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  unint64_t v4;
  double v5;
  int v6;
  const char *v7;
  id v8;
  int v9;
  double v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setIsAttentionAwareFeaturesEnabled:", _AXSAttentionAwarenessFeaturesEnabled() != 0);
  if (currentLogLevel >= 7)
  {
    _AALog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = absTimeNS();
      if (v4 == -1)
        v5 = INFINITY;
      else
        v5 = (double)v4 / 1000000000.0;
      v6 = objc_msgSend(WeakRetained, "isAttentionAwareFeaturesEnabled");
      v7 = "OFF";
      if (v6)
        v7 = "ON";
      v9 = 134218242;
      v10 = v5;
      v11 = 2080;
      v12 = v7;
      _os_log_impl(&dword_1AF589000, v3, OS_LOG_TYPE_DEFAULT, "%13.5f: User toggled the Attention Aware Features flag to %s", (uint8_t *)&v9, 0x16u);
    }

  }
  if ((objc_msgSend(WeakRetained, "isAttentionAwareFeaturesEnabled") & 1) == 0)
  {
    if (objc_msgSend(WeakRetained, "attentionStreamerRunning"))
      v8 = (id)objc_msgSend(*(id *)(a1 + 32), "cancelEventStream");
    objc_msgSend(WeakRetained, "sendNotification:", 4);
  }

}

@end
