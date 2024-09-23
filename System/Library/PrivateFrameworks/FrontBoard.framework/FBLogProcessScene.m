@implementation FBLogProcessScene

void __FBLogProcessScene_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D22BA8], "ProcessScene");
  v1 = (void *)FBLogProcessScene___logObj;
  FBLogProcessScene___logObj = (uint64_t)v0;

}

@end
