@implementation NTKBackgroundImageFaceView

- (void)_loadSnapshotContentViews
{
  void *v3;
  void *v4;
  id v5;
  UIView *v6;
  UIView *backgroundContainerView;
  void *v8;
  UIView *v9;
  void *v10;
  UIView *v11;
  UIView *selectedContentView;
  UIView *v13;
  id v14;
  UIView *v15;
  UIView *transitionDimmingView;
  UIView *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)NTKBackgroundImageFaceView;
  -[NTKDigitalFaceView _loadSnapshotContentViews](&v20, sel__loadSnapshotContentViews);
  -[NTKFaceView timeView](self, "timeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v4);

  v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[NTKBackgroundImageFaceView bounds](self, "bounds");
  v6 = (UIView *)objc_msgSend(v5, "initWithFrame:");
  backgroundContainerView = self->_backgroundContainerView;
  self->_backgroundContainerView = v6;

  -[UIView setAutoresizingMask:](self->_backgroundContainerView, "setAutoresizingMask:", 18);
  -[NTKFaceView contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self->_backgroundContainerView;
  -[NTKFaceView foregroundContainerView](self, "foregroundContainerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertSubview:belowSubview:", v9, v10);

  -[NTKBackgroundImageFaceView _selectedContentView](self, "_selectedContentView");
  v11 = (UIView *)objc_claimAutoreleasedReturnValue();
  selectedContentView = self->_selectedContentView;
  self->_selectedContentView = v11;

  -[UIView addSubview:](self->_backgroundContainerView, "addSubview:", self->_selectedContentView);
  v13 = self->_selectedContentView;
  -[NTKBackgroundImageFaceView bounds](self, "bounds");
  -[UIView setFrame:](v13, "setFrame:");
  -[UIView setAutoresizingMask:](self->_selectedContentView, "setAutoresizingMask:", 18);
  v14 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[NTKBackgroundImageFaceView bounds](self, "bounds");
  v15 = (UIView *)objc_msgSend(v14, "initWithFrame:");
  transitionDimmingView = self->_transitionDimmingView;
  self->_transitionDimmingView = v15;

  -[UIView setAutoresizingMask:](self->_transitionDimmingView, "setAutoresizingMask:", 18);
  v17 = self->_transitionDimmingView;
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v17, "setBackgroundColor:", v18);

  -[UIView setAlpha:](self->_transitionDimmingView, "setAlpha:", 0.0);
  -[NTKFaceView contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", self->_transitionDimmingView);

  self->_breathScaleModifier = 1.0;
  self->_rubberBandScaleModifier = 1.0;
}

- (void)_unloadSnapshotContentViews
{
  UIView *backgroundContainerView;
  UIView *selectedContentView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKBackgroundImageFaceView;
  -[NTKDigitalFaceView _unloadSnapshotContentViews](&v5, sel__unloadSnapshotContentViews);
  -[UIView removeFromSuperview](self->_backgroundContainerView, "removeFromSuperview");
  backgroundContainerView = self->_backgroundContainerView;
  self->_backgroundContainerView = 0;

  -[UIView removeFromSuperview](self->_selectedContentView, "removeFromSuperview");
  selectedContentView = self->_selectedContentView;
  self->_selectedContentView = 0;

}

- (BOOL)_needsForegroundContainerView
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;
  void *v8;

  v5 = a4;
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[NTKBackgroundImageFaceView _complicationDisplayWrapperForTouch:](self, "_complicationDisplayWrapperForTouch:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8 == 0;

  }
  return v7;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return !-[NTKFaceView timeScrubbing](self, "timeScrubbing", a3);
}

