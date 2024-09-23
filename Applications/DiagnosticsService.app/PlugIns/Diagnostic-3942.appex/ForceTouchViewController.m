@implementation ForceTouchViewController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  double v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  int v19;
  NSMutableArray *v20;
  NSMutableArray *testCoordinates;
  NSMutableArray *v22;
  NSMutableArray *testCoordinatesColor;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  int v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  int v40;
  int v41;
  NSMutableArray *v42;
  void *v43;
  NSMutableArray *v44;
  ColorOptions *v45;
  void *v46;
  void *v47;
  signed int v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  NSArray *v56;
  NSArray *v57;
  id v58;
  void *v59;
  unsigned int v60;
  void *v61;
  signed int v62;
  void *v63;
  NSArray *v64;
  NSArray *gridIndexes;
  void *v66;
  unsigned int v67;
  NSMutableArray *v68;
  NSMutableArray *gridStatus;
  int i;
  void *v71;
  unsigned int v72;
  void *v73;
  NSMutableArray *v74;
  NSMutableArray *allResults;
  NSMutableArray *v76;
  NSMutableArray *undetectedPressurePoints;
  NSMutableArray *v78;
  NSMutableArray *detectedPressurePoints;
  void *v80;
  unsigned __int8 v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
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
  id v104;
  _QWORD v105[7];
  id v106;
  id location;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t (*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  id v113;
  _QWORD v114[3];
  int v115;
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  char v119;
  _QWORD v120[11];
  _QWORD v121[11];

  v6 = a3;
  v104 = a4;
  -[ForceTouchViewController setInputs:](self, "setInputs:", v6);
  self->_shouldIgnoreForceEvents = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
  objc_msgSend(v7, "startingCircleRatio");
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
  *(float *)&v11 = fminf(v9, 1.0);
  objc_msgSend(v10, "setStartingCircleRatio:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
  objc_msgSend(v12, "endingCircleRatio");
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
  *(float *)&v16 = fminf(v14, 1.0);
  objc_msgSend(v15, "setEndingCircleRatio:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
  if ((int)objc_msgSend(v17, "gridColumns") <= 0)
  {

    goto LABEL_15;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
  v19 = objc_msgSend(v18, "gridRows");

  if (v19 <= 0)
  {
LABEL_15:
    -[ForceTouchViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", &off_10000C958);
    goto LABEL_16;
  }
  v20 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  testCoordinates = self->_testCoordinates;
  self->_testCoordinates = v20;

  v22 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  testCoordinatesColor = self->_testCoordinatesColor;
  self->_testCoordinatesColor = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v24, "bounds");
  v26 = v25;
  v28 = v27;

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
  v30 = objc_msgSend(v29, "gridColumns");

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
  v32 = objc_msgSend(v31, "gridRows");

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
  v34 = objc_msgSend(v33, "gridRows");

  if (v34 >= 1)
  {
    v35 = 0;
    v36 = v26 / (double)v30;
    v37 = v28 / (double)v32;
    v38 = 0.5;
    do
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs", v38));
      v40 = objc_msgSend(v39, "gridColumns");

      if (v40 >= 1)
      {
        v41 = 0;
        do
        {
          v42 = self->_testCoordinates;
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v36 * 0.5 + (double)v41 * v36, v37 * 0.5 + (double)v35 * v37));
          -[NSMutableArray addObject:](v42, "addObject:", v43);

          v44 = self->_testCoordinatesColor;
          v45 = objc_opt_new(ColorOptions);
          -[NSMutableArray addObject:](v44, "addObject:", v45);

          v46 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
          ++v41;
          LODWORD(v45) = objc_msgSend(v46, "gridColumns");

        }
        while (v41 < (int)v45);
      }
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
      ++v35;
      v48 = objc_msgSend(v47, "gridRows");

    }
    while (v35 < v48);
  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
  v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "testCoordinateColorsParameter"));

  if (!v50)
  {
    self->_testCoordinatesCount = (unint64_t)-[NSMutableArray count](self->_testCoordinates, "count");
    v58 = objc_alloc_init((Class)NSMutableArray);
    while (1)
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
      v60 = objc_msgSend(v59, "gridRows");
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
      v62 = objc_msgSend(v61, "gridColumns") * v60;

      if ((int)v50 >= v62)
        break;
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v50));
      objc_msgSend(v58, "addObject:", v63);

      v50 = (v50 + 1);
    }
    v64 = (NSArray *)objc_msgSend(v58, "copy");
    gridIndexes = self->_gridIndexes;
    self->_gridIndexes = v64;

