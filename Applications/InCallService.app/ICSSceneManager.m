@implementation ICSSceneManager

- (ICSSceneManager)init
{
  ICSSceneManager *v2;
  uint64_t v3;
  NSMapTable *sceneMapping;
  uint64_t v5;
  NSMutableDictionary *configurationIdentifierToSceneTypeMapping;
  uint64_t v7;
  NSMutableSet *pendingSceneTypes;
  uint64_t v9;
  NSMutableDictionary *sceneTypeToRegisterBlockMapping;
  uint64_t v11;
  NSMutableDictionary *sceneTypeAndPresentationModeToBlockMapping;
  uint64_t v13;
  NSMutableSet *sceneTypesPresentedFullScreen;
  ICSSceneManager *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)ICSSceneManager;
  v2 = -[ICSSceneManager init](&v17, "init");
  if (v2)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
    v3 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
    sceneMapping = v2->_sceneMapping;
    v2->_sceneMapping = (NSMapTable *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 2));
    configurationIdentifierToSceneTypeMapping = v2->_configurationIdentifierToSceneTypeMapping;
    v2->_configurationIdentifierToSceneTypeMapping = (NSMutableDictionary *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    pendingSceneTypes = v2->_pendingSceneTypes;
    v2->_pendingSceneTypes = (NSMutableSet *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 2));
    sceneTypeToRegisterBlockMapping = v2->_sceneTypeToRegisterBlockMapping;
    v2->_sceneTypeToRegisterBlockMapping = (NSMutableDictionary *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 2));
    sceneTypeAndPresentationModeToBlockMapping = v2->_sceneTypeAndPresentationModeToBlockMapping;
    v2->_sceneTypeAndPresentationModeToBlockMapping = (NSMutableDictionary *)v11;

    v13 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    sceneTypesPresentedFullScreen = v2->_sceneTypesPresentedFullScreen;
    v2->_sceneTypesPresentedFullScreen = (NSMutableSet *)v13;

    v15 = v2;
  }

  return v2;
}

- (SBSUIInCallWindowScene)callScene
{
  return (SBSUIInCallWindowScene *)-[ICSSceneManager sceneOfType:](self, "sceneOfType:", 0);
}

- (SBSUIInCallWindowScene)screenSharingScene
{
  return (SBSUIInCallWindowScene *)-[ICSSceneManager sceneOfType:](self, "sceneOfType:", 1);
}

- (UIScene)screenSharingBroadcasterScene
{
  return (UIScene *)-[ICSSceneManager genericSceneOfType:](self, "genericSceneOfType:", 2);
}

- (UIScene)ambientScene
{
  return (UIScene *)-[ICSSceneManager genericSceneOfType:](self, "genericSceneOfType:", 5);
}

- (UIScene)clarityUIScene
{
  return (UIScene *)-[ICSSceneManager genericSceneOfType:](self, "genericSceneOfType:", 3);
}

- (BOOL)callSceneHasPresentedFullScreen
{
  return -[NSMutableSet containsObject:](self->_sceneTypesPresentedFullScreen, "containsObject:", &off_100296628);
}

- (BOOL)usesSBSUIInCallWindowSceneForType:(unint64_t)a3
{
  return (a3 > 5) | (0x13u >> a3) & 1;
}

- (BOOL)hasActiveOrPendingFullScreenCallScene
{
  void *v3;
  BOOL v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSSceneManager callScene](self, "callScene"));
  if (objc_msgSend(v3, "presentationMode") == (id)2)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSSceneManager callScene](self, "callScene"));
    if (objc_msgSend(v5, "presentationMode") == (id)3
      || -[ICSSceneManager hasPendingCompletionForSceneType:presentationMode:](self, "hasPendingCompletionForSceneType:presentationMode:", 0, 2))
    {
      v4 = 1;
    }
    else
    {
      v4 = -[ICSSceneManager hasPendingCompletionForSceneType:presentationMode:](self, "hasPendingCompletionForSceneType:presentationMode:", 0, 3);
    }

  }
  return v4;
}

