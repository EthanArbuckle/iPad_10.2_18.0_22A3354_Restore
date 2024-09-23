@implementation BLTSettingSyncSendQueue

- (BLTSettingSyncSendQueue)init
{
  return -[BLTSettingSyncSendQueue initWithMaxConcurrentSendCount:](self, "initWithMaxConcurrentSendCount:", 1);
}

- (BLTSettingSyncSendQueue)initWithMaxConcurrentSendCount:(unint64_t)a3
{
  BLTSettingSyncSendQueue *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *sectionInfoSenderQueue;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *sectionInfoProcessingQueue;
  dispatch_semaphore_t v11;
  OS_dispatch_semaphore *sectionInfoSemaphore;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *subsectionParameterIconSenderQueue;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *subsectionParameterIconProcessingQueue;
  dispatch_semaphore_t v19;
  OS_dispatch_semaphore *subsectionParameterIconSemaphore;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)BLTSettingSyncSendQueue;
  v4 = -[BLTSettingSyncSendQueue init](&v22, sel_init);
  if (v4)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.bulletindistributord.sectioninfosenderqueue", v5);
    sectionInfoSenderQueue = v4->_sectionInfoSenderQueue;
    v4->_sectionInfoSenderQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.bulletindistributord.sectioninfoprocessingqueue", v8);
    sectionInfoProcessingQueue = v4->_sectionInfoProcessingQueue;
    v4->_sectionInfoProcessingQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_semaphore_create(a3);
    sectionInfoSemaphore = v4->_sectionInfoSemaphore;
    v4->_sectionInfoSemaphore = (OS_dispatch_semaphore *)v11;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.bulletindistributord.subsectionparametericonsenderqueue", v13);
    subsectionParameterIconSenderQueue = v4->_subsectionParameterIconSenderQueue;
    v4->_subsectionParameterIconSenderQueue = (OS_dispatch_queue *)v14;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.bulletindistributord.subsectionparametericonprocessingqueue", v16);
    subsectionParameterIconProcessingQueue = v4->_subsectionParameterIconProcessingQueue;
    v4->_subsectionParameterIconProcessingQueue = (OS_dispatch_queue *)v17;

    v19 = dispatch_semaphore_create(a3);
    subsectionParameterIconSemaphore = v4->_subsectionParameterIconSemaphore;
    v4->_subsectionParameterIconSemaphore = (OS_dispatch_semaphore *)v19;

  }
  return v4;
}

- (void)_sendSectionInfoWithSectionID:(unint64_t)a3 usingProvider:(id)a4 updateProgress:(id)a5 sendCompleted:(id)a6 sendAttempt:(unint64_t)a7 waitForAcknowledgement:(BOOL)a8 group:(id)a9 spoolToFile:(BOOL)a10
{
  void (**v14)(id, unint64_t);
  void (**v15)(_QWORD);
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  OS_dispatch_queue *sectionInfoProcessingQueue;
  _BOOL4 v25;
  _QWORD v26[5];
  id v27;
  id v28;
  void (**v29)(_QWORD);
  id v30;
  void (**v31)(id, unint64_t);
  unint64_t v32;
  unint64_t v33;
  BOOL v34;
  BOOL v35;
  os_activity_scope_state_s state;

  v25 = a8;
  v14 = (void (**)(id, unint64_t))a4;
  v15 = (void (**)(_QWORD))a5;
  v16 = a6;
  v17 = a9;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sectionInfoSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v18 = _os_activity_create(&dword_2173D9000, "Send Section Info", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v18, &state);
  v19 = (void *)MEMORY[0x219A0BFAC]();
  v14[2](v14, a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sectionID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v20)
  {
    sectionInfoProcessingQueue = self->_sectionInfoProcessingQueue;
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __153__BLTSettingSyncSendQueue__sendSectionInfoWithSectionID_usingProvider_updateProgress_sendCompleted_sendAttempt_waitForAcknowledgement_group_spoolToFile___block_invoke;
    v26[3] = &unk_24D762420;
    v26[4] = self;
    v27 = v21;
    v34 = v25;
    v35 = a10;
    v29 = v15;
    v30 = v16;
    v32 = a7;
    v28 = v17;
    v33 = a3;
    v31 = v14;
    -[BLTSettingSyncSendQueue _sendEffectiveSectionInfo:waitForAcknowledgement:withQueue:spoolToFile:andCompletion:](self, "_sendEffectiveSectionInfo:waitForAcknowledgement:withQueue:spoolToFile:andCompletion:", v20, v25, sectionInfoProcessingQueue, a10, v26);

  }
  else
  {
    v15[2](v15);
    (*((void (**)(id, _QWORD))v16 + 2))(v16, 0);
  }

  objc_autoreleasePoolPop(v19);
  os_activity_scope_leave(&state);

}

