@implementation BuddyCloudConfigDisclosureViewController

+ (id)cloudConfigSkipKey
{
  return 0;
}

- (BuddyCloudConfigDisclosureViewController)init
{
  NSBundle *v3;
  NSString *v4;
  UIImage *v5;
  id v6;
  double v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSBundle *v13;
  id v14;
  NSString *v15;
  BuddyCloudConfigDisclosureViewController *v16;
  objc_super v18;
  SEL v19;
  id location;

  v19 = a2;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("REMOTE_MANAGEMENT_TITLE"), &stru_100284738, CFSTR("Localizable"));
  v5 = +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("gear"));
  location = 0;
  v18.receiver = self;
  v18.super_class = (Class)BuddyCloudConfigDisclosureViewController;
  location = -[BuddyCloudConfigDisclosureViewController initWithTitle:detailText:icon:](&v18, "initWithTitle:detailText:icon:", v4, 0, v5);
  objc_storeStrong(&location, location);

  if (location)
  {
    v6 = objc_msgSend(location, "headerView");
    LODWORD(v7) = 1045220557;
    objc_msgSend(v6, "setTitleHyphenationFactor:", v7);

    v8 = objc_msgSend(objc_alloc((Class)BFFLinkLabelFooterView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v9 = (void *)*((_QWORD *)location + 10);
    *((_QWORD *)location + 10) = v8;

    v10 = +[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton");
    v11 = (void *)*((_QWORD *)location + 11);
    *((_QWORD *)location + 11) = v10;

    v12 = (void *)*((_QWORD *)location + 11);
    v13 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v14 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("REMOTE_MANAGEMENT_ENROLL_BUTTON_TITLE"));
    v15 = -[NSBundle localizedStringForKey:value:table:](v13, "localizedStringForKey:value:table:", v14, &stru_100284738, CFSTR("Localizable"));
    objc_msgSend(v12, "setTitle:forState:", v15, 0);

    objc_msgSend(*((id *)location + 11), "addTarget:action:forControlEvents:", location, "controllerDone", 64);
  }
  v16 = (BuddyCloudConfigDisclosureViewController *)location;
  objc_storeStrong(&location, 0);
  return v16;
}

- (void)_setupForCloudConfigurationState
{
  BuddyCloudConfigController *v2;
  unsigned int v3;
  id v4;
  OBBoldTrayButton *v5;
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  id v11;
  BuddyCloudConfigController *v12;
  BuddyCloudConfigController *v13;
  id v14;
  NSBundle *v15;
  id v16;
  NSString *v17;
  NSError *v18;
  NSString *v19;
  NSString *v20;
  id v21;
  NSBundle *v22;
  id v23;
  NSString *v24;
  id v25;
  id v26;
  NSError *v27;
  NSString *v28;
  NSString *v29;
  id v30;
  NSBundle *v31;
  id v32;
  NSString *v33;
  NSString *v34;
  id v35;
  BuddyCloudConfigAboutConfigurationContainerController *v36;
  id v37;
  BuddyCloudConfigAboutConfigurationContainerController *v38;
  id v39;
  BuddyCloudConfigAboutConfigurationContainerController *v40;
  BuddyCloudConfigAboutConfigurationContainerController *v41;
  id v42;
  BuddyCloudConfigAboutConfigurationContainerController *v43;
  id v44;
  BuddyCloudConfigAboutConfigurationContainerController *v45;
  id v46;
  BuddyCloudConfigAboutConfigurationContainerController *v47;
  id v48;
  BuddyCloudConfigAboutConfigurationContainerController *v49;
  id v50;
  BuddyCloudConfigAboutConfigurationContainerController *v51;
  id v52;
  BuddyCloudConfigAboutConfigurationContainerController *v53;
  id v54;
  BuddyCloudConfigAboutConfigurationContainerController *v55;
  id v56;
  BuddyCloudConfigAboutConfigurationContainerController *v57;
  BFFLinkLabelFooterView *v58;
  id v59;
  BFFLinkLabelFooterView *v60;
  NSBundle *v61;
  NSString *v62;
  id v63;
  OBBoldTrayButton *v64;
  BuddyCloudConfigDisclosureViewController *v65;
  NSBundle *v66;
  id v67;
  NSString *v68;
  id v69;
  NSError *v70;
  BuddyCloudConfigController *v71;
  BuddyCloudConfigController *v72;
  id v73;
  void **v74;
  int v75;
  int v76;
  void (*v77)(uint64_t);
  void *v78;
  id v79;
  id from;
  id v81;
  id v82;
  void **v83;
  int v84;
  int v85;
  void (*v86)(id *, void *);
  void *v87;
  BuddyCloudConfigDisclosureViewController *v88;
  uint8_t buf[15];
  char v90;
  id location;
  void **v92;
  int v93;
  int v94;
  void (*v95)(id *, void *);
  void *v96;
  BuddyCloudConfigDisclosureViewController *v97;
  id v98;
  id v99[2];
  BuddyCloudConfigDisclosureViewController *v100;

  v100 = self;
  v99[1] = (id)a2;
  v99[0] = -[BuddyCloudConfigDisclosureViewController managedConfiguration](self, "managedConfiguration");
  v2 = -[BuddyCloudConfigDisclosureViewController configController](v100, "configController");
  v3 = -[BuddyCloudConfigController cloudConfigState](v2, "cloudConfigState");

  switch(v3)
  {
    case 0u:
      -[BuddyCloudConfigDisclosureViewController _initializeViews](v100, "_initializeViews");
      v4 = -[BuddyCloudConfigDisclosureViewController buttonTray](v100, "buttonTray");
      v5 = -[BuddyCloudConfigDisclosureViewController enrollButton](v100, "enrollButton");
      objc_msgSend(v4, "addButton:", v5);

      +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:identifier:](BFFViewControllerSpinnerManager, "startAnimatingSpinnerFor:identifier:", v100, CFSTR("Disclosure"));
      v6 = +[BuddyCloudConfigManager sharedManager](BuddyCloudConfigManager, "sharedManager");
      LOBYTE(v5) = objc_msgSend(v6, "hasCloudConfiguration");

      if ((v5 & 1) != 0)
      {
        v7 = +[BuddyCloudConfigManager sharedManager](BuddyCloudConfigManager, "sharedManager");
        v98 = objc_msgSend(v7, "cloudConfigurationDetails");

        if (v98)
        {
          v92 = _NSConcreteStackBlock;
          v93 = -1073741824;
          v94 = 0;
          v95 = sub_1001ACF00;
          v96 = &unk_100280B80;
          v97 = v100;
          objc_msgSend(v99[0], "storeCloudConfigurationDetails:completion:", v98, &v92);
          objc_storeStrong((id *)&v97, 0);
        }
        else
        {
          location = (id)_BYLoggingFacility(v8);
          v90 = 16;
          if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
          {
            v9 = location;
            v10 = v90;
            sub_100038C3C(buf);
            _os_log_error_impl((void *)&_mh_execute_header, v9, v10, "BuddyCloudConfigManager returned hasCloudConfiguration = true, but cloudConfigurationDetails were nil! resetting...", buf, 2u);
          }
          objc_storeStrong(&location, 0);
          v11 = +[BuddyCloudConfigManager sharedManager](BuddyCloudConfigManager, "sharedManager");
          objc_msgSend(v11, "setHasPreviouslyRetrievedMDMv1EnrollmentProfile:", 0);

          v12 = -[BuddyCloudConfigDisclosureViewController configController](v100, "configController");
          -[BuddyCloudConfigController setCloudConfigState:](v12, "setCloudConfigState:", 2);

          -[BuddyCloudConfigDisclosureViewController _setupForCloudConfigurationState](v100, "_setupForCloudConfigurationState");
        }
        objc_storeStrong(&v98, 0);
      }
      else
      {
        v13 = -[BuddyCloudConfigDisclosureViewController configController](v100, "configController");
        -[BuddyCloudConfigController setCloudConfigState:](v13, "setCloudConfigState:", 1);

        v83 = _NSConcreteStackBlock;
        v84 = -1073741824;
        v85 = 0;
        v86 = sub_1001AD100;
        v87 = &unk_100280B80;
        v88 = v100;
        objc_msgSend(v99[0], "retrieveAndStoreCloudConfigurationDetailsCompletionBlock:", &v83);
        objc_storeStrong((id *)&v88, 0);
      }
      break;
    case 2u:
      +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:](BFFViewControllerSpinnerManager, "stopAnimatingSpinnerFor:", CFSTR("Disclosure"));
      -[BuddyCloudConfigDisclosureViewController _initializeViews](v100, "_initializeViews");
      v14 = -[BuddyCloudConfigDisclosureViewController headerView](v100, "headerView");
      v15 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v16 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("CLOUD_CONFIG_ERROR_FAILED_RETRIEVE_INITIAL_CONFIG"));
      v17 = -[NSBundle localizedStringForKey:value:table:](v15, "localizedStringForKey:value:table:", v16, &stru_100284738, CFSTR("Localizable"));
      v18 = -[BuddyCloudConfigDisclosureViewController lastRetrievalError](v100, "lastRetrievalError");
      v19 = -[NSError localizedDescription](v18, "localizedDescription");
      v20 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v17, v19);
      objc_msgSend(v14, "setDetailText:", v20);

      break;
    case 3u:
      v82 = objc_msgSend(v99[0], "cloudConfigurationDetails");
      if (v82)
      {
        -[BuddyCloudConfigDisclosureViewController _initializeViews](v100, "_initializeViews");
        +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:](BFFViewControllerSpinnerManager, "stopAnimatingSpinnerFor:", CFSTR("Disclosure"));
        v81 = objc_msgSend(v99[0], "deviceOrganizationName");
        v30 = -[BuddyCloudConfigDisclosureViewController headerView](v100, "headerView");
        v31 = +[NSBundle mainBundle](NSBundle, "mainBundle");
        v32 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("CLOUD_CONFIG_DESCRIPTION"));
        v33 = -[NSBundle localizedStringForKey:value:table:](v31, "localizedStringForKey:value:table:", v32, &stru_100284738, CFSTR("Localizable"));
        v34 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v33, v81);
        objc_msgSend(v30, "setDetailText:", v34);

        v35 = objc_msgSend(v99[0], "isSupervised");
        v36 = -[BuddyCloudConfigDisclosureViewController aboutConfigurationContainerController](v100, "aboutConfigurationContainerController");
        -[BuddyCloudConfigAboutConfigurationContainerController setIsSupervised:](v36, "setIsSupervised:", v35);

        v37 = objc_msgSend(v82, "objectForKeyedSubscript:", kMCCCOrganizationSupportPhoneKey);
        v38 = -[BuddyCloudConfigDisclosureViewController aboutConfigurationContainerController](v100, "aboutConfigurationContainerController");
        -[BuddyCloudConfigAboutConfigurationContainerController setOrganizationSupportPhone:](v38, "setOrganizationSupportPhone:", v37);

        v39 = objc_msgSend(v82, "objectForKeyedSubscript:", kCCOrganizationSupportEmailKey);
        v40 = -[BuddyCloudConfigDisclosureViewController aboutConfigurationContainerController](v100, "aboutConfigurationContainerController");
        -[BuddyCloudConfigAboutConfigurationContainerController setOrganizationSupportEmail:](v40, "setOrganizationSupportEmail:", v39);

        v41 = -[BuddyCloudConfigDisclosureViewController aboutConfigurationContainerController](v100, "aboutConfigurationContainerController");
        -[BuddyCloudConfigAboutConfigurationContainerController setOrganizationName:](v41, "setOrganizationName:", v81);

        v42 = objc_msgSend(v99[0], "deviceDepartmentName");
        v43 = -[BuddyCloudConfigDisclosureViewController aboutConfigurationContainerController](v100, "aboutConfigurationContainerController");
        -[BuddyCloudConfigAboutConfigurationContainerController setOrganizationDepartment:](v43, "setOrganizationDepartment:", v42);

        v44 = objc_msgSend(v99[0], "deviceOrganizationAddress");
        v45 = -[BuddyCloudConfigDisclosureViewController aboutConfigurationContainerController](v100, "aboutConfigurationContainerController");
        -[BuddyCloudConfigAboutConfigurationContainerController setOrganizationAddress:](v45, "setOrganizationAddress:", v44);

        v46 = objc_msgSend(v99[0], "deviceOrganizationAddressLine1");
        v47 = -[BuddyCloudConfigDisclosureViewController aboutConfigurationContainerController](v100, "aboutConfigurationContainerController");
        -[BuddyCloudConfigAboutConfigurationContainerController setOrganizationAddressLine1:](v47, "setOrganizationAddressLine1:", v46);

        v48 = objc_msgSend(v99[0], "deviceOrganizationAddressLine2");
        v49 = -[BuddyCloudConfigDisclosureViewController aboutConfigurationContainerController](v100, "aboutConfigurationContainerController");
        -[BuddyCloudConfigAboutConfigurationContainerController setOrganizationAddressLine2:](v49, "setOrganizationAddressLine2:", v48);

        v50 = objc_msgSend(v99[0], "deviceOrganizationCity");
        v51 = -[BuddyCloudConfigDisclosureViewController aboutConfigurationContainerController](v100, "aboutConfigurationContainerController");
        -[BuddyCloudConfigAboutConfigurationContainerController setOrganizationCity:](v51, "setOrganizationCity:", v50);

        v52 = objc_msgSend(v99[0], "deviceOrganizationRegion");
        v53 = -[BuddyCloudConfigDisclosureViewController aboutConfigurationContainerController](v100, "aboutConfigurationContainerController");
        -[BuddyCloudConfigAboutConfigurationContainerController setOrganizationRegion:](v53, "setOrganizationRegion:", v52);

        v54 = objc_msgSend(v99[0], "deviceOrganizationZipCode");
        v55 = -[BuddyCloudConfigDisclosureViewController aboutConfigurationContainerController](v100, "aboutConfigurationContainerController");
        -[BuddyCloudConfigAboutConfigurationContainerController setOrganizationZipCode:](v55, "setOrganizationZipCode:", v54);

        v56 = objc_msgSend(v99[0], "deviceOrganizationCountry");
        v57 = -[BuddyCloudConfigDisclosureViewController aboutConfigurationContainerController](v100, "aboutConfigurationContainerController");
        -[BuddyCloudConfigAboutConfigurationContainerController setOrganizationCountry:](v57, "setOrganizationCountry:", v56);

        v58 = -[BuddyCloudConfigDisclosureViewController aboutRemoteManagementContentView](v100, "aboutRemoteManagementContentView");
        v59 = -[BuddyCloudConfigDisclosureViewController _remoteManagementText](v100, "_remoteManagementText");
        -[BFFLinkLabelFooterView setAttributedSubtitleText:](v58, "setAttributedSubtitleText:", v59);

        objc_initWeak(&from, v100);
        v60 = -[BuddyCloudConfigDisclosureViewController aboutRemoteManagementContentView](v100, "aboutRemoteManagementContentView");
        v61 = +[NSBundle mainBundle](NSBundle, "mainBundle");
        v62 = -[NSBundle localizedStringForKey:value:table:](v61, "localizedStringForKey:value:table:", CFSTR("REMOTE_MANAGEMENT_ABOUT"), &stru_100284738, CFSTR("Localizable"));
        v74 = _NSConcreteStackBlock;
        v75 = -1073741824;
        v76 = 0;
        v77 = sub_1001AD288;
        v78 = &unk_1002806B8;
        objc_copyWeak(&v79, &from);
        -[BFFLinkLabelFooterView addLinkWithTitle:handler:](v60, "addLinkWithTitle:handler:", v62, &v74);

        v63 = -[BuddyCloudConfigDisclosureViewController buttonTray](v100, "buttonTray");
        v64 = -[BuddyCloudConfigDisclosureViewController enrollButton](v100, "enrollButton");
        objc_msgSend(v63, "addButton:", v64);

        if ((objc_msgSend(v99[0], "isProvisionallyEnrolled") & 1) != 0)
        {
          v65 = v100;
          v66 = +[NSBundle mainBundle](NSBundle, "mainBundle");
          v67 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("REMOTE_MANAGEMENT_LEAVE"));
          v68 = -[NSBundle localizedStringForKey:value:table:](v66, "localizedStringForKey:value:table:", v67, &stru_100284738, CFSTR("Localizable"));
          -[BuddyWelcomeController addLinkButton:action:](v65, "addLinkButton:action:", v68, "showLeaveRemoteManagementAlert");

        }
        v69 = -[BuddyCloudConfigDisclosureViewController view](v100, "view");
        objc_msgSend(v69, "setNeedsLayout");

        objc_destroyWeak(&v79);
        objc_destroyWeak(&from);
        objc_storeStrong(&v81, 0);
      }
      else
      {
        v70 = -[BuddyCloudConfigDisclosureViewController lastRetrievalError](v100, "lastRetrievalError");

        if (v70)
        {
          v71 = -[BuddyCloudConfigDisclosureViewController configController](v100, "configController");
          -[BuddyCloudConfigController setCloudConfigState:](v71, "setCloudConfigState:", 0);

          -[BuddyCloudConfigDisclosureViewController _setupForCloudConfigurationState](v100, "_setupForCloudConfigurationState");
        }
        else
        {
          v72 = -[BuddyCloudConfigDisclosureViewController configController](v100, "configController");
          -[BuddyCloudConfigController cloudConfigDidFinishFromViewController:wasApplied:](v72, "cloudConfigDidFinishFromViewController:wasApplied:", v100, 0);

        }
      }
      objc_storeStrong(&v82, 0);
      break;
    case 5u:
      +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:](BFFViewControllerSpinnerManager, "stopAnimatingSpinnerFor:", CFSTR("Disclosure"));
      -[BuddyCloudConfigDisclosureViewController _initializeViews](v100, "_initializeViews");
      v21 = -[BuddyCloudConfigDisclosureViewController headerView](v100, "headerView");
      v22 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v23 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("CLOUD_CONFIG_ERROR_FAILED_RETRIEVE_ENTERPRISE_CONFIG"));
      v24 = -[NSBundle localizedStringForKey:value:table:](v22, "localizedStringForKey:value:table:", v23, &stru_100284738, CFSTR("Localizable"));
      v25 = objc_msgSend(v99[0], "cloudConfigurationDetails");
      v26 = objc_msgSend(v25, "objectForKeyedSubscript:", kMCCCOrganizationNameKey);
      v27 = -[BuddyCloudConfigDisclosureViewController lastRetrievalError](v100, "lastRetrievalError");
      v28 = -[NSError localizedDescription](v27, "localizedDescription");
      v29 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v24, v26, v28);
      objc_msgSend(v21, "setDetailText:", v29);

      break;
    default:
      break;
  }
  v73 = -[BuddyCloudConfigDisclosureViewController view](v100, "view");
  objc_msgSend(v73, "setNeedsLayout");

  objc_storeStrong(v99, 0);
}

