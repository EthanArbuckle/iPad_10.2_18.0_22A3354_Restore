@implementation HTTPNotificationCenter

void __HTTPNotificationCenter_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37D0]);
  v1 = (void *)HTTPNotificationCenter_center;
  HTTPNotificationCenter_center = (uint64_t)v0;

}

@end
