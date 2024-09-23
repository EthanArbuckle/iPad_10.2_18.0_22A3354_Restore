@implementation LegacyAudioSystemController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  unsigned int v26;
  id v27;
  void *v28;
  int v29;
  uint64_t v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  __int128 v35;
  void *v36;
  id obj;
  dispatch_semaphore_t v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  NSObject *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  id v61;
  _BYTE v62[128];

  v6 = a3;
  v7 = a4;
  v36 = v6;
  -[LegacyAudioSystemController setInputs:](self, "setInputs:", v6);
  v40 = v7;
  -[LegacyAudioSystemController setDiagnosticResponder:](self, "setDiagnosticResponder:", v7);
  if (-[LegacyAudioSystemController isDockRequired](self, "isDockRequired")
    && !-[LegacyAudioSystemController confirmDeviceDocked](self, "confirmDeviceDocked"))
  {
    v57 = 0;
    +[LegacyAudioSystemController setCode:forError:](LegacyAudioSystemController, "setCode:forError:", -52, &v57);
    v15 = v57;
    -[LegacyAudioSystemController failedToExecuteWithError:](self, "failedToExecuteWithError:", v15);
  }
  else
  {
    -[LegacyAudioSystemController setAccessibilityStateIfRequired](self, "setAccessibilityStateIfRequired");
    objc_msgSend(v7, "enableVolumeHUD:", 0);
    v38 = dispatch_semaphore_create(0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[LegacyAudioSystemController setFileNameToURL:](self, "setFileNameToURL:", v8);

    v9 = NSTemporaryDirectory();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v10, 1));

    v55 = 0u;
    v56 = 0u;
    v54 = 0u;
    v53 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController inputs](self, "inputs"));
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "requiredFiles"));

    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
    if (v12)
    {
      v14 = 0;
      v15 = 0;
      v16 = *(_QWORD *)v54;
      *(_QWORD *)&v13 = 138412546;
      v35 = v13;
      while (2)
      {
        v17 = 0;
        v18 = v14;
        do
        {
          if (*(_QWORD *)v54 != v16)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)v17);
          if ((-[LegacyAudioSystemController isCancelled](self, "isCancelled", v35) & 1) != 0)
          {
            v14 = v18;
            goto LABEL_27;
          }
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "UUIDString"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "URLByAppendingPathComponent:", v21));

          v47 = 0;
          v48 = &v47;
          v49 = 0x3032000000;
          v50 = sub_100005178;
          v51 = sub_100005188;
          v52 = 0;
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472;
          v44[2] = sub_100005190;
          v44[3] = &unk_100010428;
          v46 = &v47;
          v22 = v38;
          v45 = v22;
          objc_msgSend(v40, "getAsset:completion:", v19, v44);
          dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
          if (v48[5])
          {
            v23 = DiagnosticLogHandleForCategory(3);
            v24 = objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v59 = v14;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Saving asset data to [%@]", buf, 0xCu);
            }

            v25 = (void *)v48[5];
            v43 = v15;
            v26 = objc_msgSend(v25, "writeToURL:options:error:", v14, 268435457, &v43);
            v27 = v43;

            if (v26)
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController fileNameToURL](self, "fileNameToURL"));
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v14, v19);

              v29 = 1;
              v15 = v27;
            }
            else
            {
              v33 = DiagnosticLogHandleForCategory(3);
              v34 = objc_claimAutoreleasedReturnValue(v33);
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v35;
                v59 = v14;
                v60 = 2112;
                v61 = v27;
                _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Failed to save asset [%@]: %@", buf, 0x16u);
              }

              v42 = v27;
              +[LegacyAudioSystemController setCode:forError:](LegacyAudioSystemController, "setCode:forError:", -59, &v42);
              v15 = v42;

              -[LegacyAudioSystemController failedToExecuteWithError:](self, "failedToExecuteWithError:", v15);
              v29 = 0;
            }
          }
          else
          {
            v30 = DiagnosticLogHandleForCategory(3);
            v31 = objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v59 = v19;
              _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Failed to download asset: %@", buf, 0xCu);
            }

            v41 = v15;
            +[LegacyAudioSystemController setCode:forError:](LegacyAudioSystemController, "setCode:forError:", -1, &v41);
            v32 = v41;

            -[LegacyAudioSystemController failedToExecuteWithError:](self, "failedToExecuteWithError:", v32);
            v29 = 0;
            v15 = v32;
          }

          _Block_object_dispose(&v47, 8);
          if (!v29)
            goto LABEL_27;
          v17 = (char *)v17 + 1;
          v18 = v14;
        }
        while (v12 != v17);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
        if (v12)
          continue;
        break;
      }
