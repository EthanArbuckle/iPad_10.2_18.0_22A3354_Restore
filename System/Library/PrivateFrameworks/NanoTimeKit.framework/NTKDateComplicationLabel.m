@implementation NTKDateComplicationLabel

- (NTKDateComplicationLabel)initWithSizeStyle:(int64_t)a3 accentType:(int64_t)a4 forDevice:(id)a5
{
  id v9;
  NTKDateComplicationLabel *v10;
  NTKDateComplicationLabel *v11;
  id v12;
  uint64_t v13;
  UIView *highlightView;
  UIView *v15;
  void *v16;
  void *v17;
  UILabel *v18;
  UILabel *internalLabel;
  UILabel *v20;
  void *v21;
  objc_super v23;

  v9 = a5;
  v23.receiver = self;
  v23.super_class = (Class)NTKDateComplicationLabel;
  v10 = -[NTKDateComplicationLabel init](&v23, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_frozen = 0;
    v10->_sizeStyle = a3;
    v10->_accentType = a4;
    objc_storeStrong((id *)&v10->_device, a5);
    v12 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v13 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    highlightView = v11->_highlightView;
    v11->_highlightView = (UIView *)v13;

    v15 = v11->_highlightView;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v15, "setBackgroundColor:", v16);

    -[UIView setUserInteractionEnabled:](v11->_highlightView, "setUserInteractionEnabled:", 0);
    -[UIView setAlpha:](v11->_highlightView, "setAlpha:", 0.0);
    -[UIView layer](v11->_highlightView, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKDateComplicationLabel _cornerRadius](v11, "_cornerRadius");
    objc_msgSend(v17, "setCornerRadius:");

    -[NTKDateComplicationLabel addSubview:](v11, "addSubview:", v11->_highlightView);
    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    internalLabel = v11->_internalLabel;
    v11->_internalLabel = v18;

    -[UILabel setTextAlignment:](v11->_internalLabel, "setTextAlignment:", 1);
    v20 = v11->_internalLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v20, "setTextColor:", v21);

    -[NTKDateComplicationLabel addSubview:](v11, "addSubview:", v11->_internalLabel);
    -[NTKDateComplicationLabel _computeTextColor](v11, "_computeTextColor");
  }

  return v11;
}

