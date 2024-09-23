@implementation WFApertureStatusViewController

- (WFApertureStatusViewController)initWithRunningContext:(id)a3 attribution:(id)a4
{
  return -[WFApertureStatusViewController initWithRunningContext:attribution:progress:](self, "initWithRunningContext:attribution:progress:", a3, a4, 0);
}

- (WFApertureStatusViewController)initWithRunningContext:(id)a3 attribution:(id)a4 progress:(id)a5
{
  id v10;
  id v11;
  id v12;
  WFApertureStatusViewController *v13;
  WFApertureStatusViewController *v14;
  UILabel *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UILabel *titleLabel;
  UILabel *v21;
  dispatch_time_t v22;
  WFApertureStatusViewController *v23;
  WFApertureStatusViewController *v24;
  void *v26;
  void *v27;
  _QWORD block[4];
  WFApertureStatusViewController *v29;
  objc_super v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFApertureStatusViewController.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("runningContext"));

    if (v11)
      goto LABEL_3;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFApertureStatusViewController.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("attribution"));

LABEL_3:
  v30.receiver = self;
  v30.super_class = (Class)WFApertureStatusViewController;
  v13 = -[WFApertureStatusViewController initWithNibName:bundle:](&v30, "initWithNibName:bundle:", 0, 0);
  v14 = v13;
  if (v13)
  {
    v13->_overrideLayoutMode = 0;
    v13->_previousLayoutMode = 0;
    objc_storeStrong((id *)&v13->_attribution, a4);
    objc_storeStrong((id *)&v14->_runningContext, a3);
    v15 = (UILabel *)objc_alloc_init((Class)UILabel);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController titleFont](v14, "titleFont"));
    -[UILabel setFont:](v15, "setFont:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
    -[UILabel setText:](v15, "setText:", v17);

    -[UILabel setNumberOfLines:](v15, "setNumberOfLines:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    -[UILabel setTextColor:](v15, "setTextColor:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController view](v14, "view"));
    objc_msgSend(v19, "addSubview:", v15);

    titleLabel = v14->_titleLabel;
    v14->_titleLabel = v15;
    v21 = v15;

    -[WFApertureStatusViewController setAssociatedRunningContext:](v14, "setAssociatedRunningContext:", v10);
    -[WFApertureStatusViewController startCollapseTimerIfNecessary](v14, "startCollapseTimerIfNecessary");
    -[WFApertureStatusViewController setProgress:](v14, "setProgress:", v12);
    v14->_initialPresentationTransitioning = 1;
    v22 = dispatch_time(0, 600000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008E28;
    block[3] = &unk_1000105B0;
    v23 = v14;
    v29 = v23;
    dispatch_after(v22, (dispatch_queue_t)&_dispatch_main_q, block);
    v24 = v23;

  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[NSProgress removeObserver:forKeyPath:context:](self->_progress, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), off_100017130);
  v3.receiver = self;
  v3.super_class = (Class)WFApertureStatusViewController;
  -[WFApertureStatusViewController dealloc](&v3, "dealloc");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setCompletingSuccessfully:(BOOL)a3
{
  id v3;

  if (a3)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController progressView](self, "progressView"));
    objc_msgSend(v3, "updateProgressWithValue:", 1.0);

  }
}

- (id)titleFont
{
  return +[UIFont sbui_systemAperturePreferredFontForTextStyle:](UIFont, "sbui_systemAperturePreferredFontForTextStyle:", 0);
}

- (NSDictionary)postOptions
{
  uint64_t v3;
  void *v4;

  v3 = kSBUIPresentableSystemApertureSupportingUserInfoKey;
  v4 = &__kCFBooleanTrue;
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1));
}

