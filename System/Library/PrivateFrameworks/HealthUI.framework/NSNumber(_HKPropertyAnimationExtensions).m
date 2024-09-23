@implementation NSNumber(_HKPropertyAnimationExtensions)

- (uint64_t)hk_animatable
{
  return 1;
}

- (uint64_t)hk_midPointToValue:()_HKPropertyAnimationExtensions percentage:
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v6 = a4;
  objc_msgSend(a1, "doubleValue");
  v8 = v7;
  objc_msgSend(v6, "doubleValue");
  v10 = v9;

  v11 = fmax(a2, 0.0);
  if (v11 > 1.0)
    v11 = 1.0;
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8 + v11 * (v10 - v8));
}

@end
