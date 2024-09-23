@implementation EKUITodayCirclePulseView

- (EKUITodayCirclePulseView)initWithFrame:(CGRect)a3
{
  EKUITodayCirclePulseView *v3;
  void *v4;
  UIView *v5;
  UIView *backgroundContainer;
  void *v7;
  TodayCirclePulseBackground *v8;
  TodayCirclePulseBackground *background;
  void *v10;
  UILabel *v11;
  UILabel *label;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)EKUITodayCirclePulseView;
  v3 = -[EKUITodayCirclePulseView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUITodayCirclePulseView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[EKUITodayCirclePulseView setClipsToBounds:](v3, "setClipsToBounds:", 0);
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    backgroundContainer = v3->_backgroundContainer;
    v3->_backgroundContainer = v5;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_backgroundContainer, "setBackgroundColor:", v7);

    v8 = objc_alloc_init(TodayCirclePulseBackground);
    background = v3->_background;
    v3->_background = v8;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TodayCirclePulseBackground setBackgroundColor:](v3->_background, "setBackgroundColor:", v10);

    -[TodayCirclePulseBackground setAutoresizingMask:](v3->_background, "setAutoresizingMask:", 18);
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v3->_label;
    v3->_label = v11;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v3->_label, "setBackgroundColor:", v13);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_label, "setTextColor:", v14);

    -[UILabel setTextAlignment:](v3->_label, "setTextAlignment:", 1);
    -[UIView addSubview:](v3->_backgroundContainer, "addSubview:", v3->_background);
    -[EKUITodayCirclePulseView addSubview:](v3, "addSubview:", v3->_backgroundContainer);
    -[EKUITodayCirclePulseView addSubview:](v3, "addSubview:", v3->_label);
  }
  return v3;
}

- (void)setString:(id)a3
{
  -[UILabel setText:](self->_label, "setText:", a3);
  -[EKUITodayCirclePulseView _updateLabelAttributedString](self, "_updateLabelAttributedString");
  -[EKUITodayCirclePulseView setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)string
{
  return -[UILabel text](self->_label, "text");
}

- (void)setFont:(id)a3
{
  -[UILabel setFont:](self->_label, "setFont:", a3);
}

- (UIFont)font
{
  return -[UILabel font](self->_label, "font");
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
  -[EKUITodayCirclePulseView _updateLabelAttributedString](self, "_updateLabelAttributedString");
  -[EKUITodayCirclePulseView setNeedsLayout](self, "setNeedsLayout");
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setUsesRoundedRectInsteadOfCircle:(BOOL)a3
{
  -[TodayCirclePulseBackground setUsesRoundedRectInsteadOfCircle:](self->_background, "setUsesRoundedRectInsteadOfCircle:", a3);
}

- (BOOL)usesRoundedRectInsteadOfCircle
{
  return -[TodayCirclePulseBackground usesRoundedRectInsteadOfCircle](self->_background, "usesRoundedRectInsteadOfCircle");
}

- (void)setRoundedRectCornerRadius:(double)a3
{
  -[TodayCirclePulseBackground setRoundedRectCornerRadius:](self->_background, "setRoundedRectCornerRadius:", a3);
}

- (double)roundedRectCornerRadius
{
  double result;

  -[TodayCirclePulseBackground roundedRectCornerRadius](self->_background, "roundedRectCornerRadius");
  return result;
}

- (void)_updateLabelAttributedString
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  -[UILabel text](self->_label, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else if (!self->_attributes)
  {
    return;
  }
  v4 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[UILabel text](self->_label, "text");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "initWithString:attributes:", v6, self->_attributes);
  -[UILabel setAttributedText:](self->_label, "setAttributedText:", v5);

}

- (id)_overlayLabel
{
  UILabel *overlayLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;

  overlayLabel = self->_overlayLabel;
  if (!overlayLabel)
  {
    v4 = (UILabel *)objc_opt_new();
    v5 = self->_overlayLabel;
    self->_overlayLabel = v4;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](self->_overlayLabel, "setBackgroundColor:", v6);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_overlayLabel, "setTextColor:", v7);

    -[UILabel setTextAlignment:](self->_overlayLabel, "setTextAlignment:", 1);
    -[EKUITodayCirclePulseView addSubview:](self, "addSubview:", self->_overlayLabel);
    overlayLabel = self->_overlayLabel;
  }
  return overlayLabel;
}

