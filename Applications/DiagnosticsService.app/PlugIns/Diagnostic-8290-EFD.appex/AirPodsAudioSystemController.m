@implementation AirPodsAudioSystemController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  DAChamberDetector *v13;
  void *v14;
  void *v15;
  DAChamberDetector *v16;
  void *v17;
  dispatch_queue_t v18;
  void *v19;
  objc_super v20;
  uint8_t buf[16];

  v6 = a4;
  -[AirPodsAudioSystemController setAirpodsInputs:](self, "setAirpodsInputs:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
  v8 = objc_msgSend(v7, "unpairAirPodsOnFinish");
  if (v6 && v8)
  {
    v9 = objc_opt_respondsToSelector(v6, "unpairSessionAccessoryOnTestCompletion");

    if ((v9 & 1) != 0)
    {
      v10 = DiagnosticLogHandleForCategory(3);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Requesting unpair of current AirPods device on test completion", buf, 2u);
      }

      objc_msgSend(v6, "unpairSessionAccessoryOnTestCompletion");
    }
  }
  else
  {

  }
  v12 = objc_alloc_init((Class)ADASManager);
  -[AirPodsAudioSystemController setAudioDataAnalysisSettingsManager:](self, "setAudioDataAnalysisSettingsManager:", v12);

  -[AirPodsAudioSystemController overrideOriginalHeadphoneExposureNotification](self, "overrideOriginalHeadphoneExposureNotification");
  -[AirPodsAudioSystemController initFilter](self, "initFilter");
  v13 = [DAChamberDetector alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "chamberInputs"));
  v16 = -[DAChamberDetector initWithInputs:](v13, "initWithInputs:", v15);
  -[AirPodsAudioSystemController setChamberDetector:](self, "setChamberDetector:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController chamberDetector](self, "chamberDetector"));
  objc_msgSend(v17, "setDelegate:", self);

  v18 = dispatch_queue_create("AirPodsAudioSystemControllerEventQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  -[AirPodsAudioSystemController setEventQueue:](self, "setEventQueue:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
  v20.receiver = self;
  v20.super_class = (Class)AirPodsAudioSystemController;
  -[AudioSystemCommon setupWithInputs:responder:](&v20, "setupWithInputs:responder:", v19, v6);

}

- (void)start
{
  uint64_t v3;
  NSObject *v4;
  dispatch_semaphore_t v5;
  dispatch_semaphore_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  intptr_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD block[5];
  objc_super v17;
  uint8_t buf[16];

  v3 = DiagnosticLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting test....", buf, 2u);
  }

  v5 = dispatch_semaphore_create(0);
  -[AirPodsAudioSystemController setChamberReadinessSemaphore:](self, "setChamberReadinessSemaphore:", v5);

  v6 = dispatch_semaphore_create(0);
  -[AirPodsAudioSystemController setTestCompletionSemaphore:](self, "setTestCompletionSemaphore:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController chamberDetector](self, "chamberDetector"));
  objc_msgSend(v7, "start");

  v8 = objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController chamberReadinessSemaphore](self, "chamberReadinessSemaphore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "chamberInputs"));
  v11 = dispatch_time(0, 1000000000 * objc_msgSend(v10, "detectChamberReadyWaitTime"));
  v12 = dispatch_semaphore_wait(v8, v11);

  if (v12)
  {
    v13 = DiagnosticLogHandleForCategory(3);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Audio test has timed out while waiting for chamber readiness.", buf, 2u);
    }

    -[AirPodsAudioSystemController endTesting:immediately:](self, "endTesting:immediately:", 4294966294, 1);
  }
  else
  {
    -[AirPodsAudioSystemController setIsRunning:](self, "setIsRunning:", 1);
    v17.receiver = self;
    v17.super_class = (Class)AirPodsAudioSystemController;
    -[AudioSystemCommon start](&v17, "start");
    v15 = objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController eventQueue](self, "eventQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007AE0;
    block[3] = &unk_10001C580;
    block[4] = self;
    dispatch_async(v15, block);

  }
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  -[AirPodsAudioSystemController setChamberReadinessSemaphore:](self, "setChamberReadinessSemaphore:", 0);
  -[AirPodsAudioSystemController setTestCompletionSemaphore:](self, "setTestCompletionSemaphore:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController chamberDetector](self, "chamberDetector"));
  objc_msgSend(v3, "stop");

  -[AirPodsAudioSystemController setIsRunning:](self, "setIsRunning:", 0);
  -[AirPodsAudioSystemController stopAlerts](self, "stopAlerts");
  v4.receiver = self;
  v4.super_class = (Class)AirPodsAudioSystemController;
  -[AudioSystemCommon cancel](&v4, "cancel");
}

- (void)teardown
{
  void *v3;
  objc_super v4;

  -[AirPodsAudioSystemController setChamberReadinessSemaphore:](self, "setChamberReadinessSemaphore:", 0);
  -[AirPodsAudioSystemController setTestCompletionSemaphore:](self, "setTestCompletionSemaphore:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController chamberDetector](self, "chamberDetector"));
  objc_msgSend(v3, "stop");

  -[AirPodsAudioSystemController setIsRunning:](self, "setIsRunning:", 0);
  -[AirPodsAudioSystemController restoreOriginalHeadphoneExposureNotification](self, "restoreOriginalHeadphoneExposureNotification");
  -[AirPodsAudioSystemController stopAlerts](self, "stopAlerts");
  v4.receiver = self;
  v4.super_class = (Class)AirPodsAudioSystemController;
  -[AudioSystemCommon teardown](&v4, "teardown");
  AAT_cleanUp();
  -[AirPodsAudioSystemController freeFilter](self, "freeFilter");
}

- (void)testFinishedSuccessfully
{
  -[AirPodsAudioSystemController endTesting:immediately:](self, "endTesting:immediately:", 0, 0);
}

- (void)endTesting:(int)a3 immediately:(BOOL)a4
{
  uint64_t v5;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  dispatch_semaphore_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  _QWORD block[5];
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint8_t buf[4];
  int v39;

  v5 = *(_QWORD *)&a3;
  v7 = DiagnosticLogHandleForCategory(3);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v39 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[AirPodsAudioSystemController] End testing with status: %d", buf, 8u);
  }

  -[AirPodsAudioSystemController setIsRunning:](self, "setIsRunning:", 0);
  if (a4
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "chamberInputs")),
        v11 = objc_msgSend(v10, "detectChamberSensor"),
        v10,
        v9,
        !v11))
  {
    if ((_DWORD)v5 && !-[AudioSystemCommon testFailed](self, "testFailed"))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController result](self, "result"));
      objc_msgSend(v32, "setStatusCode:", v31);

    }
    -[AirPodsAudioSystemController setFinished:](self, "setFinished:", 1);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "chamberInputs"));
    v14 = objc_msgSend(v13, "testCompleteVibrationAlertEnabled");

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "chamberInputs"));
    v17 = objc_msgSend(v16, "testCompleteChimeAlertEnabled");

    if (v14)
    {
      v36 = kAudioServicesPlaySystemSoundOptionLoopKey;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      v37 = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));

      AudioServicesPlaySystemSoundWithOptions(1352, v19, 0);
      v20 = DiagnosticLogHandleForCategory(3);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[AirPodsAudioSystemController] Start test vibration", buf, 2u);
      }

    }
    if (v17)
    {
      v34 = kAudioServicesPlaySystemSoundOptionLoopKey;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      v35 = v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));

      AudioServicesPlaySystemSoundWithOptions(1428, v23, 0);
      v24 = DiagnosticLogHandleForCategory(3);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "[AirPodsAudioSystemController] Start test chime", buf, 2u);
      }

    }
    v26 = objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController testCompletionSemaphore](self, "testCompletionSemaphore"));
    dispatch_semaphore_signal(v26);

    v27 = dispatch_semaphore_create(0);
    -[AirPodsAudioSystemController setTestEndedSemaphore:](self, "setTestEndedSemaphore:", v27);

    if ((_DWORD)v5)
    {
      if (!-[AudioSystemCommon testFailed](self, "testFailed"))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController result](self, "result"));
        objc_msgSend(v29, "setStatusCode:", v28);

      }
    }
    v30 = objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController eventQueue](self, "eventQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000080F8;
    block[3] = &unk_10001C580;
    block[4] = self;
    dispatch_async(v30, block);

  }
}

