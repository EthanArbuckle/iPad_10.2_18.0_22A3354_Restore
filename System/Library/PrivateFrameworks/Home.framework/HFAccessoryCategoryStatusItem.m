@implementation HFAccessoryCategoryStatusItem

BOOL __61__HFAccessoryCategoryStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  HFMatterAccessoryRepresentable *v7;
  void *v8;
  void *v9;
  char v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  _QWORD v15[5];

  v3 = a2;
  if (objc_msgSend(v3, "hf_isNonServiceBasedAccessory"))
  {
    if (objc_msgSend(v3, "hf_isVisibleInHomeStatus"))
    {
      objc_msgSend(*(id *)(a1 + 32), "accessoryTypeGroup");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "hf_accessoryType");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v4, "containsType:", v5);

      if ((v6 & 1) != 0)
        goto LABEL_7;
    }
  }
  if (!objc_msgSend(v3, "hf_isMatterOnlyAccessory"))
    goto LABEL_9;
  v7 = -[HFMatterAccessoryRepresentable initWithAccessory:]([HFMatterAccessoryRepresentable alloc], "initWithAccessory:", v3);
  if (!-[HFMatterAccessoryRepresentable hf_isVisibleInHomeStatus](v7, "hf_isVisibleInHomeStatus"))
  {

    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "accessoryTypeGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMatterAccessoryRepresentable hf_accessoryType](v7, "hf_accessoryType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "containsType:", v9);

  if ((v10 & 1) == 0)
  {
LABEL_9:
    objc_msgSend(v3, "hf_visibleServices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __61__HFAccessoryCategoryStatusItem__subclass_updateWithOptions___block_invoke_2;
    v15[3] = &unk_1EA7283A0;
    v15[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v12, "na_firstObjectPassingTest:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13 != 0;

    goto LABEL_10;
  }
LABEL_7:
  v11 = 1;
LABEL_10:

  return v11;
}

- (NSString)uuidString
{
  return self->_uuidString;
}

uint64_t __61__HFAccessoryCategoryStatusItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(v3, "hf_isVisibleInHomeStatus"))
  {
    objc_msgSend(*(id *)(a1 + 32), "accessoryTypeGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hf_accessoryType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsType:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __61__HFAccessoryCategoryStatusItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateWithOptions:", *(_QWORD *)(a1 + 32));
}

uint64_t __52__HFAccessoryCategoryStatusItem__statusItemOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

void __61__HFAccessoryCategoryStatusItem__subclass_updateWithOptions___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[8];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  const __CFString *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__2;
    v37 = __Block_byref_object_dispose__2;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v38 = (id)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__2;
    v31 = __Block_byref_object_dispose__2;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__2;
    v25 = __Block_byref_object_dispose__2;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    objc_msgSend(WeakRetained, "statusItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __61__HFAccessoryCategoryStatusItem__subclass_updateWithOptions___block_invoke_29;
    v16[3] = &unk_1EA728918;
    v16[4] = &v17;
    v16[5] = &v21;
    v16[6] = &v33;
    v16[7] = &v27;
    objc_msgSend(v8, "na_each:", v16);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v28[5], CFSTR("dependentHomeKitObjects"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v34[5], CFSTR("dependentServiceTypes"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v22[5], CFSTR("representedHomeKitObjects"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18[3]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("state"));

    v11 = *(void **)(a1 + 32);
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "finishWithResult:", v12);

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v33, 8);

  }
  else
  {
    v13 = *(void **)(a1 + 32);
    v39 = CFSTR("hidden");
    v40[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "finishWithResult:", v15);

  }
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  _QWORD v39[4];
  id v40;
  id v41;
  id location;
  _QWORD v43[4];
  id v44;
  _QWORD v45[5];
  _QWORD v46[3];
  _QWORD v47[4];

  v47[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HFStatusItem room](self, "room");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[HFStatusItem home](self, "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessories");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (+[HFUtilities isPressDemoModeEnabled](HFUtilities, "isPressDemoModeEnabled"))
  {
    -[HFStatusItem room](self, "room");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hf_demoModeAccessories");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11)
    {
      -[HFStatusItem home](self, "home");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "hf_demoModeAccessories");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    if (!v11)
    {

    }
    v9 = (id)v13;
  }
  v14 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __61__HFAccessoryCategoryStatusItem__subclass_updateWithOptions___block_invoke;
  v45[3] = &unk_1EA727840;
  v45[4] = self;
  objc_msgSend(v9, "na_firstObjectPassingTest:", v45);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 || !-[HFAccessoryCategoryStatusItem hidesWithNoAccessories](self, "hidesWithNoAccessories"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", HFItemUpdateOptionFastInitialUpdate);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "BOOLValue");

    v27 = (void *)MEMORY[0x1E0D519C0];
    if (v26)
    {
      +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", MEMORY[0x1E0C9AA70]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "futureWithResult:", v28);
      v24 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v29 = objc_alloc_init(MEMORY[0x1E0D519C0]);
      -[HFAccessoryCategoryStatusItem statusItems](self, "statusItems");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v14;
      v43[1] = 3221225472;
      v43[2] = __61__HFAccessoryCategoryStatusItem__subclass_updateWithOptions___block_invoke_4;
      v43[3] = &unk_1EA7288F0;
      v44 = v5;
      objc_msgSend(v30, "na_map:", v43);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "combineAllFutures:ignoringErrors:scheduler:", v31, 1, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak(&location, self);
      v39[0] = v14;
      v39[1] = 3221225472;
      v39[2] = __61__HFAccessoryCategoryStatusItem__subclass_updateWithOptions___block_invoke_5;
      v39[3] = &unk_1EA728940;
      objc_copyWeak(&v41, &location);
      v35 = v29;
      v40 = v35;
      v36 = (id)objc_msgSend(v34, "addCompletionBlock:", v39);
      v37 = v40;
      v24 = v35;

      objc_destroyWeak(&v41);
      objc_destroyWeak(&location);

    }
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend((id)objc_opt_class(), "statusItemClasses");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "na_flatMap:", &__block_literal_global_16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0D519C0];
    v46[0] = CFSTR("hidden");
    v46[1] = CFSTR("dependentServiceTypes");
    v47[0] = MEMORY[0x1E0C9AAB0];
    v47[1] = v19;
    v46[2] = CFSTR("dependentHomeKitClasses");
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "futureWithResult:", v23);
    v24 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v24;
}

