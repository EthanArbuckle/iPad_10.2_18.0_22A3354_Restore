@implementation InteractiveAccelerometerViewController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  int v20;
  double v21;
  CTFontRef UIFontForLanguage;
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
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  UIFontDescriptorAttributeName v44;
  void *v45;
  __int128 v46;
  int v47;

  -[InteractiveAccelerometerViewController setInputs:](self, "setInputs:", a3, a4);
  -[InteractiveAccelerometerViewController setTestingOrientation:](self, "setTestingOrientation:", 0);
  -[InteractiveAccelerometerViewController setOrientationsIndex:](self, "setOrientationsIndex:", 0);
  -[InteractiveAccelerometerViewController setOrientationMissed:](self, "setOrientationMissed:", 0);
  -[InteractiveAccelerometerViewController setSamplingRawData:](self, "setSamplingRawData:", 0);
  v5 = objc_alloc_init((Class)NSDictionary);
  -[InteractiveAccelerometerViewController setAveragedRawData:](self, "setAveragedRawData:", v5);

  v6 = objc_alloc_init((Class)NSDictionary);
  -[InteractiveAccelerometerViewController setNotStationaryData:](self, "setNotStationaryData:", v6);

  v7 = objc_alloc_init((Class)NSDictionary);
  -[InteractiveAccelerometerViewController setStationaryData:](self, "setStationaryData:", v7);

  v8 = objc_alloc_init((Class)NSMutableArray);
  -[InteractiveAccelerometerViewController setMotionManagerData:](self, "setMotionManagerData:", v8);

  v9 = objc_alloc_init((Class)NSMutableArray);
  -[InteractiveAccelerometerViewController setRawComponentData:](self, "setRawComponentData:", v9);

  v10 = objc_alloc_init((Class)NSMutableArray);
  -[InteractiveAccelerometerViewController setCopiedRawComponentData:](self, "setCopiedRawComponentData:", v10);

  v11 = objc_alloc_init((Class)NSMutableArray);
  -[InteractiveAccelerometerViewController setCopiedMotionManagerData:](self, "setCopiedMotionManagerData:", v11);

  v12 = objc_alloc_init((Class)NSMutableArray);
  -[InteractiveAccelerometerViewController setAllResults:](self, "setAllResults:", v12);

  -[InteractiveAccelerometerViewController setZeroRangeAndDegreesShiftRange](self, "setZeroRangeAndDegreesShiftRange");
  v13 = objc_alloc_init((Class)CMMotionManager);
  -[InteractiveAccelerometerViewController setManager:](self, "setManager:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController manager](self, "manager"));
  objc_msgSend(v14, "setShowsDeviceMovementDisplay:", 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController manager](self, "manager"));
  objc_msgSend(v15, "setDeviceMotionUpdateInterval:", 0.00999999978);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController manager](self, "manager"));
  objc_msgSend(v16, "startDeviceMotionUpdatesUsingReferenceFrame:", 1);

  -[InteractiveAccelerometerViewController setOrientation:](self, "setOrientation:", 1);
  -[InteractiveAccelerometerViewController setPreviousOrientation:](self, "setPreviousOrientation:", 1);
  -[InteractiveAccelerometerViewController setLastLevelChange:](self, "setLastLevelChange:", 1.79769313e308);
  -[InteractiveAccelerometerViewController setLastDisplayDegrees:](self, "setLastDisplayDegrees:", 0x7FFFFFFFFFFFFFFFLL);
  -[InteractiveAccelerometerViewController setPreviousRotation:](self, "setPreviousRotation:", 1.79769313e308);
  -[InteractiveAccelerometerViewController setPreviousShift:](self, "setPreviousShift:", 1.79769313e308);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v17, "bounds");
  v19 = v18;
  v46 = xmmword_10000CE9E;
  v47 = -798153473;
  v20 = MGIsDeviceOfType(&v46);
  v21 = 0.850000024;
  if (!v20)
    v21 = 1.0;
  UIFontForLanguage = CTFontCreateUIFontForLanguage((CTFontUIFontType)0x68u, v21 * round(v19 * 81.0 / 320.0), 0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[__CTFont fontDescriptor](UIFontForLanguage, "fontDescriptor"));
  CFRelease(UIFontForLanguage);
  v44 = UIFontDescriptorFeatureSettingsAttribute;
  v41[0] = UIFontFeatureTypeIdentifierKey;
  v41[1] = UIFontFeatureSelectorIdentifierKey;
  v42[0] = &off_100010BF0;
  v42[1] = &off_100010C08;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v42, v41, 2));
  v43[0] = v24;
  v39[0] = UIFontFeatureTypeIdentifierKey;
  v39[1] = UIFontFeatureSelectorIdentifierKey;
  v40[0] = &off_100010C20;
  v40[1] = &off_100010C38;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v39, 2));
  v43[1] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 2));
  v45 = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "fontDescriptorByAddingAttributes:", v27));

  -[InteractiveAccelerometerViewController setFontDescriptor:](self, "setFontDescriptor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[DSTestAutomation sharedInstance](DSTestAutomation, "sharedInstance"));
  LODWORD(v25) = objc_msgSend(v29, "testAutomationEnabled");

  if ((_DWORD)v25)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs", CFSTR("parameters")));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "parameters"));
    v38[0] = v31;
    v37[1] = CFSTR("predicates");
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "predicates"));
    v38[1] = v33;
    v37[2] = CFSTR("specifications");
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "specifications"));
    v38[2] = v35;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v37, 3));
    +[DSTestAutomation postConfiguration:](DSTestAutomation, "postConfiguration:", v36);

  }
}

- (void)start
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _UNKNOWN **v22;
  const __CFString *v23;
  void *v24;

  -[InteractiveAccelerometerViewController setDebuggingEnabled:](self, "setDebuggingEnabled:", -[InteractiveAccelerometerViewController isDebuggingEnabled](self, "isDebuggingEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DAHIDEventMonitor sharedInstance](DAHIDEventMonitor, "sharedInstance"));
  objc_msgSend(v3, "setDelegate:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
  v5 = objc_msgSend(v4, "componentSensor") != 0;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DAHIDEventMonitor sharedInstance](DAHIDEventMonitor, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v7));
  v9 = objc_msgSend(v6, "startMonitoringWithHIDEvents:", v8);

  if ((v9 & 1) == 0)
  {
    v22 = &off_100010C50;
LABEL_13:
    -[InteractiveAccelerometerViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", v22);
    return;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[DAHIDEventMonitor sharedInstance](DAHIDEventMonitor, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
  v12 = objc_msgSend(v10, "serviceClientSetPropertyValue:forKey:forHIDEvent:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v11, "outputDataRate")), CFSTR("ReportInterval"), v5);

  if (!v12)
  {
    v22 = &off_100010C80;
    goto LABEL_13;
  }
  if (!-[InteractiveAccelerometerViewController determineTestingOrientation](self, "determineTestingOrientation"))
  {
    v22 = &off_100010C68;
    goto LABEL_13;
  }
  -[InteractiveAccelerometerViewController setupView](self, "setupView");
  -[InteractiveAccelerometerViewController startAnimations](self, "startAnimations");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[InteractiveAccelerometerViewController setStartDate:](self, "setStartDate:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[DSTestAutomation sharedInstance](DSTestAutomation, "sharedInstance"));
  v15 = objc_msgSend(v14, "testAutomationEnabled");

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
    if (objc_msgSend(v16, "componentSensor"))
      v17 = CFSTR("ListenForGyroPosition");
    else
      v17 = CFSTR("ListenForAccelerometerPosition");
    v23 = CFSTR("deviceOrientation");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[InteractiveAccelerometerViewController testingOrientation](self, "testingOrientation")));
    v24 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    +[DSTestAutomation postInteractiveTestEvent:info:](DSTestAutomation, "postInteractiveTestEvent:info:", v17, v19);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
  objc_msgSend(v20, "notStationaryTimeout");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "notStationaryTimedOut", 0, 0));
  -[InteractiveAccelerometerViewController setTimeoutTimer:](self, "setTimeoutTimer:", v21);

}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)InteractiveAccelerometerViewController;
  -[InteractiveAccelerometerViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)setZeroRangeAndDegreesShiftRange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  float v11;
  double v12;
  void *v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentOrientationSpecifications"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "orientationsParameter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", -[InteractiveAccelerometerViewController orientationsIndex](self, "orientationsIndex")));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v7));

  objc_msgSend(v14, "zeroRangeThreshold");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
  objc_msgSend(v10, "setZeroRange:", v9);

  objc_msgSend(v14, "degreesShiftRangeThreshold");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
  objc_msgSend(v13, "setDegreesShiftRange:", v12);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double MidX;
  double v43;
  void *v44;
  double v45;
  double MidY;
  void *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  CGFloat v54;
  double v55;
  double MinY;
  void *v57;
  objc_super v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  v58.receiver = self;
  v58.super_class = (Class)InteractiveAccelerometerViewController;
  -[InteractiveAccelerometerViewController viewWillLayoutSubviews](&v58, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController view](self, "view"));
  objc_msgSend(v3, "center");
  v5 = v4;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController degreesLabel](self, "degreesLabel"));
  objc_msgSend(v8, "setCenter:", v5, v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController view](self, "view"));
  objc_msgSend(v9, "center");
  v11 = v10;
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController bottomOuterCircle](self, "bottomOuterCircle"));
  objc_msgSend(v14, "setPosition:", v11, v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController view](self, "view"));
  objc_msgSend(v15, "center");
  v17 = v16;
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController bottomInnerCircle](self, "bottomInnerCircle"));
  objc_msgSend(v20, "setPosition:", v17, v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController view](self, "view"));
  objc_msgSend(v21, "center");
  v23 = v22;
  v25 = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController topOuterCircle](self, "topOuterCircle"));
  objc_msgSend(v26, "setPosition:", v23, v25);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController view](self, "view"));
  objc_msgSend(v27, "center");
  v29 = v28;
  v31 = v30;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController topInnerCircle](self, "topInnerCircle"));
  objc_msgSend(v32, "setPosition:", v29, v31);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController view](self, "view"));
  objc_msgSend(v33, "bounds");
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;

  v59.origin.x = v35;
  v59.origin.y = v37;
  v59.size.width = v39;
  v59.size.height = v41;
  MidX = CGRectGetMidX(v59);
  v60.origin.x = v35;
  v60.origin.y = v37;
  v60.size.width = v39;
  v60.size.height = v41;
  v43 = MidX - CGRectGetWidth(v60) * 0.5;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController leftLevelTic](self, "leftLevelTic"));
  objc_msgSend(v44, "bounds");
  v45 = v43 + CGRectGetWidth(v61) * 0.5;
  v62.origin.x = v35;
  v62.origin.y = v37;
  v62.size.width = v39;
  v62.size.height = v41;
  MidY = CGRectGetMidY(v62);
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController leftLevelTic](self, "leftLevelTic"));
  objc_msgSend(v47, "setPosition:", v45, MidY);

  v63.origin.x = v35;
  v63.origin.y = v37;
  v63.size.width = v39;
  v63.size.height = v41;
  v48 = CGRectGetMidX(v63);
  v64.origin.x = v35;
  v64.origin.y = v37;
  v64.size.width = v39;
  v64.size.height = v41;
  v49 = v48 + CGRectGetWidth(v64) * 0.5;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController rightLevelTic](self, "rightLevelTic"));
  objc_msgSend(v50, "bounds");
  v51 = v49 - CGRectGetWidth(v65) * 0.5;
  v66.origin.x = v35;
  v66.origin.y = v37;
  v66.size.width = v39;
  v66.size.height = v41;
  v52 = CGRectGetMidY(v66);
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController rightLevelTic](self, "rightLevelTic"));
  objc_msgSend(v53, "setPosition:", v51, v52);

  v67.origin.x = v35;
  v67.origin.y = v37;
  v67.size.width = v39;
  v67.size.height = v41;
  v54 = v37 + CGRectGetHeight(v67) * 0.5;
  v68.origin.x = v35;
  v68.origin.y = v54;
  v68.size.width = v39;
  v68.size.height = v41;
  v55 = CGRectGetMidX(v68);
  v69.origin.x = v35;
  v69.origin.y = v54;
  v69.size.width = v39;
  v69.size.height = v41;
  MinY = CGRectGetMinY(v69);
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController levelBottom](self, "levelBottom"));
  objc_msgSend(v57, "setPosition:", v55, MinY);

}

