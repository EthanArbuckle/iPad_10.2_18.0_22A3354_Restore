@implementation DefaultDispatchQueue

void __DefaultDispatchQueue_block_invoke()
{
  objc_class *v0;
  const char *v1;
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;
  id v5;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = (const char *)objc_msgSend(v5, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create(v1, v2);
  v4 = (void *)DefaultDispatchQueue_defaultQueue;
  DefaultDispatchQueue_defaultQueue = (uint64_t)v3;

}

@end
