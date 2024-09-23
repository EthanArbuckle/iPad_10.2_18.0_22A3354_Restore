@implementation CameraSensorController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  -[CameraSensorController setInputs:](self, "setInputs:", a3, a4);
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  -[CameraSensorController disableAttentionDetection](self, "disableAttentionDetection");
  v3 = dispatch_queue_create("com.apple.DiagnosticsService.Diagnostic-4009.testQueue", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000650C;
  block[3] = &unk_100010540;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)teardown
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController alphaCamera](self, "alphaCamera"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController alphaCamera](self, "alphaCamera"));
    objc_msgSend(v4, "deactivate");

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController bravoCamera](self, "bravoCamera"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController alphaCamera](self, "alphaCamera"));
    objc_msgSend(v6, "deactivate");

  }
  -[CameraSensorController restoreAttentionDetection](self, "restoreAttentionDetection");
}

- (void)runCameraTest
{
  char v3;
  uint64_t v4;
  char v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  unsigned int v36;
  id v37;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  unsigned __int8 v43;
  id v44;
  void *v45;
  unsigned int v46;
  void *v47;
  void *v48;
  unsigned int v49;
  signed int v50;
  void *v51;
  signed int v52;
  void *v53;
  signed int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _UNKNOWN **v62;
  uint64_t v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  signed int v71;
  void *v72;
  signed int v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  signed int v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[3];
  _QWORD v88[3];

  v3 = MGGetBoolAnswer(CFSTR("YzrS+WPEMqyh/FBv/n/jvA"), a2);
  v5 = MGGetBoolAnswer(CFSTR("hnXJ1OpiiIL0+p3jUG/XxQ"), v4);
  -[CameraSensorController setAlphaCamera:](self, "setAlphaCamera:", 0);
  -[CameraSensorController setBravoCamera:](self, "setBravoCamera:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController inputs](self, "inputs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Front"));

  if ((v8 & 1) != 0)
  {
    v9 = 0;
    v10 = 0;
    v11 = 2;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController inputs](self, "inputs"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("FrontSuperWide"));

    if ((v14 & 1) != 0)
    {
      v9 = 0;
      v10 = 0;
      v11 = 5;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController inputs](self, "inputs"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("Rear"));

      if ((v17 & 1) != 0)
      {
        v9 = 0;
        v10 = 0;
        v11 = 1;
      }
      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController inputs](self, "inputs"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("RearTelephoto")) & v3;

        if ((v20 & 1) != 0)
        {
          v9 = 0;
          v10 = 0;
          v11 = 3;
        }
        else
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController inputs](self, "inputs"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
          v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("RearSynced")) & v3;

          if ((v23 & 1) != 0)
          {
            v11 = 1;
            v10 = 3;
            v9 = 1;
          }
          else
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController inputs](self, "inputs"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "identifier"));
            v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("RearSuperWide")) & v5;

            if ((v26 & 1) == 0)
            {
              v79 = (id)objc_claimAutoreleasedReturnValue(-[CameraSensorController result](self, "result"));
              objc_msgSend(v79, "setStatusCode:", &off_100010DF0);

              return;
            }
            v9 = 0;
            v10 = 0;
            v11 = 4;
          }
        }
      }
    }
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[OSDCameraCenter sharedCenter](OSDCameraCenter, "sharedCenter"));
  v84 = 0;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "cameraForSource:error:", v11, &v84));
  v29 = v84;
  -[CameraSensorController setAlphaCamera:](self, "setAlphaCamera:", v28);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController alphaCamera](self, "alphaCamera"));
  if (!v30)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController result](self, "result"));
    objc_msgSend(v45, "setStatusCode:", &off_100010E08);
