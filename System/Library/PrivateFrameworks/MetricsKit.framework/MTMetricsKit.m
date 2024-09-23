@implementation MTMetricsKit

- (void)performMaintenanceForUserId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[MTMetricsKitTemplate config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__MTMetricsKit_Demographic__performMaintenanceForUserId___block_invoke;
  v9[3] = &unk_24C7A07E0;
  v9[4] = self;
  v10 = v4;
  v7 = v4;
  v8 = (id)objc_msgSend(v6, "thenWithBlock:", v9);

}

uint64_t __57__MTMetricsKit_Demographic__performMaintenanceForUserId___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configValueForKeyPath:sources:", CFSTR("identifiers.ageTopics"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "topic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("updateInterval"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    if (v10 == 0.0)
      v11 = 2592000.0;
    else
      v11 = v10;

    objc_msgSend(*(id *)(a1 + 32), "eventHandlers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("demographic"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "ageDataForUserId:updateInterval:", *(_QWORD *)(a1 + 40), v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAnonymous:", 1);
    v15 = (id)objc_msgSend(v14, "recordEvent");

  }
  return 0;
}

- (MTMetricsKit)initWithTopic:(id)a3
{
  MTMetricsKit *v3;
  MTMetricsEventHandlers *v4;
  MTMetricsUtils *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTMetricsKit;
  v3 = -[MTMetricsKitTemplate initWithTopic:](&v7, sel_initWithTopic_, a3);
  if (v3)
  {
    v4 = -[MTObject initWithMetricsKit:]([MTMetricsEventHandlers alloc], "initWithMetricsKit:", v3);
    -[MTMetricsKitTemplate setEventHandlers:](v3, "setEventHandlers:", v4);

    v5 = -[MTObject initWithMetricsKit:]([MTMetricsUtils alloc], "initWithMetricsKit:", v3);
    -[MTMetricsKitTemplate setUtils:](v3, "setUtils:", v5);

  }
  return v3;
}

- (id)metricsDataWithFlexibleEventType:(id)a3 eventData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[MTMetricsKitTemplate eventHandlers](self, "eventHandlers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "flexible");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "metricsDataWithEventType:eventData:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)metricsDataWithFlexibleEventType:(id)a3 fields:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id *v12;
  id v13;
  void *v14;
  id *v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id *)&v17;
  v9 = v7;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v8, "addObjectsFromArray:", v11);
      else
        objc_msgSend(v8, "addObject:", v11);
      v12 = v16++;
      v13 = *v12;

      v11 = v13;
    }
    while (v13);
  }
  -[MTMetricsKit metricsDataWithFlexibleEventType:eventData:](self, "metricsDataWithFlexibleEventType:eventData:", v6, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
