@implementation HTGatherHomeVolumeSpaceInfo

void __HTGatherHomeVolumeSpaceInfo_block_invoke()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  uint8_t v3[16];

  HTGetHomeDirectoryURL();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)HTGatherHomeVolumeSpaceInfo_homeURL;
  HTGatherHomeVolumeSpaceInfo_homeURL = v0;

  if (!HTGatherHomeVolumeSpaceInfo_homeURL)
  {
    shared_ht_log_handle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1AF62F000, v2, OS_LOG_TYPE_DEFAULT, "Unable to get home dir URL", v3, 2u);
    }

  }
}

@end
