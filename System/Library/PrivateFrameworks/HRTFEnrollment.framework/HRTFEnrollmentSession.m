@implementation HRTFEnrollmentSession

- (HRTFEnrollmentSession)init
{
  HRTFEnrollmentSession *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  RecordingManager *recordingManager;
  HRTFSyncedCaptureSource *v6;
  OS_dispatch_queue *v7;
  uint64_t v8;
  HRTFSyncedCaptureSource *outputSource;
  uint64_t Int64;
  NSString *assetDownloadPath;
  __int128 v13;
  uint64_t v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HRTFEnrollmentSession;
  v2 = -[HRTFEnrollmentSession init](&v15, sel_init);
  if (v2)
  {
    if (init_once != -1)
      dispatch_once(&init_once, &__block_literal_global);
    objc_storeStrong((id *)&v2->_stateInfo, (id)kHRTFIdleStateInfo);
    v2->_paused = 0;
    v3 = dispatch_queue_create("com.apple.HRTFEnrollmentSession", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    *(_QWORD *)&v2->_preferredPixelFormat = 0x6664657034323066;
    v2->_preferredColorResolution = (CGSize)xmmword_22154A6A0;
    v2->_preferredDepthResolution = (CGSize)xmmword_22154A6B0;
    recordingManager = v2->_recordingManager;
    v2->_recordingManager = 0;

    v6 = [HRTFSyncedCaptureSource alloc];
    v7 = v2->_queue;
    v13 = xmmword_22154A6C0;
    v14 = 0x1E000000280;
    v8 = -[HRTFSyncedCaptureSource initWithQueue:options:](v6, "initWithQueue:options:", v7, &v13);
    outputSource = v2->_outputSource;
    v2->_outputSource = (HRTFSyncedCaptureSource *)v8;

    -[HRTFSyncedCaptureSource setDelegate:](v2->_outputSource, "setDelegate:", v2);
    Int64 = CFPrefs_GetInt64();
    if (Int64)
      LOBYTE(Int64) = MGGetBoolAnswer();
    v2->_videoCaptureEnabled = Int64;
    assetDownloadPath = v2->_assetDownloadPath;
    v2->_assetDownloadPath = 0;

    -[HRTFEnrollmentSession initializeDevice](v2, "initializeDevice");
  }
  return v2;
}

void __29__HRTFEnrollmentSession_init__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v2[0] = kHRTFStateInfoStateKey;
  v2[1] = kHRTFStateInfoProgressKey;
  v3[0] = &unk_24E71C610;
  v3[1] = &unk_24E71C628;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)kHRTFIdleStateInfo;
  kHRTFIdleStateInfo = v0;

}

- (HRTFEnrollmentSession)initWithCameraSession:(BOOL)a3
{
  HRTFEnrollmentSession *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  HRTFEnrollmentSession *v6;
  objc_super v8;

  if (a3)
  {
    v3 = -[HRTFEnrollmentSession init](self, "init");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)HRTFEnrollmentSession;
    v3 = -[HRTFEnrollmentSession init](&v8, sel_init);
    if (v3)
    {
      if (initWithCameraSession__once != -1)
        dispatch_once(&initWithCameraSession__once, &__block_literal_global_27);
      objc_storeStrong((id *)&v3->_stateInfo, (id)kHRTFIdleStateInfo);
      v4 = dispatch_queue_create("com.apple.HRTFEnrollmentSession", 0);
      queue = v3->_queue;
      v3->_queue = (OS_dispatch_queue *)v4;

    }
  }
  v6 = v3;

  return v6;
}

void __47__HRTFEnrollmentSession_initWithCameraSession___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v2[0] = kHRTFStateInfoStateKey;
  v2[1] = kHRTFStateInfoProgressKey;
  v3[0] = &unk_24E71C610;
  v3[1] = &unk_24E71C628;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)kHRTFIdleStateInfo;
  kHRTFIdleStateInfo = v0;

}

- (void)initializeDevice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  AVCaptureDevice *v8;
  uint64_t v9;
  AVCaptureDevice *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  AVCaptureDevice *v15;
  AVCaptureDevice *device;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDB2468];
  v22[0] = *MEMORY[0x24BDB1A48];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "discoverySessionWithDeviceTypes:mediaType:position:", v4, *MEMORY[0x24BDB1D50], 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "devices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((!v6 || !objc_msgSend(v6, "count")) && os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR))
    -[HRTFSyncedCaptureSource _initialize].cold.1();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v7;
  v9 = -[AVCaptureDevice countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  v10 = v8;
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v18;
LABEL_7:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v12)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
      if (-[HRTFEnrollmentSession _verifyCaptureDevice:](self, "_verifyCaptureDevice:", v14, (_QWORD)v17))
        break;
      if (v11 == ++v13)
      {
        v11 = -[AVCaptureDevice countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v11)
          goto LABEL_7;
        v10 = v8;
        goto LABEL_16;
      }
    }
    v15 = v14;

    if (!v15)
      goto LABEL_17;
    device = self->_device;
    self->_device = v15;
    v10 = v15;

  }
LABEL_16:

LABEL_17:
}

