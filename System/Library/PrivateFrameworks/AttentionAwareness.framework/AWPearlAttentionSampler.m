@implementation AWPearlAttentionSampler

- (int)currentState
{
  objc_super v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  if (!self->_displayState && !self->_currentOptions.AWAttentionSamplerActivateMotionDetection)
    return 4;
  v4.receiver = self;
  v4.super_class = (Class)AWPearlAttentionSampler;
  return -[AWAttentionSampler currentState](&v4, sel_currentState);
}

- (void)shouldSample:(BOOL)a3 withDeadline:(unint64_t)a4 withOptions:(id)a5
{
  int v5;
  _BOOL4 v7;
  SamplingOperation *currentOperation;

  v5 = *(_DWORD *)&a5.var0;
  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  currentOperation = self->_currentOperation;
  if (v7)
  {
    if (!currentOperation)
      -[AWPearlAttentionSampler triggerFaceDetectWithDeadline:options:](self, "triggerFaceDetectWithDeadline:options:", a4, *(_QWORD *)&v5 & 0xFFFFFFLL);
  }
  else if (currentOperation)
  {
    -[AWPearlAttentionSampler cancelFaceDetect:](self, "cancelFaceDetect:", CFSTR("!shouldSample"));
  }
}

- (AWPearlAttentionSampler)initWithOptions:(id)a3
{
  id v4;
  void *v5;
  AWPearlAttentionSampler *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("useAVFoundation"));
    v6 = (AWPearlAttentionSampler *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "valueForKey:", CFSTR("unitTest"));
      v6 = (AWPearlAttentionSampler *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v5, "valueForKey:", CFSTR("unitTest"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "BOOLValue");

        objc_msgSend(v5, "valueForKey:", CFSTR("useAVFoundation"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "BOOLValue");

        self = (AWPearlAttentionSampler *)-[AWPearlAttentionSampler initForUnitTest:useAVFoundation:](self, "initForUnitTest:useAVFoundation:", v8, v10);
        v6 = self;
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)initForUnitTest:(BOOL)a3 useAVFoundation:(BOOL)a4
{
  _BOOL4 v5;
  AWPearlAttentionSampler *v6;
  AWPearlAttentionSampler *v7;
  SamplingOperation *currentOperation;
  SamplingOperation *finishingOperation;
  SamplingOperation *unitTestOperation;
  uint64_t v11;
  SamplingOperation *v12;
  void *v13;
  uint64_t v14;
  id *v15;
  AWPearlAttentionSampler *v16;
  void *v17;
  id *v18;
  AWPearlAttentionSampler *v19;
  void *v20;
  NSObject *queue;
  uint64_t v22;
  int *v23;
  NSObject *v24;
  _QWORD handler[4];
  int *v27;
  _QWORD block[4];
  int *v29;
  _QWORD v30[4];
  AWPearlAttentionSampler *v31;
  _QWORD v32[4];
  AWPearlAttentionSampler *v33;
  _QWORD v34[4];
  AWPearlAttentionSampler *v35;
  objc_super v36;

  v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)AWPearlAttentionSampler;
  v6 = -[AWAttentionSampler init](&v36, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_useAVFoundation = a4;
    v6->_unitTest = v5;
    currentOperation = v6->_currentOperation;
    v6->_currentOperation = 0;

    finishingOperation = v7->_finishingOperation;
    v7->_finishingOperation = 0;

    unitTestOperation = v7->_unitTestOperation;
    v7->_unitTestOperation = 0;

    v7->_signpostLogged = 0;
    v7->_enrollOrMatchOperationUnderway = 0;
    if (v5)
    {
      -[AWPearlAttentionSampler createNewSamplingOperation](v7, "createNewSamplingOperation");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v7->_unitTestOperation;
      v7->_unitTestOperation = (SamplingOperation *)v11;

      v7->_displayState = 1;
      -[AWAttentionSampler setUnitTestMode](v7, "setUnitTestMode");
      -[AWPearlAttentionSampler unitTestSampler](v7, "unitTestSampler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MEMORY[0x1E0C809B0];
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke;
      v34[3] = &unk_1E5F8E718;
      v15 = (id *)&v35;
      v16 = v7;
      v35 = v16;
      objc_msgSend(v13, "setDisplayCallback:", v34);

      -[AWPearlAttentionSampler unitTestSampler](v16, "unitTestSampler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v14;
      v32[1] = 3221225472;
      v32[2] = __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke_3;
      v32[3] = &unk_1E5F8E718;
      v18 = (id *)&v33;
      v19 = v16;
      v33 = v19;
      objc_msgSend(v17, "setSmartCoverCallback:", v32);

      -[AWPearlAttentionSampler unitTestSampler](v19, "unitTestSampler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v14;
      v30[1] = 3221225472;
      v30[2] = __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke_5;
      v30[3] = &unk_1E5F8E718;
      v31 = v19;
      objc_msgSend(v20, "setCarplayStateChangedCallback:", v30);

    }
    else
    {
      v7->_carPlayConnected = 0;
      queue = v7->super._queue;
      v22 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke_7;
      block[3] = &unk_1E5F8EC18;
      v15 = (id *)&v29;
      v23 = v7;
      v29 = v23;
      dispatch_async(queue, block);
      v24 = v7->super._queue;
      handler[0] = v22;
      handler[1] = 3221225472;
      handler[2] = __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke_8;
      handler[3] = &unk_1E5F8E740;
      v18 = (id *)&v27;
      v27 = v23;
      notify_register_dispatch("com.apple.BiometricKit.activeOperation", v23 + 66, v24, handler);
    }

  }
  return v7;
}

- (id)createNewSamplingOperation
{
  __objc2_class **v3;
  void *v4;

  if (self->_useAVFoundation)
    v3 = off_1E5F8D568;
  else
    v3 = &off_1E5F8D5D0;
  v4 = (void *)objc_msgSend(objc_alloc(*v3), "initWithQueue:forUnitTest:", self->super._queue, self->_unitTest);
  objc_msgSend(v4, "setDelegate:", self);
  return v4;
}

- (void)triggerFaceDetectWithDeadline:(unint64_t)a3 options:(id)a4
{
  int v4;
  uint64_t v7;
  void *v8;
  int64_t v9;
  unint64_t v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  unint64_t v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  NSObject *v23;
  unint64_t v24;
  double v25;
  unint64_t v26;
  double v27;
  unint64_t lastErrorTime;
  double v29;
  void *v30;
  NSObject *v31;
  unint64_t v32;
  double v33;
  _QWORD v34[5];
  uint8_t buf[4];
  double v36;
  __int16 v37;
  AWPearlAttentionSampler *v38;
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;
  __int16 v43;
  double v44;
  uint64_t v45;

  v4 = *(_DWORD *)&a4.var0;
  v45 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  -[AWPearlAttentionSampler createNewSamplingOperation](self, "createNewSamplingOperation");
  v7 = objc_claimAutoreleasedReturnValue();
  if (self->_currentOperation)
    __assert_rtn("-[AWPearlAttentionSampler triggerFaceDetectWithDeadline:options:]", "PearlAttentionSampler.m", 178, "!_currentOperation");
  v8 = (void *)v7;
  self->_operationCreateTime = absTimeNS();
  if (a3)
    v9 = a3 - absTimeNS();
  else
    v9 = 0;
  v10 = -[AWPearlAttentionSampler minimumAttentionSamplerErrorRetryTime](self, "minimumAttentionSamplerErrorRetryTime");
  if (v10 >= absTimeNS())
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v26 = absTimeNS();
        if (v26 == -1)
          v27 = INFINITY;
        else
          v27 = (double)v26 / 1000000000.0;
        lastErrorTime = self->_lastErrorTime;
        if (lastErrorTime == -1)
          v29 = INFINITY;
        else
          v29 = (double)lastErrorTime / 1000000000.0;
        *(_DWORD *)buf = 134218498;
        v36 = v27;
        v37 = 2112;
        v38 = self;
        v39 = 2048;
        v40 = v29;
        _os_log_error_impl(&dword_1AF589000, v12, OS_LOG_TYPE_ERROR, "%13.5f: %@ not creating presence operation because our last error was at %13.5f", buf, 0x20u);
      }

    }
  }
  else
  {
    if (v9 < 1)
      v11 = 0.0;
    else
      v11 = (double)(unint64_t)v9 / 1000000000.0;
    objc_msgSend(v8, "createPresenceDetectOperationWithTimeout:options:", *(_QWORD *)&v4 & 0xFFFFFFLL, v11);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v30 = (void *)v13;
      if (currentLogLevel >= 3)
      {
        _AALog();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v32 = absTimeNS();
          if (v32 == -1)
            v33 = INFINITY;
          else
            v33 = (double)v32 / 1000000000.0;
          *(_DWORD *)buf = 134218498;
          v36 = v33;
          v37 = 2112;
          v38 = self;
          v39 = 2112;
          v40 = *(double *)&v30;
          _os_log_error_impl(&dword_1AF589000, v31, OS_LOG_TYPE_ERROR, "%13.5f: %@ failed to create presence operation: %@", buf, 0x20u);
        }

      }
      -[AWPearlAttentionSampler pearlAttentionSamplerErrorOccurred](self, "pearlAttentionSamplerErrorOccurred");

    }
    else
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __65__AWPearlAttentionSampler_triggerFaceDetectWithDeadline_options___block_invoke;
      v34[3] = &unk_1E5F8E768;
      v34[4] = self;
      objc_msgSend(v8, "startPresenceDetectOperation:", v34);
      self->_signpostLogged = 0;
      _AALog();
      v14 = objc_claimAutoreleasedReturnValue();
      _AALog();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_signpost_id_generate(v15);

      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AF589000, v14, OS_SIGNPOST_EVENT, v16, "AA: Face detect started", (const char *)&unk_1AF5B9EFB, buf, 2u);
      }

      self->_currentOptions.AWAttentionSamplerActivateAttentionDetection = v4 & 1;
      self->_currentOptions.AWAttentionSamplerActivateMotionDetection = BYTE1(v4) & 1;
      -[AWPearlAttentionSampler setCurrentState:](self, "setCurrentState:", 2);
      if (currentLogLevel >= 6)
      {
        _AALog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = absTimeNS();
          if (v18 == -1)
            v19 = INFINITY;
          else
            v19 = (double)v18 / 1000000000.0;
          if (a3 == -1)
            v20 = INFINITY;
          else
            v20 = (double)a3 / 1000000000.0;
          if (v9 == -1)
            v21 = INFINITY;
          else
            v21 = (double)(unint64_t)v9 / 1000000000.0;
          *(_DWORD *)buf = 134219010;
          v36 = v19;
          v37 = 2112;
          v38 = self;
          v39 = 2048;
          v40 = *(double *)&v8;
          v41 = 2048;
          v42 = v20;
          v43 = 2048;
          v44 = v21;
          _os_log_impl(&dword_1AF589000, v17, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ starting presence operation %p with deadline %13.5f, interval %13.5f", buf, 0x34u);
        }

      }
      -[AWAttentionSampler sampleLogger](self, "sampleLogger");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sampleStartedWithDeadline:", a3);

      objc_storeStrong((id *)&self->_currentOperation, v8);
      -[AWPearlAttentionSampler cancelStalledTimer](self, "cancelStalledTimer");
      if (self->_enrollOrMatchOperationUnderway)
      {
        if (currentLogLevel >= 6)
        {
          _AALog();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v24 = absTimeNS();
            if (v24 == -1)
              v25 = INFINITY;
            else
              v25 = (double)v24 / 1000000000.0;
            *(_DWORD *)buf = 134217984;
            v36 = v25;
            _os_log_impl(&dword_1AF589000, v23, OS_LOG_TYPE_DEFAULT, "%13.5f: Match or enroll operation underway, initialize the state immediately", buf, 0xCu);
          }

        }
        -[AWPearlAttentionSampler updateFaceState:](self, "updateFaceState:", 3);
      }
      else
      {
        -[AWPearlAttentionSampler startStalledTimerForOperation:](self, "startStalledTimerForOperation:", v8);
      }
    }
  }

}

