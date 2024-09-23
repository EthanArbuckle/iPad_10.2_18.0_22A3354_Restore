@implementation HKSimulatedWatchView

- (HKSimulatedWatchView)initWithWatchView:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  HKSimulatedWatchView *v10;
  uint64_t v11;
  UIView *containerView;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HKSimulatedWatchView;
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = -[HKSimulatedWatchView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v7, v8, v9);
  if (v10)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v6, v7, v8, v9);
    containerView = v10->_containerView;
    v10->_containerView = (UIView *)v11;

    objc_storeStrong((id *)&v10->_watchScreenView, a3);
    v13 = (void *)MEMORY[0x1E0DC3870];
    HKHealthUIFrameworkBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("simulated_watch"), v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v15);
    -[HKSimulatedWatchView addSubview:](v10, "addSubview:", v16);
    -[UIView addSubview:](v10->_containerView, "addSubview:", v10->_watchScreenView);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v10->_containerView, "setBackgroundColor:", v17);

    -[HKSimulatedWatchView addSubview:](v10, "addSubview:", v10->_containerView);
    -[UIView setContentMode:](v10->_watchScreenView, "setContentMode:", 2);
    -[HKSimulatedWatchView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v15, "size");
    -[UIView hk_constraintAspectRatioFromSize:](v10, "hk_constraintAspectRatioFromSize:");
    objc_msgSend(v16, "hk_alignConstraintsWithView:", v10);

  }
  return v10;
}

- (HKSimulatedWatchView)initWithIconImage:(id)a3 titleText:(id)a4 detailText:(id)a5 tintColor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HKSimulatedWatchNotificationQuickLookView *v14;
  HKSimulatedWatchView *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[HKSimulatedWatchNotificationQuickLookView initWithIconImage:titleText:detailText:tintColor:]([HKSimulatedWatchNotificationQuickLookView alloc], "initWithIconImage:titleText:detailText:tintColor:", v13, v12, v11, v10);

  v15 = -[HKSimulatedWatchView initWithWatchView:](self, "initWithWatchView:", v14);
  return v15;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double MidX;
  double MidY;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;

  v20.receiver = self;
  v20.super_class = (Class)HKSimulatedWatchView;
  -[HKSimulatedWatchView layoutSubviews](&v20, sel_layoutSubviews);
  -[HKSimulatedWatchView bounds](self, "bounds");
  v4 = v3 * 0.139;
  v6 = v5 * 0.249;
  v7 = v3 * 0.724;
  v8 = v5 * 0.5;
  -[HKSimulatedWatchView containerView](self, "containerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", v4, v6, v7, v8);

  -[UIView bounds](self->_containerView, "bounds");
  MidX = CGRectGetMidX(v21);
  -[UIView bounds](self->_containerView, "bounds");
  MidY = CGRectGetMidY(v22);
  -[HKSimulatedWatchView watchScreenView](self, "watchScreenView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCenter:", MidX, MidY);

  -[UIView frame](self->_containerView, "frame");
  v14 = v13 / 156.0;
  -[UIView frame](self->_containerView, "frame");
  v16 = v15 / 195.0;
  if (v14 < v15 / 195.0)
    v16 = v14;
  CGAffineTransformMakeScale(&v19, v16, v16);
  -[HKSimulatedWatchView watchScreenView](self, "watchScreenView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v19;
  objc_msgSend(v17, "setTransform:", &v18);

}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UIView)watchScreenView
{
  return self->_watchScreenView;
}

- (void)setWatchScreenView:(id)a3
{
  objc_storeStrong((id *)&self->_watchScreenView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchScreenView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
