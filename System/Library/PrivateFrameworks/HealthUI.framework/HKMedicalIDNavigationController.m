@implementation HKMedicalIDNavigationController

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HKMedicalIDNavigationController;
  -[HKNavigationController viewDidLoad](&v2, sel_viewDidLoad);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end
