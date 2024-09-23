@implementation ButtonSwitchInputViewController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  unsigned int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  unsigned int v50;
  void *v51;
  void *v52;
  unsigned int v53;
  void *v54;
  void *v55;
  unsigned int v56;
  void *v57;
  void *v58;
  unsigned int v59;
  void *v60;
  void *v61;
  unsigned int v62;
  id v63;
  id v64;
  uint64_t v65;
  NSObject *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  DAButtonSwitchState *v79;
  void *v80;
  void *v81;
  DAButtonSwitchState *v82;
  void *v83;
  DAButtonSwitchState *v84;
  void *v85;
  void *v86;
  DAButtonSwitchState *v87;
  id v88;
  void *v89;
  unsigned int v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  _QWORD v99[4];
  id v100;
  _QWORD v101[4];
  id v102;
  id v103;
  _QWORD v104[4];
  NSObject *v105;
  id *v106;
  id location;
  id *p_location;
  uint64_t v109;
  uint64_t (*v110)(uint64_t, uint64_t);
  void (*v111)(uint64_t);
  id v112;
  _QWORD v113[3];
  _QWORD v114[3];
  uint8_t buf[4];
  void *v116;

  v6 = a3;
  v98 = a4;
  -[ButtonSwitchInputViewController setInputs:](self, "setInputs:", v6);
  -[ButtonSwitchInputViewController setupTest](self, "setupTest");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "buttonSwitchSpecification"));

  if (v8)
  {
    v9 = dispatch_semaphore_create(0);
    location = 0;
    p_location = &location;
    v109 = 0x3032000000;
    v110 = sub_100007C78;
    v111 = sub_100007C88;
    v112 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "buttonSwitchSpecification"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "asset"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
    v104[0] = _NSConcreteStackBlock;
    v104[1] = 3221225472;
    v104[2] = sub_100007C90;
    v104[3] = &unk_1000104D0;
    v106 = &location;
    v14 = v9;
    v105 = v14;
    objc_msgSend(v98, "getAsset:completion:", v13, v104);

    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    v15 = p_location[5];
    if (v15)
    {
      v16 = objc_alloc((Class)UIImage);
      v17 = objc_msgSend(v16, "initWithData:", p_location[5]);
      -[ButtonSwitchInputViewController setSpriteImage:](self, "setSpriteImage:", v17);

    }
    else
    {
      v27 = DiagnosticLogHandleForCategory(3);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "buttonSwitchSpecification"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "asset"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "name"));
        *(_DWORD *)buf = 138412290;
        v116 = v47;
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to download asset %@", buf, 0xCu);

      }
      -[ButtonSwitchInputViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_100011198);
    }

    _Block_object_dispose(&location, 8);
    if (v15)
    {
      -[ButtonSwitchInputViewController setTargetButtonEvents:](self, "setTargetButtonEvents:", 0xFFFFFFFFLL);
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "identifier"));
      v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("Home"));

      if (v31)
      {
        -[ButtonSwitchInputViewController setTargetButtonEvents:](self, "setTargetButtonEvents:", 3);
      }
      else
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "identifier"));
        v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("RingerButton"));

        if (v34)
        {
          -[ButtonSwitchInputViewController setTargetButtonEvents:](self, "setTargetButtonEvents:", 805306368);
        }
        else
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "identifier"));
          v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("Ringer"));

          if (v37)
          {
            -[ButtonSwitchInputViewController setTargetButtonEvents:](self, "setTargetButtonEvents:", 12);
          }
          else
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "identifier"));
            v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("Sleep"));

            if (v40)
            {
              -[ButtonSwitchInputViewController setTargetButtonEvents:](self, "setTargetButtonEvents:", 48);
            }
            else
            {
              v41 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "identifier"));
              v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("VolumeIncrement"));

              if (v43)
              {
                -[ButtonSwitchInputViewController setTargetButtonEvents:](self, "setTargetButtonEvents:", 192);
              }
              else
              {
                v48 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
                v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "identifier"));
                v50 = objc_msgSend(v49, "isEqualToString:", CFSTR("VolumeDecrement"));

                if (v50)
                {
                  -[ButtonSwitchInputViewController setTargetButtonEvents:](self, "setTargetButtonEvents:", 768);
                }
                else
                {
                  v51 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
                  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "identifier"));
                  v53 = objc_msgSend(v52, "isEqualToString:", CFSTR("DigitalCrown"));

                  if (v53)
                  {
                    -[ButtonSwitchInputViewController setTargetButtonEvents:](self, "setTargetButtonEvents:", 3072);
                  }
                  else
                  {
                    v54 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
                    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "identifier"));
                    v56 = objc_msgSend(v55, "isEqualToString:", CFSTR("Side"));

                    if (v56)
                    {
                      -[ButtonSwitchInputViewController setTargetButtonEvents:](self, "setTargetButtonEvents:", 12288);
                    }
                    else
                    {
                      v57 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
                      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "identifier"));
                      v59 = objc_msgSend(v58, "isEqualToString:", CFSTR("App"));

                      if (v59)
                      {
                        -[ButtonSwitchInputViewController setTargetButtonEvents:](self, "setTargetButtonEvents:", 201326592);
                      }
                      else
                      {
                        v60 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
                        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "identifier"));
                        v62 = objc_msgSend(v61, "isEqualToString:", CFSTR("Camera"));

                        if (v62)
                        {
                          -[ButtonSwitchInputViewController setTargetButtonEvents:](self, "setTargetButtonEvents:", 0);
                          v103 = 0;
                          v63 = objc_msgSend(objc_alloc((Class)CHHapticEngine), "initAndReturnError:", &v103);
                          v64 = v103;
                          -[ButtonSwitchInputViewController setHapticEngine:](self, "setHapticEngine:", v63);

                          if (v64)
                          {
                            v65 = DiagnosticLogHandleForCategory(3);
                            v66 = objc_claimAutoreleasedReturnValue(v65);
                            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                              sub_10000AB28((uint64_t)v64, v66, v67, v68, v69, v70, v71, v72);

                            -[ButtonSwitchInputViewController setHapticEngine:](self, "setHapticEngine:", 0);
                          }
                          else
                          {
                            objc_initWeak(&location, self);
                            v73 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController hapticEngine](self, "hapticEngine"));
                            v101[0] = _NSConcreteStackBlock;
                            v101[1] = 3221225472;
                            v101[2] = sub_100007CDC;
                            v101[3] = &unk_1000104F8;
                            objc_copyWeak(&v102, &location);
                            objc_msgSend(v73, "setResetHandler:", v101);

                            v74 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController hapticEngine](self, "hapticEngine"));
                            objc_msgSend(v74, "setStoppedHandler:", &stru_100010538);

                            objc_destroyWeak(&v102);
                            objc_destroyWeak(&location);
                          }

                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      v75 = objc_alloc_init((Class)DSHardwareButtonEventMonitor);
      -[ButtonSwitchInputViewController setButtonEventMonitor:](self, "setButtonEventMonitor:", v75);

      objc_initWeak(&location, self);
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController buttonEventMonitor](self, "buttonEventMonitor"));
      v99[0] = _NSConcreteStackBlock;
      v99[1] = 3221225472;
      v99[2] = sub_100007E68;
      v99[3] = &unk_1000104F8;
      objc_copyWeak(&v100, &location);
      objc_msgSend(v76, "startWithPriority:completion:", 200, v99);

      v77 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "switchParameters"));

      if (v78)
      {
        v79 = [DAButtonSwitchState alloc];
        v80 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
        v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "identifier"));
        v82 = (DAButtonSwitchState *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
        v83 = (void *)objc_claimAutoreleasedReturnValue(-[DAButtonSwitchState switchParameters](v82, "switchParameters"));
        v84 = -[DAButtonSwitchState initWithIdentifier:startingState:](v79, "initWithIdentifier:startingState:", v81, objc_msgSend(v83, "startingState"));
        -[ButtonSwitchInputViewController setButtonSwitchState:](self, "setButtonSwitchState:", v84);

      }
      else
      {
        v85 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
        v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "buttonParameters"));

        if (!v86)
        {
LABEL_41:
          -[ButtonSwitchInputViewController setIsInputMonitoringPaused:](self, "setIsInputMonitoringPaused:", 0);
          -[ButtonSwitchInputViewController setButtonFailure:](self, "setButtonFailure:", 0);
          v88 = objc_alloc_init((Class)NSMutableArray);
          -[ButtonSwitchInputViewController setAllResults:](self, "setAllResults:", v88);

          v89 = (void *)objc_claimAutoreleasedReturnValue(+[DSTestAutomation sharedInstance](DSTestAutomation, "sharedInstance"));
          v90 = objc_msgSend(v89, "testAutomationEnabled");

          if (v90)
          {
            v113[0] = CFSTR("parameters");
            v91 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
            v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "parameters"));
            v114[0] = v92;
            v113[1] = CFSTR("predicates");
            v93 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
            v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "predicates"));
            v114[1] = v94;
            v113[2] = CFSTR("specifications");
            v95 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
            v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "specifications"));
            v114[2] = v96;
            v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v114, v113, 3));
            +[DSTestAutomation postConfiguration:](DSTestAutomation, "postConfiguration:", v97);

          }
          objc_destroyWeak(&v100);
          objc_destroyWeak(&location);
          goto LABEL_44;
        }
        v87 = [DAButtonSwitchState alloc];
        v80 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
        v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "identifier"));
        v82 = -[DAButtonSwitchState initWithIdentifier:](v87, "initWithIdentifier:", v81);
        -[ButtonSwitchInputViewController setButtonSwitchState:](self, "setButtonSwitchState:", v82);
      }

      goto LABEL_41;
    }
  }
  else
  {
    v18 = DiagnosticLogHandleForCategory(3);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_10000AAF4(v19, v20, v21, v22, v23, v24, v25, v26);

    -[ButtonSwitchInputViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_1000111B0);
  }
