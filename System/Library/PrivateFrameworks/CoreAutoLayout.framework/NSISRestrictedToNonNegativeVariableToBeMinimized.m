@implementation NSISRestrictedToNonNegativeVariableToBeMinimized

- (int)valueRestriction
{
  return 1;
}

- (BOOL)shouldBeMinimized
{
  return 1;
}

- (id)markedConstraint
{
  return 0;
}

@end
