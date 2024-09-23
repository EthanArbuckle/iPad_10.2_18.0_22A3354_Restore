@implementation LSBundleRecord(DOCExtensions)

- (id)fpui_containingApplicationRecord
{
  id v1;
  void *v2;
  id v3;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "containingBundleRecord");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
