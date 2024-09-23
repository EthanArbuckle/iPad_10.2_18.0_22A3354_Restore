@implementation AuthViewController

- (AuthViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  AuthViewController *v4;
  AuthViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AuthViewController;
  v4 = -[AuthViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
    -[AuthViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 2);
  return v5;
}

@end
