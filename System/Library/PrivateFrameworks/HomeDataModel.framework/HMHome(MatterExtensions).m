@implementation HMHome(MatterExtensions)

- (id)hdm_sharedMatterController
{
  void *v4;
  void *v5;
  void *v6;

  objc_getAssociatedObject(a1, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v4;
  if (!v5)
  {
    objc_msgSend(a1, "hdm_createMatterController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      NSLog(CFSTR("Failed to create MTRDeviceController for home %@"), a1);
    objc_setAssociatedObject(a1, a2, v6, (void *)1);
  }

  return v6;
}

@end
