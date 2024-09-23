@implementation BLSHAsyncDisplayPowerResourceHint

+ (id)sharedHighPriorityQueue
{
  if (sharedHighPriorityQueue_onceToken != -1)
    dispatch_once(&sharedHighPriorityQueue_onceToken, &__block_literal_global_0);
  return (id)sharedHighPriorityQueue_sharedQueue;
}

void __60__BLSHAsyncDisplayPowerResourceHint_sharedHighPriorityQueue__block_invoke()
{
  dispatch_workloop_t inactive;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  inactive = dispatch_workloop_create_inactive("BLSHAsyncDisplayPowerResourceHint workloop");
  v1 = (void *)sharedHighPriorityQueue_rootWorkloop;
  sharedHighPriorityQueue_rootWorkloop = (uint64_t)inactive;

  dispatch_workloop_set_scheduler_priority();
  dispatch_activate((dispatch_object_t)sharedHighPriorityQueue_rootWorkloop);
  v2 = dispatch_queue_create_with_target_V2("BLSHAsyncDisplayPowerResourceHintQueue", 0, (dispatch_queue_t)sharedHighPriorityQueue_rootWorkloop);
  v3 = (void *)sharedHighPriorityQueue_sharedQueue;
  sharedHighPriorityQueue_sharedQueue = (uint64_t)v2;

}

+ (id)hintWithHint:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHint:", v4);

  return v5;
}

- (BLSHAsyncDisplayPowerResourceHint)initWithHint:(id)a3
{
  id v5;
  BLSHAsyncDisplayPowerResourceHint *v6;
  BLSHAsyncDisplayPowerResourceHint *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLSHAsyncDisplayPowerResourceHint;
  v6 = -[BLSHAsyncDisplayPowerResourceHint init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_hint, a3);

  return v7;
}

- (BOOL)updateState:(unint64_t)a3
{
  BLSDisplayPowerResourceHint *v4;
  NSObject *v5;
  BLSDisplayPowerResourceHint *v6;
  _QWORD v8[4];
  BLSDisplayPowerResourceHint *v9;
  unint64_t v10;

  v4 = self->_hint;
  +[BLSHAsyncDisplayPowerResourceHint sharedHighPriorityQueue](BLSHAsyncDisplayPowerResourceHint, "sharedHighPriorityQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__BLSHAsyncDisplayPowerResourceHint_updateState___block_invoke;
  v8[3] = &unk_24D1BC160;
  v9 = v4;
  v10 = a3;
  v6 = v4;
  dispatch_async(v5, v8);

  return 1;
}

uint64_t __49__BLSHAsyncDisplayPowerResourceHint_updateState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateState:", *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hint, 0);
}

@end
