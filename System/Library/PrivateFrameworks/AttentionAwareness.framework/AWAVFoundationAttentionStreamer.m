@implementation AWAVFoundationAttentionStreamer

- (id)initForUnitTest:(BOOL)a3 queue:(id)a4
{
  id v7;
  AWAVFoundationAttentionStreamer *v8;
  AWAVFoundationAttentionStreamer *v9;
  id notificationBlock;
  id callbackBlock;
  NSString *identifier;
  AVFoundationEngine *AVFoundationEngine;
  AVFoundationUnitTestStreamerCreating *unitTester;
  AWUnitTestSampler *unitTestController;
  uint64_t v16;
  AWAVFoundationAttentionStreamer *v17;
  uint64_t v18;
  AWUnitTestSampler *v19;
  uint64_t v20;
  AVFoundationUnitTestStreamerCreating *v21;
  void *v22;
  AWAVFoundationAttentionStreamer *v23;
  void *v24;
  id *v25;
  NSObject *queue;
  _QWORD v28[4];
  AWAVFoundationAttentionStreamer *v29;
  _QWORD v30[4];
  AWAVFoundationAttentionStreamer *v31;
  _QWORD v32[4];
  AWAVFoundationAttentionStreamer *v33;
  _QWORD block[4];
  AWAVFoundationAttentionStreamer *v35;
  id v36;
  dispatch_once_t predicate;
  id location;
  objc_super v39;

  v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)AWAVFoundationAttentionStreamer;
  v8 = -[AWAVFoundationAttentionStreamer init](&v39, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_unitTest = a3;
    objc_storeStrong((id *)&v8->_queue, a4);
    v9->_attentionStreamerRunning = 0;
    notificationBlock = v9->_notificationBlock;
    v9->_notificationBlock = 0;

    callbackBlock = v9->_callbackBlock;
    v9->_callbackBlock = 0;

    identifier = v9->_identifier;
    v9->_identifier = (NSString *)CFSTR("AVFoundationAttentionStreamer");

    *(_WORD *)&v9->_currentOptions.AWAttentionStreamerActivateEyeRelief = 0;
    v9->_currentOptions.AWAttentionStreamerActivatePersonDetection = 0;
    AVFoundationEngine = v9->_AVFoundationEngine;
    v9->_AVFoundationEngine = 0;

    unitTester = v9->_unitTester;
    v9->_unitTester = 0;

    unitTestController = v9->_unitTestController;
    v9->_unitTestController = 0;

    objc_initWeak(&location, v9);
    predicate = 0;
    v16 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__AWAVFoundationAttentionStreamer_initForUnitTest_queue___block_invoke;
    block[3] = &unk_1E5F8E458;
    v17 = v9;
    v35 = v17;
    objc_copyWeak(&v36, &location);
    dispatch_once(&predicate, block);
    -[AWAVFoundationAttentionStreamer setIsAttentionAwareFeaturesEnabled:](v17, "setIsAttentionAwareFeaturesEnabled:", _AXSAttentionAwarenessFeaturesEnabled() != 0);
    if (v9->_unitTest)
    {
      +[AWUnitTestPearlDevice sharedDevice](AWUnitTestPearlDevice, "sharedDevice");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v9->_unitTestController;
      v9->_unitTestController = (AWUnitTestSampler *)v18;

      -[AWUnitTestSampler AVFoundationSession](v9->_unitTestController, "AVFoundationSession");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v9->_unitTester;
      v9->_unitTester = (AVFoundationUnitTestStreamerCreating *)v20;

      *(_WORD *)&v17->_displayOn = 1;
      -[AWAVFoundationAttentionStreamer unitTestController](v17, "unitTestController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v16;
      v32[1] = 3221225472;
      v32[2] = __57__AWAVFoundationAttentionStreamer_initForUnitTest_queue___block_invoke_6;
      v32[3] = &unk_1E5F8E718;
      v23 = v17;
      v33 = v23;
      objc_msgSend(v22, "setDisplayCallback:", v32);

      -[AWAVFoundationAttentionStreamer unitTestController](v23, "unitTestController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v16;
      v30[1] = 3221225472;
      v30[2] = __57__AWAVFoundationAttentionStreamer_initForUnitTest_queue___block_invoke_3;
      v30[3] = &unk_1E5F8E718;
      v31 = v23;
      objc_msgSend(v24, "setSmartCoverCallback:", v30);
      v25 = (id *)&v33;

    }
    else
    {
      queue = v9->_queue;
      v28[0] = v16;
      v28[1] = 3221225472;
      v28[2] = __57__AWAVFoundationAttentionStreamer_initForUnitTest_queue___block_invoke_5;
      v28[3] = &unk_1E5F8EC18;
      v25 = (id *)&v29;
      v29 = v17;
      dispatch_async(queue, v28);
    }

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)setNotificationHandler:(id)a3
{
  id v4;
  void *v5;
  id notificationBlock;
  id v7;

  v4 = a3;
  if (!v4)
    __assert_rtn("-[AWAVFoundationAttentionStreamer setNotificationHandler:]", "AVFoundationAttentionStreamer.m", 184, "notificationBlock != nil");
  v7 = v4;
  v5 = (void *)MEMORY[0x1B5DF9110]();
  notificationBlock = self->_notificationBlock;
  self->_notificationBlock = v5;

}

- (id)streamEventWithBlock:(id)a3 options:(id)a4 operationStartFailedBlock:(id)a5
{
  unsigned int v5;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString **v12;
  uint64_t *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *callbackBlock;
  void *v17;
  unint64_t v19;
  double v20;
  NSObject *v21;
  unint64_t v22;
  double v23;
  unint64_t v24;
  double v25;
  unint64_t v26;
  double v27;
  unint64_t v28;
  double v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  unint64_t v35;
  double v36;
  uint64_t v37;
  const __CFString *v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  const __CFString *v42;
  uint64_t v43;
  const __CFString *v44;
  uint8_t buf[4];
  double v46;
  uint64_t v47;

  v5 = *(_DWORD *)&a4.var0;
  v47 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!-[AWAVFoundationAttentionStreamer isAttentionAwareFeaturesEnabled](self, "isAttentionAwareFeaturesEnabled"))
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v24 = absTimeNS();
        if (v24 == -1)
          v25 = INFINITY;
        else
          v25 = (double)v24 / 1000000000.0;
        *(_DWORD *)buf = 134217984;
        v46 = v25;
        _os_log_error_impl(&dword_1AF589000, v14, OS_LOG_TYPE_ERROR, "%13.5f: User has AttentionAware features off, cannot start streaming operation with Pearl", buf, 0xCu);
      }

    }
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2FE0];
    v43 = *MEMORY[0x1E0CB2D50];
    v44 = CFSTR(" Attention Aware Features turned OFF");
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = &v44;
    v13 = &v43;
    goto LABEL_16;
  }
  if (!self->_displayOn)
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v28 = absTimeNS();
        if (v28 == -1)
          v29 = INFINITY;
        else
          v29 = (double)v28 / 1000000000.0;
        *(_DWORD *)buf = 134217984;
        v46 = v29;
        _os_log_error_impl(&dword_1AF589000, v15, OS_LOG_TYPE_ERROR, "%13.5f: Display OFF, not starting attention stream", buf, 0xCu);
      }

    }
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2FE0];
    v41 = *MEMORY[0x1E0CB2D50];
    v42 = CFSTR(" Display OFF");
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = &v42;
    v13 = &v41;
    goto LABEL_16;
  }
  if (!self->_smartCoverClosed)
  {
    if (self->_attentionStreamerRunning)
    {
      if (((v5 >> 8) & 1) == self->_currentOptions.AWAttentionStreamerActivateAttentionDetection
        && (v5 & 1) == self->_currentOptions.AWAttentionStreamerActivateEyeRelief)
      {
        if (currentLogLevel >= 6)
        {
          _AALog();
          callbackBlock = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(callbackBlock, OS_LOG_TYPE_DEFAULT))
          {
            v19 = absTimeNS();
            if (v19 == -1)
              v20 = INFINITY;
            else
              v20 = (double)v19 / 1000000000.0;
            *(_DWORD *)buf = 134217984;
            v46 = v20;
            _os_log_impl(&dword_1AF589000, callbackBlock, OS_LOG_TYPE_DEFAULT, "%13.5f: Attention streamer already running, don't start another operation", buf, 0xCu);
          }
          v17 = 0;
          goto LABEL_17;
        }
        goto LABEL_45;
      }
      if (currentLogLevel >= 6)
      {
        _AALog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = absTimeNS();
          if (v22 == -1)
            v23 = INFINITY;
          else
            v23 = (double)v22 / 1000000000.0;
          *(_DWORD *)buf = 134217984;
          v46 = v23;
          _os_log_impl(&dword_1AF589000, v21, OS_LOG_TYPE_DEFAULT, "%13.5f: Cancelling current stream and starting a new one as stream options have changed", buf, 0xCu);
        }

      }
      v30 = -[AWAVFoundationAttentionStreamer cancelEventStream](self, "cancelEventStream");
    }
    self->_currentOptions.AWAttentionStreamerActivateAttentionDetection = BYTE1(v5) & 1;
    self->_currentOptions.AWAttentionStreamerActivateEyeRelief = v5 & 1;
    self->_currentOptions.AWAttentionStreamerActivatePersonDetection = 0;
    if (!-[AWAVFoundationAttentionStreamer getStreamingSessionAndStartRunning](self, "getStreamingSessionAndStartRunning"))
    {
      v32 = (void *)MEMORY[0x1E0CB35C8];
      v33 = *MEMORY[0x1E0CB2FE0];
      v37 = *MEMORY[0x1E0CB2D50];
      v38 = CFSTR(" Unable to get a streaming session from AVFoundation");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "errorWithDomain:code:userInfo:", v33, 6, v34);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (currentLogLevel < 3)
        goto LABEL_18;
      _AALog();
      callbackBlock = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(callbackBlock, OS_LOG_TYPE_ERROR))
      {
        v35 = absTimeNS();
        if (v35 == -1)
          v36 = INFINITY;
        else
          v36 = (double)v35 / 1000000000.0;
        *(_DWORD *)buf = 134217984;
        v46 = v36;
        _os_log_error_impl(&dword_1AF589000, callbackBlock, OS_LOG_TYPE_ERROR, "%13.5f: Unable to get streaming session and start running", buf, 0xCu);
      }
      goto LABEL_17;
    }
    if (v7)
    {
      v31 = (void *)MEMORY[0x1B5DF9110](v7);
      v17 = 0;
      callbackBlock = self->_callbackBlock;
      self->_callbackBlock = v31;
      goto LABEL_17;
    }
