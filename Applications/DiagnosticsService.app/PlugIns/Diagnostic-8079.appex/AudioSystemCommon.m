@implementation AudioSystemCommon

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  NSString *v20;
  void *v21;
  void *v22;
  id v23;
  uint8_t buf[8];
  NSErrorUserInfoKey v25;
  const __CFString *v26;

  v6 = a4;
  -[AudioSystemCommon setInputs:](self, "setInputs:", a3);
  -[AudioSystemCommon setPreviousAudioChanged:](self, "setPreviousAudioChanged:", 0);
  -[AudioSystemCommon setDiagnosticResponder:](self, "setDiagnosticResponder:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
  if (objc_msgSend(v7, "isOtherAudioPlaying"))
  {
    v8 = -[AudioSystemCommon isSoundRecognitionRequired](self, "isSoundRecognitionRequired");

    if ((v8 & 1) == 0)
    {
      v9 = DiagnosticLogHandleForCategory(3);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Background audio is playing at the start of this test", buf, 2u);
      }

      v25 = NSLocalizedDescriptionKey;
      v26 = CFSTR("Audio is already playing in the background at the start of the test.");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
      v12 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DAAudioQualityErrorDomain"), -56, v11));

      goto LABEL_13;
    }
  }
  else
  {

  }
  v13 = (void *)MGCopyAnswer(CFSTR("DeviceName"), 0);
  -[AudioSystemCommon setDeviceName:](self, "setDeviceName:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon deviceName](self, "deviceName"));
  -[AudioSystemCommon setIsDeviceiPhone:](self, "setIsDeviceiPhone:", objc_msgSend(v14, "isEqualToString:", CFSTR("iPhone")));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon deviceName](self, "deviceName"));
  -[AudioSystemCommon setIsDeviceiPod:](self, "setIsDeviceiPod:", objc_msgSend(v15, "isEqualToString:", CFSTR("iPod touch")));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon deviceName](self, "deviceName"));
  -[AudioSystemCommon setIsDeviceiPad:](self, "setIsDeviceiPad:", objc_msgSend(v16, "isEqualToString:", CFSTR("iPad")));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon deviceName](self, "deviceName"));
  -[AudioSystemCommon setIsDeviceWatch:](self, "setIsDeviceWatch:", objc_msgSend(v17, "isEqualToString:", CFSTR("Apple Watch")));

  if (!-[AudioSystemCommon isDeviceiPhone](self, "isDeviceiPhone")
    && !-[AudioSystemCommon isDeviceiPod](self, "isDeviceiPod")
    && !-[AudioSystemCommon isDeviceiPad](self, "isDeviceiPad"))
  {
LABEL_16:
    v20 = NSTemporaryDirectory();
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v21, 1));
    -[AudioSystemCommon setTmpdir:](self, "setTmpdir:", v22);

    -[AudioSystemCommon downloadFilesWithResponder:](self, "downloadFilesWithResponder:", v6);
    goto LABEL_17;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon inputs](self, "inputs"));
  if (!objc_msgSend(v18, "isAccessoryDetectorActive"))
  {

    goto LABEL_15;
  }
  v19 = -[AudioSystemCommon isDeviceConnectedToAccessory](self, "isDeviceConnectedToAccessory");

  if ((v19 & 1) != 0)
  {
LABEL_15:
    -[AudioSystemCommon setAccessibilityStateIfRequired](self, "setAccessibilityStateIfRequired");
    objc_msgSend(v6, "enableVolumeHUD:", 0);
    goto LABEL_16;
  }
  v23 = 0;
  +[AudioSystemCommon setCode:forError:](AudioSystemCommon, "setCode:forError:", -52, &v23);
  v12 = v23;
LABEL_13:
  -[AudioSystemCommon failedToExecuteWithError:](self, "failedToExecuteWithError:", v12);
  -[AudioSystemCommon setFinished:](self, "setFinished:", 1);

LABEL_17:
}

