@implementation HKCurrentTimeChevronButton

- (HKCurrentTimeChevronButton)initWithChevronDirection:(int64_t)a3
{
  HKCurrentTimeChevronButton *v4;
  HKCurrentTimeChevronButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKCurrentTimeChevronButton;
  v4 = -[HKCurrentTimeChevronButton init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_chevronDirection = a3;
    -[HKCurrentTimeChevronButton _updateButtonAppearence](v4, "_updateButtonAppearence");
  }
  return v5;
}

- (void)setChevronDirection:(int64_t)a3
{
  if (self->_chevronDirection != a3)
  {
    self->_chevronDirection = a3;
    -[HKCurrentTimeChevronButton _updateButtonAppearence](self, "_updateButtonAppearence");
    -[HKCurrentTimeChevronButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateButtonAppearence
{
  void *v3;
  void *v4;
  int64_t chevronDirection;
  double v6;
  double v7;
  const __CFString *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("date_chevron_background"), v13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithRenderingMode:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  chevronDirection = self->_chevronDirection;
  v6 = *MEMORY[0x1E0DC49E8];
  v7 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  if (chevronDirection == 1)
    v8 = CFSTR("date_chevron_left");
  else
    v8 = CFSTR("date_chevron_right");
  if (chevronDirection == 1)
    v9 = 1.0;
  else
    v9 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  if (chevronDirection == 1)
    v10 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  else
    v10 = 1.0;
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:compatibleWithTraitCollection:", v8, v13, 0, *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageWithRenderingMode:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKCurrentTimeChevronButton setImage:forState:](self, "setImage:forState:", v12, 0);
  -[HKCurrentTimeChevronButton setBackgroundImage:forState:](self, "setBackgroundImage:forState:", v4, 0);
  -[HKCurrentTimeChevronButton setImageEdgeInsets:](self, "setImageEdgeInsets:", v6, v9, v7, v10);
  -[HKCurrentTimeChevronButton setContentMode:](self, "setContentMode:", 1);

}

- (CGRect)backgroundRectForBounds:(CGRect)a3
{
  double height;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  if (a3.size.width >= a3.size.height)
    height = a3.size.height;
  else
    height = a3.size.width;
  -[HKCurrentTimeChevronButton _squareRectWithDimension:chevronDirection:](self, "_squareRectWithDimension:chevronDirection:", self->_chevronDirection, height, a3.origin.y);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double height;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  if (a3.size.width >= a3.size.height)
    height = a3.size.height;
  else
    height = a3.size.width;
  -[HKCurrentTimeChevronButton _squareRectWithDimension:chevronDirection:](self, "_squareRectWithDimension:chevronDirection:", self->_chevronDirection, height, a3.origin.y);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_squareRectWithDimension:(double)a3 chevronDirection:(int64_t)a4
{
  double v5;
  double v6;
  double v7;
  CGRect result;

  v5 = 0.0;
  if (a4 != 1)
    v5 = a3;
  v6 = 0.0;
  v7 = a3;
  result.size.height = v7;
  result.size.width = a3;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (int64_t)chevronDirection
{
  return self->_chevronDirection;
}

@end
