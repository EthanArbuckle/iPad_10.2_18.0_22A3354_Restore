@implementation BatterySwellingViewController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  -[BatterySwellingViewController setInputs:](self, "setInputs:", a3, a4);
  -[BatterySwellingViewController setFaceUpPixelMaps:](self, "setFaceUpPixelMaps:", 0);
  -[BatterySwellingViewController setFaceDownPixelMaps:](self, "setFaceDownPixelMaps:", 0);
  -[BatterySwellingViewController setIsFinishedFaceDownPixelMaps:](self, "setIsFinishedFaceDownPixelMaps:", 0);
  -[BatterySwellingViewController setIsFinishedFaceUpPixelMaps:](self, "setIsFinishedFaceUpPixelMaps:", 0);
  -[BatterySwellingViewController setIsCompleted:](self, "setIsCompleted:", 0);
  -[BatterySwellingViewController setUpFrameNumber:](self, "setUpFrameNumber:", 0);
  -[BatterySwellingViewController setDownFrameNumber:](self, "setDownFrameNumber:", 0);
}

- (void)setupAngleMotionManager
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc_init((Class)CMMotionManager);
  -[BatterySwellingViewController setMotionManager:](self, "setMotionManager:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController motionManager](self, "motionManager"));
  objc_msgSend(v4, "setShowsDeviceMovementDisplay:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController motionManager](self, "motionManager"));
  objc_msgSend(v5, "setDeviceMotionUpdateInterval:", 0.00999999978);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController motionManager](self, "motionManager"));
  objc_msgSend(v6, "startDeviceMotionUpdatesUsingReferenceFrame:", 1);

}

