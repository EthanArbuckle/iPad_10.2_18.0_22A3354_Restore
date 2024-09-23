@implementation HUFeatureOnboarder

- (HUFeatureOnboarder)initWithFeatures:(id)a3 usageOptions:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  HUFeatureOnboarder *v9;

  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  objc_msgSend(v6, "arrayWithObject:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HUFeatureOnboarder initWithGroupedFeatures:usageOptions:](self, "initWithGroupedFeatures:usageOptions:", v8, v7);

  return v9;
}

- (HUFeatureOnboarder)initWithGroupedFeatures:(id)a3 usageOptions:(id)a4
{
  id v7;
  id v8;
  HUFeatureOnboarder *v9;
  uint64_t v10;
  NSMutableDictionary *userInputResults;
  uint64_t v12;
  NSMutableArray *allRemainingFlowGroups;
  void *v14;
  uint64_t v15;
  NAFuture *v16;
  NAFuture *completionFuture;
  id v18;
  void *v20;
  void *v21;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUFeatureOnboarder.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("featureGroups.count != 0"));

  }
  v22.receiver = self;
  v22.super_class = (Class)HUFeatureOnboarder;
  v9 = -[HUFeatureOnboarder init](&v22, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    userInputResults = v9->_userInputResults;
    v9->_userInputResults = (NSMutableDictionary *)v10;

    objc_storeStrong((id *)&v9->_initialUsageOptions, a4);
    -[HUFeatureOnboarder _subclass_buildAllFlowGroupsFromFeatureGroups:usageOptions:](v9, "_subclass_buildAllFlowGroupsFromFeatureGroups:usageOptions:", v7, v9->_initialUsageOptions);
    v12 = objc_claimAutoreleasedReturnValue();
    allRemainingFlowGroups = v9->_allRemainingFlowGroups;
    v9->_allRemainingFlowGroups = (NSMutableArray *)v12;

    -[HUFeatureOnboarder allRemainingFlowGroups](v9, "allRemainingFlowGroups");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("HUFeatureOnboarder.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.allRemainingFlowGroups.count != 0"));

    }
    v16 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    completionFuture = v9->_completionFuture;
    v9->_completionFuture = v16;

    if ((objc_msgSend(MEMORY[0x1E0D319D0], "isInternalTest") & 1) == 0)
    {
      v18 = objc_alloc_init(MEMORY[0x1E0CEA7B8]);
      -[HUFeatureOnboarder setNavController:](v9, "setNavController:", v18);

    }
  }

  return v9;
}

- (id)_subclass_buildAllFlowGroupsFromFeatureGroups:(id)a3 usageOptions:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUFeatureOnboarder.m"), 124, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HUFeatureOnboarder _subclass_buildAllFlowGroupsFromFeatureGroups:usageOptions:]", objc_opt_class());

  return 0;
}

- (id)getPostProcessingFlowsForResults:(id)a3
{
  return 0;
}

- (void)startOnboardingWithPresentingViewController:(id)a3 usageOptions:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15[2];
  id location;

  v7 = a3;
  v8 = a4;
  if (!v7 && (objc_msgSend(MEMORY[0x1E0D319D0], "isInternalTest") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUFeatureOnboarder.m"), 138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentingViewController != nil || [HFUtilities isInternalTest]"));

    if (!v8)
      goto LABEL_5;
    goto LABEL_4;
  }
  if (v8)
LABEL_4:
    -[HUFeatureOnboarder setInitialUsageOptions:](self, "setInitialUsageOptions:", v8);
LABEL_5:
  objc_initWeak(&location, self);
  -[HUFeatureOnboarder _findNextAppropriateFlowByRemovingFlow:currentOnboardingFlowClass:usageOptions:](self, "_findNextAppropriateFlowByRemovingFlow:currentOnboardingFlowClass:usageOptions:", 0, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__HUFeatureOnboarder_startOnboardingWithPresentingViewController_usageOptions___block_invoke;
  v13[3] = &unk_1E6F4FFE0;
  objc_copyWeak(v15, &location);
  v15[1] = (id)a2;
  v10 = v7;
  v14 = v10;
  v11 = (id)objc_msgSend(v9, "addCompletionBlock:", v13);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

}