- (WFApertureIconAccessoryView)iconView
{
  WFApertureIconAccessoryView *iconView;
  WFApertureIconAccessoryView *v4;
  void *v5;
  void *v6;
  void *v7;
  WFApertureIconAccessoryView *v8;
  WFApertureIconAccessoryView *v9;

  iconView = self->_iconView;
  if (!iconView)
  {
    v4 = [WFApertureIconAccessoryView alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController attribution](self, "attribution"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "icon"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController runningContext](self, "runningContext"));
    v8 = -[WFApertureIconAccessoryView initWithIcon:runningContext:](v4, "initWithIcon:runningContext:", v6, v7);
    v9 = self->_iconView;
    self->_iconView = v8;

    iconView = self->_iconView;
  }
  return iconView;
}

- (WFProgressAccessoryView)progressView
{
  WFProgressAccessoryView *progressView;
  WFProgressAccessoryView *v4;
  void *v5;
  void *v6;
  void *v7;
  WFProgressAccessoryView *v8;
  WFProgressAccessoryView *v9;

  progressView = self->_progressView;
  if (!progressView)
  {
    v4 = [WFProgressAccessoryView alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController iconView](self, "iconView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primaryColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController runningContext](self, "runningContext"));
    v8 = -[WFProgressAccessoryView initWithTintColor:runningContext:](v4, "initWithTintColor:runningContext:", v6, v7);
    v9 = self->_progressView;
    self->_progressView = v8;

    progressView = self->_progressView;
  }
  return progressView;
}

- (void)viewWillLayoutSubviews
{
  int64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  objc_super v36;
  CGRect v37;

  v36.receiver = self;
  v36.super_class = (Class)WFApertureStatusViewController;
  -[WFApertureStatusViewController viewWillLayoutSubviews](&v36, "viewWillLayoutSubviews");
  v3 = -[WFApertureStatusViewController activeLayoutMode](self, "activeLayoutMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "SBUISA_systemApertureObstructedAreaLayoutGuide"));
  objc_msgSend(v10, "layoutFrame");
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController trailingView](self, "trailingView"));
  v14 = v13;
  v15 = 50.0;
  if (v3 != 4)
    v15 = 24.0;
  v16 = (v8 - v15) * 0.5;
  if (v3 == 4)
  {
    objc_msgSend(v13, "setFrame:", v6 + -50.0 + -17.0, v16, 50.0, 50.0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController leadingView](self, "leadingView"));
    objc_msgSend(v17, "setFrame:", 17.0, v16, 50.0, 50.0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController leadingView](self, "leadingView"));
    objc_msgSend(v18, "frame");
    v19 = CGRectGetMaxX(v37) + 14.0;

    v20 = v12 + -4.0;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController titleLabel](self, "titleLabel"));
    objc_msgSend(v21, "intrinsicContentSize");
    v23 = v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController trailingView](self, "trailingView"));
    objc_msgSend(v24, "frame");
    v26 = v25 - v19 + -6.0;

    if (v23 >= v26)
      v23 = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController titleLabel](self, "titleLabel"));
    objc_msgSend(v27, "intrinsicContentSize");
    v29 = v28;

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController titleLabel](self, "titleLabel"));
    v31 = v30;
    v32 = v19;
    v35 = v20;
    v33 = v23;
    v34 = v29;
  }
  else
  {
    objc_msgSend(v13, "setFrame:", v6 + -7.0 + -24.0, v16, 24.0, 24.0);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController leadingView](self, "leadingView"));
    v31 = v30;
    v32 = 7.0;
    v33 = 24.0;
    v34 = 24.0;
    v35 = v16;
  }
  objc_msgSend(v30, "setFrame:", v32, v35, v33, v34);

}

