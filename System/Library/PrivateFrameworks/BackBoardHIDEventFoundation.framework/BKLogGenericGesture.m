@implementation BKLogGenericGesture

void __BKLogGenericGesture_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D008E8], "GenericGesture");
  v1 = (void *)BKLogGenericGesture___logObj;
  BKLogGenericGesture___logObj = (uint64_t)v0;

}

@end
