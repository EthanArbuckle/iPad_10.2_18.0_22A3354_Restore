@implementation FBKContentItemDisplayDateFormatter

uint64_t __FBKContentItemDisplayDateFormatter_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)FBKContentItemDisplayDateFormatter_f;
  FBKContentItemDisplayDateFormatter_f = (uint64_t)v0;

  objc_msgSend((id)FBKContentItemDisplayDateFormatter_f, "setDateStyle:", 1);
  objc_msgSend((id)FBKContentItemDisplayDateFormatter_f, "setTimeStyle:", 0);
  return objc_msgSend((id)FBKContentItemDisplayDateFormatter_f, "setDoesRelativeDateFormatting:", 1);
}

@end
