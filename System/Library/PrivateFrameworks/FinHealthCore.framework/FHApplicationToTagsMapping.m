@implementation FHApplicationToTagsMapping

void __FHApplicationToTagsMapping_block_invoke()
{
  void *v0;
  uint64_t v1;
  id v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  loadConfigurationFromJsonFile(CFSTR("features_for_applications"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v0, 1, &v5);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = v5;
  v3 = (void *)FHApplicationToTagsMapping_fhFeaturesForApplications;
  FHApplicationToTagsMapping_fhFeaturesForApplications = v1;

  if (!FHApplicationToTagsMapping_fhFeaturesForApplications)
  {
    FinHealthLogObject(CFSTR("FinHealthCore"));
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v7 = v2;
      _os_log_impl(&dword_23B4A2000, v4, OS_LOG_TYPE_ERROR, "Error parsing JSON: %@", buf, 0xCu);
    }

  }
}

@end
