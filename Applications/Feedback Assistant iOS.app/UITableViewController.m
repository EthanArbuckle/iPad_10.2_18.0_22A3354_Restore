@implementation UITableViewController

- (void)didTapCloseFeedbackWithItem:(id)a3 atIndexPath:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  UITableViewController *v23;
  void *v24;
  UITableViewController *v25;
  id v26;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  UITableViewController *v32;
  _QWORD v33[4];
  id v34;
  UITableViewController *v35;
  _QWORD v36[4];
  id v37;
  UITableViewController *v38;
  uint8_t buf[16];

  v5 = a3;
  v29 = a4;
  v6 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "User tapped close feedback cell", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = FBKCommonStrings;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CLOSE_FEEDBACK_ALERT_TITLE(ID)")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "feedbackIDString"));
  v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CLOSE_FEEDBACK_ALERT_INFORMATIVE_TEXT"), &stru_1000EA660, v8));

  v28 = (void *)v11;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v11, v13, 1));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CLOSE_FEEDBACK_AFFIRMATIVE"), &stru_1000EA660, v8));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000134DC;
  v36[3] = &unk_1000E64B8;
  v17 = v5;
  v37 = v17;
  v38 = self;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, 2, v36));
  objc_msgSend(v14, "addAction:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CLOSE_FEEDBACK_NEGATIVE"), &stru_1000EA660, v8));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000135D0;
  v33[3] = &unk_1000E64B8;
  v34 = v17;
  v35 = self;
  v21 = v17;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v20, 1, v33));
  objc_msgSend(v14, "addAction:", v22);

  v23 = self;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewController presentedViewController](v23, "presentedViewController"));

  v25 = v23;
  if (v24)
  {
    v25 = (UITableViewController *)objc_claimAutoreleasedReturnValue(-[UITableViewController presentedViewController](v23, "presentedViewController"));

  }
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000136BC;
  v30[3] = &unk_1000E6378;
  v31 = v29;
  v32 = v23;
  v26 = v29;
  -[UITableViewController presentViewController:animated:completion:](v25, "presentViewController:animated:completion:", v14, 1, v30);

}

- (void)closeFeedbackWithItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
  v10 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100013808;
  v8[3] = &unk_1000E6608;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "closeFeedbackItems:completion:", v6, v8);

}

- (void)updateRightBarButtonItemVisibility:(id)a3
{
  id v4;
  UITableViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100062B44((uint64_t)v4);

}

@end
