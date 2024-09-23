@implementation FBLogProcess

void __FBLogProcess_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D22BA8], "Process");
  v1 = (void *)FBLogProcess___logObj;
  FBLogProcess___logObj = (uint64_t)v0;

}

@end
