@implementation BuddyMandatoryUpdateProgressController

- (BuddyMandatoryUpdateProgressController)initWithAllowCellularOverride:(BOOL)a3 bypassTermsAndConditions:(BOOL)a4 updateOptions:(id)a5
{
  id v5;
  NSBundle *v6;
  NSString *v7;
  BuddyMandatoryUpdateProgressController *v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  BOOL v13;
  id v14;
  id v15;
  id v16;
  id v17;
  BuddyMandatoryUpdateProgressController *v18;
  objc_super v20;
  id location;
  BOOL v22;
  BOOL v23;
  SEL v24;
  id v25;

  v25 = self;
  v24 = a2;
  v23 = a3;
  v22 = a4;
  location = 0;
  objc_storeStrong(&location, a5);
  v5 = v25;
  v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyMandatoryUpdateProgressController));
  v7 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("MANDATORY_UPDATE_PROGRESS_TITLE"), &stru_100284738, CFSTR("MandatorySoftwareUpdate"));
  v25 = 0;
  v20.receiver = v5;
  v20.super_class = (Class)BuddyMandatoryUpdateProgressController;
  v8 = -[BuddyMandatoryUpdateProgressController initWithTitle:detailText:icon:](&v20, "initWithTitle:detailText:icon:", v7, 0, 0);
  v25 = v8;
  objc_storeStrong(&v25, v8);

  if (v8)
  {
    objc_msgSend(v25, "setUpdateOptions:", location);
    v9 = objc_alloc((Class)sub_1000D51FC());
    v10 = objc_msgSend(v9, "initWithDelegate:hostController:", v25, v25);
    objc_msgSend(v25, "setUpdateManager:", v10);

    v11 = v23;
    v12 = objc_msgSend(v25, "updateManager");
    objc_msgSend(v12, "setAllowCellularOverride:", v11);

    v13 = v22;
    v14 = objc_msgSend(v25, "updateManager");
    objc_msgSend(v14, "setBypassTermsAndConditions:", v13);

    v15 = objc_msgSend(v25, "updateManager");
    objc_msgSend(v15, "setClientIsBuddy:", 1);

    v16 = objc_msgSend(v25, "updateManager");
    v17 = +[RUIStyle setupAssistantModalStyle](RUIStyle, "setupAssistantModalStyle");
    objc_msgSend(v16, "setServerFlowStyle:", v17);

  }
  v18 = (BuddyMandatoryUpdateProgressController *)v25;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v25, 0);
  return v18;
}

- (void)loadView
{
  id v2;
  objc_super v3;
  SEL v4;
  BuddyMandatoryUpdateProgressController *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyMandatoryUpdateProgressController;
  -[BuddyMandatoryUpdateProgressController loadView](&v3, "loadView");
  -[BuddyMandatoryUpdateProgressController resetProgress](v5, "resetProgress");
  v2 = -[BuddyMandatoryUpdateProgressController navigationItem](v5, "navigationItem");
  objc_msgSend(v2, "setHidesBackButton:", 1);

}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;
  SEL v4;
  BuddyMandatoryUpdateProgressController *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyMandatoryUpdateProgressController;
  -[BuddyMandatoryUpdateProgressController viewDidLoad](&v3, "viewDidLoad");
  v2 = -[BuddyMandatoryUpdateProgressController buddy_animationController:](v5, "buddy_animationController:", CFSTR("Update"));
  -[BuddyMandatoryUpdateProgressController setAnimationController:](v5, "setAnimationController:", v2);

}

- (void)viewWillAppear:(BOOL)a3
{
  OBAnimationController *v3;
  objc_super v4;
  BOOL v5;
  SEL v6;
  BuddyMandatoryUpdateProgressController *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyMandatoryUpdateProgressController;
  -[BuddyMandatoryUpdateProgressController viewWillAppear:](&v4, "viewWillAppear:", a3);
  v3 = -[BuddyMandatoryUpdateProgressController animationController](v7, "animationController");
  -[OBAnimationController startAnimation](v3, "startAnimation");

}

