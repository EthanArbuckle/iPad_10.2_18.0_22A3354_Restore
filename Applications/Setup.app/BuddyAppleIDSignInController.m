@implementation BuddyAppleIDSignInController

+ (id)federatedAuthSignInControllerInNavigationController:(id)a3 mode:(int)a4 passcodeCacheManager:(id)a5
{
  BuddyAppleIDSignInController *v7;
  id v8;
  id v9;
  void **v11;
  int v12;
  int v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;
  id v18;
  unsigned int v19;
  id from;
  id v21;
  id v22;
  unsigned int v23;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = a4;
  v22 = 0;
  objc_storeStrong(&v22, a5);
  v7 = [BuddyAppleIDSignInController alloc];
  v21 = -[BuddyAppleIDSignInController initWithMode:](v7, "initWithMode:", v23);
  objc_initWeak(&from, v21);
  v8 = v21;
  v11 = _NSConcreteStackBlock;
  v12 = -1073741824;
  v13 = 0;
  v14 = sub_10010D57C;
  v15 = &unk_100283020;
  objc_copyWeak(&v18, &from);
  v16 = location[0];
  v17 = v22;
  v19 = v23;
  objc_msgSend(v8, "setAuthModeHandler:", &v11);
  v9 = v21;
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  return v9;
}

- (BuddyAppleIDSignInController)initWithMode:(int)a3
{
  id v4;
  id v5;
  NSObject *v6;
  BuddyAppleIDSignInController *v7;
  void **block;
  int v10;
  int v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  unsigned int v15;
  objc_super v16;
  unsigned int v17;
  SEL v18;
  id location;

  location = self;
  v18 = a2;
  v17 = a3;
  v4 = -[BuddyAppleIDSignInController _titleTextForAuthMode:](self, "_titleTextForAuthMode:", a3);
  v5 = objc_msgSend(location, "_subtitleTextForMode:", v17);
  location = 0;
  v16.receiver = self;
  v16.super_class = (Class)BuddyAppleIDSignInController;
  location = -[BuddyAppleIDSignInController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v16, "initWithTitle:detailText:icon:adoptTableViewScrollView:", v4, v5, 0, 1);
  objc_storeStrong(&location, location);

  if (location)
  {
    *((_DWORD *)location + 10) = v17;
    *((_BYTE *)location + 49) = 1;
    *((_BYTE *)location + 45) = 1;
    *((_BYTE *)location + 46) = 0;
    *((_BYTE *)location + 47) = 1;
    v6 = dispatch_get_global_queue(25, 0);
    block = _NSConcreteStackBlock;
    v10 = -1073741824;
    v11 = 0;
    v12 = sub_10010D9A4;
    v13 = &unk_100282728;
    v15 = v17;
    v14 = location;
    dispatch_async(v6, &block);

    objc_storeStrong(&v14, 0);
  }
  v7 = (BuddyAppleIDSignInController *)location;
  objc_storeStrong(&location, 0);
  return v7;
}

- (void)dealloc
{
  NSNotificationCenter *v2;
  objc_super v3;
  SEL v4;
  BuddyAppleIDSignInController *v5;

  v5 = self;
  v4 = a2;
  v2 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:](v2, "removeObserver:", v5);

  v3.receiver = v5;
  v3.super_class = (Class)BuddyAppleIDSignInController;
  -[BuddyAppleIDSignInController dealloc](&v3, "dealloc");
}

- (id)_titleText
{
  return -[BuddyAppleIDSignInController _titleTextForAuthMode:](self, "_titleTextForAuthMode:", self->_mode, a2, self);
}

- (id)_titleTextForAuthMode:(int)a3
{
  NSBundle *v3;
  NSBundle *v4;
  NSBundle *v5;
  NSBundle *v6;
  NSBundle *v7;
  NSBundle *v8;
  NSString *v10;

  switch(a3)
  {
    case 1:
    case 4:
      v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyAppleIDSignInController));
      v10 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("APPLE_ID_TITLE"), &stru_100284738, CFSTR("AppleIDAuth"));

      break;
    case 2:
      v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyAppleIDSignInController));
      v10 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("TWO_ACCOUNTS_ICLOUD_SIGN_IN_TITLE"), &stru_100284738, CFSTR("AppleIDAuth"));

      break;
    case 3:
      v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyAppleIDSignInController));
      v10 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("TWO_ACCOUNTS_ITUNES_SIGN_IN_TITLE"), &stru_100284738, CFSTR("AppleIDAuth"));

      break;
    case 5:
      v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyAppleIDSignInController));
      v10 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", CFSTR("ICLOUD_TITLE"), &stru_100284738, CFSTR("AppleIDAuth"));

      break;
    case 6:
      v10 = 0;
      break;
    case 7:
      v7 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyAppleIDSignInController));
      v10 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", CFSTR("SOFTWARE_UPDATE_SIGN_IN_TITLE"), &stru_100284738, CFSTR("AppleIDAuth"));

      break;
    case 8:
      v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyAppleIDSignInController));
      v10 = -[NSBundle localizedStringForKey:value:table:](v8, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_WORK_ACCOUNT"), &stru_100284738, CFSTR("AppleIDAuth"));

      break;
    default:
      return v10;
  }
  return v10;
}

- (id)stringWithUsernameFormattedIntoString:(id)a3
{
  id v3;
  NSString *v4;
  NSString *v5;
  uint64_t v6;
  NSString *v7;
  id v8;
  id v9;
  UIFont *v10;
  NSDictionary *v11;
  id v12;
  id v13;
  id v14;
  NSString *v15;
  id v16;
  uint64_t v17;
  id v18;
  NSString *v19;
  id v20;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  char v26;
  id v27;
  char v28;
  id v29;
  os_log_type_t v30;
  os_log_t oslog;
  id obj;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id location[2];
  BuddyAppleIDSignInController *v39;
  _QWORD v40[2];
  _QWORD v41[2];
  uint8_t buf[24];

  v39 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v37 = 0;
  if (objc_msgSend(location[0], "length"))
  {
    v36 = objc_alloc_init((Class)NSMutableParagraphStyle);
    objc_msgSend(v36, "setAlignment:", 1);
    objc_msgSend(v36, "setLineBreakMode:", 0);
    v35 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleCallout);
    v34 = 0;
    v3 = location[0];
    obj = 0;
    v4 = -[BuddyAppleIDSignInController username](v39, "username");
    v5 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v3, CFSTR("%@"), &obj, v4);
    objc_storeStrong(&v34, obj);
    v33 = v5;

    if (!v33)
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v6);
      v30 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        v28 = 0;
        v26 = 0;
        if ((_BYIsInternalInstall() & 1) != 0)
        {
          v7 = (NSString *)v34;
        }
        else if (v34)
        {
          v29 = objc_msgSend(v34, "domain");
          v28 = 1;
          v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v29, objc_msgSend(v34, "code"));
          v27 = v7;
          v26 = 1;
        }
        else
        {
          v7 = 0;
        }
        sub_100039500((uint64_t)buf, (uint64_t)v7);
        _os_log_error_impl((void *)&_mh_execute_header, oslog, v30, "Failed to format username into string: %{public}@", buf, 0xCu);
        if ((v26 & 1) != 0)

        if ((v28 & 1) != 0)
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    v8 = objc_alloc((Class)NSMutableAttributedString);
    v9 = v33;
    v40[0] = NSParagraphStyleAttributeName;
    v41[0] = v36;
    v40[1] = NSFontAttributeName;
    v10 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v35, 0.0);
    v41[1] = v10;
    v11 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
    v12 = objc_msgSend(v8, "initWithString:attributes:", v9, v11);
    v13 = v37;
    v37 = v12;

    v14 = objc_msgSend(v37, "string");
    v15 = -[BuddyAppleIDSignInController username](v39, "username");
    v16 = objc_msgSend(v14, "rangeOfString:", v15);
    v25 = v17;
    v24 = v16;

    if (v25)
    {
      v18 = objc_msgSend(v35, "fontDescriptorWithSymbolicTraits:", 2);
      v23 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v18, 0.0);

      objc_msgSend(v37, "addAttribute:value:range:", NSFontAttributeName, v23, v24, v25);
      v19 = -[BuddyAppleIDSignInController username](v39, "username");
      v22 = +[AKUsernameFormatter formattedUsernameFromUsername:](AKUsernameFormatter, "formattedUsernameFromUsername:", v19);

      objc_msgSend(v37, "replaceCharactersInRange:withString:", v24, v25, v22);
      objc_storeStrong(&v22, 0);
      objc_storeStrong(&v23, 0);
    }
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v34, 0);
    objc_storeStrong(&v35, 0);
    objc_storeStrong(&v36, 0);
  }
  v20 = v37;
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
  return v20;
}

