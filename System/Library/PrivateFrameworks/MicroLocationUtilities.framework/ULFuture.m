@implementation ULFuture

+ (id)nullFuture
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)futureWithResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[ULPromise promise](ULPromise, "promise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithResult:", v3);

  objc_msgSend(v4, "future");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)futureWithError:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[ULPromise promise](ULPromise, "promise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithError:", v3);

  objc_msgSend(v4, "future");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)futureWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[ULScheduler globalAsyncScheduler](ULScheduler, "globalAsyncScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "onScheduler:futureWithBlock:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)onScheduler:(id)a3 futureWithBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;

  v5 = a4;
  v6 = a3;
  +[ULPromise promise](ULPromise, "promise");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __40__ULFuture_onScheduler_futureWithBlock___block_invoke;
  v15 = &unk_2511EF0B8;
  v16 = v7;
  v17 = v5;
  v8 = v7;
  v9 = v5;
  objc_msgSend(v6, "performAsyncBlock:", &v12);

  objc_msgSend(v8, "future", v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __40__ULFuture_onScheduler_futureWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  v5 = 0;
  (*(void (**)(void))(v2 + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", v3, v4);

}

+ (void)_always:(id)a3 withBlock:(id)a4 scheduler:(id)a5
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __40__ULFuture__always_withBlock_scheduler___block_invoke;
  v15[3] = &unk_2511EF0E0;
  v9 = v7;
  v16 = v9;
  v10 = a5;
  v11 = a3;
  objc_msgSend(v11, "onScheduler:addSuccessBlock:", v10, v15);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __40__ULFuture__always_withBlock_scheduler___block_invoke_2;
  v13[3] = &unk_2511EF108;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "onScheduler:addFailureBlock:", v10, v13);

}

uint64_t __40__ULFuture__always_withBlock_scheduler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __40__ULFuture__always_withBlock_scheduler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)_then:(id)a3 withBlock:(id)a4 scheduler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  +[ULPromise promise](ULPromise, "promise");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __38__ULFuture__then_withBlock_scheduler___block_invoke;
  v19[3] = &unk_2511EF130;
  v21 = v7;
  v12 = v10;
  v20 = v12;
  v13 = v7;
  objc_msgSend(v9, "onScheduler:addSuccessBlock:", v8, v19);
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __38__ULFuture__then_withBlock_scheduler___block_invoke_2;
  v17[3] = &unk_2511EF158;
  v18 = v12;
  v14 = v12;
  objc_msgSend(v9, "onScheduler:addFailureBlock:", v8, v17);

  objc_msgSend(v14, "future");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __38__ULFuture__then_withBlock_scheduler___block_invoke(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_finishWithFuture:", v2);

}

uint64_t __38__ULFuture__then_withBlock_scheduler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

+ (id)_recover:(id)a3 withBlock:(id)a4 scheduler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  +[ULPromise promise](ULPromise, "promise");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __41__ULFuture__recover_withBlock_scheduler___block_invoke;
  v20[3] = &unk_2511EF180;
  v12 = v10;
  v21 = v12;
  objc_msgSend(v9, "onScheduler:addSuccessBlock:", v8, v20);
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __41__ULFuture__recover_withBlock_scheduler___block_invoke_2;
  v17[3] = &unk_2511EF1A8;
  v18 = v12;
  v19 = v7;
  v13 = v12;
  v14 = v7;
  objc_msgSend(v9, "onScheduler:addFailureBlock:", v8, v17);

  objc_msgSend(v13, "future");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __41__ULFuture__recover_withBlock_scheduler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

void __41__ULFuture__recover_withBlock_scheduler___block_invoke_2(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_finishWithFuture:", v2);

}

