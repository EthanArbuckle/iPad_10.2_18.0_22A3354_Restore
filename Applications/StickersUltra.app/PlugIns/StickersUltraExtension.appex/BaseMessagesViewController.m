@implementation BaseMessagesViewController

- (BaseMessagesViewController)initWithCoder:(id)a3
{
  BaseMessagesViewController *v3;
  BaseMessagesViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BaseMessagesViewController;
  v3 = -[BaseMessagesViewController initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[BaseMessagesViewController _configure](v3, "_configure");
  return v4;
}

- (BaseMessagesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  BaseMessagesViewController *v4;
  BaseMessagesViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BaseMessagesViewController;
  v4 = -[BaseMessagesViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
    -[BaseMessagesViewController _configure](v4, "_configure");
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController displayLayoutMonitor](self, "displayLayoutMonitor"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController displayLayoutMonitor](self, "displayLayoutMonitor"));
    objc_msgSend(v4, "invalidate");

  }
  v5.receiver = self;
  v5.super_class = (Class)BaseMessagesViewController;
  -[BaseMessagesViewController dealloc](&v5, "dealloc");
}

- (void)_configure
{
  id v3;

  self->_overlayShown = 0;
  self->_strongPopoverCurrentlyPresented = 0;
  self->_snapshottingEnabledUpdateIdentifier = 0;
  self->_snapshottingEnabled = 0;
  self->_previousOrientation = 0;
  self->_previousSize = CGSizeZero;
  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  self->_automaticallyDisplaysLandscapeRotationOverlay = objc_msgSend(v3, "userInterfaceIdiom") == 0;

}

- (id)overrideTraitCollectionForChildViewController:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController traitCollection](self, "traitCollection", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVTUITraitCollectionHelper overridenTraitFromTrait:](AVTUITraitCollectionHelper, "overridenTraitFromTrait:", v3));

  return v4;
}

- (void)configureNewTrapOverlayView:(id *)a3 constraints:(id *)a4
{
  TrapOverlayView *v5;
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
  TrapOverlayView *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v31[4];

  v5 = -[TrapOverlayView initWithFrame:]([TrapOverlayView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController overlayMessageBackgroundColor](self, "overlayMessageBackgroundColor"));
  -[TrapOverlayView setBackgroundColor:](v5, "setBackgroundColor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController overlayMessageTextColor](self, "overlayMessageTextColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TrapOverlayView label](v5, "label"));
  objc_msgSend(v8, "setTextColor:", v7);

  -[TrapOverlayView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController view](self, "view"));
  objc_msgSend(v9, "addSubview:", v5);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TrapOverlayView leadingAnchor](v5, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController view](self, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
  v31[0] = v25;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TrapOverlayView trailingAnchor](v5, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
  v31[1] = v21;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TrapOverlayView topAnchor](v5, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
  v31[2] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TrapOverlayView bottomAnchor](v5, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v16));
  v31[3] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 4));

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);
  v19 = objc_retainAutorelease(v5);
  *a3 = v19;
  v20 = objc_retainAutorelease(v18);
  *a4 = v20;

}

- (BOOL)isLandcapeTrapOverlayShown
{
  return self->_landscapeTrapOverlay != 0;
}

- (BOOL)isCustomMessageOverlayShown
{
  return self->_customMessageTrapOverlay != 0;
}