- (BOOL)_verifyCaptureDevice:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const opaqueCMFormatDescription *v15;
  CMVideoDimensions Dimensions;
  double width;
  double height;
  unint64_t v19;
  id v21;
  uint64_t v22;
  void *v23;
  AVCaptureDeviceFormat *finalColorFormat;
  NSObject *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const opaqueCMFormatDescription *v36;
  CMVideoDimensions v37;
  double v38;
  double v39;
  unint64_t v40;
  id v42;
  uint64_t v43;
  AVCaptureDeviceFormat **p_finalDepthFormat;
  void *v45;
  AVCaptureDeviceFormat *v46;
  NSObject *v47;
  id v48;
  uint64_t v49;
  BOOL v50;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  uint8_t buf[4];
  uint64_t v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  objc_msgSend(v4, "formats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
  if (v6)
  {
    v7 = v6;
    v52 = v4;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v58;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v58 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v11);
        objc_msgSend(v12, "supportedDepthDataFormats");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (v14)
        {
          v15 = (const opaqueCMFormatDescription *)objc_msgSend(v12, "formatDescription");
          if (CMFormatDescriptionGetMediaSubType(v15) == self->_preferredPixelFormat)
          {
            Dimensions = CMVideoFormatDescriptionGetDimensions(v15);
            width = (double)Dimensions.width;
            if (self->_preferredColorResolution.width >= (double)Dimensions.width)
            {
              height = (double)Dimensions.height;
              v19 = Dimensions.width * Dimensions.height;
              if (self->_preferredColorResolution.height >= (double)Dimensions.height
                && Dimensions.width * Dimensions.height > v8)
              {
                v21 = v12;

                if (self->_preferredColorResolution.width == width)
                {
                  v8 = v19;
                  v9 = v21;
                  if (self->_preferredColorResolution.height == height)
                    goto LABEL_20;
                }
                else
                {
                  v8 = v19;
                  v9 = v21;
                }
              }
            }
          }
        }
        ++v11;
      }
      while (v7 != v11);
      v22 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
      v7 = v22;
      v21 = v9;
    }
    while (v22);
LABEL_20:

    v4 = v52;
    if (v21)
    {
      objc_storeStrong((id *)&self->_finalColorFormat, v21);
      v23 = (void *)HRTFEnrollmentLog;
      if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
      {
        finalColorFormat = self->_finalColorFormat;
        v25 = v23;
        -[AVCaptureDeviceFormat description](finalColorFormat, "description");
        v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v27 = objc_msgSend(v26, "UTF8String");
        *(_DWORD *)buf = 136315138;
        v63 = v27;
        _os_log_impl(&dword_22153F000, v25, OS_LOG_TYPE_DEFAULT, "capture device color format: %s", buf, 0xCu);

      }
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      objc_msgSend(v21, "supportedDepthDataFormats");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      if (v29)
      {
        v30 = v29;
        v31 = 0;
        v32 = 0;
        v33 = *(_QWORD *)v54;
        do
        {
          v34 = 0;
          do
          {
            if (*(_QWORD *)v54 != v33)
              objc_enumerationMutation(v28);
            v35 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v34);
            v36 = (const opaqueCMFormatDescription *)objc_msgSend(v35, "formatDescription");
            if (CMFormatDescriptionGetMediaSubType(v36) == self->_preferredDepthFormat)
            {
              v37 = CMVideoFormatDescriptionGetDimensions(v36);
              v38 = (double)v37.width;
              if (self->_preferredDepthResolution.width >= (double)v37.width)
              {
                v39 = (double)v37.height;
                v40 = v37.width * v37.height;
                if (self->_preferredDepthResolution.height >= (double)v37.height && v37.width * v37.height > v32)
                {
                  v42 = v35;

                  if (self->_preferredDepthResolution.width == v38)
                  {
                    v32 = v40;
                    v31 = v42;
                    if (self->_preferredDepthResolution.height == v39)
                      goto LABEL_41;
                  }
                  else
                  {
                    v32 = v40;
                    v31 = v42;
                  }
                }
              }
            }
            ++v34;
          }
          while (v30 != v34);
          v43 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
          v30 = v43;
          v42 = v31;
        }
        while (v43);
LABEL_41:

        v4 = v52;
        if (v42)
        {
          p_finalDepthFormat = &self->_finalDepthFormat;
          objc_storeStrong((id *)p_finalDepthFormat, v42);
          v45 = (void *)HRTFEnrollmentLog;
          if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
          {
            v46 = *p_finalDepthFormat;
            v47 = v45;
            -[AVCaptureDeviceFormat description](v46, "description");
            v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v49 = objc_msgSend(v48, "UTF8String");
            *(_DWORD *)buf = 136315138;
            v63 = v49;
            _os_log_impl(&dword_22153F000, v47, OS_LOG_TYPE_DEFAULT, "capture device depth format: %s", buf, 0xCu);

          }
          v50 = 1;
LABEL_53:

          goto LABEL_54;
        }
      }
      else
      {

      }
      if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR))
        -[HRTFSyncedCaptureSource _verifyCaptureDevice:].cold.2();
      v50 = 0;
      goto LABEL_53;
    }
  }
  else
  {

  }
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR))
    -[HRTFSyncedCaptureSource _verifyCaptureDevice:].cold.1();
  v50 = 0;
LABEL_54:

  return v50;
}

