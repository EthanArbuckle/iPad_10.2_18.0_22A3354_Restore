@implementation GEOReportedProgress

- (void)setCancellationHandler:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  geo_assert_not_isolated();
  v4 = v3;
  geo_isolate_sync_data();

}

+ (GEOReportedProgress)progressWithTotalUnitCount:(int64_t)a3
{
  return -[GEOReportedProgress initWithTotalUnitCount:]([GEOReportedProgress alloc], "initWithTotalUnitCount:", a3);
}

- (GEOReportedProgress)initWithTotalUnitCount:(int64_t)a3
{
  GEOReportedProgress *v4;
  uint64_t v5;
  geo_isolater *isolater;
  uint64_t v7;
  NSProgress *progress;
  uint64_t v9;
  NSProgress *internalProgress;
  GEOReportedProgress *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)GEOReportedProgress;
  v4 = -[GEOReportedProgress init](&v19, sel_init);
  if (v4)
  {
    v5 = geo_isolater_create();
    isolater = v4->_isolater;
    v4->_isolater = (geo_isolater *)v5;

    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
    v7 = objc_claimAutoreleasedReturnValue();
    progress = v4->_progress;
    v4->_progress = (NSProgress *)v7;

    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", a3);
    v9 = objc_claimAutoreleasedReturnValue();
    internalProgress = v4->_internalProgress;
    v4->_internalProgress = (NSProgress *)v9;

    objc_initWeak(&location, v4);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __46__GEOReportedProgress_initWithTotalUnitCount___block_invoke;
    v16 = &unk_1E1BFF8B0;
    objc_copyWeak(&v17, &location);
    -[NSProgress setCancellationHandler:](v4->_internalProgress, "setCancellationHandler:", &v13);
    -[NSProgress addChild:withPendingUnitCount:](v4->_progress, "addChild:withPendingUnitCount:", v4->_internalProgress, 1, v13, v14, v15, v16);
    v11 = v4;
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v4;
}

void __46__GEOReportedProgress_setCancellationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancellationHandler, 0);
  objc_storeStrong((id *)&self->_internalProgress, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_isolater, 0);
}

- (void)setTotalUnitCount:(int64_t)a3
{
  -[NSProgress setTotalUnitCount:](self->_internalProgress, "setTotalUnitCount:", a3);
}

- (void)setCompletedUnitCount:(int64_t)a3
{
  -[NSProgress setCompletedUnitCount:](self->_internalProgress, "setCompletedUnitCount:", a3);
}

void __46__GEOReportedProgress_initWithTotalUnitCount___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__98;
    v14 = __Block_byref_object_dispose__98;
    v15 = 0;
    v9 = WeakRetained;
    geo_isolate_sync_data();
    v8 = v11[5];
    if (v8)
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, v3, v4, v5, v6, v7);

    _Block_object_dispose(&v10, 8);
  }

}

void __46__GEOReportedProgress_initWithTotalUnitCount___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x18D765024](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)kind
{
  return -[NSProgress kind](self->_internalProgress, "kind");
}

- (void)setKind:(id)a3
{
  -[NSProgress setKind:](self->_internalProgress, "setKind:", a3);
}

- (int64_t)totalUnitCount
{
  return -[NSProgress totalUnitCount](self->_internalProgress, "totalUnitCount");
}

- (int64_t)completedUnitCount
{
  return -[NSProgress completedUnitCount](self->_internalProgress, "completedUnitCount");
}

- (void)setUserInfoObject:(id)a3 forKey:(id)a4
{
  -[NSProgress setUserInfoObject:forKey:](self->_internalProgress, "setUserInfoObject:forKey:", a3, a4);
}

- (void)becomeCurrentWithPendingUnitCount:(int64_t)a3
{
  -[NSProgress becomeCurrentWithPendingUnitCount:](self->_internalProgress, "becomeCurrentWithPendingUnitCount:", a3);
}

- (void)resignCurrent
{
  -[NSProgress resignCurrent](self->_internalProgress, "resignCurrent");
}

- (void)addChild:(id)a3 withPendingUnitCount:(int64_t)a4
{
  -[NSProgress addChild:withPendingUnitCount:](self->_internalProgress, "addChild:withPendingUnitCount:", a3, a4);
}

- (id)cancellationHandler
{
  void *v3;
  geo_isolater *v5;

  geo_assert_not_isolated();
  v5 = self->_isolater;
  _geo_isolate_lock_data();
  v3 = (void *)MEMORY[0x18D765024](self->_cancellationHandler);
  _geo_isolate_unlock();

  return v3;
}

- (BOOL)isCancelled
{
  return -[NSProgress isCancelled](self->_internalProgress, "isCancelled");
}

- (void)cancel
{
  geo_assert_not_isolated();
  geo_isolate_sync_data();
  -[NSProgress cancel](self->_progress, "cancel");
}

void __29__GEOReportedProgress_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = 0;

}

- (NSProgress)progress
{
  return self->_progress;
}

@end
