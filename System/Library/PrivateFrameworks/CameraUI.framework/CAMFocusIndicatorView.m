@implementation CAMFocusIndicatorView

- (CAMFocusIndicatorView)initWithStyle:(int64_t)a3
{
  CAMFocusIndicatorView *v4;
  CAMFocusIndicatorView *v5;
  CAMFocusIndicatorView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMFocusIndicatorView;
  v4 = -[CAMFocusIndicatorView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    -[CAMFocusIndicatorView _commonCAMFocusIndicatorViewInitialization](v4, "_commonCAMFocusIndicatorViewInitialization");
    v6 = v5;
  }

  return v5;
}

- (void)_commonCAMFocusIndicatorViewInitialization
{
  -[CAMFocusIndicatorView _createRectViewAndUpdateBounds](self, "_createRectViewAndUpdateBounds");
  -[CAMFocusIndicatorView _updateTintColor](self, "_updateTintColor");
}

- (void)_createRectViewAndUpdateBounds
{
  _BOOL8 v3;
  CAMFocusIndicatorRectView *v4;
  CAMFocusIndicatorRectView *rectView;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = -[CAMFocusIndicatorView isInactive](self, "isInactive");
  v4 = -[CAMFocusIndicatorRectView initWithStyle:]([CAMFocusIndicatorRectView alloc], "initWithStyle:", self->_style);
  rectView = self->__rectView;
  self->__rectView = v4;

  -[CAMFocusIndicatorRectView setInactive:](self->__rectView, "setInactive:", v3);
  -[CAMFocusIndicatorView addSubview:](self, "addSubview:", self->__rectView);
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  -[CAMFocusIndicatorRectView intrinsicContentSize](self->__rectView, "intrinsicContentSize");
  -[CAMFocusIndicatorView setBounds:](self, "setBounds:", v6, v7, v8, v9);
}

- (BOOL)isInactive
{
  return self->_inactive;
}

- (void)_updateTintColor
{
  id v3;

  if (-[CAMFocusIndicatorView isInactive](self, "isInactive"))
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMFocusIndicatorView setTintColor:](self, "setTintColor:", v3);

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)startScalingWithExpansionWidth:(double)a3 duration:(double)a4 repeatCount:(unint64_t)a5
{
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  float v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  -[CAMFocusIndicatorView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "animationForKey:", CFSTR("scaleAnimation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[CAMFocusIndicatorView bounds](self, "bounds");
    v12 = 1.0;
    if (v11 > 0.0)
      v12 = (v11 + a3 * 2.0) / v11;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v13;
    v22[1] = &unk_1EA3B1A40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3040]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v15;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setValues:", v14);
    objc_msgSend(v18, "setTimingFunctions:", v17);
    objc_msgSend(v18, "setKeyTimes:", &unk_1EA3B3548);
    objc_msgSend(v18, "setCalculationMode:", *MEMORY[0x1E0CD2938]);
    *(float *)&v19 = (float)a5;
    objc_msgSend(v18, "setRepeatCount:", v19);
    UIAnimationDragCoefficient();
    objc_msgSend(v18, "setDuration:", v20 * a4);
    objc_msgSend(v9, "addAnimation:forKey:", v18, CFSTR("scaleAnimation"));

  }
}

- (void)setPulsing:(BOOL)a3
{
  -[CAMFocusIndicatorRectView setPulsing:](self->__rectView, "setPulsing:", a3);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[CAMFocusIndicatorRectView intrinsicContentSize](self->__rectView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMFocusIndicatorView;
  -[CAMFocusIndicatorView layoutSubviews](&v4, sel_layoutSubviews);
  -[CAMFocusIndicatorView _layoutRectView:](self, "_layoutRectView:", self->__rectView);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__CAMFocusIndicatorView_layoutSubviews__block_invoke;
  v3[3] = &unk_1EA328868;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
}

- (void)_layoutRectView:(id)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  CGRect v15;
  CGRect v16;

  v14 = a3;
  -[CAMFocusIndicatorView bounds](self, "bounds");
  x = v15.origin.x;
  y = v15.origin.y;
  width = v15.size.width;
  height = v15.size.height;
  MidX = CGRectGetMidX(v15);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  MidY = CGRectGetMidY(v16);
  v10 = *MEMORY[0x1E0C9D648];
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  objc_msgSend(v14, "intrinsicContentSize");
  objc_msgSend(v14, "setBounds:", v10, v11, v12, v13);
  objc_msgSend(v14, "setCenter:", MidX, MidY);

}

