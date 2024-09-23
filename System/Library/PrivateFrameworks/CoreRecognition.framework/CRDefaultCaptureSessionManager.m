@implementation CRDefaultCaptureSessionManager

- (CALayer)previewLayer
{
  return (CALayer *)self->_avfPreviewLayer;
}

- (void)stopRunning
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  -[CRDefaultCaptureSessionManager inputPortFormatObserver](self, "inputPortFormatObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRDefaultCaptureSessionManager inputPortFormatObserver](self, "inputPortFormatObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x24BDB1A90];
    -[CRDefaultCaptureSessionManager inputPortFormatSender](self, "inputPortFormatSender");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", v5, v6, v7);

    -[CRDefaultCaptureSessionManager setInputPortFormatObserver:](self, "setInputPortFormatObserver:", 0);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:name:object:", self, *MEMORY[0x24BDB1B68], 0);

  -[CRDefaultCaptureSessionManager captureSession](self, "captureSession");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stopRunning");

}

- (void)cacheCameraResolution:(id)a3
{
  const opaqueCMFormatDescription *v4;
  CMVideoDimensions Dimensions;

  v4 = (const opaqueCMFormatDescription *)objc_msgSend(a3, "formatDescription");
  if (v4)
  {
    Dimensions = CMVideoFormatDescriptionGetDimensions(v4);
    -[CRDefaultCaptureSessionManager setCameraResolution:](self, "setCameraResolution:", (double)Dimensions.width, (double)Dimensions.height);
  }
}

- (void)startRunning
{
  void *v3;
  uint64_t *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[6];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[CRDefaultCaptureSessionManager inputPortFormatObserver](self, "inputPortFormatObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (uint64_t *)MEMORY[0x24BDB1A90];
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRDefaultCaptureSessionManager inputPortFormatObserver](self, "inputPortFormatObserver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *v4;
    -[CRDefaultCaptureSessionManager inputPortFormatSender](self, "inputPortFormatSender");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", v6, v7, v8);

    -[CRDefaultCaptureSessionManager setInputPortFormatObserver:](self, "setInputPortFormatObserver:", 0);
  }
  -[CRDefaultCaptureSessionManager changeCameraConfiguration](self, "changeCameraConfiguration");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_cameraSessionWasInterrupted_, *MEMORY[0x24BDB1B68], 0);

  -[CRDefaultCaptureSessionManager captureSession](self, "captureSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startRunning");

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[CRDefaultCaptureSessionManager deviceInput](self, "deviceInput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ports");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    v16 = *MEMORY[0x24BDB1D50];
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v18, "mediaType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", v16);

        if (v20)
        {
          -[CRDefaultCaptureSessionManager cacheCameraResolution:](self, "cacheCameraResolution:", v18);
          -[CRDefaultCaptureSessionManager setInputPortFormatSender:](self, "setInputPortFormatSender:", v18);
          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = *MEMORY[0x24BDB1A90];
          objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v25[0] = MEMORY[0x24BDAC760];
          v25[1] = 3221225472;
          v25[2] = __46__CRDefaultCaptureSessionManager_startRunning__block_invoke;
          v25[3] = &unk_24C58B138;
          v25[4] = self;
          v25[5] = v18;
          objc_msgSend(v21, "addObserverForName:object:queue:usingBlock:", v22, v18, v23, v25);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[CRDefaultCaptureSessionManager setInputPortFormatObserver:](self, "setInputPortFormatObserver:", v24);

          goto LABEL_13;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_13:

}

uint64_t __46__CRDefaultCaptureSessionManager_startRunning__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cacheCameraResolution:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isRunning
{
  void *v2;
  char v3;

  -[CRDefaultCaptureSessionManager captureSession](self, "captureSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRunning");

  return v3;
}

- (int)targetVideoFormat
{
  return 875704422;
}

- (void)setupCameraSession
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  if (-[CRDefaultCaptureSessionManager cameraPosition](self, "cameraPosition"))
    v3 = 2;
  else
    v3 = 1;
  -[CRDefaultCaptureSessionManager captureDeviceWithPosition:](self, "captureDeviceWithPosition:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[CRDefaultCaptureSessionManager captureDeviceWithPosition:](self, "captureDeviceWithPosition:", 0);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[CRDefaultCaptureSessionManager setupCameraSessionWithCaptureDevice:](self, "setupCameraSessionWithCaptureDevice:", v4);

}

- (void)setupCameraSessionWithCaptureDevice:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  id v32;
  const opaqueCMFormatDescription *v33;
  CMVideoDimensions v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const opaqueCMFormatDescription *v42;
  FourCharCode MediaSubType;
  CMVideoDimensions v44;
  CRDefaultCaptureSessionManager *v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  CMVideoDimensions Dimensions;
  id v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  dispatch_queue_t v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  id v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  id v89;
  id v90;
  uint64_t v91;
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[CRDefaultCaptureSessionManager targetVideoFormat](self, "targetVideoFormat");
  -[CRDefaultCaptureSessionManager stopRunning](self, "stopRunning");
  -[CRDefaultCaptureSessionManager setCameraResolution:](self, "setCameraResolution:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  -[CRDefaultCaptureSessionManager captureSession](self, "captureSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDB24D0]);
    -[CRDefaultCaptureSessionManager setCaptureSession:](self, "setCaptureSession:", v7);

  }
  -[CRDefaultCaptureSessionManager captureSession](self, "captureSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isMultitaskingCameraAccessSupported");

  if (v9)
  {
    -[CRDefaultCaptureSessionManager captureSession](self, "captureSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMultitaskingCameraAccessEnabled:", 1);

  }
  v90 = 0;
  v11 = objc_msgSend(v4, "lockForConfiguration:", &v90);
  v12 = v90;
  v13 = v12;
  if (!v11)
  {
    NSLog(CFSTR("Failed to obtain device lock during camera setup %@"), v12);
LABEL_50:
    -[CRDefaultCaptureSessionManager deviceInput](self, "deviceInput");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "device");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRDefaultCaptureSessionManager setCameraPosition:](self, "setCameraPosition:", objc_msgSend(v78, "position"));

    -[CRDefaultCaptureSessionManager deviceInput](self, "deviceInput");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "device");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "uniqueID");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRDefaultCaptureSessionManager setCurrentDeviceID:](self, "setCurrentDeviceID:", v80);

    goto LABEL_51;
  }
  v84 = v12;
  -[CRDefaultCaptureSessionManager captureSession](self, "captureSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "beginConfiguration");

  -[CRDefaultCaptureSessionManager captureSession](self, "captureSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRDefaultCaptureSessionManager deviceInput](self, "deviceInput");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeInput:", v16);

  -[CRDefaultCaptureSessionManager captureSession](self, "captureSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRDefaultCaptureSessionManager captureVideoDataOutput](self, "captureVideoDataOutput");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeOutput:", v18);

  v89 = 0;
  objc_msgSend(MEMORY[0x24BDB2470], "deviceInputWithDevice:error:", v4, &v89);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v89;
  -[CRDefaultCaptureSessionManager setDeviceInput:](self, "setDeviceInput:", v19);

  -[CRDefaultCaptureSessionManager captureSession](self, "captureSession");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRDefaultCaptureSessionManager deviceInput](self, "deviceInput");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "canAddInput:", v21);

  if (v22)
  {
    -[CRDefaultCaptureSessionManager captureSession](self, "captureSession");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRDefaultCaptureSessionManager deviceInput](self, "deviceInput");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addInput:", v24);

  }
  -[CRDefaultCaptureSessionManager cameraMode](self, "cameraMode");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)*MEMORY[0x24BDB1B40];

  if (v25 == v26)
  {
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v82 = v4;
    objc_msgSend(v4, "formats");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v85, v92, 16);
    if (!v36)
    {
      v38 = 0;
LABEL_36:

LABEL_37:
      v32 = v38;
      v38 = v32;
      if (!v32)
        goto LABEL_40;
LABEL_38:
      objc_msgSend(v82, "setActiveFormat:", v32);
      Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v32, "formatDescription"));
      -[CRDefaultCaptureSessionManager setCameraResolution:](self, "setCameraResolution:", (double)Dimensions.width, (double)Dimensions.height);
      objc_msgSend(v82, "setProvidesStortorgetMetadata:", 1);
      -[CRDefaultCaptureSessionManager setupHighISO:](self, "setupHighISO:", v32);

