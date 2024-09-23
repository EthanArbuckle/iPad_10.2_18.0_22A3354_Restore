@implementation FIUIChartMinMaxValueAxisDescriptor

- (id)_axisLabelForValue:(id)a3 highlighted:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  FIUIChartAxisLabel *v7;
  void *v8;
  uint64_t v9;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init(FIUIChartAxisLabel);
  objc_msgSend(MEMORY[0x24BDD16F0], "localizedStringFromNumber:numberStyle:", v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIChartAxisLabel setText:](v7, "setText:", v8);

  v9 = 16;
  if (v4)
    v9 = 24;
  -[FIUIChartAxisLabel setLabelColor:](v7, "setLabelColor:", *(Class *)((char *)&self->super.isa + v9));
  -[FIUIChartAxisLabel setLocation:](v7, "setLocation:", v6);

  -[FIUIChartAxisLabel setShadowColor:](v7, "setShadowColor:", self->_shadowColor);
  -[FIUIChartAxisLabel setShadowOffset:](v7, "setShadowOffset:", self->_shadowOffset.width, self->_shadowOffset.height);
  -[FIUIChartAxisLabel setShadowBlur:](v7, "setShadowBlur:", self->_shadowBlur);
  return v7;
}

- (id)axisLabels
{
  void *v3;
  void *v4;
  NSNumber *highlightedValue;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIChartMinMaxValueAxisDescriptor _axisLabelForValue:highlighted:](self, "_axisLabelForValue:highlighted:", self->_minValue, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  highlightedValue = self->_highlightedValue;
  if (highlightedValue)
  {
    -[FIUIChartMinMaxValueAxisDescriptor _axisLabelForValue:highlighted:](self, "_axisLabelForValue:highlighted:", highlightedValue, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  -[FIUIChartMinMaxValueAxisDescriptor _axisLabelForValue:highlighted:](self, "_axisLabelForValue:highlighted:", self->_maxValue, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (Class)expectedDataType
{
  return (Class)objc_opt_class();
}

- (UIFont)labelFont
{
  return self->_labelFont;
}

- (void)setLabelFont:(id)a3
{
  objc_storeStrong((id *)&self->_labelFont, a3);
}

- (UIColor)unhighlightedLabelColor
{
  return self->_unhighlightedLabelColor;
}

- (void)setUnhighlightedLabelColor:(id)a3
{
  objc_storeStrong((id *)&self->_unhighlightedLabelColor, a3);
}

- (UIColor)highlightedLabelColor
{
  return self->_highlightedLabelColor;
}

- (void)setHighlightedLabelColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedLabelColor, a3);
}

- (double)axisDescriptorPadding
{
  return self->_axisDescriptorPadding;
}

- (void)setAxisDescriptorPadding:(double)a3
{
  self->_axisDescriptorPadding = a3;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void)setShadowColor:(id)a3
{
  objc_storeStrong((id *)&self->_shadowColor, a3);
}

- (CGSize)shadowOffset
{
  double width;
  double height;
  CGSize result;

  width = self->_shadowOffset.width;
  height = self->_shadowOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setShadowOffset:(CGSize)a3
{
  self->_shadowOffset = a3;
}

- (double)shadowBlur
{
  return self->_shadowBlur;
}

- (void)setShadowBlur:(double)a3
{
  self->_shadowBlur = a3;
}

- (NSNumber)minValue
{
  return self->_minValue;
}

- (void)setMinValue:(id)a3
{
  objc_storeStrong((id *)&self->_minValue, a3);
}

- (NSNumber)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(id)a3
{
  objc_storeStrong((id *)&self->_maxValue, a3);
}

- (NSNumber)highlightedValue
{
  return self->_highlightedValue;
}

- (void)setHighlightedValue:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedValue, 0);
  objc_storeStrong((id *)&self->_maxValue, 0);
  objc_storeStrong((id *)&self->_minValue, 0);
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_highlightedLabelColor, 0);
  objc_storeStrong((id *)&self->_unhighlightedLabelColor, 0);
  objc_storeStrong((id *)&self->_labelFont, 0);
}

@end
