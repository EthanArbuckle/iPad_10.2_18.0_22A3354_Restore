@implementation LPCollaborationFooterStyle

- (LPCollaborationFooterStyle)initWithPlatform:(int64_t)a3 sizeClass:(unint64_t)a4 fontScalingFactor:(double)a5
{
  LPCollaborationFooterStyle *v8;
  LPPadding *v9;
  LPPadding *margin;
  LPPointUnit *v11;
  LPPadding *v12;
  LPPadding *separatorMargin;
  void *v14;
  LPPadding *v15;
  LPPadding *padding;
  LPPointUnit *v17;
  LPPointUnit *indicatorSpacing;
  LPTextViewStyle *v19;
  LPTextViewStyle *options;
  uint64_t v21;
  void **v22;
  void *v23;
  void *v24;
  LPTextViewStyle *v25;
  LPTextViewStyle *handle;
  uint64_t v27;
  void **v28;
  void *v29;
  void *v30;
  LPCollaborationFooterStyle *v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)LPCollaborationFooterStyle;
  v8 = -[LPCollaborationFooterStyle init](&v33, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(LPPadding);
    margin = v8->_margin;
    v8->_margin = v9;

    v11 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 16.0);
    -[LPPadding setBottom:](v8->_margin, "setBottom:", v11);

    v12 = objc_alloc_init(LPPadding);
    separatorMargin = v8->_separatorMargin;
    v8->_separatorMargin = v12;

    -[LPPadding bottom](v8->_margin, "bottom");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPPadding setBottom:](v8->_separatorMargin, "setBottom:", v14);

    v15 = objc_alloc_init(LPPadding);
    padding = v8->_padding;
    v8->_padding = v15;

    *(_DWORD *)&v8->_showSeparator = 16777473;
    v8->_ignoreSafeAreaInset = 0;
    v17 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 8.0);
    indicatorSpacing = v8->_indicatorSpacing;
    v8->_indicatorSpacing = v17;

    v19 = -[LPTextViewStyle initWithPlatform:fontScalingFactor:]([LPTextViewStyle alloc], "initWithPlatform:fontScalingFactor:", a3, a5);
    options = v8->_options;
    v8->_options = v19;

    if (+[LPTestingOverrides forceMonospaceFonts](LPTestingOverrides, "forceMonospaceFonts"))
    {
      objc_msgSend(MEMORY[0x1E0DC37E8], "monospacedSystemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC4B88]);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a4 == 12 || a4 == 2)
      {
        v22 = (void **)MEMORY[0x1E0DC4B10];
        if (a3 == 5)
          v22 = (void **)MEMORY[0x1E0DC4A88];
      }
      else
      {
        v22 = (void **)MEMORY[0x1E0DC4AB8];
      }
      fontWithTraits(*v22, 0x8000, a4);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v23 = (void *)v21;
    -[LPTextViewStyle setFont:](v8->_options, "setFont:", v21);

    if (a3 == 5)
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPTextViewStyle setColor:](v8->_options, "setColor:", v24);

    v25 = -[LPTextViewStyle initWithPlatform:fontScalingFactor:]([LPTextViewStyle alloc], "initWithPlatform:fontScalingFactor:", a3, a5);
    handle = v8->_handle;
    v8->_handle = v25;

    if (+[LPTestingOverrides forceMonospaceFonts](LPTestingOverrides, "forceMonospaceFonts"))
    {
      objc_msgSend(MEMORY[0x1E0DC37E8], "monospacedSystemFontOfSize:weight:", 11.0, *MEMORY[0x1E0DC4B88]);
      v27 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = (void **)MEMORY[0x1E0DC4AB8];
      if (a3 != 5)
        v28 = (void **)MEMORY[0x1E0DC4AA0];
      fontWithTraits(*v28, 0, a4);
      v27 = objc_claimAutoreleasedReturnValue();
    }
    v29 = (void *)v27;
    -[LPTextViewStyle setFont:](v8->_handle, "setFont:", v27);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPTextViewStyle setColor:](v8->_handle, "setColor:", v30);

    v31 = v8;
  }

  return v8;
}

- (LPPadding)margin
{
  return self->_margin;
}

- (LPPadding)separatorMargin
{
  return self->_separatorMargin;
}

- (LPPadding)padding
{
  return self->_padding;
}

- (LPPointUnit)indicatorSpacing
{
  return self->_indicatorSpacing;
}

- (void)setIndicatorSpacing:(id)a3
{
  objc_storeStrong((id *)&self->_indicatorSpacing, a3);
}

- (LPPointUnit)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(id)a3
{
  objc_storeStrong((id *)&self->_cornerRadius, a3);
}

- (LPTextViewStyle)options
{
  return self->_options;
}

- (LPTextViewStyle)handle
{
  return self->_handle;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (BOOL)showSeparator
{
  return self->_showSeparator;
}

- (void)setShowSeparator:(BOOL)a3
{
  self->_showSeparator = a3;
}

- (BOOL)useFullWidth
{
  return self->_useFullWidth;
}

- (void)setUseFullWidth:(BOOL)a3
{
  self->_useFullWidth = a3;
}

- (BOOL)useInlineIndicator
{
  return self->_useInlineIndicator;
}

- (void)setUseInlineIndicator:(BOOL)a3
{
  self->_useInlineIndicator = a3;
}

- (BOOL)useFullWidthDuringSizing
{
  return self->_useFullWidthDuringSizing;
}

- (void)setUseFullWidthDuringSizing:(BOOL)a3
{
  self->_useFullWidthDuringSizing = a3;
}

- (BOOL)ignoreSafeAreaInset
{
  return self->_ignoreSafeAreaInset;
}

- (void)setIgnoreSafeAreaInset:(BOOL)a3
{
  self->_ignoreSafeAreaInset = a3;
}

- (BOOL)useSafeAreaInsetWithPadding
{
  return self->_useSafeAreaInsetWithPadding;
}

- (void)setUseSafeAreaInsetWithPadding:(BOOL)a3
{
  self->_useSafeAreaInsetWithPadding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_cornerRadius, 0);
  objc_storeStrong((id *)&self->_indicatorSpacing, 0);
  objc_storeStrong((id *)&self->_padding, 0);
  objc_storeStrong((id *)&self->_separatorMargin, 0);
  objc_storeStrong((id *)&self->_margin, 0);
}

@end
