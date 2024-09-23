@implementation APUIImageIOQueue

void __APUIImageIOQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.AppprotectionUI.ImageIO", v2);
  v1 = (void *)APUIImageIOQueue_q;
  APUIImageIOQueue_q = (uint64_t)v0;

}

@end
