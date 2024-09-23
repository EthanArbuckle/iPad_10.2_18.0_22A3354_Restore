@implementation HDBackgroundTaskClient

- (void)deliverTask:(void *)a3 taskName:(void *)a4 onQueue:
{
  id v7;
  id v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1 && *(_QWORD *)(a1 + 8))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__HDBackgroundTaskClient_deliverTask_taskName_onQueue___block_invoke;
    block[3] = &unk_1E6CE7FB8;
    block[4] = a1;
    v11 = v8;
    v12 = v7;
    dispatch_async(v9, block);

  }
}

uint64_t __55__HDBackgroundTaskClient_deliverTask_taskName_onQueue___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1[4] + 8) + 16))(*(_QWORD *)(a1[4] + 8), a1[5], a1[6]);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_taskHandler, 0);
}

@end
