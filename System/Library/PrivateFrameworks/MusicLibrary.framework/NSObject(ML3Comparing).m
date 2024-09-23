@implementation NSObject(ML3Comparing)

- (uint64_t)ml_matchesValue:()ML3Comparing usingComparison:
{
  id v6;
  uint64_t v7;

  v6 = a3;
  if (a4 == 2)
  {
    v7 = objc_msgSend(a1, "isEqual:", v6) ^ 1;
  }
  else if (a4 == 1)
  {
    v7 = objc_msgSend(a1, "isEqual:", v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
