@implementation BKLogDisplayAnnotations

void __BKLogDisplayAnnotations_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x24BE0B4E0], "DisplayAnnotations");
  v1 = (void *)BKLogDisplayAnnotations___logObj;
  BKLogDisplayAnnotations___logObj = (uint64_t)v0;

}

@end
