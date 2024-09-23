@implementation iFBAPreferencesViewController

- (void)viewDidLoad
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
  objc_class *v13;
  NSString *v14;
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
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  unint64_t v50;
  uint64_t v51;
  void *v52;
  unsigned __int8 v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  objc_super v61;

  v61.receiver = self;
  v61.super_class = (Class)iFBAPreferencesViewController;
  -[iFBAPreferencesViewController viewDidLoad](&v61, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController useTouchIDSwitchCellLabel](self, "useTouchIDSwitchCellLabel"));
  objc_msgSend(v4, "setTextColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController requireTouchIDCellLabel](self, "requireTouchIDCellLabel"));
  objc_msgSend(v6, "setTextColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController touchIDTimeoutLabel](self, "touchIDTimeoutLabel"));
  objc_msgSend(v8, "setTextColor:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController allowCellUploadsLabel](self, "allowCellUploadsLabel"));
  objc_msgSend(v10, "setTextColor:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController myBetaDevicesLabel](self, "myBetaDevicesLabel"));
  objc_msgSend(v12, "setTextColor:", v11);

  v13 = (objc_class *)objc_opt_class(FBADevicePairingViewController);
  v14 = NSStringFromClass(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  -[iFBAPreferencesViewController setDevicesId:](self, "setDevicesId:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController tableView](self, "tableView"));
  objc_msgSend(v16, "setEstimatedSectionHeaderHeight:", 0.0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController tableView](self, "tableView"));
  objc_msgSend(v17, "setEstimatedSectionFooterHeight:", 0.0);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController tableView](self, "tableView"));
  objc_msgSend(v18, "setRowHeight:", UITableViewAutomaticDimension);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController tableView](self, "tableView"));
  objc_msgSend(v19, "setEstimatedRowHeight:", 44.0);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("TOUCH_ID_PREFERENCE"), &stru_1000EA660, 0));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController useTouchIDSwitchCellLabel](self, "useTouchIDSwitchCellLabel"));
  objc_msgSend(v22, "setText:", v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("TOUCH_ID_REQUIRE"), &stru_1000EA660, 0));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController requireTouchIDCellLabel](self, "requireTouchIDCellLabel"));
  objc_msgSend(v25, "setText:", v24);

  if (+[iFBKUtils deviceSupportsFaceID](iFBKUtils, "deviceSupportsFaceID"))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("FACE_ID_PREFERENCE"), &stru_1000EA660, 0));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController useTouchIDSwitchCellLabel](self, "useTouchIDSwitchCellLabel"));
    objc_msgSend(v28, "setText:", v27);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("FACE_ID_REQUIRE"), &stru_1000EA660, 0));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController requireTouchIDCellLabel](self, "requireTouchIDCellLabel"));
    objc_msgSend(v31, "setText:", v30);

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("PREFERENCES"), &stru_1000EA660, 0));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v34, "setTitle:", v33);

  v35 = objc_alloc((Class)UIBarButtonItem);
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_1000EA660, 0));
  v38 = objc_msgSend(v35, "initWithTitle:style:target:action:", v37, 2, self, "didTapDone:");
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v39, "setRightBarButtonItem:", v38);

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController tableView](self, "tableView"));
  objc_msgSend(v40, "addObserver:selector:name:object:", v41, "reloadData", UIContentSizeCategoryDidChangeNotification, 0);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController tableView](self, "tableView"));
  objc_msgSend(v42, "setDelegate:", self);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController tableView](self, "tableView"));
  objc_msgSend(v43, "setDataSource:", self);

  if (-[iFBAPreferencesViewController isWarningsOn](self, "isWarningsOn"))
    v44 = objc_claimAutoreleasedReturnValue(+[iFBAConstants tintColor](iFBAConstants, "tintColor"));
  else
    v44 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v45 = (void *)v44;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController resetWarningsCell](self, "resetWarningsCell"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "textLabel"));
  objc_msgSend(v47, "setTextColor:", v45);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController resetWarningsCell](self, "resetWarningsCell"));
  objc_msgSend(v48, "setSelectionStyle:", 0);

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController resetWarningsCell](self, "resetWarningsCell"));
  v50 = (unint64_t)objc_msgSend(v49, "accessibilityTraits");
  objc_msgSend(v49, "setAccessibilityTraits:", UIAccessibilityTraitButton | v50);

  v52 = (void *)objc_opt_new(LAContext, v51);
  v60 = 0;
  v53 = objc_msgSend(v52, "canEvaluatePolicy:error:", 1, &v60);
  v54 = v60;

  if (+[iFBAConstants supportsBiometricsLock](iFBAConstants, "supportsBiometricsLock") && (v53 & 1) == 0)
    objc_msgSend(v54, "code");
  -[iFBAPreferencesViewController setHideTouchID:](self, "setHideTouchID:");
  if (v54 && objc_msgSend(v54, "code") == (id)-7)
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController touchIDSwitch](self, "touchIDSwitch"));
    objc_msgSend(v55, "setOn:", 0);
  }
  else
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v56 = objc_msgSend(v55, "BOOLForKey:", CFSTR("UseTouchIDLogin"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController touchIDSwitch](self, "touchIDSwitch"));
    objc_msgSend(v57, "setOn:", v56);

  }
  -[iFBAPreferencesViewController configureUserCell](self, "configureUserCell");
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tintColor](UIColor, "tintColor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController resetWarningsLabel](self, "resetWarningsLabel"));
  objc_msgSend(v59, "setTextColor:", v58);

}

