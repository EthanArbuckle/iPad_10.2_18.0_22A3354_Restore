@implementation MXSerialQueue

void __36___MXSerialQueue_taskInsertionQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.MapKit._MXSerialQueue.taskInsertionQueue", v2);
  v1 = (void *)qword_1ECE2DD80;
  qword_1ECE2DD80 = (uint64_t)v0;

}

void __37___MXSerialQueue_taskCompletionQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.MapKit._MXSerialQueue.taskCompletionQueue", v2);
  v1 = (void *)qword_1ECE2DD90;
  qword_1ECE2DD90 = (uint64_t)v0;

}

void __26___MXSerialQueue_addTask___block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_group_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[6];
  _QWORD v13[5];
  NSObject *v14;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = dispatch_group_create();
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), v3);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__23;
  v13[4] = __Block_byref_object_dispose__23;
  v4 = v3;
  v14 = v4;
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __26___MXSerialQueue_addTask___block_invoke_4;
  v12[3] = &unk_1E20D7F20;
  v12[4] = *(_QWORD *)(a1 + 32);
  v12[5] = v13;
  v6 = (void *)MEMORY[0x18D778DB8](v12);
  dispatch_group_enter(v4);
  objc_msgSend((id)objc_opt_class(), "taskQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __26___MXSerialQueue_addTask___block_invoke_3;
  v9[3] = &unk_1E20DC828;
  v10 = *(id *)(a1 + 40);
  v11 = v6;
  v8 = v6;
  dispatch_group_notify(v2, v7, v9);

  _Block_object_dispose(v13, 8);
}

void __26___MXSerialQueue_addTask___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend((id)objc_opt_class(), "taskCompletionQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26___MXSerialQueue_addTask___block_invoke_2;
  block[3] = &unk_1E20D8078;
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_sync(v2, block);

}

void __26___MXSerialQueue_addTask___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  v2 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    dispatch_group_leave(v2);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
}

uint64_t __26___MXSerialQueue_addTask___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

@end