LABEL_44:

}

- (void)start
{
  -[ButtonSwitchInputViewController setupView](self, "setupView");
  -[ButtonSwitchInputViewController setupTouchButtonInteractions](self, "setupTouchButtonInteractions");
}

- (BOOL)setupTest
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "type"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Button"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
  v7 = v6;
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "buttonParameters"));

    -[ButtonSwitchInputViewController setCurrentSegment:](self, "setCurrentSegment:", 0xFFFFFFFFLL);
    -[ButtonSwitchInputViewController setIsSecondEvent:](self, "setIsSecondEvent:", 0);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "type"));
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Switch"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
    v12 = v11;
    if (v10)
    {
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "switchParameters"));
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "type"));
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("TouchButton"));

      if (!v15)
      {
        v8 = 0;
        return v8 != 0;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "touchButtonParameters"));
    }
    v8 = (void *)v13;

    -[ButtonSwitchInputViewController setCurrentSegment:](self, "setCurrentSegment:", 0xFFFFFFFFLL);
  }

  return v8 != 0;
}

- (void)setupView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  unsigned int v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = objc_alloc((Class)UIImageView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "buttonSwitchSpecification"));
  objc_msgSend(v7, "position");
  v8 = objc_msgSend(v5, "initWithFrame:");
  -[ButtonSwitchInputViewController setTestImage:](self, "setTestImage:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController testImage](self, "testImage"));
  objc_msgSend(v9, "addSubview:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "switchParameters"));

  if (v12)
  {
    v13 = -[ButtonSwitchInputViewController checkCurrentSwitchState](self, "checkCurrentSwitchState");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "switchParameters"));
    v16 = objc_msgSend(v15, "startingState");

    if (v13 == v16)
      -[ButtonSwitchInputViewController setCurrentSegment:](self, "setCurrentSegment:", -[ButtonSwitchInputViewController currentSegment](self, "currentSegment") + 1);
    else
      -[ButtonSwitchInputViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_1000111C8);
  }
  -[ButtonSwitchInputViewController startTimer](self, "startTimer");
  -[ButtonSwitchInputViewController showNextSegment](self, "showNextSegment");
}

