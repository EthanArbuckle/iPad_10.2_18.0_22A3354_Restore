@implementation AVFoundationEngine

- (AVFoundationEngine)initWithQueue:(id)a3
{
  id v5;
  AVFoundationEngine *v6;
  AVFoundationEngine *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *sessionQueue;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  unint64_t v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  AVCaptureDevice *device;
  AVCaptureSession *v20;
  AVCaptureSession *session;
  objc_class *v22;
  AVCaptureDevice *v23;
  uint64_t v24;
  AVCaptureDeviceInput *input;
  OS_dispatch_queue *queue;
  AVFoundationEngine *v27;
  OS_dispatch_queue *v28;
  AVCaptureMetadataOutput *v29;
  AVCaptureMetadataOutput *v30;
  AVCaptureMetadataOutput *metadataOutput;
  uint64_t v32;
  NSNotificationCenter *notificationCenter;
  NSMutableDictionary *v34;
  NSMutableDictionary *receivers;
  AVFoundationEngine *v36;
  NSObject *v38;
  unint64_t v39;
  double v40;
  unint64_t v41;
  double v42;
  unint64_t v43;
  double v44;
  unint64_t v45;
  double v46;
  const char *v47;
  objc_super v48;
  uint8_t buf[4];
  double v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v48.receiver = self;
  v48.super_class = (Class)AVFoundationEngine;
  v6 = -[AVFoundationEngine init](&v48, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_16;
  objc_storeStrong((id *)&v6->_queue, a3);
  v8 = dispatch_queue_create("com.apple.AttentionAwareness.AVCaptureSession", 0);
  sessionQueue = v7->_sessionQueue;
  v7->_sessionQueue = (OS_dispatch_queue *)v8;

  *(_WORD *)&v7->_shouldRunAttentionDetect = 0;
  v7->_shouldRunPersonDetection = 0;
  *(_WORD *)&v7->_spoofedNotification = 0;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.AttentionAwareness"));
  v7->_demoMode = objc_msgSend(v10, "BOOLForKey:", CFSTR("demoMode"));
  v11 = (id)*MEMORY[0x1E0C8A7D8];
  v55[0] = *MEMORY[0x1E0C89F68];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
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
      *(_DWORD *)buf = 134218498;
      v50 = v15;
      v51 = 2112;
      v52 = v12;
      v53 = 2112;
      v54 = v11;
      _os_log_impl(&dword_1AF589000, v13, OS_LOG_TYPE_DEFAULT, "%13.5f: Looking for device of type %@ and media type %@", buf, 0x20u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C8B0A8], "discoverySessionWithDeviceTypes:mediaType:position:", v12, v11, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "devices");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = objc_claimAutoreleasedReturnValue();

  device = v7->_device;
  v7->_device = (AVCaptureDevice *)v18;

  if (!v7->_device)
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = absTimeNS();
        if (v39 == -1)
          v40 = INFINITY;
        else
          v40 = (double)v39 / 1000000000.0;
        *(_DWORD *)buf = 134217984;
        v50 = v40;
        v47 = "%13.5f: Unable to obtain device for streaming";
        goto LABEL_42;
      }
      goto LABEL_43;
    }
    goto LABEL_44;
  }
  v20 = (AVCaptureSession *)objc_alloc_init(MEMORY[0x1E0C8B108]);
  session = v7->_session;
  v7->_session = v20;

  if (!v7->_session)
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v41 = absTimeNS();
        if (v41 == -1)
          v42 = INFINITY;
        else
          v42 = (double)v41 / 1000000000.0;
        *(_DWORD *)buf = 134217984;
        v50 = v42;
        v47 = "%13.5f: Unable to obtain session for streaming";
        goto LABEL_42;
      }
      goto LABEL_43;
    }
    goto LABEL_44;
  }
  v22 = (objc_class *)MEMORY[0x1E0C8B0B0];
  v23 = v7->_device;
  v24 = objc_msgSend([v22 alloc], "initWithDevice:error:", v23, 0);

  input = v7->_input;
  v7->_input = (AVCaptureDeviceInput *)v24;

  if (!-[AVCaptureSession canAddInput:](v7->_session, "canAddInput:", v7->_input))
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v43 = absTimeNS();
        if (v43 == -1)
          v44 = INFINITY;
        else
          v44 = (double)v43 / 1000000000.0;
        *(_DWORD *)buf = 134217984;
        v50 = v44;
        v47 = "%13.5f: Unable to add input to session";
        goto LABEL_42;
      }
