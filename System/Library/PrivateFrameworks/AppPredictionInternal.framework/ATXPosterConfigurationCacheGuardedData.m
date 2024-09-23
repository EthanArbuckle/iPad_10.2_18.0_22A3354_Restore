@implementation ATXPosterConfigurationCacheGuardedData

- (ATXPosterConfigurationCacheGuardedData)init
{
  ATXPosterConfigurationCacheGuardedData *v2;
  uint64_t v3;
  NSHashTable *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXPosterConfigurationCacheGuardedData;
  v2 = -[ATXPosterConfigurationCacheGuardedData init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 0);
    observers = v2->observers;
    v2->observers = (NSHashTable *)v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->observers, 0);
  objc_storeStrong((id *)&self->configurations, 0);
}

@end
