@implementation PBAAppleLogoViewController

- (void)loadView
{
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)SBUIAppleLogoView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[PBAAppleLogoViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PBAAppleLogoViewController;
  -[PBAAppleLogoViewController viewDidLoad](&v2, "viewDidLoad");
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PBAAppleLogoViewController;
  -[PBAAppleLogoViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end
