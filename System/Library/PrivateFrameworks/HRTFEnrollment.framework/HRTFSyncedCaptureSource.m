@implementation HRTFSyncedCaptureSource

- (BOOL)_verifyCaptureDevice:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  const opaqueCMFormatDescription *v14;
  unint64_t Dimensions;
  CMVideoDimensions v16;
  unint64_t v17;
  id v19;
  void *v20;
  AVCaptureDeviceFormat *finalColorFormat;
  NSObject *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  const opaqueCMFormatDescription *v31;
  unint64_t v32;
  CMVideoDimensions v33;
  id v34;
  unint64_t v35;
  id v37;
  BOOL v38;
  AVCaptureDeviceFormat **p_finalDepthFormat;
  void *v40;
  AVCaptureDeviceFormat *v41;
  NSObject *v42;
  id v43;
  uint64_t v44;
  BOOL v45;
  id v47;
  void *v48;
  void *v49;
  unint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t v59[128];
  uint8_t buf[4];
  uint64_t v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  objc_msgSend(v4, "formats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
  if (!v6)
  {

    goto LABEL_48;
  }
  v7 = v6;
  v47 = v4;
  v8 = 0;
  v49 = 0;
  v9 = *(_QWORD *)v56;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v56 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
      objc_msgSend(v11, "supportedDepthDataFormats");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13)
      {
        v14 = (const opaqueCMFormatDescription *)objc_msgSend(v11, "formatDescription");
        if (CMFormatDescriptionGetMediaSubType(v14) == self->_preferredPixelFormat)
        {
          Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(v14);
          v16 = (CMVideoDimensions)Dimensions;
          if (self->_preferredColorResolutionX >= Dimensions)
          {
            v17 = HIDWORD(Dimensions);
            if (self->_preferredColorResolutionY >= HIDWORD(Dimensions) && (int)Dimensions * HIDWORD(Dimensions) > v8)
            {
              v19 = v11;

              if (self->_preferredColorResolutionX == v16.width)
              {
                v8 = v16.width * v16.height;
                v49 = v19;
                if (self->_preferredColorResolutionY == (_DWORD)v17)
                  goto LABEL_20;
              }
              else
              {
                v8 = v16.width * v16.height;
                v49 = v19;
              }
            }
          }
        }
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
    v19 = v49;
  }
  while (v7);
LABEL_20:

  v4 = v47;
  if (!v19)
  {
LABEL_48:
    if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR))
      -[HRTFSyncedCaptureSource _verifyCaptureDevice:].cold.1();
    v45 = 0;
    goto LABEL_56;
  }
  objc_storeStrong((id *)&self->_finalColorFormat, v19);
  v20 = (void *)HRTFEnrollmentLog;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
  {
    finalColorFormat = self->_finalColorFormat;
    v22 = v20;
    -[AVCaptureDeviceFormat description](finalColorFormat, "description");
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v24 = objc_msgSend(v23, "UTF8String");
    *(_DWORD *)buf = 136315138;
    v61 = v24;
    _os_log_impl(&dword_22153F000, v22, OS_LOG_TYPE_DEFAULT, "capture device color format: %s", buf, 0xCu);

  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v19, "supportedDepthDataFormats");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (!v26)
  {

    goto LABEL_52;
  }
  v27 = v26;
  v48 = 0;
  v50 = 0;
  v28 = *(_QWORD *)v52;
  do
  {
    for (j = 0; j != v27; ++j)
    {
      if (*(_QWORD *)v52 != v28)
        objc_enumerationMutation(v25);
      v30 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
      v31 = (const opaqueCMFormatDescription *)objc_msgSend(v30, "formatDescription");
      if (CMFormatDescriptionGetMediaSubType(v31) == self->_preferredDepthFormat)
      {
        v32 = (unint64_t)CMVideoFormatDescriptionGetDimensions(v31);
        v33 = (CMVideoDimensions)v32;
        if (self->_preferredDepthResolutionX >= v32)
        {
          v34 = v19;
          v35 = HIDWORD(v32);
          if (self->_preferredDepthResolutionY < HIDWORD(v32) || (int)v32 * HIDWORD(v32) <= v50)
            goto LABEL_40;
          v37 = v30;

          if (self->_preferredDepthResolutionX != v33.width)
          {
            v48 = v37;
            v50 = v33.width * v33.height;
LABEL_40:
            v19 = v34;
            continue;
          }
          v48 = v37;
          v50 = v33.width * v33.height;
          v38 = self->_preferredDepthResolutionY == (_DWORD)v35;
          v19 = v34;
          if (v38)
            goto LABEL_43;
        }
      }
    }
    v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    v37 = v48;
  }
  while (v27);