- (void)setOverlayString:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[EKUITodayCirclePulseView _overlayLabel](self, "_overlayLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[EKUITodayCirclePulseView _updateOverlayLabelAttributedString](self, "_updateOverlayLabelAttributedString");
  -[EKUITodayCirclePulseView setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)overlayString
{
  return -[UILabel text](self->_overlayLabel, "text");
}

- (void)setOverlayFont:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EKUITodayCirclePulseView _overlayLabel](self, "_overlayLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

}

- (UIFont)overlayFont
{
  return -[UILabel font](self->_overlayLabel, "font");
}

- (void)setOverlayAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_overlayAttributes, a3);
  -[EKUITodayCirclePulseView _updateOverlayLabelAttributedString](self, "_updateOverlayLabelAttributedString");
  -[EKUITodayCirclePulseView setNeedsLayout](self, "setNeedsLayout");
}

- (NSDictionary)overlayAttributes
{
  return self->_overlayAttributes;
}

- (void)_updateOverlayLabelAttributedString
{
  void *v3;
  NSDictionary *overlayAttributes;
  id v5;
  void *v6;
  id v7;

  -[UILabel text](self->_overlayLabel, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    overlayAttributes = self->_overlayAttributes;

    if (overlayAttributes)
    {
      v5 = objc_alloc(MEMORY[0x1E0CB3498]);
      -[UILabel text](self->_overlayLabel, "text");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "initWithString:attributes:", v7, self->_overlayAttributes);
      -[UILabel setAttributedText:](self->_overlayLabel, "setAttributedText:", v6);

    }
  }
}

- (void)setCircleDiameter:(double)a3
{
  self->_circleDiameter = a3;
}

- (void)_layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double textYOffset;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  CGFloat Width;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  -[EKUITodayCirclePulseView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UILabel sizeToFit](self->_label, "sizeToFit");
  -[UILabel frame](self->_label, "frame");
  v12 = v11;
  v48 = v13;
  v14 = v8;
  v15 = v4;
  if (!-[EKUITodayCirclePulseView dontApplyCenteringOffset](self, "dontApplyCenteringOffset"))
  {
    -[UILabel text](self->_label, "text");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel font](self->_label, "font");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (v8 - v12) * 0.5 + CalOffsetToCenterNumberWithFont(v16, v17);

    v14 = v12;
  }
  -[EKUITodayCirclePulseView textFrameWidthAdjustment](self, "textFrameWidthAdjustment");
  v19 = v18;
  textYOffset = self->_textYOffset;
  if (-[EKUITodayCirclePulseView circleShouldFillFrame](self, "circleShouldFillFrame"))
  {
    v45 = v6;
    v46 = v4;
    v47 = v10;
    v44 = v8;
  }
  else
  {
    -[EKUITodayCirclePulseView circleDiameter](self, "circleDiameter");
    v44 = v21;
    -[EKUITodayCirclePulseView circleDiameter](self, "circleDiameter");
    v47 = v22;
    -[EKUITodayCirclePulseView circleDiameter](self, "circleDiameter");
    v46 = (v8 - v23) * 0.5;
    -[EKUITodayCirclePulseView circleDiameter](self, "circleDiameter");
    v45 = textYOffset + (v48 - v24) * 0.5;
  }
  v25 = v14 + v19;
  -[EKUITodayCirclePulseView textOffsetFromCircle](self, "textOffsetFromCircle");
  v27 = v15 + v26;
  -[EKUITodayCirclePulseView textOffsetFromCircle](self, "textOffsetFromCircle");
  v29 = textYOffset + v28;
  -[UILabel text](self->_overlayLabel, "text");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "length");

  if (v31)
  {
    v43 = v8;
    -[UILabel sizeToFit](self->_overlayLabel, "sizeToFit");
    -[UILabel frame](self->_overlayLabel, "frame");
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v39 = v38;
    if (!-[EKUITodayCirclePulseView usesTextYOffsetWithoutAdjustmentForOverlay](self, "usesTextYOffsetWithoutAdjustmentForOverlay"))
    {
      v49.origin.x = v33;
      v49.origin.y = v35;
      v49.size.width = v37;
      v49.size.height = v39;
      v29 = v29 - ((CGRectGetHeight(v49) + -4.0) * 0.5 + 2.0);
    }
    v40 = v48;
    v50.origin.x = v27;
    v50.origin.y = v29;
    v50.size.width = v25;
    v50.size.height = v48;
    v41 = CGRectGetMaxY(v50) + -2.5;
    v51.origin.x = v33;
    v51.origin.y = v41;
    v51.size.width = v37;
    v51.size.height = v39;
    Width = CGRectGetWidth(v51);
    -[UILabel setFrame:](self->_overlayLabel, "setFrame:", CalRoundRectToScreenScale((v43 - Width) * 0.5, v41, v37, v39));
  }
  else
  {
    v40 = v48;
  }
  -[UILabel setFrame:](self->_label, "setFrame:", CalRoundRectToScreenScale(v27, v29, v25, v40));
  -[UIView setFrame:](self->_backgroundContainer, "setFrame:", CalRoundRectToScreenScale(v46, v45, v44, v47));
}

