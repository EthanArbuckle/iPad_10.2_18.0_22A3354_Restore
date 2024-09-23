@implementation SRUserAttentionController

- (SRUserAttentionController)initWithSamplingInterval:(double)a3 attentionLossTimeout:(double)a4 supportedAttentionAwarenessEvents:(unint64_t)a5 deviceSupportsRaiseGestureDetection:(BOOL)a6
{
  _BOOL8 v6;
  SRUserAttentionSignalProviderFactory *v9;
  SRUserAttentionController *v10;

  v6 = a6;
  v9 = -[SRUserAttentionSignalProviderFactory initWithSamplingInterval:attentionLossTimeout:supportedAttentionAwarenessEvents:]([SRUserAttentionSignalProviderFactory alloc], "initWithSamplingInterval:attentionLossTimeout:supportedAttentionAwarenessEvents:", a5, a3, a4);
  v10 = -[SRUserAttentionController initWithSignalProviderFactory:supportedAttentionAwarenessEvents:deviceSupportsRaiseGestureDetection:](self, "initWithSignalProviderFactory:supportedAttentionAwarenessEvents:deviceSupportsRaiseGestureDetection:", v9, a5, v6);

  return v10;
}

- (SRUserAttentionController)initWithSignalProviderFactory:(id)a3 supportedAttentionAwarenessEvents:(unint64_t)a4 deviceSupportsRaiseGestureDetection:(BOOL)a5
{
  id v9;
  SRUserAttentionController *v10;
  SRUserAttentionController *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *attentionAwarenessHandlerQueue;
  objc_super v15;

  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SRUserAttentionController;
  v10 = -[SRUserAttentionController init](&v15, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_userAttentionSignalProviderFactory, a3);
    v11->_supportedAttentionAwarenessEvents = a4;
    v11->_deviceSupportsRaiseGestureDetection = a5;
    v11->_deviceLowered = 0;
    v12 = dispatch_queue_create("com.apple.siri.AttentionAwarenessQueue", 0);
    attentionAwarenessHandlerQueue = v11->_attentionAwarenessHandlerQueue;
    v11->_attentionAwarenessHandlerQueue = (OS_dispatch_queue *)v12;

  }
  return v11;
}

