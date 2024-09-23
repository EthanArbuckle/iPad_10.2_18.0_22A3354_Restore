@implementation ActivationLockViewController

- (ActivationLockViewController)initWithTokenChallengers:(id)a3 authenticator:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  uint64_t v41;
  ActivationLockViewController *v42;
  void *v43;
  void *v44;
  void *v45;
  ActivationLockViewController *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  objc_super v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];

  v6 = a3;
  v62 = a4;
  if (!objc_msgSend(v6, "count"))
  {
    v30 = handleForCategory(0, v7);
    v25 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_10000BDEC();
    goto LABEL_18;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[ActivationLockViewController setLocalizedComponentMap:](self, "setLocalizedComponentMap:", v8);

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v65;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v65 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController localizedComponentMap](self, "localizedComponentMap"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedComponentsMap"));
        objc_msgSend(v15, "addEntriesFromDictionary:", v16);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
    }
    while (v11);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController localizedComponentMap](self, "localizedComponentMap"));
  v18 = objc_msgSend(v17, "count");

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController localizedComponentMap](self, "localizedComponentMap"));
  v20 = v19;
  if (v18 == (id)1)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allValues"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", 0));

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("SINGLE_OWNER_SINGLE_ACTIVATION_LOCK_TITLE"), &stru_100014BA8, CFSTR("StartPreflightPlugin-Release")));
    v25 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v24, v22));

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("SINGLE_OWNER_SINGLE_ACTIVATION_LOCK_TEXT"), &stru_100014BA8, CFSTR("StartPreflightPlugin-Release")));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v22));

    v29 = 0;
    goto LABEL_21;
  }
  v31 = objc_msgSend(v19, "count");

  if ((unint64_t)v31 < 2)
  {
    v41 = handleForCategory(0, v32);
    v25 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_10000BE18();
LABEL_18:
    v42 = 0;
    goto LABEL_24;
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController localizedComponentMap](self, "localizedComponentMap"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "allValues"));
  v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n")));

  v36 = objc_msgSend(v9, "count");
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v38 = v37;
  if ((unint64_t)v36 < 2)
  {
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("SINGLE_OWNER_MULTI_ACTIVATION_LOCK_TITLE"), &stru_100014BA8, CFSTR("StartPreflightPlugin-Release")));

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v22 = v39;
    v40 = CFSTR("SINGLE_OWNER_MULTI_ACTIVATION_LOCK_TEXT");
  }
  else
  {
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("MULTI_OWNER_MULTI_ACTIVATION_LOCK_TITLE"), &stru_100014BA8, CFSTR("StartPreflightPlugin-Release")));

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v22 = v39;
    v40 = CFSTR("MULTI_OWNER_MULTI_ACTIVATION_LOCK_TEXT");
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", v40, &stru_100014BA8, CFSTR("StartPreflightPlugin-Release")));
  v29 = (void *)v35;
