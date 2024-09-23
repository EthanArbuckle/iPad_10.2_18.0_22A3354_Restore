@implementation XRPassFailIssueResponder

- (XRPassFailIssueResponder)initWithNextResponder:(id)a3
{
  id v4;
  XRPassFailIssueResponder *v5;
  uint64_t v6;
  NSMutableArray *uniqueErrors;
  dispatch_queue_t v8;
  OS_dispatch_queue *uniqueErrorsQueue;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)XRPassFailIssueResponder;
  v5 = -[XRPassFailIssueResponder init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    uniqueErrors = v5->_uniqueErrors;
    v5->_uniqueErrors = (NSMutableArray *)v6;

    v8 = dispatch_queue_create("com.apple.dt.pass-fail.unique-error", 0);
    uniqueErrorsQueue = v5->_uniqueErrorsQueue;
    v5->_uniqueErrorsQueue = (OS_dispatch_queue *)v8;

    objc_storeWeak((id *)&v5->_nextResponder, v4);
  }

  return v5;
}

- (XRPassFailIssueResponder)init
{
  return (XRPassFailIssueResponder *)((uint64_t (*)(XRPassFailIssueResponder *, char *, _QWORD))MEMORY[0x24BEDD108])(self, sel_initWithNextResponder_, 0);
}

- (void)handleIssue:(id)a3 type:(signed __int16)a4 from:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  NSObject *uniqueErrorsQueue;
  id WeakRetained;
  const char *v12;
  _QWORD v13[5];
  id v14;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (!(_DWORD)v6)
  {
    uniqueErrorsQueue = self->_uniqueErrorsQueue;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_226359614;
    v13[3] = &unk_24EDC2EC8;
    v13[4] = self;
    v14 = v8;
    dispatch_async(uniqueErrorsQueue, v13);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_nextResponder);
  objc_msgSend_handleIssue_type_from_(WeakRetained, v12, (uint64_t)v8, v6, (uint64_t)v9);

}

- (BOOL)failureOccurred
{
  NSObject *uniqueErrorsQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  uniqueErrorsQueue = self->_uniqueErrorsQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_2263596B0;
  v5[3] = &unk_24EDC3F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(uniqueErrorsQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)failures
{
  NSObject *uniqueErrorsQueue;
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
  v9 = sub_2263597A0;
  v10 = sub_2263597B0;
  v11 = 0;
  uniqueErrorsQueue = self->_uniqueErrorsQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_2263597B8;
  v5[3] = &unk_24EDC3F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(uniqueErrorsQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueErrorsQueue, 0);
  objc_storeStrong((id *)&self->_uniqueErrors, 0);
  objc_destroyWeak((id *)&self->_nextResponder);
}

@end
