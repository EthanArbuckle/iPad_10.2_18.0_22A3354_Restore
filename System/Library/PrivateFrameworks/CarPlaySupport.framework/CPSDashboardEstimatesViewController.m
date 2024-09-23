@implementation CPSDashboardEstimatesViewController

- (CPSDashboardEstimatesViewController)init
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CPSDashboardEstimatesViewController *v8;
  _OWORD *p_top;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  SEL v13;
  CPSDashboardEstimatesViewController *v14;

  v13 = a2;
  v14 = 0;
  v12.receiver = self;
  v12.super_class = (Class)CPSDashboardEstimatesViewController;
  v14 = -[CPSDashboardEstimatesViewController init](&v12, sel_init);
  objc_storeStrong((id *)&v14, v14);
  if (v14)
  {
    objc_msgSend((id)objc_opt_class(), "shadowRadius");
    v14->_shadowRadius = v2;
    p_top = (_OWORD *)&v14->_edgeInsets.top;
    objc_msgSend((id)objc_opt_class(), "edgeInsets");
    *(_QWORD *)&v10 = v3;
    *((_QWORD *)&v10 + 1) = v4;
    *(_QWORD *)&v11 = v5;
    *((_QWORD *)&v11 + 1) = v6;
    *p_top = v10;
    p_top[1] = v11;
  }
  v8 = v14;
  objc_storeStrong((id *)&v14, 0);
  return v8;
}

- (void)viewDidLoad
{
  NSLayoutConstraint *v2;
  NSLayoutConstraint *platterBottomConstraint;
  double v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  CALayer *v26;
  CALayer *v27;
  CALayer *v28;
  CALayer *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  objc_super v46;
  SEL v47;
  CPSDashboardEstimatesViewController *v48;
  _QWORD v49[4];
  _QWORD v50[5];

  v50[4] = *MEMORY[0x24BDAC8D0];
  v48 = self;
  v47 = a2;
  v46.receiver = self;
  v46.super_class = (Class)CPSDashboardEstimatesViewController;
  -[CPSDashboardEstimatesViewController viewDidLoad](&v46, sel_viewDidLoad);
  v5 = (id)-[CPSDashboardEstimatesViewController view](v48, "view");
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v45 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  objc_msgSend(v45, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = (id)-[CPSDashboardEstimatesViewController view](v48, "view");
  objc_msgSend(v6, "addSubview:", v45);

  v7 = (id)objc_msgSend(v45, "layer");
  objc_msgSend((id)objc_opt_class(), "cornerRadius");
  objc_msgSend(v7, "setCornerRadius:");

  v8 = (id)objc_msgSend(v45, "layer");
  objc_msgSend(v8, "setMaskedCorners:", objc_msgSend((id)objc_opt_class(), "maskedCorners"));

  v9 = v45;
  v10 = (id)objc_msgSend((id)objc_opt_class(), "platterColor");
  objc_msgSend(v9, "setBackgroundColor:");

  objc_msgSend(v45, "setHidden:", 1);
  objc_storeStrong((id *)&v48->_platterView, v45);
  v13 = (id)objc_msgSend(v45, "bottomAnchor");
  v12 = (id)-[CPSDashboardEstimatesViewController view](v48, "view");
  v11 = (id)objc_msgSend(v12, "bottomAnchor");
  v2 = (NSLayoutConstraint *)(id)objc_msgSend(v13, "constraintEqualToAnchor:constant:", -v48->_edgeInsets.bottom);
  platterBottomConstraint = v48->_platterBottomConstraint;
  v48->_platterBottomConstraint = v2;

  v14 = (void *)MEMORY[0x24BDD1628];
  v25 = (id)objc_msgSend(v45, "heightAnchor");
  v24 = (id)objc_msgSend(v25, "constraintEqualToConstant:", 30.0);
  v50[0] = v24;
  v23 = (id)objc_msgSend(v45, "trailingAnchor");
  v22 = (id)-[CPSDashboardEstimatesViewController view](v48, "view");
  v21 = (id)objc_msgSend(v22, "trailingAnchor");
  v20 = (id)objc_msgSend(v23, "constraintEqualToAnchor:constant:", -v48->_edgeInsets.right);
  v50[1] = v20;
  v19 = (id)objc_msgSend(v45, "leadingAnchor");
  v18 = (id)-[CPSDashboardEstimatesViewController view](v48, "view");
  v17 = (id)objc_msgSend(v18, "leadingAnchor");
  v16 = (id)objc_msgSend(v19, "constraintEqualToAnchor:constant:", v48->_edgeInsets.left);
  v50[2] = v16;
  v50[3] = v48->_platterBottomConstraint;
  v15 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50);
  objc_msgSend(v14, "activateConstraints:");

  v26 = -[UIView layer](v48->_platterView, "layer");
  -[CALayer setShadowRadius:](v26, "setShadowRadius:", v48->_shadowRadius);

  v27 = -[UIView layer](v48->_platterView, "layer");
  -[CALayer setShadowPathIsBounds:](v27, "setShadowPathIsBounds:", 1);

  v28 = -[UIView layer](v48->_platterView, "layer");
  LODWORD(v4) = 0.25;
  -[CALayer setShadowOpacity:](v28, "setShadowOpacity:", v4);

  v29 = -[UIView layer](v48->_platterView, "layer");
  -[CALayer setShadowOffset:](v29, "setShadowOffset:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));

  v44 = (id)objc_msgSend((id)objc_opt_class(), "createEstimatesView");
  objc_msgSend(v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_storeStrong((id *)&v48->_estimatesView, v44);
  objc_msgSend(v45, "addSubview:", v44);
  v30 = (void *)MEMORY[0x24BDD1628];
  v43 = (id)objc_msgSend(v44, "topAnchor");
  v42 = (id)objc_msgSend(v45, "topAnchor");
  v41 = (id)objc_msgSend(v43, "constraintEqualToAnchor:");
  v49[0] = v41;
  v40 = (id)objc_msgSend(v44, "bottomAnchor");
  v39 = (id)objc_msgSend(v45, "bottomAnchor");
  v38 = (id)objc_msgSend(v40, "constraintEqualToAnchor:");
  v49[1] = v38;
  v37 = (id)objc_msgSend(v44, "trailingAnchor");
  v36 = (id)objc_msgSend(v45, "trailingAnchor");
  v35 = (id)objc_msgSend(v37, "constraintEqualToAnchor:");
  v49[2] = v35;
  v34 = (id)objc_msgSend(v44, "leadingAnchor");
  v33 = (id)objc_msgSend(v45, "leadingAnchor");
  v32 = (id)objc_msgSend(v34, "constraintEqualToAnchor:");
  v49[3] = v32;
  v31 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 4);
  objc_msgSend(v30, "activateConstraints:");

  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v45, 0);
}