LABEL_28:

    v37 = v29;
    goto LABEL_29;
  }
  if (!v9)
    goto LABEL_17;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[OSDCameraCenter sharedCenter](OSDCameraCenter, "sharedCenter"));
  v83 = v29;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "cameraForSource:error:", v10, &v83));
  v33 = v83;

  -[CameraSensorController setBravoCamera:](self, "setBravoCamera:", v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController bravoCamera](self, "bravoCamera"));

  if (!v34)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController result](self, "result"));
    objc_msgSend(v45, "setStatusCode:", &off_100010E20);
    v29 = v33;
    goto LABEL_28;
  }
  v29 = v33;
LABEL_17:
  -[CameraSensorController setSoloFrameCount:](self, "setSoloFrameCount:", 0);
  -[CameraSensorController setAlphaSyncFrameCount:](self, "setAlphaSyncFrameCount:", 0);
  -[CameraSensorController setBravoSyncFrameCount:](self, "setBravoSyncFrameCount:", 0);
  -[CameraSensorController setStreamTime:](self, "setStreamTime:", 0.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController alphaCamera](self, "alphaCamera"));
  v82 = v29;
  v36 = -[CameraSensorController setCameraProperties:error:](self, "setCameraProperties:error:", v35, &v82);
  v37 = v82;

  if (!v36)
    goto LABEL_29;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController inputs](self, "inputs"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "identifier"));
  v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("RearSynced"));

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController alphaCamera](self, "alphaCamera"));
  if (!v40)
  {
    v80 = v37;
    v46 = -[CameraSensorController streamCamera:error:](self, "streamCamera:error:", v41, &v80);
    v44 = v80;

    v37 = v44;
    if (!v46)
      goto LABEL_29;
LABEL_23:
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController inputs](self, "inputs"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "identifier"));
    v49 = objc_msgSend(v48, "isEqualToString:", CFSTR("RearSynced"));

    if (v49)
    {
      v50 = -[CameraSensorController alphaSyncFrameCount](self, "alphaSyncFrameCount");
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController inputs](self, "inputs"));
      v52 = objc_msgSend(v51, "framesToSample");

      v78 = -[CameraSensorController bravoSyncFrameCount](self, "bravoSyncFrameCount");
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController inputs](self, "inputs"));
      v54 = objc_msgSend(v53, "framesToSample");

      v87[0] = CFSTR("alphaSyncFrameCount");
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[CameraSensorController alphaSyncFrameCount](self, "alphaSyncFrameCount")));
      v88[0] = v55;
      v87[1] = CFSTR("bravoSyncFrameCount");
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[CameraSensorController bravoSyncFrameCount](self, "bravoSyncFrameCount")));
      v88[1] = v56;
      v87[2] = CFSTR("streamTime");
      -[CameraSensorController streamTime](self, "streamTime");
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      v88[2] = v57;
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v88, v87, 3));
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController result](self, "result"));
      objc_msgSend(v59, "setData:", v58);

      if (v50 >= v52 && v78 >= v54)
        goto LABEL_26;
    }
    else
    {
      v71 = -[CameraSensorController soloFrameCount](self, "soloFrameCount");
      v72 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController inputs](self, "inputs"));
      v73 = objc_msgSend(v72, "framesToSample");

      v85[0] = CFSTR("soloFrameCount");
      v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[CameraSensorController soloFrameCount](self, "soloFrameCount")));
      v85[1] = CFSTR("streamTime");
      v86[0] = v74;
      -[CameraSensorController streamTime](self, "streamTime");
      v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      v86[1] = v75;
      v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v86, v85, 2));
      v77 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController result](self, "result"));
      objc_msgSend(v77, "setData:", v76);

      if (v71 >= v73)
      {
LABEL_26:
        v60 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController result](self, "result"));
        v61 = v60;
        v62 = &off_100010E38;
LABEL_36:
        objc_msgSend(v60, "setStatusCode:", v62);

        return;
      }
    }
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController result](self, "result"));
    v61 = v60;
    v62 = &off_100010E50;
    goto LABEL_36;
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController bravoCamera](self, "bravoCamera"));
  v81 = v37;
  v43 = -[CameraSensorController syncAndStreamCameras:bravo:error:](self, "syncAndStreamCameras:bravo:error:", v41, v42, &v81);
  v44 = v81;

  v37 = v44;
  if ((v43 & 1) != 0)
    goto LABEL_23;