- (id)_subtitleTextForMode:(int)a3
{
  UIDevice *v3;
  unsigned __int8 v4;
  id v5;
  NSBundle *v6;
  NSString *v7;
  id v8;
  id v9;
  NSString *v10;
  NSUInteger v11;
  NSBundle *v12;
  NSString *v13;
  id v14;
  id v15;
  NSString *v16;
  NSUInteger v17;
  id v18;
  NSBundle *v19;
  NSString *v20;
  id v21;
  id v22;
  id v23;
  NSBundle *v24;
  NSString *v25;
  id v26;
  id v27;
  id v28;
  NSBundle *v29;
  NSString *v30;
  id v31;
  id v32;
  id v33;
  NSBundle *v34;
  NSString *v35;
  id v36;
  id v37;
  id v38;
  id v40;
  int v41;
  SEL v42;
  BuddyAppleIDSignInController *v43;

  v43 = self;
  v42 = a2;
  v41 = a3;
  v40 = 0;
  if (a3 == 1)
  {
    v3 = +[UIDevice currentDevice](UIDevice, "currentDevice");
    v4 = -[UIDevice sf_isChinaRegionCellularDevice](v3, "sf_isChinaRegionCellularDevice");

    v5 = objc_alloc((Class)NSAttributedString);
    if ((v4 & 1) != 0)
    {
      v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyAppleIDSignInController));
      v7 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("APPLEID_SIGN_IN_CELLULAR_NOTICE"), &stru_100284738, CFSTR("AppleIDAuth"));
    }
    else
    {
      v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyAppleIDSignInController));
      v7 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("APPLEID_SIGN_IN_TEXT"), &stru_100284738, CFSTR("AppleIDAuth"));
    }
    v8 = objc_msgSend(v5, "initWithString:", v7);
    v9 = v40;
    v40 = v8;

  }
  else
  {
    switch(v41)
    {
      case 2:
        v33 = objc_alloc((Class)NSAttributedString);
        v34 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyAppleIDSignInController));
        v35 = -[NSBundle localizedStringForKey:value:table:](v34, "localizedStringForKey:value:table:", CFSTR("TWO_ACCOUNTS_ICLOUD_SIGN_IN_TEXT"), &stru_100284738, CFSTR("AppleIDAuth"));
        v36 = objc_msgSend(v33, "initWithString:", v35);
        v37 = v40;
        v40 = v36;

        break;
      case 3:
        v28 = objc_alloc((Class)NSAttributedString);
        v29 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyAppleIDSignInController));
        v30 = -[NSBundle localizedStringForKey:value:table:](v29, "localizedStringForKey:value:table:", CFSTR("TWO_ACCOUNTS_ITUNES_SIGN_IN_TEXT"), &stru_100284738, CFSTR("AppleIDAuth"));
        v31 = objc_msgSend(v28, "initWithString:", v30);
        v32 = v40;
        v40 = v31;

        break;
      case 4:
        v10 = -[BuddyAppleIDSignInController username](v43, "username");
        v11 = -[NSString length](v10, "length");

        if (v11)
        {
          v12 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyAppleIDSignInController));
          v13 = -[NSBundle localizedStringForKey:value:table:](v12, "localizedStringForKey:value:table:", CFSTR("ICLOUD_UPGRADE_TEXT_%@"), &stru_100284738, CFSTR("AppleIDAuth"));
          v14 = -[BuddyAppleIDSignInController stringWithUsernameFormattedIntoString:](v43, "stringWithUsernameFormattedIntoString:", v13);
          v15 = v40;
          v40 = v14;

        }
        break;
      case 5:
        v23 = objc_alloc((Class)NSAttributedString);
        v24 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyAppleIDSignInController));
        v25 = -[NSBundle localizedStringForKey:value:table:](v24, "localizedStringForKey:value:table:", CFSTR("APPLE_ACCOUNT_SIGN_IN_TEXT"), &stru_100284738, CFSTR("AppleIDAuth"));
        v26 = objc_msgSend(v23, "initWithString:", v25);
        v27 = v40;
        v40 = v26;

        break;
      case 7:
        v16 = -[BuddyAppleIDSignInController username](v43, "username");
        v17 = -[NSString length](v16, "length");

        if (v17)
        {
          v18 = objc_alloc((Class)NSAttributedString);
          v19 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyAppleIDSignInController));
          v20 = -[NSBundle localizedStringForKey:value:table:](v19, "localizedStringForKey:value:table:", CFSTR("SOFTWARE_UPDATE_SUBTITLE_TEXT"), &stru_100284738, CFSTR("AppleIDAuth"));
          v21 = objc_msgSend(v18, "initWithString:", v20);
          v22 = v40;
          v40 = v21;

        }
        break;
      default:
        break;
    }
  }
  v38 = objc_msgSend(v40, "string", v40);
  objc_storeStrong(&v40, 0);
  return v38;
}

- (id)_subTitleText
{
  NSString *v2;
  NSString *v5;

  v2 = -[BuddyAppleIDSignInController detailText](self, "detailText");

  if (v2)
    v5 = -[BuddyAppleIDSignInController detailText](self, "detailText");
  else
    v5 = (NSString *)-[BuddyAppleIDSignInController _subtitleTextForMode:](self, "_subtitleTextForMode:", self->_mode);
  return v5;
}

- (void)setiForgotText:(id)a3 handler:(id)a4
{
  id v5;
  id location[2];
  BuddyAppleIDSignInController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[BFFLinkLabelFooterView removeAllLinks](v7->_topSectionFooterView, "removeAllLinks");
  if (objc_msgSend(location[0], "length") && v5)
    -[BuddyAppleIDSignInController addFooterLinkWithTitle:handler:](v7, "addFooterLinkWithTitle:handler:", location[0], v5);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)addFooterLinkWithTitle:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  id location[2];
  BuddyAppleIDSignInController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5 = -[BuddyAppleIDSignInController topSectionFooterView](v8, "topSectionFooterView");
  objc_msgSend(v5, "addLinkWithTitle:handler:", location[0], v6);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)removeFooterLinkAtIndex:(unint64_t)a3
{
  -[BFFLinkLabelFooterView removeLinkAtIndex:](self->_topSectionFooterView, "removeLinkAtIndex:", a3);
}

- (void)setFooterText:(id)a3
{
  id v3;
  id location[2];
  BuddyAppleIDSignInController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyAppleIDSignInController topSectionFooterView](v5, "topSectionFooterView");
  objc_msgSend(v3, "setLabelText:", location[0]);

  objc_storeStrong(location, 0);
}

- (NSString)footerText
{
  return (NSString *)-[BFFLinkLabelFooterView labelText](self->_topSectionFooterView, "labelText", a2, self);
}

