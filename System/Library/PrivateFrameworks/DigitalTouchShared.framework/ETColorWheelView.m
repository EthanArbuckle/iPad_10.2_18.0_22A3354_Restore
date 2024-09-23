@implementation ETColorWheelView

+ (double)colorWheelWidth
{
  if (SetupSpecValuesIfNeeded_onceToken_0 != -1)
    dispatch_once(&SetupSpecValuesIfNeeded_onceToken_0, &__block_literal_global_1);
  return 49.5;
}

+ (double)pickerDiameter
{
  if (SetupSpecValuesIfNeeded_onceToken_0 != -1)
    dispatch_once(&SetupSpecValuesIfNeeded_onceToken_0, &__block_literal_global_1);
  return 45.5;
}

+ (double)pickerWidth
{
  return 1.0;
}

+ (CGColor)pickerBorderColor
{
  id v2;
  CGColor *v3;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.5);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (CGColor *)objc_msgSend(v2, "CGColor");

  return v3;
}

- (ETColorWheelView)initWithFrame:(CGRect)a3
{
  ETColorWheelView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  ETColorGradientView *v8;
  ETColorGradientView *gradientView;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ETColorWheelView;
  v3 = -[ETColorWheelView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if (SetupSpecValuesIfNeeded_onceToken_0 != -1)
      dispatch_once(&SetupSpecValuesIfNeeded_onceToken_0, &__block_literal_global_1);
    -[ETColorWheelView bounds](v3, "bounds");
    v8 = -[ETColorGradientView initWithFrame:]([ETColorGradientView alloc], "initWithFrame:", v4, v5, v6, v7);
    gradientView = v3->_gradientView;
    v3->_gradientView = v8;

    -[ETColorWheelView addSubview:](v3, "addSubview:", v3->_gradientView);
    -[ETColorWheelView colorWheelRadius](v3, "colorWheelRadius");
    -[ETColorWheelView gradientWidth](v3, "gradientWidth");
    UIRectCenteredIntegralRect();
    -[DTSColorWheel createDoneButtonWithFrame:](v3, "createDoneButtonWithFrame:");
    -[DTSColorWheel doneButton](v3, "doneButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 13.5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v12);

    -[ETColorWheelView setHidden:](v3, "setHidden:", 1);
    -[ETColorWheelView hideDoneButton](v3, "hideDoneButton");
  }
  return v3;
}

- (id)pickerViewHighlightedColor
{
  void *v2;
  double originalRotation;
  double v4;

  v2 = (void *)MEMORY[0x24BDF6950];
  originalRotation = self->_originalRotation;
  -[DTSColorWheel pickerRotation](self, "pickerRotation");
  return (id)objc_msgSend(v2, "colorWithHue:saturation:brightness:alpha:", (double)HueFromRadians(originalRotation - v4), 1.0, 1.0, 1.0);
}

- (double)colorWheelRadius
{
  return 77.0;
}

- (double)gradientWidth
{
  return 49.5;
}

- (double)pickerDiameter
{
  return 45.5;
}

- (void)hideDoneButton
{
  void *v2;
  CGAffineTransform v3;

  -[DTSColorWheel doneButton](self, "doneButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);
  CGAffineTransformMakeScale(&v3, 0.7, 0.7);
  objc_msgSend(v2, "setTransform:", &v3);

}

- (void)showColorWheelFromPaletteCircle:(id)a3 rotation:(double)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  ETColorGradientView *gradientView;
  ETColorGradientView *v11;
  double v12;
  ETColorGradientView *v13;
  _QWORD v14[5];
  CGAffineTransform v15;
  CGAffineTransform v16;
  double v17;

  v17 = 0.0;
  v6 = a3;
  objc_msgSend(v6, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getHue:saturation:brightness:alpha:", &v17, 0, 0, 0);

  -[DTSColorWheel setHueRotation:](self, "setHueRotation:", RadiansFromHue(v17));
  -[DTSColorWheel hueRotation](self, "hueRotation");
  v9 = v8 + a4;
  self->_originalRotation = v9;
  CGAffineTransformMakeRotation(&v16, v9);
  gradientView = self->_gradientView;
  v15 = v16;
  -[ETColorGradientView setTransform:](gradientView, "setTransform:", &v15);
  -[ETColorWheelView setHidden:](self, "setHidden:", 0);
  -[ETColorWheelView addPickerCircleForPaletteCircle:](self, "addPickerCircleForPaletteCircle:", v6);

  -[ETColorWheelView showDoneButtonAnimated](self, "showDoneButtonAnimated");
  v11 = self->_gradientView;
  -[DTSColorWheel hueRotation](self, "hueRotation");
  -[ETColorGradientView prepareToAnimateColorWheelWithRotation:](v11, "prepareToAnimateColorWheelWithRotation:", -v12);
  v13 = self->_gradientView;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __61__ETColorWheelView_showColorWheelFromPaletteCircle_rotation___block_invoke;
  v14[3] = &unk_24F6E6A98;
  v14[4] = self;
  -[ETColorGradientView revealColorWheelWithCompletion:](v13, "revealColorWheelWithCompletion:", v14);
}

uint64_t __61__ETColorWheelView_showColorWheelFromPaletteCircle_rotation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "becomeFirstResponder");
}

