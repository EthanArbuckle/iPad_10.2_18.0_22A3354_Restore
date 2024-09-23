@implementation SUUIMetricsController

- (SUUIMetricsController)initWithGlobalConfiguration:(id)a3
{
  id v5;
  SUUIMetricsController *v6;
  SUUIMetricsController *v7;
  void *v8;
  int IsLocalWritable;
  Class *v10;
  SSMetricsController *v11;
  SSMetricsController *controller;
  double v13;
  void *v14;
  void *v15;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SUUIMetricsController;
  v6 = -[SUUIMetricsController init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_globalConfiguration, a3);
    objc_msgSend(MEMORY[0x24BEB1EF8], "databasePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    IsLocalWritable = SSFileIsLocalWritable();

    v10 = (Class *)0x24BEB1EE8;
    if (!IsLocalWritable)
      v10 = (Class *)0x24BEB1ED8;
    v11 = (SSMetricsController *)objc_alloc_init(*v10);
    controller = v7->_controller;
    v7->_controller = v11;

    -[SSMetricsController setGlobalConfiguration:](v7->_controller, "setGlobalConfiguration:", v5);
    -[SSMetricsConfiguration reportingFrequency](v7->_globalConfiguration, "reportingFrequency");
    v7->_flushesImmediately = v13 == 0.0;
    v7->_impressionsEnabled = -[SUUIMetricsController canRecordEventWithType:](v7, "canRecordEventWithType:", *MEMORY[0x24BEB2918]);
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_loggingEnabled = objc_msgSend(v14, "shouldLog");

    +[SUUIMetricsFlushTimer sharedTimer](SUUIMetricsFlushTimer, "sharedTimer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addMetricsController:", v7);

  }
  return v7;
}

- (void)dealloc
{
  NSObject *impressionsTimer;
  void *v4;
  objc_super v5;

  impressionsTimer = self->_impressionsTimer;
  if (impressionsTimer)
    dispatch_source_cancel(impressionsTimer);
  +[SUUIMetricsFlushTimer sharedTimer](SUUIMetricsFlushTimer, "sharedTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeMetricsController:", self);

  v5.receiver = self;
  v5.super_class = (Class)SUUIMetricsController;
  -[SUUIMetricsController dealloc](&v5, sel_dealloc);
}

- (NSNumber)accountIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (SUUIMetricsImpressionSession)activeImpressionsSession
{
  void *v3;
  uint64_t v4;
  NSObject *impressionsTimer;
  dispatch_time_t v6;
  SUUIMetricsImpressionSession *v7;
  SUUIMetricsImpressionSession *activeImpressionsSession;
  OS_dispatch_source *v9;
  OS_dispatch_source *v10;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  _QWORD v15[4];
  id v16;
  id location;

  if (self->_activeImpressionsSession
    || self->_impressionsEnabled
    && (v7 = objc_alloc_init(SUUIMetricsImpressionSession),
        activeImpressionsSession = self->_activeImpressionsSession,
        self->_activeImpressionsSession = v7,
        activeImpressionsSession,
        self->_activeImpressionsSession))
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "applicationState");

    if (!v4)
    {
      impressionsTimer = self->_impressionsTimer;
      if (impressionsTimer)
      {
        v6 = dispatch_time(0, 2000000000);
        dispatch_source_set_timer(impressionsTimer, v6, 0, 0);
      }
      else
      {
        objc_initWeak(&location, self);
        v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
        v10 = self->_impressionsTimer;
        self->_impressionsTimer = v9;

        v11 = self->_impressionsTimer;
        v12 = dispatch_time(0, 2000000000);
        dispatch_source_set_timer(v11, v12, 0, 0);
        v13 = self->_impressionsTimer;
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __49__SUUIMetricsController_activeImpressionsSession__block_invoke;
        v15[3] = &unk_2511F53F8;
        objc_copyWeak(&v16, &location);
        dispatch_source_set_event_handler(v13, v15);
        dispatch_resume((dispatch_object_t)self->_impressionsTimer);
        objc_destroyWeak(&v16);
        objc_destroyWeak(&location);
      }
    }
  }
  return self->_activeImpressionsSession;
}

void __49__SUUIMetricsController_activeImpressionsSession__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "closeImpressionsSession");

}