- (void)setupView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
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
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  CGFloat v39;
  double Width;
  CGFloat Height;
  CGFloat v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  id v70;
  id v71;
  void *v72;
  id v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  double v89;
  id v90;
  id v91;
  void *v92;
  id v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  double v100;
  double v101;
  double v102;
  double v103;
  void *v104;
  void *v105;
  double v106;
  double v107;
  double v108;
  double v109;
  id v110;
  id v111;
  void *v112;
  id v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  double v120;
  double v121;
  double v122;
  double v123;
  void *v124;
  void *v125;
  double v126;
  double v127;
  double v128;
  double v129;
  id v130;
  id v131;
  void *v132;
  id v133;
  id v134;
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
  id v150;
  void *v151;
  void *v152;
  double v153;
  double v154;
  double v155;
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
  double v168;
  double v169;
  double v170;
  double v171;
  void *v172;
  double v173;
  double v174;
  double v175;
  double v176;
  void *v177;
  id v178;
  id v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  double v187;
  double v188;
  double v189;
  double v190;
  void *v191;
  double v192;
  double v193;
  double v194;
  double v195;
  void *v196;
  id v197;
  id v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  uint64_t v208;
  __int128 v209;
  int v210;
  CGRect v211;
  CGRect v212;
  CGRect v213;
  CGRect v214;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController view](self, "view"));
  objc_msgSend(v3, "setClipsToBounds:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController view](self, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController view](self, "view"));
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v8, v10, v12, v14);
  -[InteractiveAccelerometerViewController setFilterContainer:](self, "setFilterContainer:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController filterContainer](self, "filterContainer"));
  objc_msgSend(v17, "setBackgroundColor:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController filterContainer](self, "filterContainer"));
  objc_msgSend(v18, "setClipsToBounds:", 1);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController filterContainer](self, "filterContainer"));
  objc_msgSend(v19, "setAutoresizingMask:", 18);

  v20 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v8, v10, v12, v14);
  -[InteractiveAccelerometerViewController setLevelContainer:](self, "setLevelContainer:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController levelContainer](self, "levelContainer"));
  objc_msgSend(v22, "setBackgroundColor:", v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController levelContainer](self, "levelContainer"));
  objc_msgSend(v23, "setAutoresizingMask:", 18);

  v24 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v8, v10, v12, v14);
  -[InteractiveAccelerometerViewController setLevelHoldContainer:](self, "setLevelHoldContainer:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController levelHoldContainer](self, "levelHoldContainer"));
  objc_msgSend(v26, "setBackgroundColor:", v25);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController levelHoldContainer](self, "levelHoldContainer"));
  objc_msgSend(v27, "setAutoresizingMask:", 18);

  v28 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v8, v10, v12, v14);
  -[InteractiveAccelerometerViewController setBubbleContainer:](self, "setBubbleContainer:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController bubbleContainer](self, "bubbleContainer"));
  objc_msgSend(v30, "setBackgroundColor:", v29);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController bubbleContainer](self, "bubbleContainer"));
  objc_msgSend(v31, "setAutoresizingMask:", 18);

  v32 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v8, v10, v12, v14);
  -[InteractiveAccelerometerViewController setTicContainer:](self, "setTicContainer:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController ticContainer](self, "ticContainer"));
  objc_msgSend(v34, "setBackgroundColor:", v33);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController ticContainer](self, "ticContainer"));
  objc_msgSend(v35, "setAutoresizingMask:", 18);

  v208 = kCAFilterXor;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController ticContainer](self, "ticContainer"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "layer"));
  objc_msgSend(v38, "setCompositingFilter:", v36);

  v211.origin.x = v8;
  v211.origin.y = v10;
  v211.size.width = v12;
  v211.size.height = v14;
  v39 = v10 + CGRectGetHeight(v211) * 0.5;
  v212.origin.x = v8;
  v212.origin.y = v39;
  v212.size.width = v12;
  v212.size.height = v14;
  Width = CGRectGetWidth(v212);
  v213.origin.x = v8;
  v213.origin.y = v39;
  v213.size.width = v12;
  v213.size.height = v14;
  Height = CGRectGetHeight(v213);
  v42 = Height + Height;
  v214.origin.x = v8;
  v214.origin.y = v39;
  v214.size.width = v12;
  v214.size.height = v14;
  v43 = v12 - (-CGRectGetWidth(v214) - Width);
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  -[InteractiveAccelerometerViewController setLevelBottom:](self, "setLevelBottom:", v44);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController levelBottom](self, "levelBottom"));
  objc_msgSend(v45, "setAnchorPoint:", 0.5, 0.0);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController levelBottom](self, "levelBottom"));
  objc_msgSend(v46, "setFrame:", v8 - Width, v39 + 0.0, v43, v14 - (0.0 - v42));

  v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
  v48 = objc_msgSend(v47, "CGColor");
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController levelBottom](self, "levelBottom"));
  objc_msgSend(v49, "setBackgroundColor:", v48);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController levelBottom](self, "levelBottom"));
  objc_msgSend(v50, "setAllowsEdgeAntialiasing:", 1);

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController levelContainer](self, "levelContainer"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "layer"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController levelBottom](self, "levelBottom"));
  objc_msgSend(v52, "addSublayer:", v53);

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController filterContainer](self, "filterContainer"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController levelContainer](self, "levelContainer"));
  objc_msgSend(v54, "addSubview:", v55);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController levelContainer](self, "levelContainer"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController levelHoldContainer](self, "levelHoldContainer"));
  objc_msgSend(v56, "addSubview:", v57);

  v58 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
  -[InteractiveAccelerometerViewController setTopOuterCircle:](self, "setTopOuterCircle:", v58);

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController view](self, "view"));
  objc_msgSend(v59, "frame");
  v61 = v60;
  v209 = xmmword_10000CE9E;
  v210 = -798153473;
  if (MGIsDeviceOfType(&v209))
    v62 = 0.850000024;
  else
    v62 = 1.0;
  v63 = v62 * round(v61 * 200.0 / 320.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController topOuterCircle](self, "topOuterCircle"));
  objc_msgSend(v64, "setFrame:", 0.0, 0.0, v63, v63);

  v65 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController view](self, "view"));
  objc_msgSend(v65, "frame");
  v67 = v66;
  v209 = xmmword_10000CE9E;
  v210 = -798153473;
  if (MGIsDeviceOfType(&v209))
    v68 = 0.850000024;
  else
    v68 = 1.0;
  v69 = v68 * round(v67 * 200.0 / 320.0);
  v70 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, v69, v69)));
  v71 = objc_msgSend(v70, "CGPath");
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController topOuterCircle](self, "topOuterCircle"));
  objc_msgSend(v72, "setPath:", v71);

  v73 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
  v74 = objc_msgSend(v73, "CGColor");
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController topOuterCircle](self, "topOuterCircle"));
  objc_msgSend(v75, "setFillColor:", v74);

  v76 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", v208));
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController topOuterCircle](self, "topOuterCircle"));
  objc_msgSend(v77, "setCompositingFilter:", v76);

  v78 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
  -[InteractiveAccelerometerViewController setTopInnerCircle:](self, "setTopInnerCircle:", v78);

  v79 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController view](self, "view"));
  objc_msgSend(v79, "frame");
  v81 = v80;
  v209 = xmmword_10000CE9E;
  v210 = -798153473;
  if (MGIsDeviceOfType(&v209))
    v82 = 0.850000024;
  else
    v82 = 1.0;
  v83 = v82 * round(v81 * 195.0 / 320.0);
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController topInnerCircle](self, "topInnerCircle"));
  objc_msgSend(v84, "setFrame:", 0.0, 0.0, v83, v83);

  v85 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController view](self, "view"));
  objc_msgSend(v85, "frame");
  v87 = v86;
  v209 = xmmword_10000CE9E;
  v210 = -798153473;
  if (MGIsDeviceOfType(&v209))
    v88 = 0.850000024;
  else
    v88 = 1.0;
  v89 = v88 * round(v87 * 195.0 / 320.0);
  v90 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, v89, v89)));
  v91 = objc_msgSend(v90, "CGPath");
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController topInnerCircle](self, "topInnerCircle"));
  objc_msgSend(v92, "setPath:", v91);

  v93 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
  v94 = objc_msgSend(v93, "CGColor");
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController topInnerCircle](self, "topInnerCircle"));
  objc_msgSend(v95, "setFillColor:", v94);

  v96 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", v208));
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController topInnerCircle](self, "topInnerCircle"));
  objc_msgSend(v97, "setCompositingFilter:", v96);

  v98 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
  -[InteractiveAccelerometerViewController setBottomOuterCircle:](self, "setBottomOuterCircle:", v98);

  v99 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController view](self, "view"));
  objc_msgSend(v99, "frame");
  v101 = v100;
  v209 = xmmword_10000CE9E;
  v210 = -798153473;
  if (MGIsDeviceOfType(&v209))
    v102 = 0.850000024;
  else
    v102 = 1.0;
  v103 = v102 * round(v101 * 200.0 / 320.0);
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController bottomOuterCircle](self, "bottomOuterCircle"));
  objc_msgSend(v104, "setFrame:", 0.0, 0.0, v103, v103);

  v105 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController view](self, "view"));
  objc_msgSend(v105, "frame");
  v107 = v106;
  v209 = xmmword_10000CE9E;
  v210 = -798153473;
  if (MGIsDeviceOfType(&v209))
    v108 = 0.850000024;
  else
    v108 = 1.0;
  v109 = v108 * round(v107 * 200.0 / 320.0);
  v110 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, v109, v109)));
  v111 = objc_msgSend(v110, "CGPath");
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController bottomOuterCircle](self, "bottomOuterCircle"));
  objc_msgSend(v112, "setPath:", v111);

  v113 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
  v114 = objc_msgSend(v113, "CGColor");
  v115 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController bottomOuterCircle](self, "bottomOuterCircle"));
  objc_msgSend(v115, "setFillColor:", v114);

  v116 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", v208));
  v117 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController bottomOuterCircle](self, "bottomOuterCircle"));
  objc_msgSend(v117, "setCompositingFilter:", v116);

  v118 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
  -[InteractiveAccelerometerViewController setBottomInnerCircle:](self, "setBottomInnerCircle:", v118);

  v119 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController view](self, "view"));
  objc_msgSend(v119, "frame");
  v121 = v120;
  v209 = xmmword_10000CE9E;
  v210 = -798153473;
  if (MGIsDeviceOfType(&v209))
    v122 = 0.850000024;
  else
    v122 = 1.0;
  v123 = v122 * round(v121 * 195.0 / 320.0);
  v124 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController bottomInnerCircle](self, "bottomInnerCircle"));
  objc_msgSend(v124, "setFrame:", 0.0, 0.0, v123, v123);

  v125 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController view](self, "view"));
  objc_msgSend(v125, "frame");
  v127 = v126;
  v209 = xmmword_10000CE9E;
  v210 = -798153473;
  if (MGIsDeviceOfType(&v209))
    v128 = 0.850000024;
  else
    v128 = 1.0;
  v129 = v128 * round(v127 * 195.0 / 320.0);
  v130 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, v129, v129)));
  v131 = objc_msgSend(v130, "CGPath");
  v132 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController bottomInnerCircle](self, "bottomInnerCircle"));
  objc_msgSend(v132, "setPath:", v131);

  v133 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
  v134 = objc_msgSend(v133, "CGColor");
  v135 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController bottomInnerCircle](self, "bottomInnerCircle"));
  objc_msgSend(v135, "setFillColor:", v134);

  v136 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", v208));
  v137 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController bottomInnerCircle](self, "bottomInnerCircle"));
  objc_msgSend(v137, "setCompositingFilter:", v136);

  v138 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController filterContainer](self, "filterContainer"));
  v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "layer"));
  v140 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController topOuterCircle](self, "topOuterCircle"));
  objc_msgSend(v139, "addSublayer:", v140);

  v141 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController filterContainer](self, "filterContainer"));
  v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "layer"));
  v143 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController topInnerCircle](self, "topInnerCircle"));
  objc_msgSend(v142, "addSublayer:", v143);

  v144 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController filterContainer](self, "filterContainer"));
  v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "layer"));
  v146 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController bottomOuterCircle](self, "bottomOuterCircle"));
  objc_msgSend(v145, "addSublayer:", v146);

  v147 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController filterContainer](self, "filterContainer"));
  v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "layer"));
  v149 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController bottomInnerCircle](self, "bottomInnerCircle"));
  objc_msgSend(v148, "addSublayer:", v149);

  v150 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
  -[InteractiveAccelerometerViewController setDegreesLabel:](self, "setDegreesLabel:", v150);

  v151 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController fontDescriptor](self, "fontDescriptor"));
  v152 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController view](self, "view"));
  objc_msgSend(v152, "frame");
  v154 = v153;
  v209 = xmmword_10000CE9E;
  v210 = -798153473;
  if (MGIsDeviceOfType(&v209))
    v155 = 0.850000024;
  else
    v155 = 1.0;
  v156 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v151, v155 * round(v154 * 81.0 / 320.0)));
  v157 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController degreesLabel](self, "degreesLabel"));
  objc_msgSend(v157, "setFont:", v156);

  v158 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController degreesLabel](self, "degreesLabel"));
  objc_msgSend(v158, "sizeToFit");

  v159 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v160 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController degreesLabel](self, "degreesLabel"));
  objc_msgSend(v160, "setTextColor:", v159);

  v161 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", v208));
  v162 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController degreesLabel](self, "degreesLabel"));
  v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v162, "layer"));
  objc_msgSend(v163, "setCompositingFilter:", v161);

  v164 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController filterContainer](self, "filterContainer"));
  v165 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController degreesLabel](self, "degreesLabel"));
  objc_msgSend(v164, "addSubview:", v165);

  v166 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  -[InteractiveAccelerometerViewController setRightLevelTic:](self, "setRightLevelTic:", v166);

  v167 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController view](self, "view"));
  objc_msgSend(v167, "frame");
  v169 = v168;
  v209 = xmmword_10000CE9E;
  v210 = -798153473;
  if (MGIsDeviceOfType(&v209))
    v170 = 0.850000024;
  else
    v170 = 1.0;
  v171 = v170 * round(v169 * 40.5 / 320.0);
  v172 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController view](self, "view"));
  objc_msgSend(v172, "frame");
  v174 = v173;
  v209 = xmmword_10000CE9E;
  v210 = -798153473;
  if (MGIsDeviceOfType(&v209))
    v175 = 0.850000024;
  else
    v175 = 1.0;
  v176 = v175 * round(v174 * 1.5 / 320.0);
  v177 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController rightLevelTic](self, "rightLevelTic"));
  objc_msgSend(v177, "setFrame:", 0.0, 0.0, v171, v176);

  v178 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
  v179 = objc_msgSend(v178, "CGColor");
  v180 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController rightLevelTic](self, "rightLevelTic"));
  objc_msgSend(v180, "setBackgroundColor:", v179);

  v181 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController rightLevelTic](self, "rightLevelTic"));
  objc_msgSend(v181, "setAllowsEdgeAntialiasing:", 1);

  v182 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController ticContainer](self, "ticContainer"));
  v183 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v182, "layer"));
  v184 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController rightLevelTic](self, "rightLevelTic"));
  objc_msgSend(v183, "addSublayer:", v184);

  v185 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  -[InteractiveAccelerometerViewController setLeftLevelTic:](self, "setLeftLevelTic:", v185);

  v186 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController view](self, "view"));
  objc_msgSend(v186, "frame");
  v188 = v187;
  v209 = xmmword_10000CE9E;
  v210 = -798153473;
  if (MGIsDeviceOfType(&v209))
    v189 = 0.850000024;
  else
    v189 = 1.0;
  v190 = v189 * round(v188 * 40.5 / 320.0);
  v191 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController view](self, "view"));
  objc_msgSend(v191, "frame");
  v193 = v192;
  v209 = xmmword_10000CE9E;
  v210 = -798153473;
  if (MGIsDeviceOfType(&v209))
    v194 = 0.850000024;
  else
    v194 = 1.0;
  v195 = v194 * round(v193 * 1.5 / 320.0);
  v196 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController leftLevelTic](self, "leftLevelTic"));
  objc_msgSend(v196, "setFrame:", 0.0, 0.0, v190, v195);

  v197 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
  v198 = objc_msgSend(v197, "CGColor");
  v199 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController leftLevelTic](self, "leftLevelTic"));
  objc_msgSend(v199, "setBackgroundColor:", v198);

  v200 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController leftLevelTic](self, "leftLevelTic"));
  objc_msgSend(v200, "setAllowsEdgeAntialiasing:", 1);

  v201 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController ticContainer](self, "ticContainer"));
  v202 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v201, "layer"));
  v203 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController leftLevelTic](self, "leftLevelTic"));
  objc_msgSend(v202, "addSublayer:", v203);

  v204 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController filterContainer](self, "filterContainer"));
  v205 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController ticContainer](self, "ticContainer"));
  objc_msgSend(v204, "addSubview:", v205);

  v206 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController view](self, "view"));
  v207 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController filterContainer](self, "filterContainer"));
  objc_msgSend(v206, "addSubview:", v207);

}

