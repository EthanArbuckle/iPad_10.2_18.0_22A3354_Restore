@implementation BiokitOperation

- (BiokitOperation)initWithQueue:(id)a3 forUnitTest:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  BiokitOperation *v8;
  BiokitOperation *v9;
  BKDevicePearl *v10;
  BKDevicePearl *pearlDevice;
  NSObject *v12;
  unint64_t v13;
  double v14;
  BKDevicePearl *v15;
  objc_super v17;
  uint8_t buf[4];
  double v19;
  __int16 v20;
  BKDevicePearl *v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BiokitOperation;
  v8 = -[BiokitOperation init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a3);
    if (v4)
    {
      +[AWUnitTestPearlDevice sharedDevice](AWUnitTestPearlDevice, "sharedDevice");
      v10 = (BKDevicePearl *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (getPearlDevice_onceToken_298 != -1)
        dispatch_once(&getPearlDevice_onceToken_298, &__block_literal_global_299);
      v10 = (BKDevicePearl *)(id)getPearlDevice_result_300;
    }
    pearlDevice = v9->_pearlDevice;
    v9->_pearlDevice = v10;

    -[BKDevicePearl setQueue:](v9->_pearlDevice, "setQueue:", v9->_queue);
    -[BKDevicePearl setDelegate:](v9->_pearlDevice, "setDelegate:", v9);
    v9->_timeout = 0.0;
  }
  if (v4 && currentLogLevel >= 6)
  {
    _AALog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = absTimeNS();
      if (v13 == -1)
        v14 = INFINITY;
      else
        v14 = (double)v13 / 1000000000.0;
      v15 = v9->_pearlDevice;
      *(_DWORD *)buf = 134218242;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_1AF589000, v12, OS_LOG_TYPE_DEFAULT, "%13.5f: Unit test device %@ created", buf, 0x16u);
    }

  }
  return v9;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (BOOL)isOperationActive
{
  return self->_pendingPresenceOperation != 0;
}

- (id)createPresenceDetectOperationWithTimeout:(double)a3 options:(id)a4
{
  unint64_t v4;
  BKDevicePearl *pearlDevice;
  BKFaceDetectOperation *v8;
  BKFaceDetectOperation *v9;
  BKFaceDetectOperation *pendingPresenceOperation;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  unint64_t v15;
  double v16;
  BKFaceDetectOperation *v17;
  double timeout;
  const char *v19;
  const char *v20;
  unint64_t v22;
  double v23;
  id v24;
  uint8_t buf[4];
  double v26;
  __int16 v27;
  BKFaceDetectOperation *v28;
  __int16 v29;
  double v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v4 = *(_QWORD *)&a4.var0;
  v35 = *MEMORY[0x1E0C80C00];
  pearlDevice = self->_pearlDevice;
  v24 = 0;
  -[BKDevicePearl createPresenceDetectOperationWithError:](pearlDevice, "createPresenceDetectOperationWithError:", &v24);
  v8 = (BKFaceDetectOperation *)objc_claimAutoreleasedReturnValue();
  v9 = (BKFaceDetectOperation *)v24;
  pendingPresenceOperation = self->_pendingPresenceOperation;
  self->_pendingPresenceOperation = v8;

  if (v9)
  {
    if (currentLogLevel < 3)
      return v9;
    _AALog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v22 = absTimeNS();
      if (v22 == -1)
        v23 = INFINITY;
      else
        v23 = (double)v22 / 1000000000.0;
      *(_DWORD *)buf = 134218242;
      v26 = v23;
      v27 = 2112;
      v28 = v9;
      _os_log_error_impl(&dword_1AF589000, v14, OS_LOG_TYPE_ERROR, "%13.5f: Unable to create presence detect operation due to error: %@", buf, 0x16u);
    }
    goto LABEL_18;
  }
  -[BKFaceDetectOperation setTimeout:](self->_pendingPresenceOperation, "setTimeout:", a3);
  self->_timeout = a3;
  -[BKFaceDetectOperation setMotionDetect:](self->_pendingPresenceOperation, "setMotionDetect:", (v4 >> 8) & 1);
  -[BKFaceDetectOperation setDelegate:](self->_pendingPresenceOperation, "setDelegate:", self);
  -[BKFaceDetectOperation setQueue:](self->_pendingPresenceOperation, "setQueue:", self->_queue);
  if (-[BKFaceDetectOperation motionDetect](self->_pendingPresenceOperation, "motionDetect"))
  {
    _AALog();
    v11 = objc_claimAutoreleasedReturnValue();
    _AALog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_signpost_id_generate(v12);

    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AF589000, v11, OS_SIGNPOST_EVENT, v13, "AA: Motion detect started", (const char *)&unk_1AF5B9EFB, buf, 2u);
    }

  }
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
      v17 = self->_pendingPresenceOperation;
      timeout = self->_timeout;
      v19 = "ENABLED";
      if ((v4 & 1) != 0)
        v20 = "ENABLED";
      else
        v20 = "DISABLED";
      *(_DWORD *)buf = 134219010;
      if ((v4 & 0x100) == 0)
        v19 = "DISABLED";
      v26 = v16;
      v27 = 2112;
      v28 = v17;
      v29 = 2048;
      v30 = timeout;
      v31 = 2080;
      v32 = v20;
      v33 = 2080;
      v34 = v19;
      _os_log_impl(&dword_1AF589000, v14, OS_LOG_TYPE_DEFAULT, "%13.5f: Presence detect operation %@ created successfully with timeout: %f AttentionDetect: %s MotionDetect: %s", buf, 0x34u);
    }
