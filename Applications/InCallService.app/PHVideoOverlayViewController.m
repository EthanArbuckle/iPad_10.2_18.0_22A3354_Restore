@implementation PHVideoOverlayViewController

- (void)viewDidLoad
{
  id v3;
  void *v4;
  PHVideoOverlayInsulatorView *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)PHVideoOverlayViewController;
  -[PHVideoOverlayViewController viewDidLoad](&v26, "viewDidLoad");
  v3 = objc_alloc_init((Class)NSMutableArray);
  -[PHVideoOverlayViewController setModesPriorityQueue:](self, "setModesPriorityQueue:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayViewController view](self, "view"));
  objc_msgSend(v4, "setAlpha:", 0.0);

  v5 = objc_alloc_init(PHVideoOverlayInsulatorView);
  -[PHVideoOverlayViewController setInsulatorView:](self, "setInsulatorView:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayViewController view](self, "view"));
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayViewController insulatorView](self, "insulatorView"));
  objc_msgSend(v15, "setBounds:", v8, v10, v12, v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayViewController view](self, "view"));
  objc_msgSend(v16, "center");
  v18 = v17;
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayViewController insulatorView](self, "insulatorView"));
  objc_msgSend(v21, "setCenter:", v18, v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayViewController insulatorView](self, "insulatorView"));
  objc_msgSend(v22, "setAutoresizingMask:", 18);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayViewController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayViewController insulatorView](self, "insulatorView"));
  objc_msgSend(v23, "addSubview:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v25, "addObserver:selector:name:object:", self, "handlePIPControllerStateDidChangeNotification:", CFSTR("PHPIPControllerStateDidChangeNotification"), 0);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setVideoOverlayEnabled:(BOOL)a3 forMode:(int64_t)a4
{
  _BOOL8 v5;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;

  v5 = a3;
  v7 = sub_1000C5588();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = NSStringFromBOOL(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
    *(_DWORD *)buf = 138412546;
    v26 = v10;
    v27 = 2112;
    v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "enabled %@ for mode: %@", buf, 0x16u);

  }
  if (v5)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayViewController modesPriorityQueue](self, "modesPriorityQueue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
    v14 = objc_msgSend(v12, "containsObject:", v13);

    if ((v14 & 1) == 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayViewController modesPriorityQueue](self, "modesPriorityQueue"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
      objc_msgSend(v15, "addObject:", v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayViewController modesPriorityQueue](self, "modesPriorityQueue"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("self"), 1));
      v24 = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
      objc_msgSend(v17, "sortUsingDescriptors:", v19);

    }
  }
  else if (-[PHVideoOverlayViewController currentVideoOverlayMode](self, "currentVideoOverlayMode") == a4
         && (v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayViewController modesPriorityQueue](self, "modesPriorityQueue")),
             v21 = objc_msgSend(v20, "count"),
             v20,
             v21 == (id)1))
  {
    -[PHVideoOverlayViewController disableVideoOverlayModes](self, "disableVideoOverlayModes");
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayViewController modesPriorityQueue](self, "modesPriorityQueue"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
    objc_msgSend(v22, "removeObject:", v23);

  }
  -[PHVideoOverlayViewController showNextVideoOverlayMode](self, "showNextVideoOverlayMode");
}

- (BOOL)isShowingMode:(int64_t)a3
{
  return -[PHVideoOverlayViewController currentVideoOverlayMode](self, "currentVideoOverlayMode") == a3;
}

- (BOOL)isModeEnabled:(int64_t)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayViewController modesPriorityQueue](self, "modesPriorityQueue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (BOOL)isShowingOverlay
{
  return -[PHVideoOverlayViewController currentVideoOverlayMode](self, "currentVideoOverlayMode") != 0;
}

- (BOOL)isShowingOverlayForRemoteState
{
  void *v3;
  BOOL v4;

  if (!-[PHVideoOverlayViewController currentVideoOverlayMode](self, "currentVideoOverlayMode"))
    return 0;
  if ((id)-[PHVideoOverlayViewController currentVideoOverlayMode](self, "currentVideoOverlayMode") != (id)6)
    return 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayViewController modesPriorityQueue](self, "modesPriorityQueue"));
  v4 = objc_msgSend(v3, "count") != (id)1;

  return v4;
}

- (void)showNextVideoOverlayMode
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayViewController modesPriorityQueue](self, "modesPriorityQueue"));
    v11 = 138412290;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "queue: %@", (uint8_t *)&v11, 0xCu);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayViewController modesPriorityQueue](self, "modesPriorityQueue"));
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayViewController modesPriorityQueue](self, "modesPriorityQueue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
    v10 = objc_msgSend(v9, "integerValue");

    if ((id)-[PHVideoOverlayViewController currentVideoOverlayMode](self, "currentVideoOverlayMode") != v10)
      -[PHVideoOverlayViewController setVideoOverlayWithMode:animated:](self, "setVideoOverlayWithMode:animated:", v10, -[PHVideoOverlayViewController currentVideoOverlayMode](self, "currentVideoOverlayMode") == 0);
  }
  else
  {
    -[PHVideoOverlayViewController hideVideoOverlayAnimated:](self, "hideVideoOverlayAnimated:", 1);
  }
}