- (void)configureUserCell
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = (id)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration subtitleCellConfiguration](UIListContentConfiguration, "subtitleCellConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentUser"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fullName"));
  objc_msgSend(v18, "setText:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "textProperties"));
  objc_msgSend(v7, "setColor:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "username"));
  objc_msgSend(v18, "setSecondaryText:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "secondaryTextProperties"));
  objc_msgSend(v10, "setFont:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "secondaryTextProperties"));
  objc_msgSend(v12, "setColor:", v11);

  objc_msgSend(v18, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController userImage](self, "userImage"));
  objc_msgSend(v18, "setImage:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "imageProperties"));
  objc_msgSend(v14, "setCornerRadius:", 22.0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "imageProperties"));
  objc_msgSend(v15, "setMaximumSize:", 44.0, 44.0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController usernameCell](self, "usernameCell"));
  objc_msgSend(v16, "setUserInteractionEnabled:", 0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController usernameCell](self, "usernameCell"));
  objc_msgSend(v17, "setContentConfiguration:", v18);

}

- (id)userImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentUser"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "username"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FBAAvatarHelper contactImageForEmailAddress:](_TtC18Feedback_Assistant15FBAAvatarHelper, "contactImageForEmailAddress:", v4));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "givenName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "familyName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FBAAvatarHelper monogramAvatarImageForPreferredName:familyName:](_TtC18Feedback_Assistant15FBAAvatarHelper, "monogramAvatarImageForPreferredName:familyName:", v6, v7));

  }
  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)iFBAPreferencesViewController;
  v6 = -[iFBAPreferencesViewController tableView:numberOfRowsInSection:](&v10, "tableView:numberOfRowsInSection:", a3);
  if (a4 == 2)
  {
    if (-[iFBAPreferencesViewController hideTouchID](self, "hideTouchID"))
    {
      return (int64_t)v6 - 2;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController touchIDSwitch](self, "touchIDSwitch"));
      v8 = objc_msgSend(v7, "isOn");

      return (int64_t)v6 - (v8 ^ 1);
    }
  }
  return (int64_t)v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)iFBAPreferencesViewController;
  -[iFBAPreferencesViewController viewWillAppear:](&v17, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CELL_FILE_UPLOADS"), &stru_1000EA660, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController allowCellUploadsLabel](self, "allowCellUploadsLabel"));
  objc_msgSend(v6, "setText:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = objc_msgSend(v7, "BOOLForKey:", FBKAllowCellularFileUploads);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController allowCellUploads](self, "allowCellUploads"));
  objc_msgSend(v9, "setOn:animated:", v8, 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v11 = objc_msgSend(v10, "integerForKey:", CFSTR("TouchIDTimeoutDuration"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("After %lu minutes"), &stru_1000EA660, CFSTR("Plurals")));
  v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, sub_10003E928((uint64_t)v11));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController touchIDTimeoutLabel](self, "touchIDTimeoutLabel"));
  objc_msgSend(v16, "setText:", v15);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)iFBAPreferencesViewController;
  -[iFBAPreferencesViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "synchronize");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)iFBAPreferencesViewController;
  -[iFBAPreferencesViewController dealloc](&v4, "dealloc");
}

