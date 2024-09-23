@implementation SKInternalProductStorePromotionController

+ (id)defaultController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SKInternalProductStorePromotionController_defaultController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultController_onceToken[0] != -1)
    dispatch_once(defaultController_onceToken, block);
  return (id)defaultController_defaultController_0;
}

void __62__SKInternalProductStorePromotionController_defaultController__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultController_defaultController_0;
  defaultController_defaultController_0 = (uint64_t)v1;

}

- (void)_handleReply:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD block[4];
  id v41;
  id v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  void *v51;
  uint8_t v52[128];
  uint8_t buf[4];
  SKInternalProductStorePromotionController *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v8 || v9)
  {
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SKInternalProductStorePromotionController _handleReply:error:completionHandler:].cold.2((uint64_t)self, (uint64_t)v9, v29, v30, v31, v32, v33, v34);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v54 = self;
      _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%{public}@]: No promotion info found", buf, 0xCu);
    }
    dispatch_get_global_queue(21, 0);
    v35 = objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __82__SKInternalProductStorePromotionController__handleReply_error_completionHandler___block_invoke;
    v49[3] = &unk_1E5B26970;
    v51 = v11;
    v50 = v9;
    v28 = v11;
    dispatch_async(v35, v49);

    v27 = v51;
  }
  else
  {
    v36 = v10;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      -[SKInternalProductStorePromotionController _handleReply:error:completionHandler:].cold.1((uint64_t)self, v8);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v46 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v17, "valueForKey:", SKPaymentOptionLegacyOfferName);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "valueForKey:", 0x1E5B2E6C0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v19, "integerValue") & 0x8000000000000000) == 0)
          {
            objc_msgSend(v39, "addObject:", v18);
            objc_msgSend(v17, "valueForKey:", 0x1E5B2E6E0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (objc_msgSend(v20, "integerValue"))
              {
                v21 = objc_msgSend(v20, "integerValue");
                v22 = v38;
                if (v21 == 1 || (v23 = objc_msgSend(v20, "integerValue"), v22 = v37, v23 == 2))
                  objc_msgSend(v22, "addObject:", v18);
              }
            }

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
      }
      while (v14);
    }

    dispatch_get_global_queue(21, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__SKInternalProductStorePromotionController__handleReply_error_completionHandler___block_invoke_4;
    block[3] = &unk_1E5B275F0;
    v41 = v39;
    v42 = v37;
    v43 = v38;
    v44 = v36;
    v25 = v36;
    v26 = v38;
    v27 = v37;
    v28 = v39;
    dispatch_async(v24, block);

    v9 = 0;
  }

}

void __82__SKInternalProductStorePromotionController__handleReply_error_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  v4 = (id)objc_opt_new();
  v3 = (void *)objc_opt_new();
  (*(void (**)(uint64_t, _QWORD, id, void *, _QWORD))(v2 + 16))(v2, MEMORY[0x1E0C9AA60], v4, v3, *(_QWORD *)(a1 + 32));

}

uint64_t __82__SKInternalProductStorePromotionController__handleReply_error_completionHandler___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], 0);
}

- (void)fetchOverridesForVisibilityAndOrderForApplicationBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  v5 = a4;
  if (v5)
  {
    +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __129__SKInternalProductStorePromotionController_fetchOverridesForVisibilityAndOrderForApplicationBundleIdentifier_completionHandler___block_invoke;
    v12[3] = &unk_1E5B27618;
    v12[4] = self;
    v8 = v5;
    v13 = v8;
    objc_msgSend(v6, "storeKitServiceWithErrorHandler:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __129__SKInternalProductStorePromotionController_fetchOverridesForVisibilityAndOrderForApplicationBundleIdentifier_completionHandler___block_invoke_7;
    v10[3] = &unk_1E5B27640;
    v10[4] = self;
    v11 = v8;
    objc_msgSend(v9, "promotionInfoForProductIdentifiers:client:reply:", 0, 0, v10);

  }
}

void __129__SKInternalProductStorePromotionController_fetchOverridesForVisibilityAndOrderForApplicationBundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __129__SKInternalProductStorePromotionController_fetchOverridesForVisibilityAndOrderForApplicationBundleIdentifier_completionHandler___block_invoke_cold_1(a1, (uint64_t)v3, v4, v5, v6, v7, v8, v9);
  objc_msgSend(*(id *)(a1 + 32), "_handleReply:error:completionHandler:", MEMORY[0x1E0C9AA60], v3, *(_QWORD *)(a1 + 40));

}

uint64_t __129__SKInternalProductStorePromotionController_fetchOverridesForVisibilityAndOrderForApplicationBundleIdentifier_completionHandler___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleReply:error:completionHandler:", a2, a3, *(_QWORD *)(a1 + 40));
}

- (void)_handleReply:(uint64_t)a1 error:(void *)a2 completionHandler:.cold.1(uint64_t a1, void *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138543618;
  v3 = a1;
  v4 = 2050;
  v5 = objc_msgSend(a2, "count");
  _os_log_debug_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%{public}@]: Successfully retrieved promotion info, found %{public}lu entries", (uint8_t *)&v2, 0x16u);
}

- (void)_handleReply:(uint64_t)a3 error:(uint64_t)a4 completionHandler:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], a3, "[%{public}@]: Failed to retrieve promotion info: %{public}@", a5, a6, a7, a8, 2u);
}

void __129__SKInternalProductStorePromotionController_fetchOverridesForVisibilityAndOrderForApplicationBundleIdentifier_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], a3, "[%{public}@]: Failed in XPC to retrieve promotion info: %{public}@", a5, a6, a7, a8, 2u);
}

@end
