@implementation TraceRecordingEnabled

id NavigationConfig_TraceRecordingEnabled_Metadata_block_invoke_102()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "numberWithBool:", objc_msgSend(v1, "isInternalInstall"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
