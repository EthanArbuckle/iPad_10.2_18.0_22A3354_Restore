@implementation BSLogSharedMemory

void __BSLogSharedMemory_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BaseBoard", "SharedMemory");
  v1 = (void *)BSLogSharedMemory___logObj;
  BSLogSharedMemory___logObj = (uint64_t)v0;

}

@end
