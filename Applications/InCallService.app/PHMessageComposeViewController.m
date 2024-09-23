@implementation PHMessageComposeViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHMessageComposeViewController;
  -[PHMessageComposeViewController viewWillAppear:](&v3, "viewWillAppear:", a3);
  +[PHInCallRootViewController obtainDismissalAssertionForReason:](PHInCallRootViewController, "obtainDismissalAssertionForReason:", CFSTR("PHMessageComposeViewControllerAssertionReason"));
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHMessageComposeViewController;
  -[PHMessageComposeViewController viewDidDisappear:](&v3, "viewDidDisappear:", a3);
  +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHMessageComposeViewControllerAssertionReason"));
}

@end
