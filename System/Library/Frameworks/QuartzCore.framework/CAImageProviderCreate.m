@implementation CAImageProviderCreate

dispatch_queue_t __CAImageProviderCreate_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_USER_INITIATED, 0);
  result = dispatch_queue_create("com.apple.coreanimation.imageprovider.concurrent", v0);
  provider_queue = (uint64_t)result;
  return result;
}

@end