LABEL_43:

    }
LABEL_44:

    v36 = 0;
    goto LABEL_17;
  }
  -[AVCaptureSession addInput:](v7->_session, "addInput:", v7->_input);
  queue = v7->_queue;
  v27 = v7;
  v28 = queue;
  v29 = (AVCaptureMetadataOutput *)objc_alloc_init(MEMORY[0x1E0C8B0C8]);
  v30 = v29;
  if (v28)
    -[AVCaptureMetadataOutput setMetadataObjectsDelegate:queue:](v29, "setMetadataObjectsDelegate:queue:", v27, v28);

  metadataOutput = v27->_metadataOutput;
  v27->_metadataOutput = v30;

  if (!-[AVCaptureSession canAddOutput:](v7->_session, "canAddOutput:", v27->_metadataOutput))
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v45 = absTimeNS();
        if (v45 == -1)
          v46 = INFINITY;
        else
          v46 = (double)v45 / 1000000000.0;
        *(_DWORD *)buf = 134217984;
        v50 = v46;
        v47 = "%13.5f: Unable to add output to session";
LABEL_42:
        _os_log_error_impl(&dword_1AF589000, v38, OS_LOG_TYPE_ERROR, v47, buf, 0xCu);
        goto LABEL_43;
      }
      goto LABEL_43;
    }
    goto LABEL_44;
  }
  -[AVCaptureSession addOutput:](v7->_session, "addOutput:", v27->_metadataOutput);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v32 = objc_claimAutoreleasedReturnValue();
  notificationCenter = v27->_notificationCenter;
  v27->_notificationCenter = (NSNotificationCenter *)v32;

  -[AVFoundationEngine setupNotificationsForCenter](v27, "setupNotificationsForCenter");
  v34 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  receivers = v27->_receivers;
  v27->_receivers = v34;

LABEL_16:
  v36 = v7;
LABEL_17:

  return v36;
}

- (BOOL)registerForOperation:(id)a3 activateAttentionDetection:(BOOL)a4 activateEyeRelief:(BOOL)a5 activatePersonDetection:(BOOL)a6 identifier:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  unint64_t v16;
  double v17;
  int v19;
  double v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v8 = a6;
  v9 = a5;
  v10 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a7;
  v14 = -[AVFoundationReceiver initForReceiver:activateAttentionDetection:activateEyeRelief:activatePersonDetection:]([AVFoundationReceiver alloc], "initForReceiver:activateAttentionDetection:activateEyeRelief:activatePersonDetection:", v12, v10, v9, v8);
  if (v14)
  {
    -[NSMutableDictionary setObject:forKey:](self->_receivers, "setObject:forKey:", v14, v13);
    if (currentLogLevel >= 6)
    {
      _AALog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = absTimeNS();
        if (v16 == -1)
          v17 = INFINITY;
        else
          v17 = (double)v16 / 1000000000.0;
        v19 = 134218242;
        v20 = v17;
        v21 = 2112;
        v22 = v12;
        _os_log_impl(&dword_1AF589000, v15, OS_LOG_TYPE_DEFAULT, "%13.5f: Registered receiver %@ for AVFoundation operation", (uint8_t *)&v19, 0x16u);
      }

    }
  }

  return v14 != 0;
}

- (BOOL)unregisterForOperation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  unint64_t v7;
  double v8;
  void *v9;
  NSObject *sessionQueue;
  _QWORD block[5];
  uint8_t buf[4];
  double v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_receivers, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_receivers, "removeObjectForKey:", v4);
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
        -[NSMutableDictionary allKeys](self->_receivers, "allKeys");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v14 = v8;
        v15 = 2112;
        v16 = v4;
        v17 = 2112;
        v18 = v9;
        _os_log_impl(&dword_1AF589000, v6, OS_LOG_TYPE_DEFAULT, "%13.5f: Unregistering receiver %@, remaining receivers: %@", buf, 0x20u);

      }
    }
    if (!-[NSMutableDictionary count](self->_receivers, "count"))
    {
      sessionQueue = self->_sessionQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__AVFoundationEngine_unregisterForOperation___block_invoke;
      block[3] = &unk_1E5F8EC18;
      block[4] = self;
      dispatch_async(sessionQueue, block);
      -[AVFoundationEngine handleNotification:notification:](self, "handleNotification:notification:", *MEMORY[0x1E0C8A130], 0);
      self->_spoofedNotification = 0;
    }
  }

  return v5 != 0;
}

