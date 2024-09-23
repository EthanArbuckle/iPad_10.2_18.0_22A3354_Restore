@implementation CLLocation(FuzzyMatch)

- (BOOL)atx_isFuzzyMatch:()FuzzyMatch
{
  id v4;
  _BOOL8 v5;
  double v6;

  v4 = a3;
  if ((objc_msgSend(a1, "isEqual:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "distanceFromLocation:", v4);
      v5 = v6 < 5.0;
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

@end
