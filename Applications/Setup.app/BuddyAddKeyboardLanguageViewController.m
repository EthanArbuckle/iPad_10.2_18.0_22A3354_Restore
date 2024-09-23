@implementation BuddyAddKeyboardLanguageViewController

- (BuddyAddKeyboardLanguageViewController)initWithCompletion:(id)a3
{
  id v3;
  BuddyAddKeyboardLanguageViewController *v4;
  objc_super v6;
  id location[2];
  id v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)BuddyAddKeyboardLanguageViewController;
  v8 = -[BuddyAddKeyboardLanguageViewController init](&v6, "init");
  objc_storeStrong(&v8, v8);
  if (v8)
    objc_msgSend(v8, "setCompletion:", location[0]);
  v4 = (BuddyAddKeyboardLanguageViewController *)v8;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v8, 0);
  return v4;
}

- (void)viewDidLoad
{
  id v2;
  id location;
  objc_super v4;
  SEL v5;
  BuddyAddKeyboardLanguageViewController *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)BuddyAddKeyboardLanguageViewController;
  -[BuddyAddKeyboardLanguageViewController viewDidLoad](&v4, "viewDidLoad");
  location = objc_alloc_init((Class)KSAddKeyboardLanguageListController);
  objc_msgSend(location, "setReturnSuggestedInputModes:", 1);
  objc_msgSend(location, "setRootController:", v6);
  v2 = objc_alloc_init((Class)PSSpecifier);
  objc_msgSend(location, "setSpecifier:", v2);

  objc_msgSend(location, "setParentController:", v6);
  -[BuddyAddKeyboardLanguageViewController showController:](v6, "showController:", location);
  -[BuddyAddKeyboardLanguageViewController setController:](v6, "setController:", location);
  objc_storeStrong(&location, 0);
}

- (void)dismiss
{
  NSObject *v2;
  os_log_type_t v3;
  BuddyAddKeyboardLanguageViewController *v4;
  objc_super v5;
  void **v6;
  int v7;
  int v8;
  void (*v9);
  void *v10;
  BuddyAddKeyboardLanguageViewController *v11;
  uint8_t buf[7];
  char v13;
  id location[2];
  BuddyAddKeyboardLanguageViewController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = (id)_BYLoggingFacility(self);
  v13 = 2;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
  {
    v2 = location[0];
    v3 = v13;
    sub_100038C3C(buf);
    _os_log_debug_impl((void *)&_mh_execute_header, v2, v3, "Add keyboard language view controller will dismiss", buf, 2u);
  }
  objc_storeStrong(location, 0);
  v4 = v15;
  v6 = _NSConcreteStackBlock;
  v7 = -1073741824;
  v8 = 0;
  v9 = sub_1000AA2BC;
  v10 = &unk_100280730;
  v11 = v15;
  v5.receiver = v4;
  v5.super_class = (Class)BuddyAddKeyboardLanguageViewController;
  -[BuddyAddKeyboardLanguageViewController dismissWithCompletion:](&v5, "dismissWithCompletion:", &v6);
  objc_storeStrong((id *)&v11, 0);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (KSAddKeyboardLanguageListController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  objc_storeStrong((id *)&self->_controller, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
