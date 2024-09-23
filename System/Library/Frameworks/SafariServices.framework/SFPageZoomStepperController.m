@implementation SFPageZoomStepperController

- (SFPageZoomStepperController)initWithDocument:(id)a3 preferenceManager:(id)a4
{
  id v6;
  id v7;
  SFPageZoomStepperController *v8;
  SFPageZoomStepperController *v9;
  NSNumberFormatter *v10;
  NSNumberFormatter *percentFormatter;
  void *v12;
  SFPageZoomStepperController *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFPageZoomStepperController;
  v8 = -[SFPageZoomStepperController init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_tab, v6);
    objc_storeStrong((id *)&v9->_preferenceManager, a4);
    v10 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    percentFormatter = v9->_percentFormatter;
    v9->_percentFormatter = v10;

    -[NSNumberFormatter setNumberStyle:](v9->_percentFormatter, "setNumberStyle:", 3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel__pageZoomChanged_, *MEMORY[0x1E0D8B1C8], v7);

    v13 = v9;
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SFPageZoomStepperController;
  -[SFPageZoomStepperController dealloc](&v4, sel_dealloc);
}

- (void)prepareStepper:(id)a3
{
  _SFSettingsAlertStepperConfiguration **p_stepper;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  WBSPageZoomPreferenceManager *preferenceManager;
  id WeakRetained;
  void *v11;
  _QWORD v12[5];

  p_stepper = &self->_stepper;
  v5 = a3;
  objc_storeWeak((id *)p_stepper, v5);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("textformat.size.smaller"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:forButton:", v6, 1);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("textformat.size.larger"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:forButton:", v7, 0);

  -[NSNumberFormatter stringFromNumber:](self->_percentFormatter, "stringFromNumber:", &unk_1E4B255A0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:forButton:", v8, 2);

  preferenceManager = self->_preferenceManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tab);
  objc_msgSend(WeakRetained, "URLForPerSitePreferences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __46__SFPageZoomStepperController_prepareStepper___block_invoke;
  v12[3] = &unk_1E4ABFB48;
  v12[4] = self;
  -[WBSPageZoomPreferenceManager getPageZoomFactorForURL:usingBlock:](preferenceManager, "getPageZoomFactorForURL:usingBlock:", v11, v12);

}

uint64_t __46__SFPageZoomStepperController_prepareStepper___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateButtonsEnabledWithZoomFactor:");
}

- (void)incrementValue:(id)a3
{
  WBSPageZoomPreferenceManager *preferenceManager;
  id WeakRetained;
  void *v6;
  _QWORD v7[5];

  preferenceManager = self->_preferenceManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tab);
  objc_msgSend(WeakRetained, "URLForPerSitePreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__SFPageZoomStepperController_incrementValue___block_invoke;
  v7[3] = &unk_1E4ABFB70;
  v7[4] = self;
  -[WBSPageZoomPreferenceManager zoomInOnURL:completionHandler:](preferenceManager, "zoomInOnURL:completionHandler:", v6, v7);

}

void __46__SFPageZoomStepperController_incrementValue___block_invoke(uint64_t a1, int a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_updateButtonsEnabledWithZoomFactor:");
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "didModifyPerSitePreferencesWithPreferenceIdentifier:modificationLevel:type:method:", *MEMORY[0x1E0D8B790], 1, 0, 0);

  }
}

- (void)decrementValue:(id)a3
{
  WBSPageZoomPreferenceManager *preferenceManager;
  id WeakRetained;
  void *v6;
  _QWORD v7[5];

  preferenceManager = self->_preferenceManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tab);
  objc_msgSend(WeakRetained, "URLForPerSitePreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__SFPageZoomStepperController_decrementValue___block_invoke;
  v7[3] = &unk_1E4ABFB70;
  v7[4] = self;
  -[WBSPageZoomPreferenceManager zoomOutOnURL:completionHandler:](preferenceManager, "zoomOutOnURL:completionHandler:", v6, v7);

}

void __46__SFPageZoomStepperController_decrementValue___block_invoke(uint64_t a1, int a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_updateButtonsEnabledWithZoomFactor:");
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "didModifyPerSitePreferencesWithPreferenceIdentifier:modificationLevel:type:method:", *MEMORY[0x1E0D8B790], 1, 0, 0);

  }
}

- (void)resetValue:(id)a3
{
  WBSPageZoomPreferenceManager *preferenceManager;
  id WeakRetained;
  void *v6;
  _QWORD v7[5];

  preferenceManager = self->_preferenceManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tab);
  objc_msgSend(WeakRetained, "URLForPerSitePreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__SFPageZoomStepperController_resetValue___block_invoke;
  v7[3] = &unk_1E4ABFB70;
  v7[4] = self;
  -[WBSPageZoomPreferenceManager resetZoomLevelOnURL:completionHandler:](preferenceManager, "resetZoomLevelOnURL:completionHandler:", v6, v7);

}

