@implementation BatteryDrainController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  dispatch_semaphore_t v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  unsigned int v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
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
  id v47;
  id v48;
  uint8_t buf[4];
  void *v50;

  v6 = a3;
  v7 = a4;
  -[BatteryDrainController setInputs:](self, "setInputs:", v6);
  -[BatteryDrainController setResponder:](self, "setResponder:", v7);
  -[BatteryDrainController setIsThermalBlocked:](self, "setIsThermalBlocked:", 0);
  -[BatteryDrainController setOriginalPowerModeSet:](self, "setOriginalPowerModeSet:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
  -[BatteryDrainController setRunNumber:](self, "setRunNumber:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
  if (!objc_msgSend(v9, "isAccessoryDetectorActive"))
  {

LABEL_5:
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
    if (objc_msgSend(v12, "disableUSBCharging"))
    {
      v13 = -[BatteryDrainController isDeviceConnectedToUnexpectedAccessory](self, "isDeviceConnectedToUnexpectedAccessory");

      if (v13)
      {
        v47 = 0;
        +[BatteryDrainController setCode:forError:](BatteryDrainController, "setCode:forError:", -3, &v47);
        v11 = v47;
        -[BatteryDrainController failedToExecuteWithError:](self, "failedToExecuteWithError:", v11);
        -[BatteryDrainController endBatteryDrainWithStatusCode:](self, "endBatteryDrainWithStatusCode:", &off_100010DD8);
        goto LABEL_26;
      }
    }
    else
    {

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
    if ((objc_msgSend(v14, "drainAudio") & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "audioFilename"));

      if (v16)
      {
        v17 = dispatch_semaphore_create(0);
        v18 = NSTemporaryDirectory();
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v19, 1));

        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "UUIDString"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "URLByAppendingPathComponent:", v22));

        v41 = 0;
        v42 = &v41;
        v43 = 0x3032000000;
        v44 = sub_100002B5C;
        v45 = sub_100002B6C;
        v46 = 0;
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "audioFilename"));
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_100002B74;
        v38[3] = &unk_1000104B0;
        v40 = &v41;
        v26 = v17;
        v39 = v26;
        objc_msgSend(v7, "getAsset:completion:", v25, v38);

        dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
        if (v42[5])
        {
          v27 = DiagnosticLogHandleForCategory(3);
          v28 = objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v50 = v23;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Saving asset data to [%@]", buf, 0xCu);
          }

          v29 = (void *)v42[5];
          v37 = 0;
          v30 = objc_msgSend(v29, "writeToURL:options:error:", v23, 268435457, &v37);
          v11 = v37;
          if (v30)
          {
            -[BatteryDrainController setAudioFileURL:](self, "setAudioFileURL:", v23);
LABEL_24:

            _Block_object_dispose(&v41, 8);
            goto LABEL_25;
          }
          v35 = DiagnosticLogHandleForCategory(3);
          v32 = objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            sub_100008E68((uint64_t)v23, (uint64_t)v11, v32);
        }
        else
        {
          v31 = DiagnosticLogHandleForCategory(3);
          v32 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "audioFilename"));
            sub_100008E0C(v34, buf, v32, v33);
          }
          v11 = 0;
        }

        goto LABEL_24;
      }
    }
    else
    {

    }
    v11 = 0;
LABEL_25:
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    -[BatteryDrainController setDefaults:](self, "setDefaults:", v36);

    goto LABEL_26;
  }
  v10 = -[BatteryDrainController isDeviceConnectedToRequiredAccessory](self, "isDeviceConnectedToRequiredAccessory");

  if ((v10 & 1) != 0)
    goto LABEL_5;
  v48 = 0;
  +[BatteryDrainController setCode:forError:](BatteryDrainController, "setCode:forError:", -52, &v48);
  v11 = v48;
  -[BatteryDrainController failedToExecuteWithError:](self, "failedToExecuteWithError:", v11);
  -[BatteryDrainController endBatteryDrainWithStatusCode:](self, "endBatteryDrainWithStatusCode:", &off_100010DC0);
