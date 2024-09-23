@implementation AFUISiriCarPlayFullScreenBackgroundView

- (AFUISiriCarPlayFullScreenBackgroundView)initWithFrame:(CGRect)a3
{
  AFUISiriCarPlayFullScreenBackgroundView *v3;
  AFUISiriCarPlayFullScreenBackgroundView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AFUISiriCarPlayFullScreenBackgroundView;
  v3 = -[AFUISiriCarPlayFullScreenBackgroundView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[AFUISiriCarPlayFullScreenBackgroundView _setupAuraBackdropViews](v3, "_setupAuraBackdropViews");
  return v4;
}

- (void)_setupAuraBackdropViews
{
  void *v3;
  UIImageView *v4;
  UIImageView *auraView;
  UIView *v6;
  UIView *backgroundView;
  UIVisualEffectView *v8;
  UIVisualEffectView *effectView;
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
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[14];

  v51[12] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("auraLight"), CFSTR("png"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "imageWithContentsOfFile:", v50);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v49);
  auraView = self->_auraView;
  self->_auraView = v4;

  -[UIImageView setAlpha:](self->_auraView, "setAlpha:", 0.0);
  -[UIImageView setContentMode:](self->_auraView, "setContentMode:", 2);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_auraView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[AFUISiriCarPlayFullScreenBackgroundView addSubview:](self, "addSubview:", self->_auraView);
  v6 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v6;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithDynamicProvider:", &__block_literal_global_11);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v48);
  -[UIView setAlpha:](self->_backgroundView, "setAlpha:", 0.0);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[AFUISiriCarPlayFullScreenBackgroundView addSubview:](self, "addSubview:", self->_backgroundView);
  v8 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x24BEBDB38]);
  effectView = self->_effectView;
  self->_effectView = v8;

  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_effectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[AFUISiriCarPlayFullScreenBackgroundView addSubview:](self, "addSubview:", self->_effectView);
  v32 = (void *)MEMORY[0x24BDD1628];
  -[UIImageView topAnchor](self->_auraView, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriCarPlayFullScreenBackgroundView topAnchor](self, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v45;
  -[UIImageView leadingAnchor](self->_auraView, "leadingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriCarPlayFullScreenBackgroundView leadingAnchor](self, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v42;
  -[UIImageView trailingAnchor](self->_auraView, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriCarPlayFullScreenBackgroundView trailingAnchor](self, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v39;
  -[UIImageView bottomAnchor](self->_auraView, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriCarPlayFullScreenBackgroundView bottomAnchor](self, "bottomAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v51[3] = v36;
  -[UIView topAnchor](self->_backgroundView, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriCarPlayFullScreenBackgroundView topAnchor](self, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v51[4] = v33;
  -[UIView leadingAnchor](self->_backgroundView, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriCarPlayFullScreenBackgroundView leadingAnchor](self, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v51[5] = v29;
  -[UIView trailingAnchor](self->_backgroundView, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriCarPlayFullScreenBackgroundView trailingAnchor](self, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v51[6] = v26;
  -[UIView bottomAnchor](self->_backgroundView, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriCarPlayFullScreenBackgroundView bottomAnchor](self, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v51[7] = v23;
  -[UIVisualEffectView topAnchor](self->_effectView, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriCarPlayFullScreenBackgroundView topAnchor](self, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v51[8] = v20;
  -[UIVisualEffectView leadingAnchor](self->_effectView, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriCarPlayFullScreenBackgroundView leadingAnchor](self, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v51[9] = v12;
  -[UIVisualEffectView trailingAnchor](self->_effectView, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriCarPlayFullScreenBackgroundView trailingAnchor](self, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v51[10] = v15;
  -[UIVisualEffectView bottomAnchor](self->_effectView, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriCarPlayFullScreenBackgroundView bottomAnchor](self, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v51[11] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "activateConstraints:", v19);

}

id __66__AFUISiriCarPlayFullScreenBackgroundView__setupAuraBackdropViews__block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 1)
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 1.0, 0.550000012);
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.104699999, 0.104699999, 0.104699999, 0.5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)updateVisibility:(BOOL)a3
{
  _BOOL4 v3;
  UIImageView *auraView;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  auraView = self->_auraView;
  v6 = 0.300000012;
  if (a3)
  {
    v7 = 1.0;
  }
  else
  {
    v6 = 0.0;
    v7 = 0.0;
  }
  -[UIImageView setAlpha:](auraView, "setAlpha:", v6);
  -[UIView setAlpha:](self->_backgroundView, "setAlpha:", v7);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4C0], "colorEffectSaturate:", 3.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v8);

    objc_msgSend(MEMORY[0x24BEBD428], "effectWithBlurRadius:", 22.5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v9);

  }
  -[UIVisualEffectView setBackgroundEffects:](self->_effectView, "setBackgroundEffects:", v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_auraView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