- (id)sceneOfType:(unint64_t)a3
{
  const __CFString *v5;
  void *v6;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (!-[ICSSceneManager usesSBSUIInCallWindowSceneForType:](self, "usesSBSUIInCallWindowSceneForType:", a3))
  {
    if (a3 - 1 > 5)
      v5 = CFSTR("call");
    else
      v5 = *(&off_100284C00 + a3 - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Attempted to get scene of class SBSUIInCallWindowScene for invalid scene type: %@"), v5));
    NSLog(CFSTR("** TUAssertion failure: %@"), v6);

    _TUAssertShouldCrashApplication();
  }
  return -[ICSSceneManager genericSceneOfType:](self, "genericSceneOfType:", a3);
}

- (id)genericSceneOfType:(unint64_t)a3
{
  NSMapTable *sceneMapping;
  void *v4;
  void *v5;

  sceneMapping = self->_sceneMapping;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](sceneMapping, "objectForKey:", v4));

  return v5;
}

- (unint64_t)sceneTypeForConfigurationIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  NSObject *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_configurationIdentifierToSceneTypeMapping, "objectForKey:", v4));
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "unsignedIntValue");
  }
  else
  {
    v8 = sub_1000C5588();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      sub_1001A7F90((uint64_t)v4, v9);

    v7 = 0;
  }

  return v7;
}

- (void)registerScene:(id)a3 ofType:(unint64_t)a4
{
  const __CFString *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[ICSSceneManager usesSBSUIInCallWindowSceneForType:](self, "usesSBSUIInCallWindowSceneForType:", a4))
  {
    if (a4 - 1 > 5)
      v6 = CFSTR("call");
    else
      v6 = *(&off_100284C00 + a4 - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Attempted to register scene of class SBSUIInCallWindowScene for invalid scene type: %@"), v6));
    NSLog(CFSTR("** TUAssertion failure: %@"), v7);

    _TUAssertShouldCrashApplication();
  }
  -[ICSSceneManager registerGenericScene:ofType:](self, "registerGenericScene:ofType:", v8, a4);

}

- (void)registerGenericScene:(id)a3 ofType:(unint64_t)a4
{
  id v6;
  NSMutableSet *pendingSceneTypes;
  void *v8;
  void *v9;
  NSObject *v10;
  const __CFString *v11;
  NSMapTable *sceneMapping;
  void *v13;
  NSMutableDictionary *sceneTypeToRegisterBlockMapping;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  NSMutableDictionary *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  id v24;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  pendingSceneTypes = self->_pendingSceneTypes;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  -[NSMutableSet removeObject:](pendingSceneTypes, "removeObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSSceneManager genericSceneOfType:](self, "genericSceneOfType:", a4));
  if (v9)
  {
    v10 = sub_1000C56D8();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (a4 - 1 > 5)
        v11 = CFSTR("call");
      else
        v11 = *(&off_100284C00 + a4 - 1);
      v19 = 138412802;
      v20 = v9;
      v21 = 2114;
      v22 = v11;
      v23 = 2112;
      v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[Warning]: Existing scene '%@' already exists for type '%{public}@'. Ignoring new scene '%@'", (uint8_t *)&v19, 0x20u);
    }
  }
  else
  {
    sceneMapping = self->_sceneMapping;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    -[NSMapTable setObject:forKey:](sceneMapping, "setObject:forKey:", v6, v13);

    sceneTypeToRegisterBlockMapping = self->_sceneTypeToRegisterBlockMapping;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sceneTypeToRegisterBlockMapping, "objectForKeyedSubscript:", v15));

    if (v16)
      ((void (**)(_QWORD, id))v16)[2](v16, v6);
    v17 = self->_sceneTypeToRegisterBlockMapping;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", 0, v18);

  }
}