LABEL_45:
    v17 = 0;
    goto LABEL_18;
  }
  if (currentLogLevel >= 3)
  {
    _AALog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v26 = absTimeNS();
      if (v26 == -1)
        v27 = INFINITY;
      else
        v27 = (double)v26 / 1000000000.0;
      *(_DWORD *)buf = 134217984;
      v46 = v27;
      _os_log_error_impl(&dword_1AF589000, v8, OS_LOG_TYPE_ERROR, "%13.5f: Smart cover closed, not starting attention stream", buf, 0xCu);
    }

  }
  v9 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0CB2FE0];
  v39 = *MEMORY[0x1E0CB2D50];
  v40 = CFSTR(" Smart cover closed");
  v11 = (void *)MEMORY[0x1E0C99D80];
  v12 = &v40;
  v13 = &v39;
LABEL_16:
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 1);
  callbackBlock = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 1, callbackBlock);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

LABEL_18:
  return v17;
}

- (id)cancelEventStream
{
  id callbackBlock;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_attentionStreamerRunning)
  {
    -[AWAVFoundationAttentionStreamer stopStreaming](self, "stopStreaming");
    self->_attentionStreamerRunning = 0;
    callbackBlock = self->_callbackBlock;
    self->_callbackBlock = 0;

    *(_WORD *)&self->_currentOptions.AWAttentionStreamerActivateEyeRelief = 0;
    return 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0CB2FE0];
    v9 = *MEMORY[0x1E0CB2D50];
    v10[0] = CFSTR(" Attention streamer not running");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 3, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
}

