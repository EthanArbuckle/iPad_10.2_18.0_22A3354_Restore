@implementation LACUIFaceIDSpinnerView

- (LACUIFaceIDSpinnerView)init
{
  return -[LACUIFaceIDSpinnerView initWithInitialState:](self, "initWithInitialState:", 0);
}

- (LACUIFaceIDSpinnerView)initWithInitialState:(int64_t)a3
{
  LACUIFaceIDSpinnerView *v4;
  void *v5;
  void *v6;
  LACUIPackagedView *v7;
  LACUIPackagedView *packagedView;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  CALayer *faceLayer;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)LACUIFaceIDSpinnerView;
  v4 = -[LACUIFaceIDSpinnerView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLForResource:withExtension:", CFSTR("face-id-spinner"), CFSTR("ca"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[LACUIPackagedView initWithURL:error:]([LACUIPackagedView alloc], "initWithURL:error:", v6, 0);
    packagedView = v4->_packagedView;
    v4->_packagedView = v7;

    if ((unint64_t)a3 > 3)
      v9 = CFSTR("Invalid");
    else
      v9 = off_2510F84B8[a3];
    -[LACUIPackagedView setStateNamed:animated:](v4->_packagedView, "setStateNamed:animated:", v9, 0);
    -[LACUIPackagedView rootLayer](v4->_packagedView, "rootLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LACUILayerFindSublayerWithName(v10, CFSTR("face-rounder"));
    v11 = objc_claimAutoreleasedReturnValue();
    faceLayer = v4->_faceLayer;
    v4->_faceLayer = (CALayer *)v11;

    -[LACUIFaceIDSpinnerView _setup](v4, "_setup");
  }
  return v4;
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
  -[LACUIFaceIDSpinnerView addSubview:](self, "addSubview:", self->_packagedView);
  -[LACUIPackagedView setTranslatesAutoresizingMaskIntoConstraints:](self->_packagedView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = (void *)MEMORY[0x24BDD1628];
  -[LACUIPackagedView leadingAnchor](self->_packagedView, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUIFaceIDSpinnerView leadingAnchor](self, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v14;
  -[LACUIPackagedView trailingAnchor](self->_packagedView, "trailingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUIFaceIDSpinnerView trailingAnchor](self, "trailingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v5;
  -[LACUIPackagedView topAnchor](self->_packagedView, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUIFaceIDSpinnerView topAnchor](self, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v8;
  -[LACUIPackagedView bottomAnchor](self->_packagedView, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUIFaceIDSpinnerView bottomAnchor](self, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activateConstraints:", v12);

}

- (void)setState:(int64_t)a3
{
  LACUIPackagedView *packagedView;
  const __CFString *v4;

  self->_state = a3;
  packagedView = self->_packagedView;
  if ((unint64_t)a3 > 3)
    v4 = CFSTR("Invalid");
  else
    v4 = off_2510F84B8[a3];
  -[LACUIPackagedView setStateNamed:animated:completion:](packagedView, "setStateNamed:animated:completion:", v4, 1, &__block_literal_global_4);
}

- (int64_t)state
{
  return self->_state;
}

- (CALayer)faceLayer
{
  return self->_faceLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceLayer, 0);
  objc_storeStrong((id *)&self->_packagedView, 0);
}

@end