LABEL_21:
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
    v67 = objc_msgSend(v66, "randomizeCoordinates");

    if (v67)
      -[ForceTouchViewController shuffleCoordinates](self, "shuffleCoordinates");
    v68 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    gridStatus = self->_gridStatus;
    self->_gridStatus = v68;

    for (i = 0; ; ++i)
    {
      v71 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
      v72 = objc_msgSend(v71, "gridRows");
      v73 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
      LOBYTE(v72) = i < (int)(objc_msgSend(v73, "gridColumns") * v72);

      if ((v72 & 1) == 0)
        break;
      -[NSMutableArray addObject:](self->_gridStatus, "addObject:", &off_10000C9B8);
    }
    self->_pressureIndex = 0;
    self->_pressureRatio = 0.0;
    self->_testCoordinatesIndex = 0;
    self->_pressureTargetMissed = 0;
    self->_touchEventRecognized = 0;
    self->_timerInvalidated = 0;
    self->_pressureReachedAfterTimeout = 0;
    self->_noInputTimerFired = 0;
    self->_timeoutTimerFireDelayed = 0;
    v74 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    allResults = self->_allResults;
    self->_allResults = v74;

    v76 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    undetectedPressurePoints = self->_undetectedPressurePoints;
    self->_undetectedPressurePoints = v76;

    v78 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    detectedPressurePoints = self->_detectedPressurePoints;
    self->_detectedPressurePoints = v78;

    -[ForceTouchViewController setupHIDForceTouchRecognizer](self, "setupHIDForceTouchRecognizer");
    v80 = (void *)objc_claimAutoreleasedReturnValue(+[DSTestAutomation sharedInstance](DSTestAutomation, "sharedInstance"));
    v81 = objc_msgSend(v80, "testAutomationEnabled");

    if ((v81 & 1) != 0)
    {
      v120[0] = CFSTR("startingCircleRatio");
      v103 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
      objc_msgSend(v103, "startingCircleRatio");
      v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      v121[0] = v102;
      v120[1] = CFSTR("endingCircleRatio");
      v101 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
      objc_msgSend(v101, "endingCircleRatio");
      v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      v121[1] = v100;
      v120[2] = CFSTR("gridRows");
      v99 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
      v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v99, "gridRows")));
      v121[2] = v98;
      v120[3] = CFSTR("gridColumns");
      v97 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
      v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v97, "gridColumns")));
      v121[3] = v96;
      v120[4] = CFSTR("pressurePoints");
      v95 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
      v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "pressurePoints"));
      v121[4] = v94;
      v120[5] = CFSTR("forceTouchSensitivityText");
      v93 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
      v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "forceTouchSensitivityText"));
      v121[5] = v92;
      v120[6] = CFSTR("randomizeCoordinates");
      v91 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
      v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v91, "randomizeCoordinates")));
      v121[6] = v82;
      v120[7] = CFSTR("hapticFeedback");
      v83 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
      v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v83, "hapticFeedback")));
      v121[7] = v84;
      v120[8] = CFSTR("gridIndexes");
      v85 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController gridIndexes](self, "gridIndexes"));
      v121[8] = v85;
      v120[9] = CFSTR("noInputTimeout");
      v86 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
      objc_msgSend(v86, "noInputTimeout");
      v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      v121[9] = v87;
      v120[10] = CFSTR("partialInputTimeout");
      v88 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
      objc_msgSend(v88, "partialInputTimeout");
      v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      v121[10] = v89;
      v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v121, v120, 11));
      +[DSTestAutomation postConfiguration:](DSTestAutomation, "postConfiguration:", v90);

    }
    goto LABEL_16;
  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "testCoordinateColorsParameter"));
  self->_testCoordinatesCount = (unint64_t)objc_msgSend(v52, "count");

  v116 = 0;
  v117 = &v116;
  v118 = 0x2020000000;
  v119 = 1;
  v114[0] = 0;
  v114[1] = v114;
  v114[2] = 0x2020000000;
  v115 = 0;
  v108 = 0;
  v109 = &v108;
  v110 = 0x3032000000;
  v111 = sub_100003974;
  v112 = sub_100003984;
  v113 = objc_alloc_init((Class)NSMutableArray);
  objc_initWeak(&location, self);
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "testCoordinateColorsParameter"));
  v105[0] = _NSConcreteStackBlock;
  v105[1] = 3221225472;
  v105[2] = sub_10000398C;
  v105[3] = &unk_10000C3A0;
  objc_copyWeak(&v106, &location);
  v105[4] = v114;
  v105[5] = &v116;
  v105[6] = &v108;
  objc_msgSend(v54, "enumerateObjectsUsingBlock:", v105);

  v55 = *((unsigned __int8 *)v117 + 24);
  if (*((_BYTE *)v117 + 24))
  {
    v56 = (NSArray *)objc_msgSend((id)v109[5], "copy");
    v57 = self->_gridIndexes;
    self->_gridIndexes = v56;

  }
  objc_destroyWeak(&v106);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v108, 8);

  _Block_object_dispose(v114, 8);
  _Block_object_dispose(&v116, 8);
  if (v55)
    goto LABEL_21;
LABEL_16:

}

- (void)noInputTimedOut
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[ForceTouchViewController setNoInputTimerFired:](self, "setNoInputTimerFired:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController gridIndexes](self, "gridIndexes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", -[ForceTouchViewController testCoordinatesIndex](self, "testCoordinatesIndex")));
  v5 = objc_msgSend(v4, "intValue");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController forceTouchRingView](self, "forceTouchRingView"));
  objc_msgSend(v6, "setTimedOut:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController forceTouchRingView](self, "forceTouchRingView"));
  -[ForceTouchViewController pressureRatio](self, "pressureRatio");
  objc_msgSend(v7, "updateCircleWithPressureRatio:");

  v9 = (id)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController testCoordinates](self, "testCoordinates"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v5));
  objc_msgSend(v8, "CGPointValue");
  -[ForceTouchViewController playCheckAnimationAtPoint:](self, "playCheckAnimationAtPoint:");

}

- (void)partialInputTimedOut
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (-[ForceTouchViewController touchEventRecognized](self, "touchEventRecognized"))
  {
    -[ForceTouchViewController setTimeoutTimerFireDelayed:](self, "setTimeoutTimerFireDelayed:", 1);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController gridIndexes](self, "gridIndexes"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", -[ForceTouchViewController testCoordinatesIndex](self, "testCoordinatesIndex")));
    v5 = objc_msgSend(v4, "intValue");

    if (!-[ForceTouchViewController pressureReachedAfterTimeout](self, "pressureReachedAfterTimeout"))
    {
      -[ForceTouchViewController setPressureReachedAfterTimeout:](self, "setPressureReachedAfterTimeout:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController forceTouchRingView](self, "forceTouchRingView"));
      objc_msgSend(v6, "setTimedOut:", 1);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController forceTouchRingView](self, "forceTouchRingView"));
      -[ForceTouchViewController pressureRatio](self, "pressureRatio");
      objc_msgSend(v7, "updateCircleWithPressureRatio:");

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController forceTouchStarted](self, "forceTouchStarted"));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v9, "timeIntervalSince1970");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)(v10 * 1000.0)));
      -[ForceTouchViewController setForceTouchEnded:](self, "setForceTouchEnded:", v11);

    }
    else
    {
      -[ForceTouchViewController setForceTouchEnded:](self, "setForceTouchEnded:", 0);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController undetectedPressurePoints](self, "undetectedPressurePoints"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pressurePoints"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", -[ForceTouchViewController pressureIndex](self, "pressureIndex")));
    objc_msgSend(v12, "addObject:", v15);

    v17 = (id)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController testCoordinates](self, "testCoordinates"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v5));
    objc_msgSend(v16, "CGPointValue");
    -[ForceTouchViewController playCheckAnimationAtPoint:](self, "playCheckAnimationAtPoint:");

  }
}

