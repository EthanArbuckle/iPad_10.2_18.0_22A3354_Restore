@implementation QRCodeReaderViewController

- (QRCodeReaderViewController)init
{
  QRCodeReaderViewController *v2;
  QRCodeReaderViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QRCodeReaderViewController;
  v2 = -[QRCodeReaderViewController init](&v5, "init");
  v3 = v2;
  if (v2)
    -[QRCodeReaderViewController setShouldShowPressHomeLabel:](v2, "setShouldShowPressHomeLabel:", 0);
  return v3;
}

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  -[QRCodeReaderViewController setInputs:](self, "setInputs:", a3, a4);
}

- (void)start
{
  -[QRCodeReaderViewController setupCamera](self, "setupCamera");
  -[QRCodeReaderViewController setupUI](self, "setupUI");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t v17[16];
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)QRCodeReaderViewController;
  -[QRCodeReaderViewController viewDidAppear:](&v18, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController captureSession](self, "captureSession"));
  v5 = objc_msgSend(v4, "isRunning");

  if ((v5 & 1) == 0)
  {
    v6 = DiagnosticLogHandleForCategory(3);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting up code recognition", v17, 2u);
    }

    -[QRCodeReaderViewController setupCodeRecognition](self, "setupCodeRecognition");
    v8 = DiagnosticLogHandleForCategory(3);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Starting capture session", v17, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController captureSession](self, "captureSession"));
    objc_msgSend(v10, "startRunning");

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController inputs](self, "inputs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "timeout"));
    v13 = (uint64_t)objc_msgSend(v12, "integerValue");

    if (v13 >= 1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController inputs](self, "inputs"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "timeout"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "timeout:", 0, 0, (double)(uint64_t)objc_msgSend(v15, "integerValue")));
      -[QRCodeReaderViewController setTimeoutTimer:](self, "setTimeoutTimer:", v16);

    }
  }
}

- (void)setupCamera
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  NSObject *v27;

  v3 = objc_alloc_init((Class)AVCaptureSession);
  -[QRCodeReaderViewController setCaptureSession:](self, "setCaptureSession:", v3);

  if (-[QRCodeReaderViewController setActiveCamera:](self, "setActiveCamera:", 1))
    goto LABEL_5;
  v4 = DiagnosticLogHandleForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1000085C0();

  if (-[QRCodeReaderViewController setActiveCamera:](self, "setActiveCamera:", 2))
  {
LABEL_5:
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController captureSession](self, "captureSession"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v9 = objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", AVCaptureSessionRuntimeErrorNotification, v7, v8, &stru_10000C348);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController captureSession](self, "captureSession"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v13 = objc_msgSend(v10, "addObserverForName:object:queue:usingBlock:", AVCaptureSessionDidStartRunningNotification, v11, v12, &stru_10000C368);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController captureSession](self, "captureSession"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v17 = objc_msgSend(v14, "addObserverForName:object:queue:usingBlock:", AVCaptureSessionDidStopRunningNotification, v15, v16, &stru_10000C388);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController captureSession](self, "captureSession"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v21 = objc_msgSend(v18, "addObserverForName:object:queue:usingBlock:", AVCaptureSessionWasInterruptedNotification, v19, v20, &stru_10000C3A8);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController captureSession](self, "captureSession"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v25 = objc_msgSend(v22, "addObserverForName:object:queue:usingBlock:", AVCaptureSessionInterruptionEndedNotification, v23, v24, &stru_10000C3C8);

  }
  else
  {
    v26 = DiagnosticLogHandleForCategory(3);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_100008594();

    -[QRCodeReaderViewController finishWithStatusCode:metadata:](self, "finishWithStatusCode:metadata:", &off_10000C558, 0);
  }
}

- (void)setupCodeRecognition
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = objc_alloc_init((Class)AVCaptureMetadataOutput);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController captureSession](self, "captureSession"));
  objc_msgSend(v3, "addOutput:", v6);

  objc_msgSend(v6, "setMetadataObjectsDelegate:queue:", self, &_dispatch_main_q);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController inputs](self, "inputs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "codeTypes"));
  objc_msgSend(v6, "setMetadataObjectTypes:", v5);

}

