@implementation LPQuoteView

- (LPQuoteView)initWithHost:(id)a3
{

  return 0;
}

- (LPQuoteView)initWithHost:(id)a3 text:(id)a4 style:(id)a5
{
  id v8;
  id v9;
  id v10;
  LPQuoteView *v11;
  LPQuoteView *v12;
  unint64_t v13;
  BOOL v14;
  void *v15;
  id *p_attributedString;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  LPQuotedTextViewStyle *style;
  LPQuoteView *v22;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)LPQuoteView;
  v11 = -[LPComponentView initWithHost:](&v24, sel_initWithHost_, v8);
  v12 = v11;
  if (v11)
  {
    if (objc_msgSend(v10, "maximumCharacters"))
    {
      v13 = objc_msgSend(v9, "length");
      v14 = v13 >= objc_msgSend(v10, "maximumCharacters");
    }
    else
    {
      v14 = 0;
    }
    v11->_didLimitNumberOfCharacters = v14;
    if (objc_msgSend(v10, "maximumCharacters"))
      truncatedAttributedStringAtLength(v9, objc_msgSend(v10, "maximumCharacters"));
    else
      truncatedAttributedStringAtMaximumMetadataLength(v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    p_attributedString = (id *)&v11->_attributedString;
    objc_storeStrong(p_attributedString, v15);

    if (v12->_didLimitNumberOfCharacters)
    {
      v17 = (void *)objc_msgSend(*p_attributedString, "mutableCopy");
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("…"));
      objc_msgSend(v17, "appendAttributedString:", v18);

      v19 = *p_attributedString;
      *p_attributedString = v17;

    }
    objc_msgSend(v10, "adjustedForString:", *p_attributedString);
    v20 = objc_claimAutoreleasedReturnValue();
    style = v12->_style;
    v12->_style = (LPQuotedTextViewStyle *)v20;

    v22 = v12;
  }

  return v12;
}

