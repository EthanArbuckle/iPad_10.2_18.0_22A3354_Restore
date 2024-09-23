@implementation CPSAlertViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];

  v15.receiver = self;
  v15.super_class = (Class)CPSAlertViewController;
  -[CPSAlertViewController viewDidLoad](&v15, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllers", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "_dismiss");
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllers"));
  objc_msgSend(v10, "addObject:", self);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPSAlertViewController;
  -[CPSAlertViewController viewDidDisappear:](&v7, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewControllers"));
  objc_msgSend(v6, "removeObject:", self);

}

- (void)_displayLaunchContentViewController
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v3 = (void *)qword_10000D308;
  v11 = qword_10000D308;
  if (!qword_10000D308)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100004DE8;
    v7[3] = &unk_100008408;
    v7[4] = &v8;
    sub_100004DE8((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v8, 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "defaultConfiguration"));
  objc_msgSend(v5, "setSupportsDarkMode:", 1);
  v6 = -[CPSAlertViewController presentProxCardFlowWithDelegate:initialViewController:configuration:](self, "presentProxCardFlowWithDelegate:initialViewController:configuration:", self, self->_launchContentViewController, v5);

}

- (void)_configureRemoteAlertWithURL:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004970;
  v4[3] = &unk_100008360;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)_dismiss
{
  -[CPSLaunchContentViewController dismiss:](self->_launchContentViewController, "dismiss:", 0);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  BSAction *v9;
  BSAction *action;
  void *v11;
  void *v12;
  void (**v13)(void);

  v13 = (void (**)(void))a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPSAlertViewController _remoteViewControllerProxyWithErrorHandler:](self, "_remoteViewControllerProxyWithErrorHandler:", &stru_1000083A8));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actions"));

  v9 = (BSAction *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "anyObject"));
  action = self->_action;
  self->_action = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSAction info](self->_action, "info"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForSetting:", 0));
  -[CPSAlertViewController _configureRemoteAlertWithURL:](self, "_configureRemoteAlertWithURL:", v12);
  objc_msgSend(v7, "setReachabilityDisabled:", 1);
  objc_msgSend(v7, "setAllowsAlertStacking:", 1);
  if (+[CPSUtilities deviceHasHomeButton](CPSUtilities, "deviceHasHomeButton"))
    objc_msgSend(v7, "setDesiredHardwareButtonEvents:", 16);
  if (v13)
    v13[2]();

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  void *v5;
  void (**v6)(void);

  v6 = (void (**)(void))a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPSAlertViewController _remoteViewControllerProxyWithErrorHandler:](self, "_remoteViewControllerProxyWithErrorHandler:", &stru_1000083C8));
  objc_msgSend(v5, "setStatusBarHidden:withDuration:", 1, 0.4);
  if (v6)
    v6[2]();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  CPSAlertViewController *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v2 = self;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v3 = off_10000D310;
  v10 = off_10000D310;
  if (!off_10000D310)
  {
    v4 = (void *)sub_100004570();
    v3 = dlsym(v4, "PRXSupportedInterfaceOrientations");
    v8[3] = (uint64_t)v3;
    off_10000D310 = v3;
  }
  _Block_object_dispose(&v7, 8);
  if (!v3)
    sub_100005064();
  v5 = ((uint64_t (*)(CPSAlertViewController *, uint64_t))v3)(v2, 1);

  return v5;
}

- (void)launchContentViewControllerDidDisappear:(id)a3 didOpenClip:(BOOL)a4
{
  _BOOL8 v4;
  BSAction *action;
  void *v7;
  BSAction *v8;
  id v9;

  v4 = a4;
  if (-[BSAction canSendResponse](self->_action, "canSendResponse", a3))
  {
    action = self->_action;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CPSOpenClipCardPresenter responseForOpenClipAction:](CPSOpenClipCardPresenter, "responseForOpenClipAction:", v4));
    -[BSAction sendResponse:](action, "sendResponse:", v7);

  }
  v8 = self->_action;
  self->_action = 0;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[CPSAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v9, "dismiss");

}

- (void)proxCardFlowDidDismiss
{
  if ((-[CPSLaunchContentViewController dismissalInProgress](self->_launchContentViewController, "dismissalInProgress") & 1) == 0)
  {
    -[CPSAlertViewController launchContentViewControllerDidDisappear:didOpenClip:](self, "launchContentViewControllerDidDisappear:didOpenClip:", self->_launchContentViewController, 0);
    -[CPSLaunchContentViewController logDismissalFromCloseButton:](self->_launchContentViewController, "logDismissalFromCloseButton:", 0);
  }
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_launchContentViewController, 0);
}

@end
