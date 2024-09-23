@implementation CNUIUserActionListDataSource

+ (id)allSupportedActionTypes
{
  CNCapabilities *v3;
  void *v4;

  v3 = objc_alloc_init(CNCapabilities);
  objc_msgSend(a1, "allSupportedActionTypesWithCapabilities:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)allSupportedActionTypesWithCapabilities:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "allActionTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__CNUIUserActionListDataSource_allSupportedActionTypesWithCapabilities___block_invoke;
  v9[3] = &unk_1EA603180;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "_cn_filter:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)allActionTypes
{
  if (allActionTypes_cn_once_token_5[0] != -1)
    dispatch_once(allActionTypes_cn_once_token_5, &__block_literal_global_23);
  return (id)allActionTypes_cn_once_object_5;
}

- (id)consumer:(id)a3 currentActionModelForContact:(id)a4 actionType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  CNUIUserActionListDataSource *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend((id)objc_opt_class(), "isSupportedActionType:", v10))
  {
    +[CNUIUserActionCacheKeyGenerator keyForContact:actionType:](CNUIUserActionCacheKeyGenerator, "keyForContact:actionType:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self;
    objc_sync_enter(v12);
    -[CNUIUserActionListDataSource models](v12, "models");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v12);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)consumer:(id)a3 actionModelsForContact:(id)a4 actionType:(id)a5
{
  return -[CNUIUserActionListDataSource modelsForContact:actionType:](self, "modelsForContact:actionType:", a4, a5);
}

- (id)consumer:(id)a3 actionModelsForContact:(id)a4 actionType:(id)a5 handler:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v9 = a6;
  -[CNUIUserActionListDataSource modelsForContact:actionType:](self, "modelsForContact:actionType:", a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13AF0], "observerWithResultBlock:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "subscribe:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (CNUIUserActionDisambiguationModeler)modeler
{
  return self->_modeler;
}

+ (id)descriptorForRequiredKeys
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97200];
  +[CNUIUserActionDisambiguationModeler descriptorForRequiredKeys](CNUIUserActionDisambiguationModeler, "descriptorForRequiredKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNUIUserActionListDataSource descriptorForRequiredKeys]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithKeyDescriptors:description:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)consumer:(id)a3 localizedDisplayNameForActionType:(id)a4
{
  id v4;
  void *v5;

  v4 = a4;
  objc_msgSend((id)objc_opt_class(), "displayNameForDisambiguationForActionType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __72__CNUIUserActionListDataSource_allSupportedActionTypesWithCapabilities___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96658]))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "isFaceTimeVideoSupported");
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96610]))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "isExpanseSupported");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96630]))
    {
      v5 = 1;
      goto LABEL_8;
    }
    v4 = objc_msgSend(*(id *)(a1 + 32), "isPaySupported");
  }
  v5 = v4;
LABEL_8:

  return v5;
}

