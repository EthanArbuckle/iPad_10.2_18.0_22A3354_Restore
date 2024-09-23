@implementation BuddyNavigationPit

+ (id)shared
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&unk_1002EE9A0;
  location = 0;
  objc_storeStrong(&location, &stru_1002823E8);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)qword_1002EE998;
}

- (BOOL)controllerNeedsToRunForClass:(Class)a3
{
  NSString *v4;

  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "-[BuddyNavigationPit controllerNeedsToRunForClass:]");
  -[BuddyNavigationPit _pitLog:withObject:](self, "_pitLog:withObject:", v4, a3);

  return 0;
}

- (BOOL)isFlowItemOnTop:(id)a3
{
  BuddyNavigationPit *v3;
  NSString *v4;
  id location[2];
  BuddyNavigationPit *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v7;
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "-[BuddyNavigationPit isFlowItemOnTop:]");
  -[BuddyNavigationPit _pitLog:withObject:](v3, "_pitLog:withObject:", v4, location[0]);

  objc_storeStrong(location, 0);
  return 0;
}

- (void)markFlowItemDone:(id)a3
{
  BuddyNavigationPit *v3;
  NSString *v4;
  id location[2];
  BuddyNavigationPit *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v6;
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "-[BuddyNavigationPit markFlowItemDone:]");
  -[BuddyNavigationPit _pitLog:withObject:](v3, "_pitLog:withObject:", v4, location[0]);

  objc_storeStrong(location, 0);
}

- (id)popToBuddyControllerWithClass:(Class)a3 animated:(BOOL)a4
{
  NSString *v5;

  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "-[BuddyNavigationPit popToBuddyControllerWithClass:animated:]");
  -[BuddyNavigationPit _pitLog:withObject:](self, "_pitLog:withObject:", v5, a3);

  return 0;
}

- (id)popToBuddyControllerWithClass:(Class)a3 withOffset:(unint64_t)a4 animated:(BOOL)a5
{
  NSString *v6;

  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "-[BuddyNavigationPit popToBuddyControllerWithClass:withOffset:animated:]");
  -[BuddyNavigationPit _pitLog:withObject:](self, "_pitLog:withObject:", v6, a3);

  return 0;
}

- (void)pushFlowItem:(id)a3 animated:(BOOL)a4
{
  BuddyNavigationPit *v4;
  NSString *v5;
  id location[2];
  BuddyNavigationPit *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = v7;
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "-[BuddyNavigationPit pushFlowItem:animated:]");
  -[BuddyNavigationPit _pitLog:withObject:](v4, "_pitLog:withObject:", v5, location[0]);

  objc_storeStrong(location, 0);
}

- (void)pushFlowItem:(id)a3 inFlow:(id)a4 animated:(BOOL)a5
{
  BuddyNavigationPit *v6;
  NSString *v7;
  id v8;
  id location[2];
  BuddyNavigationPit *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v6 = v10;
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "-[BuddyNavigationPit pushFlowItem:inFlow:animated:]");
  -[BuddyNavigationPit _pitLog:withObject:](v6, "_pitLog:withObject:", v7, location[0]);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)pushFlowItem:(id)a3 inFlow:(id)a4 withExtendedInitialization:(BOOL)a5 animated:(BOOL)a6
{
  BuddyNavigationPit *v7;
  NSString *v8;
  id v9;
  id location[2];
  BuddyNavigationPit *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v7 = v11;
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "-[BuddyNavigationPit pushFlowItem:inFlow:withExtendedInitialization:animated:]");
  -[BuddyNavigationPit _pitLog:withObject:](v7, "_pitLog:withObject:", v8, location[0]);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)pushFlowItem:(id)a3 inFlow:(id)a4 withExtendedInitialization:(BOOL)a5 animated:(BOOL)a6 willPushFlowItem:(id)a7
{
  BuddyNavigationPit *v11;
  NSString *v12;
  id v13;
  BOOL v14;
  BOOL v15;
  id v16;
  id location[2];
  BuddyNavigationPit *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v15 = a5;
  v14 = a6;
  v13 = 0;
  objc_storeStrong(&v13, a7);
  v11 = v18;
  v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "-[BuddyNavigationPit pushFlowItem:inFlow:withExtendedInitialization:animated:willPushFlowItem:]");
  -[BuddyNavigationPit _pitLog:withObject:](v11, "_pitLog:withObject:", v12, location[0]);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)removeViewControllersOnNextPush:(id)a3
{
  BuddyNavigationPit *v3;
  NSString *v4;
  id location[2];
  BuddyNavigationPit *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v6;
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "-[BuddyNavigationPit removeViewControllersOnNextPush:]");
  -[BuddyNavigationPit _pitLog:withObject:](v3, "_pitLog:withObject:", v4, location[0]);

  objc_storeStrong(location, 0);
}

