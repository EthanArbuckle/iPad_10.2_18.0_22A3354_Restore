@implementation AKRemoteViewController

- (void)dealloc
{
  objc_super v3;

  -[AKRemoteViewController _invalidateLookupConnection](self, "_invalidateLookupConnection");
  v3.receiver = self;
  v3.super_class = (Class)AKRemoteViewController;
  -[AKRemoteViewController dealloc](&v3, "dealloc");
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == (id)1)
    return 30;
  else
    return 2;
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)setUpHostProxy
{
  uint64_t v2;
  NSObject *v3;

  v2 = _AKLogSystem(self, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_10000655C(v3);

}

- (void)setUpLookupConnection:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSXPCListenerEndpoint *v8;
  id v9;
  void *v10;

  v4 = a3;
  v6 = _AKLogSystem(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_10000659C(v7);

  v8 = objc_opt_new(NSXPCListenerEndpoint);
  -[NSXPCListenerEndpoint _setEndpoint:](v8, "_setEndpoint:", v4);

  v9 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithListenerEndpoint:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKRemoteViewController remoteObjectInterface](self, "remoteObjectInterface"));
  objc_msgSend(v9, "setRemoteObjectInterface:", v10);

  objc_msgSend(v9, "resume");
  -[AKRemoteViewController setLookupConnection:](self, "setLookupConnection:", v9);
  -[AKRemoteViewController setUpHostProxy](self, "setUpHostProxy");

}

- (id)remoteObjectInterface
{
  return +[AKAuthorizationPresenterHostInterface XPCInterface](AKAuthorizationPresenterHostInterface, "XPCInterface");
}

- (void)setupRemoteProxy
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AKRemoteViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v2, "setShouldDisableFadeInAnimation:", 1);
  objc_msgSend(v2, "setAllowsMenuButtonDismissal:", 1);
  objc_msgSend(v2, "setAllowsSiri:", 0);
  objc_msgSend(v2, "setAllowsAlertStacking:", 1);
  objc_msgSend(v2, "setDesiredHardwareButtonEvents:", 17);
  objc_msgSend(v2, "setSwipeDismissalStyle:", 0);
  objc_msgSend(v2, "setDismissalAnimationStyle:", 1);

}

- (void)handleButtonActions:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  unint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        v10 = (unint64_t)objc_msgSend(v9, "events") & 0x10;
        if (v10 & 0xFFFFFFFFFFFFFFFELL | (unint64_t)objc_msgSend(v9, "events") & 1
          && (objc_opt_respondsToSelector(self, "handleCancellation:") & 1) != 0)
        {
          -[AKRemoteViewController handleCancellation:](self, "handleCancellation:", v4);
        }
        objc_msgSend(v9, "sendResponseWithUnHandledEvents:", (unint64_t)objc_msgSend(v9, "events") ^ v10);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)_invalidateLookupConnection
{
  NSXPCConnection *lookupConnection;

  -[NSXPCConnection invalidate](self->_lookupConnection, "invalidate");
  lookupConnection = self->_lookupConnection;
  self->_lookupConnection = 0;

}

- (void)dismissAndExit
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003AB0;
  block[3] = &unk_10000C398;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)endUIService
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AKRemoteViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v2, "invalidate");

}

- (void)_main_dismissAndExit
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  -[AKRemoteViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
  -[AKRemoteViewController endUIService](self, "endUIService");
}

- (NSXPCConnection)lookupConnection
{
  return self->_lookupConnection;
}

- (void)setLookupConnection:(id)a3
{
  objc_storeStrong((id *)&self->_lookupConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupConnection, 0);
}

@end
