@implementation RepairSummaryViewController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  dispatch_semaphore_t v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE buf[24];
  void *v34;
  uint64_t *v35;

  v6 = a3;
  v7 = a4;
  v8 = handleForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[RepairSummaryViewController setupWithInputs:responder:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    v34 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", buf, 0x20u);
  }

  -[RepairSummaryViewController setInputs:](self, "setInputs:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController inputs](self, "inputs"));
  v11 = v10 == 0;

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController result](self, "result"));
    objc_msgSend(v12, "setStatusCode:", &off_10000CAA8);

    -[RepairSummaryViewController setFinished:](self, "setFinished:", 1);
  }
  v13 = handleForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Register physical button events", buf, 2u);
  }

  if (!qword_100011D88)
  {
    *(_OWORD *)buf = off_10000C328;
    *(_QWORD *)&buf[16] = 0;
    qword_100011D88 = _sl_dlopen(buf, 0);
  }
  if (!qword_100011D88)
  {
    v15 = handleForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1000074D4();

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController result](self, "result"));
    objc_msgSend(v17, "setStatusCode:", &off_10000CAC0);

    -[RepairSummaryViewController setFinished:](self, "setFinished:", 1);
  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v18 = (void *)qword_100011D90;
  v32 = qword_100011D90;
  if (!qword_100011D90)
  {
    *(_QWORD *)buf = _NSConcreteStackBlock;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = sub_100007388;
    v34 = &unk_10000C348;
    v35 = &v29;
    sub_100007388((uint64_t)buf);
    v18 = (void *)v30[3];
  }
  v19 = objc_retainAutorelease(v18);
  _Block_object_dispose(&v29, 8);
  v20 = (void *)objc_opt_new(v19);
  -[RepairSummaryViewController setButtonEventMonitor:](self, "setButtonEventMonitor:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController buttonEventMonitor](self, "buttonEventMonitor"));
  LODWORD(v20) = v21 == 0;

  if ((_DWORD)v20)
  {
    v22 = handleForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_1000074A8();

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController result](self, "result"));
    objc_msgSend(v24, "setStatusCode:", &off_10000CAC0);

    -[RepairSummaryViewController setFinished:](self, "setFinished:", 1);
  }
  objc_initWeak((id *)buf, self);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController buttonEventMonitor](self, "buttonEventMonitor"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10000394C;
  v27[3] = &unk_10000C290;
  objc_copyWeak(&v28, (id *)buf);
  objc_msgSend(v25, "startWithPriority:completion:", 200, v27);

  v26 = dispatch_semaphore_create(0);
  -[RepairSummaryViewController setUiNeededKnownSemaphore:](self, "setUiNeededKnownSemaphore:", v26);

  -[RepairSummaryViewController setRepairSummaryNeeded:](self, "setRepairSummaryNeeded:", 0);
  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);

}

- (void)start
{
  void *v3;
  char v4;
  char v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  dispatch_queue_global_t global_queue;
  NSObject *v15;
  _QWORD block[5];
  NSObject *v17;
  NSErrorUserInfoKey v18;
  const __CFString *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController result](self, "result"));
  objc_msgSend(v3, "setStatusCode:", &off_10000CAD8);

  v4 = MGGetBoolAnswer(CFSTR("InternalBuild"));
  v5 = MGGetBoolAnswer(CFSTR("3kmXfug8VcxLI5yEmsqQKw"));
  v6 = dispatch_semaphore_create(0);
  if ((v4 & 1) != 0 || (v5 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRRepairStatus isServicePartWithError:](CRRepairStatus, "isServicePartWithError:", 0));
    v9 = v8;
    if (v8 && objc_msgSend(v8, "isEqual:", CFSTR("1")))
    {
      v10 = CRErrorDomain;
      v18 = NSLocalizedDescriptionKey;
      v19 = CFSTR("Service part mTub/MLB not supported");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v10, -72, v11));

      v13 = objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController uiNeededKnownSemaphore](self, "uiNeededKnownSemaphore"));
      dispatch_semaphore_signal(v13);

      -[RepairSummaryViewController endTestWithStatusCode:error:](self, "endTestWithStatusCode:error:", -72, v12);
    }
    else
    {
      global_queue = dispatch_get_global_queue(0, 0);
      v15 = objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100003BD0;
      block[3] = &unk_10000C308;
      block[4] = self;
      v17 = v6;
      dispatch_async(v15, block);

    }
  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController uiNeededKnownSemaphore](self, "uiNeededKnownSemaphore"));
    dispatch_semaphore_signal(v7);

    -[RepairSummaryViewController endTestWithStatusCode:error:](self, "endTestWithStatusCode:error:", -6, 0);
  }

}

- (void)cancel
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;

  v3 = handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[RepairSummaryViewController cancel]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[RepairSummaryViewController setFinished:](self, "setFinished:", 1);
}

- (void)teardown
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;

  v3 = handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[RepairSummaryViewController teardown]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController buttonEventMonitor](self, "buttonEventMonitor"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004200;
  v6[3] = &unk_10000C2E0;
  v6[4] = self;
  objc_msgSend(v5, "stopWithCompletion:", v6);

}