- (void)setProgress:(id)a3
{
  NSProgress *v5;
  NSProgress *progress;
  NSProgress *v7;
  NSProgress *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  NSProgress *v13;

  v5 = (NSProgress *)a3;
  progress = self->_progress;
  if (progress != v5)
  {
    v7 = progress;
    v8 = v7;
    if (v7)
    {
      -[NSProgress removeObserver:forKeyPath:](v7, "removeObserver:forKeyPath:", self, CFSTR("fractionCompleted"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController progressView](self, "progressView"));
      objc_msgSend(v9, "setCancelAction:", 0);

    }
    objc_storeStrong((id *)&self->_progress, a3);
    if (v5)
    {
      -[NSProgress addObserver:forKeyPath:options:context:](v5, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 0, off_100017130);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController progressView](self, "progressView"));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100008E20;
      v12[3] = &unk_100010560;
      v13 = v5;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v12));
      objc_msgSend(v10, "setCancelAction:", v11);

    }
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD block[5];

  if (off_100017130 == a6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008DC8;
    block[3] = &unk_1000105B0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)startCollapseTimerIfNecessary
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController collapseTimer](self, "collapseTimer"));

  if (!v3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100008D60;
    v5[3] = &unk_100010588;
    v5[4] = self;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v5, 2.5));
    -[WFApertureStatusViewController setCollapseTimer:](self, "setCollapseTimer:", v4);

  }
}

- (void)setAttribution:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[WFApertureStatusViewController initialPresentationTransitioning](self, "initialPresentationTransitioning"))
  {
    -[WFApertureStatusViewController setPendingDelayedAttribution:](self, "setPendingDelayedAttribution:", v11);
  }
  else
  {
    objc_storeStrong((id *)&self->_attribution, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController iconView](self, "iconView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "icon"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "appBundleIdentifier"));
    objc_msgSend(v5, "setIcon:associatedAppBundleIdentifier:animated:", v6, v7, 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController progressView](self, "progressView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController iconView](self, "iconView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "primaryColor"));
    objc_msgSend(v8, "tintControlWithColor:animated:", v10, 1);

  }
}

- (int64_t)preferredLayoutModeForRunningContext:(id)a3
{
  return 3;
}

- (NSString)elementIdentifier
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController runningContext](self, "runningContext"));
  v4 = WFApertureStatusViewControllerIdentityFromRunningContext(v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return (NSString *)v5;
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  int64_t v22;
  void *v23;
  char v24;
  id v25;

  self->_previousLayoutMode = self->_activeLayoutMode;
  self->_activeLayoutMode = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController progressView](self, "progressView"));
  objc_msgSend(v5, "setActiveLayoutMode:", a3);

  if (a3 == 4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController view](self, "view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subviews"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController iconView](self, "iconView"));
    if ((objc_msgSend(v7, "containsObject:", v8) & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController view](self, "view"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subviews"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController progressView](self, "progressView"));
      v12 = objc_msgSend(v10, "containsObject:", v11);

      if ((v12 & 1) != 0)
        goto LABEL_7;
    }
    else
    {

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController view](self, "view"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController iconView](self, "iconView"));
    objc_msgSend(v13, "addSubview:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController view](self, "view"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController progressView](self, "progressView"));
    objc_msgSend(v15, "addSubview:", v16);

  }
LABEL_7:
  v17 = (id)-[WFApertureStatusViewController previousLayoutMode](self, "previousLayoutMode") == (id)3
     || (id)-[WFApertureStatusViewController previousLayoutMode](self, "previousLayoutMode") == (id)3
     || (id)-[WFApertureStatusViewController previousLayoutMode](self, "previousLayoutMode") == (id)2;
  if (a3 == 4 && v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController collapseTimer](self, "collapseTimer"));
    objc_msgSend(v18, "invalidate");

    -[WFApertureStatusViewController setCollapseTimer:](self, "setCollapseTimer:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController delegate](self, "delegate"));
    v20 = objc_opt_respondsToSelector(v19, "statusViewControllerDidTransitionFromVisibleToCustomLayout:");

    if ((v20 & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController delegate](self, "delegate"));
      objc_msgSend(v21, "statusViewControllerDidTransitionFromVisibleToCustomLayout:", self);

    }
  }
  v22 = -[WFApertureStatusViewController previousLayoutMode](self, "previousLayoutMode");
  if (a3 != 4 && v22 == 4)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController delegate](self, "delegate"));
    v24 = objc_opt_respondsToSelector(v23, "statusViewControllerDidCollapseFromCustomLayout:");

    if ((v24 & 1) != 0)
    {
      v25 = (id)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController delegate](self, "delegate"));
      objc_msgSend(v25, "statusViewControllerDidCollapseFromCustomLayout:", self);

    }
  }
}

