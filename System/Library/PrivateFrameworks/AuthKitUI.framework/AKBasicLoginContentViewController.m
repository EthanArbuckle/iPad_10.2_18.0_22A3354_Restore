@implementation AKBasicLoginContentViewController

- (void)loadView
{
  AKBasicLoginContentViewControllerContainerView *v3;
  AKBasicLoginContentViewControllerContainerView *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKBasicLoginContentViewController;
  -[AKBasicLoginContentViewController loadView](&v5, sel_loadView);
  v3 = [AKBasicLoginContentViewControllerContainerView alloc];
  v4 = -[AKBasicLoginContentViewControllerContainerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[AKBasicLoginContentViewController setView:](self, "setView:", v4);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKBasicLoginContentViewController;
  -[AKBasicLoginContentViewController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
  -[AKBasicLoginContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0CEB988], *(double *)(MEMORY[0x1E0CEB988] + 8));
  -[AKBasicLoginContentViewController setPreferredContentSize:](self, "setPreferredContentSize:");

}

@end