- (void)setupTouchButtonInteractions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;

  if (+[CBSUtilities isCheckerBoardActive](CBSUtilities, "isCheckerBoardActive"))
  {
    +[CBSUtilities enableTouchButtonEvents](CBSUtilities, "enableTouchButtonEvents");
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[_UIPhysicalButtonConfiguration _cameraCaptureShutterConfigurationWithOptionsProvider:](_UIPhysicalButtonConfiguration, "_cameraCaptureShutterConfigurationWithOptionsProvider:", 0));
    v4 = objc_msgSend(objc_alloc((Class)_UIPhysicalButtonInteraction), "initWithConfigurations:delegate:", v3, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController view](self, "view"));
    objc_msgSend(v5, "addInteraction:", v4);

  }
  v8 = (id)objc_claimAutoreleasedReturnValue(+[DAHIDEventMonitor sharedInstance](DAHIDEventMonitor, "sharedInstance"));
  objc_msgSend(v8, "setDelegate:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", &off_1000111E0));
  v7 = objc_msgSend(v8, "startMonitoringWithHIDEvents:", v6);

  if ((v7 & 1) == 0)
    -[ButtonSwitchInputViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_1000111F8);

}

- (void)showNextSegment
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  BOOL v23;
  _UNKNOWN **v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD block[5];

  -[ButtonSwitchInputViewController setCurrentSegment:](self, "setCurrentSegment:", -[ButtonSwitchInputViewController currentSegment](self, "currentSegment") + 1);
  -[ButtonSwitchInputViewController setCurrentSegmentActionCount:](self, "setCurrentSegmentActionCount:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "buttonParameters"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "buttonParameters"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "segments"));
    v9 = objc_msgSend(v8, "count");
    if ((unint64_t)v9 <= -[ButtonSwitchInputViewController currentSegment](self, "currentSegment"))
    {

      goto LABEL_17;
    }
    v29 = v8;
    v30 = v7;
    v31 = v6;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "switchParameters"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "switchParameters"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "states"));
    v14 = objc_msgSend(v2, "count");
    if ((unint64_t)v14 <= -[ButtonSwitchInputViewController currentSegment](self, "currentSegment"))
    {
      v23 = 1;
LABEL_13:

      goto LABEL_14;
    }
    v27 = v13;
    v28 = v12;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "touchButtonParameters"));
  if (v16)
  {
    v17 = (void *)v16;
    v26 = v4;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
    v25 = v10;
    v19 = v2;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "touchButtonParameters"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "targetEvents"));
    v22 = objc_msgSend(v21, "count");
    v23 = (unint64_t)v22 <= -[ButtonSwitchInputViewController currentSegment](self, "currentSegment");

    v2 = v19;
    v10 = v25;

    v4 = v26;
  }
  else
  {

    v23 = 0;
  }
  v13 = v27;
  v12 = v28;
  if (v11)
    goto LABEL_13;
