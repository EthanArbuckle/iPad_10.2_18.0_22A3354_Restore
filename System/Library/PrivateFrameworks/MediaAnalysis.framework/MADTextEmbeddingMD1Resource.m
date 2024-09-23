@implementation MADTextEmbeddingMD1Resource

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
  objc_msgSend(v2, "sharedInstanceWithIdentifier:andCreationBlock:", v4, &__block_literal_global);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

MADTextEmbeddingMD1Resource *__45__MADTextEmbeddingMD1Resource_sharedResource__block_invoke()
{
  return objc_alloc_init(MADTextEmbeddingMD1Resource);
}

- (unint64_t)version
{
  return 1;
}

+ (int64_t)revision
{
  return 6;
}

- (int64_t)tokenEmbeddingType
{
  return 1;
}

@end