LABEL_39:
LABEL_40:
      v53 = objc_alloc(MEMORY[0x24BDB2510]);
      -[CRDefaultCaptureSessionManager captureSession](self, "captureSession");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = (void *)objc_msgSend(v53, "initWithSession:", v54);
      -[CRDefaultCaptureSessionManager setAvfPreviewLayer:](self, "setAvfPreviewLayer:", v55);

      v56 = objc_alloc_init(MEMORY[0x24BDB2508]);
      v57 = (void *)MEMORY[0x24BDBCE70];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "dictionaryWithObject:forKey:", v58, *MEMORY[0x24BDC56B8]);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setVideoSettings:", v59);

      objc_msgSend(v56, "setAlwaysDiscardsLateVideoFrames:", 1);
      -[CRDefaultCaptureSessionManager setCaptureVideoDataOutput:](self, "setCaptureVideoDataOutput:", v56);
      v60 = dispatch_queue_create("com.apple.CoreRecognition.videoQueue", 0);
      -[CRDefaultCaptureSessionManager captureVideoDataOutput](self, "captureVideoDataOutput");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRDefaultCaptureSessionManager captureSessionDelegate](self, "captureSessionDelegate");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setSampleBufferDelegate:queue:", v62, v60);

      v4 = v82;
      if (-[CRDefaultCaptureSessionManager enableMetadataOutput](self, "enableMetadataOutput"))
      {
        v63 = objc_alloc_init(MEMORY[0x24BDB2498]);
        -[CRDefaultCaptureSessionManager captureSession](self, "captureSession");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(v64, "canAddOutput:", v63);

        if (v65)
        {
          -[CRDefaultCaptureSessionManager captureSession](self, "captureSession");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "addOutput:", v63);

        }
        -[CRDefaultCaptureSessionManager captureSessionMetadataDelegate](self, "captureSessionMetadataDelegate");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setMetadataObjectsDelegate:queue:", v67, v60);

        v91 = *MEMORY[0x24BDB1EC8];
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v91, 1);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setMetadataObjectTypes:", v68);

      }
      -[CRDefaultCaptureSessionManager captureSession](self, "captureSession");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRDefaultCaptureSessionManager captureVideoDataOutput](self, "captureVideoDataOutput");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v69, "canAddOutput:", v70);

      if (v71)
      {
        -[CRDefaultCaptureSessionManager captureSession](self, "captureSession");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRDefaultCaptureSessionManager captureVideoDataOutput](self, "captureVideoDataOutput");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "addOutput:", v73);

      }
      -[CRDefaultCaptureSessionManager captureVideoDataOutput](self, "captureVideoDataOutput");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "connectionWithMediaType:", *MEMORY[0x24BDB1D50]);
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v75, "isCameraIntrinsicMatrixDeliverySupported"))
        objc_msgSend(v75, "setCameraIntrinsicMatrixDeliveryEnabled:", 1);
      else
        NSLog(CFSTR("CameraIntrisicMatrixDelivery is NOT supported on this device"));
      -[CRDefaultCaptureSessionManager captureSession](self, "captureSession");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "commitConfiguration");

      objc_msgSend(v82, "unlockForConfiguration");
      v13 = v84;
      goto LABEL_50;
    }
    v37 = v36;
    v38 = 0;
    v39 = *(_QWORD *)v86;
    v81 = *(_QWORD *)v86;
LABEL_14:
    v40 = 0;
    while (1)
    {
      if (*(_QWORD *)v86 != v39)
        objc_enumerationMutation(v35);
      v41 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v40);
      v42 = (const opaqueCMFormatDescription *)objc_msgSend(v41, "formatDescription");
      MediaSubType = CMFormatDescriptionGetMediaSubType(v42);
      v44 = CMVideoFormatDescriptionGetDimensions(v42);
      if (v38 || MediaSubType != (_DWORD)v5)
      {
        if (MediaSubType != (_DWORD)v5)
          goto LABEL_29;
        if (v44.width > CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v38, "formatDescription")).width)
        {
          v46 = self;
          v47 = v5;
          v48 = v35;
          v49 = v41;

          v38 = v49;
          v35 = v48;
          v5 = v47;
          self = v46;
          v39 = v81;
        }
      }
      else
      {
        v38 = v41;
      }
      if (v44 == 0x99000000CC0 && MediaSubType == (_DWORD)v5)
      {
        v32 = v41;

        if (v32)
          goto LABEL_38;
        goto LABEL_37;
      }
LABEL_29:
      if (v37 == ++v40)
      {
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v85, v92, 16);
        if (v37)
          goto LABEL_14;
        goto LABEL_36;
      }
    }
  }
  -[CRDefaultCaptureSessionManager captureSession](self, "captureSession");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRDefaultCaptureSessionManager cameraMode](self, "cameraMode");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v27, "canSetSessionPreset:", v28);

  if (v29)
  {
    -[CRDefaultCaptureSessionManager captureSession](self, "captureSession");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRDefaultCaptureSessionManager cameraMode](self, "cameraMode");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setSessionPreset:", v31);

    v82 = v4;
    objc_msgSend(v4, "activeFormat");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v33 = (const opaqueCMFormatDescription *)objc_msgSend(v32, "formatDescription");
    -[CRDefaultCaptureSessionManager setupHighISO:](self, "setupHighISO:", v32);
    v34 = CMVideoFormatDescriptionGetDimensions(v33);
    -[CRDefaultCaptureSessionManager setCameraResolution:](self, "setCameraResolution:", (double)v34.width, (double)v34.height);
    goto LABEL_39;
  }
  NSLog(CFSTR("Not supported"));
  -[CRDefaultCaptureSessionManager captureSession](self, "captureSession");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "commitConfiguration");

  objc_msgSend(v4, "unlockForConfiguration");
  v51 = v83;
  v13 = v84;
LABEL_51:

}

