@implementation LPCaptionButtonCollapsedPresentationProperties

- (LPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (double)layoutRatioThreshold
{
  return self->_layoutRatioThreshold;
}

- (void)setLayoutRatioThreshold:(double)a3
{
  self->_layoutRatioThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

@end
