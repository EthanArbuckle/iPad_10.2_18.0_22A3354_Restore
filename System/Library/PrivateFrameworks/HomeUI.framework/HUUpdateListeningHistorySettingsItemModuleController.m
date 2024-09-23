@implementation HUUpdateListeningHistorySettingsItemModuleController

- (Class)cellClassForItem:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  objc_opt_isKindOfClass();

  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUUpdateListeningHistorySettingsItemModuleController;
  -[HUItemModuleController setupCell:forItem:](&v10, sel_setupCell_forItem_, v6, a4);
  objc_opt_class();
  v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
    objc_msgSend(v9, "setDelegate:", self);

}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  objc_super v37;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v37.receiver = self;
  v37.super_class = (Class)HUUpdateListeningHistorySettingsItemModuleController;
  -[HUItemModuleController updateCell:forItem:animated:](&v37, sel_updateCell_forItem_animated_, v8, v9, v5);
  objc_opt_class();
  v10 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    objc_opt_class();
    v13 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    objc_opt_class();
    objc_msgSend(v15, "sourceItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v18 = v17;

    v19 = v18;
    if (objc_msgSend(v19, "conformsToProtocol:", &unk_1EF2AC470))
      v20 = v19;
    else
      v20 = 0;
    v21 = v20;

    objc_opt_class();
    -[HUItemModuleController module](self, "module");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;
    v24 = v23;

    objc_msgSend(v24, "user");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "home");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "userListeningHistoryUpdateControlForHome:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "accessories");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __84__HUUpdateListeningHistorySettingsItemModuleController_updateCell_forItem_animated___block_invoke;
    v35[3] = &unk_1E6F4E5D8;
    v29 = v27;
    v36 = v29;
    v30 = objc_msgSend(v28, "na_all:", v35);

    objc_msgSend(v15, "sourceItem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "conformsToProtocol:", &unk_1EF2AC1D8))
      v32 = v31;
    else
      v32 = 0;
    v33 = v32;

    if (v33)
    {
      objc_msgSend(v12, "setOn:", v30);
      objc_msgSend(v12, "setIconDisplayStyle:", 1);
      +[HUIconCellContentMetrics compactMetrics](HUIconCellContentMetrics, "compactMetrics");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setContentMetrics:", v34);

    }
  }

}

uint64_t __84__HUUpdateListeningHistorySettingsItemModuleController_updateCell_forItem_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__HUUpdateListeningHistorySettingsItemModuleController_updateCell_forItem_animated___block_invoke_2;
  v8[3] = &unk_1E6F4E5D8;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __84__HUUpdateListeningHistorySettingsItemModuleController_updateCell_forItem_animated___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  return v8;
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  BOOL v24;
  uint8_t buf[4];
  _BOOL4 v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "item");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v26 = v4;
    v27 = 2112;
    v28 = v8;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "User tapped on switch to enable ULH? %{BOOL}d for item: %@", buf, 0x12u);

  }
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_opt_class();
  objc_msgSend(v6, "item");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  objc_opt_class();
  objc_msgSend(v14, "sourceItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = (unint64_t)v15;
  else
    v16 = 0;

  objc_opt_class();
  objc_msgSend(v14, "sourceItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = (unint64_t)v17;
  else
    v18 = 0;

  if (v16 | v18)
  {
    objc_msgSend(v6, "item");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUpdateListeningHistorySetting:forItem:", v4, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __77__HUUpdateListeningHistorySettingsItemModuleController_switchCell_didTurnOn___block_invoke;
    v22[3] = &unk_1E6F4D1D8;
    v23 = v6;
    v24 = v4;
    v21 = (id)objc_msgSend(v20, "addCompletionBlock:", v22);

  }
}

void __77__HUUpdateListeningHistorySettingsItemModuleController_switchCell_didTurnOn___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Failed to enable update listening history setting with error: %@", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setOn:animated:", *(_BYTE *)(a1 + 40) == 0, 1);
  }

}

@end