- (id)topSectionFooterView
{
  BFFLinkLabelFooterView *v2;
  BFFLinkLabelFooterView *topSectionFooterView;

  if (!self->_topSectionFooterView)
  {
    v2 = (BFFLinkLabelFooterView *)objc_msgSend(objc_alloc((Class)BFFLinkLabelFooterView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height, a2);
    topSectionFooterView = self->_topSectionFooterView;
    self->_topSectionFooterView = v2;

  }
  return self->_topSectionFooterView;
}

- (void)setEnabled:(BOOL)a3
{
  id v3;
  id v4;
  id v5;
  id v6;

  if (a3 != self->_enabled)
  {
    self->_enabled = a3;
    v3 = -[UITableViewCell editableTextField](self->_usernameCell, "editableTextField");
    objc_msgSend(v3, "setEnabled:", a3);

    v4 = -[UITableViewCell editableTextField](self->_passwordCell, "editableTextField");
    objc_msgSend(v4, "setEnabled:", a3);

    -[BFFLinkLabelFooterView setEnabled:](self->_topSectionFooterView, "setEnabled:", a3);
    if (a3)
    {
      +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:](BFFViewControllerSpinnerManager, "stopAnimatingSpinnerFor:", CFSTR("BUDDY_APPLEID_SIGN_IN_PAGE"));
    }
    else
    {
      v5 = -[BuddyAppleIDSignInController navigationController](self, "navigationController");
      v6 = objc_msgSend(v5, "topViewController");
      +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:identifier:](BFFViewControllerSpinnerManager, "startAnimatingSpinnerFor:identifier:", v6, CFSTR("BUDDY_APPLEID_SIGN_IN_PAGE"));

    }
  }
}

- (double)rowHeight
{
  UIScreen *v2;
  double v3;
  BOOL v4;
  BOOL v5;
  id v6;
  double v7;
  char v9;
  NSString *v10;
  char v11;
  UIApplication *v12;
  double v13;

  v2 = +[UIScreen mainScreen](UIScreen, "mainScreen");
  -[UIScreen bounds](v2, "bounds");
  v4 = v3 <= 568.01;

  v11 = 0;
  v9 = 0;
  v5 = 0;
  if (!v4)
  {
    v12 = +[UIApplication sharedApplication](UIApplication, "sharedApplication");
    v11 = 1;
    v10 = -[UIApplication preferredContentSizeCategory](v12, "preferredContentSizeCategory");
    v9 = 1;
    v5 = !UIContentSizeCategoryIsAccessibilityCategory(v10);
  }
  if ((v9 & 1) != 0)

  if ((v11 & 1) != 0)
  if (!v5)
    return -1.0;
  v6 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  objc_msgSend(v6, "tallRowHeight");
  v13 = v7;

  return v13;
}

- (void)loadView
{
  id v2;
  id v3;
  __int128 v4;
  id v5;
  id v6;
  BuddyAppleIDSignInController *v7;
  id v8;
  BuddyAppleIDSignInController *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  BOOL v18;
  BuddyAppleIDSignInController *v19;
  NSBundle *v20;
  NSString *v21;
  id v22;
  BuddyAppleIDSignInController *v23;
  NSBundle *v24;
  NSString *v25;
  id v26;
  NSNotificationCenter *v27;
  void **v28;
  uint64_t v29;
  void (*v30)(id *);
  void *v31;
  id v32;
  void **v33;
  int v34;
  int v35;
  void (*v36)(uint64_t);
  void *v37;
  id v38;
  BOOL v39;
  BOOL v40;
  id location;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  SEL v47;
  BuddyAppleIDSignInController *v48;

  v48 = self;
  v47 = a2;
  v46.receiver = self;
  v46.super_class = (Class)BuddyAppleIDSignInController;
  -[BuddyAppleIDSignInController loadView](&v46, "loadView");
  v2 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[BuddyAppleIDSignInController setTableView:](v48, "setTableView:", v2);

  v3 = -[BuddyAppleIDSignInController tableView](v48, "tableView");
  objc_msgSend(v3, "setSectionHeaderHeight:", 0.0);

  v4 = *(_OWORD *)&UIEdgeInsetsZero.top;
  v45 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  v44 = v4;
  v5 = -[BuddyAppleIDSignInController tableView](v48, "tableView");
  v43 = v45;
  v42 = v44;
  objc_msgSend(v5, "setSeparatorInset:", v44, v45);

  v6 = -[BuddyAppleIDSignInController tableView](v48, "tableView");
  objc_msgSend(v6, "setContentInsetAdjustmentBehavior:", 2);

  v7 = v48;
  v8 = -[BuddyAppleIDSignInController tableView](v48, "tableView");
  objc_msgSend(v8, "setDelegate:", v7);

  v9 = v48;
  v10 = -[BuddyAppleIDSignInController tableView](v48, "tableView");
  objc_msgSend(v10, "setDataSource:", v9);

  v11 = -[BuddyAppleIDSignInController tableView](v48, "tableView");
  objc_msgSend(v11, "setRowHeight:", UITableViewAutomaticDimension);

  v12 = -[BuddyAppleIDSignInController tableView](v48, "tableView");
  objc_msgSend(v12, "setEstimatedSectionFooterHeight:", 0.0);

  v13 = -[BuddyAppleIDSignInController tableView](v48, "tableView");
  objc_msgSend(v13, "setEstimatedSectionHeaderHeight:", 0.0);

  v14 = -[BuddyAppleIDSignInController tableView](v48, "tableView");
  objc_msgSend(v14, "setAllowsSelectionDuringEditing:", 1);

  v15 = -[BuddyAppleIDSignInController tableView](v48, "tableView");
  objc_msgSend(v15, "setSectionFooterHeight:", 0.0);

  v16 = -[BuddyAppleIDSignInController tableView](v48, "tableView");
  -[BuddyAppleIDSignInController rowHeight](v48, "rowHeight");
  objc_msgSend(v16, "setRowHeight:");

  v17 = 0;
  if (v48->_mode != 4)
    v17 = v48->_mode != 6;
  -[BuddyAppleIDSignInController setShowsUsernameAsField:](v48, "setShowsUsernameAsField:", v17);
  v48->_showsPasswordAsField = !v48->_showsUsernameAsField;
  v18 = 1;
  if (v48->_mode != 1)
  {
    v18 = 1;
    if (v48->_mode != 5)
      v18 = v48->_mode == 4;
  }
  -[BuddyAppleIDSignInController setShowsInfoSection:](v48, "setShowsInfoSection:", v18);
  objc_initWeak(&location, v48);
  if (v48->_mode == 6 || v48->_mode == 4)
  {
    v40 = 0;
    v40 = v48->_mode == 4;
    v19 = v48;
    v20 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyAppleIDSignInController));
    v21 = -[NSBundle localizedStringForKey:value:table:](v20, "localizedStringForKey:value:table:", CFSTR("SKIP_LINK"), &stru_100284738, CFSTR("AppleIDAuth"));
    v33 = _NSConcreteStackBlock;
    v34 = -1073741824;
    v35 = 0;
    v36 = sub_10010F788;
    v37 = &unk_100283048;
    v39 = v40;
    objc_copyWeak(&v38, &location);
    -[BuddyAppleIDSignInController addFooterLinkWithTitle:handler:](v19, "addFooterLinkWithTitle:handler:", v21, &v33);

    if (!v40)
    {
      v22 = -[BuddyAppleIDSignInController topSectionFooterView](v48, "topSectionFooterView");
      objc_msgSend(v22, "setWantsSideBySideLayout:", 1);

    }
    objc_destroyWeak(&v38);
  }
  else if (v48->_mode == 3)
  {
    v23 = v48;
    v24 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyAppleIDSignInController));
    v25 = -[NSBundle localizedStringForKey:value:table:](v24, "localizedStringForKey:value:table:", CFSTR("SKIP_LINK"), &stru_100284738, CFSTR("AppleIDAuth"));
    v28 = _NSConcreteStackBlock;
    v29 = 3221225472;
    v30 = sub_10010FB50;
    v31 = &unk_1002806B8;
    objc_copyWeak(&v32, &location);
    -[BuddyAppleIDSignInController addFooterLinkWithTitle:handler:](v23, "addFooterLinkWithTitle:handler:", v25, &v28);

    objc_destroyWeak(&v32);
  }
  if (v48->_mode == 5)
  {
    v26 = -[BuddyAppleIDSignInController topSectionFooterView](v48, "topSectionFooterView");
    objc_msgSend(v26, "setFlexibleHeight:", 10.0);

  }
  v27 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", v28, v29, v30, v31);
  -[NSNotificationCenter addObserver:selector:name:object:](v27, "addObserver:selector:name:object:", v48, "_textChanged:", UITextFieldTextDidChangeNotification, 0);

  objc_destroyWeak(&location);
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  double v7;
  double v8;
  id v9;
  id v10;
  id v11;
  OBBoldTrayButton *v12;
  NSBundle *v13;
  NSString *v14;
  OBBoldTrayButton *v15;
  id v16;
  NSArray *v17;
  id v18;
  OBBoldTrayButton *v19;
  id v20;
  uint64_t (**v21)(id, id *);
  id v22;
  id v23;
  id v24;
  id v25;
  id obj;
  id v27;
  id v28;
  id location;
  objc_super v30;
  SEL v31;
  BuddyAppleIDSignInController *v32;
  uint64_t v33;
  _QWORD v34[2];

  v32 = self;
  v31 = a2;
  v30.receiver = self;
  v30.super_class = (Class)BuddyAppleIDSignInController;
  -[BuddyAppleIDSignInController viewDidLoad](&v30, "viewDidLoad");
  if (v32->_mode != 8)
  {
    v2 = objc_msgSend(objc_alloc((Class)OBAnimationState), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("State 1"), CFSTR("Dark 1"), 0.01, 1.0);
    v34[0] = v2;
    v3 = objc_msgSend(objc_alloc((Class)OBAnimationState), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("State 2"), CFSTR("Dark 2"), 1.0, 0.7);
    v34[1] = v3;
    location = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 2);

    v4 = -[BuddyAppleIDSignInController buddy_animationController:animatedStates:startAtFirstState:](v32, "buddy_animationController:animatedStates:startAtFirstState:", CFSTR("AppleID"), location, 1);
    -[BuddyAppleIDSignInController setAnimationController:](v32, "setAnimationController:", v4);

    v5 = -[BuddyAppleIDSignInController headerView](v32, "headerView");
    v6 = objc_msgSend(v5, "animationView");
    objc_msgSend(v6, "defaultScale");
    v8 = v7 + 0.0299999993;
    v9 = -[BuddyAppleIDSignInController headerView](v32, "headerView");
    v10 = objc_msgSend(v9, "animationView");
    objc_msgSend(v10, "setScale:", v8);

    objc_storeStrong(&location, 0);
  }
  v11 = +[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton");
  -[BuddyAppleIDSignInController setContinueButton:](v32, "setContinueButton:", v11);

  v12 = -[BuddyAppleIDSignInController continueButton](v32, "continueButton");
  v13 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyAppleIDSignInController));
  v14 = -[NSBundle localizedStringForKey:value:table:](v13, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_100284738, CFSTR("AppleIDAuth"));
  -[OBBoldTrayButton setTitle:forState:](v12, "setTitle:forState:", v14, 0);

  v15 = -[BuddyAppleIDSignInController continueButton](v32, "continueButton");
  -[OBBoldTrayButton addTarget:action:forEvents:](v15, "addTarget:action:forEvents:", v32, "_continueButtonTapped", 64);

  -[BuddyAppleIDSignInController _setContinueButtonEnabledOrDisabled](v32, "_setContinueButtonEnabledOrDisabled");
  if (v32->_mode == 2 || v32->_mode == 3)
  {
    -[BuddyAppleIDSignInController setShouldAdjustScrollViewInsetForKeyboard:](v32, "setShouldAdjustScrollViewInsetForKeyboard:", 1);
  }
  else
  {
    v16 = -[BuddyAppleIDSignInController buttonTray](v32, "buttonTray");
    v33 = BYPrivacyAppleIDIdentifier;
    v17 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1);
    objc_msgSend(v16, "setPrivacyLinkForBundles:", v17);

    -[BuddyAppleIDSignInController setShouldAdjustScrollViewInsetForKeyboard:](v32, "setShouldAdjustScrollViewInsetForKeyboard:", 1);
    v18 = -[BuddyAppleIDSignInController buttonTray](v32, "buttonTray");
    v19 = -[BuddyAppleIDSignInController continueButton](v32, "continueButton");
    objc_msgSend(v18, "addButton:", v19);

  }
  v20 = -[BuddyAppleIDSignInController loginOptionsConstructor](v32, "loginOptionsConstructor");

  if (v20)
  {
    v28 = +[OBLinkTrayButton linkButton](OBLinkTrayButton, "linkButton");
    v27 = 0;
    v21 = (uint64_t (**)(id, id *))-[BuddyAppleIDSignInController loginOptionsConstructor](v32, "loginOptionsConstructor");
    obj = 0;
    v22 = (id)v21[2](v21, &obj);
    objc_storeStrong(&v27, obj);
    -[BuddyAppleIDSignInController setLoginOptionsAction:](v32, "setLoginOptionsAction:", v22);

    objc_msgSend(v28, "setTitle:forState:", v27, 0);
    objc_msgSend(v28, "addTarget:action:forEvents:", v32, "_loginOptionsTapped:", 64);
    v23 = -[BuddyAppleIDSignInController buttonTray](v32, "buttonTray");
    objc_msgSend(v23, "addButton:", v28);

    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
  }
  v24 = -[BuddyAppleIDSignInController _titleText](v32, "_titleText");
  v25 = -[BuddyAppleIDSignInController navigationItem](v32, "navigationItem");
  objc_msgSend(v25, "setBackButtonTitle:", v24);

}