- ($EB925890EBEBD6850280D1FB85A9BD43)getStreamerOptions
{
  return ($EB925890EBEBD6850280D1FB85A9BD43)*(unsigned __int16 *)&self->_currentOptions.AWAttentionStreamerActivateEyeRelief;
}

- (BOOL)attentionStreamerRunning
{
  return self->_attentionStreamerRunning;
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
    v10 = -[AWAVFoundationAttentionStreamer cancelEventStream](self, "cancelEventStream");
    (*((void (**)(void))self->_notificationBlock + 2))();
  }
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
    v9 = -[AWAVFoundationAttentionStreamer cancelEventStream](self, "cancelEventStream");
    (*((void (**)(void))self->_notificationBlock + 2))();
  }
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

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  notificationBlock = (void (**)(id, unint64_t))self->_notificationBlock;
  if (notificationBlock)
    notificationBlock[2](notificationBlock, a3);
}

- (BOOL)getStreamingSessionAndStartRunning
{
  void *v3;
  NSObject *v4;
  unint64_t v5;
  double v6;
  AVFoundationEngine *AVFoundationEngine;
  AVFoundationEngine *v8;
  AVFoundationEngine *v9;
  void *v10;
  char v11;
  int v13;
  double v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_unitTest)
  {
    -[AWAVFoundationAttentionStreamer unitTestDevice](self, "unitTestDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (currentLogLevel >= 6)
    {
      _AALog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = absTimeNS();
        if (v5 == -1)
          v6 = INFINITY;
        else
          v6 = (double)v5 / 1000000000.0;
        v13 = 134218242;
        v14 = v6;
        v15 = 2112;
        v16 = v3;
        _os_log_impl(&dword_1AF589000, v4, OS_LOG_TYPE_DEFAULT, "%13.5f: Using device %@ for starting AVFoundation operations", (uint8_t *)&v13, 0x16u);
      }

    }
    objc_msgSend(v3, "setAVFoundationDelegate:", self);
    v11 = objc_msgSend(v3, "startUnitTestStream:options:", self->_queue, *(unsigned __int16 *)&self->_currentOptions.AWAttentionStreamerActivateEyeRelief | ((unint64_t)self->_currentOptions.AWAttentionStreamerActivatePersonDetection << 16));

  }
  else
  {
    AVFoundationEngine = self->_AVFoundationEngine;
    if (!AVFoundationEngine)
    {
      +[AVFoundationEngine sharedEngine](AVFoundationEngine, "sharedEngine");
      v8 = (AVFoundationEngine *)objc_claimAutoreleasedReturnValue();
      v9 = self->_AVFoundationEngine;
      self->_AVFoundationEngine = v8;

      AVFoundationEngine = self->_AVFoundationEngine;
    }
    if (-[AVFoundationEngine registerForOperation:activateAttentionDetection:activateEyeRelief:activatePersonDetection:identifier:](AVFoundationEngine, "registerForOperation:activateAttentionDetection:activateEyeRelief:activatePersonDetection:identifier:", self, self->_currentOptions.AWAttentionStreamerActivateAttentionDetection, self->_currentOptions.AWAttentionStreamerActivateEyeRelief, self->_currentOptions.AWAttentionStreamerActivatePersonDetection, self->_identifier))
    {
      -[AVFoundationEngine startOperationForReceiver:](self->_AVFoundationEngine, "startOperationForReceiver:", self->_identifier);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10 == 0;

    }
    else
    {
      return 0;
    }
  }
  return v11;
}