- (void)stopAlerts
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned int v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "chamberInputs"));
  v5 = objc_msgSend(v4, "testCompleteVibrationAlertEnabled");

  if (v5)
    AudioServicesStopSystemSound(1352, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chamberInputs"));
  v8 = objc_msgSend(v7, "testCompleteChimeAlertEnabled");

  if (v8)
    AudioServicesStopSystemSound(1428, 1);
}

- (void)dealloc
{
  objc_super v3;

  -[AirPodsAudioSystemController stopAlerts](self, "stopAlerts");
  v3.receiver = self;
  v3.super_class = (Class)AirPodsAudioSystemController;
  -[AirPodsAudioSystemController dealloc](&v3, "dealloc");
}

- (void)handleChamberStatus:(int)a3
{
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _DWORD v10[2];

  v5 = DiagnosticLogHandleForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received chamber status: %u", (uint8_t *)v10, 8u);
  }

  if (a3 == 3)
  {
    if (!-[AirPodsAudioSystemController isRunning](self, "isRunning"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController testEndedSemaphore](self, "testEndedSemaphore"));

      if (v8)
      {
        v7 = objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController testEndedSemaphore](self, "testEndedSemaphore"));
        goto LABEL_10;
      }
    }
    -[AirPodsAudioSystemController endTesting:immediately:](self, "endTesting:immediately:", 4294966293, 1);
  }
  else if (a3 == 1 && !-[AirPodsAudioSystemController isRunning](self, "isRunning"))
  {
    v7 = objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController chamberReadinessSemaphore](self, "chamberReadinessSemaphore"));
