@implementation MTCurrentDateProvider

void __MTCurrentDateProvider_block_invoke()
{
  void *v0;

  v0 = (void *)MTCurrentDateProvider_currentDateProvider;
  MTCurrentDateProvider_currentDateProvider = (uint64_t)&__block_literal_global_13;

}

uint64_t __MTCurrentDateProvider_block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

@end
