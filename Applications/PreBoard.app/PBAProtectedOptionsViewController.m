@implementation PBAProtectedOptionsViewController

- (void)successfulAuthHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000069A8;
  v6[3] = &unk_100018A18;
  v5 = v4;
  v7 = v5;
  objc_copyWeak(&v8, &location);
  -[PBADevicePasscodeViewController handlePasscodeEntrySuccessful:](self, "handlePasscodeEntrySuccessful:", v6);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

- (id)passcodeEntryScreenTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LAPreboard sharedInstance](LAPreboard, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "passcodeTitle"));

  return v3;
}

- (id)passcodeEntryScreenSubtitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LAPreboard sharedInstance](LAPreboard, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "passcodeSubtitle"));

  return v3;
}

- (id)lockScreenIconSystemName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LAPreboard sharedInstance](LAPreboard, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iconSystemName"));

  return v3;
}

- (id)lockScreenTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LAPreboard sharedInstance](LAPreboard, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "title"));

  return v3;
}

- (id)lockScreenMessage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LAPreboard sharedInstance](LAPreboard, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "message"));

  return v3;
}

- (id)lockScreenActionTitleWithHomeButton:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LAPreboard sharedInstance](LAPreboard, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actionTitleWithHomeButton:", v3));

  return v5;
}

- (void)confirmTransitionToPasscodeWithCompletion:(id)a3
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  void **v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  id location;
  _QWORD v29[4];
  id v30;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LAPreboard sharedInstance](LAPreboard, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "confirmationTitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[LAPreboard sharedInstance](LAPreboard, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "confirmationMessage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 0));

  objc_msgSend(v9, "_setShouldInvokeCancelActionOnDimmingViewTap:", 0);
  +[UIAlertController registerPlatformStyleProvider:forIdiom:](UIAlertController, "registerPlatformStyleProvider:forIdiom:", self, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[LAPreboard sharedInstance](LAPreboard, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "confirmationActionTitle"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[LAPreboard sharedInstance](LAPreboard, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "confirmationActionTitle"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100006F98;
    v29[3] = &unk_100018A40;
    v30 = v4;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 2, v29));
    objc_msgSend(v9, "addAction:", v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[LAPreboard sharedInstance](LAPreboard, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "confirmationCancelTitle"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v18 = objc_msgSend(v17, "userInterfaceIdiom") == 0;

    objc_initWeak(&location, self);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[LAPreboard sharedInstance](LAPreboard, "sharedInstance"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "confirmationCancelTitle"));
    v22 = _NSConcreteStackBlock;
    v23 = 3221225472;
    v24 = sub_100006FAC;
    v25 = &unk_100018A68;
    v26 = v4;
    objc_copyWeak(&v27, &location);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v20, v18, &v22));
    objc_msgSend(v9, "addAction:", v21, v22, v23, v24, v25);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  -[PBAProtectedOptionsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

}

- (id)platformStyleViewForAlertController:(id)a3 inIdiom:(int64_t)a4
{
  return 0;
}

- (id)visualStyleForAlertControllerStyle:(int64_t)a3 traitCollection:(id)a4 descriptor:(id)a5
{
  PBAAlertControllerVisualStyleActionSheet *v5;

  if (a3)
    v5 = 0;
  else
    v5 = objc_alloc_init(PBAAlertControllerVisualStyleActionSheet);
  return v5;
}

- (void)_finish
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[LAPreboard sharedInstance](LAPreboard, "sharedInstance"));
  objc_msgSend(v2, "terminateWithCompletion:", &stru_100018AA8);

}

@end