uint64_t __39__CAMFocusIndicatorView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutExposureBiasSlider");
}

- (void)_layoutExposureBiasSlider
{
  CGFloat v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  int exposureBiasSide;
  CGFloat v16;
  double MidX;
  double MidY;
  double v19;
  double v20;
  double v21;
  double v22;
  id WeakRetained;
  char v24;
  id v25;
  void *v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  double MaxY;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double MinX;
  double v43;
  double v44;
  CAMExposureBiasSlider *exposureBiasSlider;
  CAMExposureBiasSlider *v46;
  double MaxX;
  CGRect v48;
  CGRect v49;
  double tx;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  double rect;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v62;
  CGAffineTransform v63;
  CGAffineTransform v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  if (!self->__exposureBiasSlider)
    return;
  v4 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  -[CAMFocusIndicatorView intrinsicContentSize](self, "intrinsicContentSize");
  v6 = v5;
  v8 = v7;
  -[CAMExposureBiasSlider sizeThatFits:](self->__exposureBiasSlider, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  rect = v9;
  v11 = v10;
  v65.origin.x = v4;
  v65.origin.y = v3;
  v65.size.width = v6;
  v65.size.height = v8;
  v12 = CGRectGetMaxX(v65) + 17.0;
  v13 = round((v8 - v11) * 0.5);
  v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v64.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v64.c = v14;
  *(_OWORD *)&v64.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  exposureBiasSide = self->__exposureBiasSide;
  v57 = v14;
  v58 = *(_OWORD *)&v64.a;
  v56 = *(_OWORD *)&v64.tx;
  switch(exposureBiasSide)
  {
    case 1:
      v16 = 3.14159265;
      goto LABEL_8;
    case 2:
      v16 = -1.57079633;
      goto LABEL_8;
    case 3:
      v16 = 1.57079633;
LABEL_8:
      CGAffineTransformMakeRotation(&v64, v16);
      v62 = v64;
      UIIntegralTransform();
      v64 = v63;
      break;
  }
  v66.origin.x = v4;
  v66.origin.y = v3;
  v66.size.width = v6;
  v66.size.height = v8;
  MidX = CGRectGetMidX(v66);
  v67.origin.x = v4;
  v67.origin.y = v3;
  v67.size.width = v6;
  v67.size.height = v8;
  v53 = v6;
  v54 = v3;
  MidY = CGRectGetMidY(v67);
  v68.origin.x = v12;
  v68.origin.y = v13;
  v68.size.width = rect;
  v68.size.height = v11;
  v52 = v8;
  v19 = CGRectGetMidX(v68);
  v55 = v4;
  v20 = v12;
  v69.origin.x = v12;
  v69.origin.y = v13;
  v69.size.width = rect;
  v69.size.height = v11;
  v21 = MidX - v19;
  v22 = MidY - CGRectGetMidY(v69);
  memset(&v63, 0, sizeof(v63));
  CGAffineTransformMakeTranslation(&v63, v21, v22);
  t1 = v64;
  t2 = v63;
  CGAffineTransformConcat(&v62, &t1, &t2);
  v63 = v62;
  t1 = v62;
  CGAffineTransformTranslate(&v62, &t1, -v21, -v22);
  v63 = v62;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v24 = objc_opt_respondsToSelector();

  if ((v24 & 1) != 0)
  {
    tx = -v21;
    v51 = v21;
    v25 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v25, "focusIndicatorViewBoundingViewForClippingFocusIndicatorView:", self);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = v13;
    if (v26)
    {
      -[CAMFocusIndicatorView convertRect:toView:](self, "convertRect:toView:", v26);
      v48.origin.x = v28;
      v48.origin.y = v29;
      v48.size.width = v30;
      v48.size.height = v31;
      objc_msgSend(v26, "bounds");
      v49.origin.x = v32;
      v49.origin.y = v33;
      v49.size.width = v34;
      v49.size.height = v35;
      v70.origin.x = v12;
      v70.origin.y = v13;
      v70.size.width = rect;
      v70.size.height = v11;
      MaxX = CGRectGetMaxX(v70);
      v71.origin.x = v55;
      v71.origin.y = v54;
      v71.size.width = v53;
      v71.size.height = v52;
      MaxY = CGRectGetMaxY(v71);
      -[CAMExposureBiasSlider thumbMaxExtension](self->__exposureBiasSlider, "thumbMaxExtension");
      v38 = MaxX - MaxY + v37;
      switch(self->__exposureBiasSide)
      {
        case 0:
          v39 = v38 + CGRectGetMaxX(v48);
          v40 = CGRectGetMaxX(v49);
          goto LABEL_20;
        case 1:
          v41 = CGRectGetMinX(v48) - v38;
          MinX = CGRectGetMinX(v49);
          goto LABEL_17;
        case 2:
          v41 = CGRectGetMinY(v48) - v38;
          MinX = CGRectGetMinY(v49);
LABEL_17:
          v43 = MinX;

          if (v41 >= v43)
            break;
          goto LABEL_21;
        case 3:
          v39 = v38 + CGRectGetMaxY(v48);
          v40 = CGRectGetMaxY(v49);
LABEL_20:
          v44 = v40;

          if (v39 > v44)
          {
LABEL_21:
            v72.origin.x = v55;
            v72.size.width = v53;
            v72.origin.y = v54;
            v72.size.height = v52;
            v20 = CGRectGetMinX(v72) + -17.0 - rect;
            CGAffineTransformMakeTranslation(&v62, tx, v22);
            v63 = v62;
            t1 = v64;
            t2 = v62;
            CGAffineTransformConcat(&v62, &t1, &t2);
            v63 = v62;
            t1 = v62;
            CGAffineTransformTranslate(&v62, &t1, v51, -v22);
            v63 = v62;
          }
          break;
        default:
          goto LABEL_14;
      }
    }
    else
    {
LABEL_14:

    }
  }
  else
  {
    v27 = v13;
  }
  exposureBiasSlider = self->__exposureBiasSlider;
  *(_OWORD *)&v62.a = v58;
  *(_OWORD *)&v62.c = v57;
  *(_OWORD *)&v62.tx = v56;
  -[CAMExposureBiasSlider setTransform:](exposureBiasSlider, "setTransform:", &v62, *(_QWORD *)&MaxX);
  -[CAMExposureBiasSlider setFrame:](self->__exposureBiasSlider, "setFrame:", v20, v27, rect, v11);
  v46 = self->__exposureBiasSlider;
  v62 = v63;
  -[CAMExposureBiasSlider setTransform:](v46, "setTransform:", &v62);
}

