@implementation ARPCorrelationTaskScheduler

- (ARPCorrelationTaskScheduler)initWithKnowledgeStore:(id)a3
{
  id v5;
  ARPCorrelationTaskScheduler *v6;
  ARPCorrelationTaskScheduler *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  NSDate *bookmark;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  ARPCorrelationTaskScheduler *v27;
  uint64_t v28;
  BPSSink *sinkAccessories;
  void *v30;
  void *v31;
  void *v32;
  ARPCorrelationTaskScheduler *v33;
  uint64_t v34;
  BPSSink *sinkMediaAccessories;
  void *v36;
  void *v37;
  void *v38;
  ARPCorrelationTaskScheduler *v39;
  uint64_t v40;
  BPSSink *sinkScenes;
  _QWORD v43[4];
  ARPCorrelationTaskScheduler *v44;
  _QWORD v45[4];
  ARPCorrelationTaskScheduler *v46;
  _QWORD v47[4];
  ARPCorrelationTaskScheduler *v48;
  objc_super v49;

  v5 = a3;
  v49.receiver = self;
  v49.super_class = (Class)ARPCorrelationTaskScheduler;
  v6 = -[ARPCorrelationTaskScheduler init](&v49, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_knowledgeStore, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.AirPlayRoutePrediction.correlation-task-queue", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v11 = objc_claimAutoreleasedReturnValue();
    bookmark = v7->_bookmark;
    v7->_bookmark = (NSDate *)v11;

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0D15B78];
    objc_msgSend(MEMORY[0x1E0D15AF8], "nowPlayingStream");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v7, sel_nowPlayingEventInserted_, v14, v16);

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15AF8], "microLocationVisitStream");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v7, sel_microLocationEventInserted_, v14, v19);

    v20 = (void *)objc_msgSend(objc_alloc(getBMBiomeSchedulerClass()), "initWithIdentifier:targetQueue:", CFSTR("com.apple.AirPlayRoutePrediction.HomeControlAccessoryEventNotification"), v7->_queue);
    v21 = (void *)objc_msgSend(objc_alloc(getBMBiomeSchedulerClass()), "initWithIdentifier:targetQueue:", CFSTR("com.apple.AirPlayRoutePrediction.HomeControlMediaAccessoryEventNotification"), v7->_queue);
    v22 = (void *)objc_msgSend(objc_alloc(getBMBiomeSchedulerClass()), "initWithIdentifier:targetQueue:", CFSTR("com.apple.AirPlayRoutePrediction.HomeControlActionSetEventNotification"), v7->_queue);
    -[objc_class homeKitClientAccessoryControlStream](getBMStreamsClass(), "homeKitClientAccessoryControlStream");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "publisher");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "subscribeOn:", v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x1E0C809B0];
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __54__ARPCorrelationTaskScheduler_initWithKnowledgeStore___block_invoke_2;
    v47[3] = &unk_1EA7D4528;
    v27 = v7;
    v48 = v27;
    objc_msgSend(v25, "sinkWithCompletion:receiveInput:", &__block_literal_global_3, v47);
    v28 = objc_claimAutoreleasedReturnValue();
    sinkAccessories = v27->_sinkAccessories;
    v27->_sinkAccessories = (BPSSink *)v28;

    -[objc_class homeKitClientMediaAccessoryControlStream](getBMStreamsClass(), "homeKitClientMediaAccessoryControlStream");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "publisher");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "subscribeOn:", v21);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v26;
    v45[1] = 3221225472;
    v45[2] = __54__ARPCorrelationTaskScheduler_initWithKnowledgeStore___block_invoke_4;
    v45[3] = &unk_1EA7D4528;
    v33 = v27;
    v46 = v33;
    objc_msgSend(v32, "sinkWithCompletion:receiveInput:", &__block_literal_global_16, v45);
    v34 = objc_claimAutoreleasedReturnValue();
    sinkMediaAccessories = v33->_sinkMediaAccessories;
    v33->_sinkMediaAccessories = (BPSSink *)v34;

    -[objc_class homeKitClientActionSetStream](getBMStreamsClass(), "homeKitClientActionSetStream");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "publisher");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "subscribeOn:", v22);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v26;
    v43[1] = 3221225472;
    v43[2] = __54__ARPCorrelationTaskScheduler_initWithKnowledgeStore___block_invoke_6;
    v43[3] = &unk_1EA7D4528;
    v39 = v33;
    v44 = v39;
    objc_msgSend(v38, "sinkWithCompletion:receiveInput:", &__block_literal_global_17, v43);
    v40 = objc_claimAutoreleasedReturnValue();
    sinkScenes = v39->_sinkScenes;
    v39->_sinkScenes = (BPSSink *)v40;

  }
  return v7;
}

