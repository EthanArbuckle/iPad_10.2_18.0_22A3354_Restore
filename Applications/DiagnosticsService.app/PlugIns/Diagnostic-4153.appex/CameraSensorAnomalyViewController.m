@implementation CameraSensorAnomalyViewController

- (void)viewDidLoad
{
  objc_super v3;

  -[CameraSensorAnomalyViewController setShouldShowPressHomeLabel:](self, "setShouldShowPressHomeLabel:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CameraSensorAnomalyViewController;
  -[CameraSensorAnomalyViewController viewDidLoad](&v3, "viewDidLoad");
}

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  _QWORD v33[7];
  _QWORD v34[7];

  -[CameraSensorAnomalyViewController setInputs:](self, "setInputs:", a3, a4);
  -[CameraSensorAnomalyViewController setCurrentTag:](self, "setCurrentTag:", 1);
  -[CameraSensorAnomalyViewController setDrawingMode:](self, "setDrawingMode:", 0);
  v5 = objc_alloc_init((Class)NSMutableArray);
  -[CameraSensorAnomalyViewController setAllResults:](self, "setAllResults:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController inputs](self, "inputs"));
  v7 = objc_msgSend(v6, "disableAmbientLightAdaptation");

  if (v7)
  {
    v8 = objc_alloc_init((Class)CBClient);
    -[CameraSensorAnomalyViewController setClient:](self, "setClient:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController client](self, "client"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "blueLightClient"));
    -[CameraSensorAnomalyViewController setBlueLightClient:](self, "setBlueLightClient:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController client](self, "client"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "adaptationClient"));
    -[CameraSensorAnomalyViewController setAdaptationClient:](self, "setAdaptationClient:", v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[DSTestAutomation sharedInstance](DSTestAutomation, "sharedInstance"));
  v14 = objc_msgSend(v13, "testAutomationEnabled");

  if (v14)
  {
    v33[0] = CFSTR("predicates");
    v31 = CFSTR("identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController inputs](self, "inputs"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "identifier"));
    v32 = v29;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
    v34[0] = v28;
    v33[1] = CFSTR("minimumSquareLength");
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController inputs](self, "inputs"));
    objc_msgSend(v27, "minimumSquareLength");
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v34[1] = v26;
    v33[2] = CFSTR("enableMaxBrightness");
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController inputs](self, "inputs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v25, "enableMaxBrightness")));
    v34[2] = v15;
    v33[3] = CFSTR("flashModeOn");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController inputs](self, "inputs"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v16, "flashModeOn")));
    v34[3] = v17;
    v33[4] = CFSTR("viewfinderInstruction");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController inputs](self, "inputs"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "viewfinderInstruction"));
    v34[4] = v19;
    v33[5] = CFSTR("drawColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController inputs](self, "inputs"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "drawColor"));
    v34[5] = v21;
    v33[6] = CFSTR("disableAmbientLightAdaptation");
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController inputs](self, "inputs"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v22, "disableAmbientLightAdaptation")));
    v34[6] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 7));
    +[DSTestAutomation postConfiguration:](DSTestAutomation, "postConfiguration:", v24);

  }
}

- (Class)inputsClass
{
  return (Class)objc_opt_class(CameraSensorAnomalyInputs, a2);
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController inputs](self, "inputs"));
  LODWORD(v4) = objc_msgSend(v5, "enableMaxBrightness");

  if ((_DWORD)v4)
    -[CameraSensorAnomalyViewController saveAndMaximizeBrightness](self, "saveAndMaximizeBrightness");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController inputs](self, "inputs"));
  v7 = objc_msgSend(v6, "disableAmbientLightAdaptation");

  if (v7)
  {
    -[CameraSensorAnomalyViewController saveColorAdjustmentStates](self, "saveColorAdjustmentStates");
    -[CameraSensorAnomalyViewController disableAdaptationAndBlueLightReduction](self, "disableAdaptationAndBlueLightReduction");
  }
  -[CameraSensorAnomalyViewController setupCamera](self, "setupCamera");
}

- (void)cancel
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002F94;
  block[3] = &unk_100010348;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)cleanUp
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;

  -[CameraSensorAnomalyViewController resetBrightness](self, "resetBrightness");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController inputs](self, "inputs"));
  v4 = objc_msgSend(v3, "disableAmbientLightAdaptation");

  if (v4)
    -[CameraSensorAnomalyViewController resetColorAdjustmentStates](self, "resetColorAdjustmentStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController session](self, "session"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController session](self, "session"));
    v7 = objc_msgSend(v6, "isRunning");

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController session](self, "session"));
      objc_msgSend(v8, "stopRunning");

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[DSTestAutomation sharedInstance](DSTestAutomation, "sharedInstance"));
      v10 = objc_msgSend(v9, "testAutomationEnabled");

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController session](self, "session"));
        objc_msgSend(v11, "removeObserver:name:object:", self, AVCaptureSessionDidStartRunningNotification, v12);

      }
      -[CameraSensorAnomalyViewController setSession:](self, "setSession:", 0);
    }
  }
}

- (void)setupCamera
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  int v30;
  void *v31;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController inputs](self, "inputs"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
    v30 = 138412290;
    v31 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "self.inputs.identifier: %@", (uint8_t *)&v30, 0xCu);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController inputs](self, "inputs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController findDevice:](self, "findDevice:", v6));

  if (!v7)
  {
    v8 = -3;
LABEL_8:
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v8));
    -[CameraSensorAnomalyViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", v29);
    goto LABEL_9;
  }
  v8 = -[CameraSensorAnomalyViewController setupSessionForDevice:](self, "setupSessionForDevice:", v7);
  if (v8)
    goto LABEL_8;
  v8 = -[CameraSensorAnomalyViewController setupCameraPreview](self, "setupCameraPreview");
  if (v8)
    goto LABEL_8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController session](self, "session"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v12 = objc_msgSend(v9, "addObserverForName:object:queue:usingBlock:", AVCaptureSessionRuntimeErrorNotification, v10, v11, &stru_100010388);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController session](self, "session"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v16 = objc_msgSend(v13, "addObserverForName:object:queue:usingBlock:", AVCaptureSessionDidStartRunningNotification, v14, v15, &stru_1000103A8);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController session](self, "session"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v20 = objc_msgSend(v17, "addObserverForName:object:queue:usingBlock:", AVCaptureSessionDidStopRunningNotification, v18, v19, &stru_1000103C8);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController session](self, "session"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v24 = objc_msgSend(v21, "addObserverForName:object:queue:usingBlock:", AVCaptureSessionWasInterruptedNotification, v22, v23, &stru_1000103E8);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController session](self, "session"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v28 = objc_msgSend(v25, "addObserverForName:object:queue:usingBlock:", AVCaptureSessionInterruptionEndedNotification, v26, v27, &stru_100010408);

  -[CameraSensorAnomalyViewController showCameraView](self, "showCameraView");
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController session](self, "session"));
  objc_msgSend(v29, "startRunning");