- (void)start
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  _QWORD block[5];

  -[AudioSystemCommon setInternalInstall:](self, "setInternalInstall:", MGGetBoolAnswer(CFSTR("apple-internal-install"), a2));
  v3 = objc_alloc_init(-[AudioSystemCommon avAudioDeviceTestClass](self, "avAudioDeviceTestClass"));
  -[AudioSystemCommon setAudioTest:](self, "setAudioTest:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon audioTest](self, "audioTest"));
  objc_msgSend(v4, "setProcessSequenceAsynchronously:", 1);

  if (-[AudioSystemCommon internalInstall](self, "internalInstall"))
  {
    v5 = objc_alloc_init((Class)NSMutableArray);
    -[AudioSystemCommon setRawRecordings:](self, "setRawRecordings:", v5);

  }
  if (-[AudioSystemCommon isDeviceiPhone](self, "isDeviceiPhone")
    || -[AudioSystemCommon isDeviceiPod](self, "isDeviceiPod")
    || -[AudioSystemCommon isDeviceiPad](self, "isDeviceiPad")
    || -[AudioSystemCommon isDeviceWatch](self, "isDeviceWatch"))
  {
    -[AudioSystemCommon setUpEventNotifications](self, "setUpEventNotifications");
  }
  -[AudioSystemCommon saveOriginalVolumes](self, "saveOriginalVolumes");
  v6 = dispatch_queue_create("com.apple.DiagnosticsService.Diagnostic-8079.audioQueue", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000060B0;
  block[3] = &unk_1000104B8;
  block[4] = self;
  dispatch_async(v6, block);

}

- (void)teardown
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
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[AudioSystemCommon restoreAccesibilityStateIfRequired](self, "restoreAccesibilityStateIfRequired");
  -[AudioSystemCommon restoreOriginalVolumes](self, "restoreOriginalVolumes");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon inputs](self, "inputs"));
  v4 = objc_msgSend(v3, "isMotionDetectorActive");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon motionDetector](self, "motionDetector"));
    objc_msgSend(v5, "stop");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon inputs](self, "inputs"));
  v7 = objc_msgSend(v6, "isAccessoryDetectorActive");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon accessoryDisconnectDetector](self, "accessoryDisconnectDetector"));
    objc_msgSend(v8, "stop");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon inputs](self, "inputs"));
  v10 = objc_msgSend(v9, "isHeadphonesDetectorActive");

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon headphoneDetector](self, "headphoneDetector"));
    objc_msgSend(v11, "stop");

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon inputs](self, "inputs"));
  v13 = objc_msgSend(v12, "isOrientationDetectorActive");

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon orientationDetector](self, "orientationDetector"));
    objc_msgSend(v14, "stop");

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v15, "removeObserver:", self);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon diagnosticResponder](self, "diagnosticResponder"));
  objc_msgSend(v16, "enableVolumeHUD:", 1);

  v17 = (id)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon audioTest](self, "audioTest"));
  objc_msgSend(v17, "cancel");

}

- (void)cancel
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon audioTest](self, "audioTest"));
  objc_msgSend(v2, "cancel");

}

- (void)failedToExecuteWithError:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  int64_t *p_failedToExecuteOnceToken;
  int64_t failedToExecuteOnceToken;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;

  v4 = a3;
  v5 = DiagnosticLogHandleForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "failedToExecuteWithError called for error %@", buf, 0xCu);
  }

  p_failedToExecuteOnceToken = &self->_failedToExecuteOnceToken;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100006B88;
  v10[3] = &unk_1000104E0;
  v10[4] = self;
  v11 = v4;
  failedToExecuteOnceToken = self->_failedToExecuteOnceToken;
  v9 = v4;
  if (failedToExecuteOnceToken != -1)
    dispatch_once(p_failedToExecuteOnceToken, v10);

}

- (void)setUpEventNotifications
{
  void *v3;
  unsigned int v4;
  void *v5;
  DAMotionDetector *v6;
  void *v7;
  void *v8;
  DAMotionDetector *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  DAOrientationDetector *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  DAOrientationDetector *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  DAAccessoryDisconnectDetector *v24;
  void *v25;
  void *v26;
  DAAccessoryDisconnectDetector *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  DAHeadphonesDetector *v32;
  id v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon inputs](self, "inputs"));
  v4 = objc_msgSend(v3, "isMotionDetectorActive");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", self, "receivedInterruptNotification:", CFSTR("MotionDetectedNotification"), 0);

    v6 = [DAMotionDetector alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon inputs](self, "inputs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "motionDetectorThreshold"));
    v9 = -[DAMotionDetector initWithThreshold:](v6, "initWithThreshold:", v8);
    -[AudioSystemCommon setMotionDetector:](self, "setMotionDetector:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon motionDetector](self, "motionDetector"));
    objc_msgSend(v10, "start");

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon inputs](self, "inputs"));
  v12 = objc_msgSend(v11, "isOrientationDetectorActive");

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "addObserver:selector:name:object:", self, "receivedInterruptNotification:", CFSTR("IncorrectOrientationNotification"), 0);

    v14 = [DAOrientationDetector alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon inputs](self, "inputs"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "orientationDetectorXThreshold"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon inputs](self, "inputs"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "orientationDetectorZThreshold"));
    v19 = -[DAOrientationDetector initWithxThreshold:zThreshold:](v14, "initWithxThreshold:zThreshold:", v16, v18);
    -[AudioSystemCommon setOrientationDetector:](self, "setOrientationDetector:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon orientationDetector](self, "orientationDetector"));
    objc_msgSend(v20, "start");

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon inputs](self, "inputs"));
  v22 = objc_msgSend(v21, "isAccessoryDetectorActive");

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v23, "addObserver:selector:name:object:", self, "receivedInterruptNotification:", CFSTR("AccessoryDisconnectedNotification"), 0);

    v24 = [DAAccessoryDisconnectDetector alloc];
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon inputs](self, "inputs"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "accessoryDetectorModelNumbers"));
    v27 = -[DAAccessoryDisconnectDetector initWithModelNumbers:](v24, "initWithModelNumbers:", v26);
    -[AudioSystemCommon setAccessoryDisconnectDetector:](self, "setAccessoryDisconnectDetector:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon accessoryDisconnectDetector](self, "accessoryDisconnectDetector"));
    objc_msgSend(v28, "start");

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon inputs](self, "inputs"));
  v30 = objc_msgSend(v29, "isHeadphonesDetectorActive");

  if (v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v31, "addObserver:selector:name:object:", self, "receivedInterruptNotification:", CFSTR("HeadphonesConnectedNotification"), 0);

    v32 = objc_alloc_init(DAHeadphonesDetector);
    -[AudioSystemCommon setHeadphoneDetector:](self, "setHeadphoneDetector:", v32);

    v33 = (id)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon headphoneDetector](self, "headphoneDetector"));
    objc_msgSend(v33, "start");

  }
}

