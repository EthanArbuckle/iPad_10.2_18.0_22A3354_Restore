@implementation AVFoundationOperation

- (AVFoundationOperation)initWithQueue:(id)a3 forUnitTest:(BOOL)a4
{
  id v7;
  char *v8;
  NSObject *v9;
  unint64_t v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  uint8_t buf[4];
  double v20;
  __int16 v21;
  char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AVFoundationOperation;
  v8 = -[AVFoundationOperation init](&v18, sel_init);
  if (v8)
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
        *(_DWORD *)buf = 134218242;
        v20 = v11;
        v21 = 2112;
        v22 = v8;
        _os_log_impl(&dword_1AF589000, v9, OS_LOG_TYPE_DEFAULT, "%13.5f: AVFoundationOperation %@ initialized", buf, 0x16u);
      }

    }
    objc_storeStrong((id *)v8 + 1, a3);
    v8[40] = a4;
    v12 = (void *)*((_QWORD *)v8 + 3);
    *((_QWORD *)v8 + 3) = 0;
    *((_QWORD *)v8 + 4) = 0;

    *(_WORD *)(v8 + 41) = 0;
    *((_QWORD *)v8 + 6) = 0x400000001;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v8 + 7);
    *((_QWORD *)v8 + 7) = v13;

    v15 = (void *)*((_QWORD *)v8 + 8);
    *((_QWORD *)v8 + 8) = CFSTR("AVFoundationAttentionSampler");

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.AttentionAwareness"));
    v8[72] = objc_msgSend(v16, "BOOLForKey:", CFSTR("demoMode"));

  }
  return (AVFoundationOperation *)v8;
}

- (void)setDelegate:(id)a3
{
  PearlCameraInterfaceMessaging *v4;
  PearlCameraInterfaceMessaging *delegate;

  v4 = (PearlCameraInterfaceMessaging *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  delegate = self->_delegate;
  self->_delegate = v4;

}

- (BOOL)isOperationActive
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return -[AVFoundationEngine isOperationActive:](self->_AVFoundationEngine, "isOperationActive:", self->_identifier);
}

- (double)Timeout
{
  return self->_timeout;
}

- (int)State
{
  return self->_operationState;
}

- (id)createPresenceDetectOperationWithTimeout:(double)a3 options:(id)a4
{
  int v4;
  _BOOL4 v7;
  int v8;
  NSObject *v9;
  unint64_t v10;
  double v11;
  const char *v12;
  const char *v13;
  void *v14;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  uint8_t buf[4];
  double v22;
  __int16 v23;
  double v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v4 = *(_DWORD *)&a4.var0;
  v29 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = -[AVFoundationOperation checkIfTimeoutHasChanged:](self, "checkIfTimeoutHasChanged:", a3);
  v8 = v7 | -[AVFoundationOperation checkIfOptionsHaveChanged:](self, "checkIfOptionsHaveChanged:", *(_QWORD *)&v4 & 0xFFFFFFLL);
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
      v12 = "true";
      *(_DWORD *)buf = 134218754;
      v23 = 2048;
      if ((v4 & 1) != 0)
        v13 = "true";
      else
        v13 = "false";
      v22 = v11;
      v24 = a3;
      if ((*(_QWORD *)&v4 & 0x10000) == 0)
        v12 = "false";
      v25 = 2080;
      v26 = v13;
      v27 = 2080;
      v28 = v12;
      _os_log_impl(&dword_1AF589000, v9, OS_LOG_TYPE_DEFAULT, "%13.5f: Timeout: %f AWAttentionSamplerActivateAttentionDetection: %s AWAttentionSamplerActivatePersonDetection: %s", buf, 0x2Au);
    }

  }
  if (v8
    && (self->_timeout = a3,
        self->_currentOptions.AWAttentionSamplerActivateAttentionDetection = v4 & 1,
        !-[AVFoundationOperation createAVFoundationOperation](self, "createAVFoundationOperation")))
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2FE0];
    v19 = *MEMORY[0x1E0CB2D50];
    v20 = CFSTR(" Unable to create Presence detect operation through AVFoundation");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 19, v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (void)startPresenceDetectOperation:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  double timeout;
  dispatch_time_t v7;
  NSObject *queue;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_initWeak(&location, self);
  -[AVFoundationEngine startOperationForReceiver:](self->_AVFoundationEngine, "startOperationForReceiver:", self->_identifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    timeout = self->_timeout;
    if (timeout != 0.0)
    {
      v7 = dispatch_time(0, (uint64_t)(timeout * 1000000000.0));
      queue = self->_queue;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __54__AVFoundationOperation_startPresenceDetectOperation___block_invoke;
      v9[3] = &unk_1E5F8E658;
      objc_copyWeak(&v10, &location);
      dispatch_after(v7, queue, v9);
      objc_destroyWeak(&v10);
    }
  }
  v4[2](v4, v5);

  objc_destroyWeak(&location);
}