- (void)didUpdatePresentationMode:(int64_t)a3 forScene:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  NSMutableDictionary *sceneTypeAndPresentationModeToBlockMapping;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableSet *sceneTypesPresentedFullScreen;
  void *v23;
  NSObject *v24;
  int v25;
  void *v26;

  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v7 = sub_1000C5588();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = SBSInCallPresentationModeDescription(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v25 = 138543362;
    v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ICSSceneManager did update presentationMode to %{public}@", (uint8_t *)&v25, 0xCu);

  }
  v11 = objc_msgSend(v6, "ics_sceneType");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSSceneManager sceneOfType:](self, "sceneOfType:", v11));
  if (v12)
  {
    sceneTypeAndPresentationModeToBlockMapping = self->_sceneTypeAndPresentationModeToBlockMapping;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sceneTypeAndPresentationModeToBlockMapping, "objectForKeyedSubscript:", v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v16));

    if (v17)
      ((void (**)(_QWORD, id))v17)[2](v17, v6);
    v18 = self->_sceneTypeAndPresentationModeToBlockMapping;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", v19));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    objc_msgSend(v20, "setObject:forKeyedSubscript:", 0, v21);

    if (a3 == 2)
    {
      sceneTypesPresentedFullScreen = self->_sceneTypesPresentedFullScreen;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11));
      -[NSMutableSet addObject:](sceneTypesPresentedFullScreen, "addObject:", v23);

    }
  }
  else
  {
    v24 = sub_1000C56D8();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_1001A8004((uint64_t)v11, (uint64_t)v6, v24);
  }

}

- (void)didRequestSceneOfType:(unint64_t)a3 withIdentifier:(id)a4
{
  NSMutableSet *pendingSceneTypes;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  pendingSceneTypes = self->_pendingSceneTypes;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  -[NSMutableSet addObject:](pendingSceneTypes, "addObject:", v7);

  if (v9)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_configurationIdentifierToSceneTypeMapping, "setObject:forKeyedSubscript:", v8, v9);

  }
}

- (void)didInvalidatePendingSceneOfType:(unint64_t)a3 withIdentifier:(id)a4
{
  NSMutableSet *pendingSceneTypes;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  pendingSceneTypes = self->_pendingSceneTypes;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  -[NSMutableSet removeObject:](pendingSceneTypes, "removeObject:", v7);

  v8 = v9;
  if (v9)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_configurationIdentifierToSceneTypeMapping, "removeObjectForKey:", v9);
    v8 = v9;
  }

}

- (BOOL)hasPendingOrExistingSceneOfType:(unint64_t)a3
{
  NSMutableSet *pendingSceneTypes;
  void *v6;
  BOOL v7;
  void *v8;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  pendingSceneTypes = self->_pendingSceneTypes;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  if ((-[NSMutableSet containsObject:](pendingSceneTypes, "containsObject:", v6) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSSceneManager sceneOfType:](self, "sceneOfType:", a3));
    v7 = v8 != 0;

  }
  return v7;
}

- (BOOL)hasPendingSceneOfType:(unint64_t)a3
{
  NSMutableSet *pendingSceneTypes;
  void *v6;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  pendingSceneTypes = self->_pendingSceneTypes;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  LOBYTE(pendingSceneTypes) = -[NSMutableSet containsObject:](pendingSceneTypes, "containsObject:", v6);

  return (char)pendingSceneTypes;
}

- (BOOL)hasPendingCompletionForSceneType:(unint64_t)a3 presentationMode:(int64_t)a4
{
  NSMutableDictionary *sceneTypeAndPresentationModeToBlockMapping;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  sceneTypeAndPresentationModeToBlockMapping = self->_sceneTypeAndPresentationModeToBlockMapping;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sceneTypeAndPresentationModeToBlockMapping, "objectForKeyedSubscript:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v10));
  v12 = v11 != 0;

  return v12;
}

- (void)didDismissSceneOfType:(unint64_t)a3
{
  NSMapTable *sceneMapping;
  void *v6;
  NSMutableSet *pendingSceneTypes;
  void *v8;
  NSMutableSet *sceneTypesPresentedFullScreen;
  id v10;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  sceneMapping = self->_sceneMapping;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  -[NSMapTable removeObjectForKey:](sceneMapping, "removeObjectForKey:", v6);

  pendingSceneTypes = self->_pendingSceneTypes;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  -[NSMutableSet removeObject:](pendingSceneTypes, "removeObject:", v8);

  sceneTypesPresentedFullScreen = self->_sceneTypesPresentedFullScreen;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  -[NSMutableSet removeObject:](sceneTypesPresentedFullScreen, "removeObject:", v10);

}

- (void)didDisconnectSceneOfType:(unint64_t)a3 withIdentifier:(id)a4
{
  id v5;

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  -[NSMutableDictionary removeObjectForKey:](self->_configurationIdentifierToSceneTypeMapping, "removeObjectForKey:", v5);

}

