@implementation SPUIAppDelegate

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v5;
  void *v6;
  void *v7;
  __objc2_class **v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "persistentIdentifier"));

  LODWORD(v5) = objc_msgSend(v7, "hasPrefix:", CFSTR("searchBar"));
  v8 = &off_10000C0D8;
  if (!(_DWORD)v5)
    v8 = &off_10000C100;
  objc_msgSend(v6, "setDelegateClass:", objc_opt_class(*v8));
  return v6;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v17[16];
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  v7 = spuiLogHandles[4];
  if (!v7)
  {
    ((void (*)(void))SPUIInitLogging)();
    v7 = spuiLogHandles[4];
  }
  v8 = os_signpost_id_generate(v7);
  v9 = (void *)spuiLogHandles[4];
  if (!v9)
  {
    ((void (*)(void))SPUIInitLogging)();
    v9 = (void *)spuiLogHandles[4];
  }
  v10 = v9;
  v11 = v10;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v8, "searchVCinit", ", buf, 2u);
  }

  v12 = +[SPUISearchViewControllerHolder sharedInstance](SPUISearchViewControllerHolder, "sharedInstance");
  v13 = (void *)spuiLogHandles[4];
  if (!v13)
  {
    SPUIInitLogging(v12);
    v13 = (void *)spuiLogHandles[4];
  }
  v14 = v13;
  v15 = v14;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)v17 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, v8, "searchVCinit", " enableTelemetry=YES ", v17, 2u);
  }

  return 1;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)applicationWillTerminate:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v3 = a3;
  v4 = v3;
  v5 = spuiLogHandles[0];
  if (!spuiLogHandles[0])
  {
    SPUIInitLogging(v3);
    v5 = spuiLogHandles[0];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_10000691C(v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[SPUIFeedbackManager feedbackListener](SPUIFeedbackManager, "feedbackListener"));
  v14 = objc_msgSend(objc_alloc((Class)SFSearchViewDisappearFeedback), "initWithEvent:", 1);
  objc_msgSend(v13, "searchViewDidDisappear:", v14);

  +[SPUIFeedbackManager flushFeedbackWithCompletion:](SPUIFeedbackManager, "flushFeedbackWithCompletion:", &stru_10000C3A0);
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SPUIAppDelegate;
  v3 = a3;
  -[SPUIAppDelegate buildMenuWithBuilder:](&v8, "buildMenuWithBuilder:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SPUISearchViewControllerHolder sharedInstance](SPUISearchViewControllerHolder, "sharedInstance", v8.receiver, v8.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "focusedItem"));
  +[SPUIHomeScreenIconUtility addMenusToBuilder:forFocusEnvironment:](SPUIHomeScreenIconUtility, "addMenusToBuilder:forFocusEnvironment:", v3, v7);

}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
}

@end
