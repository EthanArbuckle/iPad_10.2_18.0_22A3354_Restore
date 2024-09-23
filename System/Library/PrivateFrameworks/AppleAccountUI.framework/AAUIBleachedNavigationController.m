@implementation AAUIBleachedNavigationController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;
  CGSize v7;
  CGRect v8;

  v6.receiver = self;
  v6.super_class = (Class)AAUIBleachedNavigationController;
  -[AAUIBleachedNavigationController viewDidLoad](&v6, sel_viewDidLoad);
  -[AAUIBleachedNavigationController navigationBar](self, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setHidesShadow:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.96);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.width = 1.0;
  v7.height = 1.0;
  UIGraphicsBeginImageContext(v7);
  objc_msgSend(v4, "set");
  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  v8.size.width = 1.0;
  v8.size.height = 1.0;
  UIRectFill(v8);
  UIGraphicsGetImageFromCurrentImageContext();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v3, "setBackgroundImage:forBarMetrics:", v5, 0);

}

- (BOOL)shouldAutorotate
{
  return 0;
}

@end