+ (id)chain:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    v6 = v5;
  }
  else
  {
    if ((unint64_t)objc_msgSend(v4, "count") < 2)
    {
      v7 = (void *)MEMORY[0x24BDBD1A8];
    }
    else
    {
      objc_msgSend(v4, "subarrayWithRange:", 1, objc_msgSend(v4, "count") - 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __18__ULFuture_chain___block_invoke;
    v17[3] = &unk_2511EF1D0;
    v19 = a1;
    v9 = v7;
    v18 = v9;
    objc_msgSend(v5, "then:", v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __18__ULFuture_chain___block_invoke_2;
    v14[3] = &unk_2511EF1F8;
    v15 = v9;
    v16 = a1;
    v11 = v9;
    objc_msgSend(v10, "recover:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v12;
  }

  return v6;
}

id __18__ULFuture_chain___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 40);
  if (v4 == v3)
    objc_msgSend(v5, "chain:", *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(v5, "futureWithResult:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __18__ULFuture_chain___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "chain:", *(_QWORD *)(a1 + 32));
}

+ (id)join:(id)a3
{
  return (id)objc_msgSend(a1, "_join:ignoreFailures:", a3, 0);
}

+ (id)combine:(id)a3
{
  return (id)objc_msgSend(a1, "_join:ignoreFailures:", a3, 1);
}

+ (id)_join:(id)a3 ignoreFailures:(BOOL)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  id v11;
  dispatch_group_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  dispatch_group_t v32;
  id v33;
  id v34;
  id v35;
  BOOL v36;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    +[ULPromise promise](ULPromise, "promise");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "count");
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      for (i = 0; i != v7; ++i)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:atIndexedSubscript:", v10, i);

      }
    }
    v11 = objc_alloc_init(MEMORY[0x24BDD1648]);
    v12 = dispatch_group_create();
    v13 = MEMORY[0x24BDAC760];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __33__ULFuture__join_ignoreFailures___block_invoke;
    v31[3] = &unk_2511EF270;
    v32 = v12;
    v14 = v11;
    v33 = v14;
    v15 = v8;
    v34 = v15;
    v36 = a4;
    v16 = v6;
    v35 = v16;
    v17 = v12;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v31);
    dispatch_get_global_queue(21, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v24 = v13;
    v25 = 3221225472;
    v26 = __33__ULFuture__join_ignoreFailures___block_invoke_4;
    v27 = &unk_2511EF298;
    v28 = v14;
    v29 = v16;
    v30 = v15;
    v19 = v15;
    v20 = v16;
    v21 = v14;
    dispatch_group_notify(v17, v18, &v24);

    objc_msgSend(v20, "future", v24, v25, v26, v27);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[ULFuture futureWithResult:](ULFuture, "futureWithResult:", MEMORY[0x24BDBD1A8]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

void __33__ULFuture__join_ignoreFailures___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  char v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v5 = *(NSObject **)(a1 + 32);
  v6 = a2;
  dispatch_group_enter(v5);
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __33__ULFuture__join_ignoreFailures___block_invoke_2;
  v12[3] = &unk_2511EF220;
  v13 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  v16 = a3;
  v15 = *(id *)(a1 + 32);
  objc_msgSend(v6, "addSuccessBlock:", v12);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __33__ULFuture__join_ignoreFailures___block_invoke_3;
  v8[3] = &unk_2511EF248;
  v11 = *(_BYTE *)(a1 + 64);
  v9 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v6, "addFailureBlock:", v8);

}

void __33__ULFuture__join_ignoreFailures___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "lock");
  objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", v4, *(_QWORD *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 32), "unlock");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __33__ULFuture__join_ignoreFailures___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (!*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __33__ULFuture__join_ignoreFailures___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "lock");
  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "unlock");
}

