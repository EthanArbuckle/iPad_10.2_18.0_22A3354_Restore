@implementation SSSContainerViewController

- (SSSContainerViewController)init
{
  SSSContainerViewController *v2;
  SSSScreenshotsViewController *v3;
  SSSScreenshotsViewController *screenshotsViewController;
  SSSScreenshotGroupImageIdentifierUpdateTracker *v5;
  SSSScreenshotGroupImageIdentifierUpdateTracker *groupImageIdentifierUpdateTracker;
  void *v7;
  UITapGestureRecognizer *v8;
  UITapGestureRecognizer *pileTapGesture;
  UITapGestureRecognizer *v10;
  UITapGestureRecognizer *pilePencilTapGesture;
  UIPanGestureRecognizer *v12;
  UIPanGestureRecognizer *pileFlingGesture;
  UILongPressGestureRecognizer *v14;
  UILongPressGestureRecognizer *pileLongPressGesture;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SSSContainerViewController;
  v2 = -[SSSContainerViewController initWithNibName:bundle:](&v17, "initWithNibName:bundle:", 0, 0);
  v2->_state = 0;
  v3 = objc_alloc_init(SSSScreenshotsViewController);
  screenshotsViewController = v2->_screenshotsViewController;
  v2->_screenshotsViewController = v3;

  -[SSSScreenshotsViewController setDelegate:](v2->_screenshotsViewController, "setDelegate:", v2);
  v5 = objc_alloc_init(SSSScreenshotGroupImageIdentifierUpdateTracker);
  groupImageIdentifierUpdateTracker = v2->_groupImageIdentifierUpdateTracker;
  v2->_groupImageIdentifierUpdateTracker = v5;

  -[SSSScreenshotGroupImageIdentifierUpdateTracker setDelegate:](v2->_groupImageIdentifierUpdateTracker, "setDelegate:", v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSSScreenshotManager sharedScreenshotManager](SSSScreenshotManager, "sharedScreenshotManager"));
  objc_msgSend(v7, "addImageIdentifierUpdateObserver:", v2->_groupImageIdentifierUpdateTracker);

  v8 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v2, "_pileTapped");
  pileTapGesture = v2->_pileTapGesture;
  v2->_pileTapGesture = v8;

  -[UITapGestureRecognizer setAllowedTouchTypes:](v2->_pileTapGesture, "setAllowedTouchTypes:", &off_100095E08);
  v10 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v2, "_pilePencilTapped");
  pilePencilTapGesture = v2->_pilePencilTapGesture;
  v2->_pilePencilTapGesture = v10;

  -[UITapGestureRecognizer setAllowedTouchTypes:](v2->_pilePencilTapGesture, "setAllowedTouchTypes:", &off_100095E20);
  v12 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc((Class)UIPanGestureRecognizer), "initWithTarget:action:", v2, "_handlePilePanGesture:");
  pileFlingGesture = v2->_pileFlingGesture;
  v2->_pileFlingGesture = v12;

  v14 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", v2, "_handlePileLongPress:");
  pileLongPressGesture = v2->_pileLongPressGesture;
  v2->_pileLongPressGesture = v14;

  -[UILongPressGestureRecognizer setDelegate:](v2->_pileLongPressGesture, "setDelegate:", v2);
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSSScreenshotManager sharedScreenshotManager](SSSScreenshotManager, "sharedScreenshotManager"));
  objc_msgSend(v3, "removeImageIdentifierUpdateObserver:", self->_groupImageIdentifierUpdateTracker);

  v4.receiver = self;
  v4.super_class = (Class)SSSContainerViewController;
  -[SSSContainerViewController dealloc](&v4, "dealloc");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_screenshotGestureTriggered:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "environmentDescription"));
  v5 = objc_msgSend(v4, "presentationMode");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController visibleScreenshots](self->_screenshotsViewController, "visibleScreenshots"));
  v7 = objc_msgSend(v6, "count");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager"));
  v9 = v8;
  if (v7)
    objc_msgSend(v8, "screenshotGestureTriggeredWhileAnotherScreenshotWasShowing:", v5);
  else
    objc_msgSend(v8, "screenshotGestureTriggered:", v5);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSSContainerViewController;
  -[SSSContainerViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[SSSScreenshotsViewController removeChildViewControllers](self->_screenshotsViewController, "removeChildViewControllers");
}

