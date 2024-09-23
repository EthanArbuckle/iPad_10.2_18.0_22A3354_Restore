@implementation BuddyCloudConfigLoginViewController

- (BuddyCloudConfigLoginViewController)init
{
  id v2;
  id v3;
  NSBundle *v4;
  NSString *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  NSBundle *v10;
  NSString *v11;
  id v12;
  UIImage *v13;
  id v14;
  double v15;
  double v16;
  NSNotificationCenter *v17;
  NSNotificationCenter *v18;
  BuddyCloudConfigLoginViewController *v19;
  objc_super v21;
  SEL v22;
  id location;

  v22 = a2;
  location = 0;
  v21.receiver = self;
  v21.super_class = (Class)BuddyCloudConfigLoginViewController;
  location = -[SetupChoiceController init](&v21, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = objc_msgSend(location, "tableView");
    objc_msgSend(v2, "setScrollEnabled:", 1);

    v3 = objc_alloc((Class)UIBarButtonItem);
    v4 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v5 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", CFSTR("NEXT"), &stru_100284738, CFSTR("Localizable"));
    v6 = objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 2, location, "retryLogin");
    v7 = (void *)*((_QWORD *)location + 22);
    *((_QWORD *)location + 22) = v6;

    objc_msgSend(*((id *)location + 22), "setEnabled:", 0);
    v8 = objc_msgSend(location, "navigationItem");
    objc_msgSend(v8, "setRightBarButtonItem:", *((_QWORD *)location + 22));

    v9 = location;
    v10 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v11 = -[NSBundle localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", CFSTR("REMOTE_MANAGEMENT_TITLE"), &stru_100284738, CFSTR("Localizable"));
    objc_msgSend(v9, "setTitleText:", v11);

    v12 = objc_msgSend(location, "headerView");
    v13 = +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("gear"));
    objc_msgSend(v12, "setIcon:", v13);

    v14 = objc_msgSend(location, "headerView");
    sub_1001AACD8();
    objc_msgSend(v14, "setIconSize:", v15, v16, *(_QWORD *)&v15, *(_QWORD *)&v16);

    v17 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:](v17, "addObserver:selector:name:object:", location, "keyboardDidShow:", UIKeyboardDidShowNotification, 0);

    v18 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:](v18, "addObserver:selector:name:object:", location, "keyboardWillHide:", UIKeyboardWillHideNotification, 0);

  }
  v19 = (BuddyCloudConfigLoginViewController *)location;
  objc_storeStrong(&location, 0);
  return v19;
}

- (void)dealloc
{
  NSNotificationCenter *v2;
  NSNotificationCenter *v3;
  objc_super v4;
  SEL v5;
  BuddyCloudConfigLoginViewController *v6;

  v6 = self;
  v5 = a2;
  v2 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:](v2, "removeObserver:name:object:", v6, UIKeyboardDidShowNotification, 0);

  v3 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:](v3, "removeObserver:name:object:", v6, UIKeyboardWillHideNotification, 0);

  v4.receiver = v6;
  v4.super_class = (Class)BuddyCloudConfigLoginViewController;
  -[BuddyCloudConfigLoginViewController dealloc](&v4, "dealloc");
}

- (void)clearInput
{
  id v2;
  id v3;

  v2 = -[UITableViewCell editableTextField](self->_usernameCell, "editableTextField", a2);
  objc_msgSend(v2, "setText:", 0);

  v3 = -[UITableViewCell editableTextField](self->_passwordCell, "editableTextField");
  objc_msgSend(v3, "setText:", 0);

  -[BuddyCloudConfigLoginViewController _textChanged:](self, "_textChanged:", 0);
}

