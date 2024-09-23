@implementation SKAdNetwork

+ (void)startImpression:(SKAdImpression *)impression completionHandler:(void *)completion
{
  void *v6;
  SKAdImpression *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  _QWORD block[4];
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];

  v6 = completion;
  v7 = impression;
  v8 = (void *)objc_opt_new();
  -[SKAdImpression sourceAppStoreItemIdentifier](v7, "sourceAppStoreItemIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, 0x1E5B2E780);

  -[SKAdImpression advertisedAppStoreItemIdentifier](v7, "advertisedAppStoreItemIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, 0x1E5B2E7A0);

  -[SKAdImpression adNetworkIdentifier](v7, "adNetworkIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, 0x1E5B2E7C0);

  -[SKAdImpression adCampaignIdentifier](v7, "adCampaignIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, 0x1E5B2E7E0);

  -[SKAdImpression sourceIdentifier](v7, "sourceIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, 0x1E5B2E800);

  -[SKAdImpression adImpressionIdentifier](v7, "adImpressionIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, 0x1E5B2E820);

  -[SKAdImpression signature](v7, "signature");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, 0x1E5B2E840);

  -[SKAdImpression version](v7, "version");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, 0x1E5B2E860);

  -[SKAdImpression timestamp](v7, "timestamp");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, 0x1E5B2E880);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E5B4A200, 0x1E5B2E8A0);
  +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __49__SKAdNetwork_startImpression_completionHandler___block_invoke;
  v30[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v30[4] = a1;
  objc_msgSend(v18, "storeKitSynchronousServiceWithErrorHandler:", v30);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  _SKAdNetworkGetImpressionQueue();
  v21 = objc_claimAutoreleasedReturnValue();
  block[0] = v19;
  block[1] = 3221225472;
  block[2] = __49__SKAdNetwork_startImpression_completionHandler___block_invoke_24;
  block[3] = &unk_1E5B26E80;
  v26 = v20;
  v27 = v8;
  v28 = v6;
  v29 = a1;
  v22 = v6;
  v23 = v8;
  v24 = v20;
  dispatch_async(v21, block);

}

void __49__SKAdNetwork_startImpression_completionHandler___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __49__SKAdNetwork_startImpression_completionHandler___block_invoke_cold_1();
}

void __49__SKAdNetwork_startImpression_completionHandler___block_invoke_24(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__SKAdNetwork_startImpression_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5B26E58;
  v4 = *(_OWORD *)(a1 + 48);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(v1, "startAdImpressionWithConfig:completionHandler:", v2, v5);

}

void __49__SKAdNetwork_startImpression_completionHandler___block_invoke_2(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _SKANErrorFromNSError((void *)a2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (a2 | v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __49__SKAdNetwork_startImpression_completionHandler___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Started view-through impression", (uint8_t *)&v7, 0xCu);
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v4);

}

+ (void)endImpression:(SKAdImpression *)impression completionHandler:(void *)completion
{
  void *v6;
  SKAdImpression *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  _QWORD block[4];
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];

  v6 = completion;
  v7 = impression;
  v8 = (void *)objc_opt_new();
  -[SKAdImpression sourceAppStoreItemIdentifier](v7, "sourceAppStoreItemIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, 0x1E5B2E780);

  -[SKAdImpression advertisedAppStoreItemIdentifier](v7, "advertisedAppStoreItemIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, 0x1E5B2E7A0);

  -[SKAdImpression adNetworkIdentifier](v7, "adNetworkIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, 0x1E5B2E7C0);

  -[SKAdImpression adCampaignIdentifier](v7, "adCampaignIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, 0x1E5B2E7E0);

  -[SKAdImpression sourceIdentifier](v7, "sourceIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, 0x1E5B2E800);

  -[SKAdImpression adImpressionIdentifier](v7, "adImpressionIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, 0x1E5B2E820);

  -[SKAdImpression signature](v7, "signature");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, 0x1E5B2E840);

  -[SKAdImpression version](v7, "version");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, 0x1E5B2E860);

  -[SKAdImpression timestamp](v7, "timestamp");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, 0x1E5B2E880);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E5B4A200, 0x1E5B2E8A0);
  +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __47__SKAdNetwork_endImpression_completionHandler___block_invoke;
  v30[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v30[4] = a1;
  objc_msgSend(v18, "storeKitSynchronousServiceWithErrorHandler:", v30);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  _SKAdNetworkGetImpressionQueue();
  v21 = objc_claimAutoreleasedReturnValue();
  block[0] = v19;
  block[1] = 3221225472;
  block[2] = __47__SKAdNetwork_endImpression_completionHandler___block_invoke_26;
  block[3] = &unk_1E5B26E80;
  v26 = v20;
  v27 = v8;
  v28 = v6;
  v29 = a1;
  v22 = v6;
  v23 = v8;
  v24 = v20;
  dispatch_async(v21, block);

}

void __47__SKAdNetwork_endImpression_completionHandler___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __47__SKAdNetwork_endImpression_completionHandler___block_invoke_cold_1();
}

void __47__SKAdNetwork_endImpression_completionHandler___block_invoke_26(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__SKAdNetwork_endImpression_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5B26E58;
  v4 = *(_OWORD *)(a1 + 48);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(v1, "endAdImpressionWithConfig:completionHandler:", v2, v5);

}

void __47__SKAdNetwork_endImpression_completionHandler___block_invoke_2(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _SKANErrorFromNSError((void *)a2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (a2 | v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __47__SKAdNetwork_endImpression_completionHandler___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Ended view-through impression", (uint8_t *)&v7, 0xCu);
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v4);

}

+ (void)registerAppForAdNetworkAttribution
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SKAdNetwork_registerAppForAdNetworkAttribution__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (registerAppForAdNetworkAttribution_onceToken != -1)
    dispatch_once(&registerAppForAdNetworkAttribution_onceToken, block);
}

void __49__SKAdNetwork_registerAppForAdNetworkAttribution__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__SKAdNetwork_registerAppForAdNetworkAttribution__block_invoke_2;
  v4[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "storeKitServiceWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "registerForInstallAttribution");
}

void __49__SKAdNetwork_registerAppForAdNetworkAttribution__block_invoke_2()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __49__SKAdNetwork_registerAppForAdNetworkAttribution__block_invoke_2_cold_1();
}

+ (void)updateConversionValue:(NSInteger)conversionValue
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__SKAdNetwork_updateConversionValue___block_invoke;
  v8[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v8[4] = a1;
  objc_msgSend(v5, "storeKitServiceWithErrorHandler:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", conversionValue);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateConversionValue:", v7);

}

void __37__SKAdNetwork_updateConversionValue___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __37__SKAdNetwork_updateConversionValue___block_invoke_cold_1();
}

+ (void)updatePostbackConversionValue:(NSInteger)conversionValue completionHandler:(void *)completion
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  NSInteger v16;
  id v17;
  _QWORD v18[5];

  v6 = completion;
  +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __63__SKAdNetwork_updatePostbackConversionValue_completionHandler___block_invoke;
  v18[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v18[4] = a1;
  objc_msgSend(v7, "storeKitSynchronousServiceWithErrorHandler:", v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _SKAdNetworkGetImpressionQueue();
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __63__SKAdNetwork_updatePostbackConversionValue_completionHandler___block_invoke_29;
  block[3] = &unk_1E5B26EA8;
  v16 = conversionValue;
  v17 = a1;
  v14 = v9;
  v15 = v6;
  v11 = v6;
  v12 = v9;
  dispatch_async(v10, block);

}

void __63__SKAdNetwork_updatePostbackConversionValue_completionHandler___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __37__SKAdNetwork_updateConversionValue___block_invoke_cold_1();
}

void __63__SKAdNetwork_updatePostbackConversionValue_completionHandler___block_invoke_29(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__SKAdNetwork_updatePostbackConversionValue_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5B26E58;
  v6 = *(_QWORD *)(a1 + 56);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "updateConversionValue:completionHandler:", v3, v4);

}