- (BOOL)isOperationActive:(id)a3
{
  void *v3;
  char v4;

  if (!self->_session)
    return 0;
  -[NSMutableDictionary objectForKey:](self->_receivers, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "running");

  return v4;
}

- (id)startOperationForReceiver:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *receivers;
  uint64_t v7;
  void *v8;
  int v9;
  unsigned int v10;
  uint64_t *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSMutableDictionary *v16;
  NSObject *v17;
  unint64_t v18;
  double v19;
  NSObject *sessionQueue;
  int v21;
  int v22;
  AVCaptureMetadataOutput *v23;
  AVCaptureMetadataOutput *v24;
  NSObject *v25;
  unint64_t v26;
  double v27;
  AVCaptureDevice *device;
  BOOL v29;
  AVCaptureDevice *v30;
  AVCaptureDevice *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  unint64_t v38;
  double v39;
  void *v40;
  void *v41;
  AVCaptureDevice *v42;
  _QWORD v43[5];
  CMTime v44;
  CMTime v45;
  CMTime v46;
  CMTime v47;
  id v48;
  _QWORD v49[5];
  _QWORD block[5];
  _QWORD v51[7];
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  const __CFString *v61;
  uint8_t v62[4];
  double v63;
  __int16 v64;
  id v65;
  _BYTE buf[24];
  id v67;
  uint64_t v68;
  _QWORD v69[2];

  v69[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  receivers = self->_receivers;
  v7 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __48__AVFoundationEngine_startOperationForReceiver___block_invoke;
  v51[3] = &unk_1E5F8E2E0;
  v51[4] = self;
  v51[5] = &v56;
  v51[6] = &v52;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](receivers, "enumerateKeysAndObjectsUsingBlock:", v51);
  -[NSMutableDictionary objectForKey:](self->_receivers, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "running");

  if (v9)
  {
    v10 = *((unsigned __int8 *)v57 + 24);
    v11 = v53;
    if (__PAIR64__(self->_shouldRunEyeRelief, self->_shouldRunAttentionDetect) == __PAIR64__(v10, *((unsigned __int8 *)v53 + 24)))
    {
      -[NSMutableDictionary removeObjectForKey:](self->_receivers, "removeObjectForKey:", v4);
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v68 = *MEMORY[0x1E0CB2D50];
      v69[0] = CFSTR(" Client already started an operation with the same options");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 17, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = 0;
      goto LABEL_36;
    }
    self->_shouldRunEyeRelief = v10;
    self->_shouldRunAttentionDetect = *((_BYTE *)v11 + 24);
    sessionQueue = self->_sessionQueue;
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __48__AVFoundationEngine_startOperationForReceiver___block_invoke_2;
    block[3] = &unk_1E5F8EC18;
    block[4] = self;
    dispatch_async(sessionQueue, block);
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v67) = 0;
    v16 = self->_receivers;
    v49[0] = v7;
    v49[1] = 3221225472;
    v49[2] = __48__AVFoundationEngine_startOperationForReceiver___block_invoke_3;
    v49[3] = &unk_1E5F8E308;
    v49[4] = buf;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v16, "enumerateKeysAndObjectsUsingBlock:", v49);
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24)
      && self->_shouldRunEyeRelief == *((unsigned __int8 *)v57 + 24)
      && self->_shouldRunAttentionDetect == *((unsigned __int8 *)v53 + 24))
    {
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
          *(_DWORD *)v62 = 134218242;
          v63 = v19;
          v64 = 2112;
          v65 = v4;
          _os_log_impl(&dword_1AF589000, v17, OS_LOG_TYPE_DEFAULT, "%13.5f: Session that is already running has the same options that was requested by %@, not restarting session", v62, 0x16u);
        }

      }
      -[NSMutableDictionary objectForKey:](self->_receivers, "objectForKey:", v4);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setRunning:", 1);
      objc_msgSend(v40, "receiver");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "receiveNotificationOfName:notification:", *MEMORY[0x1E0C8A128], 0);

      _Block_object_dispose(buf, 8);
      v15 = 0;
      goto LABEL_31;
    }
    _Block_object_dispose(buf, 8);
  }
  v21 = *((unsigned __int8 *)v57 + 24);
  self->_shouldRunEyeRelief = v21;
  if (v21)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8AA30]);
  v22 = *((unsigned __int8 *)v53 + 24);
  self->_shouldRunAttentionDetect = v22;
  v23 = self->_metadataOutput;
  v24 = v23;
  if (v22)
  {
    if (-[AVCaptureMetadataOutput isAttentionDetectionSupported](v23, "isAttentionDetectionSupported"))
      -[AVCaptureMetadataOutput setAttentionDetectionEnabled:](v24, "setAttentionDetectionEnabled:", 1);

    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8AA38]);
  }
  else
  {
    if (-[AVCaptureMetadataOutput isAttentionDetectionSupported](v23, "isAttentionDetectionSupported"))
      -[AVCaptureMetadataOutput setAttentionDetectionEnabled:](v24, "setAttentionDetectionEnabled:", 0);

  }
  if (currentLogLevel >= 6)
  {
    _AALog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = absTimeNS();
      if (v26 == -1)
        v27 = INFINITY;
      else
        v27 = (double)v26 / 1000000000.0;
      *(_DWORD *)buf = 134218242;
      *(double *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v5;
      _os_log_impl(&dword_1AF589000, v25, OS_LOG_TYPE_DEFAULT, "%13.5f: Asking for metadata types: %@", buf, 0x16u);
    }

  }
  -[AVCaptureMetadataOutput setMetadataObjectTypes:](self->_metadataOutput, "setMetadataObjectTypes:", v5);
  device = self->_device;
  v48 = 0;
  v29 = -[AVCaptureDevice lockForConfiguration:](device, "lockForConfiguration:", &v48);
  v15 = v48;
  if (v29)
  {
    CMTimeMake(&v47, 1, 15);
    v30 = self->_device;
    v46 = v47;
    -[AVCaptureDevice setActiveVideoMinFrameDuration:](v30, "setActiveVideoMinFrameDuration:", &v46);
    CMTimeMake(&v45, 1, 15);
    v31 = self->_device;
    v44 = v45;
    -[AVCaptureDevice setActiveVideoMaxFrameDuration:](v31, "setActiveVideoMaxFrameDuration:", &v44);
    -[AVCaptureDevice unlockForConfiguration](self->_device, "unlockForConfiguration");
    v32 = self->_sessionQueue;
    v43[0] = v7;
    v43[1] = 3221225472;
    v43[2] = __48__AVFoundationEngine_startOperationForReceiver___block_invoke_52;
    v43[3] = &unk_1E5F8EC18;
    v43[4] = self;
    dispatch_async(v32, v43);
    -[NSMutableDictionary objectForKey:](self->_receivers, "objectForKey:", v4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setRunning:", 1);

LABEL_31:
    v14 = 0;
    goto LABEL_36;
  }
  if (currentLogLevel >= 3)
  {
    _AALog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v38 = absTimeNS();
      if (v38 == -1)
        v39 = INFINITY;
      else
        v39 = (double)v38 / 1000000000.0;
      v42 = self->_device;
      *(_DWORD *)buf = 134218498;
      *(double *)&buf[4] = v39;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v42;
      *(_WORD *)&buf[22] = 2112;
      v67 = v15;
      _os_log_error_impl(&dword_1AF589000, v34, OS_LOG_TYPE_ERROR, "%13.5f: Could not log configuration for device %@ error: %@", buf, 0x20u);
    }

  }
  v35 = (void *)MEMORY[0x1E0CB35C8];
  v60 = *MEMORY[0x1E0CB2D50];
  v61 = CFSTR("Could not lock device configuration to set frame rate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 16, v36);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_36:
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);

  return v14;
}

