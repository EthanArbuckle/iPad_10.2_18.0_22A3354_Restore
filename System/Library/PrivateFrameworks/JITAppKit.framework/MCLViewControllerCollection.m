@implementation MCLViewControllerCollection

- (MCLViewControllerCollection)initWithFrame:(CGRect)a3
{
  id v3;
  uint64_t v4;
  UIStackView *contentView;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *widthConstraint;
  MCLViewControllerCollection *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  objc_super v24;
  SEL v25;
  MCLViewControllerCollection *v26;
  CGRect v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x24BDAC8D0];
  v27 = a3;
  v25 = a2;
  v26 = 0;
  v24.receiver = self;
  v24.super_class = (Class)MCLViewControllerCollection;
  v26 = -[MCLViewControllerCollection initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v26, v26);
  if (v26)
  {
    v3 = objc_alloc(MEMORY[0x24BEBD978]);
    v4 = objc_msgSend(v3, "initWithFrame:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height);
    contentView = v26->_contentView;
    v26->_contentView = (UIStackView *)v4;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v26->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v26->_contentView, "setAxis:", 1);
    -[UIStackView setDistribution:](v26->_contentView, "setDistribution:");
    -[UIStackView setAlignment:](v26->_contentView, "setAlignment:", 0);
    -[UIStackView setSpacing:](v26->_contentView, "setSpacing:", 1.0);
    v6 = (NSLayoutConstraint *)(id)objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v26->_contentView, 7, 0, 0, 0.0, v27.size.width);
    widthConstraint = v26->_widthConstraint;
    v26->_widthConstraint = v6;

    -[MCLViewControllerCollection setDelegate:](v26, "setDelegate:", v26);
    -[MCLViewControllerCollection addSubview:](v26, "addSubview:", v26->_contentView);
    v10 = (void *)MEMORY[0x24BDD1628];
    v23 = (id)-[UIStackView leftAnchor](v26->_contentView, "leftAnchor");
    v22 = (id)-[MCLViewControllerCollection leftAnchor](v26, "leftAnchor");
    v21 = (id)objc_msgSend(v23, "constraintEqualToAnchor:");
    v28[0] = v21;
    v20 = (id)-[UIStackView rightAnchor](v26->_contentView, "rightAnchor");
    v19 = (id)-[MCLViewControllerCollection rightAnchor](v26, "rightAnchor");
    v18 = (id)objc_msgSend(v20, "constraintEqualToAnchor:");
    v28[1] = v18;
    v17 = (id)-[UIStackView topAnchor](v26->_contentView, "topAnchor");
    v16 = (id)-[MCLViewControllerCollection topAnchor](v26, "topAnchor");
    v15 = (id)objc_msgSend(v17, "constraintEqualToAnchor:");
    v28[2] = v15;
    v14 = (id)-[UIStackView bottomAnchor](v26->_contentView, "bottomAnchor");
    v13 = (id)-[MCLViewControllerCollection bottomAnchor](v26, "bottomAnchor");
    v12 = (id)objc_msgSend(v14, "constraintEqualToAnchor:");
    v28[3] = v12;
    v11 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 4);
    objc_msgSend(v10, "activateConstraints:");

  }
  v9 = v26;
  objc_storeStrong((id *)&v26, 0);
  return v9;
}

- (void)setSpacing:(double)a3
{
  -[UIStackView setSpacing:](self->_contentView, "setSpacing:", a3);
}

- (double)spacing
{
  double result;

  -[UIStackView spacing](self->_contentView, "spacing", a2, self);
  return result;
}