- (BOOL)setupHIDForceTouchImageRecognizer
{
  __MTDevice *Default;
  unsigned int ParserType;
  int IsBuiltIn;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t MultitouchRunLoopSource;
  __CFRunLoopSource *v11;
  __CFRunLoop *Current;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  Default = (__MTDevice *)MTDeviceCreateDefault(self, a2);
  v15 = 0;
  v16 = 0;
  v14 = 255;
  ParserType = MTDeviceGetParserType();
  IsBuiltIn = MTDeviceIsBuiltIn(Default);
  if (MTDeviceGetDeviceID(Default, &v16))
  {
    v6 = -12;
  }
  else if (MTDeviceGetSensorSurfaceDimensions(Default, (char *)&v15 + 4, &v15))
  {
    v6 = -13;
  }
  else if (MTDeviceGetTransportMethod(Default, &v14))
  {
    v6 = -14;
  }
  else
  {
    if (ParserType < 0x3E8)
      v7 = IsBuiltIn;
    else
      v7 = 0;
    if (v7 == 1)
    {
      LOBYTE(v13) = 0;
      if (MTDeviceSetReport(Default, 168, &v13, 1))
      {
        v6 = -15;
      }
      else
      {
        LOBYTE(v13) = 10;
        if (MTDeviceSetReport(Default, 243, &v13, 1))
        {
          v6 = -16;
        }
        else
        {
          LOBYTE(v13) = 65;
          if (MTDeviceSetReport(Default, 65, &v13, 1))
          {
            v6 = -17;
          }
          else
          {
            LOBYTE(v13) = 0;
            if (MTDeviceSetReport(Default, 165, &v13, 1))
            {
              v6 = -18;
            }
            else
            {
              v13 = 1445;
              if (MTDeviceSetReport(Default, 59, &v13, 4))
              {
                v6 = -19;
              }
              else
              {
                LOBYTE(v13) = 30;
                if (MTDeviceSetReport(Default, 200, &v13, 1))
                {
                  v6 = -20;
                }
                else
                {
                  LOBYTE(v13) = 3;
                  if (MTDeviceSetReport(Default, 172, &v13, 1))
                  {
                    v6 = -21;
                  }
                  else if (MTDeviceStart(Default, 0x20000000))
                  {
                    v6 = -5;
                  }
                  else
                  {
                    MultitouchRunLoopSource = MTDeviceCreateMultitouchRunLoopSource(Default);
                    if (MultitouchRunLoopSource)
                    {
                      v11 = (__CFRunLoopSource *)MultitouchRunLoopSource;
                      Current = CFRunLoopGetCurrent();
                      CFRunLoopAddSource(Current, v11, kCFRunLoopCommonModes);
                      CFRelease(v11);
                      self->_builtInDevice = Default;
                      CFRetain(Default);
                      return 1;
                    }
                    v6 = -24;
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      v6 = -6;
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v6));
  -[BatterySwellingViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", v8);

  return 0;
}

- (signed)allocatePixelMaps
{
  void *v3;
  signed int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char *v8;
  void *v9;
  signed __int16 **v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
  v4 = objc_msgSend(v3, "pixelMapWidth");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
  v6 = v4 * (uint64_t)(int)objc_msgSend(v5, "pixelMapHeight");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
  v8 = (char *)malloc_type_malloc(2 * v6 * (int)objc_msgSend(v7, "numFramesToRecord"), 0x94046790uLL);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
  v10 = (signed __int16 **)malloc_type_malloc(8 * (int)objc_msgSend(v9, "numFramesToRecord"), 0x10040436913F5uLL);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
  LODWORD(v7) = objc_msgSend(v11, "numFramesToRecord");

  if ((int)v7 >= 1)
  {
    v12 = 0;
    do
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
      v14 = objc_msgSend(v13, "pixelMapWidth") * v12;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
      v10[v12] = (signed __int16 *)&v8[2 * v14 * objc_msgSend(v15, "pixelMapHeight")];

      ++v12;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
      LODWORD(v15) = objc_msgSend(v16, "numFramesToRecord");

    }
    while (v12 < (int)v15);
  }
  return v10;
}

- (void)start
{
  -[BatterySwellingViewController setMonitoringAngle:](self, "setMonitoringAngle:", 0);
  -[BatterySwellingViewController setupAngleMotionManager](self, "setupAngleMotionManager");
  if (-[BatterySwellingViewController setupHIDForceTouchImageRecognizer](self, "setupHIDForceTouchImageRecognizer"))
  {
    -[BatterySwellingViewController setFaceUpPixelMaps:](self, "setFaceUpPixelMaps:", -[BatterySwellingViewController allocatePixelMaps](self, "allocatePixelMaps"));
    -[BatterySwellingViewController setFaceDownPixelMaps:](self, "setFaceDownPixelMaps:", -[BatterySwellingViewController allocatePixelMaps](self, "allocatePixelMaps"));
    if (-[BatterySwellingViewController faceUpPixelMaps](self, "faceUpPixelMaps")
      && -[BatterySwellingViewController faceDownPixelMaps](self, "faceDownPixelMaps"))
    {
      -[BatterySwellingViewController setDeviceOrientation:](self, "setDeviceOrientation:", 5);
      -[BatterySwellingViewController setupView](self, "setupView");
      -[BatterySwellingViewController setupExcessiveMotionNotification](self, "setupExcessiveMotionNotification");
      -[BatterySwellingViewController determineBatteryGasGaugeTemp](self, "determineBatteryGasGaugeTemp");
      -[BatterySwellingViewController enableSensorMonitoring](self, "enableSensorMonitoring");
    }
    else
    {
      -[BatterySwellingViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_10000C7B0);
    }
  }
}

- (void)setupView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = objc_alloc((Class)UIImageView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController view](self, "view"));
  objc_msgSend(v6, "bounds");
  v7 = objc_msgSend(v5, "initWithFrame:");
  -[BatterySwellingViewController setFlipInstructionImageView:](self, "setFlipInstructionImageView:", v7);

  v13 = (id)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController instructionImageName](self, "instructionImageName"));
  if (v13)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController instructionImageName](self, "instructionImageName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController flipInstructionImageView](self, "flipInstructionImageView"));
    objc_msgSend(v9, "setImage:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController flipInstructionImageView](self, "flipInstructionImageView"));
    objc_msgSend(v10, "setAlpha:", 0.0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController view](self, "view"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController flipInstructionImageView](self, "flipInstructionImageView"));
    objc_msgSend(v11, "addSubview:", v12);

  }
  else
  {
    -[BatterySwellingViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_10000C7C8);
  }

}

- (void)setupExcessiveMotionNotification
{
  DAMotionDetector *v3;
  id v4;

  v3 = -[DAMotionDetector initWithThreshold:]([DAMotionDetector alloc], "initWithThreshold:", &off_10000C7E0);
  -[BatterySwellingViewController setMotionDetectionMonitor:](self, "setMotionDetectionMonitor:", v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController motionDetectionMonitor](self, "motionDetectionMonitor"));
  objc_msgSend(v4, "start");

}

- (void)determineBatteryGasGaugeTemp
{
  void *v3;
  void *v4;
  MultiTouchHelper *v5;

  v5 = objc_alloc_init(MultiTouchHelper);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MultiTouchHelper temperatureData](v5, "temperatureData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TG0B")));
  -[BatterySwellingViewController setBatteryTemp:](self, "setBatteryTemp:", v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BatterySwellingViewController;
  -[BatterySwellingViewController viewDidAppear:](&v8, "viewDidAppear:", a3);
  if (-[BatterySwellingViewController checkIfCorrectOrientation:](self, "checkIfCorrectOrientation:", 5))
  {
    -[BatterySwellingViewController setupAngleMonitoring](self, "setupAngleMonitoring");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
    objc_msgSend(v4, "samplingSetupTimeout");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "setupForSamplingCompleted:", 0, 0));
    -[BatterySwellingViewController setSamplingSetupTimer:](self, "setSamplingSetupTimer:", v5);

  }
  else
  {
    v6 = DiagnosticLogHandleForCategory(3);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10000813C();

    -[BatterySwellingViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_10000C7F8);
  }
}

