@implementation PHPIPWrapperViewController

- (PHPIPWrapperViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHPIPWrapperViewController;
  return -[PHPIPWrapperViewController initWithNibName:bundle:](&v3, "initWithNibName:bundle:", 0, 0);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHPIPWrapperViewController;
  -[PHPIPWrapperViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController view](self, "view"));
  objc_msgSend(v5, "setOpaque:", 0);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHPIPWrapperViewController;
  -[PHPIPWrapperViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[PHPIPWrapperViewController _layoutWrappedSubview](self, "_layoutWrappedSubview");
}

- (void)setWrappedViewController:(id)a3
{
  UIViewController **p_wrappedViewController;
  id WeakRetained;
  void *v6;
  id v7;
  PHPIPWrapperViewController *v8;
  void *v9;
  id obj;

  obj = a3;
  p_wrappedViewController = &self->_wrappedViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_wrappedViewController);

  v6 = obj;
  if (WeakRetained != obj)
  {
    v7 = objc_loadWeakRetained((id *)&self->_wrappedViewController);
    v8 = (PHPIPWrapperViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parentViewController"));

    if (v8 == self)
    {
      objc_msgSend(v7, "willMoveToParentViewController:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
      objc_msgSend(v9, "removeFromSuperview");

      objc_msgSend(v7, "removeFromParentViewController");
    }
    objc_storeWeak((id *)p_wrappedViewController, obj);

    v6 = obj;
  }

}

- (void)willAnimatePictureInPictureStart
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  int v22;
  PHPIPWrapperViewController *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController wrappedViewController](self, "wrappedViewController"));

  v4 = sub_1000C5668();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v22 = 138543362;
      v23 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Moving content into the wrapping PIP controller", (uint8_t *)&v22, 0xCu);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController wrappedViewController](self, "wrappedViewController"));
    -[PHPIPWrapperViewController addChildViewController:](self, "addChildViewController:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController view](self, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController wrappedViewController](self, "wrappedViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
    objc_msgSend(v7, "addSubview:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController wrappedViewController](self, "wrappedViewController"));
    objc_msgSend(v10, "didMoveToParentViewController:", self);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController view](self, "view"));
    objc_msgSend(v11, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController wrappedViewController](self, "wrappedViewController"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "view"));
    objc_msgSend(v21, "setFrame:", v13, v15, v17, v19);

  }
  else if (v5)
  {
    v22 = 138543362;
    v23 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Warning: Not moving content into wrapped PIP controller because wrappedViewController is nil", (uint8_t *)&v22, 0xCu);
  }
}

- (void)willAnimatePictureInPictureStop
{
  NSObject *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  uint8_t v6[16];

  v3 = sub_1000C5668();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "willAnimatePictureInPictureStop", v6, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController willAnimatePictureInPictureStopCompletionBlock](self, "willAnimatePictureInPictureStopCompletionBlock"));

  if (v4)
  {
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController willAnimatePictureInPictureStopCompletionBlock](self, "willAnimatePictureInPictureStopCompletionBlock"));
    v5[2](v5, 1);

  }
}

- (void)didAnimatePictureInPictureStop
{
  NSObject *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  int v12;
  PHPIPWrapperViewController *v13;
  __int16 v14;
  void *v15;

  v3 = sub_1000C5668();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: PIP Animation to fullscreen did complete", (uint8_t *)&v12, 0xCu);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController didAnimatePictureInPictureStopCompletionBlock](self, "didAnimatePictureInPictureStopCompletionBlock"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController delegate](self, "delegate"));
    v6 = objc_msgSend(v5, "wrapperViewControllerShouldReturnRestoreWrappedViewControllerHierarchy:", self);

    if (v6)
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController wrappedViewController](self, "wrappedViewController"));
    else
      v7 = 0;
    v9 = sub_1000C5668();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543618;
      v13 = self;
      v14 = 2112;
      v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling didAnimatePictureInPictureStopCompletionBlock with viewControllerToSteal: %@", (uint8_t *)&v12, 0x16u);
    }
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController didAnimatePictureInPictureStopCompletionBlock](self, "didAnimatePictureInPictureStopCompletionBlock"));
    ((void (**)(_QWORD, uint64_t, void *))v10)[2](v10, 1, v7);

    -[PHPIPWrapperViewController setDidAnimatePictureInPictureStopCompletionBlock:](self, "setDidAnimatePictureInPictureStopCompletionBlock:", 0);
  }
  else
  {
    v8 = sub_1000C5668();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Block didAnimatePictureInPictureStopCompletionBlock isn't set, won't restore view controller", (uint8_t *)&v12, 0xCu);
    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController delegate](self, "delegate"));
  objc_msgSend(v11, "wrapperViewControllerNeedsCleanup:", self);

}