- (id)_complicationDisplayWrapperForTouch:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__13;
  v14 = __Block_byref_object_dispose__13;
  v15 = 0;
  objc_msgSend(v4, "locationInView:", self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__NTKBackgroundImageFaceView__complicationDisplayWrapperForTouch___block_invoke;
  v9[3] = &unk_1E6BD1588;
  v9[6] = v5;
  v9[7] = v6;
  v9[4] = self;
  v9[5] = &v10;
  -[NTKFaceView enumerateComplicationDisplayWrappersWithBlock:](self, "enumerateComplicationDisplayWrappersWithBlock:", v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __66__NTKBackgroundImageFaceView__complicationDisplayWrapperForTouch___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  int v5;
  void *v6;
  void *v7;
  id v8;
  CGRect v9;
  CGRect v10;

  v8 = a3;
  v5 = objc_msgSend(v8, "isUserInteractionEnabled");
  v6 = v8;
  if (v5)
  {
    objc_msgSend(v8, "display");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    objc_msgSend(v7, "convertRect:toView:", *(_QWORD *)(a1 + 32));
    v10 = CGRectInset(v9, -10.0, -10.0);
    if (CGRectContainsPoint(v10, *(CGPoint *)(a1 + 48)))
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);

    v6 = v8;
  }

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  NTKComplicationDisplayWrapperView *v6;
  NTKComplicationDisplayWrapperView *touchWrapper;
  NTKComplicationDisplayWrapperView *v8;
  id v9;

  objc_msgSend(a3, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKBackgroundImageFaceView _complicationDisplayWrapperForTouch:](self, "_complicationDisplayWrapperForTouch:", v5);
  v6 = (NTKComplicationDisplayWrapperView *)objc_claimAutoreleasedReturnValue();
  touchWrapper = self->_touchWrapper;
  self->_touchWrapper = v6;

  v8 = self->_touchWrapper;
  if (v8)
  {
    -[NTKComplicationDisplayWrapperView display](v8, "display");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHighlighted:", 1);

  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  id *p_touchWrapper;
  id v8;
  void *v9;
  void *v10;
  id obj;

  objc_msgSend(a3, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKBackgroundImageFaceView _complicationDisplayWrapperForTouch:](self, "_complicationDisplayWrapperForTouch:", v5);
  obj = (id)objc_claimAutoreleasedReturnValue();

  v6 = obj;
  p_touchWrapper = (id *)&self->_touchWrapper;
  v8 = *p_touchWrapper;
  if (obj != *p_touchWrapper)
  {
    if (v8)
    {
      objc_msgSend(v8, "display");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHighlighted:", 0);

      v6 = obj;
    }
    if (v6)
    {
      objc_msgSend(v6, "display");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setHighlighted:", 1);

    }
    objc_storeStrong(p_touchWrapper, obj);
    v6 = obj;
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  NTKComplicationDisplayWrapperView *touchWrapper;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  NTKComplicationDisplayWrapperView *v10;

  touchWrapper = self->_touchWrapper;
  if (touchWrapper)
  {
    -[NTKComplicationDisplayWrapperView display](touchWrapper, "display", a3, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHighlighted:", 0);

    if (-[NTKComplicationDisplayWrapperView tapEnabled](self->_touchWrapper, "tapEnabled"))
    {
      -[NTKComplicationDisplayWrapperView touchUpInsideHandler](self->_touchWrapper, "touchUpInsideHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[NTKComplicationDisplayWrapperView touchUpInsideHandler](self->_touchWrapper, "touchUpInsideHandler");
        v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        -[NTKComplicationDisplayWrapperView display](self->_touchWrapper, "display");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v8)[2](v8, v9);

      }
    }
    v10 = self->_touchWrapper;
    self->_touchWrapper = 0;

  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  NTKComplicationDisplayWrapperView *touchWrapper;
  void *v6;
  NTKComplicationDisplayWrapperView *v7;

  touchWrapper = self->_touchWrapper;
  if (touchWrapper)
  {
    -[NTKComplicationDisplayWrapperView display](touchWrapper, "display", a3, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHighlighted:", 0);

    v7 = self->_touchWrapper;
    self->_touchWrapper = 0;

  }
}

- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3 faceBounds:(CGRect)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;

  -[NTKBackgroundImageFaceView bounds](self, "bounds", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[NTKFaceView device](self, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = NTKDigitalTimeLabelStyleWideRightSideMargin(v13);
  -[NTKFaceView device](self, "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKDigitalTimeLabelStyle defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:forDevice:](NTKDigitalTimeLabelStyle, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:forDevice:", 1, v15, v6, v8, v10, v12, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_updateFontInStyle:(id)a3 monospace:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v4)
  {
    v7 = (id)objc_msgSend(v5, "copy");
    v8 = (void *)MEMORY[0x1E0C944D0];
    objc_msgSend(v6, "threeDigitFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pointSize");
    objc_msgSend(v8, "systemFontOfSize:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "CLKFontWithMonospacedNumbers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setFourDigitFont:", v11);
    objc_msgSend(v7, "setThreeDigitFont:", v11);

  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return (unint64_t)a4 > 1;
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  void *v8;
  id v9;

  -[NTKBackgroundImageFaceView _backgroundImageAlphaForEditMode:](self, "_backgroundImageAlphaForEditMode:");
  -[NTKBackgroundImageFaceView _backgroundImageAlphaForEditMode:](self, "_backgroundImageAlphaForEditMode:", a5);
  -[NTKBackgroundImageFaceView _selectedContentView](self, "_selectedContentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v8, "setAlpha:");

  -[NTKBackgroundImageFaceView _timeLabelAlphaForEditMode:](self, "_timeLabelAlphaForEditMode:", a4);
  -[NTKBackgroundImageFaceView _timeLabelAlphaForEditMode:](self, "_timeLabelAlphaForEditMode:", a5);
  -[NTKFaceView timeView](self, "timeView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v9, "setAlpha:");

}

- (void)_configureForEditMode:(int64_t)a3
{
  void *v5;
  id v6;

  -[NTKBackgroundImageFaceView _selectedContentView](self, "_selectedContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKBackgroundImageFaceView _backgroundImageAlphaForEditMode:](self, "_backgroundImageAlphaForEditMode:", a3);
  objc_msgSend(v5, "setAlpha:");

  -[NTKFaceView timeView](self, "timeView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKBackgroundImageFaceView _timeLabelAlphaForEditMode:](self, "_timeLabelAlphaForEditMode:", a3);
  objc_msgSend(v6, "setAlpha:");

}

- (double)_backgroundImageAlphaForEditMode:(int64_t)a3
{
  double result;

  result = 0.4;
  if (a3 != 1)
    return 1.0;
  return result;
}

- (double)_timeLabelAlphaForEditMode:(int64_t)a3
{
  double result;

  result = 0.2;
  if (!a3)
    return 1.0;
  return result;
}

- (id)_animationImageView
{
  return 0;
}

- (double)_parallaxScaleFactor
{
  return 1.0;
}

- (void)_prepareForEditing
{
  void *v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKBackgroundImageFaceView;
  -[NTKFaceView _prepareForEditing](&v6, sel__prepareForEditing);
  -[NTKFaceView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screenCornerRadius");
  v5 = v4;

  NTKApplyViewCornerRadius(self->_backgroundContainerView, v5);
}

- (void)_cleanupAfterEditing
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKBackgroundImageFaceView;
  -[NTKFaceView _cleanupAfterEditing](&v3, sel__cleanupAfterEditing);
  NTKApplyViewCornerRadius(self->_backgroundContainerView, 0.0);
}

- (void)setViewMode:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKBackgroundImageFaceView;
  -[NTKDigitalFaceView setViewMode:](&v3, sel_setViewMode_, a3);
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v11;
  id v12;
  UIView *transitionViewFrom;
  __int128 v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  UIView *v19;
  UIView *v20;
  UIView *v21;
  __int128 v22;
  UIView *v23;
  UIView *v24;
  UIView *v25;
  UIView *v26;
  UIView *v27;
  __int128 v28;
  UIView *v29;
  UIView *v30;
  double v31;
  uint64_t v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  float64x2_t v43;
  double v44;
  UIView *v45;
  UIView *transitionViewTo;
  __int128 v47;
  CGAffineTransform v48;
  CGAffineTransform v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;

  v11 = a4;
  v12 = a5;
  if ((objc_msgSend(v11, "isEqual:", v12) & 1) != 0)
  {
    if (objc_msgSend(v12, "isEqual:", self->_editOptionFrom))
    {
      transitionViewFrom = self->_transitionViewFrom;
      v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v50 = *MEMORY[0x1E0C9BAA8];
      v51 = v14;
      v52 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      -[UIView setTransform:](transitionViewFrom, "setTransform:", &v50);
      v15 = 896;
LABEL_13:
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v15), "setHidden:", 1);
      goto LABEL_14;
    }
    if (objc_msgSend(v12, "isEqual:", self->_editOptionTo))
    {
      transitionViewTo = self->_transitionViewTo;
      v47 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v50 = *MEMORY[0x1E0C9BAA8];
      v51 = v47;
      v52 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      -[UIView setTransform:](transitionViewTo, "setTransform:", &v50);
      v15 = 880;
      goto LABEL_13;
    }
  }
  else
  {
    -[NTKFaceView device](self, "device");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "screenCornerRadius");
    v18 = v17;

    -[UIView setHidden:](self->_transitionViewFrom, "setHidden:", 0);
    -[UIView setHidden:](self->_transitionViewTo, "setHidden:", 0);
    -[NTKBackgroundImageFaceView _beginTransitionToOption](self, "_beginTransitionToOption");
    if ((-[NTKEditOption isEqual:](self->_editOptionTo, "isEqual:", v12) & 1) == 0)
    {
      objc_storeStrong((id *)&self->_editOptionTo, a5);
      -[UIView removeFromSuperview](self->_transitionViewTo, "removeFromSuperview");
      -[NTKBackgroundImageFaceView _viewForEditOption:](self, "_viewForEditOption:", v12);
      v19 = (UIView *)objc_claimAutoreleasedReturnValue();
      v20 = self->_transitionViewTo;
      self->_transitionViewTo = v19;

      v21 = self->_transitionViewTo;
      v22 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v50 = *MEMORY[0x1E0C9BAA8];
      v51 = v22;
      v52 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      -[UIView setTransform:](v21, "setTransform:", &v50);
      v23 = self->_transitionViewTo;
      -[NTKBackgroundImageFaceView bounds](self, "bounds");
      -[UIView setFrame:](v23, "setFrame:");
      NTKApplyViewCornerRadius(self->_transitionViewTo, v18);
      -[UIView addSubview:](self->_backgroundContainerView, "addSubview:", self->_transitionViewTo);
    }
    if (-[NTKBackgroundImageFaceView _shouldFadeToTransitionView](self, "_shouldFadeToTransitionView"))
    {
      v24 = self->_transitionViewTo;
      CLKCompressFraction();
      -[UIView setAlpha:](v24, "setAlpha:");
    }
    if ((-[NTKEditOption isEqual:](self->_editOptionFrom, "isEqual:", v11) & 1) == 0)
    {
      objc_storeStrong((id *)&self->_editOptionFrom, a4);
      -[UIView removeFromSuperview](self->_transitionViewFrom, "removeFromSuperview");
      -[NTKBackgroundImageFaceView _viewForEditOption:](self, "_viewForEditOption:", v11);
      v25 = (UIView *)objc_claimAutoreleasedReturnValue();
      v26 = self->_transitionViewFrom;
      self->_transitionViewFrom = v25;

      v27 = self->_transitionViewFrom;
      v28 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v50 = *MEMORY[0x1E0C9BAA8];
      v51 = v28;
      v52 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      -[UIView setTransform:](v27, "setTransform:", &v50);
      v29 = self->_transitionViewFrom;
      -[NTKBackgroundImageFaceView bounds](self, "bounds");
      -[UIView setFrame:](v29, "setFrame:");
      NTKApplyViewCornerRadius(self->_transitionViewFrom, v18);
      -[UIView addSubview:](self->_backgroundContainerView, "addSubview:", self->_transitionViewFrom);
    }
    v30 = self->_transitionViewFrom;
    -[NTKBackgroundImageFaceView bounds](self, "bounds");
    CGAffineTransformMakeTranslation(&v49, 0.0, -(a3 * v31));
    v32 = -[UIView setTransform:](v30, "setTransform:", &v49);
    v33.f64[0] = 0.0;
    v34.f64[0] = 0.0;
    v35.f64[0] = 1.0;
    v44 = NTKFindCubicBezierPoint(a3, v33, 0.0, v34, 0.0, v35, 0.0, v32, v36, v37, v38, v39, v40, v41, v42, v43);
    v45 = self->_transitionViewTo;
    CGAffineTransformMakeScale(&v48, (1.0 - v44) * -0.1 + 1.0, (1.0 - v44) * -0.1 + 1.0);
    -[UIView setTransform:](v45, "setTransform:", &v48, 0x3FF0000000000000, 0);
  }
LABEL_14:

}

- (void)_cleanupAfterTransitionToOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  NTKEditOption *editOptionFrom;
  UIView *transitionViewFrom;
  NTKEditOption *editOptionTo;
  UIView *transitionViewTo;

  -[UIView removeFromSuperview](self->_transitionViewFrom, "removeFromSuperview", a3, a4, a5);
  -[UIView removeFromSuperview](self->_transitionViewTo, "removeFromSuperview");
  editOptionFrom = self->_editOptionFrom;
  self->_editOptionFrom = 0;

  transitionViewFrom = self->_transitionViewFrom;
  self->_transitionViewFrom = 0;

  editOptionTo = self->_editOptionTo;
  self->_editOptionTo = 0;

  transitionViewTo = self->_transitionViewTo;
  self->_transitionViewTo = 0;

}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  self->_breathScaleModifier = NTKLargeElementScaleForBreathingFraction(a3);
  -[NTKBackgroundImageFaceView _applyScaleTransform:](self, "_applyScaleTransform:", self->_backgroundContainerView);
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  double v8;
  double v9;
  double v10;
  double v11;

  v8 = NTKScaleForRubberBandingFraction(a3);
  v9 = NTKAlphaForRubberBandingFraction(a3);
  -[NTKBackgroundImageFaceView _backgroundImageAlphaForEditMode:](self, "_backgroundImageAlphaForEditMode:", a4);
  v11 = v9 * v10;
  self->_rubberBandScaleModifier = v8;
  -[NTKBackgroundImageFaceView _applyScaleTransform:](self, "_applyScaleTransform:", self->_backgroundContainerView);
  -[UIView setAlpha:](self->_transitionDimmingView, "setAlpha:", 1.0 - v11);
}

- (void)_applyScaleTransform:(id)a3
{
  CGFloat v3;
  id v4;
  CGAffineTransform v5;

  v3 = self->_breathScaleModifier * self->_rubberBandScaleModifier;
  v4 = a3;
  CGAffineTransformMakeScale(&v5, v3, v3);
  objc_msgSend(v4, "setTransform:", &v5);

}

- (BOOL)_shouldFadeToTransitionView
{
  return 0;
}

- (double)_timeTravelYAdjustment
{
  void *v2;
  double v3;

  -[NTKFaceView device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "sizeClass"))
    v3 = 13.5;
  else
    v3 = 12.5;

  return v3;
}

- (BOOL)_shouldAdjustLayoutForTimeTravel
{
  return self->_shouldAdjustLayoutForTimeTravel;
}

- (void)_startScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  void *v6;
  UIView *timeTravelDimmingOverlayView;
  id v8;
  UIView *v9;
  UIView *v10;
  void *v11;
  UIView *v12;
  void *v13;
  _QWORD v14[5];
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NTKBackgroundImageFaceView;
  -[NTKFaceView _startScrubbingAnimated:withCompletion:](&v15, sel__startScrubbingAnimated_withCompletion_, a3, a4);
  self->_shouldAdjustLayoutForTimeTravel = 1;
  -[NTKFaceView _loadLayoutRules](self, "_loadLayoutRules");
  -[NTKFaceView foregroundContainerView](self, "foregroundContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsLayout");

  timeTravelDimmingOverlayView = self->_timeTravelDimmingOverlayView;
  if (!timeTravelDimmingOverlayView)
  {
    v8 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[NTKBackgroundImageFaceView bounds](self, "bounds");
    v9 = (UIView *)objc_msgSend(v8, "initWithFrame:");
    v10 = self->_timeTravelDimmingOverlayView;
    self->_timeTravelDimmingOverlayView = v9;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_timeTravelDimmingOverlayView, "setBackgroundColor:", v11);

    timeTravelDimmingOverlayView = self->_timeTravelDimmingOverlayView;
  }
  -[UIView setAlpha:](timeTravelDimmingOverlayView, "setAlpha:", 0.0);
  v12 = self->_timeTravelDimmingOverlayView;
  -[NTKFaceView foregroundContainerView](self, "foregroundContainerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKBackgroundImageFaceView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v12, v13);

  if (v4)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__NTKBackgroundImageFaceView__startScrubbingAnimated_withCompletion___block_invoke;
    v14[3] = &unk_1E6BCD5F0;
    v14[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v14, 0.3);
  }
}

uint64_t __69__NTKBackgroundImageFaceView__startScrubbingAnimated_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "foregroundContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "layoutComplicationViews");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 920), "setAlpha:", 0.5);
  return objc_msgSend(*(id *)(a1 + 32), "_startScrubbingAnimationFromUIViewAnimateWithDuration");
}

- (void)_scrubToDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  double v9;
  objc_super v10;

  v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)NTKBackgroundImageFaceView;
  v6 = a3;
  -[NTKFaceView _scrubToDate:animated:](&v10, sel__scrubToDate_animated_, v6, v4);
  -[NTKFaceView timeView](self, "timeView", v10.receiver, v10.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = 0.3;
  if (!v4)
    v9 = 0.0;
  objc_msgSend(v7, "setOverrideDate:duration:", v6, v9);

}