- (void)setVideoOverlayWithMode:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  void *v10;
  PHVideoOverlayContentViewIcon *v11;
  PHVideoOverlayContentViewIcon *v12;
  PHVideoOverlayContentViewTitle *v13;
  NSObject *v14;
  const __CFString *v15;
  PHVideoOverlayContentViewActivity *v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  PHVideoOverlayContentViewTitle *v20;
  void *v21;
  PHVideoOverlayContentViewMessage *v22;
  void *v23;
  void *v24;
  void *v25;
  PHVideoOverlayContentViewMessage *v26;
  PHVideoOverlayContentViewActivity *v27;
  int v28;
  void *v29;

  v4 = a4;
  -[PHVideoOverlayViewController setCurrentVideoOverlayMode:](self, "setCurrentVideoOverlayMode:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
  if (objc_msgSend(v6, "isPipped"))
    v7 = -[PHVideoOverlayViewController shouldShowIconViewsWhenPipped](self, "shouldShowIconViewsWhenPipped");
  else
    v7 = 0;

  v8 = sub_1000C5588();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[PHVideoOverlayViewController currentVideoOverlayMode](self, "currentVideoOverlayMode")));
    v28 = 138412290;
    v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "mode: %@", (uint8_t *)&v28, 0xCu);

  }
  switch(-[PHVideoOverlayViewController currentVideoOverlayMode](self, "currentVideoOverlayMode"))
  {
    case 0:
      -[PHVideoOverlayViewController setContentView:](self, "setContentView:", 0);
      goto LABEL_20;
    case 1:
      v11 = objc_alloc_init(PHVideoOverlayContentView);
      goto LABEL_12;
    case 2:
      if (v7)
      {
        v11 = -[PHVideoOverlayContentViewIcon initWithSymbolType:]([PHVideoOverlayContentViewIcon alloc], "initWithSymbolType:", 42);
LABEL_12:
        v12 = v11;
        -[PHVideoOverlayViewController setContentView:](self, "setContentView:", v11);
      }
      else
      {
        v22 = [PHVideoOverlayContentViewMessage alloc];
        v12 = (PHVideoOverlayContentViewIcon *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentViewIcon localizedStringForKey:value:table:](v12, "localizedStringForKey:value:table:", CFSTR("VIDEO_DEGRADED_TITLE"), &stru_10028DC20, CFSTR("InCallService")));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("VIDEO_DEGRADED_MESSAGE"), &stru_10028DC20, CFSTR("InCallService")));
        v26 = -[PHVideoOverlayContentViewMessage initWithTitle:message:](v22, "initWithTitle:message:", v23, v25);
        -[PHVideoOverlayViewController setContentView:](self, "setContentView:", v26);

      }
LABEL_20:
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayViewController contentView](self, "contentView"));
      -[PHVideoOverlayViewController showVideoOverlayWithContentView:animated:](self, "showVideoOverlayWithContentView:animated:", v21, v4);

      return;
    case 3:
      v13 = [PHVideoOverlayContentViewTitle alloc];
      v14 = objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v14;
      v15 = CFSTR("PAUSE_OVERLAY");
      goto LABEL_18;
    case 4:
      v16 = [PHVideoOverlayContentViewActivity alloc];
      if ((v7 & 1) != 0)
      {
        v17 = &stru_10028DC20;
        v18 = 101;
      }
      else
      {
        v9 = objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSObject localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("VIDEO_RECONNECTING_TITLE"), &stru_10028DC20, CFSTR("InCallService")));
        v18 = 100;
      }
      v27 = -[PHVideoOverlayContentViewActivity initWithTitle:indicatorStyle:](v16, "initWithTitle:indicatorStyle:", v17, v18);
      -[PHVideoOverlayViewController setContentView:](self, "setContentView:", v27);

      if ((v7 & 1) != 0)
        goto LABEL_20;

      goto LABEL_19;
    case 5:
      v13 = [PHVideoOverlayContentViewTitle alloc];
      v14 = objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v14;
      v15 = CFSTR("CAMERA_UNAVAILABLE_OVERLAY");
LABEL_18:
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject localizedStringForKey:value:table:](v14, "localizedStringForKey:value:table:", v15, &stru_10028DC20, CFSTR("InCallService")));
      v20 = -[PHVideoOverlayContentViewTitle initWithTitle:](v13, "initWithTitle:", v19);
      -[PHVideoOverlayViewController setContentView:](self, "setContentView:", v20);

LABEL_19:
      goto LABEL_20;
    case 6:
    case 7:
      v11 = -[PHVideoOverlayContentViewTitle initWithTitle:]([PHVideoOverlayContentViewTitle alloc], "initWithTitle:", 0);
      goto LABEL_12;
    default:
      goto LABEL_20;
  }
}