LABEL_18:

  }
  return v9;
}

- (void)startPresenceDetectOperation:(id)a3
{
  id v4;
  BKFaceDetectOperation *pendingPresenceOperation;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  pendingPresenceOperation = self->_pendingPresenceOperation;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__BiokitOperation_startPresenceDetectOperation___block_invoke;
  v7[3] = &unk_1E5F8DDA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[BKFaceDetectOperation startWithReply:](pendingPresenceOperation, "startWithReply:", v7);

}

- (id)cancelActiveOperation:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  double v7;
  BKFaceDetectOperation *pendingPresenceOperation;
  BKFaceDetectOperation *v9;
  BKFaceDetectOperation *v10;
  BKFaceDetectOperation *v11;
  _QWORD block[4];
  BKFaceDetectOperation *v14;
  BiokitOperation *v15;
  id v16;
  uint8_t buf[4];
  double v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
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
      *(_DWORD *)buf = 134218242;
      v18 = v7;
      v19 = 2112;
      v20 = v4;
      _os_log_impl(&dword_1AF589000, v5, OS_LOG_TYPE_DEFAULT, "%13.5f: cancelActiveOperation called with info %@", buf, 0x16u);
    }

  }
  pendingPresenceOperation = self->_pendingPresenceOperation;
  if (pendingPresenceOperation)
  {
    v9 = pendingPresenceOperation;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__BiokitOperation_cancelActiveOperation___block_invoke;
    block[3] = &unk_1E5F8E790;
    v14 = v9;
    v15 = self;
    v16 = v4;
    v10 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v11 = self->_pendingPresenceOperation;
    self->_pendingPresenceOperation = 0;

  }
  return 0;
}

- (double)Timeout
{
  return self->_timeout;
}

- (int)State
{
  return -[BKFaceDetectOperation state](self->_pendingPresenceOperation, "state");
}

- (void)operation:(id)a3 motionDetectStateChanged:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  unint64_t v19;
  double v20;
  BKFaceDetectOperation *pendingPresenceOperation;
  NSObject *v22;
  unint64_t v23;
  double v24;
  unint64_t v25;
  double v26;
  const char *v27;
  _OWORD v28[11];
  _BYTE v29[64];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  double v38;
  __int16 v39;
  BiokitOperation *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  BKFaceDetectOperation *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  const __CFString *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v7, "motionMatrix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (currentLogLevel < 3)
      goto LABEL_16;
    _AALog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
LABEL_23:

      goto LABEL_16;
    }
    v23 = absTimeNS();
    if (v23 == -1)
      v24 = INFINITY;
    else
      v24 = (double)v23 / 1000000000.0;
    *(_DWORD *)buf = 134217984;
    v38 = v24;
    v27 = "%13.5f: MotionMatrix is nil";