- (void)receivedInterruptNotification:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  id *v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  void *v16;
  unsigned int v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  id v24;

  v4 = a3;
  v5 = DiagnosticLogHandleForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Recieved interrupt notification %@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("MotionDetectedNotification"));

  if (v8)
  {
    v22 = 0;
    v9 = (id *)&v22;
    v10 = &v22;
    v11 = -53;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("IncorrectOrientationNotification"));

    if (v13)
    {
      v21 = 0;
      v9 = (id *)&v21;
      v10 = &v21;
      v11 = -61;
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("AccessoryDisconnectedNotification"));

      if (v15)
      {
        v20 = 0;
        v9 = (id *)&v20;
        v10 = &v20;
        v11 = -52;
      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("HeadphonesConnectedNotification"));

        if (!v17)
        {
          v18 = 0;
          goto LABEL_12;
        }
        v19 = 0;
        v9 = (id *)&v19;
        v10 = &v19;
        v11 = -54;
      }
    }
  }
  +[AudioSystemCommon setCode:forError:](AudioSystemCommon, "setCode:forError:", v11, v10, v19, v20, v21, v22);
  v18 = *v9;
LABEL_12:
  -[AudioSystemCommon failedToExecuteWithError:](self, "failedToExecuteWithError:", v18);

}

- (BOOL)isDeviceConnectedToAccessory
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  char v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectedAccessories"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon inputs](self, "inputs"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accessoryDetectorModelNumbers"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "modelNumber"));
        v14 = objc_msgSend(v12, "containsObject:", v13);

        v7 |= v14;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7 & 1;
}

+ (BOOL)setCode:(int64_t)a3 forError:(id *)a4
{
  if (a4)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DAAudioQualityErrorDomain"), a3, 0));
  return a4 != 0;
}

