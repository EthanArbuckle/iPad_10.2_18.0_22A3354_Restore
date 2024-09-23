@implementation ServiceBackgroundAssetConsentViewController

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
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id location;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (!+[objc_LockscreenStatus isDeviceUnlocked](_TtC17StoreKitUIService21objc_LockscreenStatus, "isDeviceUnlocked"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10002984C();
    exit(0);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  -[ServiceBackgroundAssetConsentViewController setDidProvideConsentAction:](self, "setDidProvideConsentAction:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceBackgroundAssetConsentViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v11, "setDesiredHardwareButtonEvents:", 16);
  objc_msgSend(v11, "setAllowsMenuButtonDismissal:", 1);
  objc_msgSend(v11, "setAllowsBanners:", 1);
  objc_msgSend(v11, "setWallpaperTunnelActive:", 1);
  objc_msgSend(v11, "setAllowsAlertStacking:", 1);
  objc_msgSend(v11, "setDismissalAnimationStyle:", 2);
  objc_msgSend(v11, "setReachabilityDisabled:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v13 = (unint64_t)objc_msgSend(v12, "userInterfaceIdiom");

  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v15 = objc_msgSend(v14, "statusBarOrientation");

    objc_msgSend(v11, "setLaunchingInterfaceOrientation:", v15);
  }
  v16 = objc_alloc_init((Class)SKBackgroundAssetConsentViewController);
  objc_initWeak(&location, self);
  v18 = _NSConcreteStackBlock;
  v19 = 3221225472;
  v20 = sub_100007F94;
  v21 = &unk_100049070;
  objc_copyWeak(&v22, &location);
  objc_msgSend(v16, "setResponseBlock:", &v18);
  -[ServiceBackgroundAssetConsentViewController setChildViewController:](self, "setChildViewController:", v16, v18, v19, v20, v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceBackgroundAssetConsentViewController childViewController](self, "childViewController"));
  objc_msgSend(v17, "setModalPresentationStyle:", 2);

  -[ServiceBackgroundAssetConsentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, &stru_100049090);
  if (v7)
    v7[2](v7);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

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
          -[ServiceBackgroundAssetConsentViewController _dismissViewService](self, "_dismissViewService");
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

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  void *v3;
  unint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice", a3));
  v4 = (unint64_t)objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 30;
  else
    return 2;
}

- (void)_dismissViewService
{
  void *v3;
  unsigned int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceBackgroundAssetConsentViewController didProvideConsentAction](self, "didProvideConsentAction"));
  v4 = objc_msgSend(v3, "canSendResponse");

  if (v4)
  {
    v5 = objc_alloc_init((Class)BSMutableSettings);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceBackgroundAssetConsentViewController consentProvided](self, "consentProvided"));
    objc_msgSend(v5, "setObject:forSetting:", v6, 1);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceBackgroundAssetConsentViewController didProvideConsentAction](self, "didProvideConsentAction"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BSActionResponse responseWithInfo:](BSActionResponse, "responseWithInfo:", v5));
    objc_msgSend(v7, "sendResponse:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceBackgroundAssetConsentViewController childViewController](self, "childViewController"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceBackgroundAssetConsentViewController childViewController](self, "childViewController"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100008290;
    v12[3] = &unk_1000490B8;
    v12[4] = self;
    objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, v12);

  }
  else
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[ServiceBackgroundAssetConsentViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    objc_msgSend(v11, "deactivate");

  }
}

- (UIViewController)childViewController
{
  return self->_childViewController;
}

- (void)setChildViewController:(id)a3
{
  objc_storeStrong((id *)&self->_childViewController, a3);
}

- (BSAction)didProvideConsentAction
{
  return self->_didProvideConsentAction;
}

- (void)setDidProvideConsentAction:(id)a3
{
  objc_storeStrong((id *)&self->_didProvideConsentAction, a3);
}

- (NSNumber)consentProvided
{
  return self->_consentProvided;
}

- (void)setConsentProvided:(id)a3
{
  objc_storeStrong((id *)&self->_consentProvided, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consentProvided, 0);
  objc_storeStrong((id *)&self->_didProvideConsentAction, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);
}

@end