- (void)viewWillAppear:(BOOL)a3
{
  id v3;
  id v4;
  OBAnimationController *v5;
  objc_super v6;
  os_log_type_t v7;
  os_log_t oslog;
  BOOL v9;
  SEL v10;
  BuddyAppleIDSignInController *v11;
  uint8_t buf[8];

  v11 = self;
  v10 = a2;
  v9 = a3;
  oslog = (os_log_t)(id)_BYLoggingFacility(self);
  v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100046FA0(buf, v11->_mode);
    _os_log_impl((void *)&_mh_execute_header, oslog, v7, "SignInController showing mode %i", buf, 8u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v6.receiver = v11;
  v6.super_class = (Class)BuddyAppleIDSignInController;
  -[BuddyAppleIDSignInController viewWillAppear:](&v6, "viewWillAppear:", v9);
  v3 = -[BuddyAppleIDSignInController view](v11, "view");
  objc_msgSend(v3, "setNeedsLayout");

  v4 = -[BuddyAppleIDSignInController view](v11, "view");
  objc_msgSend(v4, "layoutIfNeeded");

  v5 = -[BuddyAppleIDSignInController animationController](v11, "animationController");
  -[OBAnimationController startAnimation](v5, "startAnimation");

}

- (void)viewDidAppear:(BOOL)a3
{
  id v3;
  id v4;
  BOOL v5;
  id v6;
  BOOL v7;
  double v8;
  id v9;
  char v10;
  UIScreen *v11;
  objc_super v12;
  BOOL v13;
  SEL v14;
  BuddyAppleIDSignInController *v15;

  v15 = self;
  v14 = a2;
  v13 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BuddyAppleIDSignInController;
  -[BuddyAppleIDSignInController viewDidAppear:](&v12, "viewDidAppear:", a3);
  if (v15->_mode != 1 && v15->_mode != 5 && v15->_mode != 4)
  {
    v3 = -[UITableViewCell editableTextField](v15->_usernameCell, "editableTextField");
    v4 = objc_msgSend(v3, "text");
    v5 = 1;
    if (!objc_msgSend(v4, "length"))
      v5 = v15->_usernameCell == 0;

    if (v5)
      v6 = -[UITableViewCell editableTextField](v15->_passwordCell, "editableTextField");
    else
      v6 = -[UITableViewCell editableTextField](v15->_usernameCell, "editableTextField");
    objc_msgSend(v6, "becomeFirstResponder");

  }
  v10 = 0;
  v7 = 0;
  if ((sub_1001108A4() & 1) != 0)
  {
    v11 = +[UIScreen mainScreen](UIScreen, "mainScreen");
    v10 = 1;
    -[UIScreen bounds](v11, "bounds");
    v7 = v8 <= 480.01;
  }
  if ((v10 & 1) != 0)

  if (v7)
  {
    v9 = -[BuddyAppleIDSignInController tableView](v15, "tableView");
    objc_msgSend(v9, "flashScrollIndicators");

  }
  if (v15->_appearanceHandler)
    (*((void (**)(void))v15->_appearanceHandler + 2))();
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  BuddyAppleIDSignInController *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  -[BuddyAppleIDSignInController setEnabled:](self, "setEnabled:", 1);
  v3.receiver = v6;
  v3.super_class = (Class)BuddyAppleIDSignInController;
  -[BuddyAppleIDSignInController viewDidDisappear:](&v3, "viewDidDisappear:", v4);
}

- (void)_loginOptionsTapped:(id)a3
{
  void (**v3)(_QWORD);
  id location[2];
  BuddyAppleIDSignInController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (void (**)(_QWORD))-[BuddyAppleIDSignInController loginOptionsAction](v5, "loginOptionsAction");
  v3[2](v3);

  objc_storeStrong(location, 0);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return UITableViewAutomaticDimension;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned int v7;
  id location[2];
  BuddyAppleIDSignInController *v10;
  int64_t v11;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (a4)
  {
    v11 = 0;
  }
  else
  {
    v5 = -[BuddyAppleIDSignInController showsUsernameAsField](v10, "showsUsernameAsField");
    v6 = 0;
    if ((v5 & 1) != 0)
      v6 = -[BuddyAppleIDSignInController showsPasswordAsField](v10, "showsPasswordAsField");
    if ((v6 & 1) != 0)
      v7 = 2;
    else
      v7 = 1;
    v11 = v7;
  }
  objc_storeStrong(location, 0);
  return v11;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 0;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  int v7;
  int64_t v8;
  id location[2];
  BuddyAppleIDSignInController *v10;
  BFFLinkLabelFooterView *v11;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = a4;
  if (a4)
  {
    if (v8 == 1)
    {
      v6 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      v11 = (BFFLinkLabelFooterView *)v6;
      v7 = 1;
      objc_storeStrong(&v6, 0);
    }
    else
    {
      v11 = 0;
      v7 = 1;
    }
  }
  else
  {
    v11 = v10->_topSectionFooterView;
    v7 = 1;
  }
  objc_storeStrong(location, 0);
  return v11;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 0.0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  char v11;
  BOOL v12;
  double v13;
  int v14;
  BFFLinkLabelFooterView *topSectionFooterView;
  double v16;
  double v17;
  double v18;
  id v19;
  id v20;
  id v21;
  BOOL v22;
  id v23;
  id v24;
  id v25;
  double v26;
  id v27;
  double v28;
  double v29;
  id v30;
  double v31;
  id v32;
  double v33;
  double v34;
  id v35;
  double v36;
  double v37;
  id v38;
  double v39;
  double v40;
  id v41;
  double v42;
  double v43;
  id v44;
  double v45;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  char v52;
  UIScreen *v53;
  double __b[4];
  int64_t v55;
  id location[2];
  BuddyAppleIDSignInController *v57;
  double v58;
  CGRect v59;
  CGRect v60;

  v57 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v55 = a4;
  if (a4)
  {
    -[BuddyAppleIDSignInController keyboardFrame](v57, "keyboardFrame");
    v60.size.height = CGRectZero.size.height;
    v60.size.width = CGRectZero.size.width;
    v60.origin.y = CGRectZero.origin.y;
    v60.origin.x = CGRectZero.origin.x;
    if (CGRectEqualToRect(v59, v60))
    {
      v58 = 0.0;
    }
    else
    {
      v19 = objc_msgSend(location[0], "tableFooterView");
      v20 = -[BuddyAppleIDSignInController buttonTray](v57, "buttonTray");
      v21 = objc_msgSend(v20, "superview");
      v22 = v19 == v21;

      if (v55 != 1 || v22 || (sub_10011133C() & 1) == 0)
        goto LABEL_21;
      v23 = -[BuddyAppleIDSignInController view](v57, "view");
      objc_msgSend(v23, "layoutMargins");

      v24 = -[BuddyAppleIDSignInController navigationController](v57, "navigationController");
      v25 = objc_msgSend(v24, "navigationBar");
      objc_msgSend(v25, "bounds");
      v51 = v26;

      v50 = 0.0;
      v27 = objc_msgSend(location[0], "tableFooterView");
      objc_msgSend(v27, "bounds");
      v29 = v28;

      if (v29 == 0.0)
      {
        v30 = -[BuddyAppleIDSignInController buttonTray](v57, "buttonTray");
        objc_msgSend(v30, "bounds");
        v50 = v31;

      }
      v32 = objc_msgSend(location[0], "tableHeaderView");
      objc_msgSend(v32, "bounds");
      v34 = v33;

      v49 = v34;
      v35 = -[BuddyAppleIDSignInController usernameCell](v57, "usernameCell");
      objc_msgSend(v35, "bounds");
      v37 = v36;

      v48 = 0.0;
      if (v57->_showsPasswordAsField)
      {
        v38 = -[BuddyAppleIDSignInController passwordCell](v57, "passwordCell");
        objc_msgSend(v38, "bounds");
        v48 = v39;

      }
      -[BFFLinkLabelFooterView bounds](v57->_topSectionFooterView, "bounds");
      v47 = v51 + v49 + v37 + v48 + v40 + v50;
      v41 = -[BuddyAppleIDSignInController view](v57, "view");
      objc_msgSend(v41, "bounds");
      v43 = v42;

      if (v43 > v47)
      {
        v44 = -[BuddyAppleIDSignInController view](v57, "view");
        objc_msgSend(v44, "bounds");
        v58 = v45 - v47;

      }
      else
      {
LABEL_21:
        v58 = 0.0;
      }
    }
  }
  else
  {
    memset(__b, 0, sizeof(__b));
    -[BFFLinkLabelFooterView margins](v57->_topSectionFooterView, "margins");
    __b[0] = v5;
    __b[1] = v6;
    __b[2] = v7;
    __b[3] = v8;
    objc_msgSend(location[0], "_backgroundInset");
    __b[1] = v9;
    objc_msgSend(location[0], "_backgroundInset");
    __b[3] = v10;
    v11 = sub_1001108A4();
    v52 = 0;
    v12 = 0;
    if ((v11 & 1) != 0)
    {
      v53 = +[UIScreen mainScreen](UIScreen, "mainScreen");
      v52 = 1;
      -[UIScreen bounds](v53, "bounds");
      v12 = v13 <= 480.01;
    }
    if (v12)
      v14 = 4;
    else
      v14 = 16;
    __b[0] = (double)v14;
    if ((v52 & 1) != 0)

    -[BFFLinkLabelFooterView setMargins:](v57->_topSectionFooterView, "setMargins:", __b[0], __b[1], __b[2], __b[3]);
    objc_msgSend(location[0], "bounds");
    objc_msgSend(location[0], "separatorInset");
    objc_msgSend(location[0], "layoutMargins");
    objc_msgSend(location[0], "layoutMargins");
    topSectionFooterView = v57->_topSectionFooterView;
    objc_msgSend(location[0], "bounds");
    sub_100111308();
    -[BFFLinkLabelFooterView sizeThatFits:](topSectionFooterView, "sizeThatFits:", v16, v17);
    v58 = v18;
  }
  objc_storeStrong(location, 0);
  return v58;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  UIColor *v9;
  id v10;
  id v12;
  id v13;
  id location[2];
  BuddyAppleIDSignInController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v12 = 0;
  if (!-[BuddyAppleIDSignInController showsUsernameAsField](v15, "showsUsernameAsField"))
    goto LABEL_5;
  if (objc_msgSend(v13, "row"))
  {
    if (objc_msgSend(v13, "row") != (id)1)
      goto LABEL_6;
LABEL_5:
    v7 = -[BuddyAppleIDSignInController passwordCell](v15, "passwordCell");
    v8 = v12;
    v12 = v7;

    goto LABEL_6;
  }
  v5 = -[BuddyAppleIDSignInController usernameCell](v15, "usernameCell");
  v6 = v12;
  v12 = v5;

LABEL_6:
  v9 = +[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor");
  objc_msgSend(v12, "setBackgroundColor:", v9);

  v10 = v12;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (id)usernameCell
{
  BuddyAppleIDSignInTableViewCell *v2;
  UITableViewCell *usernameCell;
  NSBundle *v4;
  NSBundle *v5;
  const __CFString *v6;
  NSString *v7;
  UIFont *v8;
  id v9;
  id location[2];
  BuddyAppleIDSignInController *v12;

  v12 = self;
  location[1] = (id)a2;
  if (!self->_usernameCell)
  {
    v2 = -[BuddyAppleIDSignInTableViewCell initWithStyle:reuseIdentifier:]([BuddyAppleIDSignInTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    usernameCell = v12->_usernameCell;
    v12->_usernameCell = &v2->super;

    -[UITableViewCell setSelectionStyle:](v12->_usernameCell, "setSelectionStyle:", 0);
    location[0] = -[UITableViewCell editableTextField](v12->_usernameCell, "editableTextField");
    v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyAppleIDSignInController));
    v5 = v4;
    if (v12->_phoneNumberSupported)
      v6 = CFSTR("SIGN_IN_EMAIL_OR_PHONE");
    else
      v6 = CFSTR("SIGN_IN_EMAIL");
    v7 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", v6, &stru_100284738, CFSTR("AppleIDAuth"));
    objc_msgSend(location[0], "setPlaceholder:", v7);

    objc_msgSend(location[0], "setAutocorrectionType:", 1);
    objc_msgSend(location[0], "setAutocapitalizationType:", 0);
    objc_msgSend(location[0], "setDelegate:", v12);
    objc_msgSend(location[0], "setKeyboardType:", 7);
    objc_msgSend(location[0], "setReturnKeyType:", 11);
    objc_msgSend(location[0], "setTextContentType:", UITextContentTypeUsername);
    objc_msgSend(location[0], "setEnablesReturnKeyAutomatically:", 1);
    v8 = +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody);
    objc_msgSend(location[0], "setFont:", v8);

    v9 = +[UIColor _labelColor](UIColor, "_labelColor");
    objc_msgSend(location[0], "setTextColor:", v9);

    objc_storeStrong(location, 0);
  }
  return v12->_usernameCell;
}

- (void)setUsername:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id location[2];
  BuddyAppleIDSignInController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyAppleIDSignInController usernameCell](v8, "usernameCell");
  v4 = objc_msgSend(v3, "editableTextField");
  objc_msgSend(v4, "setText:", location[0]);

  -[BuddyAppleIDSignInController _setContinueButtonEnabledOrDisabled](v8, "_setContinueButtonEnabledOrDisabled");
  v5 = -[BuddyAppleIDSignInController headerView](v8, "headerView");
  v6 = -[BuddyAppleIDSignInController _subTitleText](v8, "_subTitleText");
  objc_msgSend(v5, "setDetailText:", v6);

  objc_storeStrong(location, 0);
}

