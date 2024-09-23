@implementation NTKEditOptionTransitioningView

- (NTKEditOptionTransitioningView)initWithFrame:(CGRect)a3
{
  NTKEditOptionTransitioningView *v3;
  void *v4;
  id v5;
  uint64_t v6;
  UIView *transitionContainer;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  uint64_t v13;
  UIImageView *toTransitionImageView;
  id v15;
  uint64_t v16;
  UIImageView *fromTransitionImageView;
  id v18;
  uint64_t v19;
  UIView *transitionDimmingView;
  UIView *v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)NTKEditOptionTransitioningView;
  v3 = -[NTKEditOptionTransitioningView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKEditOptionTransitioningView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[NTKEditOptionTransitioningView bounds](v3, "bounds");
    v6 = objc_msgSend(v5, "initWithFrame:");
    transitionContainer = v3->_transitionContainer;
    v3->_transitionContainer = (UIView *)v6;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_transitionContainer, "setBackgroundColor:", v8);

    -[NTKEditOptionTransitioningView addSubview:](v3, "addSubview:", v3->_transitionContainer);
    v3->_breathScaleModifier = 1.0;
    v3->_rubberBandScaleModifier = 1.0;
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "screenCornerRadius");
    v11 = v10;

    v12 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[NTKEditOptionTransitioningView bounds](v3, "bounds");
    v13 = objc_msgSend(v12, "initWithFrame:");
    toTransitionImageView = v3->_toTransitionImageView;
    v3->_toTransitionImageView = (UIImageView *)v13;

    -[UIImageView setHidden:](v3->_toTransitionImageView, "setHidden:", 1);
    -[UIView addSubview:](v3->_transitionContainer, "addSubview:", v3->_toTransitionImageView);
    NTKApplyViewCornerRadius(v3->_toTransitionImageView, v11);
    v15 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[NTKEditOptionTransitioningView bounds](v3, "bounds");
    v16 = objc_msgSend(v15, "initWithFrame:");
    fromTransitionImageView = v3->_fromTransitionImageView;
    v3->_fromTransitionImageView = (UIImageView *)v16;

    -[UIImageView setHidden:](v3->_fromTransitionImageView, "setHidden:", 1);
    -[UIView addSubview:](v3->_transitionContainer, "addSubview:", v3->_fromTransitionImageView);
    NTKApplyViewCornerRadius(v3->_fromTransitionImageView, v11);
    v18 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[NTKEditOptionTransitioningView bounds](v3, "bounds");
    v19 = objc_msgSend(v18, "initWithFrame:");
    transitionDimmingView = v3->_transitionDimmingView;
    v3->_transitionDimmingView = (UIView *)v19;

    -[UIView setAutoresizingMask:](v3->_transitionDimmingView, "setAutoresizingMask:", 18);
    v21 = v3->_transitionDimmingView;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v21, "setBackgroundColor:", v22);

    -[UIView setAlpha:](v3->_transitionDimmingView, "setAlpha:", 0.0);
    -[NTKEditOptionTransitioningView addSubview:](v3, "addSubview:", v3->_transitionDimmingView);
  }
  return v3;
}

- (void)didAddSubview:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKEditOptionTransitioningView;
  -[NTKEditOptionTransitioningView didAddSubview:](&v4, sel_didAddSubview_, a3);
  -[NTKEditOptionTransitioningView bringSubviewToFront:](self, "bringSubviewToFront:", self->_transitionDimmingView);
}

- (void)setBreatheFraction:(double)a3
{
  self->_breathScaleModifier = NTKLargeElementScaleForBreathingFraction(a3);
  -[NTKEditOptionTransitioningView _updateUnifiedScaleTransform](self, "_updateUnifiedScaleTransform");
}

- (void)setRubberBandingFraction:(double)a3
{
  self->_rubberBandScaleModifier = NTKScaleForRubberBandingFraction(a3);
  -[NTKEditOptionTransitioningView _updateUnifiedScaleTransform](self, "_updateUnifiedScaleTransform");
}

- (void)_updateUnifiedScaleTransform
{
  UIView *transitionContainer;
  CGAffineTransform v3;

  transitionContainer = self->_transitionContainer;
  CGAffineTransformMakeScale(&v3, self->_breathScaleModifier * self->_rubberBandScaleModifier, self->_breathScaleModifier * self->_rubberBandScaleModifier);
  -[UIView setTransform:](transitionContainer, "setTransform:", &v3);
}

- (void)setDimmingAlpha:(double)a3
{
  -[UIView setAlpha:](self->_transitionDimmingView, "setAlpha:", 1.0 - a3);
}

- (void)setOption:(id)a3
{
  UIImageView *toTransitionImageView;
  id v5;

  toTransitionImageView = self->_toTransitionImageView;
  v5 = a3;
  -[UIImageView setHidden:](toTransitionImageView, "setHidden:", 1);
  -[UIImageView setHidden:](self->_fromTransitionImageView, "setHidden:", 0);
  -[NTKEditOptionTransitioningView setFromEditOption:](self, "setFromEditOption:", v5);

}

