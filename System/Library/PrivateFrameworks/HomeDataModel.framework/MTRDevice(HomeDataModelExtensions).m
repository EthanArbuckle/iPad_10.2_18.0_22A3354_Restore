@implementation MTRDevice(HomeDataModelExtensions)

- (id)hdm_containingHome
{
  void *v2;
  void *v3;
  id v4;

  objc_getAssociatedObject(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)setHdm_containingHome:()HomeDataModelExtensions
{
  objc_setAssociatedObject(a1, sel_hdm_containingHome, a3, 0);
}

- (id)initForTestingWithClusterID:()HomeDataModelExtensions
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&off_256D9E268;
  return objc_msgSendSuper2(&v2, sel_init);
}

@end