void __79__HUFeatureOnboarder_startOnboardingWithPresentingViewController_usageOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HUFeatureOnboardingConfigurator *v12;
  void *v13;
  HUFeatureOnboardingConfigurator *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = v3;
  v6 = &unk_1EF261598;
  if (objc_msgSend(v5, "conformsToProtocol:", v6))
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v33 = WeakRetained;
    v34 = 2112;
    v35 = v10;
    v36 = 2112;
    v37 = v8;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@: Current Flow: %@", buf, 0x20u);

  }
  if (!v8)
  {
    HFLogForCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v33 = WeakRetained;
      v34 = 2112;
      v35 = v25;
      _os_log_impl(&dword_1B8E1E000, v24, OS_LOG_TYPE_DEFAULT, "%@:%@: None of the feature onboarding flows have work to do, so finishing", buf, 0x16u);

    }
    objc_msgSend(WeakRetained, "completionFuture");
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "userInputResults");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject finishWithResult:](v26, "finishWithResult:", v27);
    goto LABEL_20;
  }
  objc_msgSend(v8, "initialViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), WeakRetained, CFSTR("HUFeatureOnboarder.m"), 160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("currentFeatureOnboardingFlow.initialViewController"));

  }
  v12 = [HUFeatureOnboardingConfigurator alloc];
  objc_msgSend(v8, "initialViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HUConfigurator initWithConfiguratorDelegate:initialViewController:](v12, "initWithConfiguratorDelegate:initialViewController:", WeakRetained, v13);
  objc_msgSend(WeakRetained, "setConfigurator:", v14);

  objc_msgSend(WeakRetained, "configurator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "initialViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelegate:", v15);

  objc_msgSend(v8, "initialViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "set_currentViewControllerForTests:", v17);

  objc_msgSend(WeakRetained, "navController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v8, "initialViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "conformsToProtocol:", &unk_1EF230988);

    objc_msgSend(WeakRetained, "navController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "initialViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      v23 = (id)objc_msgSend(v21, "hu_pushPreloadableViewController:animated:", v22, 0);
    else
      objc_msgSend(v21, "pushViewController:animated:", v22, 0);

    if ((objc_msgSend(MEMORY[0x1E0D319D0], "isInternalTest") & 1) == 0)
    {
      v28 = *(void **)(a1 + 32);
      objc_msgSend(WeakRetained, "navController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "presentViewController:animated:completion:", v29, 1, 0);

    }
  }
  HFLogForCategory();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "initialViewController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v33 = WeakRetained;
    v34 = 2112;
    v35 = v27;
    v36 = 2112;
    v37 = v8;
    v38 = 2112;
    v39 = v30;
    _os_log_impl(&dword_1B8E1E000, v26, OS_LOG_TYPE_DEFAULT, "%@:%@: Starting feature onboarding with first flow: %@ & view controller %@", buf, 0x2Au);

LABEL_20:
  }

}

- (id)_findNextAppropriateFlowByRemovingFlow:(id)a3 currentOnboardingFlowClass:(Class)a4 usageOptions:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26[2];
  _QWORD v27[4];
  id v28;
  id v29;
  HUFeatureOnboarder *v30;
  SEL v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  Class v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[HUFeatureOnboarder allRemainingFlowGroups](self, "allRemainingFlowGroups");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v33 = v12;
    v34 = 2112;
    v35 = a4;
    _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "allRemainingFlowGroups: %@, currentOnboardingFlowClass: %@", buf, 0x16u);

  }
  -[HUFeatureOnboarder allRemainingFlowGroups](self, "allRemainingFlowGroups");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke;
  v27[3] = &unk_1E6F50058;
  v15 = v9;
  v28 = v15;
  v16 = v10;
  v29 = v16;
  v30 = self;
  v31 = a2;
  objc_msgSend(v13, "na_flatMap:", v27);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, self);
  v18 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "combineAllFutures:ignoringErrors:scheduler:", v17, 1, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  v24[1] = 3221225472;
  v24[2] = __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke_108;
  v24[3] = &unk_1E6F50108;
  objc_copyWeak(v26, (id *)buf);
  v26[1] = a4;
  v21 = v15;
  v25 = v21;
  objc_msgSend(v20, "flatMap:", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(v26);
  objc_destroyWeak((id *)buf);

  return v22;
}