- (void)setCustomOverlayMessage:(id)a3
{
  id v5;
  TrapOverlayView *v6;
  NSArray *v7;
  TrapOverlayView *v8;
  TrapOverlayView *v9;
  TrapOverlayView *v10;
  NSArray *v11;
  TrapOverlayView *customMessageTrapOverlay;
  NSArray *customMessageOverlayConstraints;
  void *v14;
  id v15;
  id v16;

  v5 = a3;
  objc_storeStrong((id *)&self->_customOverlayMessage, a3);
  if (v5)
  {
    if (self->_customMessageTrapOverlay)
    {
      v6 = (TrapOverlayView *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController view](self, "view"));
      -[TrapOverlayView bringSubviewToFront:](v6, "bringSubviewToFront:", self->_landscapeTrapOverlay);
    }
    else
    {
      v15 = 0;
      v16 = 0;
      -[BaseMessagesViewController configureNewTrapOverlayView:constraints:](self, "configureNewTrapOverlayView:constraints:", &v16, &v15);
      v10 = (TrapOverlayView *)v16;
      v11 = (NSArray *)v15;
      customMessageTrapOverlay = self->_customMessageTrapOverlay;
      self->_customMessageTrapOverlay = v10;
      v6 = v10;

      customMessageOverlayConstraints = self->_customMessageOverlayConstraints;
      self->_customMessageOverlayConstraints = v11;

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TrapOverlayView label](self->_customMessageTrapOverlay, "label"));
    objc_msgSend(v14, "setText:", v5);

    -[TrapOverlayView layoutIfNeeded](self->_customMessageTrapOverlay, "layoutIfNeeded");
  }
  else
  {
    if (self->_customMessageOverlayConstraints)
    {
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
      v7 = self->_customMessageOverlayConstraints;
      self->_customMessageOverlayConstraints = 0;

    }
    v8 = self->_customMessageTrapOverlay;
    if (v8)
    {
      -[TrapOverlayView removeFromSuperview](v8, "removeFromSuperview");
      v9 = self->_customMessageTrapOverlay;
      self->_customMessageTrapOverlay = 0;

    }
  }
  -[BaseMessagesViewController updateHiddenSubviewsForAnyOverlays](self, "updateHiddenSubviewsForAnyOverlays");

}

- (int64_t)currentOrientation
{
  return (int64_t)-[BaseMessagesViewController interfaceOrientation](self, "interfaceOrientation");
}

- (BOOL)isLandscapeMode
{
  return (char *)-[BaseMessagesViewController currentOrientation](self, "currentOrientation") - 3 < (char *)2;
}

- (BOOL)didOrientationChangeSemantically
{
  int64_t previousOrientation;
  int64_t v4;

  previousOrientation = self->_previousOrientation;
  v4 = -[BaseMessagesViewController currentOrientation](self, "currentOrientation");
  self->_previousOrientation = v4;
  if (v4 == previousOrientation)
    return 0;
  if (previousOrientation)
    return ((unint64_t)(previousOrientation - 3) < 2) ^ ((unint64_t)(v4 - 3) < 2);
  return 1;
}

- (BOOL)needsLandscapeOverlayUpdate
{
  _BOOL4 v3;

  v3 = -[BaseMessagesViewController automaticallyDisplaysLandscapeRotationOverlay](self, "automaticallyDisplaysLandscapeRotationOverlay");
  if (v3)
    LOBYTE(v3) = -[BaseMessagesViewController didOrientationChangeSemantically](self, "didOrientationChangeSemantically");
  return v3;
}

