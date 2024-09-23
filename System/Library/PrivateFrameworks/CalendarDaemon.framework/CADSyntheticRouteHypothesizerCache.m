@implementation CADSyntheticRouteHypothesizerCache

+ (CADSyntheticRouteHypothesizerCache)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CADSyntheticRouteHypothesizerCache_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (CADSyntheticRouteHypothesizerCache *)(id)sharedInstance_sharedInstance;
}

void __52__CADSyntheticRouteHypothesizerCache_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v1;

}

- (id)_init
{
  CADSyntheticRouteHypothesizerCache *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *workQueue;
  NSMutableDictionary *v6;
  NSMutableDictionary *eventExternalURLToSyntheticRouteHypothesizerMap;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CADSyntheticRouteHypothesizerCache;
  v2 = -[CADSyntheticRouteHypothesizerCache init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.calendar.daemon.syntheticRouteHypothesizerCache", v3);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    eventExternalURLToSyntheticRouteHypothesizerMap = v2->_eventExternalURLToSyntheticRouteHypothesizerMap;
    v2->_eventExternalURLToSyntheticRouteHypothesizerMap = v6;

  }
  return v2;
}

- (id)syntheticRouteHypothesizerForEventExternalURL:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__11;
  v16 = __Block_byref_object_dispose__11;
  v17 = 0;
  -[CADSyntheticRouteHypothesizerCache workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__CADSyntheticRouteHypothesizerCache_syntheticRouteHypothesizerForEventExternalURL___block_invoke;
  block[3] = &unk_1E6A385B8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __84__CADSyntheticRouteHypothesizerCache_syntheticRouteHypothesizerForEventExternalURL___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "eventExternalURLToSyntheticRouteHypothesizerMap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)addSyntheticRouteHypothesizer:(id)a3 forEventExternalURL:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[CADSyntheticRouteHypothesizerCache workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__CADSyntheticRouteHypothesizerCache_addSyntheticRouteHypothesizer_forEventExternalURL___block_invoke;
  block[3] = &unk_1E6A378B0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(v8, block);

}

void __88__CADSyntheticRouteHypothesizerCache_addSyntheticRouteHypothesizer_forEventExternalURL___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "eventExternalURLToSyntheticRouteHypothesizerMap");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

- (void)removeSyntheticRouteHypothesizerForEventExternalURL:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CADSyntheticRouteHypothesizerCache workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__CADSyntheticRouteHypothesizerCache_removeSyntheticRouteHypothesizerForEventExternalURL___block_invoke;
  block[3] = &unk_1E6A37420;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __90__CADSyntheticRouteHypothesizerCache_removeSyntheticRouteHypothesizerForEventExternalURL___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "eventExternalURLToSyntheticRouteHypothesizerMap");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));

}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSMutableDictionary)eventExternalURLToSyntheticRouteHypothesizerMap
{
  return self->_eventExternalURLToSyntheticRouteHypothesizerMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventExternalURLToSyntheticRouteHypothesizerMap, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
