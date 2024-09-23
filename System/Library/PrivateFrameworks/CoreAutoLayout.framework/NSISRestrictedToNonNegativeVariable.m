@implementation NSISRestrictedToNonNegativeVariable

- (int)valueRestriction
{
  return 1;
}

- (BOOL)shouldBeMinimized
{
  return 0;
}

- (id)markedConstraint
{
  return 0;
}

@end
