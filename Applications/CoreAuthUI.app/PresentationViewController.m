@implementation PresentationViewController

- (void)viewDidLoad
{
  NSMutableArray *v3;
  NSMutableArray *dismissCompletionHandlers;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PresentationViewController;
  -[PresentationViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = objc_opt_new(NSMutableArray);
  dismissCompletionHandlers = self->_dismissCompletionHandlers;
  self->_dismissCompletionHandlers = v3;

}

- (void)presentOnParentViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  _QWORD block[4];
  id v22;
  void (**v23)(_QWORD);
  id v24;
  BOOL v25;
  uint8_t buf[4];
  void *v27;
  _QWORD v28[2];
  _QWORD v29[2];

  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  if (-[PresentationViewController isDynamicIslandAvailable](self, "isDynamicIslandAvailable"))
  {
    +[LANotificationUIBannerAppearance postNotificationWithNewBoolState:](LANotificationUIBannerAppearance, "postNotificationWithNewBoolState:", 1);
    v28[0] = kSBUIPresentableSystemApertureSupportingUserInfoKey;
    v28[1] = CFSTR("SBUIPresentableSystemApertureAffectsAppLifecyleUserInfoKey");
    v29[0] = &__kCFBooleanTrue;
    v29[1] = &__kCFBooleanFalse;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 2));
    v11 = LACLogFaceIDUI(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PresentationViewController requestIdentifier](self, "requestIdentifier"));
      *(_DWORD *)buf = 138543362;
      v27 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Posting %{public}@", buf, 0xCu);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PresentationViewController bannerSource](self, "bannerSource"));
    v20 = 0;
    v15 = objc_msgSend(v14, "postPresentable:options:userInfo:error:", self, 1, v10, &v20);
    v16 = v20;

    if ((v15 & 1) == 0)
    {
      v18 = LACLogFaceIDUI(v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_100056358();

    }
    if (v9)
      v9[2](v9);

  }
  else
  {
    objc_initWeak((id *)buf, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001BD60;
    block[3] = &unk_10007A200;
    objc_copyWeak(&v24, (id *)buf);
    v22 = v8;
    v25 = a4;
    v23 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }

}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a3;
  v6 = a4;
  if (-[PresentationViewController isDynamicIslandAvailable](self, "isDynamicIslandAvailable"))
  {
    -[PresentationViewController revokePresentableWithCompletionHandler:](self, "revokePresentableWithCompletionHandler:", v6);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PresentationViewController;
    -[PresentationViewController dismissViewControllerAnimated:completion:](&v7, "dismissViewControllerAnimated:completion:", v4, v6);
  }

}

- (void)revokePresentableWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSMutableArray *dismissCompletionHandlers;
  void (**v15)(_QWORD);
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  uint8_t buf[4];
  void *v23;

  v4 = (void (**)(_QWORD))a3;
  v5 = LACLogFaceIDUI(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PresentationViewController requestIdentifier](self, "requestIdentifier"));
    *(_DWORD *)buf = 138543362;
    v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Revoking %{public}@", buf, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PresentationViewController bannerSource](self, "bannerSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PresentationViewController requestIdentifier](self, "requestIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("dismissing %@"), self));
  v21 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "revokePresentableWithRequestIdentifier:reason:animated:userInfo:error:", v9, v10, 1, 0, &v21));
  v12 = v21;

  if (v11)
  {
    if (v4)
    {
      dismissCompletionHandlers = self->_dismissCompletionHandlers;
      v15 = objc_retainBlock(v4);
      -[NSMutableArray addObject:](dismissCompletionHandlers, "addObject:", v15);

      v17 = LACLogFaceIDUI(v16);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        sub_100056420((uint64_t)self, (id *)&self->_dismissCompletionHandlers, v18);

    }
  }
  else
  {
    v19 = LACLogFaceIDUI(v13);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_1000563BC();

    if (v4)
      v4[2](v4);
  }

}

- (BNBannerSource)bannerSource
{
  BNBannerSource *bannerSource;
  NSBundle *v4;
  void *v5;
  void *v6;
  BNBannerSource *v7;
  BNBannerSource *v8;

  bannerSource = self->_bannerSource;
  if (!bannerSource)
  {
    v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, a2));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
    v7 = (BNBannerSource *)objc_claimAutoreleasedReturnValue(+[BNBannerSource bannerSourceForDestination:forRequesterIdentifier:](BNBannerSource, "bannerSourceForDestination:forRequesterIdentifier:", 0, v6));
    v8 = self->_bannerSource;
    self->_bannerSource = v7;

    bannerSource = self->_bannerSource;
  }
  return bannerSource;
}

- (NSString)requesterIdentifier
{
  NSBundle *v2;
  void *v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));

  return (NSString *)v4;
}

