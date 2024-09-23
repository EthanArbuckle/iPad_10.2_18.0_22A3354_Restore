@implementation SUSUIScheduleUpdateViewController

- (SUSUIScheduleUpdateViewController)initWithDescriptor:(id)a3
{
  SUSUIScheduleUpdateViewController *v4;
  id v5;
  NSString *v6;
  NSBundle *v7;
  id v8;
  id v9;
  NSString *v10;
  NSBundle *v11;
  id v12;
  SUSUIScheduleUpdateViewController *v13;
  SUSUIScheduleUpdateViewController *v14;
  id v15;
  NSString *v16;
  id v17;
  NSBundle *v18;
  NSString *v19;
  id v20;
  id v21;
  id v22;
  NSString *v23;
  NSBundle *v24;
  id v25;
  id v26;
  objc_super v27;
  id location[2];
  SUSUIScheduleUpdateViewController *v29;

  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v29->_descriptor, location[0]);
  v13 = v29;
  v24 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v23 = -[NSBundle localizedStringForKey:value:table:](v24, "localizedStringForKey:value:table:", CFSTR("SCHEDULE_UPDATE_SCREEN_TITLE"));
  v22 = objc_msgSend(location[0], "productSystemName");
  v21 = objc_msgSend(location[0], "productVersion");
  v20 = +[SUSUIScheduleUpdateViewController majorOSVersionStringForBuildVersion:](SUSUIScheduleUpdateViewController, "majorOSVersionStringForBuildVersion:");
  v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v22, v20);
  v18 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v17 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("SCHEDULE_UPDATE_DESCRIPTION"));
  v16 = -[NSBundle localizedStringForKey:value:table:](v18, "localizedStringForKey:value:table:");
  v15 = -[SUSUIScheduleUpdateViewController updateIcon](v29, "updateIcon");
  v29 = 0;
  v27.receiver = v13;
  v27.super_class = (Class)SUSUIScheduleUpdateViewController;
  v14 = -[SUSUIScheduleUpdateViewController initWithTitle:detailText:icon:](&v27, "initWithTitle:detailText:icon:", v19, v16);
  v29 = v14;
  objc_storeStrong((id *)&v29, v14);

  if (v14)
  {
    v26 = +[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton");
    v5 = v26;
    v7 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v6 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", CFSTR("SCHEDULE_UPDATE_UPDATE_NOW_BUTTON"));
    objc_msgSend(v5, "setTitle:forState:");

    objc_msgSend(v26, "addTarget:action:forControlEvents:", v29, "handleUpdateNowButtonTapped:");
    v8 = -[SUSUIScheduleUpdateViewController buttonTray](v29, "buttonTray");
    objc_msgSend(v8, "addButton:", v26);

    v25 = +[OBLinkTrayButton linkButton](OBLinkTrayButton, "linkButton");
    v9 = v25;
    v11 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v10 = -[NSBundle localizedStringForKey:value:table:](v11, "localizedStringForKey:value:table:", CFSTR("SCHEDULE_UPDATE_UPDATE_TONIGHT_BUTTON"), &stru_1000156E8, CFSTR("SoftwareUpdateUIService"));
    objc_msgSend(v9, "setTitle:forState:");

    objc_msgSend(v25, "addTarget:action:forControlEvents:", v29, "handleUpdateTonightButtonTapped:", 64);
    v12 = -[SUSUIScheduleUpdateViewController buttonTray](v29, "buttonTray");
    objc_msgSend(v12, "addButton:", v25);

    -[SUSUIScheduleUpdateViewController becomeFirstResponder](v29, "becomeFirstResponder");
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
  }
  v4 = v29;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v29, 0);
  return v4;
}

- (void)handleUpdateNowButtonTapped:(id)a3
{
  os_log_t oslog;
  id location[2];
  SUSUIScheduleUpdateViewController *v5;
  uint8_t v6[24];

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)SUSUILogLaggardsUI();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000061C4((uint64_t)v6, (uint64_t)"-[SUSUIScheduleUpdateViewController handleUpdateNowButtonTapped:]");
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s: Tapped on the update now button", v6, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[SUSUIScheduleUpdateViewController performUpdateNow](v5, "performUpdateNow");
  objc_storeStrong(location, 0);
}

