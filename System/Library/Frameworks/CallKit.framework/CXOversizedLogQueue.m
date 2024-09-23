@implementation CXOversizedLogQueue

void __CXOversizedLogQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)0xFFFFFFFE, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.calls.callkitqueue", v2);
  v1 = (void *)CXOversizedLogQueue_queue;
  CXOversizedLogQueue_queue = (uint64_t)v0;

}

@end