- (void)teardownCameraSession
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CRDefaultCaptureSessionManager captureSession](self, "captureSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRDefaultCaptureSessionManager captureVideoDataOutput](self, "captureVideoDataOutput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeOutput:", v4);

  -[CRDefaultCaptureSessionManager captureSession](self, "captureSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRDefaultCaptureSessionManager deviceInput](self, "deviceInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeInput:", v6);

  -[CRDefaultCaptureSessionManager setCaptureSession:](self, "setCaptureSession:", 0);
  -[CRDefaultCaptureSessionManager setAvfPreviewLayer:](self, "setAvfPreviewLayer:", 0);
  if (-[CRDefaultCaptureSessionManager exposure_table](self, "exposure_table"))
  {
    free(*(void **)-[CRDefaultCaptureSessionManager exposure_table](self, "exposure_table"));
    free(-[CRDefaultCaptureSessionManager exposure_table](self, "exposure_table"));
    -[CRDefaultCaptureSessionManager setExposure_table:](self, "setExposure_table:", 0);
  }
}

- (void)changeCameraConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[CRDefaultCaptureSessionManager deviceInput](self, "deviceInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRDefaultCaptureSessionManager deviceInput](self, "deviceInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v6, "lockForConfiguration:", &v11);
  v7 = v11;

  if (objc_msgSend(v4, "hasTorch")
    && objc_msgSend(v4, "isTorchModeSupported:", -[CRDefaultCaptureSessionManager torchMode](self, "torchMode"))&& -[CRDefaultCaptureSessionManager isRearCamera](self, "isRearCamera"))
  {
    objc_msgSend(v4, "setTorchMode:", -[CRDefaultCaptureSessionManager torchMode](self, "torchMode"));
  }
  if (objc_msgSend(v4, "isFocusPointOfInterestSupported")
    && objc_msgSend(v4, "isFocusModeSupported:", -[CRDefaultCaptureSessionManager focusMode](self, "focusMode")))
  {
    objc_msgSend(v4, "setFocusPointOfInterest:", 0.5, 0.5);
    objc_msgSend(v4, "setFocusMode:", -[CRDefaultCaptureSessionManager focusMode](self, "focusMode"));
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v4, "isAutoFocusRangeRestrictionSupported"))
  {
    objc_msgSend(v4, "setAutoFocusRangeRestriction:", 1);
  }
  if (objc_msgSend(v4, "isWhiteBalanceModeSupported:", -[CRDefaultCaptureSessionManager whiteBalanceMode](self, "whiteBalanceMode")))objc_msgSend(v4, "setWhiteBalanceMode:", -[CRDefaultCaptureSessionManager whiteBalanceMode](self, "whiteBalanceMode"));
  if (objc_msgSend(v4, "isExposurePointOfInterestSupported")
    && objc_msgSend(v4, "isExposureModeSupported:", -[CRDefaultCaptureSessionManager exposureMode](self, "exposureMode")))
  {
    objc_msgSend(v4, "setExposurePointOfInterest:", 0.5, 0.5);
    objc_msgSend(v4, "setExposureMode:", -[CRDefaultCaptureSessionManager exposureMode](self, "exposureMode"));
  }
  v8 = *MEMORY[0x24BDB1C80];
  -[CRDefaultCaptureSessionManager avfPreviewLayer](self, "avfPreviewLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setVideoGravity:", v8);

  -[CRDefaultCaptureSessionManager avfPreviewLayer](self, "avfPreviewLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOpaque:", 1);

  objc_msgSend(v4, "unlockForConfiguration");
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

}

- (BOOL)isRearCamera
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CRDefaultCaptureSessionManager deviceInput](self, "deviceInput");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "position") == 1;

  return v4;
}

- (unint64_t)cameraCount
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDB2468];
  v3 = *MEMORY[0x24BDB1A50];
  v9[0] = *MEMORY[0x24BDB1A58];
  v9[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "discoverySessionWithDeviceTypes:mediaType:position:", v4, *MEMORY[0x24BDB1D50], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "devices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v7;
}

- (id)frontFacingCamera
{
  return -[CRDefaultCaptureSessionManager captureDeviceWithPosition:](self, "captureDeviceWithPosition:", 2);
}

- (id)backFacingCamera
{
  return -[CRDefaultCaptureSessionManager captureDeviceWithPosition:](self, "captureDeviceWithPosition:", 1);
}

- (id)captureDeviceWithPosition:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;
  _BYTE v42[128];
  _QWORD v43[3];

  v43[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDB2468];
  v43[0] = *MEMORY[0x24BDB1A58];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = *MEMORY[0x24BDB1D50];
  objc_msgSend(v5, "discoverySessionWithDeviceTypes:mediaType:position:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "devices");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v37 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "position");
        if (!a3 || v15 == a3)
        {
          if (-[CRDefaultCaptureSessionManager targetFocusDistance](self, "targetFocusDistance") < 1
            || (v16 = objc_msgSend(v14, "minimumFocusDistance"),
                v16 <= -[CRDefaultCaptureSessionManager targetFocusDistance](self, "targetFocusDistance")))
          {
            v18 = v14;

            goto LABEL_29;
          }
          v17 = v14;

          v11 = v17;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }

  v19 = (void *)MEMORY[0x24BDB2468];
  v41 = *MEMORY[0x24BDB1A50];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v41, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "discoverySessionWithDeviceTypes:mediaType:position:", v20, v31, a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "devices");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = v22;
  v23 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v33;
    while (2)
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v33 != v25)
          objc_enumerationMutation(v8);
        v27 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        v28 = objc_msgSend(v27, "position");
        if (!a3 || v28 == a3)
        {
          if (-[CRDefaultCaptureSessionManager targetFocusDistance](self, "targetFocusDistance") < 1
            || (v29 = objc_msgSend(v27, "minimumFocusDistance"),
                v29 <= -[CRDefaultCaptureSessionManager targetFocusDistance](self, "targetFocusDistance")))
          {
            v18 = v27;

            v7 = v21;
            goto LABEL_29;
          }
        }
      }
      v24 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      if (v24)
        continue;
      break;
    }
  }

  v11 = v11;
  v7 = v21;
  v18 = v11;
LABEL_29:

  return v18;
}

- (id)captureDeviceWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)MEMORY[0x24BDB2468];
  v5 = *MEMORY[0x24BDB1A50];
  v21[0] = *MEMORY[0x24BDB1A58];
  v21[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "discoverySessionWithDeviceTypes:mediaType:position:", v6, *MEMORY[0x24BDB1D50], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "devices");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "uniqueID", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v3);

        if ((v14 & 1) != 0)
        {
          v9 = v12;
          goto LABEL_11;
        }
      }
      v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

- (BOOL)toggleCamera
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  -[CRDefaultCaptureSessionManager deviceInput](self, "deviceInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "position");

  if (v5 == 1)
  {
    v6 = 2;
    return -[CRDefaultCaptureSessionManager switchToCamera:](self, "switchToCamera:", v6);
  }
  if (v5 == 2)
  {
    v6 = 1;
    return -[CRDefaultCaptureSessionManager switchToCamera:](self, "switchToCamera:", v6);
  }
  return 0;
}

