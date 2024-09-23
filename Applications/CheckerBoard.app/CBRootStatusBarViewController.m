@implementation CBRootStatusBarViewController

- (void)viewDidLoad
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;
  _QWORD v30[4];

  v29.receiver = self;
  v29.super_class = (Class)CBRootStatusBarViewController;
  -[CBRootStatusBarViewController viewDidLoad](&v29, "viewDidLoad");
  v3 = objc_alloc((Class)STUIStatusBar_Wrapper);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v4, "_referenceBounds");
  v5 = objc_msgSend(v3, "initWithFrame:showForegroundView:", 1);
  -[CBRootStatusBarViewController setStatusBarView:](self, "setStatusBarView:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBRootStatusBarViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBRootStatusBarViewController statusBarView](self, "statusBarView"));
  objc_msgSend(v6, "addSubview:", v7);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CBRootStatusBarViewController statusBarView](self, "statusBarView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CBRootStatusBarViewController view](self, "view"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
  v30[0] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CBRootStatusBarViewController statusBarView](self, "statusBarView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CBRootStatusBarViewController view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v30[1] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CBRootStatusBarViewController statusBarView](self, "statusBarView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBRootStatusBarViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v30[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBRootStatusBarViewController statusBarView](self, "statusBarView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBRootStatusBarViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
  v30[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

}

- (void)showStatusBar
{
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CBRootStatusBarViewController: showStatusBar", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002BBE8;
  block[3] = &unk_1000753E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)hideStatusBar
{
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CBRootStatusBarViewController: hideStatusBar", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002BCC8;
  block[3] = &unk_1000753E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)statusBarStyle:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[6];
  uint8_t buf[4];
  int64_t v9;

  v5 = CheckerBoardLogHandleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CBRootStatusBarViewController: statusBarStyle: %li", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002BDEC;
  v7[3] = &unk_100076110;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

- (int64_t)_statusBarStyle:(int64_t)a3
{
  int64_t v3;
  uint64_t v4;
  NSObject *v5;
  int v7;
  int64_t v8;

  if (a3 == 1)
    v3 = 1;
  else
    v3 = 2 * (a3 == 3);
  v4 = CheckerBoardLogHandleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CBRootStatusBarViewController: internalStatusBarStyle: %li", (uint8_t *)&v7, 0xCu);
  }

  return v3;
}

- (STUIStatusBar_Wrapper)statusBarView
{
  return self->_statusBarView;
}

- (void)setStatusBarView:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBarView, 0);
}

@end
