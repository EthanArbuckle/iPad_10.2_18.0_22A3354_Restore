@implementation PDURemoteViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  BSAction *v9;
  BSAction *action;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unsigned __int8 v18;
  void (**v19)(void);

  v19 = (void (**)(void))a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDURemoteViewController _remoteViewControllerProxyWithErrorHandler:](self, "_remoteViewControllerProxyWithErrorHandler:", &stru_100004178));
  objc_msgSend(v7, "setReachabilityDisabled:", 1);
  objc_msgSend(v7, "setAllowsAlertStacking:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actions"));

  v9 = (BSAction *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "anyObject"));
  action = self->_action;
  self->_action = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSAction info](self->_action, "info"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForSetting:", 0));
  v13 = PDCGlobalApplicationEnvironment();
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "applicationIdentityForIdentityString:", v12));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForSetting:", 1));
  v17 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
    v18 = objc_msgSend(v16, "BOOLValue");
  else
    v18 = 0;
  self->_forcePresent = v18;
  -[PDURemoteViewController _configureRemoteAlertWithIdentity:](self, "_configureRemoteAlertWithIdentity:", v15);
  if (v19)
    v19[2]();

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  void *v5;
  void (**v6)(void);

  v6 = (void (**)(void))a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURemoteViewController _remoteViewControllerProxyWithErrorHandler:](self, "_remoteViewControllerProxyWithErrorHandler:", &stru_100004198));
  objc_msgSend(v5, "setStatusBarHidden:withDuration:", 1, 0.4);
  if (v6)
    v6[2]();

}

- (void)_configureRemoteAlertWithIdentity:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100001A6C;
  v4[3] = &unk_1000041C0;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return (unint64_t)+[PDURootViewController preferredOrientation](PDURootViewController, "preferredOrientation");
}

- (void)didInvalidateForRemoteAlert
{
  -[PDURemoteViewController _dismissWithResponse:](self, "_dismissWithResponse:", 3);
}

- (void)handleButtonActions:(id)a3
{
  -[PDURemoteViewController _dismissWithResponse:](self, "_dismissWithResponse:", 3);
}

- (void)_dismissWithResponse:(unint64_t)a3
{
  id v5;
  void *v6;
  BSAction *action;
  void *v8;
  BSAction *v9;
  id v10;

  if (-[BSAction canSendResponse](self->_action, "canSendResponse"))
  {
    v5 = objc_alloc_init((Class)BSMutableSettings);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    objc_msgSend(v5, "setObject:forSetting:", v6, 0);

    action = self->_action;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BSActionResponse responseWithInfo:](BSActionResponse, "responseWithInfo:", v5));
    -[BSAction sendResponse:](action, "sendResponse:", v8);

  }
  v9 = self->_action;
  self->_action = 0;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[PDURemoteViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v10, "dismiss");

}

- (void)rootViewController:(id)a3 didDismissWithUserResponse:(unint64_t)a4
{
  -[PDURemoteViewController _dismissWithResponse:](self, "_dismissWithResponse:", a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end