- (void)_initializeViews
{
  BFFLinkLabelFooterView *v2;
  BFFLinkLabelFooterView *v3;
  BFFLinkLabelFooterView *v4;
  id v5;

  v2 = -[BuddyCloudConfigDisclosureViewController aboutRemoteManagementContentView](self, "aboutRemoteManagementContentView", a2);
  -[BFFLinkLabelFooterView setLabelText:](v2, "setLabelText:", 0);

  v3 = -[BuddyCloudConfigDisclosureViewController aboutRemoteManagementContentView](self, "aboutRemoteManagementContentView");
  -[BFFLinkLabelFooterView setAttributedSubtitleText:](v3, "setAttributedSubtitleText:", 0);

  v4 = -[BuddyCloudConfigDisclosureViewController aboutRemoteManagementContentView](self, "aboutRemoteManagementContentView");
  -[BFFLinkLabelFooterView removeAllLinks](v4, "removeAllLinks");

  v5 = -[BuddyCloudConfigDisclosureViewController buttonTray](self, "buttonTray");
  objc_msgSend(v5, "removeAllButtons");

}

- (void)_presentEraseAlertWithTitle:(id)a3 message:(id)a4 eraseHandler:(id)a5
{
  NSBundle *v7;
  NSString *v8;
  NSBundle *v9;
  NSString *v10;
  id v11;
  UIAlertAction *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id location[2];
  BuddyCloudConfigDisclosureViewController *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v15 = 0;
  objc_storeStrong(&v15, a5);
  v14 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", location[0], v16, 1);
  v7 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v8 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", CFSTR("ERASE"), &stru_100284738, CFSTR("Localizable"));
  v13 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v8, 2, v15);

  objc_msgSend(v14, "addAction:", v13);
  v9 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v10 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_100284738, CFSTR("Localizable"));
  v12 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 1, 0);

  objc_msgSend(v14, "addAction:", v12);
  v11 = -[BuddyCloudConfigDisclosureViewController navigationController](v18, "navigationController");
  objc_msgSend(v11, "presentViewController:animated:completion:", v14, 1, 0);

  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)showLeaveRemoteManagementAlert
{
  id v2;
  NSBundle *v3;
  id v4;
  NSString *v5;
  NSBundle *v6;
  id v7;
  NSString *v8;
  void **v9;
  int v10;
  int v11;
  void (*v12)(id *, void *);
  void *v13;
  id v14[3];
  id location[2];
  id val;

  val = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  v2 = val;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("REMOTE_MANAGEMENT_LEAVE"));
  v5 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", v4, &stru_100284738, CFSTR("Localizable"));
  v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v7 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("REMOTE_MANAGEMENT_LEAVE_REMOTE_MANAGEMENT_ALERT_BODY"));
  v8 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", v7, &stru_100284738, CFSTR("Localizable"));
  v9 = _NSConcreteStackBlock;
  v10 = -1073741824;
  v11 = 0;
  v12 = sub_1001AD7A8;
  v13 = &unk_100280DF0;
  objc_copyWeak(v14, location);
  objc_msgSend(v2, "_presentEraseAlertWithTitle:message:eraseHandler:", v5, v8, &v9);

  objc_destroyWeak(v14);
  objc_destroyWeak(location);
}

