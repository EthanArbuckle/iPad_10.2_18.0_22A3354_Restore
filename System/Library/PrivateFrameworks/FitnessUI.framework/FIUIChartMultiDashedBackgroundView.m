@implementation FIUIChartMultiDashedBackgroundView

- (FIUIChartMultiDashedBackgroundView)initWithFrame:(CGRect)a3
{
  FIUIChartMultiDashedBackgroundView *v3;
  uint64_t v4;
  UIColor *lineColor;
  uint64_t v6;
  UIColor *subLineColor;
  UIImageView *v8;
  UIImageView *imageView;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FIUIChartMultiDashedBackgroundView;
  v3 = -[FIUIChartBackgroundView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 1.0, 0.15);
    v4 = objc_claimAutoreleasedReturnValue();
    lineColor = v3->_lineColor;
    v3->_lineColor = (UIColor *)v4;

    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 1.0, 0.1);
    v6 = objc_claimAutoreleasedReturnValue();
    subLineColor = v3->_subLineColor;
    v3->_subLineColor = (UIColor *)v6;

    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    imageView = v3->_imageView;
    v3->_imageView = v8;

    -[FIUIChartMultiDashedBackgroundView addSubview:](v3, "addSubview:", v3->_imageView);
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
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
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)FIUIChartMultiDashedBackgroundView;
  -[FIUIChartMultiDashedBackgroundView layoutSubviews](&v18, sel_layoutSubviews);
  -[FIUIChartMultiDashedBackgroundView frame](self, "frame");
  if (v3 != self->_previousWidth)
  {
    -[FIUIChartMultiDashedBackgroundView frame](self, "frame");
    self->_previousWidth = v4;
    -[FIUIChartMultiDashedBackgroundView _stretchableLinesPatternImage](self, "_stretchableLinesPatternImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_imageView, "setImage:", v5);

  }
  -[FIUIChartMultiDashedBackgroundView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[FIUIChartBackgroundView lineInsets](self, "lineInsets");
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v7 + v17, v9 + v14, v11 - (v17 + v15), v13 - (v14 + v16));
}

- (void)_setNeedsRegenerateBackgroundImage
{
  self->_previousWidth = 0.0;
  -[FIUIChartMultiDashedBackgroundView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setBackgroundIsTransparent:(BOOL)a3
{
  self->_backgroundIsTransparent = a3;
  -[UIImageView setOpaque:](self->_imageView, "setOpaque:", !a3);
  -[FIUIChartMultiDashedBackgroundView _setNeedsRegenerateBackgroundImage](self, "_setNeedsRegenerateBackgroundImage");
}

- (void)setNumLines:(unint64_t)a3
{
  self->_numLines = a3;
  -[FIUIChartMultiDashedBackgroundView _setNeedsRegenerateBackgroundImage](self, "_setNeedsRegenerateBackgroundImage");
}

- (void)setSublineInterval:(unint64_t)a3
{
  self->_sublineInterval = a3;
  -[FIUIChartMultiDashedBackgroundView _setNeedsRegenerateBackgroundImage](self, "_setNeedsRegenerateBackgroundImage");
}

- (void)setSublineInset:(double)a3
{
  self->_sublineInset = a3;
  -[FIUIChartMultiDashedBackgroundView _setNeedsRegenerateBackgroundImage](self, "_setNeedsRegenerateBackgroundImage");
}

- (id)_stretchableLinesPatternImage
{
  double v3;
  double v4;
  double sublineInset;
  double v6;
  CGFloat v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  CGContext *CurrentContext;
  void *v13;
  unint64_t numLines;
  unint64_t v15;
  unint64_t sublineInterval;
  unint64_t v17;
  unint64_t v18;
  BOOL v19;
  int *v20;
  CGFloat v21;
  void *v22;
  float v23;
  CGFloat v24;
  void *v25;
  CGSize v27;
  CGRect v28;
  CGRect v29;

  UIRoundToViewScale();
  v4 = v3;
  sublineInset = self->_sublineInset;
  UIRoundToViewScale();
  v7 = v6;
  -[FIUIChartMultiDashedBackgroundView bounds](self, "bounds");
  v9 = 0;
  if (v8 != 0.0)
  {
    v10 = v4 + sublineInset;
    if (v10 != 0.0)
    {
      v11 = v8;
      v27.width = v8;
      v27.height = v10;
      UIGraphicsBeginImageContextWithOptions(v27, !self->_backgroundIsTransparent, 0.0);
      if (self->_backgroundIsTransparent)
      {
        CurrentContext = UIGraphicsGetCurrentContext();
        -[FIUIChartMultiDashedBackgroundView bounds](self, "bounds");
        CGContextClearRect(CurrentContext, v28);
      }
      objc_msgSend((id)objc_opt_class(), "calculateRoundedLinePositionsForTotalWidth:lineWidth:numberOfLines:roundedInView:", self->_numLines, self, v11, self->_lineWidth);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      numLines = self->_numLines;
      if (numLines)
      {
        v15 = 0;
        do
        {
          sublineInterval = self->_sublineInterval;
          if (sublineInterval)
          {
            v17 = v15 % (sublineInterval + 1);
            v18 = v15 + 1;
            v19 = v15 + 1 == numLines || v17 == 0;
            if (v19)
              v20 = &OBJC_IVAR___FIUIChartMultiDashedBackgroundView__lineColor;
            else
              v20 = &OBJC_IVAR___FIUIChartMultiDashedBackgroundView__subLineColor;
            if (v19)
              v21 = v10;
            else
              v21 = v4;
          }
          else
          {
            v18 = v15 + 1;
            v20 = &OBJC_IVAR___FIUIChartMultiDashedBackgroundView__lineColor;
            v21 = v10;
          }
          objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v20), "setFill");
          objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "floatValue");
          v24 = v23;

          v29.origin.y = 0.0;
          v29.origin.x = v24;
          v29.size.width = v7;
          v29.size.height = v21;
          UIRectFill(v29);
          numLines = self->_numLines;
          v15 = v18;
        }
        while (v18 < numLines);
      }
      UIGraphicsGetImageFromCurrentImageContext();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      UIGraphicsEndImageContext();
      objc_msgSend(v25, "resizableImageWithCapInsets:", 0.0, 0.0, self->_sublineInset, 0.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v9;
}

+ (id)calculateRoundedLinePositionsForTotalWidth:(double)a3 lineWidth:(double)a4 numberOfLines:(unint64_t)a5 roundedInView:(id)a6
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v7 = a6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    v9 = 0;
    do
    {
      UIRoundToViewScale();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v10);

      ++v9;
    }
    while (a5 != v9);
  }

  return v8;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (double)sublineInset
{
  return self->_sublineInset;
}

- (unint64_t)numLines
{
  return self->_numLines;
}

- (unint64_t)sublineInterval
{
  return self->_sublineInterval;
}

- (BOOL)backgroundIsTransparent
{
  return self->_backgroundIsTransparent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subLineColor, 0);
  objc_storeStrong((id *)&self->_lineColor, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