- (void)layoutSubviews
{
  double v3;
  double x;
  double v5;
  double y;
  double v7;
  double width;
  double v9;
  double height;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  v17.receiver = self;
  v17.super_class = (Class)NTKDateComplicationLabel;
  -[NTKDateComplicationLabel layoutSubviews](&v17, sel_layoutSubviews);
  -[NTKDateComplicationLabel bounds](self, "bounds");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  if (self->_usesLegibility)
  {
    -[NTKDateComplicationLabel _legibtilityShadowRadius](self, "_legibtilityShadowRadius");
    v12 = -v11;
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    v19 = CGRectInset(v18, v12, v12);
    x = v19.origin.x;
    y = v19.origin.y;
    width = v19.size.width;
    height = v19.size.height;
  }
  -[UILabel setFrame:](self->_internalLabel, "setFrame:", x, y, width, height);
  -[NTKDateComplicationLabel _highlightInset](self, "_highlightInset");
  v14 = v13;
  v16 = v15;
  -[NTKDateComplicationLabel bounds](self, "bounds");
  v21 = CGRectInset(v20, v14, v16);
  -[UIView setFrame:](self->_highlightView, "setFrame:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  NSMutableDictionary *cachedFittingSizes;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  _QWORD v22[2];
  _QWORD v23[2];
  CGSize v24;
  CGSize result;

  height = a3.height;
  width = a3.width;
  cachedFittingSizes = self->_cachedFittingSizes;
  v24 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v24, "{CGSize=dd}");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](cachedFittingSizes, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "CGSizeValue");
    v10 = v9;
    v12 = v11;
  }
  else
  {
    -[UILabel sizeThatFits:](self->_internalLabel, "sizeThatFits:", width, height);
    v10 = v13;
    v12 = v14;
    v15 = self->_cachedFittingSizes;
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v16 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v17 = self->_cachedFittingSizes;
      self->_cachedFittingSizes = v16;

      v15 = self->_cachedFittingSizes;
    }
    *(double *)v23 = v10;
    *(double *)&v23[1] = v12;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v23, "{CGSize=dd}");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(double *)v22 = width;
    *(double *)&v22[1] = height;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v22, "{CGSize=dd}");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v18, v19);

  }
  v20 = v10;
  v21 = v12;
  result.height = v21;
  result.width = v20;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[NTKDateComplicationLabel sizeThatFits:](self, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKDateComplicationLabel;
  -[NTKDateComplicationLabel traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  -[NTKDateComplicationLabel traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "legibilityWeight");
  if (v6 != objc_msgSend(v4, "legibilityWeight"))
  {
    -[UILabel traitCollectionDidChange:](self->_internalLabel, "traitCollectionDidChange:", v4);
    -[NTKDateComplicationLabel _invalidateInternalLabelSize](self, "_invalidateInternalLabelSize");
  }

}

- (void)setDateComplicationText:(id)a3 withDayRange:(_NSRange)a4 forDateStyle:(unint64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  objc_storeStrong((id *)&self->_currentDateText, a3);
  self->_dayTextRange.location = location;
  self->_dayTextRange.length = length;
  if (!self->_frozen)
    -[NTKDateComplicationLabel _setText:](self, "_setText:", self->_currentDateText);

}

- (id)_attributedStringAccentingNumbersInString:(id)a3
{
  id v4;
  void *v5;
  UIColor *accentColor;
  void *v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v4);
    accentColor = self->_accentColor;
    if (accentColor)
    {
      v17 = *MEMORY[0x1E0DC1140];
      v18[0] = accentColor;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[NTKDateComplicationLabel accentType](self, "accentType");
      if (v8 == 1)
      {
        if (self->_dayTextRange.location != 0x7FFFFFFFFFFFFFFFLL && self->_dayTextRange.length)
          objc_msgSend(v5, "setAttributes:range:", v7);
      }
      else if (!v8 && objc_msgSend(v4, "length"))
      {
        v9 = 0;
        do
        {
          v10 = objc_msgSend(v4, "length") - v9;
          objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", v11, 0, v9, v10);
          v14 = v13;

          if (v12 == 0x7FFFFFFFFFFFFFFFLL || v14 == 0)
            break;
          objc_msgSend(v5, "setAttributes:range:", v7, v12, v14);
          v9 = v12 + v14;
        }
        while (v9 < objc_msgSend(v4, "length"));
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setFont:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_font, a3);
  v5 = a3;
  -[NTKDateComplicationLabel _setFont:](self, "_setFont:", v5);

}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
  -[NTKDateComplicationLabel _computeTextColor](self, "_computeTextColor");
  -[NTKDateComplicationLabel _updateTextColor](self, "_updateTextColor");
}

- (int64_t)numberOfLines
{
  return -[UILabel numberOfLines](self->_internalLabel, "numberOfLines");
}

- (void)setNumberOfLines:(int64_t)a3
{
  -[UILabel setNumberOfLines:](self->_internalLabel, "setNumberOfLines:", a3);
}

- (int64_t)textAlignment
{
  return -[UILabel textAlignment](self->_internalLabel, "textAlignment");
}

- (void)setTextAlignment:(int64_t)a3
{
  -[UILabel setTextAlignment:](self->_internalLabel, "setTextAlignment:", a3);
}

- (void)setShadowColor:(id)a3
{
  -[UILabel setShadowColor:](self->_internalLabel, "setShadowColor:", a3);
}

- (void)_updateTextColor
{
  -[UILabel setTextColor:](self->_internalLabel, "setTextColor:", self->_computedTextColor);
}

- (void)_computeTextColor
{
  objc_storeStrong((id *)&self->_computedTextColor, self->_textColor);
}

- (void)setAccentColor:(id)a3
{
  objc_storeStrong((id *)&self->_accentColor, a3);
  -[NTKDateComplicationLabel _applyAccentColorAttributes](self, "_applyAccentColorAttributes");
}

- (UIColor)textColor
{
  return -[UILabel textColor](self->_internalLabel, "textColor");
}