- (void)viewDidLoad
{
  uint64_t v2;
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;

  v4.receiver = self;
  v4.super_class = (Class)RepairSummaryViewController;
  -[RepairSummaryViewController viewDidLoad](&v4, "viewDidLoad");
  v2 = handleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[RepairSummaryViewController viewDidLoad]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;

  v5.receiver = self;
  v5.super_class = (Class)RepairSummaryViewController;
  -[RepairSummaryViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v3 = handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[RepairSummaryViewController viewDidAppear:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

}

- (void)initRepairSummaryTable
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
  NSMutableArray *v14;
  NSMutableArray *v15;
  NSMutableArray *v16;
  NSMutableArray *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *j;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  void *k;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  id v67;
  id v68;
  uint64_t v69;
  void *m;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  id v83;
  id v84;
  uint64_t v85;
  void *n;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  NSObject *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  id v99;
  id v100;
  uint64_t v101;
  void *ii;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  NSObject *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  id v115;
  id v116;
  uint64_t v117;
  void *jj;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  NSObject *v126;
  void *v127;
  uint64_t v128;
  void *v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];
  _BYTE v161[128];
  _BYTE v162[128];
  uint8_t v163[128];
  uint8_t buf[4];
  uint64_t v165;
  _BYTE v166[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController preflightResults](self, "preflightResults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRPreflightUtils spcResults:](CRPreflightUtils, "spcResults:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController preflightResults](self, "preflightResults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("keyBlob")));
  -[RepairSummaryViewController setPreflightRIK:](self, "setPreflightRIK:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pass")));
  -[RepairSummaryViewController setPassSPCs:](self, "setPassSPCs:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fail")));
  -[RepairSummaryViewController setFailSPCs:](self, "setFailSPCs:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lock")));
  -[RepairSummaryViewController setLockSPCs:](self, "setLockSPCs:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("unauth")));
  -[RepairSummaryViewController setUnauthSPCs:](self, "setUnauthSPCs:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lost")));
  -[RepairSummaryViewController setLostSPCs:](self, "setLostSPCs:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("denied")));
  -[RepairSummaryViewController setDeniedSPCs:](self, "setDeniedSPCs:", v12);

  v129 = v4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sealed")));
  -[RepairSummaryViewController setSealedSPCs:](self, "setSealedSPCs:", v13);

  v14 = objc_opt_new(NSMutableArray);
  -[RepairSummaryViewController setTableDataText:](self, "setTableDataText:", v14);

  v15 = objc_opt_new(NSMutableArray);
  -[RepairSummaryViewController setTableDataText2:](self, "setTableDataText2:", v15);

  v16 = objc_opt_new(NSMutableArray);
  -[RepairSummaryViewController setTableImage:](self, "setTableImage:", v16);

  v17 = objc_opt_new(NSMutableArray);
  -[RepairSummaryViewController setTableImageColor:](self, "setTableImageColor:", v17);

  v156 = 0u;
  v157 = 0u;
  v154 = 0u;
  v155 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController passSPCs](self, "passSPCs"));
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v154, v166, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v155;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v155 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v154 + 1) + 8 * (_QWORD)i);
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController getComponentString:](self, "getComponentString:", v23));
        if (v24)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableDataText](self, "tableDataText"));
          objc_msgSend(v25, "addObject:", v24);

          v26 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableDataText2](self, "tableDataText2"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("TEXT_PASS"), &stru_10000C368, CFSTR("RepairSummaryPlugin-Release")));
          objc_msgSend(v26, "addObject:", v28);

          v29 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableImage](self, "tableImage"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark.seal.fill")));
          objc_msgSend(v29, "addObject:", v30);

          v31 = objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableImageColor](self, "tableImageColor"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
          -[NSObject addObject:](v31, "addObject:", v32);

        }
        else
        {
          v33 = handleForCategory(0);
          v31 = objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v165 = v23;
            _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Unknown SPC: %@", buf, 0xCu);
          }
        }

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v154, v166, 16);
    }
    while (v20);
  }

  v152 = 0u;
  v153 = 0u;
  v150 = 0u;
  v151 = 0u;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController failSPCs](self, "failSPCs"));
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v150, v163, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v151;
    do
    {
      for (j = 0; j != v36; j = (char *)j + 1)
      {
        if (*(_QWORD *)v151 != v37)
          objc_enumerationMutation(v34);
        v39 = *(_QWORD *)(*((_QWORD *)&v150 + 1) + 8 * (_QWORD)j);
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController getComponentString:](self, "getComponentString:", v39));
        if (v40)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableDataText](self, "tableDataText"));
          objc_msgSend(v41, "addObject:", v40);

          v42 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableDataText2](self, "tableDataText2"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("TEXT_UNKNOWN"), &stru_10000C368, CFSTR("RepairSummaryPlugin-Release")));
          objc_msgSend(v42, "addObject:", v44);

          v45 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableImage](self, "tableImage"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("exclamationmark.triangle.fill")));
          objc_msgSend(v45, "addObject:", v46);

          v47 = objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableImageColor](self, "tableImageColor"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemYellowColor](UIColor, "systemYellowColor"));
          -[NSObject addObject:](v47, "addObject:", v48);

        }
        else
        {
          v49 = handleForCategory(0);
          v47 = objc_claimAutoreleasedReturnValue(v49);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v165 = v39;
            _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Unknown SPC: %@", buf, 0xCu);
          }
        }

      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v150, v163, 16);
    }
    while (v36);
  }

  v148 = 0u;
  v149 = 0u;
  v146 = 0u;
  v147 = 0u;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController lockSPCs](self, "lockSPCs"));
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v146, v162, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v147;
    do
    {
      for (k = 0; k != v52; k = (char *)k + 1)
      {
        if (*(_QWORD *)v147 != v53)
          objc_enumerationMutation(v50);
        v55 = *(_QWORD *)(*((_QWORD *)&v146 + 1) + 8 * (_QWORD)k);
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController getComponentString:](self, "getComponentString:", v55));
        if (v56)
        {
          v57 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableDataText](self, "tableDataText"));
          objc_msgSend(v57, "addObject:", v56);

          v58 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableDataText2](self, "tableDataText2"));
          v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "localizedStringForKey:value:table:", CFSTR("TEXT_LOCK"), &stru_10000C368, CFSTR("RepairSummaryPlugin-Release")));
          objc_msgSend(v58, "addObject:", v60);

          v61 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableImage](self, "tableImage"));
          v62 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("lock.circle.fill")));
          objc_msgSend(v61, "addObject:", v62);

          v63 = objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableImageColor](self, "tableImageColor"));
          v64 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
          -[NSObject addObject:](v63, "addObject:", v64);

        }
        else
        {
          v65 = handleForCategory(0);
          v63 = objc_claimAutoreleasedReturnValue(v65);
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v165 = v55;
            _os_log_error_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "Unknown SPC: %@", buf, 0xCu);
          }
        }

      }
      v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v146, v162, 16);
    }
    while (v52);
  }

  v144 = 0u;
  v145 = 0u;
  v142 = 0u;
  v143 = 0u;
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController unauthSPCs](self, "unauthSPCs"));
  v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v142, v161, 16);
  if (v67)
  {
    v68 = v67;
    v69 = *(_QWORD *)v143;
    do
    {
      for (m = 0; m != v68; m = (char *)m + 1)
      {
        if (*(_QWORD *)v143 != v69)
          objc_enumerationMutation(v66);
        v71 = *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * (_QWORD)m);
        v72 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController getComponentString:](self, "getComponentString:", v71));
        if (v72)
        {
          v73 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableDataText](self, "tableDataText"));
          objc_msgSend(v73, "addObject:", v72);

          v74 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableDataText2](self, "tableDataText2"));
          v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "localizedStringForKey:value:table:", CFSTR("TEXT_UNKNOWN"), &stru_10000C368, CFSTR("RepairSummaryPlugin-Release")));
          objc_msgSend(v74, "addObject:", v76);

          v77 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableImage](self, "tableImage"));
          v78 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("exclamationmark.triangle.fill")));
          objc_msgSend(v77, "addObject:", v78);

          v79 = objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableImageColor](self, "tableImageColor"));
          v80 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemYellowColor](UIColor, "systemYellowColor"));
          -[NSObject addObject:](v79, "addObject:", v80);

        }
        else
        {
          v81 = handleForCategory(0);
          v79 = objc_claimAutoreleasedReturnValue(v81);
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v165 = v71;
            _os_log_error_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "Unknown SPC: %@", buf, 0xCu);
          }
        }

      }
      v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v142, v161, 16);
    }
    while (v68);
  }

  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController lostSPCs](self, "lostSPCs"));
  v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v138, v160, 16);
  if (v83)
  {
    v84 = v83;
    v85 = *(_QWORD *)v139;
    do
    {
      for (n = 0; n != v84; n = (char *)n + 1)
      {
        if (*(_QWORD *)v139 != v85)
          objc_enumerationMutation(v82);
        v87 = *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * (_QWORD)n);
        v88 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController getComponentString:](self, "getComponentString:", v87));
        if (v88)
        {
          v89 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableDataText](self, "tableDataText"));
          objc_msgSend(v89, "addObject:", v88);

          v90 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableDataText2](self, "tableDataText2"));
          v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "localizedStringForKey:value:table:", CFSTR("TEXT_LOST"), &stru_10000C368, CFSTR("RepairSummaryPlugin-Release")));
          objc_msgSend(v90, "addObject:", v92);

          v93 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableImage](self, "tableImage"));
          v94 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("findmy")));
          objc_msgSend(v93, "addObject:", v94);

          v95 = objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableImageColor](self, "tableImageColor"));
          v96 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
          -[NSObject addObject:](v95, "addObject:", v96);

        }
        else
        {
          v97 = handleForCategory(0);
          v95 = objc_claimAutoreleasedReturnValue(v97);
          if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v165 = v87;
            _os_log_error_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_ERROR, "Unknown SPC: %@", buf, 0xCu);
          }
        }

      }
      v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v138, v160, 16);
    }
    while (v84);
  }

  v136 = 0u;
  v137 = 0u;
  v134 = 0u;
  v135 = 0u;
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController deniedSPCs](self, "deniedSPCs"));
  v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v134, v159, 16);
  if (v99)
  {
    v100 = v99;
    v101 = *(_QWORD *)v135;
    do
    {
      for (ii = 0; ii != v100; ii = (char *)ii + 1)
      {
        if (*(_QWORD *)v135 != v101)
          objc_enumerationMutation(v98);
        v103 = *(_QWORD *)(*((_QWORD *)&v134 + 1) + 8 * (_QWORD)ii);
        v104 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController getComponentString:](self, "getComponentString:", v103));
        if (v104)
        {
          v105 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableDataText](self, "tableDataText"));
          objc_msgSend(v105, "addObject:", v104);

          v106 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableDataText2](self, "tableDataText2"));
          v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "localizedStringForKey:value:table:", CFSTR("TEXT_DENIED"), &stru_10000C368, CFSTR("RepairSummaryPlugin-Release")));
          objc_msgSend(v106, "addObject:", v108);

          v109 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableImage](self, "tableImage"));
          v110 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("findmy")));
          objc_msgSend(v109, "addObject:", v110);

          v111 = objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableImageColor](self, "tableImageColor"));
          v112 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
          -[NSObject addObject:](v111, "addObject:", v112);

        }
        else
        {
          v113 = handleForCategory(0);
          v111 = objc_claimAutoreleasedReturnValue(v113);
          if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v165 = v103;
            _os_log_error_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_ERROR, "Unknown SPC: %@", buf, 0xCu);
          }
        }

      }
      v100 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v134, v159, 16);
    }
    while (v100);
  }

  v132 = 0u;
  v133 = 0u;
  v130 = 0u;
  v131 = 0u;
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController sealedSPCs](self, "sealedSPCs"));
  v115 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v130, v158, 16);
  if (v115)
  {
    v116 = v115;
    v117 = *(_QWORD *)v131;
    do
    {
      for (jj = 0; jj != v116; jj = (char *)jj + 1)
      {
        if (*(_QWORD *)v131 != v117)
          objc_enumerationMutation(v114);
        v119 = *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * (_QWORD)jj);
        v120 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController getComponentString:](self, "getComponentString:", v119));
        if (v120)
        {
          v121 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableDataText](self, "tableDataText"));
          objc_msgSend(v121, "addObject:", v120);

          v122 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableDataText2](self, "tableDataText2"));
          v123 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("A new %@ was detected and must be repaired"), v120));
          objc_msgSend(v122, "addObject:", v123);

          v124 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableImage](self, "tableImage"));
          v125 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark.seal.fill")));
          objc_msgSend(v124, "addObject:", v125);

          v126 = objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableImageColor](self, "tableImageColor"));
          v127 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
          -[NSObject addObject:](v126, "addObject:", v127);

        }
        else
        {
          v128 = handleForCategory(0);
          v126 = objc_claimAutoreleasedReturnValue(v128);
          if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v165 = v119;
            _os_log_error_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_ERROR, "Unknown SPC: %@", buf, 0xCu);
          }
        }

      }
      v116 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v130, v158, 16);
    }
    while (v116);
  }

}