LABEL_29:
  if (v37)
  {
    v63 = DiagnosticLogHandleForCategory(3);
    v64 = objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      sub_10000A93C((uint64_t)v37, v64, v65, v66, v67, v68, v69, v70);

  }
}

- (BOOL)setCameraProperties:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController inputs](self, "inputs"));
  if (objc_msgSend(v7, "enableMaxDataRate"))
  {

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController inputs](self, "inputs"));
    v9 = objc_msgSend(v8, "enableTestPatternPN9");

    if (!v9)
    {
      v14 = 1;
      goto LABEL_14;
    }
  }
  if (objc_msgSend(v6, "activate:", a4))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController inputs](self, "inputs"));
    v11 = objc_msgSend(v10, "enableMaxDataRate");

    if (v11
      && !-[CameraSensorController enableCameraMaxDataRate:error:](self, "enableCameraMaxDataRate:error:", v6, a4))
    {
      v14 = 0;
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController inputs](self, "inputs"));
      v13 = objc_msgSend(v12, "enableTestPatternPN9");

      if (v13)
        v14 = -[CameraSensorController enableCameraTestPatternPN9:error:](self, "enableCameraTestPatternPN9:error:", v6, a4);
      else
        v14 = 1;
    }
    objc_msgSend(v6, "deactivate");
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController result](self, "result"));
    objc_msgSend(v15, "setStatusCode:", &off_100010E68);

    v14 = 0;
  }
LABEL_14:
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController inputs](self, "inputs"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "minimumFrameRate"));

  if (v14 && v17)
  {
    if ((objc_msgSend(v6, "activate:", a4) & 1) != 0)
    {
      LOBYTE(v14) = -[CameraSensorController setCameraMinimumFrameRate:frameRate:error:](self, "setCameraMinimumFrameRate:frameRate:error:", v6, v17, a4);
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController result](self, "result"));
      objc_msgSend(v18, "setStatusCode:", &off_100010E68);

      LOBYTE(v14) = 0;
    }
  }

  return v14;
}

- (BOOL)enableCameraMaxDataRate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  _UNKNOWN **v11;

  v6 = a3;
  if ((objc_msgSend(v6, "enableAgileClocking:error:", 0, a4) & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController result](self, "result"));
    v10 = v9;
    v11 = &off_100010E80;
    goto LABEL_7;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "useMaxAvailableDataRate:", a4));

  if (!v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController result](self, "result"));
    v10 = v9;
    v11 = &off_100010E98;
    goto LABEL_7;
  }
  v8 = 1;
  if ((objc_msgSend(v6, "enableAgileClocking:error:", 1, a4) & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController result](self, "result"));
    v10 = v9;
    v11 = &off_100010EB0;
LABEL_7:
    objc_msgSend(v9, "setStatusCode:", v11);

    v8 = 0;
  }

  return v8;
}

- (BOOL)enableCameraTestPatternPN9:(id)a3 error:(id *)a4
{
  unsigned __int8 v5;
  void *v6;

  v5 = objc_msgSend(a3, "enableTestPatternPN9:error:", 1, a4);
  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController result](self, "result"));
    objc_msgSend(v6, "setStatusCode:", &off_100010EC8);

  }
  return v5;
}