LABEL_10:
    v9 = v7;
    dispatch_semaphore_signal(v7);

  }
}

- (void)downloadFilesWithResponder:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];
  objc_super v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
  v6 = objc_msgSend(v5, "useBundledAudioStimulus");

  if ((v6 & 1) != 0)
  {
    v7 = DiagnosticLogHandleForCategory(3);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Skiping file download - useBundledAudioStimulus is enabled", v9, 2u);
    }

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)AirPodsAudioSystemController;
    -[AudioSystemCommon downloadFilesWithResponder:](&v10, "downloadFilesWithResponder:", v4);
  }

}

- (id)pathToSoundFile:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSBundle *v13;
  void *v14;
  void *v15;
  id v16;
  objc_super v18;
  uint8_t buf[4];
  id v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
  v6 = objc_msgSend(v5, "useBundledAudioStimulus");

  v7 = DiagnosticLogHandleForCategory(3);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Using bundled stimulus for audio file %@", buf, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(".")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

    v13 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "URLForResource:withExtension:", v11, CFSTR(".wav")));

  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Using downloaded stimulus for audio file %@", buf, 0xCu);
    }

    v18.receiver = self;
    v18.super_class = (Class)AirPodsAudioSystemController;
    v16 = -[AudioSystemCommon pathToSoundFile:](&v18, "pathToSoundFile:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v16);
  }

  return v15;
}

