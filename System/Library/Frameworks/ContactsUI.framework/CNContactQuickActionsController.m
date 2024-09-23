@implementation CNContactQuickActionsController

- (CNContactQuickActionsController)init
{
  CNContactQuickActionsController *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNContactQuickActionsController)initWithActionTypes:(id)a3 contactQuickActionViewContainer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CNContactQuickActionsController *v9;

  v6 = a4;
  v7 = a3;
  +[CNContactQuickActionsDisambiguationMenuPresentation defaultPresentation](CNContactQuickActionsDisambiguationMenuPresentation, "defaultPresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNContactQuickActionsController initWithActionTypes:contactQuickActionViewContainer:disambiguationMenuPresentation:](self, "initWithActionTypes:contactQuickActionViewContainer:disambiguationMenuPresentation:", v7, v6, v8);

  return v9;
}

- (CNContactQuickActionsController)initWithActionTypes:(id)a3 contactQuickActionViewContainer:(id)a4 disambiguationMenuPresentation:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  CNContactQuickActionsController *v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "sharedDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "defaultSchedulerProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(MEMORY[0x1E0D13D70]);
  v15 = -[CNContactQuickActionsController initWithActionTypes:contactQuickActionViewContainer:disambiguationMenuPresentation:userActionListDataSource:schedulerProvider:userActionContext:](self, "initWithActionTypes:contactQuickActionViewContainer:disambiguationMenuPresentation:userActionListDataSource:schedulerProvider:userActionContext:", v10, v9, v8, v11, v13, v14);

  return v15;
}

- (CNContactQuickActionsController)initWithActionTypes:(id)a3 contactQuickActionViewContainer:(id)a4 disambiguationMenuPresentation:(id)a5 userActionListDataSource:(id)a6 schedulerProvider:(id)a7 userActionContext:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  CNContactQuickActionsController *v22;
  CNContactQuickActionsController *v23;
  uint64_t v24;
  NSDictionary *actionListModelsByActionType;
  CNContactQuickActionsController *v26;
  void *v28;
  uint64_t v29;
  const __CFString *v30;
  id v31;
  void *v32;
  id obj;
  id v35;
  objc_super v36;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  obj = a7;
  v19 = a7;
  v35 = a8;
  v20 = a8;
  if (!v15)
  {
    v28 = (void *)MEMORY[0x1E0C99DA0];
    v29 = *MEMORY[0x1E0C99778];
    v30 = CFSTR("parameter ‘actionTypes’ must be nonnull");
    goto LABEL_16;
  }
  if (!v16)
  {
    v28 = (void *)MEMORY[0x1E0C99DA0];
    v29 = *MEMORY[0x1E0C99778];
    v30 = CFSTR("parameter ‘contactQuickActionViewContainer’ must be nonnull");
    goto LABEL_16;
  }
  if (!v17)
  {
    v28 = (void *)MEMORY[0x1E0C99DA0];
    v29 = *MEMORY[0x1E0C99778];
    v30 = CFSTR("parameter ‘disambiguationMenuPresentation’ must be nonnull");
    goto LABEL_16;
  }
  if (!v18)
  {
    v28 = (void *)MEMORY[0x1E0C99DA0];
    v29 = *MEMORY[0x1E0C99778];
    v30 = CFSTR("parameter ‘userActionListDataSource’ must be nonnull");
    goto LABEL_16;
  }
  if (!v19)
  {
    v28 = (void *)MEMORY[0x1E0C99DA0];
    v29 = *MEMORY[0x1E0C99778];
    v30 = CFSTR("parameter ‘schedulerProvider’ must be nonnull");
LABEL_16:
    objc_msgSend(v28, "exceptionWithName:reason:userInfo:", v29, v30, 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v31);
  }
  v21 = v20;
  if (!objc_msgSend(v15, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactQuickActionsController.m"), 100, CFSTR("actionTypes should contain at least one action type"));

  }
  v36.receiver = self;
  v36.super_class = (Class)CNContactQuickActionsController;
  v22 = -[CNContactQuickActionsController init](&v36, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_actionTypes, a3);
    objc_storeWeak((id *)&v23->_contactQuickActionViewContainer, v16);
    objc_storeStrong((id *)&v23->_userActionListDataSource, a6);
    objc_storeStrong((id *)&v23->_disambiguationMenuPresentation, a5);
    objc_storeStrong((id *)&v23->_schedulerProvider, obj);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v24 = objc_claimAutoreleasedReturnValue();
    actionListModelsByActionType = v23->_actionListModelsByActionType;
    v23->_actionListModelsByActionType = (NSDictionary *)v24;

    objc_storeStrong((id *)&v23->_userActionContext, v35);
    v26 = v23;
  }

  return v23;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[CNContactQuickActionsController userActionListDataSource](self, "userActionListDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterDelegate:", self);

  -[CNContactQuickActionsController actionDiscoveryToken](self, "actionDiscoveryToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  -[CNContactQuickActionsController setActionDiscoveryToken:](self, "setActionDiscoveryToken:", 0);
  v5.receiver = self;
  v5.super_class = (Class)CNContactQuickActionsController;
  -[CNContactQuickActionsController dealloc](&v5, sel_dealloc);
}

