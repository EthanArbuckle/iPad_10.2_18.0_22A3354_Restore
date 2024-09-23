@implementation ASViewServiceViewController

- (void)_setUpRemoteProxy
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ASViewServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v2, "setShouldDisableFadeInAnimation:", 1);
  objc_msgSend(v2, "setAllowsMenuButtonDismissal:", 1);
  objc_msgSend(v2, "setAllowsSiri:", 0);
  objc_msgSend(v2, "setAllowsAlertStacking:", 1);
  objc_msgSend(v2, "setDesiredHardwareButtonEvents:", 17);
  objc_msgSend(v2, "setSwipeDismissalStyle:", 0);
  objc_msgSend(v2, "setDismissalAnimationStyle:", 1);

}

- (unint64_t)supportedInterfaceOrientations
{
  if (+[_ASDevice isPad](_ASDevice, "isPad"))
    return 30;
  else
    return 2;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASViewServiceViewController;
  -[ASViewServiceViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[ASViewServiceViewController _setUpRemoteProxy](self, "_setUpRemoteProxy");
  -[ASViewServiceViewController _showAuthorizationFlow](self, "_showAuthorizationFlow");
}

- (void)_showAuthorizationFlow
{
  PMAuthorizationViewController *v3;
  PMAuthorizationViewController *authorizationViewController;
  unsigned int v5;
  PMAuthorizationViewController *v6;

  v3 = (PMAuthorizationViewController *)objc_msgSend(objc_alloc((Class)PMAuthorizationViewController), "initWithPresentationContext:activity:", self->_presentationContext, self->_authorizationActivity);
  authorizationViewController = self->_authorizationViewController;
  self->_authorizationViewController = v3;

  -[PMAuthorizationViewController setDelegate:](self->_authorizationViewController, "setDelegate:", self);
  v5 = -[ASCAuthorizationPresentationContext isConditionalRegistrationRequest](self->_presentationContext, "isConditionalRegistrationRequest");
  v6 = self->_authorizationViewController;
  if (v5)
    -[PMAuthorizationViewController performConditionalRegistrationIfPossible](self->_authorizationViewController, "performConditionalRegistrationIfPossible", v6);
  else
    -[ASViewServiceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6);
}

- (void)dealloc
{
  objc_super v3;

  -[ASViewServiceViewController _invalidateLookupConnection](self, "_invalidateLookupConnection");
  v3.receiver = self;
  v3.super_class = (Class)ASViewServiceViewController;
  -[ASViewServiceViewController dealloc](&v3, "dealloc");
}

- (void)_dismissAndExit
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003934;
  block[3] = &unk_10000C568;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_invalidateLookupConnection
{
  NSXPCConnection *lookupConnection;

  -[NSXPCConnection invalidate](self->_lookupConnection, "invalidate");
  lookupConnection = self->_lookupConnection;
  self->_lookupConnection = 0;

}

- (void)_performQueuedUpdatesIfNecessary
{
  NSArray *loginChoicesForQueuedUpdate;

  if (self->_loginChoicesForQueuedUpdate)
    -[PMAuthorizationViewController updateInterfaceWithLoginChoices:](self->_authorizationViewController, "updateInterfaceWithLoginChoices:");
  if (self->_hasQueuedPINEntryRequest)
    -[PMAuthorizationViewController presentPINEntryInterface](self->_authorizationViewController, "presentPINEntryInterface");
  loginChoicesForQueuedUpdate = self->_loginChoicesForQueuedUpdate;
  self->_loginChoicesForQueuedUpdate = 0;

  self->_hasQueuedPINEntryRequest = 0;
}

- (void)updateInterfaceWithLoginChoices:(id)a3
{
  id v4;
  NSObject *interfaceUpdateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  interfaceUpdateQueue = self->_interfaceUpdateQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100003B84;
  v7[3] = &unk_10000C590;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(interfaceUpdateQueue, v7);

}

- (void)presentPINEntryInterface
{
  NSObject *interfaceUpdateQueue;
  _QWORD block[5];

  interfaceUpdateQueue = self->_interfaceUpdateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003C24;
  block[3] = &unk_10000C568;
  block[4] = self;
  dispatch_async(interfaceUpdateQueue, block);
}

- (void)updateInterfaceForUserVisibleError:(id)a3
{
  -[PMAuthorizationViewController pushOrUpdateBasicPaneViewControllerWithError:](self->_authorizationViewController, "pushOrUpdateBasicPaneViewControllerWithError:", objc_msgSend(a3, "code"));
}

- (void)dismissWithError:(id)a3
{
  id v4;
  NSObject *interfaceUpdateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  interfaceUpdateQueue = self->_interfaceUpdateQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100003D18;
  v7[3] = &unk_10000C590;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(interfaceUpdateQueue, v7);

}

- (void)cableClientWillConnect
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003D8C;
  block[3] = &unk_10000C568;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)cableClientWillAuthenticate
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003DF8;
  block[3] = &unk_10000C568;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  OS_os_activity *v8;
  OS_os_activity *authorizationActivity;
  void *v10;
  void *v11;
  id v12;

  v6 = (void (**)(_QWORD))a4;
  v7 = a3;
  v8 = (OS_os_activity *)_os_activity_create((void *)&_mh_execute_header, "Authorization view service", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  authorizationActivity = self->_authorizationActivity;
  self->_authorizationActivity = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "safari_dataForKey:", ASCAuthorizationPresentationContextDataKey));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "xpcEndpoint"));
  -[ASViewServiceViewController setUpWithPresentationContextData:xpcEndpoint:](self, "setUpWithPresentationContextData:xpcEndpoint:", v12, v11);

  v6[2](v6);
}