- (void)checkForNextTargetWithTestCoordinateGridIndex:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  unint64_t v7;
  void *v8;
  void *v9;
  char *v10;
  void *v11;
  uint64_t v12;
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
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  float v34;
  float v35;
  void *v36;
  float v37;
  float v38;
  float v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD *v44;
  _QWORD *v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  signed int v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  double v80;
  double v81;
  double v82;
  void *v83;
  float v84;
  float v85;
  void *v86;
  float v87;
  float v88;
  float v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  _UNKNOWN **v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  _QWORD v102[4];
  _QWORD v103[4];
  _QWORD v104[7];
  _QWORD v105[7];
  _QWORD v106[4];
  _QWORD v107[4];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController check](self, "check"));
  objc_msgSend(v5, "removeFromSuperlayer");

  v6 = objc_msgSend(v4, "unsignedIntValue");
  v7 = -[ForceTouchViewController pressureIndex](self, "pressureIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pressurePoints"));
  v10 = (char *)objc_msgSend(v9, "count") - 1;

  if (v7 < (unint64_t)v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController testCoordinatesColor](self, "testCoordinatesColor"));
    v12 = v6;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v6));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController forceTouchRingView](self, "forceTouchRingView"));
    objc_msgSend(v14, "setTimedOut:", 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "starting"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController forceTouchRingView](self, "forceTouchRingView"));
    objc_msgSend(v16, "setRingStartingColor:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "success"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController forceTouchRingView](self, "forceTouchRingView"));
    objc_msgSend(v18, "setRingSuccessColor:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "failed"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController forceTouchRingView](self, "forceTouchRingView"));
    objc_msgSend(v20, "setRingFailedColor:", v19);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "forceTouchSensitivityText"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController statusLabel](self, "statusLabel"));
    objc_msgSend(v23, "setText:", v22);

    -[ForceTouchViewController setNoInputTimerFired:](self, "setNoInputTimerFired:", 0);
    -[ForceTouchViewController setTimerInvalidated:](self, "setTimerInvalidated:", 0);
    -[ForceTouchViewController setPressureRatio:](self, "setPressureRatio:", 0.0);
    -[ForceTouchViewController setPressureIndex:](self, "setPressureIndex:", (char *)-[ForceTouchViewController pressureIndex](self, "pressureIndex") + 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController gridStatus](self, "gridStatus"));
    objc_msgSend(v24, "setObject:atIndexedSubscript:", &off_10000C9B8, v12);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[DSTestAutomation sharedInstance](DSTestAutomation, "sharedInstance"));
    LODWORD(v24) = objc_msgSend(v25, "testAutomationEnabled");

    if ((_DWORD)v24)
    {
      v106[0] = CFSTR("x");
      v100 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController forceTouchRingView](self, "forceTouchRingView"));
      objc_msgSend(v100, "ringCenter");
      v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      v107[0] = v98;
      v106[1] = CFSTR("y");
      v96 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController forceTouchRingView](self, "forceTouchRingView"));
      objc_msgSend(v96, "ringCenter");
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v26));
      v107[1] = v27;
      v106[2] = CFSTR("radius");
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController view](self, "view"));
      objc_msgSend(v28, "frame");
      v30 = v29 * 0.5;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
      v32 = v30 / (double)(int)objc_msgSend(v31, "gridColumns");
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
      objc_msgSend(v33, "startingCircleRatio");
      v35 = v34;

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
      objc_msgSend(v36, "endingCircleRatio");
      v38 = v37;

      if (v35 >= v38)
        v39 = v38;
      else
        v39 = v35;
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v32 * v39));
      v107[2] = v40;
      v106[3] = CFSTR("pressure");
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "pressurePoints"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectAtIndexedSubscript:", -[ForceTouchViewController pressureIndex](self, "pressureIndex")));
      v107[3] = v43;
      v44 = v107;
      v45 = v106;
