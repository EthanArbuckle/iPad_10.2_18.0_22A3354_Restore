@implementation LSContextAddChangeObserver

void ___LSContextAddChangeObserver_block_invoke(uint64_t a1)
{
  unsigned __int8 *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 24);
  _LSGetDispatchTokenQueue();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = ___LSContextAddChangeObserver_block_invoke_2;
  v4[3] = &unk_1E10422C8;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  _LSDispatchCoalescedAfterDelay(v2, v3, v4, 0.25);

}

void ___LSContextAddChangeObserver_block_invoke_2(uint64_t a1)
{
  void (**v2)(_QWORD);
  id v3;
  id v4;
  void **v5;
  id v6;
  char v7;
  id v8;

  v2 = (void (**)(_QWORD))MEMORY[0x186DAE9BC](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  if (v2)
  {
    v8 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    if (LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v5, *(_LSDServiceDomain **)(a1 + 40), 0))
    {
      v2[2](v2);
    }
    if (v5 && v7)
      _LSContextDestroy(v5);
    v3 = v6;
    v5 = 0;
    v6 = 0;

    v7 = 0;
    v4 = v8;
    v8 = 0;

  }
}

uint64_t ___LSContextAddChangeObserver_block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)gChangeObservers;
  if (!gChangeObservers)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = (void *)gChangeObservers;
    gChangeObservers = (uint64_t)v3;

    v2 = (void *)gChangeObservers;
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));
}

@end
