@implementation UIFont

- (double)cuik_lineHeight
{
  double result;

  if (!a1)
    return 0.0;
  objc_msgSend(a1, "lineHeight");
  return result;
}

@end