LABEL_9:

}

- (id)findDevice:(id)a3
{
  id v3;
  id *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  id v30;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Front")) & 1) != 0)
  {
    v4 = (id *)&AVCaptureDeviceTypeBuiltInWideAngleCamera;
    v5 = 2;
  }
  else
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Rear")) & 1) != 0)
    {
      v4 = (id *)&AVCaptureDeviceTypeBuiltInWideAngleCamera;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RearTelephoto")) & 1) != 0)
    {
      v4 = (id *)&AVCaptureDeviceTypeBuiltInTelephotoCamera;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RearSuperWide")) & 1) != 0)
    {
      v4 = (id *)&AVCaptureDeviceTypeBuiltInUltraWideCamera;
    }
    else
    {
      if (!objc_msgSend(v3, "isEqualToString:", CFSTR("RearSynced")))
      {
        v8 = 0;
        goto LABEL_18;
      }
      v4 = (id *)&AVCaptureDeviceTypeBuiltInDualCamera;
    }
    v5 = 1;
  }
  v7 = *v4;
  v8 = v7;
  if (v7)
  {
    v30 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:mediaType:position:](AVCaptureDeviceDiscoverySession, "discoverySessionWithDeviceTypes:mediaType:position:", v9, AVMediaTypeVideo, v5));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "devices"));
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "devices"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));

      if (v14)
      {
        v15 = DiagnosticLogHandleForCategory(3, v6);
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "deviceType"));
          v26 = 138412546;
          v27 = v14;
          v28 = 2112;
          v29 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Requested device found: %@, %@", (uint8_t *)&v26, 0x16u);

        }
        goto LABEL_21;
      }
    }
    else
    {

    }
  }
LABEL_18:
  v18 = DiagnosticLogHandleForCategory(3, v6);
  v16 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    sub_100009488((uint64_t)v3, v16, v19, v20, v21, v22, v23, v24);
  v14 = 0;
LABEL_21:

  return v14;
}

- (int64_t)setupSessionForDevice:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int64_t v19;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v36;

  v36 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVCaptureDeviceInput deviceInputWithDevice:error:](AVCaptureDeviceInput, "deviceInputWithDevice:error:", a3, &v36));
  v6 = v36;
  if (v4)
  {
    v7 = objc_alloc_init((Class)AVCapturePhotoOutput);
    -[CameraSensorAnomalyViewController setOutput:](self, "setOutput:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController output](self, "output"));
    objc_msgSend(v8, "setLivePhotoCaptureEnabled:", 0);

    v9 = objc_alloc_init((Class)AVCaptureSession);
    -[CameraSensorAnomalyViewController setSession:](self, "setSession:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController session](self, "session"));
    objc_msgSend(v10, "setSessionPreset:", AVCaptureSessionPresetPhoto);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController session](self, "session"));
    if ((objc_msgSend(v11, "canAddInput:", v4) & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController session](self, "session"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController output](self, "output"));
      v14 = objc_msgSend(v12, "canAddOutput:", v13);

      if (v14)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController session](self, "session"));
        objc_msgSend(v16, "addInput:", v4);

        v17 = objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController session](self, "session"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController output](self, "output"));
        -[NSObject addOutput:](v17, "addOutput:", v18);

        v19 = 0;
        goto LABEL_12;
      }
    }
    else
    {

    }
    v27 = DiagnosticLogHandleForCategory(3, v15);
    v17 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100009550(v17, v28, v29, v30, v31, v32, v33, v34);
    v19 = -5;
  }
  else
  {
    v20 = DiagnosticLogHandleForCategory(3, v5);
    v17 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1000094EC((uint64_t)v6, v17, v21, v22, v23, v24, v25, v26);
    v19 = -4;
  }
LABEL_12:

  return v19;
}

- (int64_t)setupCameraPreview
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  CameraTargetView *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  CameraTargetView *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v3 = objc_alloc((Class)UIView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v5 = objc_msgSend(v3, "initWithFrame:");
  -[CameraSensorAnomalyViewController setPreviewView:](self, "setPreviewView:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController session](self, "session"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AVCaptureVideoPreviewLayer layerWithSession:](AVCaptureVideoPreviewLayer, "layerWithSession:", v6));

  if (v7)
  {
    objc_msgSend(v7, "setVideoGravity:", AVLayerVideoGravityResizeAspectFill);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connection"));
    objc_msgSend(v9, "setVideoRotationAngle:", 90.0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController previewView](self, "previewView"));
    objc_msgSend(v10, "bounds");
    objc_msgSend(v7, "setFrame:");

    v11 = [CameraTargetView alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController previewView](self, "previewView"));
    objc_msgSend(v12, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor orangeColor](UIColor, "orangeColor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController inputs](self, "inputs"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "viewfinderInstruction"));
    v24 = -[CameraTargetView initWithFrame:color:thickness:instructionText:presentationOptions:](v11, "initWithFrame:color:thickness:instructionText:presentationOptions:", v21, v23, 3, v14, v16, v18, v20, 2.0);
    -[CameraSensorAnomalyViewController setOverlayView:](self, "setOverlayView:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController overlayView](self, "overlayView"));
    objc_msgSend(v25, "setUserInteractionEnabled:", 1);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController overlayView](self, "overlayView"));
    objc_msgSend(v26, "setDelegate:", self);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController previewView](self, "previewView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "layer"));
    objc_msgSend(v28, "addSublayer:", v7);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController previewView](self, "previewView"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController overlayView](self, "overlayView"));
    objc_msgSend(v29, "addSubview:", v30);

    v31 = 0;
  }
  else
  {
    v32 = DiagnosticLogHandleForCategory(3, v8);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      sub_100009580(v33, v34, v35, v36, v37, v38, v39, v40);

    v31 = -6;
  }

  return v31;
}

- (void)showCameraView
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController previewView](self, "previewView"));
  objc_msgSend(v3, "addSubview:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DSTestAutomation sharedInstance](DSTestAutomation, "sharedInstance"));
  LODWORD(v3) = objc_msgSend(v5, "testAutomationEnabled");

  if ((_DWORD)v3)
    +[DSTestAutomation postInteractiveTestEvent:info:](DSTestAutomation, "postInteractiveTestEvent:info:", CFSTR("ViewDidChange"), &off_100010B18);
}

- (void)hideCameraView
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController previewView](self, "previewView"));
  objc_msgSend(v2, "removeFromSuperview");

}

- (void)addPanGesture
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_msgSend(objc_alloc((Class)UIPanGestureRecognizer), "initWithTarget:action:", self, "panOccurred:");
  -[CameraSensorAnomalyViewController setPanGesture:](self, "setPanGesture:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController panGesture](self, "panGesture"));
  objc_msgSend(v4, "setMaximumNumberOfTouches:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController panGesture](self, "panGesture"));
  objc_msgSend(v5, "setMinimumNumberOfTouches:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController panGesture](self, "panGesture"));
  objc_msgSend(v6, "setDelegate:", self);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController currentImageView](self, "currentImageView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "drawableView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController panGesture](self, "panGesture"));
  objc_msgSend(v7, "addGestureRecognizer:", v8);

}