- (BOOL)switchToCameraWithDeviceID:(id)a3
{
  void *v4;

  -[CRDefaultCaptureSessionManager captureDeviceWithIdentifier:](self, "captureDeviceWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[CRDefaultCaptureSessionManager setupCameraSessionWithCaptureDevice:](self, "setupCameraSessionWithCaptureDevice:", v4);

  return v4 != 0;
}

- (BOOL)switchToCamera:(int64_t)a3
{
  id v5;
  void *v6;
  id *v7;
  uint64_t *v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v41;
  uint64_t v42;
  uint64_t v43;

  if (-[CRDefaultCaptureSessionManager cameraCount](self, "cameraCount") < 2)
    goto LABEL_5;
  if (a3 == 1)
  {
    v5 = objc_alloc(MEMORY[0x24BDB2470]);
    -[CRDefaultCaptureSessionManager backFacingCamera](self, "backFacingCamera");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    v7 = (id *)&v42;
    v8 = &v42;
    goto LABEL_7;
  }
  if (a3 != 2)
  {
LABEL_5:
    LOBYTE(v9) = 0;
    return v9;
  }
  v5 = objc_alloc(MEMORY[0x24BDB2470]);
  -[CRDefaultCaptureSessionManager frontFacingCamera](self, "frontFacingCamera");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v7 = (id *)&v43;
  v8 = &v43;
LABEL_7:
  v10 = (void *)objc_msgSend(v5, "initWithDevice:error:", v6, v8);
  v11 = *v7;

  if (v10)
  {
    -[CRDefaultCaptureSessionManager stopRunning](self, "stopRunning");
    objc_msgSend(v10, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    v9 = objc_msgSend(v12, "lockForConfiguration:", &v41);
    v13 = v41;

    if (v9)
    {
      -[CRDefaultCaptureSessionManager captureSession](self, "captureSession");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "beginConfiguration");

      -[CRDefaultCaptureSessionManager captureSession](self, "captureSession");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRDefaultCaptureSessionManager deviceInput](self, "deviceInput");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeInput:", v16);

      objc_msgSend(v10, "device");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *MEMORY[0x24BDB1B18];
      v19 = objc_msgSend(v17, "supportsAVCaptureSessionPreset:", *MEMORY[0x24BDB1B18]);

      if (v19
        || (objc_msgSend(v10, "device"),
            v20 = (void *)objc_claimAutoreleasedReturnValue(),
            v18 = *MEMORY[0x24BDB1AF8],
            v21 = objc_msgSend(v20, "supportsAVCaptureSessionPreset:", *MEMORY[0x24BDB1AF8]),
            v20,
            v21))
      {
        -[CRDefaultCaptureSessionManager captureSession](self, "captureSession");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setSessionPreset:", v18);

      }
      if (-[CRDefaultCaptureSessionManager enableMetadataOutput](self, "enableMetadataOutput"))
      {
        objc_msgSend(v10, "device");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = *MEMORY[0x24BDB1AF8];
        v25 = objc_msgSend(v23, "supportsAVCaptureSessionPreset:", *MEMORY[0x24BDB1AF8]);

        -[CRDefaultCaptureSessionManager captureSession](self, "captureSession");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v25)
          v28 = v24;
        else
          v28 = *MEMORY[0x24BDB1B20];
        objc_msgSend(v26, "setSessionPreset:", v28);

      }
      -[CRDefaultCaptureSessionManager captureSession](self, "captureSession");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "canAddInput:", v10);

      -[CRDefaultCaptureSessionManager captureSession](self, "captureSession");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v30)
      {
        objc_msgSend(v31, "addInput:", v10);

        -[CRDefaultCaptureSessionManager setDeviceInput:](self, "setDeviceInput:", v10);
      }
      else
      {
        -[CRDefaultCaptureSessionManager deviceInput](self, "deviceInput");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addInput:", v33);

      }
      objc_msgSend(v10, "device");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "activeFormat");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      -[CRDefaultCaptureSessionManager setupHighISO:](self, "setupHighISO:", v35);
      -[CRDefaultCaptureSessionManager captureSession](self, "captureSession");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "commitConfiguration");

      objc_msgSend(v10, "device");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "unlockForConfiguration");

      -[CRDefaultCaptureSessionManager deviceInput](self, "deviceInput");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "device");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRDefaultCaptureSessionManager setCameraPosition:](self, "setCameraPosition:", objc_msgSend(v39, "position"));

      -[CRDefaultCaptureSessionManager startRunning](self, "startRunning");
    }
    else
    {
      NSLog(CFSTR("Failed to obtain device lock during camera setup %@"), v13);
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (void)_refocusOnPoint:(CGPoint)a3 focusMode:(int64_t)a4 exposure:(BOOL)a5
{
  CGFloat y;
  CGFloat x;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  int64_t v14;
  CGFloat v15;
  CGFloat v16;
  BOOL v17;

  y = a3.y;
  x = a3.x;
  -[CRDefaultCaptureSessionManager deviceInput](self, "deviceInput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "isAdjustingFocus") & 1) == 0)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __69__CRDefaultCaptureSessionManager__refocusOnPoint_focusMode_exposure___block_invoke;
    v12[3] = &unk_24C58B160;
    v12[4] = self;
    v13 = v11;
    v14 = a4;
    v15 = x;
    v16 = y;
    v17 = a5;
    dispatch_async(MEMORY[0x24BDAC9B8], v12);

  }
}

void __69__CRDefaultCaptureSessionManager__refocusOnPoint_focusMode_exposure___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "deviceInput");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v4 = objc_msgSend(v3, "lockForConfiguration:", &v6);
  v5 = v6;

  if (v4)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "isFocusPointOfInterestSupported")
      && objc_msgSend(*(id *)(a1 + 40), "isFocusModeSupported:", *(_QWORD *)(a1 + 48)))
    {
      objc_msgSend(*(id *)(a1 + 40), "setFocusPointOfInterest:", *(double *)(a1 + 56), *(double *)(a1 + 64));
      objc_msgSend(*(id *)(a1 + 40), "setFocusMode:", *(_QWORD *)(a1 + 48));
    }
    if (*(_BYTE *)(a1 + 72)
      && objc_msgSend(*(id *)(a1 + 40), "isExposurePointOfInterestSupported")
      && objc_msgSend(*(id *)(a1 + 40), "isExposureModeSupported:", objc_msgSend(*(id *)(a1 + 32), "exposureMode")))
    {
      objc_msgSend(*(id *)(a1 + 40), "setExposurePointOfInterest:", *(double *)(a1 + 56), *(double *)(a1 + 64));
      objc_msgSend(*(id *)(a1 + 40), "setExposureMode:", objc_msgSend(*(id *)(a1 + 32), "exposureMode"));
    }
    objc_msgSend(*(id *)(a1 + 40), "unlockForConfiguration");
  }
  else
  {
    NSLog(CFSTR("Failed to lock configuration for focus with error %@"), v5);
  }

}

- (void)refocusOnPoint:(CGPoint)a3
{
  -[CRDefaultCaptureSessionManager refocusOnPoint:exposure:](self, "refocusOnPoint:exposure:", 1, a3.x, a3.y);
}

- (void)refocusOnPoint:(CGPoint)a3 exposure:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  char v23;
  _QWORD block[5];

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[CRDefaultCaptureSessionManager deviceInput](self, "deviceInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isFocusPointOfInterestSupported");

  if (v10)
  {
    -[CRDefaultCaptureSessionManager avfPreviewLayer](self, "avfPreviewLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "captureDevicePointOfInterestForPoint:", x, y);
    v13 = v12;
    v15 = v14;

    -[CRDefaultCaptureSessionManager deviceInput](self, "deviceInput");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "device");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "focusPointOfInterest");
    *(float *)&v18 = (v19 - v15) * (v19 - v15) + (v18 - v13) * (v18 - v13);
    v20 = sqrtf(*(float *)&v18);

    if (v20 <= 0.05)
    {
      -[CRDefaultCaptureSessionManager deviceInput](self, "deviceInput");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "device");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isAdjustingFocus");

      if ((v23 & 1) == 0)
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __58__CRDefaultCaptureSessionManager_refocusOnPoint_exposure___block_invoke;
        block[3] = &unk_24C58B188;
        block[4] = self;
        dispatch_async(MEMORY[0x24BDAC9B8], block);
      }
    }
    else
    {
      -[CRDefaultCaptureSessionManager _refocusOnPoint:focusMode:exposure:](self, "_refocusOnPoint:focusMode:exposure:", -[CRDefaultCaptureSessionManager focusMode](self, "focusMode"), v4, v13, v15);
    }
  }
}

void __58__CRDefaultCaptureSessionManager_refocusOnPoint_exposure___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "deviceInput");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v4 = objc_msgSend(v3, "lockForConfiguration:", &v13);
  v5 = v13;

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "deviceInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isFocusModeSupported:", 1);

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "deviceInput");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "device");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFocusMode:", 1);

    }
    objc_msgSend(*(id *)(a1 + 32), "deviceInput");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "unlockForConfiguration");

  }
}