LABEL_26:

}

- (void)start
{
  void *v3;
  float v4;
  double v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  float v14;
  unint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  uint8_t v29[16];

  -[BatteryDrainController ensureAnalyticsFreeEnvironment](self, "ensureAnalyticsFreeEnvironment");
  v3 = (void *)MGCopyAnswer(CFSTR("BatteryCurrentCapacity"), 0);
  objc_msgSend(v3, "floatValue");
  *(float *)&v5 = v4 / 100.0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
  -[BatteryDrainController setStartingBatteryPercentage:](self, "setStartingBatteryPercentage:", v6);

  v7 = objc_claimAutoreleasedReturnValue(-[BatteryDrainController startingBatteryPercentage](self, "startingBatteryPercentage"));
  -[BatteryDrainController checkStartingBatteryPercentage:](self, "checkStartingBatteryPercentage:", v7);

  -[BatteryDrainController waitForSafeThermalState](self, "waitForSafeThermalState");
  -[BatteryDrainController setupNotifications](self, "setupNotifications");
  LOBYTE(v7) = MGGetBoolAnswer(CFSTR("BatteryIsCharging"));
  v8 = MGGetBoolAnswer(CFSTR("ExternalPowerSourceConnected"));
  if ((v7 & 1) != 0 || v8)
    -[BatteryDrainController recievedConnectedToChargerNotification:](self, "recievedConnectedToChargerNotification:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController startingBatteryPercentage](self, "startingBatteryPercentage"));
  objc_msgSend(v9, "floatValue");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "targetBatteryPercentage"));
  objc_msgSend(v13, "floatValue");
  v15 = llroundf((float)(v11 - v14) * 100.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController progress](self, "progress"));
  objc_msgSend(v16, "setTotalUnitCount:", v15);

  -[BatteryDrainController initOperations](self, "initOperations");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
  LODWORD(v12) = objc_msgSend(v17, "autoBrightnessOff");

  if ((_DWORD)v12)
  {
    v18 = objc_alloc_init((Class)BrightnessSystemClient);
    -[BatteryDrainController setBrightnessSystemClient:](self, "setBrightnessSystemClient:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController brightnessSystemClient](self, "brightnessSystemClient"));
    v20 = objc_msgSend(v19, "copyPropertyForKey:", CFSTR("DisplayAutoBrightnessActive"));
    -[BatteryDrainController setWasAutoBrightnessEnabled:](self, "setWasAutoBrightnessEnabled:", objc_msgSend(v20, "BOOLValue"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController brightnessSystemClient](self, "brightnessSystemClient"));
    objc_msgSend(v21, "setProperty:forKey:", &__kCFBooleanFalse, CFSTR("DisplayAutoBrightnessActive"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController brightnessSystemClient](self, "brightnessSystemClient"));
    objc_msgSend(v22, "setProperty:forKey:", &__kCFBooleanFalse, CFSTR("DisplayBrightnessAuto"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController brightnessSystemClient](self, "brightnessSystemClient"));
    objc_msgSend(v23, "setProperty:forKey:", &__kCFBooleanFalse, CFSTR("ALSTurnOn"));

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
  v25 = objc_msgSend(v24, "lowPowerModeOff");

  if (v25)
  {
    v26 = objc_alloc_init((Class)_PMLowPowerMode);
    -[BatteryDrainController setOriginalPowerMode:](self, "setOriginalPowerMode:", objc_msgSend(v26, "getPowerMode"));
    -[BatteryDrainController setOriginalPowerModeSet:](self, "setOriginalPowerModeSet:", 1);
    if ((objc_msgSend(v26, "setPowerMode:fromSource:", 0, CFSTR("Diagnostics")) & 1) == 0)
    {
      v27 = DiagnosticLogHandleForCategory(3);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Failed to turn off the Low Power Mode", v29, 2u);
      }

    }
  }

}