LABEL_27:

    }
    else
    {
      v15 = 0;
    }

  }
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  -[LegacyAudioSystemController setUpEventNotifications](self, "setUpEventNotifications");
  -[LegacyAudioSystemController saveOriginalVolumes](self, "saveOriginalVolumes");
  v3 = dispatch_queue_create("com.apple.DiagnosticsService.Diagnostic-3909.audioQueue", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000525C;
  block[3] = &unk_100010450;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)failedToExecuteWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController result](self, "result"));
  objc_msgSend(v5, "setData:", &__NSDictionary0__struct);

  v6 = objc_msgSend(v4, "code");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController result](self, "result"));
  objc_msgSend(v8, "setStatusCode:", v7);

  -[LegacyAudioSystemController cancel](self, "cancel");
  -[LegacyAudioSystemController setFinished:](self, "setFinished:", 1);
}

- (void)cleanUpPlayResults
{
  id v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *j;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController playResults](self, "playResults"));
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v18;
          do
          {
            for (j = 0; j != v9; j = (char *)j + 1)
            {
              if (*(_QWORD *)v18 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)j);
              if (objc_msgSend(v12, "count"))
              {
                v13 = 0;
                do
                {
                  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v13));
                  v15 = v14;
                  if (!v13)
                    objc_msgSend(v14, "freeSourceData");
                  objc_msgSend(v15, "freeReceivedData");

                  ++v13;
                }
                while ((unint64_t)objc_msgSend(v12, "count") > v13);
              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v9);
        }

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v3);
  }

}

- (void)setUpEventNotifications
{
  DAMotionDetector *v3;
  DAAudioSessionInterruptDetector *v4;
  DAAccessoryDisconnectDetector *v5;
  void *v6;
  void *v7;
  DAAccessoryDisconnectDetector *v8;
  DAHeadphonesDetector *v9;
  void *v10;
  void *v11;
  DAOrientationDetector *v12;
  void *v13;
  void *v14;
  DAOrientationDetector *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _QWORD v33[5];

  v3 = -[DAMotionDetector initWithThreshold:]([DAMotionDetector alloc], "initWithThreshold:", &off_1000108D0);
  -[LegacyAudioSystemController setMotionDetector:](self, "setMotionDetector:", v3);

  v4 = objc_alloc_init(DAAudioSessionInterruptDetector);
  -[LegacyAudioSystemController setAudioSessionInterruptDetector:](self, "setAudioSessionInterruptDetector:", v4);

  v5 = [DAAccessoryDisconnectDetector alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController inputs](self, "inputs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessoryModelNumbers"));
  v8 = -[DAAccessoryDisconnectDetector initWithModelNumbers:](v5, "initWithModelNumbers:", v7);
  -[LegacyAudioSystemController setAccessoryDisconnectDetector:](self, "setAccessoryDisconnectDetector:", v8);

  v9 = objc_alloc_init(DAHeadphonesDetector);
  -[LegacyAudioSystemController setHeadphoneDetector:](self, "setHeadphoneDetector:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController inputs](self, "inputs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "xComponentAccelThreshold"));

  if (v11)
  {
    v12 = [DAOrientationDetector alloc];
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController inputs](self, "inputs"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "xComponentAccelThreshold"));
    v15 = -[DAOrientationDetector initWithxThreshold:zThreshold:](v12, "initWithxThreshold:zThreshold:", v14, &off_100010870);
    -[LegacyAudioSystemController setOrientationDetector:](self, "setOrientationDetector:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v33[0] = CFSTR("MotionDetectedNotification");
  v33[1] = CFSTR("HeadphonesConnectedNotification");
  v33[2] = CFSTR("AccessoryDisconnectedNotification");
  v33[3] = CFSTR("AudioSessionInterruptNotification");
  v33[4] = CFSTR("IncorrectOrientationNotification");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v17 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 5));
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(v16, "addObserver:selector:name:object:", self, "receivedNotification:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), 0, (_QWORD)v28);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v19);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController motionDetector](self, "motionDetector"));
  objc_msgSend(v22, "start");

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController audioSessionInterruptDetector](self, "audioSessionInterruptDetector"));
  objc_msgSend(v23, "start");

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController accessoryDisconnectDetector](self, "accessoryDisconnectDetector"));
  objc_msgSend(v24, "start");

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController headphoneDetector](self, "headphoneDetector"));
  objc_msgSend(v25, "start");

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController orientationDetector](self, "orientationDetector"));
  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController orientationDetector](self, "orientationDetector"));
    objc_msgSend(v27, "start");

  }
}