- (void)setLegibilityHidden:(BOOL)a3
{
  UILabel *internalLabel;
  double v4;
  id v5;

  self->_legibilityHidden = a3;
  if (self->_usesLegibility)
  {
    internalLabel = self->_internalLabel;
    v4 = 0.1;
    if (!a3)
      v4 = 0.6;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setShadowColor:](internalLabel, "setShadowColor:", v5);

  }
}

- (void)setUsesLegibility:(BOOL)a3
{
  UILabel *internalLabel;

  if (self->_usesLegibility != a3)
  {
    self->_usesLegibility = a3;
    if (a3)
    {
      -[NTKDateComplicationLabel setLegibilityHidden:](self, "setLegibilityHidden:", self->_legibilityHidden);
      -[UILabel setShadowOffset:](self->_internalLabel, "setShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      internalLabel = self->_internalLabel;
      -[NTKDateComplicationLabel _legibtilityShadowRadius](self, "_legibtilityShadowRadius");
      -[UILabel setShadowBlur:](internalLabel, "setShadowBlur:");
    }
    else
    {
      -[UILabel setShadowColor:](self->_internalLabel, "setShadowColor:", 0);
    }
    -[NTKDateComplicationLabel setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)_firstLineBaselineOffsetFromBoundsTop
{
  double v3;
  double v4;
  CGRect v6;

  -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_internalLabel, "_firstLineBaselineOffsetFromBoundsTop");
  v4 = v3;
  -[UILabel frame](self->_internalLabel, "frame");
  return v4 + CGRectGetMinY(v6);
}

- (double)_firstLineBaselineFrameOriginY
{
  double v3;
  double v4;
  double v5;

  -[NTKDateComplicationLabel frame](self, "frame");
  v4 = v3;
  -[NTKDateComplicationLabel _firstLineBaselineOffsetFromBoundsTop](self, "_firstLineBaselineOffsetFromBoundsTop");
  return v5 + v4;
}

- (void)_setFirstLineBaselineFrameOriginY:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[NTKDateComplicationLabel frame](self, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NTKDateComplicationLabel _firstLineBaselineOffsetFromBoundsTop](self, "_firstLineBaselineOffsetFromBoundsTop");
  -[NTKDateComplicationLabel setFrame:](self, "setFrame:", v6, a3 - v11, v8, v10);
}

- (double)_lastLineBaseline
{
  double v3;
  double v4;
  CGRect v6;

  -[UILabel _lastLineBaseline](self->_internalLabel, "_lastLineBaseline");
  v4 = v3;
  -[UILabel frame](self->_internalLabel, "frame");
  return v4 + CGRectGetMinY(v6);
}

- (double)_lastLineBaselineFrameOriginY
{
  double v3;
  double v4;
  double v5;

  -[NTKDateComplicationLabel frame](self, "frame");
  v4 = v3;
  -[NTKDateComplicationLabel _lastLineBaseline](self, "_lastLineBaseline");
  return v5 + v4;
}

- (void)_setLastLineBaselineFrameOriginY:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[NTKDateComplicationLabel frame](self, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NTKDateComplicationLabel _lastLineBaseline](self, "_lastLineBaseline");
  -[NTKDateComplicationLabel setFrame:](self, "setFrame:", v6, a3 - v11, v8, v10);
}

- (void)_setText:(id)a3
{
  id v4;

  -[NTKDateComplicationLabel _attributedStringAccentingNumbersInString:](self, "_attributedStringAccentingNumbersInString:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](self->_internalLabel, "setAttributedText:", v4);
  -[NTKDateComplicationLabel _invalidateInternalLabelSize](self, "_invalidateInternalLabelSize");

}

- (void)_applyAccentColorAttributes
{
  UILabel *internalLabel;
  void *v4;
  id v5;

  internalLabel = self->_internalLabel;
  -[UILabel text](internalLabel, "text");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKDateComplicationLabel _attributedStringAccentingNumbersInString:](self, "_attributedStringAccentingNumbersInString:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](internalLabel, "setAttributedText:", v4);

}

- (void)_setFont:(id)a3
{
  -[UILabel setFont:](self->_internalLabel, "setFont:", a3);
  -[NTKDateComplicationLabel _invalidateInternalLabelSize](self, "_invalidateInternalLabelSize");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  _QWORD v7[6];
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NTKDateComplicationLabel;
  -[NTKDateComplicationLabel setHighlighted:](&v8, sel_setHighlighted_);
  v5 = 0.2;
  v6 = 0.0;
  if (v3)
  {
    v5 = 0.0;
    v6 = 1.0;
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__NTKDateComplicationLabel_setHighlighted___block_invoke;
  v7[3] = &unk_1E6BD09B0;
  v7[4] = self;
  *(double *)&v7[5] = v6;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v7, v5);
}

uint64_t __43__NTKDateComplicationLabel_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "setAlpha:", *(double *)(a1 + 40));
}