- (id)cancelActiveOperation:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  double v7;
  int v9;
  double v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
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
      v9 = 134218242;
      v10 = v7;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1AF589000, v5, OS_LOG_TYPE_DEFAULT, "%13.5f: cancelActiveOperation called with info %@", (uint8_t *)&v9, 0x16u);
    }

  }
  if (-[AVFoundationOperation isOperationActive](self, "isOperationActive"))
    -[AVFoundationEngine unregisterForOperation:](self->_AVFoundationEngine, "unregisterForOperation:", self->_identifier);

  return 0;
}

- (id)unitTestSampler
{
  return 0;
}

- (int)operationBackend
{
  return 2;
}

- (void)receiveMetadata:(id)a3 type:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  float v22;
  float v23;
  double v24;
  double v25;
  NSObject *v26;
  unint64_t v27;
  double v28;
  void *v29;
  id v30;
  _BYTE v31[24];
  const char *v32;
  _BYTE v33[32];
  _OWORD v34[4];
  float v35;
  float v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  queue = self->_queue;
  v8 = a4;
  dispatch_assert_queue_V2(queue);
  v9 = (id)*MEMORY[0x1E0C8AA38];

  if (v9 != v8)
    goto LABEL_21;
  v10 = v6;
  v11 = v10;
  if (!v10
    || !objc_msgSend(v10, "hasPayingAttention")
    || objc_msgSend(v11, "hasPayingAttention") && !objc_msgSend(v11, "payingAttention")
    || !objc_msgSend(v11, "hasPayingAttention")
    || !objc_msgSend(v11, "payingAttention"))
  {

LABEL_21:
    -[AVFoundationOperation sendDeviceEvent:](self, "sendDeviceEvent:", 2);
    goto LABEL_22;
  }
  v12 = 0;
  v13 = 0;
  if (objc_msgSend(v11, "hasPitchAngle"))
  {
    objc_msgSend(v11, "pitchAngle");
    v13 = v14;
  }
  if (objc_msgSend(v11, "hasYawAngle"))
  {
    objc_msgSend(v11, "yawAngle");
    v12 = v15;
  }
  v16 = 0;
  v17 = 0;
  if (objc_msgSend(v11, "hasRollAngle"))
  {
    objc_msgSend(v11, "rollAngle");
    v17 = v18;
  }
  if (objc_msgSend(v11, "hasDistance"))
  {
    objc_msgSend(v11, "distance");
    v16 = v19;
  }
  if (objc_msgSend(v11, "hasOrientation"))
  {
    v20 = objc_msgSend(v11, "orientation");
    if ((unint64_t)(v20 - 1) >= 4)
      v21 = 0;
    else
      v21 = v20;
  }
  else
  {
    v21 = 0;
  }
  v22 = 0.0;
  v23 = 0.0;
  if (objc_msgSend(v11, "hasPayingAttentionConfidence"))
  {
    objc_msgSend(v11, "payingAttentionConfidence");
    v23 = v24 * 100.0;
  }
  if (objc_msgSend(v11, "hasConfidence"))
  {
    objc_msgSend(v11, "confidence");
    v22 = v25 * 100.0;
  }
  if (currentLogLevel >= 6)
  {
    _AALog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = absTimeNS();
      if (v27 == -1)
        v28 = INFINITY;
      else
        v28 = (double)v27 / 1000000000.0;
      getFaceDetectOrientationDescription(v21);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v31 = 134220034;
      *(double *)&v31[4] = v28;
      *(_WORD *)&v31[12] = 2112;
      *(_QWORD *)&v31[14] = self;
      *(_WORD *)&v31[22] = 2080;
      v32 = "FACE FOUND";
      *(_WORD *)v33 = 2048;
      *(_QWORD *)&v33[2] = v13;
      *(_WORD *)&v33[10] = 2048;
      *(_QWORD *)&v33[12] = v12;
      *(_WORD *)&v33[20] = 2048;
      *(_QWORD *)&v33[22] = v17;
      *(_WORD *)&v33[30] = 2112;
      *(_QWORD *)&v34[0] = v29;
      WORD4(v34[0]) = 2048;
      *(double *)((char *)v34 + 10) = v23;
      WORD1(v34[1]) = 2048;
      *(double *)((char *)&v34[1] + 4) = v22;
      _os_log_impl(&dword_1AF589000, v26, OS_LOG_TYPE_DEFAULT, "%13.5f: Received metadata in %@ faceDetectStateChanged %s pitch: %f yaw: %f roll: %f orientation: %@ attentionScore: %ffaceDetectionScore: %f", v31, 0x5Cu);

    }
  }

  v31[0] = 1;
  *(_DWORD *)&v31[1] = 0;
  *(_DWORD *)&v31[4] = 0;
  *(_QWORD *)&v31[8] = v13;
  *(_QWORD *)&v31[16] = v12;
  v32 = v17;
  *(_QWORD *)v33 = v21;
  *(_QWORD *)&v33[8] = v16;
  *(_OWORD *)&v33[16] = xmmword_1AF5B9120;
  memset(v34, 0, sizeof(v34));
  v35 = v23;
  v36 = v22;
  v37 = 0u;
  v38 = 0u;
  v39 = 0;
  -[AVFoundationOperation sendFaceDetectStateChangeMetadata:](self, "sendFaceDetectStateChangeMetadata:", v31);
  -[AVFoundationOperation sendDeviceEvent:](self, "sendDeviceEvent:", 3);
  -[AVFoundationOperation sendOperationEndReason:](self, "sendOperationEndReason:", 1);
  v30 = -[AVFoundationOperation cancelActiveOperation:](self, "cancelActiveOperation:", CFSTR("Face found"));