- (void)receiveMetadata:(id)a3 type:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  char v15;
  uint64_t v16;
  float v17;
  float v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  unint64_t v33;
  double v34;
  const char *v35;
  void *v36;
  void *v37;
  char v38;
  AWFaceDetectAttentionEvent *v39;
  unint64_t v40;
  double v41;
  AWFaceDetectAttentionEvent *v42;
  double v43;
  double v44;
  _OWORD v45[3];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _OWORD v51[3];
  uint8_t buf[4];
  double v53;
  __int16 v54;
  AWAVFoundationAttentionStreamer *v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  double v71;
  __int16 v72;
  double v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  queue = self->_queue;
  v8 = a4;
  dispatch_assert_queue_V2(queue);
  v50 = 0u;
  memset(v51, 0, sizeof(v51));
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  memset(v45, 0, sizeof(v45));
  v9 = (id)*MEMORY[0x1E0C8AA38];

  if (v9 == v8)
  {
    v22 = v6;
    v12 = v22;
    v23 = 0uLL;
    memset((char *)v51 + 8, 0, 40);
    *((_QWORD *)&v46 + 1) = 1;
    if (v22)
    {
      if (objc_msgSend(v22, "hasPayingAttention", v45[0], v45[1], v45[2], v46, v47, v48, v49, v50, v51[0], v51[1], v51[2])&& (!objc_msgSend(v12, "hasPayingAttention") || (objc_msgSend(v12, "payingAttention") & 1) != 0))
      {
        v16 = 0;
        v17 = 0.0;
        if (objc_msgSend(v12, "hasPayingAttention") && objc_msgSend(v12, "payingAttention"))
        {
          LOBYTE(v45[0]) = 1;
          v20 = 0;
          v21 = 0;
          if (objc_msgSend(v12, "hasPitchAngle", *(_QWORD *)&v45[0]))
          {
            objc_msgSend(v12, "pitchAngle");
            v21 = v24;
          }
          *((_QWORD *)&v45[0] + 1) = v21;
          if (objc_msgSend(v12, "hasYawAngle"))
          {
            objc_msgSend(v12, "yawAngle");
            v20 = v25;
          }
          *(_QWORD *)&v45[1] = v20;
          v19 = 0;
          if (objc_msgSend(v12, "hasRollAngle"))
          {
            objc_msgSend(v12, "rollAngle");
            v19 = v26;
          }
          *((_QWORD *)&v45[1] + 1) = v19;
          if (objc_msgSend(v12, "hasDistance"))
          {
            objc_msgSend(v12, "distance");
            v16 = v27;
          }
          *((_QWORD *)&v45[2] + 1) = v16;
          if (objc_msgSend(v12, "hasOrientation"))
          {
            v28 = objc_msgSend(v12, "orientation");
            if ((unint64_t)(v28 - 1) >= 4)
              v13 = 0;
            else
              v13 = (void *)v28;
          }
          else
          {
            v13 = 0;
          }
          *(_QWORD *)&v45[2] = v13;
          v18 = 0.0;
          if (objc_msgSend(v12, "hasPayingAttentionConfidence"))
          {
            objc_msgSend(v12, "payingAttentionConfidence");
            v18 = v43 * 100.0;
          }
          *(float *)v51 = v18;
          if (objc_msgSend(v12, "hasConfidence"))
          {
            objc_msgSend(v12, "confidence");
            v17 = v44 * 100.0;
          }
          v12 = 0;
          *((float *)v51 + 1) = v17;
          v14 = 1;
          goto LABEL_36;
        }
        v12 = 0;
        v13 = 0;
        v14 = 0;
        goto LABEL_34;
      }
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v23 = 0uLL;
    }
    else
    {
      v13 = 0;
      v14 = 0;
    }
    LOBYTE(v45[0]) = 0;
    *(_QWORD *)&v51[0] = 0;
    *(_OWORD *)((char *)v45 + 8) = v23;
    *(_OWORD *)((char *)&v45[1] + 8) = v23;
  }
  else
  {
    objc_msgSend(v6, "type", v45[0], v45[1], v45[2], v46, v47, v48, v49, v50, v51[0], v51[1], v51[2]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)*MEMORY[0x1E0C8AA30];

    if (v10 != v11)
    {
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 1;
      v16 = 0;
      v17 = 0.0;
      v18 = 0.0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      goto LABEL_37;
    }
    v29 = v6;
    v13 = v29;
    *((_QWORD *)&v46 + 1) = 2;
    if (v29)
    {
      v30 = objc_msgSend(v29, "eyeReliefStatus");
      if ((unint64_t)(v30 - 1) >= 5)
        v12 = 0;
      else
        v12 = (void *)v30;
      *(_QWORD *)&v46 = v12;
      v19 = 0;
      v16 = 0;
      if (objc_msgSend(v13, "hasDistance"))
      {
        objc_msgSend(v13, "distance");
        v16 = v31;
      }
      v13 = 0;
      v14 = 0;
      *((_QWORD *)&v45[2] + 1) = v16;
      v17 = 0.0;
      v18 = 0.0;
      goto LABEL_35;
    }
    v12 = 0;
    v14 = 0;
    *((_QWORD *)&v45[2] + 1) = 0;
    *(_QWORD *)&v46 = 0;
  }
  v16 = 0;
  v17 = 0.0;