- (BOOL)setCameraMinimumFrameRate:(id)a3 frameRate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
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
  uint64_t v35;
  BOOL v36;
  CameraSensorController *v38;
  id *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "supportedFormats:", a5));
  v11 = v10;
  if (v10)
  {
    v38 = self;
    v39 = a5;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v41;
      v16 = kFigSupportedFormat_VideoMinFrameRate;
LABEL_4:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v41 != v15)
          objc_enumerationMutation(v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v17), "objectForKeyedSubscript:", v16, v38));
        v19 = v18;
        if (v18)
        {
          v20 = objc_msgSend(v18, "intValue");
          if (v20 <= (int)objc_msgSend(v9, "intValue"))
            break;
        }

        if (v14 == (id)++v17)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
          if (v14)
            goto LABEL_4;
          goto LABEL_11;
        }
      }

      if ((objc_msgSend(v8, "setMinimumFrameRate:error:", v9, v39) & 1) != 0)
      {
        v36 = 1;
        goto LABEL_19;
      }
      v22 = objc_claimAutoreleasedReturnValue(-[CameraSensorController result](v38, "result"));
      -[NSObject setStatusCode:](v22, "setStatusCode:", &off_100010EE0);
    }
    else
    {
LABEL_11:

      v21 = DiagnosticLogHandleForCategory(3);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_10000AA08((uint64_t)v9, v22, v23, v24, v25, v26, v27, v28);
    }
  }
  else
  {
    v29 = DiagnosticLogHandleForCategory(3);
    v22 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_10000A9A0((uint64_t)a5, v22, v30, v31, v32, v33, v34, v35);
  }

  v36 = 0;
LABEL_19:

  return v36;
}

- (BOOL)streamCamera:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_group_t v7;
  NSObject *v8;
  void ***v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  double v13;
  dispatch_time_t v14;
  void *v15;
  void *v16;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  CameraSensorController *v22;
  NSObject *v23;

  v6 = a3;
  v7 = dispatch_group_create();
  if (objc_msgSend(v6, "activate:", a4))
  {
    v18 = _NSConcreteStackBlock;
    v19 = 3221225472;
    v20 = sub_100007460;
    v21 = &unk_100010568;
    v22 = self;
    v8 = v7;
    v23 = v8;
    v9 = objc_retainBlock(&v18);
    objc_msgSend(v6, "setFrameHandler:", v9, v18, v19, v20, v21, v22);
    v10 = objc_msgSend(v6, "startStreamingWithOptions:error:", 0, a4);
    if ((v10 & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      dispatch_group_enter(v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController inputs](self, "inputs"));
      objc_msgSend(v12, "frameSampleTimeout");
      v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
      dispatch_group_wait(v8, v14);

      objc_msgSend(v6, "stopStreaming:", a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v15, "timeIntervalSinceDate:", v11);
      -[CameraSensorController setStreamTime:](self, "setStreamTime:");

    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController result](self, "result"));
      objc_msgSend(v11, "setStatusCode:", &off_100010EF8);
    }

    objc_msgSend(v6, "deactivate");
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController result](self, "result"));
    objc_msgSend(v16, "setStatusCode:", &off_100010E68);

    v10 = 0;
  }

  return v10;
}

- (BOOL)syncAndStreamCameras:(id)a3 bravo:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  dispatch_group_t v10;
  NSObject *v11;
  NSObject *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _UNKNOWN **v19;
  void *v20;
  void *v21;
  double v22;
  dispatch_time_t v23;
  void *v24;
  void **v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  CameraSensorController *v30;
  NSObject *v31;
  _QWORD v32[5];
  NSObject *v33;

  v8 = a3;
  v9 = a4;
  v10 = dispatch_group_create();
  if (objc_msgSend(v9, "activate:", a5))
  {
    if (!objc_msgSend(v8, "activate:", a5))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController result](self, "result"));
      objc_msgSend(v15, "setStatusCode:", &off_100010E68);

      v13 = 0;
LABEL_15:
      objc_msgSend(v9, "deactivate");
      goto LABEL_16;
    }
    if (!+[OSDCameraCenter syncCameras:slave:skipSlaveFrames:enableSlaveOutput:error:](OSDCameraCenter, "syncCameras:slave:skipSlaveFrames:enableSlaveOutput:error:", v8, v9, 1, 1, a5))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController result](self, "result"));
      objc_msgSend(v16, "setStatusCode:", &off_100010F28);

      v13 = 0;