- (void)updateViewWithRepairSummary
{
  uint64_t v3;
  NSObject *v4;
  NSMutableArray *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  void *v59;
  void *v60;
  UnknownPartViewController *v61;
  UnknownPartViewController *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  uint64_t v67;
  void *v68;
  void *v69;
  UnknownPartViewController *v70;
  UnknownPartViewController *v71;
  void *v72;
  UINavigationController *v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
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
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  _BYTE v102[128];
  void *v103;
  uint8_t buf[4];
  const char *v105;

  v3 = handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v105 = "-[RepairSummaryViewController updateViewWithRepairSummary]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[RepairSummaryViewController setShouldShowPressHomeLabel:](self, "setShouldShowPressHomeLabel:", 0);
  v5 = objc_opt_new(NSMutableArray);
  -[RepairSummaryViewController setViewControllers:](self, "setViewControllers:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("TEST_TITLE"), &stru_10000C368, CFSTR("RepairSummaryPlugin-Release")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("TEST_DETAILS"), &stru_10000C368, CFSTR("RepairSummaryPlugin-Release")));

  v91 = (void *)v9;
  v92 = (void *)v7;
  v90 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("screwdriver.fill")));
  v10 = objc_msgSend(objc_alloc((Class)OBTableWelcomeController), "initWithTitle:detailText:icon:adoptTableViewScrollView:", v7, v9, v90, 0);
  -[RepairSummaryViewController setContentViewController:](self, "setContentViewController:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController contentViewController](self, "contentViewController"));
  objc_msgSend(v11, "setScrollingDisabled:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController contentViewController](self, "contentViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "buttonTray"));
  objc_msgSend(v13, "setHidden:", 0);

  -[RepairSummaryViewController initRepairSummaryTable](self, "initRepairSummaryTable");
  v14 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController contentViewController](self, "contentViewController"));
  objc_msgSend(v15, "setTableView:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController contentViewController](self, "contentViewController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "tableView"));
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController contentViewController](self, "contentViewController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "tableView"));
  objc_msgSend(v20, "setBackgroundColor:", v18);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController contentViewController](self, "contentViewController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "tableView"));
  objc_msgSend(v22, "setBackgroundView:", 0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController contentViewController](self, "contentViewController"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "tableView"));
  objc_msgSend(v24, "setDelegate:", self);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController contentViewController](self, "contentViewController"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "tableView"));
  objc_msgSend(v26, "setDataSource:", self);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController contentViewController](self, "contentViewController"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "tableView"));
  objc_msgSend(v28, "registerClass:forCellReuseIdentifier:", objc_opt_class(UITableViewCell), CFSTR("Cell"));

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController contentViewController](self, "contentViewController"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "tableView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "heightAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController contentViewController](self, "contentViewController"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "view"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "heightAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:multiplier:", v34, 0.65));
  v103 = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v103, 1));

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
  -[RepairSummaryViewController setBoldButton:](self, "setBoldButton:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController boldButton](self, "boldButton"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_10000C368, CFSTR("RepairSummaryPlugin-Release")));
  objc_msgSend(v38, "setTitle:forState:", v40, 0);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController boldButton](self, "boldButton"));
  objc_msgSend(v41, "addTarget:action:forControlEvents:", self, "continueTapped:", 64);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController contentViewController](self, "contentViewController"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "buttonTray"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController boldButton](self, "boldButton"));
  objc_msgSend(v43, "addButton:", v44);

  v45 = (void *)objc_claimAutoreleasedReturnValue(+[OBLinkTrayButton linkButton](OBLinkTrayButton, "linkButton"));
  -[RepairSummaryViewController setLinkButton:](self, "setLinkButton:", v45);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController linkButton](self, "linkButton"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_10000C368, CFSTR("RepairSummaryPlugin-Release")));
  objc_msgSend(v46, "setTitle:forState:", v48, 0);

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController linkButton](self, "linkButton"));
  objc_msgSend(v49, "addTarget:action:forControlEvents:", self, "cancelTapped:", 64);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController contentViewController](self, "contentViewController"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "buttonTray"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController linkButton](self, "linkButton"));
  objc_msgSend(v51, "addButton:", v52);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController viewControllers](self, "viewControllers"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController contentViewController](self, "contentViewController"));
  objc_msgSend(v53, "addObject:", v54);

  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController failSPCs](self, "failSPCs"));
  v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v97, v102, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v98;
    do
    {
      v59 = 0;
      do
      {
        if (*(_QWORD *)v98 != v58)
          objc_enumerationMutation(v55);
        v60 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController getComponentString:](self, "getComponentString:", *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * (_QWORD)v59)));
        if (v60)
        {
          v61 = -[UnknownPartViewController initWithComponent:]([UnknownPartViewController alloc], "initWithComponent:", v60);
          v62 = v61;
          if (v61)
          {
            -[UnknownPartViewController setCoordinator:](v61, "setCoordinator:", self);
            v63 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController viewControllers](self, "viewControllers"));
            objc_msgSend(v63, "addObject:", v62);

          }
        }

        v59 = (char *)v59 + 1;
      }
      while (v57 != v59);
      v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v97, v102, 16);
    }
    while (v57);
  }

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController unauthSPCs](self, "unauthSPCs"));
  v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v93, v101, 16);
  if (v65)
  {
    v66 = v65;
    v67 = *(_QWORD *)v94;
    do
    {
      v68 = 0;
      do
      {
        if (*(_QWORD *)v94 != v67)
          objc_enumerationMutation(v64);
        v69 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController getComponentString:](self, "getComponentString:", *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)v68)));
        if (v69)
        {
          v70 = -[UnknownPartViewController initWithComponent:]([UnknownPartViewController alloc], "initWithComponent:", v69);
          v71 = v70;
          if (v70)
          {
            -[UnknownPartViewController setCoordinator:](v70, "setCoordinator:", self);
            v72 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController viewControllers](self, "viewControllers"));
            objc_msgSend(v72, "addObject:", v71);

          }
        }

        v68 = (char *)v68 + 1;
      }
      while (v66 != v68);
      v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v93, v101, 16);
    }
    while (v66);
  }

  v73 = objc_opt_new(UINavigationController);
  -[RepairSummaryViewController setNavigationController:](self, "setNavigationController:", v73);

  v74 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController view](self, "view"));
  objc_msgSend(v74, "bounds");
  v76 = v75;
  v78 = v77;
  v80 = v79;
  v82 = v81;
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController navigationController](self, "navigationController"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "view"));
  objc_msgSend(v84, "setFrame:", v76, v78, v80, v82);

  v85 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController view](self, "view"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController navigationController](self, "navigationController"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "view"));
  objc_msgSend(v85, "addSubview:", v87);

  v88 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController navigationController](self, "navigationController"));
  -[RepairSummaryViewController addChildViewController:](self, "addChildViewController:", v88);

  -[RepairSummaryViewController moveToNextViewController](self, "moveToNextViewController");
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController navigationController](self, "navigationController"));
  objc_msgSend(v89, "didMoveToParentViewController:", self);

}

