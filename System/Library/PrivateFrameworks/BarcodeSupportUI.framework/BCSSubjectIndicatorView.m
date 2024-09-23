@implementation BCSSubjectIndicatorView

- (BCSSubjectIndicatorView)initWithFrame:(CGRect)a3
{
  BCSSubjectIndicatorView *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  UIImageView *imageView;
  BCSSubjectIndicatorView *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BCSSubjectIndicatorView;
  v3 = -[BCSSubjectIndicatorView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageNamed:inBundle:", CFSTR("FocusIndicator"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "size");
    objc_msgSend(v6, "resizableImageWithCapInsets:resizingMode:", 1, v7 * 0.5, v8 * 0.5, v7 * 0.5, v8 * 0.5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v9);
    imageView = v3->__imageView;
    v3->__imageView = (UIImageView *)v10;

    -[BCSSubjectIndicatorView addSubview:](v3, "addSubview:", v3->__imageView);
    v12 = v3;

  }
  return v3;
}

- (BOOL)isInactive
{
  void *v2;
  char v3;

  -[BCSSubjectIndicatorView _imageView](self, "_imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHighlighted");

  return v3;
}

- (void)setInactive:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[BCSSubjectIndicatorView _imageView](self, "_imageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHighlighted:", v3);

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_referenceBounds");
  v4 = v3;
  v6 = v5;

  objc_msgSend((id)objc_opt_class(), "_fixedSubjectIndicatorSizeForReferenceBounds:", v4, v6);
  v8 = v7 + -3.0 + -3.0;
  v10 = v9 + -3.0 + -3.0;
  result.height = v10;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  v12.receiver = self;
  v12.super_class = (Class)BCSSubjectIndicatorView;
  -[BCSSubjectIndicatorView layoutSubviews](&v12, sel_layoutSubviews);
  -[BCSSubjectIndicatorView bounds](self, "bounds");
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  CGRectGetMidX(v13);
  UIRoundToViewScale();
  v8 = v7;
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  CGRectGetMidY(v14);
  UIRoundToViewScale();
  v10 = v9;
  -[BCSSubjectIndicatorView _imageView](self, "_imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBounds:", x + -3.0, y + -3.0, width + 6.0, height + 6.0);
  objc_msgSend(v11, "setCenter:", v8, v10);

}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  BOOL v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[6];

  v5 = a3;
  -[BCSSubjectIndicatorView _imageView](self, "_imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSSubjectIndicatorView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "animationForKey:", CFSTR("opacity"));
  v10 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "animationForKey:", CFSTR("transform"));
  v11 = objc_claimAutoreleasedReturnValue();

  -[BCSSubjectIndicatorView alpha](self, "alpha");
  if (v5)
    v13 = 0.0;
  else
    v13 = 1.0;
  if (v5 && !a4)
  {
    objc_msgSend(v8, "removeAnimationForKey:", CFSTR("opacity"));
    objc_msgSend(v9, "removeAnimationForKey:", CFSTR("transform"));
LABEL_7:
    -[BCSSubjectIndicatorView setAlpha:](self, "setAlpha:", v13);
    goto LABEL_16;
  }
  if (v12 == v13)
    goto LABEL_16;
  if (!a4)
    goto LABEL_7;
  if (v5)
  {
    v14 = (void *)MEMORY[0x24BEBDB00];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __46__BCSSubjectIndicatorView_setHidden_animated___block_invoke;
    v24[3] = &unk_250863AD8;
    v24[4] = self;
    v24[5] = 0;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __46__BCSSubjectIndicatorView_setHidden_animated___block_invoke_2;
    v22[3] = &unk_2508638D0;
    v22[4] = self;
    v23 = v9;
    objc_msgSend(v14, "animateWithDuration:delay:options:animations:completion:", 6, v24, v22, 0.25, 0.0);
    v15 = v23;
  }
  else
  {
    if (!(v11 | v10))
    {
      -[BCSSubjectIndicatorView layoutIfNeeded](self, "layoutIfNeeded");
      memset(&v21, 0, sizeof(v21));
      CGAffineTransformMakeScale(&v21, 1.22279793, 1.22279793);
      v20 = v21;
      objc_msgSend(v7, "setTransform:", &v20);
    }
    v16 = (void *)MEMORY[0x24BEBDB00];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __46__BCSSubjectIndicatorView_setHidden_animated___block_invoke_3;
    v17[3] = &unk_250863C68;
    v17[4] = self;
    v19 = (v11 | v10) == 0;
    v18 = v7;
    objc_msgSend(v16, "animateWithDuration:delay:options:animations:completion:", 131078, v17, 0, 0.233333333, 0.0);
    v15 = v18;
  }

LABEL_16:
}

uint64_t __46__BCSSubjectIndicatorView_setHidden_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

void __46__BCSSubjectIndicatorView_setHidden_animated___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "alpha");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 40), "animationForKey:", CFSTR("transform"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == 0.0 && v4 != 0)
    objc_msgSend(*(id *)(a1 + 40), "removeAnimationForKey:", CFSTR("transform"));
}

uint64_t __46__BCSSubjectIndicatorView_setHidden_animated___block_invoke_3(uint64_t a1)
{
  uint64_t result;
  void *v3;
  __int128 v4;
  _OWORD v5[3];

  result = objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  if (*(_BYTE *)(a1 + 48))
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v5[0] = *MEMORY[0x24BDBD8B8];
    v5[1] = v4;
    v5[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    return objc_msgSend(v3, "setTransform:", v5);
  }
  return result;
}

