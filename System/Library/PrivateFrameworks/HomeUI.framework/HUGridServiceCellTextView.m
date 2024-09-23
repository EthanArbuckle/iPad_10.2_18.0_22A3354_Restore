@implementation HUGridServiceCellTextView

- (HUGridServiceCellTextView)initWithFrame:(CGRect)a3
{
  HUGridServiceCellTextView *v3;
  HUGridServiceCellTextView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUGridServiceCellTextView;
  v3 = -[HUGridServiceCellTextView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[HUGridServiceCellTextView setOpaque:](v3, "setOpaque:", 0);
    -[HUGridServiceCellTextView setContentMode:](v4, "setContentMode:", 3);
    v4->_descriptionTextColorDimmingFactor = 1.0;
    v4->_shouldShowRoomName = 1;
  }
  return v4;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUGridServiceCellTextView;
  -[HUGridServiceCellTextView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[HUGridServiceCellTextView setNeedsDisplay](self, "setNeedsDisplay");
}

+ (double)minimumDescriptionScaleFactor
{
  return 0.8;
}

- (void)setServiceNameComponents:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_serviceNameComponents) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_serviceNameComponents, a3);
    -[HUGridServiceCellTextView setNeedsLayout](self, "setNeedsLayout");
    -[HUGridServiceCellTextView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setDescriptionText:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_descriptionText) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_descriptionText, a3);
    -[HUGridServiceCellTextView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setFont:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_font) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_font, a3);
    -[HUGridServiceCellTextView setNeedsDisplay](self, "setNeedsDisplay");
    -[HUGridServiceCellTextView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }

}