- (void)moveToNextViewController
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;

  v3 = handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315138;
    v15 = "-[RepairSummaryViewController moveToNextViewController]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v14, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController viewControllers](self, "viewControllers"));
  v6 = objc_msgSend(v5, "count");

  v7 = handleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Move to next view", (uint8_t *)&v14, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController navigationController](self, "navigationController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController viewControllers](self, "viewControllers"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v10, "pushViewController:animated:", v12, 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController viewControllers](self, "viewControllers"));
    objc_msgSend(v13, "removeObjectAtIndex:", 0);

  }
  else
  {
    if (v9)
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No more views.", (uint8_t *)&v14, 2u);
    }

    -[RepairSummaryViewController endTestWithStatusCode:error:](self, "endTestWithStatusCode:error:", 0, 0);
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableDataText](self, "tableDataText", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Cell"), v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "defaultContentConfiguration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableDataText](self, "tableDataText"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));
  objc_msgSend(v8, "setText:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableDataText2](self, "tableDataText2"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));
  objc_msgSend(v8, "setSecondaryText:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableImage](self, "tableImage"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));
  objc_msgSend(v8, "setImage:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController tableImageColor](self, "tableImageColor"));
  v16 = objc_msgSend(v6, "row");

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageProperties"));
  objc_msgSend(v18, "setTintColor:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textProperties"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "font"));
  objc_msgSend(v20, "pointSize");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textProperties"));
  objc_msgSend(v22, "setFont:", v21);

  objc_msgSend(v7, "setContentConfiguration:", v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentView"));
  objc_msgSend(v24, "setBackgroundColor:", v23);

  return v7;
}

- (void)continueTapped:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = handleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Continue button tapped", v6, 2u);
  }

  -[RepairSummaryViewController moveToNextViewController](self, "moveToNextViewController");
}