- (void)downloadFilesWithResponder:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  dispatch_time_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  unsigned int v22;
  id v23;
  void *v24;
  int v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  __int128 v31;
  id obj;
  id v33;
  dispatch_semaphore_t v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  NSObject *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  _BYTE v55[128];

  v33 = a3;
  -[AudioSystemCommon deleteTemporaryFiles](self, "deleteTemporaryFiles");
  v34 = dispatch_semaphore_create(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[AudioSystemCommon setFileNameToURL:](self, "setFileNameToURL:", v4);

  v49 = 0u;
  v50 = 0u;
  v48 = 0u;
  v47 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon inputs](self, "inputs"));
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sources"));

  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v6)
  {
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v48;
    *(_QWORD *)&v7 = 138412546;
    v31 = v7;
    while (2)
    {
      v11 = 0;
      v12 = v8;
      do
      {
        if (*(_QWORD *)v48 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v11);
        if ((-[AudioSystemCommon isCancelled](self, "isCancelled", v31) & 1) != 0)
        {
          v8 = v12;
          goto LABEL_24;
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon tmpdir](self, "tmpdir"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "URLByAppendingPathComponent:", v13));

        v41 = 0;
        v42 = &v41;
        v43 = 0x3032000000;
        v44 = sub_100007890;
        v45 = sub_1000078A0;
        v46 = 0;
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_1000078A8;
        v38[3] = &unk_100010508;
        v40 = &v41;
        v15 = v34;
        v39 = v15;
        objc_msgSend(v33, "getAsset:completion:", v13, v38);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon inputs](self, "inputs"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fileDownloadTimeout"));
        v18 = dispatch_time(0, 1000000000 * (_QWORD)objc_msgSend(v17, "unsignedLongValue"));
        dispatch_semaphore_wait(v15, v18);

        if (v42[5])
        {
          v19 = DiagnosticLogHandleForCategory(3);
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v52 = v8;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Saving asset data to [%@]", buf, 0xCu);
          }

          v21 = (void *)v42[5];
          v37 = v9;
          v22 = objc_msgSend(v21, "writeToURL:options:error:", v8, 268435457, &v37);
          v23 = v37;

          if (v22)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon fileNameToURL](self, "fileNameToURL"));
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v8, v13);

            v25 = 1;
            v9 = v23;
          }
          else
          {
            v29 = DiagnosticLogHandleForCategory(3);
            v30 = objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v31;
              v52 = v8;
              v53 = 2112;
              v54 = v23;
              _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to save asset [%@]: %@", buf, 0x16u);
            }

            v36 = v23;
            +[AudioSystemCommon setCode:forError:](AudioSystemCommon, "setCode:forError:", -59, &v36);
            v9 = v36;

            -[AudioSystemCommon failedToExecuteWithError:](self, "failedToExecuteWithError:", v9);
            -[AudioSystemCommon setFinished:](self, "setFinished:", 1);
            v25 = 0;
          }
        }
        else
        {
          v26 = DiagnosticLogHandleForCategory(3);
          v27 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v52 = v13;
            _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to download asset: %@", buf, 0xCu);
          }

          v35 = v9;
          +[AudioSystemCommon setCode:forError:](AudioSystemCommon, "setCode:forError:", -1, &v35);
          v28 = v35;

          -[AudioSystemCommon failedToExecuteWithError:](self, "failedToExecuteWithError:", v28);
          -[AudioSystemCommon setFinished:](self, "setFinished:", 1);
          v25 = 0;
          v9 = v28;
        }

        _Block_object_dispose(&v41, 8);
        if (!v25)
          goto LABEL_24;
        v11 = (char *)v11 + 1;
        v12 = v8;
      }
      while (v6 != v11);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      if (v6)
        continue;
      break;
    }
LABEL_24:

  }
  else
  {
    v9 = 0;
  }

}

- (void)deleteTemporaryFiles
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  uint8_t v29[4];
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon tmpdir](self, "tmpdir"));
  v28 = 0;
  v22 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, &__NSArray0__struct, 0, &v28));
  v6 = v28;

  if (v6)
  {
    v7 = DiagnosticLogHandleForCategory(3);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100009804(v6, v8);

  }
  v21 = v6;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "path"));
        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          v23 = 0;
          objc_msgSend(v16, "removeItemAtPath:error:", v15, &v23);
          v17 = v23;

          if (v17)
          {
            v18 = DiagnosticLogHandleForCategory(3);
            v19 = objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              sub_100009790(v29, v17, &v30, v19);

          }
        }
        else
        {
          v20 = DiagnosticLogHandleForCategory(3);
          v17 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v32 = v14;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Temporary file %@ does not have a path we can use to clear it. Skipping.", buf, 0xCu);
          }
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v11);
  }

}

- (void)testSequence:(id)a3 completionSemaphore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "outputs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon inputs](self, "inputs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sources"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "source"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v12, "integerValue")));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon createNewTestSequenceWithOutput:andStimulusFile:](self, "createNewTestSequenceWithOutput:andStimulusFile:", v9, v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon audioTest](self, "audioTest"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100007D28;
  v21[3] = &unk_100010530;
  v21[4] = self;
  v22 = v14;
  v23 = v7;
  v24 = v9;
  v25 = v13;
  v26 = v6;
  v16 = v6;
  v17 = v13;
  v18 = v9;
  v19 = v7;
  v20 = v14;
  objc_msgSend(v15, "startWithSequence:completion:", v20, v21);

}