LABEL_21:

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tintColor](UIColor, "tintColor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithHierarchicalColor:](UIImageSymbolConfiguration, "configurationWithHierarchicalColor:", v43));
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("lock.circle"), v44));

  v63.receiver = self;
  v63.super_class = (Class)ActivationLockViewController;
  v46 = -[OBBoldSubtitleController initWithTitle:subtitle:detailText:icon:](&v63, "initWithTitle:subtitle:detailText:icon:", v25, v29, v28, v45);
  if (v46)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
    v61 = v29;
    v59 = v45;
    v60 = v28;
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("START_ACTIVATION_BUTTON_TITLE"), &stru_100014BA8, CFSTR("StartPreflightPlugin-Release")));
    objc_msgSend(v47, "setTitle:forState:", v49, 0);

    objc_msgSend(v47, "addTarget:action:forControlEvents:", v46, "_startActivateTapped", 64);
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController buttonTray](v46, "buttonTray"));
    objc_msgSend(v50, "addButton:", v47);

    v51 = (void *)objc_claimAutoreleasedReturnValue(+[OBLinkTrayButton linkButton](OBLinkTrayButton, "linkButton"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "localizedStringForKey:value:table:", CFSTR("SKIP_ACTIVATION_BUTTON_TITLE"), &stru_100014BA8, CFSTR("StartPreflightPlugin-Release")));
    objc_msgSend(v51, "setTitle:forState:", v53, 0);

    objc_msgSend(v51, "addTarget:action:forControlEvents:", v46, "_skipActivateTapped", 64);
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController buttonTray](v46, "buttonTray"));
    objc_msgSend(v54, "addButton:", v51);

    v55 = (void *)objc_claimAutoreleasedReturnValue(+[OBHeaderAccessoryButton accessoryButton](OBHeaderAccessoryButton, "accessoryButton"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("ABOUT_ACTIVATION_BUTTON_TITLE"), &stru_100014BA8, CFSTR("StartPreflightPlugin-Release")));
    objc_msgSend(v55, "setTitle:forState:", v57, 0);

    v29 = v61;
    objc_msgSend(v55, "addTarget:action:forControlEvents:", v46, "_learnMoreTapped", 64);
    -[ActivationLockViewController setTokenChallengers:](v46, "setTokenChallengers:", v9);
    -[ActivationLockViewController setAuthenticator:](v46, "setAuthenticator:", v62);
    -[ActivationLockViewController resetState](v46, "resetState");

    v45 = v59;
    v28 = v60;

  }
  self = v46;

  v42 = self;
LABEL_24:

  return v42;
}

- (void)viewDidLoad
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;

  v3 = handleForCategory(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[ActivationLockViewController viewDidLoad]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)ActivationLockViewController;
  -[ActivationLockViewController viewDidLoad](&v6, "viewDidLoad");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController navigationController](self, "navigationController"));
  objc_msgSend(v5, "setDelegate:", self);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;

  v3 = a3;
  v5 = handleForCategory(0, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[ActivationLockViewController viewDidAppear:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)ActivationLockViewController;
  -[ActivationLockViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  -[ActivationLockViewController resetState](self, "resetState");
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint8_t v16[16];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewControllers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v6));

  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", (char *)objc_msgSend(v7, "count") - 1));
    v9 = objc_opt_class(RUIPage);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", (char *)objc_msgSend(v7, "count") - 2));
      v11 = objc_opt_class(RUIPage);
      isKindOfClass = objc_opt_isKindOfClass(v10, v11);

      if ((isKindOfClass & 1) != 0)
      {
        v14 = handleForCategory(0, v13);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v16 = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "removing second-to-last RUI Page", v16, 2u);
        }

        objc_msgSend(v7, "removeObjectAtIndex:", (char *)objc_msgSend(v7, "count") - 2);
        objc_msgSend(v5, "setViewControllers:animated:", v7, 0);
      }
    }
    else
    {

    }
  }

}

- (id)activeTokenChallenger
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;

  v3 = -[ActivationLockViewController activeTokenChallengerIndex](self, "activeTokenChallengerIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController tokenChallengers](self, "tokenChallengers"));
  if (v3 >= (unint64_t)objc_msgSend(v4, "count"))
  {

    v8 = handleForCategory(0, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10000BE44(self, v9);

    v6 = 0;
  }
  else
  {
    -[ActivationLockViewController activeTokenChallengerIndex](self, "activeTokenChallengerIndex");

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController tokenChallengers](self, "tokenChallengers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", -[ActivationLockViewController activeTokenChallengerIndex](self, "activeTokenChallengerIndex")));

  }
  return v6;
}

