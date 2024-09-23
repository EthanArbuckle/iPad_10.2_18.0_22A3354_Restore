@implementation WFRemoteFileStatusView

- (WFRemoteFileStatusView)initWithFrame:(CGRect)a3
{
  WFRemoteFileStatusView *v3;
  void *v4;
  UIView *v5;
  UIView *containerView;
  UIView *v7;
  UILabel *v8;
  void *v9;
  UILabel *statusLabel;
  UIActivityIndicatorView *v11;
  UIActivityIndicatorView *indicatorView;
  UIButton *v13;
  void *v14;
  UIButton *recoveryButton;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSArray *v22;
  void *v23;
  void *v24;
  NSArray *emptyConstraints;
  NSArray *v26;
  NSArray *v27;
  void *v28;
  void *v29;
  NSArray *loadingContraints;
  NSArray *v31;
  NSArray *v32;
  void *v33;
  void *v34;
  NSArray *errorConstraints;
  WFRemoteFileStatusView *v36;
  UIButton *v38;
  UILabel *v39;
  UIActivityIndicatorView *v40;
  objc_super v41;
  _QWORD v42[4];

  v42[3] = *MEMORY[0x24BDAC8D0];
  v41.receiver = self;
  v41.super_class = (Class)WFRemoteFileStatusView;
  v3 = -[WFRemoteFileStatusView initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRemoteFileStatusView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFRemoteFileStatusView addSubview:](v3, "addSubview:", v5);
    containerView = v3->_containerView;
    v3->_containerView = v5;
    v7 = v5;

    v8 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v8, "setTextColor:", v9);

    -[UILabel setNumberOfLines:](v8, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v8, "setTextAlignment:", 1);
    -[UIView addSubview:](v7, "addSubview:", v8);
    statusLabel = v3->_statusLabel;
    v3->_statusLabel = v8;
    v39 = v8;

    v11 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIActivityIndicatorView setHidden:](v11, "setHidden:", 1);
    -[UIView addSubview:](v7, "addSubview:", v11);
    -[UIActivityIndicatorView startAnimating](v11, "startAnimating");
    indicatorView = v3->_indicatorView;
    v3->_indicatorView = v11;
    v40 = v11;

    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v13 = (UIButton *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setHidden:](v13, "setHidden:", 1);
    WFLocalizedString(CFSTR("Retry"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v13, "setTitle:forState:", v14, 0);

    -[UIButton addTarget:action:forControlEvents:](v13, "addTarget:action:forControlEvents:", v3, sel_recoveryButtonTapped, 64);
    -[UIView addSubview:](v7, "addSubview:", v13);
    recoveryButton = v3->_recoveryButton;
    v3->_recoveryButton = v13;
    v38 = v13;

    v16 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 9, 0, v3, 9, 1.0, 0.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v17;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 7, -1, v3, 7, 1.0, -40.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v18;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 10, 0, v3, 10, 1.0, 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activateConstraints:", v20);

    _NSDictionaryOfVariableBindings(CFSTR("statusLabel, indicatorView, recoveryButton"), v39, v40, v38, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (NSArray *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[statusLabel]|"), 0, 0, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v22, "addObjectsFromArray:", v23);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[statusLabel]|"), 0, 0, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v22, "addObjectsFromArray:", v24);

    emptyConstraints = v3->_emptyConstraints;
    v3->_emptyConstraints = v22;
    v26 = v22;

    v27 = (NSArray *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[statusLabel]-[indicatorView]|"), 1024, 0, v21);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v27, "addObjectsFromArray:", v28);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[statusLabel]|"), 0, 0, v21);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v27, "addObjectsFromArray:", v29);

    loadingContraints = v3->_loadingContraints;
    v3->_loadingContraints = v27;
    v31 = v27;

    v32 = (NSArray *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[statusLabel]-[recoveryButton]|"), 512, 0, v21);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v32, "addObjectsFromArray:", v33);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[statusLabel]|"), 0, 0, v21);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v32, "addObjectsFromArray:", v34);

    errorConstraints = v3->_errorConstraints;
    v3->_errorConstraints = v32;

    -[WFRemoteFileStatusView setLoading](v3, "setLoading");
    v36 = v3;

  }
  return v3;
}