- (void)initOperations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  AudioDrainOperation *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  double v15;
  AudioDrainOperation *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  DisplayDrainOperation *v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  void *v25;
  double v26;
  DisplayDrainOperation *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  CPUDrainOperation *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  CPUDrainOperation *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  GPUDrainOperation *v40;
  void *v41;
  void *v42;
  void *v43;
  GPUDrainOperation *v44;

  v3 = (void *)objc_opt_new(NSOperationQueue, a2);
  -[BatteryDrainController setDrainQueue:](self, "setDrainQueue:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController drainQueue](self, "drainQueue"));
  objc_msgSend(v4, "setQualityOfService:", 25);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController drainQueue](self, "drainQueue"));
  objc_msgSend(v5, "setMaxConcurrentOperationCount:", 10);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
  v7 = objc_msgSend(v6, "drainAudio");

  if (v7)
  {
    v8 = [AudioDrainOperation alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController audioFileURL](self, "audioFileURL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "audioVolume"));
    objc_msgSend(v11, "floatValue");
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController responder](self, "responder"));
    LODWORD(v15) = v13;
    v16 = -[AudioDrainOperation initWithAudioFileURL:volume:responder:](v8, "initWithAudioFileURL:volume:responder:", v9, v14, v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController drainQueue](self, "drainQueue"));
    objc_msgSend(v17, "addOperation:", v16);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
  v19 = objc_msgSend(v18, "drainDisplay");

  if (v19)
  {
    v20 = [DisplayDrainOperation alloc];
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "displayBrightness"));
    objc_msgSend(v22, "floatValue");
    v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController responder](self, "responder"));
    LODWORD(v26) = v24;
    v27 = -[DisplayDrainOperation initWithBrightness:responder:](v20, "initWithBrightness:responder:", v25, v26);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController drainQueue](self, "drainQueue"));
    objc_msgSend(v28, "addOperation:", v27);

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
  v30 = objc_msgSend(v29, "drainCPU");

  if (v30)
  {
    v31 = [CPUDrainOperation alloc];
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "cpuDrainMatrixLength"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "cpuDrainIterationDelay"));
    v36 = -[CPUDrainOperation initWithMatrixLength:iterationDelay:](v31, "initWithMatrixLength:iterationDelay:", v33, v35);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController drainQueue](self, "drainQueue"));
    objc_msgSend(v37, "addOperation:", v36);

  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
  v39 = objc_msgSend(v38, "drainGPU");

  if (v39)
  {
    v40 = [GPUDrainOperation alloc];
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "gpuDrainIterationDelay"));
    v44 = -[GPUDrainOperation initWithIterationDelay:](v40, "initWithIterationDelay:", v42);

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController drainQueue](self, "drainQueue"));
    objc_msgSend(v43, "addOperation:", v44);

  }
}

- (BOOL)isDeviceConnectedToRequiredAccessory
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  BOOL v14;
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
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accessoryDetectorModelNumbers"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modelNumber"));
        v13 = objc_msgSend(v11, "containsObject:", v12);

        if ((v13 & 1) != 0)
        {
          v14 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)isDeviceConnectedToUnexpectedAccessory
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  BOOL v14;
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
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accessoryDetectorModelNumbers"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modelNumber"));
        v13 = objc_msgSend(v11, "containsObject:", v12);

        if (!v13)
        {
          v14 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (void)failedToExecuteWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController result](self, "result"));
  objc_msgSend(v5, "setData:", &__NSDictionary0__struct);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "code")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController result](self, "result"));
  objc_msgSend(v7, "setStatusCode:", v6);

  -[BatteryDrainController setFinished:](self, "setFinished:", 1);
  v8 = DiagnosticLogHandleForCategory(3);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = objc_msgSend(v4, "code");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to execute with error code: %ld", (uint8_t *)&v10, 0xCu);
  }

}

