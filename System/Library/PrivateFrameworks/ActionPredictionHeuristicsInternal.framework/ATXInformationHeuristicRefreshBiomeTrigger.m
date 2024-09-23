@implementation ATXInformationHeuristicRefreshBiomeTrigger

- (ATXInformationHeuristicRefreshBiomeTrigger)initWithStreamType:(int64_t)a3
{
  ATXInformationHeuristicRefreshBiomeTrigger *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXInformationHeuristicRefreshBiomeTrigger;
  result = -[ATXInformationHeuristicRefreshTrigger init](&v5, sel_init);
  if (result)
    result->_streamType = a3;
  return result;
}

- (void)_start
{
  id v3;
  const char *v4;
  NSObject *v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *queue;
  BMBiomeScheduler *v8;
  BMBiomeScheduler *scheduler;
  void *v10;
  void *v11;
  uint64_t v12;
  BPSSink *v13;
  BPSSink *sink;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  if (!self->_sink)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.proactive.ActionPredictionHeuristicsInternal.BiomeTrigger.%ld"), self->_streamType);
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (const char *)objc_msgSend(v3, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (OS_dispatch_queue *)dispatch_queue_create(v4, v5);
    queue = self->_queue;
    self->_queue = v6;

    v8 = (BMBiomeScheduler *)objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:", v3, self->_queue);
    scheduler = self->_scheduler;
    self->_scheduler = v8;

    objc_initWeak(&location, self);
    -[ATXInformationHeuristicRefreshBiomeTrigger _publisher](self, "_publisher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subscribeOn:", self->_scheduler);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __52__ATXInformationHeuristicRefreshBiomeTrigger__start__block_invoke;
    v17[3] = &unk_1E82C49A0;
    objc_copyWeak(&v18, &location);
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __52__ATXInformationHeuristicRefreshBiomeTrigger__start__block_invoke_153;
    v15[3] = &unk_1E82C49C8;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v11, "sinkWithCompletion:receiveInput:", v17, v15);
    v13 = (BPSSink *)objc_claimAutoreleasedReturnValue();
    sink = self->_sink;
    self->_sink = v13;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
}

void __52__ATXInformationHeuristicRefreshBiomeTrigger__start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    __atxlog_handle_gi();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __52__ATXInformationHeuristicRefreshBiomeTrigger__start__block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    goto LABEL_7;
  }
  objc_msgSend(v3, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    __atxlog_handle_gi();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __52__ATXInformationHeuristicRefreshBiomeTrigger__start__block_invoke_cold_2((uint64_t)WeakRetained, v3);
LABEL_7:

  }
}

void __52__ATXInformationHeuristicRefreshBiomeTrigger__start__block_invoke_153(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    __atxlog_handle_gi();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = WeakRetained[3];
      v6 = 134217984;
      v7 = v3;
      _os_log_impl(&dword_1C99DF000, v2, OS_LOG_TYPE_DEFAULT, "ATXInformationHeuristicRefreshBiomeTrigger: new event in stream: %ld. Triggering heuristics refresh.", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(WeakRetained, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "registeredHeuristics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "informationHeuristicRefreshTrigger:didTriggerRefreshForHeuristics:", WeakRetained, v5);

  }
}

- (id)_publisher
{
  void *v2;
  int64_t streamType;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  streamType = self->_streamType;
  switch(streamType)
  {
    case 2:
      BiomeLibrary();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "IntelligencePlatform");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "Views");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "Updated");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "DSLPublisherWithUseCase:", CFSTR("FutureLifeEvent"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "filterWithKeyPath:value:", CFSTR("eventBody.viewName"), CFSTR("futureLifeEventMap"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
      return v2;
    case 1:
      BiomeLibrary();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "UserFocus");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "InferredMode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 0:
      BiomeLibrary();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "UserFocus");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ComputedMode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v7 = v6;
      objc_msgSend(v6, "atx_DSLPublisher");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
  }
  return v2;
}

- (void)_stop
{
  -[BPSSink cancel](self->_sink, "cancel");
}

- (unint64_t)hash
{
  return self->_streamType;
}

- (BOOL)isEqual:(id)a3
{
  ATXInformationHeuristicRefreshBiomeTrigger *v4;
  ATXInformationHeuristicRefreshBiomeTrigger *v5;
  BOOL v6;

  v4 = (ATXInformationHeuristicRefreshBiomeTrigger *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXInformationHeuristicRefreshBiomeTrigger isEqualToATXInformationHeuristicRefreshBiomeTrigger:](self, "isEqualToATXInformationHeuristicRefreshBiomeTrigger:", v5);

  return v6;
}

- (BOOL)isEqualToATXInformationHeuristicRefreshBiomeTrigger:(id)a3
{
  return self->_streamType == *((_QWORD *)a3 + 3);
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("ATXInformationHeuristicRefreshBiomeTrigger for %ld"), self->_streamType);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXInformationHeuristicRefreshBiomeTrigger;
  v4 = a3;
  -[ATXInformationHeuristicRefreshTrigger encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_streamType, CFSTR("streamType"), v5.receiver, v5.super_class);

}

- (ATXInformationHeuristicRefreshBiomeTrigger)initWithCoder:(id)a3
{
  id v4;
  ATXInformationHeuristicRefreshBiomeTrigger *v5;
  void *v6;
  void *v7;
  ATXInformationHeuristicRefreshBiomeTrigger *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXInformationHeuristicRefreshBiomeTrigger;
  v5 = -[ATXInformationHeuristicRefreshTrigger initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (!v5
    || (objc_msgSend(v4, "error"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6)
    || (v5->_streamType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("streamType")),
        objc_msgSend(v4, "error"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __52__ATXInformationHeuristicRefreshBiomeTrigger__start__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1C99DF000, a1, a3, "ATXInformationHeuristics: couldn't perform refresh operation because swelf is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_0();
}

void __52__ATXInformationHeuristicRefreshBiomeTrigger__start__block_invoke_cold_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_1C99DF000, v2, v3, "ATXInformationHeuristicRefreshBiomeTrigger: error subscribing to stream: %ld: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

@end