- (void)dealloc
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  objc_super v5;

  connection = self->_connection;
  if (connection)
  {
    -[NSXPCConnection invalidate](connection, "invalidate");
    v4 = self->_connection;
    self->_connection = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)HRTFEnrollmentSession;
  -[HRTFEnrollmentSession dealloc](&v5, sel_dealloc);
}

- (void)pauseSession
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__HRTFEnrollmentSession_pauseSession__block_invoke;
  block[3] = &unk_24E718BA8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __37__HRTFEnrollmentSession_pauseSession__block_invoke(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 73) = 1;
  v1 = HRTFEnrollmentLog;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_22153F000, v1, OS_LOG_TYPE_DEFAULT, "session paused", v2, 2u);
  }
}

- (void)resumeSession
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__HRTFEnrollmentSession_resumeSession__block_invoke;
  block[3] = &unk_24E718BA8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __38__HRTFEnrollmentSession_resumeSession__block_invoke(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 73) = 0;
  v1 = HRTFEnrollmentLog;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_22153F000, v1, OS_LOG_TYPE_DEFAULT, "session resumed", v2, 2u);
  }
}

- (id)getMovFileName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy-MM-dd-HH-mm-ss"));
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)getRecordingFolder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;

  v3 = (void *)MEMORY[0x24BDD17C8];
  NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/testHRTF"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD17C8];
  -[HRTFEnrollmentSession getMovFileName](self, "getMovFileName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("HRTFEnrollmentRecordings/%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "URLByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "fileExistsAtPath:", v11);

  if ((v13 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v11, 1, 0, 0);

  }
  NSLog(CFSTR("HRTFEnrollmentSession::getRecordingFolder - %@"), v11);
  v15 = v11;

  return v15;
}

- (id)getRecordingURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HRTFEnrollmentSession getMovFileName](self, "getMovFileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRTFEnrollmentSession getRecordingFolder](self, "getRecordingFolder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    NSTemporaryDirectory();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@.MOV"), v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("HRTFEnrollmentSession::getRecordingURL - %@"), v5);
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)startSession:(BOOL)a3 withAssetPath:(id)a4 then:(id)a5
{
  id v7;

  objc_storeStrong((id *)&self->_assetDownloadPath, a4);
  v7 = a4;
  NSLog(CFSTR("startSession with _assetDownloadPath %@"), self->_assetDownloadPath);

  -[HRTFEnrollmentSession startSession:then:](self, "startSession:then:", 1, &__block_literal_global_54);
}

void __57__HRTFEnrollmentSession_startSession_withAssetPath_then___block_invoke()
{
  NSLog(CFSTR("session started"));
}

- (void)startSession:(BOOL)a3 then:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  RecordingManager *v14;
  RecordingManager *recordingManager;
  NSObject *queue;
  id v17;
  _QWORD block[5];
  id v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a4;
  if (self->_videoCaptureEnabled)
  {
    -[HRTFEnrollmentSession getRecordingURL](self, "getRecordingURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("HRTFApp:HRTFManager - INFO - Initialize recording: %@"), v8);

    v9 = (void *)objc_opt_new();
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v9, "framework");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("version"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("HRTFEnrollment-Visage-%@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[RecordingManager initWithFileURL:expectedFrameRate:colorStreamId:depthStreamId:appName:]([RecordingManager alloc], "initWithFileURL:expectedFrameRate:colorStreamId:depthStreamId:appName:", v7, CFSTR("AVCaptureDeviceTypeBuiltInWideAngleCamera.2"), CFSTR("AVCaptureDeviceTypeBuiltInTrueDepthCamera.2"), v13, 30.0);
    recordingManager = self->_recordingManager;
    self->_recordingManager = v14;

    -[RecordingManager setDelegate:](self->_recordingManager, "setDelegate:", self);
  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__HRTFEnrollmentSession_startSession_then___block_invoke;
  block[3] = &unk_24E718C78;
  block[4] = self;
  v17 = v6;
  v21 = a3;
  v19 = v17;
  v20 = &v22;
  dispatch_sync(queue, block);
  if (v17 && *((_BYTE *)v23 + 24))
    (*((void (**)(id, _QWORD))v17 + 2))(v17, 0);

  _Block_object_dispose(&v22, 8);
}

void __43__HRTFEnrollmentSession_startSession_then___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.HRTFEnrollmentService"));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = v2;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2556D96E0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setRemoteObjectInterface:", v5);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2556D8148);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setExportedInterface:", v6);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setExportedObject:");
    objc_initWeak(&location, *(id *)(a1 + 32));
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v8 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __43__HRTFEnrollmentSession_startSession_then___block_invoke_2;
    v18[3] = &unk_24E718C10;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v7, "setInterruptionHandler:", v18);
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __43__HRTFEnrollmentSession_startSession_then___block_invoke_2_151;
    v16[3] = &unk_24E718C10;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v9, "setInvalidationHandler:", v16);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "resume");
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 32);
    if (*(_QWORD *)(v10 + 152))
    {
      objc_msgSend(v11, "remoteObjectProxy");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "startSessionWithTerminationCallback:withCallback:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152), &__block_literal_global_153);
    }
    else
    {
      objc_msgSend(v11, "remoteObjectProxy");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "startSessionWithTerminationCallback:", &__block_literal_global_155);
    }

    v13 = MEMORY[0x22766DCE8](*(_QWORD *)(a1 + 40));
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 56);
    *(_QWORD *)(v14 + 56) = v13;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) & 0xFE | *(_BYTE *)(a1 + 56);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) |= 1u;
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __43__HRTFEnrollmentSession_startSession_then___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  _QWORD *v6;

  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR))
    __43__HRTFEnrollmentSession_startSession_then___block_invoke_2_cold_1();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[6];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__HRTFEnrollmentSession_startSession_then___block_invoke_149;
    block[3] = &unk_24E718BA8;
    v6 = WeakRetained;
    dispatch_async(v4, block);

  }
}