- (void)performAnalysisOnAVResult:(id)a3 fromOutput:(id)a4 withSourceSignalData:(id)a5 intoDKResult:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  id v28;
  NSErrorUserInfoKey v29;
  const __CFString *v30;
  uint8_t buf[4];
  id v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = v13;
  v18 = v15;
  objc_msgSend(v18, "setAudioTestType:", objc_msgSend(v17, "audioTestType"));
  v19 = objc_msgSend(v17, "audioTestType");
  if (v19 == (id)1)
  {
    -[AirPodsAudioSystemController processFrequencyAndRearVentOcculusionWithPlayResult:sourceSignalData:dkResult:](self, "processFrequencyAndRearVentOcculusionWithPlayResult:sourceSignalData:dkResult:", v12, v14, v18);
LABEL_8:
    v23 = v18;
    goto LABEL_9;
  }
  if (v19)
  {
    v24 = DiagnosticLogHandleForCategory(3);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v32 = objc_msgSend(v17, "audioTestType");
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Unrecognized AirPods audio test type %ld", buf, 0xCu);
    }

    v29 = NSLocalizedDescriptionKey;
    v30 = CFSTR("Unrecognized AirPods audio test type");
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
    v27 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DAAudioQualityErrorDomain"), -912, v26));

    -[AudioSystemCommon failedToExecuteWithError:](self, "failedToExecuteWithError:", v27);
    v16 = (id)v27;
    goto LABEL_8;
  }
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "data")));
  v21 = objc_msgSend(v20, "bytes");
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "data"));
  v28 = v18;
  -[AirPodsAudioSystemController processCrackleData:audioRawDataSize:saveResult:](self, "processCrackleData:audioRawDataSize:saveResult:", v21, (unint64_t)objc_msgSend(v22, "length") >> 2, &v28);
  v23 = v28;

LABEL_9:
}

- (id)createNewTestSequenceWithOutput:(id)a3 andStimulusFile:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AirPodsAudioSystemController;
  v6 = a3;
  v7 = -[AudioSystemCommon createNewTestSequenceWithOutput:andStimulusFile:](&v13, "createNewTestSequenceWithOutput:andStimulusFile:", v6, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(v6, "numberOfChannels", v13.receiver, v13.super_class);

  objc_msgSend(v8, "setNumberOfChannels:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "micBufferNumbers"));
  objc_msgSend(v8, "setMicBufferNumbers:", v11);

  objc_msgSend(v8, "setRequiresBluetoothOutput:", 1);
  return v8;
}

- (Class)audioSystemResultClass
{
  return (Class)objc_opt_class(AirPodsAudioSystemResult, a2);
}

- (void)processCrackleData:(float *)a3 audioRawDataSize:(int)a4 saveResult:(id *)a5
{
  uint64_t v7;
  NSObject *v8;
  uint64_t i;
  uint64_t v10;
  NSObject *v11;
  double v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  int v27;
  void *v30;
  uint64_t v31;
  uint8_t buf[4];
  double v33;

  v7 = DiagnosticLogHandleForCategory(3);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Dumping input data", buf, 2u);
  }

  for (i = 0; i != 5; ++i)
  {
    v10 = DiagnosticLogHandleForCategory(3);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = a3[i];
      *(_DWORD *)buf = 134217984;
      v33 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%.21g", buf, 0xCu);
    }

  }
  v13 = DiagnosticLogHandleForCategory(3);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "End dumping input data", buf, 2u);
  }

  *(_DWORD *)buf = 0;
  v31 = 0;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "crackleSamplingRate"));
  v27 = objc_msgSend(v15, "intValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "crackleBaseFrequency"));
  v18 = objc_msgSend(v17, "intValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "crackleNeighborDistance"));
  AAT_processCrackledData(a3, a4, v27, v18, (int)objc_msgSend(v20, "intValue"), &self->_filterSetup, -[AirPodsAudioSystemController filterDelay](self, "filterDelay"), (float *)buf, (float *)&v31 + 1, &v31);

  LODWORD(v21) = *(_DWORD *)buf;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v21));
  objc_msgSend(*a5, "setXCorrPeak:", v22);

  LODWORD(v23) = HIDWORD(v31);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v23));
  objc_msgSend(*a5, "setXCorrPNR:", v24);

  LODWORD(v25) = v31;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v25));
  objc_msgSend(*a5, "setXCorrCenter:", v26);

}