- (id)instructionImageName
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v7, "scale");
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  objc_msgSend(v10, "appendString:", CFSTR("down-"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v4 * v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v6 * v9));
  objc_msgSend(v10, "appendFormat:", CFSTR("%@-%@.png"), v11, v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v10));
  return v13;
}

- (void)enableSensorMonitoring
{
  -[BatterySwellingViewController setMonitoringAngle:](self, "setMonitoringAngle:", 1);
  -[BatterySwellingViewController startExcessiveMotionMonitoring](self, "startExcessiveMotionMonitoring");
  -[BatterySwellingViewController setTouchAllowed:](self, "setTouchAllowed:", 0);
}

- (void)disableSensorMonitoring
{
  if (-[BatterySwellingViewController monitoringAngle](self, "monitoringAngle"))
  {
    -[BatterySwellingViewController setMonitoringAngle:](self, "setMonitoringAngle:", 0);
    if ((MTUnregisterImageCallback(-[BatterySwellingViewController builtInDevice](self, "builtInDevice"), forceTouchImageCallback) & 1) == 0)-[BatterySwellingViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_10000C810);
    -[BatterySwellingViewController stopExcessiveMotionMonitoring](self, "stopExcessiveMotionMonitoring");
    -[BatterySwellingViewController setTouchAllowed:](self, "setTouchAllowed:", 1);
  }
}

- (void)startExcessiveMotionMonitoring
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "receivedExcessiveEventNotification:", CFSTR("MotionDetectedNotification"), 0);

}

- (void)stopExcessiveMotionMonitoring
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)checkAngle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  unsigned int v9;
  void *v10;
  int v11;
  double v12;
  uint64_t v13;
  NSObject *v14;
  double v15;
  uint64_t v16;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController motionManager](self, "motionManager", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceMotion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attitude"));

  if (v6)
    objc_msgSend(v6, "rotationMatrix", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0);
  v7 = acos(-0.0);
  if (-[BatterySwellingViewController monitoringAngle](self, "monitoringAngle"))
  {
    v8 = v7 * 180.0 / 3.14159265;
    v9 = -[BatterySwellingViewController checkIfCorrectOrientation:](self, "checkIfCorrectOrientation:", 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
    v11 = objc_msgSend(v10, "angleTolerance");
    if (v9)
    {
      v12 = (double)(180 - v11);

      if (v8 < v12)
      {
        v13 = DiagnosticLogHandleForCategory(3);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          goto LABEL_10;
        goto LABEL_11;
      }
    }
    else
    {
      v15 = (double)v11;

      if (v8 > v15)
      {
        v16 = DiagnosticLogHandleForCategory(3);
        v14 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
LABEL_10:
          sub_100008168();
LABEL_11:

        -[BatterySwellingViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_10000C828);
      }
    }
  }

}

- (BOOL)checkIfCorrectOrientation:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  long double v7;
  double v8;
  uint64_t v9;
  BOOL v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController motionManager](self, "motionManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceMotion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attitude"));

  if (v6)
    objc_msgSend(v6, "rotationMatrix", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0);
  v7 = acos(-0.0) + -1.57079633;
  v8 = fabs(v7 * 180.0 / 3.14159265);
  v9 = 6;
  if (v7 > 0.0)
    v9 = 5;
  v11 = v8 > 40.0 && v9 == a3;

  return v11;
}