- (CGSize)preferredContentSize
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  int v20;
  PHPIPWrapperViewController *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  CGSize result;

  v3 = sub_1000C5668();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138543362;
    v21 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating preferredContentSize to use for the PIP wrapper view controller", (uint8_t *)&v20, 0xCu);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "wrapperViewControllerPreferredContentSize:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController delegate](self, "delegate"));
    objc_msgSend(v6, "wrapperViewControllerPreferredContentSize:", self);
    v8 = v7;
    v10 = v9;

    v11 = sub_1000C5668();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138543874;
      v21 = self;
      v22 = 2048;
      v23 = v8;
      v24 = 2048;
      v25 = v10;
      v12 = "%{public}@: Found delegate with preferred size width=%f, height=%f";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v20, 0x20u);
    }
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController wrappedViewController](self, "wrappedViewController"));
    v14 = objc_msgSend(v13, "conformsToProtocol:", &OBJC_PROTOCOL___PHInCallRootViewControllerProtocol);

    if (!v14)
    {
      v10 = 0x4059000000000000;
      v8 = 0x4059000000000000;
      goto LABEL_11;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController wrappedViewController](self, "wrappedViewController"));
    objc_msgSend(v15, "preferredPIPContentAspectRatio");
    v8 = v16;
    v10 = v17;

    v11 = sub_1000C5668();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138543874;
      v21 = self;
      v22 = 2048;
      v23 = v8;
      v24 = 2048;
      v25 = v10;
      v12 = "%{public}@: Found child view controller with preferred size width=%f, height=%f";
      goto LABEL_9;
    }
  }
LABEL_11:
  v18 = *(double *)&v8;
  v19 = *(double *)&v10;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)actionButtonTapped
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  PHPIPWrapperViewController *v8;

  v3 = sub_1000C5668();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: PIP action button tapped, will disconnect the current video call", (uint8_t *)&v7, 0xCu);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentVideoCall"));
  objc_msgSend(v4, "disconnectCall:", v6);

}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_wrappedViewController, 0);
  v3.receiver = self;
  v3.super_class = (Class)PHPIPWrapperViewController;
  -[PHPIPWrapperViewController dealloc](&v3, "dealloc");
}

- (void)viewWillResize
{
  id v3;

  -[PHPIPWrapperViewController setPipIsBeingResized:](self, "setPipIsBeingResized:", 1);
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("PHPIPControllerDidStartResizingNotification"), self);

}

- (void)viewDidResize
{
  NSObject *v3;
  void *v4;
  int v5;
  PHPIPWrapperViewController *v6;

  -[PHPIPWrapperViewController setPipIsBeingResized:](self, "setPipIsBeingResized:", 0);
  v3 = sub_1000C5668();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: PIP view did resize", (uint8_t *)&v5, 0xCu);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("PHPIPControllerDidFinishResizingNotification"), self);

}

- (void)_layoutWrappedSubview
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[PHPIPWrapperViewController preferredContentSize](self, "preferredContentSize");
  if (v8 == v9)
  {
    if (v5 >= v7)
      v10 = v7;
    else
      v10 = v5;
    v11 = v10;
  }
  else if (v8 <= v9)
  {
    v11 = v8 * (v7 / fmax(v9, 1.0));
    v10 = v7;
  }
  else
  {
    v10 = v9 * (v5 / fmax(v8, 1.0));
    v11 = v5;
  }
  v13 = (id)objc_claimAutoreleasedReturnValue(-[PHPIPWrapperViewController wrappedViewController](self, "wrappedViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
  objc_msgSend(v12, "setFrame:", (v5 - v11) * 0.5, (v7 - v10) * 0.5, v11, v10);

}

- (UIViewController)wrappedViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_wrappedViewController);
}

- (PHPIPWrapperViewControllerDelegateProtocol)delegate
{
  return (PHPIPWrapperViewControllerDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)willAnimatePictureInPictureStopCompletionBlock
{
  return self->_willAnimatePictureInPictureStopCompletionBlock;
}

- (void)setWillAnimatePictureInPictureStopCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)didAnimatePictureInPictureStopCompletionBlock
{
  return self->_didAnimatePictureInPictureStopCompletionBlock;
}

- (void)setDidAnimatePictureInPictureStopCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)pipIsBeingResized
{
  return self->_pipIsBeingResized;
}

- (void)setPipIsBeingResized:(BOOL)a3
{
  self->_pipIsBeingResized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didAnimatePictureInPictureStopCompletionBlock, 0);
  objc_storeStrong(&self->_willAnimatePictureInPictureStopCompletionBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_wrappedViewController);
}

@end
