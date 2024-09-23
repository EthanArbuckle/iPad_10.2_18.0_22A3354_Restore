@implementation HUSoftwareUpdateAnimatedIcon

- (HUSoftwareUpdateAnimatedIcon)initWithFrame:(CGRect)a3
{
  HUSoftwareUpdateAnimatedIcon *v3;
  HUSoftwareUpdateAnimatedIcon *v4;
  uint64_t v5;
  UIImageView *innerGearView;
  uint64_t v7;
  UIImageView *outerGearShadowView;
  uint64_t v9;
  UIImageView *outerGearView;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUSoftwareUpdateAnimatedIcon;
  v3 = -[HUSoftwareUpdateAnimatedIcon initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[HUSoftwareUpdateAnimatedIcon innerGearView](v3, "innerGearView");
    v5 = objc_claimAutoreleasedReturnValue();
    innerGearView = v4->_innerGearView;
    v4->_innerGearView = (UIImageView *)v5;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_innerGearView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUSoftwareUpdateAnimatedIcon addSubview:](v4, "addSubview:", v4->_innerGearView);
    -[HUSoftwareUpdateAnimatedIcon outerGearShadowView](v4, "outerGearShadowView");
    v7 = objc_claimAutoreleasedReturnValue();
    outerGearShadowView = v4->_outerGearShadowView;
    v4->_outerGearShadowView = (UIImageView *)v7;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_outerGearShadowView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUSoftwareUpdateAnimatedIcon addSubview:](v4, "addSubview:", v4->_outerGearShadowView);
    -[HUSoftwareUpdateAnimatedIcon outerGearView](v4, "outerGearView");
    v9 = objc_claimAutoreleasedReturnValue();
    outerGearView = v4->_outerGearView;
    v4->_outerGearView = (UIImageView *)v9;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_outerGearView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUSoftwareUpdateAnimatedIcon addSubview:](v4, "addSubview:", v4->_outerGearView);
    -[HUSoftwareUpdateAnimatedIcon createConstraints](v4, "createConstraints");
  }
  return v4;
}

- (void)createConstraints
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
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  -[UIImageView centerXAnchor](self->_innerGearView, "centerXAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateAnimatedIcon centerXAnchor](self, "centerXAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 1);

  -[UIImageView centerYAnchor](self->_innerGearView, "centerYAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateAnimatedIcon centerYAnchor](self, "centerYAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  -[UIImageView centerXAnchor](self->_outerGearView, "centerXAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateAnimatedIcon centerXAnchor](self, "centerXAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  -[UIImageView centerYAnchor](self->_outerGearView, "centerYAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateAnimatedIcon centerYAnchor](self, "centerYAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scale");
  v17 = 1.0 / v16;

  -[UIImageView centerXAnchor](self->_outerGearShadowView, "centerXAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateAnimatedIcon centerXAnchor](self, "centerXAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setActive:", 1);

  -[UIImageView centerYAnchor](self->_outerGearShadowView, "centerYAnchor");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateAnimatedIcon centerYAnchor](self, "centerYAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v21, v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

}

- (UIImageView)innerGearView
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CEA658]);
  HUImageNamed(CFSTR("HUSoftwareUpdateIconInnerGear"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithImage:", v3);

  objc_msgSend(v4, "setOpaque:", 1);
  return (UIImageView *)v4;
}

- (UIImageView)outerGearShadowView
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CEA658]);
  HUImageNamed(CFSTR("HUSoftwareUpdateIconOuterGearShadow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithImage:", v3);

  return (UIImageView *)v4;
}

- (UIImageView)outerGearView
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CEA658]);
  HUImageNamed(CFSTR("HUSoftwareUpdateIconOuterGear"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithImage:", v3);

  return (UIImageView *)v4;
}

- (void)setAnimating:(BOOL)a3
{
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (self->_animating != a3)
  {
    self->_animating = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.rotation"));
      v14 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v4) = 1086918619;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setByValue:", v5);

      objc_msgSend(v14, "setFillMode:", *MEMORY[0x1E0CD2B60]);
      objc_msgSend(v14, "setRemovedOnCompletion:", 0);
      objc_msgSend(v14, "setDuration:", 10.0);
      objc_msgSend(v14, "setRepeatDuration:", INFINITY);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTimingFunction:", v6);

      -[UIImageView layer](self->_outerGearView, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addAnimation:forKey:", v14, CFSTR("outerRotation"));

      -[UIImageView layer](self->_outerGearShadowView, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAnimation:forKey:", v14, CFSTR("shadowRotation"));

      LODWORD(v9) = -1060565029;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setByValue:", v10);

      -[UIImageView layer](self->_innerGearView, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addAnimation:forKey:", v14, CFSTR("innerRotation"));

    }
    else
    {
      -[UIImageView layer](self->_innerGearView, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeAllAnimations");

      -[UIImageView layer](self->_outerGearShadowView, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeAllAnimations");

      -[UIImageView layer](self->_outerGearView, "layer");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeAllAnimations");
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outerGearView, 0);
  objc_storeStrong((id *)&self->_outerGearShadowView, 0);
  objc_storeStrong((id *)&self->_innerGearView, 0);
}

@end
