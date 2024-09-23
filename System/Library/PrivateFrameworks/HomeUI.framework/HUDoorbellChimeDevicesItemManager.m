@implementation HUDoorbellChimeDevicesItemManager

- (id)_buildItemProvidersForHome:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D31510]);
  -[HFItemManager home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithHome:", v6);

  objc_msgSend(v7, "setFilter:", &__block_literal_global_192);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31928]), "initWithSourceProvider:transformationBlock:", v7, &__block_literal_global_252_0);
  v9 = objc_alloc(MEMORY[0x1E0D310B0]);
  -[HFItemManager home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithHome:", v10);

  objc_msgSend(v11, "setFilter:", &__block_literal_global_258);
  v12 = objc_alloc(MEMORY[0x1E0D31928]);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__HUDoorbellChimeDevicesItemManager__buildItemProvidersForHome___block_invoke_5;
  v15[3] = &unk_1E6F4FB28;
  v15[4] = self;
  v13 = (void *)objc_msgSend(v12, "initWithSourceProvider:transformationBlock:", v11, v15);
  objc_msgSend(v4, "addObject:", v8);
  objc_msgSend(v4, "addObject:", v13);

  return v4;
}

uint64_t __64__HUDoorbellChimeDevicesItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EF347468))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  if (!v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_13;
    }
    v6 = objc_msgSend(v2, "hf_isHomePod");
LABEL_12:
    v5 = v6;
    goto LABEL_13;
  }
  if ((objc_msgSend(MEMORY[0x1E0D31530], "isHomePodMediaSystem:", v4) & 1) == 0
    && (objc_msgSend(MEMORY[0x1E0D31530], "isHomePod:", v4) & 1) == 0)
  {
    v6 = objc_msgSend(MEMORY[0x1E0D31530], "isSiriEndpoint:", v4);
    goto LABEL_12;
  }
  v5 = 1;
LABEL_13:

  return v5;
}

id __64__HUDoorbellChimeDevicesItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v3 = objc_alloc(MEMORY[0x1E0D31920]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__HUDoorbellChimeDevicesItemManager__buildItemProvidersForHome___block_invoke_3;
  v7[3] = &unk_1E6F59560;
  v8 = v2;
  v4 = v2;
  v5 = (void *)objc_msgSend(v3, "initWithSourceItem:transformationBlock:", v4, v7);

  return v5;
}

id __64__HUDoorbellChimeDevicesItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  v7 = (void *)MEMORY[0x1E0D31530];
  objc_msgSend(*(id *)(a1 + 32), "mediaProfileContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "supportsDoorbellChime:", v8);

  if ((_DWORD)v7)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "isDoorbellChimeEnabled");
    objc_msgSend(v9, "numberWithInteger:", HFPrimaryStateFromBOOL());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D30E20]);

  }
  else
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  }
  return v6;
}

void *__64__HUDoorbellChimeDevicesItemManager__buildItemProvidersForHome___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (!v5)
    goto LABEL_8;
  objc_msgSend(v5, "hf_siriEndpointProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "hf_primaryService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v6 = (void *)objc_msgSend(v5, "supportsDoorbellChime");
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

id __64__HUDoorbellChimeDevicesItemManager__buildItemProvidersForHome___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D31920]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__HUDoorbellChimeDevicesItemManager__buildItemProvidersForHome___block_invoke_6;
  v9[3] = &unk_1E6F554C8;
  v5 = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = v5;
  v6 = v3;
  v7 = (void *)objc_msgSend(v4, "initWithSourceItem:transformationBlock:", v6, v9);

  return v7;
}

id __64__HUDoorbellChimeDevicesItemManager__buildItemProvidersForHome___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  v7 = *(id *)(a1 + 32);
  v8 = &unk_1EF2AC1D8;
  if (objc_msgSend(v7, "conformsToProtocol:", v8))
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  if (objc_msgSend(v10, "isSiriEndpointAccessory"))
  {
    objc_msgSend(v10, "commonSettingsManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v10, "commonSettingsManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:", *(_QWORD *)(a1 + 40));

    }
  }
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v10, "isDoorbellChimeEnabled");
  objc_msgSend(v13, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D30E20]);

  return v6;
}

- (id)enableDoorbellChime:(BOOL)a3 forItem:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  BOOL v14;

  objc_msgSend(a4, "sourceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = &unk_1EF2AC1D8;
  if (objc_msgSend(v5, "conformsToProtocol:", v6))
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0D519C0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __65__HUDoorbellChimeDevicesItemManager_enableDoorbellChime_forItem___block_invoke;
    v12[3] = &unk_1E6F51990;
    v13 = v8;
    v14 = a3;
    objc_msgSend(v9, "futureWithBlock:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

void __65__HUDoorbellChimeDevicesItemManager_enableDoorbellChime_forItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "enableDoorbellChime:", *(unsigned __int8 *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__HUDoorbellChimeDevicesItemManager_enableDoorbellChime_forItem___block_invoke_2;
  v7[3] = &unk_1E6F4C610;
  v8 = v3;
  v5 = v3;
  v6 = (id)objc_msgSend(v4, "addCompletionBlock:", v7);

}

void __65__HUDoorbellChimeDevicesItemManager_enableDoorbellChime_forItem___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "Failed to enable/disable doorbell chime setting : %@", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v4);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");

}

- (void)mediaProfileContainer:(id)a3 didUpdateSettingKeypath:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "Received update for setting keypath %@ value = %@", (uint8_t *)&v12, 0x16u);
  }

  v11 = -[HFItemManager reloadAndUpdateAllItemsFromSenderSelector:](self, "reloadAndUpdateAllItemsFromSenderSelector:", a2);
}

@end