- (BOOL)isDebuggingEnabled
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR("com.apple.Diagnostics"));
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("Test4154Debugging"), CFSTR("com.apple.Diagnostics"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 1;
  return !v3;
}

- (void)startAnimations
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController displayLink](self, "displayLink"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplayLink displayLinkWithTarget:selector:](CADisplayLink, "displayLinkWithTarget:selector:", self, "updateDisplay:"));
    -[InteractiveAccelerometerViewController setDisplayLink:](self, "setDisplayLink:", v4);

    v6 = (id)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController displayLink](self, "displayLink"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    objc_msgSend(v6, "addToRunLoop:forMode:", v5, NSRunLoopCommonModes);

  }
}

- (void)stopAnimations
{
  void *v3;
  CADisplayLink *displayLink;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController displayLink](self, "displayLink"));

  if (v3)
  {
    -[CADisplayLink invalidate](self->_displayLink, "invalidate");
    displayLink = self->_displayLink;
    self->_displayLink = 0;

  }
}

- (BOOL)determineTestingOrientation
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "orientationsParameter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", -[InteractiveAccelerometerViewController orientationsIndex](self, "orientationsIndex")));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("portrait"));

  if ((v6 & 1) != 0)
  {
    v7 = 1;
LABEL_13:
    -[InteractiveAccelerometerViewController setTestingOrientation:](self, "setTestingOrientation:", v7);
    return 1;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "orientationsParameter"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", -[InteractiveAccelerometerViewController orientationsIndex](self, "orientationsIndex")));
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("portraitUpsideDown"));

  if ((v11 & 1) != 0)
  {
    v7 = 2;
    goto LABEL_13;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "orientationsParameter"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", -[InteractiveAccelerometerViewController orientationsIndex](self, "orientationsIndex")));
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("landscapeLeft"));

  if ((v15 & 1) != 0)
  {
    v7 = 3;
    goto LABEL_13;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "orientationsParameter"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", -[InteractiveAccelerometerViewController orientationsIndex](self, "orientationsIndex")));
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("landscapeRight"));

  if ((v19 & 1) != 0)
  {
    v7 = 4;
    goto LABEL_13;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "orientationsParameter"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", -[InteractiveAccelerometerViewController orientationsIndex](self, "orientationsIndex")));
  v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("faceUp"));

  if ((v23 & 1) != 0)
  {
    v7 = 5;
    goto LABEL_13;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "orientationsParameter"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", -[InteractiveAccelerometerViewController orientationsIndex](self, "orientationsIndex")));
  v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("faceDown"));

  if (v27)
  {
    v7 = 6;
    goto LABEL_13;
  }
  return 0;
}