- (void)receivedNotification:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  unsigned int v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  void *v33;
  _BYTE v34[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("HeadphonesConnectedNotification"));

  if (v6)
  {
    v33 = 0;
    +[LegacyAudioSystemController setCode:forError:](LegacyAudioSystemController, "setCode:forError:", -54, &v33);
    v7 = v33;
    goto LABEL_21;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("MotionDetectedNotification"));

  if (v9)
  {
    v32 = 0;
    +[LegacyAudioSystemController setCode:forError:](LegacyAudioSystemController, "setCode:forError:", -53, &v32);
    v7 = v32;
    goto LABEL_21;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  if (!objc_msgSend(v10, "isEqualToString:", CFSTR("AccessoryDisconnectedNotification")))
  {

LABEL_17:
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("AudioSessionInterruptNotification"));

    if (v21)
    {
      v26 = 0;
      +[LegacyAudioSystemController setCode:forError:](LegacyAudioSystemController, "setCode:forError:", -56, &v26);
      v7 = v26;
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
      v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("IncorrectOrientationNotification"));

      if (!v23)
      {
        v13 = 0;
        goto LABEL_22;
      }
      v25 = 0;
      +[LegacyAudioSystemController setCode:forError:](LegacyAudioSystemController, "setCode:forError:", -61, &v25);
      v7 = v25;
    }
LABEL_21:
    v13 = v7;
LABEL_22:
    -[LegacyAudioSystemController failedToExecuteWithError:](self, "failedToExecuteWithError:", v13);
    goto LABEL_23;
  }
  v11 = -[LegacyAudioSystemController isDockRequired](self, "isDockRequired");

  if (!v11)
    goto LABEL_17;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("accessoryModelNumber")));

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController inputs](self, "inputs"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "accessoryModelNumbers"));

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v29;
    while (2)
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(v15);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v19), "isEqualToString:", v13) & 1) != 0)
        {
          v27 = 0;
          +[LegacyAudioSystemController setCode:forError:](LegacyAudioSystemController, "setCode:forError:", -52, &v27);
          v24 = v27;

          v13 = v24;
          goto LABEL_22;
        }
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v17)
        continue;
      break;
    }
  }

LABEL_23:
}

- (BOOL)confirmDeviceDocked
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
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController inputs](self, "inputs"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accessoryModelNumbers"));
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

- (BOOL)isDockRequired
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController inputs](self, "inputs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessoryModelNumbers"));
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

+ (BOOL)setCode:(int64_t)a3 forError:(id *)a4
{
  if (a4)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DAAudioQualityErrorDomain"), a3, 0));
  return a4 != 0;
}

- (void)cancel
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController audioDevice](self, "audioDevice"));
  objc_msgSend(v2, "cancel");

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
  id v14;

  -[LegacyAudioSystemController restoreAccesibilityStateIfRequired](self, "restoreAccesibilityStateIfRequired");
  -[LegacyAudioSystemController restoreOriginalVolumes](self, "restoreOriginalVolumes");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController motionDetector](self, "motionDetector"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController motionDetector](self, "motionDetector"));
    objc_msgSend(v4, "stop");

    -[LegacyAudioSystemController setMotionDetector:](self, "setMotionDetector:", 0);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController audioSessionInterruptDetector](self, "audioSessionInterruptDetector"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController audioSessionInterruptDetector](self, "audioSessionInterruptDetector"));
    objc_msgSend(v6, "stop");

    -[LegacyAudioSystemController setAudioSessionInterruptDetector:](self, "setAudioSessionInterruptDetector:", 0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController orientationDetector](self, "orientationDetector"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController orientationDetector](self, "orientationDetector"));
    objc_msgSend(v8, "stop");

    -[LegacyAudioSystemController setOrientationDetector:](self, "setOrientationDetector:", 0);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController accessoryDisconnectDetector](self, "accessoryDisconnectDetector"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController accessoryDisconnectDetector](self, "accessoryDisconnectDetector"));
    objc_msgSend(v10, "stop");

    -[LegacyAudioSystemController setAccessoryDisconnectDetector:](self, "setAccessoryDisconnectDetector:", 0);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController headphoneDetector](self, "headphoneDetector"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController headphoneDetector](self, "headphoneDetector"));
    objc_msgSend(v12, "stop");

    -[LegacyAudioSystemController setHeadphoneDetector:](self, "setHeadphoneDetector:", 0);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "removeObserver:", self);

  -[LegacyAudioSystemController cleanUpPlayResults](self, "cleanUpPlayResults");
  v14 = (id)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController diagnosticResponder](self, "diagnosticResponder"));
  objc_msgSend(v14, "enableVolumeHUD:", 1);

}

- (void)restoreAccesibilityStateIfRequired
{
  id v3;

  if (-[LegacyAudioSystemController monoChanged](self, "monoChanged"))
    _AXSMonoAudioSetEnabled(-[LegacyAudioSystemController isOriginallyMono](self, "isOriginallyMono"));
  if (-[LegacyAudioSystemController balanceChanged](self, "balanceChanged"))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[LegacyAudioSystemController originalBalance](self, "originalBalance"));
    _AXSSetLeftRightAudioBalance(objc_msgSend(v3, "floatValue"));

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

