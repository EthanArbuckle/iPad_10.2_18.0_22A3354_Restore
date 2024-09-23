@implementation BuddyWelcomeController

- (BuddyWelcomeController)init
{
  id location[2];

  location[0] = self;
  objc_storeStrong(location, 0);
  return (BuddyWelcomeController *)location[1];
}

+ (unint64_t)applicableDispositions
{
  objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("Sub-classes should override"), 0, 0, a2, a1));
}

- (id)createLinkButtonWithTitle:(id)a3 action:(SEL)a4
{
  id v5;
  id v7[2];
  id location[2];
  BuddyWelcomeController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7[1] = (id)a4;
  v7[0] = +[OBLinkTrayButton linkButton](OBLinkTrayButton, "linkButton");
  objc_msgSend(v7[0], "setTitle:forState:", location[0], 0);
  objc_msgSend(v7[0], "addTarget:action:forControlEvents:", v9, a4, 64);
  v5 = v7[0];
  objc_storeStrong(v7, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (void)addLinkButton:(id)a3 action:(SEL)a4
{
  id v5;
  id v6[2];
  id location[2];
  BuddyWelcomeController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6[1] = (id)a4;
  v6[0] = -[BuddyWelcomeController createLinkButtonWithTitle:action:](v8, "createLinkButtonWithTitle:action:", location[0], a4);
  v5 = -[BuddyWelcomeController buttonTray](v8, "buttonTray");
  objc_msgSend(v5, "addButton:", v6[0]);

  objc_storeStrong(v6, 0);
  objc_storeStrong(location, 0);
}

- (void)addBoldButton:(id)a3 action:(SEL)a4
{
  id v5;
  id v6[2];
  id location[2];
  BuddyWelcomeController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6[1] = (id)a4;
  v6[0] = +[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton");
  objc_msgSend(v6[0], "setTitle:forState:", location[0], 0);
  objc_msgSend(v6[0], "addTarget:action:forControlEvents:", v8, a4, 64);
  v5 = -[BuddyWelcomeController buttonTray](v8, "buttonTray");
  objc_msgSend(v5, "addButton:", v6[0]);

  objc_storeStrong(v6, 0);
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  id location;
  os_log_type_t v4;
  os_log_t oslog;
  SEL aSelector;
  id v7;
  uint8_t buf[24];

  v7 = a1;
  aSelector = a2;
  oslog = (os_log_t)(id)_BYLoggingFacility(a1);
  v4 = OS_LOG_TYPE_FAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
  {
    location = NSStringFromSelector(aSelector);
    sub_100038C28((uint64_t)buf, (uint64_t)location);
    _os_log_fault_impl((void *)&_mh_execute_header, oslog, v4, "Subclasses must implement %@", buf, 0xCu);

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  return 0;
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