- (void)keyboardDidShow:(id)a3
{
  id v3;
  id v4;
  void **v5;
  int v6;
  int v7;
  id (*v8)(uint64_t);
  void *v9;
  BuddyCloudConfigLoginViewController *v10;
  void **v11;
  int v12;
  int v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16[5];
  _QWORD __b[4];
  id location[2];
  BuddyCloudConfigLoginViewController *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  v3 = objc_msgSend(location[0], "userInfo");
  v4 = objc_msgSend(v3, "valueForKey:", UIKeyboardFrameEndUserInfoKey);
  objc_msgSend(v4, "getValue:", __b);

  -[BuddyCloudConfigLoginViewController setDisableExcessiveLayout:](v19, "setDisableExcessiveLayout:", 1);
  v11 = _NSConcreteStackBlock;
  v12 = -1073741824;
  v13 = 0;
  v14 = sub_1001B1A04;
  v15 = &unk_100284340;
  v16[0] = v19;
  v16[1] = (id)__b[0];
  v16[2] = (id)__b[1];
  v16[3] = (id)__b[2];
  v16[4] = (id)__b[3];
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_1001B1C00;
  v9 = &unk_1002808D0;
  v10 = v19;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", &v11, &v5, 0.3);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(v16, 0);
  objc_storeStrong(location, 0);
}

- (void)keyboardWillHide:(id)a3
{
  id v3;
  id v4;
  void **v5;
  int v6;
  int v7;
  id (*v8)(uint64_t);
  void *v9;
  BuddyCloudConfigLoginViewController *v10;
  _BYTE __b[32];
  id location[2];
  BuddyCloudConfigLoginViewController *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  v3 = objc_msgSend(location[0], "userInfo");
  v4 = objc_msgSend(v3, "valueForKey:", UIKeyboardFrameBeginUserInfoKey);
  objc_msgSend(v4, "getValue:", __b);

  -[BuddyCloudConfigLoginViewController setDisableExcessiveLayout:](v13, "setDisableExcessiveLayout:", 0);
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_1001B1D58;
  v9 = &unk_100280730;
  v10 = v13;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", &v5, 0.3);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(location, 0);
}

- (UITableViewCell)usernameCell
{
  BuddyTableViewCell *v2;
  UITableViewCell *usernameCell;
  UILabel *v4;
  NSBundle *v5;
  NSString *v6;
  NSBundle *v7;
  NSString *v8;
  id location[2];
  BuddyCloudConfigLoginViewController *v11;

  v11 = self;
  location[1] = (id)a2;
  if (!self->_usernameCell)
  {
    v2 = -[BuddyTableViewCell initWithStyle:reuseIdentifier:]([BuddyTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1000, 0);
    usernameCell = v11->_usernameCell;
    v11->_usernameCell = &v2->super;

    -[UITableViewCell setSelectionStyle:](v11->_usernameCell, "setSelectionStyle:", 0);
    v4 = -[UITableViewCell textLabel](v11->_usernameCell, "textLabel");
    v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v6 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("CLOUD_CONFIG_LOGIN_USERNAME"), &stru_100284738, CFSTR("Localizable"));
    -[UILabel setText:](v4, "setText:", v6);

    location[0] = -[UITableViewCell editableTextField](v11->_usernameCell, "editableTextField");
    v7 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v8 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", CFSTR("CLOUD_CONFIG_GENERIC_USERNAME"), &stru_100284738, CFSTR("Localizable"));
    objc_msgSend(location[0], "setPlaceholder:", v8);

    objc_msgSend(location[0], "setAutocorrectionType:", 1);
    objc_msgSend(location[0], "setAutocapitalizationType:", 0);
    objc_msgSend(location[0], "setDelegate:", v11);
    objc_msgSend(location[0], "setKeyboardType:", 7);
    objc_msgSend(location[0], "setEnablesReturnKeyAutomatically:", 1);
    objc_storeStrong(location, 0);
  }
  return v11->_usernameCell;
}

