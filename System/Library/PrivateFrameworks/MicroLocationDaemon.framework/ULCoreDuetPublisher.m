@implementation ULCoreDuetPublisher

+ (void)saveEventsToDuetStream:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.milod.ULCoreDuetPublisher.saveEventsToDuetStream", v4);

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__ULCoreDuetPublisher_saveEventsToDuetStream___block_invoke;
    block[3] = &unk_2511D2C58;
    v7 = v3;
    dispatch_async(v5, block);

  }
}

void __46__ULCoreDuetPublisher_saveEventsToDuetStream___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  BOOL v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1B0B0], "knowledgeStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v16 = 0;
  v4 = objc_msgSend(v2, "saveObjects:error:", v3, &v16);
  v5 = v16;

  if ((_DWORD)v4)
    v6 = v5 == 0;
  else
    v6 = 0;
  if (v6)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_13);
    v11 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)MEMORY[0x24BDD16E0];
      v13 = *(void **)(a1 + 32);
      v14 = v11;
      objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v15;
      _os_log_impl(&dword_2419D9000, v14, OS_LOG_TYPE_DEFAULT, "Saved %@ events", buf, 0xCu);

    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_13);
    v7 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)MEMORY[0x24BDD16E0];
      v9 = v7;
      objc_msgSend(v8, "numberWithBool:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v10;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_2419D9000, v9, OS_LOG_TYPE_ERROR, "Couldnt save events, res: %@, error: %@", buf, 0x16u);

    }
  }

}

+ (void)clearMicroLocationVisitStream
{
  NSObject *v2;
  NSObject *queue;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  queue = dispatch_queue_create("com.apple.milod.ULCoreDuetPublisher.clearMicroLocationVisitStream", v2);

  dispatch_async(queue, &__block_literal_global_87);
}

void __52__ULCoreDuetPublisher_clearMicroLocationVisitStream__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1B0B0], "knowledgeStore");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B130], "microLocationVisitStream");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v2 = objc_msgSend(v0, "deleteAllEventsInEventStream:error:", v1, &v9);
  v3 = v9;

  if (v3)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_13);
    v4 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v3;
      _os_log_impl(&dword_2419D9000, v4, OS_LOG_TYPE_ERROR, "Couldnt delete all events from microLocationVisitStream, error: %@", buf, 0xCu);
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_13);
    v5 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)MEMORY[0x24BDD16E0];
      v7 = v5;
      objc_msgSend(v6, "numberWithUnsignedInteger:", v2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v8;
      _os_log_impl(&dword_2419D9000, v7, OS_LOG_TYPE_DEFAULT, "Deleted: %@ events", buf, 0xCu);

    }
  }

}

+ (void)saveEventForDebugInitialBringUp
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE1B080];
  objc_msgSend(MEMORY[0x24BE1B130], "microLocationVisitStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", 1000.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BE1B148];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "withUUID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventWithStream:startDate:endDate:value:", v4, v5, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "saveEventsToDuetStream:", v12);

}

@end
