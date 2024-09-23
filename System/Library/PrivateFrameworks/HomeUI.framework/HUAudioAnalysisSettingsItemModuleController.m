@implementation HUAudioAnalysisSettingsItemModuleController

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
  id v10;
  void *v11;
  id v12;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUAudioAnalysisSettingsItemModuleController;
  -[HUItemModuleController setupCell:forItem:](&v13, sel_setupCell_forItem_, v6, a4);
  objc_opt_class();
  v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
    objc_msgSend(v9, "setDelegate:", self);
  objc_opt_class();
  v10 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
    objc_msgSend(v12, "setDelegate:", self);

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
  void *v24;
  int v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  objc_super v38;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v38.receiver = self;
  v38.super_class = (Class)HUAudioAnalysisSettingsItemModuleController;
  -[HUItemModuleController updateCell:forItem:animated:](&v38, sel_updateCell_forItem_animated_, v8, v9, v5);
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

    objc_msgSend(v21, "accessories");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "anyObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "home");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "hf_currentUserIsAdministrator");

    objc_msgSend(v15, "sourceItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "conformsToProtocol:", &unk_1EF2AC1D8))
      v27 = v26;
    else
      v27 = 0;
    v28 = v27;

    if (v28)
    {
      objc_msgSend(v12, "setOn:", objc_msgSend(v28, "isAudioAnalysisEnabled"));
      objc_msgSend(v12, "setDisabled:", v25 ^ 1u);
      objc_msgSend(v12, "setIconDisplayStyle:", 1);
      +[HUIconCellContentMetrics compactMetrics](HUIconCellContentMetrics, "compactMetrics");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setContentMetrics:", v29);

    }
  }
  objc_opt_class();
  v30 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v31 = v30;
  else
    v31 = 0;
  v32 = v31;

  if (v32)
  {
    v33 = v9;
    objc_msgSend(v33, "home");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "audioAnalysisClassifierOptions");
    v36 = objc_msgSend(v33, "audioDetectionType") & v35;
    v37 = objc_msgSend(v33, "audioDetectionType");

    objc_msgSend(v32, "setOn:", v36 == v37);
  }

}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  BOOL v32;
  _QWORD v33[4];
  id v34;
  BOOL v35;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_opt_class();
    -[HUItemModuleController module](self, "module");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    objc_msgSend(v6, "item");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateAudioAnalysisDetectionSettings:forItem:", v4, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __68__HUAudioAnalysisSettingsItemModuleController_switchCell_didTurnOn___block_invoke;
    v33[3] = &unk_1E6F4D1D8;
    v34 = v6;
    v35 = v4;
    v14 = (id)objc_msgSend(v13, "addCompletionBlock:", v33);
    v15 = v34;
  }
  else
  {
    objc_opt_class();
    v16 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v13 = v17;

    objc_opt_class();
    -[HUItemModuleController module](self, "module");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v15 = v19;

    objc_opt_class();
    objc_msgSend(v13, "item");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
    v22 = v21;

    objc_opt_class();
    objc_msgSend(v22, "sourceItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = (unint64_t)v23;
    else
      v24 = 0;

    objc_opt_class();
    objc_msgSend(v22, "sourceItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = (unint64_t)v25;
    else
      v26 = 0;

    if (v24 | v26)
    {
      objc_msgSend(v13, "item");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "enableAudioAnalysisSetting:forItem:", v4, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __68__HUAudioAnalysisSettingsItemModuleController_switchCell_didTurnOn___block_invoke_2;
      v30[3] = &unk_1E6F4D1D8;
      v31 = v16;
      v32 = v4;
      v29 = (id)objc_msgSend(v28, "addCompletionBlock:", v30);

    }
  }

}

uint64_t __68__HUAudioAnalysisSettingsItemModuleController_switchCell_didTurnOn___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3)
    return objc_msgSend(*(id *)(result + 32), "setOn:animated:", *(_BYTE *)(result + 40) == 0, 1);
  return result;
}

uint64_t __68__HUAudioAnalysisSettingsItemModuleController_switchCell_didTurnOn___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3)
    return objc_msgSend(*(id *)(result + 32), "setOn:animated:", *(_BYTE *)(result + 40) == 0, 1);
  return result;
}

@end