- (void)cancelTapped:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = handleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cancel button tapped", v6, 2u);
  }

  -[RepairSummaryViewController endTestWithStatusCode:error:](self, "endTestWithStatusCode:error:", -82, 0);
}

- (void)handleButtonEvent:(unint64_t)a3
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  unint64_t v7;

  v4 = handleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Physical button event: %ld", (uint8_t *)&v6, 0xCu);
  }

}

- (BOOL)shouldPresentInHostApp
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  int v7;
  const char *v8;

  v3 = handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[RepairSummaryViewController shouldPresentInHostApp]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  v5 = objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController uiNeededKnownSemaphore](self, "uiNeededKnownSemaphore"));
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  return -[RepairSummaryViewController repairSummaryNeeded](self, "repairSummaryNeeded");
}

- (id)getComponentString:(id)a3
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
  id v26;
  _QWORD v27[10];
  _QWORD v28[10];

  v27[0] = CFSTR("IPHONE COMP BATTERY");
  v26 = a3;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("PART_BATTERY"), &stru_10000C368, CFSTR("RepairSummaryPlugin-Release")));
  v28[0] = v24;
  v27[1] = CFSTR("IPHONE COMP DISPLAY");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("PART_DISPLAY"), &stru_10000C368, CFSTR("RepairSummaryPlugin-Release")));
  v28[1] = v22;
  v27[2] = CFSTR("IPHONE COMP CAMERA");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("PART_REAR_CAMERA"), &stru_10000C368, CFSTR("RepairSummaryPlugin-Release")));
  v28[2] = v20;
  v27[3] = CFSTR("IPHONE COMP FACEID");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("PART_TRUE_DEPTH_CAMERA"), &stru_10000C368, CFSTR("RepairSummaryPlugin-Release")));
  v28[3] = v18;
  v27[4] = CFSTR("IPHONE BACK GLASS");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("PART_BACK_GLASS"), &stru_10000C368, CFSTR("RepairSummaryPlugin-Release")));
  v28[4] = v16;
  v27[5] = CFSTR("IPHONE COMP RCAM");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("PART_REAR_CAMERA"), &stru_10000C368, CFSTR("RepairSummaryPlugin-Release")));
  v28[5] = v3;
  v27[6] = CFSTR("IPHONE COMP ENCL");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("PART_ENCLOSURE"), &stru_10000C368, CFSTR("RepairSummaryPlugin-Release")));
  v28[6] = v5;
  v27[7] = CFSTR("IPAD COMP DISPLAY");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PART_DISPLAY"), &stru_10000C368, CFSTR("RepairSummaryPlugin-Release")));
  v28[7] = v7;
  v27[8] = CFSTR("IPAD REAR CAMERA");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("PART_REAR_CAMERA"), &stru_10000C368, CFSTR("RepairSummaryPlugin-Release")));
  v28[8] = v9;
  v27[9] = CFSTR("IPAD FRONT CAMERA");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("PART_TRUE_DEPTH_CAMERA"), &stru_10000C368, CFSTR("RepairSummaryPlugin-Release")));
  v28[9] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 10));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v26));
  return v13;
}