- (void)setViews:(id)a3
{
  uint64_t v3;
  NSArray *views;
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(uint64_t, void *, uint64_t, uint64_t);
  void *v11;
  id v12;
  id v13;
  MCLViewControllerCollection *v14;
  int v15;
  id WeakRetained;
  id v17;
  id v18;
  id location[2];
  MCLViewControllerCollection *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = (id)objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", location[0]);
  v17 = (id)objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v20->_views);
  objc_msgSend(v18, "minusSet:", v17);
  v6 = (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", location[0]);
  objc_msgSend(v17, "minusSet:");

  objc_msgSend(v17, "enumerateObjectsUsingBlock:", &__block_literal_global_6);
  v3 = objc_msgSend(location[0], "copy");
  views = v20->_views;
  v20->_views = (NSArray *)v3;

  WeakRetained = objc_loadWeakRetained((id *)&v20->_owner);
  if (WeakRetained)
  {
    v5 = location[0];
    v7 = MEMORY[0x24BDAC760];
    v8 = -1073741824;
    v9 = 0;
    v10 = __40__MCLViewControllerCollection_setViews___block_invoke_2;
    v11 = &unk_24E099E00;
    v12 = v18;
    v13 = WeakRetained;
    v14 = v20;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v7);
    objc_storeStrong((id *)&v14, 0);
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v12, 0);
    v15 = 0;
  }
  else
  {
    v15 = 1;
  }
  objc_storeStrong(&WeakRetained, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

void __40__MCLViewControllerCollection_setViews___block_invoke(void *a1, void *a2, void *a3)
{
  id v3;
  id v4;
  id v5;
  id v8;
  id v9[3];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9[2] = a3;
  v9[1] = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9[0] = location[0];
    objc_msgSend(v9[0], "willMoveToParentViewController:");
    v5 = (id)objc_msgSend(v9[0], "view");
    v4 = (id)objc_msgSend(v5, "superview");
    objc_msgSend(v4, "removeFromSuperview");

    objc_msgSend(v9[0], "removeFromParentViewController");
    objc_storeStrong(v9, 0);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = location[0];
      v3 = (id)objc_msgSend(v8, "superview");
      objc_msgSend(v3, "removeFromSuperview");

      objc_storeStrong(&v8, 0);
    }
  }
  objc_storeStrong(location, 0);
}