- (void)flowItemCancelled:(id)a3
{
  BuddyNavigationPit *v3;
  NSString *v4;
  id location[2];
  BuddyNavigationPit *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v6;
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "-[BuddyNavigationPit flowItemCancelled:]");
  -[BuddyNavigationPit _pitLog:withObject:](v3, "_pitLog:withObject:", v4, location[0]);

  objc_storeStrong(location, 0);
}

- (void)flowItemDone:(id)a3
{
  BuddyNavigationPit *v3;
  NSString *v4;
  id location[2];
  BuddyNavigationPit *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v6;
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "-[BuddyNavigationPit flowItemDone:]");
  -[BuddyNavigationPit _pitLog:withObject:](v3, "_pitLog:withObject:", v4, location[0]);

  objc_storeStrong(location, 0);
}

- (void)flowItemDone:(id)a3 nextItem:(id)a4
{
  BuddyNavigationPit *v5;
  NSString *v6;
  id v7;
  id location[2];
  BuddyNavigationPit *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v5 = v9;
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "-[BuddyNavigationPit flowItemDone:nextItem:]");
  -[BuddyNavigationPit _pitLog:withObject:](v5, "_pitLog:withObject:", v6, location[0]);

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)flowItemDone:(id)a3 nextItemClass:(Class)a4
{
  BuddyNavigationPit *v4;
  NSString *v5;
  id location[2];
  BuddyNavigationPit *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = v7;
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "-[BuddyNavigationPit flowItemDone:nextItemClass:]");
  -[BuddyNavigationPit _pitLog:withObject:](v4, "_pitLog:withObject:", v5, location[0]);

  objc_storeStrong(location, 0);
}

- (void)flow:(id)a3 finishedWithLastItem:(id)a4 nextItem:(id)a5
{
  BuddyNavigationPit *v7;
  NSString *v8;
  id v9;
  id v10;
  id location[2];
  BuddyNavigationPit *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v9 = 0;
  objc_storeStrong(&v9, a5);
  v7 = v12;
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "-[BuddyNavigationPit flow:finishedWithLastItem:nextItem:]");
  -[BuddyNavigationPit _pitLog:withObject:](v7, "_pitLog:withObject:", v8, v10);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)presentWiFiPaneForFlow:(id)a3
{
  BuddyNavigationPit *v3;
  NSString *v4;
  id location[2];
  BuddyNavigationPit *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v6;
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "-[BuddyNavigationPit presentWiFiPaneForFlow:]");
  -[BuddyNavigationPit _pitLog:withObject:](v3, "_pitLog:withObject:", v4, location[0]);

  objc_storeStrong(location, 0);
}

- (void)_pitLog:(id)a3 withObject:(id)a4
{
  uint64_t v5;
  os_log_t oslog;
  id v7;
  id location[3];
  uint8_t buf[24];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  oslog = (os_log_t)(id)_BYLoggingFacility(v5);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
  {
    sub_1000C3528((uint64_t)buf, (uint64_t)location[0], (uint64_t)v7);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

@end