- (UITableViewCell)passwordCell
{
  BuddyTableViewCell *v2;
  UITableViewCell *passwordCell;
  UILabel *v4;
  NSBundle *v5;
  NSString *v6;
  NSBundle *v7;
  NSString *v8;
  id location[2];
  BuddyCloudConfigLoginViewController *v11;

  v11 = self;
  location[1] = (id)a2;
  if (!self->_passwordCell)
  {
    v2 = -[BuddyTableViewCell initWithStyle:reuseIdentifier:]([BuddyTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1000, 0);
    passwordCell = v11->_passwordCell;
    v11->_passwordCell = &v2->super;

    -[UITableViewCell setSelectionStyle:](v11->_passwordCell, "setSelectionStyle:", 0);
    v4 = -[UITableViewCell textLabel](v11->_passwordCell, "textLabel");
    v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v6 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("PASSWORD_FIELD"), &stru_100284738, CFSTR("Localizable"));
    -[UILabel setText:](v4, "setText:", v6);

    location[0] = -[UITableViewCell editableTextField](v11->_passwordCell, "editableTextField");
    v7 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v8 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", CFSTR("THIS_FIELD_REQUIRED"), &stru_100284738, CFSTR("Localizable"));
    objc_msgSend(location[0], "setPlaceholder:", v8);

    objc_msgSend(location[0], "setSecureTextEntry:", 1);
    objc_msgSend(location[0], "setAutocorrectionType:", 1);
    objc_msgSend(location[0], "setAutocapitalizationType:", 0);
    objc_msgSend(location[0], "setDelegate:", v11);
    objc_msgSend(location[0], "setEnablesReturnKeyAutomatically:", 1);
    objc_storeStrong(location, 0);
  }
  return v11->_passwordCell;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  BuddyCloudConfigLoginViewController *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)BuddyCloudConfigLoginViewController;
  -[BuddyCloudConfigLoginViewController viewWillAppear:](&v3, "viewWillAppear:", a3);
  -[BuddyCloudConfigLoginViewController _setupForCloudConfigurationState](v6, "_setupForCloudConfigurationState");
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSNotificationCenter *v3;
  objc_super v4;
  BOOL v5;
  SEL v6;
  BuddyCloudConfigLoginViewController *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyCloudConfigLoginViewController;
  -[BuddyCloudConfigLoginViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  v3 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:](v3, "removeObserver:", v7);

}

- (void)viewDidAppear:(BOOL)a3
{
  BuddyCloudConfigController *v3;
  objc_super v4;
  BOOL v5;
  SEL v6;
  BuddyCloudConfigLoginViewController *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyCloudConfigLoginViewController;
  -[SetupChoiceController viewDidAppear:](&v4, "viewDidAppear:", a3);
  v3 = -[BuddyCloudConfigLoginViewController configController](v7, "configController");
  -[BuddyCloudConfigController removeControllersToRemove](v3, "removeControllersToRemove");

}

- (void)viewDidLayoutSubviews
{
  objc_super v2;
  SEL v3;
  BuddyCloudConfigLoginViewController *v4;

  v4 = self;
  v3 = a2;
  if (!-[BuddyCloudConfigLoginViewController disableExcessiveLayout](self, "disableExcessiveLayout"))
  {
    v2.receiver = v4;
    v2.super_class = (Class)BuddyCloudConfigLoginViewController;
    -[SetupChoiceController viewDidLayoutSubviews](&v2, "viewDidLayoutSubviews");
    -[BuddyCloudConfigLoginViewController _layoutTableView](v4, "_layoutTableView");
  }
}

- (void)_layoutTableView
{
  UITableView *v2;
  id v3;
  id v4;
  UITableView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UITableView *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v2 = -[BuddyTableViewController tableView](self, "tableView");
  -[UITableView sizeToFit](v2, "sizeToFit");

  v3 = -[BuddyCloudConfigLoginViewController navigationController](self, "navigationController");
  v4 = objc_msgSend(v3, "navigationBar");
  objc_msgSend(v4, "frame");

  v5 = -[BuddyTableViewController tableView](self, "tableView");
  -[UITableView frame](v5, "frame");

  sub_1001B2518(self);
  sub_1001AAD0C();
  v12 = v6;
  v11 = v7;
  v14 = v8;
  v13 = v9;
  v10 = -[BuddyTableViewController tableView](self, "tableView");
  -[UITableView setFrame:](v10, "setFrame:", v11, v12, v13, v14, *(_QWORD *)&v11, *(_QWORD *)&v12, *(_QWORD *)&v13, *(_QWORD *)&v14);

}

