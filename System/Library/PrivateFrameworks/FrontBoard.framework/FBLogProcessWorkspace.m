@implementation FBLogProcessWorkspace

void __FBLogProcessWorkspace_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D22BA8], "ProcessWorkspace");
  v1 = (void *)FBLogProcessWorkspace___logObj;
  FBLogProcessWorkspace___logObj = (uint64_t)v0;

}

@end