- (void)_buildSubviewsIfNeeded
{
  UITextView *v3;
  UITextView *textView;
  UITextView *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UIVisualEffectView *v18;
  UIVisualEffectView *effectView;
  void *v20;
  UITextView *v21;
  UITextView *coloredGlyphsView;
  void *v23;
  void *v24;
  UIImageView *v25;
  UIImageView *quoteIndicatorView;
  void *v27;
  void *v28;
  UIImageView *v29;
  LPTextView *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  LPTextView *v35;
  LPTextView *characterLimitIndicatorView;
  double v37;
  double v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;

  if (!self->_textView)
  {
    -[LPQuoteView _createTextView](self, "_createTextView");
    v3 = (UITextView *)objc_claimAutoreleasedReturnValue();
    textView = self->_textView;
    self->_textView = v3;

    v5 = self->_textView;
    -[LPQuoteView effectiveAttributedString](self, "effectiveAttributedString");
    v39 = (id)objc_claimAutoreleasedReturnValue();
    -[UITextView _lp_setAttributedString:](v5, "_lp_setAttributedString:");

    -[LPTextViewStyle compositingFilter](self->_style, "compositingFilter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[LPTextViewStyle compositingFilter](self->_style, "compositingFilter");
      v40 = (id)objc_claimAutoreleasedReturnValue();
      -[UITextView layer](self->_textView, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCompositingFilter:", v40);

    }
    if (+[LPSettings showDebugIndicators](LPSettings, "showDebugIndicators"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
      v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v8 = objc_msgSend(v41, "CGColor");
      -[UITextView layer](self->_textView, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBorderColor:", v8);

      -[UITextView layer](self->_textView, "layer");
      v42 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setBorderWidth:", 0.5);

    }
    -[LPComponentView host](self, "host");
    v43 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v43, "allowsVibrancyForComponentView:", self);

    if (v10)
    {
      -[LPTextViewStyle color](self->_style, "color");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      vibrancyEffectStyleForColor(v11);
      v44 = (id)objc_claimAutoreleasedReturnValue();

      if (v44)
      {
        v12 = objc_alloc(MEMORY[0x1E0DC3F58]);
        v13 = (void *)MEMORY[0x1E0DC3F08];
        v14 = (void *)MEMORY[0x1E0DC3510];
        -[LPComponentView host](self, "host");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "effectWithStyle:", objc_msgSend(v15, "blurEffectStyleBehindComponentView:", self));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "effectForBlurEffect:style:", v16, objc_msgSend(v44, "integerValue"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (UIVisualEffectView *)objc_msgSend(v12, "initWithEffect:", v17);
        effectView = self->_effectView;
        self->_effectView = v18;

        -[UIVisualEffectView contentView](self->_effectView, "contentView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addSubview:", self->_textView);

        -[LPQuoteView addSubview:](self, "addSubview:", self->_effectView);
        if (objc_msgSend(v44, "integerValue"))
        {
          -[LPQuoteView _createTextView](self, "_createTextView");
          v21 = (UITextView *)objc_claimAutoreleasedReturnValue();
          coloredGlyphsView = self->_coloredGlyphsView;
          self->_coloredGlyphsView = v21;

          -[LPQuoteView effectiveAttributedString](self, "effectiveAttributedString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[LPTextView attributedStringHidingNonColoredRanges:](LPTextView, "attributedStringHidingNonColoredRanges:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITextView setAttributedText:](self->_coloredGlyphsView, "setAttributedText:", v24);

          -[LPQuoteView addSubview:](self, "addSubview:", self->_coloredGlyphsView);
        }
      }

    }
    if (!self->_effectView)
      -[LPQuoteView addSubview:](self, "addSubview:", self->_textView);
    if (-[LPQuotedTextViewStyle showQuoteIndicator](self->_style, "showQuoteIndicator"))
    {
      v25 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      quoteIndicatorView = self->_quoteIndicatorView;
      self->_quoteIndicatorView = v25;

      if (-[LPQuoteView _lp_isLTR](self, "_lp_isLTR"))
        +[LPResources openQuote](LPResources, "openQuote");
      else
        +[LPResources closeQuote](LPResources, "closeQuote");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "platformImage");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](self->_quoteIndicatorView, "setImage:", v28);

      v29 = self->_quoteIndicatorView;
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v45 = (id)objc_claimAutoreleasedReturnValue();
      -[UIImageView _lp_setTintColor:](v29, "_lp_setTintColor:");

      -[LPQuoteView addSubview:](self, "addSubview:", self->_quoteIndicatorView);
    }
    if (-[LPQuotedTextViewStyle showCharacterLimitIndicator](self->_style, "showCharacterLimitIndicator"))
    {
      if (self->_didLimitNumberOfCharacters)
      {
        v30 = [LPTextView alloc];
        -[LPComponentView host](self, "host");
        v46 = (id)objc_claimAutoreleasedReturnValue();
        v31 = objc_alloc(MEMORY[0x1E0CB3498]);
        LPLocalizedString(CFSTR("Viewing Partial Selection"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend(v31, "initWithString:", v32);
        -[LPQuotedTextViewStyle characterLimitIndicatorStyle](self->_style, "characterLimitIndicatorStyle");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = -[LPTextView initWithHost:text:style:](v30, "initWithHost:text:style:", v46, v33, v34);
        characterLimitIndicatorView = self->_characterLimitIndicatorView;
        self->_characterLimitIndicatorView = v35;

        -[LPQuoteView addSubview:](self, "addSubview:", self->_characterLimitIndicatorView);
      }
    }
    -[LPTextViewStyle font](self->_style, "font");
    v47 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "ascender");
    self->_ascender = v37;

    -[LPTextViewStyle font](self->_style, "font");
    v48 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "descender");
    self->_descender = v38;

  }
}