- (void)setupUI
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  CameraTargetView *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  CameraTargetView *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = objc_alloc((Class)UIView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController view](self, "view"));
  objc_msgSend(v6, "bounds");
  v7 = objc_msgSend(v5, "initWithFrame:");
  -[QRCodeReaderViewController setPreviewView:](self, "setPreviewView:", v7);

  v8 = objc_alloc((Class)AVCaptureVideoPreviewLayer);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController captureSession](self, "captureSession"));
  v10 = objc_msgSend(v8, "initWithSession:", v9);

  if (v10)
  {
    objc_msgSend(v10, "setVideoGravity:", AVLayerVideoGravityResizeAspectFill);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "connection"));
    objc_msgSend(v11, "setVideoRotationAngle:", 90.0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController previewView](self, "previewView"));
    objc_msgSend(v12, "bounds");
    objc_msgSend(v10, "setFrame:");

    v13 = [CameraTargetView alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController previewView](self, "previewView"));
    objc_msgSend(v14, "bounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController inputs](self, "inputs"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "viewfinderInstruction"));
    v25 = -[CameraTargetView initWithFrame:instructionText:presentationOptions:](v13, "initWithFrame:instructionText:presentationOptions:", v24, 12, v16, v18, v20, v22);
    -[QRCodeReaderViewController setOverlayView:](self, "setOverlayView:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController overlayView](self, "overlayView"));
    objc_msgSend(v26, "setDelegate:", self);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController previewView](self, "previewView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "layer"));
    objc_msgSend(v28, "addSublayer:", v10);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController previewView](self, "previewView"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController overlayView](self, "overlayView"));
    objc_msgSend(v29, "addSubview:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController view](self, "view"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController previewView](self, "previewView"));
    objc_msgSend(v31, "addSubview:", v32);

  }
  else
  {
    v33 = DiagnosticLogHandleForCategory(3);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_100008650();

    -[QRCodeReaderViewController finishWithStatusCode:metadata:](self, "finishWithStatusCode:metadata:", &off_10000C570, 0);
  }

}

- (void)cleanup
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController timeoutTimer](self, "timeoutTimer"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController timeoutTimer](self, "timeoutTimer"));
    objc_msgSend(v4, "invalidate");

  }
  v5 = objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController cameraDevice](self, "cameraDevice"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController cameraDevice](self, "cameraDevice"));
    v8 = objc_msgSend(v7, "isTorchActive");

    if (v8)
      -[QRCodeReaderViewController setFlash:](self, "setFlash:", 0);
  }
  v9 = objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController captureSession](self, "captureSession"));
  if (v9)
  {
    v10 = (void *)v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController captureSession](self, "captureSession"));
    v12 = objc_msgSend(v11, "isRunning");

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController captureSession](self, "captureSession"));
      objc_msgSend(v13, "stopRunning");

      -[QRCodeReaderViewController setCaptureSession:](self, "setCaptureSession:", 0);
    }
  }
}

- (void)finishWithStatusCode:(id)a3 metadata:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (a4)
  {
    v6 = a4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController result](self, "result"));
    objc_msgSend(v7, "setData:", v6);

  }
  -[QRCodeReaderViewController cleanup](self, "cleanup");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController result](self, "result"));
  objc_msgSend(v8, "setStatusCode:", v9);

  -[QRCodeReaderViewController setFinished:](self, "setFinished:", 1);
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  int64_t v23;
  const __CFString *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[2];
  _QWORD v32[2];
  uint8_t v33[128];
  uint8_t buf[4];
  id v35;

  v5 = a4;
  v6 = DiagnosticLogHandleForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v35 = objc_msgSend(v5, "count");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "captureOutput called for %ld objects", buf, 0xCu);
  }

  v8 = objc_alloc_init((Class)NSMutableArray);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v16 = objc_opt_class(AVMetadataMachineReadableCodeObject, v11);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
        {
          v17 = v15;
          v18 = DiagnosticLogHandleForCategory(3);
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringValue"));
            *(_DWORD *)buf = 138412290;
            v35 = v20;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Decoded QR Code: %@", buf, 0xCu);

          }
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringValue"));
          objc_msgSend(v8, "addObject:", v21);

        }
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v8, "count")
    && (-[QRCodeReaderViewController isFinished](self, "isFinished") & 1) == 0)
  {
    v22 = objc_alloc_init((Class)NSMutableDictionary);
    v31[0] = CFSTR("camera");
    v23 = -[QRCodeReaderViewController cameraPosition](self, "cameraPosition");
    v24 = CFSTR("back");
    if (v23 == 2)
      v24 = CFSTR("front");
    v31[1] = CFSTR("qrCodes");
    v32[0] = v24;
    v32[1] = v8;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 2));
    objc_msgSend(v22, "addEntriesFromDictionary:", v25);

    -[QRCodeReaderViewController finishWithStatusCode:metadata:](self, "finishWithStatusCode:metadata:", &off_10000C588, v22);
  }

}