- (id)moveToNextLockedTokenChallenger
{
  char *v3;
  void *v4;
  char *v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;

  do
  {
    v3 = (char *)-[ActivationLockViewController activeTokenChallengerIndex](self, "activeTokenChallengerIndex") + 1;
    -[ActivationLockViewController setActiveTokenChallengerIndex:](self, "setActiveTokenChallengerIndex:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController tokenChallengers](self, "tokenChallengers"));
    v5 = (char *)objc_msgSend(v4, "count");

    if (v3 >= v5)
    {
      v12 = 0;
      return v12;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController activeTokenChallenger](self, "activeTokenChallenger"));
    v7 = objc_msgSend(v6, "isTokenUnlocked");

  }
  while ((v7 & 1) != 0);
  v9 = handleForCategory(0, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController activeTokenChallenger](self, "activeTokenChallenger"));
    v14 = 138412290;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Moved to next locked token: %@", (uint8_t *)&v14, 0xCu);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController activeTokenChallenger](self, "activeTokenChallenger"));
  return v12;
}

- (void)setupRemoteUIController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new(RemoteUIController, a2);
  -[ActivationLockViewController setRemoteUIController:](self, "setRemoteUIController:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController remoteUIController](self, "remoteUIController"));
  objc_msgSend(v4, "setDelegate:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController navigationController](self, "navigationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController remoteUIController](self, "remoteUIController"));
  objc_msgSend(v6, "setHostViewController:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RUIStyle setupAssistantStyle](RUIStyle, "setupAssistantStyle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController remoteUIController](self, "remoteUIController"));
  objc_msgSend(v8, "setStyle:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController remoteUIController](self, "remoteUIController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController localizedComponentMap](self, "localizedComponentMap"));
  objc_msgSend(v9, "registerPartsInfoViewWithComponentsMap:", v10);

  -[ActivationLockViewController _setHandlerForSkipButton](self, "_setHandlerForSkipButton");
  -[ActivationLockViewController _setHandlerForNextButton](self, "_setHandlerForNextButton");
}

- (void)_startActivateTapped
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;

  v3 = handleForCategory(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[ActivationLockViewController _startActivateTapped]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[ActivationLockViewController setupRemoteUIController](self, "setupRemoteUIController");
  -[ActivationLockViewController fetchPasswordScreen](self, "fetchPasswordScreen");
}

- (void)fetchPasswordScreen
{
  void *v3;
  _QWORD v4[5];

  -[ActivationLockViewController transitionToState:](self, "transitionToState:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController activeTokenChallenger](self, "activeTokenChallenger"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100003720;
  v4[3] = &unk_1000145A8;
  v4[4] = self;
  objc_msgSend(v3, "fetchPasswordWithCompletion:", v4);

}

- (void)_skipActivateTapped
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  const char *v16;

  v3 = handleForCategory(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[ActivationLockViewController _skipActivateTapped]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController tokenChallengers](self, "tokenChallengers", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "setIsTokenUnlocked:", 1);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[ActivationLockViewController transitionToState:](self, "transitionToState:", 5);
}

- (void)_learnMoreTapped
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  const char *v5;

  v2 = handleForCategory(0, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[ActivationLockViewController _learnMoreTapped]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

}

- (void)_dismissLearnMoreTapped
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;

  v3 = handleForCategory(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[ActivationLockViewController _dismissLearnMoreTapped]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController learnMoreController](self, "learnMoreController"));
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_showAlertWithTitle:(id)a3 message:(id)a4 actionTitle:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a5;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v8, 0, 0));

  objc_msgSend(v10, "addAction:", v9);
  -[ActivationLockViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

}

- (void)showUserAuthErrorAlert
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_TITLE"), &stru_100014BA8, CFSTR("StartPreflightPlugin-Release")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_ACTION"), &stru_100014BA8, CFSTR("StartPreflightPlugin-Release")));
  -[ActivationLockViewController _showAlertWithTitle:message:actionTitle:](self, "_showAlertWithTitle:message:actionTitle:", v3, 0, v5);

}