- (void)cancel
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = DiagnosticLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "User canceled battery drain tool", v5, 2u);
  }

  -[BatteryDrainController setFinished:](self, "setFinished:", 1);
}

- (void)endBatteryDrainWithStatusCode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BatteryDrainController result](self, "result"));
  objc_msgSend(v5, "setStatusCode:", v4);

}

- (void)setupNotifications
{
  void *v3;
  void *v4;
  float v5;
  float v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  DAAccessoryDisconnectDetector *v11;
  void *v12;
  void *v13;
  DAAccessoryDisconnectDetector *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  DAAccessoryConnectDetector *v19;
  void *v20;
  void *v21;
  DAAccessoryConnectDetector *v22;
  void *v23;
  void *v24;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v26;

  +[BatteryStateNotifier registerForBatteryEvents](BatteryStateNotifier, "registerForBatteryEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "targetBatteryPercentage"));
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  if (v6 > 0.0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", self, "recievedBatteryPercentageChangedNotification:", CFSTR("com.apple.Diagnostics.BatteryLevelChangedNotification"), 0);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
  v9 = objc_msgSend(v8, "isAccessoryDetectorActive");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", self, "receivedInterruptNotification:", CFSTR("AccessoryDisconnectedNotification"), 0);

    v11 = [DAAccessoryDisconnectDetector alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accessoryDetectorModelNumbers"));
    v14 = -[DAAccessoryDisconnectDetector initWithModelNumbers:](v11, "initWithModelNumbers:", v13);
    -[BatteryDrainController setAccessoryDisconnectDetector:](self, "setAccessoryDisconnectDetector:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController accessoryDisconnectDetector](self, "accessoryDisconnectDetector"));
    objc_msgSend(v15, "start");

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
  v17 = objc_msgSend(v16, "disableUSBCharging");

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v18, "addObserver:selector:name:object:", self, "receivedInterruptNotification:", CFSTR("AccessoryConnectedNotification"), 0);

    v19 = [DAAccessoryConnectDetector alloc];
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "accessoryDetectorModelNumbers"));
    v22 = -[DAAccessoryConnectDetector initWithModelNumbers:](v19, "initWithModelNumbers:", v21);
    -[BatteryDrainController setAccessoryConnectDetector:](self, "setAccessoryConnectDetector:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController accessoryConnectDetector](self, "accessoryConnectDetector"));
    objc_msgSend(v23, "start");

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v24, "addObserver:selector:name:object:", self, "recievedConnectedToChargerNotification:", CFSTR("com.apple.Diagnostics.BatteryConnectedToChargingNotification"), 0);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", kOSThermalNotificationName, 4));
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1000039A8, v26, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100003A1C, CFSTR("com.apple.springboard.deviceWillShutDown"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)recievedThermalStateChangedNotification
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(25, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003B04;
  block[3] = &unk_1000104D8;
  block[4] = self;
  dispatch_sync(v4, block);

}

- (void)ensureAnalyticsFreeEnvironment
{
  int v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;

  v3 = MGGetBoolAnswer(CFSTR("3kmXfug8VcxLI5yEmsqQKw"));
  v4 = DiagnosticLogSubmissionEnabled();
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController defaults](self, "defaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("SkipAnalyticsCheck")));

  v7 = DiagnosticLogHandleForCategory(3);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("NOT in");
    if (v3)
      v9 = CFSTR("in");
    v10 = CFSTR("enabled");
    if (!v4)
      v10 = CFSTR("disabled");
    *(_DWORD *)buf = 138412546;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Device is %@ Diagnostics Mode. Analytics are %@", buf, 0x16u);
  }

  if (((v3 | v4 ^ 1) & 1) == 0 && (objc_msgSend(v6, "BOOLValue") & 1) == 0)
  {
    v11 = DiagnosticLogHandleForCategory(3);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Device configuration will affect analytics. Ending test.", buf, 2u);
    }

    v14 = 0;
    +[BatteryDrainController setCode:forError:](BatteryDrainController, "setCode:forError:", -4, &v14);
    v13 = v14;
    -[BatteryDrainController failedToExecuteWithError:](self, "failedToExecuteWithError:", v13);

  }
}