- (void)viewDidAppear:(BOOL)a3
{
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  SUScanOptions *v6;
  SUSUISoftwareUpdateManager *v7;
  SUScanOptions *v8;
  SUSUISoftwareUpdateManager *v9;
  void **v10;
  int v11;
  int v12;
  void (*v13)(id *, void *, void *);
  void *v14;
  BuddyMandatoryUpdateProgressController *v15;
  void **v16;
  int v17;
  int v18;
  void (*v19)(id *, void *, void *);
  void *v20;
  BuddyMandatoryUpdateProgressController *v21;
  uint8_t buf[15];
  os_log_type_t v23;
  id location;
  objc_super v25;
  BOOL v26;
  SEL v27;
  BuddyMandatoryUpdateProgressController *v28;

  v28 = self;
  v27 = a2;
  v26 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BuddyMandatoryUpdateProgressController;
  -[BuddyMandatoryUpdateProgressController viewDidAppear:](&v25, "viewDidAppear:", a3);
  v3 = -[BuddyMandatoryUpdateProgressController isMovingToParentViewController](v28, "isMovingToParentViewController");
  if ((v3 & 1) != 0)
  {
    location = (id)_BYLoggingFacility(v3);
    v23 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      v4 = location;
      v5 = v23;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Scanning for update...", buf, 2u);
    }
    objc_storeStrong(&location, 0);
    v6 = -[BuddyMandatoryUpdateProgressController updateOptions](v28, "updateOptions");

    if (v6)
    {
      v7 = -[BuddyMandatoryUpdateProgressController updateManager](v28, "updateManager");
      v8 = -[BuddyMandatoryUpdateProgressController updateOptions](v28, "updateOptions");
      v16 = _NSConcreteStackBlock;
      v17 = -1073741824;
      v18 = 0;
      v19 = sub_1000D56A0;
      v20 = &unk_1002826D8;
      v21 = v28;
      -[SUSUISoftwareUpdateManager scanForUpdatesWithOptions:andCompletion:](v7, "scanForUpdatesWithOptions:andCompletion:", v8, &v16);

      objc_storeStrong((id *)&v21, 0);
    }
    else
    {
      v9 = -[BuddyMandatoryUpdateProgressController updateManager](v28, "updateManager");
      v10 = _NSConcreteStackBlock;
      v11 = -1073741824;
      v12 = 0;
      v13 = sub_1000D5714;
      v14 = &unk_1002826D8;
      v15 = v28;
      -[SUSUISoftwareUpdateManager scanForUpdatesCompletion:](v9, "scanForUpdatesCompletion:", &v10);

      objc_storeStrong((id *)&v15, 0);
    }
  }
}

- (void)setProgress:(double)a3
{
  double v3;
  objc_super v4;
  double v5;
  SEL v6;
  BuddyMandatoryUpdateProgressController *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  if (a3 <= 0.02)
    v3 = 0.02;
  else
    v3 = v5;
  v4.receiver = self;
  v4.super_class = (Class)BuddyMandatoryUpdateProgressController;
  -[BuddyMandatoryUpdateProgressController setProgress:](&v4, "setProgress:", v3);
}

