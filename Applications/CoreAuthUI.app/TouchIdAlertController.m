@implementation TouchIdAlertController

- (TouchIdAlertController)init
{
  TouchIdAlertController *v2;
  TouchIdAlertController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TouchIdAlertController;
  v2 = -[TouchIdAlertController init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[TouchIdAlertController setPreferredStyle:](v2, "setPreferredStyle:", 1);
    -[TouchIdAlertController _setupHeaderContentViewController](v3, "_setupHeaderContentViewController");
  }
  return v3;
}

- (void)_setupHeaderContentViewController
{
  UIViewController *v3;
  id v4;

  v3 = sub_100023EF4();
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  -[TouchIdAlertController _setHeaderContentViewController:](self, "_setHeaderContentViewController:", v4);

}

- (void)shake
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  id v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TouchIdAlertController _headerContentViewController](self, "_headerContentViewController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TouchIdAlertController _headerContentViewController](self, "_headerContentViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));

    objc_msgSend(v24, "removeAllAnimations");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", CFSTR("position.x")));
    objc_msgSend(v6, "setMass:", 1.20000005);
    objc_msgSend(v6, "setStiffness:", 1200.0);
    objc_msgSend(v6, "setDamping:", 12.0);
    LODWORD(v7) = 1028389654;
    LODWORD(v8) = 990057071;
    LODWORD(v9) = 1059712716;
    LODWORD(v10) = 1.0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v7, v8, v9, v10));
    objc_msgSend(v6, "setTimingFunction:", v11);

    objc_msgSend(v6, "setDuration:", 0.860000014);
    objc_msgSend(v6, "setVelocity:", 0.0);
    objc_msgSend(v6, "setFillMode:", kCAFillModeBackwards);
    objc_msgSend(v24, "position");
    v13 = v12 + 60.0;
    *(float *)&v13 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v13));
    objc_msgSend(v6, "setFromValue:", v14);

    objc_msgSend(v24, "addAnimation:forKey:", v6, CFSTR("position"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("position.x")));
    LODWORD(v16) = 1036831949;
    LODWORD(v17) = 0.25;
    LODWORD(v18) = 0.25;
    LODWORD(v19) = 1.0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v17, v16, v18, v19));
    objc_msgSend(v15, "setTimingFunction:", v20);

    objc_msgSend(v15, "setDuration:", 0.0700000003);
    objc_msgSend(v15, "setFillMode:", kCAFillModeBackwards);
    objc_msgSend(v24, "position");
    v22 = v21 + -60.0;
    *(float *)&v22 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v22));
    objc_msgSend(v15, "setFromValue:", v23);

    objc_msgSend(v24, "addAnimation:forKey:", v15, CFSTR("force"));
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void (**onDismiss)(void);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TouchIdAlertController;
  -[TouchIdAlertController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  onDismiss = (void (**)(void))self->_onDismiss;
  if (onDismiss)
    onDismiss[2]();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)onDismiss
{
  return self->_onDismiss;
}

- (void)setOnDismiss:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onDismiss, 0);
}

@end
