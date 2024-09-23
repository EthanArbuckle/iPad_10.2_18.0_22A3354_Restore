@implementation VCPMADVISceneClassificationResource

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
  objc_msgSend(v2, "sharedInstanceWithIdentifier:andCreationBlock:", v4, &__block_literal_global_32);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

VCPMADVISceneClassificationResource *__53__VCPMADVISceneClassificationResource_sharedResource__block_invoke()
{
  return objc_alloc_init(VCPMADVISceneClassificationResource);
}

- (int64_t)activeCost
{
  if (DeviceHasANE())
    return 75;
  else
    return 100;
}

- (int64_t)inactiveCost
{
  if (DeviceHasANE())
    return 35;
  else
    return 100;
}

@end