- (void)faceDetectStalled:(id)a3
{
  SamplingOperation *v4;
  void *v5;
  NSObject *v6;
  unint64_t v7;
  double v8;
  NSObject *queue;
  void (**v10)(_QWORD, _QWORD);
  _QWORD block[4];
  SamplingOperation *v12;
  id v13;
  AWPearlAttentionSampler *v14;
  uint8_t buf[4];
  double v16;
  __int16 v17;
  AWPearlAttentionSampler *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (SamplingOperation *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("operation %p currentOperation %p faceDetectStalled"), v4, self->_currentOperation);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
      *(_DWORD *)buf = 134218498;
      v16 = v8;
      v17 = 2112;
      v18 = self;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1AF589000, v6, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ %@", buf, 0x20u);
    }

  }
  if (self->_currentOperation == v4)
  {
    -[AWPearlAttentionSampler updateFaceState:](self, "updateFaceState:", 4);
    -[AWPearlAttentionSampler cancelFaceDetect:](self, "cancelFaceDetect:", v5);
    -[AWAttentionSampler stateChangedCallback](self, "stateChangedCallback");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v10)[2](v10, v5);
  }
  else
  {
    queue = self->super._queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__AWPearlAttentionSampler_faceDetectStalled___block_invoke;
    block[3] = &unk_1E5F8E790;
    v12 = v4;
    v13 = v5;
    v14 = self;
    dispatch_async(queue, block);

    v10 = (void (**)(_QWORD, _QWORD))v12;
  }

}