+ (id)sequence:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v3, "count") < 2)
    {
      v5 = (void *)MEMORY[0x24BDBD1A8];
    }
    else
    {
      objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "firstObject", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    v10 = MEMORY[0x24BDAC760];
    if (v9)
    {
      v11 = v9;
      v12 = *(_QWORD *)v25;
      do
      {
        v13 = 0;
        v14 = v7;
        do
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v8);
          v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v13);
          v21[0] = v10;
          v21[1] = 3221225472;
          v21[2] = __21__ULFuture_sequence___block_invoke;
          v21[3] = &unk_2511EF2C0;
          v22 = v4;
          v23 = v15;
          objc_msgSend(v14, "then:", v21);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          ++v13;
          v14 = v7;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v11);
    }

    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __21__ULFuture_sequence___block_invoke_2;
    v19[3] = &unk_2511EF2E8;
    v20 = v4;
    v16 = v4;
    objc_msgSend(v7, "then:", v19);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v18;
  }
  else
  {
    +[ULFuture futureWithResult:](ULFuture, "futureWithResult:", MEMORY[0x24BDBD1A8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

id __21__ULFuture_sequence___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return *(id *)(a1 + 40);
}

ULFuture *__21__ULFuture_sequence___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return +[ULFuture futureWithResult:](ULFuture, "futureWithResult:", *(_QWORD *)(a1 + 32));
}

- (ULFuture)init
{
  ULFuture *v2;
  uint64_t v3;
  NSConditionLock *stateLock;
  NSMutableArray *v5;
  NSMutableArray *completionBlocks;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ULFuture;
  v2 = -[ULFuture init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD14D0]), "initWithCondition:", 0);
    stateLock = v2->_stateLock;
    v2->_stateLock = (NSConditionLock *)v3;

    -[NSConditionLock setName:](v2->_stateLock, "setName:", CFSTR("ULFuture state lock"));
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    completionBlocks = v2->_completionBlocks;
    v2->_completionBlocks = v5;

  }
  return v2;
}

- (id)result
{
  return -[ULFuture result:](self, "result:", 0);
}

- (id)resultIfAvailable
{
  return -[ULFuture resultIfAvailable:](self, "resultIfAvailable:", 0);
}

- (id)result:(id *)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULFuture resultBeforeDate:error:](self, "resultBeforeDate:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)resultWithTimeout:(double)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULFuture resultBeforeDate:error:](self, "resultBeforeDate:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)resultIfAvailable:(id *)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULFuture resultBeforeDate:error:](self, "resultBeforeDate:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)resultBeforeDate:(id)a3 error:(id *)a4
{
  id v6;
  NSConditionLock *stateLock;
  NSError *v8;

  if (-[NSConditionLock lockWhenCondition:beforeDate:](self->_stateLock, "lockWhenCondition:beforeDate:", 1, a3))
  {
    v6 = self->_result;
    stateLock = self->_stateLock;
    v8 = self->_error;
    -[NSConditionLock unlock](stateLock, "unlock");
    if (a4)
      *a4 = objc_retainAutorelease(v8);

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ULErrorDomain"), -1, 0);
    v6 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)isFinished
{
  BOOL v3;

  -[NSConditionLock lock](self->_stateLock, "lock");
  v3 = -[ULFuture _nts_isFinished](self, "_nts_isFinished");
  -[NSConditionLock unlock](self->_stateLock, "unlock");
  return v3;
}

- (BOOL)isCancelled
{
  void *v3;
  BOOL v4;

  -[NSConditionLock lock](self->_stateLock, "lock");
  if (-[ULFuture _nts_isFinished](self, "_nts_isFinished"))
  {
    -[NSError domain](self->_error, "domain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isEqual:", *MEMORY[0x24BDD0B88]))
      v4 = -[NSError code](self->_error, "code") == 3072;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }
  -[NSConditionLock unlock](self->_stateLock, "unlock");
  return v4;
}

- (BOOL)tryCancel
{
  void *v3;
  _BOOL4 v4;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3072, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ULFuture finishWithResult:error:](self, "finishWithResult:error:", 0, v3);

  if (v4)
    -[ULFuture didCancel](self, "didCancel");
  return v4;
}

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  _BOOL4 v9;
  NSError *v10;
  NSError *error;

  v7 = a3;
  v8 = a4;
  -[NSConditionLock lock](self->_stateLock, "lock");
  v9 = -[ULFuture _nts_isFinished](self, "_nts_isFinished");
  if (v9)
  {
    -[NSConditionLock unlock](self->_stateLock, "unlock");
  }
  else
  {
    objc_storeStrong(&self->_result, a3);
    v10 = (NSError *)objc_msgSend(v8, "copy");
    error = self->_error;
    self->_error = v10;

    -[NSConditionLock unlockWithCondition:](self->_stateLock, "unlockWithCondition:", 1);
    -[ULFuture _flushCompletionBlocks](self, "_flushCompletionBlocks");
  }

  return !v9;
}