- (void)setNavigationListStyle:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_navigationListStyle, a3);
  v5 = a3;
  -[CNContactQuickActionsController disambiguationMenuController](self, "disambiguationMenuController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNavigationListStyle:", v5);

}

- (void)setContact:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_contact, a3);
  objc_msgSend((id)objc_opt_class(), "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_18AC56000, v6, OS_LOG_TYPE_INFO, "kicking off action discovery by setting contact with identifier %@", (uint8_t *)&v8, 0xCu);

  }
  -[CNContactQuickActionsController cleanUpAfterLatestActionDiscovery](self, "cleanUpAfterLatestActionDiscovery");
  -[CNContactQuickActionsController discoverActions](self, "discoverActions");

}

- (void)cleanUpAfterLatestActionDiscovery
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  objc_msgSend((id)objc_opt_class(), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_18AC56000, v3, OS_LOG_TYPE_DEBUG, "cleaning up after latest action discovery", v7, 2u);
  }

  -[CNContactQuickActionsController userActionListDataSource](self, "userActionListDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterDelegate:", self);

  -[CNContactQuickActionsController actionDiscoveryToken](self, "actionDiscoveryToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  -[CNContactQuickActionsController setActionDiscoveryToken:](self, "setActionDiscoveryToken:", 0);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactQuickActionsController setActionListModelsByActionType:](self, "setActionListModelsByActionType:", v6);

}

