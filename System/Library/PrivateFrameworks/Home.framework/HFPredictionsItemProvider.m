@implementation HFPredictionsItemProvider

- (HFPredictionsItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_predictionsManager_itemLimit_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFPredictionsItemProvider.m"), 50, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFPredictionsItemProvider init]",
    v5);

  return 0;
}

- (HFPredictionsItemProvider)initWithHome:(id)a3 predictionsManager:(id)a4 itemLimit:(unint64_t)a5
{
  id v9;
  id v10;
  HFPredictionsItemProvider *v11;
  HFPredictionsItemProvider *v12;
  uint64_t v13;
  NSMutableSet *allItems;
  uint64_t v15;
  HFCharacteristicValueSource *valueSource;
  NSArray *lastPredictions;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HFPredictionsItemProvider;
  v11 = -[HFItemProvider init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_home, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    allItems = v12->_allItems;
    v12->_allItems = (NSMutableSet *)v13;

    objc_storeStrong((id *)&v12->_predictionsManager, a4);
    v12->_itemLimit = a5;
    objc_msgSend(v9, "hf_characteristicValueManager");
    v15 = objc_claimAutoreleasedReturnValue();
    valueSource = v12->_valueSource;
    v12->_valueSource = (HFCharacteristicValueSource *)v15;

    v12->_freezePredictions = 0;
    v12->_thawPredictionsForNextReload = 0;
    lastPredictions = v12->_lastPredictions;
    v12->_lastPredictions = 0;

  }
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFPredictionsItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPredictionsItemProvider predictionsManager](self, "predictionsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithHome:predictionsManager:itemLimit:", v5, v6, -[HFPredictionsItemProvider itemLimit](self, "itemLimit"));

  return v7;
}

- (void)setFreezePredictions:(BOOL)a3
{
  NSArray *lastPredictions;

  self->_freezePredictions = a3;
  if (!a3)
  {
    lastPredictions = self->_lastPredictions;
    self->_lastPredictions = 0;

  }
}