- (void)resetFocus
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  -[CRDefaultCaptureSessionManager deviceInput](self, "deviceInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFocusPointOfInterestSupported");

  if (v5)
  {
    -[CRDefaultCaptureSessionManager deviceInput](self, "deviceInput");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "focusPointOfInterest");
    if (v7 == 0.5)
    {

    }
    else
    {
      -[CRDefaultCaptureSessionManager deviceInput](self, "deviceInput");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "device");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "focusPointOfInterest");
      v11 = v10;

      if (v11 != 0.5)
        -[CRDefaultCaptureSessionManager _refocusOnPoint:focusMode:exposure:](self, "_refocusOnPoint:focusMode:exposure:", -[CRDefaultCaptureSessionManager focusMode](self, "focusMode"), 1, 0.5, 0.5);
    }
  }
}

- (void)setPreviewOrientation:(int64_t)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  switch(a3)
  {
    case 1:
      -[CRDefaultCaptureSessionManager avfPreviewLayer](self, "avfPreviewLayer");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "connection");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = 1;
      goto LABEL_6;
    case 2:
      -[CRDefaultCaptureSessionManager avfPreviewLayer](self, "avfPreviewLayer");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "connection");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = 2;
      goto LABEL_6;
    case 3:
      -[CRDefaultCaptureSessionManager avfPreviewLayer](self, "avfPreviewLayer");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "connection");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = 3;
      goto LABEL_6;
    case 4:
      -[CRDefaultCaptureSessionManager avfPreviewLayer](self, "avfPreviewLayer");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "connection");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = 4;
LABEL_6:
      objc_msgSend(v3, "setVideoOrientation:", v5);

      break;
    default:
      return;
  }
}

- (BOOL)isAdjustingFocus
{
  void *v2;
  void *v3;
  char v4;

  -[CRDefaultCaptureSessionManager deviceInput](self, "deviceInput");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAdjustingFocus");

  return v4;
}

- (CGPoint)convertCameraPoint:(CGPoint)a3 fromLayer:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[CRDefaultCaptureSessionManager avfPreviewLayer](self, "avfPreviewLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:fromLayer:", v7, x, y);
  v10 = v9;
  v12 = v11;

  -[CRDefaultCaptureSessionManager avfPreviewLayer](self, "avfPreviewLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "captureDevicePointOfInterestForPoint:", v10, v12);
  v15 = v14;
  v17 = v16;

  -[CRDefaultCaptureSessionManager cameraResolution](self, "cameraResolution");
  v19 = v15 * v18;
  -[CRDefaultCaptureSessionManager cameraResolution](self, "cameraResolution");
  v21 = v17 * v20;
  v22 = v19;
  result.y = v21;
  result.x = v22;
  return result;
}