- (void)setStyle:(int64_t)a3
{
  -[CAMFocusIndicatorView setStyle:animated:completion:](self, "setStyle:animated:completion:", a3, 0, 0);
}

- (void)setStyle:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  void (**v8)(_QWORD);
  int64_t style;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  CAMFocusIndicatorRectView *v13;
  void *v14;
  uint64_t v15;
  CAMFocusIndicatorRectView *v16;
  void *v17;
  CAMFocusIndicatorRectView *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  _QWORD v24[5];
  CAMFocusIndicatorRectView *v25;
  void (**v26)(_QWORD);
  uint64_t v27;
  _QWORD v28[5];
  CAMFocusIndicatorRectView *v29;
  _QWORD v30[5];
  _QWORD v31[5];
  CAMFocusIndicatorRectView *v32;
  void (**v33)(_QWORD);
  uint64_t v34;
  _QWORD v35[4];
  CAMFocusIndicatorRectView *v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  _QWORD v39[5];
  _QWORD v40[5];
  CAMFocusIndicatorRectView *v41;
  BOOL v42;

  v8 = (void (**)(_QWORD))a5;
  style = self->_style;
  if (style != a3)
  {
    v10 = style == 2;
    v11 = style == 3;
    if (a3 != 2)
      v11 = 0;
    if (a3 == 3)
      v12 = v10;
    else
      v12 = v11;
    self->_style = a3;
    v13 = self->__rectView;
    -[CAMFocusIndicatorRectView setPulsing:](v13, "setPulsing:", 0);
    v14 = (void *)MEMORY[0x1E0DC3F10];
    v15 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke;
    v40[3] = &unk_1EA32CDB8;
    v40[4] = self;
    v42 = a4;
    v16 = v13;
    v41 = v16;
    objc_msgSend(v14, "performWithoutAnimation:", v40);
    if (a4)
    {
      if (v12)
      {
        v30[0] = v15;
        v30[1] = 3221225472;
        v30[2] = __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_9;
        v30[3] = &unk_1EA328868;
        v30[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v30);
        v17 = (void *)MEMORY[0x1E0DC3F10];
        v28[0] = v15;
        v28[1] = 3221225472;
        v28[2] = __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_10;
        v28[3] = &unk_1EA328A40;
        v28[4] = self;
        v29 = v16;
        v24[0] = v15;
        v24[1] = 3221225472;
        v24[2] = __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_11;
        v24[3] = &unk_1EA32CDE0;
        v26 = v8;
        v24[4] = self;
        v25 = v29;
        v27 = 0x3FF0000000000000;
        objc_msgSend(v17, "animateWithDuration:delay:options:animations:completion:", 6, v28, v24, 0.25, 0.0);

        v18 = v29;
      }
      else
      {
        v39[0] = v15;
        v39[1] = 3221225472;
        v39[2] = __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_2;
        v39[3] = &unk_1EA328868;
        v39[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v39);
        -[CAMFocusIndicatorRectView intrinsicContentSize](v16, "intrinsicContentSize");
        v20 = v19;
        -[CAMFocusIndicatorRectView intrinsicContentSize](self->__rectView, "intrinsicContentSize");
        v22 = v21 / v20;
        memset(&v38.c, 0, 32);
        if (v20 <= 0.0)
          v22 = 1.0;
        *(_OWORD *)&v38.a = 0uLL;
        CGAffineTransformMakeScale(&v38, v22, v22);
        v23 = (void *)MEMORY[0x1E0DC3F10];
        v35[0] = v15;
        v35[1] = 3221225472;
        v35[2] = __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_3;
        v35[3] = &unk_1EA32AA78;
        v36 = v16;
        v37 = v38;
        v31[0] = v15;
        v31[1] = 3221225472;
        v31[2] = __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_4;
        v31[3] = &unk_1EA32CDE0;
        v31[4] = self;
        v33 = v8;
        v34 = 0x3FF0000000000000;
        v32 = v36;
        objc_msgSend(v23, "animateWithDuration:delay:options:animations:completion:", 6, v35, v31, 0.25, 0.0);

        v18 = v36;
      }

    }
    else
    {
      -[CAMFocusIndicatorRectView removeFromSuperview](v16, "removeFromSuperview");
      if (v8)
        v8[2](v8);
    }

  }
}

