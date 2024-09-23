@implementation MTPerfEventHandlers

- (MTFlexiblePerfEventHandler)flexible
{
  MTPerfEventHandlers *v2;
  MTFlexiblePerfEventHandler *v3;
  void *v4;
  uint64_t v5;
  MTFlexiblePerfEventHandler *flexible;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_flexible)
  {
    v3 = [MTFlexiblePerfEventHandler alloc];
    -[MTObject metricsKit](v2, "metricsKit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MTObject initWithMetricsKit:](v3, "initWithMetricsKit:", v4);
    flexible = v2->_flexible;
    v2->_flexible = (MTFlexiblePerfEventHandler *)v5;

  }
  objc_sync_exit(v2);

  return v2->_flexible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flexible, 0);
}

- (Class)baseDataProviderClass
{
  return (Class)objc_opt_class();
}

- (void)registerDefaultEventHandlers
{
  -[MTEventHandlers registerEventHandlerName:eventHandlerClass:](self, "registerEventHandlerName:eventHandlerClass:", CFSTR("pageRender"), objc_opt_class());
  -[MTEventHandlers registerEventHandlerName:eventHandlerClass:](self, "registerEventHandlerName:eventHandlerClass:", CFSTR("loadUrl"), objc_opt_class());
}

- (MTPageRenderEventHandler)pageRender
{
  return (MTPageRenderEventHandler *)-[MTEventHandlers objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("pageRender"));
}

- (MTLoadUrlEventHandler)loadUrl
{
  return (MTLoadUrlEventHandler *)-[MTEventHandlers objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("loadUrl"));
}

@end
