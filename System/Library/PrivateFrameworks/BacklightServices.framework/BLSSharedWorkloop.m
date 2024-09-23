@implementation BLSSharedWorkloop

+ (id)workloop
{
  if (workloop_onceToken != -1)
    dispatch_once(&workloop_onceToken, &__block_literal_global_12);
  return (id)_workloop;
}

void __29__BLSSharedWorkloop_workloop__block_invoke()
{
  dispatch_workloop_t v0;
  void *v1;

  v0 = dispatch_workloop_create("BLSSharedWorkloop");
  v1 = (void *)_workloop;
  _workloop = (uint64_t)v0;

}

+ (void)dispatchWithQOSClass:(unsigned int)a3 block:(id)a4
{
  NSObject *v4;
  dispatch_block_t block;

  block = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, a4);
  +[BLSSharedWorkloop workloop](BLSSharedWorkloop, "workloop");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v4, block);

}

+ (id)serialQueueWithQOSClass:(unsigned int)a3 label:(const char *)a4
{
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;

  dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)a3, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  +[BLSSharedWorkloop workloop](BLSSharedWorkloop, "workloop");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_queue_create_with_target_V2(a4, v5, v6);

  return v7;
}

@end