uint64_t __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_createRectViewAndUpdateBounds");
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  result = objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  if (*(_BYTE *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 32), "_layoutRectView:", *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setAlpha:", 0.0);
}

uint64_t __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_3(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v1, "setTransform:", v4);
}

void __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  void *v5;
  double v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_5;
  v12[3] = &unk_1EA328868;
  v12[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v12);
  v4 = *(double *)(a1 + 56) * 0.1;
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_6;
  v11[3] = &unk_1EA328868;
  v11[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 6, v11, 0, v4, 0.0);
  v5 = (void *)MEMORY[0x1E0DC3F10];
  v6 = *(double *)(a1 + 56) * 0.3;
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_7;
  v9[3] = &unk_1EA328868;
  v10 = *(id *)(a1 + 40);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_8;
  v7[3] = &unk_1EA328A68;
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v5, "animateWithDuration:delay:options:animations:completion:", 6, v9, v7, v6, 0.0);

}

uint64_t __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", 0.0);
}

uint64_t __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", 1.0);
}

uint64_t __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setAlpha:", 0.0);
}

uint64_t __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_10(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "bounds");
  objc_msgSend(*(id *)(a1 + 40), "setBounds:");
  objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
}

void __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_11(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  _QWORD v7[5];
  _QWORD v8[5];
  id v9;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = (void *)MEMORY[0x1E0DC3F10];
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_12;
  v8[3] = &unk_1EA328A40;
  v5 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  objc_msgSend(v3, "performWithoutAnimation:", v8);
  v6 = *(double *)(a1 + 56) * 0.1;
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_13;
  v7[3] = &unk_1EA328868;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 6, v7, 0, v6, 0.0);

}

uint64_t __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_12(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", 0.0);
}

uint64_t __54__CAMFocusIndicatorView_setStyle_animated_completion___block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", 1.0);
}

