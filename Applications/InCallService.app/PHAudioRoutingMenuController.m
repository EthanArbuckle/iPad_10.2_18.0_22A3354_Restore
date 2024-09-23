@implementation PHAudioRoutingMenuController

+ (id)menuControllerWithCallStyle:(int64_t)a3 dataSource:(id)a4 delegate:(id)a5
{
  id v7;
  id v8;
  PHAudioRoutingMenuController *v9;

  v7 = a5;
  v8 = a4;
  v9 = -[PHAudioRoutingMenuController initWithStyle:dataSource:delegate:wantsAsyncReload:menuChangeHandler:]([PHAudioRoutingMenuController alloc], "initWithStyle:dataSource:delegate:wantsAsyncReload:menuChangeHandler:", a3, v8, v7, 0, 0);

  return v9;
}

- (PHAudioRoutingMenuController)initWithStyle:(int64_t)a3 dataSource:(id)a4 delegate:(id)a5 wantsAsyncReload:(BOOL)a6 menuChangeHandler:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  PHAudioRoutingMenuController *v15;
  PHAudioRoutingMenuController *v16;
  id v17;
  id menuChangeHandler;
  uint64_t v19;
  UIMenu *menu;
  dispatch_queue_attr_t v21;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *reloadQueue;
  TUCallCenter *v25;
  TUCallCenter *callCenter;
  objc_super v28;

  v8 = a6;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v28.receiver = self;
  v28.super_class = (Class)PHAudioRoutingMenuController;
  v15 = -[PHAudioRoutingMenuController init](&v28, "init");
  v16 = v15;
  if (v15)
  {
    v15->_wantsAsyncReload = v8;
    v15->_style = a3;
    objc_storeWeak((id *)&v15->_dataSource, v12);
    objc_storeWeak((id *)&v16->_delegate, v13);
    v17 = objc_retainBlock(v14);
    menuChangeHandler = v16->_menuChangeHandler;
    v16->_menuChangeHandler = v17;

    v19 = objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", &stru_10028DC20, &__NSArray0__struct));
    menu = v16->_menu;
    v16->_menu = (UIMenu *)v19;

    v21 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)2u, 0);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    v23 = dispatch_queue_create("PHAudioRoutingMenuController.serialQueue", v22);
    reloadQueue = v16->_reloadQueue;
    v16->_reloadQueue = (OS_dispatch_queue *)v23;

    if (v8)
      v25 = (TUCallCenter *)objc_msgSend(objc_alloc((Class)TUCallCenter), "initWithQueue:wantsCallNotifications:", v16->_reloadQueue, 0);
    else
      v25 = (TUCallCenter *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    callCenter = v16->_callCenter;
    v16->_callCenter = v25;

    -[PHAudioRoutingMenuController reload](v16, "reload");
  }

  return v16;
}

- (void)reload
{
  _QWORD *v3;
  void *v4;
  _QWORD v5[4];
  _QWORD *v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003D320;
  v7[3] = &unk_1002854A0;
  objc_copyWeak(&v8, &location);
  v3 = objc_retainBlock(v7);
  if (-[PHAudioRoutingMenuController wantsAsyncReload](self, "wantsAsyncReload"))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10003D51C;
    v5[3] = &unk_1002854C8;
    v6 = v3;
    -[PHAudioRoutingMenuController fetchMenuActionsWithCompletionHandler:](self, "fetchMenuActionsWithCompletionHandler:", v5);
    v4 = v6;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioRoutingMenuController menuActions](self, "menuActions"));
    ((void (*)(_QWORD *, void *))v3[2])(v3, v4);
  }

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)setMenu:(id)a3
{
  id v5;
  _QWORD v6[5];
  id v7;

  v5 = a3;
  if (-[PHAudioRoutingMenuController wantsAsyncReload](self, "wantsAsyncReload"))
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10003D5D0;
    v6[3] = &unk_100285158;
    v6[4] = self;
    v7 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

  }
  else
  {
    objc_storeStrong((id *)&self->_menu, a3);
  }

}

- (void)fetchMenuActionsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;
  _QWORD block[4];
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioRoutingMenuController delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "fetchRoutesForAudioRoutingMenuController:completionHandler:");

  if ((v6 & 1) != 0)
  {
    objc_initWeak(&location, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioRoutingMenuController dataSource](self, "dataSource"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10003D7DC;
    v9[3] = &unk_100285518;
    objc_copyWeak(&v11, &location);
    v10 = v4;
    objc_msgSend(v7, "fetchRoutesForAudioRoutingMenuController:completionHandler:", self, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(-[PHAudioRoutingMenuController reloadQueue](self, "reloadQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003D7C8;
    block[3] = &unk_100284E18;
    v14 = v4;
    dispatch_async(v8, block);

  }
}

- (NSArray)menuActions
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioRoutingMenuController delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "routesForAudioRoutingMenuController:");

  if ((v4 & 1) == 0)
    return (NSArray *)&__NSArray0__struct;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioRoutingMenuController dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routesForAudioRoutingMenuController:", self));

  v7 = sub_1000C5588();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "going to construct menu actions with current routes: %@", (uint8_t *)&v11, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioRoutingMenuController menuActionsWithRoutes:](self, "menuActionsWithRoutes:", v6));
  return (NSArray *)v9;
}

