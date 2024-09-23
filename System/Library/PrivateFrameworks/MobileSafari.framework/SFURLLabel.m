@implementation SFURLLabel

- (BOOL)accessibilityIgnoresInvertColors
{
  return -[UILabel accessibilityIgnoresInvertColors](self->_label, "accessibilityIgnoresInvertColors");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SFURLLabel _updateSizeIfNeeded](self, "_updateSizeIfNeeded");
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v7 = self->_urlSize.width;
    v8 = self->_urlSize.height;
  }
  else
  {
    -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", width, height);
  }
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  UILabel **p_label;
  UILabel *label;
  __int128 v13;
  double v14;
  $2A756C8CE9B9339971B8C228F234A8CD *p_textSizeTransitionContext;
  void *v16;
  double Width;
  CGFloat v18;
  double Height;
  double v20;
  UILabel *v21;
  _BOOL4 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double fadeOutDistance;
  CGAffineTransform v33;
  CGAffineTransform v34;
  _OWORD v35[3];
  objc_super v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v36.receiver = self;
  v36.super_class = (Class)SFURLLabel;
  -[SFURLLabel layoutSubviews](&v36, sel_layoutSubviews);
  -[SFURLLabel _updateSizeIfNeeded](self, "_updateSizeIfNeeded");
  -[SFURLLabel bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  p_label = &self->_label;
  label = self->_label;
  v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v35[0] = *MEMORY[0x1E0C9BAA8];
  v35[1] = v13;
  v35[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[UILabel setTransform:](label, "setTransform:", v35);
  if (self->_textAlignmentEdge)
  {
    v37.origin.x = v4;
    v37.origin.y = v6;
    v37.size.width = v8;
    v37.size.height = v10;
    v14 = CGRectGetMaxX(v37) - self->_urlSize.width;
  }
  else
  {
    v14 = 0.0;
  }
  v38.origin.x = v4;
  v38.origin.y = v6;
  v38.size.width = v8;
  v38.size.height = v10;
  CGRectGetHeight(v38);
  -[UILabel setFrame:](*p_label, "setFrame:", _SFRoundRectToPixels(v14));
  p_textSizeTransitionContext = &self->_textSizeTransitionContext;
  if (self->_textSizeTransitionContext.label)
  {
    -[UILabel textColor](*p_label, "textColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](p_textSizeTransitionContext->label, "setTextColor:", v16);

    -[UILabel center](*p_label, "center");
    -[UILabel setCenter:](p_textSizeTransitionContext->label, "setCenter:");
    -[UILabel frame](*p_label, "frame");
    Width = CGRectGetWidth(v39);
    v18 = Width / CGRectGetWidth(self->_textSizeTransitionContext.previousLabelFrame);
    -[UILabel frame](*p_label, "frame");
    Height = CGRectGetHeight(v40);
    v20 = Height / CGRectGetHeight(self->_textSizeTransitionContext.previousLabelFrame);
    CGAffineTransformMakeScale(&v34, v18, v20);
    v21 = p_textSizeTransitionContext->label;
    v33 = v34;
    -[UILabel setTransform:](v21, "setTransform:", &v33);
    v22 = _SFEqualWithEpsilon(v18, 1.0, 0.0001) && _SFEqualWithEpsilon(v20, 1.0, 0.0001);
    -[UILabel setAlpha:](*p_label, "setAlpha:", (double)!v22);
    v23 = (double)v22;
  }
  else
  {
    v23 = 1.0;
    p_textSizeTransitionContext = ($2A756C8CE9B9339971B8C228F234A8CD *)&self->_label;
  }
  -[UILabel setAlpha:](p_textSizeTransitionContext->label, "setAlpha:", v23);
  -[SFURLLabel _unclippedContentRect](self, "_unclippedContentRect");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  if (!-[SFURLLabel needsMasking](self, "needsMasking"))
  {
    fadeOutDistance = self->_fadeOutDistance;
    v29 = v29 + fadeOutDistance;
    if (self->_textAlignmentEdge != 1)
      fadeOutDistance = 0.0;
    v25 = v25 - fadeOutDistance;
  }
  -[UIImageView setFrame:](self->_fadeOut, "setFrame:", v25, v27, v29, v31);
  -[SFURLLabel _updateMask](self, "_updateMask");
}

- (CGRect)_unclippedContentRect
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  id WeakRetained;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect v22;
  CGRect result;
  CGRect v24;

  -[SFURLLabel bounds](self, "bounds");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  WeakRetained = objc_loadWeakRetained((id *)&self->_URLContainerClipView);
  v12 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "bounds");
    -[SFURLLabel convertRect:fromView:](self, "convertRect:fromView:", v12);
    v24.origin.x = v13;
    v24.origin.y = v14;
    v24.size.width = v15;
    v24.size.height = v16;
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    v22 = CGRectIntersection(v21, v24);
    x = v22.origin.x;
    y = v22.origin.y;
    width = v22.size.width;
    height = v22.size.height;
  }

  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)_updateSizeIfNeeded
{
  if (self->_needsUpdateSize)
    -[SFURLLabel _updateSize](self, "_updateSize");
  self->_needsUpdateSize = 0;
}