id __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  __int128 v8;

  v3 = a2;
  if ((objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke_2;
    v6[3] = &unk_1E6F50030;
    v7 = *(id *)(a1 + 40);
    v8 = *(_OWORD *)(a1 + 48);
    objc_msgSend(v3, "na_map:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

id __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;

  v3 = a2;
  objc_msgSend(v3, "onboardingFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFinished");

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = (void *)objc_opt_class();
      objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "home");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_QWORD *)(a1 + 32))
        v10 = *(_QWORD *)(a1 + 32);
      else
        v10 = MEMORY[0x1E0C9AA70];
      objc_msgSend(v7, "needsOnboardingForHome:options:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = MEMORY[0x1E0C809B0];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke_3;
      v19[3] = &unk_1E6F50008;
      v13 = v3;
      v20 = v13;
      v21 = *(_OWORD *)(a1 + 40);
      objc_msgSend(v11, "flatMap:", v19);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v12;
      v16[1] = 3221225472;
      v16[2] = __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke_104;
      v16[3] = &unk_1E6F50008;
      v17 = v13;
      v18 = *(_OWORD *)(a1 + 40);
      objc_msgSend(v14, "flatMap:", v16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v6;
}

id __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke_3(uint64_t a1, void *a2)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "BOOLValue"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "readyFuture");
    else
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAB0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412802;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_debug_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEBUG, "%@:%@ checking if flow is ready %@", (uint8_t *)&v9, 0x20u);

    }
    return v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAA0]);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

id __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke_104(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412802;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_debug_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEBUG, "%@:%@ skipping flow (either doesn't need onboarding or is not ready): %@", (uint8_t *)&v9, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

id __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke_108(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  _QWORD v19[5];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke_2_109;
  v19[3] = &__block_descriptor_40_e35_B16__0___HUFeatureOnboardingFlow__8lu32l8;
  v19[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "na_firstObjectPassingTest:", v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_50);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    v21 = v6;
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "First unfinished flow: %@ (previous flow %@)", buf, 0x16u);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(WeakRetained, "allRemainingFlowGroups");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v5;
    v15 = 3221225472;
    v16 = __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke_113;
    v17 = &unk_1E6F500E0;
    v18 = *(id *)(a1 + 32);
    objc_msgSend(v9, "na_firstObjectPassingTest:", &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "allRemainingFlowGroups", v14, v15, v16, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", v10);

  }
  if (v6)
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v6);
  else
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

BOOL __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke_2_109(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _BOOL8 v7;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF261598))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v5;
  if (*(_QWORD *)(a1 + 32))
  {
    if (v5)
      v7 = objc_opt_class() == *(_QWORD *)(a1 + 32);
    else
      v7 = 0;
  }
  else
  {
    v7 = v5 != 0;
  }

  return v7;
}

BOOL __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke_3_112(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _BOOL8 v4;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EF261598))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3 != 0;

  return v4;
}

uint64_t __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke_113(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsObject:", *(_QWORD *)(a1 + 32));
}

- (void)_skipAnyFlowsNoLongerRequired
{
  void *v3;
  id v4;
  _QWORD v5[5];

  -[HUFeatureOnboarder allRemainingFlowGroups](self, "allRemainingFlowGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_arrayByFlattening");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__HUFeatureOnboarder__skipAnyFlowsNoLongerRequired__block_invoke;
  v5[3] = &unk_1E6F50130;
  v5[4] = self;
  objc_msgSend(v4, "na_each:", v5);

}

void __51__HUFeatureOnboarder__skipAnyFlowsNoLongerRequired__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "onboardingFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFinished");

  if ((v4 & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInputResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "checkIfStillRequiredFromCurrentResults:", v5);

  }
}

