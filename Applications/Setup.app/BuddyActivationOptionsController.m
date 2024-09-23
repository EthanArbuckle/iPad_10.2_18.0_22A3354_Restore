@implementation BuddyActivationOptionsController

- (BuddyActivationOptionsController)init
{
  NSBundle *v2;
  id v3;
  id v4;
  id v5;
  NSBundle *v6;
  NSString *v7;
  BuddyActivationOptionsController *v8;
  objc_super v10;
  id v11[2];
  id location;

  location = self;
  v11[1] = (id)a2;
  v2 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v3 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("OTHER_CONNECTION_OPTIONS_DETAIL_WIFI"));
  v4 = (id)SFLocalizableWAPIStringKeyForKey(v3);
  v11[0] = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", v4, &stru_100284738, CFSTR("Localizable"));

  v5 = location;
  v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v7 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("OTHER_CONNECTION_OPTIONS_TITLE"), &stru_100284738, CFSTR("Localizable"));
  location = 0;
  v10.receiver = v5;
  v10.super_class = (Class)BuddyActivationOptionsController;
  location = -[BuddyActivationOptionsController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v10, "initWithTitle:detailText:icon:adoptTableViewScrollView:", v7, v11[0], 0, 1);
  objc_storeStrong(&location, location);

  v8 = (BuddyActivationOptionsController *)location;
  objc_storeStrong(v11, 0);
  objc_storeStrong(&location, 0);
  return v8;
}

- (void)viewDidLoad
{
  id v2;
  BuddyActivationOptionsController *v3;
  id v4;
  BuddyActivationOptionsController *v5;
  id v6;
  id v7;
  id v8;
  objc_super v9;
  SEL v10;
  BuddyActivationOptionsController *v11;

  v11 = self;
  v10 = a2;
  v9.receiver = self;
  v9.super_class = (Class)BuddyActivationOptionsController;
  -[BuddyActivationOptionsController viewDidLoad](&v9, "viewDidLoad");
  v2 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[BuddyActivationOptionsController setTableView:](v11, "setTableView:", v2);

  v3 = v11;
  v4 = -[BuddyActivationOptionsController tableView](v11, "tableView");
  objc_msgSend(v4, "setDelegate:", v3);

  v5 = v11;
  v6 = -[BuddyActivationOptionsController tableView](v11, "tableView");
  objc_msgSend(v6, "setDataSource:", v5);

  v7 = -[BuddyActivationOptionsController tableView](v11, "tableView");
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v8 = -[BuddyActivationOptionsController tableView](v11, "tableView");
  objc_msgSend(v8, "setSeparatorStyle:", 0);

}

- (id)_titleFont
{
  id v2;
  UIFont *v3;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleBody);
  v2 = objc_msgSend(location[0], "fontDescriptorWithSymbolicTraits:", 2);
  v3 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v2, 0.0);

  objc_storeStrong(location, 0);
  return v3;
}

- (unint64_t)_activationMethodForSection:(unint64_t)a3
{
  return a3;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (BOOL)controllerNeedsToRun
{
  BuddyActivationState *v2;
  BuddyActivationError *v3;
  BOOL v4;

  v2 = -[BuddyActivationOptionsController activationState](self, "activationState", a2, self);
  v3 = -[BuddyActivationState error](v2, "error");
  v4 = v3 != 0;

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  UIColor *v5;
  id v6;
  id v7;
  id v8;
  NSBundle *v9;
  NSString *v10;
  id v11;
  NSBundle *v12;
  id v13;
  NSString *v14;
  id v15;
  id v16;
  id v18;
  id v19;
  id location[2];
  BuddyActivationOptionsController *v21;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v18 = objc_msgSend(location[0], "dequeueReusableCellWithIdentifier:", CFSTR("cell"));
  if (!v18)
  {
    v18 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 3, CFSTR("cell"));

  }
  objc_msgSend(v18, "setAccessoryType:", 1);
  v5 = +[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor");
  objc_msgSend(v18, "setBackgroundColor:", v5);

  v6 = -[BuddyActivationOptionsController _titleFont](v21, "_titleFont");
  v7 = objc_msgSend(v18, "textLabel");
  objc_msgSend(v7, "setFont:", v6);

  v8 = -[BuddyActivationOptionsController _activationMethodForSection:](v21, "_activationMethodForSection:", objc_msgSend(v19, "section"));
  if (v8)
  {
    if (v8 == (id)1)
    {
      v9 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v10 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("USE_MAC_OR_PC"), &stru_100284738, CFSTR("Localizable"));
      v11 = objc_msgSend(v18, "textLabel");
      objc_msgSend(v11, "setText:", v10);

    }
  }
  else
  {
    v12 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v13 = (id)SFLocalizableWAPIStringKeyForKey(CFSTR("USE_WIFI"));
    v14 = -[NSBundle localizedStringForKey:value:table:](v12, "localizedStringForKey:value:table:", v13, &stru_100284738, CFSTR("Localizable"));
    v15 = objc_msgSend(v18, "textLabel");
    objc_msgSend(v15, "setText:", v14);

  }
  v16 = v18;
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return v16;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 1;
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

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  BuddyMiscState *v5;
  BFFFlowItemDelegate *v6;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  BuddyActivationOptionsController *v11;
  void **v12;
  int v13;
  int v14;
  void (*v15)(uint64_t);
  void *v16;
  BuddyActivationOptionsController *v17;
  id v18;
  id v19;
  id v20;
  id location[2];
  BuddyActivationOptionsController *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  objc_storeStrong(&v20, a4);
  objc_msgSend(location[0], "deselectRowAtIndexPath:animated:", v20, 1);
  v19 = -[BuddyActivationOptionsController _activationMethodForSection:](v22, "_activationMethodForSection:", objc_msgSend(v20, "section"));
  if (v19)
  {
    if (v19 == (id)1)
    {
      v18 = +[BuddySkipWiFiAlertController alertController](BuddySkipWiFiAlertController, "alertController");
      v12 = _NSConcreteStackBlock;
      v13 = -1073741824;
      v14 = 0;
      v15 = sub_1001497F0;
      v16 = &unk_100280730;
      v17 = v22;
      objc_msgSend(v18, "setSkipWiFi:", &v12);
      v7 = _NSConcreteStackBlock;
      v8 = 3221225472;
      v9 = sub_100149898;
      v10 = &unk_100280730;
      v11 = v22;
      objc_msgSend(v18, "setUseWiFi:", &v7);
      -[BuddyActivationOptionsController presentViewController:animated:completion:](v22, "presentViewController:animated:completion:", v18, 1, 0, v7, v8, v9, v10);
      objc_storeStrong((id *)&v11, 0);
      objc_storeStrong((id *)&v17, 0);
      objc_storeStrong(&v18, 0);
    }
  }
  else
  {
    v5 = -[BuddyActivationOptionsController miscState](v22, "miscState");
    -[BuddyMiscState setUserSelectedCellularActivation:](v5, "setUserSelectedCellularActivation:", 0);

    v6 = -[BuddyActivationOptionsController delegate](v22, "delegate");
    -[BFFFlowItemDelegate presentWiFiPaneForFlowItem:](v6, "presentWiFiPaneForFlowItem:", v22);

  }
  objc_storeStrong(&v20, 0);
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

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
  objc_storeStrong((id *)&self->_miscState, a3);
}

- (BuddyActivationState)activationState
{
  return self->_activationState;
}

- (void)setActivationState:(id)a3
{
  objc_storeStrong((id *)&self->_activationState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationState, 0);
  objc_storeStrong((id *)&self->_miscState, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
