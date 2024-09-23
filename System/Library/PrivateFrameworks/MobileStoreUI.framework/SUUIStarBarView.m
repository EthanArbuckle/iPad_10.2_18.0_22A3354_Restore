@implementation SUUIStarBarView

- (SUUIStarBarView)initWithFrame:(CGRect)a3
{
  SUUIStarBarView *v3;
  uint64_t v4;
  UIColor *emptyColor;
  uint64_t v6;
  UIColor *filledColor;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUIStarBarView;
  v3 = -[SUUIStarBarView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.05);
    v4 = objc_claimAutoreleasedReturnValue();
    emptyColor = v3->_emptyColor;
    v3->_emptyColor = (UIColor *)v4;

    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.517647059, 1.0);
    v6 = objc_claimAutoreleasedReturnValue();
    filledColor = v3->_filledColor;
    v3->_filledColor = (UIColor *)v6;

    -[SUUIStarBarView setContentMode:](v3, "setContentMode:", 3);
  }
  return v3;
}

- (void)setColoringUsingStyle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "ikBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "color");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "ikColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && v7)
  {
    -[SUUIStarBarView setEmptyColor:](self, "setEmptyColor:", v12);
  }
  else
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.05);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIStarBarView setEmptyColor:](self, "setEmptyColor:", v10);

      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.517647059, 1.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIStarBarView setFilledColor:](self, "setFilledColor:", v11);

      goto LABEL_8;
    }
    v8 = SUUIColorSchemeStyleForColor(v7);
    if (v8 <= 3)
    {
      objc_msgSend(v7, "colorWithAlphaComponent:", dbl_241EFCB48[v8]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIStarBarView setEmptyColor:](self, "setEmptyColor:", v9);

    }
  }
  -[SUUIStarBarView setFilledColor:](self, "setFilledColor:", v7);
LABEL_8:

}

- (void)setEmptyColor:(id)a3
{
  UIColor *v4;
  UIColor *emptyColor;
  UIImage *emptyStarImage;
  UIImage *filledStarImage;

  if (self->_emptyColor != a3)
  {
    v4 = (UIColor *)objc_msgSend(a3, "copy");
    emptyColor = self->_emptyColor;
    self->_emptyColor = v4;

    emptyStarImage = self->_emptyStarImage;
    self->_emptyStarImage = 0;

    filledStarImage = self->_filledStarImage;
    self->_filledStarImage = 0;

    -[SUUIStarBarView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setFilledColor:(id)a3
{
  UIColor *v4;
  UIColor *filledColor;
  UIImage *emptyStarImage;
  UIImage *filledStarImage;

  if (self->_filledColor != a3)
  {
    v4 = (UIColor *)objc_msgSend(a3, "copy");
    filledColor = self->_filledColor;
    self->_filledColor = v4;

    emptyStarImage = self->_emptyStarImage;
    self->_emptyStarImage = 0;

    filledStarImage = self->_filledStarImage;
    self->_filledStarImage = 0;

    -[SUUIStarBarView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setNumberOfStars:(int64_t)a3
{
  if (self->_numberOfStars != a3)
  {
    self->_numberOfStars = a3;
    -[SUUIStarBarView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setValue:(double)a3
{
  if (self->_value != a3)
  {
    self->_value = a3;
    -[SUUIStarBarView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int ShouldReverseLayoutDirection;
  UIColor *emptyColor;
  UIColor *v14;
  UIColor *filledColor;
  UIColor *v16;
  UIColor *v17;
  void *v18;
  void *v19;
  void *v20;
  UIImage *v21;
  UIImage *emptyStarImage;
  UIImage *v23;
  UIImage *filledStarImage;
  double v25;
  double Width;
  double v27;
  uint64_t v28;
  UIImage *v29;
  UIImage *v30;
  double v31;
  double v32;
  double v33;
  double v35;
  double v36;
  double v37;
  double v38;
  float v39;
  double v40;
  void *v41;
  CGContext *CurrentContext;
  double value;
  double v44;
  double v45;
  double v46;
  double v47;
  UIColor *v48;
  CGRect v49;

  -[SUUIStarBarView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  emptyColor = self->_emptyColor;
  if (emptyColor)
  {
    v14 = emptyColor;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.05);
    v14 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v48 = v14;
  filledColor = self->_filledColor;
  if (filledColor)
  {
    v16 = filledColor;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.517647059, 1.0);
    v16 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;
  if (!self->_emptyStarImage)
  {
    v18 = (void *)MEMORY[0x24BEBD640];
    SUUIBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "imageNamed:inBundle:", CFSTR("SmallStarFull"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "_flatImageWithColor:", v48);
    v21 = (UIImage *)objc_claimAutoreleasedReturnValue();
    emptyStarImage = self->_emptyStarImage;
    self->_emptyStarImage = v21;

    objc_msgSend(v20, "_flatImageWithColor:", v17);
    v23 = (UIImage *)objc_claimAutoreleasedReturnValue();
    filledStarImage = self->_filledStarImage;
    self->_filledStarImage = v23;

  }
  v25 = 0.0;
  if (ShouldReverseLayoutDirection)
  {
    v49.origin.x = v5;
    v49.origin.y = v7;
    v49.size.width = v9;
    v49.size.height = v11;
    Width = CGRectGetWidth(v49);
    -[UIImage size](self->_emptyStarImage, "size");
    v25 = Width - v27;
  }
  v28 = -5;
  do
  {
    v29 = self->_emptyStarImage;
    if (v28 + 6 > 5 - self->_numberOfStars)
    {
      v30 = self->_filledStarImage;

      v29 = v30;
    }
    -[UIImage size](v29, "size");
    v32 = v31;
    *(float *)&v31 = (v11 - v33) * 0.5;
    -[UIImage drawAtPoint:](v29, "drawAtPoint:", v25, floorf(*(float *)&v31));
    if (__CFADD__(v28++, 1))
      v35 = 0.0;
    else
      v35 = v32;
    v36 = -v35;
    if (!ShouldReverseLayoutDirection)
      v36 = v32;
    v25 = v25 + v36;

  }
  while (v28);
  v37 = 0.0;
  if (ShouldReverseLayoutDirection)
  {
    v38 = v25 + -9.0;
  }
  else
  {
    v37 = v25 + 9.0;
    v38 = v9 - (v25 + 9.0);
  }
  v39 = (v11 + -2.0) * 0.5;
  v40 = floorf(v39);
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRoundedRect:cornerRadius:", v37, v40, v38, 2.0, 2.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIColor set](v48, "set");
  objc_msgSend(v41, "fill");
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  value = self->_value;
  v44 = v25 + -9.0 - (v25 + -9.0) * value;
  if (!ShouldReverseLayoutDirection)
    v44 = v25 + 9.0;
  v45 = v38 * value;
  v46 = 2.0;
  v47 = v40;
  CGContextClipToRect(CurrentContext, *(CGRect *)&v44);
  -[UIColor set](v17, "set");
  objc_msgSend(v41, "fill");
  CGContextRestoreGState(CurrentContext);

}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 14.0;
  result.height = v3;
  return result;
}

- (UIColor)emptyColor
{
  return self->_emptyColor;
}

- (int64_t)numberOfStars
{
  return self->_numberOfStars;
}

- (double)value
{
  return self->_value;
}

- (UIColor)filledColor
{
  return self->_filledColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filledStarImage, 0);
  objc_storeStrong((id *)&self->_filledColor, 0);
  objc_storeStrong((id *)&self->_emptyStarImage, 0);
  objc_storeStrong((id *)&self->_emptyColor, 0);
}

@end