- (void)setLastError:(id)a3
{
  id location[2];
  BuddyCloudConfigLoginViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->_lastError, location[0]);
  -[BuddyCloudConfigLoginViewController _setupForCloudConfigurationState](v4, "_setupForCloudConfigurationState");
  objc_storeStrong(location, 0);
}

- (void)_setupForCloudConfigurationState
{
  BuddyCloudConfigController *v2;
  unsigned int v3;
  NSError *v4;
  NSDictionary *v5;
  id v6;
  MCProfileConnection *v7;
  id v8;
  id v9;
  NSBundle *v10;
  NSString *v11;
  NSString *v12;
  id v13;
  NSNotificationCenter *v14;
  NSNotificationCenter *v15;
  UITableViewCell *v16;
  id v17;
  id v18;
  id v19;
  UITableViewCell *v20;
  id v21;
  id location;
  id v23[2];
  BuddyCloudConfigLoginViewController *v24;

  v24 = self;
  v23[1] = (id)a2;
  v2 = -[BuddyCloudConfigLoginViewController configController](self, "configController");
  v3 = -[BuddyCloudConfigController cloudConfigState](v2, "cloudConfigState");

  switch(v3)
  {
    case 6u:
      +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:](BFFViewControllerSpinnerManager, "stopAnimatingSpinnerFor:", CFSTR("Login"));
      v4 = -[BuddyCloudConfigLoginViewController lastError](v24, "lastError");
      v5 = -[NSError userInfo](v4, "userInfo");
      v23[0] = -[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", kMCErrorLoginPromptKey);

      if (objc_msgSend(v23[0], "length"))
      {
        v6 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v23[0]);
        -[BuddyTableViewController setAttributedSubTitleText:](v24, "setAttributedSubTitleText:", v6);

      }
      else
      {
        v7 = -[BuddyCloudConfigLoginViewController managedConfiguration](v24, "managedConfiguration");
        v8 = -[MCProfileConnection cloudConfigurationDetails](v7, "cloudConfigurationDetails");
        location = objc_msgSend(v8, "objectForKeyedSubscript:", kMCCCOrganizationNameKey);

        v9 = objc_alloc((Class)NSAttributedString);
        v10 = +[NSBundle mainBundle](NSBundle, "mainBundle");
        v11 = -[NSBundle localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", CFSTR("CLOUD_CONFIG_LOGIN_PROMPT_%@"), &stru_100284738, CFSTR("Localizable"));
        v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, location);
        v13 = objc_msgSend(v9, "initWithString:", v12);
        -[BuddyTableViewController setAttributedSubTitleText:](v24, "setAttributedSubTitleText:", v13);

        objc_storeStrong(&location, 0);
      }
      v14 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
      -[NSNotificationCenter removeObserver:name:object:](v14, "removeObserver:name:object:", v24, UITextFieldTextDidChangeNotification, 0);

      v15 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
      -[NSNotificationCenter addObserver:selector:name:object:](v15, "addObserver:selector:name:object:", v24, "_textChanged:", UITextFieldTextDidChangeNotification, 0);

      v16 = -[BuddyCloudConfigLoginViewController usernameCell](v24, "usernameCell");
      v17 = -[UITableViewCell editableTextField](v16, "editableTextField");
      v18 = objc_msgSend(v17, "text");
      v19 = objc_msgSend(v18, "length");

      if (v19)
        v20 = -[BuddyCloudConfigLoginViewController passwordCell](v24, "passwordCell");
      else
        v20 = -[BuddyCloudConfigLoginViewController usernameCell](v24, "usernameCell");
      v21 = -[UITableViewCell editableTextField](v20, "editableTextField");
      objc_msgSend(v21, "becomeFirstResponder");

      objc_storeStrong(v23, 0);
      break;
    case 7u:
      +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:identifier:](BFFViewControllerSpinnerManager, "startAnimatingSpinnerFor:identifier:", v24, CFSTR("Login"));
      break;
    default:
      return;
  }
}