- (void)startScalingWithExpansionWidth:(double)a3 duration:(double)a4 repeatCount:(unint64_t)a5
{
  -[BCSSubjectIndicatorView startScalingWithExpansionWidth:duration:repeatCount:timingFunction:](self, "startScalingWithExpansionWidth:duration:repeatCount:timingFunction:", a5, 0, a3, a4);
}

- (void)startScalingWithExpansionWidth:(double)a3 duration:(double)a4 repeatCount:(unint64_t)a5 timingFunction:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _OWORD v24[8];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  -[BCSSubjectIndicatorView _imageView](self, "_imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "animationForKey:", CFSTR("transform"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    -[BCSSubjectIndicatorView bounds](self, "bounds");
    if (v14 != 0.0)
    {
      v15 = v14;
      if (!v10)
      {
        objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D18]);
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("transform.scale"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTimingFunction:", v10);
      objc_msgSend(v16, "setDuration:", a4);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15 / (v15 + a3 * 2.0));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v17;
      v25[1] = &unk_250869918;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setValues:", v18);

      *(float *)&v19 = (float)a5;
      objc_msgSend(v16, "setRepeatCount:", v19);
      objc_msgSend(v16, "setAutoreverses:", 1);
      objc_msgSend(v12, "addAnimation:forKey:", v16, CFSTR("transform"));
      v20 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
      v24[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
      v24[5] = v20;
      v21 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
      v24[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
      v24[7] = v21;
      v22 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
      v24[0] = *MEMORY[0x24BDE5598];
      v24[1] = v22;
      v23 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
      v24[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
      v24[3] = v23;
      objc_msgSend(v12, "setTransform:", v24);

    }
  }

}

- (void)stopScalingWithDuration:(double)a3
{
  void *v4;
  void *v5;
  __int128 *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[8];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  -[BCSSubjectIndicatorView _imageView](self, "_imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (__int128 *)MEMORY[0x24BDE5598];
  if (a3 > 0.0)
  {
    objc_msgSend(v5, "presentationLayer");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (void *)v7;
    else
      v9 = v5;
    v10 = v9;

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    if (v10)
      objc_msgSend(v10, "transform");
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDuration:", a3);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTimingFunction:", v12);

    v28 = v36;
    v29 = v37;
    v30 = v38;
    v31 = v39;
    v24 = v32;
    v25 = v33;
    v26 = v34;
    v27 = v35;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFromValue:", v13);

    v14 = v6[5];
    v28 = v6[4];
    v29 = v14;
    v15 = v6[7];
    v30 = v6[6];
    v31 = v15;
    v16 = v6[1];
    v24 = *v6;
    v25 = v16;
    v17 = v6[3];
    v26 = v6[2];
    v27 = v17;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setToValue:", v18);

    objc_msgSend(v5, "addAnimation:forKey:", v11, CFSTR("stopScalingAnimation"));
  }
  objc_msgSend(v5, "removeAnimationForKey:", CFSTR("transform"));
  v19 = v6[5];
  v23[4] = v6[4];
  v23[5] = v19;
  v20 = v6[7];
  v23[6] = v6[6];
  v23[7] = v20;
  v21 = v6[1];
  v23[0] = *v6;
  v23[1] = v21;
  v22 = v6[3];
  v23[2] = v6[2];
  v23[3] = v22;
  objc_msgSend(v5, "setTransform:", v23);

}

- (BOOL)isPulsing
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[BCSSubjectIndicatorView _imageView](self, "_imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationForKey:", CFSTR("opacity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)setPulsing:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  if (-[BCSSubjectIndicatorView isPulsing](self, "isPulsing") != a3)
  {
    -[BCSSubjectIndicatorView _imageView](self, "_imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v3)
    {
      objc_msgSend(v5, "setAlpha:", 1.0);
      v8 = (void *)MEMORY[0x24BEBDB00];
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __38__BCSSubjectIndicatorView_setPulsing___block_invoke;
      v9[3] = &unk_250863730;
      v10 = v5;
      objc_msgSend(v8, "animateWithDuration:delay:options:animations:completion:", 30, v9, 0, 0.25, 0.0);

    }
    else
    {
      objc_msgSend(v6, "removeAnimationForKey:", CFSTR("opacity"));
      objc_msgSend(v5, "setAlpha:", 1.0);
    }

  }
}

uint64_t __38__BCSSubjectIndicatorView_setPulsing___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.45);
}

+ (CGSize)_fixedSubjectIndicatorSizeForReferenceBounds:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  UIRoundToScale();
  v4 = v3;
  UIRoundToScale();
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (BOOL)isBouncing
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[BCSSubjectIndicatorView _imageView](self, "_imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationForKey:", CFSTR("transform"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)setBouncing:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (-[BCSSubjectIndicatorView isBouncing](self, "isBouncing") != a3)
  {
    if (v3)
      -[BCSSubjectIndicatorView startScalingWithExpansionWidth:duration:repeatCount:](self, "startScalingWithExpansionWidth:duration:repeatCount:", -1, 10.0, 0.5);
    else
      -[BCSSubjectIndicatorView stopScalingWithDuration:](self, "stopScalingWithDuration:", 0.0);
  }
}

- (UIImageView)_imageView
{
  return self->__imageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__imageView, 0);
}

@end