- (void)processFrequencyAndRearVentOcculusionWithPlayResult:(id)a3 sourceSignalData:(id)a4 dkResult:(id)a5
{
  uint64_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  _DWORD *v13;
  void *v14;
  void *v15;
  id v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  float *v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  id v49;
  double v50;
  unint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  unint64_t v55;
  void *v56;
  void *v57;
  OpaqueFFTSetup *v58;
  void *v59;
  const float *v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  uint8_t buf[8];
  NSErrorUserInfoKey v66;
  const __CFString *v67;

  v64 = a3;
  v63 = a4;
  v62 = a5;
  v8 = DiagnosticLogHandleForCategory(3);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Performing rear-vent occlusion/frequency analysis", buf, 2u);
  }

  v10 = objc_alloc_init((Class)NSMutableArray);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "frequencyBins"));
  v13 = malloc_type_calloc((size_t)objc_msgSend(v12, "count"), 4uLL, 0x100004052888210uLL);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "frequencyBins"));
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    v17 = 0;
    do
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "frequencyBins"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", v17));
      objc_msgSend(v20, "floatValue");
      v13[v17] = v21;

      ++v17;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "frequencyBins"));
      v24 = objc_msgSend(v23, "count");

    }
    while ((unint64_t)v24 > v17);
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "frequencyBins"));
  v27 = malloc_type_calloc((unint64_t)objc_msgSend(v26, "count") >> 1, 4uLL, 0x100004052888210uLL);

  *(_QWORD *)buf = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stimulusFrontCroppingLength"));
  v30 = objc_msgSend(v29, "unsignedIntValue");
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stimulusCroppingLength"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController cropAudioData:lengthFromFront:lengthFromEnd:](self, "cropAudioData:lengthFromFront:lengthFromEnd:", v63, v30, objc_msgSend(v32, "unsignedIntValue")));

  v34 = objc_retainAutorelease(v33);
  v60 = (const float *)objc_msgSend(v34, "bytes");
  v61 = v34;
  v58 = (OpaqueFFTSetup *)(objc_msgSend(v34, "length") >> 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "data"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "dataFrontCroppingLength"));
  v38 = objc_msgSend(v37, "unsignedIntValue");
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "dataCroppingLength"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController cropAudioData:lengthFromFront:lengthFromEnd:](self, "cropAudioData:lengthFromFront:lengthFromEnd:", v35, v38, objc_msgSend(v40, "unsignedIntValue")));

  v42 = objc_retainAutorelease(v41);
  v43 = (float *)objc_msgSend(v42, "bytes");
  v59 = v42;
  LODWORD(v42) = objc_msgSend(v42, "length") >> 2;
  AAT_initWithLength(v58);
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "frequencyBins"));
  LODWORD(v40) = objc_msgSend(v45, "count");
  objc_msgSend(v64, "sampleRate");
  AAT_processFrequencyResponseGxx(v60, v58, v43, v42, (uint64_t)v13, v40, v46, buf);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "frequencyBins"));
  v49 = objc_msgSend(v48, "count");

  if ((unint64_t)v49 >= 2)
  {
    v51 = 0;
    do
    {
      LODWORD(v50) = *(_DWORD *)(*(_QWORD *)buf + 4 * v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v50));
      objc_msgSend(v10, "addObject:", v52);

      ++v51;
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "frequencyBins"));
      v55 = (unint64_t)objc_msgSend(v54, "count");

    }
    while (v51 < v55 >> 1);
  }
  objc_msgSend(v62, "setEnergyValues:", v10);
  free(v13);
  free(*(void **)buf);
  if (!objc_msgSend(v10, "count"))
  {
    v66 = NSLocalizedDescriptionKey;
    v67 = CFSTR("Failed to generate Bin Energy Values.");
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1));
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DAAudioQualityErrorDomain"), -65, v56));

    -[AudioSystemCommon failedToExecuteWithError:](self, "failedToExecuteWithError:", v57);
  }

}

