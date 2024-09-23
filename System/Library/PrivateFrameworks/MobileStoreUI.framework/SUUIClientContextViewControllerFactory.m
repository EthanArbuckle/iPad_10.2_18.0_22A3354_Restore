@implementation SUUIClientContextViewControllerFactory

- (id)newPlaceholderViewController
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIClientContextViewControllerFactory;
  v2 = -[SUViewControllerFactory newPlaceholderViewController](&v7, sel_newPlaceholderViewController);
  v3 = (void *)MEMORY[0x24BEC8D08];
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gradientWithColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDefaultBackgroundGradient:", v5);

  return v2;
}

@end