- (CGPoint)convertCameraPoint:(CGPoint)a3 toLayer:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[CRDefaultCaptureSessionManager convertCameraPoint:toLayer:flipped:](self, "convertCameraPoint:toLayer:flipped:", a4, 0, a3.x, a3.y);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)convertCameraPoint:(CGPoint)a3 toLayer:(id)a4 flipped:(BOOL)a5
{
  _BOOL4 v5;
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGPoint result;

  v5 = a5;
  y = a3.y;
  x = a3.x;
  v9 = a4;
  if (v5)
  {
    -[CRDefaultCaptureSessionManager cameraResolution](self, "cameraResolution");
    y = v10 - y;
  }
  -[CRDefaultCaptureSessionManager cameraResolution](self, "cameraResolution");
  v12 = x / v11;
  -[CRDefaultCaptureSessionManager cameraResolution](self, "cameraResolution");
  v14 = y / v13;
  -[CRDefaultCaptureSessionManager avfPreviewLayer](self, "avfPreviewLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pointForCaptureDevicePointOfInterest:", v12, v14);
  v17 = v16;
  v19 = v18;

  -[CRDefaultCaptureSessionManager avfPreviewLayer](self, "avfPreviewLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "convertPoint:toLayer:", v9, v17, v19);
  v22 = v21;
  v24 = v23;

  v25 = v22;
  v26 = v24;
  result.y = v26;
  result.x = v25;
  return result;
}

- (CGPoint)convertCameraPointOCR:(CGPoint)a3 toLayer:(id)a4 flipped:(BOOL)a5
{
  double x;
  double y;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;

  x = a3.x;
  if (a5)
    y = 1.0 - a3.y;
  else
    y = a3.y;
  v8 = a4;
  -[CRDefaultCaptureSessionManager avfPreviewLayer](self, "avfPreviewLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pointForCaptureDevicePointOfInterest:", x, y);
  v11 = v10;
  v13 = v12;

  -[CRDefaultCaptureSessionManager avfPreviewLayer](self, "avfPreviewLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "convertPoint:toLayer:", v8, v11, v13);
  v16 = v15;
  v18 = v17;

  v19 = v16;
  v20 = v18;
  result.y = v20;
  result.x = v19;
  return result;
}

- (CGRect)convertCameraRect:(CGRect)a3 fromLayer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect v35;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[CRDefaultCaptureSessionManager avfPreviewLayer](self, "avfPreviewLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertRect:fromLayer:", v9, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v35.origin.x = v12;
  v35.origin.y = v14;
  v35.size.width = v16;
  v35.size.height = v18;
  if (!CGRectIsEmpty(v35))
  {
    -[CRDefaultCaptureSessionManager avfPreviewLayer](self, "avfPreviewLayer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "metadataOutputRectOfInterestForRect:", v12, v14, v16, v18);
    v12 = v20;
    v14 = v21;
    v16 = v22;
    v18 = v23;

  }
  -[CRDefaultCaptureSessionManager cameraResolution](self, "cameraResolution");
  v25 = v12 * v24;
  -[CRDefaultCaptureSessionManager cameraResolution](self, "cameraResolution");
  v27 = v14 * v26;
  -[CRDefaultCaptureSessionManager cameraResolution](self, "cameraResolution");
  v29 = v16 * v28;
  -[CRDefaultCaptureSessionManager cameraResolution](self, "cameraResolution");
  v31 = v18 * v30;
  v32 = v25;
  v33 = v27;
  v34 = v29;
  result.size.height = v31;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (void)setupHighISO:(id)a3
{
  id v4;
  uint64_t v5;
  const __CFAllocator *v6;
  const CFArrayCallBacks *v7;
  CFArrayRef v8;
  CFArrayRef v9;
  const __CFDictionary *v10;
  $BE317D33594506163345F0F928572BFD *v11;
  double *p_var2;
  const __CFNumber *Value;
  const __CFNumber *v14;
  CFTypeID v15;
  const __CFNumber *v16;
  const __CFNumber *v17;
  CFTypeID v18;
  const __CFArray *v19;
  const __CFArray *v20;
  CFTypeID v21;
  const __CFArray *v22;
  const __CFArray *v23;
  CFTypeID v24;
  CFIndex Count;
  CFIndex v26;
  double *v27;
  const void *ValueAtIndex;
  CFTypeID v29;
  CFIndex v30;
  int v31;
  const void *v32;
  CFTypeID v33;
  const __CFNumber *v34;
  CFTypeID v35;
  double v36;
  double v37;
  double v38;
  int v39;
  double v40;
  double v41;
  int v42;
  int v43;
  double v44;
  double v45;
  int v46;
  int v47;
  double *v48;
  double *v49;
  uint64_t i;
  double v51;
  double v52;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v53;
  uint64_t v54;
  uint64_t v55;
  double *v56;
  int v57;
  int v58;
  double v59;
  double v60;
  int v61;
  char *v62;
  $BE317D33594506163345F0F928572BFD *v63;
  const __CFArray *v64;
  uint64_t v65;
  double *v66;
  const __CFArray *theArray;
  uint64_t v68;
  CMTime v69;
  CMTime v70;
  double v71;
  double v72;
  double valuePtr;
  void *v74[2];
  void *keys[2];
  void *v76[2];
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  void *values[2];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "maxISO");
  -[CRDefaultCaptureSessionManager setMaxISO:](self, "setMaxISO:");
  objc_msgSend(v4, "minISO");
  -[CRDefaultCaptureSessionManager setMinISO:](self, "setMinISO:");
  CMTimeMakeWithSeconds(&v70, 0.00207900208, 1000000000);
  v69 = v70;
  -[CRDefaultCaptureSessionManager setHighISOThresholdDuration:](self, "setHighISOThresholdDuration:", &v69);
  v5 = 0;
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  *(_OWORD *)values = 0u;
  v79 = 0u;
  v80 = 0u;
  v78 = 0u;
  *(_OWORD *)v76 = 0u;
  v77 = 0u;
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  do
  {
    values[v5] = CFNumberCreate(v6, kCFNumberDoubleType, (char *)&gDefaultExposureTable + v5 * 8);
    v76[v5] = CFNumberCreate(v6, kCFNumberDoubleType, (char *)&gDefaultExposureTable + v5 * 8 + 80);
    ++v5;
  }
  while (v5 != 10);
  v7 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
  v8 = CFArrayCreate(v6, (const void **)values, 10, MEMORY[0x24BDBD690]);
  v9 = CFArrayCreate(v6, (const void **)v76, 10, v7);
  *(_OWORD *)keys = xmmword_24C58B1A8;
  v74[0] = v8;
  v74[1] = v9;
  v10 = CFDictionaryCreate(v6, (const void **)keys, (const void **)v74, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (-[CRDefaultCaptureSessionManager exposure_table](self, "exposure_table"))
  {
    free(*(void **)-[CRDefaultCaptureSessionManager exposure_table](self, "exposure_table"));
    free(-[CRDefaultCaptureSessionManager exposure_table](self, "exposure_table"));
    -[CRDefaultCaptureSessionManager setExposure_table:](self, "setExposure_table:", 0);
  }
  -[CRDefaultCaptureSessionManager setExposure_table:](self, "setExposure_table:", malloc_type_malloc(0x20uLL, 0x1020040A02120EAuLL));
  v11 = -[CRDefaultCaptureSessionManager exposure_table](self, "exposure_table");
  *(_OWORD *)&v11->var2 = xmmword_20CDD37F0;
  p_var2 = &v11->var2;
  Value = (const __CFNumber *)CFDictionaryGetValue(v10, CFSTR("ExposureDelta"));
  if (Value)
  {
    v14 = Value;
    v15 = CFGetTypeID(Value);
    if (v15 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v14, kCFNumberDoubleType, p_var2);
      if (*p_var2 > 1.0)
        *p_var2 = 1.0 / *p_var2;
    }
  }
  v16 = (const __CFNumber *)CFDictionaryGetValue(v10, CFSTR("StabilityZone"));
  if (v16)
  {
    v17 = v16;
    v18 = CFGetTypeID(v16);
    if (v18 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v17, kCFNumberDoubleType, &v11->var3);
      if (v11->var3 > 1.0)
        v11->var3 = 1.0 / v11->var3;
    }
  }
  v19 = (const __CFArray *)CFDictionaryGetValue(v10, CFSTR("IntegrationTime"));
  if (v19 && (v20 = v19, v21 = CFGetTypeID(v19), v21 == CFArrayGetTypeID()))
  {
    v22 = (const __CFArray *)CFDictionaryGetValue(v10, CFSTR("MaxGain"));
    if (v22 && (v23 = v22, v24 = CFGetTypeID(v22), v24 == CFArrayGetTypeID()))
    {
      Count = CFArrayGetCount(v20);
      v26 = CFArrayGetCount(v23);
      if (Count == v26)
      {
        theArray = v23;
        v68 = Count;
        v65 = 2 * Count;
        v27 = (double *)malloc_type_calloc(0x18uLL, 2 * Count, 0x8166AE99uLL);
        ValueAtIndex = CFArrayGetValueAtIndex(v20, 0);
        v29 = CFGetTypeID(ValueAtIndex);
        if (v29 == CFNumberGetTypeID())
        {
          valuePtr = 0.0;
          CFNumberGetValue((CFNumberRef)ValueAtIndex, kCFNumberDoubleType, &valuePtr);
          if (valuePtr > 1.0)
            valuePtr = 1.0 / valuePtr;
          v66 = v27;
          v63 = v11;
          v64 = v8;
          if (v68 < 1)
          {
            v46 = -1;
LABEL_52:
            v51 = *p_var2;
            v27 = v66;
            v52 = v66[1];
            v53 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(24 * SLODWORD(v66[3 * v65 - 3]) + 24, 0x1000040D315E998uLL);
            v54 = 0;
            LODWORD(v55) = 0;
            do
            {
              v56 = &v66[3 * v54];
              v57 = *((_DWORD *)v56 + 6);
              if ((int)v55 < v57)
              {
                v58 = *((_DWORD *)v56 + 1);
                v59 = v56[1];
                v55 = (int)v55;
                do
                {
                  v60 = 1.0;
                  if (v55 >= 1)
                  {
                    v61 = v55;
                    do
                    {
                      v60 = (v51 + 1.0) * v60;
                      --v61;
                    }
                    while (v61);
                  }
                  v62 = (char *)v53 + 24 * v55;
                  *(_DWORD *)v62 = v55;
                  *((_DWORD *)v62 + 1) = v58;
                  *((double *)v62 + 1) = v59;
                  *((double *)v62 + 2) = v52 / v59 * v60;
                  ++v55;
                }
                while (v55 != v57);
              }
              ++v54;
              LODWORD(v55) = v57;
            }
            while (v54 != v65 - 1);
            v63->var0 = v53;
            v63->var1 = v46;
            v8 = v64;
          }
          else
          {
            v30 = 0;
            v31 = 0;
            while (1)
            {
              v71 = 0.0;
              v72 = 0.0;
              v32 = CFArrayGetValueAtIndex(v20, v30);
              v33 = CFGetTypeID(v32);
              if (v33 != CFNumberGetTypeID())
              {
                v8 = v64;
                NSLog(CFSTR("ExposureTable: IntegrationTime: Wrong number specified at the index %d."), v30);
                goto LABEL_63;
              }
              v34 = (const __CFNumber *)CFArrayGetValueAtIndex(theArray, v30);
              v35 = CFGetTypeID(v32);
              if (v35 != CFNumberGetTypeID())
                break;
              CFNumberGetValue((CFNumberRef)v32, kCFNumberDoubleType, &v72);
              CFNumberGetValue(v34, kCFNumberDoubleType, &v71);
              v36 = v72;
              v37 = 1.0;
              if (v72 > 1.0)
                v36 = 1.0 / v72;
              v38 = *p_var2 + 1.0;
              if (v31 >= 1)
              {
                v39 = v31;
                do
                {
                  v37 = v38 * v37;
                  --v39;
                }
                while (v39);
              }
              v40 = v71;
              v41 = valuePtr / v36 * v37;
              if (v31 <= 4095)
                v42 = 4095;
              else
                v42 = v31;
              v43 = v31;
              do
              {
                if (v43 == v42)
                {
                  v46 = -1;
                  goto LABEL_42;
                }
                v44 = v41;
                v45 = 1.0;
                v46 = v43;
                if ((v43 & 0x80000000) == 0)
                {
                  v47 = -1;
                  do
                  {
                    v45 = v38 * v45;
                    ++v47;
                  }
                  while (v46 != v47);
                }
                v43 = v46 + 1;
                v41 = valuePtr / v36 * v45;
              }
              while (v41 < v71);
              if (v71 - v44 >= v41 - v71)
                ++v46;
LABEL_42:
              v48 = &v66[6 * v30];
              *(_DWORD *)v48 = v31;
              *((_DWORD *)v48 + 1) = 0;
              v48[1] = v36;
              v48[2] = v40;
              v49 = &v66[3 * ((2 * v30) | 1)];
              *(_DWORD *)v49 = v46;
              *((_DWORD *)v49 + 1) = 0;
              v49[1] = v36;
              v49[2] = v40;
              v31 = v46 + 1;
              if (++v30 == v68)
                goto LABEL_52;
            }
            v8 = v64;
            NSLog(CFSTR("ExposureTable: MaxGain: Wrong number specified at the index %d."), v30);
LABEL_63:
            v27 = v66;
          }
        }
        else
        {
          NSLog(CFSTR("ExposureTable: IntegrationTime: Wrong number specified at the index %d."), 0);
        }
        if (v27)
          free(v27);
      }
      else
      {
        NSLog(CFSTR("ExposureTable: The array 'IntegrationTime' and 'MaxGain' must have the same number of items (%d != %d)."), Count, v26);
      }
    }
    else
    {
      NSLog(CFSTR("ExposureTable: No array 'MaxGain' defined."));
    }
  }
  else
  {
    NSLog(CFSTR("ExposureTable: No array 'IntegrationTime' defined."));
  }
  CFRelease(v10);
  CFRelease(v8);
  CFRelease(v9);
  for (i = 0; i != 10; ++i)
  {
    CFRelease(values[i]);
    CFRelease(v76[i]);
  }

}

- (void)highISOAdjustExposure
{
  void *v3;
  void *v4;
  float v5;
  float v6;
  double Seconds;
  float v8;
  float v9;
  float v10;
  float v11;
  double v12;
  double v13;
  double v14;
  float v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  int v20;
  uint64_t v21;
  Float64 v22;
  double v23;
  id v24;
  float v25;
  double v26;
  float v27;
  double v28;
  float v29;
  float v30;
  float v31;
  float v32;
  int v33;
  _QWORD v34[5];
  id v35;
  id v36;
  CMTime time2;
  CMTime time;
  CMTime v39;
  CMTime v40;

  memset(&v40, 0, sizeof(v40));
  -[CRDefaultCaptureSessionManager deviceInput](self, "deviceInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "ISO");
  v6 = v5;
  memset(&v39, 0, sizeof(v39));
  if (v4)
    objc_msgSend(v4, "exposureDuration");
  time = v39;
  Seconds = CMTimeGetSeconds(&time);
  objc_msgSend(v4, "exposureTargetOffset");
  v9 = v8;
  objc_msgSend(v4, "lensAperture");
  v11 = v10;
  if (-[CRDefaultCaptureSessionManager exposureAdjustmentInProgress](self, "exposureAdjustmentInProgress"))
  {
    -[CRDefaultCaptureSessionManager setExposureAdjustmentInProgressTimeoutCount:](self, "setExposureAdjustmentInProgressTimeoutCount:", -[CRDefaultCaptureSessionManager exposureAdjustmentInProgressTimeoutCount](self, "exposureAdjustmentInProgressTimeoutCount")- 1);
    if (!-[CRDefaultCaptureSessionManager exposureAdjustmentInProgressTimeoutCount](self, "exposureAdjustmentInProgressTimeoutCount"))-[CRDefaultCaptureSessionManager setExposureAdjustmentInProgress:](self, "setExposureAdjustmentInProgress:", 0);
  }
  if (-[CRDefaultCaptureSessionManager exposureAdjustmentInProgress](self, "exposureAdjustmentInProgress"))
    goto LABEL_15;
  -[CRDefaultCaptureSessionManager highISOThresholdDuration](self, "highISOThresholdDuration");
  time = v39;
  if (CMTimeCompare(&time, &time2) < 0)
  {
    if (-[CRDefaultCaptureSessionManager runningManualExposure](self, "runningManualExposure"))
    {
      v36 = 0;
      objc_msgSend(v4, "lockForConfiguration:", &v36);
      v24 = v36;
      objc_msgSend(v4, "setExposureMode:", 2);
      -[CRDefaultCaptureSessionManager setRunningManualExposure:](self, "setRunningManualExposure:", 0);
LABEL_24:
      objc_msgSend(v4, "unlockForConfiguration");
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  v12 = v11 * v11;
  v13 = log2(v12 / ((double)(int)v6 / 100.0 * Seconds));
  v14 = v13 + v9;
  if (vabdd_f64(v13, v14) <= (double)-[CRDefaultCaptureSessionManager exposure_table](self, "exposure_table")[24])
  {
LABEL_15:
    v24 = 0;
    goto LABEL_16;
  }
  -[CRDefaultCaptureSessionManager minISO](self, "minISO");
  v16 = v15;
  v17 = *(_QWORD *)-[CRDefaultCaptureSessionManager exposure_table](self, "exposure_table");
  v18 = v17 + 24 * (int)-[CRDefaultCaptureSessionManager exposure_table](self, "exposure_table")[8];
  v19 = log2(v12 / (*(double *)(v17 + 8) * ((double)(int)(*(double *)(v17 + 16) * v16) / 100.0)));
  v20 = (int)((double)*(int *)v17
            + (v14 - v19)
            * ((double)(*(_DWORD *)(v18 - 24) - *(_DWORD *)v17)
             / (log2(v12 / (*(double *)(v18 - 16) * ((double)(int)(*(double *)(v18 - 8) * v16) / 100.0))) - v19))
            + 0.5);
  if (v20 < 0)
  {
    -[CRDefaultCaptureSessionManager minISO](self, "minISO");
    v26 = v12 / (exp2(v14) * (v25 / 100.0));
    v23 = 1.0;
    v22 = 0.00001;
    if (v26 >= 0.00001)
      v22 = v26;
  }
  else
  {
    if ((_DWORD)-[CRDefaultCaptureSessionManager exposure_table](self, "exposure_table")[8] <= v20)
      v20 = (_DWORD)-[CRDefaultCaptureSessionManager exposure_table](self, "exposure_table")[8] - 1;
    v21 = *(_QWORD *)-[CRDefaultCaptureSessionManager exposure_table](self, "exposure_table") + 24 * v20;
    v22 = *(double *)(v21 + 8);
    v23 = *(double *)(v21 + 16);
  }
  CMTimeMakeWithSeconds(&v40, v22, 1000000000);
  -[CRDefaultCaptureSessionManager maxISO](self, "maxISO");
  v28 = v27;
  -[CRDefaultCaptureSessionManager minISO](self, "minISO");
  if (v23 * v29 <= v28)
  {
    -[CRDefaultCaptureSessionManager minISO](self, "minISO");
    v31 = v23 * v32;
  }
  else
  {
    -[CRDefaultCaptureSessionManager maxISO](self, "maxISO");
    v31 = v30;
  }
  v35 = 0;
  v33 = objc_msgSend(v4, "lockForConfiguration:", &v35);
  v24 = v35;
  if (v33)
  {
    -[CRDefaultCaptureSessionManager setExposureAdjustmentInProgressTimeoutCount:](self, "setExposureAdjustmentInProgressTimeoutCount:", 10);
    -[CRDefaultCaptureSessionManager setExposureAdjustmentInProgress:](self, "setExposureAdjustmentInProgress:", 1);
    -[CRDefaultCaptureSessionManager setRunningManualExposure:](self, "setRunningManualExposure:", 1);
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __55__CRDefaultCaptureSessionManager_highISOAdjustExposure__block_invoke;
    v34[3] = &unk_24C58B1C0;
    v34[4] = self;
    time = v40;
    objc_msgSend(v4, "setExposureModeCustomWithDuration:ISO:completionHandler:", &time, v34, COERCE_DOUBLE(__PAIR64__(HIDWORD(v40.value), LODWORD(v31))));
    goto LABEL_24;
  }
LABEL_16:

}

uint64_t __55__CRDefaultCaptureSessionManager_highISOAdjustExposure__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setExposureAdjustmentInProgress:", 0);
}

- (BOOL)isFocusPointOfInterestSupported
{
  void *v2;
  void *v3;
  char v4;

  -[CRDefaultCaptureSessionManager deviceInput](self, "deviceInput");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFocusPointOfInterestSupported");

  return v4;
}

- (CGPoint)focusPointOfInterest
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[CRDefaultCaptureSessionManager deviceInput](self, "deviceInput");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusPointOfInterest");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (BOOL)isPreviewVideoMirrored
{
  void *v2;
  void *v3;
  char v4;

  -[CRDefaultCaptureSessionManager avfPreviewLayer](self, "avfPreviewLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isVideoMirrored");

  return v4;
}

- (CGRect)previewVisibleRect
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[CRDefaultCaptureSessionManager avfPreviewLayer](self, "avfPreviewLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRDefaultCaptureSessionManager previewLayer](self, "previewLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "metadataOutputRectOfInterestForRect:");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)cameraSessionWasInterrupted:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB1B68]);

  if (v4)
  {
    objc_msgSend(v9, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", *MEMORY[0x24BDB1AE8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    if ((unint64_t)(v7 - 1) > 3)
      v8 = CFSTR("CoreRecogntion: Unable to display camera view due to connection inturrupted notification %@");
    else
      v8 = off_24C58B1E0[v7 - 1];
    NSLog(&v8->isa, v9);
  }

}

- (int64_t)cameraPosition
{
  return self->_cameraPosition;
}

- (void)setCameraPosition:(int64_t)a3
{
  self->_cameraPosition = a3;
}

- (NSString)cameraMode
{
  return self->_cameraMode;
}

- (void)setCameraMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)whiteBalanceMode
{
  return self->_whiteBalanceMode;
}