LABEL_43:

  v4 = v47;
  if (v37)
  {
    p_finalDepthFormat = &self->_finalDepthFormat;
    objc_storeStrong((id *)p_finalDepthFormat, v37);
    v40 = (void *)HRTFEnrollmentLog;
    if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
    {
      v41 = *p_finalDepthFormat;
      v42 = v40;
      -[AVCaptureDeviceFormat description](v41, "description");
      v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v44 = objc_msgSend(v43, "UTF8String");
      *(_DWORD *)buf = 136315138;
      v61 = v44;
      _os_log_impl(&dword_22153F000, v42, OS_LOG_TYPE_DEFAULT, "capture device depth format: %s", buf, 0xCu);

    }
    v45 = 1;
    goto LABEL_55;
  }
LABEL_52:
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR))
    -[HRTFSyncedCaptureSource _verifyCaptureDevice:].cold.2();
  v45 = 0;
LABEL_55:

LABEL_56:
  return v45;
}

- (BOOL)_configureVideoOutputsForDevice:(id)a3 inSession:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  AVCaptureMetadataOutput *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  AVCaptureMetadataOutput *metadataOutput;
  AVCaptureMetadataOutput *v18;
  id v19;
  void *v20;
  AVCaptureDataOutputSynchronizer *v21;
  AVCaptureDataOutputSynchronizer *outputSynchronizer;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(v5, "beginConfiguration");
  v6 = objc_alloc_init(MEMORY[0x24BDB2508]);
  objc_msgSend(v6, "setAlwaysDiscardsLateVideoFrames:", 1);
  if (objc_msgSend(v5, "canAddOutput:", v6))
  {
    objc_msgSend(v5, "addOutput:", v6);
    objc_msgSend(v6, "connectionWithMediaType:", *MEMORY[0x24BDB1D50]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "setCameraIntrinsicMatrixDeliveryEnabled:", objc_msgSend(v7, "isCameraIntrinsicMatrixDeliverySupported"));
      if (objc_msgSend(v8, "isVideoOrientationSupported"))
        objc_msgSend(v8, "setVideoOrientation:", 1);
      objc_msgSend(v8, "setEnabled:", 1);
    }

  }
  objc_storeStrong((id *)&self->_colorDataOutput, v6);
  v9 = objc_alloc_init(MEMORY[0x24BDB2458]);
  objc_msgSend(v9, "setFilteringEnabled:", 0);
  objc_msgSend(v9, "setAlwaysDiscardsLateDepthData:", 1);
  if (objc_msgSend(v5, "canAddOutput:", v9))
  {
    objc_msgSend(v5, "addOutput:", v9);
    objc_msgSend(v9, "connectionWithMediaType:", *MEMORY[0x24BDB1D00]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if (objc_msgSend(v10, "isVideoOrientationSupported"))
        objc_msgSend(v11, "setVideoOrientation:", 1);
      objc_msgSend(v11, "setEnabled:", 1);
    }

  }
  objc_storeStrong((id *)&self->_depthDataOutput, v9);
  v12 = (AVCaptureMetadataOutput *)objc_alloc_init(MEMORY[0x24BDB2498]);
  if (objc_msgSend(v5, "canAddOutput:", v12))
  {
    objc_msgSend(v5, "addOutput:", v12);
    -[AVCaptureMetadataOutput availableMetadataObjectTypes](v12, "availableMetadataObjectTypes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x24BDB1E98];
    v15 = objc_msgSend(v13, "containsObject:", *MEMORY[0x24BDB1E98]);

    if (v15)
    {
      v24[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVCaptureMetadataOutput setMetadataObjectTypes:](v12, "setMetadataObjectTypes:", v16);

    }
  }
  metadataOutput = self->_metadataOutput;
  self->_metadataOutput = v12;
  v18 = v12;

  objc_msgSend(v5, "commitConfiguration");
  v19 = objc_alloc(MEMORY[0x24BDB2450]);
  objc_msgSend(v5, "outputs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (AVCaptureDataOutputSynchronizer *)objc_msgSend(v19, "initWithDataOutputs:", v20);

  -[AVCaptureDataOutputSynchronizer setDelegate:queue:](v21, "setDelegate:queue:", self, self->_queue);
  outputSynchronizer = self->_outputSynchronizer;
  self->_outputSynchronizer = v21;

  return 1;
}

- (BOOL)_initialize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  BOOL v14;
  id v16;
  void *v17;
  id v18;
  BOOL v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  BOOL v25;
  AVCaptureVideoPreviewLayer *v26;
  AVCaptureVideoPreviewLayer *previewLayer;
  NSObject *v28;
  uint8_t v29[16];
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDB2468];
  v37[0] = *MEMORY[0x24BDB1A48];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "discoverySessionWithDeviceTypes:mediaType:position:", v4, *MEMORY[0x24BDB1D50], 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "devices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6 || !objc_msgSend(v6, "count"))
  {
    if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR))
      -[HRTFSyncedCaptureSource _initialize].cold.1();
    goto LABEL_14;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (!v9)
    goto LABEL_11;
  v10 = v9;
  v11 = *(_QWORD *)v33;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v33 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
      if (-[HRTFSyncedCaptureSource _verifyCaptureDevice:](self, "_verifyCaptureDevice:", v13))
      {
        v16 = v13;

        if (!v16)
          goto LABEL_14;
        v31 = 0;
        objc_msgSend(MEMORY[0x24BDB2470], "deviceInputWithDevice:error:", v16, &v31);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v31;
        if (v17)
          v19 = v18 == 0;
        else
          v19 = 0;
        if (!v19)
        {
          v20 = v18;
          v21 = (void *)HRTFEnrollmentLog;
          if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR))
            -[HRTFSyncedCaptureSource _initialize].cold.2(v21, v20);
          v14 = 0;
          goto LABEL_33;
        }
        v22 = objc_alloc_init(MEMORY[0x24BDB24D0]);
        objc_msgSend(v22, "beginConfiguration");
        if ((objc_msgSend(v22, "canAddInput:", v17) & 1) != 0)
        {
          objc_msgSend(v22, "addInput:", v17);
          v30 = 0;
          objc_msgSend(v16, "lockForConfiguration:", &v30);
          v23 = v30;
          if (v23)
          {
            v20 = v23;
            v24 = (void *)HRTFEnrollmentLog;
            if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR))
              -[HRTFSyncedCaptureSource _initialize].cold.4(v24, v20);
            goto LABEL_31;
          }
          objc_msgSend(v16, "setActiveFormat:", self->_finalColorFormat);
          objc_msgSend(v16, "setActiveDepthDataFormat:", self->_finalDepthFormat);
          objc_msgSend(v16, "unlockForConfiguration");
          v25 = -[HRTFSyncedCaptureSource _configureVideoOutputsForDevice:inSession:](self, "_configureVideoOutputsForDevice:inSession:", v16, v22);
          objc_msgSend(v22, "commitConfiguration");
          if (v25)
          {
            v26 = (AVCaptureVideoPreviewLayer *)objc_msgSend(objc_alloc(MEMORY[0x24BDB2510]), "initWithSession:", v22);
            previewLayer = self->_previewLayer;
            self->_previewLayer = v26;

            objc_storeStrong((id *)&self->_captureSession, v22);
            v28 = HRTFEnrollmentLog;
            if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v29 = 0;
              _os_log_impl(&dword_22153F000, v28, OS_LOG_TYPE_DEFAULT, "successfully configured capture session", v29, 2u);
            }
            v20 = 0;
            v14 = 1;
            goto LABEL_32;
          }
          if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR))
            -[HRTFSyncedCaptureSource _initialize].cold.3();
        }
        else
        {
          objc_msgSend(v22, "commitConfiguration");
          if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR))
            -[HRTFSyncedCaptureSource _initialize].cold.5();
        }
        v20 = 0;