- (void)showDoneButtonAnimated
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __42__ETColorWheelView_showDoneButtonAnimated__block_invoke;
  v2[3] = &unk_24F6E6A98;
  v2[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v2, 0.2);
}

void __42__ETColorWheelView_showDoneButtonAnimated__block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v3[3];

  objc_msgSend(*(id *)(a1 + 32), "doneButton");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v3[0] = *MEMORY[0x24BDBD8B8];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v1, "setTransform:", v3);
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)hideDoneButtonAnimated
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __42__ETColorWheelView_hideDoneButtonAnimated__block_invoke;
  v2[3] = &unk_24F6E6A98;
  v2[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v2, 0.2);
}

uint64_t __42__ETColorWheelView_hideDoneButtonAnimated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hideDoneButton");
}

- (void)addPickerCircleForPaletteCircle:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;

  v4 = a3;
  -[ETColorWheelView pickerDiameter](self, "pickerDiameter");
  v6 = v5;
  v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", 0.0, 0.0, v6, v6);
  objc_msgSend(v21, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", v6 * 0.5);

  objc_msgSend(v21, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.5);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "setBorderColor:", objc_msgSend(v9, "CGColor"));

  objc_msgSend(v21, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBorderWidth:", 1.0);

  -[DTSColorWheel setPickerCircle:](self, "setPickerCircle:", v21);
  -[ETColorWheelView addSubview:](self, "addSubview:", v21);
  objc_msgSend(v4, "center");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v4, "superview");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[ETColorWheelView convertPoint:fromView:](self, "convertPoint:fromView:", v15, v12, v14);
  v17 = v16;
  v19 = v18;

  -[DTSColorWheel updatePickerPositionForPoint:](self, "updatePickerPositionForPoint:", v17, v19);
  RoundViewOriginToViewScale(v21);
  -[DTSColorWheel pickerRotation](self, "pickerRotation");
  self->_originalPickerRotation = v20;

}

- (void)beganTouches:(id)a3
{
  objc_super v3;

  self->_handlingTouches = 1;
  v3.receiver = self;
  v3.super_class = (Class)ETColorWheelView;
  -[DTSColorWheel beganTouches:](&v3, sel_beganTouches_, a3);
}

- (void)finishedTouches
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ETColorWheelView;
  -[DTSColorWheel finishedTouches](&v3, sel_finishedTouches);
  self->_handlingTouches = 0;
}

- (BOOL)pickerShouldDismissClockwise
{
  double i;
  double v4;
  double v5;
  double v6;
  double j;
  double v8;

  for (i = self->_originalPickerRotation; i < 0.0; i = i + 6.28318531)
    ;
  v4 = fmod(i, 6.28318531);
  if (i <= 6.28318531)
    v4 = i;
  v5 = 6.28318531 - v4;
  -[DTSColorWheel pickerRotation](self, "pickerRotation");
  for (j = v6 + v5; j < 0.0; j = j + 6.28318531)
    ;
  v8 = fmod(j, 6.28318531);
  if (j <= 6.28318531)
    v8 = j;
  return v8 > 3.14159265;
}

- (double)colorWheelDismissalRotation
{
  double originalPickerRotation;
  double v4;
  double v5;
  _BOOL4 v6;
  char v7;

  originalPickerRotation = self->_originalPickerRotation;
  -[DTSColorWheel pickerRotation](self, "pickerRotation");
  v5 = originalPickerRotation - v4;
  v6 = -[ETColorWheelView pickerShouldDismissClockwise](self, "pickerShouldDismissClockwise");
  if (v6 && v5 < 0.0)
  {
    do
      v5 = v5 + 6.28318531;
    while (v5 < 0.0);
  }
  else
  {
    v7 = v5 <= 0.0 || v6;
    if ((v7 & 1) == 0)
    {
      if (v5 < 0.0)
      {
        do
          v5 = v5 + 6.28318531;
        while (v5 < 0.0);
      }
      else
      {
        return fmod(v5, 6.28318531) + -6.28318531;
      }
    }
  }
  return v5;
}