- (void)_invalidateInternalLabelSize
{
  id v3;

  -[NSMutableDictionary removeAllObjects](self->_cachedFittingSizes, "removeAllObjects");
  -[NTKDateComplicationLabel sizeToFit](self, "sizeToFit");
  -[NTKDateComplicationLabel setNeedsLayout](self, "setNeedsLayout");
  -[NTKDateComplicationLabel displayObserver](self, "displayObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "complicationDisplayNeedsResize:", self);

}

- (BOOL)shouldCancelTouchesInScrollview
{
  return 1;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double top;
  double left;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  -[NTKDateComplicationLabel bounds](self, "bounds", a4);
  top = self->_touchEdgeInsets.top;
  left = self->_touchEdgeInsets.left;
  v15.origin.x = v9 + left;
  v15.origin.y = v10 + top;
  v15.size.width = v11 - (left + self->_touchEdgeInsets.right);
  v15.size.height = v12 - (top + self->_touchEdgeInsets.bottom);
  v14.x = x;
  v14.y = y;
  return CGRectContainsPoint(v15, v14);
}

- (double)_cornerRadius
{
  double result;

  result = 2.0;
  if (!self->_sizeStyle)
    return 6.0;
  return result;
}

- (CGSize)_highlightInset
{
  double v2;
  double v3;
  CGSize result;

  v2 = 6.5;
  if (self->_sizeStyle)
    v2 = 2.0;
  v3 = -1.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (double)_legibtilityShadowRadius
{
  double result;

  result = 5.0;
  if (!self->_sizeStyle)
    return 10.0;
  return result;
}

- (CDComplicationDisplayObserver)displayObserver
{
  return (CDComplicationDisplayObserver *)objc_loadWeakRetained((id *)&self->displayObserver);
}

- (void)setDisplayObserver:(id)a3
{
  objc_storeWeak((id *)&self->displayObserver, a3);
}

- (unint64_t)textLayoutStyle
{
  return self->textLayoutStyle;
}

- (void)setTextLayoutStyle:(unint64_t)a3
{
  self->textLayoutStyle = a3;
}

- (int64_t)sizeStyle
{
  return self->_sizeStyle;
}

- (int64_t)accentType
{
  return self->_accentType;
}

- (CLKDevice)device
{
  return self->_device;
}

- (CLKFont)font
{
  return self->_font;
}

- (UIColor)accentColor
{
  return self->_accentColor;
}

- (BOOL)usesLegibility
{
  return self->_usesLegibility;
}

- (BOOL)legibilityHidden
{
  return self->_legibilityHidden;
}

- (unint64_t)overrideDateStyle
{
  return self->_overrideDateStyle;
}

- (void)setOverrideDateStyle:(unint64_t)a3
{
  self->_overrideDateStyle = a3;
}

- (UIEdgeInsets)touchEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_touchEdgeInsets.top;
  left = self->_touchEdgeInsets.left;
  bottom = self->_touchEdgeInsets.bottom;
  right = self->_touchEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTouchEdgeInsets:(UIEdgeInsets)a3
{
  self->_touchEdgeInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accentColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->displayObserver);
  objc_storeStrong((id *)&self->_computedTextColor, 0);
  objc_storeStrong((id *)&self->_cachedFittingSizes, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_internalLabel, 0);
  objc_storeStrong((id *)&self->_currentDateText, 0);
}

@end