- (void)_updateMask
{
  UIImageView *fadeOut;

  if (-[SFURLLabel needsMasking](self, "needsMasking")
    || -[SFURLLabel isAnimatingTextSize](self, "isAnimatingTextSize"))
  {
    fadeOut = self->_fadeOut;
  }
  else
  {
    fadeOut = 0;
  }
  -[SFURLLabel setMaskView:](self, "setMaskView:", fadeOut);
}

- (BOOL)isAnimatingTextSize
{
  return self->_textSizeTransitionContext.transitionCount != 0;
}

- (void)setTextAlignmentEdge:(int64_t)a3
{
  if (self->_textAlignmentEdge != a3)
  {
    self->_textAlignmentEdge = a3;
    -[SFURLLabel setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setFadeOutEdge:(int64_t)a3
{
  id v4;

  if (self->_fadeOutEdge != a3)
  {
    self->_fadeOutEdge = a3;
    SFFadeOutImage(a3 != 0, self->_fadeOutDistance);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_fadeOut, "setImage:", v4);

  }
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_label, "setAdjustsFontForContentSizeCategory:", a3);
}

- (SFURLLabel)initWithFadeOutDistance:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  SFURLLabel *v8;
  SFURLLabel *v9;
  UILabel *v10;
  UILabel *label;
  void *v12;
  void *v13;
  SFURLLabelFadeOutImageView *v14;
  UIImageView *fadeOut;
  void *v16;
  void *v17;
  id v18;
  SFURLLabel *v19;
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)SFURLLabel;
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = -[SFURLLabel initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v5, v6, v7);
  v9 = v8;
  if (v8)
  {
    v8->_fadeOutDistance = a3;
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v9->_label;
    v9->_label = v10;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v9->_label, "setBackgroundColor:", v12);

    -[UILabel setTextAlignment:](v9->_label, "setTextAlignment:", 0);
    -[UILabel setContentMode:](v9->_label, "setContentMode:", 9);
    -[UILabel setLineBreakMode:](v9->_label, "setLineBreakMode:", 2);
    -[SFURLLabel contentView](v9, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v9->_label);
    objc_msgSend(v13, "setClipsToBounds:", 0);
    v14 = -[SFURLLabelFadeOutImageView initWithFrame:]([SFURLLabelFadeOutImageView alloc], "initWithFrame:", v4, v5, v6, v7);
    fadeOut = v9->_fadeOut;
    v9->_fadeOut = &v14->super;

    SFFadeOutImage(0, v9->_fadeOutDistance);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v9->_fadeOut, "setImage:", v16);

    v22[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)-[SFURLLabel registerForTraitChanges:withTarget:action:](v9, "registerForTraitChanges:withTarget:action:", v17, v9, sel__preferredContentSizeCategoryDidChange);

    v19 = v9;
  }

  return v9;
}

- (void)setFont:(id)a3
{
  void *v4;
  char v5;
  id v6;
  _QWORD v7[5];

  v6 = a3;
  -[UILabel font](self->_label, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    -[UILabel setFont:](self->_label, "setFont:", v6);
    -[SFURLLabel _updateSize](self, "_updateSize");
    if (self->_textSizeTransitionContext.transitionCount)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __22__SFURLLabel_setFont___block_invoke;
      v7[3] = &unk_1E21E2050;
      v7[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v7);
    }
  }

}