- (void)setThawPredictionsForNextReload:(BOOL)a3
{
  NSObject *v4;
  int v5;
  HFPredictionsItemProvider *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  self->_thawPredictionsForNextReload = a3;
  if (a3)
  {
    HFLogForCategory(0x33uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = self;
      _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "%@ set to thaw predictions for next reload", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (id)fetchPredictions
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id location;
  uint8_t buf[4];
  HFPredictionsItemProvider *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (-[HFPredictionsItemProvider freezePredictions](self, "freezePredictions")
    && !-[HFPredictionsItemProvider thawPredictionsForNextReload](self, "thawPredictionsForNextReload")
    && (-[HFPredictionsItemProvider lastPredictions](self, "lastPredictions"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "count"),
        v3,
        v4))
  {
    HFLogForCategory(0x33uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[HFPredictionsItemProvider lastPredictions](self, "lastPredictions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = self;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%@ asked to fetch predictions, but is frozen. Returning %@", buf, 0x16u);

    }
    v7 = (void *)MEMORY[0x1E0D519C0];
    -[HFPredictionsItemProvider lastPredictions](self, "lastPredictions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "futureWithResult:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  else
  {
    objc_initWeak(&location, self);
    if (-[HFPredictionsItemProvider freezePredictions](self, "freezePredictions"))
    {
      HFLogForCategory(0x33uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = self;
        _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "%@ thawing predictions to be recomputed", buf, 0xCu);
      }

    }
    -[HFPredictionsItemProvider predictionsManager](self, "predictionsManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fetchUserActionPredictions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __45__HFPredictionsItemProvider_fetchPredictions__block_invoke;
    v15[3] = &unk_1EA72A438;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v13, "flatMap:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v16);

    objc_destroyWeak(&location);
    return v14;
  }
}

id __45__HFPredictionsItemProvider_fetchPredictions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "freezePredictions"))
  {
    HFLogForCategory(0x33uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = WeakRetained;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%@ saving and returning predictions after thawing %@", (uint8_t *)&v9, 0x16u);
    }

    objc_msgSend(WeakRetained, "setThawPredictionsForNextReload:", 0);
    v6 = (void *)objc_msgSend(v3, "copy");
    objc_msgSend(WeakRetained, "setLastPredictions:", v6);

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)reloadItems
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  id v13;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__HFPredictionsItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_1EA72A340;
  objc_copyWeak(&v13, &location);
  v4 = _Block_copy(aBlock);
  -[HFPredictionsItemProvider fetchPredictions](self, "fetchPredictions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __40__HFPredictionsItemProvider_reloadItems__block_invoke_2;
  v9[3] = &unk_1EA72C460;
  objc_copyWeak(&v11, &location);
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return v7;
}

HFActionSetItem *__40__HFPredictionsItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  HFActionSetItem *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  __objc2_class *v16;
  id v17;
  void *v18;
  id v19;
  HFMediaAccessoryItem *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  v5 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (!v7)
  {
    objc_msgSend(WeakRetained, "valueSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v10 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (v12)
    {
      v8 = -[HFActionSetItem initWithActionSet:actionSetItemStyle:valueSource:]([HFActionSetItem alloc], "initWithActionSet:actionSetItemStyle:valueSource:", v12, 1, v9);
LABEL_57:

      goto LABEL_58;
    }
    objc_opt_class();
    v13 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    if (v15)
    {
      if (objc_msgSend(v15, "hf_isProgrammableSwitch"))
      {
        v16 = HFProgrammableSwitchAccessoryItem;
LABEL_34:
        v8 = (HFActionSetItem *)objc_msgSend([v16 alloc], "initWithAccessory:valueSource:", v15, v9);
LABEL_56:

        goto LABEL_57;
      }
      if (objc_msgSend(v15, "hf_isRemoteControl"))
      {
        v16 = HFTargetControlAccessoryItem;
        goto LABEL_34;
      }
      if (!objc_msgSend(v15, "hf_isMediaAccessory")
        || (objc_msgSend(v15, "mediaProfile"), v21 = (void *)objc_claimAutoreleasedReturnValue(),
                                               v21,
                                               !v21))
      {
        v16 = HFAccessoryItem;
        goto LABEL_34;
      }
      objc_msgSend(v15, "mediaProfile");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = -[HFMediaAccessoryItem initWithValueSource:mediaProfileContainer:]([HFMediaAccessoryItem alloc], "initWithValueSource:mediaProfileContainer:", v9, v19);
    }
    else
    {
      objc_opt_class();
      v17 = v13;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
      v19 = v18;

      if (!v19)
      {
        objc_opt_class();
        v22 = v17;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v23 = v22;
        else
          v23 = 0;
        v24 = v23;

        if (v24)
        {
          v8 = -[HFServiceGroupItem initWithValueSource:serviceGroup:]([HFServiceGroupItem alloc], "initWithValueSource:serviceGroup:", v9, v24);
        }
        else
        {
          objc_opt_class();
          v25 = v22;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v26 = v25;
          else
            v26 = 0;
          v27 = v26;

          if (v27)
          {
            v8 = -[HFMediaAccessoryItem initWithValueSource:mediaProfileContainer:]([HFMediaAccessoryItem alloc], "initWithValueSource:mediaProfileContainer:", v9, v27);
            v24 = 0;
          }
          else
          {
            objc_opt_class();
            v28 = v25;
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v29 = v28;
            else
              v29 = 0;
            v30 = v29;

            if (v30)
            {
              v8 = -[HFMediaAccessoryItem initWithValueSource:mediaProfileContainer:]([HFMediaAccessoryItem alloc], "initWithValueSource:mediaProfileContainer:", v9, v30);
              v31 = v30;
              v24 = 0;
            }
            else
            {
              objc_opt_class();
              v32 = v28;
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v33 = v32;
              else
                v33 = 0;
              v34 = v33;

              if (v34)
              {
                v8 = -[HFPlaceholderItem initWithHomeKitObject:]([HFPlaceholderItem alloc], "initWithHomeKitObject:", v34);
              }
              else
              {
                NSLog(CFSTR("Unsupported HomeKit object %@"), v32);
                v8 = 0;
              }
              v35 = v34;
              v24 = 0;

              v31 = 0;
            }

          }
        }

        goto LABEL_55;
      }
      v20 = (HFMediaAccessoryItem *)objc_msgSend(objc_alloc(+[HFServiceItem itemClassForService:](HFServiceItem, "itemClassForService:", v19)), "initWithValueSource:service:", v9, v19);
    }
    v8 = (HFActionSetItem *)v20;
LABEL_55:

    goto LABEL_56;
  }
  v8 = -[HFHomeItem initWithHome:]([HFHomeItem alloc], "initWithHome:", v7);
LABEL_58:

  return v8;
}

id __40__HFPredictionsItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "na_safeSubarrayWithRange:", 0, objc_msgSend(WeakRetained, "itemLimit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "transformedPredictions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_backFillPredictions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__HFPredictionsItemProvider_reloadItems__block_invoke_3;
  v10[3] = &unk_1EA72C460;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v7, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v12);
  return v8;
}

id __40__HFPredictionsItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "reloadItemsWithHomeKitObjects:filter:itemMap:", v3, 0, *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__HFPredictionsItemProvider_reloadItems__block_invoke_4;
  v9[3] = &unk_1EA726E30;
  objc_copyWeak(&v10, v4);
  objc_msgSend(v6, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);

  return v7;
}