- (void)finishingFaceDetect:(id)a3
{
  id v4;
  SamplingOperation *currentOperation;
  NSObject *v6;
  unint64_t v7;
  double v8;
  SamplingOperation *v9;
  SamplingOperation *v10;
  id v11;
  int v12;
  double v13;
  __int16 v14;
  AWPearlAttentionSampler *v15;
  __int16 v16;
  SamplingOperation *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  currentOperation = self->_currentOperation;
  if (currentOperation)
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
        v9 = self->_currentOperation;
        v12 = 134218754;
        v13 = v8;
        v14 = 2112;
        v15 = self;
        v16 = 2048;
        v17 = v9;
        v18 = 2112;
        v19 = v4;
        _os_log_impl(&dword_1AF589000, v6, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ finishing presence operation %p (%@)", (uint8_t *)&v12, 0x2Au);
      }

      currentOperation = self->_currentOperation;
    }
    objc_storeStrong((id *)&self->_finishingOperation, currentOperation);
    v10 = self->_currentOperation;
    self->_currentOperation = 0;

    if (-[SamplingOperation operationBackend](self->_finishingOperation, "operationBackend") == 2)
      v11 = (id)-[SamplingOperation cancelActiveOperation:](self->_finishingOperation, "cancelActiveOperation:", CFSTR("Finish"));
  }

}

- (void)cancelFaceDetect:(id)a3
{
  SamplingOperation *currentOperation;
  id v5;
  SamplingOperation *v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  currentOperation = self->_currentOperation;
  if (currentOperation)
  {
    v5 = (id)-[SamplingOperation cancelActiveOperation:](currentOperation, "cancelActiveOperation:", v7);
    v6 = self->_currentOperation;
    self->_currentOperation = 0;

    -[AWPearlAttentionSampler setCurrentState:](self, "setCurrentState:", 0);
    -[AWPearlAttentionSampler cancelStalledTimer](self, "cancelStalledTimer");
  }

}

- (void)updateFaceState:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  -[AWPearlAttentionSampler updateFaceState:withFaceMetadata:](self, "updateFaceState:withFaceMetadata:", v3, 0);
}