- (void)discoverActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
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
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  CNContactQuickActionsController *v25;
  uint64_t *v26;
  id v27;
  uint64_t v28;
  id *v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  id location;
  uint8_t buf[4];
  CNContactQuickActionsController *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[CNContactQuickActionsController contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNContactQuickActionsController userActionListDataSource](self, "userActionListDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactQuickActionsController contact](self, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerDelegate:withContactIdenfier:", self, v6);

    objc_initWeak(&location, self);
    v28 = 0;
    v29 = (id *)&v28;
    v30 = 0x3042000000;
    v31 = __Block_byref_object_copy__31388;
    v32 = __Block_byref_object_dispose__31389;
    v33 = 0;
    objc_msgSend((id)objc_opt_class(), "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      -[CNContactQuickActionsController contact](self, "contact");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "shortDebugDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v36 = self;
      v37 = 2112;
      v38 = v20;
      _os_log_debug_impl(&dword_18AC56000, v7, OS_LOG_TYPE_DEBUG, "%@ subscribing action discovering requests for contact %@.", buf, 0x16u);

    }
    -[CNContactQuickActionsController allModelsObservable](self, "allModelsObservable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactQuickActionsController schedulerProvider](self, "schedulerProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "backgroundScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subscribeOn:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0D13AF0];
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __50__CNContactQuickActionsController_discoverActions__block_invoke;
    v24 = &unk_1E204BF50;
    v25 = self;
    objc_copyWeak(&v27, &location);
    v26 = &v28;
    objc_msgSend(v12, "observerWithResultBlock:", &v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subscribe:", v13, v21, v22, v23, v24, v25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactQuickActionsController setActionDiscoveryToken:](self, "setActionDiscoveryToken:", v14);

    -[CNContactQuickActionsController actionDiscoveryToken](self, "actionDiscoveryToken");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(v29 + 5, v15);

    objc_destroyWeak(&v27);
    _Block_object_dispose(&v28, 8);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  else
  {
    -[CNContactQuickActionsController actionTypes](self, "actionTypes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_cn_indexBy:", *MEMORY[0x1E0D137E0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_cn_map:", &__block_literal_global_51);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactQuickActionsController setActionListModelsByActionType:](self, "setActionListModelsByActionType:", v18);

    -[CNContactQuickActionsController reportStoredModelsToQuickActionContainer](self, "reportStoredModelsToQuickActionContainer");
  }
}

- (id)allModelsObservable
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[CNContactQuickActionsController actionTypes](self, "actionTypes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v13;
    _os_log_debug_impl(&dword_18AC56000, v3, OS_LOG_TYPE_DEBUG, "Action types: %@", buf, 0xCu);

  }
  -[CNContactQuickActionsController actionTypes](self, "actionTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__CNContactQuickActionsController_allModelsObservable__block_invoke;
  v14[3] = &unk_1E204F4C8;
  v14[4] = self;
  objc_msgSend(v4, "_cn_map:", v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D13AE8];
  -[CNContactQuickActionsController schedulerProvider](self, "schedulerProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "merge:schedulerProvider:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "scan:seed:", &__block_literal_global_37_31382, MEMORY[0x1E0C9AA70]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactQuickActionsController schedulerProvider](self, "schedulerProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "throttle:schedulerProvider:", v10, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)processDiscoveredModels:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[CNContactQuickActionsController contact](self, "contact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shortDebugDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v10;
    v13 = 2112;
    v14 = v4;
    _os_log_debug_impl(&dword_18AC56000, v5, OS_LOG_TYPE_DEBUG, "for contact: %@, discovered actions %@", (uint8_t *)&v11, 0x16u);

  }
  -[CNContactQuickActionsController storeDiscoveredModels:](self, "storeDiscoveredModels:", v4);
  -[CNContactQuickActionsController reportStoredModelsToQuickActionContainer](self, "reportStoredModelsToQuickActionContainer");
  -[CNContactQuickActionsController modelTrackingDelegate](self, "modelTrackingDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CNContactQuickActionsController modelTrackingDelegate](self, "modelTrackingDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "quickActionsControllerDidUpdateActionModels");

  }
}

- (void)storeDiscoveredModels:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNContactQuickActionsController actionListModelsByActionType](self, "actionListModelsByActionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "addEntriesFromDictionary:", v4);
  -[CNContactQuickActionsController setActionListModelsByActionType:](self, "setActionListModelsByActionType:", v6);

}

- (void)reportStoredModelsToQuickActionContainer
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CNContactQuickActionsController actionListModelsByActionType](self, "actionListModelsByActionType", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        -[CNContactQuickActionsController actionListModelsByActionType](self, "actionListModelsByActionType");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactQuickActionsController contactQuickActionViewContainer](self, "contactQuickActionViewContainer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactQuickActionsController reportStoredModel:forActionType:toQuickActionContainer:](self, "reportStoredModel:forActionType:toQuickActionContainer:", v11, v9, v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)reportStoredModel:(id)a3 forActionType:(id)a4 toQuickActionContainer:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a4;
  v9 = a3;
  objc_msgSend(a5, "viewForActionType:", v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEnabled:", objc_msgSend(v9, "isEmpty") ^ 1);
  -[CNContactQuickActionsController userActionListDataSource](self, "userActionListDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultAction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "consumer:localizedDisplayNameForButtonWithDefaultAction:actionType:", self, v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setTitle:", v12);
}

- (id)defaultTitleForActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNContactQuickActionsController userActionListDataSource](self, "userActionListDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "consumer:localizedButtonDisplayNameForActionType:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)executeTapBehaviorWithoutDisambiguationForActionType:(id)a3
{
  -[CNContactQuickActionsController executeTapBehaviorForActionType:shouldFallbackToDisambiguationMenu:](self, "executeTapBehaviorForActionType:shouldFallbackToDisambiguationMenu:", a3, 0);
}

- (void)executeTapBehaviorForActionType:(id)a3
{
  -[CNContactQuickActionsController executeTapBehaviorForActionType:shouldFallbackToDisambiguationMenu:](self, "executeTapBehaviorForActionType:shouldFallbackToDisambiguationMenu:", a3, 1);
}

- (void)executeTapBehaviorForActionType:(id)a3 shouldFallbackToDisambiguationMenu:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v4 = a4;
  v14 = a3;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("parameter ‘actionType’ must be nonnull"), 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v13);
  }
  -[CNContactQuickActionsController actionTypes](self, "actionTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v14);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactQuickActionsController.m"), 272, CFSTR("actionType must be a member of actionTypes provided to the initializer"));

  }
  if (-[CNContactQuickActionsController hasDefaultActionForActionType:](self, "hasDefaultActionForActionType:", v14))
  {
    -[CNContactQuickActionsController actionListModelsByActionType](self, "actionListModelsByActionType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "defaultAction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactQuickActionsController performAction:](self, "performAction:", v11);

  }
  else if (v4)
  {
    -[CNContactQuickActionsController showDisambiguationMenuForActionType:](self, "showDisambiguationMenuForActionType:", v14);
  }

}

