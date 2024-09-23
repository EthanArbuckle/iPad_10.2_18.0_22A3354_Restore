@implementation NSNumber(FCAdditions)

- (id)fc_smallerNumber:()FCAdditions
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (objc_msgSend(a1, "compare:", v4) == 1)
    v5 = v4;
  else
    v5 = a1;
  v6 = v5;

  return v6;
}

- (id)fc_largerNumber:()FCAdditions
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (objc_msgSend(a1, "compare:", v4) == -1)
    v5 = v4;
  else
    v5 = a1;
  v6 = v5;

  return v6;
}

- (BOOL)fc_isLessThan:()FCAdditions
{
  return objc_msgSend(a1, "compare:") == -1;
}

- (uint64_t)fc_isLessThanOrEqualTo:()FCAdditions
{
  return objc_msgSend(a1, "fc_isGreaterThan:") ^ 1;
}

- (BOOL)fc_isGreaterThan:()FCAdditions
{
  return objc_msgSend(a1, "compare:") == 1;
}

@end
