@implementation BCSTorchButtonView

- (BCSTorchButtonView)init
{
  BCSTorchButtonView *v2;
  uint64_t v3;
  UIButton *torchButton;
  id v5;
  void *v6;
  uint64_t v7;
  UIVisualEffectView *torchButtonPlatter;
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
  BCSTorchButtonView *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  objc_super v45;
  _QWORD v46[12];

  v46[10] = *MEMORY[0x24BDAC8D0];
  v45.receiver = self;
  v45.super_class = (Class)BCSTorchButtonView;
  v2 = -[BCSTorchButtonView init](&v45, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 0);
    v3 = objc_claimAutoreleasedReturnValue();
    torchButton = v2->_torchButton;
    v2->_torchButton = (UIButton *)v3;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v2->_torchButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 30.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", CFSTR("flashlight.on.fill"), v35);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", CFSTR("flashlight.off.fill"), v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v2->_torchButton, "setImage:forState:", v36, 0);
    -[UIButton setImage:forState:](v2->_torchButton, "setImage:forState:", v44, 4);
    -[BCSTorchButtonView _updateTorchButtonTintColor](v2, "_updateTorchButtonTintColor");
    -[UIButton _setTouchInsets:](v2->_torchButton, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    -[UIButton addTarget:action:forControlEvents:](v2->_torchButton, "addTarget:action:forControlEvents:", v2, sel__torchButtonPressed_, 0x2000);
    v5 = objc_alloc(MEMORY[0x24BEBDB38]);
    objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithEffect:", v6);
    torchButtonPlatter = v2->_torchButtonPlatter;
    v2->_torchButtonPlatter = (UIVisualEffectView *)v7;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v2->_torchButtonPlatter, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIVisualEffectView _setCornerRadius:](v2->_torchButtonPlatter, "_setCornerRadius:", 30.0);
    -[UIVisualEffectView setClipsToBounds:](v2->_torchButtonPlatter, "setClipsToBounds:", 1);
    -[UIVisualEffectView contentView](v2->_torchButtonPlatter, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v2->_torchButton);

    -[BCSTorchButtonView addSubview:](v2, "addSubview:", v2->_torchButtonPlatter);
    v10 = (void *)MEMORY[0x24BDD1628];
    -[UIButton leadingAnchor](v2->_torchButton, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView leadingAnchor](v2->_torchButtonPlatter, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v33;
    -[UIButton trailingAnchor](v2->_torchButton, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView trailingAnchor](v2->_torchButtonPlatter, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v31;
    -[UIButton topAnchor](v2->_torchButton, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView topAnchor](v2->_torchButtonPlatter, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v29;
    -[UIButton bottomAnchor](v2->_torchButton, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView bottomAnchor](v2->_torchButtonPlatter, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v27;
    -[UIVisualEffectView leadingAnchor](v2->_torchButtonPlatter, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSTorchButtonView leadingAnchor](v2, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v46[4] = v25;
    -[UIVisualEffectView trailingAnchor](v2->_torchButtonPlatter, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSTorchButtonView trailingAnchor](v2, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v46[5] = v23;
    -[UIVisualEffectView topAnchor](v2->_torchButtonPlatter, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSTorchButtonView topAnchor](v2, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v46[6] = v21;
    -[UIVisualEffectView bottomAnchor](v2->_torchButtonPlatter, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSTorchButtonView bottomAnchor](v2, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v46[7] = v13;
    -[UIVisualEffectView widthAnchor](v2->_torchButtonPlatter, "widthAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToConstant:", 60.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v46[8] = v15;
    -[UIVisualEffectView heightAnchor](v2->_torchButtonPlatter, "heightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToConstant:", 60.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v46[9] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activateConstraints:", v18);

    v19 = v2;
  }

  return v2;
}

- (void)torchAvailabilityChangedTo:(BOOL)a3
{
  -[UIButton setEnabled:](self->_torchButton, "setEnabled:", a3);
}

- (void)torchActivenessChangedTo:(BOOL)a3
{
  id v4;

  if (!a3)
  {
    -[UIButton setSelected:](self->_torchButton, "setSelected:", 0);
    -[BCSTorchButtonView _updateTorchButtonTintColor](self, "_updateTorchButtonTintColor");
    objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setEffect:](self->_torchButtonPlatter, "setEffect:");

  }
}

- (void)rotationAnimationWillStart
{
  -[UIVisualEffectView setHidden:](self->_torchButtonPlatter, "setHidden:", 1);
}

- (void)rotationAnimationDidFinish
{
  _QWORD v3[5];

  -[UIVisualEffectView setAlpha:](self->_torchButtonPlatter, "setAlpha:", 0.0);
  -[UIVisualEffectView setHidden:](self->_torchButtonPlatter, "setHidden:", 0);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __48__BCSTorchButtonView_rotationAnimationDidFinish__block_invoke;
  v3[3] = &unk_2508639E8;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v3, 0.2);
}

uint64_t __48__BCSTorchButtonView_rotationAnimationDidFinish__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 1.0);
}

- (void)_torchButtonPressed:(id)a3
{
  int v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "isSelected");
  v5 = v4 ^ 1u;
  -[UIButton setSelected:](self->_torchButton, "setSelected:", v5);
  if ((v4 & 1) != 0)
    objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 2);
  else
    objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setEffect:](self->_torchButtonPlatter, "setEffect:", v6);

  -[BCSTorchButtonView _updateTorchButtonTintColor](self, "_updateTorchButtonTintColor");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "torchButtonView:torchModeChangedTo:", self, v5);

}

- (void)_updateTorchButtonTintColor
{
  void *v3;
  id v4;

  if (-[UIButton isSelected](self->_torchButton, "isSelected"))
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIButton imageView](self->_torchButton, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTintColor:", v4);

}

- (BCSTorchButtonViewDelegate)delegate
{
  return (BCSTorchButtonViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_torchButton, 0);
  objc_storeStrong((id *)&self->_torchButtonPlatter, 0);
}

@end