- (void)setupNotificationsForCenter
{
  NSNotificationCenter *notificationCenter;
  uint64_t v4;
  AVCaptureSession *session;
  uint64_t v6;
  id v7;
  NSNotificationCenter *v8;
  uint64_t v9;
  AVCaptureSession *v10;
  id v11;
  NSNotificationCenter *v12;
  uint64_t v13;
  AVCaptureSession *v14;
  id v15;
  NSNotificationCenter *v16;
  uint64_t v17;
  AVCaptureSession *v18;
  id v19;
  NSNotificationCenter *v20;
  uint64_t v21;
  AVCaptureSession *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id location[2];

  objc_initWeak(location, self);
  notificationCenter = self->_notificationCenter;
  v4 = *MEMORY[0x1E0C8A1B8];
  session = self->_session;
  v6 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke;
  v32[3] = &unk_1E5F8E330;
  objc_copyWeak(&v33, location);
  v7 = -[NSNotificationCenter addObserverForName:object:queue:usingBlock:](notificationCenter, "addObserverForName:object:queue:usingBlock:", v4, session, 0, v32);
  v8 = self->_notificationCenter;
  v9 = *MEMORY[0x1E0C8A128];
  v10 = self->_session;
  v30[0] = v6;
  v30[1] = 3221225472;
  v30[2] = __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke_2;
  v30[3] = &unk_1E5F8E330;
  objc_copyWeak(&v31, location);
  v11 = -[NSNotificationCenter addObserverForName:object:queue:usingBlock:](v8, "addObserverForName:object:queue:usingBlock:", v9, v10, 0, v30);
  v12 = self->_notificationCenter;
  v13 = *MEMORY[0x1E0C8A130];
  v14 = self->_session;
  v28[0] = v6;
  v28[1] = 3221225472;
  v28[2] = __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke_54;
  v28[3] = &unk_1E5F8E330;
  objc_copyWeak(&v29, location);
  v15 = -[NSNotificationCenter addObserverForName:object:queue:usingBlock:](v12, "addObserverForName:object:queue:usingBlock:", v13, v14, 0, v28);
  v16 = self->_notificationCenter;
  v17 = *MEMORY[0x1E0C8A1C8];
  v18 = self->_session;
  v26[0] = v6;
  v26[1] = 3221225472;
  v26[2] = __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke_55;
  v26[3] = &unk_1E5F8E330;
  objc_copyWeak(&v27, location);
  v19 = -[NSNotificationCenter addObserverForName:object:queue:usingBlock:](v16, "addObserverForName:object:queue:usingBlock:", v17, v18, 0, v26);
  v20 = self->_notificationCenter;
  v21 = *MEMORY[0x1E0C8A140];
  v22 = self->_session;
  v24[0] = v6;
  v24[1] = 3221225472;
  v24[2] = __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke_2_56;
  v24[3] = &unk_1E5F8E330;
  objc_copyWeak(&v25, location);
  v23 = -[NSNotificationCenter addObserverForName:object:queue:usingBlock:](v20, "addObserverForName:object:queue:usingBlock:", v21, v22, 0, v24);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v33);
  objc_destroyWeak(location);
}