- (void)setupAngleMonitoring
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController displayLink](self, "displayLink"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplayLink displayLinkWithTarget:selector:](CADisplayLink, "displayLinkWithTarget:selector:", self, "checkAngle:"));
    -[BatterySwellingViewController setDisplayLink:](self, "setDisplayLink:", v4);

    v6 = (id)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController displayLink](self, "displayLink"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    objc_msgSend(v6, "addToRunLoop:forMode:", v5, NSRunLoopCommonModes);

  }
}

- (void)receivedExcessiveEventNotification:(id)a3
{
  uint64_t v4;
  NSObject *v5;

  v4 = DiagnosticLogHandleForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100008194();

  -[BatterySwellingViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_10000C840);
}

- (void)setupForSamplingCompleted:(id)a3
{
  void *v4;
  id v5;

  if ((MTRegisterImageCallbackWithRefcon(-[BatterySwellingViewController builtInDevice](self, "builtInDevice", a3), forceTouchImageCallback, 4, 2, self) & 1) == 0)-[BatterySwellingViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_10000C858);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
  objc_msgSend(v5, "samplingTimeout");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "sampleTimeout:", 0, 0));
  -[BatterySwellingViewController setSamplingTimer:](self, "setSamplingTimer:", v4);

}

- (void)sampleTimeout:(id)a3
{
  -[BatterySwellingViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_10000C870);
}

- (void)samplingFinished:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController samplingTimer](self, "samplingTimer", a3));
  objc_msgSend(v4, "invalidate");

  -[BatterySwellingViewController setSamplingTimer:](self, "setSamplingTimer:", 0);
  -[BatterySwellingViewController disableSensorMonitoring](self, "disableSensorMonitoring");
  if (-[BatterySwellingViewController checkIfCorrectOrientation:](self, "checkIfCorrectOrientation:", 5))
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100006D30;
    v7[3] = &unk_10000C390;
    v7[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v7, 0.25);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
    objc_msgSend(v5, "flipSetupTimeout");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "deviceHasFlipped:", 0, 0));
    -[BatterySwellingViewController setFlipSetupTimer:](self, "setFlipSetupTimer:", v6);

  }
  else
  {
    -[BatterySwellingViewController setIsCompleted:](self, "setIsCompleted:", 1);
    -[BatterySwellingViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_10000C888);
  }
}

- (void)deviceHasFlipped:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[BatterySwellingViewController checkIfCorrectOrientation:](self, "checkIfCorrectOrientation:", 5))
  {
    v4 = DiagnosticLogHandleForCategory(3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000081C0();

    -[BatterySwellingViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_10000C8A0);
  }
  else
  {
    -[BatterySwellingViewController setDeviceOrientation:](self, "setDeviceOrientation:", 6);
    -[BatterySwellingViewController enableSensorMonitoring](self, "enableSensorMonitoring");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController flipInstructionImageView](self, "flipInstructionImageView"));
    objc_msgSend(v6, "setAlpha:", 0.0);

    v8 = (id)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
    objc_msgSend(v8, "samplingSetupTimeout");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "setupForSamplingCompleted:", 0, 0));
    -[BatterySwellingViewController setSamplingSetupTimer:](self, "setSamplingSetupTimer:", v7);

  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v5;
  NSObject *v6;

  if (!-[BatterySwellingViewController touchAllowed](self, "touchAllowed", a3, a4))
  {
    v5 = DiagnosticLogHandleForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000081EC();

    -[BatterySwellingViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_10000C8B8);
  }
}

