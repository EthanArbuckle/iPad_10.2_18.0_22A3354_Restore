@implementation ICIAMMessageRule(Utilities)

- (BOOL)isExactMatchRule
{
  _BOOL8 v2;
  void *v3;
  void *v4;

  if (objc_msgSend(a1, "type"))
    return 0;
  objc_msgSend(a1, "triggerCondition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "comparisonType"))
  {
    objc_msgSend(a1, "triggerCondition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v4, "comparisonType") == 1;

  }
  else
  {
    v2 = 1;
  }

  return v2;
}

@end
