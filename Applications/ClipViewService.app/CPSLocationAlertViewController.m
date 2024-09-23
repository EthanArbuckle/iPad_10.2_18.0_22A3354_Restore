@implementation CPSLocationAlertViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  BSAction *v9;
  BSAction *action;
  void *v11;
  void (**v12)(void);

  v12 = (void (**)(void))a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPSLocationAlertViewController _remoteViewControllerProxyWithErrorHandler:](self, "_remoteViewControllerProxyWithErrorHandler:", &stru_1000082E8));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actions"));

  v9 = (BSAction *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "anyObject"));
  action = self->_action;
  self->_action = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSAction info](self->_action, "info"));
  -[CPSLocationAlertViewController _configureRemoteAlertWithSettings:](self, "_configureRemoteAlertWithSettings:", v11);
  if (+[CPSUtilities deviceHasHomeButton](CPSUtilities, "deviceHasHomeButton"))
    objc_msgSend(v7, "setDesiredHardwareButtonEvents:", 16);
  if (v12)
    v12[2]();

}

- (void)_configureRemoteAlertWithSettings:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  CPSLocationAlertViewController *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100003FE8;
  v5[3] = &unk_100008360;
  v6 = a3;
  v7 = self;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)_dismissLocationContentViewControllerAnimated:(BOOL)a3 response:(unint64_t)a4
{
  _BOOL4 v4;
  _QWORD *v6;
  void *v7;
  CPSLocationConsentViewController *lcViewController;
  uint64_t v9;
  void *v10;
  _QWORD v11[6];

  if (self->_lcViewController)
  {
    v4 = a3;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100004350;
    v11[3] = &unk_100008388;
    v11[4] = self;
    v11[5] = a4;
    v6 = objc_retainBlock(v11);
    v7 = v6;
    if (v4)
    {
      lcViewController = self->_lcViewController;
      v9 = 1;
      v10 = v7;
    }
    else
    {
      ((void (*)(_QWORD *))v6[2])(v6);
      lcViewController = self->_lcViewController;
      v9 = 0;
      v10 = 0;
    }
    -[CPSLocationConsentViewController dismissViewControllerAnimated:completion:](lcViewController, "dismissViewControllerAnimated:completion:", v9, v10);

  }
}

- (void)didInvalidateForRemoteAlert
{
  -[CPSLocationAlertViewController _dismissLocationContentViewControllerAnimated:response:](self, "_dismissLocationContentViewControllerAnimated:response:", 0, 0);
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3)
    return 30;
  else
    return 2;
}

- (void)handleButtonActions:(id)a3
{
  -[CPSLocationAlertViewController _dismissLocationContentViewControllerAnimated:response:](self, "_dismissLocationContentViewControllerAnimated:response:", 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lcViewController, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end