- (void)showVideoOverlayWithContentView:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  NSObject *v14;
  void *v15;
  double v16;
  _QWORD v17[5];
  uint8_t buf[4];
  id v19;

  v4 = a4;
  v6 = a3;
  v7 = sub_1000C5588();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "view: %@", buf, 0xCu);
  }

  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayViewController insulatorView](self, "insulatorView"));
    objc_msgSend(v9, "setVideoOverlayContentView:animated:", v6, v4);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayViewController view](self, "view"));
    objc_msgSend(v10, "alpha");
    v12 = v11;

    if (v12 != 1.0)
    {
      v13 = sub_1000C5588();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "animate in the overlay", buf, 2u);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayViewController delegate](self, "delegate"));
      objc_msgSend(v15, "videoOverlayViewController:isShowingOverlay:", self, 1);

      v16 = 0.150000006;
      if (!v4)
        v16 = 0.0;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10000E2D0;
      v17[3] = &unk_100284898;
      v17[4] = self;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v17, 0, v16, 0.0);
    }
  }

}

- (void)hideVideoOverlayAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  id v8;
  NSObject *v9;
  double v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint8_t buf[16];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayViewController view](self, "view"));
  objc_msgSend(v5, "alpha");
  v7 = v6;

  if (v7 != 0.0)
  {
    v8 = sub_1000C5588();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "animate out the overlay", buf, 2u);
    }

    v10 = 0.150000006;
    if (!v3)
      v10 = 0.0;
    v11[4] = self;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000E41C;
    v12[3] = &unk_100284898;
    v12[4] = self;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000E450;
    v11[3] = &unk_1002848C0;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v12, v11, v10, 0.0);
  }
}

- (void)disableVideoOverlayModes
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "removing all the overlays from queue", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayViewController modesPriorityQueue](self, "modesPriorityQueue"));
  objc_msgSend(v5, "removeAllObjects");

  -[PHVideoOverlayViewController setCurrentVideoOverlayMode:](self, "setCurrentVideoOverlayMode:", 0);
  -[PHVideoOverlayViewController showNextVideoOverlayMode](self, "showNextVideoOverlayMode");
}

- (void)handlePIPControllerStateDidChangeNotification:(id)a3
{
  void *v4;
  unsigned int v5;
  int64_t v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController", a3));
  v5 = objc_msgSend(v4, "isPipped");

  if (v5 != -[PHVideoOverlayViewController isShowingPippedIconViews](self, "isShowingPippedIconViews"))
  {
    if (-[PHVideoOverlayViewController shouldShowIconViewsWhenPipped](self, "shouldShowIconViewsWhenPipped"))
    {
      v6 = -[PHVideoOverlayViewController currentVideoOverlayMode](self, "currentVideoOverlayMode");
      if (v6 == 4 || v6 == 2)
        -[PHVideoOverlayViewController setVideoOverlayWithMode:animated:](self, "setVideoOverlayWithMode:animated:", -[PHVideoOverlayViewController currentVideoOverlayMode](self, "currentVideoOverlayMode"), 1);
    }
  }
}

- (BOOL)shouldShowIconViewsWhenPipped
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 0;

  return v3;
}

- (BOOL)isShowingPippedIconViews
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char isKindOfClass;
  void *v12;

  v3 = -[PHVideoOverlayViewController currentVideoOverlayMode](self, "currentVideoOverlayMode");
  if (v3 == 4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayViewController contentView](self, "contentView"));
    v10 = objc_opt_class(PHVideoOverlayContentViewActivity, v9);
    isKindOfClass = objc_opt_isKindOfClass(v8, v10);

    if ((isKindOfClass & 1) != 0)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayViewController contentView](self, "contentView"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
      v7 = objc_msgSend(v12, "length") == 0;

      goto LABEL_6;
    }
LABEL_7:
    v7 = 0;
    return v7 & 1;
  }
  if (v3 != 2)
    goto LABEL_7;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayViewController contentView](self, "contentView"));
  v6 = objc_opt_class(PHVideoOverlayContentViewIcon, v5);
  v7 = objc_opt_isKindOfClass(v4, v6);
LABEL_6:

  return v7 & 1;
}

- (PHVideoOverlayViewControllerDelegate)delegate
{
  return (PHVideoOverlayViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PHVideoOverlayInsulatorView)insulatorView
{
  return (PHVideoOverlayInsulatorView *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInsulatorView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (PHVideoOverlayContentView)contentView
{
  return (PHVideoOverlayContentView *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContentView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (int64_t)currentVideoOverlayMode
{
  return self->_currentVideoOverlayMode;
}

- (void)setCurrentVideoOverlayMode:(int64_t)a3
{
  self->_currentVideoOverlayMode = a3;
}

- (NSMutableArray)modesPriorityQueue
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setModesPriorityQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modesPriorityQueue, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_insulatorView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