void __153__BLTSettingSyncSendQueue__sendSectionInfoWithSectionID_usingProvider_updateProgress_sendCompleted_sendAttempt_waitForAcknowledgement_group_spoolToFile___block_invoke(uint64_t a1, int a2, int a3)
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  unint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  _QWORD block[5];
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  _QWORD v46[4];
  id v47;
  uint64_t v48;
  id v49;
  id v50;
  __int16 v51;
  char v52;
  uint8_t buf[4];
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  blt_settings_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!a2 || !a3)
  {
    if (a2)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v54 = v14;
        _os_log_impl(&dword_2173D9000, v7, OS_LOG_TYPE_DEFAULT, "Sent section info but nano failed to acknowledge with section ID %@", buf, 0xCu);
      }

      blt_settings_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(_QWORD *)(a1 + 80);
        *(_DWORD *)buf = 134217984;
        v54 = v16;
        _os_log_impl(&dword_2173D9000, v15, OS_LOG_TYPE_DEFAULT, "Current send attempts: %lu", buf, 0xCu);
      }

      v17 = *(_QWORD *)(a1 + 80);
      blt_settings_log();
      v18 = objc_claimAutoreleasedReturnValue();
      v7 = v18;
      if (v17 < 3)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v31 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138412290;
          v54 = v31;
          _os_log_impl(&dword_2173D9000, v7, OS_LOG_TYPE_DEFAULT, "Enqueuing section ID %@ for future resend attempt", buf, 0xCu);
        }

        dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
        v32 = *(_QWORD *)(a1 + 32);
        v33 = *(NSObject **)(v32 + 8);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __153__BLTSettingSyncSendQueue__sendSectionInfoWithSectionID_usingProvider_updateProgress_sendCompleted_sendAttempt_waitForAcknowledgement_group_spoolToFile___block_invoke_9;
        block[3] = &unk_24D7623F8;
        v34 = *(_QWORD *)(a1 + 88);
        block[4] = v32;
        v42 = v34;
        v39 = *(id *)(a1 + 72);
        v40 = *(id *)(a1 + 56);
        v35 = *(id *)(a1 + 64);
        v36 = *(_QWORD *)(a1 + 80);
        v41 = v35;
        v43 = v36;
        v44 = *(_BYTE *)(a1 + 96);
        v38 = *(id *)(a1 + 48);
        v45 = *(_BYTE *)(a1 + 97);
        dispatch_async(v33, block);

        goto LABEL_24;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __153__BLTSettingSyncSendQueue__sendSectionInfoWithSectionID_usingProvider_updateProgress_sendCompleted_sendAttempt_waitForAcknowledgement_group_spoolToFile___block_invoke_cold_1(a1, v7, v19, v20, v21, v22, v23, v24);
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __153__BLTSettingSyncSendQueue__sendSectionInfoWithSectionID_usingProvider_updateProgress_sendCompleted_sendAttempt_waitForAcknowledgement_group_spoolToFile___block_invoke_cold_2(a1, v7, v25, v26, v27, v28, v29, v30);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_24:
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    return;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2173D9000, v7, OS_LOG_TYPE_DEFAULT, "Section info sent", buf, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "BOOLValue")
    && (objc_msgSend(*(id *)(a1 + 32), "sectionParametersProvider"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    objc_msgSend(*(id *)(a1 + 32), "sectionParametersProvider");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 40);
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __153__BLTSettingSyncSendQueue__sendSectionInfoWithSectionID_usingProvider_updateProgress_sendCompleted_sendAttempt_waitForAcknowledgement_group_spoolToFile___block_invoke_5;
    v46[3] = &unk_24D7623D0;
    v12 = v11;
    v13 = *(_QWORD *)(a1 + 32);
    v47 = v12;
    v48 = v13;
    v51 = *(_WORD *)(a1 + 96);
    v49 = *(id *)(a1 + 56);
    v50 = *(id *)(a1 + 64);
    v52 = a3;
    ((void (**)(_QWORD, id, _QWORD *))v10)[2](v10, v12, v46);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __153__BLTSettingSyncSendQueue__sendSectionInfoWithSectionID_usingProvider_updateProgress_sendCompleted_sendAttempt_waitForAcknowledgement_group_spoolToFile___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  char v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  blt_settings_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v15 = v5;
    _os_log_impl(&dword_2173D9000, v4, OS_LOG_TYPE_DEFAULT, "Attempting to send subsection parameter icons for section ID %@", buf, 0xCu);
  }

  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v8 = *(unsigned __int8 *)(a1 + 64);
  v9 = *(unsigned __int8 *)(a1 + 65);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __153__BLTSettingSyncSendQueue__sendSectionInfoWithSectionID_usingProvider_updateProgress_sendCompleted_sendAttempt_waitForAcknowledgement_group_spoolToFile___block_invoke_6;
  v10[3] = &unk_24D7623A8;
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v13 = *(_BYTE *)(a1 + 66);
  objc_msgSend(v6, "sendSectionSubtypeParameterIcons:sectionID:waitForAcknowledgement:spoolToFile:completion:", v3, v7, v8, v9, v10);

}