- (CGRect)boundsIncludingExposureBiasSlider
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGRect v20;
  CGRect v22;

  -[CAMFocusIndicatorView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMFocusIndicatorView _exposureBiasSlider](self, "_exposureBiasSlider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  v22.origin.x = v13;
  v22.origin.y = v15;
  v22.size.width = v17;
  v22.size.height = v19;
  return CGRectUnion(v20, v22);
}

- (void)setCenter:(CGPoint)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMFocusIndicatorView;
  -[CAMFocusIndicatorView setCenter:](&v4, sel_setCenter_, a3.x, a3.y);
  if (self->__exposureBiasSlider)
    -[CAMFocusIndicatorView _layoutExposureBiasSlider](self, "_layoutExposureBiasSlider");
}

- (void)setInactive:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_inactive != a3)
  {
    v3 = a3;
    self->_inactive = a3;
    -[CAMFocusIndicatorView _rectView](self, "_rectView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInactive:", v3);
    -[CAMFocusIndicatorView _updateTintColor](self, "_updateTintColor");

  }
}

- (BOOL)isPulsing
{
  return -[CAMFocusIndicatorRectView isPulsing](self->__rectView, "isPulsing");
}

- (void)setShowExposureBias:(BOOL)a3
{
  CAMExposureBiasSlider *exposureBiasSlider;

  if (self->_showExposureBias != a3)
  {
    self->_showExposureBias = a3;
    if (a3)
    {
      -[CAMFocusIndicatorView _createExposureBiasSlider](self, "_createExposureBiasSlider");
    }
    else
    {
      -[CAMExposureBiasSlider removeFromSuperview](self->__exposureBiasSlider, "removeFromSuperview");
      exposureBiasSlider = self->__exposureBiasSlider;
      self->__exposureBiasSlider = 0;

    }
  }
}