- (BOOL)_lp_isLTR
{
  LPQuoteView *v2;
  LPQuoteView *v3;
  void *v4;
  uint64_t v5;
  unsigned __int8 v6;
  uint64_t v7;
  objc_super v9;

  v2 = self;
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      v5 = objc_msgSend(v4, "semanticContentAttribute");
      v6 = v5 == 3;
      if (v5 == 3 || objc_msgSend(v4, "semanticContentAttribute") == 4)
        goto LABEL_10;
      objc_msgSend(v4, "superview");
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }
    while (v7);
  }
  else
  {
    v4 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)LPQuoteView;
  v6 = -[UIView _lp_isLTR](&v9, sel__lp_isLTR);
LABEL_10:

  return v6;
}

- (id)effectiveAttributedString
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  NSAttributedString *attributedString;
  LPQuotedTextViewStyle *style;
  NSRegularExpression *emphasizedTextExpression;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  _BOOL4 v18;

  -[LPComponentView host](self, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsVibrancyForComponentView:", self);

  if (v4)
  {
    -[LPTextViewStyle color](self->_style, "color");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    vibrancyEffectStyleForColor(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v6 != 0;

  }
  else
  {
    v18 = 0;
  }
  v7 = -[UIView _lp_prefersDarkInterface](self, "_lp_prefersDarkInterface");
  attributedString = self->_attributedString;
  style = self->_style;
  emphasizedTextExpression = self->_emphasizedTextExpression;
  -[UIView _lp_tintColor](self, "_lp_tintColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[LPQuoteView _lp_isLTR](self, "_lp_isLTR");
  -[UITextView font](self->_textView, "font");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    -[LPTextViewStyle font](self->_style, "font");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  LOBYTE(v17) = v12;
  +[LPTextView attributedString:resolvedAgainstStyle:withEmphasizedTextExpression:tintColor:lineBreakMode:usesVibrancy:forLTR:withFont:userInterfaceStyle:](LPTextView, "attributedString:resolvedAgainstStyle:withEmphasizedTextExpression:tintColor:lineBreakMode:usesVibrancy:forLTR:withFont:userInterfaceStyle:", attributedString, style, emphasizedTextExpression, v11, 0, v18, v17, v14, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)

  return v15;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
  }
}

- (LPQuotedTextViewStyle)style
{
  return self->_style;
}

- (double)firstLineLeading
{
  void *v2;
  double v3;
  double v4;

  -[LPTextViewStyle firstLineLeading](self->_style, "firstLineLeading");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v4 = v3;

  return v4;
}

- (double)lastLineDescent
{
  void *v2;
  double v3;
  double v4;

  -[LPTextViewStyle lastLineDescent](self->_style, "lastLineDescent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v4 = v3;

  return v4;
}

- (double)ascender
{
  return self->_ascender;
}

- (double)descender
{
  return self->_descender;
}

- (int64_t)computedNumberOfLinesWithFont:(id)a3 forSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  int64_t v21;
  unint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t v27;
  uint64_t v28;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  if (v7)
  {
    -[UITextView font](self->_textView, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPQuoteView setFont:](self, "setFont:", v7);
  }
  else
  {
    v8 = 0;
  }
  -[LPQuoteView frame](self, "frame");
  if (width == v10 && height == v9)
  {
    v13 = *MEMORY[0x1E0C9D648];
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    -[UITextView frame](self->_textView, "frame");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    -[UITextView setFrame:](self->_textView, "setFrame:");
  }
  -[UITextView layoutManager](self->_textView, "layoutManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = objc_msgSend(v20, "numberOfGlyphs");
  if (v22)
  {
    v23 = 0;
    do
    {
      v27 = 0;
      v28 = 0;
      objc_msgSend(v20, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v23, &v27);
      v23 = v28 + v27;
      ++v21;
    }
    while (v28 + v27 < v22);
  }
  if (v7)
    -[LPQuoteView setFont:](self, "setFont:", v8);
  -[LPQuoteView frame](self, "frame");
  if (width != v25 || height != v24)
    -[UITextView setFrame:](self->_textView, "setFrame:", v13, v15, v17, v19);

  return v21;
}

- (int64_t)computedNumberOfLines
{
  double v3;
  double v4;

  -[LPQuoteView frame](self, "frame");
  return -[LPQuoteView computedNumberOfLinesWithFont:forSize:](self, "computedNumberOfLinesWithFont:forSize:", 0, v3, v4);
}

- (void)setOverrideMaximumNumberOfLines:(int64_t)a3
{
  int64_t v4;
  int64_t v5;
  id v6;
  id v7;

  self->_overrideMaximumNumberOfLines = a3;
  v4 = -[LPQuoteView effectiveMaximumNumberOfLines](self, "effectiveMaximumNumberOfLines");
  -[UITextView textContainer](self->_textView, "textContainer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMaximumNumberOfLines:", v4);

  v5 = -[LPQuoteView effectiveMaximumNumberOfLines](self, "effectiveMaximumNumberOfLines");
  -[UITextView textContainer](self->_coloredGlyphsView, "textContainer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMaximumNumberOfLines:", v5);

}

- (UIEdgeInsets)effectiveInsetsWithoutQuoteIndicator
{
  void *v3;
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
  UIEdgeInsets result;

  -[LPTextViewStyle padding](self->_style, "padding");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asInsetsForLTR:", -[LPQuoteView _lp_isLTR](self, "_lp_isLTR"));
  v5 = v4 + self->_contentInset.top;
  v7 = v6 + self->_contentInset.left;
  v9 = v8 + self->_contentInset.bottom;
  v11 = v10 + self->_contentInset.right;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (UIEdgeInsets)effectiveInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  -[LPQuoteView effectiveInsetsWithoutQuoteIndicator](self, "effectiveInsetsWithoutQuoteIndicator");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[LPQuotedTextViewStyle showQuoteIndicator](self->_style, "showQuoteIndicator"))
  {
    -[UIImageView image](self->_quoteIndicatorView, "image");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "size");
    v4 = v4 + v12 + 12.0;
    v6 = v6 + 0.0;
    v8 = v8 + 0.0;
    v10 = v10 + 0.0;

  }
  v13 = v4;
  v14 = v6;
  v15 = v8;
  v16 = v10;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (int64_t)effectiveMaximumNumberOfLines
{
  int64_t result;
  void *v4;
  int v5;
  LPQuotedTextViewStyle *style;

  result = self->_overrideMaximumNumberOfLines;
  if (!result)
  {
    -[LPComponentView host](self, "host");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "linkHasMediaForComponentView:", self);

    style = self->_style;
    if (v5)
      LODWORD(result) = -[LPTextViewStyle maximumLinesWithMedia](style, "maximumLinesWithMedia");
    else
      LODWORD(result) = -[LPTextViewStyle maximumLines](style, "maximumLines");
    return result;
  }
  return result;
}

