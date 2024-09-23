@implementation CKMeCardNavigationController

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKMeCardNavigationController;
  -[CKMeCardNavigationController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CKMeCardNavigationController becomeFirstResponder](self, "becomeFirstResponder");
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

@end