- (id)modelsForContact:(id)a3 actionType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  CNUIUserActionListDataSource *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  NSObject *v28;
  double v29;
  void *v30;
  NSObject *v31;
  uint64_t v33;
  uint64_t v34;
  id (*v35)(uint64_t);
  void *v36;
  CNUIUserActionListDataSource *v37;
  id v38;
  id v39;
  __int128 *p_buf;
  _BYTE v41[16];
  __int128 buf;
  uint64_t v43;
  char v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "isSupportedActionType:", v7) & 1) != 0)
  {
    +[CNUIUserActionCacheKeyGenerator keyForContact:actionType:](CNUIUserActionCacheKeyGenerator, "keyForContact:actionType:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (*(uint64_t (**)(void))(*MEMORY[0x1E0D13850] + 16))();
    objc_msgSend((id)objc_opt_class(), "os_log");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((v9 & 1) != 0)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[CNUIUserActionListDataSource modelsForContact:actionType:].cold.5(v6);

      objc_msgSend((id)objc_opt_class(), "os_log");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[CNUIUserActionListDataSource modelsForContact:actionType:].cold.4();

      v13 = objc_alloc_init(MEMORY[0x1E0D13978]);
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v43 = 0x2020000000;
      v44 = 0;
      v14 = self;
      objc_sync_enter(v14);
      -[CNUIUserActionListDataSource models](v14, "models");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = MEMORY[0x1E0C809B0];
      v34 = 3221225472;
      v35 = __60__CNUIUserActionListDataSource_modelsForContact_actionType___block_invoke;
      v36 = &unk_1EA604048;
      v37 = v14;
      v38 = v8;
      v16 = v6;
      v39 = v16;
      p_buf = &buf;
      objc_msgSend(v15, "objectForKey:onCacheMiss:", v38, &v33);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "addDelegate:", v13, v33, v34, v35, v36, v37);
      objc_sync_exit(v14);

      if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
      {
        objc_msgSend((id)objc_opt_class(), "os_log");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[CNUIUserActionListDataSource modelsForContact:actionType:].cold.3();

        -[CNUIUserActionListDataSource performFirstResolutionForEntry:contact:actionType:](v14, "performFirstResolutionForEntry:contact:actionType:", v17, v16, v7);
      }
      else
      {
        -[CNUIUserActionListDataSource schedulerProvider](v14, "schedulerProvider");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "immediateScheduler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "timestamp");
        v25 = v24;
        objc_msgSend(v17, "timestampOfCurrentValue");
        v27 = v26;

        objc_msgSend((id)objc_opt_class(), "os_log");
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v25 - v27;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x1E0D13BB0], "stringForTimeInterval:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNUIUserActionListDataSource modelsForContact:actionType:].cold.2(v30, (uint64_t)v41, v28);
        }

        if (v14->_tracksChanges && v29 > v14->_cacheEntryRefreshAge)
        {
          objc_msgSend((id)objc_opt_class(), "os_log");
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            -[CNUIUserActionListDataSource modelsForContact:actionType:].cold.1();

          -[CNUIUserActionListDataSource refreshEntry:contact:actionType:](v14, "refreshEntry:contact:actionType:", v17, v16, v7);
        }
      }

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "shortDebugDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v19;
        _os_log_impl(&dword_1DD140000, v11, OS_LOG_TYPE_INFO, "Nil or empty cache key for contact: %@", (uint8_t *)&buf, 0xCu);

      }
      v20 = (void *)MEMORY[0x1E0D13AE8];
      +[CNUIUserActionListModel emptyModel](CNUIUserActionListModel, "emptyModel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "observableWithResult:", v21);
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13AE8], "emptyObservable");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (id)os_log
{
  if (os_log_cn_once_token_2 != -1)
    dispatch_once(&os_log_cn_once_token_2, &__block_literal_global_27);
  return (id)os_log_cn_once_object_2;
}

- (CNUIUserActionListModelCache)models
{
  return self->_models;
}

+ (BOOL)isSupportedActionType:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend((id)*MEMORY[0x1E0C96618], "isEqualToString:", v3) & 1) != 0
    || (objc_msgSend((id)*MEMORY[0x1E0C96620], "isEqualToString:", v3) & 1) != 0
    || (objc_msgSend((id)*MEMORY[0x1E0C965F8], "isEqualToString:", v3) & 1) != 0
    || (objc_msgSend((id)*MEMORY[0x1E0C96658], "isEqualToString:", v3) & 1) != 0
    || (objc_msgSend((id)*MEMORY[0x1E0C96638], "isEqualToString:", v3) & 1) != 0
    || (objc_msgSend((id)*MEMORY[0x1E0C96648], "isEqualToString:", v3) & 1) != 0
    || (objc_msgSend((id)*MEMORY[0x1E0C96630], "isEqualToString:", v3) & 1) != 0
    || (objc_msgSend((id)*MEMORY[0x1E0C96608], "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend((id)*MEMORY[0x1E0C96610], "isEqualToString:", v3);
  }

  return v4;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

uint64_t __82__CNUIUserActionListDataSource_performFirstResolutionForEntry_contact_actionType___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "userActionListDataSource:willResolveInitialActionsForActionType:contactIdentifier:", a1[4], a1[5], a1[6]);
}

- (void)performFirstResolutionForEntry:(id)a3 contact:(id)a4 actionType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionListDataSource delegates](self, "delegates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[CNUIUserActionListDataSource delegates](self, "delegates");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __82__CNUIUserActionListDataSource_performFirstResolutionForEntry_contact_actionType___block_invoke;
    v19[3] = &unk_1EA604070;
    v19[4] = self;
    v20 = v10;
    v21 = v11;
    objc_msgSend(v15, "_cn_each:", v19);

  }
  objc_msgSend((id)objc_opt_class(), "os_log");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v9, "shortDebugDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v10;
    v24 = 2112;
    v25 = v8;
    v26 = 2112;
    v27 = v17;
    _os_log_impl(&dword_1DD140000, v16, OS_LOG_TYPE_INFO, "Will perform initial resolution of %{public}@ actions for %@ (%@)", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionListDataSource resolveCacheEntry:contact:actionType:defaultActionItem:qualityOfService:](self, "resolveCacheEntry:contact:actionType:defaultActionItem:qualityOfService:", v8, v9, v10, v18, 4);

}