LABEL_22:

}

- (void)receiveNotificationOfName:(id)a3 notification:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  unint64_t v9;
  double v10;
  int v11;
  double v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
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
      v11 = 134218242;
      v12 = v10;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1AF589000, v8, OS_LOG_TYPE_DEFAULT, "%13.5f: Notification %@ received", (uint8_t *)&v11, 0x16u);
    }

  }
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C8A1B8]))
  {
    -[AVFoundationOperation SessionRuntimeErrorNotification:](self, "SessionRuntimeErrorNotification:", v7);
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C8A128]))
  {
    -[AVFoundationOperation SessionDidStartRunningNotification:](self, "SessionDidStartRunningNotification:", v7);
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C8A130]))
  {
    -[AVFoundationOperation SessionDidStopRunningNotification:](self, "SessionDidStopRunningNotification:", v7);
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C8A1C8]))
  {
    -[AVFoundationOperation SessionWasInterruptedNotification:](self, "SessionWasInterruptedNotification:", v7);
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C8A140]))
  {
    -[AVFoundationOperation SessionInterruptionEndedNotification:](self, "SessionInterruptionEndedNotification:", v7);
  }

}

- (BOOL)createAVFoundationOperation
{
  AVFoundationEngine *AVFoundationEngine;
  AVFoundationEngine *v4;
  AVFoundationEngine *v5;

  AVFoundationEngine = self->_AVFoundationEngine;
  if (!AVFoundationEngine)
  {
    +[AVFoundationEngine sharedEngine](AVFoundationEngine, "sharedEngine");
    v4 = (AVFoundationEngine *)objc_claimAutoreleasedReturnValue();
    v5 = self->_AVFoundationEngine;
    self->_AVFoundationEngine = v4;

    AVFoundationEngine = self->_AVFoundationEngine;
  }
  return -[AVFoundationEngine registerForOperation:activateAttentionDetection:activateEyeRelief:activatePersonDetection:identifier:](AVFoundationEngine, "registerForOperation:activateAttentionDetection:activateEyeRelief:activatePersonDetection:identifier:", self, self->_currentOptions.AWAttentionSamplerActivateAttentionDetection, 0, self->_currentOptions.AWAttentionSamplerActivatePersonDetection, self->_identifier);
}

- (void)SessionRuntimeErrorNotification:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  double v7;
  void *v8;
  id v9;
  int v10;
  double v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
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
      objc_msgSend(v4, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 134218242;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_1AF589000, v5, OS_LOG_TYPE_DEFAULT, "%13.5f: Runtime error received: %@", (uint8_t *)&v10, 0x16u);

    }
  }
  -[AVFoundationOperation sendDeviceState:](self, "sendDeviceState:", 5);
  v9 = -[AVFoundationOperation cancelActiveOperation:](self, "cancelActiveOperation:", CFSTR("Runtime error"));

}

