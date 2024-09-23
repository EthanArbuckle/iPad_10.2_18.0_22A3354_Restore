@implementation NSISRestrictedToNonNegativeMarkerVariable

- (int)valueRestriction
{
  return 1;
}

- (BOOL)shouldBeMinimized
{
  return 0;
}

@end
