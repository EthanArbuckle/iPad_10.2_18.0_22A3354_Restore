@implementation DMCConfigurationProfilesSystemGroupContainerMetadataFilePath

void __DMCConfigurationProfilesSystemGroupContainerMetadataFilePath_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  MCConfigurationProfilesSystemGroupContainer();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR(".com.apple.mobile_container_manager.metadata.plist"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)DMCConfigurationProfilesSystemGroupContainerMetadataFilePath_str;
  DMCConfigurationProfilesSystemGroupContainerMetadataFilePath_str = v1;

}

@end
