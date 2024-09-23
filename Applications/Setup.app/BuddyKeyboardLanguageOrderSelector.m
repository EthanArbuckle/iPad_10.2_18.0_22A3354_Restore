@implementation BuddyKeyboardLanguageOrderSelector

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupKeyboard;
}

+ (BOOL)needsFullscreenPane
{
  id v2;
  unsigned __int8 v3;
  uint64_t v4;
  const char *v5;
  os_log_t oslog;
  char v8;
  SEL v9;
  id v10;
  uint8_t buf[24];

  v10 = a1;
  v9 = a2;
  v2 = +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v3 = objc_msgSend(v2, "currentLocaleRequiresExtendedSetup");

  v8 = v3 & 1;
  oslog = (os_log_t)(id)_BYLoggingFacility(v4);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if ((v8 & 1) != 0)
      v5 = "does";
    else
      v5 = "does not";
    sub_1000806F4((uint64_t)buf, (uint64_t)v5);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "The current locale %s require extended setup for keyboard/dictation.", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  return v8 & 1;
}

- (BuddyKeyboardLanguageOrderSelector)init
{
  NSBundle *v2;
  NSBundle *v3;
  id v4;
  NSBundle *v5;
  NSString *v6;
  BuddyKeyboardLanguageOrderSelector *v7;
  NSString *v9;
  id location[2];
  id v11;

  v11 = self;
  location[1] = (id)a2;
  v2 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  location[0] = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", CFSTR("MULTILINGUAL_KEYBOARD_LANGUAGE_TITLE"), &stru_100284738, CFSTR("Localizable"));

  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("MULTILINGUAL_KEYBOARD_LANGUAGE_SUBTEXT"));
  v9 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", v4, &stru_100284738, CFSTR("Localizable"));

  v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v6 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("MULTILINGUAL_KEYBOARD_LANGUAGE_ACTIONTEXT"), &stru_100284738, CFSTR("Localizable"));
  v11 = objc_msgSend(v11, "initWithTitle:detailText:symbolName:actionString:", location[0], v9, 0, v6);
  v7 = (BuddyKeyboardLanguageOrderSelector *)v11;

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v11, 0);
  return v7;
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;
  SEL v4;
  BuddyKeyboardLanguageOrderSelector *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyKeyboardLanguageOrderSelector;
  -[BuddyMultilingualBaseViewController viewDidLoad](&v3, "viewDidLoad");
  v2 = -[BuddyKeyboardLanguageOrderSelector buddy_animationController:](v5, "buddy_animationController:", CFSTR("Keyboard"));
  -[BuddyMultilingualBaseViewController setAnimationController:](v5, "setAnimationController:", v2);

}

- (void)continuePressed
{
  void *v2;
  id v3;
  BFFFlowItemDelegate *v4;
  objc_super v5;
  SEL v6;
  BuddyKeyboardLanguageOrderSelector *v7;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)BuddyKeyboardLanguageOrderSelector;
  -[BuddyMultilingualBaseViewController continuePressed](&v5, "continuePressed");
  v2 = (void *)objc_opt_class(v7);
  v3 = -[BuddyMultilingualBaseViewController backingStore](v7, "backingStore");
  objc_msgSend(v2, "writePreferredKeyboardLanguagesToSystem:", v3);

  v4 = -[BuddyMultilingualBaseViewController delegate](v7, "delegate");
  -[BFFFlowItemDelegate flowItemDone:nextItemClass:](v4, "flowItemDone:nextItemClass:", v7, 0);

}

- (void)presentAdditionViewController
{
  void *v2;
  id v3;
  BuddyAddKeyboardLanguageViewController *v4;
  void **v5;
  int v6;
  int v7;
  void (*v8)(id *);
  void *v9;
  id v10[3];
  id v11;
  id location[2];
  BuddyKeyboardLanguageOrderSelector *v13;

  v13 = self;
  location[1] = (id)a2;
  v2 = (void *)objc_opt_class(self);
  v3 = -[BuddyMultilingualBaseViewController backingStore](v13, "backingStore");
  objc_msgSend(v2, "writePreferredKeyboardLanguagesToSystem:", v3);

  objc_initWeak(location, v13);
  v4 = [BuddyAddKeyboardLanguageViewController alloc];
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_1001C2C8C;
  v9 = &unk_1002806B8;
  objc_copyWeak(v10, location);
  v11 = -[BuddyAddKeyboardLanguageViewController initWithCompletion:](v4, "initWithCompletion:", &v5);
  -[BuddyKeyboardLanguageOrderSelector presentViewController:animated:completion:](v13, "presentViewController:animated:completion:", v11, 1, 0);
  objc_storeStrong(&v11, 0);
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
}

+ (void)writePreferredKeyboardLanguagesToSystem:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t i;
  uint64_t v7;
  id v8;
  id v9;
  os_log_t v10;
  id v11;
  _QWORD __b[8];
  uint64_t v13;
  id v14;
  os_log_type_t v15;
  os_log_t oslog;
  id v17;
  id location[3];
  uint8_t v19[16];
  uint8_t v20[128];
  uint8_t buf[24];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = objc_msgSend(location[0], "buddy_mapArray:", &stru_100284538);
  oslog = (os_log_t)(id)_BYLoggingFacility(v17);
  v15 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100038C28((uint64_t)buf, (uint64_t)v17);
    _os_log_impl((void *)&_mh_execute_header, oslog, v15, "Multilingual keyboards displayed %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v14 = +[NSMutableArray array](NSMutableArray, "array");
  memset(__b, 0, sizeof(__b));
  v3 = v17;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", __b, v20, 16);
  if (v4)
  {
    v5 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(_QWORD *)__b[2] != v5)
          objc_enumerationMutation(v3);
        v13 = *(_QWORD *)(__b[1] + 8 * i);
        v11 = +[UIKeyboardInputModeController multilingualSetForInputModeIdentifier:](UIKeyboardInputModeController, "multilingualSetForInputModeIdentifier:", v13);
        if (objc_msgSend(v11, "count"))
          objc_msgSend(v14, "addObjectsFromArray:", v11);
        else
          objc_msgSend(v14, "addObject:", v13);
        objc_storeStrong(&v11, 0);
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", __b, v20, 16);
    }
    while (v4);
  }

  v10 = (os_log_t)(id)_BYLoggingFacility(v7);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    sub_100038C28((uint64_t)v19, (uint64_t)v14);
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Multilingual keyboards chosen %@", v19, 0xCu);
  }
  objc_storeStrong((id *)&v10, 0);
  v8 = +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v9 = objc_msgSend(v14, "copy");
  objc_msgSend(v8, "saveInputModes:", v9);

  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (unint64_t)paneForAnalytics
{
  return 1;
}

@end