- (void)checkStartingBatteryPercentage:(id)a3
{
  id v4;
  float v5;
  float v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;

  v4 = a3;
  objc_msgSend(v4, "floatValue");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "targetBatteryPercentage"));
  objc_msgSend(v8, "floatValue");
  v10 = v9;

  if (v6 <= v10)
  {
    v11 = DiagnosticLogHandleForCategory(3);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "targetBatteryPercentage"));
      v16 = 138412546;
      v17 = v4;
      v18 = 2112;
      v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Starting battery level (%@) is already at or below target battery level (%@)", (uint8_t *)&v16, 0x16u);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController result](self, "result"));
    objc_msgSend(v15, "setStatusCode:", &off_100010DF0);

    -[BatteryDrainController setFinished:](self, "setFinished:", 1);
  }

}

- (void)waitForSafeThermalState
{
  uint64_t v2;
  uint64_t v3;

  if ((int)OSThermalNotificationCurrentLevel(self, a2) >= 11)
  {
    do
      v2 = sleep(5u);
    while ((int)OSThermalNotificationCurrentLevel(v2, v3) > 10);
  }
}

- (void)receivedInterruptNotification:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("AccessoryDisconnectedNotification"));

  if (!v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AccessoryConnectedNotification")) & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:", CFSTR("accessoryModelNumberInList")));
      v11 = objc_msgSend(v10, "BOOLValue");

      if ((v11 & 1) == 0)
      {
        v13 = 0;
        +[BatteryDrainController setCode:forError:](BatteryDrainController, "setCode:forError:", -3, &v13);
        v7 = v13;
        goto LABEL_6;
      }
    }
    else
    {

    }
    v12 = 0;
    goto LABEL_9;
  }
  v14 = 0;
  +[BatteryDrainController setCode:forError:](BatteryDrainController, "setCode:forError:", -52, &v14);
  v7 = v14;
LABEL_6:
  v12 = v7;
LABEL_9:
  -[BatteryDrainController failedToExecuteWithError:](self, "failedToExecuteWithError:", v12);

}

- (void)recievedBatteryPercentageChangedNotification:(id)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  float v7;
  float v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  void *v13;
  float v14;
  float v15;
  float v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = DiagnosticLogHandleForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138412290;
    v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Battery level change notification recieved: %@", (uint8_t *)&v24, 0xCu);
  }

  objc_msgSend(v4, "floatValue");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "targetBatteryPercentage"));
  objc_msgSend(v10, "floatValue");
  v12 = v11;

  if (v8 <= v12)
  {
    v19 = DiagnosticLogHandleForCategory(3);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "targetBatteryPercentage"));
      v24 = 138412546;
      v25 = v4;
      v26 = 2112;
      v27 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "The current battery level (%@) is at or below target battery level (%@). Ending test", (uint8_t *)&v24, 0x16u);

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController result](self, "result"));
    objc_msgSend(v23, "setStatusCode:", &off_100010DF0);

    -[BatteryDrainController setFinished:](self, "setFinished:", 1);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController startingBatteryPercentage](self, "startingBatteryPercentage"));
    objc_msgSend(v13, "floatValue");
    v15 = v14;
    objc_msgSend(v4, "floatValue");
    v17 = llroundf((float)(v15 - v16) * 100.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController progress](self, "progress"));
    objc_msgSend(v18, "setCompletedUnitCount:", v17);

  }
}