- (void)layoutComponentView
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
  double v16;
  double v17;
  double v18;
  LPTextView *characterLimitIndicatorView;
  double v20;
  double v21;
  UIVisualEffectView *effectView;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double MaxX;
  void *v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGRect v45;
  CGRect v46;

  -[LPQuoteView _buildSubviewsIfNeeded](self, "_buildSubviewsIfNeeded");
  -[LPQuoteView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[LPQuoteView effectiveInsets](self, "effectiveInsets");
  v12 = v4 + v11;
  v14 = v6 + v13;
  v16 = v8 - (v11 + v15);
  v18 = v10 - (v13 + v17);
  characterLimitIndicatorView = self->_characterLimitIndicatorView;
  if (characterLimitIndicatorView)
  {
    -[LPTextView sizeThatFits:](characterLimitIndicatorView, "sizeThatFits:", v16, v18);
    v21 = v20;
    v18 = v18 - v20;
    v45.origin.x = v12;
    v45.origin.y = v14;
    v45.size.width = v16;
    v45.size.height = v18;
    -[LPTextView setFrame:](self->_characterLimitIndicatorView, "setFrame:", v12, CGRectGetMaxY(v45), v16, v21);
  }
  effectView = self->_effectView;
  if (effectView)
  {
    -[UIVisualEffectView setFrame:](effectView, "setFrame:", v12, v14, v16, v18);
    -[UITextView setFrame:](self->_coloredGlyphsView, "setFrame:", v12, v14, v16, v18);
    v23 = 0.0;
    v24 = 0.0;
  }
  else
  {
    v23 = v12;
    v24 = v14;
  }
  -[UITextView setFrame:](self->_textView, "setFrame:", v23, v24, v16, v18);
  if (-[LPQuotedTextViewStyle showQuoteIndicator](self->_style, "showQuoteIndicator"))
  {
    -[LPQuoteView bounds](self, "bounds");
    v26 = v25;
    v28 = v27;
    -[LPQuoteView effectiveInsetsWithoutQuoteIndicator](self, "effectiveInsetsWithoutQuoteIndicator");
    v30 = v29;
    v32 = v31;
    if (-[LPQuoteView _lp_isLTR](self, "_lp_isLTR"))
    {
      v33 = v26 + v32;
    }
    else
    {
      v46.origin.x = v12;
      v46.origin.y = v14;
      v46.size.width = v16;
      v46.size.height = v18;
      MaxX = CGRectGetMaxX(v46);
      -[UIImageView image](self->_quoteIndicatorView, "image");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "size");
      v33 = MaxX - v36;

    }
    -[UIImageView image](self->_quoteIndicatorView, "image");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "size");
    v39 = v38;

    -[UIImageView image](self->_quoteIndicatorView, "image");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "size");
    v42 = v41;

    -[UIImageView setFrame:](self->_quoteIndicatorView, "setFrame:", v33, v28 + v30, v39, v42);
  }
  -[LPQuoteView updateExclusionRects](self, "updateExclusionRects");
  -[UITextView bounds](self->_textView, "bounds");
  -[LPQuoteView updateEffectiveFontForSize:](self, "updateEffectiveFontForSize:", v43, v44);
}

