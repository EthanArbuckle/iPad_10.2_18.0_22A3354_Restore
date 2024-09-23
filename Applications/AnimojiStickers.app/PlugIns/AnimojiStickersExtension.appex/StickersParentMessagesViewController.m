@implementation StickersParentMessagesViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)StickersParentMessagesViewController;
  -[BaseMessagesViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[StickersParentMessagesViewController defaultMessagesChildViewControllerForPresentationContext:](self, "defaultMessagesChildViewControllerForPresentationContext:", -[StickersParentMessagesViewController presentationContext](self, "presentationContext")));
  -[StickersParentMessagesViewController addChildViewController:](self, "addChildViewController:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StickersParentMessagesViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "setFrame:");

  objc_msgSend(v4, "setAutoresizingMask:", 18);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[StickersParentMessagesViewController view](self, "view"));
  objc_msgSend(v6, "addSubview:", v4);

  objc_msgSend(v3, "didMoveToParentViewController:", self);
  -[BaseMessagesViewController setBaseMessagesViewController:](self, "setBaseMessagesViewController:", v3);

}

- (void)requestExpandedPresentation
{
  _QWORD *v3;
  void *v4;
  dispatch_time_t v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  id (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  id location;

  -[StickersParentMessagesViewController setWaitingOnPresentationStyleChange:](self, "setWaitingOnPresentationStyleChange:", 1);
  -[StickersParentMessagesViewController requestPresentationStyle:](self, "requestPresentationStyle:", 1);
  objc_initWeak(&location, self);
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_100005AD0;
  v12 = sub_100005AF8;
  v6[0] = _NSConcreteStackBlock;
  v13 = 0;
  v6[2] = sub_100005B00;
  v6[3] = &unk_10000C428;
  v6[1] = 3221225472;
  objc_copyWeak(&v7, &location);
  v6[4] = &v8;
  v3 = objc_retainBlock(v6);
  v4 = (void *)v9[5];
  v9[5] = (uint64_t)v3;

  v5 = dispatch_time(0, 500000000);
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, (dispatch_block_t)v9[5]);
  objc_destroyWeak(&v7);
  _Block_object_dispose(&v8, 8);

  objc_destroyWeak(&location);
}

- (void)willTransitionToPresentationStyle:(unint64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)StickersParentMessagesViewController;
  -[BaseMessagesViewController willTransitionToPresentationStyle:](&v6, "willTransitionToPresentationStyle:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StickersParentMessagesViewController childStickersMessagesViewController](self, "childStickersMessagesViewController"));
  objc_msgSend(v5, "willTransitionToPresentationStyle:", a3);

}

- (void)didTransitionToPresentationStyle:(unint64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)StickersParentMessagesViewController;
  -[BaseMessagesViewController didTransitionToPresentationStyle:](&v6, "didTransitionToPresentationStyle:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StickersParentMessagesViewController childStickersMessagesViewController](self, "childStickersMessagesViewController"));
  objc_msgSend(v5, "didTransitionToPresentationStyle:", a3);

  -[StickersParentMessagesViewController setWaitingOnPresentationStyleChange:](self, "setWaitingOnPresentationStyleChange:", 0);
}

- (id)defaultMessagesChildViewControllerForPresentationContext:(unint64_t)a3
{
  StickersMessagesViewController *v4;
  uint8_t v6[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[StickersView] Parent view default child requested", v6, 2u);
  }
  v4 = objc_alloc_init(StickersMessagesViewController);
  -[StickersParentMessagesViewController setChildStickersMessagesViewController:](self, "setChildStickersMessagesViewController:", v4);
  -[StickersMessagesViewController setDelegate:](v4, "setDelegate:", self);
  return v4;
}

- (BOOL)automaticallyDisplaysLandscapeRotationOverlay
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v3, "userInterfaceIdiom") == (id)1)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    if (objc_msgSend(v5, "userInterfaceIdiom") == (id)5)
    {
      v4 = 0;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[StickersParentMessagesViewController childStickersMessagesViewController](self, "childStickersMessagesViewController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorViewController"));
      if (v7)
      {
        v4 = 1;
      }
      else
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[AVTUIControllerPresentation pendingGlobalPresentation](AVTUIControllerPresentation, "pendingGlobalPresentation"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "modalMessagesController"));
        v4 = v9 != 0;

      }
    }

  }
  return v4;
}

- (id)landscapeOverlayMessage
{
  NSBundle *v2;
  void *v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("sStickersLandscapeTrapMessage"), &stru_10000C578, CFSTR("Localized")));

  return v4;
}

- (BOOL)waitingOnPresentationStyleChange
{
  return self->_waitingOnPresentationStyleChange;
}

- (void)setWaitingOnPresentationStyleChange:(BOOL)a3
{
  self->_waitingOnPresentationStyleChange = a3;
}

- (StickersMessagesViewController)childStickersMessagesViewController
{
  return (StickersMessagesViewController *)objc_loadWeakRetained((id *)&self->_childStickersMessagesViewController);
}

- (void)setChildStickersMessagesViewController:(id)a3
{
  objc_storeWeak((id *)&self->_childStickersMessagesViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_childStickersMessagesViewController);
}

@end