- (void)updateFaceState:(int)a3 withFaceMetadata:(AWFaceDetectMetadata *)a4
{
  uint64_t v5;
  unint64_t v7;
  const char *v8;
  double v9;
  void *v10;
  NSObject *v11;
  unint64_t v12;
  double v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  void *v17;
  double v18;
  uint64_t i;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  double v27;
  double v28;
  double v29;
  uint64_t j;
  void *v31;
  void *v32;
  unsigned int (**v33)(void);
  double v34;
  int v35;
  void (**v36)(_QWORD, _QWORD);
  double v37;
  void (**v38)(_QWORD, _QWORD);
  uint8_t buf[4];
  double v40;
  __int16 v41;
  AWPearlAttentionSampler *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v5 = *(_QWORD *)&a3;
  v45 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  if ((v5 - 3) >= 3)
    __assert_rtn("-[AWPearlAttentionSampler updateFaceState:withFaceMetadata:]", "PearlAttentionSampler.m", 347, "(state == AWAttentionSamplerStateInitialized) || (state == AWAttentionSamplerStateAbsent) || (state == AWAttentionSamplerStatePresent)");
  v7 = absTimeNS();
  v8 = "FACE FOUND";
  if ((_DWORD)v5 != 5)
    v8 = "FACE NOT FOUND";
  if (v7 == -1)
    v9 = INFINITY;
  else
    v9 = (double)v7 / 1000000000.0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("updateFaceState:withFaceMetadata: %s at %13.5f"), v8, *(_QWORD *)&v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (currentLogLevel >= 6)
  {
    _AALog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = absTimeNS();
      if (v12 == -1)
        v13 = INFINITY;
      else
        v13 = (double)v12 / 1000000000.0;
      *(_DWORD *)buf = 134218498;
      v40 = v13;
      v41 = 2112;
      v42 = self;
      v43 = 2112;
      v44 = v10;
      _os_log_impl(&dword_1AF589000, v11, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ %@", buf, 0x20u);
    }

  }
  -[AWPearlAttentionSampler cancelStalledTimer](self, "cancelStalledTimer");
  -[AWAttentionSampler setLastTriggerTime:](self, "setLastTriggerTime:", self->_operationCreateTime);
  if ((_DWORD)v5 != 5)
    goto LABEL_55;
  -[AWAttentionSampler setLastPositiveDetectTime:](self, "setLastPositiveDetectTime:", v7);
  if (a4)
  {
    if (!self->_signpostLogged)
    {
      _AALog();
      v14 = objc_claimAutoreleasedReturnValue();
      _AALog();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_signpost_id_generate(v15);

      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AF589000, v14, OS_SIGNPOST_EVENT, v16, "AA: Face detect success", (const char *)&unk_1AF5B9EFB, buf, 2u);
      }

      self->_signpostLogged = 1;
    }
    -[AWAttentionSampler setLastFaceMetadataValid:](self, "setLastFaceMetadataValid:", a4->var0);
    -[AWAttentionSampler setLastPitch:](self, "setLastPitch:", a4->var1);
    -[AWAttentionSampler setLastYaw:](self, "setLastYaw:", a4->var2);
    -[AWAttentionSampler setLastRoll:](self, "setLastRoll:", a4->var3);
    -[AWAttentionSampler setLastOrientation:](self, "setLastOrientation:", a4->var4);
    -[AWAttentionSampler setLastDistance:](self, "setLastDistance:", a4->var5);
    -[AWAttentionSampler setLastMetadataType:](self, "setLastMetadataType:", a4->var7);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AWAttentionSampler setLastMotionData:](self, "setLastMotionData:", v17);

    for (i = 0; i != 16; ++i)
    {
      *(float *)&v18 = a4->var8[i];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AWAttentionSampler lastMotionData](self, "lastMotionData");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:atIndexedSubscript:", v20, i);

    }
    *(float *)&v18 = a4->var9;
    -[AWAttentionSampler setLastAttentionScore:](self, "setLastAttentionScore:", v18);
    *(float *)&v22 = a4->var10;
    -[AWAttentionSampler setLastFaceDetectionScore:](self, "setLastFaceDetectionScore:", v22);
    -[AWAttentionSampler setLastFaceBounds:](self, "setLastFaceBounds:", a4->var12.origin.x, a4->var12.origin.y, a4->var12.size.width, a4->var12.size.height);
    -[AWAttentionSampler setLastPersonID:](self, "setLastPersonID:", a4->var11);
  }
  if (self->_currentOperation)
  {
    -[AWAttentionSampler sampleLogger](self, "sampleLogger");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sampleSucceeded");

  }
  if (!a4)
  {
LABEL_55:
    if (!self->_signpostLogged)
    {
      _AALog();
      v24 = objc_claimAutoreleasedReturnValue();
      _AALog();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = os_signpost_id_generate(v25);

      if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AF589000, v24, OS_SIGNPOST_EVENT, v26, "AA: Face detect failed", (const char *)&unk_1AF5B9EFB, buf, 2u);
      }

      self->_signpostLogged = 1;
    }
    -[AWAttentionSampler setLastFaceMetadataValid:](self, "setLastFaceMetadataValid:", 0);
    -[AWAttentionSampler setLastPitch:](self, "setLastPitch:", 0.0);
    -[AWAttentionSampler setLastYaw:](self, "setLastYaw:", 0.0);
    -[AWAttentionSampler setLastRoll:](self, "setLastRoll:", 0.0);
    -[AWAttentionSampler setLastOrientation:](self, "setLastOrientation:", 0);
    -[AWAttentionSampler setLastDistance:](self, "setLastDistance:", 0.0);
    -[AWAttentionSampler setLastMetadataType:](self, "setLastMetadataType:", 0);
    LODWORD(v27) = 0;
    -[AWAttentionSampler setLastAttentionScore:](self, "setLastAttentionScore:", v27);
    LODWORD(v28) = 0;
    -[AWAttentionSampler setLastFaceDetectionScore:](self, "setLastFaceDetectionScore:", v28);
    for (j = 0; j != 16; ++j)
    {
      LODWORD(v29) = 2143289344;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[AWAttentionSampler lastMotionData](self, "lastMotionData");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:atIndexedSubscript:", v31, j);

    }
    -[AWAttentionSampler setLastPersonID:](self, "setLastPersonID:", 0);
    -[AWAttentionSampler setLastFaceBounds:](self, "setLastFaceBounds:", 0.0, 0.0, 0.0, 0.0);
    if ((_DWORD)v5 != 5)
    {
      -[SamplingOperation Timeout](self->_currentOperation, "Timeout");
      if (v34 != 0.0)
        goto LABEL_42;
      goto LABEL_41;
    }
  }
  -[AWAttentionSampler operationEndableCallback](self, "operationEndableCallback");
  v33 = (unsigned int (**)(void))objc_claimAutoreleasedReturnValue();
  if (v33[2]())
  {

LABEL_41:
    -[AWPearlAttentionSampler finishingFaceDetect:](self, "finishingFaceDetect:", v10);
    goto LABEL_42;
  }
  v35 = -[SamplingOperation operationBackend](self->_currentOperation, "operationBackend");

  if (v35 != 1)
    goto LABEL_41;
  -[AWPearlAttentionSampler setCurrentState:](self, "setCurrentState:", 0);
LABEL_42:
  -[AWPearlAttentionSampler setCurrentState:](self, "setCurrentState:", v5);
  -[AWAttentionSampler stateChangedCallback](self, "stateChangedCallback");
  v36 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v36)[2](v36, v10);

  if (-[AWPearlAttentionSampler currentState](self, "currentState") != 2)
  {
    if (-[AWPearlAttentionSampler currentState](self, "currentState") != 3
      && -[AWPearlAttentionSampler currentState](self, "currentState") != 4
      || -[SamplingOperation State](self->_currentOperation, "State") != 2
      || (-[SamplingOperation Timeout](self->_currentOperation, "Timeout"), v37 == 0.0))
    {
      if (-[AWPearlAttentionSampler currentState](self, "currentState") != 3
        || self->_currentOperation
        || self->_finishingOperation)
      {
        -[AWPearlAttentionSampler setCurrentState:](self, "setCurrentState:", 0);
        -[AWAttentionSampler stateChangedCallback](self, "stateChangedCallback");
        v38 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v38)[2](v38, v10);

      }
    }
  }

}

