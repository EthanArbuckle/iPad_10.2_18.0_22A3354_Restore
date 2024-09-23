@implementation DNDContactHandle(DNDSEventBehaviorEvolver)

- (BOOL)isPopulated
{
  void *v2;
  _BOOL8 v3;
  void *v4;

  objc_msgSend(a1, "contactIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "length") != 0;

  }
  return v3;
}

@end
