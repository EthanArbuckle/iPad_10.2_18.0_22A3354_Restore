@implementation FIUIChartAxisLabel

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Text: %@, Location: %@, Color: %@"), self->_text, self->_location, self->_labelColor);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (id)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong(&self->_location, a3);
}

- (BOOL)useReversePlacement
{
  return self->_useReversePlacement;
}

- (void)setUseReversePlacement:(BOOL)a3
{
  self->_useReversePlacement = a3;
}

- (UIColor)labelColor
{
  return self->_labelColor;
}

- (void)setLabelColor:(id)a3
{
  objc_storeStrong((id *)&self->_labelColor, a3);
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void)setShadowColor:(id)a3
{
  self->_shadowColor = (UIColor *)a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelColor, 0);
  objc_storeStrong(&self->_location, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
