@implementation FULoadingView

- (FULoadingView)init
{
  FULoadingView *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  FULoadingView *v15;
  objc_super v17;
  _QWORD v18[6];

  v18[5] = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)FULoadingView;
  v2 = -[FULoadingView init](&v17, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v3, "startAnimating");
    +[TLKLabel secondaryLabel](FULabel, "secondaryLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFont:", v5);

    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Loading Flight Status…"), CFSTR("Loading Flight Status…"), CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", v7);

    -[FULoadingView addSubview:](v2, "addSubview:", v4);
    -[FULoadingView addSubview:](v2, "addSubview:", v3);
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v2, 8, 0, v4, 8, 3.0, 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = 1128792064;
    objc_msgSend(v8, "setPriority:", v9);
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v2, 9, 0, v4, 9, 1.0, -26.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v2, 10, 0, v4, 10, 1.0, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v11;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v2, 10, 0, v3, 10, 1.0, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v12;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 5, 0, v3, 6, 1.0, 12.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[3] = v13;
    v18[4] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FULoadingView addConstraints:](v2, "addConstraints:", v14);

    -[FULoadingView setLoadingLabel:](v2, "setLoadingLabel:", v4);
    v15 = v2;

  }
  return v2;
}

- (FULabel)loadingLabel
{
  return (FULabel *)objc_getProperty(self, a2, 416, 1);
}

- (void)setLoadingLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingLabel, 0);
}

@end