- (void)_showEraseDeviceAlert
{
  id v2;
  NSBundle *v3;
  id v4;
  NSString *v5;
  NSBundle *v6;
  NSString *v7;
  void **v8;
  int v9;
  int v10;
  void (*v11)(id *, void *);
  void *v12;
  id v13[3];
  id location[2];
  id val;

  val = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  v2 = val;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("REMOTE_MANAGEMENT_ERASE_ALERT_TITLE"));
  v5 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", v4, &stru_100284738, CFSTR("Localizable"));
  v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v7 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("REMOTE_MANAGEMENT_ERASE_ALERT_BODY"), &stru_100284738, CFSTR("Localizable"));
  v8 = _NSConcreteStackBlock;
  v9 = -1073741824;
  v10 = 0;
  v11 = sub_1001ADA80;
  v12 = &unk_100280DF0;
  objc_copyWeak(v13, location);
  objc_msgSend(v2, "_presentEraseAlertWithTitle:message:eraseHandler:", v5, v7, &v8);

  objc_destroyWeak(v13);
  objc_destroyWeak(location);
}

- (void)showRetrievalError:(id)a3
{
  BuddyCloudConfigController *v3;
  id location[2];
  BuddyCloudConfigDisclosureViewController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyCloudConfigDisclosureViewController setLastRetrievalError:](v5, "setLastRetrievalError:", location[0]);
  v3 = -[BuddyCloudConfigDisclosureViewController configController](v5, "configController");
  -[BuddyCloudConfigController setCloudConfigState:](v3, "setCloudConfigState:", 5);

  -[BuddyCloudConfigDisclosureViewController _setupForCloudConfigurationState](v5, "_setupForCloudConfigurationState");
  objc_storeStrong(location, 0);
}