- (id)mergeFrames:(signed __int16 *)a3
{
  const NSNotificationName **v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  uint64_t v18;
  double v19;
  signed __int16 *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  signed int v28;
  NSNotificationName *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  int v35;
  uint64_t v36;
  double v37;
  signed __int16 *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  BOOL v46;

  v5 = &AVAudioSessionInterruptionNotification_ptr;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (int)objc_msgSend(v6, "pixelMapHeight")));

  v8 = -[BatterySwellingViewController rowZeroAtBottom](self, "rowZeroAtBottom");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
  v10 = objc_msgSend(v9, "pixelMapHeight");
  if (v8)
  {

    if (v10 >= 1)
    {
      v11 = 0;
      do
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (int)objc_msgSend(v12, "pixelMapWidth")));
        objc_msgSend(v7, "addObject:", v13);

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
        LODWORD(v12) = objc_msgSend(v14, "pixelMapWidth");

        if ((int)v12 >= 1)
        {
          v15 = 0;
          do
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
            v17 = objc_msgSend(v16, "numFramesToRecord");

            if (v17 < 1)
            {
              v19 = 0.0;
            }
            else
            {
              v18 = 0;
              v19 = 0.0;
              do
              {
                v20 = a3[v18];
                v21 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
                v19 = v19 + (double)v20[(int)(v15 + objc_msgSend(v21, "pixelMapWidth") * v11)];

                ++v18;
                v22 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
                LODWORD(v20) = objc_msgSend(v22, "numFramesToRecord");

              }
              while (v18 < (int)v20);
            }
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v11));
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v19 / (double)(int)objc_msgSend(v24, "numFramesToRecord")));
            objc_msgSend(v23, "addObject:", v25);

            ++v15;
            v26 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
            LODWORD(v25) = objc_msgSend(v26, "pixelMapWidth");

          }
          while (v15 < (int)v25);
        }
        ++v11;
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
        v28 = objc_msgSend(v27, "pixelMapHeight");

      }
      while (v11 < v28);
    }
  }
  else
  {

    if (v10 >= 1)
    {
      do
      {
        v29 = (NSNotificationName *)v5[42];
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSNotificationName arrayWithCapacity:](v29, "arrayWithCapacity:", (int)objc_msgSend(v30, "pixelMapWidth")));
        objc_msgSend(v7, "addObject:", v31);

        v32 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
        LODWORD(v30) = objc_msgSend(v32, "pixelMapWidth");

        if ((int)v30 >= 1)
        {
          v33 = 0;
          do
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
            v35 = objc_msgSend(v34, "numFramesToRecord");

            if (v35 < 1)
            {
              v37 = 0.0;
            }
            else
            {
              v36 = 0;
              v37 = 0.0;
              do
              {
                v38 = a3[v36];
                v39 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
                v37 = v37 + (double)v38[v33 + objc_msgSend(v39, "pixelMapWidth") * (v10 - 1)];

                ++v36;
                v40 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
                LODWORD(v38) = objc_msgSend(v40, "numFramesToRecord");

              }
              while (v36 < (int)v38);
            }
            v41 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", (int)(objc_msgSend(v41, "pixelMapHeight") - v10)));
            v43 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
            v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v37 / (double)(int)objc_msgSend(v43, "numFramesToRecord")));
            objc_msgSend(v42, "addObject:", v44);

            ++v33;
            v45 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController inputs](self, "inputs"));
            LODWORD(v42) = objc_msgSend(v45, "pixelMapWidth");

          }
          while (v33 < (int)v42);
        }
        v46 = v10-- <= 1;
        v5 = &AVAudioSessionInterruptionNotification_ptr;
      }
      while (!v46);
    }
  }
  return v7;
}

- (void)endTestWithStatusCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD v18[3];
  _QWORD v19[3];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController result](self, "result"));
  objc_msgSend(v5, "setStatusCode:", v4);

  if (-[BatterySwellingViewController isCompleted](self, "isCompleted"))
  {
    v18[0] = CFSTR("faceUpPixelMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController mergeFrames:](self, "mergeFrames:", -[BatterySwellingViewController faceUpPixelMaps](self, "faceUpPixelMaps")));
    v19[0] = v6;
    v18[1] = CFSTR("faceDownPixelMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController mergeFrames:](self, "mergeFrames:", -[BatterySwellingViewController faceDownPixelMaps](self, "faceDownPixelMaps")));
    v19[1] = v7;
    v18[2] = CFSTR("batteryTemperature");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController batteryTemp](self, "batteryTemp"));
    v9 = numberOrNull(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v19[2] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 3));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController result](self, "result"));
    objc_msgSend(v12, "setData:", v11);

    v13 = DiagnosticLogHandleForCategory(3);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      sub_100008284(self, v14);

    v15 = DiagnosticLogHandleForCategory(3);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      sub_100008218((uint64_t)v4, v16, v17);

  }
  -[BatterySwellingViewController setFinished:](self, "setFinished:", 1);

}