- (void)_handleScanResults:(id)a3 error:(id)a4
{
  uint64_t v5;
  _BOOL8 v6;
  BuddyMandatoryUpdateProgressController *v7;
  SUScanOptions *v8;
  NSObject *v9;
  os_log_type_t v10;
  SUSUISoftwareUpdateManager *v11;
  id v12;
  void **v13;
  int v14;
  int v15;
  void (*v16)(id *, char, id);
  void *v17;
  BuddyMandatoryUpdateProgressController *v18;
  uint8_t v19[15];
  os_log_type_t v20;
  os_log_t v21;
  id v22;
  int v23;
  os_log_type_t v24;
  os_log_t oslog;
  id v26;
  id location[2];
  BuddyMandatoryUpdateProgressController *v28;
  uint8_t buf[24];

  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v26 = 0;
  objc_storeStrong(&v26, a4);
  if (location[0] && !v26)
  {
    v6 = -[BuddyMandatoryUpdateProgressController hasSpecificVersionRequired](v28, "hasSpecificVersionRequired");
    if (!v6)
      goto LABEL_11;
    v22 = objc_msgSend(location[0], "preferredDescriptor");
    if (v22)
    {
      -[BuddyMandatoryUpdateProgressController setUpdate:](v28, "setUpdate:", v22);
      v23 = 0;
    }
    else
    {
      v7 = v28;
      v8 = -[BuddyMandatoryUpdateProgressController updateOptions](v28, "updateOptions");
      -[BuddyMandatoryUpdateProgressController showAlertForMDMMissingUpdate:](v7, "showAlertForMDMMissingUpdate:", v8);

      v23 = 1;
    }
    objc_storeStrong(&v22, 0);
    if (!v23)
    {
LABEL_11:
      v21 = (os_log_t)(id)_BYLoggingFacility(v6);
      v20 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v9 = v21;
        v10 = v20;
        sub_100038C3C(v19);
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "Checking to see if we have an existing download in progress...", v19, 2u);
      }
      objc_storeStrong((id *)&v21, 0);
      v11 = -[BuddyMandatoryUpdateProgressController updateManager](v28, "updateManager");
      v12 = -[SUSUISoftwareUpdateManager SUManager](v11, "SUManager");
      v13 = _NSConcreteStackBlock;
      v14 = -1073741824;
      v15 = 0;
      v16 = sub_1000D5AC0;
      v17 = &unk_100280FD8;
      v18 = v28;
      objc_msgSend(v12, "isDownloading:", &v13);

      objc_storeStrong((id *)&v18, 0);
      v23 = 0;
    }
  }
  else
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v5);
    v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_10003EB04((uint64_t)buf, (uint64_t)location[0], (uint64_t)v26);
      _os_log_impl((void *)&_mh_execute_header, oslog, v24, "Failed to scan for update (%@): %@", buf, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v23 = 1;
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)hasSpecificVersionRequired
{
  id v2;
  BOOL v3;
  char v5;
  id v6;
  id location[3];
  BOOL v8;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = -[BuddyMandatoryUpdateProgressController updateOptions](self, "updateOptions");
  v2 = objc_msgSend(location[0], "requestedPMV");
  v5 = 0;
  v3 = 1;
  if (!v2)
  {
    v6 = objc_msgSend(location[0], "requestedBuild");
    v5 = 1;
    v3 = v6 != 0;
  }
  v8 = v3;
  if ((v5 & 1) != 0)

  objc_storeStrong(location, 0);
  return v8;
}

- (BOOL)errorIndicatesUpdateNotFound:(id)a3
{
  char v3;
  void **v5;
  int v6;
  int v7;
  void (*v8)(_QWORD *, void *, _BYTE *);
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  char v15;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  v12 = &v11;
  v13 = 0x20000000;
  v14 = 32;
  v15 = 0;
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_1000D60F8;
  v9 = &unk_100282700;
  v10 = &v11;
  objc_msgSend(location[0], "buddy_enumerateErrorTreeWithHandler:", &v5);
  v3 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (void)resetProgress
{
  NSBundle *v3;
  NSString *v4;

  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyMandatoryUpdateProgressController), a2);
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("MANDATORY_UPDATE_PROGRESS_INITIAL_STATUS"), &stru_100284738, CFSTR("MandatorySoftwareUpdate"));
  -[BuddyMandatoryUpdateProgressController setProgressText:](self, "setProgressText:", v4);

  -[BuddyMandatoryUpdateProgressController setProgress:](self, "setProgress:", 0.0);
}