LABEL_30:
    _os_log_error_impl(&dword_1AF589000, v22, OS_LOG_TYPE_ERROR, v27, buf, 0xCu);
    goto LABEL_23;
  }
  objc_msgSend(v7, "motionMatrix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 != 16)
  {
    if (currentLogLevel < 3)
      goto LABEL_16;
    _AALog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    v25 = absTimeNS();
    if (v25 == -1)
      v26 = INFINITY;
    else
      v26 = (double)v25 / 1000000000.0;
    *(_DWORD *)buf = 134217984;
    v38 = v26;
    v27 = "%13.5f: Motion matrix is of invalid length, not sending this to client";
    goto LABEL_30;
  }
  _AALog();
  v11 = objc_claimAutoreleasedReturnValue();
  _AALog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);

  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF589000, v11, OS_SIGNPOST_EVENT, v13, "AA: Motion detect success", (const char *)&unk_1AF5B9EFB, buf, 2u);
  }

  v14 = 0;
  *(_QWORD *)v29 = 1;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  memset(&v29[8], 0, 48);
  *(_QWORD *)&v29[56] = 3;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  do
  {
    objc_msgSend(v7, "motionMatrix");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "floatValue");
    *(_DWORD *)&v29[4 * v14 + 64] = v17;

    ++v14;
  }
  while (v14 != 16);
  if (currentLogLevel > 5)
  {
    _AALog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = absTimeNS();
      if (v19 == -1)
        v20 = INFINITY;
      else
        v20 = (double)v19 / 1000000000.0;
      pendingPresenceOperation = self->_pendingPresenceOperation;
      *(_DWORD *)buf = 134220034;
      v38 = v20;
      v39 = 2112;
      v40 = self;
      v41 = 2048;
      v42 = v6;
      v44 = pendingPresenceOperation;
      v45 = 2080;
      v43 = 2048;
      v46 = "FACE FOUND";
      v47 = 2048;
      v48 = 0;
      v49 = 2048;
      v50 = 0;
      v51 = 2048;
      v52 = 0;
      v53 = 2112;
      v54 = CFSTR("Unknown");
      _os_log_impl(&dword_1AF589000, v18, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ operation %p currentOperation %p faceDetectStateChanged %s pitch: %f yaw: %f roll: %f orientation: %@ ", buf, 0x5Cu);

    }
  }
  v28[8] = v34;
  v28[9] = v35;
  v28[10] = v36;
  v28[4] = v30;
  v28[5] = v31;
  v28[6] = v32;
  v28[7] = v33;
  v28[0] = *(_OWORD *)v29;
  v28[1] = *(_OWORD *)&v29[16];
  v28[2] = *(_OWORD *)&v29[32];
  v28[3] = *(_OWORD *)&v29[48];
  -[PearlCameraInterfaceMessaging cameraActivityNotification:data:forOperation:](self->_delegate, "cameraActivityNotification:data:forOperation:", 1, v28, self);
LABEL_16:

}