- (void)handleUpdateTonightButtonTapped:(id)a3
{
  os_log_t oslog;
  id location[2];
  SUSUIScheduleUpdateViewController *v5;
  uint8_t v6[24];

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)SUSUILogLaggardsUI();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000061C4((uint64_t)v6, (uint64_t)"-[SUSUIScheduleUpdateViewController handleUpdateTonightButtonTapped:]");
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s: Tapped on the update tonight button", v6, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[SUSUIScheduleUpdateViewController performUpdateTonight](v5, "performUpdateTonight");
  objc_storeStrong(location, 0);
}

- (void)handleCancelButtonTapped:(id)a3
{
  os_log_t oslog;
  id location[3];
  uint8_t v5[24];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)SUSUILogLaggardsUI();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000061C4((uint64_t)v5, (uint64_t)"-[SUSUIScheduleUpdateViewController handleCancelButtonTapped:]");
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s: Tapped on the cancel button", v5, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(location, 0);
}

- (void)cancellationDialogRemindMeLaterButtonTapped:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (id)updateIcon
{
  UIImage *v2;
  id v4;
  id v5;
  char v6;
  UIImage *v7;
  char v8;
  id v9;
  char v10;
  id v11;
  UIImage *v13;

  v4 = -[SUDescriptor documentation](self->_descriptor, "documentation");
  v5 = objc_msgSend(v4, "iconImage");
  v10 = 0;
  v8 = 0;
  v6 = 0;
  if (v5)
  {
    v11 = -[SUDescriptor documentation](self->_descriptor, "documentation");
    v10 = 1;
    v9 = objc_msgSend(v11, "iconImage");
    v8 = 1;
    v2 = (UIImage *)v9;
  }
  else
  {
    v7 = +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("gear"), 0);
    v6 = 1;
    v2 = v7;
  }
  v13 = v2;
  if ((v6 & 1) != 0)

  if ((v8 & 1) != 0)
  if ((v10 & 1) != 0)

  return v13;
}