- (void)_transitionToStateIfNecessaryFromEnvironmentDescription:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  unint64_t state;
  BOOL v13;
  uint64_t v14;
  id v15;
  BOOL v16;
  id v17;

  v17 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = sub_10002C0DC((uint64_t)objc_msgSend(v17, "presentationMode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController visibleScreenshots](self->_screenshotsViewController, "visibleScreenshots"));
  v9 = objc_msgSend(v8, "count");

  v10 = objc_msgSend(v17, "presentationMode");
  v11 = v10;
  state = self->_state;
  if (state)
  {
    if (v9)
      v13 = v10 == (id)2;
    else
      v13 = 1;
    LOBYTE(v14) = !v13;
  }
  else
  {
    v15 = objc_msgSend(v17, "presentationMode");
    if (v9)
      v16 = v11 == (id)2;
    else
      v16 = 1;
    v14 = !v16;
    if (v15 == (id)1)
    {
      -[SSSScreenshotsViewController setInitialAnnotationMode:](self->_screenshotsViewController, "setInitialAnnotationMode:", v11 == (id)2);
LABEL_20:
      -[SSSContainerViewController setState:animated:completion:](self, "setState:animated:completion:", v7, v14, v6);
      goto LABEL_23;
    }
    state = self->_state;
  }
  -[SSSScreenshotsViewController setInitialAnnotationMode:](self->_screenshotsViewController, "setInitialAnnotationMode:", v11 == (id)2);
  if (state != v7 && (v14 & 1) == 0)
  {
    v14 = 0;
    goto LABEL_20;
  }
  if (v6)
    v6[2](v6);
LABEL_23:

}

- (void)_positionAppearingScreenshot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  unsigned int v26;
  SSSScreenshotView *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  _QWORD v35[4];
  id v36;
  SSSContainerViewController *v37;
  SSSScreenshotView *v38;
  _QWORD v39[5];
  SSSScreenshotView *v40;
  uint64_t v41;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSSSignificantEventController sharedSignificantEventController](SSSSignificantEventController, "sharedSignificantEventController"));
  objc_msgSend(v5, "screenshotAppearAnimationBeganForScreenshot:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController view](self->_screenshotsViewController, "view"));
  objc_msgSend(v6, "layoutIfNeeded");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController view](self, "view"));
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController screenshotsParentCoordinateSpace](self->_screenshotsViewController, "screenshotsParentCoordinateSpace"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController view](self, "view"));
  objc_msgSend(v16, "convertRect:fromCoordinateSpace:", v17, v9, v11, v13, v15);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v26 = -[SSSContainerViewController _isTriggeredByInteractiveScreenshotGesture:](self, "_isTriggeredByInteractiveScreenshotGesture:", v4);
  v27 = -[SSSScreenshotView initWithFrame:]([SSSScreenshotView alloc], "initWithFrame:", v19, v21, v23, v25);
  -[SSSScreenshotView setScreenshot:](v27, "setScreenshot:", v4);
  -[SSSScreenshotView setUseTrilinearMinificationFilter:](v27, "setUseTrilinearMinificationFilter:", 1);
  -[SSSScreenshotView setBorderStyle:](v27, "setBorderStyle:", sub_1000491EC(-[SSSContainerViewController state](self, "state"), 0));
  -[SSSScreenshotView setUsesOriginalImageAspectRatio:](v27, "setUsesOriginalImageAspectRatio:", sub_100049204(-[SSSContainerViewController state](self, "state")));
  if ((id)-[SSSContainerViewController state](self, "state") == (id)1)
  {
    -[SSSScreenshotView prepareForFullscreenExperience](v27, "prepareForFullscreenExperience");
    -[SSSScreenshotView finishPreparingForFullscreenExperience](v27, "finishPreparingForFullscreenExperience");
  }
  else
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController traitCollection](self, "traitCollection"));
    -[SSSScreenshotView setGeometryMultiplier:](v27, "setGeometryMultiplier:", 1.0 / sub_100010068());

  }
  -[SSSScreenshotView layoutIfNeeded](v27, "layoutIfNeeded");
  -[SSSScreenshotView setState:](v27, "setState:", -[SSSContainerViewController state](self, "state"));
  -[SSSScreenshotsViewController parentScreenshotView:animated:](self->_screenshotsViewController, "parentScreenshotView:animated:", v27, v26 ^ 1);
  v29 = -[SSSScreenshotView shouldFlash](v27, "shouldFlash");
  if (v29)
    -[SSSScreenshotView flash](v27, "flash");
  if (v26)
  {
    -[SSSScreenshotView layoutIfNeeded](v27, "layoutIfNeeded");
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController view](self->_screenshotsViewController, "view"));
    objc_msgSend(v30, "layoutIfNeeded");

    -[SSSScreenshotsViewController setContentSwitcherAlpha:](self->_screenshotsViewController, "setContentSwitcherAlpha:", 0.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[SSSSignificantEventController sharedSignificantEventController](SSSSignificantEventController, "sharedSignificantEventController"));
    objc_msgSend(v31, "screenshotAppearAnimationEndedForScreenshot:userInterface:", v4, self);

    -[SSSContainerViewController _prepareDragInteractionIfNecessary](self, "_prepareDragInteractionIfNecessary");
  }
  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[SSSSpringAnimationParameters scaleAnimationParameters](SSSSpringAnimationParameters, "scaleAnimationParameters"));
    v33 = v32;
    v34 = 0.0;
    if (v29)
      v34 = 0.25;
    objc_msgSend(v32, "setDelay:", v34);
    objc_msgSend(v33, "setAnimationReason:", 1);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000211E0;
    v39[3] = &unk_100091F88;
    v39[4] = self;
    v41 = 0x3FF0000000000000;
    v40 = v27;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100021240;
    v35[3] = &unk_100091FB0;
    v36 = v4;
    v37 = self;
    v38 = v40;
    +[UIView sss_animateWithAnimationParameters:animations:completion:](UIView, "sss_animateWithAnimationParameters:animations:completion:", v33, v39, v35);

  }
}

- (BOOL)_isTriggeredByInteractiveScreenshotGesture:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "environmentDescription"));
  v4 = objc_msgSend(v3, "presentationMode") == (id)2;

  return v4;
}

- (void)addScreenshot:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[SSSContainerViewController _screenshotGestureTriggered:](self, "_screenshotGestureTriggered:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSSScreenshotManager sharedScreenshotManager](SSSScreenshotManager, "sharedScreenshotManager"));
  objc_msgSend(v8, "userInterfaceBecameInterestedInScreenshot:", v6);

  -[SSSScreenshotGroupImageIdentifierUpdateTracker addScreenshotToGroup:](self->_groupImageIdentifierUpdateTracker, "addScreenshotToGroup:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "environmentDescription"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000213F4;
  v12[3] = &unk_100091FD8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[SSSContainerViewController _transitionToStateIfNecessaryFromEnvironmentDescription:completion:](self, "_transitionToStateIfNecessaryFromEnvironmentDescription:completion:", v9, v12);

}

- (void)performInteractiveGesturePresentationCompleteAnimations
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSSSpringAnimationParameters scaleAnimationParameters](SSSSpringAnimationParameters, "scaleAnimationParameters"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000214B8;
  v4[3] = &unk_100091920;
  v4[4] = self;
  +[UIView sss_animateWithAnimationParameters:animations:completion:](UIView, "sss_animateWithAnimationParameters:animations:completion:", v3, v4, 0);

}

- (void)_prepareImageIdentifierUpdateAlertIfNecessary
{
  SSSWaitingForImageIdentifierUpdatesAlertController *v3;
  SSSWaitingForImageIdentifierUpdatesAlertController *imageIdentifierUpdateAlert;

  v3 = +[SSSWaitingForImageIdentifierUpdatesAlertController newWaitingForImageIdentifierUpdatesAlertController](SSSWaitingForImageIdentifierUpdatesAlertController, "newWaitingForImageIdentifierUpdatesAlertController");
  imageIdentifierUpdateAlert = self->_imageIdentifierUpdateAlert;
  self->_imageIdentifierUpdateAlert = v3;

  -[SSSWaitingForImageIdentifierUpdatesAlertController setDelegate:](self->_imageIdentifierUpdateAlert, "setDelegate:", self);
  -[SSSContainerViewController _updateDisplayedProgressTowardsReceivingAllImageIdentifierUpdates](self, "_updateDisplayedProgressTowardsReceivingAllImageIdentifierUpdates");
}