LABEL_14:

  if (v5)
  {

  }
  if (!v23)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000859C;
    block[3] = &unk_100010430;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    return;
  }
LABEL_17:
  if (-[ButtonSwitchInputViewController buttonFailure](self, "buttonFailure"))
    v24 = &off_100011210;
  else
    v24 = &off_100011228;
  -[ButtonSwitchInputViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", v24);
}

- (void)showTransitionWithRange:(_NSRange)a3 WithCompletionHandler:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  dispatch_time_t v19;
  _QWORD block[4];
  id v21;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  v8 = v7;
  if (length)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController testImage](self, "testImage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController spriteImage](self, "spriteImage"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "buttonSwitchSpecification"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "asset"));
    objc_msgSend(v13, "size");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[DASpriteImage imagesFromSprite:inRange:withImageSize:](DASpriteImage, "imagesFromSprite:inRange:withImageSize:", v10, location, length));
    objc_msgSend(v9, "setAnimationImages:", v14);

    v15 = (double)length / 60.0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController testImage](self, "testImage"));
    objc_msgSend(v16, "setAnimationRepeatCount:", 1);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController testImage](self, "testImage"));
    objc_msgSend(v17, "setAnimationDuration:", v15);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController testImage](self, "testImage"));
    objc_msgSend(v18, "startAnimating");

    v19 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008A78;
    block[3] = &unk_100010588;
    v21 = v8;
    dispatch_after(v19, (dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    (*((void (**)(id))v7 + 2))(v7);
  }

}

- (int)checkCurrentSwitchState
{
  return +[DARingerSwitchStateReader readCurrentState](DARingerSwitchStateReader, "readCurrentState");
}

- (void)cleanUpWithCompletion:(id)a3
{
  id v4;
  void ***v5;
  void *v6;
  void *v7;
  void **v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  ButtonSwitchInputViewController *v12;
  id v13;

  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_100008B58;
  v11 = &unk_1000105B0;
  v12 = self;
  v13 = a3;
  v4 = v13;
  v5 = objc_retainBlock(&v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController buttonEventMonitor](self, "buttonEventMonitor", v8, v9, v10, v11, v12));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController buttonEventMonitor](self, "buttonEventMonitor"));
    objc_msgSend(v7, "stopWithCompletion:", v5);

  }
  else
  {
    ((void (*)(void ***))v5[2])(v5);
  }

}