- (void)didTapDone:(id)a3
{
  -[iFBAPreferencesViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)didTapSignOut:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "loginManager"));
  objc_msgSend(v5, "logOut");

  +[FBKFileManager deleteAllDraftDirectories](FBKFileManager, "deleteAllDraftDirectories");
  -[iFBAPreferencesViewController didTapDone:](self, "didTapDone:", v4);

}

- (void)didSwitchCellularAccess:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = objc_msgSend(v3, "isOn");

  objc_msgSend(v4, "setBool:forKey:", v5, FBKAllowCellularFileUploads);
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v6, "synchronize");

}

- (void)didResetWarnings:(id)a3
{
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
  void *v14;
  _QWORD v15[5];

  if (-[iFBAPreferencesViewController isWarningsOn](self, "isWarningsOn", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("RESET_WARNINGS"), &stru_1000EA660, 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("RESET_WARNINGS_MESSAGE"), &stru_1000EA660, 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("YES"), &stru_1000EA660, 0));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100036210;
    v15[3] = &unk_1000E61E0;
    v15[4] = self;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 2, v15));
    objc_msgSend(v8, "addAction:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("NO"), &stru_1000EA660, 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 0, 0));
    objc_msgSend(v8, "addAction:", v14);

    -[iFBAPreferencesViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
  }
}

- (void)didToggleTouchID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void **v22;
  uint64_t v23;
  id (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;

  v4 = a3;
  v6 = (void *)objc_opt_new(LAContext, v5);
  v27 = 0;
  v7 = objc_msgSend(v6, "canEvaluatePolicy:error:", 1, &v27);
  v8 = v27;

  if ((v7 & 1) != 0 || objc_msgSend(v8, "code") != (id)-7)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v21, "setBool:forKey:", objc_msgSend(v4, "isOn"), CFSTR("UseTouchIDLogin"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController tableView](self, "tableView"));
    objc_msgSend(v10, "reloadData");
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("TOUCH_ID_NOT_ENROLLED"), &stru_1000EA660, 0));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("TOUCH_ID_NOT_ENROLLED_MESSAGE"), &stru_1000EA660, 0));

    if (+[iFBKUtils deviceSupportsFaceID](iFBKUtils, "deviceSupportsFaceID"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("FACE_ID_NOT_ENROLLED"), &stru_1000EA660, 0));

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("FACE_ID_NOT_ENROLLED_MESSAGE"), &stru_1000EA660, 0));

      v10 = (void *)v14;
      v12 = (void *)v16;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v10, v12, 1));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1000EA660, 0));
    v22 = _NSConcreteStackBlock;
    v23 = 3221225472;
    v24 = sub_1000364E0;
    v25 = &unk_1000E61E0;
    v26 = v4;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v19, 0, &v22));
    objc_msgSend(v17, "addAction:", v20, v22, v23, v24, v25);

    -[iFBAPreferencesViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  id v19;

  v19 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "cellForRowAtIndexPath:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "reuseIdentifier"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("FBAResetWarningsCell"));

  if (v9)
  {
    -[iFBAPreferencesViewController didResetWarnings:](self, "didResetWarnings:", v7);
    objc_msgSend(v19, "deselectRowAtIndexPath:animated:", v6, 1);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "reuseIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController devicesId](self, "devicesId"));
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController storyboard](self, "storyboard"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController devicesId](self, "devicesId"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "instantiateViewControllerWithIdentifier:", v14));

    objc_msgSend(v15, "setContext:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController navigationController](self, "navigationController"));
    objc_msgSend(v16, "pushViewController:animated:", v15, 1);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "reuseIdentifier"));
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("SignoutCell"));

  if (v18)
  {
    objc_msgSend(v19, "deselectRowAtIndexPath:animated:", v6, 1);
    -[iFBAPreferencesViewController didTapSignOut:](self, "didTapSignOut:", v7);
  }

}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  if (a4 == 4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController versionFooter](self, "versionFooter"));
  }
  else if (a4 == 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CELLULAR_DATA_INFO_FOOTER"), CFSTR("When enabled, supported devices will use cellular data to upload files."), 0));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)versionFooter
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  uint64_t v11;

  if (FBKIsInternalInstall(self, a2))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForInfoDictionaryKey:", kCFBundleVersionKey));

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString")));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForInfoDictionaryKey:", kCFBundleNameKey));

    if (v3 && objc_msgSend(v3, "length"))
      v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n%@ %@ (%@)"), v7, v5, v3);
    else
      v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n%@ %@"), v7, v5, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;
  _QWORD v9[5];

  height = a3.height;
  width = a3.width;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000368E0;
  v9[3] = &unk_1000E69B8;
  v9[4] = self;
  v7 = a4;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, &stru_1000E74D0);
  v8.receiver = self;
  v8.super_class = (Class)iFBAPreferencesViewController;
  -[iFBAPreferencesViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

}

