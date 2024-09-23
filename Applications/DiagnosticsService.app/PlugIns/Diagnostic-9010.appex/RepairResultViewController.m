@implementation RepairResultViewController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE buf[24];
  void *v51;
  uint64_t *v52;

  v6 = a3;
  v7 = a4;
  v9 = handleForCategory(0, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[RepairResultViewController setupWithInputs:responder:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    v51 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", buf, 0x20u);
  }

  -[RepairResultViewController setInputs:](self, "setInputs:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController inputs](self, "inputs"));
  v12 = v11 == 0;

  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController result](self, "result"));
    objc_msgSend(v14, "setStatusCode:", &off_100008578);

    -[RepairResultViewController setFinished:](self, "setFinished:", 1);
  }
  v15 = handleForCategory(0, v13);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Register physical button events", buf, 2u);
  }

  if (!qword_10000C9E8)
  {
    *(_OWORD *)buf = off_100008270;
    *(_QWORD *)&buf[16] = 0;
    qword_10000C9E8 = _sl_dlopen(buf, 0);
  }
  if (!qword_10000C9E8)
  {
    v18 = handleForCategory(0, v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1000065A0(v19, v20, v21, v22, v23, v24, v25, v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController result](self, "result"));
    objc_msgSend(v27, "setStatusCode:", &off_100008590);

    -[RepairResultViewController setFinished:](self, "setFinished:", 1);
  }
  v46 = 0;
  v47 = &v46;
  v48 = 0x2050000000;
  v28 = (void *)qword_10000C9F0;
  v49 = qword_10000C9F0;
  if (!qword_10000C9F0)
  {
    *(_QWORD *)buf = _NSConcreteStackBlock;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = sub_100006294;
    v51 = &unk_100008290;
    v52 = &v46;
    sub_100006294((uint64_t)buf);
    v28 = (void *)v47[3];
  }
  v29 = objc_retainAutorelease(v28);
  _Block_object_dispose(&v46, 8);
  v30 = (void *)objc_opt_new(v29);
  -[RepairResultViewController setButtonEventMonitor:](self, "setButtonEventMonitor:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController buttonEventMonitor](self, "buttonEventMonitor"));
  LODWORD(v30) = v31 == 0;

  if ((_DWORD)v30)
  {
    v33 = handleForCategory(0, v32);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_100006570(v34, v35, v36, v37, v38, v39, v40, v41);

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController result](self, "result"));
    objc_msgSend(v42, "setStatusCode:", &off_100008590);

    -[RepairResultViewController setFinished:](self, "setFinished:", 1);
  }
  objc_initWeak((id *)buf, self);
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController buttonEventMonitor](self, "buttonEventMonitor"));
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100004F18;
  v44[3] = &unk_1000081C0;
  objc_copyWeak(&v45, (id *)buf);
  objc_msgSend(v43, "startWithPriority:completion:", 200, v44);

  objc_destroyWeak(&v45);
  objc_destroyWeak((id *)buf);

}

- (void)start
{
  -[RepairResultViewController setupView](self, "setupView");
}

- (void)cancel
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;

  v3 = handleForCategory(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[RepairResultViewController cancel]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[RepairResultViewController setFinished:](self, "setFinished:", 1);
}

- (void)teardown
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;

  v3 = handleForCategory(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[RepairResultViewController teardown]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController buttonEventMonitor](self, "buttonEventMonitor"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000513C;
  v6[3] = &unk_1000081E8;
  v6[4] = self;
  objc_msgSend(v5, "stopWithCompletion:", v6);

}

- (void)setupView
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  const __CFString *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
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
  uint64_t v42;
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
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  _QWORD v71[4];
  uint8_t buf[4];
  const char *v73;

  v3 = handleForCategory(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v73 = "-[RepairResultViewController setupView]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[RepairResultViewController setShouldShowPressHomeLabel:](self, "setShouldShowPressHomeLabel:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  v6 = objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithHierarchicalColor:](UIImageSymbolConfiguration, "configurationWithHierarchicalColor:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController inputs](self, "inputs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "testStatusCode"));
  v9 = objc_msgSend(v8, "isEqual:", &off_1000085A8);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("TEST_DONE_TITLE"), &stru_1000082D0, CFSTR("RepairResultPlugin-Release")));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("TEST_DONE_DETAILS"), &stru_1000082D0, CFSTR("RepairResultPlugin-Release")));
    v14 = 0;
    v15 = CFSTR("checkmark.circle");
    goto LABEL_11;
  }
  if (-[RepairResultViewController isNetworkError](self, "isNetworkError"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("TEST_RETRY_TITLE"), &stru_1000082D0, CFSTR("RepairResultPlugin-Release")));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("TEST_RETRY_DETAILS"), &stru_1000082D0, CFSTR("RepairResultPlugin-Release")));
    v14 = 1;