LABEL_31:
        v14 = 0;
LABEL_32:

LABEL_33:
        goto LABEL_15;
      }
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v10)
      continue;
    break;
  }
LABEL_11:

LABEL_14:
  v14 = 0;
LABEL_15:

  return v14;
}

- (HRTFSyncedCaptureSource)initWithQueue:(id)a3 options:(id *)a4
{
  id v7;
  HRTFSyncedCaptureSource *v8;
  HRTFSyncedCaptureSource *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HRTFSyncedCaptureSource;
  v8 = -[HRTFSyncedCaptureSource init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a3);
    v9->_preferredPixelFormat = a4->var0;
    v9->_preferredDepthFormat = a4->var1;
    v9->_preferredColorResolutionX = a4->var2;
    v9->_preferredColorResolutionY = a4->var3;
    v9->_preferredDepthResolutionX = a4->var4;
    v9->_preferredDepthResolutionY = a4->var5;
    if (!-[HRTFSyncedCaptureSource _initialize](v9, "_initialize"))
    {

      v9 = 0;
    }
  }

  return v9;
}

- (void)dataOutputSynchronizer:(id)a3 didOutputSynchronizedDataCollection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *i;
  void *v18;
  AVCaptureVideoDataOutput *colorDataOutput;
  uint64_t v20;
  id v21;
  void *v22;
  NSObject *v23;
  id WeakRetained;
  id v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", self->_colorDataOutput);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", self->_depthDataOutput);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", self->_metadataOutput);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
    v10 = v7 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    if (!v8)
      goto LABEL_17;
    objc_msgSend(v8, "metadataObjects");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_17;
    v12 = (void *)v11;
    objc_msgSend(v9, "metadataObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      objc_msgSend(v9, "metadataObjects");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v28;
        while (2)
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v28 != v16)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              colorDataOutput = self->_colorDataOutput;
              v20 = *MEMORY[0x24BDB1D50];
              v21 = v18;
              -[AVCaptureVideoDataOutput connectionWithMediaType:](colorDataOutput, "connectionWithMediaType:", v20);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[AVCaptureVideoDataOutput transformedMetadataObjectForMetadataObject:connection:](self->_colorDataOutput, "transformedMetadataObjectForMetadataObject:connection:", v21, v22);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_19;
            }
          }
          v15 = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          if (v15)
            continue;
          break;
        }
      }