- (void)_textChanged:(id)a3
{
  UITableViewCell *v3;
  id v4;
  id v5;
  BOOL v6;
  char v7;
  id v8;
  char v9;
  id v10;
  char v11;
  UITableViewCell *v12;
  id location[2];
  BuddyCloudConfigLoginViewController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyCloudConfigLoginViewController passwordCell](v14, "passwordCell");
  v4 = -[UITableViewCell editableTextField](v3, "editableTextField");
  v5 = objc_msgSend(v4, "text");
  v11 = 0;
  v9 = 0;
  v7 = 0;
  v6 = 0;
  if (objc_msgSend(v5, "length"))
  {
    v12 = -[BuddyCloudConfigLoginViewController usernameCell](v14, "usernameCell");
    v11 = 1;
    v10 = -[UITableViewCell editableTextField](v12, "editableTextField");
    v9 = 1;
    v8 = objc_msgSend(v10, "text");
    v7 = 1;
    v6 = objc_msgSend(v8, "length") != 0;
  }
  if ((v7 & 1) != 0)

  if ((v9 & 1) != 0)
  if ((v11 & 1) != 0)

  if (v6)
    -[UIBarButtonItem setEnabled:](v14->_nextButton, "setEnabled:", 1);
  else
    -[UIBarButtonItem setEnabled:](v14->_nextButton, "setEnabled:", 0);
  objc_storeStrong(location, 0);
}

- (id)_sanitizedUsername:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  __CFString *v7;
  __CFString *v8;
  id v10;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  if (location[0])
  {
    v3 = objc_msgSend(location[0], "stringByApplyingTransform:reverse:", NSStringTransformToLatin, 0);
    v4 = v10;
    v10 = v3;

    if ((unint64_t)objc_msgSend(v10, "length") > 0xFF)
    {
      v5 = objc_msgSend(v10, "substringToIndex:", 255);
      v6 = v10;
      v10 = v5;

    }
  }
  v7 = (__CFString *)v10;
  if (!v10)
    v7 = &stru_100284738;
  v8 = v7;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (void)retryLogin
{
  BuddyCloudConfigController *v2;
  UIApplication *v3;
  UITableViewCell *v4;
  id v5;
  UITableViewCell *v6;
  id v7;
  void *v8;
  void **block;
  int v10;
  int v11;
  void (*v12)(id *);
  void *v13;
  BuddyCloudConfigLoginViewController *v14;
  dispatch_time_t v15;
  double v16;
  SEL v17;
  BuddyCloudConfigLoginViewController *v18;

  v18 = self;
  v17 = a2;
  v2 = -[BuddyCloudConfigLoginViewController configController](self, "configController");
  -[BuddyCloudConfigController setCloudConfigState:](v2, "setCloudConfigState:", 7);

  -[BuddyCloudConfigLoginViewController _setupForCloudConfigurationState](v18, "_setupForCloudConfigurationState");
  v3 = +[UIApplication sharedApplication](UIApplication, "sharedApplication");
  -[UIApplication beginIgnoringInteractionEvents](v3, "beginIgnoringInteractionEvents");

  v4 = -[BuddyCloudConfigLoginViewController usernameCell](v18, "usernameCell");
  v5 = -[UITableViewCell editableTextField](v4, "editableTextField");
  objc_msgSend(v5, "setEnabled:", 0);

  v6 = -[BuddyCloudConfigLoginViewController passwordCell](v18, "passwordCell");
  v7 = -[UITableViewCell editableTextField](v6, "editableTextField");
  objc_msgSend(v7, "setEnabled:", 0);

  +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:identifier:](BFFViewControllerSpinnerManager, "startAnimatingSpinnerFor:identifier:", v18, CFSTR("Login"));
  v16 = 2.0;
  v15 = dispatch_time(0, (uint64_t)(2.0 * 1000000000.0));
  v8 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v10 = -1073741824;
  v11 = 0;
  v12 = sub_1001B3014;
  v13 = &unk_100280730;
  v14 = v18;
  dispatch_after(v15, (dispatch_queue_t)v8, &block);

  objc_storeStrong((id *)&v14, 0);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 2;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  id v7;
  id location[2];
  BuddyCloudConfigLoginViewController *v9;
  UITableViewCell *v10;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v5 = objc_msgSend(v7, "row");
  if (v5)
  {
    if (v5 == (id)1)
      v10 = -[BuddyCloudConfigLoginViewController passwordCell](v9, "passwordCell");
  }
  else
  {
    v10 = -[BuddyCloudConfigLoginViewController usernameCell](v9, "usernameCell");
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id location[2];
  BuddyCloudConfigLoginViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyCloudConfigLoginViewController setActiveTextField:](v4, "setActiveTextField:", location[0]);
  objc_storeStrong(location, 0);
}