- (void)showAlertForError:(id)a3
{
  SUSUISoftwareUpdateManager *v3;
  NSBundle *v4;
  NSString *v5;
  id v6;
  NSBundle *v7;
  NSString *v8;
  unsigned __int8 v9;
  id v10;
  SUSUISoftwareUpdateManager *v11;
  id v12;
  UIAlertAction *v13;
  id v14;
  NSBundle *v15;
  NSString *v16;
  UIAlertAction *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(id *, void *);
  void *v21;
  BuddyMandatoryUpdateProgressController *v22;
  void **v23;
  int v24;
  int v25;
  void (*v26)(NSObject *, void *);
  void *v27;
  BuddyMandatoryUpdateProgressController *v28;
  char v29;
  id v30;
  char v31;
  id v32;
  char v33;
  SUSUISoftwareUpdateManager *v34;
  id v35;
  id v36;
  char v37;
  id location[2];
  BuddyMandatoryUpdateProgressController *v39;

  v39 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v37 = 0;
  v3 = -[BuddyMandatoryUpdateProgressController updateManager](v39, "updateManager");
  v36 = -[SUSUISoftwareUpdateManager humanReadableDescriptionForError:enableButton:](v3, "humanReadableDescriptionForError:enableButton:", location[0], &v37);

  if (!objc_msgSend(v36, "length"))
  {
    v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyMandatoryUpdateProgressController));
    v5 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", CFSTR("MANDATORY_UPDATE_GENERIC_ERROR_DETAIL"), &stru_100284738, CFSTR("MandatorySoftwareUpdate"));
    v6 = v36;
    v36 = v5;

  }
  v7 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyMandatoryUpdateProgressController));
  v8 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", CFSTR("MANDATORY_UPDATE_GENERIC_ERROR_TITLE"), &stru_100284738, CFSTR("MandatorySoftwareUpdate"));
  v35 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v8, v36, 1);

  v33 = 0;
  v31 = 0;
  v29 = 0;
  if ((v37 & 1) != 0
    || (v34 = -[BuddyMandatoryUpdateProgressController updateManager](v39, "updateManager"),
        v33 = 1,
        v9 = 0,
        -[SUSUISoftwareUpdateManager state](v34, "state") == 14))
  {
    v32 = -[BuddyMandatoryUpdateProgressController updateManager](v39, "updateManager");
    v31 = 1;
    v9 = 1;
    if ((objc_msgSend(v32, "readyToResume") & 1) == 0)
    {
      v30 = -[BuddyMandatoryUpdateProgressController updateManager](v39, "updateManager");
      v29 = 1;
      v9 = objc_msgSend(v30, "readyToDownloadPreferredUpdate");
    }
  }
  if ((v29 & 1) != 0)

  if ((v31 & 1) != 0)
  if ((v33 & 1) != 0)

  if ((v9 & 1) != 0)
  {
    v10 = v35;
    v11 = -[BuddyMandatoryUpdateProgressController updateManager](v39, "updateManager");
    v12 = -[SUSUISoftwareUpdateManager actionString](v11, "actionString");
    v23 = _NSConcreteStackBlock;
    v24 = -1073741824;
    v25 = 0;
    v26 = sub_1000D6708;
    v27 = &unk_100280A28;
    v28 = v39;
    v13 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v12, 0, &v23);
    objc_msgSend(v10, "addAction:", v13);

    objc_storeStrong((id *)&v28, 0);
  }
  v14 = v35;
  v15 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyMandatoryUpdateProgressController));
  v16 = -[NSBundle localizedStringForKey:value:table:](v15, "localizedStringForKey:value:table:", CFSTR("MANDATORY_UPDATE_ERROR_CANCEL_BUTTON"), &stru_100284738, CFSTR("MandatorySoftwareUpdate"));
  v18 = _NSConcreteStackBlock;
  v19 = 3221225472;
  v20 = sub_1000D69AC;
  v21 = &unk_100280A28;
  v22 = v39;
  v17 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, 1, &v18);
  objc_msgSend(v14, "addAction:", v17, v18, v19, v20, v21);

  -[BuddyMandatoryUpdateProgressController presentViewController:animated:completion:](v39, "presentViewController:animated:completion:", v35, 1, 0);
  objc_storeStrong((id *)&v22, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
}

