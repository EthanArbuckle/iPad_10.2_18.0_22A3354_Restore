@implementation MSAlbumSharingInitialize

void __MSAlbumSharingInitialize_block_invoke()
{
  void *v0;
  void *v1;
  MSASPlatformImplementation *v2;

  v0 = (void *)MEMORY[0x1D826FD88]();
  +[MSMSPlatform thePlatform](MSMSPlatform, "thePlatform");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  MSCoreMediaStreamInitialize();

  v2 = objc_alloc_init(MSASPlatformImplementation);
  MSASInitialize();

  objc_autoreleasePoolPop(v0);
}

@end