- (BOOL)canRecordEventWithType:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  if ((-[SSMetricsConfiguration isEventTypeBlacklisted:](self->_globalConfiguration, "isEventTypeBlacklisted:", v4) & 1) != 0)
    LOBYTE(v5) = 0;
  else
    v5 = -[SSMetricsConfiguration isEventTypeBlacklisted:](self->_pageConfiguration, "isEventTypeBlacklisted:", v4) ^ 1;

  return v5;
}

- (id)clickEventWithItem:(id)a3 locationPosition:(int64_t)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = (objc_class *)MEMORY[0x24BEB1EC8];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v7, "itemIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTargetIdentifier:", v9);

  v10 = *MEMORY[0x24BEB2978];
  objc_msgSend(v8, "setTargetType:", *MEMORY[0x24BEB2978]);
  objc_msgSend(v7, "productPageURLString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTargetURL:", v11);

  -[SUUIMetricsController locationWithPosition:type:fieldData:](self, "locationWithPosition:type:fieldData:", a4, v10, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v15[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLocationWithEventLocations:", v13);

  }
  return v8;
}

- (void)closeImpressionsSession
{
  -[SUUIMetricsController _recordActiveImpressions](self, "_recordActiveImpressions");
  if (self->_flushesImmediately)
    -[SUUIMetricsController flushImmediately](self, "flushImmediately");
}

- (id)compoundStringWithElements:(id)a3
{
  return (id)-[SSMetricsConfiguration compoundStringWithElements:](self->_globalConfiguration, "compoundStringWithElements:", a3);
}

- (void)flushImmediately
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  SSMetricsController *controller;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BEBE030];
  v5 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __41__SUUIMetricsController_flushImmediately__block_invoke;
  v13[3] = &unk_2511F5818;
  v6 = v3;
  v14 = v6;
  v15 = v4;
  v7 = objc_msgSend(v6, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("SUUIMetricsController.flushImmediately"), v13);
  -[SUUIMetricsController _recordActiveImpressions](self, "_recordActiveImpressions");
  controller = self->_controller;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __41__SUUIMetricsController_flushImmediately__block_invoke_2;
  v10[3] = &unk_2511F5F88;
  v11 = v6;
  v12 = v7;
  v9 = v6;
  -[SSMetricsController flushUnreportedEventsWithCompletionHandler:](controller, "flushUnreportedEventsWithCompletionHandler:", v10);

}

uint64_t __41__SUUIMetricsController_flushImmediately__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endBackgroundTask:", *(_QWORD *)(a1 + 40));
}

uint64_t __41__SUUIMetricsController_flushImmediately__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endBackgroundTask:", *(_QWORD *)(a1 + 40));
}

+ (void)flushImmediately
{
  id v2;

  +[SUUIMetricsFlushTimer sharedTimer](SUUIMetricsFlushTimer, "sharedTimer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flushAllMetricsControllers");

}

- (double)flushInterval
{
  double result;

  -[SSMetricsConfiguration reportingFrequency](self->_globalConfiguration, "reportingFrequency");
  return result;
}

- (id)itemOfferClickEventWithItem:(id)a3 locationPosition:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BEB1EC8]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v6, "itemIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTargetIdentifier:", v8);

  v9 = *MEMORY[0x24BEB2968];
  objc_msgSend(v7, "setTargetType:", *MEMORY[0x24BEB2968]);
  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "metricsActionTypeForItem:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setActionType:", v11);
  if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BEB28E8]))
  {
    objc_msgSend(v6, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActionDetails:", v12);
LABEL_6:

    goto LABEL_7;
  }
  if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BEB28D0]))
  {
    objc_msgSend(v6, "primaryItemOffer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "actionParameters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v12, CFSTR("buyParams"), 0);
      objc_msgSend(v7, "setActionDetails:", v14);

    }
    goto LABEL_6;
  }
LABEL_7:
  -[SUUIMetricsController locationWithPosition:type:fieldData:](self, "locationWithPosition:type:fieldData:", 0, v9, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIMetricsController locationWithPosition:type:fieldData:](self, "locationWithPosition:type:fieldData:", a4, *MEMORY[0x24BEB2978], v6);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v15 && v16)
  {
    v20[0] = v15;
    v20[1] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLocationWithEventLocations:", v18);

  }
  return v7;
}

