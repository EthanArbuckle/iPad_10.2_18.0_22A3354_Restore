@implementation BCChatSuggestRemoteViewController

- (BCChatSuggestRemoteViewController)init
{
  BCPresenter *v3;
  BCDeviceState *v4;
  BCChatSuggestRemoteViewController *v5;

  v3 = objc_alloc_init(BCPresenter);
  v4 = objc_alloc_init(BCDeviceState);
  v5 = -[BCChatSuggestRemoteViewController initWithDeviceState:presenter:](self, "initWithDeviceState:presenter:", v4, v3);

  -[BCPresenter setPresentingViewController:](v3, "setPresentingViewController:", v5);
  return v5;
}

- (BCChatSuggestRemoteViewController)initWithDeviceState:(id)a3 presenter:(id)a4
{
  id v7;
  id v8;
  BCChatSuggestRemoteViewController *v9;
  BCChatSuggestRemoteViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BCChatSuggestRemoteViewController;
  v9 = -[BCChatSuggestRemoteViewController init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deviceState, a3);
    objc_storeStrong((id *)&v10->_presenter, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BCChatSuggestRemoteViewController;
  -[BCChatSuggestRemoteViewController viewDidLoad](&v5, "viewDidLoad");
  -[BCChatSuggestRemoteViewController setViewControllerDidLoadTime:](self, "setViewControllerDidLoadTime:", CACurrentMediaTime());
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BCChatSuggestRemoteViewController;
  -[BCChatSuggestRemoteViewController viewDidDisappear:](&v3, "viewDidDisappear:", a3);
  byte_100016870 = 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  dispatch_time_t v5;
  _QWORD block[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BCChatSuggestRemoteViewController;
  -[BCChatSuggestRemoteViewController viewDidAppear:](&v7, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController dialRequestAction](self, "dialRequestAction"));

  if (v4)
  {
    v5 = dispatch_time(0, 50000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005B1C;
    block[3] = &unk_100010430;
    block[4] = self;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)setDialRequestAction:(id)a3
{
  BSAction *v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  unint64_t v9;
  os_signpost_id_t v10;
  id v11;
  NSObject *v12;
  unint64_t v13;
  os_signpost_id_t v14;
  id v15;
  NSObject *v16;
  unint64_t v17;
  os_signpost_id_t v18;
  BSAction *dialRequestAction;
  uint8_t v20[16];
  uint8_t v21[16];
  uint8_t buf[16];

  v4 = (BSAction *)a3;
  v5 = sub_1000081C4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  -[BCChatSuggestRemoteViewController setTapId:](self, "setTapId:", os_signpost_id_generate(v6));

  v7 = sub_1000081C4();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = -[BCChatSuggestRemoteViewController tapId](self, "tapId");
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "RenderBusinessChatUI", ", buf, 2u);
    }
  }

  v11 = sub_1000081C4();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = -[BCChatSuggestRemoteViewController tapId](self, "tapId");
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v14 = v13;
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)v21 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "RenderBusinessChatCallAction", ", v21, 2u);
    }
  }

  v15 = sub_1000081C4();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = -[BCChatSuggestRemoteViewController tapId](self, "tapId");
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v18 = v17;
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)v20 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, v18, "RenderBusinessChatMessageAction", ", v20, 2u);
    }
  }

  if (v4)
    -[BCChatSuggestRemoteViewController fetchBizInfoForDialRequestAction:](self, "fetchBizInfoForDialRequestAction:", v4);
  dialRequestAction = self->_dialRequestAction;
  self->_dialRequestAction = v4;

}