- (void)addNotStationaryData
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController rawComponentData](self, "rawComponentData"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController rawComponentData](self, "rawComponentData"));
  v5 = objc_msgSend(v4, "copy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController rawComponentData](self, "rawComponentData"));
  objc_msgSend(v6, "removeAllObjects");

  objc_sync_exit(v3);
  if (-[InteractiveAccelerometerViewController debuggingEnabled](self, "debuggingEnabled"))
  {
    v11[0] = CFSTR("rawData");
    v11[1] = CFSTR("calibratedData");
    v12[0] = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController motionManagerData](self, "motionManagerData"));
    v8 = objc_msgSend(v7, "copy");
    v12[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));
    -[InteractiveAccelerometerViewController setNotStationaryData:](self, "setNotStationaryData:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController motionManagerData](self, "motionManagerData"));
  objc_msgSend(v10, "removeAllObjects");

}

- (void)addStationaryData
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
  _QWORD v13[2];
  _QWORD v14[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController rawComponentData](self, "rawComponentData"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController rawComponentData](self, "rawComponentData"));
  v5 = objc_msgSend(v4, "copy");
  -[InteractiveAccelerometerViewController setCopiedRawComponentData:](self, "setCopiedRawComponentData:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController rawComponentData](self, "rawComponentData"));
  objc_msgSend(v6, "removeAllObjects");

  objc_sync_exit(v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController motionManagerData](self, "motionManagerData"));
  v8 = objc_msgSend(v7, "copy");
  -[InteractiveAccelerometerViewController setCopiedMotionManagerData:](self, "setCopiedMotionManagerData:", v8);

  if (-[InteractiveAccelerometerViewController debuggingEnabled](self, "debuggingEnabled"))
  {
    v13[0] = CFSTR("rawData");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController copiedRawComponentData](self, "copiedRawComponentData"));
    v13[1] = CFSTR("calibratedData");
    v14[0] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController copiedMotionManagerData](self, "copiedMotionManagerData"));
    v14[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));
    -[InteractiveAccelerometerViewController setStationaryData:](self, "setStationaryData:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController motionManagerData](self, "motionManagerData"));
  objc_msgSend(v12, "removeAllObjects");

}

- (void)checkWithinOffset
{
  signed int v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
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
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  InteractiveAccelerometerViewController *v37;
  uint64_t v38;
  void *v39;
  double v40;
  double v41;
  float v42;
  double v43;
  double v44;
  float v45;
  double v46;
  double v47;
  float v48;
  double v49;
  double v50;
  float v51;
  double v52;
  double v53;
  float v54;
  double v55;
  double v56;
  float v57;
  _QWORD v58[3];
  _QWORD v59[3];

  v3 = -[InteractiveAccelerometerViewController orientationsIndex](self, "orientationsIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "orientationsParameter"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 <= v3)
  {
    v9 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "orientationsParameter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", -[InteractiveAccelerometerViewController orientationsIndex](self, "orientationsIndex")));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentOrientationSpecifications"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v9));

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
        v14 = objc_msgSend(v13, "componentSensor");

        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController copiedMotionManagerData](self, "copiedMotionManagerData"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController copiedMotionManagerData](self, "copiedMotionManagerData"));
          -[InteractiveAccelerometerViewController average:key:size:](self, "average:key:size:", v15, CFSTR("x"), objc_msgSend(v16, "count"));
          v17 = numberOrNullForDouble();
          v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

          v19 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController copiedMotionManagerData](self, "copiedMotionManagerData"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController copiedMotionManagerData](self, "copiedMotionManagerData"));
          -[InteractiveAccelerometerViewController average:key:size:](self, "average:key:size:", v19, CFSTR("y"), objc_msgSend(v20, "count"));
          v21 = numberOrNullForDouble();
          v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

          v23 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController copiedMotionManagerData](self, "copiedMotionManagerData"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController copiedMotionManagerData](self, "copiedMotionManagerData"));
        }
        else
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController copiedRawComponentData](self, "copiedRawComponentData"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController copiedRawComponentData](self, "copiedRawComponentData"));
          -[InteractiveAccelerometerViewController average:key:size:](self, "average:key:size:", v25, CFSTR("x"), objc_msgSend(v26, "count"));
          v27 = numberOrNullForDouble();
          v18 = (void *)objc_claimAutoreleasedReturnValue(v27);

          v28 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController copiedRawComponentData](self, "copiedRawComponentData"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController copiedRawComponentData](self, "copiedRawComponentData"));
          -[InteractiveAccelerometerViewController average:key:size:](self, "average:key:size:", v28, CFSTR("y"), objc_msgSend(v29, "count"));
          v30 = numberOrNullForDouble();
          v22 = (void *)objc_claimAutoreleasedReturnValue(v30);

          v23 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController copiedRawComponentData](self, "copiedRawComponentData"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController copiedRawComponentData](self, "copiedRawComponentData"));
        }
        v31 = v24;
        -[InteractiveAccelerometerViewController average:key:size:](self, "average:key:size:", v23, CFSTR("z"), objc_msgSend(v24, "count"));
        v32 = numberOrNullForDouble();
        v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

        v34 = objc_opt_class(NSNull);
        if ((objc_opt_isKindOfClass(v18, v34) & 1) != 0
          || (v35 = objc_opt_class(NSNull), (objc_opt_isKindOfClass(v22, v35) & 1) != 0)
          || (v36 = objc_opt_class(NSNull), (objc_opt_isKindOfClass(v33, v36) & 1) != 0))
        {
          v37 = self;
          v38 = 4294967286;
        }
        else
        {
          objc_msgSend(v18, "doubleValue");
          v41 = v40;
          objc_msgSend(v12, "upperBoundOffsetThresholdX");
          if (v41 <= v42)
          {
            objc_msgSend(v18, "doubleValue");
            v44 = v43;
            objc_msgSend(v12, "lowerBoundOffsetThresholdX");
            if (v44 >= v45)
            {
              objc_msgSend(v22, "doubleValue");
              v47 = v46;
              objc_msgSend(v12, "upperBoundOffsetThresholdY");
              if (v47 <= v48)
              {
                objc_msgSend(v22, "doubleValue");
                v50 = v49;
                objc_msgSend(v12, "lowerBoundOffsetThresholdY");
                if (v50 >= v51)
                {
                  objc_msgSend(v33, "doubleValue");
                  v53 = v52;
                  objc_msgSend(v12, "upperBoundOffsetThresholdZ");
                  if (v53 <= v54)
                  {
                    objc_msgSend(v33, "doubleValue");
                    v56 = v55;
                    objc_msgSend(v12, "lowerBoundOffsetThresholdZ");
                    if (v56 >= v57)
                    {
                      -[InteractiveAccelerometerViewController setDidCompleteSuccessfully:](self, "setDidCompleteSuccessfully:", 0);
                      goto LABEL_15;
                    }
                  }
                }
              }
            }
          }
          v37 = self;
          v38 = 4294967288;
        }
        -[InteractiveAccelerometerViewController setDidCompleteSuccessfully:](v37, "setDidCompleteSuccessfully:", v38);
        -[InteractiveAccelerometerViewController setOrientationMissed:](self, "setOrientationMissed:", 1);
LABEL_15:
        v58[0] = CFSTR("x");
        v58[1] = CFSTR("y");
        v59[0] = v18;
        v59[1] = v22;
        v58[2] = CFSTR("z");
        v59[2] = v33;
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v59, v58, 3));
        -[InteractiveAccelerometerViewController setAveragedRawData:](self, "setAveragedRawData:", v39);

        goto LABEL_8;
      }
    }
  }
  -[InteractiveAccelerometerViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_100010C98);
LABEL_8:

}

- (void)cleanUp
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController timeoutTimer](self, "timeoutTimer"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController timeoutTimer](self, "timeoutTimer"));
    objc_msgSend(v4, "invalidate");

    -[InteractiveAccelerometerViewController setTimeoutTimer:](self, "setTimeoutTimer:", 0);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DAHIDEventMonitor sharedInstance](DAHIDEventMonitor, "sharedInstance"));
  objc_msgSend(v5, "stopMonitoring");

  -[InteractiveAccelerometerViewController stopAnimations](self, "stopAnimations");
}

