@implementation NSLayoutYAxisAnchor

- (BOOL)isCompatibleWithAnchor:(id)a3
{
  return objc_opt_isKindOfClass() & 1;
}

- (NSLayoutConstraint)constraintEqualToSystemSpacingBelowAnchor:(NSLayoutYAxisAnchor *)anchor multiplier:(CGFloat)multiplier
{
  return (NSLayoutConstraint *)+[NSLayoutConstraint _constraintWithAnchor:relatedBy:toAnchor:withSystemSpacingMultipliedBy:](multiplier, (uint64_t)NSLayoutConstraint, self, 0, anchor);
}

- (NSLayoutConstraint)constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:(NSLayoutYAxisAnchor *)anchor multiplier:(CGFloat)multiplier
{
  return (NSLayoutConstraint *)+[NSLayoutConstraint _constraintWithAnchor:relatedBy:toAnchor:withSystemSpacingMultipliedBy:](multiplier, (uint64_t)NSLayoutConstraint, self, 1, anchor);
}

- (NSLayoutDimension)anchorWithOffsetToAnchor:(NSLayoutYAxisAnchor *)otherAnchor
{
  return (NSLayoutDimension *)+[_NSDistanceLayoutDimension distanceFromAnchor:toAnchor:](_NSDistanceLayoutDimension, "distanceFromAnchor:toAnchor:", self, otherAnchor);
}

- (id)anchorByOffsettingWithDimension:(id)a3
{
  return -[NSLayoutYAxisAnchor anchorByOffsettingWithDimension:multiplier:constant:](self, "anchorByOffsettingWithDimension:multiplier:constant:", a3, 1.0, 0.0);
}

- (id)anchorByOffsettingWithDimension:(id)a3 multiplier:(double)a4 constant:(double)a5
{
  return -[_NSCompositeLayoutYAxisAnchor initWithAnchor:plusDimension:times:plus:]([_NSCompositeLayoutYAxisAnchor alloc], "initWithAnchor:plusDimension:times:plus:", self, a3, a4, a5);
}

- (id)anchorByOffsettingWithConstant:(double)a3
{
  return -[_NSCompositeLayoutYAxisAnchor initWithAnchor:plusDimension:times:plus:]([_NSCompositeLayoutYAxisAnchor alloc], "initWithAnchor:plusDimension:times:plus:", self, 0, 0.0, a3);
}

- (NSLayoutConstraint)constraintLessThanOrEqualToSystemSpacingBelowAnchor:(NSLayoutYAxisAnchor *)anchor multiplier:(CGFloat)multiplier
{
  return (NSLayoutConstraint *)+[NSLayoutConstraint _constraintWithAnchor:relatedBy:toAnchor:withSystemSpacingMultipliedBy:](multiplier, (uint64_t)NSLayoutConstraint, self, -1, anchor);
}

- (BOOL)validateOtherAttribute:(int64_t)a3
{
  unint64_t v3;
  BOOL v4;

  v3 = (0x3F001FFE7FuLL >> a3) & 1;
  if (a3 > 0x25)
    LOBYTE(v3) = 0;
  if (((1 << a3) & 0x2A00119D19) != 0)
    v4 = v3;
  else
    v4 = 0;
  return a3 <= 0x25 && v4;
}

@end