- (void)teardown
{
  NSObject *v3;
  _QWORD v4[4];
  dispatch_semaphore_t v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008D50;
  v4[3] = &unk_100010430;
  v5 = dispatch_semaphore_create(0);
  v3 = v5;
  -[ButtonSwitchInputViewController cleanUpWithCompletion:](self, "cleanUpWithCompletion:", v4);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

}

- (void)endTestWithStatusCode:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008DD4;
  v4[3] = &unk_100010560;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)noInputTimedOut
{
  uint64_t v3;
  NSObject *v4;
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
  void *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  ButtonSwitchInputViewController *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id buf[2];

  v3 = DiagnosticLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "No Input Timeout called", (uint8_t *)buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController buttonEventMonitor](self, "buttonEventMonitor"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController buttonEventMonitor](self, "buttonEventMonitor"));
    objc_msgSend(v6, "removeTarget:", self);

  }
  -[ButtonSwitchInputViewController setIsInputMonitoringPaused:](self, "setIsInputMonitoringPaused:", 1);
  objc_initWeak(buf, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NO_INPUT_DETECTED"), &stru_100010E70, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, v8, 1));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("RETRY"), &stru_100010E70, 0));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100009248;
  v22[3] = &unk_1000105D8;
  objc_copyWeak(&v23, buf);
  v22[4] = self;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 0, v22));
  objc_msgSend(v9, "addAction:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_100010E70, 0));
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_100009384;
  v19 = &unk_1000105D8;
  objc_copyWeak(&v21, buf);
  v20 = self;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 0, &v16));
  objc_msgSend(v9, "addAction:", v15, v16, v17, v18, v19);

  -[ButtonSwitchInputViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);

  objc_destroyWeak(buf);
}

- (void)startTimer
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  double v15;
  const char *v16;
  double v17;
  void *v18;
  id v19;
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "type"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Button"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
  v7 = v6;
  if (v5)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "buttonParameters"));
LABEL_7:
    v19 = (id)v8;

    v14 = v19;
    goto LABEL_8;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "type"));
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Switch"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
  v7 = v11;
  if (v10)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "switchParameters"));
    goto LABEL_7;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "type"));
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("TouchButton"));

  if (v13)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "touchButtonParameters"));
    goto LABEL_7;
  }
  v14 = 0;
LABEL_8:
  v20 = v14;
  objc_msgSend(v14, "listenForInputTimeout");
  if (v15 != 0.0)
  {
    objc_msgSend(v20, "listenForInputTimeout");
    v16 = "timedOut";
LABEL_12:
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, v16, 0, 0));
    -[ButtonSwitchInputViewController setTimeoutTimer:](self, "setTimeoutTimer:", v18);

    goto LABEL_13;
  }
  objc_msgSend(v20, "noInputTimeout");
  if (v17 != 0.0)
  {
    objc_msgSend(v20, "noInputTimeout");
    v16 = "noInputTimedOut";
    goto LABEL_12;
  }
LABEL_13:

}

- (void)resetTimer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "buttonParameters"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
  v6 = v5;
  if (v4)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "buttonParameters"));
LABEL_7:
    v13 = (id)v7;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController timeoutTimer](self, "timeoutTimer"));
    objc_msgSend(v11, "invalidate");

    objc_msgSend(v13, "noInputTimeout");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "noInputTimedOut", 0, 0));
    -[ButtonSwitchInputViewController setTimeoutTimer:](self, "setTimeoutTimer:", v12);

    return;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "switchParameters"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
  v6 = v9;
  if (v8)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "switchParameters"));
    goto LABEL_7;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "touchButtonParameters"));

  if (v10)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "touchButtonParameters"));
    goto LABEL_7;
  }
  -[ButtonSwitchInputViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_100011240);
}

- (void)timedOut
{
  -[ButtonSwitchInputViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_100011258);
}