- (void)recievedConnectedToChargerNotification:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  id v13;
  __int16 v14;
  uint8_t v15[2];
  uint8_t buf[16];

  v4 = DiagnosticLogHandleForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "The device is connected to charging.", buf, 2u);
  }

  if ((-[BatteryDrainController isCancelled](self, "isCancelled") & 1) != 0
    || -[BatteryDrainController isFinished](self, "isFinished"))
  {
    v6 = DiagnosticLogHandleForCategory(3);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      v8 = "Diagnostic is finished. Ignoring charge notification";
      v9 = v15;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
    v11 = objc_msgSend(v10, "disableUSBCharging");

    if (!v11 || !+[BatteryStateNotifier disableUSBCharging](BatteryStateNotifier, "disableUSBCharging"))
    {
      v13 = 0;
      +[BatteryDrainController setCode:forError:](BatteryDrainController, "setCode:forError:", -2, &v13);
      v7 = v13;
      -[BatteryDrainController failedToExecuteWithError:](self, "failedToExecuteWithError:", v7);
      goto LABEL_13;
    }
    -[BatteryDrainController setWasChargingDisabledDuringTest:](self, "setWasChargingDisabledDuringTest:", 1);
    v12 = DiagnosticLogHandleForCategory(3);
    v7 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 0;
      v8 = "USB Charging was successfully disabled.";
      v9 = (uint8_t *)&v14;
      goto LABEL_7;
    }
  }
LABEL_13:

}

- (void)recievedShutdownNotification
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  if ((int)OSThermalNotificationCurrentLevel(self, a2) > 10)
  {
    v4 = DiagnosticLogHandleForCategory(3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Shutdown may have been initiated by high thermals. Not sending success status.", v6, 2u);
    }

  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController result](self, "result"));
    objc_msgSend(v3, "setStatusCode:", &off_100010DF0);

    -[BatteryDrainController setFinished:](self, "setFinished:", 1);
  }
}

- (void)teardown
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v23;
  void *v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController drainQueue](self, "drainQueue"));
  objc_msgSend(v3, "cancelAllOperations");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
  v5 = objc_msgSend(v4, "autoBrightnessOff");

  if (v5 && -[BatteryDrainController wasAutoBrightnessEnabled](self, "wasAutoBrightnessEnabled"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController brightnessSystemClient](self, "brightnessSystemClient"));
    objc_msgSend(v6, "setProperty:forKey:", &__kCFBooleanTrue, CFSTR("DisplayAutoBrightnessActive"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController brightnessSystemClient](self, "brightnessSystemClient"));
    objc_msgSend(v7, "setProperty:forKey:", &__kCFBooleanTrue, CFSTR("DisplayBrightnessAuto"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController brightnessSystemClient](self, "brightnessSystemClient"));
    objc_msgSend(v8, "setProperty:forKey:", &__kCFBooleanTrue, CFSTR("ALSTurnOn"));

  }
  v9 = (id)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
  if (objc_msgSend(v9, "lowPowerModeOff"))
  {
    v10 = -[BatteryDrainController originalPowerModeSet](self, "originalPowerModeSet");

    if (!v10)
      goto LABEL_11;
    v9 = objc_alloc_init((Class)_PMLowPowerMode);
    if ((objc_msgSend(v9, "setPowerMode:fromSource:", -[BatteryDrainController originalPowerMode](self, "originalPowerMode"), CFSTR("Diagnostics")) & 1) == 0)
    {
      v11 = DiagnosticLogHandleForCategory(3);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[BatteryDrainController originalPowerMode](self, "originalPowerMode")));
        v23 = 138412290;
        v24 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Failed to restore original power mode %@", (uint8_t *)&v23, 0xCu);

      }
    }
  }

LABEL_11:
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController inputs](self, "inputs"));
  v15 = objc_msgSend(v14, "isAccessoryDetectorActive");

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryDrainController accessoryDisconnectDetector](self, "accessoryDisconnectDetector"));
    objc_msgSend(v16, "stop");

  }
  +[BatteryStateNotifier unregisterForBatteryEvents](BatteryStateNotifier, "unregisterForBatteryEvents");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v17, "removeObserver:", self);

  if (-[BatteryDrainController wasChargingDisabledDuringTest](self, "wasChargingDisabledDuringTest"))
  {
    v18 = +[BatteryStateNotifier enableUSBCharging](BatteryStateNotifier, "enableUSBCharging");
    v19 = DiagnosticLogHandleForCategory(3);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = v20;
    if (v18)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "USB Charging was successfully restored.", (uint8_t *)&v23, 2u);
      }
    }
    else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      sub_100008EEC(v21);
    }

  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
}

