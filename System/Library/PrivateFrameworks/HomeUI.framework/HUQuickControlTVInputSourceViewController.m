@implementation HUQuickControlTVInputSourceViewController

+ (id)controlItemPredicate
{
  return +[HUQuickControlSingleItemPredicate predicateWithControlItemClass:](HUQuickControlSingleItemPredicate, "predicateWithControlItemClass:", objc_opt_class());
}

+ (Class)controlItemClass
{
  return (Class)objc_opt_class();
}

- (id)createInteractionCoordinator
{
  HUQuickControlWheelPickerView *v3;
  void *v4;
  HUQuickControlWheelPickerView *v5;
  HUQuickControlSimpleInteractionCoordinator *v6;

  v3 = [HUQuickControlWheelPickerView alloc];
  -[HUQuickControlSingleControlViewController viewProfile](self, "viewProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HUQuickControlWheelPickerView initWithProfile:](v3, "initWithProfile:", v4);

  v6 = -[HUQuickControlSimpleInteractionCoordinator initWithControlView:delegate:]([HUQuickControlSimpleInteractionCoordinator alloc], "initWithControlView:delegate:", v5, self);
  return v6;
}

- (id)createViewProfile
{
  HUQuickControlWheelPickerViewProfile *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v3 = objc_alloc_init(HUQuickControlWheelPickerViewProfile);
  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allCharacteristicsForCharacteristicType:", *MEMORY[0x1E0CB8790]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_firstObjectPassingTest:", &__block_literal_global_107);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cachedValueForCharacteristic:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "latestResults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D30558]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v16 = objc_msgSend(v15, "na_all:", &__block_literal_global_6);
  else
    v16 = 1;
  -[HUQuickControlWheelPickerViewProfile setShowOffState:](v3, "setShowOffState:", v16);

  return v3;
}

uint64_t __62__HUQuickControlTVInputSourceViewController_createViewProfile__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB9AF0]);

  return v4;
}

uint64_t __62__HUQuickControlTVInputSourceViewController_createViewProfile__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = objc_msgSend(v5, "isHidden");
  return v6;
}

- (id)controlToViewValueTransformer
{
  void *v3;
  uint64_t v4;
  _QWORD v6[5];
  _QWORD v7[5];

  v3 = (void *)MEMORY[0x1E0D319D8];
  v4 = objc_opt_class();
  v6[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__HUQuickControlTVInputSourceViewController_controlToViewValueTransformer__block_invoke;
  v7[3] = &unk_1E6F54160;
  v7[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__HUQuickControlTVInputSourceViewController_controlToViewValueTransformer__block_invoke_2;
  v6[3] = &unk_1E6F54188;
  objc_msgSend(v3, "transformerForValueClass:transformBlock:reverseTransformBlock:", v4, v7, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __74__HUQuickControlTVInputSourceViewController_controlToViewValueTransformer__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  if (a2)
    v2 = a2;
  else
    v2 = (void *)MEMORY[0x1E0C9AA60];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_filterInputValues:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_toPickerViewItems:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __74__HUQuickControlTVInputSourceViewController_controlToViewValueTransformer__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldWriteInputValue:", v3))
  {
    objc_msgSend(*(id *)(a1 + 32), "controlItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "writeValue:", v3);

  }
  return v3;
}

- (BOOL)_shouldWriteInputValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;

  v4 = a3;
  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30558]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "na_firstObjectPassingTest:", &__block_literal_global_13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToNumber:", v10) ^ 1;

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

uint64_t __68__HUQuickControlTVInputSourceViewController__shouldWriteInputValue___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSelected");
}

- (id)_filterInputValues:(id)a3
{
  return (id)objc_msgSend(a3, "na_filter:", &__block_literal_global_15_0);
}

BOOL __64__HUQuickControlTVInputSourceViewController__filterInputValues___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  _BOOL8 v6;
  void *v7;
  void *v8;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5 && (objc_msgSend(v5, "isHidden") & 1) == 0)
  {
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v5, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v8 != 0;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_toPickerViewItems:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  HUQuickControlWheelPickerViewItem *v11;
  HUQuickControlWheelPickerViewItem *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [HUQuickControlWheelPickerViewItem alloc];
        v12 = -[HUQuickControlWheelPickerViewItem initWithHFTVInputControlItemValue:](v11, "initWithHFTVInputControlItemValue:", v10, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

@end
