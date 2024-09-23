@implementation CBQRCodeScanner

- (CBQRCodeScanner)initWithScanCompletion:(id)a3
{
  id v4;
  CBQRCodeScanner *v5;
  id v6;
  id scanCompletion;
  uint64_t v8;
  AVCaptureSession *captureSession;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CBQRCodeScanner;
  v5 = -[CBQRCodeScanner init](&v11, "init");
  if (v5)
  {
    v6 = objc_retainBlock(v4);
    scanCompletion = v5->_scanCompletion;
    v5->_scanCompletion = v6;

    v5->_scanCompleted = 0;
    v8 = objc_claimAutoreleasedReturnValue(-[CBQRCodeScanner setupQRCodeScanner](v5, "setupQRCodeScanner"));
    captureSession = v5->_captureSession;
    v5->_captureSession = (AVCaptureSession *)v8;

    if (!v5->_captureSession)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (id)setupQRCodeScanner
{
  id v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  int v21;
  id v22;
  AVCaptureDeviceType v23;

  v2 = objc_alloc_init((Class)AVCaptureSession);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVCaptureDevice defaultDeviceWithDeviceType:mediaType:position:](AVCaptureDevice, "defaultDeviceWithDeviceType:mediaType:position:", AVCaptureDeviceTypeBuiltInWideAngleCamera, AVMediaTypeVideo, 1));
  if (!v3)
  {
    v8 = CheckerBoardLogHandleForCategory(4);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to get default rear camera. Performing discovery of cameras", (uint8_t *)&v21, 2u);
    }

    v23 = AVCaptureDeviceTypeBuiltInWideAngleCamera;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:mediaType:position:](AVCaptureDeviceDiscoverySession, "discoverySessionWithDeviceTypes:mediaType:position:", v10, AVMediaTypeVideo, 1));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "devices"));
    v12 = objc_msgSend(v11, "count");

    v13 = CheckerBoardLogHandleForCategory(4);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v4 = v14;
    if (!v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_100045814();
      goto LABEL_18;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "devices"));
      v16 = objc_msgSend(v15, "count");
      v21 = 134217984;
      v22 = v16;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Found %lu devices. Using first one", (uint8_t *)&v21, 0xCu);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "devices"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));

    if (!v18)
    {
      v19 = CheckerBoardLogHandleForCategory(4);
      v4 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        sub_100045840();
      goto LABEL_18;
    }

    v3 = (void *)v18;
  }
  objc_msgSend(v2, "setSessionPreset:", AVCaptureSessionPresetPhoto);
  v4 = objc_msgSend(objc_alloc((Class)AVCaptureDeviceInput), "initWithDevice:error:", v3, 0);
  if (!objc_msgSend(v2, "canAddInput:", v4))
  {
    v6 = CheckerBoardLogHandleForCategory(4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10004586C();

LABEL_18:
    v5 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v2, "addInput:", v4);
  v5 = v2;
LABEL_19:

  return v5;
}

- (BOOL)startScan
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  AVMetadataObjectType v16;
  uint8_t buf[4];
  void *v18;

  -[CBQRCodeScanner setScanCompleted:](self, "setScanCompleted:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBQRCodeScanner captureSession](self, "captureSession"));

  if (!v3)
    return 0;
  v4 = objc_alloc_init((Class)AVCaptureMetadataOutput);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBQRCodeScanner captureSession](self, "captureSession"));
  objc_msgSend(v5, "addOutput:", v4);

  objc_msgSend(v4, "setMetadataObjectsDelegate:queue:", self, &_dispatch_main_q);
  v6 = CheckerBoardLogHandleForCategory(4);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "availableMetadataObjectTypes"));
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Available metadata object types: %@", buf, 0xCu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "availableMetadataObjectTypes"));
  v10 = objc_msgSend(v9, "containsObject:", AVMetadataObjectTypeQRCode);

  if ((v10 & 1) != 0)
  {
    v16 = AVMetadataObjectTypeQRCode;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
    objc_msgSend(v4, "setMetadataObjectTypes:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBQRCodeScanner captureSession](self, "captureSession"));
    objc_msgSend(v12, "commitConfiguration");

    v13 = objc_claimAutoreleasedReturnValue(-[CBQRCodeScanner captureSession](self, "captureSession"));
    -[NSObject startRunning](v13, "startRunning");
  }
  else
  {
    v14 = CheckerBoardLogHandleForCategory(4);
    v13 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100045898();
  }

  return v10;
}

- (void)stopScan
{
  void *v3;
  id v4;

  -[CBQRCodeScanner setScanCompleted:](self, "setScanCompleted:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBQRCodeScanner captureSession](self, "captureSession"));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CBQRCodeScanner captureSession](self, "captureSession"));
    objc_msgSend(v4, "stopRunning");

  }
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD);
  uint64_t v21;
  NSObject *v22;
  id v23;
  void *v24;
  uint8_t buf[12];
  unsigned int v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v6 = a4;
  if (!-[CBQRCodeScanner scanCompleted](self, "scanCompleted"))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v23 = v6;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (!v8)
      goto LABEL_23;
    v10 = v8;
    v11 = *(_QWORD *)v28;
    v24 = (void *)AVMetadataObjectTypeAppClipCode;
    while (1)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v12);
        v14 = objc_opt_class(AVMetadataMachineReadableCodeObject, v9);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
        {
          v15 = v13;
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringValue"));
          if (v16)
          {
            v17 = (void *)v16;
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "type"));

            if (v18 != v24)
            {
              v19 = v17;
              goto LABEL_11;
            }
            v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v17));
            v26 = 0;
            objc_msgSend(v20, "scanHexInt:", &v26);
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%6d"), v26));

            if (objc_msgSend(v19, "length") == (id)6 && objc_msgSend(v19, "intValue"))
            {

              if (!v19)
                goto LABEL_20;
LABEL_11:
              -[CBQRCodeScanner setScanCompleted:](self, "setScanCompleted:", 1);
              v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CBQRCodeScanner scanCompletion](self, "scanCompletion"));
              ((void (**)(_QWORD, void *))v20)[2](v20, v19);
            }
            else
            {
              v21 = CheckerBoardLogHandleForCategory(4);
              v22 = objc_claimAutoreleasedReturnValue(v21);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Found AppClip code is in an invalid format. Skipping", buf, 2u);
              }

            }
          }
LABEL_20:

        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (!v10)
      {
LABEL_23:

        v6 = v23;
        break;
      }
    }
  }

}

- (AVCaptureSession)captureSession
{
  return self->_captureSession;
}

- (void)setCaptureSession:(id)a3
{
  objc_storeStrong((id *)&self->_captureSession, a3);
}

- (id)scanCompletion
{
  return self->_scanCompletion;
}

- (void)setScanCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)scanCompleted
{
  return self->_scanCompleted;
}

- (void)setScanCompleted:(BOOL)a3
{
  self->_scanCompleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_scanCompletion, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
}

@end