- (void)_updateSize
{
  double v3;
  double v4;
  double width;
  double height;
  CGFloat v7;

  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v4 = v3;
  width = self->_urlSize.width;
  height = self->_urlSize.height;
  self->_urlSize.width = v7;
  if (_SFEqualWithEpsilon(v3, 0.0, 0.001))
    v4 = self->_urlSize.height;
  else
    self->_urlSize.height = v4;
  if (width != self->_urlSize.width || height != v4)
  {
    -[SFURLLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    if (!self->_needsUpdateSize)
      -[SFURLLabel setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTextColor:(id)a3
{
  -[UILabel setTextColor:](self->_label, "setTextColor:", a3);
}

- (void)setAttributedText:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UILabel attributedText](self->_label, "attributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqualToAttributedString:", v4);

  if ((v5 & 1) == 0)
  {
    -[UILabel setAttributedText:](self->_label, "setAttributedText:", v6);
    -[SFURLLabel _updateSize](self, "_updateSize");
  }

}

- (NSString)text
{
  return -[UILabel text](self->_label, "text");
}

- (void)setText:(id)a3
{
  void *v4;
  char v5;
  $2A756C8CE9B9339971B8C228F234A8CD *p_textSizeTransitionContext;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  id v11;

  v11 = a3;
  -[UILabel text](self->_label, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v11, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    -[UILabel setText:](self->_label, "setText:", v11);
    p_textSizeTransitionContext = &self->_textSizeTransitionContext;
    if (self->_textSizeTransitionContext.transitionCount)
    {
      -[UILabel setText:](p_textSizeTransitionContext->label, "setText:", v11);
      -[UILabel sizeToFit](p_textSizeTransitionContext->label, "sizeToFit");
      -[UILabel bounds](p_textSizeTransitionContext->label, "bounds");
      self->_textSizeTransitionContext.previousLabelFrame.origin.x = v7;
      self->_textSizeTransitionContext.previousLabelFrame.origin.y = v8;
      self->_textSizeTransitionContext.previousLabelFrame.size.width = v9;
      self->_textSizeTransitionContext.previousLabelFrame.size.height = v10;
    }
    -[SFURLLabel _updateSize](self, "_updateSize");
  }

}

- (SFURLLabel)init
{
  return -[SFURLLabel initWithFadeOutDistance:](self, "initWithFadeOutDistance:", 13.0);
}

- (BOOL)needsMasking
{
  double width;
  CGRect v4;

  width = self->_urlSize.width;
  -[SFURLLabel _unclippedContentRect](self, "_unclippedContentRect");
  return width > CGRectGetWidth(v4) + 0.001;
}

- (void)beginTextSizeAnimation
{
  $2A756C8CE9B9339971B8C228F234A8CD *p_textSizeTransitionContext;
  id v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;
  UILabel *label;
  UILabel *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  UILabel *v19;
  _QWORD v20[5];

  p_textSizeTransitionContext = &self->_textSizeTransitionContext;
  if (self->_textSizeTransitionContext.label)
  {
    ++self->_textSizeTransitionContext.transitionCount;
  }
  else
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[UILabel bounds](self->_label, "bounds");
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:");
    -[UILabel font](self->_label, "font");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5, "setFont:", v6);

    -[UILabel textColor](self->_label, "textColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5, "setTextColor:", v7);

    -[UILabel text](self->_label, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v5, "setText:", v8);

    -[UILabel setTextAlignment:](v5, "setTextAlignment:", -[UILabel textAlignment](self->_label, "textAlignment"));
    -[UILabel setLineBreakMode:](v5, "setLineBreakMode:", -[UILabel lineBreakMode](self->_label, "lineBreakMode"));
    -[UILabel setNumberOfLines:](v5, "setNumberOfLines:", -[UILabel numberOfLines](self->_label, "numberOfLines"));
    -[UILabel setAdjustsFontSizeToFitWidth:](v5, "setAdjustsFontSizeToFitWidth:", -[UILabel adjustsFontSizeToFitWidth](self->_label, "adjustsFontSizeToFitWidth"));
    label = p_textSizeTransitionContext->label;
    p_textSizeTransitionContext->label = v5;
    v10 = v5;

    -[UILabel bounds](self->_label, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    p_textSizeTransitionContext->previousLabelFrame.origin.x = v12;
    p_textSizeTransitionContext->previousLabelFrame.origin.y = v14;
    p_textSizeTransitionContext->previousLabelFrame.size.width = v16;
    p_textSizeTransitionContext->previousLabelFrame.size.height = v18;
    v19 = p_textSizeTransitionContext->label;
    ++p_textSizeTransitionContext->transitionCount;
    if (!v19)
      return;
  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __36__SFURLLabel_beginTextSizeAnimation__block_invoke;
  v20[3] = &unk_1E21E2050;
  v20[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v20);
}

uint64_t __36__SFURLLabel_beginTextSizeAnimation__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_updateMask");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "center");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 568), "setCenter:");
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 568));

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "setAlpha:", 0.0);
}

