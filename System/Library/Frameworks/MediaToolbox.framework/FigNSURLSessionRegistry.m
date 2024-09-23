@implementation FigNSURLSessionRegistry

- (void)copySessionAndAssertionForClientBundleIdentifier:(id)a3 clientPersonaIdentifier:(id)a4 dispatchQueue:(id)a5 outSession:(id *)a6 outAssertion:(FigOpaqueAssertion *)a7
{
  NSObject *workQueue;
  _QWORD block[11];
  _QWORD v15[6];

  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3052000000;
  v15[3] = __Block_byref_object_copy__8;
  v15[4] = __Block_byref_object_dispose__8;
  v15[5] = 0;
  if (figNSURLSessionRegistryEnsureGlobalInit_sFigNSURLSessionInit != -1)
    dispatch_once(&figNSURLSessionRegistryEnsureGlobalInit_sFigNSURLSessionInit, &__block_literal_global_86);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __138__FigNSURLSessionRegistry_copySessionAndAssertionForClientBundleIdentifier_clientPersonaIdentifier_dispatchQueue_outSession_outAssertion___block_invoke;
  block[3] = &unk_1E2FAE670;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = a5;
  block[8] = v15;
  block[9] = a7;
  block[10] = a6;
  dispatch_sync(workQueue, block);
  _Block_object_dispose(v15, 8);
}

void __138__FigNSURLSessionRegistry_copySessionAndAssertionForClientBundleIdentifier_clientPersonaIdentifier_dispatchQueue_outSession_outAssertion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  __int128 v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t *v9;
  _QWORD v10[3];
  int v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __138__FigNSURLSessionRegistry_copySessionAndAssertionForClientBundleIdentifier_clientPersonaIdentifier_dispatchQueue_outSession_outAssertion___block_invoke_2;
  v4[3] = &unk_1E2FAE648;
  v5 = *(_OWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = v10;
  v8 = v3;
  v9 = &v12;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);
  if (!*((_DWORD *)v13 + 6))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = -[FigNSURLSession initWithClientBundleIdentifier:clientPersonaIdentifier:dispatchQueue:]([FigNSURLSession alloc], "initWithClientBundleIdentifier:clientPersonaIdentifier:dispatchQueue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  }
  **(_QWORD **)(a1 + 72) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "acquireAssertion");
  **(_QWORD **)(a1 + 80) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v12, 8);
}

void __138__FigNSURLSessionRegistry_copySessionAndAssertionForClientBundleIdentifier_clientPersonaIdentifier_dispatchQueue_outSession_outAssertion___block_invoke_2(_QWORD *a1, void *a2)
{
  id v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    ++*(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
    if (objc_msgSend((id)objc_msgSend(a2, "clientBundleIdentifier"), "isEqual:", a1[4]))
    {
      if (((objc_msgSend((id)objc_msgSend(a2, "clientPersonaIdentifier"), "isEqual:", a1[5]) & 1) != 0
         || !objc_msgSend(a2, "clientPersonaIdentifier") && !a1[5])
        && objc_msgSend(a2, "dispatchQueue") == a1[6])
      {
        v4 = a2;

        *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40) = a2;
        ++*(_DWORD *)(*(_QWORD *)(a1[9] + 8) + 24);
      }
    }
  }
}

- (void)_checkForDoom:(id)a3
{
  uint64_t UpTimeNanoseconds;
  int64_t v6;
  FigNSURLSessionRegistry *v7;
  id v8;
  dispatch_time_t v9;
  NSObject *workQueue;
  _QWORD v11[6];

  UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  if ((int)objc_msgSend(a3, "assertionCount") > 0 || !objc_msgSend(a3, "doomTime"))
    goto LABEL_2;
  if (UpTimeNanoseconds >= objc_msgSend(a3, "doomTime"))
  {
    objc_msgSend(a3, "releaseOSTransaction");
    -[NSMutableArray removeObject:](self->_sessionArray, "removeObject:", a3);
LABEL_2:
    objc_msgSend(a3, "setDoomCheckScheduled:", 0);
    return;
  }
  v6 = objc_msgSend(a3, "doomTime") - UpTimeNanoseconds;
  objc_msgSend(a3, "setDoomCheckScheduled:", 1);
  v7 = self;
  v8 = a3;
  v9 = dispatch_time(0, v6);
  workQueue = self->_workQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__FigNSURLSessionRegistry__checkForDoom___block_invoke;
  v11[3] = &unk_1E2F8AEF0;
  v11[4] = self;
  v11[5] = a3;
  dispatch_after(v9, workQueue, v11);
}