- (void)recoveryButtonTapped
{
  id v3;

  -[WFRemoteFileStatusView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusViewDidPressRecoveryButton:", self);

}

- (void)setEmptyWithLabel:(BOOL)a3
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
  id v13;

  if (a3)
  {
    WFLocalizedString(CFSTR("This folder is empty"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRemoteFileStatusView statusLabel](self, "statusLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v4);

  }
  else
  {
    -[WFRemoteFileStatusView statusLabel](self, "statusLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", 0);
  }

  -[WFRemoteFileStatusView recoveryButton](self, "recoveryButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 1);

  -[WFRemoteFileStatusView indicatorView](self, "indicatorView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 1);

  v8 = (void *)MEMORY[0x24BDD1628];
  -[WFRemoteFileStatusView errorConstraints](self, "errorConstraints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deactivateConstraints:", v9);

  v10 = (void *)MEMORY[0x24BDD1628];
  -[WFRemoteFileStatusView loadingContraints](self, "loadingContraints");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deactivateConstraints:", v11);

  v12 = (void *)MEMORY[0x24BDD1628];
  -[WFRemoteFileStatusView emptyConstraints](self, "emptyConstraints");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activateConstraints:", v13);

}

- (void)setLoading
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
  id v12;

  WFLocalizedString(CFSTR("Loading…"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoteFileStatusView statusLabel](self, "statusLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

  -[WFRemoteFileStatusView recoveryButton](self, "recoveryButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  -[WFRemoteFileStatusView indicatorView](self, "indicatorView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 0);

  v7 = (void *)MEMORY[0x24BDD1628];
  -[WFRemoteFileStatusView emptyConstraints](self, "emptyConstraints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deactivateConstraints:", v8);

  v9 = (void *)MEMORY[0x24BDD1628];
  -[WFRemoteFileStatusView errorConstraints](self, "errorConstraints");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deactivateConstraints:", v10);

  v11 = (void *)MEMORY[0x24BDD1628];
  -[WFRemoteFileStatusView loadingContraints](self, "loadingContraints");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activateConstraints:", v12);

}

- (void)setError:(id)a3
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
  id v15;

  v15 = a3;
  objc_msgSend(v15, "localizedFailureReason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(v15, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[WFRemoteFileStatusView statusLabel](self, "statusLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  if (!v4)
  -[WFRemoteFileStatusView recoveryButton](self, "recoveryButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 0);

  -[WFRemoteFileStatusView indicatorView](self, "indicatorView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", 1);

  v9 = (void *)MEMORY[0x24BDD1628];
  -[WFRemoteFileStatusView emptyConstraints](self, "emptyConstraints");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deactivateConstraints:", v10);

  v11 = (void *)MEMORY[0x24BDD1628];
  -[WFRemoteFileStatusView loadingContraints](self, "loadingContraints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deactivateConstraints:", v12);

  v13 = (void *)MEMORY[0x24BDD1628];
  -[WFRemoteFileStatusView errorConstraints](self, "errorConstraints");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activateConstraints:", v14);

}

- (WFRemoteFileStatusViewDelegate)delegate
{
  return (WFRemoteFileStatusViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (UIActivityIndicatorView)indicatorView
{
  return self->_indicatorView;
}

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (UIButton)recoveryButton
{
  return self->_recoveryButton;
}

- (NSArray)emptyConstraints
{
  return self->_emptyConstraints;
}

- (NSArray)loadingContraints
{
  return self->_loadingContraints;
}

- (NSArray)errorConstraints
{
  return self->_errorConstraints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorConstraints, 0);
  objc_storeStrong((id *)&self->_loadingContraints, 0);
  objc_storeStrong((id *)&self->_emptyConstraints, 0);
  objc_storeStrong((id *)&self->_recoveryButton, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