- (void)showUnknownErrorAlertWithCode:(int64_t)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = handleForCategory(0, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_10000BEE4();

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_ERROR_ALERT_TITLE"), &stru_100014BA8, CFSTR("StartPreflightPlugin-Release")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_ERROR_ALERT_MESSAGE"), &stru_100014BA8, CFSTR("StartPreflightPlugin-Release")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_ERROR_ALERT_ACTION"), &stru_100014BA8, CFSTR("StartPreflightPlugin-Release")));
  -[ActivationLockViewController _showAlertWithTitle:message:actionTitle:](self, "_showAlertWithTitle:message:actionTitle:", v7, v9, v11);

}

- (void)_setHandlerForNextButton
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController remoteUIController](self, "remoteUIController"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100003EB8;
  v5[3] = &unk_100014660;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  v4 = objc_msgSend(v3, "setHandlerForElementsMatching:handler:", &stru_1000145E8, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_setHandlerForSkipButton
{
  RemoteUIController *remoteUIController;
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  remoteUIController = self->_remoteUIController;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000439C;
  v5[3] = &unk_1000146A8;
  objc_copyWeak(&v6, &location);
  v4 = -[RemoteUIController setHandlerForElementsMatching:handler:](remoteUIController, "setHandlerForElementsMatching:handler:", &stru_100014680, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  ActivationLockViewController *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  _BYTE v40[24];

  v8 = a3;
  v9 = a4;
  v11 = v9;
  if (!a5)
  {
LABEL_11:
    v23 = handleForCategory(0, v10);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_10000BFD8();

    -[ActivationLockViewController showUnknownErrorAlertWithCode:](self, "showUnknownErrorAlertWithCode:", -101);
    goto LABEL_39;
  }
  if (*a5 != 2)
  {
    if (*a5 == 1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "clientInfo"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("status")));

      v15 = handleForCategory(0, v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v40 = 138412290;
        *(_QWORD *)&v40[4] = v13;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Got dismiss action with status %@", v40, 0xCu);
      }

      if (!v13)
      {
        -[ActivationLockViewController showUnknownErrorAlertWithCode:](self, "showUnknownErrorAlertWithCode:", -304);
LABEL_38:

        goto LABEL_39;
      }
      if ((id)-[ActivationLockViewController state](self, "state") == (id)1)
      {
        v17 = objc_msgSend(v13, "isEqualToString:", CFSTR("0"));
        v19 = handleForCategory(0, v18);
        v20 = objc_claimAutoreleasedReturnValue(v19);
        v21 = v20;
        if (!v17)
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            sub_10000C004();

          -[ActivationLockViewController showUnknownErrorAlertWithCode:](self, "showUnknownErrorAlertWithCode:", -303);
          v36 = self;
          v37 = 0;
          goto LABEL_37;
        }
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
LABEL_27:

          v35 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController activeTokenChallenger](self, "activeTokenChallenger"));
          objc_msgSend(v35, "setIsTokenUnlocked:", 1);

          v36 = self;
          v37 = 5;
LABEL_37:
          -[ActivationLockViewController transitionToState:](v36, "transitionToState:", v37, *(_QWORD *)v40);
          goto LABEL_38;
        }
        *(_WORD *)v40 = 0;
        v22 = "Token has already been unlocked";
      }
      else
      {
        if ((id)-[ActivationLockViewController state](self, "state") != (id)4)
        {
          v38 = handleForCategory(0, v30);
          v39 = (char *)objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_ERROR))
            sub_10000C0CC(self, v39);

          -[ActivationLockViewController showUnknownErrorAlertWithCode:](self, "showUnknownErrorAlertWithCode:", -100);
          -[ActivationLockViewController resetState](self, "resetState");
          goto LABEL_38;
        }
        v31 = objc_msgSend(v13, "isEqualToString:", CFSTR("0"));
        v33 = handleForCategory(0, v32);
        v34 = objc_claimAutoreleasedReturnValue(v33);
        v21 = v34;
        if (!v31)
        {
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            sub_10000C068();

          -[ActivationLockViewController showUnknownErrorAlertWithCode:](self, "showUnknownErrorAlertWithCode:", -303);
          v36 = self;
          v37 = 2;
          goto LABEL_37;
        }
        if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          goto LABEL_27;
        *(_WORD *)v40 = 0;
        v22 = "Token unlocked";
      }
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v22, v40, 2u);
      goto LABEL_27;
    }
    goto LABEL_11;
  }
  v25 = handleForCategory(0, v10);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v40 = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Got push action", v40, 2u);
  }

  if ((id)-[ActivationLockViewController state](self, "state") == (id)1)
  {
    -[ActivationLockViewController transitionToState:](self, "transitionToState:", 2);
  }
  else
  {
    v28 = handleForCategory(0, v27);
    v29 = (char *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
      sub_10000C13C(self, v29);

    -[ActivationLockViewController showUnknownErrorAlertWithCode:](self, "showUnknownErrorAlertWithCode:", -100);
    -[ActivationLockViewController resetState](self, "resetState");
  }
LABEL_39:

}

- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5
{
  uint64_t v5;
  NSObject *v6;
  int v8;
  const char *v9;

  v5 = handleForCategory(0, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[ActivationLockViewController remoteUIController:shouldLoadRequest:redirectResponse:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  return 0;
}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  ActivationLockViewController *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int v20;
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;

  v7 = a4;
  v8 = a5;
  v10 = handleForCategory(0, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 136315650;
    v21 = "-[ActivationLockViewController remoteUIController:didFinishLoadWithError:forRequest:]";
    v22 = 2112;
    v23 = v7;
    v24 = 2112;
    v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: error: %@. request: %@", (uint8_t *)&v20, 0x20u);
  }

  if (v7)
  {
    v13 = handleForCategory(0, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10000C21C();

    if ((id)-[ActivationLockViewController state](self, "state") == (id)4)
    {
      -[ActivationLockViewController showUnknownErrorAlertWithCode:](self, "showUnknownErrorAlertWithCode:", -103);
      v15 = self;
      v16 = 2;
LABEL_10:
      -[ActivationLockViewController transitionToState:](v15, "transitionToState:", v16);
      goto LABEL_14;
    }
    if ((id)-[ActivationLockViewController state](self, "state") == (id)1)
    {
      -[ActivationLockViewController showUnknownErrorAlertWithCode:](self, "showUnknownErrorAlertWithCode:", -102);
      v15 = self;
      v16 = 0;
      goto LABEL_10;
    }
    v18 = handleForCategory(0, v17);
    v19 = (char *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
      sub_10000C1AC(self, v19);

    -[ActivationLockViewController showUnknownErrorAlertWithCode:](self, "showUnknownErrorAlertWithCode:", -100);
    -[ActivationLockViewController resetState](self, "resetState");
  }
LABEL_14:

}

- (id)transitionTable
{
  _QWORD v3[6];
  _QWORD v4[6];

  v3[0] = &off_100015410;
  v3[1] = &off_100015428;
  v4[0] = &off_100015558;
  v4[1] = &off_100015570;
  v3[2] = &off_100015458;
  v3[3] = &off_100015470;
  v4[2] = &off_100015588;
  v4[3] = &off_1000155A0;
  v3[4] = &off_100015488;
  v3[5] = &off_100015440;
  v4[4] = &off_1000155B8;
  v4[5] = &off_1000155D0;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 6));
}

- (void)resetState
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  int64_t v10;
  __int16 v11;
  uint64_t v12;

  v3 = handleForCategory(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218240;
    v10 = -[ActivationLockViewController state](self, "state");
    v11 = 2048;
    v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Reset state from %ld to %ld", (uint8_t *)&v9, 0x16u);
  }

  -[ActivationLockViewController setState:](self, "setState:", 0);
  -[ActivationLockViewController setActiveTokenChallengerIndex:](self, "setActiveTokenChallengerIndex:", -1);
  v5 = -[ActivationLockViewController moveToNextLockedTokenChallenger](self, "moveToNextLockedTokenChallenger");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController buttonTray](self, "buttonTray"));
  objc_msgSend(v6, "showButtonsAvailable");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController navigationController](self, "navigationController"));
  v8 = objc_msgSend(v7, "popToViewController:animated:", self, 1);

  -[ActivationLockViewController setRemoteUIController:](self, "setRemoteUIController:", 0);
}