- (void)waitForRegistrationOfSceneWithType:(unint64_t)a3 completion:(id)a4
{
  id v6;
  const __CFString *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  if (!-[ICSSceneManager usesSBSUIInCallWindowSceneForType:](self, "usesSBSUIInCallWindowSceneForType:", a3))
  {
    if (a3 - 1 > 5)
      v7 = CFSTR("call");
    else
      v7 = *(&off_100284C00 + a3 - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Attempted to wait for registration of SBSUIInCallWindowScene scene for invalid scene type: %@"), v7));
    NSLog(CFSTR("** TUAssertion failure: %@"), v8);

    _TUAssertShouldCrashApplication();
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000FCB0;
  v10[3] = &unk_100284B90;
  v11 = v6;
  v9 = v6;
  -[ICSSceneManager waitForRegistrationOfGenericSceneWithType:completion:](self, "waitForRegistrationOfGenericSceneWithType:completion:", a3, v10);

}

- (void)waitForRegistrationOfGenericSceneWithType:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  NSMutableDictionary *sceneTypeToRegisterBlockMapping;
  void *v9;
  void *v10;
  id v11;
  void ***v12;
  void ***v13;
  NSMutableDictionary *v14;
  void *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  void (**v21)(id, void *);

  v6 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSSceneManager genericSceneOfType:](self, "genericSceneOfType:", a3));
  if (v7)
  {
    v6[2](v6, v7);
  }
  else
  {
    sceneTypeToRegisterBlockMapping = self->_sceneTypeToRegisterBlockMapping;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sceneTypeToRegisterBlockMapping, "objectForKeyedSubscript:", v9));

    v16 = _NSConcreteStackBlock;
    v17 = 3221225472;
    v18 = sub_10000FE14;
    v19 = &unk_100284BB8;
    v20 = v10;
    v21 = v6;
    v11 = v10;
    v12 = objc_retainBlock(&v16);
    v13 = objc_retainBlock(v12);
    v14 = self->_sceneTypeToRegisterBlockMapping;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3, v16, v17, v18, v19));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v13, v15);

  }
}

- (void)waitForPresentationMode:(int64_t)a3 forSceneOfType:(unint64_t)a4 completion:(id)a5
{
  void (**v8)(id, void *);
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *sceneTypeAndPresentationModeToBlockMapping;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD *v21;
  _QWORD *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  void (**v26)(id, void *);

  v8 = (void (**)(id, void *))a5;
  if (!-[ICSSceneManager usesSBSUIInCallWindowSceneForType:](self, "usesSBSUIInCallWindowSceneForType:", a4))
  {
    if (a4 - 1 > 5)
      v9 = CFSTR("call");
    else
      v9 = *(&off_100284C00 + a4 - 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Attempted to wait for presentation mode of SBSUIInCallWindowScene scene for invalid scene type: %@"), v9));
    NSLog(CFSTR("** TUAssertion failure: %@"), v10);

    _TUAssertShouldCrashApplication();
  }
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSSceneManager sceneOfType:](self, "sceneOfType:", a4));
  v12 = v11;
  if (v11 && objc_msgSend(v11, "presentationMode") == (id)a3)
  {
    v8[2](v8, v12);
  }
  else
  {
    sceneTypeAndPresentationModeToBlockMapping = self->_sceneTypeAndPresentationModeToBlockMapping;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sceneTypeAndPresentationModeToBlockMapping, "objectForKeyedSubscript:", v14));

    if (!v15)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v16 = self->_sceneTypeAndPresentationModeToBlockMapping;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v15, v17);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v18));

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000100BC;
    v24[3] = &unk_100284BE0;
    v25 = v19;
    v26 = v8;
    v20 = v19;
    v21 = objc_retainBlock(v24);
    v22 = objc_retainBlock(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, v23);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneTypesPresentedFullScreen, 0);
  objc_storeStrong((id *)&self->_sceneTypeAndPresentationModeToBlockMapping, 0);
  objc_storeStrong((id *)&self->_sceneTypeToRegisterBlockMapping, 0);
  objc_storeStrong((id *)&self->_pendingSceneTypes, 0);
  objc_storeStrong((id *)&self->_configurationIdentifierToSceneTypeMapping, 0);
  objc_storeStrong((id *)&self->_sceneMapping, 0);
}

@end