- (UIEdgeInsets)safeAreaInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIView *v8;
  double v9;
  id v10;
  UIView *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  UIEdgeInsets result;

  v14 = *MEMORY[0x24BDF7718];
  v15 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
  v11 = -[CPSDashboardEstimatesViewController platterView](self, "platterView");
  v12 = -[UIView isHidden](v11, "isHidden");

  if (!v12)
  {
    v10 = (id)-[CPSDashboardEstimatesViewController view](self, "view");
    objc_msgSend(v10, "bounds");
    v9 = v2;
    v8 = -[CPSDashboardEstimatesViewController platterView](self, "platterView");
    -[UIView frame](v8, "frame");
    *(double *)&v15 = v9 - v3;

  }
  v5 = *((double *)&v14 + 1);
  v4 = *(double *)&v14;
  v7 = *((double *)&v15 + 1);
  v6 = *(double *)&v15;
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (void)viewDidLayoutSubviews
{
  double v2;
  double v3;
  double v4;
  double v5;
  CPSDashboardEstimatesViewController *v6;
  id WeakRetained;
  objc_super v8;
  SEL v9;
  CPSDashboardEstimatesViewController *v10;

  v10 = self;
  v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)CPSDashboardEstimatesViewController;
  -[CPSDashboardEstimatesViewController viewDidLayoutSubviews](&v8, sel_viewDidLayoutSubviews);
  WeakRetained = objc_loadWeakRetained((id *)&v10->_safeAreaDelegate);
  v6 = v10;
  -[CPSDashboardEstimatesViewController safeAreaInsets](v10, "safeAreaInsets");
  objc_msgSend(WeakRetained, "viewController:didUpdateSafeAreaInsets:", v6, v2, v3, v4, v5);

}

