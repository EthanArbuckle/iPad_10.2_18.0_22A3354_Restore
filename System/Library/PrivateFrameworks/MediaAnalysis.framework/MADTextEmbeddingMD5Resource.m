@implementation MADTextEmbeddingMD5Resource

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
  objc_msgSend(v2, "sharedInstanceWithIdentifier:andCreationBlock:", v4, &__block_literal_global_172);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

MADTextEmbeddingMD5Resource *__45__MADTextEmbeddingMD5Resource_sharedResource__block_invoke()
{
  return objc_alloc_init(MADTextEmbeddingMD5Resource);
}

- (unint64_t)version
{
  return 5;
}

+ (int64_t)revision
{
  return 9;
}

- (int64_t)tokenEmbeddingType
{
  return 5;
}

- (unint64_t)calibrationVersion
{
  return 4;
}

@end