- (void)_leaveRemoteManagementAndErase
{
  MCProfileConnection *v2;
  void **v3;
  int v4;
  int v5;
  void (*v6)(id *, void *);
  void *v7;
  id v8[3];
  id location[2];
  BuddyCloudConfigDisclosureViewController *v10;

  v10 = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  v2 = -[BuddyCloudConfigDisclosureViewController managedConfiguration](v10, "managedConfiguration");
  v3 = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_1001ADCF4;
  v7 = &unk_1002842C8;
  objc_copyWeak(v8, location);
  -[MCProfileConnection unenrollWithCompletionBlock:](v2, "unenrollWithCompletionBlock:", &v3);

  objc_destroyWeak(v8);
  objc_destroyWeak(location);
}

- (id)_remoteManagementText
{
  MCProfileConnection *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  NSBundle *v7;
  id v8;
  NSString *v9;
  id v10;
  id v11;
  char v13;
  NSString *v14;
  char v15;
  NSBundle *v16;
  id location;
  id v18;
  id v19;
  id v20;
  id v21[3];

  v21[2] = self;
  v21[1] = (id)a2;
  v2 = -[BuddyCloudConfigDisclosureViewController managedConfiguration](self, "managedConfiguration");
  v3 = -[MCProfileConnection cloudConfigurationDetails](v2, "cloudConfigurationDetails");
  v21[0] = objc_msgSend(v3, "objectForKeyedSubscript:", kMCCCOrganizationNameKey);

  v20 = objc_opt_new(NSMutableAttributedString);
  v19 = +[BuddyAppleIDTableHeaderView defaultDetailTextAttributes](BuddyAppleIDTableHeaderView, "defaultDetailTextAttributes");
  v18 = +[BuddyAppleIDTableHeaderView defaultTitleTextAttributes](BuddyAppleIDTableHeaderView, "defaultTitleTextAttributes");
  location = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", CFSTR("\n"), v19);
  v4 = objc_alloc((Class)NSAttributedString);
  v15 = 0;
  v13 = 0;
  if (!v21[0])
  {
    v16 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v15 = 1;
    v14 = -[NSBundle localizedStringForKey:value:table:](v16, "localizedStringForKey:value:table:", CFSTR("UNKNOWN"), &stru_100284738, CFSTR("Localizable"));
    v13 = 1;
  }
  v5 = objc_msgSend(v4, "initWithString:attributes:");
  objc_msgSend(v20, "appendAttributedString:", v5);

  if ((v13 & 1) != 0)
  if ((v15 & 1) != 0)

  objc_msgSend(v20, "appendAttributedString:", location);
  objc_msgSend(v20, "appendAttributedString:", location);
  v6 = objc_alloc((Class)NSMutableAttributedString);
  v7 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v8 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("REMOTE_MANAGEMENT_WHAT_DETAIL"));
  v9 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", v8, &stru_100284738, CFSTR("Localizable"));
  v10 = objc_msgSend(v6, "initWithString:attributes:", v9, v19);
  objc_msgSend(v20, "appendAttributedString:", v10);

  objc_msgSend(v20, "appendAttributedString:", location);
  v11 = v20;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(v21, 0);
  return v11;
}