- (void)endTestWithStatusCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  const __CFString *v22;
  void *v23;

  v4 = a3;
  -[InteractiveAccelerometerViewController cleanUp](self, "cleanUp");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController result](self, "result"));
  objc_msgSend(v5, "setStatusCode:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController result](self, "result"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "statusCode"));
  if ((objc_msgSend(v7, "isEqualToNumber:", &off_100010CB0) & 1) != 0)
    goto LABEL_8;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController result](self, "result"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "statusCode"));
  if ((objc_msgSend(v9, "isEqualToNumber:", &off_100010CC8) & 1) != 0)
  {
LABEL_7:

LABEL_8:
    goto LABEL_9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController result](self, "result"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "statusCode"));
  if ((objc_msgSend(v11, "isEqualToNumber:", &off_100010CE0) & 1) != 0)
  {
LABEL_6:

    goto LABEL_7;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController result](self, "result"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "statusCode"));
  if ((objc_msgSend(v13, "isEqualToNumber:", &off_100010CF8) & 1) != 0)
  {

    goto LABEL_6;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController result](self, "result"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "statusCode"));
  v21 = objc_msgSend(v17, "isEqualToNumber:", &off_100010C98);

  if ((v21 & 1) == 0)
  {
    v22 = CFSTR("orientations");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController allResults](self, "allResults"));
    v23 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController result](self, "result"));
    objc_msgSend(v19, "setData:", v18);

    goto LABEL_12;
  }
LABEL_9:
  v14 = DiagnosticLogHandleForCategory(3);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_100009D28(v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController result](self, "result"));
  objc_msgSend(v16, "setData:", &__NSDictionary0__struct);
LABEL_12:

  -[InteractiveAccelerometerViewController setFinished:](self, "setFinished:", 1);
}

- (void)notStationaryTimedOut
{
  -[InteractiveAccelerometerViewController addNotStationaryData](self, "addNotStationaryData");
  -[InteractiveAccelerometerViewController setDidCompleteSuccessfully:](self, "setDidCompleteSuccessfully:", 4294967291);
  -[InteractiveAccelerometerViewController setOrientationMissed:](self, "setOrientationMissed:", 1);
  -[InteractiveAccelerometerViewController checkForNextOrientation](self, "checkForNextOrientation");
}

- (void)heldOrientationStationary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[InteractiveAccelerometerViewController addNotStationaryData](self, "addNotStationaryData");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController timeoutTimer](self, "timeoutTimer"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController timeoutTimer](self, "timeoutTimer"));
    objc_msgSend(v4, "invalidate");

    -[InteractiveAccelerometerViewController setSamplingRawData:](self, "setSamplingRawData:", 1);
    v6 = (id)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
    objc_msgSend(v6, "secondsToRunOrientation");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "checkForNextOrientation", 0, 0));
    -[InteractiveAccelerometerViewController setTimeoutTimer:](self, "setTimeoutTimer:", v5);

  }
}

- (void)checkForNextOrientation
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  signed int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  _UNKNOWN **v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[5];
  _QWORD v33[5];

  if (-[InteractiveAccelerometerViewController samplingRawData](self, "samplingRawData"))
  {
    -[InteractiveAccelerometerViewController setSamplingRawData:](self, "setSamplingRawData:", 0);
    -[InteractiveAccelerometerViewController addStationaryData](self, "addStationaryData");
    -[InteractiveAccelerometerViewController checkWithinOffset](self, "checkWithinOffset");
  }
  v3 = -[InteractiveAccelerometerViewController debuggingEnabled](self, "debuggingEnabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController allResults](self, "allResults"));
  if (v3)
  {
    v32[0] = CFSTR("orientation");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "orientationsParameter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", -[InteractiveAccelerometerViewController orientationsIndex](self, "orientationsIndex")));
    v33[0] = v7;
    v32[1] = CFSTR("didCompleteSuccessfully");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[InteractiveAccelerometerViewController didCompleteSuccessfully](self, "didCompleteSuccessfully")));
    v33[1] = v8;
    v32[2] = CFSTR("averagedRawData");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController averagedRawData](self, "averagedRawData"));
    v33[2] = v9;
    v32[3] = CFSTR("notStationaryData");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController notStationaryData](self, "notStationaryData"));
    v33[3] = v10;
    v32[4] = CFSTR("stationaryData");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController stationaryData](self, "stationaryData"));
    v33[4] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 5));
    objc_msgSend(v4, "addObject:", v12);

  }
  else
  {
    v30[0] = CFSTR("orientation");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "orientationsParameter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", -[InteractiveAccelerometerViewController orientationsIndex](self, "orientationsIndex")));
    v31[0] = v7;
    v30[1] = CFSTR("didCompleteSuccessfully");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[InteractiveAccelerometerViewController didCompleteSuccessfully](self, "didCompleteSuccessfully")));
    v31[1] = v8;
    v30[2] = CFSTR("averagedRawData");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController averagedRawData](self, "averagedRawData"));
    v31[2] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 3));
    objc_msgSend(v4, "addObject:", v10);
  }

  -[InteractiveAccelerometerViewController setOrientationsIndex:](self, "setOrientationsIndex:", -[InteractiveAccelerometerViewController orientationsIndex](self, "orientationsIndex") + 1);
  v13 = -[InteractiveAccelerometerViewController orientationsIndex](self, "orientationsIndex");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "orientationsParameter"));
  v16 = objc_msgSend(v15, "count");

  if ((unint64_t)v16 <= v13)
  {
    if (-[InteractiveAccelerometerViewController orientationMissed](self, "orientationMissed"))
      v27 = &off_100010D10;
    else
      v27 = &off_100010D28;
    goto LABEL_20;
  }
  if (!-[InteractiveAccelerometerViewController determineTestingOrientation](self, "determineTestingOrientation"))
  {
    v27 = &off_100010C68;
LABEL_20:
    -[InteractiveAccelerometerViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", v27);
    return;
  }
  -[InteractiveAccelerometerViewController setZeroRangeAndDegreesShiftRange](self, "setZeroRangeAndDegreesShiftRange");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
  -[InteractiveAccelerometerViewController setAveragedRawData:](self, "setAveragedRawData:", v17);

  if (-[InteractiveAccelerometerViewController debuggingEnabled](self, "debuggingEnabled"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
    -[InteractiveAccelerometerViewController setNotStationaryData:](self, "setNotStationaryData:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
    -[InteractiveAccelerometerViewController setStationaryData:](self, "setStationaryData:", v19);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[InteractiveAccelerometerViewController setStartDate:](self, "setStartDate:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[DSTestAutomation sharedInstance](DSTestAutomation, "sharedInstance"));
  v22 = objc_msgSend(v21, "testAutomationEnabled");

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
    if (objc_msgSend(v23, "componentSensor"))
      v24 = CFSTR("ListenForGyroPosition");
    else
      v24 = CFSTR("ListenForAccelerometerPosition");
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[InteractiveAccelerometerViewController testingOrientation](self, "testingOrientation", CFSTR("deviceOrientation"))));
    v29 = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
    +[DSTestAutomation postInteractiveTestEvent:info:](DSTestAutomation, "postInteractiveTestEvent:info:", v24, v26);

  }
  -[InteractiveAccelerometerViewController updateColors](self, "updateColors");
}

- (void)handleHIDEvent:(__IOHIDEvent *)a3
{
  uint64_t v5;
  float FloatValue;
  float v7;
  float v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  float v18;
  float v19;
  float v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];

  if (IOHIDEventGetType(a3, a2) == 13)
  {
    FloatValue = IOHIDEventGetFloatValue(a3, 851968);
    v7 = IOHIDEventGetFloatValue(a3, 851969);
    v8 = IOHIDEventGetFloatValue(a3, 851970);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController rawComponentData](self, "rawComponentData"));
    objc_sync_enter(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController rawComponentData](self, "rawComponentData"));
    v32[0] = CFSTR("x");
    *(float *)&v11 = FloatValue;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v11));
    v33[0] = v12;
    v32[1] = CFSTR("y");
    *(float *)&v13 = v7;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v13));
    v33[1] = v14;
    v32[2] = CFSTR("z");
    *(float *)&v15 = v8;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v15));
    v33[2] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 3));
    objc_msgSend(v10, "addObject:", v17);

    objc_sync_exit(v9);
  }
  if (IOHIDEventGetType(a3, v5) == 20)
  {
    v18 = IOHIDEventGetFloatValue(a3, 1310720);
    v19 = IOHIDEventGetFloatValue(a3, 1310721);
    v20 = IOHIDEventGetFloatValue(a3, 1310722);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController rawComponentData](self, "rawComponentData"));
    objc_sync_enter(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController rawComponentData](self, "rawComponentData"));
    v30[0] = CFSTR("x");
    *(float *)&v23 = v18;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v23));
    v31[0] = v24;
    v30[1] = CFSTR("y");
    *(float *)&v25 = v19;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v25));
    v31[1] = v26;
    v30[2] = CFSTR("z");
    *(float *)&v27 = v20;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v27));
    v31[2] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 3));
    objc_msgSend(v22, "addObject:", v29);

    objc_sync_exit(v21);
  }
}