LABEL_34:
  v18 = 0.0;
  v19 = 0;
LABEL_35:
  v20 = 0;
  v21 = 0;
LABEL_36:

  v15 = 0;
LABEL_37:
  if (currentLogLevel >= 7)
  {
    _AALog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = absTimeNS();
      if (v33 == -1)
        v34 = INFINITY;
      else
        v34 = (double)v33 / 1000000000.0;
      if (v14)
        v35 = "FACE FOUND";
      else
        v35 = "FACE NOT FOUND";
      getFaceDetectOrientationDescription((unint64_t)v13);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      getEyeReliefFaceStateDescription((unint64_t)v12);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134220546;
      v53 = v34;
      v54 = 2112;
      v55 = self;
      v56 = 2080;
      v57 = v35;
      v58 = 2048;
      v59 = v21;
      v60 = 2048;
      v61 = v20;
      v62 = 2048;
      v63 = v19;
      v64 = 2112;
      v65 = v36;
      v66 = 2048;
      v67 = v16;
      v68 = 2112;
      v69 = v37;
      v70 = 2048;
      v71 = v18;
      v72 = 2048;
      v73 = v17;
      _os_log_impl(&dword_1AF589000, v32, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ faceDetectStateChanged %s pitch: %13.5f yaw: %13.5f roll: %13.5f orientation: %@ distance: %13.5f eyeReliefFaceState:%@ attentionScore: %ffaceDetectionScore: %f", buf, 0x70u);

    }
  }
  if (self->_callbackBlock)
    v38 = v15;
  else
    v38 = 1;
  if ((v38 & 1) == 0)
  {
    v39 = [AWFaceDetectAttentionEvent alloc];
    v40 = absTimeNS();
    if (v40 == -1)
      v41 = INFINITY;
    else
      v41 = (double)v40 / 1000000000.0;
    v42 = -[AWFaceDetectAttentionEvent initWithTimestamp:tagIndex:faceMetadata:](v39, "initWithTimestamp:tagIndex:faceMetadata:", 0, v45, v41);
    (*((void (**)(id))self->_callbackBlock + 2))(self->_callbackBlock);

  }
}

