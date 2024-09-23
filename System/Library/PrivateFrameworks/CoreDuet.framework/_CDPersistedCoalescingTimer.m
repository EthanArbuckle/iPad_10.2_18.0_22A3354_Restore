@implementation _CDPersistedCoalescingTimer

- (_CDPersistedCoalescingTimer)initWithDelay:(double)a3 coalesceData:(id)a4 operation:(id)a5 persistencePath:(id)a6 dataClass:(Class)a7 timerName:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  _CDPersistedCoalescingTimer *v18;
  void *v19;
  uint64_t v20;
  BMStoreStream *storeStream;
  uint64_t v22;
  BMSource *source;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *queue;
  id v27;
  OS_dispatch_queue *v28;
  double leeway;
  uint64_t v30;
  _CDPersistedCoalescingTimer *v31;
  uint64_t v32;
  _PASCoalescingTimer *coalescingTimer;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t);
  void *v38;
  _CDPersistedCoalescingTimer *v39;
  id v40;
  _QWORD v41[4];
  _CDPersistedCoalescingTimer *v42;
  id v43;
  objc_super v44;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v44.receiver = self;
  v44.super_class = (Class)_CDPersistedCoalescingTimer;
  v18 = -[_CDPersistedCoalescingTimer init](&v44, sel_init);
  if (v18)
  {
    v19 = (void *)-[objc_class newPrivateStreamDefaultConfigurationWithStoreBasePath:](getBMStoreConfigClass(), "newPrivateStreamDefaultConfigurationWithStoreBasePath:", v16);
    v20 = objc_msgSend(objc_alloc(getBMStoreStreamClass()), "initWithPrivateStreamIdentifier:storeConfig:eventDataClass:", v17, v19, a7);
    storeStream = v18->_storeStream;
    v18->_storeStream = (BMStoreStream *)v20;

    -[BMStoreStream source](v18->_storeStream, "source");
    v22 = objc_claimAutoreleasedReturnValue();
    source = v18->_source;
    v18->_source = (BMSource *)v22;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = dispatch_queue_create("_CDPersistedCoalescingTimer.innerQueue", v24);
    queue = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v25;

    v18->_delay = a3;
    v18->_leeway = 1.0;
    objc_storeStrong((id *)&v18->_persistencePath, a6);
    v27 = objc_alloc(MEMORY[0x1E0D81558]);
    v28 = v18->_queue;
    leeway = v18->_leeway;
    v30 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __104___CDPersistedCoalescingTimer_initWithDelay_coalesceData_operation_persistencePath_dataClass_timerName___block_invoke;
    v41[3] = &unk_1E26E4CC8;
    v42 = v18;
    v43 = v14;
    v35 = v30;
    v36 = 3221225472;
    v37 = __104___CDPersistedCoalescingTimer_initWithDelay_coalesceData_operation_persistencePath_dataClass_timerName___block_invoke_3;
    v38 = &unk_1E26E4D30;
    v40 = v15;
    v31 = v42;
    v39 = v31;
    v32 = objc_msgSend(v27, "initWithQueue:leewaySeconds:coalesceData:operation:", v28, v41, &v35, leeway);
    coalescingTimer = v31->_coalescingTimer;
    v31->_coalescingTimer = (_PASCoalescingTimer *)v32;

  }
  -[_PASCoalescingTimer immediatelyProcessData:](v18->_coalescingTimer, "immediatelyProcessData:", 0, v35, v36, v37, v38);

  return v18;
}

- (void)processData:(id)a3
{
  -[_PASCoalescingTimer processData:afterDelaySeconds:coalescingBehavior:](self->_coalescingTimer, "processData:afterDelaySeconds:coalescingBehavior:", a3, 0, self->_delay);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_storeStream, 0);
  objc_storeStrong((id *)&self->_persistencePath, 0);
  objc_storeStrong((id *)&self->_coalescingTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
