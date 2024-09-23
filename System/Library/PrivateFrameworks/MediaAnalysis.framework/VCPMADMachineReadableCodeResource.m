@implementation VCPMADMachineReadableCodeResource

+ (id)sharedResource
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedInstanceWithIdentifier:andCreationBlock:", v4, &__block_literal_global_38);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

VCPMADMachineReadableCodeResource *__51__VCPMADMachineReadableCodeResource_sharedResource__block_invoke()
{
  return objc_alloc_init(VCPMADMachineReadableCodeResource);
}

- (int64_t)activeCost
{
  if (DeviceHasANE())
    return 30;
  else
    return 100;
}

- (int64_t)inactiveCost
{
  if (DeviceHasANE())
    return 5;
  else
    return 100;
}

@end