- (void)handleNotification:(id)a3 notification:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  unint64_t v9;
  double v10;
  NSMutableDictionary *receivers;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
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
      *(_DWORD *)buf = 134217984;
      v18 = v10;
      _os_log_impl(&dword_1AF589000, v8, OS_LOG_TYPE_DEFAULT, "%13.5f: Received notification within engine", buf, 0xCu);
    }

  }
  receivers = self->_receivers;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__AVFoundationEngine_handleNotification_notification___block_invoke;
  v14[3] = &unk_1E5F8E380;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v12 = v7;
  v13 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](receivers, "enumerateKeysAndObjectsUsingBlock:", v14);

}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 forMetadataObjectTypes:(id)a5 fromConnection:(id)a6
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  NSMutableDictionary *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  NSMutableDictionary *receivers;
  _QWORD v26[6];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[6];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_spoofedNotification)
  {
    -[AVFoundationEngine handleNotification:notification:](self, "handleNotification:notification:", *MEMORY[0x1E0C8A128], 0);
    self->_spoofedNotification = 1;
  }
  v10 = objc_msgSend(v8, "count");
  if (!v9 || v10)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v11 = v8;
    v19 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v28;
      v22 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v11);
          v24 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          receivers = self->_receivers;
          v26[0] = v22;
          v26[1] = 3221225472;
          v26[2] = __99__AVFoundationEngine_captureOutput_didOutputMetadataObjects_forMetadataObjectTypes_fromConnection___block_invoke_57;
          v26[3] = &unk_1E5F8E3A8;
          v26[4] = v24;
          v26[5] = self;
          -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](receivers, "enumerateKeysAndObjectsUsingBlock:", v26);
        }
        v20 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      }
      while (v20);
    }
  }
  else
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v33;
      v15 = MEMORY[0x1E0C809B0];
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v33 != v14)
            objc_enumerationMutation(v11);
          v17 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
          v18 = self->_receivers;
          v31[0] = v15;
          v31[1] = 3221225472;
          v31[2] = __99__AVFoundationEngine_captureOutput_didOutputMetadataObjects_forMetadataObjectTypes_fromConnection___block_invoke;
          v31[3] = &unk_1E5F8E3A8;
          v31[4] = v17;
          v31[5] = self;
          -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v18, "enumerateKeysAndObjectsUsingBlock:", v31);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v13);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivers, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_videoDataOutput, 0);
  objc_storeStrong((id *)&self->_metadataOutput, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __99__AVFoundationEngine_captureOutput_didOutputMetadataObjects_forMetadataObjectTypes_fromConnection___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "receiver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "activateAttentionDetection"))
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6 == *MEMORY[0x1E0C8AA38])
    {
      if (objc_msgSend(v4, "running"))
      {
        if (!*(_BYTE *)(*(_QWORD *)(a1 + 40) + 85))
        {
          _AALog();
          v7 = objc_claimAutoreleasedReturnValue();
          _AALog();
          v8 = objc_claimAutoreleasedReturnValue();
          v9 = os_signpost_id_generate(v8);

          if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1AF589000, v7, OS_SIGNPOST_EVENT, v9, "AA - Received frame of face detect data", (const char *)&unk_1AF5B9EFB, buf, 2u);
          }

          *(_BYTE *)(*(_QWORD *)(a1 + 40) + 85) = 1;
        }
        objc_msgSend(v5, "receiveMetadata:type:", 0, v6);
      }
    }
  }
  if (objc_msgSend(v4, "activateEyeRelief"))
  {
    v10 = *(_QWORD *)(a1 + 32);
    if (v10 == *MEMORY[0x1E0C8AA30])
    {
      if (objc_msgSend(v4, "running"))
      {
        if (!*(_BYTE *)(*(_QWORD *)(a1 + 40) + 85))
        {
          _AALog();
          v11 = objc_claimAutoreleasedReturnValue();
          _AALog();
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = os_signpost_id_generate(v12);

          if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
          {
            *(_WORD *)v14 = 0;
            _os_signpost_emit_with_name_impl(&dword_1AF589000, v11, OS_SIGNPOST_EVENT, v13, "AA - Received frame of EyeRelief data", (const char *)&unk_1AF5B9EFB, v14, 2u);
          }

          *(_BYTE *)(*(_QWORD *)(a1 + 40) + 85) = 1;
        }
        objc_msgSend(v5, "receiveMetadata:type:", 0, v10);
      }
    }
  }

}

