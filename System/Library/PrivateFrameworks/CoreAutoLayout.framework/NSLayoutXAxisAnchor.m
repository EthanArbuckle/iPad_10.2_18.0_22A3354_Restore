@implementation NSLayoutXAxisAnchor

- (BOOL)_validateOtherXAxisAnchorDirectionAbstraction:(int64_t)a3
{
  int64_t v6;

  if (-[NSLayoutXAxisAnchor _directionAbstraction](self, "_directionAbstraction") == a3)
    return 1;
  v6 = -[NSLayoutXAxisAnchor _directionAbstraction](self, "_directionAbstraction");
  return a3 == 2 || v6 == 2;
}

- (int64_t)_directionAbstraction
{
  int64_t v4;
  unsigned int v5;

  v4 = -[NSLayoutAnchor _anchorType](self, "_anchorType");
  if (!v4)
  {
    return -1;
  }
  if (v4 == 2)
  {
    v5 = -[NSLayoutAnchor _proxiedAttribute](self, "_proxiedAttribute");
    if (v5 > 0x24)
      return -1;
    if (((1 << v5) & 0x1500006006) != 0)
      return 1;
    if (((1 << v5) & 0x60060) != 0)
      return 0;
    if (((1 << v5) & 0x80200) == 0)
      return -1;
  }
  return 2;
}

- (BOOL)isCompatibleWithAnchor:(id)a3
{
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[NSLayoutXAxisAnchor _validateOtherXAxisAnchorDirectionAbstraction:](self, "_validateOtherXAxisAnchorDirectionAbstraction:", objc_msgSend(a3, "_directionAbstraction"));
}

- (NSLayoutConstraint)constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:(NSLayoutXAxisAnchor *)anchor multiplier:(CGFloat)multiplier
{
  return (NSLayoutConstraint *)+[NSLayoutConstraint _constraintWithAnchor:relatedBy:toAnchor:withSystemSpacingMultipliedBy:](multiplier, (uint64_t)NSLayoutConstraint, self, 1, anchor);
}

- (NSLayoutConstraint)constraintEqualToSystemSpacingAfterAnchor:(NSLayoutXAxisAnchor *)anchor multiplier:(CGFloat)multiplier
{
  return (NSLayoutConstraint *)+[NSLayoutConstraint _constraintWithAnchor:relatedBy:toAnchor:withSystemSpacingMultipliedBy:](multiplier, (uint64_t)NSLayoutConstraint, self, 0, anchor);
}

- (NSLayoutDimension)anchorWithOffsetToAnchor:(NSLayoutXAxisAnchor *)otherAnchor
{
  return (NSLayoutDimension *)+[_NSDistanceLayoutDimension distanceFromAnchor:toAnchor:](_NSDistanceLayoutDimension, "distanceFromAnchor:toAnchor:", self, otherAnchor);
}

- (id)anchorByOffsettingWithDimension:(id)a3
{
  return -[NSLayoutXAxisAnchor anchorByOffsettingWithDimension:multiplier:constant:](self, "anchorByOffsettingWithDimension:multiplier:constant:", a3, 1.0, 0.0);
}

- (id)anchorByOffsettingWithDimension:(id)a3 multiplier:(double)a4 constant:(double)a5
{
  return -[_NSCompositeLayoutXAxisAnchor initWithAnchor:plusDimension:times:plus:]([_NSCompositeLayoutXAxisAnchor alloc], "initWithAnchor:plusDimension:times:plus:", self, a3, a4, a5);
}

- (id)anchorByOffsettingWithConstant:(double)a3
{
  return -[_NSCompositeLayoutXAxisAnchor initWithAnchor:plusDimension:times:plus:]([_NSCompositeLayoutXAxisAnchor alloc], "initWithAnchor:plusDimension:times:plus:", self, 0, 0.0, a3);
}

- (NSLayoutConstraint)constraintLessThanOrEqualToSystemSpacingAfterAnchor:(NSLayoutXAxisAnchor *)anchor multiplier:(CGFloat)multiplier
{
  return (NSLayoutConstraint *)+[NSLayoutConstraint _constraintWithAnchor:relatedBy:toAnchor:withSystemSpacingMultipliedBy:](multiplier, (uint64_t)NSLayoutConstraint, self, -1, anchor);
}

- (BOOL)validateOtherAttribute:(int64_t)a3
{
  uint64_t v3;

  if (a3 > 0x24 || ((1 << a3) & 0x15000E6266) == 0)
    return 0;
  if (((1 << a3) & 0x1500006006) != 0)
  {
    v3 = 1;
  }
  else if (((1 << a3) & 0x60060) != 0)
  {
    v3 = 0;
  }
  else if (((1 << a3) & 0x80200) != 0)
  {
    v3 = 2;
  }
  else
  {
    v3 = -1;
  }
  return -[NSLayoutXAxisAnchor _validateOtherXAxisAnchorDirectionAbstraction:](self, "_validateOtherXAxisAnchorDirectionAbstraction:", v3);
}

@end