LABEL_19:

    }
    else
    {
LABEL_17:
      v15 = 0;
    }
    v23 = HRTFEnrollmentLog;
    if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEBUG))
      -[HRTFSyncedCaptureSource dataOutputSynchronizer:didOutputSynchronizedDataCollection:].cold.1((uint64_t)v15, v23);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      v25 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v25, "didReceiveVideoData:colorData:depthData:faceObject:", self->_previewLayer, v6, v7, v15);

    }
  }

}

- (void)_handleCaptureSessionNotification:(id)a3
{
  id v4;
  void *v5;
  int v6;
  HRTFSyncedCaptureSourceDelegate **p_delegate;
  id WeakRetained;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  HRTFSyncedCaptureSourceDelegate **v15;
  id v16;
  id v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDB1AC8]);

  if (v6)
  {
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);

    if (WeakRetained)
    {
      v9 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v9, "didStartCaptureSessionWithError:", 0);

    }
  }
  else
  {
    objc_msgSend(v4, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDB1B58]);

    if (v11)
    {
      objc_msgSend(v4, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDB1AD8]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = HRTFEnrollmentLog;
      if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138412290;
        v19 = v13;
        _os_log_impl(&dword_22153F000, v14, OS_LOG_TYPE_DEFAULT, "received AVCaptureSessionRuntimeErrorNotification: %@", (uint8_t *)&v18, 0xCu);
      }
      if (v13)
      {
        v15 = &self->_delegate;
        v16 = objc_loadWeakRetained((id *)v15);

        if (v16)
        {
          v17 = objc_loadWeakRetained((id *)v15);
          objc_msgSend(v17, "didStartCaptureSessionWithError:", v13);

        }
      }

    }
  }

}

- (void)startCaptureSession
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v3 = HRTFEnrollmentLog;
  if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_22153F000, v3, OS_LOG_TYPE_DEFAULT, "starting capture session\n", v6, 2u);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleCaptureSessionNotification_, *MEMORY[0x24BDB1AC8], self->_captureSession);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__handleCaptureSessionNotification_, *MEMORY[0x24BDB1B58], self->_captureSession);

  -[AVCaptureSession startRunning](self->_captureSession, "startRunning");
}

- (void)stopCaptureSession
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  if (-[AVCaptureSession isRunning](self->_captureSession, "isRunning"))
  {
    v3 = HRTFEnrollmentLog;
    if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_22153F000, v3, OS_LOG_TYPE_DEFAULT, "stopping capture session\n", v6, 2u);
    }
    -[AVCaptureSession stopRunning](self->_captureSession, "stopRunning");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDB1AC8], self->_captureSession);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BDB1B58], self->_captureSession);

  }
}

- (HRTFSyncedCaptureSourceDelegate)delegate
{
  return (HRTFSyncedCaptureSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_metadataOutput, 0);
  objc_storeStrong((id *)&self->_depthDataOutput, 0);
  objc_storeStrong((id *)&self->_colorDataOutput, 0);
  objc_storeStrong((id *)&self->_outputSynchronizer, 0);
  objc_storeStrong((id *)&self->_finalDepthFormat, 0);
  objc_storeStrong((id *)&self->_finalColorFormat, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_previewLayer, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
}

- (void)_verifyCaptureDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22153F000, v0, v1, "failed to verify color format for capture device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_verifyCaptureDevice:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22153F000, v0, v1, "failed to verify depth format for capture device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_initialize
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22153F000, v0, v1, "input device not usable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)dataOutputSynchronizer:(uint64_t)a1 didOutputSynchronizedDataCollection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1 != 0;
  _os_log_debug_impl(&dword_22153F000, a2, OS_LOG_TYPE_DEBUG, "received synced output frame, has face object: %u", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1();
}

@end