- (void)pearlAttentionSamplerErrorOccurred
{
  NSObject *v3;
  unint64_t v4;
  double v5;
  void (**v6)(_QWORD, _QWORD);
  int v7;
  double v8;
  __int16 v9;
  AWPearlAttentionSampler *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  self->_lastErrorTime = absTimeNS();
  -[AWPearlAttentionSampler setCurrentState:](self, "setCurrentState:", 1);
  if (currentLogLevel >= 6)
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
      v7 = 134218498;
      v8 = v5;
      v9 = 2112;
      v10 = self;
      v11 = 2112;
      v12 = CFSTR("Pearl attention sampler error!");
      _os_log_impl(&dword_1AF589000, v3, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ %@", (uint8_t *)&v7, 0x20u);
    }

  }
  -[AWAttentionSampler stateChangedCallback](self, "stateChangedCallback");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const __CFString *))v6)[2](v6, CFSTR("Pearl attention sampler error!"));

}

- (void)setCurrentState:(int)a3
{
  uint64_t v3;
  _BOOL4 v5;
  NSObject *v6;
  BOOL v7;
  NSObject *v8;
  unint64_t v9;
  double v10;
  const char *v11;
  char *AttentionSamplerStateDescription;
  char *v13;
  unint64_t v14;
  double v15;
  objc_super v16;
  uint8_t buf[4];
  double v18;
  __int16 v19;
  AWPearlAttentionSampler *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  char *v24;
  __int16 v25;
  char *v26;
  uint64_t v27;

  v3 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  if (-[AWPearlAttentionSampler currentState](self, "currentState") != (_DWORD)v3)
  {
    v5 = 1;
    switch(-[AWPearlAttentionSampler currentState](self, "currentState"))
    {
      case 0:
        v7 = (_DWORD)v3 == 4;
        goto LABEL_10;
      case 1:
      case 2:
        goto LABEL_13;
      case 3:
        v7 = (_DWORD)v3 == 2;
LABEL_10:
        v5 = !v7;
        goto LABEL_13;
      case 4:
      case 5:
        v5 = v3 == 0;
LABEL_13:
        if (currentLogLevel > 5)
          goto LABEL_14;
        if (!v5)
          return;
        goto LABEL_25;
      default:
        if (currentLogLevel < 3)
          return;
        _AALog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          v14 = absTimeNS();
          if (v14 == -1)
            v15 = INFINITY;
          else
            v15 = (double)v14 / 1000000000.0;
          *(_DWORD *)buf = 134218240;
          v18 = v15;
          v19 = 1024;
          LODWORD(v20) = -[AWPearlAttentionSampler currentState](self, "currentState");
          _os_log_error_impl(&dword_1AF589000, v6, OS_LOG_TYPE_ERROR, "%13.5f: unknown AWAttentionSamplerState %d", buf, 0x12u);
        }

        if (currentLogLevel < 6)
          return;
        v5 = 0;
LABEL_14:
        _AALog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = absTimeNS();
          if (v9 == -1)
            v10 = INFINITY;
          else
            v10 = (double)v9 / 1000000000.0;
          if (v5)
            v11 = "completing";
          else
            v11 = "ignoring invalid";
          AttentionSamplerStateDescription = getAttentionSamplerStateDescription(-[AWPearlAttentionSampler currentState](self, "currentState"));
          v13 = getAttentionSamplerStateDescription(v3);
          *(_DWORD *)buf = 134219010;
          v18 = v10;
          v19 = 2112;
          v20 = self;
          v21 = 2080;
          v22 = v11;
          v23 = 2080;
          v24 = AttentionSamplerStateDescription;
          v25 = 2080;
          v26 = v13;
          _os_log_impl(&dword_1AF589000, v8, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ %s AWAttentionSamplerState transition (%s -> %s)", buf, 0x34u);
        }

        if (v5)
        {
LABEL_25:
          v16.receiver = self;
          v16.super_class = (Class)AWPearlAttentionSampler;
          -[AWAttentionSampler setCurrentState:](&v16, sel_setCurrentState_, v3);
        }
        break;
    }
  }
}

- (unint64_t)nextSampleTimeForSamplingInterval:(unint64_t)a3 ignoreDisplayState:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  NSObject *v14;
  unint64_t v15;
  double v16;
  double v17;
  double v18;
  int v19;
  double v20;
  __int16 v21;
  AWPearlAttentionSampler *v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  __int16 v27;
  double v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  if ((-[AWAttentionSampler samplingSuppressedMask](self, "samplingSuppressedMask") & 1) != 0 && !v4)
    return -1;
  v8 = -[AWAttentionSampler lastTriggerTime](self, "lastTriggerTime");
  v9 = -[AWAttentionSampler lastPollTimeoutTime](self, "lastPollTimeoutTime");
  if (v8 <= v9)
    v10 = v9;
  else
    v10 = v8;
  v11 = v10 + a3;
  if (v10 + a3 >= 0xFFFFFFFFFFFFFFFELL)
    v11 = -2;
  if (__CFADD__(v10, a3))
    v12 = -2;
  else
    v12 = v11;
  v13 = -[AWPearlAttentionSampler minimumAttentionSamplerErrorRetryTime](self, "minimumAttentionSamplerErrorRetryTime");
  if (currentLogLevel >= 7)
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
      if (v10 == -1)
        v17 = INFINITY;
      else
        v17 = (double)v10 / 1000000000.0;
      if (v13 == -1)
        v18 = INFINITY;
      else
        v18 = (double)v13 / 1000000000.0;
      v19 = 134219010;
      v20 = v16;
      v21 = 2112;
      v22 = self;
      v23 = 2048;
      v24 = v17;
      v25 = 2048;
      v26 = (double)v12 / 1000000000.0;
      v27 = 2048;
      v28 = v18;
      _os_log_impl(&dword_1AF589000, v14, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ lastTriggerTime %13.5f nextTriggerTime %13.5f minErrorRetryTime %13.5f", (uint8_t *)&v19, 0x34u);
    }

  }
  if (v12 <= v13)
    return v13;
  else
    return v12;
}