- (void)updateLandscapeOverlayImmediately
{
  void *v3;
  void *v4;
  TrapOverlayView *v5;
  NSArray *v6;
  TrapOverlayView *v7;
  TrapOverlayView *v8;
  TrapOverlayView *v9;
  NSArray *v10;
  TrapOverlayView *landscapeTrapOverlay;
  NSArray *landscapeOverlayConstraints;
  void *v13;
  void *v14;
  id v15;
  id v16;

  if (-[BaseMessagesViewController automaticallyDisplaysLandscapeRotationOverlay](self, "automaticallyDisplaysLandscapeRotationOverlay"))
  {
    if (-[BaseMessagesViewController isLandscapeMode](self, "isLandscapeMode"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController currentControllerPresentation](self, "currentControllerPresentation"));

      if (v3)
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController currentControllerPresentation](self, "currentControllerPresentation"));
        objc_msgSend(v4, "viewWillBeObstructed");

      }
      if (self->_landscapeTrapOverlay)
      {
        v5 = (TrapOverlayView *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController view](self, "view"));
        -[TrapOverlayView bringSubviewToFront:](v5, "bringSubviewToFront:", self->_landscapeTrapOverlay);
      }
      else
      {
        v15 = 0;
        v16 = 0;
        -[BaseMessagesViewController configureNewTrapOverlayView:constraints:](self, "configureNewTrapOverlayView:constraints:", &v16, &v15);
        v9 = (TrapOverlayView *)v16;
        v10 = (NSArray *)v15;
        landscapeTrapOverlay = self->_landscapeTrapOverlay;
        self->_landscapeTrapOverlay = v9;
        v5 = v9;

        landscapeOverlayConstraints = self->_landscapeOverlayConstraints;
        self->_landscapeOverlayConstraints = v10;

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController landscapeOverlayMessage](self, "landscapeOverlayMessage"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TrapOverlayView label](self->_landscapeTrapOverlay, "label"));
      objc_msgSend(v14, "setText:", v13);

      -[TrapOverlayView layoutIfNeeded](self->_landscapeTrapOverlay, "layoutIfNeeded");
    }
    else
    {
      if (self->_landscapeOverlayConstraints)
      {
        +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
        v6 = self->_landscapeOverlayConstraints;
        self->_landscapeOverlayConstraints = 0;

      }
      v7 = self->_landscapeTrapOverlay;
      if (v7)
      {
        -[TrapOverlayView removeFromSuperview](v7, "removeFromSuperview");
        v8 = self->_landscapeTrapOverlay;
        self->_landscapeTrapOverlay = 0;

      }
    }
    -[BaseMessagesViewController updateHiddenSubviewsForAnyOverlays](self, "updateHiddenSubviewsForAnyOverlays");
  }
}

- (void)updateLandscapeOverlayIfNecessaryWithCoordinator:(id)a3
{
  _QWORD v3[5];
  _QWORD v4[5];

  if (a3)
  {
    v3[4] = self;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000075A0;
    v4[3] = &unk_100089F68;
    v4[4] = self;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000076E0;
    v3[3] = &unk_100089F68;
    objc_msgSend(a3, "animateAlongsideTransition:completion:", v4, v3);
  }
  else
  {
    -[BaseMessagesViewController updateLandscapeOverlayImmediately](self, "updateLandscapeOverlayImmediately");
  }
}

- (void)updateHiddenSubviewsForAnyOverlays
{
  TrapOverlayView *landscapeTrapOverlay;
  TrapOverlayView *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  TrapOverlayView *v11;
  BOOL v12;
  uint64_t v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  const __CFString *v22;
  void *v23;
  _BYTE v24[128];

  landscapeTrapOverlay = self->_landscapeTrapOverlay;
  if (!landscapeTrapOverlay)
    landscapeTrapOverlay = self->_customMessageTrapOverlay;
  v4 = landscapeTrapOverlay;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController view](self, "view", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subviews"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(TrapOverlayView **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v10);
        if (v4)
          v12 = v11 == v4;
        else
          v12 = 1;
        v13 = !v12;
        -[TrapOverlayView setHidden:](v11, "setHidden:", v13);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v8);
  }

  if (self->_landscapeTrapOverlay)
  {
    if (!-[BaseMessagesViewController isOverlayShown](self, "isOverlayShown"))
    {
      v14 = 1;
LABEL_20:
      -[BaseMessagesViewController setOverlayShown:](self, "setOverlayShown:", v14);
      v22 = CFSTR("BaseMessagesViewControllerOverlayPresentedKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v14));
      v23 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("BaseMessagesViewControllerOverlayPresentationNotification"), self, v16);

    }
  }
  else
  {
    v14 = self->_customMessageTrapOverlay != 0;
    if (v14 != -[BaseMessagesViewController isOverlayShown](self, "isOverlayShown"))
      goto LABEL_20;
  }

}

- (UIColor)overlayMessageTextColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
}

- (UIColor)overlayMessageBackgroundColor
{
  return (UIColor *)+[AVTUIColorRepository trapOverlayBackgroundColor](AVTUIColorRepository, "trapOverlayBackgroundColor");
}