id __40__HFPredictionsItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "allItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "allItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)transformedPredictions:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_170);
}

id __52__HFPredictionsItemProvider_transformedPredictions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5
    && objc_msgSend(v5, "hf_isMediaAccessory")
    && (objc_msgSend(v5, "mediaProfile"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    objc_msgSend(v5, "mediaProfile");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v3;
  }
  v8 = v7;

  return v8;
}

- (id)_backFillPredictions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void (**i)(void *, void *);
  unint64_t v41;
  unint64_t v42;
  HFPlaceholder *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void (**v62)(void *, void *);
  void *v63;
  int v64;
  void *v65;
  void *v66;
  HFPredictionsItemProvider *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD aBlock[4];
  id v73;
  HFPredictionsItemProvider *v74;
  _QWORD v75[4];
  id v76;
  _QWORD v77[4];
  id v78;
  uint8_t v79[128];
  uint8_t buf[4];
  id v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPredictionsItemProvider setObjectPriorities:](self, "setObjectPriorities:", v5);

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory(0x33uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v81 = v4;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Initial predictions: %@", buf, 0xCu);
  }

  -[HFPredictionsItemProvider predictionsManager](self, "predictionsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filterTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    -[HFPredictionsItemProvider predictionsManager](self, "predictionsManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "filterTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", &unk_1EA7CCC40);

  }
  else
  {
    v12 = 1;
  }

  v66 = v4;
  if (_os_feature_enabled_impl())
  {
    -[HFPredictionsItemProvider predictionsManager](self, "predictionsManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "filterTypes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {
      -[HFPredictionsItemProvider predictionsManager](self, "predictionsManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "filterTypes");
      v16 = v6;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "containsObject:", &unk_1EA7CCC58);

      v6 = v16;
    }
    else
    {
      v18 = 1;
    }

  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v67 = self;
  if (v12)
  {
    -[HFPredictionsItemProvider home](self, "home");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hf_accessoryLikeObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __50__HFPredictionsItemProvider__backFillPredictions___block_invoke_2;
    v77[3] = &unk_1EA73A620;
    v78 = &__block_literal_global_37_4;
    objc_msgSend(v22, "na_map:", v77);
    v23 = v6;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "allObjects");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFPredictionsItemProvider home](v67, "home");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "hf_reorderableServicesList");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "sortedHomeKitObjectComparator");
    v64 = v18;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sortedArrayUsingComparator:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    self = v67;
    v6 = v23;

    v20 = MEMORY[0x1E0C809B0];
    objc_msgSend(v19, "addObjectsFromArray:", v29);
    -[HFPredictionsItemProvider home](v67, "home");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "hf_orderedRooms");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v75[0] = v20;
    v75[1] = 3221225472;
    v75[2] = __50__HFPredictionsItemProvider__backFillPredictions___block_invoke_3;
    v75[3] = &unk_1EA73A670;
    v76 = &__block_literal_global_37_4;
    objc_msgSend(v31, "na_flatMap:", v75);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "addObjectsFromArray:", v32);
    v18 = v64;

  }
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[HFPredictionsItemProvider home](self, "home");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "hf_orderedActionSets");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "na_filter:", &__block_literal_global_42_3);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "na_filter:", &__block_literal_global_43_1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObjectsFromArray:", v37);
    objc_msgSend(v36, "na_filter:", &__block_literal_global_44_3);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObjectsFromArray:", v38);

  }
  aBlock[0] = v20;
  aBlock[1] = 3221225472;
  aBlock[2] = __50__HFPredictionsItemProvider__backFillPredictions___block_invoke_8;
  aBlock[3] = &unk_1EA73A6F8;
  v39 = v6;
  v73 = v39;
  v74 = self;
  for (i = (void (**)(void *, void *))_Block_copy(aBlock); ; i[2](i, v33))
  {
    v41 = objc_msgSend(v39, "count");
    if (v41 >= -[HFPredictionsItemProvider itemLimit](self, "itemLimit")
      || !objc_msgSend(v19, "count") && !objc_msgSend(v33, "count"))
    {
      break;
    }
    i[2](i, v19);
    i[2](i, v19);
  }
  v63 = v33;
  v65 = v19;
  +[HFAnalyticsCCPredictionEvent sendMetricsForPredictionEventAtStage:withCount:](HFAnalyticsCCPredictionEvent, "sendMetricsForPredictionEventAtStage:withCount:", 3, objc_msgSend(v39, "count"));
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if (objc_msgSend(v39, "count") && -[HFPredictionsItemProvider itemLimit](self, "itemLimit"))
    {
      v42 = 0;
      do
      {
        v43 = objc_alloc_init(HFPlaceholder);
        objc_msgSend(v39, "addObject:", v43);

        ++v42;
      }
      while (v42 < -[HFPredictionsItemProvider itemLimit](self, "itemLimit"));
    }
    -[HFPredictionsItemProvider home](self, "home");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "insertObject:atIndex:", v44, 0);

  }
  v62 = i;
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v45 = v39;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v69;
    v49 = 1;
    do
    {
      for (j = 0; j != v47; ++j)
      {
        if (*(_QWORD *)v69 != v48)
          objc_enumerationMutation(v45);
        v51 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
        -[HFPredictionsItemProvider objectPriorities](self, "objectPriorities");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v49 + j);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "uniqueIdentifier");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "UUIDString");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setObject:forKey:", v53, v55);

        self = v67;
      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
      v49 += j;
    }
    while (v47);
  }

  HFLogForCategory(0x33uLL);
  v56 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v45, "array");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v81 = v57;
    _os_log_impl(&dword_1DD34E000, v56, OS_LOG_TYPE_DEFAULT, "Backfilled predictions: %@", buf, 0xCu);

  }
  v58 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(v45, "array");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "futureWithResult:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  return v60;
}