- (void)dealloc
{
  unsigned __int8 v3;
  id v4;
  objc_super v5;
  id v6;

  v6 = 0;
  v3 = -[SRUserAttentionController stopIfNeeded:](self, "stopIfNeeded:", &v6);
  v4 = v6;
  if ((v3 & 1) == 0 && os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    sub_10009D554();

  v5.receiver = self;
  v5.super_class = (Class)SRUserAttentionController;
  -[SRUserAttentionController dealloc](&v5, "dealloc");
}

- (BOOL)startIfNeeded:(id *)a3
{
  return -[SRUserAttentionController startIfNeededForTypes:error:](self, "startIfNeededForTypes:error:", 7, a3);
}

- (BOOL)startIfNeededForTypes:(unint64_t)a3 error:(id *)a4
{
  char v5;
  BOOL v7;

  v5 = a3;
  if ((a3 & 1) != 0 && !-[SRUserAttentionController _detectionStartedForType:](self, "_detectionStartedForType:", 1))
  {
    if (!-[SRUserAttentionController _startFaceAttentionAwarenessClient:](self, "_startFaceAttentionAwarenessClient:", a4))return 0;
    -[SRUserAttentionController _setDetectionStarted:forType:](self, "_setDetectionStarted:forType:", 1, 1);
  }
  if ((v5 & 2) != 0 && !-[SRUserAttentionController _detectionStartedForType:](self, "_detectionStartedForType:", 2))
  {
    if (!-[SRUserAttentionController _startTouchAttentionAwarenessClient:](self, "_startTouchAttentionAwarenessClient:", a4))return 0;
    -[SRUserAttentionController _setDetectionStarted:forType:](self, "_setDetectionStarted:forType:", 1, 2);
  }
  if ((v5 & 4) != 0 && !-[SRUserAttentionController _detectionStartedForType:](self, "_detectionStartedForType:", 4))
  {
    -[SRUserAttentionController _startWakeGestureManagerIfNeeded](self, "_startWakeGestureManagerIfNeeded");
    -[SRUserAttentionController _setDetectionStarted:forType:](self, "_setDetectionStarted:forType:", 1, 4);
  }
  if ((v5 & 8) != 0 && !-[SRUserAttentionController _detectionStartedForType:](self, "_detectionStartedForType:", 8))
  {
    if (-[SRUserAttentionController _startButtonPressAwarenessClient:](self, "_startButtonPressAwarenessClient:", a4))
    {
      v7 = 1;
      -[SRUserAttentionController _setDetectionStarted:forType:](self, "_setDetectionStarted:forType:", 1, 8);
      return v7;
    }
    return 0;
  }
  return 1;
}

- (BOOL)stopIfNeeded:(id *)a3
{
  return -[SRUserAttentionController stopIfNeededForTypes:error:](self, "stopIfNeededForTypes:error:", 7, a3);
}

- (BOOL)stopIfNeededForTypes:(unint64_t)a3 error:(id *)a4
{
  char v5;
  _BOOL4 v7;

  v5 = a3;
  if ((a3 & 1) != 0 && -[SRUserAttentionController _detectionStartedForType:](self, "_detectionStartedForType:", 1))
  {
    v7 = -[SRUserAttentionController _stopFaceAttentionAwarenessClient:](self, "_stopFaceAttentionAwarenessClient:", a4);
    if (!v7)
      return v7;
    -[SRUserAttentionController _setDetectionStarted:forType:](self, "_setDetectionStarted:forType:", 0, 1);
  }
  if ((v5 & 2) != 0 && -[SRUserAttentionController _detectionStartedForType:](self, "_detectionStartedForType:", 2))
  {
    v7 = -[SRUserAttentionController _stopTouchAttentionAwarenessClient:](self, "_stopTouchAttentionAwarenessClient:", a4);
    if (!v7)
      return v7;
    -[SRUserAttentionController _setDetectionStarted:forType:](self, "_setDetectionStarted:forType:", 0, 2);
  }
  if ((v5 & 4) != 0 && -[SRUserAttentionController _detectionStartedForType:](self, "_detectionStartedForType:", 4))
  {
    -[SRUserAttentionController _stopWakeGestureManagerIfNeeded](self, "_stopWakeGestureManagerIfNeeded");
    -[SRUserAttentionController _setDetectionStarted:forType:](self, "_setDetectionStarted:forType:", 0, 4);
  }
  if ((v5 & 8) == 0 || !-[SRUserAttentionController _detectionStartedForType:](self, "_detectionStartedForType:", 8))
    goto LABEL_16;
  v7 = -[SRUserAttentionController _stopButtonPressAttentionAwarenessClient:](self, "_stopButtonPressAttentionAwarenessClient:", a4);
  if (v7)
  {
    -[SRUserAttentionController _setDetectionStarted:forType:](self, "_setDetectionStarted:forType:", 0, 8);
LABEL_16:
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (BOOL)_startFaceAttentionAwarenessClient:(id *)a3
{
  AWAttentionAwarenessClient *v5;
  AWAttentionAwarenessClient *faceAttentionAwarenessClient;
  AWAttentionAwarenessClient *v7;
  OS_dispatch_queue *attentionAwarenessHandlerQueue;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;

  v5 = (AWAttentionAwarenessClient *)objc_claimAutoreleasedReturnValue(-[SRUserAttentionSignalProviderFactory faceAttentionAwarenessClient](self->_userAttentionSignalProviderFactory, "faceAttentionAwarenessClient"));
  faceAttentionAwarenessClient = self->_faceAttentionAwarenessClient;
  self->_faceAttentionAwarenessClient = v5;

  objc_initWeak(&location, self);
  v7 = self->_faceAttentionAwarenessClient;
  attentionAwarenessHandlerQueue = self->_attentionAwarenessHandlerQueue;
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_1000082C8;
  v13 = &unk_1001224A8;
  objc_copyWeak(&v14, &location);
  -[AWAttentionAwarenessClient setEventHandlerWithQueue:block:](v7, "setEventHandlerWithQueue:block:", attentionAwarenessHandlerQueue, &v10);
  LOBYTE(a3) = -[AWAttentionAwarenessClient resumeWithError:](self->_faceAttentionAwarenessClient, "resumeWithError:", a3, v10, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return (char)a3;
}

- (BOOL)_startTouchAttentionAwarenessClient:(id *)a3
{
  AWAttentionAwarenessClient *v5;
  AWAttentionAwarenessClient *touchAttentionAwarenessClient;
  AWAttentionAwarenessClient *v7;
  OS_dispatch_queue *attentionAwarenessHandlerQueue;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;

  v5 = (AWAttentionAwarenessClient *)objc_claimAutoreleasedReturnValue(-[SRUserAttentionSignalProviderFactory touchAttentionAwarenessClient](self->_userAttentionSignalProviderFactory, "touchAttentionAwarenessClient"));
  touchAttentionAwarenessClient = self->_touchAttentionAwarenessClient;
  self->_touchAttentionAwarenessClient = v5;

  objc_initWeak(&location, self);
  v7 = self->_touchAttentionAwarenessClient;
  attentionAwarenessHandlerQueue = self->_attentionAwarenessHandlerQueue;
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_100008408;
  v13 = &unk_1001224A8;
  objc_copyWeak(&v14, &location);
  -[AWAttentionAwarenessClient setEventHandlerWithQueue:block:](v7, "setEventHandlerWithQueue:block:", attentionAwarenessHandlerQueue, &v10);
  LOBYTE(a3) = -[AWAttentionAwarenessClient resumeWithError:](self->_touchAttentionAwarenessClient, "resumeWithError:", a3, v10, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return (char)a3;
}

- (BOOL)_startButtonPressAwarenessClient:(id *)a3
{
  AWAttentionAwarenessClient *v5;
  AWAttentionAwarenessClient *buttonPressAwarenessClient;
  AWAttentionAwarenessClient *v7;
  OS_dispatch_queue *attentionAwarenessHandlerQueue;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;

  v5 = (AWAttentionAwarenessClient *)objc_claimAutoreleasedReturnValue(-[SRUserAttentionSignalProviderFactory buttonPressAwarenessClient](self->_userAttentionSignalProviderFactory, "buttonPressAwarenessClient"));
  buttonPressAwarenessClient = self->_buttonPressAwarenessClient;
  self->_buttonPressAwarenessClient = v5;

  objc_initWeak(&location, self);
  v7 = self->_buttonPressAwarenessClient;
  attentionAwarenessHandlerQueue = self->_attentionAwarenessHandlerQueue;
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_100008548;
  v13 = &unk_1001224A8;
  objc_copyWeak(&v14, &location);
  -[AWAttentionAwarenessClient setEventHandlerWithQueue:block:](v7, "setEventHandlerWithQueue:block:", attentionAwarenessHandlerQueue, &v10);
  LOBYTE(a3) = -[AWAttentionAwarenessClient resumeWithError:](self->_buttonPressAwarenessClient, "resumeWithError:", a3, v10, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return (char)a3;
}

- (BOOL)_stopFaceAttentionAwarenessClient:(id *)a3
{
  unsigned __int8 v4;
  AWAttentionAwarenessClient *faceAttentionAwarenessClient;

  v4 = -[AWAttentionAwarenessClient invalidateWithError:](self->_faceAttentionAwarenessClient, "invalidateWithError:", a3);
  faceAttentionAwarenessClient = self->_faceAttentionAwarenessClient;
  self->_faceAttentionAwarenessClient = 0;

  return v4;
}

- (BOOL)_stopTouchAttentionAwarenessClient:(id *)a3
{
  unsigned __int8 v4;
  AWAttentionAwarenessClient *touchAttentionAwarenessClient;

  v4 = -[AWAttentionAwarenessClient invalidateWithError:](self->_touchAttentionAwarenessClient, "invalidateWithError:", a3);
  touchAttentionAwarenessClient = self->_touchAttentionAwarenessClient;
  self->_touchAttentionAwarenessClient = 0;

  return v4;
}

- (BOOL)_stopButtonPressAttentionAwarenessClient:(id *)a3
{
  unsigned __int8 v4;
  AWAttentionAwarenessClient *buttonPressAwarenessClient;

  v4 = -[AWAttentionAwarenessClient invalidateWithError:](self->_buttonPressAwarenessClient, "invalidateWithError:", a3);
  buttonPressAwarenessClient = self->_buttonPressAwarenessClient;
  self->_buttonPressAwarenessClient = 0;

  return v4;
}

- (BOOL)_restartFaceAttentionAwarenessClient:(id *)a3
{
  if (-[SRUserAttentionController _detectionStartedForType:](self, "_detectionStartedForType:", 1))
    return -[AWAttentionAwarenessClient resetAttentionLostTimeoutWithError:](self->_faceAttentionAwarenessClient, "resetAttentionLostTimeoutWithError:", a3);
  else
    return -[SRUserAttentionController startIfNeededForTypes:error:](self, "startIfNeededForTypes:error:", 1, a3);
}

- (void)_handleFaceAttentionEvent:(id)a3
{
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10[3];
  id location;

  v4 = (unint64_t)objc_msgSend(a3, "eventMask");
  if (-[SRUserAttentionController _isDeviceLowered](self, "_isDeviceLowered"))
  {
    v5 = 0;
    v6 = 2;
  }
  else
  {
    v7 = 1;
    v8 = 3;
    if ((v4 & 8) == 0)
      v8 = (v4 >> 7) & 4;
    if ((v4 & 0x80) == 0)
      v7 = v8;
    v6 = (v4 & 1) != 0;
    if ((v4 & 1) != 0)
      v5 = 0;
    else
      v5 = (void *)v7;
  }
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100008780;
  v9[3] = &unk_1001224D0;
  v10[1] = (id)v6;
  objc_copyWeak(v10, &location);
  v10[2] = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

- (void)_handleTouchAttentionEvent:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7[3];
  id location;

  v4 = (unint64_t)objc_msgSend(a3, "eventMask");
  if ((v4 & 8) != 0)
    v5 = 3;
  else
    v5 = (v4 >> 7) & 4;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100008904;
  v6[3] = &unk_1001224D0;
  v7[1] = 0;
  objc_copyWeak(v7, &location);
  v7[2] = (id)v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)_handleButtonPressAttentionEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9[2];
  id location;

  v4 = a3;
  v5 = (void *)(((uint64_t)((_QWORD)objc_msgSend(v4, "eventMask") << 62) >> 63) & 5);
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008AA0;
  v7[3] = &unk_1001224F8;
  v9[1] = v5;
  objc_copyWeak(v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)_startWakeGestureManagerIfNeeded
{
  CMWakeGestureManager *v3;
  CMWakeGestureManager *wakeGestureManager;

  if (!-[SRUserAttentionController _deviceSupportsFaceDetection](self, "_deviceSupportsFaceDetection")
    && self->_deviceSupportsRaiseGestureDetection)
  {
    v3 = (CMWakeGestureManager *)objc_claimAutoreleasedReturnValue(-[SRUserAttentionSignalProviderFactory wakeGestureManager](self->_userAttentionSignalProviderFactory, "wakeGestureManager"));
    wakeGestureManager = self->_wakeGestureManager;
    self->_wakeGestureManager = v3;

    -[CMWakeGestureManager setDelegate:](self->_wakeGestureManager, "setDelegate:", self);
    -[CMWakeGestureManager startWakeGestureUpdates](self->_wakeGestureManager, "startWakeGestureUpdates");
  }
}

- (void)_stopWakeGestureManagerIfNeeded
{
  CMWakeGestureManager *wakeGestureManager;

  if (!-[SRUserAttentionController _deviceSupportsFaceDetection](self, "_deviceSupportsFaceDetection")
    && self->_deviceSupportsRaiseGestureDetection)
  {
    -[CMWakeGestureManager stopWakeGestureUpdates](self->_wakeGestureManager, "stopWakeGestureUpdates");
    -[CMWakeGestureManager setDelegate:](self->_wakeGestureManager, "setDelegate:", 0);
    wakeGestureManager = self->_wakeGestureManager;
    self->_wakeGestureManager = 0;

  }
}

- (void)wakeGestureManager:(id)a3 didUpdateWakeGesture:(int64_t)a4
{
  _QWORD block[4];
  id v6[2];
  id location;

  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008CB8;
  block[3] = &unk_100122520;
  v6[1] = (id)a4;
  objc_copyWeak(v6, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

- (BOOL)_detectionStartedForType:(unint64_t)a3
{
  NSMutableDictionary *attentionDetectionStatuses;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  attentionDetectionStatuses = self->_attentionDetectionStatuses;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](attentionDetectionStatuses, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)_setDetectionStarted:(BOOL)a3 forType:(unint64_t)a4
{
  _BOOL8 v5;
  NSMutableDictionary *attentionDetectionStatuses;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;

  v5 = a3;
  attentionDetectionStatuses = self->_attentionDetectionStatuses;
  if (attentionDetectionStatuses)
    v8 = attentionDetectionStatuses;
  else
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v9 = self->_attentionDetectionStatuses;
  self->_attentionDetectionStatuses = v8;

  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
  v10 = self->_attentionDetectionStatuses;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v12, v11);

}

- (BOOL)_deviceSupportsFaceDetection
{
  return LOBYTE(self->_supportedAttentionAwarenessEvents) >> 7;
}

- (SRUserAttentionControllerDelegate)delegate
{
  return (SRUserAttentionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)_isDeviceLowered
{
  return self->_deviceLowered;
}

- (void)_setDeviceLowered:(BOOL)a3
{
  self->_deviceLowered = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_asynchronousCallQueue, 0);
  objc_storeStrong((id *)&self->_attentionDetectionStatuses, 0);
  objc_storeStrong((id *)&self->_attentionAwarenessHandlerQueue, 0);
  objc_storeStrong((id *)&self->_wakeGestureManager, 0);
  objc_storeStrong((id *)&self->_buttonPressAwarenessClient, 0);
  objc_storeStrong((id *)&self->_touchAttentionAwarenessClient, 0);
  objc_storeStrong((id *)&self->_faceAttentionAwarenessClient, 0);
  objc_storeStrong((id *)&self->_userAttentionSignalProviderFactory, 0);
}

- (void)startIfNeededForTypes:(unint64_t)a3 completionQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  OS_dispatch_queue *v11;
  OS_dispatch_queue *asynchronousCallQueue;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17[2];
  id location;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v8 && v9)
  {
    if (!self->_asynchronousCallQueue)
    {
      v11 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.siri.SRUserAttentionControllerQueue", 0);
      asynchronousCallQueue = self->_asynchronousCallQueue;
      self->_asynchronousCallQueue = v11;

    }
    objc_initWeak(&location, self);
    v13 = self->_asynchronousCallQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009110;
    block[3] = &unk_100122570;
    objc_copyWeak(v17, &location);
    v17[1] = (id)a3;
    v15 = v8;
    v16 = v10;
    dispatch_async(v13, block);

    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }

}

@end
