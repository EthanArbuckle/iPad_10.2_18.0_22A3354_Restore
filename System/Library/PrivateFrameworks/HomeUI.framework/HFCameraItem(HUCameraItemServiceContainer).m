@implementation HFCameraItem(HUCameraItemServiceContainer)

- (id)hu_containedServices
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hf_visibleServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)hu_containedAccessories
{
  return objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

@end