- (void)receiveNotificationOfName:(id)a3 notification:(id)a4
{
  char *v6;
  id v7;
  NSObject *v8;
  unint64_t v9;
  double v10;
  NSObject *v11;
  unint64_t v12;
  double v13;
  NSObject *v14;
  unint64_t v15;
  double v16;
  unint64_t v17;
  double v18;
  char *v19;
  id v20;
  const char *v21;
  const char *v22;
  _BOOL4 AWAttentionStreamerActivatePersonDetection;
  const char *v24;
  int v25;
  double v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = a4;
  if (currentLogLevel >= 6)
  {
    _AALog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = absTimeNS();
      if (v9 == -1)
        v10 = INFINITY;
      else
        v10 = (double)v9 / 1000000000.0;
      v25 = 134218242;
      v26 = v10;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_1AF589000, v8, OS_LOG_TYPE_DEFAULT, "%13.5f: Notification %@ received", (uint8_t *)&v25, 0x16u);
    }

  }
  if (objc_msgSend(v6, "isEqual:", *MEMORY[0x1E0C8A1B8]))
  {
    if (!v7 || currentLogLevel < 6)
      goto LABEL_29;
    _AALog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = absTimeNS();
      if (v12 == -1)
        v13 = INFINITY;
      else
        v13 = (double)v12 / 1000000000.0;
      objc_msgSend(v7, "userInfo");
      v19 = (char *)objc_claimAutoreleasedReturnValue();
      v25 = 134218242;
      v26 = v13;
      v27 = 2112;
      v28 = v19;
      _os_log_impl(&dword_1AF589000, v11, OS_LOG_TYPE_DEFAULT, "%13.5f: Runtime error received: %@", (uint8_t *)&v25, 0x16u);

    }
    goto LABEL_28;
  }
  if (objc_msgSend(v6, "isEqual:", *MEMORY[0x1E0C8A128]))
  {
    self->_attentionStreamerRunning = 1;
    if (currentLogLevel >= 6)
    {
      _AALog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = absTimeNS();
        if (v15 == -1)
          v16 = INFINITY;
        else
          v16 = (double)v15 / 1000000000.0;
        v21 = "IS RUNNING";
        if (self->_currentOptions.AWAttentionStreamerActivateEyeRelief)
          v22 = "IS RUNNING";
        else
          v22 = "IS NOT RUNNING";
        AWAttentionStreamerActivatePersonDetection = self->_currentOptions.AWAttentionStreamerActivatePersonDetection;
        if (self->_currentOptions.AWAttentionStreamerActivateAttentionDetection)
          v24 = "IS RUNNING";
        else
          v24 = "IS NOT RUNNING";
        v25 = 134218754;
        if (!AWAttentionStreamerActivatePersonDetection)
          v21 = "IS NOT RUNNING";
        v26 = v16;
        v27 = 2080;
        v28 = v22;
        v29 = 2080;
        v30 = v24;
        v31 = 2080;
        v32 = v21;
        _os_log_impl(&dword_1AF589000, v14, OS_LOG_TYPE_DEFAULT, "%13.5f: Attention detection session started ER %s, AD/FD %s PD %s", (uint8_t *)&v25, 0x2Au);
      }

    }
  }
  else if ((objc_msgSend(v6, "isEqual:", *MEMORY[0x1E0C8A130]) & 1) == 0)
  {
    if (objc_msgSend(v6, "isEqual:", *MEMORY[0x1E0C8A1C8]))
    {
      if (currentLogLevel < 6)
      {
LABEL_29:
        -[AWAVFoundationAttentionStreamer sendNotification:](self, "sendNotification:", 1);
        v20 = -[AWAVFoundationAttentionStreamer cancelEventStream](self, "cancelEventStream");
        goto LABEL_30;
      }
      _AALog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v17 = absTimeNS();
        if (v17 == -1)
          v18 = INFINITY;
        else
          v18 = (double)v17 / 1000000000.0;
        v25 = 134217984;
        v26 = v18;
        _os_log_impl(&dword_1AF589000, v11, OS_LOG_TYPE_DEFAULT, "%13.5f: Streaming session was interrupted", (uint8_t *)&v25, 0xCu);
      }
LABEL_28:

      goto LABEL_29;
    }
    objc_msgSend(v6, "isEqual:", *MEMORY[0x1E0C8A140]);
  }
