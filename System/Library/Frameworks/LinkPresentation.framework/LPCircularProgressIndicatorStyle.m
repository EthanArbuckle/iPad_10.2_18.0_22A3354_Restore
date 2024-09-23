@implementation LPCircularProgressIndicatorStyle

- (LPCircularProgressIndicatorStyle)initWithPlatform:(int64_t)a3
{
  LPCircularProgressIndicatorStyle *v4;
  LPCircularProgressIndicatorStyle *v5;
  uint64_t v6;
  UIColor *borderColor;
  uint64_t v8;
  UIColor *fillColor;
  LPCircularProgressIndicatorStyle *v10;
  uint64_t v12;
  UIColor *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)LPCircularProgressIndicatorStyle;
  v4 = -[LPCircularProgressIndicatorStyle init](&v14, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_borderWidth = 3.0;
    if ((unint64_t)a3 < 5 || a3 == 6)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
      v6 = objc_claimAutoreleasedReturnValue();
      borderColor = v5->_borderColor;
      v5->_borderColor = (UIColor *)v6;

      objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 != 5)
        goto LABEL_5;
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v5->_borderColor;
      v5->_borderColor = (UIColor *)v12;

      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    fillColor = v5->_fillColor;
    v5->_fillColor = (UIColor *)v8;

LABEL_5:
    v10 = v5;
  }

  return v5;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
  objc_storeStrong((id *)&self->_borderColor, a3);
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_fillColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
}

@end