LABEL_14:
      objc_msgSend(v8, "deactivate");
      goto LABEL_15;
    }
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000077C8;
    v32[3] = &unk_100010568;
    v32[4] = self;
    v11 = v10;
    v33 = v11;
    objc_msgSend(v8, "setFrameHandler:", v32);
    v26 = _NSConcreteStackBlock;
    v27 = 3221225472;
    v28 = sub_100007848;
    v29 = &unk_100010568;
    v30 = self;
    v12 = v11;
    v31 = v12;
    objc_msgSend(v9, "setFrameHandler:", &v26);
    if ((objc_msgSend(v8, "startStreamingWithOptions:error:", 0, a5, v26, v27, v28, v29, v30) & 1) != 0)
    {
      if ((objc_msgSend(v9, "startStreamingWithOptions:error:", 0, a5) & 1) != 0)
      {
        v13 = 1;
LABEL_13:
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        dispatch_group_enter(v12);
        dispatch_group_enter(v12);
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController inputs](self, "inputs"));
        objc_msgSend(v21, "frameSampleTimeout");
        v23 = dispatch_time(0, (uint64_t)(v22 * 1000000000.0));
        dispatch_group_wait(v12, v23);

        objc_msgSend(v9, "stopStreaming:", a5);
        objc_msgSend(v8, "stopStreaming:", a5);
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        objc_msgSend(v24, "timeIntervalSinceDate:", v20);
        -[CameraSensorController setStreamTime:](self, "setStreamTime:");

        goto LABEL_14;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController result](self, "result"));
      v18 = v17;
      v19 = &off_100010F40;
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController result](self, "result"));
      v18 = v17;
      v19 = &off_100010EF8;
    }
    objc_msgSend(v17, "setStatusCode:", v19);

    v13 = 0;
    goto LABEL_13;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CameraSensorController result](self, "result"));
  objc_msgSend(v14, "setStatusCode:", &off_100010F10);

  objc_msgSend(v8, "deactivate");
  v13 = 0;
LABEL_16:

  return v13;
}

- (void)disableAttentionDetection
{
  -[CameraSensorController setAttentionDetectionSetting:](self, "setAttentionDetectionSetting:", _AXSAttentionAwarenessFeaturesEnabled(self, a2) != 0);
  _AXSSetAttentionAwarenessFeaturesEnabled(0);
}

- (void)restoreAttentionDetection
{
  _AXSSetAttentionAwarenessFeaturesEnabled(-[CameraSensorController attentionDetectionSetting](self, "attentionDetectionSetting"));
}

- (int)soloFrameCount
{
  return self->_soloFrameCount;
}

- (void)setSoloFrameCount:(int)a3
{
  self->_soloFrameCount = a3;
}

- (int)alphaSyncFrameCount
{
  return self->_alphaSyncFrameCount;
}

- (void)setAlphaSyncFrameCount:(int)a3
{
  self->_alphaSyncFrameCount = a3;
}

- (int)bravoSyncFrameCount
{
  return self->_bravoSyncFrameCount;
}

- (void)setBravoSyncFrameCount:(int)a3
{
  self->_bravoSyncFrameCount = a3;
}

- (double)streamTime
{
  return self->_streamTime;
}

- (void)setStreamTime:(double)a3
{
  self->_streamTime = a3;
}

- (OSDCamera)alphaCamera
{
  return self->_alphaCamera;
}

- (void)setAlphaCamera:(id)a3
{
  objc_storeStrong((id *)&self->_alphaCamera, a3);
}

- (OSDCamera)bravoCamera
{
  return self->_bravoCamera;
}

- (void)setBravoCamera:(id)a3
{
  objc_storeStrong((id *)&self->_bravoCamera, a3);
}

- (CameraSensorInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->_inputs, a3);
}

- (BOOL)attentionDetectionSetting
{
  return self->_attentionDetectionSetting;
}

- (void)setAttentionDetectionSetting:(BOOL)a3
{
  self->_attentionDetectionSetting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_bravoCamera, 0);
  objc_storeStrong((id *)&self->_alphaCamera, 0);
}

@end