- (void)timeout:(id)a3
{
  -[QRCodeReaderViewController finishWithStatusCode:metadata:](self, "finishWithStatusCode:metadata:", &off_10000C5A0, 0);
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (void)cancelTapped
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = DiagnosticLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cancel button tapped.", v5, 2u);
  }

  -[QRCodeReaderViewController finishWithStatusCode:metadata:](self, "finishWithStatusCode:metadata:", &off_10000C5B8, 0);
}

- (void)flashTapped
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = DiagnosticLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Flash button tapped.", v6, 2u);
  }

  -[QRCodeReaderViewController setFlashState:](self, "setFlashState:", -[QRCodeReaderViewController flashState](self, "flashState") ^ 1);
  if (-[QRCodeReaderViewController setFlash:](self, "setFlash:", -[QRCodeReaderViewController flashState](self, "flashState")))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController overlayView](self, "overlayView"));
    objc_msgSend(v5, "setFlashState:", -[QRCodeReaderViewController flashState](self, "flashState"));

  }
}

- (BOOL)setFlash:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  _BOOL4 v22;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController cameraDevice](self, "cameraDevice"));

  if (!v5)
  {
    v16 = DiagnosticLogHandleForCategory(3);
    v9 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No camera device set. Not changing torch state.", buf, 2u);
    }
    goto LABEL_13;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController cameraDevice](self, "cameraDevice"));
  if ((objc_msgSend(v6, "isTorchModeSupported:", 1) & 1) == 0)
  {

    v9 = 0;
    goto LABEL_10;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController cameraDevice](self, "cameraDevice"));
  v20 = 0;
  v8 = objc_msgSend(v7, "lockForConfiguration:", &v20);
  v9 = v20;

  if (!v8)
  {
LABEL_10:
    v17 = DiagnosticLogHandleForCategory(3);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10000867C(v3, (uint64_t)v9, v18);

LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
  v10 = DiagnosticLogHandleForCategory(3);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v22 = v3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting torch state to %d", buf, 8u);
  }

  v12 = -[QRCodeReaderViewController flashState](self, "flashState");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController cameraDevice](self, "cameraDevice"));
  objc_msgSend(v13, "setTorchMode:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController cameraDevice](self, "cameraDevice"));
  objc_msgSend(v14, "unlockForConfiguration");

  v15 = 1;
LABEL_14:

  return v15;
}

- (void)flipTapped
{
  uint64_t v3;
  NSObject *v4;
  int64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;

  v3 = DiagnosticLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Flip button tapped.", (uint8_t *)&v13, 2u);
  }

  v5 = -[QRCodeReaderViewController cameraPosition](self, "cameraPosition");
  if ((id)-[QRCodeReaderViewController cameraPosition](self, "cameraPosition") == (id)1)
    v6 = 2;
  else
    v6 = 1;
  v7 = -[QRCodeReaderViewController setActiveCamera:](self, "setActiveCamera:", v6);
  v8 = DiagnosticLogHandleForCategory(3);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134217984;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Successfully set camera position to %ld", (uint8_t *)&v13, 0xCu);
    }

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10000872C();

    if (!-[QRCodeReaderViewController setActiveCamera:](self, "setActiveCamera:", v5))
    {
      v11 = DiagnosticLogHandleForCategory(3);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_100008700();

      -[QRCodeReaderViewController finishWithStatusCode:metadata:](self, "finishWithStatusCode:metadata:", &off_10000C5D0, 0);
    }
  }
}