void __43__HRTFEnrollmentSession_startSession_then___block_invoke_149(uint64_t a1)
{
  id v2;
  double v3;
  id v4;

  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) & 1) != 0)
  {
    v2 = objc_alloc(MEMORY[0x24BDD1540]);
    v4 = (id)objc_msgSend(v2, "initWithDomain:code:userInfo:", kHRTFEnrollmentErrorDomain, 1, 0);
    LODWORD(v3) = 0;
    objc_msgSend(*(id *)(a1 + 32), "updateState:withProgress:facePoseStatus:earPoseStatus:errorStatus:", 5, 0, 0, v4, v3);

  }
}

void __43__HRTFEnrollmentSession_startSession_then___block_invoke_2_151(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[6];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__HRTFEnrollmentSession_startSession_then___block_invoke_3;
    block[3] = &unk_24E718BA8;
    v5 = WeakRetained;
    dispatch_async(v3, block);

  }
}

void __43__HRTFEnrollmentSession_startSession_then___block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;
  double v4;

  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_FAULT))
      __43__HRTFEnrollmentSession_startSession_then___block_invoke_3_cold_1();
    v2 = objc_alloc(MEMORY[0x24BDD1540]);
    v3 = (void *)objc_msgSend(v2, "initWithDomain:code:userInfo:", kHRTFEnrollmentErrorDomain, 1, 0);
    LODWORD(v4) = 0;
    objc_msgSend(*(id *)(a1 + 32), "updateState:withProgress:facePoseStatus:earPoseStatus:errorStatus:", 5, 0, 0, v3, v4);

  }
}

void __43__HRTFEnrollmentSession_startSession_then___block_invoke_152()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = HRTFEnrollmentLog;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_22153F000, v0, OS_LOG_TYPE_DEFAULT, "session terminated", v1, 2u);
  }
}

void __43__HRTFEnrollmentSession_startSession_then___block_invoke_154()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = HRTFEnrollmentLog;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_22153F000, v0, OS_LOG_TYPE_DEFAULT, "session terminated", v1, 2u);
  }
}

- (void)downloadHRTFAssetV2:(unint64_t)a3 withCompletion:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__HRTFEnrollmentSession_downloadHRTFAssetV2_withCompletion___block_invoke;
  v9[3] = &unk_24E718D30;
  v9[4] = self;
  v12 = a3;
  v8 = v6;
  v10 = v8;
  v11 = &v13;
  dispatch_async(queue, v9);
  if (v8 && *((_BYTE *)v14 + 24))
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v8 + 2))(v8, 0, 0, 0, 0);

  _Block_object_dispose(&v13, 8);
}

void __60__HRTFEnrollmentSession_downloadHRTFAssetV2_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.HRTFEnrollmentService"));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = v2;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2556D96E0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setRemoteObjectInterface:", v5);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2556D8148);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setExportedInterface:", v6);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setExportedObject:");
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setInterruptionHandler:", &__block_literal_global_156);
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v8 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __60__HRTFEnrollmentSession_downloadHRTFAssetV2_withCompletion___block_invoke_157;
    v14[3] = &unk_24E718C10;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v7, "setInvalidationHandler:", v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "resume");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "remoteObjectProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 56);
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __60__HRTFEnrollmentSession_downloadHRTFAssetV2_withCompletion___block_invoke_160;
    v11[3] = &unk_24E718D08;
    objc_copyWeak(&v13, &location);
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v9, "downloadAssetV2:withCompletion:", v10, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __60__HRTFEnrollmentSession_downloadHRTFAssetV2_withCompletion___block_invoke_2()
{
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR))
    __43__HRTFEnrollmentSession_startSession_then___block_invoke_2_cold_1();
}

void __60__HRTFEnrollmentSession_downloadHRTFAssetV2_withCompletion___block_invoke_157(uint64_t a1)
{
  dispatch_queue_t *WeakRetained;
  dispatch_queue_t *v2;

  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    dispatch_async(WeakRetained[6], &__block_literal_global_159);
    WeakRetained = v2;
  }

}

void __60__HRTFEnrollmentSession_downloadHRTFAssetV2_withCompletion___block_invoke_2_158()
{
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_FAULT))
    __43__HRTFEnrollmentSession_startSession_then___block_invoke_3_cold_1();
}