- (void)setWhiteBalanceMode:(int64_t)a3
{
  self->_whiteBalanceMode = a3;
}

- (int64_t)focusMode
{
  return self->_focusMode;
}

- (void)setFocusMode:(int64_t)a3
{
  self->_focusMode = a3;
}

- (int64_t)exposureMode
{
  return self->_exposureMode;
}

- (void)setExposureMode:(int64_t)a3
{
  self->_exposureMode = a3;
}

- (int64_t)torchMode
{
  return self->_torchMode;
}

- (void)setTorchMode:(int64_t)a3
{
  self->_torchMode = a3;
}

- (AVCaptureVideoDataOutputSampleBufferDelegate)captureSessionDelegate
{
  return (AVCaptureVideoDataOutputSampleBufferDelegate *)objc_loadWeakRetained((id *)&self->_captureSessionDelegate);
}

- (void)setCaptureSessionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_captureSessionDelegate, a3);
}

- (AVCaptureMetadataOutputObjectsDelegate)captureSessionMetadataDelegate
{
  return (AVCaptureMetadataOutputObjectsDelegate *)objc_loadWeakRetained((id *)&self->_captureSessionMetadataDelegate);
}

- (void)setCaptureSessionMetadataDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_captureSessionMetadataDelegate, a3);
}