- (void)configuratorDidUpdateViewController:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  HUFeatureOnboarder *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = self;
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@: HUFeatureOnboardingConfigurator advanced to %@", (uint8_t *)&v18, 0x20u);

  }
  -[HUFeatureOnboarder configurator](self, "configurator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", v9);

  objc_msgSend(v5, "currentViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUFeatureOnboarder set_currentViewControllerForTests:](self, "set_currentViewControllerForTests:", v11);

  -[HUFeatureOnboarder navController](self, "navController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v5, "currentViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "conformsToProtocol:", &unk_1EF230988);

    -[HUFeatureOnboarder navController](self, "navController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v17 = (id)objc_msgSend(v15, "hu_pushPreloadableViewController:animated:", v16, 1);
    else
      objc_msgSend(v15, "pushViewController:animated:", v16, 1);

  }
}

- (void)configuratorDidFinish:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD block[5];
  uint8_t buf[4];
  HUFeatureOnboarder *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@: HUFeatureOnboardingConfigurator FINISHED", buf, 0x16u);

  }
  -[HUFeatureOnboarder navController](self, "navController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__HUFeatureOnboarder_configuratorDidFinish___block_invoke;
    block[3] = &unk_1E6F4D988;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  -[HUFeatureOnboarder set_currentViewControllerForTests:](self, "set_currentViewControllerForTests:", 0);
  -[HUFeatureOnboarder completionFuture](self, "completionFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUFeatureOnboarder userInputResults](self, "userInputResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "finishWithResult:", v9);

}

void __44__HUFeatureOnboarder_configuratorDidFinish___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", objc_msgSend(*(id *)(a1 + 32), "restart") ^ 1, 0);

}

- (id)getNextViewControllerForOnboardingInput:(id)a3 currentOnboardingFlowClass:(Class)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14[2];
  id location;

  v7 = a3;
  -[HUFeatureOnboarder userInputResults](self, "userInputResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addEntriesFromDictionary:", v7);

  objc_initWeak(&location, self);
  -[HUFeatureOnboarder initialUsageOptions](self, "initialUsageOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUFeatureOnboarder _findNextAppropriateFlowByRemovingFlow:currentOnboardingFlowClass:usageOptions:](self, "_findNextAppropriateFlowByRemovingFlow:currentOnboardingFlowClass:usageOptions:", 0, a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__HUFeatureOnboarder_getNextViewControllerForOnboardingInput_currentOnboardingFlowClass___block_invoke;
  v13[3] = &unk_1E6F501A8;
  objc_copyWeak(v14, &location);
  v14[1] = (id)a2;
  objc_msgSend(v10, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(v14);

  objc_destroyWeak(&location);
  return v11;
}

id __89__HUFeatureOnboarder_getNextViewControllerForOnboardingInput_currentOnboardingFlowClass___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34[2];
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = &unk_1EF261598;
  if (objc_msgSend(v3, "conformsToProtocol:", v4))
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "userInputResults");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v36 = WeakRetained;
      v37 = 2112;
      v38 = v9;
      v39 = 2112;
      v40 = v6;
      v41 = 2112;
      v42 = v10;
      _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@: Flow \"%@\" processing results %@", buf, 0x2Au);

    }
    if ((objc_msgSend(v6, "shouldAbortAllOnboarding") & 1) != 0)
    {
      HFLogForCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(*(SEL *)(a1 + 40));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v36 = WeakRetained;
        v37 = 2112;
        v38 = v12;
        v39 = 2112;
        v40 = v6;
        _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@: Flow \"%@\" CANCELLED ALL current onboarding before next screen of flow.", buf, 0x20u);

      }
      v13 = 0;
    }
    else
    {
      objc_msgSend(WeakRetained, "userInputResults");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "processUserInput:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

    HFLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v36 = WeakRetained;
      v37 = 2112;
      v38 = v16;
      v39 = 2112;
      v40 = v13;
      _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@: Next viewController: %@", buf, 0x20u);

    }
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "onboardingFuture");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isFinished");

      if ((v18 & 1) == 0)
        NSLog(CFSTR("Next viewController is nil, but currentFeatureOnboardingFlow.onboardingFuture is not marked as finished"));
      objc_msgSend(v6, "onboardingFuture");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isFinished");

      if ((v20 & 1) == 0)
      {
        HFLogForCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(a1 + 40));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v36 = WeakRetained;
          v37 = 2112;
          v38 = v30;
          v39 = 2112;
          v40 = v6;
          _os_log_error_impl(&dword_1B8E1E000, v21, OS_LOG_TYPE_ERROR, "%@:%@: Next viewController is nil, but currentFeatureOnboardingFlow.onboardingFuture is not marked as finished. This is likely a programmer error. Forcing future to finish to avoid crashing. %@", buf, 0x20u);

        }
        objc_msgSend(v6, "onboardingFuture");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "finishWithNoResult");

      }
      objc_msgSend(WeakRetained, "_skipAnyFlowsNoLongerRequired");
      if (objc_msgSend(v6, "shouldAbortAllOnboarding"))
      {
        HFLogForCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(*(SEL *)(a1 + 40));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v36 = WeakRetained;
          v37 = 2112;
          v38 = v24;
          v39 = 2112;
          v40 = v6;
          _os_log_impl(&dword_1B8E1E000, v23, OS_LOG_TYPE_DEFAULT, "%@:%@: Flow \"%@\" CANCELLED ALL current onboarding before next flow.", buf, 0x20u);

        }
        objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "setHasPerformedPostProcessing:", 1);
      }
      else
      {
        if (objc_msgSend(v6, "shouldAbortThisOnboardingFlowGroup"))
        {
          objc_msgSend(WeakRetained, "initialUsageOptions");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "_findNextAppropriateFlowByRemovingFlow:currentOnboardingFlowClass:usageOptions:", v6, 0, v26);
        }
        else
        {
          v27 = objc_opt_class();
          objc_msgSend(WeakRetained, "initialUsageOptions");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "_findNextAppropriateFlowByRemovingFlow:currentOnboardingFlowClass:usageOptions:", 0, v27, v26);
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __89__HUFeatureOnboarder_getNextViewControllerForOnboardingInput_currentOnboardingFlowClass___block_invoke_122;
      v31[3] = &unk_1E6F50180;
      objc_copyWeak(v34, (id *)(a1 + 32));
      v34[1] = *(id *)(a1 + 40);
      v28 = v25;
      v32 = v28;
      v33 = v6;
      objc_msgSend(v28, "flatMap:", v31);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(v34);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