LABEL_9:
    v15 = CFSTR("exclamationmark.triangle");
    goto LABEL_11;
  }
  v17 = -[RepairResultViewController isLostMode](self, "isLostMode");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = v18;
  if (v17)
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("LOST_MODE_TITLE"), &stru_1000082D0, CFSTR("RepairResultPlugin-Release")));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("LOST_MODE_DETAIL_TEXT"), &stru_1000082D0, CFSTR("RepairResultPlugin-Release")));
    v14 = 0;
    goto LABEL_9;
  }
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("TEST_FAILED_TITLE"), &stru_1000082D0, CFSTR("RepairResultPlugin-Release")));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("TEST_FAILED_DETAILS"), &stru_1000082D0, CFSTR("RepairResultPlugin-Release")));
  v14 = 0;
  v15 = CFSTR("arrowtriangle.left.circle");
LABEL_11:

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v15));
  v70 = (void *)v6;
  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "imageByApplyingSymbolConfiguration:", v6));

  v67 = (void *)v21;
  v68 = (void *)v13;
  v22 = objc_msgSend(objc_alloc((Class)OBTableWelcomeController), "initWithTitle:detailText:icon:adoptTableViewScrollView:", v11, v13, v21, 0);
  -[RepairResultViewController setContentViewController:](self, "setContentViewController:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController contentViewController](self, "contentViewController"));
  objc_msgSend(v23, "setScrollingDisabled:", 1);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController contentViewController](self, "contentViewController"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "buttonTray"));
  objc_msgSend(v25, "setHidden:", 0);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
  -[RepairResultViewController setBoldButton:](self, "setBoldButton:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController boldButton](self, "boldButton"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v29 = v28;
  v69 = (void *)v11;
  if (v14)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("TRY_AGAIN"), &stru_1000082D0, CFSTR("RepairResultPlugin-Release")));
    objc_msgSend(v27, "setTitle:forState:", v30, 0);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController boldButton](self, "boldButton"));
    objc_msgSend(v31, "addTarget:action:forControlEvents:", self, "_tryAgainButtonTapped:", 64);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController contentViewController](self, "contentViewController"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "buttonTray"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController boldButton](self, "boldButton"));
    objc_msgSend(v33, "addButton:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[OBLinkTrayButton linkButton](OBLinkTrayButton, "linkButton"));
    -[RepairResultViewController setLinkButton:](self, "setLinkButton:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController linkButton](self, "linkButton"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("RESTART"), &stru_1000082D0, CFSTR("RepairResultPlugin-Release")));
    objc_msgSend(v36, "setTitle:forState:", v38, 0);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController linkButton](self, "linkButton"));
    objc_msgSend(v39, "addTarget:action:forControlEvents:", self, "_restartButtonTapped:", 64);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController contentViewController](self, "contentViewController"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "buttonTray"));
    v42 = objc_claimAutoreleasedReturnValue(-[RepairResultViewController linkButton](self, "linkButton"));
  }
  else
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("RESTART"), &stru_1000082D0, CFSTR("RepairResultPlugin-Release")));
    objc_msgSend(v27, "setTitle:forState:", v43, 0);

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController boldButton](self, "boldButton"));
    objc_msgSend(v44, "addTarget:action:forControlEvents:", self, "_restartButtonTapped:", 64);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController contentViewController](self, "contentViewController"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "buttonTray"));
    v42 = objc_claimAutoreleasedReturnValue(-[RepairResultViewController boldButton](self, "boldButton"));
  }
  v45 = (void *)v42;
  objc_msgSend(v41, "addButton:", v42);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController contentViewController](self, "contentViewController"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "view"));

  objc_msgSend(v47, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController view](self, "view"));
  objc_msgSend(v48, "addSubview:", v47);

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController contentViewController](self, "contentViewController"));
  -[RepairResultViewController addChildViewController:](self, "addChildViewController:", v49);

  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "topAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController view](self, "view"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "topAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:", v64));
  v71[0] = v63;
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "bottomAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController view](self, "view"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "bottomAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:", v60));
  v71[1] = v59;
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "leftAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController view](self, "view"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "leftAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v52));
  v71[2] = v53;
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "rightAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController view](self, "view"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "rightAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v56));
  v71[3] = v57;
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v71, 4));

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v58);
}