- (void)waitingForImageIdentifierUpdatesAlertControllerDidCancel:(id)a3
{
  SSSWaitingForImageIdentifierUpdatesAlertController *imageIdentifierUpdateAlert;
  id v5;

  -[SSSScreenshotsViewController dismissActivityViewController](self->_screenshotsViewController, "dismissActivityViewController", a3);
  imageIdentifierUpdateAlert = self->_imageIdentifierUpdateAlert;
  self->_imageIdentifierUpdateAlert = 0;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController delegate](self, "delegate"));
  objc_msgSend(v5, "containerViewControllerEndedShowingWaitingForImageIdentifierUpdatesUI:", self);

}

- (void)_presentImageIdentifierUpdateAlertIfNecessary
{
  id v3;

  -[SSSContainerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_imageIdentifierUpdateAlert, 1, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController delegate](self, "delegate"));
  objc_msgSend(v3, "containerViewControllerBeganShowingWaitingForImageIdentifierUpdatesUI:", self);

}

- (void)_updateDisplayedProgressTowardsReceivingAllImageIdentifierUpdates
{
  -[SSSScreenshotGroupImageIdentifierUpdateTracker progressTowardsReceivingAllImageIdentifierUpdates](self->_groupImageIdentifierUpdateTracker, "progressTowardsReceivingAllImageIdentifierUpdates");
  -[SSSWaitingForImageIdentifierUpdatesAlertController setProgress:](self->_imageIdentifierUpdateAlert, "setProgress:");
}

- (void)groupImageIdentifierUpdateTrackerChangedProgressTowardsReceivingAllImageIdentifierUpdates:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  SSSWaitingForImageIdentifierUpdatesAlertController *imageIdentifierUpdateAlert;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_msgSend(v4, "progressTowardsReceivingAllImageIdentifierUpdates");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSSWaitingForImageIdentifierUpdatesAlertController presentingViewController](self->_imageIdentifierUpdateAlert, "presentingViewController"));

  if (v7)
  {
    -[SSSContainerViewController _updateDisplayedProgressTowardsReceivingAllImageIdentifierUpdates](self, "_updateDisplayedProgressTowardsReceivingAllImageIdentifierUpdates");
    if (v6 == 1.0)
    {
      imageIdentifierUpdateAlert = self->_imageIdentifierUpdateAlert;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1000216E0;
      v9[3] = &unk_100091B98;
      v9[4] = self;
      v10 = v4;
      -[SSSWaitingForImageIdentifierUpdatesAlertController dismissViewControllerAnimated:completion:](imageIdentifierUpdateAlert, "dismissViewControllerAnimated:completion:", 1, v9);

    }
  }

}

- (void)groupImageIdentifierUpdateTrackerDidReceiveNewScreenshotIdentifier:(id)a3
{
  -[SSSContainerViewController _donateScreenshotUserActivityForSiri:](self, "_donateScreenshotUserActivityForSiri:", a3);
  -[SSSContainerViewController _notifyScreenshotForBiome](self, "_notifyScreenshotForBiome");
}

- (void)_performPreDismissActionsForAnimationSettings:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController visibleScreenshots](self->_screenshotsViewController, "visibleScreenshots", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSSScreenshotManager sharedScreenshotManager](SSSScreenshotManager, "sharedScreenshotManager"));
        objc_msgSend(v11, "userInterfaceWillStopBeingInterestedInScreenshot:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController delegate](self, "delegate"));
  objc_msgSend(v12, "containerViewController:willBeginDismissAnimationWithSettings:", self, v4);

}

- (void)_performPostDismissActions
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController visibleScreenshots](self->_screenshotsViewController, "visibleScreenshots", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSSScreenshotManager sharedScreenshotManager](SSSScreenshotManager, "sharedScreenshotManager"));
        objc_msgSend(v9, "userInterfaceStoppedBeingInterestedInScreenshot:", v8);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController delegate](self, "delegate"));
  objc_msgSend(v10, "containerViewControllerDidEndDismissAnimation:", self);

  -[SSSScreenshotsViewController removeChildViewControllers](self->_screenshotsViewController, "removeChildViewControllers");
}

- (double)_amountToMoveScreenshotsViewWithFrameForHorizontalSlideOffDismiss:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double Center;
  double MaxX;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  __int128 v21;
  double v22;
  CGRect v23;
  CGRect v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  Center = UIRectGetCenter(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  MaxX = CGRectGetMaxX(v23);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  v10 = MaxX - CGRectGetMinX(v24);
  v22 = 0.0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController traitCollection](self, "traitCollection", 0, 0, 0, 0));
  sub_10000FFDC(v11, (uint64_t)&v21);

  -[SSSContainerViewController _miniatureInsets](self, "_miniatureInsets");
  v13 = v10 + v12 * 2.0 + v22 * 6.0;
  v14 = v13 + +[SSSShadowView shadowRadius]_0() * 2.0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController view](self, "view"));
  v16 = objc_msgSend(v15, "effectiveUserInterfaceLayoutDirection");

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController view](self, "view"));
    objc_msgSend(v17, "bounds");
    v19 = v18 + v14 * 0.5;

  }
  else
  {
    v19 = v14 * -0.5;
  }
  return v19 - Center;
}

- (double)_amountToMoveScreenshotsViewForHorizontalSlideOffDismiss
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController view](self->_screenshotsViewController, "view"));
  objc_msgSend(v3, "frame");
  -[SSSContainerViewController _amountToMoveScreenshotsViewWithFrameForHorizontalSlideOffDismiss:](self, "_amountToMoveScreenshotsViewWithFrameForHorizontalSlideOffDismiss:");
  v5 = v4;

  return v5;
}

- (void)_moveScreenshotsViewForHorizontalSlideOffDismiss
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController view](self->_screenshotsViewController, "view"));
  objc_msgSend(v8, "center");
  v4 = v3;
  v6 = v5;
  -[SSSContainerViewController _amountToMoveScreenshotsViewForHorizontalSlideOffDismiss](self, "_amountToMoveScreenshotsViewForHorizontalSlideOffDismiss");
  objc_msgSend(v8, "setCenter:", v4 + v7, v6);

}

- (double)_durationForMinimize
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SSSSpringAnimationParameters scaleAnimationParameters](SSSSpringAnimationParameters, "scaleAnimationParameters"));
  objc_msgSend(v2, "duration");
  v4 = v3;

  return v4;
}

- (double)_durationForHorizontalSlideOffDismiss
{
  return 0.39;
}

