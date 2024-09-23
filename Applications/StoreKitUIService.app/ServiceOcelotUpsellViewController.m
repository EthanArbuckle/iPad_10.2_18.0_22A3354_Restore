@implementation ServiceOcelotUpsellViewController

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = (unint64_t)objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 30;
  else
    return 2;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void (**v25)(void);

  v25 = (void (**)(void))a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceOcelotUpsellViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v7, "setDesiredHardwareButtonEvents:", 16);
  objc_msgSend(v7, "setAllowsMenuButtonDismissal:", 1);
  objc_msgSend(v7, "setWallpaperTunnelActive:", 1);
  objc_msgSend(v7, "setAllowsAlertStacking:", 1);
  objc_msgSend(v7, "setDismissalAnimationStyle:", 2);
  objc_msgSend(v7, "setReachabilityDisabled:", 1);
  objc_msgSend(v7, "setSwipeDismissalStyle:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v9 = (unint64_t)objc_msgSend(v8, "userInterfaceIdiom");

  if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v11 = objc_msgSend(v10, "statusBarOrientation");

    objc_msgSend(v7, "setLaunchingInterfaceOrientation:", v11);
  }
  v12 = objc_alloc((Class)SKArcadeSubscribeViewController);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("itemID")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("bundleID")));
  v17 = objc_msgSend(v12, "initWithItemID:bundleID:", v14, v16);
  -[ServiceOcelotUpsellViewController setChildViewController:](self, "setChildViewController:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceOcelotUpsellViewController childViewController](self, "childViewController"));
  objc_msgSend(v18, "setDelegate:", self);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceOcelotUpsellViewController childViewController](self, "childViewController"));
  -[ServiceOcelotUpsellViewController addChildViewController:](self, "addChildViewController:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceOcelotUpsellViewController childViewController](self, "childViewController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "view"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceOcelotUpsellViewController view](self, "view"));
  objc_msgSend(v22, "bounds");
  objc_msgSend(v21, "setFrame:");

  objc_msgSend(v21, "setAutoresizingMask:", 18);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceOcelotUpsellViewController view](self, "view"));
  objc_msgSend(v23, "addSubview:", v21);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceOcelotUpsellViewController childViewController](self, "childViewController"));
  objc_msgSend(v24, "didMoveToParentViewController:", self);

  if (v25)
    v25[2]();

}

- (void)handleButtonActions:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "events") & 0x10) != 0)
          -[ServiceOcelotUpsellViewController _dismissViewService](self, "_dismissViewService");
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)_dismissViewService
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ServiceOcelotUpsellViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "dismiss");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceOcelotUpsellViewController childViewController](self, "childViewController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceOcelotUpsellViewController childViewController](self, "childViewController"));
    objc_msgSend(v4, "finishExtension");

  }
}

- (void)didFinishWithError:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      LODWORD(v7) = v6 | 2;
    else
      LODWORD(v7) = v6;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "OSLogObject"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      v7 = v7;
    else
      v7 &= 2u;
    if ((_DWORD)v7)
    {
      v11 = 138543618;
      v12 = (id)objc_opt_class(self);
      v13 = 2114;
      v14 = v4;
      v9 = v12;
      v10 = (void *)_os_log_send_and_compose_impl(v7, 0, 0, 0, &_mh_execute_header, v8, 16, "%{public}@: Finished with error: %{public}@", &v11, 22);

      if (!v10)
      {
LABEL_12:

        goto LABEL_13;
      }
      v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4));
      free(v10);
      SSFileLog(v5, CFSTR("%@"));
    }

    goto LABEL_12;
  }
LABEL_13:
  -[ServiceOcelotUpsellViewController _dismissViewService](self, "_dismissViewService");

}

- (SKArcadeSubscribeViewController)childViewController
{
  return self->_childViewController;
}

- (void)setChildViewController:(id)a3
{
  objc_storeStrong((id *)&self->_childViewController, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
  objc_storeStrong((id *)&self->_itemID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);
}

@end