- (void)_endScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  objc_super v11;
  _QWORD v12[5];
  _QWORD v13[5];

  v4 = a3;
  v6 = a4;
  -[NTKFaceView timeView](self, "timeView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = 0.0;
  if (v4)
    v9 = 0.3;
  objc_msgSend(v7, "setOverrideDate:duration:", 0, v9);

  self->_shouldAdjustLayoutForTimeTravel = 0;
  -[NTKFaceView _loadLayoutRules](self, "_loadLayoutRules");
  -[NTKFaceView foregroundContainerView](self, "foregroundContainerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNeedsLayout");

  if (v4)
  {
    v12[4] = self;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __67__NTKBackgroundImageFaceView__endScrubbingAnimated_withCompletion___block_invoke;
    v13[3] = &unk_1E6BCD5F0;
    v13[4] = self;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__NTKBackgroundImageFaceView__endScrubbingAnimated_withCompletion___block_invoke_2;
    v12[3] = &unk_1E6BD05C8;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v13, v12, 0.3);
  }
  else
  {
    -[UIView setAlpha:](self->_timeTravelDimmingOverlayView, "setAlpha:", 0.0);
    -[UIView removeFromSuperview](self->_timeTravelDimmingOverlayView, "removeFromSuperview");
    -[NTKBackgroundImageFaceView _endScrubbingAnimationFromUIViewAnimateWithDuration](self, "_endScrubbingAnimationFromUIViewAnimateWithDuration");
  }
  v11.receiver = self;
  v11.super_class = (Class)NTKBackgroundImageFaceView;
  -[NTKFaceView _endScrubbingAnimated:withCompletion:](&v11, sel__endScrubbingAnimated_withCompletion_, v4, v6);

}