- (id)pathToSoundFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon fileNameToURL](self, "fileNameToURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (void)parseTestResults:(id)a3 fromOutput:(id)a4 withFile:(id)a5 parsedResults:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  const NSNotificationName **v17;
  void *i;
  void *v19;
  NSNotificationName *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  uint64_t v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  AudioSystemCommon *v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  NSErrorUserInfoKey v65;
  const __CFString *v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  id v70;
  NSErrorUserInfoKey v71;
  const __CFString *v72;
  _BYTE v73[128];

  v12 = a3;
  v57 = a4;
  v13 = a5;
  v55 = a6;
  v14 = a7;
  v59 = self;
  v56 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon pathToSoundFile:](self, "pathToSoundFile:", v13));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "absoluteString"));

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v16 = v12;
  v53 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
  if (!v53)
    goto LABEL_34;
  v54 = *(_QWORD *)v62;
  v17 = &AVAudioSessionInterruptionNotification_ptr;
  v51 = v16;
  while (2)
  {
    for (i = 0; i != v53; i = (char *)i + 1)
    {
      if (*(_QWORD *)v62 != v54)
        objc_enumerationMutation(v16);
      v19 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
      v20 = (NSNotificationName *)v17[35];
      objc_msgSend(v19, "sampleRate");
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSNotificationName numberWithDouble:](v20, "numberWithDouble:"));
      v60 = v14;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[AudioCrossCorrelation convertWAVtoNSDataWithFileStringURL:withSampleRate:error:](AudioCrossCorrelation, "convertWAVtoNSDataWithFileStringURL:withSampleRate:error:", v58, v21, &v60));
      v23 = v60;

      if (!v22)
      {
        if (v23)
        {
          if (objc_msgSend(v23, "code") == (id)-70)
          {
            v45 = DiagnosticLogHandleForCategory(3);
            v46 = objc_claimAutoreleasedReturnValue(v45);
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              sub_1000099B8((uint64_t)v56, v57, v46);

          }
        }
        else
        {
          v23 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DAAudioQualityErrorDomain"), -66, 0));
        }
        -[AudioSystemCommon failedToExecuteWithError:](v59, "failedToExecuteWithError:", v23);
        goto LABEL_33;
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon inputs](v59, "inputs"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "inputValueToName"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSNotificationName numberWithInteger:]((id)v17[35], "numberWithInteger:", objc_msgSend(v19, "inputID")));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKey:", v26));

      if (!v27)
      {
        v47 = DiagnosticLogHandleForCategory(3);
        v48 = objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          sub_100009A68(v19, v48);

        v71 = NSLocalizedDescriptionKey;
        v72 = CFSTR("Name missing for current microphone.");
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1));
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DAAudioQualityErrorDomain"), -68, v49));

        -[AudioSystemCommon failedToExecuteWithError:](v59, "failedToExecuteWithError:", v50);
LABEL_33:
        v14 = v23;
        goto LABEL_34;
      }
      v28 = objc_alloc_init(-[AudioSystemCommon audioSystemResultClass](v59, "audioSystemResultClass"));
      objc_msgSend(v28, "setInput:", v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "outputDevice"));
      objc_msgSend(v28, "setOutput:", v29);

      objc_msgSend(v28, "setSource:", v56);
      -[AudioSystemCommon performAnalysisOnAVResult:fromOutput:withSourceSignalData:intoDKResult:error:](v59, "performAnalysisOnAVResult:fromOutput:withSourceSignalData:intoDKResult:error:", v19, v57, v22, v28, v23);
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "dictionaryValue"));
      objc_msgSend(v55, "addObject:", v30);

      if (-[AudioSystemCommon internalInstall](v59, "internalInstall")
        && (v31 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon inputs](v59, "inputs")),
            v32 = objc_msgSend(v31, "saveRawRecording"),
            v31,
            v32))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "output"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "source"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringByAppendingFormat:", CFSTR("Mic-%@Speaker-File%@"), v33, v34));

        if ((objc_msgSend(v35, "containsString:", CFSTR(".wav")) & 1) == 0)
        {
          v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "stringByAppendingString:", CFSTR(".wav")));

          v35 = (void *)v36;
        }
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon tmpdir](v59, "tmpdir"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "URLByAppendingPathComponent:", v35));

        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "data"));
        +[AudioCrossCorrelation convertNSDataToWAV:atURL:error:](AudioCrossCorrelation, "convertNSDataToWAV:atURL:error:", v39, v38, v23);

        v40 = v23 == 0;
        if (v23)
        {
          v52 = v38;
          v41 = DiagnosticLogHandleForCategory(3);
          v42 = objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v68 = v38;
            v69 = 2112;
            v70 = v23;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "ERROR save recording data [%@]: %@", buf, 0x16u);
          }

          v65 = NSLocalizedDescriptionKey;
          v66 = CFSTR("Failed to save recording data.");
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1));
          v14 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DAAudioQualityErrorDomain"), -60, v43));

          -[AudioSystemCommon failedToExecuteWithError:](v59, "failedToExecuteWithError:", v14);
          v38 = v52;
        }
        else
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon rawRecordings](v59, "rawRecordings"));
          objc_msgSend(v44, "addObject:", v38);

          v14 = 0;
        }

        v16 = v51;
      }
      else
      {
        v40 = 1;
        v14 = v23;
      }

      if (!v40)
        goto LABEL_34;
      v17 = &AVAudioSessionInterruptionNotification_ptr;
    }
    v53 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
    if (v53)
      continue;
    break;
  }
LABEL_34:

}

- (void)performAnalysisOnAVResult:(id)a3 fromOutput:(id)a4 withSourceSignalData:(id)a5 intoDKResult:(id)a6 error:(id)a7
{
  uint64_t v7;
  NSObject *v8;

  v7 = DiagnosticLogHandleForCategory(3);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    sub_100009ADC(v8);

}

