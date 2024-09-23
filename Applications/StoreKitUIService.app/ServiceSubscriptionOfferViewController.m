@implementation ServiceSubscriptionOfferViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  objc_class *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 buf;
  Class (*v22)(uint64_t);
  void *v23;
  uint64_t *v24;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Did receive request to display offer code sheet.", (uint8_t *)&buf, 0xCu);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceSubscriptionOfferViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v8, "setAllowsMenuButtonDismissal:", 1);
  objc_msgSend(v8, "setAllowsAlertStacking:", 1);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v9 = (void *)qword_100063350;
  v20 = qword_100063350;
  if (!qword_100063350)
  {
    *(_QWORD *)&buf = _NSConcreteStackBlock;
    *((_QWORD *)&buf + 1) = 3221225472;
    v22 = sub_100022384;
    v23 = &unk_100049840;
    v24 = &v17;
    sub_100022384((uint64_t)&buf);
    v9 = (void *)v18[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v17, 8);
  v11 = [v10 alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo", v17));
  v13 = objc_msgSend(v11, "initWithParameters:", v12);

  -[ServiceSubscriptionOfferViewController addChildViewController:](self, "addChildViewController:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceSubscriptionOfferViewController view](self, "view"));
  objc_msgSend(v15, "bounds");
  objc_msgSend(v14, "setFrame:");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceSubscriptionOfferViewController view](self, "view"));
  objc_msgSend(v16, "addSubview:", v14);

  objc_msgSend(v13, "didMoveToParentViewController:", self);
  objc_msgSend(v13, "setDelegate:", self);
  if (v7)
    v7[2](v7);

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)didDismissOfferSheet
{
  void *v2;
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100022300;
  v3[3] = &unk_100048F38;
  v3[4] = self;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceSubscriptionOfferViewController _remoteViewControllerProxyWithErrorHandler:](self, "_remoteViewControllerProxyWithErrorHandler:", v3));
  objc_msgSend(v2, "deactivate");

}

@end
