@implementation LACUICapsuleLabel

- (CGRect)textRectForBounds:(CGRect)a3 limitedToNumberOfLines:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  objc_super v20;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;

  if (width <= v12)
  {
    v19.receiver = self;
    v19.super_class = (Class)LACUICapsuleLabel;
    -[LACUICapsuleLabel textRectForBounds:limitedToNumberOfLines:](&v19, sel_textRectForBounds_limitedToNumberOfLines_, a4, x, y, width + -32.0, height + -4.0);
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)LACUICapsuleLabel;
    -[LACUICapsuleLabel textRectForBounds:limitedToNumberOfLines:](&v20, sel_textRectForBounds_limitedToNumberOfLines_, a4, x, y, width, height);
    v16 = v15 + 32.0;
    v18 = v17 + 4.0;
  }
  result.size.height = v18;
  result.size.width = v16;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  v13.receiver = self;
  v13.super_class = (Class)LACUICapsuleLabel;
  -[LACUICapsuleLabel intrinsicContentSize](&v13, sel_intrinsicContentSize);
  v4 = v3;
  v6 = v5;
  -[LACUICapsuleLabel text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v4 = v4 + 32.0;
    v6 = v6 + 4.0;
    -[LACUICapsuleLabel layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCornerRadius:", fmin(v6 * 0.5, 18.0));

    -[LACUICapsuleLabel layer](self, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "masksToBounds");

  }
  v11 = v4;
  v12 = v6;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)setStyle:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (a3 == 2)
  {
    -[LACUICapsuleLabel _desaturatedSystemRedColor]((uint64_t)self);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x24BEBD4B8];
  }
  else
  {
    if (a3 == 1)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if (a3)
    {
      v7 = 0;
      v6 = 0;
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x24BEBD4B8];
  }
  objc_msgSend(v4, "clearColor");
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v6 = (void *)v5;
LABEL_10:
  -[LACUICapsuleLabel setTextColor:](self, "setTextColor:", v7);
  -[LACUICapsuleLabel _setBackgroundColor:](self, v6);

}

- (id)_desaturatedSystemRedColor
{
  void *v1;
  id v2;
  void *v3;
  double v5;
  double v6;
  double v7;
  double v8;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0.0;
  v8 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  if ((objc_msgSend(v1, "getHue:saturation:brightness:alpha:", &v8, &v7, &v6, &v5) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithHue:saturation:brightness:alpha:", v8, fmax(fmin(v7 + -0.4, 1.0), 0.0), v6, v5);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = v1;
  }
  v3 = v2;

  return v3;
}

- (void)_setBackgroundColor:(void *)a1
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;

  if (a1)
  {
    v3 = a2;
    objc_msgSend(a1, "layer");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_retainAutorelease(v3);
    v5 = objc_msgSend(v4, "CGColor");

    objc_msgSend(v6, "setBackgroundColor:", v5);
  }
}

@end