LABEL_30:

}

- (void)stopStreaming
{
  id v2;

  if (self->_unitTest)
  {
    -[AWAVFoundationAttentionStreamer unitTestDevice](self, "unitTestDevice");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancelUnitTestStream");

  }
  else
  {
    -[AVFoundationEngine unregisterForOperation:](self->_AVFoundationEngine, "unregisterForOperation:", self->_identifier);
  }
}

- (void)receiveStreamingEvent
{
  _BOOL8 AWAttentionStreamerActivateEyeRelief;
  double v4;
  uint64_t v5;
  AWFaceDetectAttentionEvent *v6;
  unint64_t v7;
  double v8;
  AWFaceDetectAttentionEvent *v9;
  void (**callbackBlock)(id, void *);
  _OWORD v11[2];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  v12 = 0u;
  v13 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  memset(v11, 0, sizeof(v11));
  AWAttentionStreamerActivateEyeRelief = self->_currentOptions.AWAttentionStreamerActivateEyeRelief;
  v4 = 100.0;
  if (!self->_currentOptions.AWAttentionStreamerActivateEyeRelief)
    v4 = 0.0;
  v5 = 1;
  if (self->_currentOptions.AWAttentionStreamerActivateEyeRelief)
    v5 = 2;
  *((double *)&v12 + 1) = v4;
  *(_QWORD *)&v13 = AWAttentionStreamerActivateEyeRelief;
  *((_QWORD *)&v13 + 1) = v5;
  v6 = [AWFaceDetectAttentionEvent alloc];
  v7 = absTimeNS();
  if (v7 == -1)
    v8 = INFINITY;
  else
    v8 = (double)v7 / 1000000000.0;
  v9 = -[AWFaceDetectAttentionEvent initWithTimestamp:tagIndex:faceMetadata:](v6, "initWithTimestamp:tagIndex:faceMetadata:", 0, v11, v8);
  callbackBlock = (void (**)(id, void *))self->_callbackBlock;
  if (callbackBlock)
    callbackBlock[2](callbackBlock, v9);

}

