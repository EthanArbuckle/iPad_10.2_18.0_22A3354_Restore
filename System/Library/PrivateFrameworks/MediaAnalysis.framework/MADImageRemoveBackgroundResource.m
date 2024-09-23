@implementation MADImageRemoveBackgroundResource

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
  objc_msgSend(v2, "sharedInstanceWithIdentifier:andCreationBlock:", v4, &__block_literal_global_98);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

MADImageRemoveBackgroundResource *__50__MADImageRemoveBackgroundResource_sharedResource__block_invoke()
{
  return objc_alloc_init(MADImageRemoveBackgroundResource);
}

- (int64_t)activeCost
{
  if (!DeviceHasANE())
    return 100;
  if (self->_maskOnly)
    return 50;
  return 100;
}

- (int64_t)inactiveCost
{
  if (!DeviceHasANE())
    return 100;
  if (self->_maskOnly)
    return 10;
  return 15;
}

- (void)purge
{
  MADRemoveBackgroundCachedMaskState *cachedMaskState;
  objc_super v4;

  cachedMaskState = self->_cachedMaskState;
  self->_cachedMaskState = 0;

  v4.receiver = self;
  v4.super_class = (Class)MADImageRemoveBackgroundResource;
  -[VCPMADVisionResource purge](&v4, sel_purge);
}

- (BOOL)maskOnly
{
  return self->_maskOnly;
}

- (void)setMaskOnly:(BOOL)a3
{
  self->_maskOnly = a3;
}

- (MADRemoveBackgroundCachedMaskState)cachedMaskState
{
  return self->_cachedMaskState;
}

- (void)setCachedMaskState:(id)a3
{
  objc_storeStrong((id *)&self->_cachedMaskState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedMaskState, 0);
}

@end