- (void)_finishWithFuture:(id)a3
{
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __30__ULFuture__finishWithFuture___block_invoke;
  v7[3] = &unk_2511EF180;
  v7[4] = self;
  v5 = a3;
  objc_msgSend(v5, "addSuccessBlock:", v7);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __30__ULFuture__finishWithFuture___block_invoke_2;
  v6[3] = &unk_2511EF158;
  v6[4] = self;
  objc_msgSend(v5, "addFailureBlock:", v6);

}

uint64_t __30__ULFuture__finishWithFuture___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

uint64_t __30__ULFuture__finishWithFuture___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (BOOL)finishWithResult:(id)a3
{
  return -[ULFuture finishWithResult:error:](self, "finishWithResult:error:", a3, 0);
}

- (BOOL)finishWithError:(id)a3
{
  return -[ULFuture finishWithResult:error:](self, "finishWithResult:error:", 0, a3);
}

- (id)completionHandlerAdapter
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__ULFuture_completionHandlerAdapter__block_invoke;
  v5[3] = &unk_2511EF310;
  v5[4] = self;
  v2 = (void *)MEMORY[0x2426A121C](v5, a2);
  v3 = (void *)MEMORY[0x2426A121C]();

  return v3;
}

uint64_t __36__ULFuture_completionHandlerAdapter__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

- (id)BOOLErrorCompletionHandlerAdapter
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__ULFuture_BOOLErrorCompletionHandlerAdapter__block_invoke;
  v5[3] = &unk_2511EF338;
  v5[4] = self;
  v2 = (void *)MEMORY[0x2426A121C](v5, a2);
  v3 = (void *)MEMORY[0x2426A121C]();

  return v3;
}

void __45__ULFuture_BOOLErrorCompletionHandlerAdapter__block_invoke(uint64_t a1, int a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishWithResult:", v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
  }
}

- (id)errorOnlyCompletionHandlerAdapter
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__ULFuture_errorOnlyCompletionHandlerAdapter__block_invoke;
  v5[3] = &unk_2511EF158;
  v5[4] = self;
  v2 = (void *)MEMORY[0x2426A121C](v5, a2);
  v3 = (void *)MEMORY[0x2426A121C]();

  return v3;
}

void __45__ULFuture_errorOnlyCompletionHandlerAdapter__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishWithResult:", v3);

  }
}

- (BOOL)_nts_isFinished
{
  return -[NSConditionLock condition](self->_stateLock, "condition") == 1;
}

- (void)addSuccessBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __28__ULFuture_addSuccessBlock___block_invoke;
  v7[3] = &unk_2511EF360;
  v8 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x2426A121C](v7);
  -[ULFuture _addCompletionBlock:](self, "_addCompletionBlock:", v6);

}

uint64_t __28__ULFuture_addSuccessBlock___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)onScheduler:(id)a3 addSuccessBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __40__ULFuture_onScheduler_addSuccessBlock___block_invoke;
  v10[3] = &unk_2511EF388;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[ULFuture addSuccessBlock:](self, "addSuccessBlock:", v10);

}

void __40__ULFuture_onScheduler_addSuccessBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__ULFuture_onScheduler_addSuccessBlock___block_invoke_2;
  v7[3] = &unk_2511EF0B8;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "performAsyncBlock:", v7);

}