void __60__HRTFEnrollmentSession_downloadHRTFAssetV2_withCompletion___block_invoke_160(uint64_t a1, char a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  NSObject **WeakRetained;
  NSObject **v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  char v19;

  v9 = a3;
  v10 = a4;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    v13 = WeakRetained[6];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__HRTFEnrollmentSession_downloadHRTFAssetV2_withCompletion___block_invoke_2_161;
    block[3] = &unk_24E718CE0;
    v19 = a2;
    v15 = v9;
    v16 = v10;
    v18 = a5;
    v17 = *(id *)(a1 + 32);
    dispatch_async(v13, block);

  }
}

uint64_t __60__HRTFEnrollmentSession_downloadHRTFAssetV2_withCompletion___block_invoke_2_161(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  const char *v7;
  uint64_t result;
  _DWORD v9[2];
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = HRTFEnrollmentLog;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 64);
    v5 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 56) - 1;
    if (v6 > 3)
      v7 = "Unknown";
    else
      v7 = (&off_24E718EF8)[v6];
    v9[0] = 67109890;
    v9[1] = v3;
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v4;
    v14 = 2080;
    v15 = v7;
    _os_log_impl(&dword_22153F000, v2, OS_LOG_TYPE_DEFAULT, "isDownloaded %d status %@ error %@ result %s", (uint8_t *)v9, 0x26u);
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  return result;
}

- (void)downloadHRTFAsset:(unint64_t)a3 withCompletion:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__HRTFEnrollmentSession_downloadHRTFAsset_withCompletion___block_invoke;
  v9[3] = &unk_24E718D30;
  v9[4] = self;
  v12 = a3;
  v8 = v6;
  v10 = v8;
  v11 = &v13;
  dispatch_async(queue, v9);
  if (v8 && *((_BYTE *)v14 + 24))
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v8 + 2))(v8, 0, 0, 0);

  _Block_object_dispose(&v13, 8);
}

void __58__HRTFEnrollmentSession_downloadHRTFAsset_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.HRTFEnrollmentService"));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = v2;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2556D96E0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setRemoteObjectInterface:", v5);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2556D8148);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setExportedInterface:", v6);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setExportedObject:");
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setInterruptionHandler:", &__block_literal_global_163);
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v8 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __58__HRTFEnrollmentSession_downloadHRTFAsset_withCompletion___block_invoke_164;
    v14[3] = &unk_24E718C10;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v7, "setInvalidationHandler:", v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "resume");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "remoteObjectProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 56);
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __58__HRTFEnrollmentSession_downloadHRTFAsset_withCompletion___block_invoke_167;
    v11[3] = &unk_24E718DC0;
    objc_copyWeak(&v13, &location);
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v9, "downloadAsset:withCompletion:", v10, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __58__HRTFEnrollmentSession_downloadHRTFAsset_withCompletion___block_invoke_2()
{
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR))
    __43__HRTFEnrollmentSession_startSession_then___block_invoke_2_cold_1();
}

void __58__HRTFEnrollmentSession_downloadHRTFAsset_withCompletion___block_invoke_164(uint64_t a1)
{
  dispatch_queue_t *WeakRetained;
  dispatch_queue_t *v2;

  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    dispatch_async(WeakRetained[6], &__block_literal_global_166);
    WeakRetained = v2;
  }

}

void __58__HRTFEnrollmentSession_downloadHRTFAsset_withCompletion___block_invoke_2_165()
{
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_FAULT))
    __43__HRTFEnrollmentSession_startSession_then___block_invoke_3_cold_1();
}

void __58__HRTFEnrollmentSession_downloadHRTFAsset_withCompletion___block_invoke_167(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject **WeakRetained;
  NSObject **v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  char v16;

  v7 = a3;
  v8 = a4;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    v11 = WeakRetained[6];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __58__HRTFEnrollmentSession_downloadHRTFAsset_withCompletion___block_invoke_2_168;
    v12[3] = &unk_24E718D98;
    v16 = a2;
    v13 = v7;
    v14 = v8;
    v15 = *(id *)(a1 + 32);
    dispatch_async(v11, v12);

  }
}

uint64_t __58__HRTFEnrollmentSession_downloadHRTFAsset_withCompletion___block_invoke_2_168(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  _DWORD v7[2];
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = HRTFEnrollmentLog;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 56);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7[0] = 67109634;
    v7[1] = v3;
    v8 = 2112;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_22153F000, v2, OS_LOG_TYPE_DEFAULT, "isDownloaded %d status %@ error %@", (uint8_t *)v7, 0x1Cu);
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)stopSession:(id)a3
{
  id v4;
  NSObject *v5;
  RecordingManager *recordingManager;
  NSObject *queue;
  void (**v8)(_QWORD);
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint8_t buf[16];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v5 = HRTFEnrollmentLog;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22153F000, v5, OS_LOG_TYPE_DEFAULT, "session stopped, recordingManager", buf, 2u);
  }
  if (self->_videoCaptureEnabled)
  {
    recordingManager = self->_recordingManager;
    if (recordingManager)
      -[RecordingManager stopRecording](recordingManager, "stopRecording");
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__HRTFEnrollmentSession_stopSession___block_invoke;
  block[3] = &unk_24E718E10;
  block[4] = self;
  v11 = &v13;
  v8 = (void (**)(_QWORD))v4;
  v10 = v8;
  dispatch_sync(queue, block);
  if (*((_BYTE *)v14 + 24))
    v8[2](v8);

  _Block_object_dispose(&v13, 8);
}