uint64_t __67__NTKBackgroundImageFaceView__endScrubbingAnimated_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "foregroundContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 920), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "_endScrubbingAnimationFromUIViewAnimateWithDuration");
}

uint64_t __67__NTKBackgroundImageFaceView__endScrubbingAnimated_withCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 920), "removeFromSuperview");
}

- (BOOL)_timeLabelUsesLegibility
{
  return 0;
}

- (id)_selectedContentView
{
  return 0;
}

- (id)_viewForEditOption:(id)a3
{
  return 0;
}

- (void)_applyShowContentForUnadornedSnapshot
{
  id v3;

  -[NTKFaceView timeView](self, "timeView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", -[NTKFaceView showContentForUnadornedSnapshot](self, "showContentForUnadornedSnapshot"));

}

- (void)_removeAllSubviewsFrom:(id)a3
{
  id v3;

  objc_msgSend(a3, "subviews");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeObjectsPerformSelector:", sel_removeFromSuperview);

}

- (UIView)backgroundContainerView
{
  return self->_backgroundContainerView;
}

- (UIView)zoomMaskView
{
  return self->_zoomMaskView;
}

- (void)setZoomMaskView:(id)a3
{
  objc_storeStrong((id *)&self->_zoomMaskView, a3);
}

- (UIImageView)zoomVignette
{
  return self->_zoomVignette;
}