- (void)updateExclusionRects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[LPComponentView host](self, "host");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutExclusionsForView:", self->_textView);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView textContainer](self->_textView, "textContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExclusionPaths:", v3);

  if (self->_coloredGlyphsView)
  {
    -[LPComponentView host](self, "host");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutExclusionsForView:", self->_coloredGlyphsView);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView textContainer](self->_coloredGlyphsView, "textContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setExclusionPaths:", v5);

  }
}

- (void)setFont:(id)a3
{
  UITextView *textView;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  textView = self->_textView;
  if (textView)
  {
    -[UITextView font](textView, "font");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      -[UITextView setFont:](self->_textView, "setFont:", v8);
      -[LPQuoteView effectiveAttributedString](self, "effectiveAttributedString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPQuoteView applyAttributedString:](self, "applyAttributedString:", v7);

    }
  }

}

- (void)updateEffectiveFontForSize:(CGSize)a3
{
  double width;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  LPQuotedTextViewStyle *style;
  id v10;

  width = a3.width;
  v5 = -[LPQuotedTextViewStyle maximumLinesToConsiderShort](self->_style, "maximumLinesToConsiderShort", a3.width, a3.height);
  -[LPTextViewStyle font](self->_style, "font");
  v6 = objc_claimAutoreleasedReturnValue();
  v10 = (id)v6;
  if (v5)
  {
    v7 = -[LPQuoteView computedNumberOfLinesWithFont:forSize:](self, "computedNumberOfLinesWithFont:forSize:", v6, width, 10000.0);
    v8 = -[LPQuotedTextViewStyle maximumLinesToConsiderShort](self->_style, "maximumLinesToConsiderShort");

    style = self->_style;
    if (v7 <= v8)
      -[LPTextViewStyle font](style, "font");
    else
      -[LPQuotedTextViewStyle longPullQuoteFont](style, "longPullQuoteFont");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[LPQuoteView setFont:](self, "setFont:", v10);
  }
  else
  {
    -[LPQuoteView setFont:](self, "setFont:", v6);
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
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
  LPTextView *characterLimitIndicatorView;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[LPQuoteView _buildSubviewsIfNeeded](self, "_buildSubviewsIfNeeded");
  -[LPQuoteView effectiveInsets](self, "effectiveInsets");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = width - (v8 + v12);
  v15 = height - (v6 + v10);
  characterLimitIndicatorView = self->_characterLimitIndicatorView;
  if (characterLimitIndicatorView)
  {
    -[LPTextView sizeThatFits:](characterLimitIndicatorView, "sizeThatFits:", v14, v15);
    v18 = v17;
    v15 = v15 - v17;
  }
  else
  {
    v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  -[UITextView font](self->_textView, "font");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPQuoteView updateEffectiveFontForSize:](self, "updateEffectiveFontForSize:", v14, v15);
  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", v14, v15);
  v21 = v20;
  v23 = v22;
  -[LPQuoteView setFont:](self, "setFont:", v19);

  v24 = ceil(v21) - (-v13 - v9);
  v25 = ceil(v18 + v23) - (-v11 - v7);
  result.height = v25;
  result.width = v24;
  return result;
}

- (void)setEmphasizedTextExpression:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_emphasizedTextExpression, a3);
  if (self->_textView)
  {
    -[LPQuoteView effectiveAttributedString](self, "effectiveAttributedString");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[LPQuoteView applyAttributedString:](self, "applyAttributedString:");

  }
}