- (BOOL)hasDefaultActionForActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CNContactQuickActionsController actionListModelsByActionType](self, "actionListModelsByActionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "defaultAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = v7 != 0;

  return (char)v4;
}

- (void)performAction:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_impl(&dword_18AC56000, v5, OS_LOG_TYPE_INFO, "executing action %@", (uint8_t *)&v13, 0xCu);
  }

  -[CNContactQuickActionsController contactQuickActionViewContainer](self, "contactQuickActionViewContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == 3)
  {
    objc_msgSend((Class)getFBSOpenApplicationServiceClass[0](), "dashboardEndpoint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactQuickActionsController userActionContext](self, "userActionContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setConnectionEndpoint:", v9);

  }
  -[CNContactQuickActionsController userActionContext](self, "userActionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v4, "performActionWithContext:", v11);

}

- (void)executeLongPressBehaviorForActionType:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("parameter ‘actionType’ must be nonnull"), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  -[CNContactQuickActionsController actionTypes](self, "actionTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v9);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactQuickActionsController.m"), 302, CFSTR("actionType must be a member of actionTypes provided to the initializer"));

  }
  -[CNContactQuickActionsController showDisambiguationMenuForActionType:](self, "showDisambiguationMenuForActionType:", v9);

}

- (void)showDisambiguationMenuForActionType:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_18AC56000, v6, OS_LOG_TYPE_INFO, "showing disambiguation menu", v11, 2u);
  }

  -[CNContactQuickActionsController disambiguationMenuController](self, "disambiguationMenuController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactQuickActionsController.m"), 310, CFSTR("disambiguation menu is already being presented"));

  }
  -[CNContactQuickActionsController setupDisambiguationMenuForActionType:](self, "setupDisambiguationMenuForActionType:", v5);
  -[CNContactQuickActionsController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactQuickActionsController disambiguationMenuViewController](self, "disambiguationMenuViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contactQuickActionsController:presentDisambiguationViewController:forActionType:", self, v9, v5);

}

- (void)setupDisambiguationMenuForActionType:(id)a3
{
  id v4;
  CNContactActionsController *v5;
  void *v6;
  void *v7;
  void *v8;
  CNContactActionsController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [CNContactActionsController alloc];
  -[CNContactQuickActionsController contact](self, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactQuickActionsController userActionListDataSource](self, "userActionListDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNContactActionsController initWithContact:dataSource:actionTypes:](v5, "initWithContact:dataSource:actionTypes:", v6, v7, v8);
  -[CNContactQuickActionsController setDisambiguationMenuController:](self, "setDisambiguationMenuController:", v9);

  -[CNContactQuickActionsController disambiguationMenuController](self, "disambiguationMenuController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

  -[CNContactQuickActionsController navigationListStyle](self, "navigationListStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CNContactQuickActionsController navigationListStyle](self, "navigationListStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactQuickActionsController disambiguationMenuController](self, "disambiguationMenuController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNavigationListStyle:", v12);

  }
  -[CNContactQuickActionsController contactQuickActionViewContainer](self, "contactQuickActionViewContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "viewForActionType:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactQuickActionsController disambiguationMenuPresentation](self, "disambiguationMenuPresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactQuickActionsController disambiguationMenuController](self, "disambiguationMenuController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __72__CNContactQuickActionsController_setupDisambiguationMenuForActionType___block_invoke;
  v19[3] = &unk_1E204F648;
  v19[4] = self;
  objc_msgSend(v16, "viewControllerForPresentingActionsController:fromView:dismissDisambiguationMenuHandler:", v17, v15, v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactQuickActionsController setDisambiguationMenuViewController:](self, "setDisambiguationMenuViewController:", v18);

}

- (void)tearDownDisambiguationMenu
{
  -[CNContactQuickActionsController setDisambiguationMenuController:](self, "setDisambiguationMenuController:", 0);
  -[CNContactQuickActionsController setDisambiguationMenuViewController:](self, "setDisambiguationMenuViewController:", 0);
}

- (void)disambiguationViewControllerDismissedExternally:(id)a3
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  -[CNContactQuickActionsController disambiguationMenuViewController](self, "disambiguationMenuViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactQuickActionsController.m"), 339, CFSTR("disambiguationViewController must be presented first in order to be dismissed"));

  }
  -[CNContactQuickActionsController tearDownDisambiguationMenu](self, "tearDownDisambiguationMenu");
}