void __99__AVFoundationEngine_captureOutput_didOutputMetadataObjects_forMetadataObjectTypes_fromConnection___block_invoke_57(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  uint8_t v18[16];
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "receiver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "activateAttentionDetection"))
  {
    objc_msgSend(*(id *)(a1 + 32), "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 == (void *)*MEMORY[0x1E0C8AA38])
    {
      v8 = objc_msgSend(v4, "running");

      if (v8)
      {
        if (!*(_BYTE *)(*(_QWORD *)(a1 + 40) + 85))
        {
          _AALog();
          v9 = objc_claimAutoreleasedReturnValue();
          _AALog();
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = os_signpost_id_generate(v10);

          if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1AF589000, v9, OS_SIGNPOST_EVENT, v11, "AA - Received frame of face detect data", (const char *)&unk_1AF5B9EFB, buf, 2u);
          }

          *(_BYTE *)(*(_QWORD *)(a1 + 40) + 85) = 1;
        }
        objc_msgSend(v5, "receiveMetadata:type:", *(_QWORD *)(a1 + 32), v7);
      }
    }
    else
    {

    }
  }
  if (objc_msgSend(v4, "activateEyeRelief"))
  {
    objc_msgSend(*(id *)(a1 + 32), "type");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 == (void *)*MEMORY[0x1E0C8AA30])
    {
      v14 = objc_msgSend(v4, "running");

      if (v14)
      {
        if (!*(_BYTE *)(*(_QWORD *)(a1 + 40) + 85))
        {
          _AALog();
          v15 = objc_claimAutoreleasedReturnValue();
          _AALog();
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = os_signpost_id_generate(v16);

          if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
          {
            *(_WORD *)v18 = 0;
            _os_signpost_emit_with_name_impl(&dword_1AF589000, v15, OS_SIGNPOST_EVENT, v17, "AA - Received frame of EyeRelief data", (const char *)&unk_1AF5B9EFB, v18, 2u);
          }

          *(_BYTE *)(*(_QWORD *)(a1 + 40) + 85) = 1;
        }
        objc_msgSend(v5, "receiveMetadata:type:", *(_QWORD *)(a1 + 32), v13);
      }
    }
    else
    {

    }
  }

}