- (NSString)landscapeOverlayMessage
{
  NSBundle *v2;
  void *v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("StickersLandscapeTrapMessage"), &stru_10008E190, CFSTR("Localizable")));

  return (NSString *)v4;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BaseMessagesViewController;
  -[BaseMessagesViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVTUIColorRepository appBackgroundColor](AVTUIColorRepository, "appBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BaseMessagesViewController;
  -[BaseMessagesViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  -[BaseMessagesViewController scheduleSnapshotEnabledUpdateAfter:currentValue:futureValue:](self, "scheduleSnapshotEnabledUpdateAfter:currentValue:futureValue:", 0, &__kCFBooleanTrue, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("BaseMessagesViewControllerDidAppearNotification"), self);

}

- (void)scheduleSnapshotEnabledUpdateAfter:(double)a3 currentValue:(id)a4 futureValue:(id)a5
{
  id v8;
  id v9;
  void *v10;
  dispatch_time_t v11;
  _QWORD block[4];
  id v13;
  id v14[2];
  uint8_t buf[4];
  id v16;

  v8 = a4;
  v9 = a5;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[BaseAnimoji] updating snapshottingEnabled applying currentValue: %@", buf, 0xCu);
    }
    -[BaseMessagesViewController setSnapshottingEnabled:](self, "setSnapshottingEnabled:", objc_msgSend(v8, "BOOLValue"));
  }
  if (v9)
  {
    v10 = (void *)(self->_snapshottingEnabledUpdateIdentifier + 1);
    self->_snapshottingEnabledUpdateIdentifier = (int64_t)v10;
    objc_initWeak((id *)buf, self);
    v11 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007C04;
    block[3] = &unk_100089F90;
    objc_copyWeak(v14, (id *)buf);
    v14[1] = v10;
    v13 = v9;
    dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(v14);
    objc_destroyWeak((id *)buf);
  }

}