- (void)addTapGesture
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "tapOccurred:");
  -[CameraSensorAnomalyViewController setTapGesture:](self, "setTapGesture:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController tapGesture](self, "tapGesture"));
  objc_msgSend(v4, "setDelegate:", self);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController currentImageView](self, "currentImageView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "drawableView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController tapGesture](self, "tapGesture"));
  objc_msgSend(v5, "addGestureRecognizer:", v6);

}

- (void)panOccurred:(id)a3
{
  void *v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  double v18;
  double v19;
  void *v20;
  float v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  float v27;
  int v28;
  double v29;
  double v30;
  void *v31;
  float v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  float v38;
  int v39;
  double v40;
  double v41;
  void *v42;
  float v43;
  float v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  float v49;
  float v50;
  double v51;
  void *v52;
  void *v53;
  id v54;
  CGPoint v55;
  CGRect v56;

  v54 = a3;
  if (objc_msgSend(v54, "state") == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController currentImageView](self, "currentImageView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "drawableView"));
    objc_msgSend(v54, "locationInView:", v6);
    -[CameraSensorAnomalyViewController setOriginPoint:](self, "setOriginPoint:");

  }
  v7 = objc_msgSend(v54, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController currentImageView](self, "currentImageView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "drawableView"));
  v10 = v9;
  if (v7 == (id)3)
  {
    objc_msgSend(v9, "endDrawing");

    -[CameraSensorAnomalyViewController addedRectangleView](self, "addedRectangleView");
  }
  else
  {
    objc_msgSend(v54, "locationInView:", v9);
    v12 = v11;
    v14 = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController currentImageView](self, "currentImageView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "drawableView"));
    objc_msgSend(v16, "bounds");
    v55.x = v12;
    v55.y = v14;
    v17 = CGRectContainsPoint(v56, v55);

    if (v17)
    {
      -[CameraSensorAnomalyViewController originPoint](self, "originPoint");
      v19 = vabdd_f64(v18, v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController inputs](self, "inputs"));
      objc_msgSend(v20, "minimumSquareLength");
      v22 = v21;
      -[CameraSensorAnomalyViewController originPoint](self, "originPoint");
      v24 = v23;
      if (v19 >= v22)
      {
        v28 = 0;
        if (v23 >= v12)
          v26 = v12;
        else
          v26 = v23;
      }
      else
      {
        -[CameraSensorAnomalyViewController originPoint](self, "originPoint");
        v26 = v25;
        if (v12 >= v24)
        {
          v28 = 0;
        }
        else
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController inputs](self, "inputs"));
          objc_msgSend(v16, "minimumSquareLength");
          v26 = v26 - v27;
          v28 = 1;
        }
      }
      -[CameraSensorAnomalyViewController originPoint](self, "originPoint");
      v30 = vabdd_f64(v29, v14);
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController inputs](self, "inputs"));
      objc_msgSend(v31, "minimumSquareLength");
      v33 = v32;
      -[CameraSensorAnomalyViewController originPoint](self, "originPoint");
      v35 = v34;
      if (v30 >= v33)
      {
        v39 = 0;
        if (v34 >= v14)
          v37 = v14;
        else
          v37 = v34;
      }
      else
      {
        -[CameraSensorAnomalyViewController originPoint](self, "originPoint");
        v37 = v36;
        if (v14 >= v35)
        {
          v39 = 0;
        }
        else
        {
          v3 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController inputs](self, "inputs"));
          objc_msgSend(v3, "minimumSquareLength");
          v37 = v37 - v38;
          v39 = 1;
        }
      }
      -[CameraSensorAnomalyViewController originPoint](self, "originPoint");
      v41 = vabdd_f64(v40, v12);
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController inputs](self, "inputs"));
      objc_msgSend(v42, "minimumSquareLength");
      v44 = v43;

      if (v41 >= v44)
        v45 = v41;
      else
        v45 = v44;
      -[CameraSensorAnomalyViewController originPoint](self, "originPoint");
      v47 = vabdd_f64(v46, v14);
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController inputs](self, "inputs"));
      objc_msgSend(v48, "minimumSquareLength");
      v50 = v49;

      if (v47 >= v50)
        v51 = v47;
      else
        v51 = v50;
      -[CameraSensorAnomalyViewController setRectangle:](self, "setRectangle:", v26, v37, v45, v51);
      if (v39)

      if (v28)
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController currentImageView](self, "currentImageView"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "drawableView"));
      -[CameraSensorAnomalyViewController rectangle](self, "rectangle");
      objc_msgSend(v53, "updateDrawing:");

    }
  }

}

- (void)tapOccurred:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  float v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  float v19;
  double v20;
  void *v21;
  float v22;
  double v23;
  void *v24;
  float v25;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController currentImageView](self, "currentImageView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "drawableView"));
  objc_msgSend(v4, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  -[CameraSensorAnomalyViewController setOriginPoint:](self, "setOriginPoint:", v8, v10);
  -[CameraSensorAnomalyViewController originPoint](self, "originPoint");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController inputs](self, "inputs"));
  objc_msgSend(v13, "minimumSquareLength");
  v15 = v12 - (float)(v14 * 0.5);
  -[CameraSensorAnomalyViewController originPoint](self, "originPoint");
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController inputs](self, "inputs"));
  objc_msgSend(v18, "minimumSquareLength");
  v20 = v17 - (float)(v19 * 0.5);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController inputs](self, "inputs"));
  objc_msgSend(v21, "minimumSquareLength");
  v23 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController inputs](self, "inputs"));
  objc_msgSend(v24, "minimumSquareLength");
  -[CameraSensorAnomalyViewController setRectangle:](self, "setRectangle:", v15, v20, v23, v25);

  -[CameraSensorAnomalyViewController addedRectangleView](self, "addedRectangleView");
}