- (void)setSafeAreaDelegate:(id)a3
{
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  CPSDashboardEstimatesViewController *v8;
  id v9;
  BOOL v10;
  id location[2];
  CPSDashboardEstimatesViewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  WeakRetained = objc_loadWeakRetained((id *)&v12->_safeAreaDelegate);
  v10 = WeakRetained == location[0];

  if (!v10)
  {
    objc_storeWeak((id *)&v12->_safeAreaDelegate, location[0]);
    v9 = objc_loadWeakRetained((id *)&v12->_safeAreaDelegate);
    v8 = v12;
    -[CPSDashboardEstimatesViewController safeAreaInsets](v12, "safeAreaInsets");
    objc_msgSend(v9, "viewController:didUpdateSafeAreaInsets:", v8, v4, v5, v6, v7);

  }
  objc_storeStrong(location, 0);
}

- (void)updateTripEstimates:(id)a3
{
  UIView *v3;
  NSLayoutConstraint *v4;
  id v5;
  NSLayoutConstraint *v6;
  uint64_t v7;
  void *v8;
  CPSDashboardEstimatesView *v9;
  UIView *v10;
  BOOL v11;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(uint64_t);
  void *v16;
  CPSDashboardEstimatesViewController *v17;
  uint64_t v18;
  int v19;
  int v20;
  void (*v21)(uint64_t);
  void *v22;
  CPSDashboardEstimatesViewController *v23;
  id location[2];
  CPSDashboardEstimatesViewController *v25;

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = -[CPSDashboardEstimatesViewController estimatesView](v25, "estimatesView");
  -[CPSDashboardEstimatesView updateTripEstimates:](v9, "updateTripEstimates:", location[0]);

  v10 = -[CPSDashboardEstimatesViewController platterView](v25, "platterView");
  v11 = -[UIView isHidden](v10, "isHidden");

  if (v11)
  {
    v3 = -[CPSDashboardEstimatesViewController platterView](v25, "platterView");
    -[UIView setHidden:](v3, "setHidden:", 0);

    v4 = -[CPSDashboardEstimatesViewController platterBottomConstraint](v25, "platterBottomConstraint");
    -[NSLayoutConstraint setConstant:](v4, "setConstant:", 30.0);

    v5 = (id)-[CPSDashboardEstimatesViewController view](v25, "view");
    objc_msgSend(v5, "layoutIfNeeded");

    v6 = -[CPSDashboardEstimatesViewController platterBottomConstraint](v25, "platterBottomConstraint");
    -[NSLayoutConstraint setConstant:](v6, "setConstant:", -v25->_edgeInsets.bottom);

    v8 = (void *)MEMORY[0x24BDF6F90];
    v7 = MEMORY[0x24BDAC760];
    v18 = MEMORY[0x24BDAC760];
    v19 = -1073741824;
    v20 = 0;
    v21 = __59__CPSDashboardEstimatesViewController_updateTripEstimates___block_invoke;
    v22 = &unk_24E26F1B8;
    v23 = v25;
    v12 = v7;
    v13 = -1073741824;
    v14 = 0;
    v15 = __59__CPSDashboardEstimatesViewController_updateTripEstimates___block_invoke_2;
    v16 = &unk_24E26F168;
    v17 = v25;
    objc_msgSend(v8, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, &v18, &v12, 0.3, 0.0, 0.8);
    objc_storeStrong((id *)&v17, 0);
    objc_storeStrong((id *)&v23, 0);
  }
  objc_storeStrong(location, 0);
}

void __59__CPSDashboardEstimatesViewController_updateTripEstimates___block_invoke(uint64_t a1)
{
  id v1;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "view");
  objc_msgSend(v1, "layoutIfNeeded");

}

void __59__CPSDashboardEstimatesViewController_updateTripEstimates___block_invoke_2(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  void *v6;
  id v7;

  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "safeAreaDelegate");
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "safeAreaInsets");
  objc_msgSend(v7, "viewController:didUpdateSafeAreaInsets:", v6, v1, v2, v3, v4);

}

