@implementation SSSWaitingForImageIdentifierUpdatesAlertContentViewController

- (void)loadView
{
  SSSWaitingForImageIdentifierUpdatesAlertContentView *v3;

  v3 = objc_opt_new(SSSWaitingForImageIdentifierUpdatesAlertContentView);
  -[SSSWaitingForImageIdentifierUpdatesAlertContentViewController setView:](self, "setView:", v3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSSWaitingForImageIdentifierUpdatesAlertContentViewController;
  -[SSSWaitingForImageIdentifierUpdatesAlertContentViewController viewDidLayoutSubviews](&v4, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSWaitingForImageIdentifierUpdatesAlertContentViewController view](self, "view"));
  objc_msgSend(v3, "intrinsicContentSize");
  -[SSSWaitingForImageIdentifierUpdatesAlertContentViewController setPreferredContentSize:](self, "setPreferredContentSize:");

}

- (void)setProgress:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SSSWaitingForImageIdentifierUpdatesAlertContentViewController _contentView](self, "_contentView"));
  objc_msgSend(v4, "setProgress:", a3);

}

- (double)progress
{
  return self->_progress;
}

@end