- (void)tintColorDidChange
{
  id v3;

  if (self->_textView)
  {
    -[LPQuoteView effectiveAttributedString](self, "effectiveAttributedString");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[LPQuoteView applyAttributedString:](self, "applyAttributedString:");

  }
}

- (id)_createTextView
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0DC3E50], "_lp_createInertTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEditable:", 0);
  objc_msgSend(v3, "setSelectable:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setScrollEnabled:", 0);
  objc_msgSend(v3, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v3, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v3, "setBounces:", 0);
  v5 = -[LPQuoteView effectiveMaximumNumberOfLines](self, "effectiveMaximumNumberOfLines");
  objc_msgSend(v3, "textContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMaximumNumberOfLines:", v5);

  objc_msgSend(v3, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  objc_msgSend(v3, "textContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHeightTracksTextView:", 1);

  objc_msgSend(v3, "textContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLineFragmentPadding:", 0.0);

  objc_msgSend(v3, "textContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLineBreakMode:", 4);

  return v3;
}

- (void)applyAttributedString:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[UITextView _lp_setAttributedString:](self->_textView, "_lp_setAttributedString:");
  if (self->_coloredGlyphsView)
  {
    +[LPTextView attributedStringHidingNonColoredRanges:](LPTextView, "attributedStringHidingNonColoredRanges:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setAttributedText:](self->_coloredGlyphsView, "setAttributedText:", v4);

  }
}

- (id)firstBaselineAnchor
{
  -[LPQuoteView _buildSubviewsIfNeeded](self, "_buildSubviewsIfNeeded");
  return (id)-[UITextView firstBaselineAnchor](self->_textView, "firstBaselineAnchor");
}

- (id)lastBaselineAnchor
{
  -[LPQuoteView _buildSubviewsIfNeeded](self, "_buildSubviewsIfNeeded");
  return (id)-[UITextView lastBaselineAnchor](self->_textView, "lastBaselineAnchor");
}

- (int64_t)overrideMaximumNumberOfLines
{
  return self->_overrideMaximumNumberOfLines;
}

- (NSRegularExpression)emphasizedTextExpression
{
  return self->_emphasizedTextExpression;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emphasizedTextExpression, 0);
  objc_storeStrong((id *)&self->_coloredGlyphsView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_quoteIndicatorView, 0);
  objc_storeStrong((id *)&self->_characterLimitIndicatorView, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