uint64_t __153__BLTSettingSyncSendQueue__sendSectionInfoWithSectionID_usingProvider_updateProgress_sendCompleted_sendAttempt_waitForAcknowledgement_group_spoolToFile___block_invoke_6(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __153__BLTSettingSyncSendQueue__sendSectionInfoWithSectionID_usingProvider_updateProgress_sendCompleted_sendAttempt_waitForAcknowledgement_group_spoolToFile___block_invoke_9(uint64_t a1)
{
  uint64_t v2;

  LOBYTE(v2) = *(_BYTE *)(a1 + 89);
  return objc_msgSend(*(id *)(a1 + 32), "_sendSectionInfoWithSectionID:usingProvider:updateProgress:sendCompleted:sendAttempt:waitForAcknowledgement:group:spoolToFile:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 80) + 1, *(unsigned __int8 *)(a1 + 88), *(_QWORD *)(a1 + 40), v2);
}

- (void)sendEffectiveSectionInfosUsingProvider:(id)a3 count:(unint64_t)a4 sectionInfoSendCompleted:(id)a5 completion:(id)a6 progress:(id)a7 spoolToFile:(BOOL)a8
{
  id v14;
  id v15;
  dispatch_group_t v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *sectionInfoSenderQueue;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD *v33;
  unint64_t v34;
  _QWORD block[5];
  NSObject *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  BOOL v42;
  _QWORD v43[4];
  NSObject *v44;
  BLTSettingSyncSendQueue *v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD *v50;
  unint64_t v51;
  _QWORD v52[4];
  uint8_t buf[4];
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v30 = a3;
  v14 = a5;
  v29 = a6;
  v15 = a7;
  v16 = dispatch_group_create();
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x2020000000;
  v52[3] = 0;
  v17 = objc_alloc_init(MEMORY[0x24BDD1648]);
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __129__BLTSettingSyncSendQueue_sendEffectiveSectionInfosUsingProvider_count_sectionInfoSendCompleted_completion_progress_spoolToFile___block_invoke;
  v47[3] = &unk_24D762448;
  v28 = v17;
  v48 = v28;
  v50 = v52;
  v18 = v15;
  v49 = v18;
  v51 = a4;
  v19 = (void *)MEMORY[0x219A0C15C](v47);
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __129__BLTSettingSyncSendQueue_sendEffectiveSectionInfosUsingProvider_count_sectionInfoSendCompleted_completion_progress_spoolToFile___block_invoke_2;
  v43[3] = &unk_24D762498;
  v27 = v14;
  v46 = v27;
  v20 = v16;
  v44 = v20;
  v45 = self;
  v21 = (void *)MEMORY[0x219A0C15C](v43);
  if (a4)
  {
    v22 = 0;
    do
    {
      blt_settings_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v54 = v22;
        _os_log_impl(&dword_2173D9000, v23, OS_LOG_TYPE_DEFAULT, "Queueing section ID Index %lu for send", buf, 0xCu);
      }

      dispatch_group_enter(v20);
      sectionInfoSenderQueue = self->_sectionInfoSenderQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __129__BLTSettingSyncSendQueue_sendEffectiveSectionInfosUsingProvider_count_sectionInfoSendCompleted_completion_progress_spoolToFile___block_invoke_12;
      block[3] = &unk_24D7624E8;
      block[4] = self;
      v41 = v22;
      v37 = v30;
      v38 = v19;
      v39 = v21;
      v40 = v18;
      v36 = v20;
      v42 = a8;
      dispatch_async(sectionInfoSenderQueue, block);

      ++v22;
    }
    while (a4 != v22);
  }
  v25 = self->_sectionInfoSenderQueue;
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __129__BLTSettingSyncSendQueue_sendEffectiveSectionInfosUsingProvider_count_sectionInfoSendCompleted_completion_progress_spoolToFile___block_invoke_3_15;
  v31[3] = &unk_24D762510;
  v33 = v52;
  v34 = a4;
  v32 = v29;
  v26 = v29;
  dispatch_group_notify(v20, v25, v31);

  _Block_object_dispose(v52, 8);
}

uint64_t __129__BLTSettingSyncSendQueue_sendEffectiveSectionInfosUsingProvider_count_sectionInfoSendCompleted_completion_progress_spoolToFile___block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "lock");
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(double))(v2 + 16))((double)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)/ (double)*(unint64_t *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 32), "unlock");
}

