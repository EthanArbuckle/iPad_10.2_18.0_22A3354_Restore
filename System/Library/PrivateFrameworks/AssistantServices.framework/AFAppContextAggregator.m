@implementation AFAppContextAggregator

- (void)aggregateContextWithRawOutputForAppWithBundleIdentifier:(id)a3 contextProvider:(id)a4 deliveryHandler:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[AFAppContextAggregator aggregateContextWithRawOutputForAppWithBundleIdentifier:contextProvider:deliveryHandl"
          "er:completionHandler:]";
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_19AF50000, v13, OS_LOG_TYPE_INFO, "%s Asking for context for %@", buf, 0x16u);
  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __132__AFAppContextAggregator_aggregateContextWithRawOutputForAppWithBundleIdentifier_contextProvider_deliveryHandler_completionHandler___block_invoke;
  v16[3] = &unk_1E3A351C8;
  v17 = v9;
  v18 = v12;
  v14 = v12;
  v15 = v9;
  objc_msgSend(v10, "getAppContextWithDeliveryHandler:completionHandler:", v11, v16);

}

- (void)aggregateContextForAppWithBundleIdentifier:(id)a3 contextProvider:(id)a4 deliveryHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v10 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __119__AFAppContextAggregator_aggregateContextForAppWithBundleIdentifier_contextProvider_deliveryHandler_completionHandler___block_invoke;
  v12[3] = &unk_1E3A351F0;
  v13 = v10;
  v11 = v10;
  -[AFAppContextAggregator aggregateContextWithRawOutputForAppWithBundleIdentifier:contextProvider:deliveryHandler:completionHandler:](self, "aggregateContextWithRawOutputForAppWithBundleIdentifier:contextProvider:deliveryHandler:completionHandler:", a3, a4, a5, v12);

}

- (void)aggregateContextForAppWithBundleIdentifier:(id)a3 contextProvider:(id)a4 completionHandler:(id)a5
{
  -[AFAppContextAggregator aggregateContextForAppWithBundleIdentifier:contextProvider:deliveryHandler:completionHandler:](self, "aggregateContextForAppWithBundleIdentifier:contextProvider:deliveryHandler:completionHandler:", a3, a4, 0, a5);
}

uint64_t __119__AFAppContextAggregator_aggregateContextForAppWithBundleIdentifier_contextProvider_deliveryHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __132__AFAppContextAggregator_aggregateContextWithRawOutputForAppWithBundleIdentifier_contextProvider_deliveryHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v15 = "-[AFAppContextAggregator aggregateContextWithRawOutputForAppWithBundleIdentifier:contextProvider:deliveryHandl"
          "er:completionHandler:]_block_invoke";
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s Got context for %@", buf, 0x16u);
  }
  objc_msgSend(v3, "_aceValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_alloc_init(MEMORY[0x1E0D87F80]);
  v9 = objc_alloc_init(MEMORY[0x1E0D884B8]);
  objc_msgSend(v9, "setBundleId:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v8, "setAppIdentifyingInfo:", v9);
  objc_msgSend(v8, "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v10);

  if (objc_msgSend(v6, "count"))
    objc_msgSend(v7, "addObjectsFromArray:", v6);
  v11 = objc_alloc_init(MEMORY[0x1E0D88438]);
  v13 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOrderedContext:", v12);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