- (void)dismissScreenshotsAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  _QWORD v15[4];
  _QWORD *v16;
  _QWORD v17[5];
  id v18;
  BOOL v19;
  BOOL v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a3;
  v6 = a4;
  v7 = -[SSSContainerViewController state](self, "state");
  -[SSSContainerViewController _durationForHorizontalSlideOffDismiss](self, "_durationForHorizontalSlideOffDismiss");
  v9 = v8;
  if (v7)
    -[SSSContainerViewController _durationForMinimize](self, "_durationForMinimize");
  else
    v10 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100021DDC;
  v21[3] = &unk_100092028;
  v21[4] = self;
  v23 = v9;
  v24 = v10;
  v11 = v6;
  v22 = v11;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100022018;
  v17[3] = &unk_100092050;
  v19 = v4;
  v17[4] = self;
  v20 = v7 == 0;
  v12 = objc_retainBlock(v21);
  v18 = v12;
  v13 = objc_retainBlock(v17);
  v14 = v13;
  if (v4)
  {
    ((void (*)(_QWORD *))v13[2])(v13);
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000220AC;
    v15[3] = &unk_100092078;
    v16 = v13;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v15);

  }
}

- (void)_dismissScreenshotsWithVelocity:(double)a3
{
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat y;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double x;
  double v16;
  double width;
  double height;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  _QWORD v38[5];
  _QWORD v39[5];
  CGAffineTransform v40;
  CGAffineTransform v41;
  CGRect v42;
  CGRect v43;

  -[SSSContainerViewController _amountToMoveScreenshotsViewForHorizontalSlideOffDismiss](self, "_amountToMoveScreenshotsViewForHorizontalSlideOffDismiss");
  v6 = v5;
  v7 = a3 / fabs(v5);
  -[SSSContainerViewController _scaleAmountForState:](self, "_scaleAmountForState:", 0);
  memset(&v41, 0, sizeof(v41));
  CGAffineTransformMakeScale(&v41, v8, v8);
  y = CGRectZero.origin.y;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController view](self->_screenshotsViewController, "view"));
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;

  v40 = v41;
  v42.origin.x = CGRectZero.origin.x;
  v42.origin.y = y;
  v42.size.width = v12;
  v42.size.height = v14;
  v43 = CGRectApplyAffineTransform(v42, &v40);
  x = v43.origin.x;
  v16 = v43.origin.y;
  width = v43.size.width;
  height = v43.size.height;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController view](self, "view"));
  objc_msgSend(v19, "bounds");
  v24 = UIRectCenteredIntegralRect(x, v16, width, height, v20, v21, v22, v23);
  v26 = v25;
  v28 = v27;
  v30 = v29;

  -[SSSContainerViewController _translationAmountForState:pileTranslation:](self, "_translationAmountForState:pileTranslation:", 0, CGPointZero.x, CGPointZero.y);
  -[SSSContainerViewController _amountToMoveScreenshotsViewWithFrameForHorizontalSlideOffDismiss:](self, "_amountToMoveScreenshotsViewWithFrameForHorizontalSlideOffDismiss:", v24 + v31, v26 + v32, v28, v30);
  v34 = fabs(v6 / v33);
  -[SSSContainerViewController _durationForHorizontalSlideOffDismiss](self, "_durationForHorizontalSlideOffDismiss");
  v36 = v35 * v34;
  v37 = objc_alloc_init((Class)BSMutableSpringAnimationSettings);
  objc_msgSend(v37, "setInitialVelocity:", v7);
  objc_msgSend(v37, "setDamping:", 1.0);
  -[SSSContainerViewController _performPreDismissActionsForAnimationSettings:](self, "_performPreDismissActionsForAnimationSettings:", v37);
  v38[4] = self;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000222D8;
  v39[3] = &unk_100091920;
  v39[4] = self;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000222E0;
  v38[3] = &unk_1000919B0;
  +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 6, v39, v38, v36, 0.0, 1.0, v7);

}

- (void)_dismissScreenshotsWithSlide
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSSpringAnimationSettings settingsWithMass:stiffness:damping:](BSSpringAnimationSettings, "settingsWithMass:stiffness:damping:", 2.0, 300.0, 400.0));
  -[SSSContainerViewController _performPreDismissActionsForAnimationSettings:](self, "_performPreDismissActionsForAnimationSettings:", v3);

  v4 = objc_msgSend(objc_alloc((Class)UISpringTimingParameters), "initWithMass:stiffness:damping:initialVelocity:", 2.0, 300.0, 400.0, 0.0, 0.0);
  v5 = objc_msgSend(objc_alloc((Class)UIViewPropertyAnimator), "initWithDuration:timingParameters:", v4, 0.91);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100022418;
  v7[3] = &unk_100091920;
  v7[4] = self;
  objc_msgSend(v5, "addAnimations:", v7);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100022474;
  v6[3] = &unk_1000920A0;
  v6[4] = self;
  objc_msgSend(v5, "addCompletion:", v6);
  objc_msgSend(v5, "startAnimation");

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  objc_super v17;
  _BYTE v18[128];

  v17.receiver = self;
  v17.super_class = (Class)SSSContainerViewController;
  -[SSSContainerViewController viewDidLoad](&v17, "viewDidLoad");
  -[SSSContainerViewController addChildViewController:](self, "addChildViewController:", self->_screenshotsViewController);
  -[SSSScreenshotsViewController didMoveToParentViewController:](self->_screenshotsViewController, "didMoveToParentViewController:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController view](self->_screenshotsViewController, "view"));
  objc_msgSend(v3, "addSubview:", v4);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100022644;
  v16[3] = &unk_100091920;
  v16[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v16);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController _gesturesForMiniatureState](self, "_gesturesForMiniatureState", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController view](self, "view"));
        objc_msgSend(v11, "addGestureRecognizer:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v7);
  }

  -[SSSContainerViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  BOOL v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  objc_super v10;
  CGRect v11;

  v10.receiver = self;
  v10.super_class = (Class)SSSContainerViewController;
  -[SSSContainerViewController viewDidLayoutSubviews](&v10, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v4 = CGRectEqualToRect(v11, self->_cachedViewBounds);

  if (!v4)
  {
    -[SSSContainerViewController _updateForCurrentSize](self, "_updateForCurrentSize");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController view](self, "view"));
    objc_msgSend(v5, "bounds");
    self->_cachedViewBounds.origin.x = v6;
    self->_cachedViewBounds.origin.y = v7;
    self->_cachedViewBounds.size.width = v8;
    self->_cachedViewBounds.size.height = v9;

    -[SSSContainerViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  }
}

- (unint64_t)_animationOptions
{
  return 6;
}

- (void)setState:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  unint64_t state;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  unint64_t v14;
  BOOL v15;

  v5 = a4;
  v8 = a5;
  state = self->_state;
  if (state != a3)
  {
    self->_lastState = state;
    self->_state = a3;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController delegate](self, "delegate"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100022828;
  v12[3] = &unk_100092140;
  v13 = v8;
  v14 = a3;
  v15 = v5;
  v12[4] = self;
  v11 = v8;
  objc_msgSend(v10, "containerViewController:willTransitionToState:animated:changeBlock:", self, a3, v5, v12);

}