- (NSString)username
{
  id v2;
  id v3;
  id v4;

  v2 = -[BuddyAppleIDSignInController usernameCell](self, "usernameCell", a2, self);
  v3 = objc_msgSend(v2, "editableTextField");
  v4 = objc_msgSend(v3, "text");

  return (NSString *)v4;
}

- (void)setIsUsernameEditable:(BOOL)a3
{
  id v3;
  id v4;

  if (self->_isUsernameEditable != a3)
  {
    self->_isUsernameEditable = a3;
    v3 = -[BuddyAppleIDSignInController usernameCell](self, "usernameCell");
    v4 = objc_msgSend(v3, "editableTextField");
    objc_msgSend(v4, "setUserInteractionEnabled:", a3);

  }
}

- (id)passwordCell
{
  BuddyAppleIDSignInTableViewCell *v2;
  UITableViewCell *passwordCell;
  NSBundle *v4;
  NSString *v5;
  UIFont *v6;
  id v7;
  id location[2];
  BuddyAppleIDSignInController *v10;

  v10 = self;
  location[1] = (id)a2;
  if (!self->_passwordCell)
  {
    v2 = -[BuddyAppleIDSignInTableViewCell initWithStyle:reuseIdentifier:]([BuddyAppleIDSignInTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    passwordCell = v10->_passwordCell;
    v10->_passwordCell = &v2->super;

    -[UITableViewCell setSelectionStyle:](v10->_passwordCell, "setSelectionStyle:", 0);
    location[0] = -[UITableViewCell editableTextField](v10->_passwordCell, "editableTextField");
    v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyAppleIDSignInController));
    v5 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", CFSTR("THIS_FIELD_REQUIRED"), &stru_100284738, CFSTR("AppleIDAuth"));
    objc_msgSend(location[0], "setPlaceholder:", v5);

    objc_msgSend(location[0], "setSecureTextEntry:", 1);
    objc_msgSend(location[0], "setAutocorrectionType:", 1);
    objc_msgSend(location[0], "setAutocapitalizationType:", 0);
    objc_msgSend(location[0], "setDelegate:", v10);
    objc_msgSend(location[0], "setReturnKeyType:", 11);
    objc_msgSend(location[0], "setEnablesReturnKeyAutomatically:", 1);
    v6 = +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody);
    objc_msgSend(location[0], "setFont:", v6);

    v7 = +[UIColor _labelColor](UIColor, "_labelColor");
    objc_msgSend(location[0], "setTextColor:", v7);

    objc_msgSend(location[0], "setReturnKeyType:", 11);
    objc_storeStrong(location, 0);
  }
  return v10->_passwordCell;
}