- (void)updateDisplay:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  CGFloat v31;
  double v32;
  unsigned int v33;
  double v34;
  double v35;
  int64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  CGFloat v44;
  double v45;
  float v46;
  CGFloat v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  CATransform3D v58;
  CATransform3D v59;
  CATransform3D v60;
  CATransform3D v61;
  CATransform3D v62;
  CATransform3D v63;
  CATransform3D v64;
  CATransform3D v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  double v70;
  _QWORD v71[3];
  _QWORD v72[3];
  CGRect v73;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CMMotionManager deviceMotion](self->_manager, "deviceMotion", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attitude"));

  v70 = 0.0;
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  if (v5)
  {
    objc_msgSend(v5, "rotationMatrix");
    v6 = *(double *)&v67;
    v7 = *((double *)&v68 + 1);
    v8 = v70;
  }
  else
  {
    v8 = 0.0;
    v7 = 0.0;
    v6 = 0.0;
  }
  v9 = -v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
  v11 = objc_msgSend(v10, "componentSensor");

  if (v11 == (id)1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController manager](self, "manager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "deviceMotion"));
    objc_msgSend(v13, "rotationRate");
    v15 = v14;
    v17 = v16;
    v19 = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController motionManagerData](self, "motionManagerData"));
    v71[0] = CFSTR("x");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15));
    v72[0] = v21;
    v71[1] = CFSTR("y");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v17));
    v72[1] = v22;
    v71[2] = CFSTR("z");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v19));
    v72[2] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v72, v71, 3));
    objc_msgSend(v20, "addObject:", v24);

  }
  v25 = v7 * v7 + v6 * v6;
  v26 = sqrt(v25);
  v27 = 0.0;
  if (v25 <= 0.0)
    v28 = 0.0;
  else
    v28 = v26;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut));
  v30 = atan2(-v6, v7);
  v31 = -1.57079633;
  v32 = acos(v9) + -1.57079633;
  v33 = -[InteractiveAccelerometerViewController _updateForRotation:shiftAngle:](self, "_updateForRotation:shiftAngle:", v30, v32);
  if (v28 <= 0.100000001)
  {
    v36 = -[InteractiveAccelerometerViewController rotationOrientation](self, "rotationOrientation");
    if ((unint64_t)(v36 - 2) <= 2)
      v27 = dbl_10000CEB8[v36 - 2];
    v37 = v27 - v30;
    if (v27 - v30 <= 3.14159265)
    {
      if (v37 < -3.14159265)
        v27 = v30 + v37 + 6.28318531;
    }
    else
    {
      v27 = v30 - (6.28318531 - v37);
    }
    v38 = 1.0;
    if (v28 >= 0.0250000004)
      v38 = (v28 + -0.0250000004) / -0.0750000011 + 1.0;
    v30 = v30 + v38 * (v27 - v30);
    v31 = v27;
  }
  else
  {
    v34 = v30 * 180.0 / 3.14159265;
    v35 = fabs(v34);
    if (v35 >= 45.0)
    {
      if (v35 <= 135.0)
      {
        if (v34 <= 45.0 || v34 >= 135.0)
        {
          -[InteractiveAccelerometerViewController setRotationOrientation:](self, "setRotationOrientation:", 4);
        }
        else
        {
          -[InteractiveAccelerometerViewController setRotationOrientation:](self, "setRotationOrientation:", 3);
          v31 = 1.57079633;
        }
      }
      else
      {
        -[InteractiveAccelerometerViewController setRotationOrientation:](self, "setRotationOrientation:", 2);
        v31 = -3.14159265;
      }
    }
    else
    {
      -[InteractiveAccelerometerViewController setRotationOrientation:](self, "setRotationOrientation:", 1);
      v31 = 0.0;
    }
  }
  -[InteractiveAccelerometerViewController previousShift](self, "previousShift");
  if (vabdd_f64(v32, v39) > 0.0000999999975
    || (-[InteractiveAccelerometerViewController previousRotation](self, "previousRotation"),
        vabdd_f64(v30, v40) > 0.0000999999975))
  {
    v33 = 1;
  }
  v41 = v32 / 1.57079633;
  if (-[InteractiveAccelerometerViewController framesLevel](self, "framesLevel") >= 1)
  {
    v42 = (double)-[InteractiveAccelerometerViewController framesLevel](self, "framesLevel") / 30.0;
    if ((id)-[InteractiveAccelerometerViewController orientation](self, "orientation") == (id)6)
    {
      v41 = v41 * (1.0 - v42) - v42;
    }
    else if ((id)-[InteractiveAccelerometerViewController orientation](self, "orientation") == (id)5)
    {
      v41 = v42 + v41 * (1.0 - v42);
    }
  }
  if (v33)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController view](self, "view"));
    objc_msgSend(v43, "bounds");
    v44 = CGRectGetHeight(v73) * 1.29999995;

    *(float *)&v45 = v28;
    objc_msgSend(v29, "_solveForInput:", v45);
    v47 = v44 * (v46 * 0.399999976 + 0.600000024);
    memset(&v65, 0, sizeof(v65));
    CATransform3DMakeRotation(&v65, v30, 0.0, 0.0, -1.0);
    memset(&v64, 0, sizeof(v64));
    v63 = v65;
    CATransform3DTranslate(&v64, &v63, 0.0, -(v44 * v41), 0.0);
    memset(&v63, 0, sizeof(v63));
    v62 = v65;
    CATransform3DTranslate(&v63, &v62, 0.0, -(v47 * (v41 + -1.0)), 0.0);
    memset(&v62, 0, sizeof(v62));
    v61 = v65;
    CATransform3DTranslate(&v62, &v61, 0.0, (v41 + -1.0) * v47, 0.0);
    memset(&v61, 0, sizeof(v61));
    v48 = v41 + 1.0;
    v60 = v65;
    CATransform3DTranslate(&v61, &v60, 0.0, -(v47 * v48), 0.0);
    memset(&v60, 0, sizeof(v60));
    v59 = v65;
    CATransform3DTranslate(&v60, &v59, 0.0, v48 * v47, 0.0);
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController levelBottom](self, "levelBottom"));
    v59 = v64;
    objc_msgSend(v49, "setTransform:", &v59);

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController degreesLabel](self, "degreesLabel"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "layer"));
    v59 = v65;
    objc_msgSend(v51, "setTransform:", &v59);

    v52 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController bottomOuterCircle](self, "bottomOuterCircle"));
    v59 = v63;
    objc_msgSend(v52, "setTransform:", &v59);

    v53 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController bottomInnerCircle](self, "bottomInnerCircle"));
    v59 = v62;
    objc_msgSend(v53, "setTransform:", &v59);

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController topOuterCircle](self, "topOuterCircle"));
    v59 = v61;
    objc_msgSend(v54, "setTransform:", &v59);

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController topInnerCircle](self, "topInnerCircle"));
    v59 = v60;
    objc_msgSend(v55, "setTransform:", &v59);

    v56 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController ticContainer](self, "ticContainer"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "layer"));
    CATransform3DMakeRotation(&v58, v31, 0.0, 0.0, 1.0);
    objc_msgSend(v57, "setTransform:", &v58);

    +[CATransaction commit](CATransaction, "commit");
  }
  -[InteractiveAccelerometerViewController setPreviousShift:](self, "setPreviousShift:", v32);
  -[InteractiveAccelerometerViewController setPreviousRotation:](self, "setPreviousRotation:", v30);

}

