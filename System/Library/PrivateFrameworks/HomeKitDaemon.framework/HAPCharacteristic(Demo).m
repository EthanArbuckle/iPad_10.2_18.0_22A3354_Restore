@implementation HAPCharacteristic(Demo)

- (id)responseDelay
{
  void *v1;
  void *v2;
  id v3;

  objc_getAssociatedObject(a1, "responseDelay");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (void)setResponseDelay:()Demo
{
  objc_setAssociatedObject(a1, "responseDelay", a3, (void *)3);
}

@end