LABEL_21:
      v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v44, v45, 4));
      +[DSTestAutomation postInteractiveTestEvent:info:](DSTestAutomation, "postInteractiveTestEvent:info:", CFSTR("ForceTouchTargetAppeared"), v90);

      goto LABEL_22;
    }
    goto LABEL_22;
  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController undetectedPressurePoints](self, "undetectedPressurePoints"));
  v47 = objc_msgSend(v46, "count");

  if (v47)
  {
    -[ForceTouchViewController setPressureTargetMissed:](self, "setPressureTargetMissed:", 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
    v49 = v6 % objc_msgSend(v48, "gridColumns");

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
    v51 = v6 / objc_msgSend(v50, "gridColumns");

    v101 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController allResults](self, "allResults"));
    v104[0] = CFSTR("x");
    v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v49));
    v105[0] = v99;
    v104[1] = CFSTR("y");
    v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v51));
    v105[1] = v97;
    v104[2] = CFSTR("maximumPressure");
    -[ForceTouchViewController maximumPressure](self, "maximumPressure");
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v105[2] = v52;
    v104[3] = CFSTR("forceTouchStarted");
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController forceTouchStarted](self, "forceTouchStarted"));
    if (v53)
      v54 = objc_claimAutoreleasedReturnValue(-[ForceTouchViewController forceTouchStarted](self, "forceTouchStarted"));
    else
      v54 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v55 = (void *)v54;
    v105[3] = v54;
    v104[4] = CFSTR("forceTouchEnded");
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController forceTouchEnded](self, "forceTouchEnded"));
    if (v56)
      v57 = objc_claimAutoreleasedReturnValue(-[ForceTouchViewController forceTouchEnded](self, "forceTouchEnded"));
    else
      v57 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v58 = (void *)v57;
    v105[4] = v57;
    v104[5] = CFSTR("undetectedPressurePoints");
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController undetectedPressurePoints](self, "undetectedPressurePoints"));
    v105[5] = v59;
    v104[6] = CFSTR("detectedPressurePoints");
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController detectedPressurePoints](self, "detectedPressurePoints"));
    v105[6] = v60;
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v105, v104, 7));
    objc_msgSend(v101, "addObject:", v61);

  }
  v62 = -[ForceTouchViewController testCoordinatesIndex](self, "testCoordinatesIndex");
  if ((char *)-[ForceTouchViewController testCoordinatesCount](self, "testCoordinatesCount") - 1 > (char *)v62)
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController forceTouchRingView](self, "forceTouchRingView"));
    objc_msgSend(v63, "setTimedOut:", 0);

    v64 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "forceTouchSensitivityText"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController statusLabel](self, "statusLabel"));
    objc_msgSend(v66, "setText:", v65);

    v67 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController undetectedPressurePoints](self, "undetectedPressurePoints"));
    objc_msgSend(v67, "removeAllObjects");

    v68 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController detectedPressurePoints](self, "detectedPressurePoints"));
    objc_msgSend(v68, "removeAllObjects");

    -[ForceTouchViewController setForceTouchStarted:](self, "setForceTouchStarted:", 0);
    -[ForceTouchViewController setForceTouchEnded:](self, "setForceTouchEnded:", 0);
    -[ForceTouchViewController setNoInputTimerFired:](self, "setNoInputTimerFired:", 0);
    -[ForceTouchViewController setTimerInvalidated:](self, "setTimerInvalidated:", 0);
    -[ForceTouchViewController setPressureRatio:](self, "setPressureRatio:", 0.0);
    -[ForceTouchViewController setPressureIndex:](self, "setPressureIndex:", 0);
    -[ForceTouchViewController setTestCoordinatesIndex:](self, "setTestCoordinatesIndex:", -[ForceTouchViewController testCoordinatesIndex](self, "testCoordinatesIndex") + 1);
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController testCoordinatesColor](self, "testCoordinatesColor"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController gridIndexes](self, "gridIndexes"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "objectAtIndexedSubscript:", -[ForceTouchViewController testCoordinatesIndex](self, "testCoordinatesIndex")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectAtIndexedSubscript:", (int)objc_msgSend(v71, "intValue")));

    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "starting"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController forceTouchRingView](self, "forceTouchRingView"));
    objc_msgSend(v73, "setRingStartingColor:", v72);

    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "success"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController forceTouchRingView](self, "forceTouchRingView"));
    objc_msgSend(v75, "setRingSuccessColor:", v74);

    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "failed"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController forceTouchRingView](self, "forceTouchRingView"));
    objc_msgSend(v77, "setRingFailedColor:", v76);

    v78 = (void *)objc_claimAutoreleasedReturnValue(+[DSTestAutomation sharedInstance](DSTestAutomation, "sharedInstance"));
    LODWORD(v77) = objc_msgSend(v78, "testAutomationEnabled");

    if ((_DWORD)v77)
    {
      v102[0] = CFSTR("x");
      v100 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController forceTouchRingView](self, "forceTouchRingView"));
      objc_msgSend(v100, "ringCenter");
      v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      v103[0] = v98;
      v102[1] = CFSTR("y");
      v96 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController forceTouchRingView](self, "forceTouchRingView"));
      objc_msgSend(v96, "ringCenter");
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v79));
      v103[1] = v27;
      v102[2] = CFSTR("radius");
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController view](self, "view"));
      objc_msgSend(v28, "frame");
      v81 = v80 * 0.5;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
      v82 = v81 / (double)(int)objc_msgSend(v31, "gridColumns");
      v83 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
      objc_msgSend(v83, "startingCircleRatio");
      v85 = v84;

      v86 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
      objc_msgSend(v86, "endingCircleRatio");
      v88 = v87;

      if (v85 >= v88)
        v89 = v88;
      else
        v89 = v85;
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v82 * v89));
      v103[2] = v40;
      v102[3] = CFSTR("pressure");
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "pressurePoints"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectAtIndexedSubscript:", -[ForceTouchViewController pressureIndex](self, "pressureIndex")));
      v103[3] = v43;
      v44 = v103;
      v45 = v102;
      goto LABEL_21;
    }
LABEL_22:
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
    objc_msgSend(v91, "noInputTimeout");
    v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "noInputTimedOut", 0, 0));
    -[ForceTouchViewController setTimeoutTimer:](self, "setTimeoutTimer:", v92);

    v93 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController gridIndexes](self, "gridIndexes"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectAtIndexedSubscript:", -[ForceTouchViewController testCoordinatesIndex](self, "testCoordinatesIndex")));
    -[ForceTouchViewController presentRingWithTestCoordinateGridIndex:](self, "presentRingWithTestCoordinateGridIndex:", objc_msgSend(v94, "intValue"));

    return;
  }
  if (-[ForceTouchViewController pressureTargetMissed](self, "pressureTargetMissed"))
    v95 = &off_10000C9D0;
  else
    v95 = &off_10000C9E8;
  -[ForceTouchViewController endTestWithStatusCode:](self, "endTestWithStatusCode:", v95);
}

