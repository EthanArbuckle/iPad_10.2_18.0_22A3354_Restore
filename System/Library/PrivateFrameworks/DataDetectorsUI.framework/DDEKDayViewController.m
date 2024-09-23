@implementation DDEKDayViewController

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 375.0;
  v3 = 375.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)dd_update_scroll
{
  void *v3;
  void *v4;
  id v5;

  if (-[DDEKDayViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[DDEKDayViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[DDEKDayViewController dd_event](self, "dd_event");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[EKDayViewController scrollEventIntoView:animated:](self, "scrollEventIntoView:animated:", v5, 0);

    }
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DDEKDayViewController;
  -[DDEKDayViewController didMoveToParentViewController:](&v4, sel_didMoveToParentViewController_, a3);
  -[DDEKDayViewController dd_update_scroll](self, "dd_update_scroll");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DDEKDayViewController;
  -[EKDayViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[DDEKDayViewController dd_update_scroll](self, "dd_update_scroll");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  -[DDEKDayViewController dd_update_scroll](self, "dd_update_scroll");
  v3.receiver = self;
  v3.super_class = (Class)DDEKDayViewController;
  -[EKDayViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DDEKDayViewController;
  -[EKDayViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[DDEKDayViewController dd_update_scroll](self, "dd_update_scroll");
}

- (EKEvent)dd_event
{
  return (EKEvent *)objc_getProperty(self, a2, 1304, 1);
}

- (void)setDd_event:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1304);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dd_event, 0);
}

@end