- (BOOL)isWarningsOn
{
  void *v2;
  BOOL v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  if ((objc_msgSend(v2, "BOOLForKey:", FBKSuppressPrivacyNoticePreferencesKey) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", FBKSuppressPrivacyNoticePreferencesUserKey));
    if (v4)
      v3 = 1;
    else
      v3 = objc_msgSend(v2, "integerForKey:", FBKAgreedLegalVersionKey) != 0;

  }
  return v3;
}

- (void)resetWarnings
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = FBKSuppressPrivacyNoticePreferencesKey;
  objc_msgSend(v3, "removeObjectForKey:", FBKSuppressPrivacyNoticePreferencesKey);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = FBKSuppressPrivacyNoticePreferencesUserKey;
  objc_msgSend(v5, "removeObjectForKey:", FBKSuppressPrivacyNoticePreferencesUserKey);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = FBKAgreedLegalVersionKey;
  objc_msgSend(v7, "removeObjectForKey:", FBKAgreedLegalVersionKey);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v10 = FBKSuppressMakeVisibleQuestion;
  objc_msgSend(v9, "removeObjectForKey:", FBKSuppressMakeVisibleQuestion);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[iFBAConstants sharedUserDefaults](iFBAConstants, "sharedUserDefaults"));
  objc_msgSend(v11, "removeObjectForKey:", v4);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[iFBAConstants sharedUserDefaults](iFBAConstants, "sharedUserDefaults"));
  objc_msgSend(v12, "removeObjectForKey:", v6);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[iFBAConstants sharedUserDefaults](iFBAConstants, "sharedUserDefaults"));
  objc_msgSend(v13, "removeObjectForKey:", v8);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[iFBAConstants sharedUserDefaults](iFBAConstants, "sharedUserDefaults"));
  objc_msgSend(v14, "removeObjectForKey:", v10);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[iFBAConstants sharedUserDefaults](iFBAConstants, "sharedUserDefaults"));
  objc_msgSend(v15, "removeObjectForKey:", v4);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v16, "synchronize");

  v19 = (id)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesViewController resetWarningsCell](self, "resetWarningsCell"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "textLabel"));
  objc_msgSend(v18, "setTextColor:", v19);

}

- (UISwitch)allowCellUploads
{
  return (UISwitch *)objc_loadWeakRetained((id *)&self->_allowCellUploads);
}

- (void)setAllowCellUploads:(id)a3
{
  objc_storeWeak((id *)&self->_allowCellUploads, a3);
}