- (void)transitionToState:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  int v22;
  int64_t v23;
  __int16 v24;
  int64_t v25;

  v5 = handleForCategory(0, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 134218240;
    v23 = -[ActivationLockViewController state](self, "state");
    v24 = 2048;
    v25 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Transitioning state from %ld to %ld", (uint8_t *)&v22, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController transitionTable](self, "transitionTable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[ActivationLockViewController state](self, "state")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));

  if (v9
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3)),
        v12 = objc_msgSend(v9, "containsObject:", v11),
        v11,
        (v12 & 1) != 0))
  {
    -[ActivationLockViewController setState:](self, "setState:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController buttonTray](self, "buttonTray"));
    v14 = v13;
    if (a3 == 1)
    {
      objc_msgSend(v13, "showButtonsBusy");

    }
    else
    {
      objc_msgSend(v13, "showButtonsAvailable");

      if (a3 == 5)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController moveToNextLockedTokenChallenger](self, "moveToNextLockedTokenChallenger"));

        if (v17)
        {
          -[ActivationLockViewController fetchPasswordScreen](self, "fetchPasswordScreen");
        }
        else
        {
          v19 = handleForCategory(0, v18);
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v22) = 0;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "No more token left", (uint8_t *)&v22, 2u);
          }

          v21 = (void *)objc_claimAutoreleasedReturnValue(-[ActivationLockViewController coordinator](self, "coordinator"));
          objc_msgSend(v21, "moveToNextViewController");

        }
      }
    }
  }
  else
  {
    v15 = handleForCategory(0, v10);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10000C248(self, (const char *)a3, v16);

    -[ActivationLockViewController showUnknownErrorAlertWithCode:](self, "showUnknownErrorAlertWithCode:", -100);
    -[ActivationLockViewController resetState](self, "resetState");
  }

}

- (StartPreflightNavigationCoordinator)coordinator
{
  return (StartPreflightNavigationCoordinator *)objc_loadWeakRetained((id *)&self->_coordinator);
}

- (void)setCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_coordinator, a3);
}

- (RemoteUIController)remoteUIController
{
  return self->_remoteUIController;
}

- (void)setRemoteUIController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteUIController, a3);
}

- (OBTextWelcomeController)learnMoreController
{
  return self->_learnMoreController;
}

- (void)setLearnMoreController:(id)a3
{
  objc_storeStrong((id *)&self->_learnMoreController, a3);
}

- (NSArray)tokenChallengers
{
  return self->_tokenChallengers;
}

- (void)setTokenChallengers:(id)a3
{
  objc_storeStrong((id *)&self->_tokenChallengers, a3);
}

- (unint64_t)activeTokenChallengerIndex
{
  return self->_activeTokenChallengerIndex;
}

- (void)setActiveTokenChallengerIndex:(unint64_t)a3
{
  self->_activeTokenChallengerIndex = a3;
}

- (NSMutableDictionary)localizedComponentMap
{
  return self->_localizedComponentMap;
}

- (void)setLocalizedComponentMap:(id)a3
{
  objc_storeStrong((id *)&self->_localizedComponentMap, a3);
}

- (IDMSAuthenticator)authenticator
{
  return self->_authenticator;
}

- (void)setAuthenticator:(id)a3
{
  objc_storeStrong((id *)&self->_authenticator, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_storeStrong((id *)&self->_localizedComponentMap, 0);
  objc_storeStrong((id *)&self->_tokenChallengers, 0);
  objc_storeStrong((id *)&self->_learnMoreController, 0);
  objc_storeStrong((id *)&self->_remoteUIController, 0);
  objc_destroyWeak((id *)&self->_coordinator);
}

@end
