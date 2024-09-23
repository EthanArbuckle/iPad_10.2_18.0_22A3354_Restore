@implementation _NSUndoEndMark

- (BOOL)isEndMark
{
  return 1;
}

- (id)description
{
  return CFSTR("endUndoGrouping");
}

@end