void __54__AVFoundationEngine_handleNotification_notification___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  objc_msgSend(a3, "receiver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__AVFoundationEngine_handleNotification_notification___block_invoke_2;
  v10[3] = &unk_1E5F8E358;
  v7 = v5;
  v8 = *(_QWORD *)(a1 + 32);
  v11 = v7;
  v12 = v8;
  v13 = v4;
  v14 = *(id *)(a1 + 48);
  v9 = v4;
  dispatch_async(v6, v10);

}

uint64_t __54__AVFoundationEngine_handleNotification_notification___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", *MEMORY[0x1E0C8A1C8]))
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(NSObject **)(v2 + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__AVFoundationEngine_handleNotification_notification___block_invoke_3;
    block[3] = &unk_1E5F8EC18;
    block[4] = v2;
    dispatch_async(v3, block);
  }
  return objc_msgSend(*(id *)(a1 + 48), "receiveNotificationOfName:notification:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

uint64_t __54__AVFoundationEngine_handleNotification_notification___block_invoke_3(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  unint64_t v4;
  double v5;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "isRunning");
  if ((result & 1) == 0)
  {
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
        v6 = 134217984;
        v7 = v5;
        _os_log_impl(&dword_1AF589000, v3, OS_LOG_TYPE_DEFAULT, "%13.5f: Session was interrupted before it got started, calling stop on the session immediately", (uint8_t *)&v6, 0xCu);
      }

    }
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "stopRunning");
  }
  return result;
}

void __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleNotification:notification:", *MEMORY[0x1E0C8A1B8], v3);

}

void __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unint64_t v5;
  double v6;
  id WeakRetained;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
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
      v8 = 134217984;
      v9 = v6;
      _os_log_impl(&dword_1AF589000, v4, OS_LOG_TYPE_DEFAULT, "%13.5f: Session STARTED running!", (uint8_t *)&v8, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleNotification:notification:", *MEMORY[0x1E0C8A128], v3);

}

void __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke_54(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unint64_t v5;
  double v6;
  id WeakRetained;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
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
      v8 = 134217984;
      v9 = v6;
      _os_log_impl(&dword_1AF589000, v4, OS_LOG_TYPE_DEFAULT, "%13.5f: Session STOPPED running!", (uint8_t *)&v8, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleNotification:notification:", *MEMORY[0x1E0C8A130], v3);

}

void __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke_55(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleNotification:notification:", *MEMORY[0x1E0C8A1C8], v3);

}

void __49__AVFoundationEngine_setupNotificationsForCenter__block_invoke_2_56(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleNotification:notification:", *MEMORY[0x1E0C8A140], v3);

}

void __48__AVFoundationEngine_startOperationForReceiver___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) |= objc_msgSend(v4, "activateEyeRelief");
  if (*(_BYTE *)(a1[4] + 83))
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  else
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) |= objc_msgSend(v4, "activateAttentionDetection");

}

uint64_t __48__AVFoundationEngine_startOperationForReceiver___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "stopRunning");
}

uint64_t __48__AVFoundationEngine_startOperationForReceiver___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "running");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= result;
  return result;
}

uint64_t __48__AVFoundationEngine_startOperationForReceiver___block_invoke_52(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v6[16];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 85) = 0;
  _AALog();
  v2 = objc_claimAutoreleasedReturnValue();
  _AALog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF589000, v2, OS_SIGNPOST_EVENT, v4, "AA - Calling startRunning", (const char *)&unk_1AF5B9EFB, v6, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "startRunning");
}

uint64_t __45__AVFoundationEngine_unregisterForOperation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "stopRunning");
}

+ (id)sharedEngine
{
  if (sharedEngine_onceToken != -1)
    dispatch_once(&sharedEngine_onceToken, &__block_literal_global_1015);
  return (id)sharedEngine_engine;
}

void __34__AVFoundationEngine_sharedEngine__block_invoke()
{
  AVFoundationEngine *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [AVFoundationEngine alloc];
  awQueue(1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[AVFoundationEngine initWithQueue:](v0, "initWithQueue:", v3);
  v2 = (void *)sharedEngine_engine;
  sharedEngine_engine = v1;

}

@end
