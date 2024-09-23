@implementation InAppPaymentSceneDelegate

- (InAppPaymentSceneDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)InAppPaymentSceneDelegate;
  return -[InAppPaymentSceneDelegate init](&v3, "init");
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t Object;
  NSObject *v21;
  void *v22;
  id val;
  id v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id from;
  _QWORD v40[4];
  id v41;
  _BYTE location[12];
  __int16 v43;
  id v44;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_class(UIWindowScene);
  if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
  {
    v24 = v8;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userActivities"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pk_anyObjectPassingTest:", &stru_10000C518));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "userInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("hostSceneIdentifier")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("hostSceneBundleIdentifier")));
    if (objc_msgSend(v15, "length"))
      v25 = v15;
    else
      v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("hostBundleIdentifier")));
    if (objc_msgSend(v14, "length") && objc_msgSend(v25, "length"))
    {
      objc_initWeak((id *)location, self);
      objc_initWeak(&from, v9);
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_1000074D0;
      v36[3] = &unk_10000C3E8;
      objc_copyWeak(&v37, (id *)location);
      objc_copyWeak(&v38, &from);
      v16 = objc_retainBlock(v36);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      val = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "delegate"));

      objc_initWeak(&v35, val);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100007674;
      v27[3] = &unk_10000C568;
      objc_copyWeak(&v32, (id *)location);
      v28 = v13;
      v18 = v16;
      v31 = v18;
      v29 = v24;
      v30 = v14;
      objc_copyWeak(&v33, &v35);
      objc_copyWeak(&v34, &from);
      v19 = objc_retainBlock(v27);
      ((void (*)(_QWORD *, _QWORD))v19[2])(v19, 0);

      objc_destroyWeak(&v34);
      objc_destroyWeak(&v33);

      objc_destroyWeak(&v32);
      objc_destroyWeak(&v35);

      objc_destroyWeak(&v38);
      objc_destroyWeak(&v37);
      objc_destroyWeak(&from);
      objc_destroyWeak((id *)location);
    }
    else
    {
      Object = PKLogFacilityTypeGetObject(0);
      v21 = objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)location = 138412546;
        *(_QWORD *)&location[4] = v14;
        v43 = 2112;
        v44 = v25;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Destroying in-app payment scene due to missing hostSceneIdentifier %@ or hostBundleIdentifier %@", location, 0x16u);
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_100007410;
      v40[3] = &unk_10000C3C0;
      v41 = v9;
      objc_msgSend(v22, "requestSceneSessionDestruction:options:errorHandler:", v41, 0, v40);

    }
  }

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  uint64_t v5;
  char isKindOfClass;

  v4 = a3;
  v5 = objc_opt_class(UIWindowScene);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
    -[InAppPaymentSceneDelegate _dismissWithReason:](self, "_dismissWithReason:", CFSTR("scene did enter background"));
}

- (void)_dismissWithReason:(id)a3
{
  id v4;
  uint64_t Object;
  NSObject *v6;
  PKPaymentAuthorizationRemoteAlertViewController *inAppPaymentViewController;
  NSString *hostSceneIdentifier;
  int v9;
  PKPaymentAuthorizationRemoteAlertViewController *v10;
  __int16 v11;
  id v12;

  v4 = a3;
  Object = PKLogFacilityTypeGetObject(0);
  v6 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    inAppPaymentViewController = self->_inAppPaymentViewController;
    v9 = 134349314;
    v10 = inAppPaymentViewController;
    v11 = 2112;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationRemoteAlertViewController (%{public}p): Dismissing with reason: %@", (uint8_t *)&v9, 0x16u);
  }

  -[PKPaymentAuthorizationRemoteAlertViewController askForDismissalWithReason:error:completion:](self->_inAppPaymentViewController, "askForDismissalWithReason:error:completion:", 1, 0, 0);
  hostSceneIdentifier = self->_hostSceneIdentifier;
  self->_hostSceneIdentifier = 0;

}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_hostSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_inAppPaymentViewController, 0);
}

@end
