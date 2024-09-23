@implementation FaceIdAlertViewController

- (LAUIPearlGlyphView)glyph
{
  return (LAUIPearlGlyphView *)objc_loadWeakRetained((id *)&self->_glyph);
}

- (void)setGlyph:(id)a3
{
  id v4;
  UIViewController *v5;
  void *v6;
  _QWORD v8[5];

  v4 = objc_storeWeak((id *)&self->_glyph, a3);
  if (a3)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100007634;
    v8[3] = &unk_100079B08;
    v8[4] = self;
    v5 = sub_100007634((uint64_t)v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[FaceIdAlertViewController _setHeaderContentViewController:](self, "_setHeaderContentViewController:", v6);

  }
  else
  {
    -[FaceIdAlertViewController _setHeaderContentViewController:](self, "_setHeaderContentViewController:", 0);
  }

}

- (void)shake
{
  LAUIPearlGlyphView **p_glyph;
  id WeakRetained;
  id v5;

  p_glyph = &self->_glyph;
  WeakRetained = objc_loadWeakRetained((id *)&self->_glyph);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_glyph);
    objc_msgSend(v5, "setState:animated:", 4, 1);

  }
  else
  {
    -[FaceIdAlertViewController _shakeTitleLabel](self, "_shakeTitleLabel");
  }
}

- (void)_shakeTitleLabel
{
  id v2;
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
  _QWORD v24[5];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100007BD4;
  v24[3] = &unk_100079B30;
  v24[4] = self;
  v2 = sub_100007BD4((uint64_t)v24);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
    objc_msgSend(v5, "removeAllAnimations");
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
    objc_msgSend(v5, "position");
    v13 = v12 + 60.0;
    *(float *)&v13 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v13));
    objc_msgSend(v6, "setFromValue:", v14);

    objc_msgSend(v5, "addAnimation:forKey:", v6, CFSTR("position"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("position.x")));
    LODWORD(v16) = 1036831949;
    LODWORD(v17) = 0.25;
    LODWORD(v18) = 0.25;
    LODWORD(v19) = 1.0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v17, v16, v18, v19));
    objc_msgSend(v15, "setTimingFunction:", v20);

    objc_msgSend(v15, "setDuration:", 0.0700000003);
    objc_msgSend(v15, "setFillMode:", kCAFillModeBackwards);
    objc_msgSend(v5, "position");
    v22 = v21 + -60.0;
    *(float *)&v22 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v22));
    objc_msgSend(v15, "setFromValue:", v23);

    objc_msgSend(v5, "addAnimation:forKey:", v15, CFSTR("force"));
  }

}

- (void)dismissWithDelay:(double)a3 completion:(id)a4
{
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];

  v8 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100007DD0;
  v9[3] = &unk_100079A08;
  v9[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007EAC;
  v7[3] = &unk_100079B58;
  v7[4] = self;
  v6 = v8;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 2, v9, v7, 0.2, a3);

}

- (int)_preferredStatusBarVisibility
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void (**v5)(void);
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FaceIdAlertViewController;
  -[AlertController viewDidDisappear:](&v6, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdAlertViewController onDismiss](self, "onDismiss"));

  if (v4)
  {
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[FaceIdAlertViewController onDismiss](self, "onDismiss"));
    v5[2]();

  }
}

- (id)onDismiss
{
  return self->_onDismiss;
}

- (void)setOnDismiss:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onDismiss, 0);
  objc_destroyWeak((id *)&self->_glyph);
}

@end