- (void)showAlertForMDMMissingUpdate:(id)a3
{
  NSBundle *v3;
  id v4;
  NSString *v5;
  NSBundle *v6;
  NSString *v7;
  id v8;
  NSBundle *v9;
  NSString *v10;
  UIAlertAction *v11;
  void **v12;
  int v13;
  int v14;
  void (*v15)(id *, void *);
  void *v16;
  BuddyMandatoryUpdateProgressController *v17;
  id v18;
  id v19;
  os_log_type_t v20;
  os_log_t oslog;
  id v22;
  id v23;
  id location[2];
  BuddyMandatoryUpdateProgressController *v25;
  uint8_t buf[24];

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = +[BuddyMandatoryUpdateUtilities humanReadableCurrentOSVersion](BuddyMandatoryUpdateUtilities, "humanReadableCurrentOSVersion");
  v22 = +[BuddyMandatoryUpdateUtilities humanReadableOSVersionFromScanOptions:](BuddyMandatoryUpdateUtilities, "humanReadableOSVersionFromScanOptions:", location[0]);
  oslog = (os_log_t)(id)_BYLoggingFacility(v22);
  v20 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    sub_10003A6BC((uint64_t)buf, (uint64_t)v22, (uint64_t)v23);
    _os_log_error_impl((void *)&_mh_execute_header, oslog, v20, "Failed to find update for the specified version %{public}@. Current version: %{public}@", buf, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyMandatoryUpdateProgressController));
  v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("MANDATORY_UPDATE_MISSING_MDM_UPDATE_ERROR_DETAIL"));
  v5 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", v4, &stru_100284738, CFSTR("MandatorySoftwareUpdate"));
  v19 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v23, v22);

  v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyMandatoryUpdateProgressController));
  v7 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("MANDATORY_UPDATE_GENERIC_ERROR_TITLE"), &stru_100284738, CFSTR("MandatorySoftwareUpdate"));
  v18 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v7, v19, 1);

  v8 = v18;
  v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyMandatoryUpdateProgressController));
  v10 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("MANDATORY_UPDATE_MISSING_MDM_UPDATE_ERROR_OK_BUTTON"), &stru_100284738, CFSTR("MandatorySoftwareUpdate"));
  v12 = _NSConcreteStackBlock;
  v13 = -1073741824;
  v14 = 0;
  v15 = sub_1000D6E18;
  v16 = &unk_100280A28;
  v17 = v25;
  v11 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 1, &v12);
  objc_msgSend(v8, "addAction:", v11);

  -[BuddyMandatoryUpdateProgressController presentViewController:animated:completion:](v25, "presentViewController:animated:completion:", v18, 1, 0);
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

- (void)startDownload
{
  SUDescriptor *v2;
  SUSUISoftwareUpdateManager *v3;
  SUDescriptor *v4;
  SUSUISoftwareUpdateManager *v5;
  void **v6;
  int v7;
  int v8;
  void (*v9)(uint64_t, char, id);
  void *v10;
  BuddyMandatoryUpdateProgressController *v11;
  void **v12;
  int v13;
  int v14;
  void (*v15)(uint64_t, char, id);
  void *v16;
  id v17[2];
  BuddyMandatoryUpdateProgressController *v18;

  v18 = self;
  v17[1] = (id)a2;
  v2 = -[BuddyMandatoryUpdateProgressController update](self, "update");

  if (v2)
  {
    v3 = -[BuddyMandatoryUpdateProgressController updateManager](v18, "updateManager");
    v4 = -[BuddyMandatoryUpdateProgressController update](v18, "update");
    v12 = _NSConcreteStackBlock;
    v13 = -1073741824;
    v14 = 0;
    v15 = sub_1000D7020;
    v16 = &unk_100280FD8;
    v17[0] = v18;
    -[SUSUISoftwareUpdateManager startDownloadAndInstall:update:withHandler:](v3, "startDownloadAndInstall:update:withHandler:", 0, v4, &v12);

    objc_storeStrong(v17, 0);
  }
  else
  {
    v5 = -[BuddyMandatoryUpdateProgressController updateManager](v18, "updateManager");
    v6 = _NSConcreteStackBlock;
    v7 = -1073741824;
    v8 = 0;
    v9 = sub_1000D7080;
    v10 = &unk_100280FD8;
    v11 = v18;
    -[SUSUISoftwareUpdateManager startDownloadAndInstall:withHandler:](v5, "startDownloadAndInstall:withHandler:", 0, &v6);

    objc_storeStrong((id *)&v11, 0);
  }
}