- (void)removeShape:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  CameraSensorAnomalyViewController *v22;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController inputs](self, "inputs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "drawColor"));
  objc_msgSend(v4, "setBackgroundColor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("REMOVE_ITEM"), &stru_1000106F0, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v8, 0, 1));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("REMOVE"), &stru_1000106F0, 0));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000047F4;
  v20[3] = &unk_100010430;
  v12 = v4;
  v21 = v12;
  v22 = self;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 2, v20));
  objc_msgSend(v9, "addAction:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1000106F0, 0));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100004828;
  v18[3] = &unk_100010458;
  v19 = v12;
  v16 = v12;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 0, v18));
  objc_msgSend(v9, "addAction:", v17);

  -[CameraSensorAnomalyViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

- (void)addedRectangleView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[6];
  _QWORD v44[6];

  -[CameraSensorAnomalyViewController rectangle](self, "rectangle");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController inputs](self, "inputs"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "drawColor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[DSShapeView rectangleWithFrame:borderColor:fillColor:](DSShapeView, "rectangleWithFrame:borderColor:fillColor:", v12, v13, v4, v6, v8, v10));

  objc_msgSend(v14, "setTag:", -[CameraSensorAnomalyViewController currentTag](self, "currentTag"));
  -[CameraSensorAnomalyViewController setCurrentTag:](self, "setCurrentTag:", (char *)-[CameraSensorAnomalyViewController currentTag](self, "currentTag") + 1);
  v15 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "removeShape:");
  objc_msgSend(v14, "addGestureRecognizer:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController currentImageView](self, "currentImageView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "drawableView"));
  objc_msgSend(v17, "addSubview:", v14);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController currentImageView](self, "currentImageView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "drawableView"));
  objc_msgSend(v14, "frame");
  v21 = v20;
  v23 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController view](self, "view"));
  objc_msgSend(v19, "convertPoint:toView:", v24, v21, v23);
  v26 = v25;
  v28 = v27;

  v43[0] = CFSTR("xPos");
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController imageScrollView](self, "imageScrollView"));
  objc_msgSend(v42, "zoomScale");
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v26 / v29));
  v44[0] = v30;
  v43[1] = CFSTR("yPos");
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController imageScrollView](self, "imageScrollView"));
  objc_msgSend(v31, "zoomScale");
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v28 / v32));
  v44[1] = v33;
  v43[2] = CFSTR("width");
  objc_msgSend(v14, "frame");
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v34));
  v44[2] = v35;
  v43[3] = CFSTR("height");
  objc_msgSend(v14, "frame");
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v36));
  v44[3] = v37;
  v43[4] = CFSTR("tag");
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v14, "tag")));
  v44[4] = v38;
  v43[5] = CFSTR("brightness");
  BKSDisplayBrightnessGetCurrent();
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v44[5] = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v44, v43, 6));

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController allResults](self, "allResults"));
  objc_msgSend(v41, "addObject:", v40);

}

- (void)removeDrawingModeViews
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController imageScrollView](self, "imageScrollView"));
  objc_msgSend(v3, "removeFromSuperview");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController bottomBar](self, "bottomBar"));
  objc_msgSend(v4, "removeFromSuperview");

}

- (void)retakeButtonPressed:(id)a3
{
  -[CameraSensorAnomalyViewController removeDrawingModeViews](self, "removeDrawingModeViews", a3);
  -[CameraSensorAnomalyViewController setDrawingMode:](self, "setDrawingMode:", 0);
  -[CameraSensorAnomalyViewController showCameraView](self, "showCameraView");
}

- (void)usePhotoButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController retakeButton](self, "retakeButton", a3));
  objc_msgSend(v4, "setHidden:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController usePhotoButton](self, "usePhotoButton"));
  objc_msgSend(v5, "setHidden:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController continueButton](self, "continueButton"));
  objc_msgSend(v6, "setHidden:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController currentImageView](self, "currentImageView"));
  objc_msgSend(v7, "setUserInteractionEnabled:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController imageScrollView](self, "imageScrollView"));
  objc_msgSend(v8, "setMaximumZoomScale:", 3.0);

  -[CameraSensorAnomalyViewController addPanGesture](self, "addPanGesture");
  -[CameraSensorAnomalyViewController addTapGesture](self, "addTapGesture");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[DSTestAutomation sharedInstance](DSTestAutomation, "sharedInstance"));
  LODWORD(v8) = objc_msgSend(v9, "testAutomationEnabled");

  if ((_DWORD)v8)
    +[DSTestAutomation postInteractiveTestEvent:info:](DSTestAutomation, "postInteractiveTestEvent:info:", CFSTR("ViewDidChange"), &off_100010B40);
}

- (void)continueButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CAMERA_SENSOR_ANOMALY_TOOL_COMPLETE_TITLE"), &stru_1000106F0, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CAMERA_SENSOR_ANOMALY_TOOL_COMPLETE_MESSAGE"), &stru_1000106F0, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("GO_BACK"), &stru_1000106F0, 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 1, 0));
  objc_msgSend(v8, "addAction:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_1000106F0, 0));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100004F60;
  v15[3] = &unk_100010458;
  v15[4] = self;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 0, v15));
  objc_msgSend(v8, "addAction:", v14);

  -[CameraSensorAnomalyViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

- (void)endTestWithStatusCode:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CameraSensorAnomalyViewController cleanUp](self, "cleanUp");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController result](self, "result"));
  objc_msgSend(v5, "setStatusCode:", v4);

  -[CameraSensorAnomalyViewController parseResults](self, "parseResults");
  -[CameraSensorAnomalyViewController setFinished:](self, "setFinished:", 1);
}

- (void)parseResults
{
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[3];
  _QWORD v40[3];
  _BYTE v41[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController result](self, "result"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "statusCode"));
  v5 = objc_msgSend(v4, "isEqualToNumber:", &off_100010BC0);

  if (v5)
  {
    v7 = DiagnosticLogHandleForCategory(3, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000095B0(v8, v9, v10, v11, v12, v13, v14, v15);

    v16 = (id)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController result](self, "result"));
    objc_msgSend(v16, "setData:", &__NSDictionary0__struct);
  }
  else
  {
    v17 = objc_alloc((Class)NSMutableArray);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController allResults](self, "allResults"));
    v16 = objc_msgSend(v17, "initWithCapacity:", objc_msgSend(v18, "count"));

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController allResults](self, "allResults", 0));
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v36;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v36 != v22)
            objc_enumerationMutation(v19);
          v24 = objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v23), "mutableCopy");
          objc_msgSend(v24, "removeObjectForKey:", CFSTR("tag"));
          objc_msgSend(v16, "addObject:", v24);

          v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      }
      while (v21);
    }

    v25 = objc_msgSend(v16, "copy");
    -[CameraSensorAnomalyViewController setAllResults:](self, "setAllResults:", v25);

    v39[0] = CFSTR("displayResX");
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v26, "bounds");
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v27));
    v40[0] = v28;
    v39[1] = CFSTR("displayResY");
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v29, "bounds");
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v30));
    v40[1] = v31;
    v39[2] = CFSTR("anomaliesDetected");
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController allResults](self, "allResults"));
    v40[2] = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v39, 3));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController result](self, "result"));
    objc_msgSend(v34, "setData:", v33);

  }
}