- (void)takePictureWithHandler:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = DiagnosticLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "take picture call on QRCodeReaderViewController", v5, 2u);
  }

}

- (BOOL)setActiveCamera:(int64_t)a3
{
  void *v5;
  id v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v33;
  uint8_t buf[4];
  int64_t v35;

  -[QRCodeReaderViewController setFlash:](self, "setFlash:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AVCaptureDevice defaultDeviceWithDeviceType:mediaType:position:](AVCaptureDevice, "defaultDeviceWithDeviceType:mediaType:position:", AVCaptureDeviceTypeBuiltInWideAngleCamera, AVMediaTypeVideo, a3));
  if (v5)
  {
    v33 = 0;
    v6 = objc_msgSend(objc_alloc((Class)AVCaptureDeviceInput), "initWithDevice:error:", v5, &v33);
    v7 = v33;
    v8 = v6 != 0;
    if (v6)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController captureSession](self, "captureSession"));
      objc_msgSend(v9, "beginConfiguration");

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController cameraInput](self, "cameraInput"));
      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController captureSession](self, "captureSession"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController cameraInput](self, "cameraInput"));
        objc_msgSend(v11, "removeInput:", v12);

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController captureSession](self, "captureSession"));
      objc_msgSend(v13, "addInput:", v6);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController captureSession](self, "captureSession"));
      objc_msgSend(v14, "commitConfiguration");

      -[QRCodeReaderViewController setCameraDevice:](self, "setCameraDevice:", v5);
      -[QRCodeReaderViewController setCameraInput:](self, "setCameraInput:", v6);
      -[QRCodeReaderViewController setCameraPosition:](self, "setCameraPosition:", a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[QRCodeReaderViewController overlayView](self, "overlayView"));
      objc_msgSend(v15, "setFlashUIEnabled:", a3 == 1);

      v16 = DiagnosticLogHandleForCategory(3);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v35 = a3;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Successfully set active camera to position %ld", buf, 0xCu);
      }
    }
    else
    {
      v25 = DiagnosticLogHandleForCategory(3);
      v17 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_1000087BC(a3, v17, v26, v27, v28, v29, v30, v31);
    }

  }
  else
  {
    v18 = DiagnosticLogHandleForCategory(3);
    v7 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100008758(a3, v7, v19, v20, v21, v22, v23, v24);
    v8 = 0;
  }

  return v8;
}

- (QRCodeReaderInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->_inputs, a3);
}

- (int64_t)cameraPosition
{
  return self->_cameraPosition;
}

- (void)setCameraPosition:(int64_t)a3
{
  self->_cameraPosition = a3;
}

- (AVCaptureDevice)cameraDevice
{
  return (AVCaptureDevice *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCameraDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (AVCaptureDeviceInput)cameraInput
{
  return (AVCaptureDeviceInput *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCameraInput:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (AVCaptureSession)captureSession
{
  return self->_captureSession;
}

- (void)setCaptureSession:(id)a3
{
  objc_storeStrong((id *)&self->_captureSession, a3);
}

- (UIView)previewView
{
  return self->_previewView;
}

- (void)setPreviewView:(id)a3
{
  objc_storeStrong((id *)&self->_previewView, a3);
}

- (CameraTargetView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_overlayView, a3);
}

- (UIButton)flipButton
{
  return self->_flipButton;
}

- (void)setFlipButton:(id)a3
{
  objc_storeStrong((id *)&self->_flipButton, a3);
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (BOOL)flashState
{
  return self->_flashState;
}

- (void)setFlashState:(BOOL)a3
{
  self->_flashState = a3;
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_flipButton, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
  objc_storeStrong((id *)&self->_cameraInput, 0);
  objc_storeStrong((id *)&self->_cameraDevice, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
}

@end