- (void)setAccessibilityStateIfRequired
{
  id v3;
  uint64_t v4;
  double v5;
  id v6;
  uint64_t v7;

  -[LegacyAudioSystemController setMonoChanged:](self, "setMonoChanged:", 0);
  -[LegacyAudioSystemController setBalanceChanged:](self, "setBalanceChanged:", 0);
  if (-[LegacyAudioSystemController isMonoChangeRequired](self, "isMonoChangeRequired"))
  {
    -[LegacyAudioSystemController setIsOriginallyMono:](self, "setIsOriginallyMono:", 1);
    _AXSMonoAudioSetEnabled(0);
    -[LegacyAudioSystemController setMonoChanged:](self, "setMonoChanged:", 1);
  }
  if (-[LegacyAudioSystemController isBalanceChangeRequired](self, "isBalanceChangeRequired"))
  {
    v3 = objc_alloc((Class)NSNumber);
    *(float *)&v5 = _AXSLeftRightAudioBalance(v3, v4);
    v6 = objc_msgSend(v3, "initWithFloat:", v5);
    -[LegacyAudioSystemController setOriginalBalance:](self, "setOriginalBalance:", v6);

    _AXSSetLeftRightAudioBalance(v7);
    -[LegacyAudioSystemController setBalanceChanged:](self, "setBalanceChanged:", 1);
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
  -[LegacyAudioSystemController setPreviousDeviceVolumePlayAndRecord:](self, "setPreviousDeviceVolumePlayAndRecord:", v5);
  LODWORD(v6) = v12;
  -[LegacyAudioSystemController setPreviousDeviceVolumeAudioVideo:](self, "setPreviousDeviceVolumeAudioVideo:", v6);
  v7 = DiagnosticLogHandleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[LegacyAudioSystemController previousDeviceVolumePlayAndRecord](self, "previousDeviceVolumePlayAndRecord");
    v10 = v9;
    -[LegacyAudioSystemController previousDeviceVolumeAudioVideo](self, "previousDeviceVolumeAudioVideo");
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
  -[LegacyAudioSystemController previousDeviceVolumePlayAndRecord](self, "previousDeviceVolumePlayAndRecord");
  objc_msgSend(v3, "setVolumeTo:forCategory:", CFSTR("PlayAndRecord"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
  -[LegacyAudioSystemController previousDeviceVolumeAudioVideo](self, "previousDeviceVolumeAudioVideo");
  objc_msgSend(v4, "setVolumeTo:forCategory:", CFSTR("Audio/Video"));

  v5 = DiagnosticLogHandleForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[LegacyAudioSystemController previousDeviceVolumePlayAndRecord](self, "previousDeviceVolumePlayAndRecord");
    v8 = v7;
    -[LegacyAudioSystemController previousDeviceVolumeAudioVideo](self, "previousDeviceVolumeAudioVideo");
    v10 = 134218240;
    v11 = v8;
    v12 = 2048;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Restore original volumes to previousDeviceVolumePlayAndRecord:%f, previousDeviceVolumeAudioVideo:%f", (uint8_t *)&v10, 0x16u);
  }

}

- (DAAudioDevice)audioDevice
{
  return self->_audioDevice;
}

- (void)setAudioDevice:(id)a3
{
  objc_storeStrong((id *)&self->_audioDevice, a3);
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

- (DAAudioSessionInterruptDetector)audioSessionInterruptDetector
{
  return self->_audioSessionInterruptDetector;
}

- (void)setAudioSessionInterruptDetector:(id)a3
{
  objc_storeStrong((id *)&self->_audioSessionInterruptDetector, a3);
}

- (NSMutableDictionary)fileNameToURL
{
  return self->_fileNameToURL;
}

- (void)setFileNameToURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileNameToURL, a3);
}

- (NSMutableArray)playResults
{
  return self->_playResults;
}

- (void)setPlayResults:(id)a3
{
  objc_storeStrong((id *)&self->_playResults, a3);
}

- (DKResponder)diagnosticResponder
{
  return self->_diagnosticResponder;
}

- (void)setDiagnosticResponder:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticResponder, a3);
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

- (AudioSystemInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->_inputs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_originalBalance, 0);
  objc_storeStrong((id *)&self->_diagnosticResponder, 0);
  objc_storeStrong((id *)&self->_playResults, 0);
  objc_storeStrong((id *)&self->_fileNameToURL, 0);
  objc_storeStrong((id *)&self->_audioSessionInterruptDetector, 0);
  objc_storeStrong((id *)&self->_orientationDetector, 0);
  objc_storeStrong((id *)&self->_headphoneDetector, 0);
  objc_storeStrong((id *)&self->_accessoryDisconnectDetector, 0);
  objc_storeStrong((id *)&self->_motionDetector, 0);
  objc_storeStrong((id *)&self->_audioDevice, 0);
}

@end