void __42__SFPageZoomStepperController_resetValue___block_invoke(uint64_t a1, char a2, double a3)
{
  _QWORD block[6];
  char v4;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SFPageZoomStepperController_resetValue___block_invoke_2;
  block[3] = &unk_1E4ABFB98;
  block[4] = *(_QWORD *)(a1 + 32);
  *(double *)&block[5] = a3;
  v4 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __42__SFPageZoomStepperController_resetValue___block_invoke_2(uint64_t a1)
{
  double v2;
  id WeakRetained;
  void *v4;
  id v5;

  v2 = *(double *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setViewScale:", v2);

  objc_msgSend(*(id *)(a1 + 32), "_updateButtonsEnabledOnMainQueueWithZoomFactor:", *(double *)(a1 + 40));
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didModifyPerSitePreferencesWithPreferenceIdentifier:modificationLevel:type:method:", *MEMORY[0x1E0D8B790], 1, 1, 0);

  }
}

- (id)longestTextForButton:(int64_t)a3
{
  NSNumberFormatter *percentFormatter;
  void *v4;
  void *v5;
  void *v6;

  if (a3 == 2)
  {
    percentFormatter = self->_percentFormatter;
    objc_msgSend(MEMORY[0x1E0D8AA68], "pageZoomFactors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter stringFromNumber:](percentFormatter, "stringFromNumber:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_updateButtonsEnabledWithZoomFactor:(double)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__SFPageZoomStepperController__updateButtonsEnabledWithZoomFactor___block_invoke;
  v3[3] = &unk_1E4ABFBC0;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

uint64_t __67__SFPageZoomStepperController__updateButtonsEnabledWithZoomFactor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateButtonsEnabledOnMainQueueWithZoomFactor:", *(double *)(a1 + 40));
}

- (void)_updateButtonsEnabledOnMainQueueWithZoomFactor:(double)a3
{
  id WeakRetained;
  NSNumberFormatter *percentFormatter;
  void *v7;
  void *v8;
  WBSPageZoomPreferenceManager *preferenceManager;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  SFPageZoomStepperController *v16;
  id v17;

  WeakRetained = objc_loadWeakRetained((id *)&self->_stepper);
  percentFormatter = self->_percentFormatter;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter stringFromNumber:](percentFormatter, "stringFromNumber:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  preferenceManager = self->_preferenceManager;
  v10 = objc_loadWeakRetained((id *)&self->_tab);
  objc_msgSend(v10, "URLForPerSitePreferences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__SFPageZoomStepperController__updateButtonsEnabledOnMainQueueWithZoomFactor___block_invoke;
  v14[3] = &unk_1E4ABFC10;
  v15 = WeakRetained;
  v16 = self;
  v17 = v8;
  v12 = v8;
  v13 = WeakRetained;
  -[WBSPageZoomPreferenceManager getAvailableActionsForURL:usingBlock:](preferenceManager, "getAvailableActionsForURL:usingBlock:", v11, v14);

  objc_msgSend(v13, "setText:forButton:", v12, 2);
}

void __78__SFPageZoomStepperController__updateButtonsEnabledOnMainQueueWithZoomFactor___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__SFPageZoomStepperController__updateButtonsEnabledOnMainQueueWithZoomFactor___block_invoke_2;
  v7[3] = &unk_1E4ABFBE8;
  v4 = *(id *)(a1 + 32);
  v11 = a2;
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v8 = v4;
  v9 = v5;
  v10 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __78__SFPageZoomStepperController__updateButtonsEnabledOnMainQueueWithZoomFactor___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setEnabled:forButton:", *(_DWORD *)(a1 + 56) & 1, 0);
  objc_msgSend(*(id *)(a1 + 32), "setEnabled:forButton:", (*(_QWORD *)(a1 + 56) >> 1) & 1, 1);
  objc_msgSend(*(id *)(a1 + 32), "setEnabled:forButton:", (*(_QWORD *)(a1 + 56) >> 2) & 1, 2);
  result = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, BOOL))(result + 16))(result, *(_QWORD *)(a1 + 48), (*(_QWORD *)(a1 + 56) & 4) == 0);
  return result;
}

- (void)_pageZoomChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  SFPageZoomStepperController *v10;
  id v11;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D8B010]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__SFPageZoomStepperController__pageZoomChanged___block_invoke;
  block[3] = &unk_1E4ABFC38;
  v9 = v5;
  v10 = self;
  v11 = v4;
  v6 = v4;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __48__SFPageZoomStepperController__pageZoomChanged___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
  objc_msgSend(WeakRetained, "URLForPerSitePreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_userVisibleHostWithoutWWWSubdomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqualToString:", v5);

  if ((_DWORD)v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0D8B1C0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    objc_msgSend(*(id *)(a1 + 40), "_updateButtonsEnabledOnMainQueueWithZoomFactor:", v8);
  }
}

- (id)didSetValueHandler
{
  return self->_didSetValueHandler;
}

- (void)setDidSetValueHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didSetValueHandler, 0);
  objc_destroyWeak((id *)&self->_stepper);
  objc_storeStrong((id *)&self->_percentFormatter, 0);
  objc_destroyWeak((id *)&self->_tab);
  objc_storeStrong((id *)&self->_preferenceManager, 0);
}

@end