- (void)SessionDidStartRunningNotification:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[AVFoundationOperation sendDeviceState:](self, "sendDeviceState:", 2);
  -[AVFoundationOperation sendDeviceEvent:](self, "sendDeviceEvent:", 1);
  self->_operationState = 2;
}

- (void)SessionDidStopRunningNotification:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_operationState = 1;
}

- (void)SessionWasInterruptedNotification:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[AVFoundationOperation sendOperationEndReason:](self, "sendOperationEndReason:", 3);
}

- (void)SessionInterruptionEndedNotification:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
}

- (void)timeoutOccurred
{
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = -[AVFoundationOperation cancelActiveOperation:](self, "cancelActiveOperation:", CFSTR("Operation timed out"));
  -[AVFoundationOperation sendOperationEndReason:](self, "sendOperationEndReason:", 4);
}

- (BOOL)checkIfTimeoutHasChanged:(double)a3
{
  return self->_timeout != a3;
}

- (BOOL)checkIfOptionsHaveChanged:(id)a3
{
  return a3.var0 != self->_currentOptions.AWAttentionSamplerActivateAttentionDetection;
}

- (void)sendFaceDetectStateChangeMetadata:(AWFaceDetectMetadata *)a3
{
  CGPoint origin;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[11];

  origin = a3->var12.origin;
  v8[8] = *(_OWORD *)&a3->var9;
  v8[9] = origin;
  v8[10] = a3->var12.size;
  v4 = *(_OWORD *)&a3->var8[4];
  v8[4] = *(_OWORD *)a3->var8;
  v8[5] = v4;
  v5 = *(_OWORD *)&a3->var8[12];
  v8[6] = *(_OWORD *)&a3->var8[8];
  v8[7] = v5;
  v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0;
  v8[1] = v6;
  v7 = *(_OWORD *)&a3->var6;
  v8[2] = *(_OWORD *)&a3->var4;
  v8[3] = v7;
  -[PearlCameraInterfaceMessaging cameraActivityNotification:data:forOperation:](self->_delegate, "cameraActivityNotification:data:forOperation:", 1, v8, self);
}

- (void)sendOperationEndReason:(int)a3
{
  _OWORD v3[11];

  memset(v3, 0, sizeof(v3));
  LODWORD(v3[0]) = a3;
  -[PearlCameraInterfaceMessaging cameraActivityNotification:data:forOperation:](self->_delegate, "cameraActivityNotification:data:forOperation:", 2, v3, self);
}

- (void)sendDeviceEvent:(int)a3
{
  _OWORD v3[11];

  memset(v3, 0, sizeof(v3));
  LODWORD(v3[0]) = a3;
  self->_deviceEvent = a3;
  -[PearlCameraInterfaceMessaging cameraActivityNotification:data:forOperation:](self->_delegate, "cameraActivityNotification:data:forOperation:", 3, v3, self);
}

- (void)sendDeviceState:(int)a3
{
  _OWORD v3[11];

  memset(v3, 0, sizeof(v3));
  LODWORD(v3[0]) = a3;
  -[PearlCameraInterfaceMessaging cameraActivityNotification:data:forOperation:](self->_delegate, "cameraActivityNotification:data:forOperation:", 4, v3, self);
}

- (void)fakeDataForDemoMode
{
  _OWORD v3[11];
  _BYTE v4[32];
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  *(_QWORD *)v4 = 1;
  *(_QWORD *)&v6 = 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v7 = 0u;
  *(int64x2_t *)&v4[8] = vdupq_n_s64(0x4066800000000000uLL);
  *(_QWORD *)&v4[24] = 0x4066800000000000;
  v5 = 1uLL;
  *((_QWORD *)&v6 + 1) = 1;
  memset_pattern16(&v7, &unk_1AF5B9140, 0x40uLL);
  v3[8] = v11;
  v3[9] = v12;
  v3[10] = v13;
  v3[4] = v7;
  v3[5] = v8;
  v3[6] = v9;
  v3[7] = v10;
  v3[0] = *(_OWORD *)v4;
  v3[1] = *(_OWORD *)&v4[16];
  v3[2] = 1uLL;
  v3[3] = v6;
  -[AVFoundationOperation sendFaceDetectStateChangeMetadata:](self, "sendFaceDetectStateChangeMetadata:", v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_AVFoundationEngine, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __54__AVFoundationOperation_startPresenceDetectOperation___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "timeoutOccurred");

}

@end