- (id)consumer:(id)a3 localizedButtonDisplayNameForActionType:(id)a4
{
  id v4;
  void *v5;

  v4 = a4;
  objc_msgSend((id)objc_opt_class(), "displayNameForButtonForActionType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)consumer:(id)a3 localizedDisplayNameForButtonWithDefaultAction:(id)a4 actionType:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v7 = a4;
  v8 = a5;
  if (-[CNUIUserActionListDataSource shouldUseLabelForButtonWithDefaultAction:](self, "shouldUseLabelForButtonWithDefaultAction:", v7))
  {
    v9 = (void *)MEMORY[0x1E0C97338];
    objc_msgSend(v7, "label");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForLabel:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "displayNameForButtonForActionType:", v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v11;
  }
  v13 = v12;

  return v13;
}

- (BOOL)shouldUseLabelForButtonWithDefaultAction:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "shouldUseLabelForQuickActionButtonTitle") & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v4, "type");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C965F8]);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)displayNameForDisambiguationForActionType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  __CFString *v8;

  v3 = a3;
  if (objc_msgSend((id)*MEMORY[0x1E0C96618], "isEqualToString:", v3))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("MAIL_ACTION_TYPE_DISAMBIGUATION");
LABEL_15:
    v7 = CFSTR("Localized");
    goto LABEL_16;
  }
  if (objc_msgSend((id)*MEMORY[0x1E0C96620], "isEqualToString:", v3))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("MESSAGE_ACTION_TYPE_DISAMBIGUATION");
    goto LABEL_15;
  }
  if (objc_msgSend((id)*MEMORY[0x1E0C96658], "isEqualToString:", v3))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("VIDEOCALL_ACTION_TYPE_DISAMBIGUATION");
    goto LABEL_15;
  }
  if (objc_msgSend((id)*MEMORY[0x1E0C965F8], "isEqualToString:", v3))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("AUDIOCALL_ACTION_TYPE_DISAMBIGUATION");
    goto LABEL_15;
  }
  if (!objc_msgSend((id)*MEMORY[0x1E0C96630], "isEqualToString:", v3))
  {
    if (objc_msgSend((id)*MEMORY[0x1E0C96608], "isEqualToString:", v3))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("DIRECTIONS_ACTION_TYPE_BUTTON");
    }
    else
    {
      if (!objc_msgSend((id)*MEMORY[0x1E0C96610], "isEqualToString:", v3))
      {
        v8 = &stru_1EA606688;
        goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("EXPANSE_ACTION_TYPE_BUTTON");
    }
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = CFSTR("PAY_ACTION_TYPE_DISAMBIGUATION");
  v7 = CFSTR("Localized-SURF");
LABEL_16:
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1EA606688, v7);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v8;
}

+ (id)displayNameForButtonForActionType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  __CFString *v8;

  v3 = a3;
  if (objc_msgSend((id)*MEMORY[0x1E0C96618], "isEqualToString:", v3))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("MAIL_ACTION_TYPE_BUTTON");
LABEL_15:
    v7 = CFSTR("Localized");
    goto LABEL_16;
  }
  if (objc_msgSend((id)*MEMORY[0x1E0C96620], "isEqualToString:", v3))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("MESSAGE_ACTION_TYPE_BUTTON");
    goto LABEL_15;
  }
  if (objc_msgSend((id)*MEMORY[0x1E0C96658], "isEqualToString:", v3))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("VIDEOCALL_ACTION_TYPE_BUTTON");
    goto LABEL_15;
  }
  if (objc_msgSend((id)*MEMORY[0x1E0C965F8], "isEqualToString:", v3))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("AUDIOCALL_ACTION_TYPE_BUTTON");
    goto LABEL_15;
  }
  if (!objc_msgSend((id)*MEMORY[0x1E0C96630], "isEqualToString:", v3))
  {
    if (objc_msgSend((id)*MEMORY[0x1E0C96608], "isEqualToString:", v3))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("DIRECTIONS_ACTION_TYPE_BUTTON");
    }
    else
    {
      if (!objc_msgSend((id)*MEMORY[0x1E0C96610], "isEqualToString:", v3))
      {
        v8 = &stru_1EA606688;
        goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("EXPANSE_ACTION_TYPE_BUTTON");
    }
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = CFSTR("PAY_ACTION_TYPE_BUTTON");
  v7 = CFSTR("Localized-SURF");
LABEL_16:
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1EA606688, v7);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v8;
}

