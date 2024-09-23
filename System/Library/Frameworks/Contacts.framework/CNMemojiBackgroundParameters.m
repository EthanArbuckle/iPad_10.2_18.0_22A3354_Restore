@implementation CNMemojiBackgroundParameters

+ (id)defaultBackgroundColorDescription
{
  CNMemojiBackgroundColor *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = -[CNMemojiBackgroundColor initWithDefaultColorWithAlpha:]([CNMemojiBackgroundColor alloc], "initWithDefaultColorWithAlpha:", 0.0);
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[CNMemojiBackgroundColor red](v2, "red");
  v5 = v4;
  -[CNMemojiBackgroundColor green](v2, "green");
  v7 = v6;
  -[CNMemojiBackgroundColor blue](v2, "blue");
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%f:%f:%f"), v5, v7, v8);

  return v9;
}

- (CNMemojiBackgroundParameters)initWithColorDescription:(id)a3
{
  id v4;
  CNMemojiBackgroundParameters *v5;
  CNMemojiBackgroundColor *v6;
  CNMemojiBackgroundColor *contentColor;
  CNMemojiBackgroundParameters *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNMemojiBackgroundParameters;
  v5 = -[CNMemojiBackgroundParameters init](&v10, sel_init);
  if (v5)
  {
    v6 = -[CNMemojiBackgroundColor initWithColorDescription:alpha:]([CNMemojiBackgroundColor alloc], "initWithColorDescription:alpha:", v4, 0.4);
    contentColor = v5->_contentColor;
    v5->_contentColor = v6;

    v8 = v5;
  }

  return v5;
}

- (int64_t)numberOfLayers
{
  return 3;
}

- (int64_t)numberOfColorsForLayer:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  else
    return qword_18FA40B10[a3];
}

- (id)colorAtIndex:(int64_t)a3 forLayer:(int64_t)a4
{
  void *v4;

  if (a4 == 2)
  {
    -[CNMemojiBackgroundParameters topGradientLayerColorForIndex:](self, "topGradientLayerColorForIndex:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4 == 1)
  {
    -[CNMemojiBackgroundParameters colorLayerColorForIndex:](self, "colorLayerColorForIndex:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    v4 = 0;
  }
  else
  {
    -[CNMemojiBackgroundParameters backgroundLayerColorForIndex:](self, "backgroundLayerColorForIndex:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)backgroundLayerColorForIndex:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  CNMemojiBackgroundColor *v5;

  if (a3)
    v5 = 0;
  else
    v5 = -[CNMemojiBackgroundColor initWithRed:green:blue:alpha:]([CNMemojiBackgroundColor alloc], "initWithRed:green:blue:alpha:", 255.0, 255.0, 255.0, 0.9, v3, v4);
  return v5;
}

- (id)colorLayerColorForIndex:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a3)
  {
    v5 = 0;
  }
  else
  {
    -[CNMemojiBackgroundParameters contentColor](self, "contentColor", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)topGradientLayerColorForIndex:(int64_t)a3
{
  double v3;
  CNMemojiBackgroundColor *v4;

  if (a3)
  {
    if (a3 != 1)
    {
      v4 = 0;
      return v4;
    }
    v3 = 0.0;
  }
  else
  {
    v3 = 0.3;
  }
  v4 = -[CNMemojiBackgroundColor initWithRed:green:blue:alpha:]([CNMemojiBackgroundColor alloc], "initWithRed:green:blue:alpha:", 255.0, 255.0, 255.0, v3);
  return v4;
}

- (double)locationForColorAtIndex:(int64_t)a3 forLayer:(int64_t)a4
{
  BOOL v4;
  double result;

  v4 = a4 == 2 && a3 == 1;
  result = 0.0;
  if (v4)
    return 1.0;
  return result;
}

- (CGPoint)startPointForLayerAtIndex:(int64_t)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = 0.5;
  v4 = 0.0;
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)endPointForLayerAtIndex:(int64_t)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = 0.5;
  v4 = 1.0;
  result.y = v4;
  result.x = v3;
  return result;
}

- (id)description
{
  void *v3;
  int64_t v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNMemojiBackgroundParameters numberOfLayers](self, "numberOfLayers") >= 1)
  {
    v4 = 0;
    do
    {
      if (-[CNMemojiBackgroundParameters numberOfColorsForLayer:](self, "numberOfColorsForLayer:", v4) >= 1)
      {
        v5 = 0;
        do
        {
          -[CNMemojiBackgroundParameters colorAtIndex:forLayer:](self, "colorAtIndex:forLayer:", v5, v4);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Layer %ld Color %ld"), v4, v5);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v6, "red");
          v10 = v9;
          objc_msgSend(v6, "green");
          v12 = v11;
          objc_msgSend(v6, "blue");
          v14 = v13;
          objc_msgSend(v6, "alpha");
          objc_msgSend(v8, "stringWithFormat:", CFSTR("%f, %f, %f, %f"), v10, v12, v14, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (id)objc_msgSend(v3, "appendObject:withName:", v16, v7);

          ++v5;
        }
        while (v5 < -[CNMemojiBackgroundParameters numberOfColorsForLayer:](self, "numberOfColorsForLayer:", v4));
      }
      ++v4;
    }
    while (v4 < -[CNMemojiBackgroundParameters numberOfLayers](self, "numberOfLayers"));
  }
  objc_msgSend(v3, "build");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (CNMemojiBackgroundColor)contentColor
{
  return self->_contentColor;
}

- (void)setContentColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentColor, 0);
}

@end