- (void)pulse:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v4 = a3;
  -[EKUITodayCirclePulseView _layoutSubviews](self, "_layoutSubviews");
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __34__EKUITodayCirclePulseView_pulse___block_invoke;
  v11[3] = &unk_1E6018688;
  v11[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v11, 0, 0.23, 0.07);
  v6 = (void *)MEMORY[0x1E0DC3F10];
  v9 = v4;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __34__EKUITodayCirclePulseView_pulse___block_invoke_2;
  v10[3] = &unk_1E6018688;
  v10[4] = self;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __34__EKUITodayCirclePulseView_pulse___block_invoke_3;
  v8[3] = &unk_1E6018CC0;
  v7 = v4;
  objc_msgSend(v6, "_animateWithDuration:delay:options:factory:animations:completion:", 196608, self, v10, v8, 1.29, 0.0);

}

void __34__EKUITodayCirclePulseView_pulse___block_invoke(uint64_t a1)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  void *v6;
  CATransform3D v7;
  CATransform3D v8;
  CATransform3D v9;

  v2 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&v8.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&v8.m33 = v2;
  v3 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  *(_OWORD *)&v8.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  *(_OWORD *)&v8.m43 = v3;
  v4 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  *(_OWORD *)&v8.m11 = *MEMORY[0x1E0CD2610];
  *(_OWORD *)&v8.m13 = v4;
  v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  *(_OWORD *)&v8.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  *(_OWORD *)&v8.m23 = v5;
  CATransform3DScale(&v9, &v8, 0.84, 0.84, 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;
  objc_msgSend(v6, "setTransform:", &v7);

}

void __34__EKUITodayCirclePulseView_pulse___block_invoke_2(uint64_t a1)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  void *v6;
  CATransform3D v7;
  CATransform3D v8;
  CATransform3D v9;

  v2 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&v8.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&v8.m33 = v2;
  v3 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  *(_OWORD *)&v8.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  *(_OWORD *)&v8.m43 = v3;
  v4 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  *(_OWORD *)&v8.m11 = *MEMORY[0x1E0CD2610];
  *(_OWORD *)&v8.m13 = v4;
  v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  *(_OWORD *)&v8.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  *(_OWORD *)&v8.m23 = v5;
  CATransform3DScale(&v9, &v8, 1.19047619, 1.19047619, 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;
  objc_msgSend(v6, "setTransform:", &v7);

}

uint64_t __34__EKUITodayCirclePulseView_pulse___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMass:", 1.2);
  objc_msgSend(v4, "setStiffness:", 400.0);
  objc_msgSend(v4, "setDamping:", 16.0);
  return v4;
}

- (double)circleDiameter
{
  return self->_circleDiameter;
}

- (double)textYOffset
{
  return self->_textYOffset;
}

- (void)setTextYOffset:(double)a3
{
  self->_textYOffset = a3;
}

- (CGPoint)textOffsetFromCircle
{
  double x;
  double y;
  CGPoint result;

  x = self->_textOffsetFromCircle.x;
  y = self->_textOffsetFromCircle.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTextOffsetFromCircle:(CGPoint)a3
{
  self->_textOffsetFromCircle = a3;
}

- (BOOL)usesTextYOffsetWithoutAdjustmentForOverlay
{
  return self->_usesTextYOffsetWithoutAdjustmentForOverlay;
}

- (void)setUsesTextYOffsetWithoutAdjustmentForOverlay:(BOOL)a3
{
  self->_usesTextYOffsetWithoutAdjustmentForOverlay = a3;
}

- (BOOL)circleShouldFillFrame
{
  return self->_circleShouldFillFrame;
}

- (void)setCircleShouldFillFrame:(BOOL)a3
{
  self->_circleShouldFillFrame = a3;
}

- (BOOL)dontApplyCenteringOffset
{
  return self->_dontApplyCenteringOffset;
}

- (void)setDontApplyCenteringOffset:(BOOL)a3
{
  self->_dontApplyCenteringOffset = a3;
}

- (double)textFrameWidthAdjustment
{
  return self->_textFrameWidthAdjustment;
}

- (void)setTextFrameWidthAdjustment:(double)a3
{
  self->_textFrameWidthAdjustment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayAttributes, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_overlayLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_backgroundContainer, 0);
}

@end