- (void)commitInflightEditsIfNecessary
{
  -[SSSScreenshotsViewController commitInflightEditsIfNecessary](self->_screenshotsViewController, "commitInflightEditsIfNecessary");
}

- (void)setState:(unint64_t)a3
{
  -[SSSContainerViewController setState:animated:completion:](self, "setState:animated:completion:", a3, 1, 0);
}

- (void)_pileTapped
{
  -[SSSContainerViewController setState:](self, "setState:", 1);
}

- (void)_pilePencilTapped
{
  -[SSSScreenshotsViewController setInitialAnnotationMode:](self->_screenshotsViewController, "setInitialAnnotationMode:", 1);
  -[SSSContainerViewController setState:](self, "setState:", 1);
}

- (BOOL)_pileTranslationIsTowardsEdge
{
  void *v3;
  id v4;
  double x;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController view](self, "view"));
  v4 = objc_msgSend(v3, "effectiveUserInterfaceLayoutDirection");

  x = self->_pileTranslation.x;
  if (v4)
    return x > 0.0;
  else
    return x < 0.0;
}

- (void)removeDescendantViewControllers
{
  -[SSSScreenshotsViewController removeChildViewControllers](self->_screenshotsViewController, "removeChildViewControllers");
}

- (double)_pileTranslationAmountForDismiss
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  -[SSSScreenshotsViewController screenshotsExtentRect](self->_screenshotsViewController, "screenshotsExtentRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController view](self->_screenshotsViewController, "view"));
  objc_msgSend(v11, "convertRect:fromView:", v12, v4, v6, v8, v10);
  v14 = v13;

  return v14 * 0.25;
}

- (void)_handlePilePanGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  CGPoint *p_pileTranslation;
  double v14;
  double v15;
  void *v16;
  _QWORD v17[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController view](self, "view"));
  objc_msgSend(v4, "translationInView:", v5);
  v7 = v6;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController view](self, "view"));
  objc_msgSend(v4, "velocityInView:", v10);
  v12 = v11;

  if (objc_msgSend(v4, "state") == (id)2)
  {
    self->_pileTranslation.x = v7;
    self->_pileTranslation.y = v9 * 0.05;
    if (!-[SSSContainerViewController _pileTranslationIsTowardsEdge](self, "_pileTranslationIsTowardsEdge"))
      self->_pileTranslation.x = v7 * 0.1;
    goto LABEL_10;
  }
  if (objc_msgSend(v4, "state") != (id)3 && objc_msgSend(v4, "state") != (id)4 && objc_msgSend(v4, "state") != (id)5)
  {
LABEL_10:
    -[SSSContainerViewController _updateForCurrentSize](self, "_updateForCurrentSize");
    goto LABEL_11;
  }
  p_pileTranslation = &self->_pileTranslation;
  if (-[SSSContainerViewController _pileTranslationIsTowardsEdge](self, "_pileTranslationIsTowardsEdge")
    && (v14 = fabs(p_pileTranslation->x),
        -[SSSContainerViewController _pileTranslationAmountForDismiss](self, "_pileTranslationAmountForDismiss"),
        v14 > v15))
  {
    -[SSSContainerViewController _dismissScreenshotsWithVelocity:](self, "_dismissScreenshotsWithVelocity:", fabs(v12));
  }
  else
  {
    *p_pileTranslation = CGPointZero;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100023054;
    v17[3] = &unk_100091920;
    v17[4] = self;
    +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:](UIView, "_animateUsingDefaultTimingWithOptions:animations:completion:", 2054, v17, 0);
  }
LABEL_11:
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController delegate](self, "delegate"));
  objc_msgSend(v16, "containerViewControllerHadGestureInteraction:", self);

}

- (BOOL)_shouldAllowSharing
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  unsigned int v20;
  NSObject *v21;
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t v24[16];
  uint8_t buf[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController currentScreenshot](self->_screenshotsViewController, "currentScreenshot"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "environmentDescription"));
  v4 = objc_msgSend(v3, "hasOnenessScreen");

  if ((v4 & 1) != 0)
    return 0;
  v9 = _SSSignpostLog(v5, v6, v7);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Z_MKBGetDeviceLockState", (const char *)&unk_10008BF43, buf, 2u);
  }

  v11 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "BEGIN \"Z_MKBGetDeviceLockState\", v24, 2u);
  }

  v12 = MKBGetDeviceLockState(0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance"));
  v14 = objc_msgSend(v13, "isLostModeActive");

  v18 = _SSSignpostLog(v15, v16, v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_signpost_enabled(v19))
  {
    *(_WORD *)v23 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Z_MKBGetDeviceLockState", (const char *)&unk_10008BF43, v23, 2u);
  }
  v20 = v12 - 3;

  v21 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "END \"Z_MKBGetDeviceLockState\", v22, 2u);
  }

  if (v20 < 0xFFFFFFFE)
    return v14 ^ 1;
  else
    return 0;
}

- (void)_prepareGesturesForState:(unint64_t)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController _gesturesForMiniatureState](self, "_gesturesForMiniatureState", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "setEnabled:", a3 == 0);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[SSSContainerViewController _updateDragInteraction](self, "_updateDragInteraction");
}

- (id)_gesturesForMiniatureState
{
  UITapGestureRecognizer *pilePencilTapGesture;
  UILongPressGestureRecognizer *pileLongPressGesture;
  _QWORD v5[4];

  pilePencilTapGesture = self->_pilePencilTapGesture;
  v5[0] = self->_pileTapGesture;
  v5[1] = pilePencilTapGesture;
  pileLongPressGesture = self->_pileLongPressGesture;
  v5[2] = self->_pileFlingGesture;
  v5[3] = pileLongPressGesture;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 4));
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (self->_pileLongPressGesture == a3)
    return -[SSSContainerViewController _shouldAllowSharing](self, "_shouldAllowSharing");
  else
    return 1;
}

- (void)_handlePileLongPress:(id)a3
{
  void *v4;
  _QWORD v5[5];

  if (objc_msgSend(a3, "state") == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController delegate](self, "delegate"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100023488;
    v5[3] = &unk_100091920;
    v5[4] = self;
    objc_msgSend(v4, "containerViewController:willShowSharingUIWithBlock:", self, v5);

  }
}