- (void)configureAlertControllerForBusinessItem:(id)a3 dialRequestAction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  id v31;
  unint64_t v32;
  os_signpost_id_t v33;
  uint8_t v34[8];
  _QWORD v35[2];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController deviceState](self, "deviceState"));
  v9 = objc_msgSend(v8, "isLocked");

  if (v9)
    goto LABEL_2;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController actionsViewController](self, "actionsViewController"));
  objc_msgSend(v10, "setBusinessItem:", v6);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController headerActionItem](self, "headerActionItem"));
  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController headerAlertActionForBizItem:](self, "headerAlertActionForBizItem:", v6));
    -[BCChatSuggestRemoteViewController setHeaderActionItem:](self, "setHeaderActionItem:", v12);

    v13 = objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController messageAlertActionForBizItem:dialRequestAction:](self, "messageAlertActionForBizItem:dialRequestAction:", v6, v7));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController headerActionItem](self, "headerActionItem"));
    v35[0] = v14;
    v35[1] = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 2));
    -[BCChatSuggestRemoteViewController setPendingActionItems:](self, "setPendingActionItems:", v15);

    v16 = objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController bizItem](self, "bizItem"));
    if (v16)
    {
      v17 = (void *)v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController bizItem](self, "bizItem"));
      v19 = objc_msgSend(v18, "isAvailableForCalling");

      if ((v19 & 1) == 0)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController bizItem](self, "bizItem"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController callAlertActionForBizItem:dialRequestAction:](self, "callAlertActionForBizItem:dialRequestAction:", v20, v7));

        v22 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController deviceState](self, "deviceState"));
        v23 = objc_msgSend(v22, "isLocked");

        if ((v23 & 1) != 0)
        {
          -[BCChatSuggestRemoteViewController _dismiss](self, "_dismiss");

LABEL_17:
          goto LABEL_18;
        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController actionsViewController](self, "actionsViewController"));
        objc_msgSend(v24, "replaceLastActionItem:reloadRowImmediately:", v21, 0);

      }
    }

  }
  if (!-[BCChatSuggestRemoteViewController chatSuggestUIPresented](self, "chatSuggestUIPresented")
    || (v25 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController pendingActionItems](self, "pendingActionItems")),
        v26 = objc_msgSend(v25, "count"),
        v25,
        !v26))
  {
LABEL_14:
    +[BCCoreAnalytics logEventForView:bizItem:bizItemReturnedAfterAction:latency:](BCCoreAnalytics, "logEventForView:bizItem:bizItemReturnedAfterAction:latency:", CFSTR("com.apple.BusinessChatViewService.ChatSuggestAppears"), v6, 0, -[BCChatSuggestRemoteViewController _latencyFromViewDidLoad](self, "_latencyFromViewDidLoad"));
    -[BCChatSuggestRemoteViewController _logPhoneNumberDisplayedIfNecessary](self, "_logPhoneNumberDisplayedIfNecessary");
    v31 = sub_1000081C4();
    v13 = objc_claimAutoreleasedReturnValue(v31);
    v32 = -[BCChatSuggestRemoteViewController tapId](self, "tapId");
    if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v33 = v32;
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)v34 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, v33, "RenderBusinessChatMessageAction", ", v34, 2u);
      }
    }
    goto LABEL_17;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController deviceState](self, "deviceState"));
  v28 = objc_msgSend(v27, "isLocked");

  if (!v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController actionsViewController](self, "actionsViewController"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController pendingActionItems](self, "pendingActionItems"));
    objc_msgSend(v29, "addActionItems:", v30);

    -[BCChatSuggestRemoteViewController setPendingActionItems:](self, "setPendingActionItems:", 0);
    goto LABEL_14;
  }
LABEL_2:
  -[BCChatSuggestRemoteViewController _dismiss](self, "_dismiss");
LABEL_18:

}

