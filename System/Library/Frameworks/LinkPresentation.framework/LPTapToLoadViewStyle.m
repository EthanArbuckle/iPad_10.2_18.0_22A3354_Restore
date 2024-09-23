@implementation LPTapToLoadViewStyle

- (LPTapToLoadViewStyle)initWithPlatform:(int64_t)a3 sizeClass:(unint64_t)a4 fontScalingFactor:(double)a5
{
  LPTapToLoadViewStyle *v8;
  uint64_t v9;
  UIColor *backgroundColor;
  uint64_t v11;
  UIColor *tapHighlightColor;
  LPTextViewStyle *v13;
  LPTextViewStyle *caption;
  void *v15;
  void *v16;
  LPPointUnit *v17;
  void *v18;
  LPPointUnit *v19;
  void *v20;
  LPPointUnit *v21;
  LPPointUnit *width;
  LPPointUnit *v23;
  LPPointUnit *height;
  LPTapToLoadViewStyle *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)LPTapToLoadViewStyle;
  v8 = -[LPTapToLoadViewStyle init](&v27, sel_init);
  if (v8)
  {
    +[LPResources linkMediaBackgroundColor](LPResources, "linkMediaBackgroundColor");
    v9 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v8->_backgroundColor;
    v8->_backgroundColor = (UIColor *)v9;

    +[LPResources tapToLoadHighlightColor](LPResources, "tapToLoadHighlightColor");
    v11 = objc_claimAutoreleasedReturnValue();
    tapHighlightColor = v8->_tapHighlightColor;
    v8->_tapHighlightColor = (UIColor *)v11;

    v13 = -[LPTextViewStyle initWithPlatform:fontScalingFactor:]([LPTextViewStyle alloc], "initWithPlatform:fontScalingFactor:", a3, a5);
    caption = v8->_caption;
    v8->_caption = v13;

    bottomCaptionFont(a3, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPTextViewStyle setFont:](v8->_caption, "setFont:", v15);

    objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPTextViewStyle setColor:](v8->_caption, "setColor:", v16);

    -[LPTextViewStyle setMaximumLines:](v8->_caption, "setMaximumLines:", 0);
    -[LPTextViewStyle setTextAlignment:](v8->_caption, "setTextAlignment:", 2);
    v17 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 12.0);
    -[LPTextViewStyle padding](v8->_caption, "padding");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLeading:", v17);

    v19 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 12.0);
    -[LPTextViewStyle padding](v8->_caption, "padding");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTrailing:", v19);

    v21 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", a5 * 160.0);
    width = v8->_width;
    v8->_width = v21;

    v23 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", a5 * 80.0);
    height = v8->_height;
    v8->_height = v23;

    v25 = v8;
  }

  return v8;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIColor)tapHighlightColor
{
  return self->_tapHighlightColor;
}

- (void)setTapHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_tapHighlightColor, a3);
}

- (LPTextViewStyle)caption
{
  return self->_caption;
}

- (LPPointUnit)width
{
  return self->_width;
}

- (void)setWidth:(id)a3
{
  objc_storeStrong((id *)&self->_width, a3);
}

- (LPPointUnit)height
{
  return self->_height;
}

- (void)setHeight:(id)a3
{
  objc_storeStrong((id *)&self->_height, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_width, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_tapHighlightColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