- (void)dismissRequestedFromScreenshotsViewController:(id)a3 completion:(id)a4
{
  -[SSSContainerViewController dismissScreenshotsAnimated:completion:](self, "dismissScreenshotsAnimated:completion:", 1, a4);
}

- (void)screenshotsViewController:(id)a3 requestsCopyDeleteForScreenshots:(id)a4 deleteOptions:(unint64_t)a5 forReason:(unint64_t)a6
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v24[4];
  id v25;
  SSSContainerViewController *v26;
  id v27;
  id v28;
  unint64_t v29;
  unint64_t v30;
  _QWORD block[5];
  id v32;
  NSObject *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  v20 = a3;
  v7 = a4;
  v8 = dispatch_queue_create("com.apple.screenshotservices.screenshotItemProviderProcessingQueue", 0);
  v9 = dispatch_group_create();
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v7, "count")));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v35;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v15);
        dispatch_group_enter(v9);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000236FC;
        block[3] = &unk_100092168;
        block[4] = v16;
        v32 = v10;
        v33 = v9;
        dispatch_async(v8, block);

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v13);
  }

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000237D8;
  v24[3] = &unk_100092190;
  v25 = v10;
  v26 = self;
  v27 = v20;
  v28 = v11;
  v29 = a5;
  v30 = a6;
  v17 = v11;
  v18 = v20;
  v19 = v10;
  dispatch_group_notify(v9, (dispatch_queue_t)&_dispatch_main_q, v24);

}

- (void)screenshotsViewController:(id)a3 requestsDeleteForScreenshots:(id)a4 deleteOptions:(unint64_t)a5 forReason:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;
  unint64_t v21;
  _QWORD v22[6];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v9 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSSScreenshotManager sharedScreenshotManager](SSSScreenshotManager, "sharedScreenshotManager"));
        objc_msgSend(v15, "removeScreenshot:deleteOptions:", v14, a5);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000239FC;
  v22[3] = &unk_1000919E0;
  v22[4] = self;
  v22[5] = a6;
  v16 = objc_retainBlock(v22);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100023A68;
  v19[3] = &unk_100091F88;
  v20 = v9;
  v21 = a6;
  v19[4] = self;
  v17 = v9;
  v18 = objc_retainBlock(v19);
  -[SSSScreenshotsViewController removeScreenshots:forReason:alongsideAnimations:completion:](self->_screenshotsViewController, "removeScreenshots:forReason:alongsideAnimations:completion:", v17, a6, v16, v18);

}

- (void)_stopBeingInterestedInScreenshots:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSSScreenshotManager sharedScreenshotManager](SSSScreenshotManager, "sharedScreenshotManager"));
        objc_msgSend(v9, "userInterfaceStoppedBeingInterestedInScreenshot:", v8);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)screenshotsViewController:(id)a3 requestsPresentingActivityViewControllerWithBlock:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController delegate](self, "delegate"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100023CEC;
  v8[3] = &unk_100091960;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "containerViewController:willShowSharingUIWithBlock:", self, v8);

}

- (void)screenshotsViewController:(id)a3 requestsPresentingTestFlightFeedbackControllerWithBlock:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController delegate](self, "delegate"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100023E6C;
  v8[3] = &unk_100091960;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "containerViewController:willShowTestFlightUIWithBlock:", self, v8);

}

- (void)activityViewControllerDismissedFromScreenshotsViewController:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController delegate](self, "delegate", a3));
  objc_msgSend(v4, "containerViewControllerEndedShowingSharingUI:inStateTransition:", self, -[SSSScreenshotsViewController inStateTransition](self->_screenshotsViewController, "inStateTransition"));

}

- (BOOL)screenshotsViewControllerShouldAllowSharing:(id)a3
{
  return -[SSSContainerViewController _shouldAllowSharing](self, "_shouldAllowSharing", a3);
}

- (NSDirectionalEdgeInsets)_miniatureInsets
{
  void *v3;
  double v4;
  double v5;
  double v7;
  double v8;
  CGFloat trailing;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v22;
  void *v23;
  id v24;
  BOOL v25;
  double top;
  double v27;
  double v28;
  double v29;
  NSDirectionalEdgeInsets result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController traitCollection](self, "traitCollection"));
  objc_msgSend(v3, "displayCornerRadius");
  v5 = v4;

  if (v5 == 0.0 || v5 == _UITraitCollectionDisplayCornerRadiusUnspecified)
  {
    v8 = NSDirectionalEdgeInsetsZero.leading + 10.0;
    v7 = NSDirectionalEdgeInsetsZero.bottom + 10.0;
  }
  else
  {
    v7 = (sqrt(v5 * v5 + v5 * v5) - v5) * 1.42379596;
    v8 = v7;
  }
  trailing = NSDirectionalEdgeInsetsZero.trailing;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v10, "_peripheryInsets");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  if (v14 != UIEdgeInsetsZero.left
    || v12 != UIEdgeInsetsZero.top
    || v18 != UIEdgeInsetsZero.right
    || v16 != UIEdgeInsetsZero.bottom)
  {
    if ((v22 = -[SSSContainerViewController interfaceOrientation](self, "interfaceOrientation"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController view](self, "view")),
          v24 = objc_msgSend(v23, "effectiveUserInterfaceLayoutDirection"),
          v23,
          v22 == (id)3)
      && !v24
      || (v24 == (id)1 ? (v25 = v22 == (id)4) : (v25 = 0), v25))
    {
      v8 = v8 * 2.30434783;
    }
  }
  top = NSDirectionalEdgeInsetsZero.top;
  v27 = v8;
  v28 = v7;
  v29 = trailing;
  result.trailing = v29;
  result.bottom = v28;
  result.leading = v27;
  result.top = top;
  return result;
}

- (double)_scaleAmountForState:(unint64_t)a3
{
  void *v4;
  double v5;

  if (a3)
    return 1.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController traitCollection](self, "traitCollection"));
  v5 = sub_100010068();

  return v5;
}

- (CGVector)_translationAmountForState:(unint64_t)a3 pileTranslation:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGVector result;

  y = a4.y;
  x = a4.x;
  v6 = 0.0;
  v7 = 0.0;
  if (a3 != 1)
  {
    -[SSSContainerViewController _scaleAmountForState:](self, "_scaleAmountForState:", 0.0, 0.0);
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController view](self, "view"));
    if (objc_msgSend(v11, "effectiveUserInterfaceLayoutDirection"))
      v12 = 1.0;
    else
      v12 = -1.0;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController view](self, "view"));
    objc_msgSend(v13, "bounds");
    v15 = v14;
    v17 = v16;

    -[SSSContainerViewController _miniatureInsets](self, "_miniatureInsets");
    v6 = x + v12 * (v15 - v15 * v10) * 0.5 - v12 * v18;
    v7 = y + (v17 - v17 * v10) * 0.5 - v19;
  }
  result.dy = v7;
  result.dx = v6;
  return result;
}