- (void)setZoomVignette:(id)a3
{
  objc_storeStrong((id *)&self->_zoomVignette, a3);
}

- (CGPoint)timeViewZoomEndingCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_timeViewZoomEndingCenter.x;
  y = self->_timeViewZoomEndingCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTimeViewZoomEndingCenter:(CGPoint)a3
{
  self->_timeViewZoomEndingCenter = a3;
}

- (CGRect)vignetteZoomStartingBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_vignetteZoomStartingBounds.origin.x;
  y = self->_vignetteZoomStartingBounds.origin.y;
  width = self->_vignetteZoomStartingBounds.size.width;
  height = self->_vignetteZoomStartingBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setVignetteZoomStartingBounds:(CGRect)a3
{
  self->_vignetteZoomStartingBounds = a3;
}

- (CGRect)maskZoomStartingBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_maskZoomStartingBounds.origin.x;
  y = self->_maskZoomStartingBounds.origin.y;
  width = self->_maskZoomStartingBounds.size.width;
  height = self->_maskZoomStartingBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setMaskZoomStartingBounds:(CGRect)a3
{
  self->_maskZoomStartingBounds = a3;
}

- (UIView)borrowedCircleView
{
  return self->_borrowedCircleView;
}

- (void)setBorrowedCircleView:(id)a3
{
  objc_storeStrong((id *)&self->_borrowedCircleView, a3);
}

- (UIView)borrowedTimeView
{
  return self->_borrowedTimeView;
}

- (void)setBorrowedTimeView:(id)a3
{
  objc_storeStrong((id *)&self->_borrowedTimeView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borrowedTimeView, 0);
  objc_storeStrong((id *)&self->_borrowedCircleView, 0);
  objc_storeStrong((id *)&self->_zoomVignette, 0);
  objc_storeStrong((id *)&self->_zoomMaskView, 0);
  objc_storeStrong((id *)&self->_backgroundContainerView, 0);
  objc_storeStrong((id *)&self->_touchWrapper, 0);
  objc_storeStrong((id *)&self->_selectedContentView, 0);
  objc_storeStrong((id *)&self->_timeTravelDimmingOverlayView, 0);
  objc_storeStrong((id *)&self->_transitionDimmingView, 0);
  objc_storeStrong((id *)&self->_transitionViewTo, 0);
  objc_storeStrong((id *)&self->_editOptionTo, 0);
  objc_storeStrong((id *)&self->_transitionViewFrom, 0);
  objc_storeStrong((id *)&self->_editOptionFrom, 0);
}

@end