- (void)setSnapshottingEnabled:(BOOL)a3
{
  id v5;

  if (self->_snapshottingEnabled != a3)
  {
    -[BaseMessagesViewController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("snapshottingEnabled"));
    self->_snapshottingEnabled = a3;
    -[BaseMessagesViewController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("snapshottingEnabled"));
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("BaseMessagesViewControllerSnapshottingEnabledChangedNotification"), self, 0);

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)BaseMessagesViewController;
  v7 = a4;
  -[BaseMessagesViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  self->_previousSize.width = width;
  self->_previousSize.height = height;
  -[BaseMessagesViewController updateLandscapeOverlayIfNecessaryWithCoordinator:](self, "updateLandscapeOverlayIfNecessaryWithCoordinator:", v7, v8.receiver, v8.super_class);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BaseMessagesViewController;
  -[BaseMessagesViewController viewDidLayoutSubviews](&v9, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController view](self, "view"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;

  if (self->_previousSize.width != v5 || self->_previousSize.height != v7)
  {
    self->_previousSize.width = v5;
    self->_previousSize.height = v7;
    -[BaseMessagesViewController updateLandscapeOverlayIfNecessaryWithCoordinator:](self, "updateLandscapeOverlayIfNecessaryWithCoordinator:", 0);
  }
}

- (id)defaultMessagesChildViewControllerForPresentationContext:(unint64_t)a3
{
  id v3;

  if (+[MSMessagesAppViewController instancesRespondToSelector:](MSMessagesAppViewController, "instancesRespondToSelector:", "initWithShouldBeSheetPresentationControllerDelegate:"))v3 = objc_msgSend(objc_alloc((Class)MSMessagesAppViewController), "initWithShouldBeSheetPresentationControllerDelegate:", 0);
  else
    v3 = objc_alloc_init((Class)MSMessagesAppViewController);
  return v3;
}

+ (UIViewController)pendingChildViewController
{
  return (UIViewController *)(id)qword_10009D890;
}

+ (void)setPendingChildViewController:(id)a3
{
  objc_storeStrong((id *)&qword_10009D890, a3);
}

- (void)willBecomeActiveWithConversation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_super v42;
  _QWORD v43[4];

  v42.receiver = self;
  v42.super_class = (Class)BaseMessagesViewController;
  v4 = a3;
  -[BaseMessagesViewController willBecomeActiveWithConversation:](&v42, "willBecomeActiveWithConversation:", v4);
  if (!-[BaseMessagesViewController isLoaded](self, "isLoaded"))
  {
    -[BaseMessagesViewController setIsLoaded:](self, "setIsLoaded:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AVTUIControllerPresentation pendingGlobalPresentation](AVTUIControllerPresentation, "pendingGlobalPresentation"));
    -[BaseMessagesViewController setCurrentControllerPresentation:](self, "setCurrentControllerPresentation:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BaseMessagesViewController pendingChildViewController](BaseMessagesViewController, "pendingChildViewController"));
    v7 = v6;
    if (v5)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "controller"));
      objc_msgSend(v5, "setModalMessagesController:", self);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[AVTUIColorRepository modalBackgroundColor](AVTUIColorRepository, "modalBackgroundColor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController view](self, "view"));
      objc_msgSend(v10, "setBackgroundColor:", v9);

      if (!v8)
      {
LABEL_12:
        -[BaseMessagesViewController updateLandscapeOverlayImmediately](self, "updateLandscapeOverlayImmediately");

        goto LABEL_13;
      }
    }
    else if (v6)
    {
      v8 = v6;
      +[BaseMessagesViewController setPendingChildViewController:](BaseMessagesViewController, "setPendingChildViewController:", 0);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController baseMessagesViewController](self, "baseMessagesViewController"));

      if (!v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController defaultMessagesChildViewControllerForPresentationContext:](self, "defaultMessagesChildViewControllerForPresentationContext:", -[BaseMessagesViewController presentationContext](self, "presentationContext")));
        -[BaseMessagesViewController setBaseMessagesViewController:](self, "setBaseMessagesViewController:", v12);

      }
      v8 = (id)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController baseMessagesViewController](self, "baseMessagesViewController"));
      if (!v8)
        goto LABEL_12;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parentViewController"));

    if (!v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController view](self, "view"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
      objc_msgSend(v14, "addSubview:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
      objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v40 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController view](self, "view"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "leftAnchor"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "leftAnchor"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
      v43[0] = v36;
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController view](self, "view"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "rightAnchor"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "rightAnchor"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v32));
      v43[1] = v31;
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController view](self, "view"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topAnchor"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
      v43[2] = v26;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController view](self, "view"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
      v41 = v7;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bottomAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v20));
      v43[3] = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 4));
      -[BaseMessagesViewController setChildConstraints:](self, "setChildConstraints:", v22);

      v7 = v41;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController view](self, "view"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController childConstraints](self, "childConstraints"));
      objc_msgSend(v23, "addConstraints:", v24);

      -[BaseMessagesViewController addChildViewController:](self, "addChildViewController:", v8);
      objc_msgSend(v8, "didMoveToParentViewController:", self);
    }
    goto LABEL_12;
  }
LABEL_13:
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController baseMessagesViewController](self, "baseMessagesViewController"));
  objc_msgSend(v25, "willBecomeActiveWithConversation:", v4);

}

- (void)didBecomeActiveWithConversation:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BaseMessagesViewController;
  v4 = a3;
  -[BaseMessagesViewController didBecomeActiveWithConversation:](&v6, "didBecomeActiveWithConversation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController baseMessagesViewController](self, "baseMessagesViewController", v6.receiver, v6.super_class));
  objc_msgSend(v5, "didBecomeActiveWithConversation:", v4);

  -[BaseMessagesViewController setupDisplayLayoutMonitor](self, "setupDisplayLayoutMonitor");
}