- (id)createNewTestSequenceWithOutput:(id)a3 andStimulusFile:(id)a4
{
  id v6;
  id v7;
  id v8;
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
  void *v22;
  unsigned int v23;
  const AVAudioSessionMode *v24;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(-[AudioSystemCommon avAudioDeviceTestSequenceClass](self, "avAudioDeviceTestSequenceClass"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon inputs](self, "inputs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "outputSpecifications"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "outputDevice"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "channel"));
  objc_msgSend(v8, "setOutputID:", objc_msgSend(v13, "integerValue"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "volume"));
  objc_msgSend(v14, "floatValue");
  objc_msgSend(v8, "setVolume:");

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon pathToSoundFile:](self, "pathToSoundFile:", v6));
  objc_msgSend(v8, "setStimulusURL:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon inputs](self, "inputs"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "outputSpecifications"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "outputDevice"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v18));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "mode"));
  objc_msgSend(v8, "setOutputMode:", objc_msgSend(v20, "integerValue"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon inputs](self, "inputs"));
  objc_msgSend(v8, "setCalculateCrossCorrelationPeak:", objc_msgSend(v21, "isUsingDBValuesFromSystem"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon inputs](self, "inputs"));
  v23 = objc_msgSend(v22, "isUsingMeasurementMode");
  v24 = &AVAudioSessionModeMeasurement;
  if (!v23)
    v24 = (const AVAudioSessionMode *)&AVAudioSessionModeRaw;
  objc_msgSend(v8, "setMode:", *v24);

  objc_msgSend(v8, "setParallelCrossCorrelationCalculation:", objc_msgSend(v8, "calculateCrossCorrelationPeak"));
  return v8;
}

- (void)testFinishedSuccessfully
{
  -[AudioSystemCommon setFinished:](self, "setFinished:", 1);
}

- (Class)audioSystemResultClass
{
  return (Class)objc_opt_class(AudioSystemResult, a2);
}

- (Class)avAudioDeviceTestClass
{
  return (Class)objc_opt_class(AVAudioDeviceTest, a2);
}

- (Class)avAudioDeviceTestSequenceClass
{
  return (Class)objc_opt_class(AVAudioDeviceTestSequence, a2);
}

- (void)restoreAccesibilityStateIfRequired
{
  void *v3;
  id v4;

  if (-[AudioSystemCommon monoChanged](self, "monoChanged"))
    _AXSMonoAudioSetEnabled(-[AudioSystemCommon isOriginallyMono](self, "isOriginallyMono"));
  if (-[AudioSystemCommon balanceChanged](self, "balanceChanged"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemCommon originalBalance](self, "originalBalance"));
    _AXSSetLeftRightAudioBalance(objc_msgSend(v3, "floatValue"));

  }
  if (-[AudioSystemCommon soundRecognitionChanged](self, "soundRecognitionChanged"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[AXSDSettings sharedInstance](AXSDSettings, "sharedInstance"));
    objc_msgSend(v4, "setSoundDetectionState:", -[AudioSystemCommon systemSoundDetectionState](self, "systemSoundDetectionState"));

  }
}

- (BOOL)isMonoChangeRequired
{
  return _AXSMonoAudioEnabled(self, a2) != 0;
}

- (BOOL)isBalanceChangeRequired
{
  return _AXSLeftRightAudioBalance(self, a2) != 0.0;
}

- (BOOL)isSoundRecognitionRequired
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSDSettings sharedInstance](AXSDSettings, "sharedInstance"));
  v3 = objc_msgSend(v2, "soundDetectionEnabled");

  return v3;
}

- (BOOL)soundRecognitionChanged
{
  return -[AudioSystemCommon systemSoundDetectionState](self, "systemSoundDetectionState") != 0;
}

- (void)setAccessibilityStateIfRequired
{
  id v3;
  uint64_t v4;
  double v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[AudioSystemCommon setMonoChanged:](self, "setMonoChanged:", 0);
  -[AudioSystemCommon setBalanceChanged:](self, "setBalanceChanged:", 0);
  if (-[AudioSystemCommon isMonoChangeRequired](self, "isMonoChangeRequired"))
  {
    -[AudioSystemCommon setIsOriginallyMono:](self, "setIsOriginallyMono:", 1);
    _AXSMonoAudioSetEnabled(0);
    -[AudioSystemCommon setMonoChanged:](self, "setMonoChanged:", 1);
  }
  if (-[AudioSystemCommon isBalanceChangeRequired](self, "isBalanceChangeRequired"))
  {
    v3 = objc_alloc((Class)NSNumber);
    *(float *)&v5 = _AXSLeftRightAudioBalance(v3, v4);
    v6 = objc_msgSend(v3, "initWithFloat:", v5);
    -[AudioSystemCommon setOriginalBalance:](self, "setOriginalBalance:", v6);

    _AXSSetLeftRightAudioBalance(v7);
    -[AudioSystemCommon setBalanceChanged:](self, "setBalanceChanged:", 1);
  }
  if (-[AudioSystemCommon isSoundRecognitionRequired](self, "isSoundRecognitionRequired"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSDSettings sharedInstance](AXSDSettings, "sharedInstance"));
    -[AudioSystemCommon setSystemSoundDetectionState:](self, "setSystemSoundDetectionState:", objc_msgSend(v8, "soundDetectionState"));

    v9 = (id)objc_claimAutoreleasedReturnValue(+[AXSDSettings sharedInstance](AXSDSettings, "sharedInstance"));
    objc_msgSend(v9, "setSoundDetectionState:", 0);

  }
}

