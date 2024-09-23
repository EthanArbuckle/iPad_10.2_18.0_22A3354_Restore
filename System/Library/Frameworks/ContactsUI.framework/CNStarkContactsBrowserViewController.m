@implementation CNStarkContactsBrowserViewController

- (CNStarkContactsBrowserViewController)init
{
  void *v3;
  CNStarkContactsBrowserViewController *v4;
  objc_super v6;

  v3 = (void *)objc_opt_new();
  v6.receiver = self;
  v6.super_class = (Class)CNStarkContactsBrowserViewController;
  v4 = -[CNStarkContactsBrowserViewController initWithRootViewController:](&v6, sel_initWithRootViewController_, v3);

  return v4;
}

@end
