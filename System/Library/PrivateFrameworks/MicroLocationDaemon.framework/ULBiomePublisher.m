@implementation ULBiomePublisher

+ (void)saveMicroLocationLocalizationEvents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  BiomeLibrary();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "Location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "MicroLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "Localization");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_saveEventsWithSource:events:", v8, v4);

}

+ (void)saveMicroLocationVisitEvents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  BiomeLibrary();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "Location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "MicroLocationVisit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_saveEventsWithSource:events:", v7, v4);

}

+ (void)saveEventForDebugInitialBringUp
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE0C560]);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithAbsoluteTimeStamp:clientBundleID:maxProbabilityLabel:maxProbability:probabilityVector:numDevicesVector:", v4, CFSTR("com.apple.milod"), 0, 0, v5, v6);

  v15[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "saveMicroLocationLocalizationEvents:", v8);

  v9 = objc_alloc(MEMORY[0x24BE0C470]);
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithDomain:maxProbabilityMicroLocationIdentifier:maxProbability:probabilityVector:isStable:numDevicesVector:", 0, CFSTR("com.apple.milod"), 0, v10, 0, v11);

  v14 = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "saveMicroLocationVisitEvents:", v13);

}

+ (void)_saveEventsWithSource:(id)a3 events:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __49__ULBiomePublisher__saveEventsWithSource_events___block_invoke;
    v14[3] = &unk_2511D5EF8;
    v15 = v5;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v14);
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_51);
    v7 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)MEMORY[0x24BDD16E0];
      v9 = v7;
      objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v17 = v10;
      v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_2419D9000, v9, OS_LOG_TYPE_DEFAULT, "Send %@ events of type %@", buf, 0x16u);

    }
  }

}

uint64_t __49__ULBiomePublisher__saveEventsWithSource_events___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendEvent:", a2);
}

@end
