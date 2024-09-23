@implementation BuddyNavigationAnalytics

- (BuddyNavigationAnalytics)init
{
  id v2;
  void *v3;
  BuddyNavigationAnalytics *v4;
  objc_super v6;
  SEL v7;
  id location;

  v7 = a2;
  location = 0;
  v6.receiver = self;
  v6.super_class = (Class)BuddyNavigationAnalytics;
  location = -[BuddyNavigationAnalytics init](&v6, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = objc_alloc_init((Class)NSMutableArray);
    v3 = (void *)*((_QWORD *)location + 1);
    *((_QWORD *)location + 1) = v2;

  }
  v4 = (BuddyNavigationAnalytics *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (BuddyNavigationAnalytics)initWithNavigationController:(id)a3
{
  id v3;
  BuddyNavigationAnalytics *v4;
  id location[2];
  id v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v7;
  v7 = 0;
  v7 = objc_msgSend(v3, "init");
  objc_storeStrong(&v7, v7);
  if (v7)
    objc_msgSend(location[0], "addDelegateObserver:", v7);
  v4 = (BuddyNavigationAnalytics *)v7;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v7, 0);
  return v4;
}

- (void)didBecomeActive
{
  void *v2;
  double v3;
  double v4;
  double v5;

  v2 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v2);

  -[BuddyNavigationAnalytics setActiveStartTimestamp:](self, "setActiveStartTimestamp:", +[BuddyTimestamp currentTimestamp](BuddyTimestamp, "currentTimestamp", a2));
  if (-[BuddyNavigationAnalytics backgroundStartTimestamp](self, "backgroundStartTimestamp"))
  {
    +[BuddyTimestamp intervalSinceTimestamp:](BuddyTimestamp, "intervalSinceTimestamp:", -[BuddyNavigationAnalytics backgroundStartTimestamp](self, "backgroundStartTimestamp"));
    v4 = v3;
    -[BuddyNavigationAnalytics currentViewControllerBackgroundDuration](self, "currentViewControllerBackgroundDuration");
    -[BuddyNavigationAnalytics setCurrentViewControllerBackgroundDuration:](self, "setCurrentViewControllerBackgroundDuration:", v5 + v4);
    -[BuddyNavigationAnalytics setBackgroundStartTimestamp:](self, "setBackgroundStartTimestamp:", 0);
  }
}

- (void)didEnterBackground
{
  void *v2;
  double v3;
  double v4;
  double v5;

  v2 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v2);

  -[BuddyNavigationAnalytics setBackgroundStartTimestamp:](self, "setBackgroundStartTimestamp:", +[BuddyTimestamp currentTimestamp](BuddyTimestamp, "currentTimestamp", a2));
  if (-[BuddyNavigationAnalytics activeStartTimestamp](self, "activeStartTimestamp"))
  {
    +[BuddyTimestamp intervalSinceTimestamp:](BuddyTimestamp, "intervalSinceTimestamp:", -[BuddyNavigationAnalytics activeStartTimestamp](self, "activeStartTimestamp"));
    v4 = v3;
    -[BuddyNavigationAnalytics currentViewControllerActiveDuration](self, "currentViewControllerActiveDuration");
    -[BuddyNavigationAnalytics setCurrentViewControllerActiveDuration:](self, "setCurrentViewControllerActiveDuration:", v5 + v4);
    -[BuddyNavigationAnalytics setActiveStartTimestamp:](self, "setActiveStartTimestamp:", 0);
  }
}

- (void)prepareEventForCurrentViewController
{
  UIViewController *v2;

  v2 = -[BuddyNavigationAnalytics currentViewController](self, "currentViewController", a2);

  if (v2)
  {
    -[BuddyNavigationAnalytics _addEventForCurrentViewController](self, "_addEventForCurrentViewController");
    -[BuddyNavigationAnalytics setCurrentViewController:](self, "setCurrentViewController:", 0);
  }
}

- (void)addEventsUsingAnalyticsManager:(id)a3
{
  NSMutableArray *v3;
  id v4;
  uint64_t v5;
  unint64_t i;
  _QWORD __b[8];
  uint64_t v8;
  id location[2];
  BuddyNavigationAnalytics *v10;
  _BYTE v11[128];

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  v3 = -[BuddyNavigationAnalytics eventPayloads](v10, "eventPayloads");
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", __b, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(_QWORD *)__b[2] != v5)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(__b[1] + 8 * i);
        objc_msgSend(location[0], "addEvent:withPayload:persist:", CFSTR("com.apple.setupassistant.ios.pane_duration"), v8, 1);
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", __b, v11, 16);
    }
    while (v4);
  }

  objc_storeStrong(location, 0);
}