- (id)cropAudioData:(id)a3 lengthFromFront:(unsigned int)a4 lengthFromEnd:(unsigned int)a5
{
  unsigned int v6;
  id v7;
  void *v8;

  v6 = a5 + a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subdataWithRange:", 4 * a4, objc_msgSend(v7, "length") - 4 * v6));

  return v8;
}

- (void)initFilter
{
  void *v3;
  const double *v4;
  void *v5;
  void *v6;
  id v7;
  __int128 v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  signed int v22;
  uint64_t v23;
  id v24;
  __int128 v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  double v29;

  v24 = (id)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "crackleFilterCoeffs"));
  v23 = (uint64_t)&v23;
  v4 = (const double *)((char *)&v23 - ((8 * (_QWORD)objc_msgSend(v3, "count") + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crackleFilterCoeffs"));
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v9 = 0;
    *(_QWORD *)&v8 = 67109376;
    v25 = v8;
    do
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "crackleFilterCoeffs"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v9));
      objc_msgSend(v12, "doubleValue");
      v14 = v13;
      v4[v9] = v13;

      v15 = DiagnosticLogHandleForCategory(3);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v25;
        v27 = v9;
        v28 = 2048;
        v29 = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Crackle Filter used i=%d with value=%f", buf, 0x12u);
      }

      ++v9;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "crackleFilterCoeffs"));
      v19 = objc_msgSend(v18, "count");

    }
    while ((unint64_t)v19 > v9);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController airpodsInputs](self, "airpodsInputs"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "crackleNumberOfStages"));
  v22 = objc_msgSend(v21, "intValue");

  -[AirPodsAudioSystemController setFilterSetup:](self, "setFilterSetup:", vDSP_biquad_CreateSetup(v4, v22));
  -[AirPodsAudioSystemController setFilterDelay:](self, "setFilterDelay:", malloc_type_calloc(3 * v22, 4uLL, 0x100004052888210uLL));

}

- (void)freeFilter
{
  if (-[AirPodsAudioSystemController filterDelay](self, "filterDelay"))
    free(-[AirPodsAudioSystemController filterDelay](self, "filterDelay"));
  vDSP_biquad_DestroySetup(-[AirPodsAudioSystemController filterSetup](self, "filterSetup"));
}

- (void)overrideOriginalHeadphoneExposureNotification
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t v18[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController audioDataAnalysisSettingsManager](self, "audioDataAnalysisSettingsManager"));
  v4 = ADAFPreferenceKeyHAENotificationFeatureEnabled;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getPreferenceFor:", ADAFPreferenceKeyHAENotificationFeatureEnabled));
  -[AirPodsAudioSystemController setHeadphoneExposureNotificationsEnabled:](self, "setHeadphoneExposureNotificationsEnabled:", objc_msgSend(v5, "BOOLValue"));

  if (-[AirPodsAudioSystemController headphoneExposureNotificationsEnabled](self, "headphoneExposureNotificationsEnabled"))
  {
    v6 = DiagnosticLogHandleForCategory(3);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Headphone exposure notifications are enabled. Disabling...", v18, 2u);
    }

    -[AirPodsAudioSystemController setHeadphoneExposureNotificationsChanged:](self, "setHeadphoneExposureNotificationsChanged:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController audioDataAnalysisSettingsManager](self, "audioDataAnalysisSettingsManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "setPreferenceFor:value:", v4, &__kCFBooleanFalse));

    if (v9)
    {
      v10 = DiagnosticLogHandleForCategory(3);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_100010B0C((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);

    }
  }
}

