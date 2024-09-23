@implementation FBAOnDemandPinParingNavigationController

- (FBAOnDemandPinParingNavigationController)initWithDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  FBAOnDemandPinParingNavigationController *v13;
  FBAOnDemandPinParingNavigationController *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIStoryboard fbaMainStoryboard](UIStoryboard, "fbaMainStoryboard"));
  v9 = (objc_class *)objc_opt_class(FBAPinPairingViewController);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "instantiateViewControllerWithIdentifier:", v11));

  objc_msgSend(v12, "setDevice:", v6);
  objc_msgSend(v12, "setContext:", 1);
  v16.receiver = self;
  v16.super_class = (Class)FBAOnDemandPinParingNavigationController;
  v13 = -[FBAOnDemandPinParingNavigationController initWithRootViewController:](&v16, "initWithRootViewController:", v12);
  v14 = v13;
  if (v13)
  {
    -[FBAOnDemandPinParingNavigationController setCompletion:](v13, "setCompletion:", v7);
    -[FBAOnDemandPinParingNavigationController setPairingDevice:](v14, "setPairingDevice:", v6);
  }

  return v14;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FBAOnDemandPinParingNavigationController;
  -[FBAOnDemandPinParingNavigationController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "didPinPair:", FBKDeviceManagerDidPinPairWithDeviceNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "didCancelPairing:", CFSTR("FBAPinPairingViewControllerDidCancel"), 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)FBAOnDemandPinParingNavigationController;
  -[FBAOnDemandPinParingNavigationController dealloc](&v4, "dealloc");
}

- (void)didCancelPairing:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;

  v4 = objc_claimAutoreleasedReturnValue(+[FBALog ded](FBALog, "ded", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOnDemandPinParingNavigationController pairingDevice](self, "pairingDevice"));
    v6 = 138543362;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "did cancel pairing with device [%{public}@]", (uint8_t *)&v6, 0xCu);

  }
  -[FBAOnDemandPinParingNavigationController didPinPairWithDevice:](self, "didPinPairWithDevice:", 0);
}

- (void)didPinPair:(id)a3
{
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  void *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = objc_claimAutoreleasedReturnValue(+[FBALog ffu](FBALog, "ffu"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "pairing navigation controller got pairing success for device [%{public}@]", buf, 0xCu);
  }

  v6 = dispatch_time(0, 1000000000);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100015880;
  v8[3] = &unk_1000E6378;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v8);

}

- (void)didPinPairWithDevice:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  id v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  NSObject *v17;
  void (**v18)(_QWORD, _QWORD);
  void (**v19)(_QWORD, _QWORD);
  void *v20;
  __int128 v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];

  if (a3)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FBKDeviceManager sharedInstance](FBKDeviceManager, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuredDevices"));

    obj = v5;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v6)
    {
      v8 = v6;
      v23 = *(_QWORD *)v25;
      *(_QWORD *)&v7 = 138543362;
      v21 = v7;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v23)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dedSharingDevice", v21));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "address"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOnDemandPinParingNavigationController pairingDevice](self, "pairingDevice"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dedSharingDevice"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "address"));
          v16 = objc_msgSend(v12, "isEqualToString:", v15);

          if (v16)
          {
            v17 = objc_claimAutoreleasedReturnValue(+[FBALog ded](FBALog, "ded"));
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v21;
              v29 = v10;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "On demand pairing found paired sharing device [%{public}@]", buf, 0xCu);
            }

            v18 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[FBAOnDemandPinParingNavigationController completion](self, "completion"));
            ((void (**)(_QWORD, void *))v18)[2](v18, v10);

          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      }
      while (v8);
    }

  }
  else
  {
    v19 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[FBAOnDemandPinParingNavigationController completion](self, "completion"));
    v19[2](v19, 0);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOnDemandPinParingNavigationController presentingViewController](self, "presentingViewController"));
  objc_msgSend(v20, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (FBKGroupedDevice)pairingDevice
{
  return (FBKGroupedDevice *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPairingDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingDevice, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