- (void)removeResultWithTag:(int64_t)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController allResults](self, "allResults", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("tag")));
        v12 = objc_msgSend(v11, "integerValue");

        if (v12 == (id)a3)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController allResults](self, "allResults"));
          objc_msgSend(v13, "removeObject:", v10);

          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)saveColorAdjustmentStates
{
  void *v3;
  void *v4;
  _OWORD v5[2];
  uint64_t v6;

  v6 = 0;
  memset(v5, 0, sizeof(v5));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController blueLightClient](self, "blueLightClient"));
  objc_msgSend(v3, "getBlueLightStatus:", v5);

  -[CameraSensorAnomalyViewController setBlueLightStatusActive:](self, "setBlueLightStatusActive:", LOBYTE(v5[0]));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController adaptationClient](self, "adaptationClient"));
  -[CameraSensorAnomalyViewController setColorAdaptationStatus:](self, "setColorAdaptationStatus:", objc_msgSend(v4, "getEnabled"));

}

- (void)resetColorAdjustmentStates
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController blueLightClient](self, "blueLightClient"));
  objc_msgSend(v3, "setActive:", -[CameraSensorAnomalyViewController blueLightStatusActive](self, "blueLightStatusActive"));

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController adaptationClient](self, "adaptationClient"));
  objc_msgSend(v4, "setEnabled:", -[CameraSensorAnomalyViewController colorAdaptationStatus](self, "colorAdaptationStatus"));

}

- (void)disableAdaptationAndBlueLightReduction
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController blueLightClient](self, "blueLightClient"));
  objc_msgSend(v3, "setActive:", 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController adaptationClient](self, "adaptationClient"));
  objc_msgSend(v4, "setEnabled:", 0);

}

- (void)saveAndMaximizeBrightness
{
  id v3;

  BKSDisplayBrightnessGetCurrent(self, a2);
  -[CameraSensorAnomalyViewController setOriginalScreenBrightness:](self, "setOriginalScreenBrightness:");
  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v3, "setBrightness:", 1.0);

}

- (void)resetBrightness
{
  void *v3;
  unsigned int v4;
  float v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController inputs](self, "inputs"));
  v4 = objc_msgSend(v3, "enableMaxBrightness");

  if (v4)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    -[CameraSensorAnomalyViewController originalScreenBrightness](self, "originalScreenBrightness");
    objc_msgSend(v6, "setBrightness:", v5);

  }
}

- (void)flipTapped
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = DiagnosticLogHandleForCategory(3, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "flip tapped call on QRCodeReaderViewController", v4, 2u);
  }

}

- (void)flashTapped
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = DiagnosticLogHandleForCategory(3, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "flash tapped call on QRCodeReaderViewController", v4, 2u);
  }

}

- (void)cancelTapped
{
  -[CameraSensorAnomalyViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_100010BD8);
}

- (void)takePictureWithHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[CameraSensorAnomalyViewController setPhotoCaptureCompletionHandler:](self, "setPhotoCaptureCompletionHandler:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue(+[AVCapturePhotoSettings photoSettings](AVCapturePhotoSettings, "photoSettings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController inputs](self, "inputs"));
  objc_msgSend(v6, "setFlashMode:", objc_msgSend(v4, "flashModeOn"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController output](self, "output"));
  objc_msgSend(v5, "capturePhotoWithSettings:delegate:", v6, self);

}

- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void (**v10)(void);
  CameraSensorAnomalyTestImageView *v11;
  void *v12;
  CameraSensorAnomalyTestImageView *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  float v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  float v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  float v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  DADrawableView *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  DADrawableView *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  id v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  uint64_t v174;
  NSObject *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  id v192;
  void *v193;
  void *v194;
  _QWORD v195[5];
  _QWORD v196[5];

  v7 = a5;
  v8 = a4;
  -[CameraSensorAnomalyViewController hideCameraView](self, "hideCameraView");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController photoCaptureCompletionHandler](self, "photoCaptureCompletionHandler"));

  if (v9)
  {
    v10 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController photoCaptureCompletionHandler](self, "photoCaptureCompletionHandler"));
    v10[2]();

    -[CameraSensorAnomalyViewController setPhotoCaptureCompletionHandler:](self, "setPhotoCaptureCompletionHandler:", 0);
  }
  v11 = [CameraSensorAnomalyTestImageView alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController view](self, "view"));
  objc_msgSend(v12, "frame");
  v13 = -[CameraSensorAnomalyTestImageView initWithFrame:](v11, "initWithFrame:");
  -[CameraSensorAnomalyViewController setCurrentImageView:](self, "setCurrentImageView:", v13);

  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fileDataRepresentation"));
  v192 = v7;
  v194 = (void *)v14;
  if (v14
    && (v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen")),
        objc_msgSend(v16, "scale"),
        v17 = objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:scale:](UIImage, "imageWithData:scale:", v14)),
        v16,
        v17))
  {
    -[CameraSensorAnomalyViewController setDrawingMode:](self, "setDrawingMode:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController currentImageView](self, "currentImageView"));
    v19 = (void *)v17;
    objc_msgSend(v18, "setImage:", v17);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController currentImageView](self, "currentImageView"));
    objc_msgSend(v20, "bounds");
    v22 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController currentImageView](self, "currentImageView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "image"));
    objc_msgSend(v24, "size");
    v26 = v22 / v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController currentImageView](self, "currentImageView"));
    objc_msgSend(v27, "bounds");
    v29 = v28;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController currentImageView](self, "currentImageView"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "image"));
    objc_msgSend(v31, "size");
    v33 = v29 / v32;

    if (v26 < v33)
      v33 = v26;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController currentImageView](self, "currentImageView", v7, v194));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "image"));
    objc_msgSend(v35, "size");
    v36 = v33;
    v38 = v37 * v36;

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController currentImageView](self, "currentImageView"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "image"));
    objc_msgSend(v40, "size");
    *(float *)&v36 = v41 * v36;

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController currentImageView](self, "currentImageView"));
    objc_msgSend(v42, "frame");
    v43 = *(float *)&v36;
    v45 = (v44 - v43) * 0.5;

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController currentImageView](self, "currentImageView"));
    objc_msgSend(v46, "setFrame:", 0.0, v45, v38, v43);

    v47 = [DADrawableView alloc];
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController currentImageView](self, "currentImageView"));
    objc_msgSend(v48, "frame");
    v50 = v49;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController currentImageView](self, "currentImageView"));
    objc_msgSend(v51, "frame");
    v53 = v52;
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController inputs](self, "inputs"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "drawColor"));
    v57 = -[DADrawableView initWithFrame:rectangleFillColor:rectangleEdgeColor:](v47, "initWithFrame:rectangleFillColor:rectangleEdgeColor:", v54, v56, 0.0, 0.0, v50, v53);
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController currentImageView](self, "currentImageView"));
    objc_msgSend(v58, "setDrawableView:", v57);

    v59 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController currentImageView](self, "currentImageView"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController currentImageView](self, "currentImageView"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "drawableView"));
    objc_msgSend(v59, "addSubview:", v61);

    v62 = objc_alloc((Class)UIScrollView);
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController view](self, "view"));
    objc_msgSend(v63, "frame");
    v65 = v64;
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController view](self, "view"));
    objc_msgSend(v66, "frame");
    v68 = objc_msgSend(v62, "initWithFrame:", 0.0, 0.0, v65, v67 - 85.0);
    -[CameraSensorAnomalyViewController setImageScrollView:](self, "setImageScrollView:", v68);

    v69 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController currentImageView](self, "currentImageView"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "drawableView"));
    objc_msgSend(v70, "frame");
    v72 = v71;
    v74 = v73;
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController imageScrollView](self, "imageScrollView"));
    objc_msgSend(v75, "setContentSize:", v72, v74);

    v76 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController imageScrollView](self, "imageScrollView"));
    objc_msgSend(v76, "setShowsHorizontalScrollIndicator:", 0);

    v77 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController imageScrollView](self, "imageScrollView"));
    objc_msgSend(v77, "setShowsVerticalScrollIndicator:", 0);

    v78 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController imageScrollView](self, "imageScrollView"));
    objc_msgSend(v78, "setScrollsToTop:", 0);

    v79 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController imageScrollView](self, "imageScrollView"));
    objc_msgSend(v79, "setDelegate:", self);

    v80 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController imageScrollView](self, "imageScrollView"));
    objc_msgSend(v80, "setBouncesZoom:", 1);

    v81 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController imageScrollView](self, "imageScrollView"));
    objc_msgSend(v81, "setDecelerationRate:", UIScrollViewDecelerationRateFast);

    v82 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController imageScrollView](self, "imageScrollView"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "panGestureRecognizer"));
    objc_msgSend(v83, "setMinimumNumberOfTouches:", 2);

    v84 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController imageScrollView](self, "imageScrollView"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController currentImageView](self, "currentImageView"));
    objc_msgSend(v84, "addSubview:", v85);

    v86 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[CameraSensorAnomalyViewController setBottomBar:](self, "setBottomBar:", v86);

    v87 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController bottomBar](self, "bottomBar"));
    objc_msgSend(v87, "setOpaque:", 0);

    v88 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.5));
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController bottomBar](self, "bottomBar"));
    objc_msgSend(v89, "setBackgroundColor:", v88);

    v90 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController bottomBar](self, "bottomBar"));
    objc_msgSend(v90, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v91 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleBody));
    v92 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v91, 18.0));

    v93 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    -[CameraSensorAnomalyViewController setRetakeButton:](self, "setRetakeButton:", v93);

    v94 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController retakeButton](self, "retakeButton"));
    objc_msgSend(v94, "setOpaque:", 0);

    v95 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController retakeButton](self, "retakeButton"));
    objc_msgSend(v96, "setBackgroundColor:", v95);

    v97 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController retakeButton](self, "retakeButton"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "titleLabel"));
    objc_msgSend(v98, "setContentMode:", 7);

    v99 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController retakeButton](self, "retakeButton"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "titleLabel"));
    objc_msgSend(v100, "setTextAlignment:", 1);

    v101 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController retakeButton](self, "retakeButton"));
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "titleLabel"));
    objc_msgSend(v102, "setLineBreakMode:", 4);

    v103 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController retakeButton](self, "retakeButton"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "titleLabel"));
    objc_msgSend(v104, "setFont:", v92);

    v105 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController retakeButton](self, "retakeButton"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "titleLabel"));
    objc_msgSend(v106, "setNumberOfLines:", 1);

    v107 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController retakeButton](self, "retakeButton"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "localizedStringForKey:value:table:", CFSTR("RETAKE"), &stru_1000106F0, 0));
    objc_msgSend(v107, "setTitle:forState:", v109, 0);

    v110 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController retakeButton](self, "retakeButton"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    objc_msgSend(v110, "setTitleColor:forState:", v111, 0);

    v112 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController retakeButton](self, "retakeButton"));
    objc_msgSend(v112, "sizeToFit");

    v113 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController retakeButton](self, "retakeButton"));
    objc_msgSend(v113, "addTarget:action:forControlEvents:", self, "retakeButtonPressed:", 64);

    v114 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController retakeButton](self, "retakeButton"));
    objc_msgSend(v114, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v115 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    -[CameraSensorAnomalyViewController setUsePhotoButton:](self, "setUsePhotoButton:", v115);

    v116 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController usePhotoButton](self, "usePhotoButton"));
    objc_msgSend(v116, "setOpaque:", 0);

    v117 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v118 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController usePhotoButton](self, "usePhotoButton"));
    objc_msgSend(v118, "setBackgroundColor:", v117);

    v119 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController usePhotoButton](self, "usePhotoButton"));
    v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "titleLabel"));
    objc_msgSend(v120, "setContentMode:", 7);

    v121 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController usePhotoButton](self, "usePhotoButton"));
    v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "titleLabel"));
    objc_msgSend(v122, "setTextAlignment:", 1);

    v123 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController usePhotoButton](self, "usePhotoButton"));
    v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "titleLabel"));
    objc_msgSend(v124, "setLineBreakMode:", 4);

    v125 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController usePhotoButton](self, "usePhotoButton"));
    v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "titleLabel"));
    objc_msgSend(v126, "setFont:", v92);

    v127 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController usePhotoButton](self, "usePhotoButton"));
    v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "titleLabel"));
    objc_msgSend(v128, "setNumberOfLines:", 1);

    v129 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController usePhotoButton](self, "usePhotoButton"));
    v130 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "localizedStringForKey:value:table:", CFSTR("USE_PHOTO"), &stru_1000106F0, 0));
    objc_msgSend(v129, "setTitle:forState:", v131, 0);

    v132 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController usePhotoButton](self, "usePhotoButton"));
    v133 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    objc_msgSend(v132, "setTitleColor:forState:", v133, 0);

    v134 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController usePhotoButton](self, "usePhotoButton"));
    objc_msgSend(v134, "sizeToFit");

    v135 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController usePhotoButton](self, "usePhotoButton"));
    objc_msgSend(v135, "addTarget:action:forControlEvents:", self, "usePhotoButtonPressed:", 64);

    v136 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController usePhotoButton](self, "usePhotoButton"));
    objc_msgSend(v136, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v137 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    -[CameraSensorAnomalyViewController setContinueButton:](self, "setContinueButton:", v137);

    v138 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController continueButton](self, "continueButton"));
    objc_msgSend(v138, "setOpaque:", 0);

    v139 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v140 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController continueButton](self, "continueButton"));
    objc_msgSend(v140, "setBackgroundColor:", v139);

    v141 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController continueButton](self, "continueButton"));
    v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "titleLabel"));
    objc_msgSend(v142, "setContentMode:", 7);

    v143 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController continueButton](self, "continueButton"));
    v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "titleLabel"));
    objc_msgSend(v144, "setTextAlignment:", 1);

    v145 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController continueButton](self, "continueButton"));
    v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "titleLabel"));
    objc_msgSend(v146, "setLineBreakMode:", 4);

    v147 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController continueButton](self, "continueButton"));
    v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "titleLabel"));
    objc_msgSend(v148, "setFont:", v92);

    v149 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController continueButton](self, "continueButton"));
    v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "titleLabel"));
    objc_msgSend(v150, "setNumberOfLines:", 1);

    v151 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController continueButton](self, "continueButton"));
    v152 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_1000106F0, 0));
    objc_msgSend(v151, "setTitle:forState:", v153, 0);

    v154 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController continueButton](self, "continueButton"));
    v155 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    objc_msgSend(v154, "setTitleColor:forState:", v155, 0);

    v156 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController continueButton](self, "continueButton"));
    objc_msgSend(v156, "sizeToFit");

    v157 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController continueButton](self, "continueButton"));
    objc_msgSend(v157, "addTarget:action:forControlEvents:", self, "continueButtonPressed:", 64);

    v158 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController continueButton](self, "continueButton"));
    objc_msgSend(v158, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v159 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController continueButton](self, "continueButton"));
    objc_msgSend(v159, "setHidden:", 1);

    v160 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController view](self, "view"));
    objc_msgSend(v160, "setNeedsUpdateConstraints");

    v161 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController bottomBar](self, "bottomBar"));
    v162 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController retakeButton](self, "retakeButton"));
    objc_msgSend(v161, "addSubview:", v162);

    v163 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController bottomBar](self, "bottomBar"));
    v164 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController usePhotoButton](self, "usePhotoButton"));
    objc_msgSend(v163, "addSubview:", v164);

    v165 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController bottomBar](self, "bottomBar"));
    v166 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController continueButton](self, "continueButton"));
    objc_msgSend(v165, "addSubview:", v166);

    v167 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController view](self, "view"));
    v168 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController imageScrollView](self, "imageScrollView"));
    objc_msgSend(v167, "addSubview:", v168);

    v169 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController view](self, "view"));
    v170 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController bottomBar](self, "bottomBar"));
    objc_msgSend(v169, "addSubview:", v170);

    v171 = (void *)objc_claimAutoreleasedReturnValue(+[DSTestAutomation sharedInstance](DSTestAutomation, "sharedInstance"));
    LODWORD(v170) = objc_msgSend(v171, "testAutomationEnabled");

    if ((_DWORD)v170)
      +[DSTestAutomation postInteractiveTestEvent:info:](DSTestAutomation, "postInteractiveTestEvent:info:", CFSTR("ViewDidChange"), &off_100010B68);

    v172 = v193;
    v173 = v19;
  }
  else
  {
    v174 = DiagnosticLogHandleForCategory(3, v15);
    v175 = objc_claimAutoreleasedReturnValue(v174);
    if (os_log_type_enabled(v175, OS_LOG_TYPE_ERROR))
      sub_1000095E0((uint64_t)v7, v175, v176, v177, v178, v179, v180, v181);

    v182 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v183 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v182, "localizedStringForKey:value:table:", CFSTR("UIIMPC_ERROR_TITLE"), &stru_1000106F0, 0));
    v184 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v185 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "localizedStringForKey:value:table:", CFSTR("UIIMPC_ERROR_MESSAGE"), &stru_1000106F0, 0));
    v173 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v183, v185, 1));

    v186 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v187 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v186, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1000106F0, 0));
    v196[0] = _NSConcreteStackBlock;
    v196[1] = 3221225472;
    v196[2] = sub_1000068C0;
    v196[3] = &unk_100010458;
    v196[4] = self;
    v188 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v187, 0, v196));
    objc_msgSend(v173, "addAction:", v188);

    v189 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v190 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "localizedStringForKey:value:table:", CFSTR("TRY_AGAIN"), &stru_1000106F0, 0));
    v195[0] = _NSConcreteStackBlock;
    v195[1] = 3221225472;
    v195[2] = sub_1000068D0;
    v195[3] = &unk_100010458;
    v195[4] = self;
    v191 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v190, 0, v195));
    objc_msgSend(v173, "addAction:", v191);

    v172 = v192;
    -[CameraSensorAnomalyViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v173, 1, 0);
  }

}