- (void)endTestWithStatusCode:(int64_t)a3 error:(id)a4
{
  void *v4;
  void *v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD *v46;
  _QWORD *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[4];
  _QWORD v58[4];
  _QWORD v59[2];
  _QWORD v60[2];

  v8 = a4;
  if (a3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController result](self, "result"));
    objc_msgSend(v10, "setStatusCode:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description", CFSTR("error")));
    v12 = v11;
    if (!v11)
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v53[1] = CFSTR("errorCode");
    v54[0] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v8, "code")));
    v14 = v13;
    if (!v13)
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v54[1] = v14;
    v15 = v54;
    v16 = v53;
LABEL_23:
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v16, 2));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController result](self, "result"));
    objc_msgSend(v26, "setData:", v25);

    if (!v13)
    if (!v11)

    -[RepairSummaryViewController setFinished:](self, "setFinished:", 1);
    goto LABEL_28;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController lockSPCs](self, "lockSPCs"));
  if (v17)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController lockSPCs](self, "lockSPCs"));
    if (objc_msgSend(v4, "count"))
    {

LABEL_18:
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController result](self, "result"));
      objc_msgSend(v24, "setStatusCode:", v23);

      v59[0] = CFSTR("error");
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));
      v12 = v11;
      if (!v11)
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v60[0] = v12;
      v59[1] = CFSTR("errorCode");
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v8, "code")));
      v14 = v13;
      if (!v13)
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v60[1] = v14;
      v15 = v60;
      v16 = v59;
      goto LABEL_23;
    }
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController lostSPCs](self, "lostSPCs"));
  if (v18)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController lostSPCs](self, "lostSPCs"));
    if (objc_msgSend(v5, "count"))
    {
      v19 = 1;
      goto LABEL_15;
    }
  }
  v20 = objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController deniedSPCs](self, "deniedSPCs"));
  if (v20)
  {
    v21 = (void *)v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController deniedSPCs](self, "deniedSPCs"));
    v19 = objc_msgSend(v22, "count") != 0;

    if (!v18)
      goto LABEL_16;
    goto LABEL_15;
  }
  v19 = 0;
  if (v18)
  {
LABEL_15:

  }