- (BOOL)_updateForRotation:(double)a3 shiftAngle:(double)a4
{
  double v7;
  double v8;
  int64_t v9;
  double v10;
  int64_t v11;
  BOOL v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  char *v31;
  _BOOL4 v33;
  void *v34;
  double v35;
  double v36;
  char *v37;
  uint64_t v38;
  double v39;
  _BOOL4 v40;
  int64_t v41;
  _BOOL8 v42;
  double v43;

  -[InteractiveAccelerometerViewController setCurrentShift:](self, "setCurrentShift:", a4);
  -[InteractiveAccelerometerViewController setCurrentRotation:](self, "setCurrentRotation:", a3);
  v7 = a3 * 180.0 / 3.14159265;
  -[InteractiveAccelerometerViewController setDegreesShift:](self, "setDegreesShift:", a4 * 180.0 / 3.14159265);
  -[InteractiveAccelerometerViewController degreesShift](self, "degreesShift");
  if (fabs(v8) <= 40.0)
  {
    v10 = fabs(v7);
    if (v10 >= 20.0)
    {
      if (v10 <= 160.0)
      {
        if (v7 <= 70.0 || v7 >= 110.0)
        {
          if (v7 >= -70.0 || v7 <= -110.0)
            v9 = -[InteractiveAccelerometerViewController orientation](self, "orientation");
          else
            v9 = 4;
        }
        else
        {
          v9 = 3;
        }
      }
      else
      {
        v9 = 2;
      }
    }
    else
    {
      v9 = 1;
    }
  }
  else if (a4 <= 0.0)
  {
    v9 = 6;
  }
  else
  {
    v9 = 5;
  }
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v11 = -[InteractiveAccelerometerViewController orientation](self, "orientation");
  v12 = v9 != v11;
  if (v9 != v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController traitCollection](self, "traitCollection"));
    v14 = objc_msgSend(v13, "verticalSizeClass");

    if (v14 == (id)2)
    {
      -[InteractiveAccelerometerViewController setPreviousOrientation:](self, "setPreviousOrientation:", v9);
      -[InteractiveAccelerometerViewController updateTicsForOrientation:](self, "updateTicsForOrientation:", v9);
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController traitCollection](self, "traitCollection"));
      v16 = objc_msgSend(v15, "verticalSizeClass");

      if (v16 == (id)1)
        -[InteractiveAccelerometerViewController setPreviousOrientation:](self, "setPreviousOrientation:", v9);
    }
    -[InteractiveAccelerometerViewController updateTicsForOrientation:](self, "updateTicsForOrientation:", v9);
  }
  -[InteractiveAccelerometerViewController setOrientation:](self, "setOrientation:", v9);
  switch(v9)
  {
    case 1:
      goto LABEL_58;
    case 2:
      if (a3 <= 3.14159265)
      {
        if (a3 < -3.14159265)
          a3 = a3 + 6.28318531;
      }
      else
      {
        a3 = -(6.28318531 - a3);
      }
      v18 = a3 + -3.14159265;
      if (a3 + -3.14159265 <= 3.14159265)
      {
        if (v18 >= -3.14159265)
        {
LABEL_48:
          v24 = a3 * 180.0 / 3.14159265;
          v25 = -180.0;
          goto LABEL_57;
        }
        v19 = 6.28318531;
      }
      else
      {
        v19 = -6.28318531;
      }
      a3 = v18 + v19 + 3.14159265;
      goto LABEL_48;
    case 3:
      if (a3 <= 3.14159265)
      {
        if (a3 < -3.14159265)
          a3 = a3 + 6.28318531;
      }
      else
      {
        a3 = -(6.28318531 - a3);
      }
      v20 = a3 + -1.57079633;
      if (a3 + -1.57079633 <= 3.14159265)
      {
        if (v20 >= -3.14159265)
          goto LABEL_52;
        v21 = 6.28318531;
      }
      else
      {
        v21 = -6.28318531;
      }
      a3 = v20 + v21 + 1.57079633;
LABEL_52:
      v24 = a3 * 180.0 / 3.14159265;
      v25 = -90.0;
      goto LABEL_57;
    case 4:
      if (a3 <= 3.14159265)
      {
        if (a3 < -3.14159265)
          a3 = a3 + 6.28318531;
      }
      else
      {
        a3 = -(6.28318531 - a3);
      }
      v22 = a3 + 2.35619449;
      if (a3 + 2.35619449 <= 3.14159265)
      {
        if (v22 >= -3.14159265)
          goto LABEL_56;
        v23 = 6.28318531;
      }
      else
      {
        v23 = -6.28318531;
      }
      a3 = v22 + v23 + -2.35619449;
LABEL_56:
      v24 = a3 * 180.0 / 3.14159265;
      v25 = 90.0;
LABEL_57:
      v7 = v24 + v25;
LABEL_58:
      +[CATransaction commit](CATransaction, "commit");
      -[InteractiveAccelerometerViewController degreesShift](self, "degreesShift");
      v27 = fabs(v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
      objc_msgSend(v28, "degreesShiftRange");
      v30 = v29;

      v31 = (char *)-[InteractiveAccelerometerViewController orientation](self, "orientation") - 5;
      v33 = v27 < v30 || (unint64_t)v31 < 0xFFFFFFFFFFFFFFFCLL;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
      objc_msgSend(v34, "zeroRange");
      v36 = v35;

      v37 = 0;
      if (fabs(v7) >= v36 || !v33)
        goto LABEL_68;
      if (-[InteractiveAccelerometerViewController framesLevel](self, "framesLevel", 0) <= 29)
      {
        v37 = (char *)-[InteractiveAccelerometerViewController framesLevel](self, "framesLevel") + 1;
        v12 = 1;
LABEL_68:
        -[InteractiveAccelerometerViewController setFramesLevel:](self, "setFramesLevel:", v37);
      }
      v38 = -[InteractiveAccelerometerViewController framesLevel](self, "framesLevel");
      if (v38 > 29 == -[InteractiveAccelerometerViewController isLeveled](self, "isLeveled"))
        goto LABEL_80;
      if (-[InteractiveAccelerometerViewController isLeveled](self, "isLeveled")
        && ((-[InteractiveAccelerometerViewController lastLevelChange](self, "lastLevelChange"),
             vabdd_f64(v39, v7) <= 0.75)
          ? (v40 = v33)
          : (v40 = 0),
            v40))
      {
        -[InteractiveAccelerometerViewController setFramesLevel:](self, "setFramesLevel:", 30);
        return 0;
      }
      else
      {
        if (v38 < 30)
        {
          v42 = 0;
        }
        else
        {
          v41 = -[InteractiveAccelerometerViewController orientation](self, "orientation");
          v42 = v41 == -[InteractiveAccelerometerViewController testingOrientation](self, "testingOrientation");
        }
        -[InteractiveAccelerometerViewController setIsLeveled:](self, "setIsLeveled:", v42);
        -[InteractiveAccelerometerViewController setLastLevelChange:](self, "setLastLevelChange:", v7);
        -[InteractiveAccelerometerViewController updateColors](self, "updateColors");
        v12 = 1;
LABEL_80:
        v43 = 0.0;
        if (v38 <= 29)
          v43 = v7;
        -[InteractiveAccelerometerViewController _updateOffsetLabel:](self, "_updateOffsetLabel:", v43);
      }
      return v12;
    case 5:
      v17 = -1.57079633;
      goto LABEL_32;
    case 6:
      v17 = 1.57079633;
LABEL_32:
      v7 = (a4 + v17) * 180.0 / 3.14159265;
      goto LABEL_58;
    default:
      v7 = 0.0;
      goto LABEL_58;
  }
}

- (void)updateColors
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  const char *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  id v59;

  v59 = (id)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  if (-[InteractiveAccelerometerViewController isLeveled](self, "isLeveled")
    && (v4 = -[InteractiveAccelerometerViewController orientation](self, "orientation"),
        v4 == (void *)-[InteractiveAccelerometerViewController testingOrientation](self, "testingOrientation")))
  {
    v5 = objc_retainAutorelease(v59);
    v6 = objc_msgSend(v5, "CGColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController levelBottom](self, "levelBottom"));
    objc_msgSend(v7, "setBackgroundColor:", v6);

    v8 = objc_retainAutorelease(v5);
    v9 = objc_msgSend(v8, "CGColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController topInnerCircle](self, "topInnerCircle"));
    objc_msgSend(v10, "setFillColor:", v9);

    v11 = objc_retainAutorelease(v8);
    v12 = objc_msgSend(v11, "CGColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController topOuterCircle](self, "topOuterCircle"));
    objc_msgSend(v13, "setFillColor:", v12);

    v14 = objc_retainAutorelease(v11);
    v15 = objc_msgSend(v14, "CGColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController bottomInnerCircle](self, "bottomInnerCircle"));
    objc_msgSend(v16, "setFillColor:", v15);

    v17 = objc_retainAutorelease(v14);
    v18 = objc_msgSend(v17, "CGColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController bottomOuterCircle](self, "bottomOuterCircle"));
    objc_msgSend(v19, "setFillColor:", v18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController degreesLabel](self, "degreesLabel"));
    objc_msgSend(v20, "setTextColor:", v17);

    v21 = objc_retainAutorelease(v17);
    v22 = objc_msgSend(v21, "CGColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController leftLevelTic](self, "leftLevelTic"));
    objc_msgSend(v23, "setBackgroundColor:", v22);

    v24 = objc_msgSend(objc_retainAutorelease(v21), "CGColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController rightLevelTic](self, "rightLevelTic"));
    objc_msgSend(v25, "setBackgroundColor:", v24);

    if (!-[InteractiveAccelerometerViewController samplingRawData](self, "samplingRawData"))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController timeoutTimer](self, "timeoutTimer"));

      if (v26)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController timeoutTimer](self, "timeoutTimer"));
        objc_msgSend(v27, "invalidate");

        v28 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
        objc_msgSend(v28, "holdStationaryTimeout");
        v30 = "heldOrientationStationary";
LABEL_9:
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, v30, 0, 0, v29));
        -[InteractiveAccelerometerViewController setTimeoutTimer:](self, "setTimeoutTimer:", v58);

      }
    }
  }
  else
  {
    v31 = objc_retainAutorelease(v3);
    v32 = objc_msgSend(v31, "CGColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController levelBottom](self, "levelBottom"));
    objc_msgSend(v33, "setBackgroundColor:", v32);

    v34 = objc_retainAutorelease(v31);
    v35 = objc_msgSend(v34, "CGColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController topInnerCircle](self, "topInnerCircle"));
    objc_msgSend(v36, "setFillColor:", v35);

    v37 = objc_retainAutorelease(v34);
    v38 = objc_msgSend(v37, "CGColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController topOuterCircle](self, "topOuterCircle"));
    objc_msgSend(v39, "setFillColor:", v38);

    v40 = objc_retainAutorelease(v37);
    v41 = objc_msgSend(v40, "CGColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController bottomOuterCircle](self, "bottomOuterCircle"));
    objc_msgSend(v42, "setFillColor:", v41);

    v43 = objc_retainAutorelease(v40);
    v44 = objc_msgSend(v43, "CGColor");
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController bottomInnerCircle](self, "bottomInnerCircle"));
    objc_msgSend(v45, "setFillColor:", v44);

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController degreesLabel](self, "degreesLabel"));
    objc_msgSend(v46, "setTextColor:", v43);

    v47 = objc_retainAutorelease(v43);
    v48 = objc_msgSend(v47, "CGColor");
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController leftLevelTic](self, "leftLevelTic"));
    objc_msgSend(v49, "setBackgroundColor:", v48);

    v50 = objc_msgSend(objc_retainAutorelease(v47), "CGColor");
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController rightLevelTic](self, "rightLevelTic"));
    objc_msgSend(v51, "setBackgroundColor:", v50);

    if (!-[InteractiveAccelerometerViewController samplingRawData](self, "samplingRawData"))
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController timeoutTimer](self, "timeoutTimer"));

      if (v52)
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController timeoutTimer](self, "timeoutTimer"));
        objc_msgSend(v53, "invalidate");

        v54 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController startDate](self, "startDate"));
        objc_msgSend(v54, "timeIntervalSinceNow");
        v56 = v55;

        v28 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
        objc_msgSend(v28, "notStationaryTimeout");
        v29 = v56 + v57;
        v30 = "notStationaryTimedOut";
        goto LABEL_9;
      }
    }
  }

}

- (void)_updateOffsetLabel:(double)a3
{
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;

  v5 = (void *)(uint64_t)a3;
  v6 = fabs(a3);
  if (v6 < 1.0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController inputs](self, "inputs"));
    objc_msgSend(v7, "zeroRange");
    v9 = v8;

    if (v6 > v9)
      v5 = (void *)((*(uint64_t *)&a3 >> 63) | 1);
  }
  if ((void *)-[InteractiveAccelerometerViewController lastDisplayDegrees](self, "lastDisplayDegrees") != v5)
  {
    -[InteractiveAccelerometerViewController setLastDisplayDegrees:](self, "setLastDisplayDegrees:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("COMPASS_DEGREES"), &stru_1000109E0, 0));
    v20 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v5));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController degreesLabel](self, "degreesLabel"));
    objc_msgSend(v12, "setText:", v20);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController degreesLabel](self, "degreesLabel"));
    objc_msgSend(v13, "sizeToFit");

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController view](self, "view"));
    objc_msgSend(v14, "center");
    v16 = v15;
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController degreesLabel](self, "degreesLabel"));
    objc_msgSend(v19, "setCenter:", v16, v18);

  }
}