- (id)locationWithPageComponent:(id)a3
{
  SSMetricsController *controller;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  controller = self->_controller;
  v4 = a3;
  v5 = objc_msgSend(v4, "metricsLocationPosition");
  objc_msgSend(v4, "metricsElementName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsController locationWithPosition:type:fieldData:](controller, "locationWithPosition:type:fieldData:", v5, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)locationWithPosition:(int64_t)a3 type:(id)a4 fieldData:(id)a5
{
  return (id)-[SSMetricsController locationWithPosition:type:fieldData:](self->_controller, "locationWithPosition:type:fieldData:", a3, a4, a5);
}

- (id)performActionForItem:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = SUUIItemStateCenterUseAppstoredPurchases(v4);
  objc_msgSend(v4, "primaryItemOffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[SUUIMetricsController performActionForSoftwareItem:offer:clientContext:completionBlock:](self, "performActionForSoftwareItem:offer:clientContext:completionBlock:", v4, v6, 0, 0);
  else
    -[SUUIMetricsController performActionForItem:offer:clientContext:completionBlock:](self, "performActionForItem:offer:clientContext:completionBlock:", v4, v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)performActionForItem:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = SUUIItemStateCenterUseAppstoredPurchases(v7);
  objc_msgSend(v7, "primaryItemOffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    -[SUUIMetricsController performActionForSoftwareItem:offer:clientContext:completionBlock:](self, "performActionForSoftwareItem:offer:clientContext:completionBlock:", v7, v9, v6, 0);
  else
    -[SUUIMetricsController performActionForItem:offer:clientContext:completionBlock:](self, "performActionForItem:offer:clientContext:completionBlock:", v7, v9, v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)performActionForItem:(id)a3 offer:(id)a4 clientContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  if (SUUIItemStateCenterUseAppstoredPurchases(v10))
    -[SUUIMetricsController performActionForSoftwareItem:offer:clientContext:completionBlock:](self, "performActionForSoftwareItem:offer:clientContext:completionBlock:", v10, v9, v8, 0);
  else
    -[SUUIMetricsController performActionForItem:offer:clientContext:completionBlock:](self, "performActionForItem:offer:clientContext:completionBlock:", v10, v9, v8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)performActionForItem:(id)a3 offer:(id)a4 clientContext:(id)a5 completionBlock:(id)a6
{
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  SUUIMetricsController *v24;
  id v25;
  uint64_t v26;

  v10 = a6;
  v11 = (objc_class *)MEMORY[0x24BEB1F18];
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = objc_alloc_init(v11);
  v16 = objc_msgSend(v14, "itemIdentifier");
  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __82__SUUIMetricsController_performActionForItem_offer_clientContext_completionBlock___block_invoke;
  v22[3] = &unk_2511F5FB0;
  v23 = v15;
  v24 = self;
  v25 = v10;
  v26 = v16;
  v18 = v10;
  v19 = v15;
  objc_msgSend(v17, "performActionForItem:offer:clientContext:completionBlock:", v14, v13, v12, v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __82__SUUIMetricsController_performActionForItem_offer_clientContext_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(v3, "transactionIdentifierForItemIdentifier:", *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __82__SUUIMetricsController_performActionForItem_offer_clientContext_completionBlock___block_invoke_2;
    v8[3] = &unk_2511F5D20;
    v9 = *(id *)(a1 + 32);
    v10 = v3;
    v5 = v4;
    v6 = *(_QWORD *)(a1 + 40);
    v11 = v5;
    v12 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], v8);

  }
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

uint64_t __82__SUUIMetricsController_performActionForItem_offer_clientContext_completionBlock___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addFieldsFromPurchaseResponse:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setTransactionIdentifier:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 56), "recordEvent:", *(_QWORD *)(a1 + 32));
}

- (id)performActionForSoftwareItem:(id)a3 offer:(id)a4 clientContext:(id)a5 completionBlock:(id)a6
{
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  SUUIMetricsController *v24;
  id v25;
  uint64_t v26;

  v10 = a6;
  v11 = (objc_class *)MEMORY[0x24BEB1F18];
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = objc_alloc_init(v11);
  v16 = objc_msgSend(v14, "itemIdentifier");
  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __90__SUUIMetricsController_performActionForSoftwareItem_offer_clientContext_completionBlock___block_invoke;
  v22[3] = &unk_2511F5FD8;
  v23 = v15;
  v24 = self;
  v25 = v10;
  v26 = v16;
  v18 = v10;
  v19 = v15;
  objc_msgSend(v17, "performActionForSoftwareItem:offer:clientContext:completionBlock:", v14, v13, v12, v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __90__SUUIMetricsController_performActionForSoftwareItem_offer_clientContext_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(v3, "transactionIdentifierForItemIdentifier:", *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __90__SUUIMetricsController_performActionForSoftwareItem_offer_clientContext_completionBlock___block_invoke_2;
    v8[3] = &unk_2511F5D20;
    v9 = *(id *)(a1 + 32);
    v10 = v3;
    v5 = v4;
    v6 = *(_QWORD *)(a1 + 40);
    v11 = v5;
    v12 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], v8);

  }
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

uint64_t __90__SUUIMetricsController_performActionForSoftwareItem_offer_clientContext_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "responseMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addPropertiesWithDictionary:", v3);

  objc_msgSend(*(id *)(a1 + 40), "requestStartTime");
  if (v4 > 2.22044605e-16)
    objc_msgSend(*(id *)(a1 + 32), "setRequestStartTime:");
  objc_msgSend(*(id *)(a1 + 40), "responseEndTime");
  if (v5 > 2.22044605e-16)
    objc_msgSend(*(id *)(a1 + 32), "setResponseEndTime:");
  objc_msgSend(*(id *)(a1 + 40), "responseStartTime");
  if (v6 > 2.22044605e-16)
    objc_msgSend(*(id *)(a1 + 32), "setResponseStartTime:");
  objc_msgSend(*(id *)(a1 + 32), "setTransactionIdentifier:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 56), "recordEvent:", *(_QWORD *)(a1 + 32));
}