- (void)textFieldDidEndEditing:(id)a3
{
  id location[2];
  BuddyCloudConfigLoginViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyCloudConfigLoginViewController setActiveTextField:](v4, "setActiveTextField:", 0);
  objc_storeStrong(location, 0);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v3;
  UITableViewCell *v4;
  id v5;
  id v6;
  id v7;
  UITableViewCell *v8;
  id v9;
  id v10;
  id v11;
  char v13;
  id location[2];
  BuddyCloudConfigLoginViewController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  v3 = location[0];
  v4 = -[BuddyCloudConfigLoginViewController usernameCell](v15, "usernameCell");
  v5 = -[UITableViewCell editableTextField](v4, "editableTextField");

  if (v3 == v5)
  {
    v6 = -[UITableViewCell editableTextField](v15->_passwordCell, "editableTextField");
    objc_msgSend(v6, "becomeFirstResponder");

  }
  else
  {
    v7 = location[0];
    v8 = -[BuddyCloudConfigLoginViewController passwordCell](v15, "passwordCell");
    v9 = -[UITableViewCell editableTextField](v8, "editableTextField");

    if (v7 == v9)
    {
      v10 = objc_msgSend(location[0], "text");
      v11 = objc_msgSend(v10, "length");

      if (v11)
      {
        v13 = 1;
        -[BuddyCloudConfigLoginViewController retryLogin](v15, "retryLogin");
      }
    }
  }
  objc_storeStrong(location, 0);
  return v13 & 1;
}

- (BuddyCloudConfigController)configController
{
  return (BuddyCloudConfigController *)objc_loadWeakRetained((id *)&self->_configController);
}

- (void)setConfigController:(id)a3
{
  objc_storeWeak((id *)&self->_configController, a3);
}

- (NSError)lastError
{
  return self->_lastError;
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (void)setUsernameCell:(id)a3
{
  objc_storeStrong((id *)&self->_usernameCell, a3);
}

- (void)setPasswordCell:(id)a3
{
  objc_storeStrong((id *)&self->_passwordCell, a3);
}

- (UIBarButtonItem)nextButton
{
  return self->_nextButton;
}

- (void)setNextButton:(id)a3
{
  objc_storeStrong((id *)&self->_nextButton, a3);
}

- (UITextField)activeTextField
{
  return self->_activeTextField;
}

- (void)setActiveTextField:(id)a3
{
  objc_storeStrong((id *)&self->_activeTextField, a3);
}

- (BOOL)disableExcessiveLayout
{
  return self->_disableExcessiveLayout;
}

- (void)setDisableExcessiveLayout:(BOOL)a3
{
  self->_disableExcessiveLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTextField, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_passwordCell, 0);
  objc_storeStrong((id *)&self->_usernameCell, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_destroyWeak((id *)&self->_configController);
}

@end