- (void)didReceiveButtonEvent:(unint64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
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
  id v39;
  id v40;
  _QWORD block[5];
  _QWORD v42[4];
  _QWORD v43[4];
  _QWORD v44[4];
  _QWORD v45[4];
  uint8_t buf[4];
  int v47;

  v5 = DiagnosticLogHandleForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v47 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Recieved hardware button event %x", buf, 8u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v7, "timeIntervalSince1970");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)(v8 * 1000.0)));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "buttonParameters"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
  v13 = v12;
  if (v11)
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "buttonParameters"));
  else
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "switchParameters"));
  v15 = (void *)v14;

  if (v15 && objc_msgSend(v15, "resetTimer"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009CA8;
    block[3] = &unk_100010430;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController buttonSwitchState](self, "buttonSwitchState"));
  v39 = 0;
  v40 = 0;
  v17 = objc_msgSend(v16, "isEventAcceptable:type:eventType:", a3, &v40, &v39);
  v18 = v40;
  v19 = v39;

  v20 = DiagnosticLogHandleForCategory(3);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (!v17)
  {
    if (v22)
    {
      *(_DWORD *)buf = 67109120;
      v47 = a3;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Button event %x is unacceptable!", buf, 8u);
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController allResults](self, "allResults"));
    v43[0] = v18;
    v42[0] = CFSTR("type");
    v42[1] = CFSTR("identifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "identifier"));
    v43[1] = v35;
    v43[2] = v19;
    v42[2] = CFSTR("eventType");
    v42[3] = CFSTR("timestamp");
    v43[3] = v9;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 4));
    objc_msgSend(v33, "addObject:", v36);

    -[ButtonSwitchInputViewController setButtonFailure:](self, "setButtonFailure:", 1);
LABEL_20:
    -[ButtonSwitchInputViewController showNextSegment](self, "showNextSegment");
    goto LABEL_24;
  }
  if (v22)
  {
    *(_DWORD *)buf = 67109120;
    v47 = a3;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Button event %x is acceptable", buf, 8u);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController allResults](self, "allResults"));
  v45[0] = v18;
  v44[0] = CFSTR("type");
  v44[1] = CFSTR("identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "identifier"));
  v45[1] = v25;
  v45[2] = v19;
  v44[2] = CFSTR("eventType");
  v44[3] = CFSTR("timestamp");
  v45[3] = v9;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v45, v44, 4));
  objc_msgSend(v23, "addObject:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "buttonParameters"));

  if (!v28)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "switchParameters"));

    if (!v38)
      goto LABEL_24;
    -[ButtonSwitchInputViewController setCurrentSegmentActionCount:](self, "setCurrentSegmentActionCount:", -[ButtonSwitchInputViewController currentSegmentActionCount](self, "currentSegmentActionCount") + 1);
    goto LABEL_20;
  }
  if (-[ButtonSwitchInputViewController isSecondEvent](self, "isSecondEvent"))
  {
    -[ButtonSwitchInputViewController setCurrentSegmentActionCount:](self, "setCurrentSegmentActionCount:", -[ButtonSwitchInputViewController currentSegmentActionCount](self, "currentSegmentActionCount") + 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController inputs](self, "inputs"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "buttonParameters"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "segments"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectAtIndexedSubscript:", -[ButtonSwitchInputViewController currentSegment](self, "currentSegment")));

    LODWORD(v29) = -[ButtonSwitchInputViewController currentSegmentActionCount](self, "currentSegmentActionCount");
    if ((int)v29 >= (int)objc_msgSend(v32, "numberOfActions"))
      -[ButtonSwitchInputViewController showNextSegment](self, "showNextSegment");
    -[ButtonSwitchInputViewController setIsSecondEvent:](self, "setIsSecondEvent:", 0);

  }
  else
  {
    -[ButtonSwitchInputViewController setIsSecondEvent:](self, "setIsSecondEvent:", 1);
  }
LABEL_24:

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

- (BOOL)shouldShowPressHomeLabel
{
  return 0;
}

- (void)handleHIDEvent:(__IOHIDEvent *)a3
{
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  _QWORD v7[6];

  if ((-[ButtonSwitchInputViewController isCancelled](self, "isCancelled") & 1) == 0
    && (-[ButtonSwitchInputViewController isFinished](self, "isFinished") & 1) == 0)
  {
    global_queue = dispatch_get_global_queue(25, 0);
    v6 = objc_claimAutoreleasedReturnValue(global_queue);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100009D68;
    v7[3] = &unk_100010600;
    v7[4] = self;
    v7[5] = a3;
    dispatch_sync(v6, v7);

  }
}

- (void)playHaptic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[3];
  _QWORD v20[3];
  CHHapticPatternKey v21;
  void *v22;
  void *v23;
  CHHapticPatternKey v24;
  void *v25;

  v24 = CHHapticPatternKeyPattern;
  v21 = CHHapticPatternKeyEvent;
  v19[0] = CHHapticPatternKeyEventType;
  v19[1] = CHHapticPatternKeyTime;
  v20[0] = CHHapticEventTypeHapticTransient;
  v20[1] = &off_1000112C0;
  v19[2] = CHHapticPatternKeyEventDuration;
  v20[2] = &off_1000112D0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 3));
  v22 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
  v23 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
  v25 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));

  v18 = 0;
  v7 = objc_msgSend(objc_alloc((Class)CHHapticPattern), "initWithDictionary:error:", v6, &v18);
  v8 = v18;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_100007C78;
  v16[4] = sub_100007C88;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController hapticEngine](self, "hapticEngine"));
  v15 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "createPlayerWithPattern:error:", v7, &v15));
  v11 = v15;

  v17 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController hapticEngine](self, "hapticEngine"));
  objc_msgSend(v12, "notifyWhenPlayersFinished:", &stru_100010640);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ButtonSwitchInputViewController hapticEngine](self, "hapticEngine"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000A55C;
  v14[3] = &unk_100010668;
  v14[4] = v16;
  objc_msgSend(v13, "startWithCompletionHandler:", v14);

  _Block_object_dispose(v16, 8);
}