- (void)configureAlertControllerForDialRequestAction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BCActionsListViewController *v18;
  void *v19;
  void *v20;
  _QWORD v21[3];

  v4 = a3;
  v5 = objc_alloc_init((Class)UIAlertController);
  objc_msgSend(v5, "setPreferredStyle:", 0);
  objc_msgSend(v5, "_setShouldAlignToKeyboard:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController bizItem](self, "bizItem"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController pendingActionItems](self, "pendingActionItems"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController bizItem](self, "bizItem"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController callAlertActionForBizItem:dialRequestAction:](self, "callAlertActionForBizItem:dialRequestAction:", v9, v4));

    if (objc_msgSend(v8, "count"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "arrayByAddingObject:", v10));

      -[BCChatSuggestRemoteViewController setPendingActionItems:](self, "setPendingActionItems:", 0);
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController bizItem](self, "bizItem"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController headerAlertActionForBizItem:](self, "headerAlertActionForBizItem:", v13));
      -[BCChatSuggestRemoteViewController setHeaderActionItem:](self, "setHeaderActionItem:", v14);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController bizItem](self, "bizItem"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController messageAlertActionForBizItem:dialRequestAction:](self, "messageAlertActionForBizItem:dialRequestAction:", v15, v4));

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController headerActionItem](self, "headerActionItem"));
      v21[0] = v17;
      v21[1] = v16;
      v21[2] = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 3));

    }
    objc_msgSend(v6, "addObjectsFromArray:", v11);

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController callAlertActionForBizItem:dialRequestAction:](self, "callAlertActionForBizItem:dialRequestAction:", 0, v4));
    objc_msgSend(v6, "addObject:", v12);

  }
  v18 = -[BCActionsListViewController initWithActionItems:brandedHeaderDelegate:]([BCActionsListViewController alloc], "initWithActionItems:brandedHeaderDelegate:", v6, self);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController bizItem](self, "bizItem"));
  -[BCActionsListViewController setBusinessItem:](v18, "setBusinessItem:", v19);

  objc_msgSend(v5, "setContentViewController:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController defaultAlertActionForDialRequestAction:](self, "defaultAlertActionForDialRequestAction:", v4));
  objc_msgSend(v5, "addAction:", v20);
  -[BCChatSuggestRemoteViewController setActionsViewController:](self, "setActionsViewController:", v18);
  -[BCChatSuggestRemoteViewController setAlertController:](self, "setAlertController:", v5);
  -[BCChatSuggestRemoteViewController _logPhoneNumberDisplayedIfNecessary](self, "_logPhoneNumberDisplayedIfNecessary");

}

- (id)headerAlertActionForBizItem:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  BCAlertActionItem *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  v5 = objc_msgSend(v3, "isVerified");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BCVSUtilities classBundle](BCVSUtilities, "classBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("VERIFIED"), &stru_100010860, 0));

  }
  else
  {
    v7 = 0;
  }
  v8 = -[BCAlertActionItem initWithTitle:subTitle:iconName:actionType:handler:]([BCAlertActionItem alloc], "initWithTitle:subTitle:iconName:actionType:handler:", v4, v7, 0, 1, 0);

  return v8;
}

- (id)messageAlertActionForBizItem:(id)a3 dialRequestAction:(id)a4
{
  id v6;
  id v7;
  BCAlertActionItem *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  BCAlertActionItem *v13;
  _QWORD v15[4];
  id v16;
  BCChatSuggestRemoteViewController *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = [BCAlertActionItem alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageTitle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageSubtitle"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000066C4;
  v15[3] = &unk_100010458;
  v16 = v6;
  v17 = self;
  v18 = v7;
  v11 = v7;
  v12 = v6;
  v13 = -[BCAlertActionItem initWithTitle:subTitle:iconName:actionType:handler:](v8, "initWithTitle:subTitle:iconName:actionType:handler:", v9, v10, CFSTR("MessageIcon"), 2, v15);

  return v13;
}

- (id)callAlertActionForBizItem:(id)a3 dialRequestAction:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BCAlertActionItem *v16;
  void *v17;
  id v18;
  id v19;
  BCAlertActionItem *v20;
  _QWORD v23[5];
  id v24;
  id v25;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "info"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForSetting:", 1));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TUHandle handleWithDictionaryRepresentation:](TUHandle, "handleWithDictionaryRepresentation:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "info"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForSetting:", 2));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "info"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForSetting:", 3));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v14, v12));
  v16 = [BCAlertActionItem alloc];
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "callSubtitle"));

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100006B9C;
  v23[3] = &unk_100010458;
  v23[4] = self;
  v24 = v5;
  v25 = v10;
  v18 = v10;
  v19 = v5;
  v20 = -[BCAlertActionItem initWithTitle:subTitle:iconName:actionType:handler:](v16, "initWithTitle:subTitle:iconName:actionType:handler:", v15, v17, CFSTR("PhoneIcon"), 2, v23);

  return v20;
}

- (id)defaultAlertActionForDialRequestAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  BCChatSuggestRemoteViewController *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForSetting:", 4));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100006FB0;
  v10[3] = &unk_100010480;
  v11 = v4;
  v12 = self;
  v7 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v6, 1, v10));

  return v8;
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (**v5)(_QWORD);
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;

  v5 = (void (**)(_QWORD))a4;
  v6 = sub_1000081C4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[BCChatSuggestRemoteViewController configureWithContext:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController _remoteViewControllerProxyWithErrorHandler:](self, "_remoteViewControllerProxyWithErrorHandler:", &stru_1000104C0));
  objc_msgSend(v8, "setReachabilityDisabled:", 1);
  objc_msgSend(v8, "setAllowsAlertStacking:", 0);
  objc_msgSend(v8, "setOrientationChangedEventsEnabled:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v8, "setLaunchingInterfaceOrientation:", objc_msgSend(v9, "activeInterfaceOrientation"));

  if (v5)
    v5[2](v5);

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = sub_1000081C4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315138;
    v15 = "-[BCChatSuggestRemoteViewController prepareForActivationWithContext:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v14, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController _remoteViewControllerProxyWithErrorHandler:](self, "_remoteViewControllerProxyWithErrorHandler:", &stru_1000104E0));
  objc_msgSend(v10, "setStatusBarHidden:withDuration:", 1, 0.4);
  if ((byte_100016870 & 1) == 0)
  {
    byte_100016870 = 1;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actions"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allObjects"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
    -[BCChatSuggestRemoteViewController setDialRequestAction:](self, "setDialRequestAction:", v13);

  }
  if (v7)
    v7[2](v7);

}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)_dismiss
{
  NSArray *pendingActionItems;
  UIAlertController *alertController;
  BCActionsListViewController *actionsViewController;
  BSAction *dialRequestAction;
  BCSBusinessItem *bizItem;
  BCAlertActionItem *headerActionItem;
  id v9;

  self->_chatSuggestUIPresented = 0;
  pendingActionItems = self->_pendingActionItems;
  self->_pendingActionItems = 0;

  alertController = self->_alertController;
  self->_alertController = 0;

  actionsViewController = self->_actionsViewController;
  self->_actionsViewController = 0;

  dialRequestAction = self->_dialRequestAction;
  self->_dialRequestAction = 0;

  bizItem = self->_bizItem;
  self->_bizItem = 0;

  headerActionItem = self->_headerActionItem;
  self->_headerActionItem = 0;

  self->_chatSuggestRemoteViewControllerDismissed = 1;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v9, "deactivate");

}

- (void)fetchBizInfoForDialRequestAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForSetting:", 1));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUHandle handleWithDictionaryRepresentation:](TUHandle, "handleWithDictionaryRepresentation:", v6));
  if (objc_msgSend(v7, "type") == (id)2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value"));
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      objc_initWeak(&location, self);
      v10 = objc_alloc_init((Class)BCSBusinessQueryService);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value"));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100007628;
      v12[3] = &unk_100010530;
      objc_copyWeak(&v14, &location);
      v13 = v4;
      objc_msgSend(v10, "fetchBusinessItemForPhoneNumber:completion:", v11, v12);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }

}