- (void)updateTicsForOrientation:(int64_t)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = a3 - 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController leftLevelTic](self, "leftLevelTic"));
  v6 = v5;
  if (v4 > 3)
  {
    objc_msgSend(v5, "setHidden:", 1);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController rightLevelTic](self, "rightLevelTic"));
    v9 = v7;
    v8 = 1;
  }
  else
  {
    objc_msgSend(v5, "setHidden:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[InteractiveAccelerometerViewController rightLevelTic](self, "rightLevelTic"));
    v9 = v7;
    v8 = 0;
  }
  objc_msgSend(v7, "setHidden:", v8);

}

- (double)average:(id)a3 key:(id)a4 size:(unint64_t)a5
{
  id v7;
  unint64_t v8;
  double v9;
  unsigned int v10;
  void *v11;
  void *v12;
  float v13;

  v7 = a4;
  if (a5)
  {
    v8 = 0;
    v9 = 0.0;
    v10 = 1;
    do
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectAtIndexedSubscript:", v8));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v7));
      objc_msgSend(v12, "floatValue");
      v9 = v9 + v13;

      v8 = v10++;
    }
    while (v8 < a5);
  }
  else
  {
    v9 = 0.0;
  }

  return v9 / (double)a5;
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

- (BOOL)debuggingEnabled
{
  return self->_debuggingEnabled;
}

- (void)setDebuggingEnabled:(BOOL)a3
{
  self->_debuggingEnabled = a3;
}

- (UIFontDescriptor)fontDescriptor
{
  return self->_fontDescriptor;
}

- (void)setFontDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_fontDescriptor, a3);
}

- (CMMotionManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (UIView)filterContainer
{
  return self->_filterContainer;
}

- (void)setFilterContainer:(id)a3
{
  objc_storeStrong((id *)&self->_filterContainer, a3);
}

- (UIView)levelContainer
{
  return self->_levelContainer;
}

- (void)setLevelContainer:(id)a3
{
  objc_storeStrong((id *)&self->_levelContainer, a3);
}

- (UIView)levelHoldContainer
{
  return self->_levelHoldContainer;
}

- (void)setLevelHoldContainer:(id)a3
{
  objc_storeStrong((id *)&self->_levelHoldContainer, a3);
}

- (UIView)bubbleContainer
{
  return self->_bubbleContainer;
}

- (void)setBubbleContainer:(id)a3
{
  objc_storeStrong((id *)&self->_bubbleContainer, a3);
}

- (UIView)ticContainer
{
  return self->_ticContainer;
}

- (void)setTicContainer:(id)a3
{
  objc_storeStrong((id *)&self->_ticContainer, a3);
}

- (CAShapeLayer)bottomOuterCircle
{
  return self->_bottomOuterCircle;
}

- (void)setBottomOuterCircle:(id)a3
{
  objc_storeStrong((id *)&self->_bottomOuterCircle, a3);
}

- (CAShapeLayer)bottomInnerCircle
{
  return self->_bottomInnerCircle;
}

- (void)setBottomInnerCircle:(id)a3
{
  objc_storeStrong((id *)&self->_bottomInnerCircle, a3);
}

- (CAShapeLayer)topOuterCircle
{
  return self->_topOuterCircle;
}

- (void)setTopOuterCircle:(id)a3
{
  objc_storeStrong((id *)&self->_topOuterCircle, a3);
}

- (CAShapeLayer)topInnerCircle
{
  return self->_topInnerCircle;
}

- (void)setTopInnerCircle:(id)a3
{
  objc_storeStrong((id *)&self->_topInnerCircle, a3);
}

- (UILabel)degreesLabel
{
  return self->_degreesLabel;
}

- (void)setDegreesLabel:(id)a3
{
  objc_storeStrong((id *)&self->_degreesLabel, a3);
}

- (CALayer)levelBottom
{
  return self->_levelBottom;
}

- (void)setLevelBottom:(id)a3
{
  objc_storeStrong((id *)&self->_levelBottom, a3);
}

- (CALayer)leftLevelTic
{
  return self->_leftLevelTic;
}

- (void)setLeftLevelTic:(id)a3
{
  objc_storeStrong((id *)&self->_leftLevelTic, a3);
}

- (CALayer)rightLevelTic
{
  return self->_rightLevelTic;
}

- (void)setRightLevelTic:(id)a3
{
  objc_storeStrong((id *)&self->_rightLevelTic, a3);
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (int64_t)rotationOrientation
{
  return self->_rotationOrientation;
}

- (void)setRotationOrientation:(int64_t)a3
{
  self->_rotationOrientation = a3;
}

- (int64_t)previousOrientation
{
  return self->_previousOrientation;
}

- (void)setPreviousOrientation:(int64_t)a3
{
  self->_previousOrientation = a3;
}

- (int64_t)lastDisplayDegrees
{
  return self->_lastDisplayDegrees;
}

- (void)setLastDisplayDegrees:(int64_t)a3
{
  self->_lastDisplayDegrees = a3;
}

- (int64_t)framesLevel
{
  return self->_framesLevel;
}

- (void)setFramesLevel:(int64_t)a3
{
  self->_framesLevel = a3;
}

- (double)currentShift
{
  return self->_currentShift;
}

- (void)setCurrentShift:(double)a3
{
  self->_currentShift = a3;
}

- (double)currentRotation
{
  return self->_currentRotation;
}

- (void)setCurrentRotation:(double)a3
{
  self->_currentRotation = a3;
}

- (double)previousShift
{
  return self->_previousShift;
}

- (void)setPreviousShift:(double)a3
{
  self->_previousShift = a3;
}

- (double)previousRotation
{
  return self->_previousRotation;
}

- (void)setPreviousRotation:(double)a3
{
  self->_previousRotation = a3;
}

- (double)lastLevelChange
{
  return self->_lastLevelChange;
}

- (void)setLastLevelChange:(double)a3
{
  self->_lastLevelChange = a3;
}

- (double)degreesShift
{
  return self->_degreesShift;
}

- (void)setDegreesShift:(double)a3
{
  self->_degreesShift = a3;
}

- (BOOL)isLeveled
{
  return self->_isLeveled;
}

- (void)setIsLeveled:(BOOL)a3
{
  self->_isLeveled = a3;
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (int64_t)testingOrientation
{
  return self->_testingOrientation;
}

- (void)setTestingOrientation:(int64_t)a3
{
  self->_testingOrientation = a3;
}

- (int)orientationsIndex
{
  return self->_orientationsIndex;
}

- (void)setOrientationsIndex:(int)a3
{
  self->_orientationsIndex = a3;
}

- (BOOL)orientationMissed
{
  return self->_orientationMissed;
}

- (void)setOrientationMissed:(BOOL)a3
{
  self->_orientationMissed = a3;
}

- (BOOL)samplingRawData
{
  return self->_samplingRawData;
}

- (void)setSamplingRawData:(BOOL)a3
{
  self->_samplingRawData = a3;
}

- (int)didCompleteSuccessfully
{
  return self->_didCompleteSuccessfully;
}

- (void)setDidCompleteSuccessfully:(int)a3
{
  self->_didCompleteSuccessfully = a3;
}

- (NSDictionary)averagedRawData
{
  return self->_averagedRawData;
}

- (void)setAveragedRawData:(id)a3
{
  objc_storeStrong((id *)&self->_averagedRawData, a3);
}

- (NSDictionary)notStationaryData
{
  return self->_notStationaryData;
}

- (void)setNotStationaryData:(id)a3
{
  objc_storeStrong((id *)&self->_notStationaryData, a3);
}

- (NSDictionary)stationaryData
{
  return self->_stationaryData;
}

- (void)setStationaryData:(id)a3
{
  objc_storeStrong((id *)&self->_stationaryData, a3);
}

- (NSMutableArray)motionManagerData
{
  return self->_motionManagerData;
}

- (void)setMotionManagerData:(id)a3
{
  objc_storeStrong((id *)&self->_motionManagerData, a3);
}

- (NSMutableArray)copiedMotionManagerData
{
  return self->_copiedMotionManagerData;
}

- (void)setCopiedMotionManagerData:(id)a3
{
  objc_storeStrong((id *)&self->_copiedMotionManagerData, a3);
}

- (NSMutableArray)rawComponentData
{
  return self->_rawComponentData;
}

- (void)setRawComponentData:(id)a3
{
  objc_storeStrong((id *)&self->_rawComponentData, a3);
}

- (NSMutableArray)copiedRawComponentData
{
  return self->_copiedRawComponentData;
}

- (void)setCopiedRawComponentData:(id)a3
{
  objc_storeStrong((id *)&self->_copiedRawComponentData, a3);
}

- (NSMutableArray)allResults
{
  return self->_allResults;
}

- (void)setAllResults:(id)a3
{
  objc_storeStrong((id *)&self->_allResults, a3);
}

- (InteractiveAccelerometerInputs)inputs
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
  objc_storeStrong((id *)&self->_allResults, 0);
  objc_storeStrong((id *)&self->_copiedRawComponentData, 0);
  objc_storeStrong((id *)&self->_rawComponentData, 0);
  objc_storeStrong((id *)&self->_copiedMotionManagerData, 0);
  objc_storeStrong((id *)&self->_motionManagerData, 0);
  objc_storeStrong((id *)&self->_stationaryData, 0);
  objc_storeStrong((id *)&self->_notStationaryData, 0);
  objc_storeStrong((id *)&self->_averagedRawData, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_rightLevelTic, 0);
  objc_storeStrong((id *)&self->_leftLevelTic, 0);
  objc_storeStrong((id *)&self->_levelBottom, 0);
  objc_storeStrong((id *)&self->_degreesLabel, 0);
  objc_storeStrong((id *)&self->_topInnerCircle, 0);
  objc_storeStrong((id *)&self->_topOuterCircle, 0);
  objc_storeStrong((id *)&self->_bottomInnerCircle, 0);
  objc_storeStrong((id *)&self->_bottomOuterCircle, 0);
  objc_storeStrong((id *)&self->_ticContainer, 0);
  objc_storeStrong((id *)&self->_bubbleContainer, 0);
  objc_storeStrong((id *)&self->_levelHoldContainer, 0);
  objc_storeStrong((id *)&self->_levelContainer, 0);
  objc_storeStrong((id *)&self->_filterContainer, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_fontDescriptor, 0);
}

@end