- (void)setContactStore:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNUIUserActionListDataSource modeler](self, "modeler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContactStore:", v4);

}

- (CNUIUserActionListDataSource)initWithDiscoveringEnvironment:(id)a3
{
  id v4;
  CNUIUserActionListDataSource *v5;
  CNUIUserActionListDataSource *v6;
  CNUIUserActionDisambiguationModeler *v7;
  CNUIUserActionDisambiguationModeler *modeler;
  uint64_t v9;
  CNUIUserActionListModelCache *models;
  uint64_t v11;
  CNSchedulerProvider *schedulerProvider;
  uint64_t v13;
  CNCache *delegates;
  void *v15;
  void *v16;
  void *v17;
  CNUIUserActionListDataSource *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CNUIUserActionListDataSource;
  v5 = -[CNUIUserActionListDataSource init](&v20, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_cacheCapacity = 100;
    *(_OWORD *)&v5->_cacheEntryRefreshAge = xmmword_1DD1C8D30;
    v7 = -[CNUIUserActionDisambiguationModeler initWithDiscoveringEnvironment:]([CNUIUserActionDisambiguationModeler alloc], "initWithDiscoveringEnvironment:", v4);
    modeler = v6->_modeler;
    v6->_modeler = v7;

    -[CNUIUserActionListDataSource makeCacheWithCurrentSettings](v6, "makeCacheWithCurrentSettings");
    v9 = objc_claimAutoreleasedReturnValue();
    models = v6->_models;
    v6->_models = (CNUIUserActionListModelCache *)v9;

    objc_msgSend(v4, "schedulerProvider");
    v11 = objc_claimAutoreleasedReturnValue();
    schedulerProvider = v6->_schedulerProvider;
    v6->_schedulerProvider = (CNSchedulerProvider *)v11;

    if (initWithDiscoveringEnvironment__cn_once_token_3 != -1)
      dispatch_once(&initWithDiscoveringEnvironment__cn_once_token_3, &__block_literal_global_13);
    objc_storeStrong((id *)&v6->_resolutionScheduler, (id)initWithDiscoveringEnvironment__cn_once_object_3);
    v6->_tracksChanges = 1;
    objc_msgSend(MEMORY[0x1E0D139B0], "atomicCache");
    v13 = objc_claimAutoreleasedReturnValue();
    delegates = v6->_delegates;
    v6->_delegates = (CNCache *)v13;

    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "notificationCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    getTUCallCapabilitiesFaceTimeAvailabilityChangedNotification();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v6, sel__invalidateModelsOnFaceTimeAvailabilityChange_, v17, 0);

    v18 = v6;
  }

  return v6;
}

- (id)makeCacheWithCurrentSettings
{
  void *v3;
  unint64_t cacheCapacity;
  double cacheEntryExpirationAge;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_class();
  cacheCapacity = self->_cacheCapacity;
  cacheEntryExpirationAge = self->_cacheEntryExpirationAge;
  -[CNSchedulerProvider immediateScheduler](self->_schedulerProvider, "immediateScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeCacheWithCapacity:expirationAge:timeProvider:", cacheCapacity, v6, cacheEntryExpirationAge);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __60__CNUIUserActionListDataSource_modelsForContact_actionType___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "os_log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __60__CNUIUserActionListDataSource_modelsForContact_actionType___block_invoke_cold_1(a1);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  v3 = objc_alloc(MEMORY[0x1E0D13970]);
  objc_msgSend(*(id *)(a1 + 32), "schedulerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSchedulerProvider:", v4);

  return v5;
}