LABEL_16:
  if (v17)
  {

    if (v19)
      goto LABEL_18;
  }
  else
  {

    if (v19)
      goto LABEL_18;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController passSPCs](self, "passSPCs"));
  v28 = objc_msgSend(v27, "mutableCopy");

  v29 = objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController sealedSPCs](self, "sealedSPCs"));
  if (v29)
  {
    v30 = (void *)v29;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController sealedSPCs](self, "sealedSPCs"));
    v32 = objc_msgSend(v31, "count");

    if (v32)
      objc_msgSend(v28, "addObject:", CFSTR("RECOVER"));
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController preflightRIK](self, "preflightRIK"));

  if (v33
    && (v34 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController preflightRIK](self, "preflightRIK")),
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "base64EncodedStringWithOptions:", 0)),
        v34,
        !v33))
  {
    v36 = handleForCategory(0);
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      sub_10000752C();

    v33 = 0;
    v35 = -87;
    if (!v28)
      goto LABEL_43;
  }
  else
  {
    v35 = 0;
    if (!v28)
      goto LABEL_43;
  }
  if (!objc_msgSend(v28, "count"))
  {
LABEL_43:
    v38 = handleForCategory(0);
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      sub_100007500();

    v35 = -88;
  }
  if (v28 && v33 && objc_msgSend(v28, "count"))
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v35));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController result](self, "result"));
    objc_msgSend(v41, "setStatusCode:", v40);

    v57[0] = CFSTR("error");
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));
    v43 = v42;
    if (!v42)
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v58[0] = v43;
    v57[1] = CFSTR("errorCode");
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v8, "code")));
    v45 = v44;
    if (!v44)
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v58[1] = v45;
    v58[2] = v33;
    v57[2] = CFSTR("preflightRIK");
    v57[3] = CFSTR("preflightPartSPC");
    v58[3] = v28;
    v46 = v58;
    v47 = v57;
    v48 = 4;
  }
  else
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v35));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController result](self, "result"));
    objc_msgSend(v50, "setStatusCode:", v49);

    v55[0] = CFSTR("error");
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));
    v43 = v42;
    if (!v42)
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v55[1] = CFSTR("errorCode");
    v56[0] = v43;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v8, "code")));
    v45 = v44;
    if (!v44)
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v56[1] = v45;
    v46 = v56;
    v47 = v55;
    v48 = 2;
  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v47, v48));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[RepairSummaryViewController result](self, "result"));
  objc_msgSend(v52, "setData:", v51);

  if (!v44)
  if (!v42)

  -[RepairSummaryViewController setFinished:](self, "setFinished:", 1);
LABEL_28:

}

- (RepairSummaryInputs)inputs
{
  return self->inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->inputs, a3);
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (OBTableWelcomeController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewController, a3);
}

- (NSMutableArray)viewControllers
{
  return self->_viewControllers;
}

- (void)setViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllers, a3);
}

- (OS_dispatch_semaphore)uiNeededKnownSemaphore
{
  return self->_uiNeededKnownSemaphore;
}

