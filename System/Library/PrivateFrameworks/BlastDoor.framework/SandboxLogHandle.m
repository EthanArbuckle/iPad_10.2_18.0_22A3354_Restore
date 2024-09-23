@implementation SandboxLogHandle

void __SandboxLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Messages.blastdoor", "Sandbox");
  v1 = (void *)SandboxLogHandle_log;
  SandboxLogHandle_log = (uint64_t)v0;

}

@end