- (void)_logPhoneNumberDisplayedIfNecessary
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  if (!-[BCChatSuggestRemoteViewController phoneNumberUIPresented](self, "phoneNumberUIPresented"))
  {
    -[BCChatSuggestRemoteViewController setPhoneNumberUIPresentedTime:](self, "setPhoneNumberUIPresentedTime:", CACurrentMediaTime());
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController bizItem](self, "bizItem"));
    -[BCChatSuggestRemoteViewController setHadBizItemWhenPhoneNumberUIPresented:](self, "setHadBizItemWhenPhoneNumberUIPresented:", v3 != 0);

  }
  -[BCChatSuggestRemoteViewController setPhoneNumberUIPresented:](self, "setPhoneNumberUIPresented:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController bizItem](self, "bizItem"));

  if (v4)
  {
    if (!-[BCChatSuggestRemoteViewController phoneNumberDisplayLogged](self, "phoneNumberDisplayLogged"))
    {
      -[BCChatSuggestRemoteViewController setPhoneNumberDisplayLogged:](self, "setPhoneNumberDisplayLogged:", 1);
      -[BCChatSuggestRemoteViewController phoneNumberUIPresentedTime](self, "phoneNumberUIPresentedTime");
      v6 = v5;
      -[BCChatSuggestRemoteViewController viewControllerDidLoadTime](self, "viewControllerDidLoadTime");
      v8 = (uint64_t)((v6 - v7) * 1000.0);
      v9 = -[BCChatSuggestRemoteViewController hadBizItemWhenPhoneNumberUIPresented](self, "hadBizItemWhenPhoneNumberUIPresented") ^ 1;
      v10 = (id)objc_claimAutoreleasedReturnValue(-[BCChatSuggestRemoteViewController bizItem](self, "bizItem"));
      +[BCCoreAnalytics logEventForView:bizItem:bizItemReturnedAfterAction:latency:](BCCoreAnalytics, "logEventForView:bizItem:bizItemReturnedAfterAction:latency:", CFSTR("com.apple.BusinessChatViewService.PhoneNumberAppears"), v10, v9, v8);

    }
  }
}

- (int64_t)_latencyFromViewDidLoad
{
  double v3;
  double v4;

  v3 = CACurrentMediaTime();
  -[BCChatSuggestRemoteViewController viewControllerDidLoadTime](self, "viewControllerDidLoadTime");
  return (uint64_t)((v3 - v4) * 1000.0);
}

- (void)brandedHeaderViewController:(id)a3 logoFetchingWillBeginForBusinessItem:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  unint64_t v9;
  os_signpost_id_t v10;
  int v11;
  const char *v12;

  v5 = sub_1000081C4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[BCChatSuggestRemoteViewController brandedHeaderViewController:logoFetchingWillBeginForBusinessItem:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  v7 = sub_1000081C4();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = -[BCChatSuggestRemoteViewController tapId](self, "tapId");
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      LOWORD(v11) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "RenderBusinessChatIcon", ", (uint8_t *)&v11, 2u);
    }
  }

}

- (void)brandedHeaderViewController:(id)a3 logoFetchingDidFinishForBusinessItem:(id)a4 success:(BOOL)a5
{
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  unint64_t v10;
  os_signpost_id_t v11;
  id v12;
  NSObject *v13;
  unint64_t v14;
  os_signpost_id_t v15;
  id v16;
  NSObject *v17;
  unint64_t v18;
  os_signpost_id_t v19;
  int v20;
  const char *v21;

  v6 = sub_1000081C4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 136315138;
    v21 = "-[BCChatSuggestRemoteViewController brandedHeaderViewController:logoFetchingDidFinishForBusinessItem:success:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v20, 0xCu);
  }

  v8 = sub_1000081C4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = -[BCChatSuggestRemoteViewController tapId](self, "tapId");
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v11 = v10;
    if (os_signpost_enabled(v9))
    {
      LOWORD(v20) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v11, "RenderBusinessChatIcon", ", (uint8_t *)&v20, 2u);
    }
  }

  v12 = sub_1000081C4();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = -[BCChatSuggestRemoteViewController tapId](self, "tapId");
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v15 = v14;
    if (os_signpost_enabled(v13))
    {
      LOWORD(v20) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, v15, "RenderBusinessChatUI", ", (uint8_t *)&v20, 2u);
    }
  }

  v16 = sub_1000081C4();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = -[BCChatSuggestRemoteViewController tapId](self, "tapId");
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v19 = v18;
    if (os_signpost_enabled(v17))
    {
      LOWORD(v20) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_EVENT, v19, "ChatSuggestEnd", ", (uint8_t *)&v20, 2u);
    }
  }

}

