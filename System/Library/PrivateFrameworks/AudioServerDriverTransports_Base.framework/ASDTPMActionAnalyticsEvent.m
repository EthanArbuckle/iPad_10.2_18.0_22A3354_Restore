@implementation ASDTPMActionAnalyticsEvent

- (ASDTPMActionAnalyticsEvent)initWithConfig:(id)a3 forSequencer:(id)a4
{
  id v6;
  ASDTPMActionAnalyticsEvent *v7;
  void *v8;
  void *v9;
  ASDTPMActionAnalyticsEvent *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASDTPMActionAnalyticsEvent;
  v7 = -[ASDTPMAction initWithConfig:forSequencer:](&v12, sel_initWithConfig_forSequencer_, v6, a4);
  if (v7
    && (objc_msgSend(v6, "asdtPMActionAnalyticsEventName"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        -[ASDTPMActionAnalyticsEvent setEventName:](v7, "setEventName:", v8),
        v8,
        -[ASDTPMActionAnalyticsEvent eventName](v7, "eventName"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        !v9))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTPMActionAnalyticsEvent initWithConfig:forSequencer:].cold.1(v7, (uint64_t)v6);
    v10 = 0;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (id)deviceName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[ASDTPMActionAnalyticsEvent eventName](self, "eventName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("AnalyticsEvent:%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)eventData
{
  return 0;
}

- (void)sendEventNamed:(id)a3 withData:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  AnalyticsSendEventLazy();

}

id __54__ASDTPMActionAnalyticsEvent_sendEventNamed_withData___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (int)action
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[ASDTPMActionAnalyticsEvent eventData](self, "eventData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[ASDTPMDevice name](self, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDTPMActionAnalyticsEvent eventName](self, "eventName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412802;
      v9 = v4;
      v10 = 2112;
      v11 = v5;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: %@: %@", (uint8_t *)&v8, 0x20u);

    }
    -[ASDTPMActionAnalyticsEvent eventName](self, "eventName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTPMActionAnalyticsEvent sendEventNamed:withData:](self, "sendEventNamed:withData:", v6, v3);

  }
  return 0;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (void)setEventName:(id)a3
{
  objc_storeStrong((id *)&self->_eventName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventName, 0);
}

- (void)initWithConfig:(void *)a1 forSequencer:(uint64_t)a2 .cold.1(void *a1, uint64_t a2)
{
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Event name must be defined in config: %@", (uint8_t *)&v4, 0x16u);

}

@end