- (void)doneButtonTapped:(id)a3
{
  -[ETColorWheelView hideColorWheelPickingColor:](self, "hideColorWheelPickingColor:", 1);
}

- (void)hideColorWheelPickingColor:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  ETColorGradientView *gradientView;
  double v12;
  ETColorGradientView *v13;
  double v14;
  double v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v3 = a3;
  -[DTSColorWheel pickerCircle](self, "pickerCircle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[ETColorWheelView resignFirstResponder](self, "resignFirstResponder");
  -[DTSColorWheel delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[DTSColorWheel delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "colorWheel:willPickColor:", self, v7);

  }
  gradientView = self->_gradientView;
  -[DTSColorWheel hueRotation](self, "hueRotation");
  -[ETColorGradientView prepareToAnimateColorWheelWithRotation:](gradientView, "prepareToAnimateColorWheelWithRotation:", -v12);
  -[ETColorWheelView hideDoneButtonAnimated](self, "hideDoneButtonAnimated");
  -[ETColorWheelView animatePickerToOriginalPosition](self, "animatePickerToOriginalPosition");
  v13 = self->_gradientView;
  -[ETColorWheelView colorWheelDismissalRotation](self, "colorWheelDismissalRotation");
  v15 = v14;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __47__ETColorWheelView_hideColorWheelPickingColor___block_invoke;
  v18[3] = &unk_24F6E6B28;
  v18[4] = self;
  v19 = v6;
  v20 = v7;
  v16 = v7;
  v17 = v6;
  -[ETColorGradientView hideColorWheelWithRotation:completion:](v13, "hideColorWheelWithRotation:completion:", v18, v15);

}

void __47__ETColorWheelView_hideColorWheelPickingColor___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 40), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllAnimations");

  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorWheel:didPickColor:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  }
}

- (void)animatePickerToOriginalPosition
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  CGFloat MidY;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGPath *Mutable;
  BOOL v14;
  CGFloat v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  CGRect v27;
  CGRect v28;

  -[ETColorWheelView bounds](self, "bounds");
  x = v27.origin.x;
  y = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;
  MidX = CGRectGetMidX(v27);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  MidY = CGRectGetMidY(v28);
  -[ETColorWheelView colorWheelRadius](self, "colorWheelRadius");
  v10 = v9;
  -[ETColorWheelView colorWheelRadius](self, "colorWheelRadius");
  v12 = v10 + v11 * -0.5;
  Mutable = CGPathCreateMutable();
  v14 = -[ETColorWheelView pickerShouldDismissClockwise](self, "pickerShouldDismissClockwise");
  -[DTSColorWheel pickerRotation](self, "pickerRotation");
  CGPathAddArc(Mutable, 0, MidX, MidY, v12, v15, self->_originalPickerRotation, !v14);
  -[DTSColorWheel pickerCircle](self, "pickerCircle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("position"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTimingFunction:", v18);

  objc_msgSend(v17, "setDuration:", 0.275);
  objc_msgSend(v17, "setPath:", Mutable);
  objc_msgSend(v17, "setFillMode:", *MEMORY[0x24BDE5978]);
  objc_msgSend(v17, "setRemovedOnCompletion:", 0);
  objc_msgSend(v16, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAnimation:forKey:", v17, CFSTR("position"));

  CFRelease(Mutable);
  v20 = (void *)MEMORY[0x24BDF6F90];
  v21 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __51__ETColorWheelView_animatePickerToOriginalPosition__block_invoke;
  v25[3] = &unk_24F6E6A98;
  v26 = v16;
  v23[0] = v21;
  v23[1] = 3221225472;
  v23[2] = __51__ETColorWheelView_animatePickerToOriginalPosition__block_invoke_2;
  v23[3] = &unk_24F6E6BC8;
  v24 = v26;
  v22 = v26;
  objc_msgSend(v20, "animateWithDuration:animations:completion:", v25, v23, 0.275);

}

void __51__ETColorWheelView_animatePickerToOriginalPosition__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  CGAffineTransform v8;

  +[ETPaletteCircleView selectionMarkerDiameter](ETPaletteCircleView, "selectionMarkerDiameter");
  v3 = v2;
  +[ETColorWheelView pickerDiameter](ETColorWheelView, "pickerDiameter");
  v4 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v8, v3 / v5, v3 / v5);
  objc_msgSend(v4, "setTransform:", &v8);
  v6 = *(void **)(a1 + 32);
  +[ETPaletteCircleView selectionMarkerColor](ETPaletteCircleView, "selectionMarkerColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

}

void __51__ETColorWheelView_animatePickerToOriginalPosition__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setBorderWidth:", 0.0);

}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedColor, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
}

@end