- (void)playCheckAnimationAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  float v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
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
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
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
  id v42;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
  objc_msgSend(v6, "startingCircleRatio");
  v8 = (int)(float)(1.0 / v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController view](self, "view"));
  v42 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
  objc_msgSend(v10, "moveToPoint:", x + -21.0 / (double)v8, y + (double)(4 / v8));
  objc_msgSend(v10, "addLineToPoint:", x + -8.0 / (double)v8, y + (double)(16 / v8));
  objc_msgSend(v10, "addLineToPoint:", x + 24.5 / (double)v8, y - (double)(15 / v8));
  v11 = objc_alloc_init((Class)CAShapeLayer);
  -[ForceTouchViewController setCheck:](self, "setCheck:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController view](self, "view"));
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController check](self, "check"));
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

  v22 = objc_retainAutorelease(v10);
  v23 = objc_msgSend(v22, "CGPath");
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController check](self, "check"));
  objc_msgSend(v24, "setPath:", v23);

  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
  v26 = objc_msgSend(v25, "CGColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController check](self, "check"));
  objc_msgSend(v27, "setStrokeColor:", v26);

  v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
  v29 = objc_msgSend(v28, "CGColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController check](self, "check"));
  objc_msgSend(v30, "setFillColor:", v29);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController check](self, "check"));
  objc_msgSend(v31, "setLineWidth:", 5.0);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController check](self, "check"));
  objc_msgSend(v32, "setStrokeStart:", 0.0);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController check](self, "check"));
  objc_msgSend(v33, "setStrokeEnd:", 0.0);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController check](self, "check"));
  objc_msgSend(v34, "setLineCap:", kCALineCapRound);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController check](self, "check"));
  objc_msgSend(v35, "setLineJoin:", kCALineJoinRound);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController check](self, "check"));
  objc_msgSend(v42, "addSublayer:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController check](self, "check"));
  objc_msgSend(v37, "setStrokeEnd:", 1.0);

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("strokeEnd")));
  objc_msgSend(v38, "setDuration:", 0.375);
  objc_msgSend(v38, "setFillMode:", kCAFillModeBoth);
  objc_msgSend(v38, "setBeginTime:", CACurrentMediaTime() + 0.150000006);
  objc_msgSend(v38, "setFromValue:", &off_10000C908);
  objc_msgSend(v38, "setToValue:", &off_10000C918);
  objc_msgSend(v38, "setDelegate:", self);
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  objc_msgSend(v38, "setTimingFunction:", v39);

  LODWORD(v40) = 1.0;
  objc_msgSend(v38, "setRepeatCount:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController check](self, "check"));
  objc_msgSend(v41, "addAnimation:forKey:", v38, CFSTR("strokeEndAnimation"));

}

- (void)retryButtonAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
  objc_msgSend(v3, "noInputTimeout");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "noInputTimedOut", 0, 0));
  -[ForceTouchViewController setTimeoutTimer:](self, "setTimeoutTimer:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController forceTouchRingView](self, "forceTouchRingView"));
  objc_msgSend(v5, "setTimedOut:", 0);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController gridIndexes](self, "gridIndexes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", -[ForceTouchViewController testCoordinatesIndex](self, "testCoordinatesIndex")));
  -[ForceTouchViewController presentRingWithTestCoordinateGridIndex:](self, "presentRingWithTestCoordinateGridIndex:", objc_msgSend(v6, "intValue"));

}

- (void)continueButtonAction
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  unint64_t i;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController forceTouchStarted](self, "forceTouchStarted"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v4, "timeIntervalSince1970");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)(v5 * 1000.0)));
    -[ForceTouchViewController setForceTouchEnded:](self, "setForceTouchEnded:", v6);

  }
  else
  {
    -[ForceTouchViewController setForceTouchEnded:](self, "setForceTouchEnded:", 0);
  }

  for (i = -[ForceTouchViewController pressureIndex](self, "pressureIndex"); ; ++i)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pressurePoints"));
    v10 = objc_msgSend(v9, "count");

    if (i >= (unint64_t)v10)
      break;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController undetectedPressurePoints](self, "undetectedPressurePoints"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pressurePoints"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", i));
    objc_msgSend(v11, "addObject:", v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pressurePoints"));
  -[ForceTouchViewController setPressureIndex:](self, "setPressureIndex:", objc_msgSend(v16, "count"));

  v18 = (id)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController gridIndexes](self, "gridIndexes"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", -[ForceTouchViewController testCoordinatesIndex](self, "testCoordinatesIndex")));
  -[ForceTouchViewController checkForNextTargetWithTestCoordinateGridIndex:](self, "checkForNextTargetWithTestCoordinateGridIndex:", v17);

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
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
  id v16;
  _QWORD v17[5];
  _QWORD v18[5];

  if (a4)
  {
    if (-[ForceTouchViewController noInputTimerFired](self, "noInputTimerFired", a3))
    {
      -[ForceTouchViewController setNoInputTimerFired:](self, "setNoInputTimerFired:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController check](self, "check"));
      objc_msgSend(v5, "removeFromSuperlayer");

      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NO_INPUT_DETECTED"), &stru_10000C830, 0));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, v7, 1));

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("RETRY"), &stru_10000C830, 0));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1000053F4;
      v18[3] = &unk_10000C3C8;
      v18[4] = self;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 0, v18));
      objc_msgSend(v8, "addAction:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_10000C830, 0));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000053FC;
      v17[3] = &unk_10000C3C8;
      v17[4] = self;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 0, v17));
      objc_msgSend(v8, "addAction:", v14);

      -[ForceTouchViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
    }
    else
    {
      v16 = (id)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController gridIndexes](self, "gridIndexes"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", -[ForceTouchViewController testCoordinatesIndex](self, "testCoordinatesIndex")));
      -[ForceTouchViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "checkForNextTargetWithTestCoordinateGridIndex:", v15, 0.5);

    }
  }
}