+ (id)makeCacheWithCapacity:(unint64_t)a3 expirationAge:(double)a4 timeProvider:(id)a5
{
  id v7;
  CNUIUserActionListModelCache *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CNUIUserActionListModelCache *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = [CNUIUserActionListModelCache alloc];
  objc_msgSend(MEMORY[0x1E0D139B0], "boundingStrategyWithCapacity:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  objc_msgSend(MEMORY[0x1E0D139B0], "boundingStrategyWithTTL:renewalOptions:timeProvider:", 2, v7, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D139B0], "nonatomicCacheScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CNCache initWithBoundingStrategies:resourceScheduler:](v8, "initWithBoundingStrategies:resourceScheduler:", v11, v12);

  return v13;
}

void __63__CNUIUserActionListDataSource_initWithDiscoveringEnvironment___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D13B68], "operationQueueSchedulerWithMaxConcurrentOperationCount:", 12);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)initWithDiscoveringEnvironment__cn_once_object_3;
  initWithDiscoveringEnvironment__cn_once_object_3 = v0;

}

void __38__CNUIUserActionListDataSource_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "quick-actions.data-source");
  v1 = (void *)os_log_cn_once_object_2;
  os_log_cn_once_object_2 = (uint64_t)v0;

}

void __46__CNUIUserActionListDataSource_allActionTypes__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C965F8];
  v5[0] = *MEMORY[0x1E0C96620];
  v5[1] = v0;
  v1 = *MEMORY[0x1E0C96618];
  v5[2] = *MEMORY[0x1E0C96658];
  v5[3] = v1;
  v5[4] = *MEMORY[0x1E0C96630];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)allActionTypes_cn_once_object_5;
  allActionTypes_cn_once_object_5 = v3;

}

- (CNUIUserActionListDataSource)initWithSchedulerProvider:(id)a3
{
  id v4;
  CNUIIDSAvailabilityProvider *v5;
  CNCapabilities *v6;
  CNUIDefaultUserActionFetcher *v7;
  CNUIUserActionDiscoveringEnvironment *v8;
  CNUIUserActionListDataSource *v9;

  v4 = a3;
  v5 = objc_alloc_init(CNUIIDSAvailabilityProvider);
  v6 = objc_alloc_init(CNCapabilities);
  v7 = objc_alloc_init(CNUIDefaultUserActionFetcher);
  v8 = -[CNUIUserActionDiscoveringEnvironment initWithIDSAvailabilityProvider:schedulerProvider:capabilities:defaultUserActionFetcher:]([CNUIUserActionDiscoveringEnvironment alloc], "initWithIDSAvailabilityProvider:schedulerProvider:capabilities:defaultUserActionFetcher:", v5, v4, v6, v7);

  v9 = -[CNUIUserActionListDataSource initWithDiscoveringEnvironment:](self, "initWithDiscoveringEnvironment:", v8);
  return v9;
}

- (CNUIUserActionListDataSource)initWithSchedulerProvider:(id)a3 idsAvailabilityProvider:(id)a4
{
  id v6;
  id v7;
  CNUIUserActionDiscoveringEnvironment *v8;
  CNCapabilities *v9;
  CNUIDefaultUserActionFetcher *v10;
  CNUIUserActionDiscoveringEnvironment *v11;
  CNUIUserActionListDataSource *v12;

  v6 = a4;
  v7 = a3;
  v8 = [CNUIUserActionDiscoveringEnvironment alloc];
  v9 = objc_alloc_init(CNCapabilities);
  v10 = objc_alloc_init(CNUIDefaultUserActionFetcher);
  v11 = -[CNUIUserActionDiscoveringEnvironment initWithIDSAvailabilityProvider:schedulerProvider:capabilities:defaultUserActionFetcher:](v8, "initWithIDSAvailabilityProvider:schedulerProvider:capabilities:defaultUserActionFetcher:", v6, v7, v9, v10);

  v12 = -[CNUIUserActionListDataSource initWithDiscoveringEnvironment:](self, "initWithDiscoveringEnvironment:", v11);
  return v12;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getTUCallCapabilitiesFaceTimeAvailabilityChangedNotification();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, v5, 0);

  -[CNUIUserActionListDataSource _safeEmptyModels](self, "_safeEmptyModels");
  v6.receiver = self;
  v6.super_class = (Class)CNUIUserActionListDataSource;
  -[CNUIUserActionListDataSource dealloc](&v6, sel_dealloc);
}

- (void)_invalidateModelsOnFaceTimeAvailabilityChange:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  objc_msgSend((id)objc_opt_class(), "os_log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DD140000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating contact actions in reaction to FaceTime availability change", v5, 2u);
  }

  -[CNUIUserActionListDataSource _safeEmptyModels](self, "_safeEmptyModels");
}

