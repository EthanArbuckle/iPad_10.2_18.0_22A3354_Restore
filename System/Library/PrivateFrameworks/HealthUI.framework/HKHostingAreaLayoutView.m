@implementation HKHostingAreaLayoutView

+ (id)viewHostingView:(id)a3
{
  id v3;
  HKHostingAreaLayoutView *v4;
  HKHostingAreaLayoutView *v5;

  v3 = a3;
  v4 = [HKHostingAreaLayoutView alloc];
  v5 = -[HKHostingAreaLayoutView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[HKHostingAreaLayoutView setHostedView:](v5, "setHostedView:", v3);

  return v5;
}

+ (id)colorBackgroundViewHostingView:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "viewHostingView:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  return v3;
}

- (BOOL)translatesAutoresizingMaskIntoConstraints
{
  return 0;
}

- (void)setHostedView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  objc_storeStrong((id *)&self->_hostedView, a3);
  -[HKHostingAreaLayoutView hostedView](self, "hostedView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKHostingAreaLayoutView hostedView](self, "hostedView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHostingAreaLayoutView addSubview:](self, "addSubview:", v5);

  -[HKHostingAreaLayoutView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHostingAreaLayoutView hostedView](self, "hostedView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  -[HKHostingAreaLayoutView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHostingAreaLayoutView hostedView](self, "hostedView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  -[HKHostingAreaLayoutView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHostingAreaLayoutView hostedView](self, "hostedView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setActive:", 1);

  -[HKHostingAreaLayoutView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHostingAreaLayoutView hostedView](self, "hostedView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setActive:", 1);

}

- (CGSize)intrinsicContentSize
{
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v3 = *MEMORY[0x1E0DC55F0];
  -[HKHostingAreaLayoutView hostedView](self, "hostedView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intrinsicContentSize");
  v6 = v5;
  -[HKHostingAreaLayoutView safeAreaInsets](self, "safeAreaInsets");
  v8 = v6 + v7;
  -[HKHostingAreaLayoutView safeAreaInsets](self, "safeAreaInsets");
  v10 = v8 + v9;

  v11 = v3;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (UIView)hostedView
{
  return self->_hostedView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedView, 0);
}

@end