- (void)start
{
  void *v3;
  unsigned int v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  float v18;
  float v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  _QWORD v30[4];

  -[ForceTouchViewController setupView](self, "setupView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DSTestAutomation sharedInstance](DSTestAutomation, "sharedInstance"));
  v4 = objc_msgSend(v3, "testAutomationEnabled");

  if (v4)
  {
    v29[0] = CFSTR("x");
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController forceTouchRingView](self, "forceTouchRingView"));
    objc_msgSend(v28, "ringCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v30[0] = v27;
    v29[1] = CFSTR("y");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController forceTouchRingView](self, "forceTouchRingView"));
    objc_msgSend(v5, "ringCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v6));
    v30[1] = v7;
    v29[2] = CFSTR("radius");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController view](self, "view"));
    objc_msgSend(v8, "frame");
    v10 = v9 * 0.5;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
    v12 = v10 / (double)(int)objc_msgSend(v11, "gridColumns");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
    objc_msgSend(v13, "startingCircleRatio");
    v15 = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
    objc_msgSend(v16, "endingCircleRatio");
    v18 = v17;

    if (v15 >= v18)
      v19 = v18;
    else
      v19 = v15;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12 * v19));
    v30[2] = v20;
    v29[3] = CFSTR("pressure");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "pressurePoints"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", -[ForceTouchViewController pressureIndex](self, "pressureIndex")));
    v30[3] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 4));
    +[DSTestAutomation postInteractiveTestEvent:info:](DSTestAutomation, "postInteractiveTestEvent:info:", CFSTR("ForceTouchTargetAppeared"), v24);

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
  objc_msgSend(v25, "noInputTimeout");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "noInputTimedOut", 0, 0));
  -[ForceTouchViewController setTimeoutTimer:](self, "setTimeoutTimer:", v26);

}

- (void)dealloc
{
  __MTDevice *builtInDevice;
  objc_super v4;

  builtInDevice = self->_builtInDevice;
  if (builtInDevice)
  {
    MTUnregisterPathCallbackWithRefcon(builtInDevice, forceTouchPathCallback);
    if (MTDeviceIsRunning(self->_builtInDevice))
      MTDeviceStop(self->_builtInDevice);
    CFRelease(self->_builtInDevice);
  }
  v4.receiver = self;
  v4.super_class = (Class)ForceTouchViewController;
  -[ForceTouchViewController dealloc](&v4, "dealloc");
}

- (void)shuffleCoordinates
{
  void *v3;
  char *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController gridIndexes](self, "gridIndexes"));
  v4 = (char *)objc_msgSend(v3, "count");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController gridIndexes](self, "gridIndexes"));
  v8 = objc_msgSend(v5, "mutableCopy");

  if (v4)
  {
    v6 = 0;
    do
    {
      objc_msgSend(v8, "exchangeObjectAtIndex:withObjectAtIndex:", v6, v6 + arc4random_uniform((uint32_t)v4));
      ++v6;
      --v4;
    }
    while (v4);
  }
  v7 = objc_msgSend(v8, "copy");
  -[ForceTouchViewController setGridIndexes:](self, "setGridIndexes:", v7);

}

- (void)setupHIDForceTouchRecognizer
{
  void *List;
  uint64_t v4;
  __MTDevice *v5;
  unsigned int ParserType;
  int IsBuiltIn;
  uint64_t MultitouchRunLoopSource;
  __CFRunLoopSource *v9;
  __CFRunLoop *Current;
  int v11;
  uint64_t v12;
  uint64_t v13;

  List = (void *)MTDeviceCreateList(self, a2);
  if (objc_msgSend(List, "count"))
  {
    v4 = 0;
    while (1)
    {
      v5 = (__MTDevice *)objc_msgSend(List, "objectAtIndex:", v4);
      v12 = 0;
      v13 = 0;
      v11 = 0;
      ParserType = MTDeviceGetParserType();
      IsBuiltIn = MTDeviceIsBuiltIn(v5);
      MTDeviceGetDeviceID(v5, &v13);
      MTDeviceGetSensorSurfaceDimensions(v5, (char *)&v12 + 4, &v12);
      MTDeviceGetTransportMethod(v5, &v11);
      if (ParserType <= 0x3E7)
      {
        if (IsBuiltIn)
        {
          MTRegisterPathCallbackWithRefcon(v5, forceTouchPathCallback, self);
          if (!MTDeviceStart(v5, 0x20000000))
          {
            MultitouchRunLoopSource = MTDeviceCreateMultitouchRunLoopSource(v5);
            if (MultitouchRunLoopSource)
              break;
          }
        }
      }
      if ((unint64_t)objc_msgSend(List, "count") <= ++v4)
        goto LABEL_8;
    }
    v9 = (__CFRunLoopSource *)MultitouchRunLoopSource;
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, v9, kCFRunLoopCommonModes);
    CFRelease(v9);
    self->_builtInDevice = v5;
    CFRetain(v5);
  }
