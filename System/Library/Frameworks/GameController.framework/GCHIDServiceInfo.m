@implementation GCHIDServiceInfo

- (id)mfiControllerCapabilities
{
  void *v2;

  if (a1)
  {
    objc_getAssociatedObject(a1, "MFiControllerCapabilities");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      v2 = -[_GCMFiControllerCapabilites initWithServiceInfo:]((char *)[_GCMFiControllerCapabilites alloc], a1);
      objc_setAssociatedObject(a1, "MFiControllerCapabilities", v2, (void *)0x301);
    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end