+ (BOOL)setCode:(int64_t)a3 forError:(id *)a4
{
  if (a4)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DABatteryDrainTestErrorDomain"), a3, 0));
  return a4 != 0;
}

- (BatteryDrainInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->_inputs, a3);
}

- (DKResponder)responder
{
  return self->_responder;
}

- (void)setResponder:(id)a3
{
  objc_storeStrong((id *)&self->_responder, a3);
}

- (NSOperationQueue)drainQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDrainQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSURL)audioFileURL
{
  return self->_audioFileURL;
}

- (void)setAudioFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_audioFileURL, a3);
}

- (NSNumber)runNumber
{
  return self->_runNumber;
}

- (void)setRunNumber:(id)a3
{
  objc_storeStrong((id *)&self->_runNumber, a3);
}

- (NSNumber)startingBatteryPercentage
{
  return self->_startingBatteryPercentage;
}

- (void)setStartingBatteryPercentage:(id)a3
{
  objc_storeStrong((id *)&self->_startingBatteryPercentage, a3);
}

- (BrightnessSystemClient)brightnessSystemClient
{
  return self->_brightnessSystemClient;
}

- (void)setBrightnessSystemClient:(id)a3
{
  objc_storeStrong((id *)&self->_brightnessSystemClient, a3);
}

- (DAAccessoryDisconnectDetector)accessoryDisconnectDetector
{
  return self->_accessoryDisconnectDetector;
}

- (void)setAccessoryDisconnectDetector:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryDisconnectDetector, a3);
}

- (DAAccessoryConnectDetector)accessoryConnectDetector
{
  return self->_accessoryConnectDetector;
}

- (void)setAccessoryConnectDetector:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryConnectDetector, a3);
}

- (UIDevice)currentDevice
{
  return (UIDevice *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCurrentDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BOOL)isThermalBlocked
{
  return self->_isThermalBlocked;
}

- (void)setIsThermalBlocked:(BOOL)a3
{
  self->_isThermalBlocked = a3;
}

- (BOOL)wasAutoBrightnessEnabled
{
  return self->_wasAutoBrightnessEnabled;
}

- (void)setWasAutoBrightnessEnabled:(BOOL)a3
{
  self->_wasAutoBrightnessEnabled = a3;
}

- (BOOL)originalPowerModeSet
{
  return self->_originalPowerModeSet;
}

- (void)setOriginalPowerModeSet:(BOOL)a3
{
  self->_originalPowerModeSet = a3;
}

- (int64_t)originalPowerMode
{
  return self->_originalPowerMode;
}

- (void)setOriginalPowerMode:(int64_t)a3
{
  self->_originalPowerMode = a3;
}

- (BOOL)wasChargingDisabledDuringTest
{
  return self->_wasChargingDisabledDuringTest;
}

- (void)setWasChargingDisabledDuringTest:(BOOL)a3
{
  self->_wasChargingDisabledDuringTest = a3;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_currentDevice, 0);
  objc_storeStrong((id *)&self->_accessoryConnectDetector, 0);
  objc_storeStrong((id *)&self->_accessoryDisconnectDetector, 0);
  objc_storeStrong((id *)&self->_brightnessSystemClient, 0);
  objc_storeStrong((id *)&self->_startingBatteryPercentage, 0);
  objc_storeStrong((id *)&self->_runNumber, 0);
  objc_storeStrong((id *)&self->_audioFileURL, 0);
  objc_storeStrong((id *)&self->_drainQueue, 0);
  objc_storeStrong((id *)&self->_responder, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
}

@end
