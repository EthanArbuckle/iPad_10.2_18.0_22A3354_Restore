@implementation _NSStatic_NSUnitPressure

- (Class)_effectiveUnitClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)retainCount
{
  return -1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

@end