- (void)teardown
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
  void *v13;

  -[BatterySwellingViewController disableSensorMonitoring](self, "disableSensorMonitoring");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController flipSetupTimer](self, "flipSetupTimer"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController flipSetupTimer](self, "flipSetupTimer"));
    objc_msgSend(v4, "invalidate");

    -[BatterySwellingViewController setFlipSetupTimer:](self, "setFlipSetupTimer:", 0);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController samplingTimer](self, "samplingTimer"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController samplingTimer](self, "samplingTimer"));
    objc_msgSend(v6, "invalidate");

    -[BatterySwellingViewController setSamplingTimer:](self, "setSamplingTimer:", 0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController samplingSetupTimer](self, "samplingSetupTimer"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController samplingSetupTimer](self, "samplingSetupTimer"));
    objc_msgSend(v8, "invalidate");

    -[BatterySwellingViewController setSamplingSetupTimer:](self, "setSamplingSetupTimer:", 0);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController displayLink](self, "displayLink"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController displayLink](self, "displayLink"));
    objc_msgSend(v10, "invalidate");

    -[BatterySwellingViewController setDisplayLink:](self, "setDisplayLink:", 0);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController motionDetectionMonitor](self, "motionDetectionMonitor"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BatterySwellingViewController motionDetectionMonitor](self, "motionDetectionMonitor"));
    objc_msgSend(v12, "stop");

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "removeObserver:", self);

    -[BatterySwellingViewController setMotionDetectionMonitor:](self, "setMotionDetectionMonitor:", 0);
  }
  if (-[BatterySwellingViewController builtInDevice](self, "builtInDevice"))
  {
    if (MTDeviceIsRunning(-[BatterySwellingViewController builtInDevice](self, "builtInDevice")))
      MTDeviceStop(-[BatterySwellingViewController builtInDevice](self, "builtInDevice"));
    CFRelease(-[BatterySwellingViewController builtInDevice](self, "builtInDevice"));
  }
  if (-[BatterySwellingViewController faceDownPixelMaps](self, "faceDownPixelMaps"))
  {
    free(*(void **)-[BatterySwellingViewController faceDownPixelMaps](self, "faceDownPixelMaps"));
    free(-[BatterySwellingViewController faceDownPixelMaps](self, "faceDownPixelMaps"));
    -[BatterySwellingViewController setFaceDownPixelMaps:](self, "setFaceDownPixelMaps:", 0);
  }
  if (-[BatterySwellingViewController faceUpPixelMaps](self, "faceUpPixelMaps"))
  {
    free(*(void **)-[BatterySwellingViewController faceUpPixelMaps](self, "faceUpPixelMaps"));
    free(-[BatterySwellingViewController faceUpPixelMaps](self, "faceUpPixelMaps"));
    -[BatterySwellingViewController setFaceUpPixelMaps:](self, "setFaceUpPixelMaps:", 0);
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)touchEventRecognized
{
  return self->_touchEventRecognized;
}

- (void)setTouchEventRecognized:(BOOL)a3
{
  self->_touchEventRecognized = a3;
}

- (signed)faceUpPixelMaps
{
  return self->_faceUpPixelMaps;
}

- (void)setFaceUpPixelMaps:(signed __int16 *)a3
{
  self->_faceUpPixelMaps = a3;
}

- (signed)faceDownPixelMaps
{
  return self->_faceDownPixelMaps;
}

- (void)setFaceDownPixelMaps:(signed __int16 *)a3
{
  self->_faceDownPixelMaps = a3;
}

- (BOOL)rowZeroAtBottom
{
  return self->_rowZeroAtBottom;
}

