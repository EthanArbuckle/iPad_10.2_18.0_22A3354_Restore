@implementation AAFAnalyticsTransportCA

- (void)sendEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  v5 = v4;
  if (MEMORY[0x1E0D15418])
  {
    objc_msgSend(v4, "eventName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reportData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
  else
  {
    _AAFLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AAFAnalyticsTransportCA sendEvent:].cold.1((uint64_t)self, v8);

  }
}

- (void)sendEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  id v4;
  int v5;
  id v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 138412546;
  v6 = (id)objc_opt_class();
  v7 = 2048;
  v8 = a1;
  v4 = v6;
  _os_log_error_impl(&dword_1D51A2000, a2, OS_LOG_TYPE_ERROR, "<%@: %p> CoreAnalytics is not avaiable.", (uint8_t *)&v5, 0x16u);

}

@end