- (void)_continueButtonTapped
{
  NSString *v2;
  id v3;
  void (**v4)(id, id);
  NSString *v5;
  id v6;

  if (self->_showsPasswordAsField)
  {
    -[BuddyAppleIDSignInController _signInToAccount](self, "_signInToAccount", a2);
  }
  else
  {
    v2 = -[BuddyAppleIDSignInController username](self, "username", a2);
    v3 = -[BuddyAppleIDSignInController _userFriendlyDisplayNameForCurrentUserName:](self, "_userFriendlyDisplayNameForCurrentUserName:", v2);
    -[BuddyAppleIDSignInController setUsername:](self, "setUsername:", v3);

    v4 = (void (**)(id, id))-[BuddyAppleIDSignInController authModeHandler](self, "authModeHandler");
    v5 = -[BuddyAppleIDSignInController username](self, "username");
    v6 = -[BuddyAppleIDSignInController _serverFriendlyDisplayNameForCurrentUserName:](self, "_serverFriendlyDisplayNameForCurrentUserName:", v5);
    v4[2](v4, v6);

  }
}

- (id)_serverFriendlyDisplayNameForCurrentUserName:(id)a3
{
  id v4;
  id v5;
  id v6;
  id location[2];
  BuddyAppleIDSignInController *v8;
  id v9;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!v8->_phoneNumberSupported || (objc_msgSend(location[0], "containsString:", CFSTR("@")) & 1) != 0)
  {
    v9 = location[0];
  }
  else
  {
    v6 = objc_alloc_init((Class)AAFPhoneNumberFormatter);
    v5 = objc_msgSend(v6, "displayFormatFor:", location[0]);
    v4 = objc_msgSend(v6, "normalizedFormatFor:", v5);
    v9 = v4;
    objc_storeStrong(&v4, 0);
    objc_storeStrong(&v5, 0);
    objc_storeStrong(&v6, 0);
  }
  objc_storeStrong(location, 0);
  return v9;
}

