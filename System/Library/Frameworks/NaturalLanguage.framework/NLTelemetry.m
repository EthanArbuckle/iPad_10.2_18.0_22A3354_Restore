@implementation NLTelemetry

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  return (id)sharedInstance_sharedInstance;
}

void __29__NLTelemetry_sharedInstance__block_invoke()
{
  NLTelemetry *v0;
  void *v1;

  v0 = objc_alloc_init(NLTelemetry);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (NLTelemetry)init
{
  NLTelemetry *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *analyticsQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NLTelemetry;
  v2 = -[NLTelemetry init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.NaturalLanguage.NLTelemetry", 0);
    analyticsQueue = v2->_analyticsQueue;
    v2->_analyticsQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)_registerPayload:(id)a3 forEvent:(id)a4
{
  id v6;
  id v7;
  NSObject *analyticsQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  analyticsQueue = self->_analyticsQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__NLTelemetry__registerPayload_forEvent___block_invoke;
  v11[3] = &unk_1E4A3AEA0;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(analyticsQueue, v11);

}

uint64_t __41__NLTelemetry__registerPayload_forEvent___block_invoke()
{
  return AnalyticsSendEvent();
}

- (void)reportEmbeddingLoadedWithIdentifier:(id)a3 localeIdentifier:(id)a4 useANE:(BOOL)a5 status:(int64_t)a6
{
  _BOOL4 v7;
  void *v10;
  id v11;
  id v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  const __CFString *v17;
  id v18;

  v7 = a5;
  v10 = (void *)MEMORY[0x1E0C99E08];
  v11 = a4;
  v12 = a3;
  objc_msgSend(v10, "dictionary");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v12, CFSTR("identifier"));

  objc_msgSend(v18, "setObject:forKeyedSubscript:", v11, CFSTR("locale"));
  if (v7)
    v13 = CFSTR("ane");
  else
    v13 = CFSTR("cpu");
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v13, CFSTR("engine"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v14, CFSTR("status"));

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundleIdentifier");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v16)
    v17 = v16;
  else
    v17 = CFSTR("unknown");
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("app_bundle"));
  -[NLTelemetry _registerPayload:forEvent:](self, "_registerPayload:forEvent:", v18, CFSTR("com.apple.NaturalLanguage.EmbeddingStatus"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsQueue, 0);
}

@end
