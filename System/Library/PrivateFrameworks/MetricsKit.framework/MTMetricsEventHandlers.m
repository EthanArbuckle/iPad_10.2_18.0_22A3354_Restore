@implementation MTMetricsEventHandlers

- (void)registerDefaultEventHandlers
{
  -[MTEventHandlers registerEventHandlerName:eventHandlerClass:](self, "registerEventHandlerName:eventHandlerClass:", CFSTR("account"), objc_opt_class());
  -[MTEventHandlers registerEventHandlerName:eventHandlerClass:](self, "registerEventHandlerName:eventHandlerClass:", CFSTR("click"), objc_opt_class());
  -[MTEventHandlers registerEventHandlerName:eventHandlerClass:](self, "registerEventHandlerName:eventHandlerClass:", CFSTR("dialog"), objc_opt_class());
  -[MTEventHandlers registerEventHandlerName:eventHandlerClass:](self, "registerEventHandlerName:eventHandlerClass:", CFSTR("enter"), objc_opt_class());
  -[MTEventHandlers registerEventHandlerName:eventHandlerClass:](self, "registerEventHandlerName:eventHandlerClass:", CFSTR("exit"), objc_opt_class());
  -[MTEventHandlers registerEventHandlerName:eventHandlerClass:](self, "registerEventHandlerName:eventHandlerClass:", CFSTR("impressions"), objc_opt_class());
  -[MTEventHandlers registerEventHandlerName:eventHandlerClass:](self, "registerEventHandlerName:eventHandlerClass:", CFSTR("media"), objc_opt_class());
  -[MTEventHandlers registerEventHandlerName:eventHandlerClass:](self, "registerEventHandlerName:eventHandlerClass:", CFSTR("page"), objc_opt_class());
  -[MTEventHandlers registerEventHandlerName:eventHandlerClass:](self, "registerEventHandlerName:eventHandlerClass:", CFSTR("search"), objc_opt_class());
  -[MTEventHandlers registerEventHandlerName:eventHandlerClass:](self, "registerEventHandlerName:eventHandlerClass:", CFSTR("demographic"), objc_opt_class());
}

- (Class)baseDataProviderClass
{
  return (Class)objc_opt_class();
}

- (MTAccountEventHandler)account
{
  return (MTAccountEventHandler *)-[MTEventHandlers objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("account"));
}

- (MTClickEventHandler)click
{
  return (MTClickEventHandler *)-[MTEventHandlers objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("click"));
}

- (MTDialogEventHandler)dialog
{
  return (MTDialogEventHandler *)-[MTEventHandlers objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("dialog"));
}

- (MTEnterEventHandler)enter
{
  return (MTEnterEventHandler *)-[MTEventHandlers objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("enter"));
}

- (MTExitEventHandler)exit
{
  return (MTExitEventHandler *)-[MTEventHandlers objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("exit"));
}

- (MTImpressionsEventHandler)impressions
{
  return (MTImpressionsEventHandler *)-[MTEventHandlers objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("impressions"));
}

- (MTMediaEventHandler)media
{
  return (MTMediaEventHandler *)-[MTEventHandlers objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("media"));
}

- (MTPageEventHandler)page
{
  return (MTPageEventHandler *)-[MTEventHandlers objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("page"));
}

- (MTSearchEventHandler)search
{
  return (MTSearchEventHandler *)-[MTEventHandlers objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("search"));
}

- (MTFlexibleEventHandler)flexible
{
  MTMetricsEventHandlers *v2;
  MTFlexibleEventHandler *v3;
  void *v4;
  uint64_t v5;
  MTFlexibleEventHandler *flexible;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_flexible)
  {
    v3 = [MTFlexibleEventHandler alloc];
    -[MTObject metricsKit](v2, "metricsKit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MTObject initWithMetricsKit:](v3, "initWithMetricsKit:", v4);
    flexible = v2->_flexible;
    v2->_flexible = (MTFlexibleEventHandler *)v5;

  }
  objc_sync_exit(v2);

  return v2->_flexible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flexible, 0);
}

@end