- (id)_userFriendlyDisplayNameForCurrentUserName:(id)a3
{
  int v4;
  id v5;
  id v6;
  id location[2];
  BuddyAppleIDSignInController *v8;
  id v9;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!v8->_phoneNumberSupported
    || (objc_msgSend(location[0], "containsString:", CFSTR("@")) & 1) != 0
    || ((v6 = objc_alloc_init((Class)AAFPhoneNumberFormatter),
         v5 = objc_msgSend(v6, "displayFormatFor:", location[0]),
         (objc_msgSend(v5, "isEqualToString:", location[0]) & 1) != 0)
      ? (v4 = 0)
      : (v9 = v5, v4 = 1),
        objc_storeStrong(&v5, 0),
        objc_storeStrong(&v6, 0),
        !v4))
  {
    v9 = location[0];
  }
  objc_storeStrong(location, 0);
  return v9;
}

- (void)_signInToAccount
{
  void *v2;
  void **block;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8[2];
  BuddyAppleIDSignInController *v9;

  v9 = self;
  v8[1] = (id)a2;
  v2 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_100111F90;
  v7 = &unk_100280730;
  v8[0] = v9;
  dispatch_async((dispatch_queue_t)v2, &block);

  objc_storeStrong(v8, 0);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  NSCharacterSet *v7;
  NSString *v8;
  NSString *lastEnteredUsername;
  BuddyAppleIDSignInController *v10;
  BuddyAppleIDSignInController *v11;
  NSString *v12;
  id v13;
  void (**v14)(id, id);
  BuddyAppleIDSignInController *v15;
  NSString *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id location[2];
  BuddyAppleIDSignInController *v29;
  char v30;

  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = location[0];
  v4 = -[UITableViewCell editableTextField](v29->_usernameCell, "editableTextField");

  if (v3 == v4)
  {
    v5 = -[UITableViewCell editableTextField](v29->_usernameCell, "editableTextField");
    v6 = objc_msgSend(v5, "text");
    v7 = +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet");
    v8 = (NSString *)objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
    lastEnteredUsername = v29->_lastEnteredUsername;
    v29->_lastEnteredUsername = v8;

    if (!v29->_showsPasswordAsField)
    {
      v10 = v29;
      v11 = v29;
      v12 = -[BuddyAppleIDSignInController username](v29, "username");
      v13 = -[BuddyAppleIDSignInController _userFriendlyDisplayNameForCurrentUserName:](v11, "_userFriendlyDisplayNameForCurrentUserName:", v12);
      -[BuddyAppleIDSignInController setUsername:](v10, "setUsername:", v13);

      v14 = (void (**)(id, id))-[BuddyAppleIDSignInController authModeHandler](v29, "authModeHandler");
      v15 = v29;
      v16 = -[BuddyAppleIDSignInController username](v29, "username");
      v17 = -[BuddyAppleIDSignInController _serverFriendlyDisplayNameForCurrentUserName:](v15, "_serverFriendlyDisplayNameForCurrentUserName:", v16);
      v14[2](v14, v17);

    }
    goto LABEL_11;
  }
  v18 = location[0];
  v19 = -[UITableViewCell editableTextField](v29->_passwordCell, "editableTextField");

  if (v18 != v19)
  {
LABEL_11:
    v30 = 1;
    goto LABEL_12;
  }
  v20 = -[UITableViewCell editableTextField](v29->_passwordCell, "editableTextField");
  v21 = objc_msgSend(v20, "text");
  v22 = objc_msgSend(v21, "length");

  if (v22)
  {
    v23 = -[UITableViewCell editableTextField](v29->_usernameCell, "editableTextField");
    v24 = objc_msgSend(v23, "text");
    v25 = objc_msgSend(v24, "length");

    if (v25)
    {
      -[BuddyAppleIDSignInController _signInToAccount](v29, "_signInToAccount");
    }
    else
    {
      v26 = -[UITableViewCell editableTextField](v29->_usernameCell, "editableTextField");
      objc_msgSend(v26, "becomeFirstResponder");

    }
    goto LABEL_11;
  }
  v30 = 0;
LABEL_12:
  objc_storeStrong(location, 0);
  return v30 & 1;
}

- (void)setDetailText:(id)a3
{
  id v3;
  id v4;
  id location[2];
  BuddyAppleIDSignInController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v6->_detailText, location[0]);
  v3 = -[BuddyAppleIDSignInController headerView](v6, "headerView");
  v4 = -[BuddyAppleIDSignInController _subTitleText](v6, "_subTitleText");
  objc_msgSend(v3, "setDetailText:", v4);

  objc_storeStrong(location, 0);
}

- (void)viewControllerSpinnerManagerDidStopAnimatingSpinner:(id)a3
{
  id location[2];
  BuddyAppleIDSignInController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyAppleIDSignInController _setContinueButtonEnabledOrDisabled](v4, "_setContinueButtonEnabledOrDisabled");
  objc_storeStrong(location, 0);
}

- (void)_textChanged:(id)a3
{
  id v3;
  NSCharacterSet *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id location[2];
  BuddyAppleIDSignInController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = objc_msgSend(location[0], "object");
  v7 = -[UITableViewCell editableTextField](v10->_passwordCell, "editableTextField");
  v6 = -[UITableViewCell editableTextField](v10->_usernameCell, "editableTextField");
  if (v8 == v6 && v10->_showsPasswordAsField)
  {
    v3 = objc_msgSend(v6, "text");
    v4 = +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet");
    v5 = objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);

    if ((objc_msgSend(v5, "isEqualToString:", v10->_lastEnteredUsername) & 1) == 0)
      -[BuddyAppleIDSignInController setShowsPasswordAsField:animated:](v10, "setShowsPasswordAsField:animated:", 0, 1);
    objc_storeStrong(&v5, 0);
  }
  if (v8 == v7 || v8 == v6)
    -[BuddyAppleIDSignInController _setContinueButtonEnabledOrDisabled](v10, "_setContinueButtonEnabledOrDisabled");
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)_setContinueButtonEnabledOrDisabled
{
  BOOL v2;
  BOOL v3;
  OBBoldTrayButton *v4;
  char v5;
  id v6;
  char v7;
  id v8;
  char v9;
  id v10;
  char v11;
  id v12;
  id location;
  id v14[2];
  BuddyAppleIDSignInController *v15;

  v15 = self;
  v14[1] = (id)a2;
  v14[0] = -[UITableViewCell editableTextField](self->_passwordCell, "editableTextField");
  location = -[UITableViewCell editableTextField](v15->_usernameCell, "editableTextField");
  v11 = 0;
  v9 = 0;
  v7 = 0;
  v5 = 0;
  if (v15->_showsPasswordAsField
    || (v12 = objc_msgSend(location, "text"),
        v11 = 1,
        v2 = 1,
        !objc_msgSend(v12, "length")))
  {
    if (v15->_showsUsernameAsField
      || (v10 = objc_msgSend(v14[0], "text"),
          v9 = 1,
          v2 = 1,
          !objc_msgSend(v10, "length")))
    {
      v8 = objc_msgSend(location, "text");
      v7 = 1;
      v2 = 0;
      if (objc_msgSend(v8, "length"))
      {
        v6 = objc_msgSend(v14[0], "text");
        v5 = 1;
        v2 = objc_msgSend(v6, "length") != 0;
      }
    }
  }
  if ((v5 & 1) != 0)

  if ((v7 & 1) != 0)
  if ((v9 & 1) != 0)

  if ((v11 & 1) != 0)
  v3 = v2;
  v4 = -[BuddyAppleIDSignInController continueButton](v15, "continueButton");
  -[OBBoldTrayButton setEnabled:](v4, "setEnabled:", v3);

  objc_storeStrong(&location, 0);
  objc_storeStrong(v14, 0);
}

- (void)setShowsPasswordAsField:(BOOL)a3
{
  -[BuddyAppleIDSignInController setShowsPasswordAsField:animated:](self, "setShowsPasswordAsField:animated:", a3, 0);
}