- (unint64_t)minimumAttentionSamplerErrorRetryTime
{
  unint64_t lastErrorTime;
  unint64_t v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  lastErrorTime = self->_lastErrorTime;
  v4 = lastErrorTime + 1000000000;
  if (lastErrorTime + 1000000000 >= 0xFFFFFFFFFFFFFFFELL)
    v4 = -2;
  if (lastErrorTime < 0xFFFFFFFFC4653600)
    return v4;
  else
    return -2;
}

- (void)startStalledTimerForOperation:(id)a3
{
  id v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *operationStalledTimer;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  if (!self->_operationStalledTimer)
  {
    v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->super._queue);
    operationStalledTimer = self->_operationStalledTimer;
    self->_operationStalledTimer = v5;

    v7 = self->_operationStalledTimer;
    v8 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    v9 = self->_operationStalledTimer;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__AWPearlAttentionSampler_startStalledTimerForOperation___block_invoke;
    v10[3] = &unk_1E5F8EC40;
    v10[4] = self;
    v11 = v4;
    dispatch_source_set_event_handler(v9, v10);
    dispatch_resume((dispatch_object_t)self->_operationStalledTimer);

  }
}

- (void)cancelStalledTimer
{
  NSObject *operationStalledTimer;
  OS_dispatch_source *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  operationStalledTimer = self->_operationStalledTimer;
  if (operationStalledTimer)
  {
    dispatch_source_cancel(operationStalledTimer);
    v4 = self->_operationStalledTimer;
    self->_operationStalledTimer = 0;

  }
}

- (void)updateSuppressedMaskWithDisplayState:(BOOL)a3 smartCoverClosed:(BOOL)a4 carPlayConnected:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  v9 = -[AWAttentionSampler samplingSuppressedMask](self, "samplingSuppressedMask") & 0xFFFFFFFFFFFFFFFBLL;
  v10 = 4;
  if (!v5)
    v10 = 0;
  -[AWAttentionSampler setSamplingSuppressedMask:](self, "setSamplingSuppressedMask:", v9 | v10);
  v11 = -[AWAttentionSampler samplingSuppressedMask](self, "samplingSuppressedMask") & 0xFFFFFFFFFFFFFFFDLL;
  v12 = 2;
  if (!v6)
    v12 = 0;
  -[AWAttentionSampler setSamplingSuppressedMask:](self, "setSamplingSuppressedMask:", v11 | v12);
  -[AWAttentionSampler setSamplingSuppressedMask:](self, "setSamplingSuppressedMask:", -[AWAttentionSampler samplingSuppressedMask](self, "samplingSuppressedMask") & 0xFFFFFFFFFFFFFFFELL | !v7);
}

- (void)setCarPlayConnected:(BOOL)a3
{
  _BOOL8 v3;
  const char *v5;
  void *v6;
  NSObject *v7;
  unint64_t v8;
  double v9;
  void (**v10)(_QWORD, _QWORD);
  uint8_t buf[4];
  double v12;
  __int16 v13;
  AWPearlAttentionSampler *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  if (self->_carPlayConnected != v3)
  {
    self->_carPlayConnected = v3;
    -[AWPearlAttentionSampler updateSuppressedMaskWithDisplayState:smartCoverClosed:carPlayConnected:](self, "updateSuppressedMaskWithDisplayState:smartCoverClosed:carPlayConnected:", self->_displayState, self->_smartCoverClosed, v3);
    v5 = "Disconnected from";
    if (v3)
      v5 = "Connected to";
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s CarPlay"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
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
        *(_DWORD *)buf = 134218498;
        v12 = v9;
        v13 = 2112;
        v14 = self;
        v15 = 2112;
        v16 = v6;
        _os_log_impl(&dword_1AF589000, v7, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ %@", buf, 0x20u);
      }

    }
    -[AWAttentionSampler stateChangedCallback](self, "stateChangedCallback");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v10)[2](v10, v6);

  }
}

- (void)setDisplayState:(BOOL)a3
{
  _BOOL8 v3;
  const char *v5;
  void *v6;
  NSObject *v7;
  unint64_t v8;
  double v9;
  void (**v10)(_QWORD, _QWORD);
  uint8_t buf[4];
  double v12;
  __int16 v13;
  AWPearlAttentionSampler *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  if (self->_displayState != v3)
  {
    self->_displayState = v3;
    -[AWPearlAttentionSampler updateSuppressedMaskWithDisplayState:smartCoverClosed:carPlayConnected:](self, "updateSuppressedMaskWithDisplayState:smartCoverClosed:carPlayConnected:", v3, self->_smartCoverClosed, self->_carPlayConnected);
    v5 = "off";
    if (v3)
      v5 = "on";
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("setDisplayState %s"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
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
        *(_DWORD *)buf = 134218498;
        v12 = v9;
        v13 = 2112;
        v14 = self;
        v15 = 2112;
        v16 = v6;
        _os_log_impl(&dword_1AF589000, v7, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ %@", buf, 0x20u);
      }

    }
    if (self->_displayState)
      -[AWAttentionSampler setLastPollTimeoutTime:](self, "setLastPollTimeoutTime:", absTimeNS());
    -[AWAttentionSampler stateChangedCallback](self, "stateChangedCallback");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v10)[2](v10, v6);

  }
}