- (void)_restartButtonTapped:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[16];

  v4 = handleForCategory(0, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Restart button tapped", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ALERT_RESTART"), &stru_1000082D0, CFSTR("RepairResultPlugin-Release")));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100005C00;
  v13[3] = &unk_100008210;
  v13[4] = self;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v8, 0, v13));
  objc_msgSend(v6, "addAction:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ALERT_CANCEL"), &stru_1000082D0, CFSTR("RepairResultPlugin-Release")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 1, &stru_100008250));
  objc_msgSend(v6, "addAction:", v12);

  -[RepairResultViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

- (void)_tryAgainButtonTapped:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = handleForCategory(0, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Try Again button tapped", v6, 2u);
  }

  -[RepairResultViewController endTestWithStatusCode:error:](self, "endTestWithStatusCode:error:", -86, 0);
}

- (void)handleButtonEvent:(unint64_t)a3
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  unint64_t v7;

  v4 = handleForCategory(0, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Physical button event: %ld", (uint8_t *)&v6, 0xCu);
  }

}

- (BOOL)isNetworkError
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController inputs](self, "inputs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "testIdentifer"));
  v5 = objc_msgSend(v4, "isEqual:", &off_1000085C0);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController inputs](self, "inputs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "testStatusCode"));
    v8 = objc_msgSend(v7, "isEqual:", &off_1000085D8);

    if ((v8 & 1) != 0)
      return 1;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController inputs](self, "inputs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "testIdentifer"));
  v11 = objc_msgSend(v10, "isEqual:", &off_1000085F0);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController inputs](self, "inputs"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "testStatusCode"));
    v14 = objc_msgSend(v13, "isEqual:", &off_100008608);

    if ((v14 & 1) != 0)
      return 1;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController inputs](self, "inputs"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "testIdentifer"));
  v17 = objc_msgSend(v16, "isEqual:", &off_100008620);

  if (!v17)
    return 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController inputs](self, "inputs"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "testStatusCode"));
  v20 = objc_msgSend(v19, "isEqual:", &off_1000085D8);

  return (v20 & 1) != 0;
}

- (BOOL)isLostMode
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  BOOL result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController inputs](self, "inputs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "testIdentifer"));
  v5 = objc_msgSend(v4, "isEqual:", &off_100008638);

  result = 0;
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController inputs](self, "inputs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "testStatusCode"));
    v8 = objc_msgSend(v7, "isEqual:", &off_100008650);

    if ((v8 & 1) != 0)
      return 1;
  }
  return result;
}

- (void)endTestWithStatusCode:(int64_t)a3 error:(id)a4
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
  _QWORD v15[2];
  _QWORD v16[2];

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController result](self, "result"));
  objc_msgSend(v8, "setStatusCode:", v7);

  v15[0] = CFSTR("error");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
  v10 = v9;
  if (!v9)
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v15[1] = CFSTR("errorCode");
  v16[0] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "code")));
  v12 = v11;
  if (!v11)
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v16[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RepairResultViewController result](self, "result"));
  objc_msgSend(v14, "setData:", v13);

  if (!v11)
  if (!v9)

  -[RepairResultViewController setFinished:](self, "setFinished:", 1);
}

- (RepairResultInputs)inputs
{
  return self->inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->inputs, a3);
}

- (OBTableWelcomeController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewController, a3);
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

- (DSHardwareButtonEventMonitor)buttonEventMonitor
{
  return self->_buttonEventMonitor;
}

- (void)setButtonEventMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_buttonEventMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonEventMonitor, 0);
  objc_storeStrong((id *)&self->_linkButton, 0);
  objc_storeStrong((id *)&self->_boldButton, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->inputs, 0);
}

@end