- (void)willResignActiveWithConversation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BaseMessagesViewController;
  v4 = a3;
  -[BaseMessagesViewController willResignActiveWithConversation:](&v7, "willResignActiveWithConversation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController baseMessagesViewController](self, "baseMessagesViewController", v7.receiver, v7.super_class));
  objc_msgSend(v5, "willResignActiveWithConversation:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController displayLayoutMonitor](self, "displayLayoutMonitor"));
  objc_msgSend(v6, "invalidate");

  -[BaseMessagesViewController setDisplayLayoutMonitor:](self, "setDisplayLayoutMonitor:", 0);
}

- (void)didResignActiveWithConversation:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BaseMessagesViewController;
  v4 = a3;
  -[BaseMessagesViewController didResignActiveWithConversation:](&v6, "didResignActiveWithConversation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController baseMessagesViewController](self, "baseMessagesViewController", v6.receiver, v6.super_class));
  objc_msgSend(v5, "didResignActiveWithConversation:", v4);

}

- (void)willTransitionToPresentationStyle:(unint64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BaseMessagesViewController;
  -[BaseMessagesViewController willTransitionToPresentationStyle:](&v6, "willTransitionToPresentationStyle:");
  if (!a3)
    -[BaseMessagesViewController scheduleSnapshotEnabledUpdateAfter:currentValue:futureValue:](self, "scheduleSnapshotEnabledUpdateAfter:currentValue:futureValue:", &__kCFBooleanFalse, 0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController baseMessagesViewController](self, "baseMessagesViewController"));
  objc_msgSend(v5, "willTransitionToPresentationStyle:", a3);

}

- (void)didTransitionToPresentationStyle:(unint64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BaseMessagesViewController;
  -[BaseMessagesViewController didTransitionToPresentationStyle:](&v6, "didTransitionToPresentationStyle:");
  if (!a3)
    -[BaseMessagesViewController scheduleSnapshotEnabledUpdateAfter:currentValue:futureValue:](self, "scheduleSnapshotEnabledUpdateAfter:currentValue:futureValue:", &__kCFBooleanFalse, &__kCFBooleanTrue, 0.1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController baseMessagesViewController](self, "baseMessagesViewController"));
  objc_msgSend(v5, "didTransitionToPresentationStyle:", a3);

}

- (UIImage)emptySnapshotImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIImage *ImageFromCurrentImageContext;
  void *v10;
  CGSize v12;
  CGRect v13;

  v12.width = 1.0;
  v12.height = 1.0;
  UIGraphicsBeginImageContextWithOptions(v12, 1, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController childViewControllers](self, "childViewControllers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "backgroundColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traitCollection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resolvedColorWithTraitCollection:", v7));
  objc_msgSend(v8, "setFill");

  v13.origin.x = 0.0;
  v13.origin.y = 0.0;
  v13.size.width = 1.0;
  v13.size.height = 1.0;
  UIRectFill(v13);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v10 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();

  return (UIImage *)v10;
}

- (void)updateSnapshotWithCompletionBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  char v6;
  unsigned int v7;
  _BOOL4 v8;
  void *v9;
  __int16 v10[8];
  uint8_t v11[16];
  uint8_t buf[16];

  v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController baseMessagesViewController](self, "baseMessagesViewController"));
    v6 = objc_opt_respondsToSelector(v5, "updateSnapshotWithCompletionBlock:");

    if ((v6 & 1) != 0)
    {
      v7 = -[BaseMessagesViewController snapshottingEnabled](self, "snapshottingEnabled");
      v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v8)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[BaseAnimoji] updateSnapshotWithCompletionBlock snapshots enabled", buf, 2u);
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController baseMessagesViewController](self, "baseMessagesViewController"));
        objc_msgSend(v9, "updateSnapshotWithCompletionBlock:", v4);
      }
      else
      {
        if (v8)
        {
          *(_WORD *)v11 = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[BaseAnimoji] updateSnapshotWithCompletionBlock snapshots disabled, returning 1x1 empty snapshot", v11, 2u);
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[BaseMessagesViewController emptySnapshotImage](self, "emptySnapshotImage"));
        v4[2](v4, v9);
      }

    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v10[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[BaseAnimoji] updateSnapshotWithCompletionBlock snapshots disabled", (uint8_t *)v10, 2u);
      }
      v4[2](v4, 0);
    }
  }

}

- (void)_addStickerToStoreWithRepresentations:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 3328, 0));
  (*((void (**)(id, id, CGFloat, CGFloat, CGFloat, CGFloat))a4 + 2))(v5, v6, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);

}