- (UILabel)allowCellUploadsLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_allowCellUploadsLabel);
}

- (void)setAllowCellUploadsLabel:(id)a3
{
  objc_storeWeak((id *)&self->_allowCellUploadsLabel, a3);
}

- (UITableViewCell)resetWarningsCell
{
  return (UITableViewCell *)objc_loadWeakRetained((id *)&self->_resetWarningsCell);
}

- (void)setResetWarningsCell:(id)a3
{
  objc_storeWeak((id *)&self->_resetWarningsCell, a3);
}

- (UITableViewCell)usernameCell
{
  return (UITableViewCell *)objc_loadWeakRetained((id *)&self->_usernameCell);
}

- (void)setUsernameCell:(id)a3
{
  objc_storeWeak((id *)&self->_usernameCell, a3);
}

- (UITableViewCell)touchIDCell
{
  return (UITableViewCell *)objc_loadWeakRetained((id *)&self->_touchIDCell);
}

- (void)setTouchIDCell:(id)a3
{
  objc_storeWeak((id *)&self->_touchIDCell, a3);
}

- (UILabel)touchIDTimeoutLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_touchIDTimeoutLabel);
}

- (void)setTouchIDTimeoutLabel:(id)a3
{
  objc_storeWeak((id *)&self->_touchIDTimeoutLabel, a3);
}

- (UISwitch)touchIDSwitch
{
  return (UISwitch *)objc_loadWeakRetained((id *)&self->_touchIDSwitch);
}

- (void)setTouchIDSwitch:(id)a3
{
  objc_storeWeak((id *)&self->_touchIDSwitch, a3);
}

- (BOOL)hideTouchID
{
  return self->_hideTouchID;
}

- (void)setHideTouchID:(BOOL)a3
{
  self->_hideTouchID = a3;
}

- (UILabel)useTouchIDSwitchCellLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_useTouchIDSwitchCellLabel);
}

- (void)setUseTouchIDSwitchCellLabel:(id)a3
{
  objc_storeWeak((id *)&self->_useTouchIDSwitchCellLabel, a3);
}

- (UILabel)requireTouchIDCellLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_requireTouchIDCellLabel);
}

- (void)setRequireTouchIDCellLabel:(id)a3
{
  objc_storeWeak((id *)&self->_requireTouchIDCellLabel, a3);
}

- (UILabel)myBetaDevicesLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_myBetaDevicesLabel);
}

- (void)setMyBetaDevicesLabel:(id)a3
{
  objc_storeWeak((id *)&self->_myBetaDevicesLabel, a3);
}

- (UILabel)showOnHomeScreenLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_showOnHomeScreenLabel);
}

- (void)setShowOnHomeScreenLabel:(id)a3
{
  objc_storeWeak((id *)&self->_showOnHomeScreenLabel, a3);
}

- (UILabel)resetWarningsLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_resetWarningsLabel);
}

- (void)setResetWarningsLabel:(id)a3
{
  objc_storeWeak((id *)&self->_resetWarningsLabel, a3);
}

- (NSString)devicesId
{
  return self->_devicesId;
}

- (void)setDevicesId:(id)a3
{
  objc_storeStrong((id *)&self->_devicesId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicesId, 0);
  objc_destroyWeak((id *)&self->_resetWarningsLabel);
  objc_destroyWeak((id *)&self->_showOnHomeScreenLabel);
  objc_destroyWeak((id *)&self->_myBetaDevicesLabel);
  objc_destroyWeak((id *)&self->_requireTouchIDCellLabel);
  objc_destroyWeak((id *)&self->_useTouchIDSwitchCellLabel);
  objc_destroyWeak((id *)&self->_touchIDSwitch);
  objc_destroyWeak((id *)&self->_touchIDTimeoutLabel);
  objc_destroyWeak((id *)&self->_touchIDCell);
  objc_destroyWeak((id *)&self->_usernameCell);
  objc_destroyWeak((id *)&self->_resetWarningsCell);
  objc_destroyWeak((id *)&self->_allowCellUploadsLabel);
  objc_destroyWeak((id *)&self->_allowCellUploads);
}

@end