- (void)operation:(id)a3 faceDetectStateChanged:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  NSObject *v14;
  unint64_t v15;
  double v16;
  const char *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  float v24;
  void *v25;
  int v26;
  const char *v27;
  BKFaceDetectOperation *pendingPresenceOperation;
  void *v29;
  unint64_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[48];
  _BYTE buf[32];
  _BYTE v42[32];
  _BYTE v43[48];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  *(_QWORD *)v40 = 0;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  *(_QWORD *)&v35 = 0;
  v32 = 0u;
  v33 = 0u;
  v8 = objc_msgSend(v7, "faceDetected");
  objc_msgSend(v7, "pitch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "yaw");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "roll");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "orientation");
  if ((unint64_t)(v12 - 1) >= 4)
    v13 = 0;
  else
    v13 = v12;
  memset(&v40[8], 0, 40);
  if (currentLogLevel >= 6)
  {
    v31 = v9;
    _AALog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = absTimeNS();
      if (v15 == -1)
        v16 = INFINITY;
      else
        v16 = (double)v15 / 1000000000.0;
      v17 = "FACE NOT FOUND";
      if (v8)
        v17 = "FACE FOUND";
      v27 = v17;
      pendingPresenceOperation = self->_pendingPresenceOperation;
      getFaceDetectOrientationDescription(v13);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "attentionScore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "faceDetectionScore");
      v30 = v13;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134220546;
      *(double *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = v6;
      *(_WORD *)v42 = 2048;
      *(_QWORD *)&v42[2] = pendingPresenceOperation;
      *(_WORD *)&v42[10] = 2080;
      *(_QWORD *)&v42[12] = v27;
      *(_WORD *)&v42[20] = 2112;
      *(_QWORD *)&v42[22] = v31;
      *(_WORD *)&v42[30] = 2112;
      *(_QWORD *)v43 = v10;
      *(_WORD *)&v43[8] = 2112;
      *(_QWORD *)&v43[10] = v11;
      *(_WORD *)&v43[18] = 2112;
      *(_QWORD *)&v43[20] = v29;
      *(_WORD *)&v43[28] = 2112;
      *(_QWORD *)&v43[30] = v18;
      *(_WORD *)&v43[38] = 2112;
      *(_QWORD *)&v43[40] = v19;
      _os_log_impl(&dword_1AF589000, v14, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ operation %p currentOperation %p faceDetectStateChanged %s pitch: %@ yaw: %@ roll: %@ orientation: %@ attentionScore: %@faceDetectionScore: %@", buf, 0x70u);

      v13 = v30;
    }

    v9 = v31;
  }
  LOBYTE(v32) = v8;
  *((_QWORD *)&v35 + 1) = 1;
  if (v8)
  {
    objc_msgSend(v9, "doubleValue");
    *((_QWORD *)&v32 + 1) = v20;
    objc_msgSend(v10, "doubleValue");
    *(_QWORD *)&v33 = v21;
    objc_msgSend(v11, "doubleValue");
    *((_QWORD *)&v33 + 1) = v22;
    *(_QWORD *)&v34 = v13;
  }
  objc_msgSend(v7, "attentionScore", v27, pendingPresenceOperation);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "floatValue");
  *(float *)v40 = v24 / 10.0;

  objc_msgSend(v7, "faceDetectionScore");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "floatValue");
  *(_DWORD *)&v40[4] = v26;

  memset_pattern16(&v36, &unk_1AF5B9140, 0x40uLL);
  v45 = *(_OWORD *)v40;
  v46 = *(_OWORD *)&v40[16];
  v47 = *(_OWORD *)&v40[32];
  *(_OWORD *)v43 = v36;
  *(_OWORD *)&v43[16] = v37;
  *(_OWORD *)&v43[32] = v38;
  v44 = v39;
  *(_OWORD *)buf = v32;
  *(_OWORD *)&buf[16] = v33;
  *(_OWORD *)v42 = v34;
  *(_OWORD *)&v42[16] = v35;
  -[PearlCameraInterfaceMessaging cameraActivityNotification:data:forOperation:](self->_delegate, "cameraActivityNotification:data:forOperation:", 1, buf, self);

}

- (void)operation:(id)a3 finishedWithReason:(int64_t)a4
{
  NSObject *queue;
  id v7;
  void *v8;
  BKFaceDetectOperation *pendingPresenceOperation;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  unint64_t v13;
  double v14;
  _OWORD buf[11];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v7 = a3;
  dispatch_assert_queue_V2(queue);
  v8 = (void *)MEMORY[0x1E0CB3940];
  pendingPresenceOperation = self->_pendingPresenceOperation;
  -[BKFaceDetectOperation timeout](pendingPresenceOperation, "timeout");
  objc_msgSend(v8, "stringWithFormat:", CFSTR("operation %p currentOperation %p (timeout %13.5f) finishedWithReason %s"), v7, pendingPresenceOperation, v10, getEndReasonDescription(a4));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (currentLogLevel >= 6)
  {
    _AALog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = absTimeNS();
      if (v13 == -1)
        v14 = INFINITY;
      else
        v14 = (double)v13 / 1000000000.0;
      LODWORD(buf[0]) = 134218498;
      *(double *)((char *)buf + 4) = v14;
      WORD6(buf[0]) = 2112;
      *(_QWORD *)((char *)buf + 14) = self;
      WORD3(buf[1]) = 2112;
      *((_QWORD *)&buf[1] + 1) = v11;
      _os_log_impl(&dword_1AF589000, v12, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ %@", (uint8_t *)buf, 0x20u);
    }

  }
  memset(buf, 0, sizeof(buf));
  LODWORD(buf[0]) = a4;
  -[PearlCameraInterfaceMessaging cameraActivityNotification:data:forOperation:](self->_delegate, "cameraActivityNotification:data:forOperation:", 2, buf, self);

}