- (void)_createExposureBiasSlider
{
  CAMExposureBiasSlider *v3;
  CAMExposureBiasSlider *v4;
  CAMExposureBiasSlider *exposureBiasSlider;
  double v6;
  double v7;
  double v8;

  v3 = [CAMExposureBiasSlider alloc];
  v4 = -[CAMExposureBiasSlider initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  exposureBiasSlider = self->__exposureBiasSlider;
  self->__exposureBiasSlider = v4;

  *(float *)&v6 = self->_exposureBiasMinimum;
  -[CAMExposureBiasSlider setExposureBiasMin:](self->__exposureBiasSlider, "setExposureBiasMin:", v6);
  *(float *)&v7 = self->_exposureBiasMaximum;
  -[CAMExposureBiasSlider setExposureBiasMax:](self->__exposureBiasSlider, "setExposureBiasMax:", v7);
  *(float *)&v8 = self->_exposureBiasValue;
  -[CAMExposureBiasSlider setExposureBiasValue:](self->__exposureBiasSlider, "setExposureBiasValue:", v8);
  -[CAMExposureBiasSlider forceTrackDimmed](self->__exposureBiasSlider, "forceTrackDimmed");
  -[CAMFocusIndicatorView addSubview:](self, "addSubview:", self->__exposureBiasSlider);
  -[CAMFocusIndicatorView _layoutExposureBiasSlider](self, "_layoutExposureBiasSlider");
}

- (void)setExposureBiasMaximum:(float)a3
{
  if (self->_exposureBiasMaximum != a3)
  {
    self->_exposureBiasMaximum = a3;
    -[CAMExposureBiasSlider setExposureBiasMax:](self->__exposureBiasSlider, "setExposureBiasMax:");
  }
}

- (void)setExposureBiasMinimum:(float)a3
{
  if (self->_exposureBiasMinimum != a3)
  {
    self->_exposureBiasMinimum = a3;
    -[CAMExposureBiasSlider setExposureBiasMin:](self->__exposureBiasSlider, "setExposureBiasMin:");
  }
}

- (void)setExposureBiasValue:(float)a3
{
  if (self->_exposureBiasValue != a3)
  {
    self->_exposureBiasValue = a3;
    -[CAMExposureBiasSlider setExposureBiasValue:](self->__exposureBiasSlider, "setExposureBiasValue:");
  }
}

- (void)setExposureBiasSide:(int)a3 animated:(BOOL)a4
{
  int exposureBiasSide;
  double v8;
  _BOOL4 v10;
  CAMExposureBiasSlider *exposureBiasSlider;
  CAMExposureBiasSlider *v12;
  CAMExposureBiasSlider *v13;
  void *v14;
  uint64_t v15;
  CAMExposureBiasSlider *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[4];
  CAMExposureBiasSlider *v20;
  _QWORD v21[4];
  CAMExposureBiasSlider *v22;

  exposureBiasSide = self->__exposureBiasSide;
  self->__exposureBiasSide = a3;
  -[CAMExposureBiasSlider alpha](self->__exposureBiasSlider, "alpha");
  v10 = v8 > 0.0 && exposureBiasSide != a3;
  exposureBiasSlider = self->__exposureBiasSlider;
  if (exposureBiasSlider)
  {
    if (a4)
    {
      v12 = exposureBiasSlider;
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      -[CAMFocusIndicatorView _createExposureBiasSlider](self, "_createExposureBiasSlider");
      -[CAMExposureBiasSlider setAlpha:](self->__exposureBiasSlider, "setAlpha:", 0.0);
      v13 = self->__exposureBiasSlider;
      -[CAMExposureBiasSlider alpha](v12, "alpha");
      -[CAMExposureBiasSlider setAlpha:](v13, "setAlpha:");
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      v14 = (void *)MEMORY[0x1E0DC3F10];
      v15 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __54__CAMFocusIndicatorView_setExposureBiasSide_animated___block_invoke;
      v21[3] = &unk_1EA328868;
      v22 = v12;
      v19[0] = v15;
      v19[1] = 3221225472;
      v19[2] = __54__CAMFocusIndicatorView_setExposureBiasSide_animated___block_invoke_2;
      v19[3] = &unk_1EA328A68;
      v16 = v22;
      v20 = v16;
      objc_msgSend(v14, "animateWithDuration:delay:options:animations:completion:", 2, v21, v19, 0.2, 0.0);
      if (v10)
      {
        -[CAMExposureBiasSlider setAlpha:](self->__exposureBiasSlider, "setAlpha:", 0.0);
        v17[4] = self;
        v18[0] = v15;
        v18[1] = 3221225472;
        v18[2] = __54__CAMFocusIndicatorView_setExposureBiasSide_animated___block_invoke_3;
        v18[3] = &unk_1EA328868;
        v18[4] = self;
        v17[0] = v15;
        v17[1] = 3221225472;
        v17[2] = __54__CAMFocusIndicatorView_setExposureBiasSide_animated___block_invoke_4;
        v17[3] = &unk_1EA328A68;
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v18, v17, 0.5, 0.0);
      }

    }
    else
    {
      -[CAMFocusIndicatorView _layoutExposureBiasSlider](self, "_layoutExposureBiasSlider");
      if (v10)
        -[CAMExposureBiasSlider updateLastInteractionTime](self->__exposureBiasSlider, "updateLastInteractionTime");
    }
  }
}

uint64_t __54__CAMFocusIndicatorView_setExposureBiasSide_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __54__CAMFocusIndicatorView_setExposureBiasSide_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __54__CAMFocusIndicatorView_setExposureBiasSide_animated___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "updateLastInteractionTime");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setSuspendTrackFadeOut:", 1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", 1.0);
}

uint64_t __54__CAMFocusIndicatorView_setExposureBiasSide_animated___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setSuspendTrackFadeOut:", 0);
}

- (int64_t)style
{
  return self->_style;
}

- (CAMFocusIndicatorViewDelegate)delegate
{
  return (CAMFocusIndicatorViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)showExposureBias
{
  return self->_showExposureBias;
}

- (float)exposureBiasMaximum
{
  return self->_exposureBiasMaximum;
}

- (float)exposureBiasMinimum
{
  return self->_exposureBiasMinimum;
}

- (float)exposureBiasValue
{
  return self->_exposureBiasValue;
}

- (CAMFocusIndicatorRectView)_rectView
{
  return self->__rectView;
}

- (CAMExposureBiasSlider)_exposureBiasSlider
{
  return self->__exposureBiasSlider;
}

- (int)_exposureBiasSide
{
  return self->__exposureBiasSide;
}

- (void)set_exposureBiasSide:(int)a3
{
  self->__exposureBiasSide = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__exposureBiasSlider, 0);
  objc_storeStrong((id *)&self->__rectView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
