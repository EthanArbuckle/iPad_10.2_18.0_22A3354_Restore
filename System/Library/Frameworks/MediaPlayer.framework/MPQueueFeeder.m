@implementation MPQueueFeeder

- (NSString)playActivityFeatureName
{
  return self->_playActivityFeatureName;
}

- (id)identifierRegistryWithExclusiveAccessReturningObject:(id)a3
{
  void (**v5)(id, MPQueueFeederIdentifierRegistry *);
  os_unfair_lock_s *p_identifierRegistryLock;
  void *v7;
  void *v9;

  v5 = (void (**)(id, MPQueueFeederIdentifierRegistry *))a3;
  if ((objc_msgSend((id)objc_opt_class(), "usesIdentifierRegistry") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPQueueFeeder.m"), 58, CFSTR("Invalid attempt to use identifierRegistry"));

  }
  p_identifierRegistryLock = &self->_identifierRegistryLock;
  os_unfair_lock_lock(&self->_identifierRegistryLock);
  v5[2](v5, self->_identifierRegistry);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_identifierRegistryLock);
  return v7;
}

- (int64_t)identifierRegistryWithExclusiveAccessReturningInteger:(id)a3
{
  uint64_t (**v5)(id, MPQueueFeederIdentifierRegistry *);
  os_unfair_lock_s *p_identifierRegistryLock;
  int64_t v7;
  void *v9;

  v5 = (uint64_t (**)(id, MPQueueFeederIdentifierRegistry *))a3;
  if ((objc_msgSend((id)objc_opt_class(), "usesIdentifierRegistry") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPQueueFeeder.m"), 74, CFSTR("Invalid attempt to use identifierRegistry"));

  }
  p_identifierRegistryLock = &self->_identifierRegistryLock;
  os_unfair_lock_lock(&self->_identifierRegistryLock);
  v7 = v5[2](v5, self->_identifierRegistry);

  os_unfair_lock_unlock(p_identifierRegistryLock);
  return v7;
}

- (void)setSiriWHAMetricsInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setSiriReferenceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setPlayActivityRecommendationData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setPlayActivityQueueGroupingID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setPlayActivityFeatureName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)replaceIdentifierRegistry:(id)a3
{
  MPQueueFeederIdentifierRegistry *v5;
  MPQueueFeederIdentifierRegistry *identifierRegistry;
  void *v7;

  v5 = (MPQueueFeederIdentifierRegistry *)a3;
  if ((objc_msgSend((id)objc_opt_class(), "usesIdentifierRegistry") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPQueueFeeder.m"), 44, CFSTR("Invalid attempt to use identifierRegistry"));

  }
  os_unfair_lock_lock(&self->_identifierRegistryLock);
  identifierRegistry = self->_identifierRegistry;
  self->_identifierRegistry = v5;

  os_unfair_lock_unlock(&self->_identifierRegistryLock);
}

- (void)identifierRegistryWithExclusiveAccess:(id)a3
{
  void (**v5)(id, MPQueueFeederIdentifierRegistry *);
  void *v6;

  v5 = (void (**)(id, MPQueueFeederIdentifierRegistry *))a3;
  if ((objc_msgSend((id)objc_opt_class(), "usesIdentifierRegistry") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPQueueFeeder.m"), 51, CFSTR("Invalid attempt to use identifierRegistry"));

  }
  os_unfair_lock_lock(&self->_identifierRegistryLock);
  v5[2](v5, self->_identifierRegistry);

  os_unfair_lock_unlock(&self->_identifierRegistryLock);
}

- (MPQueueFeeder)init
{
  MPQueueFeeder *v2;
  MPQueueFeederIdentifierRegistry *v3;
  MPQueueFeederIdentifierRegistry *identifierRegistry;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPQueueFeeder;
  v2 = -[MPQueueFeeder init](&v6, sel_init);
  if (v2 && objc_msgSend((id)objc_opt_class(), "usesIdentifierRegistry"))
  {
    v3 = objc_alloc_init(MPQueueFeederIdentifierRegistry);
    identifierRegistry = v2->_identifierRegistry;
    v2->_identifierRegistry = v3;

    v2->_identifierRegistryLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (BOOL)identifierRegistryWithExclusiveAccessReturningBOOL:(id)a3
{
  uint64_t (**v5)(id, MPQueueFeederIdentifierRegistry *);
  os_unfair_lock_s *p_identifierRegistryLock;
  char v7;
  void *v9;

  v5 = (uint64_t (**)(id, MPQueueFeederIdentifierRegistry *))a3;
  if ((objc_msgSend((id)objc_opt_class(), "usesIdentifierRegistry") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPQueueFeeder.m"), 66, CFSTR("Invalid attempt to use identifierRegistry"));

  }
  p_identifierRegistryLock = &self->_identifierRegistryLock;
  os_unfair_lock_lock(&self->_identifierRegistryLock);
  v7 = v5[2](v5, self->_identifierRegistry);

  os_unfair_lock_unlock(p_identifierRegistryLock);
  return v7;
}

- (int64_t)supplementalPlaybackContextBehavior
{
  return 0;
}

- (id)supplementalPlaybackContextWithReason:(int64_t)a3
{
  return 0;
}

- (void)getRepresentativeMetadataForPlaybackContext:(id)a3 properties:(id)a4 completion:(id)a5
{
  uint64_t v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;

  v7 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2);
  if (v7 == objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPQueueFeeder.m"), 90, CFSTR("Subclass %@ must implement -%@ defined in %@."), v9, v10, CFSTR("[MPQueueFeeder class]"));

  }
}

- (id)errorResolverForItem:(id)a3
{
  return 0;
}

- (id)firstModelPlayEvent
{
  return 0;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)playActivityQueueGroupingID
{
  return self->_playActivityQueueGroupingID;
}

- (NSData)playActivityRecommendationData
{
  return self->_playActivityRecommendationData;
}

- (NSString)siriReferenceIdentifier
{
  return self->_siriReferenceIdentifier;
}

- (NSDictionary)siriWHAMetricsInfo
{
  return self->_siriWHAMetricsInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriWHAMetricsInfo, 0);
  objc_storeStrong((id *)&self->_siriReferenceIdentifier, 0);
  objc_storeStrong((id *)&self->_playActivityRecommendationData, 0);
  objc_storeStrong((id *)&self->_playActivityFeatureName, 0);
  objc_storeStrong((id *)&self->_playActivityQueueGroupingID, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_identifierRegistry, 0);
}

+ (BOOL)usesIdentifierRegistry
{
  return 1;
}

@end