id __89__HUFeatureOnboarder_getNextViewControllerForOnboardingInput_currentOnboardingFlowClass___block_invoke_122(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27[2];
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = v3;
  v6 = &unk_1EF261598;
  if (objc_msgSend(v5, "conformsToProtocol:", v6))
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v29 = WeakRetained;
    v30 = 2112;
    v31 = v10;
    v32 = 2112;
    v33 = v8;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@: Next Onboarding Flow: %@", buf, 0x20u);

  }
  v11 = *(id *)(a1 + 32);
  if (!v8 && (objc_msgSend(WeakRetained, "hasPerformedPostProcessing") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "userInputResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "getPostProcessingFlowsForResults:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v29 = WeakRetained;
      v30 = 2112;
      v31 = v15;
      v32 = 2112;
      v33 = v13;
      _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@: Adding Post Processing Flow Group: %@", buf, 0x20u);

    }
    objc_msgSend(WeakRetained, "setHasPerformedPostProcessing:", 1);
    objc_msgSend(WeakRetained, "allRemainingFlowGroups");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "na_safeAddObject:", v13);

    objc_msgSend(WeakRetained, "initialUsageOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_findNextAppropriateFlowByRemovingFlow:currentOnboardingFlowClass:usageOptions:", 0, 0, v17);
    v18 = objc_claimAutoreleasedReturnValue();

    HFLogForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v29 = WeakRetained;
      v30 = 2112;
      v31 = v20;
      v32 = 2112;
      v33 = 0;
      _os_log_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_DEFAULT, "%@:%@: First Post Processing Flow: %@", buf, 0x20u);

    }
    v11 = (id)v18;
  }
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __89__HUFeatureOnboarder_getNextViewControllerForOnboardingInput_currentOnboardingFlowClass___block_invoke_123;
  v25[3] = &unk_1E6F50158;
  objc_copyWeak(v27, (id *)(a1 + 48));
  v21 = *(id *)(a1 + 40);
  v22 = *(void **)(a1 + 56);
  v26 = v21;
  v27[1] = v22;
  objc_msgSend(v11, "flatMap:", v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(v27);
  return v23;
}