uint64_t __40__ULFuture_onScheduler_addSuccessBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)addFailureBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __28__ULFuture_addFailureBlock___block_invoke;
  v7[3] = &unk_2511EF360;
  v8 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x2426A121C](v7);
  -[ULFuture _addCompletionBlock:](self, "_addCompletionBlock:", v6);

}

uint64_t __28__ULFuture_addFailureBlock___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)onScheduler:(id)a3 addFailureBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __40__ULFuture_onScheduler_addFailureBlock___block_invoke;
  v10[3] = &unk_2511EF3B0;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[ULFuture addFailureBlock:](self, "addFailureBlock:", v10);

}

void __40__ULFuture_onScheduler_addFailureBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__ULFuture_onScheduler_addFailureBlock___block_invoke_2;
  v7[3] = &unk_2511EF0B8;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "performAsyncBlock:", v7);

}

uint64_t __40__ULFuture_onScheduler_addFailureBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_addCompletionBlock:(id)a3
{
  NSMutableArray *completionBlocks;
  void *v5;
  void (**v6)(id, id, NSError *);

  v6 = (void (**)(id, id, NSError *))a3;
  -[NSConditionLock lock](self->_stateLock, "lock");
  if (-[ULFuture _nts_isFinished](self, "_nts_isFinished"))
  {
    -[NSConditionLock unlock](self->_stateLock, "unlock");
    v6[2](v6, self->_result, self->_error);
  }
  else
  {
    completionBlocks = self->_completionBlocks;
    v5 = (void *)MEMORY[0x2426A121C](v6);
    -[NSMutableArray addObject:](completionBlocks, "addObject:", v5);

    -[NSConditionLock unlock](self->_stateLock, "unlock");
  }

}

- (void)_flushCompletionBlocks
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[NSConditionLock lock](self->_stateLock, "lock");
  v3 = (void *)-[NSMutableArray copy](self->_completionBlocks, "copy");
  -[NSMutableArray removeAllObjects](self->_completionBlocks, "removeAllObjects");
  -[NSConditionLock unlock](self->_stateLock, "unlock");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)always:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[ULScheduler immediateScheduler](ULScheduler, "immediateScheduler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ULFuture onScheduler:always:](self, "onScheduler:always:", v5, v4);

}

- (void)onScheduler:(id)a3 always:(id)a4
{
  +[ULFuture _always:withBlock:scheduler:](ULFuture, "_always:withBlock:scheduler:", self, a4, a3);
}

- (id)then:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[ULScheduler immediateScheduler](ULScheduler, "immediateScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULFuture onScheduler:then:](self, "onScheduler:then:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)onScheduler:(id)a3 then:(id)a4
{
  return +[ULFuture _then:withBlock:scheduler:](ULFuture, "_then:withBlock:scheduler:", self, a4, a3);
}

- (id)recover:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[ULScheduler immediateScheduler](ULScheduler, "immediateScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULFuture onScheduler:recover:](self, "onScheduler:recover:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)onScheduler:(id)a3 recover:(id)a4
{
  return +[ULFuture _recover:withBlock:scheduler:](ULFuture, "_recover:withBlock:scheduler:", self, a4, a3);
}

- (id)map:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[ULScheduler immediateScheduler](ULScheduler, "immediateScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULFuture onScheduler:map:](self, "onScheduler:map:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)onScheduler:(id)a3 map:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __28__ULFuture_onScheduler_map___block_invoke;
  v10[3] = &unk_2511EF3D8;
  v11 = v6;
  v7 = v6;
  -[ULFuture onScheduler:then:](self, "onScheduler:then:", a3, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __28__ULFuture_onScheduler_map___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    +[ULFuture futureWithResult:](ULFuture, "futureWithResult:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[ULFuture futureWithResult:](ULFuture, "futureWithResult:", v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_result, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
}

@end
