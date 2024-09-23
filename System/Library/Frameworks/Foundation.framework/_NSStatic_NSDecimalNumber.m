@implementation _NSStatic_NSDecimalNumber

- (unint64_t)retainCount
{
  return -1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

@end
