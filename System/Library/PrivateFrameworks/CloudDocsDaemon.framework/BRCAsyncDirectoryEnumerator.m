@implementation BRCAsyncDirectoryEnumerator

- (id)initForEnumeratingBelow:(id)a3 recursive:(BOOL)a4 batchSize:(int64_t)a5 targetQueue:(id)a6
{
  id v11;
  id v12;
  BRCAsyncDirectoryEnumerator *v13;
  BRCAsyncDirectoryEnumerator *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  const char *v19;
  NSObject *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *internalQueue;
  objc_super v25;

  v11 = a3;
  v12 = a6;
  v25.receiver = self;
  v25.super_class = (Class)BRCAsyncDirectoryEnumerator;
  v13 = -[BRCAsyncDirectoryEnumerator init](&v25, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v11, "resolveAndKeepOpenMustExist:error:", 1, &v13->_error);
    objc_storeStrong((id *)&v14->_rootPath, a3);
    v14->_isRecursive = a4;
    objc_storeStrong((id *)&v14->_targetQueue, a6);
    v14->_batchSize = a5;
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v11, "filename");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("directory-enumerator/%@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_retainAutorelease(v17);
    v19 = (const char *)objc_msgSend(v18, "UTF8String");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v20, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create(v19, v21);

    internalQueue = v14->_internalQueue;
    v14->_internalQueue = (OS_dispatch_queue *)v22;

  }
  return v14;
}

- (void)scheduleWithProcessBlock:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__BRCAsyncDirectoryEnumerator_scheduleWithProcessBlock_completion___block_invoke;
  block[3] = &unk_1E8765708;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

void __67__BRCAsyncDirectoryEnumerator_scheduleWithProcessBlock_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v2 = -[BRCDirectoryEnumerator initForEnumeratingBelow:recursive:error:]([BRCDirectoryEnumerator alloc], "initForEnumeratingBelow:recursive:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(a1 + 32) + 36);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 1;
  v4 = MEMORY[0x1E0C809B0];
  do
  {
    if (!*((_BYTE *)v27 + 24))
      break;
    v5 = (void *)MEMORY[0x1D17A6BE8]();
    objc_msgSend(v2, "nextObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "addObject:", v6);
      v7 = objc_msgSend(v3, "count");
      v8 = *(_QWORD *)(a1 + 32);
      if (v7 >= *(_QWORD *)(v8 + 24))
      {
        v9 = *(NSObject **)(v8 + 16);
        block[0] = v4;
        block[1] = 3221225472;
        block[2] = __67__BRCAsyncDirectoryEnumerator_scheduleWithProcessBlock_completion___block_invoke_2;
        block[3] = &unk_1E87662B0;
        v25 = &v26;
        v10 = *(id *)(a1 + 40);
        v11 = *(_QWORD *)(a1 + 32);
        v24 = v10;
        block[4] = v11;
        v12 = v3;
        v23 = v12;
        dispatch_sync(v9, block);
        objc_msgSend(v12, "removeAllObjects");

      }
    }

    objc_autoreleasePoolPop(v5);
  }
  while (v6);
  v13 = *(void **)(a1 + 40);
  v14 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v17[0] = v4;
  v17[1] = 3221225472;
  v17[2] = __67__BRCAsyncDirectoryEnumerator_scheduleWithProcessBlock_completion___block_invoke_3;
  v17[3] = &unk_1E87662D8;
  v18 = v3;
  v15 = v13;
  v19 = *(_QWORD *)(a1 + 32);
  v20 = v15;
  v21 = *(id *)(a1 + 48);
  v16 = v3;
  dispatch_sync(v14, v17);

  _Block_object_dispose(&v26, 8);
}

uint64_t __67__BRCAsyncDirectoryEnumerator_scheduleWithProcessBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

uint64_t __67__BRCAsyncDirectoryEnumerator_scheduleWithProcessBlock_completion___block_invoke_3(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)dealloc
{
  objc_super v3;

  -[BRCRelativePath close](self->_rootPath, "close");
  v3.receiver = self;
  v3.super_class = (Class)BRCAsyncDirectoryEnumerator;
  -[BRCAsyncDirectoryEnumerator dealloc](&v3, sel_dealloc);
}

- (BRCRelativePath)rootPath
{
  return self->_rootPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootPath, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
