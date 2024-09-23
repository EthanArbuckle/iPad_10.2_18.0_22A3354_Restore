@implementation NSLayoutConstraint(_QLUtilities)

- (void)ql_activatedConstraint
{
  objc_msgSend(a1, "setActive:", 1);
  return a1;
}

@end
