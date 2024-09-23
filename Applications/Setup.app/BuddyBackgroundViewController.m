@implementation BuddyBackgroundViewController

- (void)viewDidLoad
{
  id v2;
  UIBlurEffect *v3;
  id v4;
  objc_super v5;
  SEL v6;
  BuddyBackgroundViewController *v7;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)BuddyBackgroundViewController;
  -[BuddyBackgroundViewController viewDidLoad](&v5, "viewDidLoad");
  v2 = objc_alloc((Class)UIVisualEffectView);
  v3 = +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 19);
  v4 = objc_msgSend(v2, "initWithEffect:", v3);
  -[BuddyBackgroundViewController setView:](v7, "setView:", v4);

  -[BuddyBackgroundViewController setBuddyBackgroundFilterStyle:](v7, "setBuddyBackgroundFilterStyle:", 0);
}

- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  uint64_t v4;
  id v5;
  os_log_t oslog;
  id location;
  int v8;
  SEL v9;
  BuddyBackgroundViewController *v10;
  uint8_t buf[24];

  v10 = self;
  v9 = a2;
  v8 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  oslog = (os_log_t)(id)_BYLoggingFacility(v4);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[BuddyBackgroundViewController presentedViewController](v10, "presentedViewController");
    sub_100038C28((uint64_t)buf, (uint64_t)v5);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Preventing dismissal of %@...", buf, 0xCu);

  }
  objc_storeStrong((id *)&oslog, 0);
  if (location)
    (*((void (**)(void))location + 2))();
  objc_storeStrong(&location, 0);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  uint64_t v4;
  id v5;
  os_log_t oslog;
  id location;
  BOOL v8;
  SEL v9;
  BuddyBackgroundViewController *v10;
  uint8_t buf[24];

  v10 = self;
  v9 = a2;
  v8 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  oslog = (os_log_t)(id)_BYLoggingFacility(v4);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[BuddyBackgroundViewController presentedViewController](v10, "presentedViewController");
    sub_100038C28((uint64_t)buf, (uint64_t)v5);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Preventing dismissal of %@...", buf, 0xCu);

  }
  objc_storeStrong((id *)&oslog, 0);
  if (location)
    (*((void (**)(void))location + 2))();
  objc_storeStrong(&location, 0);
}

- (void)dismissModalViewControllerWithTransition:(int)a3
{
  id v3;
  os_log_t oslog;
  int v5;
  SEL v6;
  BuddyBackgroundViewController *v7;
  uint8_t buf[24];

  v7 = self;
  v6 = a2;
  v5 = a3;
  oslog = (os_log_t)(id)_BYLoggingFacility(self);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = -[BuddyBackgroundViewController presentedViewController](v7, "presentedViewController");
    sub_100038C28((uint64_t)buf, (uint64_t)v3);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Preventing dismissal of %@...", buf, 0xCu);

  }
  objc_storeStrong((id *)&oslog, 0);
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  id v2;
  unsigned __int8 v3;

  v2 = -[BuddyBackgroundViewController presentedViewController](self, "presentedViewController", a2, self);
  v3 = objc_msgSend(v2, "prefersStatusBarHidden");

  return v3 & 1;
}

- (void)setBuddyBackgroundFilterStyle:(unint64_t)a3
{
  void **v3;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8[2];
  os_log_type_t v9;
  os_log_t oslog;
  void *v11;
  SEL v12;
  BuddyBackgroundViewController *v13;
  uint8_t buf[24];

  v13 = self;
  v12 = a2;
  v11 = (void *)a3;
  oslog = (os_log_t)(id)_BYLoggingFacility(self);
  v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000342B4((uint64_t)buf, (uint64_t)v11);
    _os_log_impl((void *)&_mh_execute_header, oslog, v9, "Setting background style: %lu", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v3 = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_100193658;
  v7 = &unk_100280BA8;
  v8[0] = v13;
  v8[1] = v11;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", &v3, 0.5);
  objc_storeStrong(v8, 0);
}

- (double)alphaForBuddyBackgroundStyle:(unint64_t)a3
{
  double v4;

  if (!a3)
    return 0.0;
  if (a3 == 1)
    return 0.7;
  return v4;
}

@end