- (void)setTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5
{
  id v8;
  id v9;
  UIImageView *fromTransitionImageView;
  __int128 v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  UIImageView *v27;
  double v28;
  UIImageView *v29;
  UIImageView *v30;
  double v31;
  UIImageView *toTransitionImageView;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CGAffineTransform v37;
  CGAffineTransform v38;

  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(v8, "isEqual:", v9) & 1) != 0)
  {
    if (objc_msgSend(v9, "isEqual:", self->_fromEditOption))
    {
      fromTransitionImageView = self->_fromTransitionImageView;
      v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v34 = *MEMORY[0x1E0C9BAA8];
      v35 = v11;
      v36 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      -[UIImageView setTransform:](fromTransitionImageView, "setTransform:", &v34);
      v12 = 448;
LABEL_9:
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v12), "setHidden:", 1);
      goto LABEL_10;
    }
    if (objc_msgSend(v9, "isEqual:", self->_toEditOption))
    {
      toTransitionImageView = self->_toTransitionImageView;
      v33 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v34 = *MEMORY[0x1E0C9BAA8];
      v35 = v33;
      v36 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      -[UIImageView setTransform:](toTransitionImageView, "setTransform:", &v34);
      v12 = 456;
      goto LABEL_9;
    }
  }
  else
  {
    -[UIImageView setHidden:](self->_toTransitionImageView, "setHidden:", 0);
    -[UIImageView setHidden:](self->_fromTransitionImageView, "setHidden:", 0);
    -[NTKEditOptionTransitioningView setToEditOption:](self, "setToEditOption:", v9);
    -[NTKEditOptionTransitioningView delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "shouldFadeIncomingView");

    if (v14)
    {
      v27 = self->_toTransitionImageView;
      CLKCompressFraction();
      v15 = -[UIImageView setAlpha:](v27, "setAlpha:");
    }
    v23.f64[0] = 0.0;
    v24.f64[0] = 0.0;
    v25.f64[0] = 1.0;
    v28 = NTKFindCubicBezierPoint(a3, v23, 0.0, v24, 0.0, v25, 0.0, v15, v16, v17, v18, v19, v20, v21, v22, v26);
    v29 = self->_toTransitionImageView;
    CGAffineTransformMakeScale(&v38, (1.0 - v28) * -0.1 + 1.0, (1.0 - v28) * -0.1 + 1.0);
    -[UIImageView setTransform:](v29, "setTransform:", &v38, 0x3FF0000000000000, 0);
    -[NTKEditOptionTransitioningView setFromEditOption:](self, "setFromEditOption:", v8);
    v30 = self->_fromTransitionImageView;
    -[NTKEditOptionTransitioningView bounds](self, "bounds");
    CGAffineTransformMakeTranslation(&v37, 0.0, -(a3 * v31));
    -[UIImageView setTransform:](v30, "setTransform:", &v37);
  }
LABEL_10:

}

- (void)setToEditOption:(id)a3
{
  UIImageView *toTransitionImageView;
  void *v6;
  void *v7;
  NTKEditOption *v8;

  v8 = (NTKEditOption *)a3;
  if (self->_toEditOption != v8)
  {
    objc_storeStrong((id *)&self->_toEditOption, a3);
    -[NTKEditOptionTransitioningView _resetTransitionImageView:](self, "_resetTransitionImageView:", self->_toTransitionImageView);
    toTransitionImageView = self->_toTransitionImageView;
    -[NTKEditOptionTransitioningView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageForEditOption:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](toTransitionImageView, "setImage:", v7);

  }
}

- (void)setFromEditOption:(id)a3
{
  UIImageView *fromTransitionImageView;
  void *v6;
  void *v7;
  NTKEditOption *v8;

  v8 = (NTKEditOption *)a3;
  if (self->_fromEditOption != v8)
  {
    objc_storeStrong((id *)&self->_fromEditOption, a3);
    -[NTKEditOptionTransitioningView _resetTransitionImageView:](self, "_resetTransitionImageView:", self->_fromTransitionImageView);
    fromTransitionImageView = self->_fromTransitionImageView;
    -[NTKEditOptionTransitioningView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageForEditOption:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](fromTransitionImageView, "setImage:", v7);

  }
}

- (void)_resetTransitionImageView:(id)a3
{
  __int128 v4;
  id v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v6 = *MEMORY[0x1E0C9BAA8];
  v7 = v4;
  v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v5 = a3;
  objc_msgSend(v5, "setTransform:", &v6);
  -[NTKEditOptionTransitioningView bounds](self, "bounds", v6, v7, v8);
  objc_msgSend(v5, "setFrame:");

}

- (NTKEditOptionTransitioningViewDelegate)delegate
{
  return (NTKEditOptionTransitioningViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NTKEditOption)toEditOption
{
  return self->_toEditOption;
}

- (NTKEditOption)fromEditOption
{
  return self->_fromEditOption;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromEditOption, 0);
  objc_storeStrong((id *)&self->_toEditOption, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fromTransitionImageView, 0);
  objc_storeStrong((id *)&self->_toTransitionImageView, 0);
  objc_storeStrong((id *)&self->_transitionDimmingView, 0);
  objc_storeStrong((id *)&self->_transitionContainer, 0);
}

@end