void __129__BLTSettingSyncSendQueue_sendEffectiveSectionInfosUsingProvider_count_sectionInfoSendCompleted_completion_progress_spoolToFile___block_invoke_2(uint64_t a1, uint64_t a2, char a3)
{
  id v6;
  uint64_t v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  char v13;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __129__BLTSettingSyncSendQueue_sendEffectiveSectionInfosUsingProvider_count_sectionInfoSendCompleted_completion_progress_spoolToFile___block_invoke_3;
  block[3] = &unk_24D762470;
  v11 = *(id *)(a1 + 48);
  v12 = a2;
  v13 = a3;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9 = v6;
  v10 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __129__BLTSettingSyncSendQueue_sendEffectiveSectionInfosUsingProvider_count_sectionInfoSendCompleted_completion_progress_spoolToFile___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  char v12;

  BLTWorkQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __129__BLTSettingSyncSendQueue_sendEffectiveSectionInfosUsingProvider_count_sectionInfoSendCompleted_completion_progress_spoolToFile___block_invoke_4;
  block[3] = &unk_24D762470;
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v10 = v3;
  v11 = v4;
  v12 = *(_BYTE *)(a1 + 64);
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = v5;
  v9 = v6;
  dispatch_async(v2, block);

}

intptr_t __129__BLTSettingSyncSendQueue_sendEffectiveSectionInfosUsingProvider_count_sectionInfoSendCompleted_completion_progress_spoolToFile___block_invoke_4(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 24));
}