- (NSString)currentDeviceID
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCurrentDeviceID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BOOL)enableMetadataOutput
{
  return self->_enableMetadataOutput;
}

- (void)setEnableMetadataOutput:(BOOL)a3
{
  self->_enableMetadataOutput = a3;
}

- (int64_t)targetFocusDistance
{
  return self->_targetFocusDistance;
}

- (void)setTargetFocusDistance:(int64_t)a3
{
  self->_targetFocusDistance = a3;
}

- (CGSize)cameraResolution
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_cameraResolution, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setCameraResolution:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_cameraResolution, &v3, 16, 1, 0);
}

- (AVCaptureSession)captureSession
{
  return self->_captureSession;
}

- (void)setCaptureSession:(id)a3
{
  objc_storeStrong((id *)&self->_captureSession, a3);
}

- (AVCaptureVideoPreviewLayer)avfPreviewLayer
{
  return self->_avfPreviewLayer;
}

- (void)setAvfPreviewLayer:(id)a3
{
  objc_storeStrong((id *)&self->_avfPreviewLayer, a3);
}

- (AVCaptureDeviceInput)deviceInput
{
  return self->_deviceInput;
}

- (void)setDeviceInput:(id)a3
{
  objc_storeStrong((id *)&self->_deviceInput, a3);
}

- (AVCaptureVideoDataOutput)captureVideoDataOutput
{
  return self->_captureVideoDataOutput;
}

- (void)setCaptureVideoDataOutput:(id)a3
{
  objc_storeStrong((id *)&self->_captureVideoDataOutput, a3);
}

- (id)inputPortFormatObserver
{
  return objc_getProperty(self, a2, 136, 1);
}

- (void)setInputPortFormatObserver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (AVCaptureInputPort)inputPortFormatSender
{
  return (AVCaptureInputPort *)objc_loadWeakRetained((id *)&self->_inputPortFormatSender);
}

- (void)setInputPortFormatSender:(id)a3
{
  objc_storeWeak((id *)&self->_inputPortFormatSender, a3);
}

- (float)maxISO
{
  return self->_maxISO;
}

- (void)setMaxISO:(float)a3
{
  self->_maxISO = a3;
}

- (float)minISO
{
  return self->_minISO;
}

- (void)setMinISO:(float)a3
{
  self->_minISO = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)highISOThresholdDuration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_highISOThresholdDuration, 24, 1, 0);
  return result;
}

- (void)setHighISOThresholdDuration:(id *)a3
{
  objc_copyStruct(&self->_highISOThresholdDuration, a3, 24, 1, 0);
}

- (BOOL)exposureAdjustmentInProgress
{
  return self->_exposureAdjustmentInProgress;
}

- (void)setExposureAdjustmentInProgress:(BOOL)a3
{
  self->_exposureAdjustmentInProgress = a3;
}

- (int)exposureAdjustmentInProgressTimeoutCount
{
  return self->_exposureAdjustmentInProgressTimeoutCount;
}

- (void)setExposureAdjustmentInProgressTimeoutCount:(int)a3
{
  self->_exposureAdjustmentInProgressTimeoutCount = a3;
}

- (BOOL)runningManualExposure
{
  return self->_runningManualExposure;
}

- (void)setRunningManualExposure:(BOOL)a3
{
  self->_runningManualExposure = a3;
}

- ($BE317D33594506163345F0F928572BFD)exposure_table
{
  return self->_exposure_table;
}

- (void)setExposure_table:(id *)a3
{
  self->_exposure_table = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_inputPortFormatSender);
  objc_storeStrong(&self->_inputPortFormatObserver, 0);
  objc_storeStrong((id *)&self->_captureVideoDataOutput, 0);
  objc_storeStrong((id *)&self->_deviceInput, 0);
  objc_storeStrong((id *)&self->_avfPreviewLayer, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
  objc_storeStrong((id *)&self->_currentDeviceID, 0);
  objc_destroyWeak((id *)&self->_captureSessionMetadataDelegate);
  objc_destroyWeak((id *)&self->_captureSessionDelegate);
  objc_storeStrong((id *)&self->_cameraMode, 0);
}

@end
