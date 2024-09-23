@implementation MFMessageContentRequestScheduler

void __61___MFMessageContentRequestScheduler_afterDelay_performBlock___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;

  v2 = a1[4];
  v3 = (void *)a1[5];
  v4 = *(void **)(v2 + 24);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61___MFMessageContentRequestScheduler_afterDelay_performBlock___block_invoke_2;
  v7[3] = &unk_1E4E8DE10;
  v7[4] = v2;
  v5 = v3;
  v6 = a1[6];
  v8 = v5;
  v9 = v6;
  objc_msgSend(v4, "performDatabaseWorkInBlockWithHighPriority:", v7);

}

void __61___MFMessageContentRequestScheduler_afterDelay_performBlock___block_invoke_2(uint64_t a1)
{
  -[_MFMessageContentRequestScheduler performBlockWithActivity:requestID:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __50___MFMessageContentRequestScheduler_performBlock___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;

  v2 = a1[4];
  v3 = (void *)a1[5];
  v4 = *(void **)(v2 + 24);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50___MFMessageContentRequestScheduler_performBlock___block_invoke_2;
  v7[3] = &unk_1E4E8DE10;
  v7[4] = v2;
  v5 = v3;
  v6 = a1[6];
  v8 = v5;
  v9 = v6;
  objc_msgSend(v4, "performDatabaseWorkInBlockWithHighPriority:", v7);

}

void __50___MFMessageContentRequestScheduler_performBlock___block_invoke_2(uint64_t a1)
{
  -[_MFMessageContentRequestScheduler performBlockWithActivity:requestID:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __60___MFMessageContentRequestScheduler_performCancelableBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id location;

  v3 = a2;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60___MFMessageContentRequestScheduler_performCancelableBlock___block_invoke_2;
  v7[3] = &unk_1E4E8DE38;
  objc_copyWeak(&v10, &location);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "performDatabaseWorkInBlockWithHighPriority:", v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __60___MFMessageContentRequestScheduler_performCancelableBlock___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[1];
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0D1E158], "signpostLog");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = v3[1];
      if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4F90000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "MFMessageContentRequestScheduler", "Begin work on scheduler", buf, 2u);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0D1E158], "signpostLog");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = v3[1];
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
      {
        *(_WORD *)v11 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4F90000, v9, OS_SIGNPOST_INTERVAL_END, v10, "MFMessageContentRequestScheduler", "End work on scheduler", v11, 2u);
      }

    }
  }

}

void __54___MFMessageContentRequestScheduler_performSyncBlock___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;

  v2 = a1[4];
  v3 = (void *)a1[5];
  v4 = *(void **)(v2 + 24);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54___MFMessageContentRequestScheduler_performSyncBlock___block_invoke_2;
  v7[3] = &unk_1E4E8DE10;
  v7[4] = v2;
  v5 = v3;
  v6 = a1[6];
  v8 = v5;
  v9 = v6;
  objc_msgSend(v4, "performDatabaseWorkInBlockWithHighPriority:", v7);

}

void __54___MFMessageContentRequestScheduler_performSyncBlock___block_invoke_2(uint64_t a1)
{
  -[_MFMessageContentRequestScheduler performBlockWithActivity:requestID:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __61___MFMessageContentRequestScheduler_performSyncBarrierBlock___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;

  v2 = a1[4];
  v3 = (void *)a1[5];
  v4 = *(void **)(v2 + 24);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61___MFMessageContentRequestScheduler_performSyncBarrierBlock___block_invoke_2;
  v7[3] = &unk_1E4E8DE10;
  v7[4] = v2;
  v5 = v3;
  v6 = a1[6];
  v8 = v5;
  v9 = v6;
  objc_msgSend(v4, "performDatabaseWorkInBlockWithHighPriority:", v7);

}

void __61___MFMessageContentRequestScheduler_performSyncBarrierBlock___block_invoke_2(uint64_t a1)
{
  -[_MFMessageContentRequestScheduler performBlockWithActivity:requestID:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __67___MFMessageContentRequestScheduler_performVoucherPreservingBlock___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;

  v2 = a1[4];
  v3 = (void *)a1[5];
  v4 = *(void **)(v2 + 24);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67___MFMessageContentRequestScheduler_performVoucherPreservingBlock___block_invoke_2;
  v7[3] = &unk_1E4E8DE10;
  v7[4] = v2;
  v5 = v3;
  v6 = a1[6];
  v8 = v5;
  v9 = v6;
  objc_msgSend(v4, "performDatabaseWorkInBlockWithHighPriority:", v7);

}

void __67___MFMessageContentRequestScheduler_performVoucherPreservingBlock___block_invoke_2(uint64_t a1)
{
  -[_MFMessageContentRequestScheduler performBlockWithActivity:requestID:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end