- (void)loadView
{
  BFFLinkLabelFooterView *v2;
  double v3;
  double v4;
  BFFLinkLabelFooterView *v5;
  BFFLinkLabelFooterView *v6;
  id v7;
  BFFLinkLabelFooterView *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  BFFLinkLabelFooterView *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  BFFLinkLabelFooterView *v18;
  id v19;
  id v20;
  NSArray *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  BFFLinkLabelFooterView *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  BFFLinkLabelFooterView *v31;
  id v32;
  NSLayoutConstraint *v33;
  double v34;
  double v35;
  objc_super v36;
  SEL v37;
  BuddyCloudConfigDisclosureViewController *v38;
  _QWORD v39[5];

  v38 = self;
  v37 = a2;
  v36.receiver = self;
  v36.super_class = (Class)BuddyCloudConfigDisclosureViewController;
  -[BuddyCloudConfigDisclosureViewController loadView](&v36, "loadView");
  v2 = -[BuddyCloudConfigDisclosureViewController aboutRemoteManagementContentView](v38, "aboutRemoteManagementContentView");
  -[BFFLinkLabelFooterView margins](v2, "margins");
  v34 = v3;
  v35 = v4;

  v5 = -[BuddyCloudConfigDisclosureViewController aboutRemoteManagementContentView](v38, "aboutRemoteManagementContentView");
  -[BFFLinkLabelFooterView setMargins:](v5, "setMargins:", v34, 0.0, v35, 0.0);

  v6 = -[BuddyCloudConfigDisclosureViewController aboutRemoteManagementContentView](v38, "aboutRemoteManagementContentView");
  -[BFFLinkLabelFooterView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v7 = -[BuddyCloudConfigDisclosureViewController contentView](v38, "contentView");
  v8 = -[BuddyCloudConfigDisclosureViewController aboutRemoteManagementContentView](v38, "aboutRemoteManagementContentView");
  objc_msgSend(v7, "addSubview:", v8);

  v9 = -[BuddyCloudConfigDisclosureViewController contentView](v38, "contentView");
  v10 = objc_msgSend(v9, "heightAnchor");
  v11 = objc_msgSend(v10, "constraintEqualToConstant:", 0.0);
  -[BuddyCloudConfigDisclosureViewController setContentViewHeightConstraint:](v38, "setContentViewHeightConstraint:", v11);

  v33 = -[BuddyCloudConfigDisclosureViewController contentViewHeightConstraint](v38, "contentViewHeightConstraint");
  v39[0] = v33;
  v32 = -[BuddyCloudConfigDisclosureViewController contentView](v38, "contentView");
  v30 = objc_msgSend(v32, "topAnchor");
  v31 = -[BuddyCloudConfigDisclosureViewController aboutRemoteManagementContentView](v38, "aboutRemoteManagementContentView");
  v29 = -[BFFLinkLabelFooterView topAnchor](v31, "topAnchor");
  v28 = objc_msgSend(v30, "constraintEqualToAnchor:");
  v39[1] = v28;
  v27 = -[BuddyCloudConfigDisclosureViewController contentView](v38, "contentView");
  v25 = objc_msgSend(v27, "leadingAnchor");
  v26 = -[BuddyCloudConfigDisclosureViewController aboutRemoteManagementContentView](v38, "aboutRemoteManagementContentView");
  v24 = -[BFFLinkLabelFooterView leadingAnchor](v26, "leadingAnchor");
  v23 = objc_msgSend(v25, "constraintEqualToAnchor:");
  v39[2] = v23;
  v22 = -[BuddyCloudConfigDisclosureViewController contentView](v38, "contentView");
  v12 = objc_msgSend(v22, "trailingAnchor");
  v13 = -[BuddyCloudConfigDisclosureViewController aboutRemoteManagementContentView](v38, "aboutRemoteManagementContentView");
  v14 = -[BFFLinkLabelFooterView trailingAnchor](v13, "trailingAnchor");
  v15 = objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v39[3] = v15;
  v16 = -[BuddyCloudConfigDisclosureViewController contentView](v38, "contentView");
  v17 = objc_msgSend(v16, "bottomAnchor");
  v18 = -[BuddyCloudConfigDisclosureViewController aboutRemoteManagementContentView](v38, "aboutRemoteManagementContentView");
  v19 = -[BFFLinkLabelFooterView bottomAnchor](v18, "bottomAnchor");
  v20 = objc_msgSend(v17, "constraintEqualToAnchor:", v19);
  v39[4] = v20;
  v21 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 5);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

}