- (void)saveOriginalVolumes
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  NSObject *v8;
  float v9;
  double v10;
  float v11;
  uint64_t v12;
  uint8_t buf[4];
  double v14;
  __int16 v15;
  double v16;

  v12 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
  objc_msgSend(v3, "getVolume:forCategory:", (char *)&v12 + 4, CFSTR("PlayAndRecord"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
  objc_msgSend(v4, "getVolume:forCategory:", &v12, CFSTR("Audio/Video"));

  LODWORD(v5) = HIDWORD(v12);
  -[AudioSystemCommon setPreviousDeviceVolumePlayAndRecord:](self, "setPreviousDeviceVolumePlayAndRecord:", v5);
  LODWORD(v6) = v12;
  -[AudioSystemCommon setPreviousDeviceVolumeAudioVideo:](self, "setPreviousDeviceVolumeAudioVideo:", v6);
  -[AudioSystemCommon setPreviousAudioChanged:](self, "setPreviousAudioChanged:", 1);
  v7 = DiagnosticLogHandleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[AudioSystemCommon previousDeviceVolumePlayAndRecord](self, "previousDeviceVolumePlayAndRecord");
    v10 = v9;
    -[AudioSystemCommon previousDeviceVolumeAudioVideo](self, "previousDeviceVolumeAudioVideo");
    *(_DWORD *)buf = 134218240;
    v14 = v10;
    v15 = 2048;
    v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Save original volumes previousDeviceVolumePlayAndRecord:%f, previousDeviceVolumeAudioVideo:%f", buf, 0x16u);
  }

}

- (void)restoreOriginalVolumes
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  float v7;
  double v8;
  float v9;
  int v10;
  double v11;
  __int16 v12;
  double v13;

  if (-[AudioSystemCommon previousAudioChanged](self, "previousAudioChanged"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
    -[AudioSystemCommon previousDeviceVolumePlayAndRecord](self, "previousDeviceVolumePlayAndRecord");
    objc_msgSend(v3, "setVolumeTo:forCategory:", CFSTR("PlayAndRecord"));

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
    -[AudioSystemCommon previousDeviceVolumeAudioVideo](self, "previousDeviceVolumeAudioVideo");
    objc_msgSend(v4, "setVolumeTo:forCategory:", CFSTR("Audio/Video"));

    v5 = DiagnosticLogHandleForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[AudioSystemCommon previousDeviceVolumePlayAndRecord](self, "previousDeviceVolumePlayAndRecord");
      v8 = v7;
      -[AudioSystemCommon previousDeviceVolumeAudioVideo](self, "previousDeviceVolumeAudioVideo");
      v10 = 134218240;
      v11 = v8;
      v12 = 2048;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Restore original volumes to previousDeviceVolumePlayAndRecord:%f, previousDeviceVolumeAudioVideo:%f", (uint8_t *)&v10, 0x16u);
    }

  }
}

- (DKResponder)diagnosticResponder
{
  return self->_diagnosticResponder;
}

- (void)setDiagnosticResponder:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticResponder, a3);
}

- (AudioSystemInputsCommon)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->_inputs, a3);
}

- (NSMutableDictionary)fileNameToURL
{
  return self->_fileNameToURL;
}

- (void)setFileNameToURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileNameToURL, a3);
}

- (BOOL)testFailed
{
  return self->_testFailed;
}

- (void)setTestFailed:(BOOL)a3
{
  self->_testFailed = a3;
}

- (NSURL)tmpdir
{
  return self->_tmpdir;
}