- (void)setUiNeededKnownSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_uiNeededKnownSemaphore, a3);
}

- (BOOL)repairSummaryNeeded
{
  return self->_repairSummaryNeeded;
}

- (void)setRepairSummaryNeeded:(BOOL)a3
{
  self->_repairSummaryNeeded = a3;
}

- (DSHardwareButtonEventMonitor)buttonEventMonitor
{
  return self->_buttonEventMonitor;
}

- (void)setButtonEventMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_buttonEventMonitor, a3);
}

- (NSMutableArray)tableDataText
{
  return self->_tableDataText;
}

- (void)setTableDataText:(id)a3
{
  objc_storeStrong((id *)&self->_tableDataText, a3);
}

- (NSMutableArray)tableDataText2
{
  return self->_tableDataText2;
}

- (void)setTableDataText2:(id)a3
{
  objc_storeStrong((id *)&self->_tableDataText2, a3);
}

- (NSMutableArray)tableImage
{
  return self->_tableImage;
}

- (void)setTableImage:(id)a3
{
  objc_storeStrong((id *)&self->_tableImage, a3);
}

- (NSMutableArray)tableImageColor
{
  return self->_tableImageColor;
}

- (void)setTableImageColor:(id)a3
{
  objc_storeStrong((id *)&self->_tableImageColor, a3);
}

- (OBTrayButton)boldButton
{
  return self->_boldButton;
}

- (void)setBoldButton:(id)a3
{
  objc_storeStrong((id *)&self->_boldButton, a3);
}

- (OBLinkTrayButton)linkButton
{
  return self->_linkButton;
}

- (void)setLinkButton:(id)a3
{
  objc_storeStrong((id *)&self->_linkButton, a3);
}

- (BOOL)preflightSuccess
{
  return self->_preflightSuccess;
}

- (void)setPreflightSuccess:(BOOL)a3
{
  self->_preflightSuccess = a3;
}

- (NSData)preflightRIK
{
  return self->_preflightRIK;
}

- (void)setPreflightRIK:(id)a3
{
  objc_storeStrong((id *)&self->_preflightRIK, a3);
}

- (NSDictionary)preflightResults
{
  return self->_preflightResults;
}

- (void)setPreflightResults:(id)a3
{
  objc_storeStrong((id *)&self->_preflightResults, a3);
}

- (NSError)preflightError
{
  return self->_preflightError;
}

- (void)setPreflightError:(id)a3
{
  objc_storeStrong((id *)&self->_preflightError, a3);
}

- (NSArray)passSPCs
{
  return self->_passSPCs;
}

- (void)setPassSPCs:(id)a3
{
  objc_storeStrong((id *)&self->_passSPCs, a3);
}

- (NSArray)failSPCs
{
  return self->_failSPCs;
}

- (void)setFailSPCs:(id)a3
{
  objc_storeStrong((id *)&self->_failSPCs, a3);
}

- (NSArray)lockSPCs
{
  return self->_lockSPCs;
}

- (void)setLockSPCs:(id)a3
{
  objc_storeStrong((id *)&self->_lockSPCs, a3);
}

- (NSArray)unauthSPCs
{
  return self->_unauthSPCs;
}

- (void)setUnauthSPCs:(id)a3
{
  objc_storeStrong((id *)&self->_unauthSPCs, a3);
}

- (NSArray)lostSPCs
{
  return self->_lostSPCs;
}

- (void)setLostSPCs:(id)a3
{
  objc_storeStrong((id *)&self->_lostSPCs, a3);
}

- (NSArray)deniedSPCs
{
  return self->_deniedSPCs;
}

- (void)setDeniedSPCs:(id)a3
{
  objc_storeStrong((id *)&self->_deniedSPCs, a3);
}

- (NSArray)sealedSPCs
{
  return self->_sealedSPCs;
}

- (void)setSealedSPCs:(id)a3
{
  objc_storeStrong((id *)&self->_sealedSPCs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sealedSPCs, 0);
  objc_storeStrong((id *)&self->_deniedSPCs, 0);
  objc_storeStrong((id *)&self->_lostSPCs, 0);
  objc_storeStrong((id *)&self->_unauthSPCs, 0);
  objc_storeStrong((id *)&self->_lockSPCs, 0);
  objc_storeStrong((id *)&self->_failSPCs, 0);
  objc_storeStrong((id *)&self->_passSPCs, 0);
  objc_storeStrong((id *)&self->_preflightError, 0);
  objc_storeStrong((id *)&self->_preflightResults, 0);
  objc_storeStrong((id *)&self->_preflightRIK, 0);
  objc_storeStrong((id *)&self->_linkButton, 0);
  objc_storeStrong((id *)&self->_boldButton, 0);
  objc_storeStrong((id *)&self->_tableImageColor, 0);
  objc_storeStrong((id *)&self->_tableImage, 0);
  objc_storeStrong((id *)&self->_tableDataText2, 0);
  objc_storeStrong((id *)&self->_tableDataText, 0);
  objc_storeStrong((id *)&self->_buttonEventMonitor, 0);
  objc_storeStrong((id *)&self->_uiNeededKnownSemaphore, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->inputs, 0);
}

@end