void __129__BLTSettingSyncSendQueue_sendEffectiveSectionInfosUsingProvider_count_sectionInfoSendCompleted_completion_progress_spoolToFile___block_invoke_12(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 80);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __129__BLTSettingSyncSendQueue_sendEffectiveSectionInfosUsingProvider_count_sectionInfoSendCompleted_completion_progress_spoolToFile___block_invoke_2_13;
  v10[3] = &unk_24D7624C0;
  v6 = *(id *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 80);
  v11 = v6;
  v12 = v7;
  LOBYTE(v9) = *(_BYTE *)(a1 + 88);
  objc_msgSend(v2, "_sendSectionInfoWithSectionID:usingProvider:updateProgress:sendCompleted:sendAttempt:waitForAcknowledgement:group:spoolToFile:", v3, v4, v5, v10, 0, v8 != 0, *(_QWORD *)(a1 + 40), v9);

}

uint64_t __129__BLTSettingSyncSendQueue_sendEffectiveSectionInfosUsingProvider_count_sectionInfoSendCompleted_completion_progress_spoolToFile___block_invoke_2_13(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

uint64_t __129__BLTSettingSyncSendQueue_sendEffectiveSectionInfosUsingProvider_count_sectionInfoSendCompleted_completion_progress_spoolToFile___block_invoke_3_15(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  blt_settings_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[6];
    v4 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
    v6 = 134218240;
    v7 = v4;
    v8 = 2048;
    v9 = v3;
    _os_log_impl(&dword_2173D9000, v2, OS_LOG_TYPE_DEFAULT, "Section info send queue completed; sent %lu of %lu items",
      (uint8_t *)&v6,
      0x16u);
  }

  result = a1[4];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)sendRemoveSectionWithSectionID:(id)a3 sent:(id)a4
{
  id v6;
  id v7;
  NSObject *sectionInfoSenderQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  sectionInfoSenderQueue = self->_sectionInfoSenderQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__BLTSettingSyncSendQueue_sendRemoveSectionWithSectionID_sent___block_invoke;
  block[3] = &unk_24D761D48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(sectionInfoSenderQueue, block);

}

void __63__BLTSettingSyncSendQueue_sendRemoveSectionWithSectionID_sent___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "sectionRemoveSender");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "sectionRemoveSender");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

- (void)sendSpooledRequestsNowWithSender:(id)a3 completion:(id)a4 progress:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *sectionInfoSenderQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  sectionInfoSenderQueue = self->_sectionInfoSenderQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__BLTSettingSyncSendQueue_sendSpooledRequestsNowWithSender_completion_progress___block_invoke;
  block[3] = &unk_24D762580;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(sectionInfoSenderQueue, block);

}

void __80__BLTSettingSyncSendQueue_sendSpooledRequestsNowWithSender_completion_progress___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __80__BLTSettingSyncSendQueue_sendSpooledRequestsNowWithSender_completion_progress___block_invoke_3;
  v3[3] = &unk_24D762558;
  v2 = *(_QWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  (*(void (**)(uint64_t, void *, _QWORD *))(v2 + 16))(v2, &__block_literal_global_4, v3);

}

uint64_t __80__BLTSettingSyncSendQueue_sendSpooledRequestsNowWithSender_completion_progress___block_invoke_3(uint64_t a1, __n128 a2)
{
  double v2;
  uint64_t result;

  v2 = a2.n128_f64[0];
  result = *(_QWORD *)(a1 + 32);
  if (result)
    result = (*(uint64_t (**)(__n128))(result + 16))(a2);
  if (v2 + -1.0 > -0.00000011920929)
  {
    result = *(_QWORD *)(a1 + 40);
    if (result)
      return (*(uint64_t (**)(double))(result + 16))(v2 + -1.0);
  }
  return result;
}