- (void)restoreOriginalHeadphoneExposureNotification
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v17[16];

  if (-[AirPodsAudioSystemController headphoneExposureNotificationsChanged](self, "headphoneExposureNotificationsChanged"))
  {
    v3 = DiagnosticLogHandleForCategory(3);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Restoring original headphone exposure notification state", v17, 2u);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemController audioDataAnalysisSettingsManager](self, "audioDataAnalysisSettingsManager"));
    v6 = ADAFPreferenceKeyHAENotificationFeatureEnabled;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[AirPodsAudioSystemController headphoneExposureNotificationsEnabled](self, "headphoneExposureNotificationsEnabled")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "setPreferenceFor:value:", v6, v7));

    if (v8)
    {
      v9 = DiagnosticLogHandleForCategory(3);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_100010B74((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);

    }
  }
}

- (AirPodsAudioSystemInputs)airpodsInputs
{
  return self->_airpodsInputs;
}

- (void)setAirpodsInputs:(id)a3
{
  objc_storeStrong((id *)&self->_airpodsInputs, a3);
}

- (DAChamberDetector)chamberDetector
{
  return self->_chamberDetector;
}

- (void)setChamberDetector:(id)a3
{
  objc_storeStrong((id *)&self->_chamberDetector, a3);
}

- (vDSP_biquad_SetupStruct)filterSetup
{
  return self->_filterSetup;
}

- (void)setFilterSetup:(vDSP_biquad_SetupStruct *)a3
{
  self->_filterSetup = a3;
}

- (float)filterDelay
{
  return self->_filterDelay;
}

- (void)setFilterDelay:(float *)a3
{
  self->_filterDelay = a3;
}

- (ADASManager)audioDataAnalysisSettingsManager
{
  return self->_audioDataAnalysisSettingsManager;
}

- (void)setAudioDataAnalysisSettingsManager:(id)a3
{
  objc_storeStrong((id *)&self->_audioDataAnalysisSettingsManager, a3);
}

- (BOOL)headphoneExposureNotificationsEnabled
{
  return self->_headphoneExposureNotificationsEnabled;
}

- (void)setHeadphoneExposureNotificationsEnabled:(BOOL)a3
{
  self->_headphoneExposureNotificationsEnabled = a3;
}

- (BOOL)headphoneExposureNotificationsChanged
{
  return self->_headphoneExposureNotificationsChanged;
}

- (void)setHeadphoneExposureNotificationsChanged:(BOOL)a3
{
  self->_headphoneExposureNotificationsChanged = a3;
}

- (OS_dispatch_semaphore)chamberReadinessSemaphore
{
  return self->_chamberReadinessSemaphore;
}

- (void)setChamberReadinessSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_chamberReadinessSemaphore, a3);
}

- (OS_dispatch_semaphore)testCompletionSemaphore
{
  return self->_testCompletionSemaphore;
}

- (void)setTestCompletionSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_testCompletionSemaphore, a3);
}

- (OS_dispatch_semaphore)testEndedSemaphore
{
  return self->_testEndedSemaphore;
}

- (void)setTestEndedSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_testEndedSemaphore, a3);
}

- (OS_dispatch_queue)eventQueue
{
  return self->_eventQueue;
}

- (void)setEventQueue:(id)a3
{
  objc_storeStrong((id *)&self->_eventQueue, a3);
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_testEndedSemaphore, 0);
  objc_storeStrong((id *)&self->_testCompletionSemaphore, 0);
  objc_storeStrong((id *)&self->_chamberReadinessSemaphore, 0);
  objc_storeStrong((id *)&self->_audioDataAnalysisSettingsManager, 0);
  objc_storeStrong((id *)&self->_chamberDetector, 0);
  objc_storeStrong((id *)&self->_airpodsInputs, 0);
}

@end