- (void)viewWillAppear:(BOOL)a3
{
  NSError *v3;
  BuddyCloudConfigController *v4;
  id v5;
  unsigned __int8 v6;
  BuddyCloudConfigController *v7;
  objc_super v8;
  BOOL v9;
  SEL v10;
  BuddyCloudConfigDisclosureViewController *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BuddyCloudConfigDisclosureViewController;
  -[BuddyCloudConfigDisclosureViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  if ((-[BuddyCloudConfigDisclosureViewController isBeingPresented](v11, "isBeingPresented") & 1) != 0)
  {
    v3 = -[BuddyCloudConfigDisclosureViewController lastRetrievalError](v11, "lastRetrievalError");

    if (v3)
    {
      v4 = -[BuddyCloudConfigDisclosureViewController configController](v11, "configController");
      -[BuddyCloudConfigController setCloudConfigState:](v4, "setCloudConfigState:", 5);

    }
    else
    {
      v5 = +[BuddyCloudConfigManager sharedManager](BuddyCloudConfigManager, "sharedManager");
      v6 = objc_msgSend(v5, "hasPreviouslyRetrievedMDMv1EnrollmentProfile");

      v7 = -[BuddyCloudConfigDisclosureViewController configController](v11, "configController");
      if ((v6 & 1) != 0)
        -[BuddyCloudConfigController setCloudConfigState:](v7, "setCloudConfigState:", 3);
      else
        -[BuddyCloudConfigController setCloudConfigState:](v7, "setCloudConfigState:", 0);

    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  BuddyCloudConfigDisclosureViewController *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)BuddyCloudConfigDisclosureViewController;
  -[BuddyCloudConfigDisclosureViewController viewWillDisappear:](&v3, "viewWillDisappear:", a3);
  -[BuddyCloudConfigDisclosureViewController setLastRetrievalError:](v6, "setLastRetrievalError:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3;
  BuddyCloudConfigController *v4;
  BuddyCloudConfigController *v5;
  id v6;
  objc_super v7;
  BOOL v8;
  SEL v9;
  BuddyCloudConfigDisclosureViewController *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BuddyCloudConfigDisclosureViewController;
  -[BuddyCloudConfigDisclosureViewController viewDidAppear:](&v7, "viewDidAppear:", a3);
  v3 = -[BuddyCloudConfigDisclosureViewController navigationController](v10, "navigationController");
  v4 = -[BuddyCloudConfigDisclosureViewController configController](v10, "configController");
  -[BuddyCloudConfigController setNavController:](v4, "setNavController:", v3);

  v5 = -[BuddyCloudConfigDisclosureViewController configController](v10, "configController");
  -[BuddyCloudConfigController removeControllersToRemove](v5, "removeControllersToRemove");

  v6 = -[BuddyCloudConfigDisclosureViewController view](v10, "view");
  objc_msgSend(v6, "setNeedsLayout");

  -[BuddyCloudConfigDisclosureViewController _setupForCloudConfigurationState](v10, "_setupForCloudConfigurationState");
}

- (void)viewDidLayoutSubviews
{
  BFFLinkLabelFooterView *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  NSLayoutConstraint *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v18;
  SEL v19;
  BuddyCloudConfigDisclosureViewController *v20;

  v20 = self;
  v19 = a2;
  v18.receiver = self;
  v18.super_class = (Class)BuddyCloudConfigDisclosureViewController;
  -[BuddyCloudConfigDisclosureViewController viewDidLayoutSubviews](&v18, "viewDidLayoutSubviews");
  v2 = -[BuddyCloudConfigDisclosureViewController aboutRemoteManagementContentView](v20, "aboutRemoteManagementContentView");
  v3 = -[BuddyCloudConfigDisclosureViewController contentView](v20, "contentView");
  objc_msgSend(v3, "bounds");
  v15 = v4;
  v14 = v5;
  v17 = v6;
  v16 = v7;
  sub_1001AACD8();
  -[BFFLinkLabelFooterView sizeThatFits:](v2, "sizeThatFits:", v8, v9);
  v11 = v10;
  v13 = -[BuddyCloudConfigDisclosureViewController contentViewHeightConstraint](v20, "contentViewHeightConstraint", v12, *(_QWORD *)&v10, v14, v15, v16, v17);
  -[NSLayoutConstraint setConstant:](v13, "setConstant:", v11);

}

- (void)setConfigController:(id)a3
{
  id location[2];
  BuddyCloudConfigDisclosureViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->_configController, location[0]);
  objc_storeStrong(location, 0);
}

- (void)_retrieveEnterpriseConfiguration
{
  NSObject *v2;
  os_log_type_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  BuddyCloudConfigController *v8;
  os_log_t v9;
  id location;
  uint8_t buf[7];
  os_log_type_t v12;
  os_log_t oslog[2];
  BuddyCloudConfigDisclosureViewController *v14;
  uint8_t v15[24];

  v14 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    v3 = v12;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Retrieving enterprise configuration...", buf, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  v4 = +[MCCloudConfiguration sharedConfiguration](MCCloudConfiguration, "sharedConfiguration");
  location = objc_msgSend(v4, "mdmVersionProtocol");

  v5 = +[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration");
  v6 = objc_msgSend(v5, "enrollmentServerInfo");

  if (v6)
  {
    -[BuddyCloudConfigDisclosureViewController _retrieveEnterpriseConfigurationForManagementVersion2](v14, "_retrieveEnterpriseConfigurationForManagementVersion2");
  }
  else
  {
    v7 = objc_msgSend(location, "integerValue");
    if (v7 == (id)1)
    {
      -[BuddyCloudConfigDisclosureViewController _retrieveEnterpriseConfigurationForManagementVersion1](v14, "_retrieveEnterpriseConfigurationForManagementVersion1");
    }
    else
    {
      v9 = (os_log_t)(id)_BYLoggingFacility(v7);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        sub_100039500((uint64_t)v15, (uint64_t)location);
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unknown management protocol version %{public}@ in enterprise configuration.", v15, 0xCu);
      }
      objc_storeStrong((id *)&v9, 0);
      v8 = -[BuddyCloudConfigDisclosureViewController configController](v14, "configController");
      -[BuddyCloudConfigController setCloudConfigState:](v8, "setCloudConfigState:", 5);

      -[BuddyCloudConfigDisclosureViewController _setupForCloudConfigurationState](v14, "_setupForCloudConfigurationState");
    }
  }
  objc_storeStrong(&location, 0);
}

- (void)_retrieveEnterpriseConfigurationForManagementVersion1
{
  NSObject *v2;
  os_log_type_t v3;
  id v4;
  id v5;
  MCProfileConnection *v6;
  NSNumber *v7;
  NSDictionary *v8;
  id v9;
  void **v10;
  uint64_t v11;
  void (*v12)(id *, void *, void *);
  void *v13;
  BuddyCloudConfigDisclosureViewController *v14;
  id v15;
  int v16;
  id v17;
  id obj;
  id v19;
  id v20;
  id v21;
  uint8_t buf[15];
  os_log_type_t v23;
  id location[2];
  BuddyCloudConfigDisclosureViewController *v25;
  uint64_t v26;
  NSNumber *v27;

  v25 = self;
  location[1] = (id)a2;
  location[0] = (id)_BYLoggingFacility(self);
  v23 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = location[0];
    v3 = v23;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Retrieving enterprise configuration for management protocol version 1...", buf, 2u);
  }
  objc_storeStrong(location, 0);
  +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:identifier:](BFFViewControllerSpinnerManager, "startAnimatingSpinnerFor:identifier:", v25, CFSTR("Disclosure"));
  v21 = -[BuddyCloudConfigDisclosureViewController managedConfiguration](v25, "managedConfiguration");
  v20 = objc_msgSend(v21, "cloudConfigurationDetails");
  v4 = objc_msgSend(v20, "objectForKeyedSubscript:", kMCCCConfigurationWebURLKey);
  v19 = +[NSURL URLWithString:](NSURL, "URLWithString:", v4);

  obj = objc_msgSend(v20, "objectForKeyedSubscript:", kMCCCAnchorCertificatesKey);
  v17 = sub_1001AF45C(obj);
  if (v19)
  {
    -[BuddyCloudConfigDisclosureViewController _retrieveEnterpriseConfigurationFromWebURL:withAnchorCerts:](v25, "_retrieveEnterpriseConfigurationFromWebURL:withAnchorCerts:", v19, v17);
    v16 = 1;
  }
  else
  {
    v5 = objc_msgSend(v20, "objectForKeyedSubscript:", kMCCCConfigurationURLKey);
    v15 = +[NSURL URLWithString:](NSURL, "URLWithString:", v5);

    v6 = -[BuddyCloudConfigDisclosureViewController managedConfiguration](v25, "managedConfiguration");
    v26 = kMDMCanRequestSoftwareUpdateKey;
    v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1);
    v27 = v7;
    v8 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_1001AF694;
    v13 = &unk_1002842F0;
    v14 = v25;
    -[MCProfileConnection retrieveCloudConfigurationFromURL:username:password:anchorCertificates:additionalMachineInfo:completionBlock:](v6, "retrieveCloudConfigurationFromURL:username:password:anchorCertificates:additionalMachineInfo:completionBlock:", v15, 0, 0, v17, v8, &v10);

    v9 = +[BuddyCloudConfigManager sharedManager](BuddyCloudConfigManager, "sharedManager", v10, v11, v12, v13);
    objc_msgSend(v9, "setHasPreviouslyRetrievedMDMv1EnrollmentProfile:", 1);

    objc_storeStrong((id *)&v14, 0);
    objc_storeStrong(&v15, 0);
    v16 = 0;
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&obj, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
}

