@implementation LPIndeterminateProgressSpinnerStyle

- (LPIndeterminateProgressSpinnerStyle)initWithPlatform:(int64_t)a3 sizeClass:(unint64_t)a4 fontScalingFactor:(double)a5
{
  LPIndeterminateProgressSpinnerStyle *v8;
  uint64_t v9;
  UIColor *indicatorColor;
  LPTextViewStyle *v11;
  void *v12;
  void *v13;
  LPPadding *v14;
  LPPadding *padding;
  LPPointUnit *v16;
  LPPointUnit *v17;
  LPPointUnit *v18;
  LPPointUnit *v19;
  LPPointUnit *v20;
  LPPointUnit *spacing;
  LPPointUnit *v22;
  LPPointUnit *verticalOffset;
  LPIndeterminateProgressSpinnerStyle *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)LPIndeterminateProgressSpinnerStyle;
  v8 = -[LPIndeterminateProgressSpinnerStyle init](&v26, sel_init);
  if (v8)
  {
    if (a3 == 5)
      objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v9 = objc_claimAutoreleasedReturnValue();
    indicatorColor = v8->_indicatorColor;
    v8->_indicatorColor = (UIColor *)v9;

    v8->_useLargeIndicatorStyle = 1;
    v11 = -[LPTextViewStyle initWithPlatform:fontScalingFactor:]([LPTextViewStyle alloc], "initWithPlatform:fontScalingFactor:", a3, a5);
    -[LPTextViewStyle setTextAlignment:](v11, "setTextAlignment:", 2);
    if (a3 == 5)
      objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPTextViewStyle setColor:](v11, "setColor:", v12);

    if (+[LPTestingOverrides forceMonospaceFonts](LPTestingOverrides, "forceMonospaceFonts"))
      objc_msgSend(MEMORY[0x1E0DC37E8], "monospacedSystemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC4B88]);
    else
      fontWithTraits((void *)*MEMORY[0x1E0DC4AB8], 0x8000, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPTextViewStyle setFont:](v11, "setFont:", v13);

    objc_storeStrong((id *)&v8->_label, v11);
    v14 = objc_alloc_init(LPPadding);
    padding = v8->_padding;
    v8->_padding = v14;

    v16 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 25.0);
    -[LPPadding setTop:](v8->_padding, "setTop:", v16);

    v17 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 25.0);
    -[LPPadding setBottom:](v8->_padding, "setBottom:", v17);

    v18 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 25.0);
    -[LPPadding setLeading:](v8->_padding, "setLeading:", v18);

    v19 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 25.0);
    -[LPPadding setTrailing:](v8->_padding, "setTrailing:", v19);

    v20 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 8.0);
    spacing = v8->_spacing;
    v8->_spacing = v20;

    v22 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 2.0);
    verticalOffset = v8->_verticalOffset;
    v8->_verticalOffset = v22;

    v24 = v8;
  }

  return v8;
}

- (LPPadding)padding
{
  return self->_padding;
}

- (void)setPadding:(id)a3
{
  objc_storeStrong((id *)&self->_padding, a3);
}

- (LPPointUnit)spacing
{
  return self->_spacing;
}

- (void)setSpacing:(id)a3
{
  objc_storeStrong((id *)&self->_spacing, a3);
}

- (LPPointUnit)verticalOffset
{
  return self->_verticalOffset;
}

- (void)setVerticalOffset:(id)a3
{
  objc_storeStrong((id *)&self->_verticalOffset, a3);
}

- (UIColor)indicatorColor
{
  return self->_indicatorColor;
}

- (void)setIndicatorColor:(id)a3
{
  objc_storeStrong((id *)&self->_indicatorColor, a3);
}

- (BOOL)useLargeIndicatorStyle
{
  return self->_useLargeIndicatorStyle;
}

- (void)setUseLargeIndicatorStyle:(BOOL)a3
{
  self->_useLargeIndicatorStyle = a3;
}

- (LPTextViewStyle)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_indicatorColor, 0);
  objc_storeStrong((id *)&self->_verticalOffset, 0);
  objc_storeStrong((id *)&self->_spacing, 0);
  objc_storeStrong((id *)&self->_padding, 0);
}

@end
