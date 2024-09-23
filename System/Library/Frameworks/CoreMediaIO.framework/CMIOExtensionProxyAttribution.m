@implementation CMIOExtensionProxyAttribution

+ (id)sharedAttribution
{
  if (sharedAttribution_onceToken != -1)
    dispatch_once(&sharedAttribution_onceToken, &__block_literal_global_2);
  return (id)sharedAttribution_gAttribution;
}

CMIOExtensionProxyAttribution *__50__CMIOExtensionProxyAttribution_sharedAttribution__block_invoke()
{
  CMIOExtensionProxyAttribution *result;

  result = objc_alloc_init(CMIOExtensionProxyAttribution);
  sharedAttribution_gAttribution = (uint64_t)result;
  return result;
}

- (CMIOExtensionProxyAttribution)init
{
  CMIOExtensionProxyAttribution *v2;
  CMIOExtensionProxyAttribution *v3;
  NSObject *v4;
  NSObject *global_queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMIOExtensionProxyAttribution;
  v2 = -[CMIOExtensionProxyAttribution init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    global_queue = dispatch_get_global_queue(21, 0);
    v3->_queue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.cmio.CMIOExtensionProxyAttribution", v4, global_queue);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMIOExtensionProxyAttribution;
  -[CMIOExtensionProxyAttribution dealloc](&v3, sel_dealloc);
}

@end
