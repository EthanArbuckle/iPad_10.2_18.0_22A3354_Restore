@implementation LACUILockView

- (LACUILockView)init
{
  LACUILockView *v2;
  void *v3;
  void *v4;
  LACUIPackagedView *v5;
  LACUIPackagedView *packagedView;
  void *v7;
  uint64_t v8;
  CAShapeLayer *body;
  void *v10;
  uint64_t v11;
  CAShapeLayer *shackle;
  uint64_t v13;
  UIColor *color;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)LACUILockView;
  v2 = -[LACUILockView initWithFrame:](&v16, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("lock"), CFSTR("ca"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = -[LACUIPackagedView initWithURL:error:]([LACUIPackagedView alloc], "initWithURL:error:", v4, 0);
    packagedView = v2->_packagedView;
    v2->_packagedView = v5;

    -[LACUIPackagedView layer](v2->_packagedView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LACUILayerFindSublayerWithName(v7, CFSTR("body"));
    v8 = objc_claimAutoreleasedReturnValue();
    body = v2->_body;
    v2->_body = (CAShapeLayer *)v8;

    -[LACUIPackagedView layer](v2->_packagedView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LACUILayerFindSublayerWithName(v10, CFSTR("shackle"));
    v11 = objc_claimAutoreleasedReturnValue();
    shackle = v2->_shackle;
    v2->_shackle = (CAShapeLayer *)v11;

    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v13 = objc_claimAutoreleasedReturnValue();
    color = v2->_color;
    v2->_color = (UIColor *)v13;

    -[LACUILockView _setup](v2, "_setup");
  }
  return v2;
}

- (void)setColor:(id)a3
{
  id v5;
  CAShapeLayer *body;
  id v7;
  CAShapeLayer *shackle;
  id v9;

  objc_storeStrong((id *)&self->_color, a3);
  v5 = a3;
  body = self->_body;
  v7 = objc_retainAutorelease(v5);
  -[CAShapeLayer setFillColor:](body, "setFillColor:", objc_msgSend(v7, "CGColor"));
  shackle = self->_shackle;
  v9 = objc_retainAutorelease(v7);
  -[CAShapeLayer setStrokeColor:](shackle, "setStrokeColor:", objc_msgSend(v9, "CGColor"));

}

- (void)setState:(int64_t)a3
{
  LACUIPackagedView *packagedView;
  const __CFString *v6;
  _QWORD v7[4];
  id v8[2];
  id location;

  self->_state = a3;
  objc_initWeak(&location, self);
  packagedView = self->_packagedView;
  if ((unint64_t)a3 > 2)
    v6 = CFSTR("Invalid");
  else
    v6 = off_2510F81B8[a3];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __26__LACUILockView_setState___block_invoke;
  v7[3] = &unk_2510F8198;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  -[LACUIPackagedView setStateNamed:animated:completion:](packagedView, "setStateNamed:animated:completion:", v6, 1, v7);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __26__LACUILockView_setState___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *(_QWORD *)(a1 + 40) == 2)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[54], "setStateNamed:animated:", CFSTR("Locked"), 0);
    WeakRetained = v3;
  }

}

- (void)_setup
{
  void *v3;
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
  _QWORD v17[5];

  v17[4] = *MEMORY[0x24BDAC8D0];
  -[LACUILockView addSubview:](self, "addSubview:", self->_packagedView);
  -[LACUIPackagedView setTranslatesAutoresizingMaskIntoConstraints:](self->_packagedView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = (void *)MEMORY[0x24BDD1628];
  -[LACUIPackagedView leadingAnchor](self->_packagedView, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUILockView leadingAnchor](self, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v14;
  -[LACUIPackagedView trailingAnchor](self->_packagedView, "trailingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUILockView trailingAnchor](self, "trailingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v5;
  -[LACUIPackagedView topAnchor](self->_packagedView, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUILockView topAnchor](self, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v8;
  -[LACUIPackagedView bottomAnchor](self->_packagedView, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUILockView bottomAnchor](self, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activateConstraints:", v12);

}

- (int64_t)state
{
  return self->_state;
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_packagedView, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_shackle, 0);
}

@end