- (void)setUpWithPresentationContextData:(id)a3 xpcEndpoint:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *interfaceUpdateQueue;
  NSXPCListenerEndpoint *v10;
  id v11;
  void *v12;
  void *v13;
  ASCAuthorizationPresenterHostProtocol *v14;
  ASCAuthorizationPresenterHostProtocol *hostProxy;
  id v16;
  ASCAuthorizationPresentationContext *v17;
  id v18;
  ASCAuthorizationPresentationContext *presentationContext;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id location;
  _BYTE v27[24];

  v6 = a3;
  v7 = a4;
  v8 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AuthenticationServicesUI.InterfaceUpdateQueue", 0);
  interfaceUpdateQueue = self->_interfaceUpdateQueue;
  self->_interfaceUpdateQueue = v8;

  v10 = objc_opt_new(NSXPCListenerEndpoint);
  -[NSXPCListenerEndpoint _setEndpoint:](v10, "_setEndpoint:", v7);
  v11 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithListenerEndpoint:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[ASCAuthorizationPresenterHostInterface xpcInterface](ASCAuthorizationPresenterHostInterface, "xpcInterface"));
  objc_msgSend(v11, "setRemoteObjectInterface:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[ASCViewServiceInterface xpcInterface](ASCViewServiceInterface, "xpcInterface"));
  objc_msgSend(v11, "setExportedInterface:", v13);

  objc_msgSend(v11, "setExportedObject:", self);
  objc_msgSend(v11, "resume");
  objc_storeStrong((id *)&self->_lookupConnection, v11);
  objc_initWeak(&location, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000041C8;
  v24[3] = &unk_10000C5B8;
  objc_copyWeak(&v25, &location);
  v14 = (ASCAuthorizationPresenterHostProtocol *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v24));
  hostProxy = self->_hostProxy;
  self->_hostProxy = v14;

  -[ASCAuthorizationPresenterHostProtocol initializeClientToViewServiceConnection](self->_hostProxy, "initializeClientToViewServiceConnection");
  if (objc_msgSend(v6, "length"))
  {
    v23 = 0;
    v16 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(ASCAuthorizationPresentationContext), v6, &v23);
    v17 = (ASCAuthorizationPresentationContext *)objc_claimAutoreleasedReturnValue(v16);
    v18 = v23;
    presentationContext = self->_presentationContext;
    self->_presentationContext = v17;

    if (v18)
    {
      v20 = (id)sub_100003698();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "safari_privacyPreservingDescription"));
        sub_100007B84(v21, (uint64_t)v27, v20);
      }

      -[ASViewServiceViewController _dismissAndExit](self, "_dismissAndExit");
    }

  }
  else
  {
    v22 = sub_100003698();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_100007B44(v22);
    -[ASViewServiceViewController _dismissAndExit](self, "_dismissAndExit");
  }
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