- (void)pingURLs:(id)a3
{
  -[SUUIMetricsController pingURLs:withClientContext:](self, "pingURLs:withClientContext:", a3, 0);
}

- (void)pingURLs:(id)a3 withClientContext:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    if (!pingURLs_withClientContext__sPingQueue)
    {
      v7 = objc_alloc_init(MEMORY[0x24BDD1710]);
      v8 = (void *)pingURLs_withClientContext__sPingQueue;
      pingURLs_withClientContext__sPingQueue = (uint64_t)v7;

      objc_msgSend((id)pingURLs_withClientContext__sPingQueue, "setMaxConcurrentOperationCount:", 1);
      objc_msgSend((id)pingURLs_withClientContext__sPingQueue, "setName:", CFSTR("com.apple.StoreServices.SUUIMetricsController.ping"));
    }
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    obj = v5;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(obj);
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB7458]), "initWithURL:cachePolicy:timeoutInterval:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), 1, 20.0);
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2040]), "initWithURLRequest:", v13);
          objc_msgSend(v14, "setQueuePriority:", -8);
          objc_msgSend(v14, "setRecordsMetrics:", 0);
          objc_msgSend(v6, "valueForConfigurationKey:", CFSTR("sfsuffix"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setStoreFrontSuffix:", v15);

          objc_msgSend((id)pingURLs_withClientContext__sPingQueue, "addOperation:", v14);
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

  }
}

- (void)recordBuyConfirmedEventsForItems:(id)a3 purchaseResponses:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  obj = a3;
  v21 = a4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v27;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v8);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v10 = v21;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v23;
LABEL_8:
          v14 = 0;
          while (1)
          {
            if (*(_QWORD *)v23 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v14);
            objc_msgSend(v15, "transactionIdentifierForItemIdentifier:", objc_msgSend(v9, "itemIdentifier"));
            v16 = objc_claimAutoreleasedReturnValue();
            if (v16)
              break;
            if (v12 == ++v14)
            {
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
              if (v12)
                goto LABEL_8;
              goto LABEL_14;
            }
          }
          v18 = (void *)v16;
          v17 = v15;

          if (!v17)
            goto LABEL_18;
          v10 = objc_alloc_init(MEMORY[0x24BEB1F18]);
          objc_msgSend(v10, "addFieldsFromPurchaseResponse:", v17);
          objc_msgSend(v10, "setTransactionIdentifier:", v18);
          -[SUUIMetricsController recordEvent:](self, "recordEvent:", v10);
        }
        else
        {
LABEL_14:
          v17 = 0;
          v18 = 0;
        }

LABEL_18:
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v6);
  }

}

- (void)recordEvent:(id)a3
{
  -[SUUIMetricsController _insertEvent:](self, "_insertEvent:", a3);
  if (self->_flushesImmediately)
    -[SUUIMetricsController flushImmediately](self, "flushImmediately");
}

