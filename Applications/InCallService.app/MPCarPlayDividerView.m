@implementation MPCarPlayDividerView

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 50.0;
  v3 = 1.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (NSLayoutConstraint)horizontalPositioningConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 8, 1);
}

- (void)setHorizontalPositioningConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalPositioningConstraint, 0);
}

@end
