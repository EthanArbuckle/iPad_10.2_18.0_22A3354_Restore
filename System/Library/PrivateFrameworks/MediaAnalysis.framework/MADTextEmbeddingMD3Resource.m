@implementation MADTextEmbeddingMD3Resource

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
  objc_msgSend(v2, "sharedInstanceWithIdentifier:andCreationBlock:", v4, &__block_literal_global_163);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

MADTextEmbeddingMD3Resource *__45__MADTextEmbeddingMD3Resource_sharedResource__block_invoke()
{
  return objc_alloc_init(MADTextEmbeddingMD3Resource);
}

- (unint64_t)version
{
  return 3;
}

+ (int64_t)revision
{
  return 5;
}

- (int64_t)tokenEmbeddingType
{
  return 3;
}

- (unint64_t)calibrationVersion
{
  return 2;
}

@end
