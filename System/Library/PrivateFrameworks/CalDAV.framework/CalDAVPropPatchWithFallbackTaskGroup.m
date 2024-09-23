@implementation CalDAVPropPatchWithFallbackTaskGroup

- (CalDAVPropPatchWithFallbackTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4 primaryPropertiesToSet:(id)a5 fallbackPropertiesToSet:(id)a6 atURL:(id)a7
{
  id v13;
  id v14;
  id v15;
  CalDAVPropPatchWithFallbackTaskGroup *v16;
  CalDAVPropPatchWithFallbackTaskGroup *v17;
  objc_super v19;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)CalDAVPropPatchWithFallbackTaskGroup;
  v16 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v19, sel_initWithAccountInfoProvider_taskManager_, a3, a4);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_primaryElements, a5);
    objc_storeStrong((id *)&v17->_fallbackElements, a6);
    objc_storeStrong((id *)&v17->_url, a7);
  }

  return v17;
}

- (void)_proppatchAfterFailureCount:(unint64_t)a3
{
  int *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  CalDAVPropPatchWithFallbackTaskGroup *v14;
  id v15[2];
  id location;

  v5 = &OBJC_IVAR___CalDAVPropPatchWithFallbackTaskGroup__fallbackElements;
  if (!a3)
    v5 = &OBJC_IVAR___CalDAVPropPatchWithFallbackTaskGroup__primaryElements;
  v6 = *(id *)((char *)&self->super.super.isa + *v5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1ABA8]), "initWithPropertiesToSet:andRemove:atURL:", v6, 0, self->_url);
  -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccountInfoProvider:", v8);

  objc_initWeak(&location, v7);
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __68__CalDAVPropPatchWithFallbackTaskGroup__proppatchAfterFailureCount___block_invoke;
  v13 = &unk_24C1FB610;
  objc_copyWeak(v15, &location);
  v15[1] = (id)a3;
  v14 = self;
  objc_msgSend(v7, "setCompletionBlock:", &v10);
  -[CoreDAVTaskGroup taskManager](self, "taskManager", v10, v11, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "submitQueuedCoreDAVTask:", v7);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

}

void __68__CalDAVPropPatchWithFallbackTaskGroup__proppatchAfterFailureCount___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || *(_QWORD *)(a1 + 48))
  {

LABEL_4:
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "responseItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setResponseItem:", v7);

    v8 = *(void **)(a1 + 32);
    v11 = objc_loadWeakRetained(v2);
    objc_msgSend(v11, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v9, 0);

    return;
  }
  v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "count");

  if (!v10)
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 32), "_proppatchAfterFailureCount:", *(_QWORD *)(a1 + 48) + 1);
}

- (void)startTaskGroup
{
  -[CalDAVPropPatchWithFallbackTaskGroup _proppatchAfterFailureCount:](self, "_proppatchAfterFailureCount:", 0);
}

- (CoreDAVResponseItem)responseItem
{
  return self->_responseItem;
}

- (void)setResponseItem:(id)a3
{
  objc_storeStrong((id *)&self->_responseItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseItem, 0);
  objc_storeStrong((id *)&self->_fallbackElements, 0);
  objc_storeStrong((id *)&self->_primaryElements, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
