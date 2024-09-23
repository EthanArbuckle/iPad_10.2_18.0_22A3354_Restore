@implementation HMAccessory(MatterExtensions)

- (id)hdm_matterDevice
{
  void *v4;
  void *v5;
  void *v6;

  objc_getAssociatedObject(a1, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(a1, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hdm_sharedMatterController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "hdm_createDeviceWithController:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      NSLog(CFSTR("Failed to create matter device for accessory %@"), a1);
    objc_setAssociatedObject(a1, a2, v4, (void *)1);
  }
  return v4;
}

@end
