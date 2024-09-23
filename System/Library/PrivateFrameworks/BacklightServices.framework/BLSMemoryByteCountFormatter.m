@implementation BLSMemoryByteCountFormatter

+ (id)sharedFormatter
{
  if (sharedFormatter_onceToken != -1)
    dispatch_once(&sharedFormatter_onceToken, &__block_literal_global_9);
  return (id)sharedFormatter_byteCountFormatter;
}

uint64_t __46__BLSMemoryByteCountFormatter_sharedFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB34E8]);
  v1 = (void *)sharedFormatter_byteCountFormatter;
  sharedFormatter_byteCountFormatter = (uint64_t)v0;

  return objc_msgSend((id)sharedFormatter_byteCountFormatter, "setCountStyle:", 1);
}

@end
