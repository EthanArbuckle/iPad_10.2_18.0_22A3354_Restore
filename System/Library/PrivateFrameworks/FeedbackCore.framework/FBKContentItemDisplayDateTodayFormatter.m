@implementation FBKContentItemDisplayDateTodayFormatter

uint64_t __FBKContentItemDisplayDateTodayFormatter_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)FBKContentItemDisplayDateTodayFormatter_f;
  FBKContentItemDisplayDateTodayFormatter_f = (uint64_t)v0;

  objc_msgSend((id)FBKContentItemDisplayDateTodayFormatter_f, "setDateStyle:", 0);
  return objc_msgSend((id)FBKContentItemDisplayDateTodayFormatter_f, "setTimeStyle:", 1);
}

@end
