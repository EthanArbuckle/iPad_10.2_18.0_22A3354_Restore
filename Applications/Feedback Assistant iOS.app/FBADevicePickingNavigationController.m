@implementation FBADevicePickingNavigationController

- (FBADevicePickingNavigationController)initWithDeviceChoices:(id)a3 allowsMultipleSelection:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  FBADevicePickingNavigationController *v15;
  FBADevicePickingNavigationController *v16;
  objc_super v18;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIStoryboard fbaMainStoryboard](UIStoryboard, "fbaMainStoryboard"));
  v11 = (objc_class *)objc_opt_class(FBADeviceChoicesViewController);
  v12 = NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "instantiateViewControllerWithIdentifier:", v13));

  objc_msgSend(v14, "setDeviceChoices:", v9);
  objc_msgSend(v14, "setIsMultiSelect:", v5);
  objc_msgSend(v14, "setChoiceDelegate:", self);
  v18.receiver = self;
  v18.super_class = (Class)FBADevicePickingNavigationController;
  v15 = -[FBADevicePickingNavigationController initWithRootViewController:](&v18, "initWithRootViewController:", v14);
  v16 = v15;
  if (v15)
    -[FBADevicePickingNavigationController setCompletion:](v15, "setCompletion:", v8);

  return v16;
}

- (id)initForPlatform:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  FBADevicePickingNavigationController *v13;
  FBADevicePickingNavigationController *v14;
  objc_super v16;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIStoryboard fbaMainStoryboard](UIStoryboard, "fbaMainStoryboard"));
  v9 = (objc_class *)objc_opt_class(FBADevicePairingViewController);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "instantiateViewControllerWithIdentifier:", v11));

  objc_msgSend(v12, "setContext:", 4);
  objc_msgSend(v12, "setFilterPlatform:", v7);

  objc_msgSend(v12, "setDelegate:", self);
  v16.receiver = self;
  v16.super_class = (Class)FBADevicePickingNavigationController;
  v13 = -[FBADevicePickingNavigationController initWithRootViewController:](&v16, "initWithRootViewController:", v12);
  v14 = v13;
  if (v13)
    -[FBADevicePickingNavigationController setCompletion:](v13, "setCompletion:", v6);

  return v14;
}

- (void)pairedDevicesDidChangeWithAddedDevice:(id)a3 removed:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[FBALog ded](FBALog, "ded"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
      *(_DWORD *)buf = 138543362;
      v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "device picker paired new device [%{public}@]", buf, 0xCu);

    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10003D7C4;
    v13[3] = &unk_1000E6378;
    v13[4] = self;
    v14 = v6;
    -[FBADevicePickingNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v13);

  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(+[FBALog ded](FBALog, "ded"));
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
        *(_DWORD *)buf = 138543362;
        v16 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "removed device [%{public}@] while being asked to pair with new one, noop", buf, 0xCu);

      }
    }
    else if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "how did we get here?", buf, 2u);
    }

  }
}

- (void)pairingViewDidClose
{
  NSObject *v2;

  v2 = objc_claimAutoreleasedReturnValue(+[FBALog ded](FBALog, "ded"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    sub_10009AF0C(v2);

}

- (void)pairingViewDidCancel
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  v3 = objc_claimAutoreleasedReturnValue(+[FBALog ded](FBALog, "ded"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "device picker paired no device", buf, 2u);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003D948;
  v4[3] = &unk_1000E61B8;
  v4[4] = self;
  -[FBADevicePickingNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v4);
}

- (void)deviceChoicesController:(id)a3 didChooseDevices:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(+[FBALog ded](FBALog, "ded"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKeyPath:", CFSTR("publicLogDescription")));
    *(_DWORD *)buf = 138543362;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "device picker chose devices [%{public}@]", buf, 0xCu);

  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003DAF8;
  v9[3] = &unk_1000E6378;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  -[FBADevicePickingNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v9);

}

- (void)deviceChoicesControllerDidCancelWithController:(id)a3
{
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  v4 = objc_claimAutoreleasedReturnValue(+[FBALog ded](FBALog, "ded", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "device picker chose no device", buf, 2u);
  }

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003DC44;
  v5[3] = &unk_1000E61B8;
  v5[4] = self;
  -[FBADevicePickingNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v5);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
}

@end