- (void)device:(id)a3 pearlEventOccurred:(int64_t)a4
{
  NSObject *v6;
  unint64_t v7;
  double v8;
  char *DeviceEventDescription;
  BKFaceDetectOperation *pendingPresenceOperation;
  uint64_t v11;
  char *v12;
  id v13;
  _OWORD buf[11];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
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
      DeviceEventDescription = getDeviceEventDescription(a4);
      pendingPresenceOperation = self->_pendingPresenceOperation;
      v11 = -[BKFaceDetectOperation state](pendingPresenceOperation, "state");
      if ((unint64_t)(v11 - 1) >= 5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown BKOperationState %llu"), v11);
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v12 = (char *)objc_msgSend(v13, "UTF8String");

      }
      else
      {
        v12 = off_1E5F8DE90[v11 - 1];
      }
      LODWORD(buf[0]) = 134219010;
      *(double *)((char *)buf + 4) = v8;
      WORD6(buf[0]) = 2112;
      *(_QWORD *)((char *)buf + 14) = self;
      WORD3(buf[1]) = 2080;
      *((_QWORD *)&buf[1] + 1) = DeviceEventDescription;
      LOWORD(buf[2]) = 2048;
      *(_QWORD *)((char *)&buf[2] + 2) = pendingPresenceOperation;
      WORD5(buf[2]) = 2080;
      *(_QWORD *)((char *)&buf[2] + 12) = v12;
      _os_log_impl(&dword_1AF589000, v6, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ pearlEventOccurred %s, current operation %p state %s", (uint8_t *)buf, 0x34u);
    }

  }
  memset(buf, 0, sizeof(buf));
  LODWORD(buf[0]) = a4;
  -[PearlCameraInterfaceMessaging cameraActivityNotification:data:forOperation:](self->_delegate, "cameraActivityNotification:data:forOperation:", 3, buf, self);
}

- (void)device:(id)a3 pearlStateChanged:(int64_t)a4
{
  NSObject *v6;
  unint64_t v7;
  double v8;
  _OWORD v9[11];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
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
      LODWORD(v9[0]) = 134218498;
      *(double *)((char *)v9 + 4) = v8;
      WORD6(v9[0]) = 2112;
      *(_QWORD *)((char *)v9 + 14) = self;
      WORD3(v9[1]) = 2080;
      *((_QWORD *)&v9[1] + 1) = getDeviceStateDescription(a4);
      _os_log_impl(&dword_1AF589000, v6, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ pearlStateChanged %s", (uint8_t *)v9, 0x20u);
    }

  }
  memset(v9, 0, sizeof(v9));
  LODWORD(v9[0]) = a4;
  -[PearlCameraInterfaceMessaging cameraActivityNotification:data:forOperation:](self->_delegate, "cameraActivityNotification:data:forOperation:", 4, v9, self);
}

- (int)operationBackend
{
  return 1;
}

- (id)unitTestSampler
{
  return self->_pearlDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishingPresenceOperation, 0);
  objc_storeStrong((id *)&self->_pendingPresenceOperation, 0);
  objc_storeStrong((id *)&self->_pearlDevice, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __41__BiokitOperation_cancelActiveOperation___block_invoke(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  double v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
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
      v7 = *(_QWORD *)(a1 + 48);
      v8 = 134218754;
      v9 = v4;
      v10 = 2112;
      v11 = v5;
      v12 = 2048;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1AF589000, v2, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ cancelled presence operation %p (%@)", (uint8_t *)&v8, 0x2Au);
    }

  }
}

void __48__BiokitOperation_startPresenceDetectOperation___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  unint64_t v7;
  double v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  uint8_t buf[4];
  double v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!a2)
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v17 = absTimeNS();
        if (v17 == -1)
          v18 = INFINITY;
        else
          v18 = (double)v17 / 1000000000.0;
        v19 = *(_QWORD *)(a1 + 32);
        v20 = *(_QWORD *)(v19 + 32);
        *(_DWORD *)buf = 134218754;
        v24 = v18;
        v25 = 2112;
        v26 = v19;
        v27 = 2048;
        v28 = v20;
        v29 = 2112;
        v30 = v5;
        _os_log_error_impl(&dword_1AF589000, v9, OS_LOG_TYPE_ERROR, "%13.5f: %@ failed to start presence operation %p: %@", buf, 0x2Au);
      }

    }
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 32);
    *(_QWORD *)(v10 + 32) = 0;

    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2FE0];
    v21 = *MEMORY[0x1E0CB2D50];
    v22 = CFSTR(" Unable to start presence detect operation");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 3, v6);
    v14 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v14;
    goto LABEL_12;
  }
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
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(_QWORD *)(v15 + 32);
      *(_DWORD *)buf = 134218498;
      v24 = v8;
      v25 = 2112;
      v26 = v15;
      v27 = 2048;
      v28 = v16;
      _os_log_impl(&dword_1AF589000, v6, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ presence operation %p successfully started", buf, 0x20u);
    }
LABEL_12:

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
