@implementation DTXResourceTracker

- (DTXResourceTracker)init
{
  DTXResourceTracker *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  dispatch_semaphore_t v5;
  OS_dispatch_semaphore *acqSem;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DTXResourceTracker;
  v2 = -[DTXResourceTracker init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("DTXResourceTracker queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = dispatch_semaphore_create(0);
    acqSem = v2->_acqSem;
    v2->_acqSem = (OS_dispatch_semaphore *)v5;

    v2->_total = -1;
    v2->_maxChunk = -1;
  }
  return v2;
}

- (unint64_t)totalSize
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_21DC8C7C0;
  v5[3] = &unk_24E1AAC78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setTotalSize:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_21DC8C82C;
  v4[3] = &unk_24E1AAD40;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (unint64_t)maxChunkSize
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_21DC8C910;
  v5[3] = &unk_24E1AAC78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setMaxChunkSize:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_21DC8C97C;
  v4[3] = &unk_24E1AAD40;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (unsigned)acquireSize:(unint64_t)a3
{
  uint64_t v5;
  NSObject *queue;
  unsigned int v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v5 = MEMORY[0x24BDAC760];
  do
  {
    queue = self->_queue;
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = sub_21DC8CACC;
    v9[3] = &unk_24E1AAD68;
    v9[4] = self;
    v9[5] = &v10;
    v9[6] = &v14;
    v9[7] = a3;
    dispatch_sync(queue, v9);
    if (*((_BYTE *)v15 + 24))
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_acqSem, 0xFFFFFFFFFFFFFFFFLL);
  }
  while (*((_BYTE *)v15 + 24));
  v7 = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

- (void)forceAcquireSize:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_21DC8CBC8;
  v4[3] = &unk_24E1AAD40;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (void)releaseSize:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_21DC8CC34;
  v4[3] = &unk_24E1AAD40;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (void)suspendLimits
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21DC8CCEC;
  block[3] = &unk_24E1AAAC8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)resumeLimits
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21DC8CDA0;
  block[3] = &unk_24E1AAAC8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (BOOL)log
{
  return self->_log;
}

- (void)setLog:(BOOL)a3
{
  self->_log = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentTracker, 0);
  objc_storeStrong((id *)&self->_acqSem, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
