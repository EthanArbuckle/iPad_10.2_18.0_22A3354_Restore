@implementation FSFFeatureStoreService

+ (id)retrieveCodingWithInteractionId:(id)a3 klass:(Class)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a3;
  NSStringFromClass(a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FSFCurareInteractionStream getWithStreamId:sourceType:](FSFCurareInteractionStream, "getWithStreamId:sourceType:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "retrieve:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", a4, v13, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)interactionIdForInjection
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = static FeatureStoreService.interactionIdForInjection()();
  if (v3)
  {
    v4 = (void *)MEMORY[0x212BEE02C](v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (FSFFeatureStoreService)init
{
  FSFFeatureStoreService *result;

  FeatureStoreService.init()();
  OUTLINED_FUNCTION_20_1();
  return result;
}

+ (void)insertCodingWithInteractionId:(id)a3 item:(id)a4
{
  @objc static FeatureStoreService.insertCoding(interactionId:item:)((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, id))static FeatureStoreService.insertCoding(interactionId:item:));
}

+ (void)insertPBCodableWithInteractionId:(id)a3 item:(id)a4
{
  @objc static FeatureStoreService.insertCoding(interactionId:item:)((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, id))static FeatureStoreService.insertPBCodable(interactionId:item:));
}

@end
