@implementation BuddyDictationLanguageOrderSelector

+ (BOOL)needsFullscreenPane
{
  return +[BuddyKeyboardLanguageOrderSelector needsFullscreenPane](BuddyKeyboardLanguageOrderSelector, "needsFullscreenPane", a2, a1);
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupSpokenLanguage;
}

- (BuddyDictationLanguageOrderSelector)init
{
  NSBundle *v2;
  NSBundle *v3;
  NSBundle *v4;
  NSString *v5;
  BuddyDictationLanguageOrderSelector *v6;
  NSString *v8;
  id location[2];
  id v10;

  v10 = self;
  location[1] = (id)a2;
  v2 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  location[0] = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", CFSTR("MULTILINGUAL_DICTATION_LANGUAGE_TITLE"), &stru_100284738, CFSTR("Localizable"));

  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v8 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("MULTILINGUAL_DICTATION_LANGUAGE_SUBTEXT"), &stru_100284738, CFSTR("Localizable"));

  v4 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v5 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", CFSTR("MULTILINGUAL_DICTATION_LANGUAGE_ACTIONTEXT"), &stru_100284738, CFSTR("Localizable"));
  v10 = objc_msgSend(v10, "initWithTitle:detailText:symbolName:actionString:", location[0], v8, 0, v5);
  v6 = (BuddyDictationLanguageOrderSelector *)v10;

  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v10, 0);
  return v6;
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;
  SEL v4;
  BuddyDictationLanguageOrderSelector *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyDictationLanguageOrderSelector;
  -[BuddyMultilingualBaseViewController viewDidLoad](&v3, "viewDidLoad");
  v2 = -[BuddyDictationLanguageOrderSelector buddy_animationController:](v5, "buddy_animationController:", CFSTR("Dictation"));
  -[BuddyMultilingualBaseViewController setAnimationController:](v5, "setAnimationController:", v2);

}

- (void)continuePressed
{
  void *v2;
  id v3;
  BFFFlowItemDelegate *v4;
  objc_super v5;
  SEL v6;
  BuddyDictationLanguageOrderSelector *v7;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)BuddyDictationLanguageOrderSelector;
  -[BuddyMultilingualBaseViewController continuePressed](&v5, "continuePressed");
  v2 = (void *)objc_opt_class(v7);
  v3 = -[BuddyMultilingualBaseViewController backingStore](v7, "backingStore");
  objc_msgSend(v2, "writePreferredDictationLanguagesToSystem:", v3);

  v4 = -[BuddyMultilingualBaseViewController delegate](v7, "delegate");
  -[BFFFlowItemDelegate flowItemDone:nextItemClass:](v4, "flowItemDone:nextItemClass:", v7, 0);

}

+ (void)writePreferredDictationLanguagesToSystem:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t i;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  os_log_type_t v16;
  os_log_t oslog;
  _QWORD __b[8];
  id v19;
  id v20;
  id location[3];
  uint8_t buf[24];
  _BYTE v23[128];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  memset(__b, 0, sizeof(__b));
  v3 = location[0];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", __b, v23, 16);
  if (v4)
  {
    v5 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(_QWORD *)__b[2] != v5)
          objc_enumerationMutation(v3);
        v19 = *(id *)(__b[1] + 8 * i);
        v7 = v20;
        v8 = objc_msgSend(v19, "identifier");
        objc_msgSend(v7, "setObject:forKey:", &__kCFBooleanTrue, v8);

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", __b, v23, 16);
    }
    while (v4);
  }

  oslog = (os_log_t)(id)_BYLoggingFacility(v9);
  v16 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v20, "allKeys");
    v15 = objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
    sub_100038C28((uint64_t)buf, (uint64_t)v15);
    _os_log_impl((void *)&_mh_execute_header, oslog, v16, "Multilingual dictation languages chosen: %@", buf, 0xCu);

    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  v11 = +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v14 = objc_msgSend(v11, "preferencesActions");

  objc_msgSend(v14, "setEnabledDictationLanguages:", v20);
  v12 = +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v13 = objc_msgSend(v12, "updateEnabledDictationLanguages:", 1);

  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (unint64_t)paneForAnalytics
{
  return 2;
}

@end
