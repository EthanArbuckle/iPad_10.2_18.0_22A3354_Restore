@implementation CMPocketStateQueueBlockPair

- (CMPocketStateQueueBlockPair)initWithQueue:(id)a3 andBlock:(id)a4
{
  CMPocketStateQueueBlockPair *v6;
  CMPocketStateQueueBlockPair *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CMPocketStateQueueBlockPair;
  v6 = -[CMPocketStateQueueBlockPair init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->fQueryQueue = (OS_dispatch_queue *)a3;
    v6->fQueryBlock = _Block_copy(a4);
    dispatch_retain((dispatch_object_t)v7->fQueryQueue);
  }
  return v7;
}

- (void)dispatchWithState:(int64_t)a3 andError:(id)a4
{
  NSObject *fQueryQueue;
  _QWORD block[7];

  kdebug_trace();
  fQueryQueue = self->fQueryQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4767FC;
  block[3] = &unk_1E2958990;
  block[5] = a4;
  block[6] = a3;
  block[4] = self;
  dispatch_async(fQueryQueue, block);
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->fQueryQueue);
  self->fQueryQueue = 0;
  _Block_release(self->fQueryBlock);
  self->fQueryBlock = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMPocketStateQueueBlockPair;
  -[CMPocketStateQueueBlockPair dealloc](&v3, sel_dealloc);
}

@end