- (id)_statusItemOfClass:(Class)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HFAccessoryCategoryStatusItem statusItems](self, "statusItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HFAccessoryCategoryStatusItem__statusItemOfClass___block_invoke;
  v7[3] = &__block_descriptor_40_e22_B16__0__HFStatusItem_8lu32l8;
  v7[4] = a3;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)statusItems
{
  return self->_statusItems;
}

- (BOOL)hidesWithNoAccessories
{
  return 1;
}

- (HFAccessoryCategoryStatusItem)initWithHome:(id)a3 room:(id)a4 valueSource:(id)a5
{
  id v8;
  id v9;
  id v10;
  HFAccessoryCategoryStatusItem *v11;
  void *v12;
  uint64_t v13;
  NSArray *statusItems;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *uuidString;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)HFAccessoryCategoryStatusItem;
  v11 = -[HFStatusItem initWithHome:room:valueSource:](&v24, sel_initWithHome_room_valueSource_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend((id)objc_opt_class(), "statusItemClasses");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __63__HFAccessoryCategoryStatusItem_initWithHome_room_valueSource___block_invoke;
    v20[3] = &unk_1EA728818;
    v21 = v8;
    v22 = v9;
    v23 = v10;
    objc_msgSend(v12, "na_map:", v20);
    v13 = objc_claimAutoreleasedReturnValue();
    statusItems = v11->_statusItems;
    v11->_statusItems = (NSArray *)v13;

    -[HFAccessoryCategoryStatusItem accessoryTypeGroup](v11, "accessoryTypeGroup");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = objc_claimAutoreleasedReturnValue();
    uuidString = v11->_uuidString;
    v11->_uuidString = (NSString *)v17;

  }
  return v11;
}

id __63__HFAccessoryCategoryStatusItem_initWithHome_room_valueSource___block_invoke(_QWORD *a1, Class a2)
{
  return (id)objc_msgSend([a2 alloc], "initWithHome:room:valueSource:", a1[4], a1[5], a1[6]);
}

uint64_t __61__HFAccessoryCategoryStatusItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1F03F1CA8))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return objc_msgSend(v4, "serviceTypes");
}

- (void)applyInflectionToDescriptions:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("description"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3498];
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("description"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_attributedStringWithInflectableAccessoryStatus:accessoryName:forcePluralAgreement:", v6, v3, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v8, CFSTR("description"));

  }
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("controlDescription"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3498];
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("controlDescription"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hf_attributedStringWithInflectableAccessoryStatus:accessoryName:forcePluralAgreement:", v11, v3, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v13, CFSTR("controlDescription"));

  }
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("detailedControlDescription"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0CB3498];
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("detailedControlDescription"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hf_attributedStringWithInflectableAccessoryStatus:accessoryName:forcePluralAgreement:", v16, v3, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "string");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("detailedControlDescription"));

  }
}

