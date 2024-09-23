@implementation PHPhoneRemoteHostViewController

+ (void)requestViewControllerWithCompletionHandler:(id)a3
{
  id v3;
  objc_class *v4;
  objc_class *v5;
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  objc_class *v11;
  uint8_t buf[16];

  v3 = a3;
  v4 = +[PHPhoneRemoteHostViewController remoteViewControllerClass](PHPhoneRemoteHostViewController, "remoteViewControllerClass");
  if (v4)
  {
    v5 = v4;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100075DAC;
    v9[3] = &unk_100286498;
    v10 = v3;
    v11 = v5;
    v6 = -[objc_class requestViewControllerWithConnectionHandler:](v5, "requestViewControllerWithConnectionHandler:", v9);

  }
  else
  {
    v7 = sub_1000C5588();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[WARN] No PHPhoneRemoteViewController subclasses are supported, so unable to show remote view controller", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, 0);
  }

}

+ (Class)remoteViewControllerClass
{
  __objc2_class **v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = off_1002833A0;
  if (+[PHMobilePhoneRemoteViewController isSupported](PHMobilePhoneRemoteViewController, "isSupported")
    || (v2 = off_100283398,
        +[PHPhoneRemoteViewController isSupported](PHFaceTimeRemoteViewController, "isSupported")))
  {
    v4 = objc_opt_class(*v2, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }
  else
  {
    v5 = 0;
  }
  return (Class)v5;
}

- (void)setUpRemoteViewController:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  -[PHPhoneRemoteHostViewController addChildViewController:](self, "addChildViewController:", v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhoneRemoteHostViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "view"));
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhoneRemoteHostViewController view](self, "view"));
  v15 = objc_msgSend(v14, "autoresizingMask");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "view"));
  objc_msgSend(v16, "setAutoresizingMask:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhoneRemoteHostViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "view"));
  objc_msgSend(v17, "addSubview:", v18);

  objc_msgSend(v19, "didMoveToParentViewController:", self);
  -[PHPhoneRemoteHostViewController setRemoteViewController:](self, "setRemoteViewController:", v19);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHPhoneRemoteHostViewController;
  -[PHPhoneRemoteHostViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhoneRemoteHostViewController delegate](self, "delegate"));
  objc_msgSend(v4, "phoneRemoteHostViewControllerDidDismiss");

}

- (PHPhoneRemoteHostViewControllerDelegate)delegate
{
  return (PHPhoneRemoteHostViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PHPhoneRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
