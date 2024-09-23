@implementation NSDate(BSTimeUtilities)

- (BOOL)isBeforeDate:()BSTimeUtilities
{
  id v4;
  _BOOL8 v5;

  v4 = a3;
  if (v4)
    v5 = objc_msgSend(a1, "compare:", v4) == -1;
  else
    v5 = 0;

  return v5;
}

- (BOOL)isAfterDate:()BSTimeUtilities
{
  id v4;
  _BOOL8 v5;

  v4 = a3;
  if (v4)
    v5 = objc_msgSend(a1, "compare:", v4) == 1;
  else
    v5 = 0;

  return v5;
}

@end
