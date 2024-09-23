@implementation IOSurface

void __IOSurface_ForwardDeclarationsLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Messages.blastdoor", "IOSurface_ForwardDeclarations");
  v1 = (void *)IOSurface_ForwardDeclarationsLogHandle_log;
  IOSurface_ForwardDeclarationsLogHandle_log = (uint64_t)v0;

}

@end