- (void)setTextColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_textColor) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    -[HUGridServiceCellTextView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setTextColorFollowsTintColor:(BOOL)a3
{
  if (self->_textColorFollowsTintColor != a3)
  {
    self->_textColorFollowsTintColor = a3;
    -[HUGridServiceCellTextView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (double)lineHeight
{
  double result;
  void *v3;
  double v4;
  double v5;

  result = self->_lineHeight;
  if (fabs(result) < 2.22044605e-16)
  {
    -[HUGridServiceCellTextView font](self, "font");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lineHeight");
    v5 = v4;

    return v5;
  }
  return result;
}

- (void)setLineHeight:(double)a3
{
  if (self->_lineHeight != a3)
  {
    self->_lineHeight = a3;
    -[HUGridServiceCellTextView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[HUGridServiceCellTextView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setMode:(unint64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    -[HUGridServiceCellTextView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShouldShowRoomName:(BOOL)a3
{
  if (self->_shouldShowRoomName != a3)
  {
    self->_shouldShowRoomName = a3;
    -[HUGridServiceCellTextView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)topToFirstBaselineDistance
{
  void *v2;
  double v3;
  double v4;

  -[HUGridServiceCellTextView font](self, "font");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ascender");
  v4 = v3;

  return v4;
}

- (double)lastBaselineToBottomDistance
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  -[HUGridServiceCellTextView lineHeight](self, "lineHeight");
  v4 = v3;
  -[HUGridServiceCellTextView font](self, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ascender");
  v7 = v4 - v6;

  return v7;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUGridServiceCellTextView;
  -[HUGridServiceCellTextView layoutSubviews](&v3, sel_layoutSubviews);
  -[HUGridServiceCellTextView _updateMode](self, "_updateMode");
}

- (void)_updateMode
{
  id v3;
  void *v4;
  const __CTFramesetter *v5;
  const __CFAttributedString *v6;
  const __CTFramesetter *v7;
  CGFloat v8;
  CGSize v9;
  CGFloat v10;
  CGFloat width;
  CGSize v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFAttributedString *attrString;
  CFRange v22;
  CFRange v23;
  CGSize v24;
  CGSize v25;

  v3 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[HUGridServiceCellTextView _commonTextAttributesWithLineBreakMode:](self, "_commonTextAttributesWithLineBreakMode:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  attrString = (const __CFAttributedString *)objc_msgSend(v3, "initWithString:attributes:", CFSTR("X"), v4);

  v5 = CTFramesetterCreateWithAttributedString(attrString);
  -[HUGridServiceCellTextView _combinedAttributedString](self, "_combinedAttributedString");
  v6 = (const __CFAttributedString *)objc_claimAutoreleasedReturnValue();
  v7 = CTFramesetterCreateWithAttributedString(v6);

  -[HUGridServiceCellTextView frame](self, "frame");
  v24.width = v8;
  v22.location = 0;
  v22.length = 0;
  v24.height = 1.79769313e308;
  v9 = CTFramesetterSuggestFrameSizeWithConstraints(v5, v22, 0, v24, 0);
  -[HUGridServiceCellTextView frame](self, "frame", v9.width);
  v25.width = v10;
  v23.location = 0;
  v23.length = 0;
  v25.height = 1.79769313e308;
  v12 = CTFramesetterSuggestFrameSizeWithConstraints(v7, v23, 0, v25, 0);
  width = v12.width;
  if (v5)
    CFRelease(v5);
  if (v7)
    CFRelease(v7);
  -[HUGridServiceCellTextView serviceNameComponents](self, "serviceNameComponents", width);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "serviceName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HUGridServiceCellTextView shouldShowRoomName](self, "shouldShowRoomName"))
  {
    -[HUGridServiceCellTextView serviceNameComponents](self, "serviceNameComponents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "roomName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  if (!objc_msgSend(v14, "length") || (v17 = objc_msgSend(v16, "length"), v18 = 1, !v17) && v12.height > v9.height)
  {
    v19 = objc_msgSend(v16, "length");
    if (v12.height <= v9.height && v19 == 0)
      v18 = 0;
    else
      v18 = 2;
  }
  -[HUGridServiceCellTextView setMode:](self, "setMode:", v18);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  v2 = *MEMORY[0x1E0CEBDE0];
  -[HUGridServiceCellTextView lineHeight](self, "lineHeight");
  v4 = v3 * 3.0;
  v5 = v2;
  result.height = v4;
  result.width = v5;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  CGSize result;

  width = a3.width;
  -[HUGridServiceCellTextView intrinsicContentSize](self, "intrinsicContentSize", a3.width, a3.height);
  v5 = width;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  unint64_t v4;
  void *v5;

  v4 = -[HUGridServiceCellTextView mode](self, "mode", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4 == 2)
  {
    -[HUGridServiceCellTextView _drawCombinedLabel](self, "_drawCombinedLabel");
  }
  else if (v4 == 1)
  {
    -[HUGridServiceCellTextView _drawSeperateLabels](self, "_drawSeperateLabels");
  }
  -[HUGridServiceCellTextView descriptionText](self, "descriptionText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[HUGridServiceCellTextView _drawDescriptionLabel](self, "_drawDescriptionLabel");
}

- (id)_commonTextAttributesWithLineBreakMode:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = objc_alloc_init(MEMORY[0x1E0CEA230]);
  -[HUGridServiceCellTextView lineHeight](self, "lineHeight");
  objc_msgSend(v5, "setMinimumLineHeight:");
  -[HUGridServiceCellTextView lineHeight](self, "lineHeight");
  objc_msgSend(v5, "setMaximumLineHeight:");
  objc_msgSend(v5, "setLineBreakMode:", a3);
  objc_msgSend(v5, "setAllowsDefaultTighteningForTruncation:", objc_msgSend(MEMORY[0x1E0D313C8], "isHomeControlService") ^ 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridServiceCellTextView font](self, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_safeSetObject:forKey:", v7, *MEMORY[0x1E0CEA098]);

  -[HUGridServiceCellTextView _effectiveTextColor](self, "_effectiveTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_safeSetObject:forKey:", v8, *MEMORY[0x1E0CEA0A0]);

  objc_msgSend(v6, "na_safeSetObject:forKey:", v5, *MEMORY[0x1E0CEA0D0]);
  return v6;
}

- (id)_combinedAttributedString
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HUGridServiceCellTextView _commonTextAttributesWithLineBreakMode:](self, "_commonTextAttributesWithLineBreakMode:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HUGridServiceCellTextView shouldShowRoomName](self, "shouldShowRoomName");
  -[HUGridServiceCellTextView serviceNameComponents](self, "serviceNameComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "composedString");
  else
    objc_msgSend(v5, "serviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringWithAttributes:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_drawCombinedLabel
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  v10 = objc_alloc_init(MEMORY[0x1E0CEA248]);
  objc_msgSend(v10, "setMaximumNumberOfLines:", 2);
  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[HUGridServiceCellTextView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  -[HUGridServiceCellTextView _combinedAttributedString](self, "_combinedAttributedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "drawWithRect:options:context:", 33, v10, v3, v4, v6, v8);

}

- (void)_drawSeperateLabels
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  id v18;

  -[HUGridServiceCellTextView _commonTextAttributesWithLineBreakMode:](self, "_commonTextAttributesWithLineBreakMode:", 4);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA098]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ascender");
  v5 = v4;

  -[HUGridServiceCellTextView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v10 = objc_alloc_init(MEMORY[0x1E0CEA248]);
  if (-[HUGridServiceCellTextView shouldShowRoomName](self, "shouldShowRoomName"))
  {
    -[HUGridServiceCellTextView serviceNameComponents](self, "serviceNameComponents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "roomName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithAttributes:", v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "drawWithRect:options:context:", 0, v10, 0.0, v5, v7, v9);
  }
  -[HUGridServiceCellTextView serviceNameComponents](self, "serviceNameComponents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "serviceName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "stringWithAttributes:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridServiceCellTextView lineHeight](self, "lineHeight");
  objc_msgSend(v16, "drawWithRect:options:context:", 0, v10, 0.0, v5 + v17, v7, v9);

}

- (void)_drawDescriptionLabel
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;

  -[HUGridServiceCellTextView _commonTextAttributesWithLineBreakMode:](self, "_commonTextAttributesWithLineBreakMode:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HUGridServiceCellTextView descriptionTextColorDimmingFactor](self, "descriptionTextColorDimmingFactor");
  if (v5 < 1.0)
  {
    -[HUGridServiceCellTextView _effectiveTextColor](self, "_effectiveTextColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 1.0;
    objc_msgSend(v6, "getWhite:alpha:", 0, &v20);
    -[HUGridServiceCellTextView descriptionTextColorDimmingFactor](self, "descriptionTextColorDimmingFactor");
    v20 = v7 * v20;
    objc_msgSend(v6, "colorWithAlphaComponent:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CEA0A0]);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA098]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ascender");
  v11 = v10;

  -[HUGridServiceCellTextView descriptionText](self, "descriptionText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithAttributes:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUGridServiceCellTextView bounds](self, "bounds");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v13, "hf_scaledAttributedStringWithBoundingSize:minimumScaleFactor:maximumNumberOfLines:", 1, v14, v16, 0.8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUGridServiceCellTextView lineHeight](self, "lineHeight");
  objc_msgSend(v18, "drawWithRect:options:context:", 0, 0, 0.0, v11 + v19 * 2.0, v15, v17);

}

- (id)_effectiveTextColor
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HUGridServiceCellTextView textColorFollowsTintColor](self, "textColorFollowsTintColor"))
  {
    -[HUGridServiceCellTextView tintColor](self, "tintColor");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v4;

    v3 = v6;
    return v3;
  }
  -[HUGridServiceCellTextView textColor](self, "textColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HUGridServiceCellTextView textColor](self, "textColor");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return v3;
}

- (HFServiceNameComponents)serviceNameComponents
{
  return self->_serviceNameComponents;
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (BOOL)textColorFollowsTintColor
{
  return self->_textColorFollowsTintColor;
}

- (double)descriptionTextColorDimmingFactor
{
  return self->_descriptionTextColorDimmingFactor;
}

- (void)setDescriptionTextColorDimmingFactor:(double)a3
{
  self->_descriptionTextColorDimmingFactor = a3;
}

- (BOOL)shouldShowRoomName
{
  return self->_shouldShowRoomName;
}

- (UIFont)font
{
  return self->_font;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_serviceNameComponents, 0);
}

@end
