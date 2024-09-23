@implementation FUErrorView

- (FUErrorView)init
{
  FUErrorView *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  FUErrorView *v11;
  objc_super v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)FUErrorView;
  v2 = -[FUErrorView init](&v13, sel_init);
  if (v2)
  {
    +[TLKLabel secondaryLabel](FULabel, "secondaryLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNumberOfLines:", 2);
    objc_msgSend(v3, "setTextAlignment:", 1);
    objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[FUErrorView addSubview:](v2, "addSubview:", v3);
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v2, 8, 0, v3, 8, 3.0, 0.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = 1128792064;
    objc_msgSend(v4, "setPriority:", v5);
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v2, 7, 0, v3, 7, 1.0, 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v2, 10, 0, v3, 10, 1.0, 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v7;
    v14[2] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUErrorView addConstraints:](v2, "addConstraints:", v8);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Flight information unavailable"), CFSTR("Flight information unavailable"), CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setText:", v10);

    -[FUErrorView setErrorLabel:](v2, "setErrorLabel:", v3);
    v11 = v2;

  }
  return v2;
}

- (FULabel)errorLabel
{
  return (FULabel *)objc_getProperty(self, a2, 416, 1);
}

- (void)setErrorLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorLabel, 0);
}

@end