- (void)setSmartCoverClosed:(BOOL)a3
{
  _BOOL8 v3;
  const char *v5;
  void *v6;
  NSObject *v7;
  unint64_t v8;
  double v9;
  void (**v10)(_QWORD, _QWORD);
  uint8_t buf[4];
  double v12;
  __int16 v13;
  AWPearlAttentionSampler *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  if (self->_smartCoverClosed != v3)
  {
    self->_smartCoverClosed = v3;
    -[AWPearlAttentionSampler updateSuppressedMaskWithDisplayState:smartCoverClosed:carPlayConnected:](self, "updateSuppressedMaskWithDisplayState:smartCoverClosed:carPlayConnected:", self->_displayState, v3, self->_carPlayConnected);
    v5 = "open";
    if (v3)
      v5 = "closed";
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("smart cover %s"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
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
        *(_DWORD *)buf = 134218498;
        v12 = v9;
        v13 = 2112;
        v14 = self;
        v15 = 2112;
        v16 = v6;
        _os_log_impl(&dword_1AF589000, v7, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ %@", buf, 0x20u);
      }

    }
    -[AWAttentionSampler stateChangedCallback](self, "stateChangedCallback");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v10)[2](v10, v6);

  }
}

- (void)updateSamplingDeadline:(unint64_t)a3 forClient:(id)a4
{
  id v6;
  NSObject *v7;
  unint64_t v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  double v14;
  __int16 v15;
  AWPearlAttentionSampler *v16;
  __int16 v17;
  double v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  if (self->_displayState || (objc_msgSend(v6, "activateMotionDetect") & 1) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)AWPearlAttentionSampler;
    -[AWAttentionSampler updateSamplingDeadline:forClient:](&v12, sel_updateSamplingDeadline_forClient_, a3, v6);
  }
  else if (currentLogLevel >= 6)
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
      if (a3 == -1)
        v10 = INFINITY;
      else
        v10 = (double)a3 / 1000000000.0;
      objc_msgSend(v6, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v14 = v9;
      v15 = 2112;
      v16 = self;
      v17 = 2048;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1AF589000, v7, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ ignoring sample with deadline %13.5f for client %@ since sampling is disabled", buf, 0x2Au);

    }
  }

}

- (void)cameraActivityNotification:(int)a3 data:(id *)a4 forOperation:(id)a5
{
  SamplingOperation *v8;
  NSObject *v9;
  unint64_t v10;
  double v11;
  uint64_t v12;
  NSObject *v13;
  unint64_t v14;
  double v15;
  NSObject *v16;
  unint64_t v17;
  double v18;
  NSObject *v19;
  unint64_t v20;
  double v21;
  int var1;
  int v23;
  double v24;
  int v25;
  int v26;
  AWPearlAttentionSampler *v27;
  uint64_t v28;
  int v29;
  SamplingOperation *currentOperation;
  void *v31;
  SamplingOperation *v32;
  uint64_t v33;
  void *v34;
  void (**v35)(_QWORD, _QWORD);
  SamplingOperation *finishingOperation;
  NSObject *v38;
  unint64_t v39;
  double v40;
  SamplingOperation *v41;
  uint8_t buf[4];
  double v43;
  __int16 v44;
  AWPearlAttentionSampler *v45;
  __int16 v46;
  SamplingOperation *v47;
  __int16 v48;
  SamplingOperation *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = (SamplingOperation *)a5;
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
      *(_DWORD *)buf = 134218240;
      v43 = v11;
      v44 = 1024;
      LODWORD(v45) = a3;
      _os_log_impl(&dword_1AF589000, v9, OS_LOG_TYPE_DEFAULT, "%13.5f: cameraActivityNotification %u received", buf, 0x12u);
    }

  }
  switch(a3)
  {
    case 1:
      if (a4->var0.var0)
        v12 = 5;
      else
        v12 = 4;
      -[AWPearlAttentionSampler updateFaceState:withFaceMetadata:](self, "updateFaceState:withFaceMetadata:", v12, a4);
      goto LABEL_66;
    case 2:
      if (currentLogLevel >= 6)
      {
        _AALog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = absTimeNS();
          if (v14 == -1)
            v15 = INFINITY;
          else
            v15 = (double)v14 / 1000000000.0;
          var1 = a4->var1;
          *(_DWORD *)buf = 134218240;
          v43 = v15;
          v44 = 1024;
          LODWORD(v45) = var1;
          _os_log_impl(&dword_1AF589000, v13, OS_LOG_TYPE_DEFAULT, "%13.5f: Operation end reason %d received", buf, 0x12u);
        }

      }
      if (self->_currentOperation == v8)
      {
        v23 = a4->var1;
        if (a4->var1 == 4)
        {
          -[SamplingOperation Timeout](v8, "Timeout");
          if (v24 != 0.0)
            -[AWAttentionSampler setLastPollTimeoutTime:](self, "setLastPollTimeoutTime:", absTimeNS());
          v23 = a4->var1;
        }
        if (v23 == 1)
        {
          cameraActivityNotification_data_forOperation__operationEndFailureCount = 0;
        }
        else if ((unint64_t)++cameraActivityNotification_data_forOperation__operationEndFailureCount < 6)
        {
          -[AWPearlAttentionSampler updateFaceState:](self, "updateFaceState:", 4);
        }
        else
        {
          cameraActivityNotification_data_forOperation__operationEndFailureCount = 0;
          -[AWPearlAttentionSampler pearlAttentionSamplerErrorOccurred](self, "pearlAttentionSamplerErrorOccurred");
        }
        currentOperation = self->_currentOperation;
        self->_currentOperation = 0;

        -[AWPearlAttentionSampler setCurrentState:](self, "setCurrentState:", 0);
        v31 = (void *)MEMORY[0x1E0CB3940];
        v32 = self->_currentOperation;
        -[SamplingOperation Timeout](v32, "Timeout");
        objc_msgSend(v31, "stringWithFormat:", CFSTR("operation %p currentOperation %p (timeout %13.5f)"), v8, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[AWAttentionSampler stateChangedCallback](self, "stateChangedCallback");
        v35 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v35)[2](v35, v34);

      }
      finishingOperation = self->_finishingOperation;
      if (finishingOperation)
      {
        if (finishingOperation != v8 && currentLogLevel >= 6)
        {
          _AALog();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            v39 = absTimeNS();
            if (v39 == -1)
              v40 = INFINITY;
            else
              v40 = (double)v39 / 1000000000.0;
            v41 = self->_finishingOperation;
            *(_DWORD *)buf = 134218754;
            v43 = v40;
            v44 = 2112;
            v45 = self;
            v46 = 2048;
            v47 = v8;
            v48 = 2048;
            v49 = v41;
            _os_log_impl(&dword_1AF589000, v38, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ unexpected finish for operation %p, expecting operation %p", buf, 0x2Au);
          }

          finishingOperation = self->_finishingOperation;
        }
      }
      self->_finishingOperation = 0;

      goto LABEL_66;
    case 3:
      if (currentLogLevel >= 6)
      {
        _AALog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = absTimeNS();
          if (v17 == -1)
            v18 = INFINITY;
          else
            v18 = (double)v17 / 1000000000.0;
          v25 = a4->var1;
          *(_DWORD *)buf = 134218240;
          v43 = v18;
          v44 = 1024;
          LODWORD(v45) = v25;
          _os_log_impl(&dword_1AF589000, v16, OS_LOG_TYPE_DEFAULT, "%13.5f: Device event %d received", buf, 0x12u);
        }

      }
      v26 = a4->var1;
      if (a4->var1 == 4)
      {
        v27 = self;
        v28 = 4;
      }
      else if (v26 == 3)
      {
        v27 = self;
        v28 = 5;
      }
      else
      {
        if (v26 != 2)
          goto LABEL_66;
        v27 = self;
        v28 = 3;
      }
      -[AWPearlAttentionSampler updateFaceState:](v27, "updateFaceState:", v28);