- (id)disambiguationMenuForActionType:(id)a3
{
  void *v4;
  void *v5;

  -[CNContactQuickActionsController setupDisambiguationMenuForActionType:](self, "setupDisambiguationMenuForActionType:", a3);
  -[CNContactQuickActionsController currentMenuElements](self, "currentMenuElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  -[CNContactQuickActionsController tearDownDisambiguationMenu](self, "tearDownDisambiguationMenu");
  return v5;
}

- (void)contactActionsController:(id)a3 didSelectAction:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v16 = 138412290;
    v17 = v6;
    _os_log_impl(&dword_18AC56000, v8, OS_LOG_TYPE_INFO, "disambiguation menu selected action %@", (uint8_t *)&v16, 0xCu);
  }

  -[CNContactQuickActionsController performAction:](self, "performAction:", v6);
  objc_msgSend(v7, "actionTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactQuickActionsController userActionListDataSource](self, "userActionListDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactQuickActionsController contact](self, "contact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "consumer:didSelectItem:forContact:actionType:", self, v6, v12, v10);

  -[CNContactQuickActionsController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactQuickActionsController disambiguationMenuViewController](self, "disambiguationMenuViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "type");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contactQuickActionsController:dismissDisambiguationViewController:forActionType:", self, v14, v15);

  -[CNContactQuickActionsController tearDownDisambiguationMenu](self, "tearDownDisambiguationMenu");
}

- (void)contactActionsController:(id)a3 didUpdateWithMenu:(id)a4
{
  -[CNContactQuickActionsController setCurrentMenuElements:](self, "setCurrentMenuElements:", a4);
}

- (void)userActionListDataSource:(id)a3 willResolveInitialActionsForActionType:(id)a4 contactIdentifier:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v14 = a4;
  v7 = a5;
  -[CNContactQuickActionsController contact](self, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", v7);

  if (v10)
  {
    -[CNContactQuickActionsController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[CNContactQuickActionsController delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "quickActionsController:willResolveInitialActionsForActionType:", self, v14);

    }
  }

}

- (void)userActionListDataSource:(id)a3 didResolveInitialActionsForActionType:(id)a4 contactIdentifier:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v14 = a4;
  v7 = a5;
  -[CNContactQuickActionsController contact](self, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", v7);

  if (v10)
  {
    -[CNContactQuickActionsController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[CNContactQuickActionsController delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "quickActionsController:didResolveInitialActionsForActionType:", self, v14);

    }
  }

}

- (CNContactQuickActionViewContainer)contactQuickActionViewContainer
{
  return (CNContactQuickActionViewContainer *)objc_loadWeakRetained((id *)&self->_contactQuickActionViewContainer);
}