- (BCDeviceStateProtocol)deviceState
{
  return self->_deviceState;
}

- (BCPresenterProtocol)presenter
{
  return self->_presenter;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (BCActionsListViewController)actionsViewController
{
  return self->_actionsViewController;
}

- (void)setActionsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_actionsViewController, a3);
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alertController, a3);
}

- (BCAlertActionItem)headerActionItem
{
  return self->_headerActionItem;
}

- (void)setHeaderActionItem:(id)a3
{
  objc_storeStrong((id *)&self->_headerActionItem, a3);
}

- (BCSBusinessItem)bizItem
{
  return self->_bizItem;
}

- (void)setBizItem:(id)a3
{
  objc_storeStrong((id *)&self->_bizItem, a3);
}

- (BSAction)dialRequestAction
{
  return self->_dialRequestAction;
}

- (NSArray)pendingActionItems
{
  return self->_pendingActionItems;
}

- (void)setPendingActionItems:(id)a3
{
  objc_storeStrong((id *)&self->_pendingActionItems, a3);
}

- (unint64_t)tapId
{
  return self->_tapId;
}

- (void)setTapId:(unint64_t)a3
{
  self->_tapId = a3;
}

- (BOOL)chatSuggestUIPresented
{
  return self->_chatSuggestUIPresented;
}

- (void)setChatSuggestUIPresented:(BOOL)a3
{
  self->_chatSuggestUIPresented = a3;
}

- (BOOL)phoneNumberUIPresented
{
  return self->_phoneNumberUIPresented;
}

- (void)setPhoneNumberUIPresented:(BOOL)a3
{
  self->_phoneNumberUIPresented = a3;
}

- (BOOL)phoneNumberDisplayLogged
{
  return self->_phoneNumberDisplayLogged;
}

- (void)setPhoneNumberDisplayLogged:(BOOL)a3
{
  self->_phoneNumberDisplayLogged = a3;
}

- (BOOL)chatSuggestRemoteViewControllerDismissed
{
  return self->_chatSuggestRemoteViewControllerDismissed;
}

- (void)setChatSuggestRemoteViewControllerDismissed:(BOOL)a3
{
  self->_chatSuggestRemoteViewControllerDismissed = a3;
}

- (double)viewControllerDidLoadTime
{
  return self->_viewControllerDidLoadTime;
}

- (void)setViewControllerDidLoadTime:(double)a3
{
  self->_viewControllerDidLoadTime = a3;
}

- (double)phoneNumberUIPresentedTime
{
  return self->_phoneNumberUIPresentedTime;
}

- (void)setPhoneNumberUIPresentedTime:(double)a3
{
  self->_phoneNumberUIPresentedTime = a3;
}

- (BOOL)hadBizItemWhenPhoneNumberUIPresented
{
  return self->_hadBizItemWhenPhoneNumberUIPresented;
}

- (void)setHadBizItemWhenPhoneNumberUIPresented:(BOOL)a3
{
  self->_hadBizItemWhenPhoneNumberUIPresented = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingActionItems, 0);
  objc_storeStrong((id *)&self->_dialRequestAction, 0);
  objc_storeStrong((id *)&self->_bizItem, 0);
  objc_storeStrong((id *)&self->_headerActionItem, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_actionsViewController, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_deviceState, 0);
}

@end