void __41__FigNSURLSessionRegistry__checkForDoom___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_checkForDoom:", *(_QWORD *)(a1 + 40));

}

- (void)releaseSession:(id)a3
{
  id v5;
  NSObject *workQueue;
  _QWORD v7[6];

  v5 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__FigNSURLSessionRegistry_releaseSession___block_invoke;
  v7[3] = &unk_1E2F8AEF0;
  v7[4] = a3;
  v7[5] = self;
  dispatch_async(workQueue, v7);
}

void __42__FigNSURLSessionRegistry_releaseSession___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  dispatch_time_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[6];

  objc_msgSend(*(id *)(a1 + 32), "setAssertionCount:", objc_msgSend(*(id *)(a1 + 32), "assertionCount") - 1);
  if ((int)objc_msgSend(*(id *)(a1 + 32), "assertionCount") <= 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setDoomTime:", FigGetUpTimeNanoseconds() + 1000000000 * (int)objc_msgSend(*(id *)(a1 + 32), "deferReleaseSeconds"));
    if ((objc_msgSend(*(id *)(a1 + 32), "doomCheckScheduled") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "setDoomCheckScheduled:", 1);
      if ((int)objc_msgSend(*(id *)(a1 + 32), "deferReleaseSeconds") >= 1
        && objc_msgSend(*(id *)(a1 + 32), "acquireOSTransaction"))
      {
        v2 = *(id *)(a1 + 40);
        v3 = *(id *)(a1 + 32);
        v4 = dispatch_time(0, 1000000000 * (int)objc_msgSend(*(id *)(a1 + 32), "deferReleaseSeconds"));
        v8[0] = MEMORY[0x1E0C809B0];
        v6 = *(_QWORD *)(a1 + 32);
        v5 = *(_QWORD *)(a1 + 40);
        v7 = *(NSObject **)(v5 + 8);
        v8[2] = __42__FigNSURLSessionRegistry_releaseSession___block_invoke_2;
        v8[3] = &unk_1E2F8AEF0;
        v8[1] = 3221225472;
        v8[4] = v5;
        v8[5] = v6;
        dispatch_after(v4, v7, v8);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "_checkForDoom:", *(_QWORD *)(a1 + 32));
      }
    }
  }

}

void __42__FigNSURLSessionRegistry_releaseSession___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_checkForDoom:", *(_QWORD *)(a1 + 40));

}

- (FigNSURLSessionRegistry)init
{
  FigNSURLSessionRegistry *v2;
  dispatch_queue_t v3;
  NSMutableArray *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigNSURLSessionRegistry;
  v2 = -[FigNSURLSessionRegistry init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.coremedia.fignsurlsessionregistry.work", 0);
    v2->_workQueue = (OS_dispatch_queue *)v3;
    if (!v3 || (v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]), (v2->_sessionArray = v4) == 0))
    {
      if (FigSignalErrorAt())
      {

        return 0;
      }
    }
  }
  return v2;
}

- (void)dealloc
{
  NSObject *workQueue;
  objc_super v4;

  workQueue = self->_workQueue;
  if (workQueue)
    dispatch_release(workQueue);
  v4.receiver = self;
  v4.super_class = (Class)FigNSURLSessionRegistry;
  -[FigNSURLSessionRegistry dealloc](&v4, sel_dealloc);
}

@end
