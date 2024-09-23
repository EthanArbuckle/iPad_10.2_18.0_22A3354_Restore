@implementation DVTStreamManager

- (DVTStreamManager)initWithStream:(id)a3
{
  id v5;
  DVTStreamManager *v6;
  DVTStreamManager *v7;
  unint64_t v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;
  char __str[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DVTStreamManager;
  v6 = -[DVTStreamManager init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_stream, a3);
    do
      v8 = __ldxr(&qword_25576FAD8);
    while (__stxr(v8 + 1, &qword_25576FAD8));
    snprintf(__str, 0x80uLL, "com.apple.instruments.kperf.streammanager.%llu", v8);
    v9 = dispatch_queue_create(__str, 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    v7->_currentStreamSize = 0;
  }

  return v7;
}

- (int64_t)commit:(const void *)a3 bufferSize:(unint64_t)a4 error:(id *)a5 destructor:(id)a6
{
  id v10;
  NSObject *queue;
  id v12;
  int64_t v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  const void *v18;
  unint64_t v19;
  id *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v10 = a6;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_222B5A850;
  v15[3] = &unk_24EB29B58;
  v17 = &v21;
  v18 = a3;
  v15[4] = self;
  v16 = v10;
  v19 = a4;
  v20 = a5;
  v12 = v10;
  dispatch_sync(queue, v15);
  v13 = v22[3];

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (int64_t)commit:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *queue;
  id v8;
  int64_t v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  id *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_222B5AA1C;
  v11[3] = &unk_24EB29B80;
  v11[4] = self;
  v12 = v6;
  v13 = &v15;
  v14 = a4;
  v8 = v6;
  dispatch_sync(queue, v11);
  v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (id)export
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_222B5AB20;
  v10 = sub_222B5AB30;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_222B5AB38;
  v5[3] = &unk_24EB29678;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (unint64_t)currentStreamSize
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
  v5[2] = sub_222B5AC28;
  v5[3] = &unk_24EB29678;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

@end