- (void)_retrieveEnterpriseConfigurationForManagementVersion2
{
  NSObject *v2;
  os_log_type_t v3;
  BuddyEnrollmentCoordinator *v4;
  BuddyCloudConfigDisclosureViewController *v5;
  id v6;
  id v7;
  void **v8;
  int v9;
  int v10;
  void (*v11)(id *, void *, void *);
  void *v12;
  BuddyCloudConfigDisclosureViewController *v13;
  uint8_t buf[7];
  os_log_type_t v15;
  os_log_t oslog[2];
  BuddyCloudConfigDisclosureViewController *v17;

  v17 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v15 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    v3 = v15;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Retrieving enterprise configuration for management protocol version 2...", buf, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:identifier:](BFFViewControllerSpinnerManager, "startAnimatingSpinnerFor:identifier:", v17, CFSTR("Disclosure"));
  v4 = -[BuddyCloudConfigDisclosureViewController enrollmentCoordinator](v17, "enrollmentCoordinator");
  v5 = v17;
  v6 = -[BuddyCloudConfigDisclosureViewController navigationController](v17, "navigationController");
  v8 = _NSConcreteStackBlock;
  v9 = -1073741824;
  v10 = 0;
  v11 = sub_1001AFCD8;
  v12 = &unk_100284318;
  v13 = v17;
  -[BuddyEnrollmentCoordinator retrieveProfileDataWithBaseViewController:navigationController:completionHandler:](v4, "retrieveProfileDataWithBaseViewController:navigationController:completionHandler:", v5, v6, &v8);

  v7 = +[BuddyCloudConfigManager sharedManager](BuddyCloudConfigManager, "sharedManager");
  objc_msgSend(v7, "setHasPreviouslyRetrievedMDMv1EnrollmentProfile:", 1);

  objc_storeStrong((id *)&v13, 0);
}

- (void)_retrieveEnterpriseConfigurationFromWebURL:(id)a3 withAnchorCerts:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id location[2];
  BuddyCloudConfigDisclosureViewController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v8 = objc_opt_new(BuddyCloudConfigWebAuthViewController);
  objc_msgSend(v8, "setModalInPresentation:", 1);
  objc_msgSend(v8, "setWebURL:", location[0]);
  objc_msgSend(v8, "setDelegate:", v11);
  v5 = -[BuddyCloudConfigDisclosureViewController _machineInfo](v11, "_machineInfo");
  objc_msgSend(v8, "setMachineInfo:", v5);

  objc_msgSend(v8, "setAnchorCerts:", v9);
  v6 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v8);
  -[BuddyCloudConfigDisclosureViewController presentModalViewController:withTransition:](v11, "presentModalViewController:withTransition:", v6, 8, v6);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_storeProfileDataAndCompleteDisclosure:(id)a3
{
  MCProfileConnection *v3;
  id v4;
  void **v5;
  int v6;
  int v7;
  void (*v8)(id *, void *);
  void *v9;
  BuddyCloudConfigDisclosureViewController *v10;
  id location[2];
  BuddyCloudConfigDisclosureViewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyCloudConfigDisclosureViewController managedConfiguration](v12, "managedConfiguration");
  v4 = location[0];
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_1001B0458;
  v9 = &unk_100280B80;
  v10 = v12;
  -[MCProfileConnection storeProfileData:completion:](v3, "storeProfileData:completion:", v4, &v5);

  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(location, 0);
}

- (id)_machineInfo
{
  MCProfileConnection *v2;
  NSNumber *v3;
  NSDictionary *v4;
  id v5;
  uint64_t v7;
  NSNumber *v8;

  v2 = -[BuddyCloudConfigDisclosureViewController managedConfiguration](self, "managedConfiguration");
  v7 = kMDMCanRequestSoftwareUpdateKey;
  v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1);
  v8 = v3;
  v4 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v5 = -[MCProfileConnection getMachineInfoWithAdditionalInfo:](v2, "getMachineInfoWithAdditionalInfo:", v4);

  return v5;
}

- (void)webAuthCanceled:(id)a3
{
  NSString *v3;
  BuddyCloudConfigController *v4;
  BuddyCloudConfigController *v5;
  id v6;
  char v7;
  NSString *v8;
  char v9;
  id v10;
  os_log_t oslog;
  id location[2];
  BuddyCloudConfigDisclosureViewController *v13;
  uint8_t buf[24];

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(-[BuddyCloudConfigDisclosureViewController dismissModalViewControllerWithTransition:](v13, "dismissModalViewControllerWithTransition:", 9));
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 0;
    v7 = 0;
    if ((_BYIsInternalInstall() & 1) != 0)
    {
      v3 = (NSString *)location[0];
    }
    else if (location[0])
    {
      v10 = objc_msgSend(location[0], "domain");
      v9 = 1;
      v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v10, objc_msgSend(location[0], "code"));
      v8 = v3;
      v7 = 1;
    }
    else
    {
      v3 = 0;
    }
    sub_100039500((uint64_t)buf, (uint64_t)v3);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Web Auth Canceled with error: %{public}@", buf, 0xCu);
    if ((v7 & 1) != 0)

    if ((v9 & 1) != 0)
  }
  objc_storeStrong((id *)&oslog, 0);
  -[BuddyCloudConfigDisclosureViewController setLastRetrievalError:](v13, "setLastRetrievalError:", location[0]);
  v4 = -[BuddyCloudConfigDisclosureViewController configController](v13, "configController");
  -[BuddyCloudConfigController setCloudConfigState:](v4, "setCloudConfigState:", 5);

  if (sub_1001A9778(location[0]))
  {
    v5 = -[BuddyCloudConfigDisclosureViewController configController](v13, "configController");
    -[BuddyCloudConfigController transitionToSoftwareUpdateControllerFromController:lastError:](v5, "transitionToSoftwareUpdateControllerFromController:lastError:", v13, location[0]);

  }
  else
  {
    v6 = -[BuddyCloudConfigDisclosureViewController view](v13, "view");
    objc_msgSend(v6, "setNeedsLayout");

    -[BuddyCloudConfigDisclosureViewController _setupForCloudConfigurationState](v13, "_setupForCloudConfigurationState");
  }
  objc_storeStrong(location, 0);
}