- (id)unitTestDevice
{
  return self->_unitTester;
}

- (id)unitTestController
{
  return self->_unitTestController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_unitTestController, 0);
  objc_storeStrong((id *)&self->_unitTester, 0);
  objc_storeStrong((id *)&self->_AVFoundationEngine, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_notificationBlock, 0);
  objc_storeStrong(&self->_callbackBlock, 0);
}

void __57__AWAVFoundationAttentionStreamer_initForUnitTest_queue___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int *v2;
  NSObject *v3;
  _QWORD handler[4];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (int *)(v1 + 48);
  v3 = *(NSObject **)(v1 + 32);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __57__AWAVFoundationAttentionStreamer_initForUnitTest_queue___block_invoke_2;
  handler[3] = &unk_1E5F8E7D8;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  notify_register_dispatch("com.apple.AttentionAwareness.SupportedEventsChanged", v2, v3, handler);
  objc_destroyWeak(&v5);
}

void __57__AWAVFoundationAttentionStreamer_initForUnitTest_queue___block_invoke_6(uint64_t a1, char a2)
{
  _QWORD *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  v3 = *(_QWORD **)(a1 + 32);
  v4 = v3[4];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__AWAVFoundationAttentionStreamer_initForUnitTest_queue___block_invoke_2_7;
  v5[3] = &unk_1E5F8EB88;
  v6 = v3;
  v7 = a2;
  dispatch_sync(v4, v5);

}

void __57__AWAVFoundationAttentionStreamer_initForUnitTest_queue___block_invoke_3(uint64_t a1, char a2)
{
  _QWORD *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  v3 = *(_QWORD **)(a1 + 32);
  v4 = v3[4];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__AWAVFoundationAttentionStreamer_initForUnitTest_queue___block_invoke_4;
  v5[3] = &unk_1E5F8EB88;
  v6 = v3;
  v7 = a2;
  dispatch_sync(v4, v5);

}

uint64_t __57__AWAVFoundationAttentionStreamer_initForUnitTest_queue___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSmartCoverState:", BKSHIDServicesIsSmartCoverClosed() != 0);
}

uint64_t __57__AWAVFoundationAttentionStreamer_initForUnitTest_queue___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSmartCoverState:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __57__AWAVFoundationAttentionStreamer_initForUnitTest_queue___block_invoke_2_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDisplayState:", *(unsigned __int8 *)(a1 + 40));
}

void __57__AWAVFoundationAttentionStreamer_initForUnitTest_queue___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  unint64_t v3;
  double v4;
  int v5;
  const char *v6;
  id v7;
  int v8;
  double v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIsAttentionAwareFeaturesEnabled:", _AXSAttentionAwarenessFeaturesEnabled() != 0);
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
      v5 = objc_msgSend(WeakRetained, "isAttentionAwareFeaturesEnabled");
      v6 = "OFF";
      if (v5)
        v6 = "ON";
      v8 = 134218242;
      v9 = v4;
      v10 = 2080;
      v11 = v6;
      _os_log_impl(&dword_1AF589000, v2, OS_LOG_TYPE_DEFAULT, "%13.5f: User toggled the Attention Aware Features flag to %s", (uint8_t *)&v8, 0x16u);
    }

  }
  if ((objc_msgSend(WeakRetained, "isAttentionAwareFeaturesEnabled") & 1) == 0)
  {
    if (objc_msgSend(WeakRetained, "attentionStreamerRunning"))
      v7 = (id)objc_msgSend(WeakRetained, "cancelEventStream");
    objc_msgSend(WeakRetained, "sendNotification:", 4);
  }

}

@end