- (NSString)requestIdentifier
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PresentingRequest:%@"), self);
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a3;
  v4 = LACLogFaceIDUI();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "presentableWillAppearAsBanner:%{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)presentableDidAppearAsBanner:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a3;
  v5 = LACLogFaceIDUI();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "presentableDidAppearAsBanner:%{public}@", (uint8_t *)&v7, 0xCu);
  }

  self->_isActive = 1;
  byte_1000921E8 = 1;

}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = LACLogFaceIDUI();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "presentableWillDisappearAsBanner:%{public}@ withReason:%{public}@", (uint8_t *)&v10, 0x16u);
  }

  self->_isActive = 0;
  byte_1000921E8 = 0;

}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = LACLogFaceIDUI(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "presentableDidDisappearAsBanner:%{public}@ withReason:%{public}@", (uint8_t *)&v10, 0x16u);
  }

  +[LANotificationUIBannerAppearance postNotificationWithNewBoolState:](LANotificationUIBannerAppearance, "postNotificationWithNewBoolState:", 0);
  -[PresentationViewController _checkDismissalCompletion](self, "_checkDismissalCompletion");

}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = LACLogFaceIDUI(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "presentableWillNotAppearAsBanner:%{public}@ withReason:%{public}@", (uint8_t *)&v10, 0x16u);
  }

  -[PresentationViewController _checkDismissalCompletion](self, "_checkDismissalCompletion");
}

- (void)_checkDismissalCompletion
{
  id v3;
  __int128 v4;
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void (**v8)(void);
  unsigned int v9;
  __int128 v10;
  uint8_t buf[4];
  PresentationViewController *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  unsigned int v16;

  v3 = -[NSMutableArray count](self->_dismissCompletionHandlers, "count");
  if (v3)
  {
    v5 = 0;
    *(_QWORD *)&v4 = 138543874;
    v10 = v4;
    do
    {
      v6 = LACLogFaceIDUI(v3);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v9 = -[NSMutableArray count](self->_dismissCompletionHandlers, "count");
        *(_DWORD *)buf = v10;
        v12 = self;
        v13 = 1024;
        v14 = v5 + 1;
        v15 = 1024;
        v16 = v9;
        _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}@ is calling completion handler %u of %u", buf, 0x18u);
      }

      v8 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_dismissCompletionHandlers, "objectAtIndexedSubscript:", v5));
      v8[2]();

      ++v5;
      v3 = -[NSMutableArray count](self->_dismissCompletionHandlers, "count");
    }
    while (v5 < (unint64_t)v3);
  }
  -[NSMutableArray removeAllObjects](self->_dismissCompletionHandlers, "removeAllObjects", v10);
}

- (void)userInteractionWillBeginForBannerForPresentable:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a3;
  v4 = LACLogFaceIDUI();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "userInteractionWillBeginForPresentable:%{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)userInteractionDidEndForBannerForPresentable:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a3;
  v4 = LACLogFaceIDUI();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "userInteractionDidEndForPresentable:%{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (id)presentableDescription
{
  return -[PresentationViewController description](self, "description");
}

- (int64_t)preferredLayoutMode
{
  return 4;
}

- (int64_t)maximumLayoutMode
{
  return 4;
}

- (int64_t)contentRole
{
  return 1;
}

- (unint64_t)presentationBehaviors
{
  return 8;
}

- (NSString)associatedAppBundleIdentifier
{
  return 0;
}

- (BOOL)providesHostedContent
{
  return 1;
}

- (BOOL)bn_shouldAnimateViewTransitionToSize:(CGSize)a3
{
  return 1;
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  double v4;
  double v5;
  CGSize result;

  -[PresentationViewController preferredContentSize](self, "preferredContentSize", a3.width, a3.height, a4.width, a4.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (BOOL)isDynamicIslandAvailable
{
  if (qword_1000921F0 != -1)
    dispatch_once(&qword_1000921F0, &stru_10007A370);
  return byte_1000921E9;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)shake
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  PresentationViewController *v8;
  __int16 v9;
  void *v10;

  v3 = LACLogFaceIDUI(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PresentationViewController systemApertureElementContext](self, "systemApertureElementContext"));
    v7 = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ will shake via %{public}@", (uint8_t *)&v7, 0x16u);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PresentationViewController systemApertureElementContext](self, "systemApertureElementContext"));
  objc_msgSend(v6, "requestNegativeResponseAnimation");

}

- (int64_t)activeLayoutMode
{
  return self->activeLayoutMode;
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  self->activeLayoutMode = a3;
}

- (LAUIPearlGlyphView)glyphView
{
  return self->_glyphView;
}

- (void)setGlyphView:(id)a3
{
  objc_storeStrong((id *)&self->_glyphView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_bannerSource, 0);
  objc_storeStrong((id *)&self->_dismissCompletionHandlers, 0);
}

@end
