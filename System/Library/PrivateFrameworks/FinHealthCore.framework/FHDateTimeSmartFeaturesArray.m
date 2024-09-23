@implementation FHDateTimeSmartFeaturesArray

void __FHDateTimeSmartFeaturesArray_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  FHSmartFeaturesDict();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("FHDateTimeSmartFeatures"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "allKeys");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)FHDateTimeSmartFeaturesArray__fhSmartFeatures;
  FHDateTimeSmartFeaturesArray__fhSmartFeatures = v1;

}

@end
