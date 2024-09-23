@implementation SUUIVideoSubscriberAccountFramework

void *__SUUIVideoSubscriberAccountFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/VideoSubscriberAccount.framework/VideoSubscriberAccount", 1);
  SUUIVideoSubscriberAccountFramework_sHandle = (uint64_t)result;
  return result;
}

@end