- (void)setShowsPasswordAsField:(BOOL)a3 animated:(BOOL)a4
{
  NSIndexPath *v4;
  uint64_t v5;
  void **v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  BuddyAppleIDSignInController *v11;
  id v12[2];
  void **v13;
  int v14;
  int v15;
  void (*v16)(uint64_t);
  void *v17;
  BuddyAppleIDSignInController *v18;
  void **v19;
  int v20;
  int v21;
  void (*v22)(uint64_t);
  void *v23;
  BuddyAppleIDSignInController *v24;
  id v25;
  void *v26;
  id location;
  BOOL v28;
  BOOL v29;
  SEL v30;
  BuddyAppleIDSignInController *v31;
  NSIndexPath *v32;

  v31 = self;
  v30 = a2;
  v29 = a3;
  v28 = a4;
  if (a3 != self->_showsPasswordAsField)
  {
    v31->_showsPasswordAsField = v29;
    v4 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v31->_showsUsernameAsField, 0);
    v32 = v4;
    location = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1);

    v26 = 0;
    if (v28)
      v5 = 100;
    else
      v5 = 5;
    v26 = (void *)v5;
    if (v29 && v31->_showsUsernameAsField)
    {
      v19 = _NSConcreteStackBlock;
      v20 = -1073741824;
      v21 = 0;
      v22 = sub_100112C64;
      v23 = &unk_100280D00;
      v24 = v31;
      v25 = location;
      v13 = _NSConcreteStackBlock;
      v14 = -1073741824;
      v15 = 0;
      v16 = sub_100112CF4;
      v17 = &unk_1002808D0;
      v18 = v31;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", &v19, &v13, 0.2);
      objc_storeStrong((id *)&v18, 0);
      objc_storeStrong(&v25, 0);
      objc_storeStrong((id *)&v24, 0);
    }
    else
    {
      v6 = _NSConcreteStackBlock;
      v7 = -1073741824;
      v8 = 0;
      v9 = sub_100112D48;
      v10 = &unk_100283070;
      v11 = v31;
      v12[0] = location;
      v12[1] = v26;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", &v6, &stru_1002830B0, 0.2);
      objc_storeStrong(v12, 0);
      objc_storeStrong((id *)&v11, 0);
    }
    objc_storeStrong(&location, 0);
  }
}

- (double)headerViewBottomToTableViewTopPadding
{
  id v2;
  id v3;
  id v4;
  id v5;
  UIScreen *v6;
  double v7;
  BOOL v8;
  double v9;
  double v10;
  char v12;
  UIScreen *v13;
  char v14;
  UIScreen *v15;
  double v16;

  v16 = 0.0;
  v2 = +[BYDevice currentDevice](BYDevice, "currentDevice");
  v3 = objc_msgSend(v2, "type");

  if (v3 == (id)1)
    return 37.0;
  v4 = +[BYDevice currentDevice](BYDevice, "currentDevice");
  v5 = objc_msgSend(v4, "size");

  switch((unint64_t)v5)
  {
    case 0uLL:
    case 1uLL:
    case 3uLL:
    case 5uLL:
      v16 = 26.0;
      break;
    case 2uLL:
      v16 = 20.0;
      break;
    case 4uLL:
      v16 = 37.0;
      break;
    case 6uLL:
      v6 = +[UIScreen mainScreen](UIScreen, "mainScreen");
      -[UIScreen bounds](v6, "bounds");
      v14 = 0;
      v12 = 0;
      v8 = 0;
      if (v7 == 414.0)
      {
        v15 = +[UIScreen mainScreen](UIScreen, "mainScreen", v7);
        v14 = 1;
        -[UIScreen bounds](v15, "bounds");
        v8 = 0;
        if (v9 == 896.0)
        {
          v13 = +[UIScreen mainScreen](UIScreen, "mainScreen", v9);
          v12 = 1;
          -[UIScreen scale](v13, "scale");
          v8 = v10 == 3.0;
        }
      }
      if ((v12 & 1) != 0)

      if ((v14 & 1) != 0)
      if (v8)
        v16 = 37.0;
      else
        v16 = 26.0;
      break;
    default:
      return v16;
  }
  return v16;
}

- (void)setKeyboardFrame:(CGRect)a3
{
  id v3;
  NSIndexSet *v4;
  objc_super v5;
  SEL v6;
  BuddyAppleIDSignInController *v7;
  CGRect v8;

  v8 = a3;
  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)BuddyAppleIDSignInController;
  -[BuddyAppleIDSignInController setKeyboardFrame:](&v5, "setKeyboardFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3 = -[BuddyAppleIDSignInController tableView](v7, "tableView");
  v4 = +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 1);
  objc_msgSend(v3, "_reloadSectionHeaderFooters:withRowAnimation:", v4, 5);

}

- (BOOL)_scrollViewContentIsUnderTray
{
  id v2;
  id v3;
  id v4;
  id v5;
  BOOL v6;
  int v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  CGFloat v14;
  id v15;
  CGFloat v16;
  BOOL v17;
  double v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;
  double v24;
  BOOL v25;
  CGRect v27;

  v2 = -[BuddyAppleIDSignInController tableView](self, "tableView");
  v3 = objc_msgSend(v2, "tableFooterView");
  v4 = -[BuddyAppleIDSignInController buttonTray](self, "buttonTray");
  v5 = objc_msgSend(v4, "superview");
  v6 = v3 == v5;

  v25 = v6;
  if (sub_10011133C())
    v7 = 17;
  else
    v7 = 12;
  v24 = (double)v7;
  v8 = -[BuddyAppleIDSignInController view](self, "view");
  -[BFFLinkLabelFooterView frame](self->_topSectionFooterView, "frame");
  v20 = v9;
  v19 = v10;
  v22 = v11;
  v21 = v12;
  v13 = -[BuddyAppleIDSignInController tableView](self, "tableView");
  objc_msgSend(v8, "convertRect:fromView:", v13, v19, v20, v21, v22);
  v14 = CGRectGetMaxY(v27) - v24;
  v15 = -[BuddyAppleIDSignInController buttonTray](self, "buttonTray");
  objc_msgSend(v15, "frame");
  v17 = v14 > v16;

  v23 = v17;
  if (v25)
    return 0;
  return v23;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)appearanceHandler
{
  return self->_appearanceHandler;
}

- (void)setAppearanceHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)authModeHandler
{
  return self->_authModeHandler;
}

- (void)setAuthModeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)proximityLoginHandler
{
  return self->_proximityLoginHandler;
}

- (void)setProximityLoginHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)showsUsernameAsField
{
  return self->_showsUsernameAsField;
}

- (void)setShowsUsernameAsField:(BOOL)a3
{
  self->_showsUsernameAsField = a3;
}

- (BOOL)showsPasswordAsField
{
  return self->_showsPasswordAsField;
}

- (BOOL)isUsernameEditable
{
  return self->_isUsernameEditable;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (BOOL)showsInfoSection
{
  return self->_showsInfoSection;
}

- (void)setShowsInfoSection:(BOOL)a3
{
  self->_showsInfoSection = a3;
}

- (id)loginOptionsConstructor
{
  return self->_loginOptionsConstructor;
}

- (void)setLoginOptionsConstructor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)credentialRecoveryHandler
{
  return self->_credentialRecoveryHandler;
}

- (void)setCredentialRecoveryHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (NSLayoutConstraint)headerTopOffsetConstraint
{
  return self->_headerTopOffsetConstraint;
}

- (void)setHeaderTopOffsetConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_headerTopOffsetConstraint, a3);
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
  objc_storeStrong((id *)&self->_animationController, a3);
}

- (id)loginOptionsAction
{
  return self->_loginOptionsAction;
}

- (void)setLoginOptionsAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (OBBoldTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong(&self->_loginOptionsAction, 0);
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_headerTopOffsetConstraint, 0);
  objc_storeStrong(&self->_credentialRecoveryHandler, 0);
  objc_storeStrong(&self->_loginOptionsConstructor, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong(&self->_proximityLoginHandler, 0);
  objc_storeStrong(&self->_authModeHandler, 0);
  objc_storeStrong(&self->_appearanceHandler, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_topSectionFooterView, 0);
  objc_storeStrong((id *)&self->_lastEnteredUsername, 0);
  objc_storeStrong((id *)&self->_passwordCell, 0);
  objc_storeStrong((id *)&self->_usernameCell, 0);
}

@end
