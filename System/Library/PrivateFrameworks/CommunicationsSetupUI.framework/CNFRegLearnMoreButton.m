@implementation CNFRegLearnMoreButton

+ (id)roundedButtonWithText:(id)a3 color:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)MEMORY[0x24BEBD430];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "buttonWithType:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = -0.5;
  objc_msgSend(v8, "setCharge:", v9);
  objc_msgSend(v8, "setAutoresizingMask:", 5);
  objc_msgSend(v8, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "fontWithName:size:", CFSTR("Helvetica Neue Light"), 14.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v11);

  objc_msgSend(v8, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumberOfLines:", 1);

  objc_msgSend(v8, "setContentEdgeInsets:", 0.0, 6.0, 0.0, 6.0);
  objc_msgSend(v8, "setTitleEdgeInsets:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v8, "setTitle:forState:", v7, 0);

  objc_msgSend(v8, "setTitleColor:forState:", v6, 0);
  objc_msgSend(v8, "sizeToFit");
  return v8;
}

- (CNFRegLearnMoreButton)initWithFrame:(CGRect)a3 style:(int64_t)a4 text:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  CNFRegLearnMoreButton *v12;
  CNFRegLearnMoreButton *v13;
  void *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNFRegLearnMoreButton;
  v12 = -[CNFRegLearnMoreButton initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12)
  {
    -[CNFRegLearnMoreButton setStyle:](v12, "setStyle:", a4);
    -[CNFRegLearnMoreButton setButtonText:](v13, "setButtonText:", v11);
    -[CNFRegLearnMoreButton setUsesImage:](v13, "setUsesImage:", a4 != 1);
    -[CNFRegLearnMoreButton setAlwaysUnderline:](v13, "setAlwaysUnderline:", a4 == 1);
    -[CNFRegLearnMoreButton _setupLearnMoreTextForCurrentStyle](v13, "_setupLearnMoreTextForCurrentStyle");
    -[CNFRegLearnMoreButton _setupArrowImageForCurrentStyle](v13, "_setupArrowImageForCurrentStyle");
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegLearnMoreButton setBackgroundColor:](v13, "setBackgroundColor:", v14);

  }
  return v13;
}