uint64_t __54__ARPCorrelationTaskScheduler_initWithKnowledgeStore___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "homeKitEventInserted");
}

uint64_t __54__ARPCorrelationTaskScheduler_initWithKnowledgeStore___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "homeKitEventInserted");
}

uint64_t __54__ARPCorrelationTaskScheduler_initWithKnowledgeStore___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "homeKitEventInserted");
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D15B78];
  objc_msgSend(MEMORY[0x1E0D15AF8], "nowPlayingStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, v6);

  -[BPSSink cancel](self->_sinkAccessories, "cancel");
  -[BPSSink cancel](self->_sinkMediaAccessories, "cancel");
  -[BPSSink cancel](self->_sinkScenes, "cancel");
  v7.receiver = self;
  v7.super_class = (Class)ARPCorrelationTaskScheduler;
  -[ARPCorrelationTaskScheduler dealloc](&v7, sel_dealloc);
}

- (void)nowPlayingEventInserted:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  id v18;
  NSObject *v19;
  _QWORD v20[5];
  _QWORD block[4];
  id v22;
  id v23;

  objc_msgSend(MEMORY[0x1E0C99D68], "date", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ARPRoutingSession routingSessionTimeout](ARPRoutingSession, "routingSessionTimeout");
  v6 = v5;
  -[ARPCorrelationTaskScheduler bookmark](self, "bookmark");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "earlierDate:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dateByAddingTimeInterval:", -v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "laterDate:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARPCorrelationTaskScheduler setBookmark:](self, "setBookmark:", v4);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v10, v4);
  -[ARPCorrelationTaskScheduler knowledgeStore](self, "knowledgeStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[ARPRoutingEvent mostRecentRoutingEventInDateInterval:knowledgeStore:eventLimit:longFormVideoFilter:](ARPRoutingEvent, "mostRecentRoutingEventInDateInterval:knowledgeStore:eventLimit:longFormVideoFilter:", v11, v12, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[ARPCorrelationTaskScheduler queue](self, "queue");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __55__ARPCorrelationTaskScheduler_nowPlayingEventInserted___block_invoke;
    v20[3] = &unk_1EA7D4590;
    v20[4] = self;
    v16 = v20;
    v17 = (void *)os_transaction_create();
    block[0] = v15;
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke;
    block[3] = &unk_1EA7D4640;
    v22 = v17;
    v23 = v16;
    v18 = v17;
    dispatch_async(v14, block);

  }
  else
  {
    ARPLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[ARPCorrelationTaskScheduler nowPlayingEventInserted:].cold.1(v19);

  }
}

uint64_t __55__ARPCorrelationTaskScheduler_nowPlayingEventInserted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_executeCorrelationTask");
}