void __37__HRTFEnrollmentSession_stopSession___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1[4] + 40), "stopCaptureSession");
  *(_BYTE *)(a1[4] + 16) &= ~1u;
  v2 = *(void **)(a1[4] + 32);
  if (v2)
  {
    objc_msgSend(v2, "remoteObjectProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __37__HRTFEnrollmentSession_stopSession___block_invoke_2;
    v5[3] = &unk_24E718DE8;
    v4 = (void *)a1[5];
    v5[4] = a1[4];
    v6 = v4;
    objc_msgSend(v3, "stopSession:", v5);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
}

uint64_t __37__HRTFEnrollmentSession_stopSession___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  v2 = HRTFEnrollmentLog;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22153F000, v2, OS_LOG_TYPE_DEFAULT, "session stopped, invalidating connection", buf, 2u);
  }
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 48);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__HRTFEnrollmentSession_stopSession___block_invoke_170;
  block[3] = &unk_24E718BA8;
  block[4] = v3;
  dispatch_sync(v4, block);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __37__HRTFEnrollmentSession_stopSession___block_invoke_170(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) &= ~1u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), (id)kHRTFIdleStateInfo);
}

- (void)sessionStarted:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *queue;
  id v8;
  uint64_t v9;
  id WeakRetained;
  id v11;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  BOOL v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v4 = a3;
  v6 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__171;
  v21 = __Block_byref_object_dispose__172;
  v22 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__HRTFEnrollmentSession_sessionStarted_error___block_invoke;
  block[3] = &unk_24E718E38;
  v14 = &v17;
  v15 = &v23;
  block[4] = self;
  v16 = v4;
  v8 = v6;
  v13 = v8;
  dispatch_sync(queue, block);
  v9 = v18[5];
  if (v9)
    (*(void (**)(uint64_t, _BOOL8))(v9 + 16))(v9, v4);
  if (!v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v11, "didReceiveStateUpdateForSession:stateInfo:", self, v24[5]);

    }
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

}

void __46__HRTFEnrollmentSession_sessionStarted_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[8];
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v2 = MEMORY[0x22766DCE8](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = 0;

  if (*(_BYTE *)(a1 + 64))
  {
    v7 = *(_QWORD *)(a1 + 32);
    if ((*(_BYTE *)(v7 + 16) & 1) != 0)
    {
      *(_BYTE *)(v7 + 16) |= 1u;
      v12 = HRTFEnrollmentLog;
      if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_22153F000, v12, OS_LOG_TYPE_DEFAULT, "session started", v13, 2u);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "startCaptureSession");
    }
    else
    {
      v8 = HRTFEnrollmentLog;
      if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_22153F000, v8, OS_LOG_TYPE_DEFAULT, "session stop requested before started", v13, 2u);
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR))
      __46__HRTFEnrollmentSession_sessionStarted_error___block_invoke_cold_1();
    v14[0] = kHRTFStateInfoStateKey;
    v14[1] = kHRTFStateInfoProgressKey;
    v15[0] = &unk_24E71C640;
    v15[1] = &unk_24E71C628;
    v14[2] = kHRTFStateInfoErrorInfoKey;
    v15[2] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

- (void)requestResultDataAtOffset:(unint64_t)a3 forLength:(unint64_t)a4 withCompletion:(id)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v8 = a5;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__HRTFEnrollmentSession_requestResultDataAtOffset_forLength_withCompletion___block_invoke;
  block[3] = &unk_24E718E60;
  block[4] = self;
  v13 = &v16;
  v14 = a3;
  v15 = a4;
  v10 = v8;
  v12 = v10;
  dispatch_sync(queue, block);
  if (*((_BYTE *)v17 + 24))
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);

  _Block_object_dispose(&v16, 8);
}

void __76__HRTFEnrollmentSession_requestResultDataAtOffset_forLength_withCompletion___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1[4] + 32);
  if (v2)
  {
    objc_msgSend(v2, "remoteObjectProxy");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "requestDataWithOffset:length:withCompletion:", a1[7], a1[8], a1[5]);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR))
      __76__HRTFEnrollmentSession_requestResultDataAtOffset_forLength_withCompletion___block_invoke_cold_1();
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
}

- (void)updateState:(unint64_t)a3 withProgress:(float)a4 facePoseStatus:(id)a5 earPoseStatus:(id)a6 errorStatus:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *queue;
  id v27;
  id WeakRetained;
  id v29;
  _QWORD block[5];
  id v31;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = objc_alloc(MEMORY[0x24BDBCED8]);
  v32[0] = kHRTFStateInfoStateKey;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = kHRTFStateInfoProgressKey;
  v33[0] = v16;
  *(float *)&v17 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v15, "initWithDictionary:", v19);

  if (a3 == 5)
  {
    v21 = kHRTFStateInfoErrorInfoKey;
    v22 = v20;
    v23 = v14;
LABEL_8:
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, v21);
    goto LABEL_9;
  }
  if (a3 - 1 <= 1)
  {
    if (v12)
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v12, kHRTFStateInfoFacePoseStatusKey);
    if (v13)
    {
      objc_msgSend(v13, "leftStatus");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v24, kHRTFStateInfoLeftEarPoseStatusKey);

      objc_msgSend(v13, "rightStatus");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v25, kHRTFStateInfoRightEarPoseStatusKey);

      v21 = kHRTFStateInfoEarPoseStatusKey;
      v22 = v20;
      v23 = v13;
      goto LABEL_8;
    }
  }