- (void)handleDownload:(BOOL)a3 error:(id)a4
{
  uint64_t v4;
  id v5;
  unsigned __int8 v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  SUSUISoftwareUpdateManager *v15;
  id v16;
  id v17;
  unsigned __int8 v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t v22[15];
  os_log_type_t v23;
  os_log_t v24;
  char v25;
  id v26;
  char v27;
  id v28;
  os_log_type_t v29;
  os_log_t v30;
  void **v31;
  int v32;
  int v33;
  void (*v34)(uint64_t);
  void *v35;
  BuddyMandatoryUpdateProgressController *v36;
  void **v37;
  int v38;
  int v39;
  id (*v40)(uint64_t);
  void *v41;
  BuddyMandatoryUpdateProgressController *v42;
  id v43;
  os_log_type_t v44;
  os_log_t oslog;
  void **block;
  int v47;
  int v48;
  id (*v49)(uint64_t);
  void *v50;
  BuddyMandatoryUpdateProgressController *v51;
  id v52;
  os_log_type_t v53;
  id v54;
  uint8_t buf[7];
  os_log_type_t v56;
  id v57;
  id location;
  BOOL v59;
  SEL v60;
  BuddyMandatoryUpdateProgressController *v61;
  uint8_t v62[16];
  uint8_t v63[16];
  uint8_t v64[24];

  v61 = self;
  v60 = a2;
  v59 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  if (v59)
  {
    if (location)
    {
      v30 = (os_log_t)(id)_BYLoggingFacility(v4);
      v29 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v27 = 0;
        v25 = 0;
        if ((_BYIsInternalInstall() & 1) != 0)
        {
          v14 = (NSString *)location;
        }
        else if (location)
        {
          v28 = objc_msgSend(location, "domain");
          v27 = 1;
          v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v28, objc_msgSend(location, "code"));
          v26 = v14;
          v25 = 1;
        }
        else
        {
          v14 = 0;
        }
        sub_100039500((uint64_t)v62, (uint64_t)v14);
        _os_log_error_impl((void *)&_mh_execute_header, v30, v29, "Failed to start download of update: %{public}@", v62, 0xCu);
        if ((v25 & 1) != 0)

        if ((v27 & 1) != 0)
      }
      objc_storeStrong((id *)&v30, 0);
    }
    else
    {
      v15 = -[BuddyMandatoryUpdateProgressController updateManager](v61, "updateManager");
      v16 = -[SUSUISoftwareUpdateManager download](v15, "download");
      v17 = objc_msgSend(v16, "progress");
      v18 = objc_msgSend(v17, "isDone");

      if ((v18 & 1) != 0)
      {
        v24 = (os_log_t)(id)_BYLoggingFacility(v19);
        v23 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v20 = v24;
          v21 = v23;
          sub_100038C3C(v22);
          _os_log_impl((void *)&_mh_execute_header, v20, v21, "Update already downloaded; starting install...", v22, 2u);
        }
        objc_storeStrong((id *)&v24, 0);
        -[BuddyMandatoryUpdateProgressController startInstall](v61, "startInstall");
      }
    }
  }
  else
  {
    v5 = objc_msgSend(location, "domain");
    v6 = objc_msgSend(v5, "isEqualToString:", SUErrorDomain);

    if ((v6 & 1) != 0)
    {
      if (objc_msgSend(location, "code") == (id)41)
      {
        v57 = (id)_BYLoggingFacility(41);
        v56 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_DEFAULT))
        {
          v8 = v57;
          v9 = v56;
          sub_100038C3C(buf);
          _os_log_impl((void *)&_mh_execute_header, v8, v9, "Update already downloaded; starting install...", buf, 2u);
        }
        objc_storeStrong(&v57, 0);
        -[BuddyMandatoryUpdateProgressController startInstall](v61, "startInstall");
      }
      else
      {
        v10 = objc_msgSend(location, "code");
        if (v10 != (id)11)
        {
          v54 = (id)_BYLoggingFacility(v10);
          v53 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)v54, OS_LOG_TYPE_DEFAULT))
          {
            sub_100038C28((uint64_t)v64, (uint64_t)location);
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v54, v53, "Failed to start download of update: %@", v64, 0xCu);
          }
          objc_storeStrong(&v54, 0);
          v11 = &_dispatch_main_q;
          block = _NSConcreteStackBlock;
          v47 = -1073741824;
          v48 = 0;
          v49 = sub_1000D772C;
          v50 = &unk_100280D00;
          v51 = v61;
          v52 = location;
          dispatch_async((dispatch_queue_t)v11, &block);

          objc_storeStrong(&v52, 0);
          objc_storeStrong((id *)&v51, 0);
        }
      }
    }
    else if (location)
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v7);
      v44 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        sub_100038C28((uint64_t)v63, (uint64_t)location);
        _os_log_impl((void *)&_mh_execute_header, oslog, v44, "Failed to start download of update: %@", v63, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      v12 = &_dispatch_main_q;
      v37 = _NSConcreteStackBlock;
      v38 = -1073741824;
      v39 = 0;
      v40 = sub_1000D775C;
      v41 = &unk_100280D00;
      v42 = v61;
      v43 = location;
      dispatch_async((dispatch_queue_t)v12, &v37);

      objc_storeStrong(&v43, 0);
      objc_storeStrong((id *)&v42, 0);
    }
    else
    {
      v13 = &_dispatch_main_q;
      v31 = _NSConcreteStackBlock;
      v32 = -1073741824;
      v33 = 0;
      v34 = sub_1000D778C;
      v35 = &unk_100280730;
      v36 = v61;
      dispatch_async((dispatch_queue_t)v13, &v31);

      objc_storeStrong((id *)&v36, 0);
    }
  }
  objc_storeStrong(&location, 0);
}