- (void)navigator:(id)a3 didEndTrip:(BOOL)a4
{
  NSLayoutConstraint *v4;
  uint64_t v5;
  void *v6;
  UIView *v8;
  BOOL v9;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(uint64_t);
  void *v14;
  CPSDashboardEstimatesViewController *v15;
  uint64_t v16;
  int v17;
  int v18;
  void (*v19)(uint64_t);
  void *v20;
  CPSDashboardEstimatesViewController *v21;
  BOOL v22;
  id location[2];
  CPSDashboardEstimatesViewController *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = a4;
  v8 = -[CPSDashboardEstimatesViewController platterView](v24, "platterView");
  v9 = -[UIView isHidden](v8, "isHidden");

  if (!v9)
  {
    v4 = -[CPSDashboardEstimatesViewController platterBottomConstraint](v24, "platterBottomConstraint");
    -[NSLayoutConstraint setConstant:](v4, "setConstant:", 30.0);

    v6 = (void *)MEMORY[0x24BDF6F90];
    v5 = MEMORY[0x24BDAC760];
    v16 = MEMORY[0x24BDAC760];
    v17 = -1073741824;
    v18 = 0;
    v19 = __60__CPSDashboardEstimatesViewController_navigator_didEndTrip___block_invoke;
    v20 = &unk_24E26F1B8;
    v21 = v24;
    v10 = v5;
    v11 = -1073741824;
    v12 = 0;
    v13 = __60__CPSDashboardEstimatesViewController_navigator_didEndTrip___block_invoke_2;
    v14 = &unk_24E26F168;
    v15 = v24;
    objc_msgSend(v6, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, &v16, &v10, 0.3, 0.0, 0.8);
    objc_storeStrong((id *)&v15, 0);
    objc_storeStrong((id *)&v21, 0);
  }
  objc_storeStrong(location, 0);
}

void __60__CPSDashboardEstimatesViewController_navigator_didEndTrip___block_invoke(uint64_t a1)
{
  id v1;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "view");
  objc_msgSend(v1, "layoutIfNeeded");

}

void __60__CPSDashboardEstimatesViewController_navigator_didEndTrip___block_invoke_2(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;
  void *v7;
  id v8;

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "platterView");
  objc_msgSend(v5, "setHidden:", 1);

  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "safeAreaDelegate");
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v7, "safeAreaInsets");
  objc_msgSend(v8, "viewController:didUpdateSafeAreaInsets:", v7, v1, v2, v3, v4);

}

+ (double)shadowRadius
{
  return 10.0;
}

+ (NSEdgeInsets)edgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSEdgeInsets result;

  v2 = 0.0;
  v3 = 5.0;
  v4 = 5.0;
  v5 = 5.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (double)cornerRadius
{
  return 5.0;
}

+ (unint64_t)maskedCorners
{
  return 15;
}

+ (id)createEstimatesView
{
  CPSDashboardEstimatesView *v2;

  v2 = [CPSDashboardEstimatesView alloc];
  return -[CPSDashboardEstimatesView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

+ (id)platterColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "crsui_dashboardWidgetBackgroundColor", a2, a1);
}

- (CPSSafeAreaDelegate)safeAreaDelegate
{
  return (CPSSafeAreaDelegate *)objc_loadWeakRetained((id *)&self->_safeAreaDelegate);
}

- (UIView)platterView
{
  return self->_platterView;
}

- (CPSDashboardEstimatesView)estimatesView
{
  return self->_estimatesView;
}

- (void)setEstimatesView:(id)a3
{
  objc_storeStrong((id *)&self->_estimatesView, a3);
}

- (NSLayoutConstraint)platterBottomConstraint
{
  return self->_platterBottomConstraint;
}

- (void)setPlatterBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_platterBottomConstraint, a3);
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (void)setShadowRadius:(double)a3
{
  self->_shadowRadius = a3;
}

- (NSEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  NSEdgeInsets result;

  left = self->_edgeInsets.left;
  top = self->_edgeInsets.top;
  right = self->_edgeInsets.right;
  bottom = self->_edgeInsets.bottom;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setEdgeInsets:(NSEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platterBottomConstraint, 0);
  objc_storeStrong((id *)&self->_estimatesView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_destroyWeak((id *)&self->_safeAreaDelegate);
}

@end