- (void)scrollViewDidZoom:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  objc_msgSend(a3, "bounds");
  v5 = v4;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController currentImageView](self, "currentImageView"));
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;

  if (v10 >= v5)
    v13 = 0.0;
  else
    v13 = (v5 - v10) * 0.5;
  if (v12 >= v7)
    v14 = 0.0;
  else
    v14 = (v7 - v12) * 0.5;
  v15 = (id)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController currentImageView](self, "currentImageView"));
  objc_msgSend(v15, "setFrame:", v13, v14, v10, v12);

}

- (void)updateViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  objc_super v73;

  v73.receiver = self;
  v73.super_class = (Class)CameraSensorAnomalyViewController;
  -[CameraSensorAnomalyViewController updateViewConstraints](&v73, "updateViewConstraints");
  if (-[CameraSensorAnomalyViewController drawingMode](self, "drawingMode"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController bottomBar](self, "bottomBar"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController bottomBar](self, "bottomBar"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController view](self, "view"));
    objc_msgSend(v5, "frame");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 7, 0, 0, 0, 1.0, v6));
    objc_msgSend(v3, "addConstraint:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController bottomBar](self, "bottomBar"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController bottomBar](self, "bottomBar"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 8, 0, 0, 0, 1.0, 85.0));
    objc_msgSend(v8, "addConstraint:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController view](self, "view"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController bottomBar](self, "bottomBar"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController view](self, "view"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 9, 0, v13, 9, 1.0, 0.0));
    objc_msgSend(v11, "addConstraint:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController view](self, "view"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController bottomBar](self, "bottomBar"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController view](self, "view"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v16, 4, 0, v17, 4, 1.0, 0.0));
    objc_msgSend(v15, "addConstraint:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController retakeButton](self, "retakeButton"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController retakeButton](self, "retakeButton"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController retakeButton](self, "retakeButton"));
    objc_msgSend(v21, "frame");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v20, 7, 0, 0, 0, 1.0, v22));
    objc_msgSend(v19, "addConstraint:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController retakeButton](self, "retakeButton"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController retakeButton](self, "retakeButton"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController retakeButton](self, "retakeButton"));
    objc_msgSend(v26, "frame");
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v25, 8, 0, 0, 0, 1.0, v27));
    objc_msgSend(v24, "addConstraint:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController bottomBar](self, "bottomBar"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController retakeButton](self, "retakeButton"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController bottomBar](self, "bottomBar"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v30, 5, 0, v31, 5, 1.0, 15.0));
    objc_msgSend(v29, "addConstraint:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController bottomBar](self, "bottomBar"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController retakeButton](self, "retakeButton"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController bottomBar](self, "bottomBar"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v34, 10, 0, v35, 10, 1.0, 0.0));
    objc_msgSend(v33, "addConstraint:", v36);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController usePhotoButton](self, "usePhotoButton"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController usePhotoButton](self, "usePhotoButton"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController usePhotoButton](self, "usePhotoButton"));
    objc_msgSend(v39, "frame");
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v38, 7, 0, 0, 0, 1.0, v40));
    objc_msgSend(v37, "addConstraint:", v41);

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController usePhotoButton](self, "usePhotoButton"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController usePhotoButton](self, "usePhotoButton"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController usePhotoButton](self, "usePhotoButton"));
    objc_msgSend(v44, "frame");
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v43, 8, 0, 0, 0, 1.0, v45));
    objc_msgSend(v42, "addConstraint:", v46);

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController bottomBar](self, "bottomBar"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController bottomBar](self, "bottomBar"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController usePhotoButton](self, "usePhotoButton"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v48, 6, 0, v49, 6, 1.0, 15.0));
    objc_msgSend(v47, "addConstraint:", v50);

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController bottomBar](self, "bottomBar"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController usePhotoButton](self, "usePhotoButton"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController retakeButton](self, "retakeButton"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v52, 10, 0, v53, 10, 1.0, 0.0));
    objc_msgSend(v51, "addConstraint:", v54);

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController continueButton](self, "continueButton"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController continueButton](self, "continueButton"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController continueButton](self, "continueButton"));
    objc_msgSend(v57, "frame");
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v56, 7, 0, 0, 0, 1.0, v58));
    objc_msgSend(v55, "addConstraint:", v59);

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController continueButton](self, "continueButton"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController continueButton](self, "continueButton"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController continueButton](self, "continueButton"));
    objc_msgSend(v62, "frame");
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v61, 8, 0, 0, 0, 1.0, v63));
    objc_msgSend(v60, "addConstraint:", v64);

    v65 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController bottomBar](self, "bottomBar"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController continueButton](self, "continueButton"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController bottomBar](self, "bottomBar"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v66, 9, 0, v67, 9, 1.0, 0.0));
    objc_msgSend(v65, "addConstraint:", v68);

    v69 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController bottomBar](self, "bottomBar"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController continueButton](self, "continueButton"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorAnomalyViewController bottomBar](self, "bottomBar"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v70, 10, 0, v71, 10, 1.0, 0.0));
    objc_msgSend(v69, "addConstraint:", v72);

  }
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