- (id)accessoryTypeGroupFilter
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;

  -[HFAccessoryCategoryStatusItem accessoryTypeGroup](self, "accessoryTypeGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__HFAccessoryCategoryStatusItem_accessoryTypeGroupFilter__block_invoke;
  aBlock[3] = &unk_1EA728840;
  v8 = v2;
  v3 = v2;
  v4 = _Block_copy(aBlock);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

uint64_t __57__HFAccessoryCategoryStatusItem_accessoryTypeGroupFilter__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    objc_msgSend(v3, "actions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v45;
      v34 = v4;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v45 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v10, "characteristic");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "service");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            v13 = *(void **)(a1 + 32);
            objc_msgSend(v12, "hf_accessoryType");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v13) = objc_msgSend(v13, "containsType:", v14);

            if ((v13 & 1) != 0)
            {
              v28 = 1;
              v4 = v34;
              goto LABEL_33;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = v10;
              v40 = 0u;
              v41 = 0u;
              v42 = 0u;
              v43 = 0u;
              objc_msgSend(v15, "mediaProfiles");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
              if (v33)
              {
                v17 = *(_QWORD *)v41;
                v35 = v5;
                v30 = v7;
                v31 = v8;
                v32 = v15;
                v29 = *(_QWORD *)v41;
                do
                {
                  v18 = 0;
                  do
                  {
                    if (*(_QWORD *)v41 != v17)
                      objc_enumerationMutation(v16);
                    v19 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v18);
                    v36 = 0u;
                    v37 = 0u;
                    v38 = 0u;
                    v39 = 0u;
                    objc_msgSend(v19, "accessories");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
                    if (v21)
                    {
                      v22 = v21;
                      v23 = *(_QWORD *)v37;
                      while (2)
                      {
                        for (j = 0; j != v22; ++j)
                        {
                          if (*(_QWORD *)v37 != v23)
                            objc_enumerationMutation(v20);
                          v25 = *(void **)(a1 + 32);
                          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "hf_accessoryType");
                          v26 = (void *)objc_claimAutoreleasedReturnValue();
                          LOBYTE(v25) = objc_msgSend(v25, "containsType:", v26);

                          if ((v25 & 1) != 0)
                          {

                            v28 = 1;
                            v4 = v34;
                            v5 = v35;
                            goto LABEL_33;
                          }
                        }
                        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
                        if (v22)
                          continue;
                        break;
                      }
                    }

                    ++v18;
                    v5 = v35;
                    v7 = v30;
                    v8 = v31;
                    v17 = v29;
                  }
                  while (v18 != v33);
                  v15 = v32;
                  v33 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
                }
                while (v33);
              }

            }
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
        v28 = 0;
        v4 = v34;
      }
      while (v7);
    }
    else
    {
      v28 = 0;
    }
LABEL_33:

  }
  else
  {
    v28 = 1;
  }

  return v28;
}

- (id)sortedActionSetItemsWithProvider:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  -[HFStatusItem room](self, "room");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRoom:", v6);

  -[HFAccessoryCategoryStatusItem accessoryTypeGroupFilter](self, "accessoryTypeGroupFilter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFilter:", v7);

  objc_initWeak(&location, self);
  objc_msgSend(v4, "reloadItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__HFAccessoryCategoryStatusItem_sortedActionSetItemsWithProvider___block_invoke;
  v12[3] = &unk_1EA728868;
  objc_copyWeak(&v14, &location);
  v9 = v5;
  v13 = v9;
  v10 = (id)objc_msgSend(v8, "addCompletionBlock:", v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

void __66__HFAccessoryCategoryStatusItem_sortedActionSetItemsWithProvider___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  HFReorderableHomeKitItemList *v6;
  void *v7;
  HFReorderableHomeKitItemList *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v14, "allItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = [HFReorderableHomeKitItemList alloc];
    objc_msgSend(WeakRetained, "room");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = -[HFReorderableHomeKitItemList initWithApplicationDataContainer:category:](v6, "initWithApplicationDataContainer:category:", v7, CFSTR("categoryActionSets"));
    }
    else
    {
      objc_msgSend(WeakRetained, "home");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[HFReorderableHomeKitItemList initWithApplicationDataContainer:category:](v6, "initWithApplicationDataContainer:category:", v10, CFSTR("categoryActionSets"));

    }
    objc_msgSend(v14, "allItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFReorderableHomeKitItemList sortedHomeKitItemComparator](v8, "sortedHomeKitItemComparator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sortedArrayUsingComparator:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v9);

}

- (HFAccessoryTypeGroup)accessoryTypeGroup
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessoryCategoryStatusItem.m"), 100, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFAccessoryCategoryStatusItem accessoryTypeGroup]", objc_opt_class());

  return 0;
}

+ (id)statusItemClasses
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFAccessoryCategoryStatusItem.m"), 106, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "+[HFAccessoryCategoryStatusItem statusItemClasses]", objc_opt_class());

  return 0;
}

void __61__HFAccessoryCategoryStatusItem__subclass_updateWithOptions___block_invoke_29(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
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
  void *v19;
  void *v20;
  id v21;

  v21 = a2;
  objc_msgSend(v21, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("state"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  v6 = v21;
  v7 = *(_QWORD *)(a1[4] + 8);
  v8 = *(_QWORD *)(v7 + 24);
  if (v8 <= v5)
    v8 = v5;
  *(_QWORD *)(v7 + 24) = v8;
  if (v5 == 2)
  {
    v9 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
    objc_msgSend(v21, "latestResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("representedHomeKitObjects"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v9, "unionSet:", v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "unionSet:", v12);

    }
    v6 = v21;
  }
  v13 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  objc_msgSend(v6, "latestResults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("dependentServiceTypes"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v13, "unionSet:", v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unionSet:", v16);

  }
  v17 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
  objc_msgSend(v21, "latestResults");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("dependentHomeKitObjects"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v17, "unionSet:", v19);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "unionSet:", v20);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusItems, 0);
  objc_storeStrong((id *)&self->_uuidString, 0);
}

@end