LABEL_66:

      return;
    case 4:
      if (currentLogLevel >= 6)
      {
        _AALog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = absTimeNS();
          if (v20 == -1)
            v21 = INFINITY;
          else
            v21 = (double)v20 / 1000000000.0;
          v29 = a4->var1;
          *(_DWORD *)buf = 134218240;
          v43 = v21;
          v44 = 1024;
          LODWORD(v45) = v29;
          _os_log_impl(&dword_1AF589000, v19, OS_LOG_TYPE_DEFAULT, "%13.5f: Device state %d received", buf, 0x12u);
        }

      }
      if (a4->var1 == 5)
        -[AWPearlAttentionSampler pearlAttentionSamplerErrorOccurred](self, "pearlAttentionSamplerErrorOccurred");
      goto LABEL_66;
    default:
      goto LABEL_66;
  }
}

- (id)unitTestSampler
{
  return (id)-[SamplingOperation unitTestSampler](self->_unitTestOperation, "unitTestSampler");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationStalledTimer, 0);
  objc_storeStrong((id *)&self->_finishingOperation, 0);
  objc_storeStrong((id *)&self->_currentOperation, 0);
  objc_storeStrong((id *)&self->_unitTestOperation, 0);
}

uint64_t __57__AWPearlAttentionSampler_startStalledTimerForOperation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "faceDetectStalled:", *(_QWORD *)(a1 + 40));
}

void __45__AWPearlAttentionSampler_faceDetectStalled___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  unint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  double v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "cancelActiveOperation:", *(_QWORD *)(a1 + 40));
  if (currentLogLevel >= 6)
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
      v6 = *(_QWORD *)(a1 + 48);
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 134218498;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      v12 = 2048;
      v13 = v7;
      _os_log_impl(&dword_1AF589000, v3, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ cancelled stalled presence operation %p", (uint8_t *)&v8, 0x20u);
    }

  }
}

void __65__AWPearlAttentionSampler_triggerFaceDetectWithDeadline_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__AWPearlAttentionSampler_triggerFaceDetectWithDeadline_options___block_invoke_2;
  v7[3] = &unk_1E5F8EC40;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __65__AWPearlAttentionSampler_triggerFaceDetectWithDeadline_options___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 40), "pearlAttentionSamplerErrorOccurred");
    return objc_msgSend(*(id *)(v1 + 40), "updateFaceState:", 4);
  }
  return result;
}

void __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke(uint64_t a1, char a2)
{
  _QWORD *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  v3 = *(_QWORD **)(a1 + 32);
  v4 = v3[1];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke_2;
  v5[3] = &unk_1E5F8EB88;
  v6 = v3;
  v7 = a2;
  dispatch_sync(v4, v5);

}

void __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke_3(uint64_t a1, char a2)
{
  _QWORD *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  v3 = *(_QWORD **)(a1 + 32);
  v4 = v3[1];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke_4;
  v5[3] = &unk_1E5F8EB88;
  v6 = v3;
  v7 = a2;
  dispatch_sync(v4, v5);

}

void __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke_5(uint64_t a1, char a2)
{
  _QWORD *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  v3 = *(_QWORD **)(a1 + 32);
  v4 = v3[1];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke_6;
  v5[3] = &unk_1E5F8EB88;
  v6 = v3;
  v7 = a2;
  dispatch_sync(v4, v5);

}

uint64_t __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSmartCoverClosed:", BKSHIDServicesIsSmartCoverClosed() != 0);
}

uint64_t __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke_8(uint64_t a1, int token)
{
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t state64;

  state64 = 0;
  result = notify_get_state(token, &state64);
  v4 = *(_QWORD *)(a1 + 32);
  if (state64 - 1 >= 2)
  {
    if (!*(_BYTE *)(v4 + 268))
      return result;
    v5 = 0;
  }
  else
  {
    v5 = 1;
  }
  *(_BYTE *)(v4 + 268) = v5;
  return result;
}

uint64_t __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCarPlayConnected:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSmartCoverClosed:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __59__AWPearlAttentionSampler_initForUnitTest_useAVFoundation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDisplayState:", *(unsigned __int8 *)(a1 + 40));
}

@end
