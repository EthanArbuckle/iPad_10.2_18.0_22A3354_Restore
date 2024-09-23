@implementation NSLayoutDimension

- (BOOL)isCompatibleWithAnchor:(id)a3
{
  char isKindOfClass;

  if (a3)
    isKindOfClass = objc_opt_isKindOfClass();
  else
    isKindOfClass = 1;
  return isKindOfClass & 1;
}

- (BOOL)validateOtherAttribute:(int64_t)a3
{
  return (a3 > 0x25) | (0xFFE00180uLL >> a3) & 1;
}

- (NSLayoutConstraint)constraintEqualToConstant:(CGFloat)c
{
  return +[NSLayoutConstraint constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:](NSLayoutConstraint, "constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:", self, 0, 0, 1.0, c);
}

- (NSLayoutConstraint)constraintGreaterThanOrEqualToConstant:(CGFloat)c
{
  return +[NSLayoutConstraint constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:](NSLayoutConstraint, "constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:", self, 1, 0, 1.0, c);
}

- (NSLayoutConstraint)constraintLessThanOrEqualToConstant:(CGFloat)c
{
  return +[NSLayoutConstraint constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:](NSLayoutConstraint, "constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:", self, -1, 0, 1.0, c);
}

- (NSLayoutConstraint)constraintEqualToAnchor:(NSLayoutDimension *)anchor multiplier:(CGFloat)m
{
  if (!anchor)
    _NSLayoutConstraintToNilAnchor();
  return +[NSLayoutConstraint constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:](NSLayoutConstraint, "constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:", self, 0, anchor, m, 0.0);
}

- (NSLayoutConstraint)constraintGreaterThanOrEqualToAnchor:(NSLayoutDimension *)anchor multiplier:(CGFloat)m
{
  if (!anchor)
    _NSLayoutConstraintToNilAnchor();
  return +[NSLayoutConstraint constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:](NSLayoutConstraint, "constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:", self, 1, anchor, m, 0.0);
}

- (NSLayoutConstraint)constraintLessThanOrEqualToAnchor:(NSLayoutDimension *)anchor multiplier:(CGFloat)m
{
  if (!anchor)
    _NSLayoutConstraintToNilAnchor();
  return +[NSLayoutConstraint constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:](NSLayoutConstraint, "constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:", self, -1, anchor, m, 0.0);
}

- (id)ruleEqualToConstant:(double)a3
{
  return -[NSLayoutAnchor ruleEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, 0, 0, 0.0, a3);
}

- (id)ruleLessThanOrEqualToConstant:(double)a3
{
  return -[NSLayoutAnchor ruleLessThanOrEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, 0, 0, 0.0, a3);
}

- (id)ruleGreaterThanOrEqualToConstant:(double)a3
{
  return -[NSLayoutAnchor ruleGreaterThanOrEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, 0, 0, 0.0, a3);
}

- (id)ruleEqualToConstant:(double)a3 priority:(float)a4 identifier:(id)a5
{
  return -[NSLayoutAnchor ruleEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, 0, a5, 0.0, a3);
}

- (id)ruleGreaterThanOrEqualToConstant:(double)a3 priority:(float)a4 identifier:(id)a5
{
  return -[NSLayoutAnchor ruleGreaterThanOrEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, 0, a5, 0.0, a3);
}

- (id)ruleLessThanOrEqualToConstant:(double)a3 priority:(float)a4 identifier:(id)a5
{
  return -[NSLayoutAnchor ruleLessThanOrEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, 0, a5, 0.0, a3);
}

- (id)anchorByMultiplyingByConstant:(double)a3
{
  return -[_NSArithmeticLayoutDimension initWithMultiplier:dimension:constant:]([_NSArithmeticLayoutDimension alloc], "initWithMultiplier:dimension:constant:", self, a3, 0.0);
}

- (id)anchorByAddingConstant:(double)a3
{
  return -[_NSArithmeticLayoutDimension initWithMultiplier:dimension:constant:]([_NSArithmeticLayoutDimension alloc], "initWithMultiplier:dimension:constant:", self, 1.0, a3);
}

- (id)anchorByAddingDimension:(id)a3
{
  return -[_NSCompositeLayoutDimension initWithDimension:plusDimension:]([_NSCompositeLayoutDimension alloc], "initWithDimension:plusDimension:", self, a3);
}

- (id)anchorBySubtractingDimension:(id)a3
{
  return -[_NSCompositeLayoutDimension initWithDimension:plusDimension:times:]([_NSCompositeLayoutDimension alloc], "initWithDimension:plusDimension:times:", self, a3, -1.0);
}

- (NSLayoutConstraint)constraintEqualToAnchor:(NSLayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c
{
  if (!anchor)
    _NSLayoutConstraintToNilAnchor();
  return +[NSLayoutConstraint constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:](NSLayoutConstraint, "constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:", self, 0, anchor, m, c);
}

- (NSLayoutConstraint)constraintGreaterThanOrEqualToAnchor:(NSLayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c
{
  if (!anchor)
    _NSLayoutConstraintToNilAnchor();
  return +[NSLayoutConstraint constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:](NSLayoutConstraint, "constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:", self, 1, anchor, m, c);
}

- (NSLayoutConstraint)constraintLessThanOrEqualToAnchor:(NSLayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c
{
  if (!anchor)
    _NSLayoutConstraintToNilAnchor();
  return +[NSLayoutConstraint constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:](NSLayoutConstraint, "constraintWithAnchor:relatedBy:toAnchor:multiplier:constant:", self, -1, anchor, m, c);
}

@end
