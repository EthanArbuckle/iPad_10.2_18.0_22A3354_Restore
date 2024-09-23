@implementation PHAlertController

- (PHAlertController)initWithNibName:(id)a3 bundle:(id)a4
{
  PHAlertController *v4;
  PHAlertController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHAlertController;
  v4 = -[PHAlertController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
    -[PHAlertController setDismissalAssertionReason:](v4, "setDismissalAssertionReason:", CFSTR("PHAlertControllerGenericAssertionReason"));
  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHAlertController;
  -[PHAlertController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAlertController dismissalAssertionReason](self, "dismissalAssertionReason"));
  +[PHInCallRootViewController obtainDismissalAssertionForReason:](PHInCallRootViewController, "obtainDismissalAssertionForReason:", v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHAlertController;
  -[PHAlertController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAlertController dismissalAssertionReason](self, "dismissalAssertionReason"));
  +[PHInCallRootViewController obtainDismissalAssertionForReason:](PHInCallRootViewController, "obtainDismissalAssertionForReason:", v4);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHAlertController;
  -[PHAlertController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAlertController dismissalAssertionReason](self, "dismissalAssertionReason"));
  +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", v4);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAlertController dismissalAssertionReason](self, "dismissalAssertionReason"));
  +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", v3);

  v4.receiver = self;
  v4.super_class = (Class)PHAlertController;
  -[PHAlertController dealloc](&v4, "dealloc");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSString)dismissalAssertionReason
{
  return self->_dismissalAssertionReason;
}

- (void)setDismissalAssertionReason:(id)a3
{
  objc_storeStrong((id *)&self->_dismissalAssertionReason, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalAssertionReason, 0);
}

@end