- (CGAffineTransform)_transformForState:(SEL)a3 pileTranslation:(unint64_t)a4
{
  double y;
  double x;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  CGAffineTransform *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  __int128 v15;
  __int128 v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v22;

  y = a5.y;
  x = a5.x;
  v8 = *(_OWORD *)&CGAffineTransformIdentity.a;
  v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v9;
  v10 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&retstr->tx = v10;
  if (!a4)
  {
    v11 = self;
    *(_OWORD *)&v17.a = v8;
    *(_OWORD *)&v17.c = v9;
    *(_OWORD *)&v17.tx = v10;
    -[CGAffineTransform _scaleAmountForState:](self, "_scaleAmountForState:");
    memset(&v22, 0, sizeof(v22));
    CGAffineTransformMakeScale(&v22, v12, v12);
    t1 = v17;
    t2 = v22;
    CGAffineTransformConcat(retstr, &t1, &t2);
    -[CGAffineTransform _translationAmountForState:pileTranslation:](v11, "_translationAmountForState:pileTranslation:", 0, x, y);
    memset(&t1, 0, sizeof(t1));
    CGAffineTransformMakeTranslation(&t1, v13, v14);
    v15 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v19.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v19.c = v15;
    *(_OWORD *)&v19.tx = *(_OWORD *)&retstr->tx;
    v18 = t1;
    self = CGAffineTransformConcat(&t2, &v19, &v18);
    v16 = *(_OWORD *)&t2.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&t2.a;
    *(_OWORD *)&retstr->c = v16;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&t2.tx;
  }
  return self;
}

- (CGAffineTransform)_transformForState:(SEL)a3
{
  return -[SSSContainerViewController _transformForState:pileTranslation:](self, "_transformForState:pileTranslation:", a4, self->_pileTranslation.x, self->_pileTranslation.y);
}

- (void)_updateScreenshotsViewTransform
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
  double v13;
  double v14;
  uint64_t v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController view](self->_screenshotsViewController, "view"));
  -[SSSContainerViewController _transformForState:](self, "_transformForState:", -[SSSContainerViewController state](self, "state"));
  objc_msgSend(v3, "setTransform:", &v15);
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController traitCollection](self, "traitCollection"));
  objc_msgSend(v12, "displayScale");
  v14 = v13;

  objc_msgSend(v3, "setFrame:", SSRoundRectToScale(v5, v7, v9, v11, v14));
}

- (void)_updateForCurrentSize
{
  double v3;
  double v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  -[SSSContainerViewController _updateForSize:](self, "_updateForSize:", v3, v4);

}

- (void)_updateForSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  __int128 v7;
  _OWORD v8[3];

  height = a3.height;
  width = a3.width;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController view](self->_screenshotsViewController, "view"));
  v7 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v8[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v8[1] = v7;
  v8[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  objc_msgSend(v6, "setTransform:", v8);

  -[SSSScreenshotsViewController updateForFrame:](self->_screenshotsViewController, "updateForFrame:", CGRectZero.origin.x, CGRectZero.origin.y, width, height);
  -[SSSContainerViewController _updateScreenshotsViewTransform](self, "_updateScreenshotsViewTransform");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[7];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SSSContainerViewController;
  v7 = a4;
  -[SSSContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100024574;
  v8[3] = &unk_100091F38;
  v8[4] = self;
  *(double *)&v8[5] = width;
  *(double *)&v8[6] = height;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController parentViewController](self, "parentViewController"));
  v3 = objc_msgSend(v2, "supportedInterfaceOrientations");

  return (unint64_t)v3;
}

+ (BOOL)_shouldConfigureDragInteraction
{
  if (qword_1000AD758 != -1)
    dispatch_once(&qword_1000AD758, &stru_1000921B0);
  return byte_1000AD750;
}

- (void)_prepareDragInteractionIfNecessary
{
  double v3;
  id v4;
  UIDragInteraction *v5;
  UIDragInteraction *dragInteraction;

  if (!self->_dragInteraction)
  {
    *(_QWORD *)&v3 = objc_opt_class(self, a2).n128_u64[0];
    if (objc_msgSend(v4, "_shouldConfigureDragInteraction", v3))
    {
      v5 = (UIDragInteraction *)objc_msgSend(objc_alloc((Class)UIDragInteraction), "initWithDelegate:", self);
      dragInteraction = self->_dragInteraction;
      self->_dragInteraction = v5;

      -[UIDragInteraction _setLiftDelay:](self->_dragInteraction, "_setLiftDelay:", 0.2);
      -[UIDragInteraction _setAllowsPointerDragBeforeLiftDelay:](self->_dragInteraction, "_setAllowsPointerDragBeforeLiftDelay:", 0);
      -[SSSContainerViewController _updateDragInteraction](self, "_updateDragInteraction");
    }
  }
}

- (void)_updateDragInteraction
{
  unint64_t v3;
  UIDragInteraction *dragInteraction;
  id v5;

  if (self->_dragInteraction)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController view](self->_screenshotsViewController, "view"));
    v3 = -[SSSContainerViewController state](self, "state");
    dragInteraction = self->_dragInteraction;
    if (v3)
      objc_msgSend(v5, "removeInteraction:", dragInteraction);
    else
      objc_msgSend(v5, "addInteraction:", dragInteraction);

  }
}

- (void)_startDragging
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController delegate](self, "delegate"));
  objc_msgSend(v3, "containerViewControllerBeganDragAndDrop:", self);

}

