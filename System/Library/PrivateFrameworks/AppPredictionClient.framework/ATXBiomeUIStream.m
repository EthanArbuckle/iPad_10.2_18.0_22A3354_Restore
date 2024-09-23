@implementation ATXBiomeUIStream

- (id)publisherFromStartTime:(double)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXBiomeUIStream;
  -[ATXUniversalBiomeUIStream genericEventPublisherFromStartTime:](&v6, sel_genericEventPublisherFromStartTime_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filterWithIsIncluded:", &__block_literal_global_31);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __43__ATXBiomeUIStream_publisherFromStartTime___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)publisherFromStartTime:(double)a3 consumerSubType:(unsigned __int8)a4
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXBiomeUIStream;
  -[ATXUniversalBiomeUIStream genericEventPublisherFromStartTime:consumerSubType:](&v7, sel_genericEventPublisherFromStartTime_consumerSubType_, a4, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filterWithIsIncluded:", &__block_literal_global_6_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __59__ATXBiomeUIStream_publisherFromStartTime_consumerSubType___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)deprecatedPublisherFromStartTime:(double)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXBiomeUIStream;
  -[ATXUniversalBiomeUIStream deprecatedGenericEventPublisherFromStartTime:](&v6, sel_deprecatedGenericEventPublisherFromStartTime_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filterWithIsIncluded:", &__block_literal_global_9_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __53__ATXBiomeUIStream_deprecatedPublisherFromStartTime___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)donateUIEvent:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ATXBiomeUIStream;
  -[ATXUniversalBiomeUIStream donateGenericUIEvent:](&v3, sel_donateGenericUIEvent_, a3);
}

@end
