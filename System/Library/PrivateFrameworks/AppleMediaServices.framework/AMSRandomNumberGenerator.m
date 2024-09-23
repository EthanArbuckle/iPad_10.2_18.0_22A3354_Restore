@implementation AMSRandomNumberGenerator

+ (void)initialize
{
  uint32_t v2;

  if ((id)objc_opt_class() == a1)
  {
    v2 = arc4random();
    srand48(v2);
  }
}

+ (void)reSeedNormalizedRandomDoubleGeneratorWithValue:(int64_t)a3
{
  srand48(a3);
}

@end