- (void)handleButtonActions:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  ASCAuthorizationPresenterHostProtocol *hostProxy;
  _QWORD v15[5];
  uint8_t buf[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v8 = ASCAuthorizationErrorDomain;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v11 = (unint64_t)objc_msgSend(v10, "events") & 0x10;
        if (v11 & 0xFFFFFFFFFFFFFFFELL | (unint64_t)objc_msgSend(v10, "events") & 1)
        {
          v12 = sub_100003698();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Dismissing credential picker because of home button or lock button event.", buf, 2u);
          }
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v8, 2, 0));
          hostProxy = self->_hostProxy;
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_100004420;
          v15[3] = &unk_10000C568;
          v15[4] = self;
          -[ASCAuthorizationPresenterHostProtocol authorizationRequestFinishedWithCredential:error:completionHandler:](hostProxy, "authorizationRequestFinishedWithCredential:error:completionHandler:", 0, v13, v15);

        }
        objc_msgSend(v10, "sendResponseWithUnHandledEvents:", (unint64_t)objc_msgSend(v10, "events") & ~v11);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

}

- (void)authorizationViewController:(id)a3 didRequestCredentialForLoginChoice:(id)a4 authenticatedContext:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  ASCAuthorizationPresenterHostProtocol *hostProxy;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v9 = a5;
  v10 = a6;
  hostProxy = self->_hostProxy;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000044E0;
  v14[3] = &unk_10000C5E0;
  v15 = v9;
  v16 = v10;
  v12 = v10;
  v13 = v9;
  -[ASCAuthorizationPresenterHostProtocol authorizationRequestInitiatedWithLoginChoice:authenticatedContext:completionHandler:](hostProxy, "authorizationRequestInitiatedWithLoginChoice:authenticatedContext:completionHandler:", a4, v13, v14);

}

- (void)authorizationViewController:(id)a3 didCompleteWithCredential:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  ASCAuthorizationPresenterHostProtocol *hostProxy;
  NSObject *v15;
  _QWORD v16[5];
  uint8_t buf[16];

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
  v10 = AKErrorAlertShouldDismissUIAfterPresentationKey;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", AKErrorAlertShouldDismissUIAfterPresentationKey));

  if (v11
    && (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo")),
        v13 = objc_msgSend(v12, "safari_BOOLForKey:", v10),
        v12,
        (v13 & 1) == 0))
  {
    v15 = sub_100003698();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Skipping UI dismissal after failed Sign in with Apple credential sign in attempt.", buf, 2u);
    }
  }
  else
  {
    hostProxy = self->_hostProxy;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100004620;
    v16[3] = &unk_10000C568;
    v16[4] = self;
    -[ASCAuthorizationPresenterHostProtocol authorizationRequestFinishedWithCredential:error:completionHandler:](hostProxy, "authorizationRequestFinishedWithCredential:error:completionHandler:", v7, v8, v16);
  }

}

- (void)authorizationViewController:(id)a3 validateUserEnteredPIN:(id)a4 completionHandler:(id)a5
{
  -[ASCAuthorizationPresenterHostProtocol validateUserEnteredPIN:completionHandler:](self->_hostProxy, "validateUserEnteredPIN:completionHandler:", a4, a5);
}

- (void)authorizationViewControllerDidCompleteInitialPresentation:(id)a3
{
  NSObject *interfaceUpdateQueue;
  _QWORD block[5];

  interfaceUpdateQueue = self->_interfaceUpdateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000046A0;
  block[3] = &unk_10000C568;
  block[4] = self;
  dispatch_async(interfaceUpdateQueue, block);
}

- (void)dismissAndPresentAgain:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004714;
  block[3] = &unk_10000C568;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)authorizationViewController:(id)a3 startCABLEAuthenticationWithCompletionHandler:(id)a4
{
  -[ASCAuthorizationPresenterHostProtocol startCABLEAuthenticationWithCompletionHandler:](self->_hostProxy, "startCABLEAuthenticationWithCompletionHandler:", a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationActivity, 0);
  objc_storeStrong((id *)&self->_loginChoicesForQueuedUpdate, 0);
  objc_storeStrong((id *)&self->_interfaceUpdateQueue, 0);
  objc_storeStrong((id *)&self->_hostProxy, 0);
  objc_storeStrong((id *)&self->_lookupConnection, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_authorizationViewController, 0);
}

@end
