@implementation MSUDASharedLogger

void __MSUDASharedLogger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MSUDataAccessor", "MSUDataAccessor");
  v1 = (void *)MSUDASharedLogger___instance;
  MSUDASharedLogger___instance = (uint64_t)v0;

}

@end
