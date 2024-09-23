@implementation CKLinkCustomizationTransitionContext

- (double)sourceViewDownscaleMultiplier
{
  return self->_sourceViewDownscaleMultiplier;
}

- (void)setSourceViewDownscaleMultiplier:(double)a3
{
  self->_sourceViewDownscaleMultiplier = a3;
}

- (double)maxWidthForSourceView
{
  return self->_maxWidthForSourceView;
}

- (void)setMaxWidthForSourceView:(double)a3
{
  self->_maxWidthForSourceView = a3;
}

- (double)maxHeightForSourceView
{
  return self->_maxHeightForSourceView;
}

- (void)setMaxHeightForSourceView:(double)a3
{
  self->_maxHeightForSourceView = a3;
}

- (CGPoint)preferredSourceRectAnchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_preferredSourceRectAnchorPoint.x;
  y = self->_preferredSourceRectAnchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPreferredSourceRectAnchorPoint:(CGPoint)a3
{
  self->_preferredSourceRectAnchorPoint = a3;
}

@end
