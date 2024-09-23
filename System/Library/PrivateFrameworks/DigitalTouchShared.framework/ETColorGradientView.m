@implementation ETColorGradientView

- (ETColorGradientView)initWithFrame:(CGRect)a3
{
  ETColorGradientView *v3;
  void *v4;
  id v5;
  uint64_t v6;
  UIImageView *imageView;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ETColorGradientView;
  v3 = -[ETColorGradientView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if (SetupSpecValuesIfNeeded_onceToken_0 != -1)
      dispatch_once(&SetupSpecValuesIfNeeded_onceToken_0, &__block_literal_global_1);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ETColorGradientView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_alloc(MEMORY[0x24BDF6AE8]);
    -[ETColorGradientView bounds](v3, "bounds");
    v6 = objc_msgSend(v5, "initWithFrame:");
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v6;

    objc_msgSend(MEMORY[0x24BDF6AC8], "etImageNamed:", CFSTR("color-wheel-gradient"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v3->_imageView, "setImage:", v8);

    -[ETColorGradientView addSubview:](v3, "addSubview:", v3->_imageView);
  }
  return v3;
}

- (void)prepareToAnimateColorWheelWithRotation:(double)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  CGFloat MidY;
  void *v11;
  id v12;
  id v13;
  CGPath *Mutable;
  id v15;
  CGRect v16;
  CGRect v17;

  -[ETColorGradientView layer](self, "layer");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[ETColorGradientView bounds](self, "bounds");
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  MidX = CGRectGetMidX(v16);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  MidY = CGRectGetMidY(v17);
  objc_msgSend(MEMORY[0x24BDE5758], "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLineWidth:", 49.5);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "setFillColor:", objc_msgSend(v12, "CGColor"));

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "setStrokeColor:", objc_msgSend(v13, "CGColor"));

  objc_msgSend(v11, "setLineCap:", *MEMORY[0x24BDE5CE8]);
  objc_msgSend(v15, "bounds");
  objc_msgSend(v11, "setFrame:");
  Mutable = CGPathCreateMutable();
  CGPathAddArc(Mutable, 0, MidX, MidY, 52.25, a3 + 3.14159265, a3 + 9.42477796, 0);
  objc_msgSend(v11, "setPath:", Mutable);
  CFRelease(Mutable);
  objc_msgSend(v15, "setMask:", v11);

}

- (void)revealColorWheelWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29;

  v4 = a3;
  -[ETColorGradientView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStrokeStart:", 0.4999);
  objc_msgSend(v6, "setStrokeEnd:", 0.5);
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("strokeEnd"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDuration:", 0.275);
  v8 = *MEMORY[0x24BDE5D18];
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D18]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimingFunction:", v9);

  v10 = *MEMORY[0x24BDE5978];
  objc_msgSend(v7, "setFillMode:", *MEMORY[0x24BDE5978]);
  LODWORD(v11) = 0.5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFromValue:", v12);

  LODWORD(v13) = 1.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setToValue:", v14);

  objc_msgSend(v7, "setRemovedOnCompletion:", 0);
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("strokeStart"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDuration:", 0.275);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTimingFunction:", v16);

  objc_msgSend(v15, "setFillMode:", v10);
  LODWORD(v17) = 0.5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFromValue:", v18);

  LODWORD(v19) = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setToValue:", v20);

  objc_msgSend(v15, "setRemovedOnCompletion:", 0);
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  v21 = (void *)MEMORY[0x24BDE57D8];
  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = __54__ETColorGradientView_revealColorWheelWithCompletion___block_invoke;
  v27 = &unk_24F6E6B00;
  v28 = v5;
  v29 = v4;
  v22 = v4;
  v23 = v5;
  objc_msgSend(v21, "setCompletionBlock:", &v24);
  objc_msgSend(v6, "addAnimation:forKey:", v7, CFSTR("strokeEnd"), v24, v25, v26, v27);
  objc_msgSend(v6, "addAnimation:forKey:", v15, CFSTR("strokeStart"));

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

uint64_t __54__ETColorGradientView_revealColorWheelWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setMask:", 0);
  objc_msgSend(*(id *)(a1 + 32), "removeAllAnimations");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)hideColorWheelWithRotation:(double)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  ETColorGradientView *v32;
  id v33;

  v29 = a4;
  -[ETColorGradientView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mask");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStrokeStart:", 0.0);
  objc_msgSend(v7, "setStrokeEnd:", 1.0);
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("strokeEnd"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDuration:", 0.275);
  v9 = *MEMORY[0x24BDE5D28];
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimingFunction:", v10);

  v11 = *MEMORY[0x24BDE5978];
  objc_msgSend(v8, "setFillMode:", *MEMORY[0x24BDE5978]);
  LODWORD(v12) = 1.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFromValue:", v13);

  LODWORD(v14) = 0.5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setToValue:", v15);

  objc_msgSend(v8, "setRemovedOnCompletion:", 0);
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("strokeStart"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDuration:", 0.275);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTimingFunction:", v17);

  objc_msgSend(v16, "setFillMode:", v11);
  LODWORD(v18) = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFromValue:", v19);

  LODWORD(v20) = 0.5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setToValue:", v21);

  objc_msgSend(v16, "setRemovedOnCompletion:", 0);
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.rotation.z"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDuration:", 0.275);
  objc_msgSend(v22, "setAdditive:", 1);
  objc_msgSend(v22, "setRemovedOnCompletion:", 0);
  objc_msgSend(v22, "setFillMode:", v11);
  *(float *)&v23 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setToValue:", v24);

  objc_msgSend(v22, "setRemovedOnCompletion:", 0);
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  v25 = (void *)MEMORY[0x24BDE57D8];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __61__ETColorGradientView_hideColorWheelWithRotation_completion___block_invoke;
  v30[3] = &unk_24F6E6DD8;
  v31 = v6;
  v32 = self;
  v33 = v29;
  v26 = v29;
  v27 = v6;
  objc_msgSend(v25, "setCompletionBlock:", v30);
  objc_msgSend(v7, "addAnimation:forKey:", v8, CFSTR("strokeEnd"));
  objc_msgSend(v7, "addAnimation:forKey:", v16, CFSTR("strokeStart"));
  -[UIImageView layer](self->_imageView, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addAnimation:forKey:", v22, CFSTR("transform.rotation.z"));

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

uint64_t __61__ETColorGradientView_hideColorWheelWithRotation_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setMask:", 0);
  objc_msgSend(*(id *)(a1 + 32), "removeAllAnimations");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 416), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllAnimations");

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
