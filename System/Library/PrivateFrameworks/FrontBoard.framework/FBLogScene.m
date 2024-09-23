@implementation FBLogScene

void __FBLogScene_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D22BA8], "Scene");
  v1 = (void *)FBLogScene___logObj;
  FBLogScene___logObj = (uint64_t)v0;

}

@end