LABEL_9:
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __91__HRTFEnrollmentSession_updateState_withProgress_facePoseStatus_earPoseStatus_errorStatus___block_invoke;
  block[3] = &unk_24E718E88;
  block[4] = self;
  v27 = v20;
  v31 = v27;
  dispatch_async(queue, block);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v29 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v29, "didReceiveStateUpdateForSession:stateInfo:", self, v27);

  }
}

void __91__HRTFEnrollmentSession_updateState_withProgress_facePoseStatus_earPoseStatus_errorStatus___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

- (void)updateResultSize:(unint64_t)a3
{
  NSObject *queue;
  NSObject *v5;
  _QWORD v6[6];
  uint8_t buf[4];
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__HRTFEnrollmentSession_updateResultSize___block_invoke;
  v6[3] = &unk_24E718EB0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(queue, v6);
  v5 = HRTFEnrollmentLog;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v8 = a3;
    _os_log_impl(&dword_22153F000, v5, OS_LOG_TYPE_DEFAULT, "result data has a size of %lu", buf, 0xCu);
  }
}

uint64_t __42__HRTFEnrollmentSession_updateResultSize___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 24) = *(_QWORD *)(result + 40);
  return result;
}

- (void)didStartCaptureSessionWithError:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__HRTFEnrollmentSession_didStartCaptureSessionWithError___block_invoke;
  block[3] = &unk_24E718ED8;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(queue, block);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __57__HRTFEnrollmentSession_didStartCaptureSessionWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  _BYTE *WeakRetained;
  double v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = HRTFEnrollmentLog;
  v4 = os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_22153F000, v3, OS_LOG_TYPE_DEFAULT, "Failed to start AVCaptureSession with error:%@", (uint8_t *)&v9, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v8 = WeakRetained;
    if (WeakRetained)
    {
      if ((WeakRetained[16] & 1) != 0)
      {
        LODWORD(v7) = 0;
        objc_msgSend(WeakRetained, "updateState:withProgress:facePoseStatus:earPoseStatus:errorStatus:", 5, 0, 0, *(_QWORD *)(a1 + 32), v7);
      }
    }

  }
  else if (v4)
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_22153F000, v3, OS_LOG_TYPE_DEFAULT, "AVCaptureSession started\n", (uint8_t *)&v9, 2u);
  }
}

- (void)didReceiveVideoData:(id)a3 colorData:(id)a4 depthData:(id)a5 faceObject:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  opaqueCMSampleBuffer *v14;
  CVImageBufferRef ImageBuffer;
  CVImageBufferRef v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  double Seconds;
  void *v25;
  void *v26;
  double v27;
  AVCaptureDevice *device;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  HRTFSerializableCaptureData *v41;
  void *v42;
  HRTFSerializableFaceData *v43;
  void *v44;
  void *v45;
  void *v46;
  HRTFEnrollmentSessionDelegate **p_delegate;
  id WeakRetained;
  id v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  HRTFSerializableCaptureData *v55;
  id v56;
  CMTime v57;
  CMTime time;
  CMTime v59;
  __int128 v60;
  __int128 v61;
  double v62[4];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEBUG))
    -[HRTFEnrollmentSession didReceiveVideoData:colorData:depthData:faceObject:].cold.6();
  v14 = (opaqueCMSampleBuffer *)objc_msgSend(v11, "sampleBuffer");
  ImageBuffer = CMSampleBufferGetImageBuffer(v14);
  if (ImageBuffer)
  {
    v16 = ImageBuffer;
    v56 = v10;
    objc_msgSend(v12, "depthData");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = objc_msgSend(v17, "depthDataMap");
    if (!v18)
    {
      if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR))
        -[HRTFEnrollmentSession didReceiveVideoData:colorData:depthData:faceObject:].cold.2();
      goto LABEL_37;
    }
    v19 = v18;
    objc_msgSend(v17, "cameraCalibrationData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      v10 = v56;
      if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR))
        -[HRTFEnrollmentSession didReceiveVideoData:colorData:depthData:faceObject:].cold.3();
      goto LABEL_36;
    }
    CMGetAttachment(v14, (CFStringRef)*MEMORY[0x24BDC0CD8], 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (!v21)
    {
      if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR))
        -[HRTFEnrollmentSession didReceiveVideoData:colorData:depthData:faceObject:].cold.4();
      goto LABEL_35;
    }
    v23 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 16);
    v60 = *MEMORY[0x24BDAEDF8];
    v61 = v23;
    *(_OWORD *)v62 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 32);
    v52 = v21;
    objc_msgSend(v21, "getBytes:length:", &v60, 48);
    memset(&v59, 0, sizeof(v59));
    if (v11)
      objc_msgSend(v11, "timestamp");
    time = v59;
    Seconds = CMTimeGetSeconds(&time);
    if (!self->_videoCaptureEnabled || !self->_recordingManager)
    {
LABEL_25:
      objc_msgSend(v20, "intrinsicMatrix");
      v54 = v30;
      v50 = v32;
      v51 = v31;
      objc_msgSend(v20, "intrinsicMatrixReferenceDimensions");
      v34 = v33;
      v36 = v35;
      objc_msgSend(v20, "lensDistortionCenter");
      v38 = v37;
      v40 = v39;
      v41 = [HRTFSerializableCaptureData alloc];
      objc_msgSend(v20, "lensDistortionLookupTable");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = -[HRTFSerializableCaptureData initWithColorPixelBuffer:depthPixelBuffer:colorIntrinsics:depthIntrinsics:distortionLookupTable:referenceDimensions:distortionCenter:timestamp:](v41, "initWithColorPixelBuffer:depthPixelBuffer:colorIntrinsics:depthIntrinsics:distortionLookupTable:referenceDimensions:distortionCenter:timestamp:", v16, v19, v42, *(double *)&v60, *(double *)&v61, v62[0], v54, v51, v50, v34, v36, v38, v40, *(_QWORD *)&Seconds);

      if (v13)
        v43 = -[HRTFSerializableFaceData initWithFaceObject:]([HRTFSerializableFaceData alloc], "initWithFaceObject:", v13);
      else
        v43 = 0;
      if (!self->_paused)
      {
        -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "processCaptureData:withFaceData:", v55, v43);

      }
      if ((*(_BYTE *)&self->_flags & 1) != 0)
      {
        v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBF660]), "initWithCVPixelBuffer:", v16);
        v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBF660]), "initWithCVPixelBuffer:", v19);
        p_delegate = &self->_delegate;
        WeakRetained = objc_loadWeakRetained((id *)p_delegate);

        if (WeakRetained)
        {
          v49 = objc_loadWeakRetained((id *)p_delegate);
          objc_msgSend(v49, "didReceiveCaptureVideo:colorImage:depthImage:faceObject:", v56, v45, v46, v13);

        }
      }

      v22 = v52;