- (void)_executeHomeControlMicrolocationCorrelationTask
{
  NSObject *v3;
  ARPHomeControlMicrolocationCorrelationTask *v4;
  void *v5;
  void *v6;
  ARPHomeControlMicrolocationCorrelationTask *v7;

  -[ARPCorrelationTaskScheduler queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = [ARPHomeControlMicrolocationCorrelationTask alloc];
  +[ARPHomeControlSuggester defaultCorrelationsSessionFile](ARPHomeControlSuggester, "defaultCorrelationsSessionFile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPCorrelationTaskScheduler knowledgeStore](self, "knowledgeStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ARPHomeControlMicrolocationCorrelationTask initWithCorrelationsFile:knowledgeStore:](v4, "initWithCorrelationsFile:knowledgeStore:", v5, v6);

  -[ARPHomeControlMicrolocationCorrelationTask execute](v7, "execute");
}

- (void)_executeHomeControlNextActionCorrelationTask
{
  NSObject *v2;
  ARPHomeControlNextActionCorrelationTask *v3;
  void *v4;
  ARPHomeControlNextActionCorrelationTask *v5;

  -[ARPCorrelationTaskScheduler queue](self, "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  v3 = [ARPHomeControlNextActionCorrelationTask alloc];
  +[ARPHomeControlSuggester defaultCorrelationsSessionFile](ARPHomeControlSuggester, "defaultCorrelationsSessionFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ARPHomeControlNextActionCorrelationTask initWithCorrelationsFile:](v3, "initWithCorrelationsFile:", v4);

  -[ARPHomeControlNextActionCorrelationTask execute](v5, "execute");
}

- (void)microLocationEventInserted:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  _QWORD block[4];
  id v11;
  id v12;

  -[ARPCorrelationTaskScheduler queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__ARPCorrelationTaskScheduler_microLocationEventInserted___block_invoke;
  v9[3] = &unk_1EA7D4590;
  v9[4] = self;
  v6 = v9;
  v7 = (void *)os_transaction_create();
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke;
  block[3] = &unk_1EA7D4640;
  v11 = v7;
  v12 = v6;
  v8 = v7;
  dispatch_async(v4, block);

}

uint64_t __58__ARPCorrelationTaskScheduler_microLocationEventInserted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_executeHomeControlMicrolocationCorrelationTask");
}

- (void)homeKitEventInserted
{
  NSObject *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  _QWORD block[4];
  id v10;
  id v11;

  -[ARPCorrelationTaskScheduler queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__ARPCorrelationTaskScheduler_homeKitEventInserted__block_invoke;
  v8[3] = &unk_1EA7D4590;
  v8[4] = self;
  v5 = v8;
  v6 = (void *)os_transaction_create();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke;
  block[3] = &unk_1EA7D4640;
  v10 = v6;
  v11 = v5;
  v7 = v6;
  dispatch_async(v3, block);

}

uint64_t __51__ARPCorrelationTaskScheduler_homeKitEventInserted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_executeHomeControlNextActionCorrelationTask");
}

- (void)_executeCorrelationTask
{
  NSObject *v3;
  ARPCorrelationTask *v4;
  void *v5;
  void *v6;
  ARPCorrelationTask *v7;

  -[ARPCorrelationTaskScheduler queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = [ARPCorrelationTask alloc];
  +[ARPRoutePredictor defaultFile](ARPRoutePredictor, "defaultFile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPCorrelationTaskScheduler knowledgeStore](self, "knowledgeStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ARPCorrelationTask initWithCorrelationsFile:knowledgeStore:](v4, "initWithCorrelationsFile:knowledgeStore:", v5, v6);

  -[ARPCorrelationTask execute](v7, "execute");
}

- (void)executeCorrelationTask
{
  NSObject *v3;
  _QWORD block[5];

  -[ARPCorrelationTaskScheduler queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ARPCorrelationTaskScheduler_executeCorrelationTask__block_invoke;
  block[3] = &unk_1EA7D4590;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __53__ARPCorrelationTaskScheduler_executeCorrelationTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_executeCorrelationTask");
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BPSSink)sinkAccessories
{
  return self->_sinkAccessories;
}

- (BPSSink)sinkMediaAccessories
{
  return self->_sinkMediaAccessories;
}

- (BPSSink)sinkScenes
{
  return self->_sinkScenes;
}

- (NSDate)bookmark
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBookmark:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_sinkScenes, 0);
  objc_storeStrong((id *)&self->_sinkMediaAccessories, 0);
  objc_storeStrong((id *)&self->_sinkAccessories, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

- (void)nowPlayingEventInserted:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DD793000, log, OS_LOG_TYPE_DEBUG, "Inserted now playing event was not part of a routing session.", v1, 2u);
}

@end
