@implementation AAFAnalyticsReporter

- (AAFAnalyticsReporter)initWithTransport:(id)a3
{
  id v5;
  AAFAnalyticsReporter *v6;
  AAFAnalyticsReporter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAFAnalyticsReporter;
  v6 = -[AAFAnalyticsReporter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_transport, a3);

  return v7;
}

+ (id)analyticsReporterWithTransport:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTransport:", v4);

  return v5;
}

- (void)sendEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  AAFAnalyticsReporter *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "completeEvent");
  _AAFLogSystemAnalytics();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    objc_msgSend(v4, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAFAnalyticsTransport debugDescription](self->_transport, "debugDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138413058;
    v11 = v6;
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_1D51A2000, v5, OS_LOG_TYPE_DEFAULT, "<%@: %p> Sending event: [%@] with transport: [%@]", (uint8_t *)&v10, 0x2Au);

  }
  -[AAFAnalyticsReporter _sendEvent:](self, "_sendEvent:", v4);

}

- (void)_sendEvent:(id)a3
{
  -[AAFAnalyticsTransport sendEvent:](self->_transport, "sendEvent:", a3);
}

- (AAFAnalyticsTransport)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
  objc_storeStrong((id *)&self->_transport, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transport, 0);
}

@end