- (void)startInstall
{
  SUSUISoftwareUpdateManager *v2;
  void **v3;
  int v4;
  int v5;
  void (*v6)(NSObject *, char, id);
  void *v7;
  id v8[2];
  BuddyMandatoryUpdateProgressController *v9;

  v9 = self;
  v8[1] = (id)a2;
  +[BYPreferencesController persistEverything](BYPreferencesController, "persistEverything");
  v2 = -[BuddyMandatoryUpdateProgressController updateManager](v9, "updateManager");
  v3 = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_1000D78F0;
  v7 = &unk_100280FD8;
  v8[0] = v9;
  -[SUSUISoftwareUpdateManager startInstallWithHandler:](v2, "startInstallWithHandler:", &v3);

  objc_storeStrong(v8, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

- (BOOL)shouldAllowStartOver
{
  return 0;
}

- (void)manager:(id)a3 didTransitionToState:(int)a4 fromState:(int)a5
{
  uint64_t v7;
  void *v8;
  void **block;
  int v10;
  int v11;
  void (*v12)(uint64_t);
  void *v13;
  BuddyMandatoryUpdateProgressController *v14;
  unsigned int v15;
  os_log_type_t v16;
  os_log_t oslog;
  unsigned int v18;
  unsigned int v19;
  id location[2];
  BuddyMandatoryUpdateProgressController *v21;
  uint8_t buf[24];

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = a4;
  v18 = a5;
  oslog = (os_log_t)(id)_BYLoggingFacility(v7);
  v16 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10008A810((uint64_t)buf, v18, v19);
    _os_log_impl((void *)&_mh_execute_header, oslog, v16, "Software update state transitioned from %lu to %lu", buf, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v8 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v10 = -1073741824;
  v11 = 0;
  v12 = sub_1000D7CFC;
  v13 = &unk_100282728;
  v15 = v19;
  v14 = v21;
  dispatch_async((dispatch_queue_t)v8, &block);

  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 downloadProgressChanged:(id)a4 displayStyle:(int)a5
{
  void *v7;
  void **block;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  void *v12;
  BuddyMandatoryUpdateProgressController *v13;
  id v14;
  int v15;
  int v16;
  id v17;
  id location[2];
  BuddyMandatoryUpdateProgressController *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v16 = a5;
  if (objc_msgSend(location[0], "state") == 8)
  {
    v15 = 1;
  }
  else
  {
    v7 = &_dispatch_main_q;
    block = _NSConcreteStackBlock;
    v9 = -1073741824;
    v10 = 0;
    v11 = sub_1000D7F44;
    v12 = &unk_100280D00;
    v13 = v19;
    v14 = v17;
    dispatch_async((dispatch_queue_t)v7, &block);

    objc_storeStrong(&v14, 0);
    objc_storeStrong((id *)&v13, 0);
    v15 = 0;
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 promptForDevicePasscodeWithCompletion:(id)a4
{
  id v5;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 promptForDevicePasscodeWithDescriptorCompletion:(id)a4
{
  id v5;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 downloadFinished:(id)a4
{
  id v5;
  id location[2];
  BuddyMandatoryUpdateProgressController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[BuddyMandatoryUpdateProgressController startInstall](v7, "startInstall");
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 download:(id)a4 failedWithError:(id)a5
{
  void *v7;
  void **block;
  int v9;
  int v10;
  id (*v11)(uint64_t);
  void *v12;
  id v13;
  BuddyMandatoryUpdateProgressController *v14;
  id v15;
  id v16;
  id location[2];
  BuddyMandatoryUpdateProgressController *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v15 = 0;
  objc_storeStrong(&v15, a5);
  v7 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v9 = -1073741824;
  v10 = 0;
  v11 = sub_1000D82F0;
  v12 = &unk_100280D00;
  v13 = v15;
  v14 = v18;
  dispatch_async((dispatch_queue_t)v7, &block);

  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 installStartedForUpdate:(id)a4
{
  void *v5;
  void **block;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  BuddyMandatoryUpdateProgressController *v11;
  id v12;
  id location[2];
  BuddyMandatoryUpdateProgressController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v5 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v7 = -1073741824;
  v8 = 0;
  v9 = sub_1000D84B8;
  v10 = &unk_100280730;
  v11 = v14;
  dispatch_async((dispatch_queue_t)v5, &block);

  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 installFailedWithError:(id)a4
{
  void *v5;
  void **v6;
  int v7;
  int v8;
  id (*v9)(uint64_t);
  void *v10;
  id v11;
  BuddyMandatoryUpdateProgressController *v12;
  id v13;
  id location[2];
  BuddyMandatoryUpdateProgressController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v5 = &_dispatch_main_q;
  v6 = _NSConcreteStackBlock;
  v7 = -1073741824;
  v8 = 0;
  v9 = sub_1000D86E8;
  v10 = &unk_100280D00;
  v11 = v13;
  v12 = v15;
  dispatch_async((dispatch_queue_t)v5, &v6);

  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)manager:(id)a3 shouldShowAlertForScanError:(id)a4
{
  unsigned __int8 v5;
  unsigned __int8 v6;
  id v8;
  id location[2];
  BuddyMandatoryUpdateProgressController *v10;
  char v11;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v5 = -[BuddyMandatoryUpdateProgressController hasSpecificVersionRequired](v10, "hasSpecificVersionRequired");
  v6 = 0;
  if ((v5 & 1) != 0)
    v6 = -[BuddyMandatoryUpdateProgressController errorIndicatesUpdateNotFound:](v10, "errorIndicatesUpdateNotFound:", v8);
  if ((v6 & 1) != 0)
  {
    -[BuddyMandatoryUpdateProgressController setFailedToFindMDMRequiredUpdate:](v10, "setFailedToFindMDMRequiredUpdate:", 1);
    v11 = 0;
  }
  else
  {
    v11 = 1;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v11 & 1;
}

- (void)manager:(id)a3 scanFoundUpdates:(id)a4 error:(id)a5
{
  void *v7;
  void **v8;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  void *v12;
  BuddyMandatoryUpdateProgressController *v13;
  id v14;
  id v15;
  id location[2];
  BuddyMandatoryUpdateProgressController *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = 0;
  objc_storeStrong(&v14, a5);
  if (!v15 || v14)
  {
    v7 = &_dispatch_main_q;
    v8 = _NSConcreteStackBlock;
    v9 = -1073741824;
    v10 = 0;
    v11 = sub_1000D89B8;
    v12 = &unk_100280730;
    v13 = v17;
    dispatch_async((dispatch_queue_t)v7, &v8);

    objc_storeStrong((id *)&v13, 0);
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BYDeviceProvider)deviceProvider
{
  return self->_deviceProvider;
}

- (void)setDeviceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_deviceProvider, a3);
}

- (SUSUISoftwareUpdateManager)updateManager
{
  return (SUSUISoftwareUpdateManager *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUpdateManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (SUScanOptions)updateOptions
{
  return (SUScanOptions *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUpdateOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (SUDescriptor)update
{
  return (SUDescriptor *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUpdate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
  objc_storeStrong((id *)&self->_animationController, a3);
}

- (BOOL)failedToFindMDMRequiredUpdate
{
  return self->_failedToFindMDMRequiredUpdate;
}

- (void)setFailedToFindMDMRequiredUpdate:(BOOL)a3
{
  self->_failedToFindMDMRequiredUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_update, 0);
  objc_storeStrong((id *)&self->_updateOptions, 0);
  objc_storeStrong((id *)&self->_updateManager, 0);
  objc_storeStrong((id *)&self->_deviceProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
