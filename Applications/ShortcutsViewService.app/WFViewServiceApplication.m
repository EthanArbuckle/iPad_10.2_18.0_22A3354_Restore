@implementation WFViewServiceApplication

- (void)_handlePlatformSpecificActions:(id)a3 forScene:(id)a4 withTransitionContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location;
  uint8_t buf[4];
  const char *v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WFViewServiceApplication activeConnection](self, "activeConnection"));

  if (v11)
  {
    v12 = sub_100005558();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[WFViewServiceApplication _handlePlatformSpecificActions:forScene:withTransitionContext:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s View service application already has an active connection, dropping incoming connection", buf, 0xCu);
    }
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "info"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForSetting:](v13, "objectForSetting:", 0));
    if (v16)
    {
      v17 = objc_alloc_init((Class)NSXPCListenerEndpoint);
      -[NSObject _setEndpoint:](v17, "_setEndpoint:", v16);
      v18 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithListenerEndpoint:", v17);
      v19 = WFWorkflowStatusXPCInterface(objc_msgSend(v18, "setExportedObject:", self));
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      objc_msgSend(v18, "setExportedInterface:", v20);

      objc_initWeak(&location, self);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100005648;
      v29[3] = &unk_1000103A0;
      objc_copyWeak(&v30, &location);
      objc_msgSend(v18, "setInterruptionHandler:", v29);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100005708;
      v27[3] = &unk_1000103A0;
      objc_copyWeak(&v28, &location);
      objc_msgSend(v18, "setInvalidationHandler:", v27);
      objc_msgSend(v18, "resume");
      v21 = WFWorkflowStatusHostXPCInterface(-[WFViewServiceApplication setActiveConnection:](self, "setActiveConnection:", v18));
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      objc_msgSend(v18, "setRemoteObjectInterface:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "remoteObjectProxy"));
      objc_msgSend(v23, "workflowStatusHostBeginConnection");

      v24 = sub_100005558();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "-[WFViewServiceApplication _handlePlatformSpecificActions:forScene:withTransitionContext:]";
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s Opened XPC connection to incoming endpoint", buf, 0xCu);
      }

      objc_destroyWeak(&v28);
      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);

    }
    else
    {
      v26 = sub_100005558();
      v17 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "-[WFViewServiceApplication _handlePlatformSpecificActions:forScene:withTransitionContext:]";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Received a BSAction, but it was missing an endpoint", buf, 0xCu);
      }
    }

  }
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = objc_alloc((Class)UISceneConfiguration);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "role"));

  v8 = objc_msgSend(v6, "initWithName:sessionRole:", CFSTR("Main"), v7);
  return v8;
}

- (void)workflowStatusWorkflowWillBeginRunningWithAttribution:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  WFApertureStatusViewController *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = sub_100005558();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[WFViewServiceApplication workflowStatusWorkflowWillBeginRunningWithAttribution:context:]";
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s workflowWillBeginRunningWithAttribution: %@ context: %@", buf, 0x20u);
  }

  v10 = -[WFApertureStatusViewController initWithRunningContext:attribution:]([WFApertureStatusViewController alloc], "initWithRunningContext:attribution:", v7, v6);
  objc_storeStrong((id *)&self->_lastPresentedStatus, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WFViewServiceApplication bannerSourceForPresentable:](self, "bannerSourceForPresentable:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController postOptions](v10, "postOptions"));
  v17 = 0;
  v13 = objc_msgSend(v11, "postPresentable:options:userInfo:error:", v10, 1, v12, &v17);
  v14 = v17;

  if ((v13 & 1) == 0)
  {
    v15 = sub_100005558();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[WFViewServiceApplication workflowStatusWorkflowWillBeginRunningWithAttribution:context:]";
      v20 = 2112;
      v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s Failed to post banner: %@", buf, 0x16u);
    }

  }
}

- (void)workflowStatusWorkflowDidFinishWithSuccess:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  void *v7;
  dispatch_time_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  _BOOL4 v17;

  v3 = a3;
  v5 = sub_100005558();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[WFViewServiceApplication workflowStatusWorkflowDidFinishWithSuccess:]";
    v16 = 1024;
    v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s workflowDidFinishWithSuccess: %i", buf, 0x12u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WFViewServiceApplication lastPresentedStatus](self, "lastPresentedStatus"));
  if (v3)
  {
    v8 = dispatch_time(0, 1000000000);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100005598;
    v12[3] = &unk_1000103C8;
    v12[4] = self;
    v13 = v7;
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v12);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WFViewServiceApplication bannerSourceForPresentable:](self, "bannerSourceForPresentable:", v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "requestIdentifier"));
    v11 = objc_msgSend(v9, "revokePresentableWithRequestIdentifier:reason:animated:userInfo:error:", v10, CFSTR("done"), 1, &__NSDictionary0__struct, 0);

  }
}

- (id)bannerSourceForPresentable:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "requesterIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BNBannerSource bannerSourceForDestination:forRequesterIdentifier:](BNBannerSource, "bannerSourceForDestination:forRequesterIdentifier:", 0, v3));

  return v4;
}

- (NSXPCConnection)activeConnection
{
  return self->_activeConnection;
}

- (void)setActiveConnection:(id)a3
{
  objc_storeStrong((id *)&self->_activeConnection, a3);
}

- (WFApertureStatusViewController)lastPresentedStatus
{
  return self->_lastPresentedStatus;
}

- (void)setLastPresentedStatus:(id)a3
{
  objc_storeStrong((id *)&self->_lastPresentedStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPresentedStatus, 0);
  objc_storeStrong((id *)&self->_activeConnection, 0);
}

@end