- (void)_addStickerToStoreWithRepresentations:(id)a3 completionWithStickerIDs:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 3328, 0));
  (*((void (**)(id, _QWORD, id, CGFloat, CGFloat, CGFloat, CGFloat))a4 + 2))(v5, 0, v6, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);

}

- (void)_addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 3328, 0));
  (*((void (**)(id, _QWORD, id))a5 + 2))(v6, 0, v7);

}

- (void)_addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 effect:(int64_t)a5 completion:(id)a6
{
  id v7;
  id v8;

  v7 = a6;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 3328, 0));
  (*((void (**)(id, _QWORD, id))a6 + 2))(v7, 0, v8);

}

- (void)_addStickerToStoreWithUISticker:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 3328, 0));
  (*((void (**)(id, _QWORD, id))a5 + 2))(v6, 0, v7);

}

- (void)_addStickerAnimationDidFinishWithCompletion:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)setupDisplayLayoutMonitor
{
  void *v3;
  void *v4;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, void *, void *);
  void *v8;
  id v9;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor](FBSDisplayLayoutMonitorConfiguration, "configurationForDefaultMainDisplayMonitor"));
  objc_initWeak(&location, self);
  v5 = _NSConcreteStackBlock;
  v6 = 3221225472;
  v7 = sub_100008C60;
  v8 = &unk_100089FB8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "setTransitionHandler:", &v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FBSDisplayLayoutMonitor monitorWithConfiguration:](FBSDisplayLayoutMonitor, "monitorWithConfiguration:", v3, v5, v6, v7, v8));
  -[BaseMessagesViewController setDisplayLayoutMonitor:](self, "setDisplayLayoutMonitor:", v4);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)layoutMonitorDidUpdateDisplayLayout:(id)a3 withContext:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  char v17;
  _QWORD *v18;
  BaseMessagesViewController *v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[5];
  char v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "elements"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v5)
  {
    v6 = v5;
    v22 = *(_QWORD *)v26;
    v7 = FBSDisplayLayoutElementControlCenterIdentifier;
    v8 = FBSDisplayLayoutElementLockScreenIdentifier;
    v9 = FBSDisplayLayoutElementSiriIdentifier;
    v21 = FBSDisplayLayoutElementNotificationCenterIdentifier;
    v19 = self;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v22)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier", v19));
        if ((objc_msgSend(v12, "isEqualToString:", v7) & 1) != 0)
          goto LABEL_16;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
        if ((objc_msgSend(v13, "isEqualToString:", v8) & 1) != 0)
          goto LABEL_15;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
        if (objc_msgSend(v14, "isEqualToString:", v9))
        {

LABEL_15:
LABEL_16:

LABEL_17:
          v17 = 1;
          self = v19;
          goto LABEL_18;
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
        v16 = objc_msgSend(v15, "isEqualToString:", v21);

        if ((v16 & 1) != 0)
          goto LABEL_17;
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      v17 = 0;
      self = v19;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v17 = 0;
  }
LABEL_18:

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100008F24;
  v23[3] = &unk_100089FE0;
  v24 = v17;
  v23[4] = self;
  v18 = objc_retainBlock(v23);
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
    ((void (*)(_QWORD *))v18[2])(v18);
  else
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);

}

- (void)beginHidingInterfaceWithMessage:(id)a3
{
  if (!a3)
    a3 = &stru_10008E190;
  -[BaseMessagesViewController setCustomOverlayMessage:](self, "setCustomOverlayMessage:", a3);
}

- (void)endHidingInterface
{
  -[BaseMessagesViewController setCustomOverlayMessage:](self, "setCustomOverlayMessage:", 0);
}

- (BOOL)snapshottingEnabled
{
  return self->_snapshottingEnabled;
}

- (MSMessagesAppViewController)baseMessagesViewController
{
  return self->_baseMessagesViewController;
}

- (void)setBaseMessagesViewController:(id)a3
{
  objc_storeStrong((id *)&self->_baseMessagesViewController, a3);
}