- (CNContactQuickActionsControllerDelegate)delegate
{
  return (CNContactQuickActionsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)actionTypes
{
  return self->_actionTypes;
}

- (CNContact)contact
{
  return self->_contact;
}

- (CNUIUserActionListDataSource)userActionListDataSource
{
  return self->_userActionListDataSource;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNCancelable)actionDiscoveryToken
{
  return self->_actionDiscoveryToken;
}

- (void)setActionDiscoveryToken:(id)a3
{
  objc_storeStrong((id *)&self->_actionDiscoveryToken, a3);
}

- (NSDictionary)actionListModelsByActionType
{
  return self->_actionListModelsByActionType;
}

- (void)setActionListModelsByActionType:(id)a3
{
  objc_storeStrong((id *)&self->_actionListModelsByActionType, a3);
}

- (CNUIUserActionContext)userActionContext
{
  return self->_userActionContext;
}

- (CNContactActionsController)disambiguationMenuController
{
  return self->_disambiguationMenuController;
}

- (void)setDisambiguationMenuController:(id)a3
{
  objc_storeStrong((id *)&self->_disambiguationMenuController, a3);
}

- (UIViewController)disambiguationMenuViewController
{
  return self->_disambiguationMenuViewController;
}

- (void)setDisambiguationMenuViewController:(id)a3
{
  objc_storeStrong((id *)&self->_disambiguationMenuViewController, a3);
}

- (CNContactQuickActionsDisambiguationMenuPresentation)disambiguationMenuPresentation
{
  return self->_disambiguationMenuPresentation;
}

- (NSArray)currentMenuElements
{
  return self->_currentMenuElements;
}

- (void)setCurrentMenuElements:(id)a3
{
  objc_storeStrong((id *)&self->_currentMenuElements, a3);
}

- (CNUINavigationListStyle)navigationListStyle
{
  return self->_navigationListStyle;
}

- (CNContactQuickActionsModelTrackingDelegate)modelTrackingDelegate
{
  return (CNContactQuickActionsModelTrackingDelegate *)objc_loadWeakRetained((id *)&self->_modelTrackingDelegate);
}

- (void)setModelTrackingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_modelTrackingDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_modelTrackingDelegate);
  objc_storeStrong((id *)&self->_navigationListStyle, 0);
  objc_storeStrong((id *)&self->_currentMenuElements, 0);
  objc_storeStrong((id *)&self->_disambiguationMenuPresentation, 0);
  objc_storeStrong((id *)&self->_disambiguationMenuViewController, 0);
  objc_storeStrong((id *)&self->_disambiguationMenuController, 0);
  objc_storeStrong((id *)&self->_userActionContext, 0);
  objc_storeStrong((id *)&self->_actionListModelsByActionType, 0);
  objc_storeStrong((id *)&self->_actionDiscoveryToken, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_userActionListDataSource, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_actionTypes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_contactQuickActionViewContainer);
}

uint64_t __72__CNContactQuickActionsController_setupDisambiguationMenuForActionType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "tearDownDisambiguationMenu");
}

id __54__CNContactQuickActionsController_allModelsObservable__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "userActionListDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "consumer:actionModelsForContact:actionType:", 0, v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__CNContactQuickActionsController_allModelsObservable__block_invoke_2;
  v10[3] = &unk_1E204BF78;
  v11 = v3;
  v7 = v3;
  objc_msgSend(v6, "map:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __54__CNContactQuickActionsController_allModelsObservable__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithDictionary:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "second");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "first");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, v8);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __54__CNContactQuickActionsController_allModelsObservable__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D13AF8], "pairWithFirst:second:", *(_QWORD *)(a1 + 32), a2);
}

void __50__CNContactQuickActionsController_discoverActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "schedulerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainThreadScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__CNContactQuickActionsController_discoverActions__block_invoke_2;
  v7[3] = &unk_1E204F580;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  v9 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v8 = v6;
  objc_msgSend(v5, "performBlock:", v7);

  objc_destroyWeak(&v10);
}

void __50__CNContactQuickActionsController_discoverActions__block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  if (v2)
  {
    objc_msgSend(WeakRetained, "actionDiscoveryToken");
    v3 = (id)objc_claimAutoreleasedReturnValue();

    if (v3 == v2)
      objc_msgSend(WeakRetained, "processDiscoveredModels:", *(_QWORD *)(a1 + 32));
  }

}

+ (OS_os_log)log
{
  if (log_cn_once_token_2[0] != -1)
    dispatch_once(log_cn_once_token_2, &__block_literal_global_31426);
  return (OS_os_log *)(id)log_cn_once_object_2;
}

+ (CNKeyDescriptor)descriptorForRequiredKeys
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0D13D88], "descriptorForRequiredKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContactQuickActionsController descriptorForRequiredKeys]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithKeyDescriptors:description:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNKeyDescriptor *)v6;
}

+ (id)sharedDataSource
{
  if (sharedDataSource_cn_once_token_3[0] != -1)
    dispatch_once(sharedDataSource_cn_once_token_3, &__block_literal_global_29);
  return (id)sharedDataSource_cn_once_object_3;
}

void __51__CNContactQuickActionsController_sharedDataSource__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "actionDiscoveringEnvironment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13D88]), "initWithDiscoveringEnvironment:", v1);
  objc_msgSend(v2, "setTracksChanges:", 1);

  v3 = (void *)sharedDataSource_cn_once_object_3;
  sharedDataSource_cn_once_object_3 = (uint64_t)v2;

}

void __38__CNContactQuickActionsController_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.ui", "quick-actions");
  v1 = (void *)log_cn_once_object_2;
  log_cn_once_object_2 = (uint64_t)v0;

}

@end