uint64_t __50__HFPredictionsItemProvider__backFillPredictions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

  v2 = a2;
  objc_msgSend(v2, "homeKitObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v2, "homeKitObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((isKindOfClass & 1) != 0)
  {
    v7 = objc_msgSend(v5, "hf_showsAsAccessoryInControlCentre");
  }
  else
  {
    objc_opt_class();
    v8 = objc_opt_isKindOfClass();

    if ((v8 & 1) == 0)
    {
      v9 = 1;
      goto LABEL_7;
    }
    objc_msgSend(v2, "homeKitObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hf_showsAsServiceInControlCentre");
  }
  v9 = v7;

LABEL_7:
  return v9;
}

id __50__HFPredictionsItemProvider__backFillPredictions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (objc_msgSend(v3, "hf_effectiveIsFavorite")
    && (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    objc_msgSend(v3, "homeKitObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __50__HFPredictionsItemProvider__backFillPredictions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  objc_msgSend(v3, "hf_accessoryLikeObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__HFPredictionsItemProvider__backFillPredictions___block_invoke_4;
  v11[3] = &unk_1EA73A648;
  v12 = *(id *)(a1 + 32);
  objc_msgSend(v4, "na_map:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_reorderableServicesList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "sortedHomeKitObjectComparator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __50__HFPredictionsItemProvider__backFillPredictions___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (objc_msgSend(v3, "hf_effectiveShowInHomeDashboard")
    && (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    objc_msgSend(v3, "homeKitObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

BOOL __50__HFPredictionsItemProvider__backFillPredictions___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

uint64_t __50__HFPredictionsItemProvider__backFillPredictions___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_effectiveShowInHomeDashboard");
}

uint64_t __50__HFPredictionsItemProvider__backFillPredictions___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_effectiveShowInHomeDashboard") ^ 1;
}

void __50__HFPredictionsItemProvider__backFillPredictions___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v4 < objc_msgSend(*(id *)(a1 + 40), "itemLimit"))
  {
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      HFLogForCategory(0x33uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 138412290;
        v8 = v5;
        _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Backfilling %@", (uint8_t *)&v7, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
      objc_msgSend(v3, "removeObjectAtIndex:", 0);
    }

  }
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)HFPredictionsItemProvider;
  -[HFItemProvider invalidationReasons](&v6, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("actionSet");
  v7[1] = CFSTR("home");
  v7[2] = CFSTR("user");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)itemPriority:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a3;
  -[HFPredictionsItemProvider objectPriorities](self, "objectPriorities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeKitObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (id)itemConfidence:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "homeKitObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HFPredictionsItemProvider predictionsManager](self, "predictionsManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predictionConfidenceForObject:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)updateItemLimit:(unint64_t)a3
{
  self->_itemLimit = a3;
}

- (HMHome)home
{
  return self->_home;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (void)setValueSource:(id)a3
{
  objc_storeStrong((id *)&self->_valueSource, a3);
}

- (BOOL)freezePredictions
{
  return self->_freezePredictions;
}

- (BOOL)thawPredictionsForNextReload
{
  return self->_thawPredictionsForNextReload;
}

- (NSMutableSet)allItems
{
  return self->_allItems;
}

- (void)setAllItems:(id)a3
{
  objc_storeStrong((id *)&self->_allItems, a3);
}

- (NSArray)predictions
{
  return self->_predictions;
}

- (void)setPredictions:(id)a3
{
  objc_storeStrong((id *)&self->_predictions, a3);
}

- (NSArray)lastPredictions
{
  return self->_lastPredictions;
}

- (void)setLastPredictions:(id)a3
{
  objc_storeStrong((id *)&self->_lastPredictions, a3);
}

- (NSMutableDictionary)objectPriorities
{
  return self->_objectPriorities;
}

- (void)setObjectPriorities:(id)a3
{
  objc_storeStrong((id *)&self->_objectPriorities, a3);
}

- (HFPredictionsManager)predictionsManager
{
  return self->_predictionsManager;
}

- (void)setPredictionsManager:(id)a3
{
  objc_storeStrong((id *)&self->_predictionsManager, a3);
}

- (unint64_t)itemLimit
{
  return self->_itemLimit;
}

- (void)setItemLimit:(unint64_t)a3
{
  self->_itemLimit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionsManager, 0);
  objc_storeStrong((id *)&self->_objectPriorities, 0);
  objc_storeStrong((id *)&self->_lastPredictions, 0);
  objc_storeStrong((id *)&self->_predictions, 0);
  objc_storeStrong((id *)&self->_allItems, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
