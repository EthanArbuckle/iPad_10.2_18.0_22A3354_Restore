@implementation _MURatingCellItem

- (double)preferredWidth
{
  return self->_preferredWidth;
}

- (void)setPreferredWidth:(double)a3
{
  self->_preferredWidth = a3;
}

- (BOOL)shouldApplyWidthConstraint
{
  return self->_shouldApplyWidthConstraint;
}

- (void)setShouldApplyWidthConstraint:(BOOL)a3
{
  self->_shouldApplyWidthConstraint = a3;
}

- (UIView)ratingView
{
  return self->_ratingView;
}

- (void)setRatingView:(id)a3
{
  objc_storeStrong((id *)&self->_ratingView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingView, 0);
}

@end