+ (id)majorOSVersionStringForBuildVersion:(id)a3
{
  id v3;
  id v4;
  id v6;
  id v7;
  id v8;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  if (location[0])
  {
    v7 = objc_msgSend(location[0], "componentsSeparatedByString:", CFSTR("."));
    v3 = objc_msgSend(v7, "firstObject");
    v4 = v8;
    v8 = v3;

  }
  v6 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (void)performUpdateNow
{
  void **v3;
  int v4;
  int v5;
  void (*v6)(id *);
  void *v7;
  id v8[3];

  v8[2] = self;
  v8[1] = (id)a2;
  v3 = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_100006780;
  v7 = &unk_100014528;
  v8[0] = self;
  -[SUSUIScheduleUpdateViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1);
  objc_storeStrong(v8, 0);
}

- (void)performUpdateTonight
{
  id v2;
  id v3;
  NSObject *log;
  os_log_type_t type;
  id v6;
  id v7;
  os_log_type_t v8;
  id v9[2];
  SUSUIScheduleUpdateViewController *v10;
  uint8_t v11[24];

  v10 = self;
  v9[1] = (id)a2;
  v9[0] = (id)SUSUILogLaggardsUI();
  v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v9[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v9[0];
    type = v8;
    v6 = -[SUSUIScheduleUpdateViewController buildSUSettingsAction:](v10, "buildSUSettingsAction:", 1);
    v7 = v6;
    sub_100006914((uint64_t)v11, (uint64_t)"-[SUSUIScheduleUpdateViewController performUpdateTonight]", (uint64_t)v7);
    _os_log_impl((void *)&_mh_execute_header, log, type, "%s: Opening the Software Update Settings pane with URL: %@", v11, 0x16u);

    objc_storeStrong(&v7, 0);
  }
  objc_storeStrong(v9, 0);
  v3 = +[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace");
  v2 = -[SUSUIScheduleUpdateViewController buildSUSettingsAction:](v10, "buildSUSettingsAction:", 2);
  objc_msgSend(v3, "openSensitiveURL:withOptions:");

  -[SUSUIScheduleUpdateViewController dismissViewControllerAnimated:completion:](v10, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)buildSUSettingsAction:(unint64_t)a3
{
  NSString *v4;
  id location[4];
  NSURL *v6;

  location[3] = self;
  location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  if (a3 == 1)
  {
    objc_storeStrong(location, CFSTR("SUSUIUpdateNowAction"));
LABEL_6:
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("prefs:root=General&path=SOFTWARE_UPDATE_LINK&PerformAction=%@"), location[0]);
    v6 = +[NSURL URLWithString:](NSURL, "URLWithString:");

    goto LABEL_7;
  }
  if (a3 == 2)
  {
    objc_storeStrong(location, CFSTR("SUSUIUpdateTonightAction"));
    goto LABEL_6;
  }
  v6 = 0;
LABEL_7:
  objc_storeStrong(location, 0);
  return v6;
}

- (void)remoteLaggardsUIHostingControllerWillCancelOperation:(id)a3 withCompletionBlock:(id)a4
{
  NSString *v5;
  id v6;
  NSBundle *v7;
  NSString *v8;
  NSBundle *v9;
  NSString *v10;
  NSBundle *v11;
  UIAlertController *v12;
  UIAlertAction *v13;
  NSString *v14;
  NSBundle *v15;
  void **v16;
  int v17;
  int v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  SUSUIScheduleUpdateViewController *v21;
  id v22[2];
  int v23;
  int v24;
  void (*v25)(_QWORD *, void *);
  void *v26;
  id v27;
  UIAlertAction *v28;
  UIAlertController *v29;
  id v30;
  id location[2];
  SUSUIScheduleUpdateViewController *v32;

  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = 0;
  objc_storeStrong(&v30, a4);
  v9 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v8 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("SCHEDULE_UPDATE_CANCELLATION_TITLE"));
  v7 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v6 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("SCHEDULE_UPDATE_CANCELLATION_DESCRIPTION"));
  v5 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:");
  v29 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v8);

  v11 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v10 = -[NSBundle localizedStringForKey:value:table:](v11, "localizedStringForKey:value:table:", CFSTR("SCHEDULE_UPDATE_CANCELLATION_UPDATE_BUTTON"), &stru_1000156E8, CFSTR("SoftwareUpdateUIService"));
  v22[1] = _NSConcreteStackBlock;
  v23 = -1073741824;
  v24 = 0;
  v25 = sub_100007014;
  v26 = &unk_100014A00;
  v27 = v30;
  v28 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10);

  -[UIAlertController addAction:](v29, "addAction:", v28);
  v12 = v29;
  v15 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v14 = -[NSBundle localizedStringForKey:value:table:](v15, "localizedStringForKey:value:table:", CFSTR("SCHEDULE_UPDATE_CANCELLATION_UPDATE_REMIND_ME"), &stru_1000156E8, CFSTR("SoftwareUpdateUIService"));
  v16 = _NSConcreteStackBlock;
  v17 = -1073741824;
  v18 = 0;
  v19 = sub_100007078;
  v20 = &unk_100014A28;
  v21 = v32;
  v22[0] = v30;
  v13 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 0);
  -[UIAlertController addAction:](v12, "addAction:");

  -[UIAlertController setPreferredAction:](v29, "setPreferredAction:", v28);
  -[SUSUIScheduleUpdateViewController presentViewController:animated:completion:](v32, "presentViewController:animated:completion:", v29, 1, 0);
  objc_storeStrong(v22, 0);
  objc_storeStrong((id *)&v21, 0);
  objc_storeStrong((id *)&v28, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong((id *)&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