- (void)sendSectionSubtypeParameterIcons:(id)a3 sectionID:(id)a4 waitForAcknowledgement:(BOOL)a5 spoolToFile:(BOOL)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *subsectionParameterIconSenderQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  BLTSettingSyncSendQueue *v25;
  id v26;
  id v27;
  BOOL v28;
  BOOL v29;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  objc_msgSend(v12, "defaultSubtypeParameters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sectionIconOverride");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  subsectionParameterIconSenderQueue = self->_subsectionParameterIconSenderQueue;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __116__BLTSettingSyncSendQueue_sendSectionSubtypeParameterIcons_sectionID_waitForAcknowledgement_spoolToFile_completion___block_invoke;
  v22[3] = &unk_24D7625D0;
  v23 = v16;
  v24 = v13;
  v28 = a5;
  v29 = a6;
  v25 = self;
  v26 = v12;
  v27 = v14;
  v18 = v14;
  v19 = v12;
  v20 = v13;
  v21 = v16;
  dispatch_async(subsectionParameterIconSenderQueue, v22);

}

uint64_t __116__BLTSettingSyncSendQueue_sendSectionSubtypeParameterIcons_sectionID_waitForAcknowledgement_spoolToFile_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const __CFString *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t result;
  id obj;
  _QWORD v32[5];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  uint8_t buf[4];
  const __CFString *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  blt_settings_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = CFSTR("data");
    if (!*(_QWORD *)(a1 + 32))
      v4 = CFSTR("nil");
    *(_DWORD *)buf = 138412546;
    v39 = v4;
    v40 = 2112;
    v41 = v3;
    _os_log_impl(&dword_2173D9000, v2, OS_LOG_TYPE_DEFAULT, "Sending sectionSubtypeParameters icon (%@) for %@ defaults", buf, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD **)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(unsigned __int8 *)(a1 + 72);
  v9 = v5[2];
  v10 = *(unsigned __int8 *)(a1 + 73);
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __116__BLTSettingSyncSendQueue_sendSectionSubtypeParameterIcons_sectionID_waitForAcknowledgement_spoolToFile_completion___block_invoke_22;
  v37[3] = &unk_24D7625A8;
  v37[4] = v5;
  objc_msgSend(v5, "_sendSectionIcon:forSectionID:forSubtypeID:waitForAcknowledgement:withQueue:spoolToFile:andCompletion:", v7, v6, 0x7FFFFFFFFFFFFFFFLL, v8, v9, v10, v37);
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 48) + 48), 0xFFFFFFFFFFFFFFFFLL);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(*(id *)(a1 + 56), "allSubtypes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 56), "parametersForSubtype:", objc_msgSend(v15, "integerValue"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "sectionIconOverride");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        blt_settings_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v17, "variants");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "count");
          v21 = *(_QWORD *)(a1 + 40);
          v22 = CFSTR("data");
          if (!v20)
            v22 = CFSTR("nil");
          *(_DWORD *)buf = 138412802;
          v39 = v22;
          v40 = 2112;
          v41 = v21;
          v42 = 2112;
          v43 = v15;
          _os_log_impl(&dword_2173D9000, v18, OS_LOG_TYPE_DEFAULT, "Sending sectionSubtypeParameters icon (%@) for %@ %@", buf, 0x20u);

        }
        v24 = *(_QWORD *)(a1 + 40);
        v23 = *(void **)(a1 + 48);
        v25 = objc_msgSend(v15, "integerValue");
        v26 = *(unsigned __int8 *)(a1 + 72);
        v27 = *(_QWORD *)(a1 + 48);
        v28 = *(_QWORD *)(v27 + 16);
        v29 = *(unsigned __int8 *)(a1 + 73);
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __116__BLTSettingSyncSendQueue_sendSectionSubtypeParameterIcons_sectionID_waitForAcknowledgement_spoolToFile_completion___block_invoke_23;
        v32[3] = &unk_24D7625A8;
        v32[4] = v27;
        objc_msgSend(v23, "_sendSectionIcon:forSectionID:forSubtypeID:waitForAcknowledgement:withQueue:spoolToFile:andCompletion:", v17, v24, v25, v26, v28, v29, v32);
        dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 48) + 48), 0xFFFFFFFFFFFFFFFFLL);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
    }
    while (v12);
  }

  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

intptr_t __116__BLTSettingSyncSendQueue_sendSectionSubtypeParameterIcons_sectionID_waitForAcknowledgement_spoolToFile_completion___block_invoke_22(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 48));
}

