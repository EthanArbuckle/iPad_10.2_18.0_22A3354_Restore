@implementation SFAlertControllerContentViewController

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  CGFloat Width;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v23;
  CGRect v24;

  v23.receiver = self;
  v23.super_class = (Class)SFAlertControllerContentViewController;
  -[SFAlertControllerContentViewController viewDidLayoutSubviews](&v23, sel_viewDidLayoutSubviews);
  -[SFAlertControllerContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SFAlertControllerContentViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  Width = CGRectGetWidth(v24);
  LODWORD(v14) = 1148846080;
  LODWORD(v15) = 1112014848;
  objc_msgSend(v12, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", Width, 1.79769313e308, v14, v15);
  v17 = v16;
  v19 = v18;

  -[SFAlertControllerContentViewController preferredContentSize](self, "preferredContentSize");
  if (v21 != v17 || v20 != v19)
    -[SFAlertControllerContentViewController setPreferredContentSize:](self, "setPreferredContentSize:", v17, v19);
}

@end
