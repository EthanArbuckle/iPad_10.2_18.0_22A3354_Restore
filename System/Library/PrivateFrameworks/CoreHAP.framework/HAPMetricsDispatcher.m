@implementation HAPMetricsDispatcher

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__HAPMetricsDispatcher_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_metricsDispatcher;
}

void __38__HAPMetricsDispatcher_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_metricsDispatcher;
  sharedInstance_metricsDispatcher = (uint64_t)v1;

}

- (void)submitLogEvent:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[HAPMetricsDispatcher logDispatcher](self, "logDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HAPMetricsDispatcher logDispatcher](self, "logDispatcher");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "submitLogEvent:", v6);

  }
}

- (HMMLogEventSubmitting)logDispatcher
{
  return self->_logDispatcher;
}

- (void)setLogDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_logDispatcher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logDispatcher, 0);
}

@end