LABEL_35:

      v10 = v56;
LABEL_36:

LABEL_37:
      goto LABEL_38;
    }
    CMGetAttachment((CMAttachmentBearerRef)objc_msgSend(v11, "sampleBuffer"), CFSTR("{Exif}"), 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "valueForKey:", CFSTR("ExposureTime"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      objc_msgSend(v25, "doubleValue");
    }
    else
    {
      device = self->_device;
      if (!device)
      {
        v29 = 0.0;
        if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR))
          -[HRTFEnrollmentSession didReceiveVideoData:colorData:depthData:faceObject:].cold.5();
        goto LABEL_24;
      }
      memset(&time, 0, sizeof(time));
      -[AVCaptureDevice exposureDuration](device, "exposureDuration");
      v57 = time;
      v27 = CMTimeGetSeconds(&v57);
    }
    v29 = v27;
LABEL_24:
    -[RecordingManager process:depthFrame:faceObject:timestamp:intrinsics:calibration:exposureTime:](self->_recordingManager, "process:depthFrame:faceObject:timestamp:intrinsics:calibration:exposureTime:", v16, v19, v13, v20, Seconds, *(double *)&v60, *(double *)&v61, v62[0], v29);

    goto LABEL_25;
  }
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR))
    -[HRTFEnrollmentSession didReceiveVideoData:colorData:depthData:faceObject:].cold.1();
LABEL_38:

}

- (NSDictionary)stateInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)resultSize
{
  return self->_resultSize;
}

- (HRTFEnrollmentSessionDelegate)delegate
{
  return (HRTFEnrollmentSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assetDownloadPath, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_finalDepthFormat, 0);
  objc_storeStrong((id *)&self->_finalColorFormat, 0);
  objc_storeStrong((id *)&self->_colorDataOutput, 0);
  objc_storeStrong((id *)&self->_recordingManager, 0);
  objc_storeStrong(&self->_sessionStartCallback, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_outputSource, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_stateInfo, 0);
}

void __43__HRTFEnrollmentSession_startSession_then___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22153F000, v0, v1, "service connection interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __43__HRTFEnrollmentSession_startSession_then___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_22153F000, v0, v1, "service connection invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__HRTFEnrollmentSession_sessionStarted_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22153F000, v0, v1, "session failed to start", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __76__HRTFEnrollmentSession_requestResultDataAtOffset_forLength_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22153F000, v0, v1, "attempting to retrieve result data without an active session", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)didReceiveVideoData:colorData:depthData:faceObject:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22153F000, v0, v1, "color data is absent", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)didReceiveVideoData:colorData:depthData:faceObject:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22153F000, v0, v1, "depth data is absent", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)didReceiveVideoData:colorData:depthData:faceObject:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22153F000, v0, v1, "lense calibration data is absent", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)didReceiveVideoData:colorData:depthData:faceObject:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22153F000, v0, v1, "color instrinsics data is absent", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)didReceiveVideoData:colorData:depthData:faceObject:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22153F000, v0, v1, "cannot retrieve exposure time", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)didReceiveVideoData:colorData:depthData:faceObject:.cold.6()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_22153F000, v0, OS_LOG_TYPE_DEBUG, "video frame arrived", v1, 2u);
  OUTLINED_FUNCTION_1();
}

@end