- (void)_safeEmptyModels
{
  CNUIUserActionListDataSource *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = self;
  objc_sync_enter(v3);
  -[CNUIUserActionListDataSource models](v3, "models");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setArray:", v5);

  -[CNUIUserActionListDataSource models](v3, "models");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  objc_sync_exit(v3);
}

- (void)setCacheCapacity:(unint64_t)a3
{
  self->_cacheCapacity = a3;
  -[CNUIUserActionListDataSource makeCacheAndTransferContents](self, "makeCacheAndTransferContents");
}

- (void)setCacheEntryRefreshAge:(double)a3
{
  self->_cacheEntryRefreshAge = a3;
  if (self->_cacheEntryExpirationAge < a3)
    self->_cacheEntryExpirationAge = a3;
  -[CNUIUserActionListDataSource makeCacheAndTransferContents](self, "makeCacheAndTransferContents");
}

- (void)setCacheEntryExpirationAge:(double)a3
{
  self->_cacheEntryExpirationAge = a3;
  if (self->_cacheEntryRefreshAge > a3)
    self->_cacheEntryRefreshAge = a3;
  -[CNUIUserActionListDataSource makeCacheAndTransferContents](self, "makeCacheAndTransferContents");
}

- (void)makeCacheAndTransferContents
{
  CNUIUserActionListDataSource *v2;
  CNUIUserActionListModelCache *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  CNUIUserActionListModelCache *models;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  -[CNUIUserActionListDataSource makeCacheWithCurrentSettings](v2, "makeCacheWithCurrentSettings");
  v3 = (CNUIUserActionListModelCache *)objc_claimAutoreleasedReturnValue();
  -[CNCache allKeys](v2->_models, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_take:", v2->_cacheCapacity);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[CNCache objectForKeyedSubscript:](v2->_models, "objectForKeyedSubscript:", v10, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNCache setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, v10);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  models = v2->_models;
  v2->_models = v3;

  objc_sync_exit(v2);
}

- (void)setTracksChanges:(BOOL)a3
{
  self->_tracksChanges = a3;
}

- (id)actionTypesForConsumer:(id)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "allActionTypes");
}

- (id)consumer:(id)a3 imageForActionType:(id)a4
{
  return +[_CNUIUserActionImageProvider imageForActionType:imageStyle:](_CNUIUserActionImageProvider, "imageForActionType:imageStyle:", a4, 0);
}

- (void)refreshEntry:(id)a3 contact:(id)a4 actionType:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend((id)objc_opt_class(), "os_log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v9, "shortDebugDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v10;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_1DD140000, v11, OS_LOG_TYPE_INFO, "Will refresh %{public}@ actions for %@ (%@)", (uint8_t *)&v14, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionListDataSource resolveCacheEntry:contact:actionType:defaultActionItem:qualityOfService:](self, "resolveCacheEntry:contact:actionType:defaultActionItem:qualityOfService:", v8, v9, v10, v13, 0);

}

