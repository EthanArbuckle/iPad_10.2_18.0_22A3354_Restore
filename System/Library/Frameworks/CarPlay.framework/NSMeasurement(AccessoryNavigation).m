@implementation NSMeasurement(AccessoryNavigation)

- (uint64_t)accNav_safeToBeConvertedToUnit:()AccessoryNavigation
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a1, "unit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {

  }
  else
  {
    objc_msgSend(a1, "unit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v8 = 0;
      goto LABEL_6;
    }
  }
  v8 = objc_msgSend(a1, "canBeConvertedToUnit:", v4);
LABEL_6:

  return v8;
}

@end