- (CameraSensorAnomalyInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->_inputs, a3);
}

- (id)photoCaptureCompletionHandler
{
  return self->_photoCaptureCompletionHandler;
}

- (void)setPhotoCaptureCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (float)originalScreenBrightness
{
  return self->_originalScreenBrightness;
}

- (void)setOriginalScreenBrightness:(float)a3
{
  self->_originalScreenBrightness = a3;
}

- (BOOL)drawingMode
{
  return self->_drawingMode;
}

- (void)setDrawingMode:(BOOL)a3
{
  self->_drawingMode = a3;
}

- (int64_t)currentTag
{
  return self->_currentTag;
}

- (void)setCurrentTag:(int64_t)a3
{
  self->_currentTag = a3;
}

- (CGRect)rectangle
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rectangle.origin.x;
  y = self->_rectangle.origin.y;
  width = self->_rectangle.size.width;
  height = self->_rectangle.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRectangle:(CGRect)a3
{
  self->_rectangle = a3;
}

- (CGPoint)originPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_originPoint.x;
  y = self->_originPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOriginPoint:(CGPoint)a3
{
  self->_originPoint = a3;
}

- (UIView)previewView
{
  return self->_previewView;
}

- (void)setPreviewView:(id)a3
{
  objc_storeStrong((id *)&self->_previewView, a3);
}

- (AVCaptureSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (AVCapturePhotoOutput)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
  objc_storeStrong((id *)&self->_output, a3);
}

- (CameraTargetView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_overlayView, a3);
}

- (UIScrollView)imageScrollView
{
  return self->_imageScrollView;
}

- (void)setImageScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_imageScrollView, a3);
}

- (UIView)bottomBar
{
  return self->_bottomBar;
}

- (void)setBottomBar:(id)a3
{
  objc_storeStrong((id *)&self->_bottomBar, a3);
}

- (UIButton)retakeButton
{
  return self->_retakeButton;
}

- (void)setRetakeButton:(id)a3
{
  objc_storeStrong((id *)&self->_retakeButton, a3);
}

- (UIButton)usePhotoButton
{
  return self->_usePhotoButton;
}

- (void)setUsePhotoButton:(id)a3
{
  objc_storeStrong((id *)&self->_usePhotoButton, a3);
}

- (UIButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (CameraSensorAnomalyTestImageView)currentImageView
{
  return self->_currentImageView;
}

- (void)setCurrentImageView:(id)a3
{
  objc_storeStrong((id *)&self->_currentImageView, a3);
}

- (NSMutableArray)allResults
{
  return self->_allResults;
}

- (void)setAllResults:(id)a3
{
  objc_storeStrong((id *)&self->_allResults, a3);
}

- (UIPanGestureRecognizer)panGesture
{
  return self->_panGesture;
}

- (void)setPanGesture:(id)a3
{
  objc_storeStrong((id *)&self->_panGesture, a3);
}

- (UITapGestureRecognizer)tapGesture
{
  return self->_tapGesture;
}

- (void)setTapGesture:(id)a3
{
  objc_storeStrong((id *)&self->_tapGesture, a3);
}

- (CBClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (CBBlueLightClient)blueLightClient
{
  return self->_blueLightClient;
}

- (void)setBlueLightClient:(id)a3
{
  objc_storeStrong((id *)&self->_blueLightClient, a3);
}

- (CBAdaptationClient)adaptationClient
{
  return self->_adaptationClient;
}

- (void)setAdaptationClient:(id)a3
{
  objc_storeStrong((id *)&self->_adaptationClient, a3);
}

- (BOOL)blueLightStatusActive
{
  return self->_blueLightStatusActive;
}

- (void)setBlueLightStatusActive:(BOOL)a3
{
  self->_blueLightStatusActive = a3;
}

- (BOOL)colorAdaptationStatus
{
  return self->_colorAdaptationStatus;
}

- (void)setColorAdaptationStatus:(BOOL)a3
{
  self->_colorAdaptationStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adaptationClient, 0);
  objc_storeStrong((id *)&self->_blueLightClient, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_panGesture, 0);
  objc_storeStrong((id *)&self->_allResults, 0);
  objc_storeStrong((id *)&self->_currentImageView, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_usePhotoButton, 0);
  objc_storeStrong((id *)&self->_retakeButton, 0);
  objc_storeStrong((id *)&self->_bottomBar, 0);
  objc_storeStrong((id *)&self->_imageScrollView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong(&self->_photoCaptureCompletionHandler, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
}

@end
