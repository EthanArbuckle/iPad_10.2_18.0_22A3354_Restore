@implementation CCUIAlwaysExpandedMenuModuleViewController

- (CCUIAlwaysExpandedMenuModuleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  CCUIAlwaysExpandedMenuModuleViewController *v4;
  CCUIAlwaysExpandedMenuModuleViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CCUIAlwaysExpandedMenuModuleViewController;
  v4 = -[CCUIMenuModuleViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[CCUIButtonModuleViewController setExpanded:](v4, "setExpanded:", 1);
  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIAlwaysExpandedMenuModuleViewController;
  -[CCUIAlwaysExpandedMenuModuleViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CCUIMenuModuleViewController willTransitionToExpandedContentMode:](self, "willTransitionToExpandedContentMode:", 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIAlwaysExpandedMenuModuleViewController;
  -[CCUIAlwaysExpandedMenuModuleViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[CCUIMenuModuleViewController didTransitionToExpandedContentMode:](self, "didTransitionToExpandedContentMode:", 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIAlwaysExpandedMenuModuleViewController;
  -[CCUIAlwaysExpandedMenuModuleViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[CCUIMenuModuleViewController willTransitionToExpandedContentMode:](self, "willTransitionToExpandedContentMode:", 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIAlwaysExpandedMenuModuleViewController;
  -[CCUIAlwaysExpandedMenuModuleViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[CCUIMenuModuleViewController didTransitionToExpandedContentMode:](self, "didTransitionToExpandedContentMode:", 0);
}

@end