- (CNFRegLearnMoreButton)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  return -[CNFRegLearnMoreButton initWithFrame:style:text:](self, "initWithFrame:style:text:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CNFRegLearnMoreButton)initWithFrame:(CGRect)a3
{
  return -[CNFRegLearnMoreButton initWithFrame:style:](self, "initWithFrame:style:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_setupLearnMoreTextForCurrentStyle
{
  double v3;
  double v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v3 = 0.0;
  if (-[CNFRegLearnMoreButton usesImage](self, "usesImage"))
    v4 = 5.0;
  else
    v4 = 0.0;
  -[CNFRegLearnMoreButton setTitleEdgeInsets:](self, "setTitleEdgeInsets:", 0.0, 0.0, 0.0, v4);
  v5 = self->_buttonText;
  if (!v5)
  {
    CommunicationsSetupUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FACETIME_SPLASH_LEARN_MORE"), &stru_24D077260, v7);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  -[CNFRegLearnMoreButton setTitle:forState:](self, "setTitle:forState:", v5, 0);
  objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 15.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "learnMoreTextColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "learnMoreTextColorSelected");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "learnMoreShadowColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 1.0;
  if (-[CNFRegLearnMoreButton style](self, "style") == 1)
  {
    objc_msgSend(v21, "tableHeaderTextColor");
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "tableHeaderTextColorSelected");
    v14 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "tableHeaderTextShadowColor");
    v15 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "tableHeaderTextShadowOffset");
    v3 = v16;
    v12 = v17;
    v10 = (void *)v14;
    v11 = (void *)v15;
    v9 = (void *)v13;
  }
  -[CNFRegLearnMoreButton setTitleColor:forState:](self, "setTitleColor:forState:", v9, 0);
  -[CNFRegLearnMoreButton setTitleColor:forState:](self, "setTitleColor:forState:", v10, 1);
  -[CNFRegLearnMoreButton titleLabel](self, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFont:", v8);

  -[CNFRegLearnMoreButton titleLabel](self, "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLineBreakMode:", 4);

  if (v11)
  {
    -[CNFRegLearnMoreButton setTitleShadowColor:forState:](self, "setTitleShadowColor:forState:", v11, 0);
    -[CNFRegLearnMoreButton titleLabel](self, "titleLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setShadowOffset:", v3, v12);

  }
}

- (void)_setupArrowImageForCurrentStyle
{
  void *v3;
  void *v4;
  id v5;

  if (-[CNFRegLearnMoreButton usesImage](self, "usesImage"))
  {
    +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "learnMoreArrowImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "learnMoreArrowImagePressed");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegLearnMoreButton setImage:forState:](self, "setImage:forState:", v3, 0);
    -[CNFRegLearnMoreButton setImage:forState:](self, "setImage:forState:", v4, 1);

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  objc_super v11;
  CGSize result;

  v11.receiver = self;
  v11.super_class = (Class)CNFRegLearnMoreButton;
  -[CNFRegLearnMoreButton sizeThatFits:](&v11, sel_sizeThatFits_, a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  -[CNFRegLearnMoreButton imageForState:](self, "imageForState:", -[CNFRegLearnMoreButton state](self, "state"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v5 = v5 + 5.0;

  v9 = v5;
  v10 = v7;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CNFRegLearnMoreButton imageForState:](self, "imageForState:", -[CNFRegLearnMoreButton state](self, "state"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "size");
    v11 = v10;
    v13 = v12;
    -[CNFRegLearnMoreButton imageEdgeInsets](self, "imageEdgeInsets");
    v15 = x + v14;
    v17 = y + v16;
    v19 = width - (v14 + v18);
    v21 = height - (v16 + v20);
    v28.origin.x = v15;
    v28.origin.y = v17;
    v28.size.width = v19;
    v28.size.height = v21;
    v22 = CGRectGetMaxX(v28) - v11;
    v29.origin.x = v15;
    v29.origin.y = v17;
    v29.size.width = v19;
    v29.size.height = v21;
    v23 = floor(CGRectGetMidY(v29) + v13 * -0.5);
  }
  else
  {
    v22 = *MEMORY[0x24BDBF090];
    v23 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v11 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v13 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v24 = v22;
  v25 = v23;
  v26 = v11;
  v27 = v13;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  _QWORD v40[2];
  _QWORD v41[3];
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v41[2] = *MEMORY[0x24BDAC8D0];
  v8 = -[CNFRegLearnMoreButton state](self, "state");
  -[CNFRegLearnMoreButton titleForState:](self, "titleForState:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && objc_msgSend(v9, "length"))
  {
    -[CNFRegLearnMoreButton imageForState:](self, "imageForState:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = MEMORY[0x24BDBF148];
    v14 = *MEMORY[0x24BDBF148];
    v15 = *MEMORY[0x24BDBF148];
    if (v11)
    {
      objc_msgSend(v11, "size");
      v15 = v16;
    }
    -[CNFRegLearnMoreButton titleEdgeInsets](self, "titleEdgeInsets");
    v18 = x + v17;
    v20 = y + v19;
    v22 = width - (v17 + v21);
    v24 = height - (v19 + v23);
    v25 = -[CNFRegLearnMoreButton _lineBreakMode](self, "_lineBreakMode");
    v42.origin.x = v18;
    v42.origin.y = v20;
    v42.size.width = v22;
    v42.size.height = v24;
    v26 = CGRectGetWidth(v42);
    objc_msgSend(MEMORY[0x24BEBB498], "defaultParagraphStyle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "mutableCopy");

    objc_msgSend(v28, "setLineBreakMode:", v25);
    v40[0] = *MEMORY[0x24BEBB360];
    -[CNFRegLearnMoreButton _font](self, "_font");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = *MEMORY[0x24BEBB3A8];
    v41[0] = v29;
    v41[1] = v28;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 1, v30, 0, v26 - v15, 1.79769313e308);
      v14 = v31;
      v33 = v32;
    }
    else
    {
      v33 = *(double *)(v13 + 8);
    }
    v43.origin.x = v18;
    v43.origin.y = v20;
    v43.size.width = v22;
    v43.size.height = v24;
    v34 = CGRectGetMaxX(v43) - v15 - v14;
    v44.origin.x = v18;
    v44.origin.y = v20;
    v44.size.width = v22;
    v44.size.height = v24;
    v35 = floor(CGRectGetMidY(v44) + v33 * -0.5);

  }
  else
  {
    v34 = *MEMORY[0x24BDBF090];
    v35 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v14 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v33 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v36 = v34;
  v37 = v35;
  v38 = v14;
  v39 = v33;
  result.size.height = v39;
  result.size.width = v38;
  result.origin.y = v37;
  result.origin.x = v36;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNFRegLearnMoreButton;
  -[CNFRegLearnMoreButton setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[CNFRegLearnMoreButton setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNFRegLearnMoreButton;
  -[CNFRegLearnMoreButton setSelected:](&v4, sel_setSelected_, a3);
  -[CNFRegLearnMoreButton setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  CGContext *CurrentContext;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  id v28;
  id v29;
  CGFloat v30;
  objc_super v31;
  _QWORD v32[2];
  _QWORD v33[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v33[2] = *MEMORY[0x24BDAC8D0];
  +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "learnMoreButtonDrawsUnderline")
    && ((-[CNFRegLearnMoreButton isHighlighted](self, "isHighlighted") & 1) != 0
     || (-[CNFRegLearnMoreButton isSelected](self, "isSelected") & 1) != 0
     || -[CNFRegLearnMoreButton alwaysUnderline](self, "alwaysUnderline")))
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    -[CNFRegLearnMoreButton titleLabel](self, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegLearnMoreButton bounds](self, "bounds");
    v12 = v11;
    objc_msgSend(MEMORY[0x24BEBB498], "defaultParagraphStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    objc_msgSend(v14, "setLineBreakMode:", 4);
    v32[0] = *MEMORY[0x24BEBB360];
    objc_msgSend(v10, "font");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = *MEMORY[0x24BEBB3A8];
    v33[0] = v15;
    v33[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "text");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "length"))
    {
      objc_msgSend(v10, "text");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegLearnMoreButton bounds](self, "bounds");
      objc_msgSend(v18, "boundingRectWithSize:options:attributes:context:", 1, v16, 0, v19, v20);
      v22 = v21;

    }
    else
    {
      v22 = *MEMORY[0x24BDBF148];
    }

    objc_msgSend(v10, "center");
    v23 = v22 * 0.5;
    v25 = v24 - v22 * 0.5;
    objc_msgSend(v10, "center");
    v27 = v23 + v26;
    objc_msgSend(v10, "textColor");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v28, "CGColor"));

    CGContextSetLineWidth(CurrentContext, 1.5);
    CGContextMoveToPoint(CurrentContext, v25, v12 + -1.5);
    CGContextAddLineToPoint(CurrentContext, v27, v12 + -1.5);
    CGContextStrokePath(CurrentContext);
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v29, "CGColor"));

    CGContextSetLineWidth(CurrentContext, 1.0);
    v30 = v12 + -0.5;
    CGContextMoveToPoint(CurrentContext, v25, v30);
    CGContextAddLineToPoint(CurrentContext, v27, v30);
    CGContextStrokePath(CurrentContext);

  }
  v31.receiver = self;
  v31.super_class = (Class)CNFRegLearnMoreButton;
  -[CNFRegLearnMoreButton drawRect:](&v31, sel_drawRect_, x, y, width, height);

}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (void)setButtonText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 760);
}

- (BOOL)usesImage
{
  return self->_usesImage;
}

- (void)setUsesImage:(BOOL)a3
{
  self->_usesImage = a3;
}

- (BOOL)alwaysUnderline
{
  return self->_alwaysUnderline;
}

- (void)setAlwaysUnderline:(BOOL)a3
{
  self->_alwaysUnderline = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonText, 0);
}

@end
