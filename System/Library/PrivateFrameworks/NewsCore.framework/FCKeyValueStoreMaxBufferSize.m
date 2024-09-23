@implementation FCKeyValueStoreMaxBufferSize

uint64_t __FCKeyValueStoreMaxBufferSize_block_invoke()
{
  uint64_t result;
  uint64_t v1;

  result = FCProcessIsMemoryConstrained();
  v1 = 3000000;
  if ((_DWORD)result)
    v1 = 1024;
  qword_1ED0F8698 = v1;
  return result;
}

@end