- (id)menuActionsWithRoutes:(id)a3
{
  id v4;
  unsigned int v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  id obj;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  id v33;
  _BYTE v34[128];

  v4 = a3;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = -[PHAudioRoutingMenuController isSharePlayActive](self, "isSharePlayActive");
  v27 = objc_alloc_init((Class)NSMutableArray);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioRoutingMenuController routeActionWithTitle:route:](self, "routeActionWithTitle:route:", v11, v10));

        objc_msgSend(v12, "setState:", objc_msgSend(v10, "isCurrentlyPicked"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("route title: %@, route state: %ld"), v13, objc_msgSend(v12, "state")));

        if (v5 && (objc_msgSend(v10, "supportsSharePlay") & 1) == 0)
        {
          v15 = TUBundle(objc_msgSend(v12, "setAttributes:", 1));
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("UNAVAILABLE_AUDIO_ROUTE"), &stru_10028DC20, CFSTR("TelephonyUtilities")));
          objc_msgSend(v12, "setDiscoverabilityTitle:", v17);

        }
        if (v12)
        {
          objc_msgSend(v26, "addObject:", v12);
          objc_msgSend(v27, "addObject:", v14);
        }
        else
        {
          v18 = sub_1000C5588();
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v33 = v10;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[WARN] Unable to create menu action for route %@", buf, 0xCu);
          }

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  if ((id)-[PHAudioRoutingMenuController style](self, "style") == (id)2)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioRoutingMenuController muteMenuAction](self, "muteMenuAction"));
    if (v20)
      objc_msgSend(v26, "addObject:", v20);

  }
  v21 = sub_1000C5588();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v27;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "menuActionsWithRoutes: %@", buf, 0xCu);
  }

  v23 = objc_msgSend(v26, "copy");
  return v23;
}

- (id)routeActionWithTitle:(id)a3 route:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10003DE80;
    v13[3] = &unk_100285540;
    objc_copyWeak(&v15, &location);
    v8 = v7;
    v14 = v8;
    v9 = objc_retainBlock(v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "audioRouteGlyphForDisplayStyle:", 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v6, v10, 0, v9));

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)lagunaActions
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  _BYTE v27[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioRoutingMenuController callCenter](self, "callCenter"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "frontmostAudioOrVideoCall"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioRoutingMenuController callCenter](self, "callCenter"));
  v20 = (void *)v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeConversationForCall:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioRoutingMenuController callCenter](self, "callCenter"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TPAudioRouting eligibleLagunaDevices:](TPAudioRouting, "eligibleLagunaDevices:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioRoutingMenuController lagunaActionForConversation:deviceHandle:](self, "lagunaActionForConversation:deviceHandle:", v6, v15));
        objc_msgSend(v16, "setState:", 0);
        if (v16)
        {
          objc_msgSend(v9, "addObject:", v16);
        }
        else
        {
          v17 = sub_1000C5588();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v15;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARN] Unable to create menu action for laguna deviceHandle %@", buf, 0xCu);
          }

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v12);
  }

  return v9;
}

- (id)lagunaActionForConversation:(id)a3 deviceHandle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void ***v11;
  void *v12;
  void *v13;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    objc_initWeak(&location, self);
    v15 = _NSConcreteStackBlock;
    v16 = 3221225472;
    v17 = sub_10003E2C0;
    v18 = &unk_100285568;
    objc_copyWeak(&v21, &location);
    v10 = v7;
    v19 = v10;
    v20 = v6;
    v11 = objc_retainBlock(&v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name", v15, v16, v17, v18));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("appletv")));
    v9 = (id)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v12, v13, 0, v11));

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (id)muteMenuAction
{
  void *v3;
  void *v4;
  void ***v5;
  void *v6;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage muteRouteGlyphForDisplayStyle:](UIImage, "muteRouteGlyphForDisplayStyle:", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioRoutingMenuController muteActionTitle](self, "muteActionTitle"));
  if (v4)
  {
    objc_initWeak(&location, self);
    v8 = _NSConcreteStackBlock;
    v9 = 3221225472;
    v10 = sub_10003E47C;
    v11 = &unk_100285590;
    objc_copyWeak(&v12, &location);
    v5 = objc_retainBlock(&v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v4, v3, 0, v5, v8, v9, v10, v11));
    objc_msgSend(v6, "setState:", -[PHAudioRoutingMenuController isMuted](self, "isMuted"));

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isMuted
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioRoutingMenuController callCenter](self, "callCenter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "frontmostAudioOrVideoCall"));

  LOBYTE(v2) = objc_msgSend(v3, "isUplinkMuted");
  return (char)v2;
}

- (BOOL)isSharePlayActive
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioRoutingMenuController callCenter](self, "callCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "frontmostAudioOrVideoCall"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioRoutingMenuController callCenter](self, "callCenter"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeConversationForCall:", v4));

    if (v6)
      v7 = objc_msgSend(v6, "hasJoinedActivitySession");
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)muteActionTitle
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioRoutingMenuController dataSource](self, "dataSource"));
  v4 = objc_opt_respondsToSelector(v3, "muteActionTitleForAudioRoutingMenuController:");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioRoutingMenuController dataSource](self, "dataSource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "muteActionTitleForAudioRoutingMenuController:", self));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (UIMenu)menu
{
  return self->_menu;
}

- (int64_t)style
{
  return self->_style;
}

- (PHAudioRoutingMenuControllerDataSource)dataSource
{
  return (PHAudioRoutingMenuControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (PHAudioRoutingMenuControllerDelegate)delegate
{
  return (PHAudioRoutingMenuControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)wantsAsyncReload
{
  return self->_wantsAsyncReload;
}

- (id)menuChangeHandler
{
  return self->_menuChangeHandler;
}

- (OS_dispatch_queue)reloadQueue
{
  return self->_reloadQueue;
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_reloadQueue, 0);
  objc_storeStrong(&self->_menuChangeHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_menu, 0);
}

@end