- (void)setCurrentViewController:(id)a3
{
  unint64_t v3;
  unint64_t v4;
  id location[2];
  BuddyNavigationAnalytics *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v6->_currentViewController, location[0]);
  if (-[BuddyNavigationAnalytics activeStartTimestamp](v6, "activeStartTimestamp"))
  {
    v3 = +[BuddyTimestamp currentTimestamp](BuddyTimestamp, "currentTimestamp");
    -[BuddyNavigationAnalytics setActiveStartTimestamp:](v6, "setActiveStartTimestamp:", v3);
  }
  if (-[BuddyNavigationAnalytics backgroundStartTimestamp](v6, "backgroundStartTimestamp"))
  {
    v4 = +[BuddyTimestamp currentTimestamp](BuddyTimestamp, "currentTimestamp");
    -[BuddyNavigationAnalytics setBackgroundStartTimestamp:](v6, "setBackgroundStartTimestamp:", v4);
  }
  -[BuddyNavigationAnalytics setCurrentViewControllerActiveDuration:](v6, "setCurrentViewControllerActiveDuration:", 0.0);
  -[BuddyNavigationAnalytics setCurrentViewControllerBackgroundDuration:](v6, "setCurrentViewControllerBackgroundDuration:", 0.0);
  objc_storeStrong(location, 0);
}

- (void)_addEventForCurrentViewController
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIViewController *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  if (-[BuddyNavigationAnalytics activeStartTimestamp](self, "activeStartTimestamp", a2))
  {
    +[BuddyTimestamp intervalSinceTimestamp:](BuddyTimestamp, "intervalSinceTimestamp:", -[BuddyNavigationAnalytics activeStartTimestamp](self, "activeStartTimestamp"));
    v3 = v2;
    -[BuddyNavigationAnalytics currentViewControllerActiveDuration](self, "currentViewControllerActiveDuration");
    -[BuddyNavigationAnalytics setCurrentViewControllerActiveDuration:](self, "setCurrentViewControllerActiveDuration:", v4 + v3);
  }
  if (-[BuddyNavigationAnalytics backgroundStartTimestamp](self, "backgroundStartTimestamp"))
  {
    +[BuddyTimestamp intervalSinceTimestamp:](BuddyTimestamp, "intervalSinceTimestamp:", -[BuddyNavigationAnalytics backgroundStartTimestamp](self, "backgroundStartTimestamp"));
    v6 = v5;
    -[BuddyNavigationAnalytics currentViewControllerBackgroundDuration](self, "currentViewControllerBackgroundDuration");
    -[BuddyNavigationAnalytics setCurrentViewControllerBackgroundDuration:](self, "setCurrentViewControllerBackgroundDuration:", v7 + v6);
  }
  v8 = -[BuddyNavigationAnalytics currentViewController](self, "currentViewController");
  v9 = objc_opt_class(v8);
  -[BuddyNavigationAnalytics currentViewControllerActiveDuration](self, "currentViewControllerActiveDuration");
  v11 = v10;
  -[BuddyNavigationAnalytics currentViewControllerBackgroundDuration](self, "currentViewControllerBackgroundDuration");
  -[BuddyNavigationAnalytics _addEventForClass:activeDuration:backgroundDuration:](self, "_addEventForClass:activeDuration:backgroundDuration:", v9, v11, v12);

}

- (void)_addEventForClass:(Class)a3 activeDuration:(double)a4 backgroundDuration:(double)a5
{
  NSMutableArray *v5;
  NSString *v6;
  NSNumber *v7;
  NSNumber *v8;
  NSDictionary *v9;
  _QWORD v13[3];
  _QWORD v14[3];

  v5 = -[BuddyNavigationAnalytics eventPayloads](self, "eventPayloads");
  v13[0] = CFSTR("class");
  v6 = NSStringFromClass(a3);
  v14[0] = v6;
  v13[1] = CFSTR("activeDuration");
  v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4);
  v14[1] = v7;
  v13[2] = CFSTR("backgroundDuration");
  v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5);
  v14[2] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  -[NSMutableArray addObject:](v5, "addObject:", v9);

}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 operation:(int64_t)a5 animated:(BOOL)a6
{
  UIViewController *v7;
  id v8;
  id location[2];
  BuddyNavigationAnalytics *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v7 = -[BuddyNavigationAnalytics currentViewController](v10, "currentViewController");

  if (v7)
    -[BuddyNavigationAnalytics _addEventForCurrentViewController](v10, "_addEventForCurrentViewController");
  -[BuddyNavigationAnalytics setCurrentViewController:](v10, "setCurrentViewController:", v8);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (NSMutableArray)eventPayloads
{
  return self->_eventPayloads;
}

- (void)setEventPayloads:(id)a3
{
  objc_storeStrong((id *)&self->_eventPayloads, a3);
}

- (unint64_t)activeStartTimestamp
{
  return self->_activeStartTimestamp;
}

- (void)setActiveStartTimestamp:(unint64_t)a3
{
  self->_activeStartTimestamp = a3;
}

- (unint64_t)backgroundStartTimestamp
{
  return self->_backgroundStartTimestamp;
}

- (void)setBackgroundStartTimestamp:(unint64_t)a3
{
  self->_backgroundStartTimestamp = a3;
}

- (UIViewController)currentViewController
{
  return self->_currentViewController;
}

- (double)currentViewControllerActiveDuration
{
  return self->_currentViewControllerActiveDuration;
}

- (void)setCurrentViewControllerActiveDuration:(double)a3
{
  self->_currentViewControllerActiveDuration = a3;
}

- (double)currentViewControllerBackgroundDuration
{
  return self->_currentViewControllerBackgroundDuration;
}

- (void)setCurrentViewControllerBackgroundDuration:(double)a3
{
  self->_currentViewControllerBackgroundDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentViewController, 0);
  objc_storeStrong((id *)&self->_eventPayloads, 0);
}

@end
