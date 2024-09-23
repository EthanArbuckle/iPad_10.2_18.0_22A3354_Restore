@implementation MSMediaStreamInitialize

void __MSMediaStreamInitialize_block_invoke()
{
  void *v0;
  void *v1;

  v0 = (void *)MEMORY[0x1D826FD88]();
  +[MSMSPlatform thePlatform](MSMSPlatform, "thePlatform");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  MSCoreMediaStreamInitialize();

  objc_autoreleasePoolPop(v0);
}

@end