LABEL_8:

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
  double v11;
  void *v12;
  double v13;
  void *v14;
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
  ForceTouchRingView *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  float v48;
  void *v49;
  int v50;
  int v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  ForceTouchRingView *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  double v64;
  void *v65;
  void *v66;
  id v67;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = objc_alloc((Class)UILabel);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController view](self, "view"));
  objc_msgSend(v6, "frame");
  v7 = objc_msgSend(v5, "initWithFrame:");
  -[ForceTouchViewController setStatusLabel:](self, "setStatusLabel:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController statusLabel](self, "statusLabel"));
  objc_msgSend(v8, "setOpaque:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController statusLabel](self, "statusLabel"));
  objc_msgSend(v9, "setContentMode:", 7);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController statusLabel](self, "statusLabel"));
  LODWORD(v11) = 1132134400;
  objc_msgSend(v10, "setContentHuggingPriority:forAxis:", 0, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController statusLabel](self, "statusLabel"));
  LODWORD(v13) = 1132134400;
  objc_msgSend(v12, "setContentHuggingPriority:forAxis:", 1, v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController statusLabel](self, "statusLabel"));
  objc_msgSend(v14, "setTextAlignment:", 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController statusLabel](self, "statusLabel"));
  objc_msgSend(v15, "setLineBreakMode:", 4);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController statusLabel](self, "statusLabel"));
  objc_msgSend(v16, "setNumberOfLines:", 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 20.0));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController statusLabel](self, "statusLabel"));
  objc_msgSend(v18, "setFont:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController statusLabel](self, "statusLabel"));
  objc_msgSend(v20, "setTextColor:", v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "forceTouchSensitivityText"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController statusLabel](self, "statusLabel"));
  objc_msgSend(v23, "setText:", v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController statusLabel](self, "statusLabel"));
  objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController view](self, "view"));
  objc_msgSend(v25, "setNeedsUpdateConstraints");

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController view](self, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController statusLabel](self, "statusLabel"));
  objc_msgSend(v26, "addSubview:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController gridIndexes](self, "gridIndexes"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndexedSubscript:", -[ForceTouchViewController testCoordinatesIndex](self, "testCoordinatesIndex")));
  LODWORD(v23) = objc_msgSend(v29, "intValue");

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController testCoordinatesColor](self, "testCoordinatesColor"));
  v67 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectAtIndexedSubscript:", v23));

  v31 = [ForceTouchRingView alloc];
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v66, "bounds");
  v64 = v32;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController testCoordinates](self, "testCoordinates"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectAtIndexedSubscript:", v23));
  objc_msgSend(v39, "CGPointValue");
  v41 = v40;
  v43 = v42;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController view](self, "view"));
  objc_msgSend(v44, "frame");
  v46 = v45 * 0.5;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
  v48 = v46 / (double)(int)objc_msgSend(v47, "gridColumns");
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
  objc_msgSend(v49, "startingCircleRatio");
  v51 = v50;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController inputs](self, "inputs"));
  objc_msgSend(v52, "endingCircleRatio");
  LODWORD(v46) = v53;
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "starting"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "success"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "failed"));
  LODWORD(v63) = LODWORD(v46);
  *(float *)&v57 = v48;
  LODWORD(v58) = v51;
  v59 = -[ForceTouchRingView initWithFrame:ringCenter:startingCircleRadius:startingCircleRatio:endingCircleRatio:ringStartingColor:ringSuccessColor:ringFailedColor:](v31, "initWithFrame:ringCenter:startingCircleRadius:startingCircleRatio:endingCircleRatio:ringStartingColor:ringSuccessColor:ringFailedColor:", v54, v55, v56, v64, v34, v36, v38, v41, v43, v57, v58, v63);
  -[ForceTouchViewController setForceTouchRingView:](self, "setForceTouchRingView:", v59);

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController forceTouchRingView](self, "forceTouchRingView"));
  objc_msgSend(v60, "setTimedOut:", 0);

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController view](self, "view"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController forceTouchRingView](self, "forceTouchRingView"));
  objc_msgSend(v61, "addSubview:", v62);

}

- (void)updateViewConstraints
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
  double v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ForceTouchViewController;
  -[ForceTouchViewController updateViewConstraints](&v14, "updateViewConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController statusLabel](self, "statusLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 9, 0, v5, 9, 1.0, 0.0));
  objc_msgSend(v3, "addConstraint:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController statusLabel](self, "statusLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "safeAreaLayoutGuide"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController view](self, "view"));
  objc_msgSend(v11, "frame");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 4, 0, v10, 4, 1.0, floor(v12 * 0.34)));
  objc_msgSend(v7, "addConstraint:", v13);

}

- (void)presentRingWithTestCoordinateGridIndex:(unsigned int)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController testCoordinates](self, "testCoordinates"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a3));
  objc_msgSend(v6, "CGPointValue");
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController forceTouchRingView](self, "forceTouchRingView"));
  objc_msgSend(v11, "setRingCenter:", v8, v10);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController forceTouchRingView](self, "forceTouchRingView"));
  -[ForceTouchViewController pressureRatio](self, "pressureRatio");
  objc_msgSend(v12, "updateCircleWithPressureRatio:");

}

- (void)cleanUp
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController timeoutTimer](self, "timeoutTimer"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController timeoutTimer](self, "timeoutTimer"));
    objc_msgSend(v4, "invalidate");

    -[ForceTouchViewController setTimeoutTimer:](self, "setTimeoutTimer:", 0);
  }
}

- (void)endTestWithStatusCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;

  v4 = a3;
  -[ForceTouchViewController cleanUp](self, "cleanUp");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController result](self, "result"));
  objc_msgSend(v5, "setStatusCode:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController result](self, "result"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "statusCode"));
  if (objc_msgSend(v7, "isEqualToNumber:", &off_10000CA60))
  {

LABEL_4:
    v11 = DiagnosticLogHandleForCategory(3);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100006FF4(v12, v13, v14, v15, v16, v17, v18, v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController result](self, "result"));
    objc_msgSend(v20, "setData:", &__NSDictionary0__struct);

    -[ForceTouchViewController setFinished:](self, "setFinished:", 1);
    return;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController result](self, "result"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "statusCode"));
  v10 = objc_msgSend(v9, "isEqualToNumber:", &off_10000CA78);

  if (v10)
    goto LABEL_4;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController allResults](self, "allResults"));

  if (v21)
  {
    v25 = CFSTR("failedPresses");
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController allResults](self, "allResults"));
    v26 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController result](self, "result"));
    objc_msgSend(v24, "setData:", v23);

  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchViewController result](self, "result"));
    objc_msgSend(v22, "setData:", &__NSDictionary0__struct);
  }

  -[ForceTouchViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "finishTest", 0, 1.0);
}