- (void)setTmpdir:(id)a3
{
  objc_storeStrong((id *)&self->_tmpdir, a3);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (NSMutableArray)audioSystemResults
{
  return self->_audioSystemResults;
}

- (void)setAudioSystemResults:(id)a3
{
  objc_storeStrong((id *)&self->_audioSystemResults, a3);
}

- (NSMutableArray)rawRecordings
{
  return self->_rawRecordings;
}

- (void)setRawRecordings:(id)a3
{
  objc_storeStrong((id *)&self->_rawRecordings, a3);
}

- (AVAudioDeviceTest)audioTest
{
  return self->_audioTest;
}

- (void)setAudioTest:(id)a3
{
  objc_storeStrong((id *)&self->_audioTest, a3);
}

- (int64_t)failedToExecuteOnceToken
{
  return self->_failedToExecuteOnceToken;
}

- (void)setFailedToExecuteOnceToken:(int64_t)a3
{
  self->_failedToExecuteOnceToken = a3;
}

- (BOOL)isOriginallyMono
{
  return self->_isOriginallyMono;
}

- (void)setIsOriginallyMono:(BOOL)a3
{
  self->_isOriginallyMono = a3;
}

- (NSNumber)originalBalance
{
  return self->_originalBalance;
}

- (void)setOriginalBalance:(id)a3
{
  objc_storeStrong((id *)&self->_originalBalance, a3);
}

- (BOOL)monoChanged
{
  return self->_monoChanged;
}

- (void)setMonoChanged:(BOOL)a3
{
  self->_monoChanged = a3;
}

- (BOOL)balanceChanged
{
  return self->_balanceChanged;
}

- (void)setBalanceChanged:(BOOL)a3
{
  self->_balanceChanged = a3;
}

- (int64_t)systemSoundDetectionState
{
  return self->_systemSoundDetectionState;
}

- (void)setSystemSoundDetectionState:(int64_t)a3
{
  self->_systemSoundDetectionState = a3;
}

- (DAMotionDetector)motionDetector
{
  return self->_motionDetector;
}

- (void)setMotionDetector:(id)a3
{
  objc_storeStrong((id *)&self->_motionDetector, a3);
}

- (DAAccessoryDisconnectDetector)accessoryDisconnectDetector
{
  return self->_accessoryDisconnectDetector;
}

- (void)setAccessoryDisconnectDetector:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryDisconnectDetector, a3);
}

- (DAHeadphonesDetector)headphoneDetector
{
  return self->_headphoneDetector;
}

- (void)setHeadphoneDetector:(id)a3
{
  objc_storeStrong((id *)&self->_headphoneDetector, a3);
}

- (DAOrientationDetector)orientationDetector
{
  return self->_orientationDetector;
}

- (void)setOrientationDetector:(id)a3
{
  objc_storeStrong((id *)&self->_orientationDetector, a3);
}

- (BOOL)isDeviceiPhone
{
  return self->_isDeviceiPhone;
}

- (void)setIsDeviceiPhone:(BOOL)a3
{
  self->_isDeviceiPhone = a3;
}

- (BOOL)isDeviceiPod
{
  return self->_isDeviceiPod;
}

- (void)setIsDeviceiPod:(BOOL)a3
{
  self->_isDeviceiPod = a3;
}

- (BOOL)isDeviceiPad
{
  return self->_isDeviceiPad;
}

- (void)setIsDeviceiPad:(BOOL)a3
{
  self->_isDeviceiPad = a3;
}

- (BOOL)isDeviceWatch
{
  return self->_isDeviceWatch;
}

- (void)setIsDeviceWatch:(BOOL)a3
{
  self->_isDeviceWatch = a3;
}

- (BOOL)internalInstall
{
  return self->_internalInstall;
}

- (void)setInternalInstall:(BOOL)a3
{
  self->_internalInstall = a3;
}

- (float)previousDeviceVolumePlayAndRecord
{
  return self->_previousDeviceVolumePlayAndRecord;
}

- (void)setPreviousDeviceVolumePlayAndRecord:(float)a3
{
  self->_previousDeviceVolumePlayAndRecord = a3;
}

- (float)previousDeviceVolumeAudioVideo
{
  return self->_previousDeviceVolumeAudioVideo;
}

- (void)setPreviousDeviceVolumeAudioVideo:(float)a3
{
  self->_previousDeviceVolumeAudioVideo = a3;
}

- (BOOL)previousAudioChanged
{
  return self->_previousAudioChanged;
}

- (void)setPreviousAudioChanged:(BOOL)a3
{
  self->_previousAudioChanged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orientationDetector, 0);
  objc_storeStrong((id *)&self->_headphoneDetector, 0);
  objc_storeStrong((id *)&self->_accessoryDisconnectDetector, 0);
  objc_storeStrong((id *)&self->_motionDetector, 0);
  objc_storeStrong((id *)&self->_originalBalance, 0);
  objc_storeStrong((id *)&self->_audioTest, 0);
  objc_storeStrong((id *)&self->_rawRecordings, 0);
  objc_storeStrong((id *)&self->_audioSystemResults, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_tmpdir, 0);
  objc_storeStrong((id *)&self->_fileNameToURL, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_diagnosticResponder, 0);
}

@end