- (BOOL)automaticallyDisplaysLandscapeRotationOverlay
{
  return self->_automaticallyDisplaysLandscapeRotationOverlay;
}

- (void)setAutomaticallyDisplaysLandscapeRotationOverlay:(BOOL)a3
{
  self->_automaticallyDisplaysLandscapeRotationOverlay = a3;
}

- (void)setLandscapeOverlayMessage:(id)a3
{
  objc_storeStrong((id *)&self->_landscapeOverlayMessage, a3);
}

- (NSString)customOverlayMessage
{
  return self->_customOverlayMessage;
}

- (BOOL)isOverlayShown
{
  return self->_overlayShown;
}

- (void)setOverlayShown:(BOOL)a3
{
  self->_overlayShown = a3;
}

- (NSArray)childConstraints
{
  return self->_childConstraints;
}

- (void)setChildConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_childConstraints, a3);
}

- (NSArray)landscapeOverlayConstraints
{
  return self->_landscapeOverlayConstraints;
}

- (void)setLandscapeOverlayConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_landscapeOverlayConstraints, a3);
}

- (NSArray)customMessageOverlayConstraints
{
  return self->_customMessageOverlayConstraints;
}

- (void)setCustomMessageOverlayConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_customMessageOverlayConstraints, a3);
}

- (BOOL)isLoaded
{
  return self->_isLoaded;
}

- (void)setIsLoaded:(BOOL)a3
{
  self->_isLoaded = a3;
}

- (CGSize)previousSize
{
  double width;
  double height;
  CGSize result;

  width = self->_previousSize.width;
  height = self->_previousSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreviousSize:(CGSize)a3
{
  self->_previousSize = a3;
}

- (int64_t)previousOrientation
{
  return self->_previousOrientation;
}

- (void)setPreviousOrientation:(int64_t)a3
{
  self->_previousOrientation = a3;
}

- (TrapOverlayView)landscapeTrapOverlay
{
  return self->_landscapeTrapOverlay;
}

- (void)setLandscapeTrapOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_landscapeTrapOverlay, a3);
}

- (TrapOverlayView)customMessageTrapOverlay
{
  return self->_customMessageTrapOverlay;
}

- (void)setCustomMessageTrapOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_customMessageTrapOverlay, a3);
}

- (int64_t)snapshottingEnabledUpdateIdentifier
{
  return self->_snapshottingEnabledUpdateIdentifier;
}

- (void)setSnapshottingEnabledUpdateIdentifier:(int64_t)a3
{
  self->_snapshottingEnabledUpdateIdentifier = a3;
}

- (BOOL)strongPopoverCurrentlyPresented
{
  return self->_strongPopoverCurrentlyPresented;
}

- (void)setStrongPopoverCurrentlyPresented:(BOOL)a3
{
  self->_strongPopoverCurrentlyPresented = a3;
}

- (AVTUIControllerPresentation)currentControllerPresentation
{
  return (AVTUIControllerPresentation *)objc_loadWeakRetained((id *)&self->_currentControllerPresentation);
}

- (void)setCurrentControllerPresentation:(id)a3
{
  objc_storeWeak((id *)&self->_currentControllerPresentation, a3);
}

- (FBSDisplayLayoutMonitor)displayLayoutMonitor
{
  return self->_displayLayoutMonitor;
}

- (void)setDisplayLayoutMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_displayLayoutMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);
  objc_destroyWeak((id *)&self->_currentControllerPresentation);
  objc_storeStrong((id *)&self->_customMessageTrapOverlay, 0);
  objc_storeStrong((id *)&self->_landscapeTrapOverlay, 0);
  objc_storeStrong((id *)&self->_customMessageOverlayConstraints, 0);
  objc_storeStrong((id *)&self->_landscapeOverlayConstraints, 0);
  objc_storeStrong((id *)&self->_childConstraints, 0);
  objc_storeStrong((id *)&self->_customOverlayMessage, 0);
  objc_storeStrong((id *)&self->_landscapeOverlayMessage, 0);
  objc_storeStrong((id *)&self->_baseMessagesViewController, 0);
}

@end