- (void)setRowZeroAtBottom:(BOOL)a3
{
  self->_rowZeroAtBottom = a3;
}

- (int)upFrameNumber
{
  return self->_upFrameNumber;
}

- (void)setUpFrameNumber:(int)a3
{
  self->_upFrameNumber = a3;
}

- (int)downFrameNumber
{
  return self->_downFrameNumber;
}

- (void)setDownFrameNumber:(int)a3
{
  self->_downFrameNumber = a3;
}

- (BOOL)isFinishedFaceUpPixelMaps
{
  return self->_isFinishedFaceUpPixelMaps;
}

- (void)setIsFinishedFaceUpPixelMaps:(BOOL)a3
{
  self->_isFinishedFaceUpPixelMaps = a3;
}

- (BOOL)isFinishedFaceDownPixelMaps
{
  return self->_isFinishedFaceDownPixelMaps;
}

- (void)setIsFinishedFaceDownPixelMaps:(BOOL)a3
{
  self->_isFinishedFaceDownPixelMaps = a3;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (CMMotionManager)motionManager
{
  return self->_motionManager;
}

- (void)setMotionManager:(id)a3
{
  objc_storeStrong((id *)&self->_motionManager, a3);
}

- (DAMotionDetector)motionDetectionMonitor
{
  return self->_motionDetectionMonitor;
}

- (void)setMotionDetectionMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_motionDetectionMonitor, a3);
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  self->_deviceOrientation = a3;
}

- (UIImageView)flipInstructionImageView
{
  return self->_flipInstructionImageView;
}

- (void)setFlipInstructionImageView:(id)a3
{
  objc_storeStrong((id *)&self->_flipInstructionImageView, a3);
}

- (NSNumber)batteryTemp
{
  return self->_batteryTemp;
}

- (void)setBatteryTemp:(id)a3
{
  objc_storeStrong((id *)&self->_batteryTemp, a3);
}

- (NSArray)temperatureKeyArray
{
  return self->_temperatureKeyArray;
}

- (void)setTemperatureKeyArray:(id)a3
{
  objc_storeStrong((id *)&self->_temperatureKeyArray, a3);
}

- (NSArray)temperatureValueArray
{
  return self->_temperatureValueArray;
}

- (void)setTemperatureValueArray:(id)a3
{
  objc_storeStrong((id *)&self->_temperatureValueArray, a3);
}

- (BOOL)monitoringAngle
{
  return self->_monitoringAngle;
}

- (void)setMonitoringAngle:(BOOL)a3
{
  self->_monitoringAngle = a3;
}

- (__MTDevice)builtInDevice
{
  return self->_builtInDevice;
}

- (void)setBuiltInDevice:(__MTDevice *)a3
{
  self->_builtInDevice = a3;
}

- (BOOL)touchAllowed
{
  return self->_touchAllowed;
}

- (void)setTouchAllowed:(BOOL)a3
{
  self->_touchAllowed = a3;
}

- (BOOL)isCompleted
{
  return self->_isCompleted;
}

- (void)setIsCompleted:(BOOL)a3
{
  self->_isCompleted = a3;
}

- (BatterySwellingInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->_inputs, a3);
}

- (NSTimer)samplingSetupTimer
{
  return self->_samplingSetupTimer;
}

- (void)setSamplingSetupTimer:(id)a3
{
  objc_storeStrong((id *)&self->_samplingSetupTimer, a3);
}

- (NSTimer)samplingTimer
{
  return self->_samplingTimer;
}

- (void)setSamplingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_samplingTimer, a3);
}

- (NSTimer)flipSetupTimer
{
  return self->_flipSetupTimer;
}

- (void)setFlipSetupTimer:(id)a3
{
  objc_storeStrong((id *)&self->_flipSetupTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flipSetupTimer, 0);
  objc_storeStrong((id *)&self->_samplingTimer, 0);
  objc_storeStrong((id *)&self->_samplingSetupTimer, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_temperatureValueArray, 0);
  objc_storeStrong((id *)&self->_temperatureKeyArray, 0);
  objc_storeStrong((id *)&self->_batteryTemp, 0);
  objc_storeStrong((id *)&self->_flipInstructionImageView, 0);
  objc_storeStrong((id *)&self->_motionDetectionMonitor, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
