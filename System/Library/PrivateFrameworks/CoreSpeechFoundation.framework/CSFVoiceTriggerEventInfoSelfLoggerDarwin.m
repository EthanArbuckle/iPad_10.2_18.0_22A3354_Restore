@implementation CSFVoiceTriggerEventInfoSelfLoggerDarwin

- (CSFVoiceTriggerEventInfoSelfLoggerDarwin)init
{
  CSFVoiceTriggerEventInfoSelfLoggerDarwin *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  CSFCircularEventsCacheBuffer *v7;
  CSFCircularEventsCacheBuffer *firstPassEvents;
  CSFCircularEventsCacheBuffer *v9;
  CSFCircularEventsCacheBuffer *rejectEvents;
  CSFCircularEventsCacheBuffer *v11;
  CSFCircularEventsCacheBuffer *cancelledEvents;
  CSFVoiceTriggerEventInfoSelfLoggerDarwin *v13;
  objc_super v15;

  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
  {
    v15.receiver = self;
    v15.super_class = (Class)CSFVoiceTriggerEventInfoSelfLoggerDarwin;
    v3 = -[CSFVoiceTriggerEventInfoSelfLoggerDarwin init](&v15, sel_init);
    if (v3)
    {
      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -2);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = dispatch_queue_create("CSFVoiceTriggerEventInfoSelfLoggerDarwin Queue", v4);
      queue = v3->_queue;
      v3->_queue = (OS_dispatch_queue *)v5;

      v7 = objc_alloc_init(CSFCircularEventsCacheBuffer);
      firstPassEvents = v3->_firstPassEvents;
      v3->_firstPassEvents = v7;

      v9 = objc_alloc_init(CSFCircularEventsCacheBuffer);
      rejectEvents = v3->_rejectEvents;
      v3->_rejectEvents = v9;

      v11 = objc_alloc_init(CSFCircularEventsCacheBuffer);
      cancelledEvents = v3->_cancelledEvents;
      v3->_cancelledEvents = v11;

    }
    self = v3;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)fetchAndClearCachedVoiceTriggerEventsWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __96__CSFVoiceTriggerEventInfoSelfLoggerDarwin_fetchAndClearCachedVoiceTriggerEventsWithCompletion___block_invoke;
  v7[3] = &unk_1E6881160;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)logStartEventWithFirstPassStartedInfo:(id)a3 withMHUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  _QWORD block[4];
  id v11;
  id v12;
  CSFVoiceTriggerEventInfoSelfLoggerDarwin *v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93__CSFVoiceTriggerEventInfoSelfLoggerDarwin_logStartEventWithFirstPassStartedInfo_withMHUUID___block_invoke;
    block[3] = &unk_1E6880BF0;
    v11 = v6;
    v12 = v8;
    v13 = self;
    dispatch_async(queue, block);

  }
}

- (void)logRejectEventWithVTEI:(id)a3 withMHUUID:(id)a4 withSecondPassResult:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *queue;
  _QWORD v12[4];
  id v13;
  id v14;
  CSFVoiceTriggerEventInfoSelfLoggerDarwin *v15;
  unint64_t v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8 && v9)
  {
    queue = self->_queue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __99__CSFVoiceTriggerEventInfoSelfLoggerDarwin_logRejectEventWithVTEI_withMHUUID_withSecondPassResult___block_invoke;
    v12[3] = &unk_1E6880C20;
    v13 = v8;
    v15 = self;
    v16 = a5;
    v14 = v10;
    dispatch_async(queue, v12);

  }
}

- (void)logCancelledEventWithMHUUID:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72__CSFVoiceTriggerEventInfoSelfLoggerDarwin_logCancelledEventWithMHUUID___block_invoke;
    v7[3] = &unk_1E6880E88;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CSFCircularEventsCacheBuffer)firstPassEvents
{
  return self->_firstPassEvents;
}

- (void)setFirstPassEvents:(id)a3
{
  objc_storeStrong((id *)&self->_firstPassEvents, a3);
}

- (CSFCircularEventsCacheBuffer)rejectEvents
{
  return self->_rejectEvents;
}

- (void)setRejectEvents:(id)a3
{
  objc_storeStrong((id *)&self->_rejectEvents, a3);
}

- (CSFCircularEventsCacheBuffer)cancelledEvents
{
  return self->_cancelledEvents;
}

- (void)setCancelledEvents:(id)a3
{
  objc_storeStrong((id *)&self->_cancelledEvents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelledEvents, 0);
  objc_storeStrong((id *)&self->_rejectEvents, 0);
  objc_storeStrong((id *)&self->_firstPassEvents, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __72__CSFVoiceTriggerEventInfoSelfLoggerDarwin_logCancelledEventWithMHUUID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "cancelledEvents");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEventToCacheBuffer:", v2);

}

void __99__CSFVoiceTriggerEventInfoSelfLoggerDarwin_logRejectEventWithVTEI_withMHUUID_withSecondPassResult___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(*(id *)(a1 + 40), "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v2, CFSTR("kCSFSelfLoggingMHUUID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v3, CFSTR("kCSFSelfLoggingSecondPassResult"));

  objc_msgSend(*(id *)(a1 + 48), "rejectEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEventToCacheBuffer:", v5);

}

void __93__CSFVoiceTriggerEventInfoSelfLoggerDarwin_logStartEventWithFirstPassStartedInfo_withMHUUID___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(a1[4], "mutableCopy");
  objc_msgSend(a1[5], "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v2, CFSTR("kCSFSelfLoggingMHUUID"));

  objc_msgSend(a1[6], "firstPassEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEventToCacheBuffer:", v4);

}

void __96__CSFVoiceTriggerEventInfoSelfLoggerDarwin_fetchAndClearCachedVoiceTriggerEventsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "firstPassEvents");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "eventsArray");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "rejectEvents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventsArray");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "cancelledEvents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "eventsArray");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, void *))(v2 + 16))(v2, v4, v6, v8);

  }
  objc_msgSend(*(id *)(a1 + 32), "firstPassEvents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clearBuffer");

  objc_msgSend(*(id *)(a1 + 32), "rejectEvents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clearBuffer");

  objc_msgSend(*(id *)(a1 + 32), "cancelledEvents");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clearBuffer");

}

@end