- (void)endTextSizeAnimation
{
  $2A756C8CE9B9339971B8C228F234A8CD *p_textSizeTransitionContext;
  int64_t v3;
  UILabel *label;

  p_textSizeTransitionContext = &self->_textSizeTransitionContext;
  v3 = self->_textSizeTransitionContext.transitionCount - 1;
  self->_textSizeTransitionContext.transitionCount = v3;
  if (!v3)
  {
    -[SFURLLabel _updateMask](self, "_updateMask");
    -[UILabel removeFromSuperview](p_textSizeTransitionContext->label, "removeFromSuperview");
    label = p_textSizeTransitionContext->label;
    p_textSizeTransitionContext->label = 0;

    -[UILabel setAlpha:](self->_label, "setAlpha:", 1.0);
  }
}

- (UIFont)font
{
  return -[UILabel font](self->_label, "font");
}

uint64_t __22__SFURLLabel_setFont___block_invoke(uint64_t a1)
{
  double Width;
  CGFloat v3;
  double Height;
  CGFloat v5;
  void *v6;
  CGAffineTransform v8;
  CGAffineTransform v9;
  CGRect v10;
  CGRect v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "setBounds:", 0.0, 0.0, *(double *)(*(_QWORD *)(a1 + 32) + 640), *(double *)(*(_QWORD *)(a1 + 32) + 648));
  Width = CGRectGetWidth(*(CGRect *)(*(_QWORD *)(a1 + 32) + 584));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "bounds");
  v3 = Width / CGRectGetWidth(v10);
  Height = CGRectGetHeight(*(CGRect *)(*(_QWORD *)(a1 + 32) + 584));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "bounds");
  v5 = CGRectGetHeight(v11);
  CGAffineTransformMakeScale(&v9, v3, Height / v5);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 544);
  v8 = v9;
  return objc_msgSend(v6, "setTransform:", &v8);
}

- (UIColor)textColor
{
  return -[UILabel textColor](self->_label, "textColor");
}

- (NSAttributedString)attributedText
{
  return -[UILabel attributedText](self->_label, "attributedText");
}

- (void)setAccessibilityIgnoresInvertColors:(BOOL)a3
{
  -[UILabel setAccessibilityIgnoresInvertColors:](self->_label, "setAccessibilityIgnoresInvertColors:", a3);
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return -[UILabel adjustsFontForContentSizeCategory](self->_label, "adjustsFontForContentSizeCategory");
}

- (double)baselineOffsetFromBottom
{
  double result;

  -[UILabel _baselineOffsetFromBottom](self->_label, "_baselineOffsetFromBottom");
  return result;
}

- (double)lastLineBaselineFrameOriginY
{
  double result;

  -[SFURLLabel layoutIfNeeded](self, "layoutIfNeeded");
  -[UILabel _lastLineBaselineFrameOriginY](self->_label, "_lastLineBaselineFrameOriginY");
  return result;
}

- (double)labelCapHeightInsetFromTop
{
  double result;

  -[UILabel _firstLineCapFrameOriginY](self->_label, "_firstLineCapFrameOriginY");
  return result;
}

- (id)accessibilityLabel
{
  return (id)-[UILabel accessibilityLabel](self->_label, "accessibilityLabel");
}

- (void)_setNeedsUpdateSize
{
  self->_needsUpdateSize = 1;
  -[SFURLLabel setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)intrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  -[SFURLLabel _updateSizeIfNeeded](self, "_updateSizeIfNeeded");
  width = self->_urlSize.width;
  height = self->_urlSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_preferredContentSizeCategoryDidChange
{
  if (-[SFURLLabel adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"))
    -[SFURLLabel _setNeedsUpdateSize](self, "_setNeedsUpdateSize");
}

- (CGSize)urlSize
{
  double width;
  double height;
  CGSize result;

  width = self->_urlSize.width;
  height = self->_urlSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)textAlignmentEdge
{
  return self->_textAlignmentEdge;
}

- (int64_t)fadeOutEdge
{
  return self->_fadeOutEdge;
}

- (UIView)URLContainerClipView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_URLContainerClipView);
}

- (void)setURLContainerClipView:(id)a3
{
  objc_storeWeak((id *)&self->_URLContainerClipView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_URLContainerClipView);

  objc_storeStrong((id *)&self->_fadeOut, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