- (void)finishTest
{
  -[ForceTouchViewController setFinished:](self, "setFinished:", 1);
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

- (ForceTouchRingView)forceTouchRingView
{
  return self->_forceTouchRingView;
}

- (void)setForceTouchRingView:(id)a3
{
  objc_storeStrong((id *)&self->_forceTouchRingView, a3);
}

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (void)setStatusLabel:(id)a3
{
  objc_storeStrong((id *)&self->_statusLabel, a3);
}

- (unint64_t)pressureIndex
{
  return self->_pressureIndex;
}

- (void)setPressureIndex:(unint64_t)a3
{
  self->_pressureIndex = a3;
}

- (unint64_t)testCoordinatesCount
{
  return self->_testCoordinatesCount;
}

- (void)setTestCoordinatesCount:(unint64_t)a3
{
  self->_testCoordinatesCount = a3;
}

- (int)testCoordinatesIndex
{
  return self->_testCoordinatesIndex;
}

- (void)setTestCoordinatesIndex:(int)a3
{
  self->_testCoordinatesIndex = a3;
}

- (BOOL)pressureTargetMissed
{
  return self->_pressureTargetMissed;
}

- (void)setPressureTargetMissed:(BOOL)a3
{
  self->_pressureTargetMissed = a3;
}

- (BOOL)noInputTimerFired
{
  return self->_noInputTimerFired;
}

- (void)setNoInputTimerFired:(BOOL)a3
{
  self->_noInputTimerFired = a3;
}

- (BOOL)timeoutTimerFireDelayed
{
  return self->_timeoutTimerFireDelayed;
}

- (void)setTimeoutTimerFireDelayed:(BOOL)a3
{
  self->_timeoutTimerFireDelayed = a3;
}

- (BOOL)touchEventRecognized
{
  return self->_touchEventRecognized;
}

- (void)setTouchEventRecognized:(BOOL)a3
{
  self->_touchEventRecognized = a3;
}

- (BOOL)timerInvalidated
{
  return self->_timerInvalidated;
}

- (void)setTimerInvalidated:(BOOL)a3
{
  self->_timerInvalidated = a3;
}

- (BOOL)pressureReachedAfterTimeout
{
  return self->_pressureReachedAfterTimeout;
}

- (void)setPressureReachedAfterTimeout:(BOOL)a3
{
  self->_pressureReachedAfterTimeout = a3;
}

- (double)pressureRatio
{
  return self->_pressureRatio;
}

- (void)setPressureRatio:(double)a3
{
  self->_pressureRatio = a3;
}

- (float)maximumPressure
{
  return self->_maximumPressure;
}

- (void)setMaximumPressure:(float)a3
{
  self->_maximumPressure = a3;
}

- (NSNumber)forceTouchStarted
{
  return self->_forceTouchStarted;
}

- (void)setForceTouchStarted:(id)a3
{
  objc_storeStrong((id *)&self->_forceTouchStarted, a3);
}

- (NSNumber)forceTouchEnded
{
  return self->_forceTouchEnded;
}

- (void)setForceTouchEnded:(id)a3
{
  objc_storeStrong((id *)&self->_forceTouchEnded, a3);
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (BOOL)shouldIgnoreForceEvents
{
  return self->_shouldIgnoreForceEvents;
}

- (void)setShouldIgnoreForceEvents:(BOOL)a3
{
  self->_shouldIgnoreForceEvents = a3;
}

- (NSArray)gridIndexes
{
  return self->_gridIndexes;
}

- (void)setGridIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_gridIndexes, a3);
}

- (NSMutableArray)testCoordinatesColor
{
  return self->_testCoordinatesColor;
}

- (void)setTestCoordinatesColor:(id)a3
{
  objc_storeStrong((id *)&self->_testCoordinatesColor, a3);
}

- (NSMutableArray)gridStatus
{
  return self->_gridStatus;
}

- (void)setGridStatus:(id)a3
{
  objc_storeStrong((id *)&self->_gridStatus, a3);
}

- (NSMutableArray)allResults
{
  return self->_allResults;
}

- (void)setAllResults:(id)a3
{
  objc_storeStrong((id *)&self->_allResults, a3);
}

- (NSMutableArray)undetectedPressurePoints
{
  return self->_undetectedPressurePoints;
}

- (void)setUndetectedPressurePoints:(id)a3
{
  objc_storeStrong((id *)&self->_undetectedPressurePoints, a3);
}

- (NSMutableArray)detectedPressurePoints
{
  return self->_detectedPressurePoints;
}

- (void)setDetectedPressurePoints:(id)a3
{
  objc_storeStrong((id *)&self->_detectedPressurePoints, a3);
}

- (NSMutableArray)testCoordinates
{
  return self->_testCoordinates;
}

- (void)setTestCoordinates:(id)a3
{
  objc_storeStrong((id *)&self->_testCoordinates, a3);
}

- (CAShapeLayer)check
{
  return self->_check;
}

- (void)setCheck:(id)a3
{
  objc_storeStrong((id *)&self->_check, a3);
}

- (__MTDevice)builtInDevice
{
  return self->_builtInDevice;
}

- (void)setBuiltInDevice:(__MTDevice *)a3
{
  self->_builtInDevice = a3;
}

- (ForceTouchInputs)inputs
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
  objc_storeStrong((id *)&self->_check, 0);
  objc_storeStrong((id *)&self->_testCoordinates, 0);
  objc_storeStrong((id *)&self->_detectedPressurePoints, 0);
  objc_storeStrong((id *)&self->_undetectedPressurePoints, 0);
  objc_storeStrong((id *)&self->_allResults, 0);
  objc_storeStrong((id *)&self->_gridStatus, 0);
  objc_storeStrong((id *)&self->_testCoordinatesColor, 0);
  objc_storeStrong((id *)&self->_gridIndexes, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_forceTouchEnded, 0);
  objc_storeStrong((id *)&self->_forceTouchStarted, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_forceTouchRingView, 0);
}

@end