- (void)_stopDraggingDismissing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController delegate](self, "delegate"));
  objc_msgSend(v5, "containerViewControllerEndedDragAndDrop:shouldDismiss:", self, v3);

  -[UILongPressGestureRecognizer setEnabled:](self->_pileLongPressGesture, "setEnabled:", 1);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController view](self->_screenshotsViewController, "view"));
  objc_msgSend(v6, "setAlpha:", 1.0);

}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  id v6;
  _QWORD v7[5];

  v6 = a4;
  -[SSSContainerViewController _startDragging](self, "_startDragging");
  -[SSSScreenshotsViewController setBorderViewStyleOverride:withAnimator:](self->_screenshotsViewController, "setBorderViewStyleOverride:withAnimator:", 2, v6);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002496C;
  v7[3] = &unk_1000920A0;
  v7[4] = self;
  objc_msgSend(v6, "addCompletion:", v7);

}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController view](self->_screenshotsViewController, "view"));
  objc_msgSend(v6, "setAlpha:", 0.0);

  -[SSSScreenshotsViewController dismissActivityViewController](self->_screenshotsViewController, "dismissActivityViewController");
  -[UILongPressGestureRecognizer setEnabled:](self->_pileLongPressGesture, "setEnabled:", 0);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "items", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSSScreenshotManager sharedScreenshotManager](SSSScreenshotManager, "sharedScreenshotManager"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController _screenshotForDragItem:](self, "_screenshotForDragItem:", v12));
        objc_msgSend(v13, "screenshotEnteredDragSession:", v14);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100024B8C;
  v5[3] = &unk_1000920A0;
  v5[4] = self;
  objc_msgSend(a5, "addCompletion:", v5, a4);
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  SSSScreenshotsViewController *screenshotsViewController;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  screenshotsViewController = self->_screenshotsViewController;
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController targetForCancellingDragItem:inContainer:](screenshotsViewController, "targetForCancellingDragItem:inContainer:", v9, v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "retargetedPreviewWithTarget:", v11));
  return v12;
}

- (id)_screenshotForDragItem:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "localObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "screenshot"));

  return v4;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  return -[SSSScreenshotsViewController dragItems](self->_screenshotsViewController, "dragItems", a3, a4);
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  SSSScreenshotsViewController *screenshotsViewController;
  id v7;
  void *v8;
  void *v9;

  screenshotsViewController = self->_screenshotsViewController;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController previewForDragItem:inContainer:](screenshotsViewController, "previewForDragItem:inContainer:", v7, v8));

  return v9;
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v18 = a3;
  v8 = a4;
  if (a5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager"));
    objc_msgSend(v9, "pipDragEndedSuccessfully");

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "items"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSSScreenshotManager sharedScreenshotManager](SSSScreenshotManager, "sharedScreenshotManager"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController _screenshotForDragItem:](self, "_screenshotForDragItem:", v15));
        objc_msgSend(v16, "screenshotLeftDragSession:", v17);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  -[SSSContainerViewController _stopDraggingDismissing:](self, "_stopDraggingDismissing:", a5 != 0);
}

- (void)dragInteraction:(id)a3 sessionDidTransferItems:(id)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "items", a3, 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSSScreenshotManager sharedScreenshotManager](SSSScreenshotManager, "sharedScreenshotManager"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController _screenshotForDragItem:](self, "_screenshotForDragItem:", v10));
        objc_msgSend(v11, "screenshotLeftDragSession:", v12);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSSContainerViewController;
  -[SSSContainerViewController didMoveToParentViewController:](&v5, "didMoveToParentViewController:");
  -[SSSContainerViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  if (!a3)
    -[SSSScreenshotsViewController removeChildViewControllers](self->_screenshotsViewController, "removeChildViewControllers");
}

- (int)_preferredStatusBarVisibility
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  unint64_t v9;
  void *v10;
  unsigned int v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController view](self, "view"));
  objc_msgSend(v6, "bounds");
  v8 = v7;

  v9 = -[SSSContainerViewController state](self, "state");
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSSContainerViewController traitCollection](self, "traitCollection"));
    v11 = +[SSChromeHelper statusBarVisibilityForTraitCollection:isPortrait:](SSChromeHelper, "statusBarVisibilityForTraitCollection:isPortrait:", v10, v5 < v8);

    LODWORD(v9) = v11;
  }
  return v9;
}

- (int64_t)preferredStatusBarStyle
{
  return (int64_t)+[SSChromeHelper statusBarStyle](SSChromeHelper, "statusBarStyle");
}

- (unint64_t)numberOfScreenshots
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScreenshotsViewController visibleScreenshots](self->_screenshotsViewController, "visibleScreenshots"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (void)_donateScreenshotUserActivityForSiri:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  const __CFString *v9;
  void *v10;

  if (a3)
  {
    v4 = a3;
    v5 = objc_msgSend(objc_alloc((Class)NSUserActivity), "_initWithUserActivityType:dynamicActivityType:options:", CFSTR("com.apple.screenshotservices.sirisharing"), 0, &off_100095E80);
    objc_msgSend(v5, "setTitle:", CFSTR("ScreenshotServices"));
    objc_msgSend(v5, "setEligibleForSearch:", 0);
    objc_msgSend(v5, "setEligibleForPrediction:", 0);
    objc_msgSend(v5, "setEligibleForHandoff:", 0);
    objc_msgSend(v5, "setEligibleForPublicIndexing:", 0);
    v8 = v4;
    v9 = CFSTR("selectedUUIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
    v10 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));

    objc_msgSend(v5, "setUserInfo:", v7);
    -[SSSContainerViewController setSiriActionActivity:](self, "setSiriActionActivity:", v5);
    objc_msgSend(v5, "becomeCurrent");

  }
}

- (void)_notifyScreenshotForBiome
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BMStreams discoverabilitySignal](BMStreams, "discoverabilitySignal"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "source"));
  v4 = objc_alloc((Class)BMDiscoverabilitySignalEvent);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
  v12[0] = v6;
  v12[1] = CFSTR("screenshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsJoinedByString:", CFSTR(".")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleIdentifier"));
  v11 = objc_msgSend(v4, "initWithIdentifier:bundleID:context:userInfo:", v8, v10, 0, 0);

  objc_msgSend(v3, "sendEvent:", v11);
}

- (SSSContainerViewControllerDelegate)delegate
{
  return (SSSContainerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (NSUserActivity)siriActionActivity
{
  return self->_siriActionActivity;
}

- (void)setSiriActionActivity:(id)a3
{
  objc_storeStrong((id *)&self->_siriActionActivity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriActionActivity, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_offscreenAnimator, 0);
  objc_storeStrong((id *)&self->_pileLongPressGesture, 0);
  objc_storeStrong((id *)&self->_pileFlingGesture, 0);
  objc_storeStrong((id *)&self->_pilePencilTapGesture, 0);
  objc_storeStrong((id *)&self->_pileTapGesture, 0);
  objc_storeStrong(&self->_pendingActivityViewControllerPresentationBlock, 0);
  objc_storeStrong((id *)&self->_imageIdentifierUpdateAlert, 0);
  objc_storeStrong((id *)&self->_groupImageIdentifierUpdateTracker, 0);
  objc_storeStrong((id *)&self->_screenshotsViewController, 0);
}

@end