id __89__HUFeatureOnboarder_getNextViewControllerForOnboardingInput_currentOnboardingFlowClass___block_invoke_123(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = v3;
  v6 = &unk_1EF261598;
  if (objc_msgSend(v5, "conformsToProtocol:", v6))
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v8, "initialViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v8 == *(id *)(a1 + 32))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), WeakRetained, CFSTR("HUFeatureOnboarder.m"), 529, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nextOrPostProcessingFeatureOnboardingFlow != currentFeatureOnboardingFlow"));

    }
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v18 = WeakRetained;
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@: First View Controller of Next Flow: %@", buf, 0x20u);

    }
  }
  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v18 = WeakRetained;
    v19 = 2112;
    v20 = v13;
    v21 = 2112;
    v22 = v8;
    v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@:Starting next onboarding future %@ with initial view controller: %@", buf, 0x2Au);

  }
  if (v9)
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v9);
  else
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)restartCurrentOnboarding
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  -[HUFeatureOnboarder navController](self, "navController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUFeatureOnboarder navController](self, "navController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "popToRootViewControllerAnimated:", 0);

  }
  -[HUFeatureOnboarder setRestart:](self, "setRestart:", 1);
  -[HUFeatureOnboarder configurator](self, "configurator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HUFeatureOnboarder configuratorDidFinish:](self, "configuratorDidFinish:", v6);

}

- (NSMutableDictionary)userInputResults
{
  return self->_userInputResults;
}

- (void)setUserInputResults:(id)a3
{
  objc_storeStrong((id *)&self->_userInputResults, a3);
}

- (BOOL)restart
{
  return self->_restart;
}

- (void)setRestart:(BOOL)a3
{
  self->_restart = a3;
}

- (NAFuture)completionFuture
{
  return self->_completionFuture;
}

- (void)setCompletionFuture:(id)a3
{
  objc_storeStrong((id *)&self->_completionFuture, a3);
}

- (HUFeatureOnboardingConfigurator)configurator
{
  return self->_configurator;
}

- (void)setConfigurator:(id)a3
{
  objc_storeStrong((id *)&self->_configurator, a3);
}

- (NSDictionary)initialUsageOptions
{
  return self->_initialUsageOptions;
}

- (void)setInitialUsageOptions:(id)a3
{
  objc_storeStrong((id *)&self->_initialUsageOptions, a3);
}

- (NSMutableArray)allRemainingFlowGroups
{
  return self->_allRemainingFlowGroups;
}

- (void)setAllRemainingFlowGroups:(id)a3
{
  objc_storeStrong((id *)&self->_allRemainingFlowGroups, a3);
}

- (UINavigationController)navController
{
  return self->_navController;
}

- (void)setNavController:(id)a3
{
  objc_storeStrong((id *)&self->_navController, a3);
}

- (HUConfigurationViewController)_currentViewControllerForTests
{
  return (HUConfigurationViewController *)objc_loadWeakRetained((id *)&self->__currentViewControllerForTests);
}

- (void)set_currentViewControllerForTests:(id)a3
{
  objc_storeWeak((id *)&self->__currentViewControllerForTests, a3);
}

- (BOOL)hasPerformedPostProcessing
{
  return self->_hasPerformedPostProcessing;
}

- (void)setHasPerformedPostProcessing:(BOOL)a3
{
  self->_hasPerformedPostProcessing = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__currentViewControllerForTests);
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_allRemainingFlowGroups, 0);
  objc_storeStrong((id *)&self->_initialUsageOptions, 0);
  objc_storeStrong((id *)&self->_configurator, 0);
  objc_storeStrong((id *)&self->_completionFuture, 0);
  objc_storeStrong((id *)&self->_userInputResults, 0);
}

@end
