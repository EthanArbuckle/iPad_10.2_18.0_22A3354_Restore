@implementation CNRepeatingGradientSeparatorView

- (CNRepeatingGradientSeparatorView)initWithFrame:(CGRect)a3
{
  CNRepeatingGradientSeparatorView *v3;
  uint64_t v4;
  UIColor *startColor;
  uint64_t v6;
  UIColor *endColor;
  double v8;
  double v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNRepeatingGradientSeparatorView;
  v3 = -[CNRepeatingGradientSeparatorView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = objc_claimAutoreleasedReturnValue();
    startColor = v3->_startColor;
    v3->_startColor = (UIColor *)v4;

    +[CNUIColorRepository contactStyleDefaultSeparatorColor](CNUIColorRepository, "contactStyleDefaultSeparatorColor");
    v6 = objc_claimAutoreleasedReturnValue();
    endColor = v3->_endColor;
    v3->_endColor = (UIColor *)v6;

    LODWORD(v8) = 1148846080;
    -[CNRepeatingGradientSeparatorView setContentCompressionResistancePriority:forAxis:](v3, "setContentCompressionResistancePriority:forAxis:", 0, v8);
    LODWORD(v9) = 1148846080;
    -[CNRepeatingGradientSeparatorView setContentHuggingPriority:forAxis:](v3, "setContentHuggingPriority:forAxis:", 0, v9);
    -[CNRepeatingGradientSeparatorView setLineCount:](v3, "setLineCount:", 1);
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[CNRepeatingGradientSeparatorView _screen](self, "_screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  if (v3 == 0.0)
  {
    if (RoundToScale_onceToken != -1)
      dispatch_once(&RoundToScale_onceToken, &__block_literal_global_22_54747);
    v3 = *(double *)&RoundToScale___s;
  }
  v4 = 1.0;
  if (v3 != 1.0)
    v4 = round(v3 * 0.5) / v3;

  v5 = *MEMORY[0x1E0DC55F0];
  v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)setLineCount:(int64_t)a3
{
  if (self->_lineCount != a3)
  {
    self->_lineCount = a3;
    -[CNRepeatingGradientSeparatorView _updateGradients](self, "_updateGradients");
  }
}

- (void)_updateGradients
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[CNRepeatingGradientSeparatorView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sublayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "makeObjectsPerformSelector:", sel_removeFromSuperlayer);

  if (-[CNRepeatingGradientSeparatorView lineCount](self, "lineCount") >= 1)
  {
    v5 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CD2790], "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNRepeatingGradientSeparatorView gradientColors](self, "gradientColors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setColors:", v7);

      -[CNRepeatingGradientSeparatorView layer](self, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSublayer:", v6);

      ++v5;
    }
    while (v5 < -[CNRepeatingGradientSeparatorView lineCount](self, "lineCount"));
  }
  -[CNRepeatingGradientSeparatorView setNeedsLayout](self, "setNeedsLayout");
  -[CNRepeatingGradientSeparatorView layoutIfNeeded](self, "layoutIfNeeded");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;
  CGRect v18;

  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)CNRepeatingGradientSeparatorView;
  -[CNRepeatingGradientSeparatorView layoutSubviews](&v15, sel_layoutSubviews);
  -[CNRepeatingGradientSeparatorView bounds](self, "bounds");
  CGRectGetHeight(v18);
  -[CNRepeatingGradientSeparatorView lineCount](self, "lineCount");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CNRepeatingGradientSeparatorView layer](self, "layer", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sublayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        -[CNRepeatingGradientSeparatorView bounds](self, "bounds");
        objc_msgSend(v10, "setFrame:");
        ++v9;
      }
      while (v6 != v9);
      v7 += v9;
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v6);
  }

}

- (NSArray)gradientColors
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[CNRepeatingGradientSeparatorView startColor](self, "startColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7[0] = objc_msgSend(v3, "CGColor");
  -[CNRepeatingGradientSeparatorView endColor](self, "endColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7[1] = objc_msgSend(v4, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)setStartColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_startColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_startColor, a3);
    v5 = v6;
  }

}

- (void)setEndColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_endColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_endColor, a3);
    v5 = v6;
  }

}

- (UIColor)startColor
{
  return self->_startColor;
}

- (UIColor)endColor
{
  return self->_endColor;
}

- (int64_t)lineCount
{
  return self->_lineCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endColor, 0);
  objc_storeStrong((id *)&self->_startColor, 0);
}

@end