intptr_t __116__BLTSettingSyncSendQueue_sendSectionSubtypeParameterIcons_sectionID_waitForAcknowledgement_spoolToFile_completion___block_invoke_23(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 48));
}

- (void)_sendEffectiveSectionInfo:(id)a3 waitForAcknowledgement:(BOOL)a4 withQueue:(id)a5 spoolToFile:(BOOL)a6 andCompletion:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v10;
  id v12;
  id v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v16;

  v8 = a6;
  v10 = a4;
  v16 = a3;
  v12 = a5;
  v13 = a7;
  -[BLTSettingSyncSendQueue sectionInfoSender](self, "sectionInfoSender");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[BLTSettingSyncSendQueue sectionInfoSender](self, "sectionInfoSender");
    v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, _BOOL8, id, _BOOL8))v15)[2](v15, v16, v12, v10, v13, v8);

  }
}

- (void)_sendSectionIcon:(id)a3 forSectionID:(id)a4 forSubtypeID:(int64_t)a5 waitForAcknowledgement:(BOOL)a6 withQueue:(id)a7 spoolToFile:(BOOL)a8 andCompletion:(id)a9
{
  _BOOL8 v9;
  _BOOL8 v11;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v22;

  v9 = a8;
  v11 = a6;
  v22 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a9;
  -[BLTSettingSyncSendQueue sectionIconSender](self, "sectionIconSender");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = (void *)MEMORY[0x219A0BFAC]();
    BLTPBSectionIconFromBBSectionIcon(v22, v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTSettingSyncSendQueue sectionIconSender](self, "sectionIconSender");
    v21 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id, int64_t, id, _BOOL8, id, _BOOL8))v21)[2](v21, v20, v15, a5, v16, v11, v17, v9);

    objc_autoreleasePoolPop(v19);
  }

}

- (NSDictionary)iconAllowList
{
  return self->_iconAllowList;
}

- (void)setIconAllowList:(id)a3
{
  objc_storeStrong((id *)&self->_iconAllowList, a3);
}

- (id)sectionParametersProvider
{
  return self->_sectionParametersProvider;
}

- (void)setSectionParametersProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)sectionInfoSender
{
  return self->_sectionInfoSender;
}

- (void)setSectionInfoSender:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)sectionIconSender
{
  return self->_sectionIconSender;
}

- (void)setSectionIconSender:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)sectionRemoveSender
{
  return self->_sectionRemoveSender;
}

- (void)setSectionRemoveSender:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sectionRemoveSender, 0);
  objc_storeStrong(&self->_sectionIconSender, 0);
  objc_storeStrong(&self->_sectionInfoSender, 0);
  objc_storeStrong(&self->_sectionParametersProvider, 0);
  objc_storeStrong((id *)&self->_iconAllowList, 0);
  objc_storeStrong((id *)&self->_subsectionParameterIconSemaphore, 0);
  objc_storeStrong((id *)&self->_subsectionParameterIconProcessingQueue, 0);
  objc_storeStrong((id *)&self->_subsectionParameterIconSenderQueue, 0);
  objc_storeStrong((id *)&self->_sectionInfoSemaphore, 0);
  objc_storeStrong((id *)&self->_sectionInfoProcessingQueue, 0);
  objc_storeStrong((id *)&self->_sectionInfoSenderQueue, 0);
}

void __153__BLTSettingSyncSendQueue__sendSectionInfoWithSectionID_usingProvider_updateProgress_sendCompleted_sendAttempt_waitForAcknowledgement_group_spoolToFile___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2173D9000, a2, a3, "Max send attempts exceeded for section ID %@; dropping settings",
    a5,
    a6,
    a7,
    a8,
    2u);
}

void __153__BLTSettingSyncSendQueue__sendSectionInfoWithSectionID_usingProvider_updateProgress_sendCompleted_sendAttempt_waitForAcknowledgement_group_spoolToFile___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2173D9000, a2, a3, "Failed to send section info so abandoning with section ID %@", a5, a6, a7, a8, 2u);
}

@end