- (id)thirdPartyTargetsForActionTypes:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNUIUserActionListDataSource modeler](self, "modeler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "thirdPartyTargetsForActionTypes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)thirdPartyActionsForContactProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNUIUserActionListDataSource modeler](self, "modeler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "thirdPartyActionsForContactProperty:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)thirdPartyActionsForContact:(id)a3 propertyKey:(id)a4 identifier:(id)a5
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C97280], "contactPropertyWithContactNoCopy:propertyKey:identifier:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionListDataSource thirdPartyActionsForContactProperty:](self, "thirdPartyActionsForContactProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)actionTypesToUpdateForSelectedItem:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "shouldCurateIfPerformed"))
  {
    v4 = *MEMORY[0x1E0C965F8];
    v9[0] = *MEMORY[0x1E0C96620];
    v9[1] = v4;
    v9[2] = *MEMORY[0x1E0C96658];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)consumer:(id)a3 didSelectItem:(id)a4 forContact:(id)a5 actionType:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  CNUIUserActionListDataSource *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (objc_msgSend((id)objc_opt_class(), "isSupportedActionType:", v11))
  {
    v25 = v11;
    -[CNUIUserActionListDataSource actionTypesToUpdateForSelectedItem:](self, "actionTypesToUpdateForSelectedItem:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v28 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    if (v28)
    {
      v27 = *(_QWORD *)v30;
      v26 = self;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v30 != v27)
            objc_enumerationMutation(v12);
          v14 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          +[CNUIUserActionCacheKeyGenerator keyForContact:actionType:](CNUIUserActionCacheKeyGenerator, "keyForContact:actionType:", v10, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNUIUserActionListDataSource models](self, "models");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v17, "currentValue");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "defaultAction");
            v19 = (id)objc_claimAutoreleasedReturnValue();

            if (v19 != v9)
            {
              objc_msgSend((id)objc_opt_class(), "os_log");
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v10, "shortDebugDescription");
                v21 = v10;
                v22 = v12;
                v23 = v9;
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v34 = v14;
                v35 = 2112;
                v36 = v17;
                v37 = 2112;
                v38 = v24;
                v39 = 2112;
                v40 = v23;
                _os_log_impl(&dword_1DD140000, v20, OS_LOG_TYPE_INFO, "Will refresh cache of %{public}@ actions for %@ (%@) in response to user selecting %@ action", buf, 0x2Au);

                v9 = v23;
                v12 = v22;
                v10 = v21;
                self = v26;
              }

              -[CNUIUserActionListDataSource resolveCacheEntry:contact:actionType:defaultActionItem:qualityOfService:](self, "resolveCacheEntry:contact:actionType:defaultActionItem:qualityOfService:", v17, v10, v14, v9, 4);
            }

          }
        }
        v28 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
      }
      while (v28);
    }

    v11 = v25;
  }

}

- (void)resolveCacheEntry:(id)a3 contact:(id)a4 actionType:(id)a5 defaultActionItem:(id)a6 qualityOfService:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  CNScheduler *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  CNScheduler *resolutionScheduler;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  CNScheduler *v26;
  _QWORD v27[4];
  CNScheduler *v28;
  CNUIUserActionListDataSource *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  BOOL v36;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = self->_resolutionScheduler;
  -[CNScheduler timestamp](v16, "timestamp");
  v18 = v17;
  objc_msgSend(v13, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  resolutionScheduler = self->_resolutionScheduler;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __104__CNUIUserActionListDataSource_resolveCacheEntry_contact_actionType_defaultActionItem_qualityOfService___block_invoke;
  v27[3] = &unk_1EA6040C0;
  v35 = v18;
  v28 = v16;
  v29 = self;
  v30 = v14;
  v31 = v12;
  v32 = v13;
  v33 = v15;
  v36 = a7 == 4;
  v34 = v19;
  v21 = v19;
  v22 = v15;
  v23 = v13;
  v24 = v12;
  v25 = v14;
  v26 = v16;
  -[CNScheduler performBlock:qualityOfService:](resolutionScheduler, "performBlock:qualityOfService:", v27, a7);

}

void __104__CNUIUserActionListDataSource_resolveCacheEntry_contact_actionType_defaultActionItem_qualityOfService___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  v3 = v2;
  objc_msgSend(MEMORY[0x1E0D13BB0], "stringForTimeInterval:", v2 - *(double *)(a1 + 88));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "os_log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 64), "shortDebugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v30 = v6;
    v31 = 2112;
    v32 = v7;
    v33 = 2112;
    v34 = v4;
    v35 = 2112;
    v36 = v8;
    _os_log_impl(&dword_1DD140000, v5, OS_LOG_TYPE_INFO, "Performing resolution of %{public}@ actions for %@ (scheduling latency %@) (%@)", buf, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 40), "makeModelObservableForContact:actionType:defaultActionItem:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __104__CNUIUserActionListDataSource_resolveCacheEntry_contact_actionType_defaultActionItem_qualityOfService___block_invoke_69;
  v25[3] = &unk_1EA604098;
  v11 = *(void **)(a1 + 48);
  v25[4] = *(_QWORD *)(a1 + 40);
  v26 = v11;
  v27 = *(id *)(a1 + 64);
  v28 = *(id *)(a1 + 56);
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v25);
  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  objc_msgSend(MEMORY[0x1E0D13BB0], "stringForTimeInterval:", v12 - v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "os_log");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 64), "shortDebugDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v15;
    v31 = 2112;
    v32 = v16;
    v33 = 2114;
    v34 = v13;
    _os_log_impl(&dword_1DD140000, v14, OS_LOG_TYPE_INFO, "%{public}@ actions discovered for %@ in %{public}@", buf, 0x20u);

  }
  if (*(_BYTE *)(a1 + 96))
  {
    objc_msgSend(*(id *)(a1 + 40), "delegates");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 80));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(*(id *)(a1 + 40), "delegates");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 80));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v10;
      v22[1] = 3221225472;
      v22[2] = __104__CNUIUserActionListDataSource_resolveCacheEntry_contact_actionType_defaultActionItem_qualityOfService___block_invoke_71;
      v22[3] = &unk_1EA604070;
      v21 = *(void **)(a1 + 48);
      v22[4] = *(_QWORD *)(a1 + 40);
      v23 = v21;
      v24 = *(id *)(a1 + 80);
      objc_msgSend(v20, "_cn_each:", v22);

    }
  }

}