- (void)setPageConfiguration:(id)a3
{
  double v5;
  void *v6;
  SSMetricsConfiguration *v7;

  v7 = (SSMetricsConfiguration *)a3;
  if (self->_pageConfiguration != v7)
  {
    objc_storeStrong((id *)&self->_pageConfiguration, a3);
    -[SSMetricsController setPageConfiguration:](self->_controller, "setPageConfiguration:", v7);
    -[SSMetricsConfiguration reportingFrequency](self->_globalConfiguration, "reportingFrequency");
    self->_flushesImmediately = v5 == 0.0;
    self->_impressionsEnabled = -[SUUIMetricsController canRecordEventWithType:](self, "canRecordEventWithType:", *MEMORY[0x24BEB2918]);
    +[SUUIMetricsFlushTimer sharedTimer](SUUIMetricsFlushTimer, "sharedTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadFlushInterval");

  }
}

- (id)tokenStringWithElements:(id)a3
{
  return (id)-[SSMetricsConfiguration tokenStringWithElements:](self->_globalConfiguration, "tokenStringWithElements:", a3);
}

- (void)_waitUntilRecordingComplete
{
  NSObject *v2;

  -[SSMetricsController serialQueue](self->_controller, "serialQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v2, &__block_literal_global_6);

}

- (void)_insertEvent:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_loggingEnabled)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    objc_msgSend(v5, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      v9 = v7;
    else
      v9 = v7 & 2;
    if (v9)
    {
      v18 = 138412290;
      v19 = v4;
      LODWORD(v17) = 12;
      v16 = &v18;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v18, v17);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      v16 = (int *)v8;
      SSFileLog();
    }

    goto LABEL_12;
  }
LABEL_13:
  -[SUUIMetricsController accountIdentifier](self, "accountIdentifier", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccountIdentifier:", v11);

  objc_msgSend(v4, "setApplicationIdentifier:", self->_applicationIdentifier);
  objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "networkType");
  SSGetStringForNetworkType();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConnection:", v13);

  objc_msgSend(v4, "setHostApplicationIdentifier:", self->_hostApplicationIdentifier);
  objc_msgSend(v4, "setPageContext:", self->_pageContext);
  objc_msgSend(v4, "topic");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (!v15)
    objc_msgSend(v4, "setTopic:", self->_topic);
  objc_msgSend(v4, "setUserAgent:", self->_userAgent);
  objc_msgSend(v4, "setWindowOrientation:", self->_windowOrientation);
  if (self->_pageURL)
    objc_msgSend(v4, "setPageURL:");
  -[SSMetricsController insertEvent:withCompletionHandler:](self->_controller, "insertEvent:withCompletionHandler:", v4, 0);

}

- (void)_recordActiveImpressions
{
  SUUIMetricsImpressionSession *activeImpressionsSession;
  void *v4;
  id v5;
  SUUIMetricsImpressionSession *v6;
  NSObject *impressionsTimer;
  OS_dispatch_source *v8;

  activeImpressionsSession = self->_activeImpressionsSession;
  if (activeImpressionsSession)
  {
    -[SUUIMetricsImpressionSession impressionIdentifiers](activeImpressionsSession, "impressionIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v5 = objc_alloc_init(MEMORY[0x24BEB1F00]);
      objc_msgSend(v5, "setImpressionIdentifiers:", v4);
      -[SUUIMetricsController _insertEvent:](self, "_insertEvent:", v5);

    }
    v6 = self->_activeImpressionsSession;
    self->_activeImpressionsSession = 0;

  }
  impressionsTimer = self->_impressionsTimer;
  if (impressionsTimer)
  {
    dispatch_source_cancel(impressionsTimer);
    v8 = self->_impressionsTimer;
    self->_impressionsTimer = 0;

  }
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SSMetricsConfiguration)globalConfiguration
{
  return self->_globalConfiguration;
}

- (NSString)hostApplicationIdentifier
{
  return self->_hostApplicationIdentifier;
}

- (void)setHostApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (SSMetricsConfiguration)pageConfiguration
{
  return self->_pageConfiguration;
}

- (NSString)pageContext
{
  return self->_pageContext;
}

- (void)setPageContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)pageURL
{
  return self->_pageURL;
}

- (void)setPageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)windowOrientation
{
  return self->_windowOrientation;
}

- (void)setWindowOrientation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowOrientation, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_pageURL, 0);
  objc_storeStrong((id *)&self->_pageContext, 0);
  objc_storeStrong((id *)&self->_pageConfiguration, 0);
  objc_storeStrong((id *)&self->_impressionsTimer, 0);
  objc_storeStrong((id *)&self->_hostApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_globalConfiguration, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_activeImpressionsSession, 0);
}

@end