- (int)currentSegment
{
  return self->_currentSegment;
}

- (void)setCurrentSegment:(int)a3
{
  self->_currentSegment = a3;
}

- (int)currentSegmentActionCount
{
  return self->_currentSegmentActionCount;
}

- (void)setCurrentSegmentActionCount:(int)a3
{
  self->_currentSegmentActionCount = a3;
}

- (BOOL)isSecondEvent
{
  return self->_isSecondEvent;
}

- (void)setIsSecondEvent:(BOOL)a3
{
  self->_isSecondEvent = a3;
}

- (int)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(int)a3
{
  self->_currentState = a3;
}

- (UIImage)spriteImage
{
  return self->_spriteImage;
}

- (void)setSpriteImage:(id)a3
{
  objc_storeStrong((id *)&self->_spriteImage, a3);
}

- (UIImageView)testImage
{
  return self->_testImage;
}

- (void)setTestImage:(id)a3
{
  objc_storeStrong((id *)&self->_testImage, a3);
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (NSMutableArray)allResults
{
  return self->_allResults;
}

- (void)setAllResults:(id)a3
{
  objc_storeStrong((id *)&self->_allResults, a3);
}

- (BOOL)buttonFailure
{
  return self->_buttonFailure;
}

- (void)setButtonFailure:(BOOL)a3
{
  self->_buttonFailure = a3;
}

- (unint64_t)targetButtonEvents
{
  return self->_targetButtonEvents;
}

- (void)setTargetButtonEvents:(unint64_t)a3
{
  self->_targetButtonEvents = a3;
}

- (BOOL)isInputMonitoringPaused
{
  return self->_isInputMonitoringPaused;
}

- (void)setIsInputMonitoringPaused:(BOOL)a3
{
  self->_isInputMonitoringPaused = a3;
}

- (CHHapticEngine)hapticEngine
{
  return self->_hapticEngine;
}

- (void)setHapticEngine:(id)a3
{
  objc_storeStrong((id *)&self->_hapticEngine, a3);
}

- (DAButtonSwitchState)buttonSwitchState
{
  return self->_buttonSwitchState;
}

- (void)setButtonSwitchState:(id)a3
{
  objc_storeStrong((id *)&self->_buttonSwitchState, a3);
}

- (DSHardwareButtonEventMonitor)buttonEventMonitor
{
  return self->_buttonEventMonitor;
}

- (void)setButtonEventMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_buttonEventMonitor, a3);
}

- (ButtonSwitchInputs)inputs
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
  objc_storeStrong((id *)&self->_buttonEventMonitor, 0);
  objc_storeStrong((id *)&self->_buttonSwitchState, 0);
  objc_storeStrong((id *)&self->_hapticEngine, 0);
  objc_storeStrong((id *)&self->_allResults, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_testImage, 0);
  objc_storeStrong((id *)&self->_spriteImage, 0);
}

@end