- (int64_t)contentRole
{
  return 2;
}

- (int64_t)maximumLayoutMode
{
  return 4;
}

- (int64_t)preferredLayoutMode
{
  void *v4;
  int64_t v5;

  if (-[WFApertureStatusViewController overrideLayoutMode](self, "overrideLayoutMode"))
    return -[WFApertureStatusViewController overrideLayoutMode](self, "overrideLayoutMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController runningContext](self, "runningContext"));
  v5 = -[WFApertureStatusViewController preferredLayoutModeForRunningContext:](self, "preferredLayoutModeForRunningContext:", v4);

  return v5;
}

- (double)preferredHeightForBottomSafeArea
{
  return 47.0;
}

- (UIColor)keyColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController iconView](self, "iconView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "primaryColor"));

  return (UIColor *)v3;
}

- (NSString)associatedAppBundleIdentifier
{
  return (NSString *)VCBundleIdentifierShortcutsiOS;
}

- (NSString)associatedScenePersistenceIdentifier
{
  return 0;
}

- (unint64_t)presentationBehaviors
{
  return 24;
}

- (BOOL)providesHostedContent
{
  return 1;
}

- (NSString)requestIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController runningContext](self, "runningContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "requestIdentifierForContext:", v4));

  return (NSString *)v5;
}

- (int64_t)activeLayoutMode
{
  return self->_activeLayoutMode;
}

- (int64_t)minimumLayoutMode
{
  return self->_minimumLayoutMode;
}

- (NSNumberFormatter)percentageFormatter
{
  return self->_percentageFormatter;
}

- (WFWorkflowRunningContext)associatedRunningContext
{
  return self->_associatedRunningContext;
}

- (void)setAssociatedRunningContext:(id)a3
{
  objc_storeStrong((id *)&self->_associatedRunningContext, a3);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (WFApertureStatusViewControllerDelegate)delegate
{
  return (WFApertureStatusViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFWorkflowRunningContext)runningContext
{
  return self->_runningContext;
}

- (WFDialogAttribution)attribution
{
  return self->_attribution;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (NSTimer)collapseTimer
{
  return self->_collapseTimer;
}

- (void)setCollapseTimer:(id)a3
{
  objc_storeStrong((id *)&self->_collapseTimer, a3);
}

- (int64_t)previousLayoutMode
{
  return self->_previousLayoutMode;
}

- (void)setPreviousLayoutMode:(int64_t)a3
{
  self->_previousLayoutMode = a3;
}

- (int64_t)overrideLayoutMode
{
  return self->_overrideLayoutMode;
}

- (void)setOverrideLayoutMode:(int64_t)a3
{
  self->_overrideLayoutMode = a3;
}

- (BOOL)initialPresentationTransitioning
{
  return self->_initialPresentationTransitioning;
}

- (void)setInitialPresentationTransitioning:(BOOL)a3
{
  self->_initialPresentationTransitioning = a3;
}

- (WFDialogAttribution)pendingDelayedAttribution
{
  return self->_pendingDelayedAttribution;
}

- (void)setPendingDelayedAttribution:(id)a3
{
  objc_storeStrong((id *)&self->_pendingDelayedAttribution, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingDelayedAttribution, 0);
  objc_storeStrong((id *)&self->_collapseTimer, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_runningContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_associatedRunningContext, 0);
  objc_storeStrong((id *)&self->_percentageFormatter, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

+ (id)requestIdentifierForContext:(id)a3
{
  return (id)WFApertureStatusViewControllerIdentityFromRunningContext(a3, a2);
}

@end
