@implementation FBKHeaderDateFormatter

uint64_t __FBKHeaderDateFormatter_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)FBKHeaderDateFormatter_fmt;
  FBKHeaderDateFormatter_fmt = (uint64_t)v0;

  objc_msgSend((id)FBKHeaderDateFormatter_fmt, "setDateStyle:", 2);
  return objc_msgSend((id)FBKHeaderDateFormatter_fmt, "setTimeStyle:", 1);
}

@end