void __40__MCLViewControllerCollection_setViews___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id location[2];
  _QWORD v47[4];
  _QWORD v48[5];

  v48[4] = *MEMORY[0x24BDAC8D0];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v45 = a3;
  v44 = a4;
  v43 = a1;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", location[0]) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = location[0];
      v40 = (id)objc_msgSend(v41, "view");
      objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(*(id *)(a1 + 40), "addChildViewController:", v41);
      v4 = objc_alloc(MEMORY[0x24BEBDB00]);
      v39 = (id)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v39, "addSubview:", v40);
      v20 = (void *)MEMORY[0x24BDD1628];
      v33 = (id)objc_msgSend(v39, "leadingAnchor");
      v32 = (id)objc_msgSend(v40, "leadingAnchor");
      v31 = (id)objc_msgSend(v33, "constraintEqualToAnchor:");
      v48[0] = v31;
      v30 = (id)objc_msgSend(v39, "trailingAnchor");
      v29 = (id)objc_msgSend(v40, "trailingAnchor");
      v28 = (id)objc_msgSend(v30, "constraintEqualToAnchor:");
      v48[1] = v28;
      v27 = (id)objc_msgSend(v39, "topAnchor");
      v26 = (id)objc_msgSend(v40, "topAnchor");
      v25 = (id)objc_msgSend(v27, "constraintEqualToAnchor:");
      v48[2] = v25;
      v24 = (id)objc_msgSend(v39, "bottomAnchor");
      v23 = (id)objc_msgSend(v40, "bottomAnchor");
      v22 = (id)objc_msgSend(v24, "constraintEqualToAnchor:");
      v48[3] = v22;
      v21 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 4);
      objc_msgSend(v20, "activateConstraints:");

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 2072), "insertArrangedSubview:atIndex:", v39, v45);
      objc_msgSend(v41, "didMoveToParentViewController:", *(_QWORD *)(a1 + 40));
      objc_storeStrong(&v39, 0);
      objc_storeStrong(&v40, 0);
      objc_storeStrong(&v41, 0);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = location[0];
        objc_msgSend(v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        v5 = objc_alloc(MEMORY[0x24BEBDB00]);
        v37 = (id)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
        objc_msgSend(v37, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v37, "addSubview:", v38);
        v6 = (void *)MEMORY[0x24BDD1628];
        v19 = (id)objc_msgSend(v37, "leadingAnchor");
        v18 = (id)objc_msgSend(v38, "leadingAnchor");
        v17 = (id)objc_msgSend(v19, "constraintEqualToAnchor:");
        v47[0] = v17;
        v16 = (id)objc_msgSend(v37, "trailingAnchor");
        v15 = (id)objc_msgSend(v38, "trailingAnchor");
        v14 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
        v47[1] = v14;
        v13 = (id)objc_msgSend(v37, "topAnchor");
        v12 = (id)objc_msgSend(v38, "topAnchor");
        v11 = (id)objc_msgSend(v13, "constraintEqualToAnchor:");
        v47[2] = v11;
        v10 = (id)objc_msgSend(v37, "bottomAnchor");
        v9 = (id)objc_msgSend(v38, "bottomAnchor");
        v8 = (id)objc_msgSend(v10, "constraintEqualToAnchor:");
        v47[3] = v8;
        v7 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 4);
        objc_msgSend(v6, "activateConstraints:");

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 2072), "insertArrangedSubview:atIndex:", v37, v45);
        objc_storeStrong(&v37, 0);
        objc_storeStrong(&v38, 0);
      }
    }
    v42 = 0;
  }
  else
  {
    v42 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)layoutSubviews
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  double v16;
  SEL v17;
  MCLViewControllerCollection *v18;

  v18 = self;
  v17 = a2;
  -[MCLViewControllerCollection frame](self, "frame");
  v12 = v2;
  v13 = v3;
  v14 = v4;
  v15 = v5;
  v16 = v4;
  -[NSLayoutConstraint constant](v18->_widthConstraint, "constant");
  if (v6 != v16)
  {
    -[NSLayoutConstraint setConstant:](v18->_widthConstraint, "setConstant:", v16);
    -[NSLayoutConstraint setActive:](v18->_widthConstraint, "setActive:", 1);
    -[MCLViewControllerCollection contentOffset](v18, "contentOffset");
    v10 = v7;
    v11 = v8 - 1.0;
    -[MCLViewControllerCollection setContentOffset:animated:](v18, "setContentOffset:animated:", 1, v7, v8 - 1.0);
  }
  v9.receiver = v18;
  v9.super_class = (Class)MCLViewControllerCollection;
  -[MCLViewControllerCollection layoutSubviews](&v9, sel_layoutSubviews);
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  NSArray *v14;
  uint64_t v15;
  int v16;
  int v17;
  void (*v18)(double *, void *, void *, void *);
  void *v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  int v34;
  id location[2];
  MCLViewControllerCollection *v36;

  v36 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning())
  {
    v34 = 1;
  }
  else
  {
    objc_msgSend(location[0], "contentOffset");
    v31 = v3;
    v32 = v4;
    v13 = v4;
    objc_msgSend(location[0], "contentInset");
    v27 = v5;
    v28 = v6;
    v29 = v7;
    v30 = v8;
    v33 = v13 + v5 - 20.0;
    objc_msgSend(location[0], "frame");
    v22 = v9;
    v23 = v10;
    v24 = v11;
    v25 = v12;
    v26 = v33 + v12 + 40.0;
    v14 = -[UIStackView arrangedSubviews](v36->_contentView, "arrangedSubviews");
    v15 = MEMORY[0x24BDAC760];
    v16 = -1073741824;
    v17 = 0;
    v18 = __51__MCLViewControllerCollection_scrollViewDidScroll___block_invoke;
    v19 = &__block_descriptor_48_e23_v32__0__UIView_8Q16_B24l;
    v20 = v33;
    v21 = v26;
    -[NSArray enumerateObjectsUsingBlock:](v14, "enumerateObjectsUsingBlock:", &v15);

    v34 = 0;
  }
  objc_storeStrong(location, 0);
}

void __51__MCLViewControllerCollection_scrollViewDidScroll___block_invoke(double *a1, void *a2, void *a3, void *a4)
{
  BOOL v4;
  id v8;
  CGRect rect;
  id v10[4];
  id location[2];
  CGRect v12;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v10[3] = a3;
  v10[2] = a4;
  v10[1] = a1;
  v8 = (id)objc_msgSend(location[0], "subviews");
  v10[0] = (id)objc_msgSend(v8, "firstObject");

  if (v10[0])
  {
    objc_msgSend(location[0], "frame");
    rect = v12;
    v4 = 1;
    if (CGRectGetMaxY(v12) >= a1[4])
      v4 = CGRectGetMinY(rect) > a1[5];
    if ((objc_msgSend(v10[0], "isHidden") & 1) != v4)
      objc_msgSend(v10[0], "setHidden:", v4);
  }
  objc_storeStrong(v10, 0);
  objc_storeStrong(location, 0);
}

- (UIViewController)owner
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_owner);
}

- (void)setOwner:(id)a3
{
  objc_storeWeak((id *)&self->_owner, a3);
}

- (NSArray)views
{
  return self->_views;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_views, 0);
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
