@implementation CPSPanButton

- (CPSPanButton)initWithDirection:(int64_t)a3
{
  CPSPanButton *v4;
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
  id v20;
  id v21;
  id v22;
  objc_super v23;
  int64_t v24;
  SEL v25;
  CPSPanButton *v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x24BDAC8D0];
  v25 = a2;
  v24 = a3;
  v26 = 0;
  v23.receiver = self;
  v23.super_class = (Class)CPSPanButton;
  v26 = -[CPSPanButton initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_storeStrong((id *)&v26, v26);
  if (v26)
  {
    v26->_direction = v24;
    -[CPSPanButton setTranslatesAutoresizingMaskIntoConstraints:](v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v22 = objc_alloc_init(MEMORY[0x24BDF6F90]);
    objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = (id)objc_msgSend(v22, "layer");
    objc_msgSend(v5, "setCornerRadius:", 14.0);

    -[CPSPanButton addSubview:](v26, "addSubview:", v22);
    objc_storeStrong((id *)&v26->_backgroundView, v22);
    v6 = (void *)MEMORY[0x24BDD1628];
    v19 = (id)objc_msgSend(v22, "topAnchor");
    v18 = (id)-[CPSPanButton topAnchor](v26, "topAnchor");
    v17 = (id)objc_msgSend(v19, "constraintEqualToAnchor:");
    v27[0] = v17;
    v16 = (id)objc_msgSend(v22, "bottomAnchor");
    v15 = (id)-[CPSPanButton bottomAnchor](v26, "bottomAnchor");
    v14 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
    v27[1] = v14;
    v13 = (id)objc_msgSend(v22, "leftAnchor");
    v12 = (id)-[CPSPanButton leftAnchor](v26, "leftAnchor");
    v11 = (id)objc_msgSend(v13, "constraintEqualToAnchor:");
    v27[2] = v11;
    v10 = (id)objc_msgSend(v22, "rightAnchor");
    v9 = (id)-[CPSPanButton rightAnchor](v26, "rightAnchor");
    v8 = (id)objc_msgSend(v10, "constraintEqualToAnchor:");
    v27[3] = v8;
    v7 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 4);
    objc_msgSend(v6, "activateConstraints:");

    -[CPSPanButton _setupPanImages](v26, "_setupPanImages");
    -[CPSPanButton _updateColors](v26, "_updateColors");
    v21 = +[CPSEntityStyles mapButtonDropShadow](CPSEntityStyles, "mapButtonDropShadow");
    v20 = (id)-[CPSPanButton layer](v26, "layer");
    objc_msgSend(v21, "applyShadowToLayer:");

    objc_storeStrong(&v22, 0);
  }
  v4 = v26;
  objc_storeStrong((id *)&v26, 0);
  return v4;
}

- (void)layoutSubviews
{
  CPSPanButton *v2;
  UIView *v3;
  objc_super v4;
  SEL v5;
  CPSPanButton *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CPSPanButton;
  -[CPSPanButton layoutSubviews](&v4, sel_layoutSubviews);
  v2 = v6;
  v3 = -[CPSPanButton backgroundView](v6, "backgroundView");
  -[CPSPanButton insertSubview:atIndex:](v2, "insertSubview:atIndex:");

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  objc_super v5;
  id v6;
  id location[2];
  CPSPanButton *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)CPSPanButton;
  -[CPSPanButton didUpdateFocusInContext:withAnimationCoordinator:](&v5, sel_didUpdateFocusInContext_withAnimationCoordinator_, location[0], v6);
  -[CPSPanButton _updateColors](v8, "_updateColors");
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v3;
  id location[2];
  CPSPanButton *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSPanButton;
  -[CPSPanButton traitCollectionDidChange:](&v3, sel_traitCollectionDidChange_, location[0]);
  -[CPSPanButton _setupPanImages](v5, "_setupPanImages");
  -[CPSPanButton _updateColors](v5, "_updateColors");
  objc_storeStrong(location, 0);
}

- (void)_updateColors
{
  id v2;
  UIView *v3;
  id v4;
  id v5;
  UIView *v6;
  id v7;

  if ((-[CPSPanButton isFocused](self, "isFocused") & 1) != 0)
  {
    v6 = -[CPSPanButton backgroundView](self, "backgroundView");
    v5 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:");

    v7 = +[CPSEntityStyles mapButtonBackgroundColor](CPSEntityStyles, "mapButtonBackgroundColor");
    -[CPSPanButton setTintColor:](self, "setTintColor:");

  }
  else
  {
    v3 = -[CPSPanButton backgroundView](self, "backgroundView");
    v2 = +[CPSEntityStyles mapButtonBackgroundColor](CPSEntityStyles, "mapButtonBackgroundColor");
    -[UIView setBackgroundColor:](v3, "setBackgroundColor:");

    v4 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
    -[CPSPanButton setTintColor:](self, "setTintColor:");

  }
}

- (void)_setupPanImages
{
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  id v8;
  id v9;
  id v10[2];
  CPSPanButton *v11;

  v11 = self;
  v10[1] = (id)a2;
  v10[0] = CFSTR("circle.fill");
  v7 = -[CPSPanButton direction](v11, "direction");
  if (v7 <= 8)
    __asm { BR              X8 }
  v9 = (id)objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithTextStyle:scale:", *MEMORY[0x24BDF77F0], -1);
  v5 = (void *)MEMORY[0x24BDF6AC8];
  v4 = v10[0];
  v6 = (id)-[CPSPanButton traitCollection](v11, "traitCollection");
  v8 = (id)objc_msgSend(v5, "systemImageNamed:compatibleWithTraitCollection:", v4);

  v2 = (id)objc_msgSend(v8, "imageWithConfiguration:", v9);
  v3 = v8;
  v8 = v2;

  -[CPSPanButton setImage:forState:](v11, "setImage:forState:", v8, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(v10, 0);
}

- (int64_t)direction
{
  return self->_direction;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