- (void)recievedProfile:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  BuddyCloudConfigDisclosureViewController *v6;
  id v7;
  void **v8;
  uint64_t v9;
  id (*v10);
  void *v11;
  BuddyCloudConfigDisclosureViewController *v12;
  id v13;
  uint8_t buf[15];
  os_log_type_t v15;
  os_log_t oslog;
  id location[2];
  BuddyCloudConfigDisclosureViewController *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  v15 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = oslog;
    v5 = v15;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Starting web controller dismissal!", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v6 = v18;
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_1001B0BEC;
  v11 = &unk_100280D00;
  v12 = v18;
  v13 = location[0];
  -[BuddyCloudConfigDisclosureViewController dismissViewControllerWithTransition:completion:](v6, "dismissViewControllerWithTransition:completion:", 9, &v8);
  v7 = +[BuddyCloudConfigManager sharedManager](BuddyCloudConfigManager, "sharedManager", v8, v9, v10, v11, v12);
  objc_msgSend(v7, "setHasPreviouslyRetrievedMDMv1EnrollmentProfile:", 1);

  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)controllerDone
{
  BuddyCloudConfigController *v2;
  unsigned int v3;
  BuddyCloudConfigController *v4;

  v2 = -[BuddyCloudConfigDisclosureViewController configController](self, "configController", a2);
  v3 = -[BuddyCloudConfigController cloudConfigState](v2, "cloudConfigState");

  if (v3 == 3)
  {
    v4 = -[BuddyCloudConfigDisclosureViewController configController](self, "configController");
    -[BuddyCloudConfigController setCloudConfigState:](v4, "setCloudConfigState:", 4);

    -[BuddyCloudConfigDisclosureViewController _retrieveEnterpriseConfiguration](self, "_retrieveEnterpriseConfiguration");
  }
}

- (BuddyCloudConfigAboutConfigurationContainerController)aboutConfigurationContainerController
{
  BuddyCloudConfigAboutConfigurationContainerController *v2;
  BuddyCloudConfigAboutConfigurationContainerController *aboutConfigurationContainerController;

  if (!self->_aboutConfigurationContainerController)
  {
    v2 = -[BuddyCloudConfigAboutConfigurationContainerController initWithNibName:bundle:]([BuddyCloudConfigAboutConfigurationContainerController alloc], "initWithNibName:bundle:", 0, 0, a2);
    aboutConfigurationContainerController = self->_aboutConfigurationContainerController;
    self->_aboutConfigurationContainerController = v2;

  }
  return self->_aboutConfigurationContainerController;
}

- (UINavigationController)aboutController
{
  id v2;
  BuddyCloudConfigAboutConfigurationContainerController *v3;
  UINavigationController *v4;
  UINavigationController *aboutController;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!self->_aboutController)
  {
    v2 = objc_alloc((Class)UINavigationController);
    v3 = -[BuddyCloudConfigDisclosureViewController aboutConfigurationContainerController](self, "aboutConfigurationContainerController", a2);
    v4 = (UINavigationController *)objc_msgSend(v2, "initWithRootViewController:", v3);
    aboutController = self->_aboutController;
    self->_aboutController = v4;

    if ((BFFIsiPad(v6, v7) & 1) != 0)
      v8 = 2;
    else
      v8 = 0;
    -[UINavigationController setModalPresentationStyle:](self->_aboutController, "setModalPresentationStyle:", v8);
  }
  return self->_aboutController;
}

- (void)showAboutConfiguration
{
  id v2;
  UINavigationController *v3;

  v2 = -[BuddyCloudConfigDisclosureViewController navigationController](self, "navigationController", a2);
  v3 = -[BuddyCloudConfigDisclosureViewController aboutController](self, "aboutController");
  objc_msgSend(v2, "presentViewController:animated:completion:", v3, 1, 0);

}

- (BuddyEnrollmentCoordinator)enrollmentCoordinator
{
  return self->enrollmentCoordinator;
}

- (void)setEnrollmentCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->enrollmentCoordinator, a3);
}

- (BuddyCloudConfigController)configController
{
  return self->_configController;
}

- (NSError)lastRetrievalError
{
  return self->_lastRetrievalError;
}

- (void)setLastRetrievalError:(id)a3
{
  objc_storeStrong((id *)&self->_lastRetrievalError, a3);
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
  objc_storeStrong((id *)&self->_networkProvider, a3);
}

- (void)setAboutController:(id)a3
{
  objc_storeStrong((id *)&self->_aboutController, a3);
}

- (void)setAboutConfigurationContainerController:(id)a3
{
  objc_storeStrong((id *)&self->_aboutConfigurationContainerController, a3);
}

- (NSLayoutConstraint)contentViewHeightConstraint
{
  return self->_contentViewHeightConstraint;
}

- (void)setContentViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewHeightConstraint, a3);
}

- (BFFLinkLabelFooterView)aboutRemoteManagementContentView
{
  return self->_aboutRemoteManagementContentView;
}

- (void)setAboutRemoteManagementContentView:(id)a3
{
  objc_storeStrong((id *)&self->_aboutRemoteManagementContentView, a3);
}

- (OBBoldTrayButton)enrollButton
{
  return self->_enrollButton;
}

- (void)setEnrollButton:(id)a3
{
  objc_storeStrong((id *)&self->_enrollButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollButton, 0);
  objc_storeStrong((id *)&self->_aboutRemoteManagementContentView, 0);
  objc_storeStrong((id *)&self->_contentViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_aboutConfigurationContainerController, 0);
  objc_storeStrong((id *)&self->_aboutController, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_lastRetrievalError, 0);
  objc_storeStrong((id *)&self->_configController, 0);
  objc_storeStrong((id *)&self->enrollmentCoordinator, 0);
}

@end
