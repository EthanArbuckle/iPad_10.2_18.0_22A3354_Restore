@implementation MUPlaceCardImpressionsLogger

- (MUPlaceCardImpressionsLogger)init
{
  MUPlaceCardImpressionsLogger *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *isolationQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUPlaceCardImpressionsLogger;
  v2 = -[MUPlaceCardImpressionsLogger init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.MapsUI.MUPlaceCardImpressionsLogger", 0);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)logImpressionElementDidEnter:(id)a3 onDate:(id)a4
{
  id v6;
  id v7;
  NSObject *isolationQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  isolationQueue = self->_isolationQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__MUPlaceCardImpressionsLogger_logImpressionElementDidEnter_onDate___block_invoke;
  v11[3] = &unk_1E2E01730;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(isolationQueue, v11);

}

void __68__MUPlaceCardImpressionsLogger_logImpressionElementDidEnter_onDate___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "customData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  v4 = v3;
  MUGetMUPlaceCardImpressionLoggingLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "debugString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v16 = v6;
    v17 = 2048;
    v18 = v4;
    _os_log_impl(&dword_191DB8000, v5, OS_LOG_TYPE_INFO, "Logging element did enter @%@ with start date %f", buf, 0x16u);

  }
  v7 = (void *)MEMORY[0x1E0D263E8];
  objc_msgSend(*(id *)(a1 + 32), "sessionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "query");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v2, "businessId");
  v11 = objc_msgSend(v2, "localSearchProviderId");
  v12 = objc_msgSend(v2, "moduleIndex");
  v13 = objc_msgSend(v2, "moduleType");
  HIDWORD(v14) = 1;
  LOBYTE(v14) = objc_msgSend(v2, "isEnriched");
  objc_msgSend(v7, "capturePlaceCardImpressionEventWithImpressionObjectId:query:businessId:localSearchProviderId:elementIndex:moduleType:isEnriched:impressionEvent:impressionVisibleTimestamp:impressionNonvisibleTimestamp:", v8, v9, v10, v11, v12, v13, v4, 0.0, v14);

}

- (void)logImpressionElementDidExit:(id)a3 usingEnterDate:(id)a4 exitDate:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *isolationQueue;
  id v15;
  _QWORD block[4];
  id v17;
  uint64_t v18;
  uint64_t v19;

  v8 = a3;
  v9 = a5;
  objc_msgSend(a4, "timeIntervalSinceReferenceDate");
  v11 = v10;
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v13 = v12;

  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__MUPlaceCardImpressionsLogger_logImpressionElementDidExit_usingEnterDate_exitDate___block_invoke;
  block[3] = &unk_1E2E043E0;
  v17 = v8;
  v18 = v11;
  v19 = v13;
  v15 = v8;
  dispatch_async(isolationQueue, block);

}

void __84__MUPlaceCardImpressionsLogger_logImpressionElementDidExit_usingEnterDate_exitDate___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "customData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MUGetMUPlaceCardImpressionLoggingLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "debugString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    v16 = v4;
    v17 = 2048;
    v18 = v5;
    v19 = 2048;
    v20 = v6;
    _os_log_impl(&dword_191DB8000, v3, OS_LOG_TYPE_INFO, "Logging element did exit @%@ with start date %f, end date %f", buf, 0x20u);

  }
  v7 = (void *)MEMORY[0x1E0D263E8];
  objc_msgSend(*(id *)(a1 + 32), "sessionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "query");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v2, "businessId");
  v11 = objc_msgSend(v2, "localSearchProviderId");
  v12 = objc_msgSend(v2, "moduleIndex");
  v13 = objc_msgSend(v2, "moduleType");
  HIDWORD(v14) = 2;
  LOBYTE(v14) = objc_msgSend(v2, "isEnriched");
  objc_msgSend(v7, "capturePlaceCardImpressionEventWithImpressionObjectId:query:businessId:localSearchProviderId:elementIndex:moduleType:isEnriched:impressionEvent:impressionVisibleTimestamp:impressionNonvisibleTimestamp:", v8, v9, v10, v11, v12, v13, *(double *)(a1 + 40), *(double *)(a1 + 48), v14);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end
