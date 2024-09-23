@implementation PeerPaymentRegistrationSceneDelegate

- (PeerPaymentRegistrationSceneDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PeerPaymentRegistrationSceneDelegate;
  return -[PeerPaymentRegistrationSceneDelegate init](&v3, "init");
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD *v17;
  id v18;
  _QWORD *v19;
  id v20;
  PKPeerPaymentRegistrationViewController *registrationViewController;
  id v22;
  uint64_t Object;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id from;
  _QWORD v36[4];
  id v37;
  _BYTE location[12];
  __int16 v39;
  id v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_class(UIWindowScene);
  if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
  {
    v12 = v8;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userActivities"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pk_anyObjectPassingTest:", &stru_10000C398));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userInfo"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("hostSceneIdentifier")));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("hostSceneBundleIdentifier")));
    if (objc_msgSend(v28, "length"))
      v27 = v28;
    else
      v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("hostBundleIdentifier")));
    if (objc_msgSend(v29, "length") && objc_msgSend(v27, "length"))
    {
      v16 = objc_msgSend(objc_alloc((Class)PKPeerPaymentRegistrationViewController), "initWithUserInfo:", v15);
      objc_initWeak((id *)location, self);
      objc_initWeak(&from, v9);
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1000055FC;
      v32[3] = &unk_10000C3E8;
      objc_copyWeak(&v33, (id *)location);
      objc_copyWeak(&v34, &from);
      v17 = objc_retainBlock(v32);
      objc_msgSend(v16, "setDismissHandler:", v17);
      v26 = v14;
      v18 = objc_msgSend(objc_alloc((Class)UIWindow), "initWithWindowScene:", v12);
      objc_msgSend(v18, "setRootViewController:", v16);
      objc_msgSend(v18, "makeKeyAndVisible");
      -[PeerPaymentRegistrationSceneDelegate setWindow:](self, "setWindow:", v18);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10000578C;
      v30[3] = &unk_10000C410;
      v19 = v17;
      v31 = v19;
      objc_msgSend(v16, "startRegistrationFlowWithCompletion:", v30);
      v20 = v12;
      registrationViewController = self->_registrationViewController;
      self->_registrationViewController = (PKPeerPaymentRegistrationViewController *)v16;
      v22 = v16;

      v12 = v20;
      v14 = v26;

      objc_destroyWeak(&v34);
      objc_destroyWeak(&v33);
      objc_destroyWeak(&from);
      objc_destroyWeak((id *)location);
    }
    else
    {
      Object = PKLogFacilityTypeGetObject(0);
      v24 = objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)location = 138412546;
        *(_QWORD *)&location[4] = v29;
        v39 = 2112;
        v40 = v27;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Destroying peer payment registration scene due to missing hostSceneIdentifier %@ or hostBundleIdentifier %@", location, 0x16u);
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_10000553C;
      v36[3] = &unk_10000C3C0;
      v37 = v9;
      objc_msgSend(v25, "requestSceneSessionDestruction:options:errorHandler:", v37, 0, v36);

    }
  }

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  uint64_t v5;
  char isKindOfClass;
  uint64_t Object;
  NSObject *v8;
  PKPeerPaymentRegistrationViewController *registrationViewController;
  int v10;
  PKPeerPaymentRegistrationViewController *v11;

  v4 = a3;
  v5 = objc_opt_class(UIWindowScene);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    Object = PKLogFacilityTypeGetObject(0);
    v8 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      registrationViewController = self->_registrationViewController;
      v10 = 134349056;
      v11 = registrationViewController;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentRegistrationViewController (%{public}p): Dismissing due to sceneDidEnterBackground", (uint8_t *)&v10, 0xCu);
    }

    -[PKPeerPaymentRegistrationViewController dismissViewControllerAnimated:completion:](self->_registrationViewController, "dismissViewControllerAnimated:completion:", 1, 0);
  }
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
  objc_storeStrong((id *)&self->_registrationViewController, 0);
}

@end
