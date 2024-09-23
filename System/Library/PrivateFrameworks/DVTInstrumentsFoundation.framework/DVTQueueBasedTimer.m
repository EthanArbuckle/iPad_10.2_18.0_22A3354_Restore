@implementation DVTQueueBasedTimer

- (DVTQueueBasedTimer)initWithInterval:(double)a3 block:(id)a4
{
  return -[DVTQueueBasedTimer initWithInterval:qos:block:](self, "initWithInterval:qos:block:", 21, a4, a3);
}

- (DVTQueueBasedTimer)initWithInterval:(double)a3 qos:(unsigned int)a4 block:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;
  char __str[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DVTQueueBasedTimer;
  v9 = -[DVTQueueBasedTimer init](&v17, sel_init);
  if (v9)
  {
    do
      v10 = __ldaxr(&qword_25576FBB8);
    while (__stlxr(v10 + 1, &qword_25576FBB8));
    snprintf(__str, 0x80uLL, "com.apple.instruments.kperf.timer.%llu", v10);
    dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)a4, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create(__str, v11);
    v13 = (void *)*((_QWORD *)v9 + 1);
    *((_QWORD *)v9 + 1) = v12;

    *((double *)v9 + 3) = a3;
    v14 = _Block_copy(v8);
    v15 = (void *)*((_QWORD *)v9 + 4);
    *((_QWORD *)v9 + 4) = v14;

    atomic_store(0, (unsigned int *)v9 + 10);
  }

  return (DVTQueueBasedTimer *)v9;
}

- (void)_runBlock
{
  unsigned int v2;
  int v4;
  dispatch_time_t v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD block[5];

  v2 = atomic_load((unsigned int *)self + 10);
  if (v2 == 1)
  {
    v4 = (*(uint64_t (**)(void))(*((_QWORD *)self + 4) + 16))();
    if (v4)
    {
      if (v4 != 2)
      {
        if (v4 != 1)
          sub_222BC716C();
        v5 = dispatch_time(0xFFFFFFFFFFFFFFFELL, (uint64_t)(*((double *)self + 3) * 1000000000.0));
        v6 = *((_QWORD *)self + 1);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = sub_222B7ACB0;
        block[3] = &unk_24EB2A030;
        block[4] = self;
        dispatch_after(v5, v6, block);
      }
    }
    else
    {
      v7 = *((_QWORD *)self + 1);
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = sub_222B7ACB8;
      v8[3] = &unk_24EB2A030;
      v8[4] = self;
      dispatch_async(v7, v8);
    }
  }
}

- (void)start
{
  std::mutex *v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  v4 = *((_QWORD *)self + 1);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B7AD34;
  block[3] = &unk_24EB2A030;
  block[4] = self;
  dispatch_async(v4, block);
  std::mutex::unlock(v3);
}

- (void)stop
{
  std::mutex *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  _QWORD block[5];

  v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  v4 = MEMORY[0x24BDAC760];
  v5 = *((_QWORD *)self + 1);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B7AE04;
  block[3] = &unk_24EB2A030;
  block[4] = self;
  dispatch_sync(v5, block);
  v6 = *((_QWORD *)self + 1);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = sub_222B7AE18;
  v7[3] = &unk_24EB2A030;
  v7[4] = self;
  dispatch_sync(v6, v7);
  std::mutex::unlock(v3);
}

- (void)pause
{
  std::mutex *v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  v4 = *((_QWORD *)self + 1);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B7AEA8;
  block[3] = &unk_24EB2A030;
  block[4] = self;
  dispatch_sync(v4, block);
  dispatch_sync(*((dispatch_queue_t *)self + 1), &unk_24EB27930);
  std::mutex::unlock(v3);
}

- (void)resume
{
  std::mutex *v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = (std::mutex *)((char *)self + 48);
  std::mutex::lock((std::mutex *)((char *)self + 48));
  v4 = *((_QWORD *)self + 1);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B7AF34;
  block[3] = &unk_24EB2A030;
  block[4] = self;
  dispatch_async(v4, block);
  std::mutex::unlock(v3);
}

- (BOOL)running
{
  return -[DVTQueueBasedTimer state](self, "state") == 1;
}

- (unsigned)state
{
  return atomic_load((unsigned int *)self + 10);
}

- (double)interval
{
  return *((double *)self + 3);
}

- (void).cxx_destruct
{
  std::mutex::~mutex((std::mutex *)((char *)self + 48));
  objc_storeStrong((id *)self + 4, 0);
  objc_storeStrong((id *)self + 2, 0);
  objc_storeStrong((id *)self + 1, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 850045863;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_QWORD *)self + 13) = 0;
  return self;
}

@end