void __63__SKAdNetwork_updatePostbackConversionValue_completionHandler___block_invoke_2(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  _SKANErrorFromNSError((void *)a2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (a2 | v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __63__SKAdNetwork_updatePostbackConversionValue_completionHandler___block_invoke_2_cold_1();
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v4);

}

+ (void)updatePostbackConversionValue:(NSInteger)fineValue coarseValue:(SKAdNetworkCoarseConversionValue)coarseValue completionHandler:(void *)completion
{
  NSString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSString *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  NSString *v19;
  id v20;
  NSInteger v21;
  id v22;
  _QWORD v23[5];

  v8 = coarseValue;
  v9 = completion;
  +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __75__SKAdNetwork_updatePostbackConversionValue_coarseValue_completionHandler___block_invoke;
  v23[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v23[4] = a1;
  objc_msgSend(v10, "storeKitSynchronousServiceWithErrorHandler:", v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _SKAdNetworkGetImpressionQueue();
  v13 = objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __75__SKAdNetwork_updatePostbackConversionValue_coarseValue_completionHandler___block_invoke_30;
  v17[3] = &unk_1E5B26ED0;
  v18 = v12;
  v19 = v8;
  v21 = fineValue;
  v22 = a1;
  v20 = v9;
  v14 = v9;
  v15 = v8;
  v16 = v12;
  dispatch_async(v13, v17);

}

void __75__SKAdNetwork_updatePostbackConversionValue_coarseValue_completionHandler___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __37__SKAdNetwork_updateConversionValue___block_invoke_cold_1();
}

void __75__SKAdNetwork_updatePostbackConversionValue_coarseValue_completionHandler___block_invoke_30(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__SKAdNetwork_updatePostbackConversionValue_coarseValue_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5B26E58;
  v7 = *(_QWORD *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "updateConversionValue:coarseValue:completionHandler:", v3, v4, v5);

}

void __75__SKAdNetwork_updatePostbackConversionValue_coarseValue_completionHandler___block_invoke_2(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  _SKANErrorFromNSError((void *)a2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (a2 | v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __63__SKAdNetwork_updatePostbackConversionValue_completionHandler___block_invoke_2_cold_1();
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v4);

}

+ (void)updatePostbackConversionValue:(NSInteger)fineValue coarseValue:(SKAdNetworkCoarseConversionValue)coarseValue lockWindow:(BOOL)lockWindow completionHandler:(void *)completion
{
  NSString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSString *v17;
  id v18;
  _QWORD block[4];
  id v20;
  NSString *v21;
  id v22;
  NSInteger v23;
  id v24;
  BOOL v25;
  _QWORD v26[5];

  v10 = coarseValue;
  v11 = completion;
  +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __86__SKAdNetwork_updatePostbackConversionValue_coarseValue_lockWindow_completionHandler___block_invoke;
  v26[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v26[4] = a1;
  objc_msgSend(v12, "storeKitSynchronousServiceWithErrorHandler:", v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _SKAdNetworkGetImpressionQueue();
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __86__SKAdNetwork_updatePostbackConversionValue_coarseValue_lockWindow_completionHandler___block_invoke_31;
  block[3] = &unk_1E5B26EF8;
  v20 = v14;
  v21 = v10;
  v25 = lockWindow;
  v23 = fineValue;
  v24 = a1;
  v22 = v11;
  v16 = v11;
  v17 = v10;
  v18 = v14;
  dispatch_async(v15, block);

}

void __86__SKAdNetwork_updatePostbackConversionValue_coarseValue_lockWindow_completionHandler___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __37__SKAdNetwork_updateConversionValue___block_invoke_cold_1();
}

void __86__SKAdNetwork_updatePostbackConversionValue_coarseValue_lockWindow_completionHandler___block_invoke_31(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(unsigned __int8 *)(a1 + 72);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__SKAdNetwork_updatePostbackConversionValue_coarseValue_lockWindow_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5B26E58;
  v8 = *(_QWORD *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v2, "updateConversionValue:coarseValue:lockWindow:completionHandler:", v3, v5, v4, v6);

}

void __86__SKAdNetwork_updatePostbackConversionValue_coarseValue_lockWindow_completionHandler___block_invoke_2(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  _SKANErrorFromNSError((void *)a2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (a2 | v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __63__SKAdNetwork_updatePostbackConversionValue_completionHandler___block_invoke_2_cold_1();
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v4);

}

void __49__SKAdNetwork_startImpression_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "%{public}@: Error in remote proxy while starting view-through impression: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

void __49__SKAdNetwork_startImpression_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "%{public}@: Error in remote proxy while starting view-through impression: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

void __47__SKAdNetwork_endImpression_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "%{public}@: Error in remote proxy while ending view-through impression: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

void __47__SKAdNetwork_endImpression_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "%{public}@: Error in remote proxy while ending\a view-through impression: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

void __49__SKAdNetwork_registerAppForAdNetworkAttribution__block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "%{public}@: Error in remote proxy while registering SKAdNetwork: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

void __37__SKAdNetwork_updateConversionValue___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "%{public}@: Error in remote proxy while updating SKAdNetwork conversion value: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

void __63__SKAdNetwork_updatePostbackConversionValue_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "%{public}@: Error while updating conversion value: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

@end