void __104__CNUIUserActionListDataSource_resolveCacheEntry_contact_actionType_defaultActionItem_qualityOfService___block_invoke_69(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "os_log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "shortDebugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543874;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_1DD140000, v4, OS_LOG_TYPE_INFO, "Found %{public}@ actions for %@: %@", (uint8_t *)&v7, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 56), "updateValue:", v3);

}

uint64_t __104__CNUIUserActionListDataSource_resolveCacheEntry_contact_actionType_defaultActionItem_qualityOfService___block_invoke_71(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "userActionListDataSource:didResolveInitialActionsForActionType:contactIdentifier:", a1[4], a1[5], a1[6]);
}

- (id)makeModelObservableForContact:(id)a3 actionType:(id)a4 defaultActionItem:(id)a5
{
  id v8;
  id v9;
  id v10;
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

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13830] + 16))())
  {
    -[CNUIUserActionListDataSource modeler](self, "modeler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "modelsWithContact:actionType:defaultActionItem:", v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0D13AE8];
    +[CNUIUserActionListModel emptyModel](CNUIUserActionListModel, "emptyModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "observableWithResult:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "onEmpty:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0D13AE8];
    +[CNUIUserActionListModel emptyModel](CNUIUserActionListModel, "emptyModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "observableWithResult:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[CNUIUserActionListDataSource schedulerProvider](self, "schedulerProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "backgroundScheduler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "subscribeOn:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)registerDelegate:(id)a3 withContactIdenfier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[CNUIUserActionListDataSource delegates](self, "delegates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:onCacheMiss:", v6, &__block_literal_global_73);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObject:", v7);
}

uint64_t __69__CNUIUserActionListDataSource_registerDelegate_withContactIdenfier___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C99E20], "set");
}

- (void)unregisterDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[CNUIUserActionListDataSource delegates](self, "delegates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__CNUIUserActionListDataSource_unregisterDelegate___block_invoke;
  v8[3] = &unk_1EA604128;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "_cn_each:", v8);

}

uint64_t __51__CNUIUserActionListDataSource_unregisterDelegate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObject:", *(_QWORD *)(a1 + 32));
}

- (CNScheduler)resolutionScheduler
{
  return self->_resolutionScheduler;
}

- (BOOL)tracksChanges
{
  return self->_tracksChanges;
}

- (void)setModels:(id)a3
{
  objc_storeStrong((id *)&self->_models, a3);
}

- (void)setModeler:(id)a3
{
  objc_storeStrong((id *)&self->_modeler, a3);
}

- (CNCache)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_delegates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_modeler, 0);
  objc_storeStrong((id *)&self->_models, 0);
  objc_storeStrong((id *)&self->_resolutionScheduler, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
}

- (void)modelsForContact:actionType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1DD140000, v0, v1, "Will refresh actions for contact (entry: %@)", v2);
  OUTLINED_FUNCTION_2();
}

- (void)modelsForContact:(NSObject *)a3 actionType:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_4(&dword_1DD140000, a3, (uint64_t)a3, "Age of cache entry: %@", (uint8_t *)a2);

}

- (void)modelsForContact:actionType:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1DD140000, v0, v1, "Will perform first resolution for contact (entry: %@)", v2);
  OUTLINED_FUNCTION_2();
}

- (void)modelsForContact:actionType:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1DD140000, v0, v1, "Cache key: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)modelsForContact:(void *)a1 actionType:.cold.5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortDebugDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_1DD140000, v2, v3, "New Request for %@ (data source: %@)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_3();
}

void __60__CNUIUserActionListDataSource_modelsForContact_actionType___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 48), "shortDebugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1(&dword_1DD140000, v1, v2, "Cache miss for %@ (%@)", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_2_3();
}

@end
