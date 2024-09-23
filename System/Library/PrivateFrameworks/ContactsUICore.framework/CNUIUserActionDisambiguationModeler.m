@implementation CNUIUserActionDisambiguationModeler

uint64_t __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "arrayByAddingObject:");
}

id __58__CNUIUserActionDisambiguationModeler_sortActionsOnModel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CNUIUserActionListModel *v4;
  void *v5;

  v3 = a2;
  v4 = -[CNUIUserActionListModel initWithModel:actions:]([CNUIUserActionListModel alloc], "initWithModel:actions:", *(_QWORD *)(a1 + 32), v3);

  objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __101__CNUIUserActionDisambiguationModeler_modelsWithDefaultAction_actions_recentActions_sorts_throttles___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = *MEMORY[0x1E0D13880];
  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNUIUserActionDisambiguationModelFinalizer modelWithDefaultAction:actions:recentActions:directoryServiceActions:foundOnDeviceActions:](CNUIUserActionDisambiguationModelFinalizer, "modelWithDefaultAction:actions:recentActions:directoryServiceActions:foundOnDeviceActions:", v5, v6, v7, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __101__CNUIUserActionDisambiguationModeler_modelsWithDefaultAction_actions_recentActions_sorts_throttles___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sortActionsOnModel:", a2);
}

void __64__CNUIUserActionDisambiguationModeler_recentActionsFromActions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[CNUICoreLogProvider actions_os_log](CNUICoreLogProvider, "actions_os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __64__CNUIUserActionDisambiguationModeler_recentActionsFromActions___block_invoke_cold_1(v2, v3);

}

void __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[CNUICoreLogProvider actions_os_log](CNUICoreLogProvider, "actions_os_log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_24_cold_1(a1, (uint64_t)v3, v4);

}

id __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v3 = a2;
  +[CNUICoreLogProvider actions_os_log](CNUICoreLogProvider, "actions_os_log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_2_cold_1();

  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_21;
  v13[3] = &unk_1EA605058;
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  objc_msgSend(v3, "_cn_map:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13AE8], "combineLatest:schedulerProvider:", v6, *(_QWORD *)(a1 + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_24;
  v11[3] = &unk_1EA604B10;
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v7, "doOnNext:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "map:", *MEMORY[0x1E0D13700]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)discoverActionsForContact:(id)a3 actionType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1DF0D61B4]();
  -[CNUIUserActionDisambiguationModeler _discoverActionsForContact:actionType:](self, "_discoverActionsForContact:actionType:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v8);

  return v9;
}

- (id)defaultActionFromActions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNUIUserActionDisambiguationModeler defaultActionFetcher](self, "defaultActionFetcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionDisambiguationModeler discoveringEnvironment](self, "discoveringEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "highLatencySchedulerProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultActionItemForActionItems:schedulerProvider:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startWith:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "onErrorHandler:", &__block_literal_global_29);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (CNUIDefaultUserActionFetcher)defaultActionFetcher
{
  return self->_defaultActionFetcher;
}

- (id)recentActionsFromActions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[CNUIUserActionDisambiguationModeler rankingHelper](self, "rankingHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionDisambiguationModeler discoveringEnvironment](self, "discoveringEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "highLatencySchedulerProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectRecentActionItems:schedulerProvider:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "doOnNext:", &__block_literal_global_30_0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)sortActionsOnModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v4 = a3;
  -[CNUIUserActionDisambiguationModeler rankingHelper](self, "rankingHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionDisambiguationModeler discoveringEnvironment](self, "discoveringEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "highLatencySchedulerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortActionItems:schedulerProvider:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __58__CNUIUserActionDisambiguationModeler_sortActionsOnModel___block_invoke;
  v22[3] = &unk_1EA604628;
  v11 = v4;
  v23 = v11;
  objc_msgSend(v9, "flatMap:", v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v10;
  v18 = 3221225472;
  v19 = __58__CNUIUserActionDisambiguationModeler_sortActionsOnModel___block_invoke_2;
  v20 = &unk_1EA604F20;
  v21 = v11;
  v13 = v11;
  objc_msgSend(v12, "recover:", &v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D13AE8], "observableWithFuture:", v14, v17, v18, v19, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (CNUIUserActionRanking)rankingHelper
{
  return self->_rankingHelper;
}

- (id)_discoverActionsForContact:(id)a3 actionType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;

  v6 = a3;
  v7 = a4;
  -[CNUIUserActionDisambiguationModeler schedulerProvider](self, "schedulerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionDisambiguationModeler targetDiscoveringHelper](self, "targetDiscoveringHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "targetsForActionType:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v10, "scan:seed:", &__block_literal_global_59, MEMORY[0x1E0C9AA60]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNUIUserActionDisambiguationModeler discoveringEnvironment](self, "discoveringEnvironment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_2;
  v27[3] = &unk_1EA605080;
  v15 = v7;
  v28 = v15;
  v29 = v6;
  v30 = v13;
  v31 = v8;
  v16 = v8;
  v17 = v13;
  v18 = v6;
  objc_msgSend(v12, "switchMap:schedulerProvider:", v27, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v14;
  v25[1] = 3221225472;
  v25[2] = __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_26;
  v25[3] = &unk_1EA604728;
  v26 = v15;
  v20 = v15;
  objc_msgSend(v19, "doOnNext:", v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D13AE8], "observableWithResult:", v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "onEmpty:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)modelsWithDefaultAction:(id)a3 actions:(id)a4 recentActions:(id)a5 sorts:(BOOL)a6 throttles:(BOOL)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v25[5];
  _QWORD v26[4];

  v8 = a6;
  v26[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void *)MEMORY[0x1E0D13AE8];
  v26[0] = v12;
  v26[1] = v13;
  v26[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionDisambiguationModeler schedulerProvider](self, "schedulerProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "combineLatest:schedulerProvider:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (a7)
  {
    -[CNUIUserActionDisambiguationModeler schedulerProvider](self, "schedulerProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "throttle:schedulerProvider:", v19, 0.1);
    v20 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = v18;
  }
  objc_msgSend(v20, "map:", &__block_literal_global_32_0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __101__CNUIUserActionDisambiguationModeler_modelsWithDefaultAction_actions_recentActions_sorts_throttles___block_invoke_2;
    v25[3] = &unk_1EA605108;
    v25[4] = self;
    -[CNUIUserActionDisambiguationModeler schedulerProvider](self, "schedulerProvider");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "switchMap:schedulerProvider:", v25, v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v23;
  }

  return v21;
}

- (id)schedulerProvider
{
  void *v2;
  void *v3;

  -[CNUIUserActionDisambiguationModeler discoveringEnvironment](self, "discoveringEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "schedulerProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CNUIUserActionDiscoveringEnvironment)discoveringEnvironment
{
  return self->_discoveringEnvironment;
}

- (CNUIUserActionTargetDiscovering)targetDiscoveringHelper
{
  return self->_targetDiscoveringHelper;
}

+ (id)descriptorForRequiredKeys
{
  return +[CNUIUserActionTarget descriptorForRequiredKeysForActionDiscovering](CNUIUserActionTarget, "descriptorForRequiredKeysForActionDiscovering");
}

- (void)setContactStore:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNUIUserActionDisambiguationModeler discoveringEnvironment](self, "discoveringEnvironment");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copyWithContactStore:", v4);

  -[CNUIUserActionDisambiguationModeler setDiscoveringEnvironment:](self, "setDiscoveringEnvironment:", v5);
}

- (void)setDiscoveringEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_discoveringEnvironment, a3);
}

- (CNUIUserActionDisambiguationModeler)initWithDiscoveringEnvironment:(id)a3
{
  id v4;
  CNUIUserActionRanking *v5;
  void *v6;
  void *v7;
  CNUIUserActionDisambiguationModeler *v8;

  v4 = a3;
  v5 = objc_alloc_init(CNUIUserActionRanking);
  objc_msgSend(v4, "targetDiscoveringHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultUserActionFetcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNUIUserActionDisambiguationModeler initWithTargetDiscoveringHelper:rankingHelper:defaultActionFetcher:discoveringEnvironment:](self, "initWithTargetDiscoveringHelper:rankingHelper:defaultActionFetcher:discoveringEnvironment:", v6, v5, v7, v4);

  return v8;
}

- (CNUIUserActionDisambiguationModeler)initWithTargetDiscoveringHelper:(id)a3 rankingHelper:(id)a4 defaultActionFetcher:(id)a5 discoveringEnvironment:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CNUIUserActionDisambiguationModeler *v15;
  CNUIUserActionDisambiguationModeler *v16;
  CNUIUserActionDisambiguationModeler *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CNUIUserActionDisambiguationModeler;
  v15 = -[CNUIUserActionDisambiguationModeler init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_targetDiscoveringHelper, a3);
    objc_storeStrong((id *)&v16->_rankingHelper, a4);
    objc_storeStrong((id *)&v16->_defaultActionFetcher, a5);
    objc_storeStrong((id *)&v16->_discoveringEnvironment, a6);
    v17 = v16;
  }

  return v16;
}

- (CNUIUserActionDisambiguationModeler)init
{
  CNUIUserActionDiscoveringEnvironment *v3;
  CNUIUserActionDisambiguationModeler *v4;

  v3 = objc_alloc_init(CNUIUserActionDiscoveringEnvironment);
  v4 = -[CNUIUserActionDisambiguationModeler initWithDiscoveringEnvironment:](self, "initWithDiscoveringEnvironment:", v3);

  return v4;
}

- (id)modelsWithContact:(id)a3 actionType:(id)a4 defaultActionItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  CNDiscoveredUserActionReplaySubject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CNFirstRawActionsModelReplaySubject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  uint64_t v46;
  void *v47;
  id v48;
  CNDiscoveredUserActionReplaySubject *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  _QWORD v61[5];
  id v62;
  CNDiscoveredUserActionReplaySubject *v63;
  id v64;
  id v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  id v72;
  _QWORD v73[5];

  v73[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CNUIUserActionDisambiguationModeler schedulerProvider](self, "schedulerProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionDisambiguationModeler discoverActionsForContact:actionType:](self, "discoverActionsForContact:actionType:", v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke;
  v70[3] = &unk_1EA604F70;
  v57 = v8;
  v71 = v57;
  v14 = v9;
  v72 = v14;
  objc_msgSend(v12, "doOnNext:", v70);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "backgroundScheduler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v15;
  objc_msgSend(v15, "subscribeOn:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[CNReplaySubject initWithCapacity:schedulerProvider:]([CNDiscoveredUserActionReplaySubject alloc], "initWithCapacity:schedulerProvider:", 1, v11);
  v55 = v17;
  objc_msgSend(v17, "subscribe:", v18);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13838] + 16))())
  {
    -[CNUIUserActionDisambiguationModeler defaultActionFromActions:](self, "defaultActionFromActions:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = v13;
    v68[1] = 3221225472;
    v68[2] = __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_6;
    v68[3] = &unk_1EA604F98;
    v69 = v14;
    objc_msgSend(v19, "doOnNext:", v68);
    v46 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13AE8], "observableWithResult:", v10);
    v46 = objc_claimAutoreleasedReturnValue();
  }
  -[CNUIUserActionDisambiguationModeler recentActionsFromActions:](self, "recentActionsFromActions:", v18, v46);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v13;
  v66[1] = 3221225472;
  v66[2] = __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_9;
  v66[3] = &unk_1EA604728;
  v67 = v14;
  v54 = v14;
  objc_msgSend(v20, "doOnNext:", v66);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D13AE8], "observableWithResult:", v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13AE8], "observableWithResult:", MEMORY[0x1E0C9AA60]);
  v53 = v10;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionDisambiguationModeler modelsWithDefaultAction:actions:recentActions:sorts:throttles:](self, "modelsWithDefaultAction:actions:recentActions:sorts:throttles:", v22, v18, v23, 0, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "take:", 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = -[CNReplaySubject initWithCapacity:schedulerProvider:]([CNFirstRawActionsModelReplaySubject alloc], "initWithCapacity:schedulerProvider:", 1, v11);
  objc_msgSend(v11, "backgroundScheduler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "subscribeOn:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "subscribe:", v25);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = MEMORY[0x1E0C809B0];
  v30 = (void *)v28;

  v31 = (void *)MEMORY[0x1E0D13AE8];
  v61[0] = v29;
  v61[1] = 3221225472;
  v61[2] = __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_11;
  v61[3] = &unk_1EA605010;
  v61[4] = self;
  v62 = v47;
  v63 = v18;
  v64 = v21;
  v32 = v30;
  v65 = v32;
  v50 = v21;
  v49 = v18;
  v48 = v47;
  objc_msgSend(v31, "observableWithBlock:", v61);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)MEMORY[0x1E0D13AE8];
  +[CNUIUserActionListModel emptyModel](CNUIUserActionListModel, "emptyModel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "observableWithResult:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = (void *)MEMORY[0x1E0D13AE8];
  v73[0] = v36;
  v73[1] = v25;
  v73[2] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "merge:schedulerProvider:", v38, v11);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "backgroundScheduler");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "subscribeOn:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v58[0] = v29;
  v58[1] = 3221225472;
  v58[2] = __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_4;
  v58[3] = &unk_1EA6042B8;
  v59 = v52;
  v60 = v32;
  v42 = v32;
  v43 = v52;
  objc_msgSend(v41, "doOnCancel:", v58);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

void __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[CNUICoreLogProvider actions_os_log](CNUICoreLogProvider, "actions_os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_cold_1();

}

void __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[CNUICoreLogProvider actions_os_log](CNUICoreLogProvider, "actions_os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_6_cold_1();

}

void __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_9(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[CNUICoreLogProvider actions_os_log](CNUICoreLogProvider, "actions_os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_9_cold_1();

}

id __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "discoveringEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "highLatencySchedulerProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_2;
  v11[3] = &unk_1EA604FE8;
  v7 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v7;
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 64);
  v16 = v3;
  v8 = v3;
  objc_msgSend(v6, "performCancelableBlock:qualityOfService:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = a2;
  objc_msgSend(v3, "modelsWithDefaultAction:actions:recentActions:sorts:throttles:", v4, v5, v6, 1, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_3;
  v11[3] = &unk_1EA604FC0;
  v12 = *(id *)(a1 + 64);
  objc_msgSend(v8, "doOnNext:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subscribe:", *(_QWORD *)(a1 + 72));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addCancelable:", v10);
}

uint64_t __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

uint64_t __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  return objc_msgSend(*(id *)(a1 + 40), "cancel");
}

- (id)targetsChangedObservableForActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNUIUserActionDisambiguationModeler discoveringEnvironment](self, "discoveringEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "highLatencySchedulerProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNUIUserActionDisambiguationModeler targetDiscoveringHelper](self, "targetDiscoveringHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "observableForTargetsChangedForActionType:schedulerProvider:", v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subscribeOn:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "throttle:schedulerProvider:", v6, 0.5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __77__CNUIUserActionDisambiguationModeler_targetsChangedObservableForActionType___block_invoke;
  v18[3] = &unk_1EA604B10;
  v19 = v4;
  v12 = v4;
  objc_msgSend(v11, "doOnNext:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "startWith:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __77__CNUIUserActionDisambiguationModeler_targetsChangedObservableForActionType___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  +[CNUICoreLogProvider actions_os_log](CNUICoreLogProvider, "actions_os_log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __77__CNUIUserActionDisambiguationModeler_targetsChangedObservableForActionType___block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

}

id __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(v3, "actionsForContact:discoveringEnvironment:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_2_22;
  v8[3] = &unk_1EA604F70;
  v9 = v3;
  v10 = *(id *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v4, "doOnNext:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_2_22(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[CNUICoreLogProvider actions_os_log](CNUICoreLogProvider, "actions_os_log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_2_22_cold_1(a1);

}

void __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_26(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[CNUICoreLogProvider actions_os_log](CNUICoreLogProvider, "actions_os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_26_cold_1();

}

- (id)defaultActionChangedObservable
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
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[CNUIUserActionDisambiguationModeler discoveringEnvironment](self, "discoveringEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "highLatencySchedulerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNUIUserActionDisambiguationModeler defaultActionFetcher](self, "defaultActionFetcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "observableForDefaultActionsChanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subscribeOn:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "doOnNext:", &__block_literal_global_27_1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startWith:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __69__CNUIUserActionDisambiguationModeler_defaultActionChangedObservable__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  +[CNUICoreLogProvider actions_os_log](CNUICoreLogProvider, "actions_os_log");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __69__CNUIUserActionDisambiguationModeler_defaultActionChangedObservable__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

id __64__CNUIUserActionDisambiguationModeler_defaultActionFromActions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v2 = a2;
  +[CNUICoreLogProvider actions_os_log](CNUICoreLogProvider, "actions_os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __64__CNUIUserActionDisambiguationModeler_defaultActionFromActions___block_invoke_cold_2((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  +[CNUICoreLogProvider actions_os_log](CNUICoreLogProvider, "actions_os_log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __64__CNUIUserActionDisambiguationModeler_defaultActionFromActions___block_invoke_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);

  objc_msgSend(MEMORY[0x1E0D13AE8], "emptyObservable");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

uint64_t __58__CNUIUserActionDisambiguationModeler_sortActionsOnModel___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("[Disambiguation Modeler] Error while sorting actions: %@"), a2);
  NSLog(CFSTR("[Disambiguation Modeler] Will continue with the unsorted list"));
  return objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

- (id)thirdPartyTargetsForActionTypes:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNUIUserActionDisambiguationModeler targetDiscoveringHelper](self, "targetDiscoveringHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "thirdPartyTargetsForActionTypes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)thirdPartyActionsForContactProperty:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  id (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  CNUIUserActionDisambiguationModeler *v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v4 = a3;
  if (thirdPartyActionsForContactProperty__cn_once_token_13 != -1)
    dispatch_once(&thirdPartyActionsForContactProperty__cn_once_token_13, &__block_literal_global_41);
  v5 = (id)thirdPartyActionsForContactProperty__cn_once_object_13;
  objc_msgSend(v4, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if ((v7 & 1) != 0)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__2;
    v27 = __Block_byref_object_dispose__2;
    v28 = 0;
    objc_msgSend(v4, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __75__CNUIUserActionDisambiguationModeler_thirdPartyActionsForContactProperty___block_invoke_42;
    v22[3] = &unk_1EA605150;
    v22[4] = self;
    v22[5] = &v23;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v22);

    v11 = (void *)v24[5];
    v16 = v10;
    v17 = 3221225472;
    v18 = __75__CNUIUserActionDisambiguationModeler_thirdPartyActionsForContactProperty___block_invoke_2;
    v19 = &unk_1EA605178;
    v20 = v4;
    v21 = self;
    objc_msgSend(v11, "_cn_flatMap:", &v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v13 = v12;
    else
      v13 = (void *)MEMORY[0x1E0C9AA60];
    objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", v13, v16, v17, v18, v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", MEMORY[0x1E0C9AA60]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

void __75__CNUIUserActionDisambiguationModeler_thirdPartyActionsForContactProperty___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C96740];
  v4[0] = *MEMORY[0x1E0C96868];
  v4[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)thirdPartyActionsForContactProperty__cn_once_object_13;
  thirdPartyActionsForContactProperty__cn_once_object_13 = v2;

}

void __75__CNUIUserActionDisambiguationModeler_thirdPartyActionsForContactProperty___block_invoke_42(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;

  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "targetDiscoveringHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "thirdPartyTargetsForBundleIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  objc_msgSend(v9, "result:", &v15);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v15;
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v10;

  v14 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
  *a4 = v14 != 0;
}

id __75__CNUIUserActionDisambiguationModeler_thirdPartyActionsForContactProperty___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0C97338]);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithIdentifier:label:value:", v5, v6, v7);

  objc_msgSend(*(id *)(a1 + 32), "key");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0C96868];
  if (v9 | *MEMORY[0x1E0C96868]
    && (v11 = (void *)v9,
        objc_msgSend(*(id *)(a1 + 32), "key"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "isEqual:", v10),
        v12,
        v11,
        !v13))
  {
    v20 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "contact");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "discoveringEnvironment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "actionsForInstantMessageAddresses:contact:discoveringEnvironment:", v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "contact");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "discoveringEnvironment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "actionsForSocialProfiles:contact:discoveringEnvironment:", v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v17;

  return v18;
}

- (void)setTargetDiscoveringHelper:(id)a3
{
  objc_storeStrong((id *)&self->_targetDiscoveringHelper, a3);
}

- (void)setRankingHelper:(id)a3
{
  objc_storeStrong((id *)&self->_rankingHelper, a3);
}

- (void)setDefaultActionFetcher:(id)a3
{
  objc_storeStrong((id *)&self->_defaultActionFetcher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveringEnvironment, 0);
  objc_storeStrong((id *)&self->_defaultActionFetcher, 0);
  objc_storeStrong((id *)&self->_rankingHelper, 0);
  objc_storeStrong((id *)&self->_targetDiscoveringHelper, 0);
}

void __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_1();
  objc_msgSend(*(id *)(v0 + 32), "shortDebugDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_5(&dword_1DD140000, v2, v3, "[Disambiguation Modeler] discovered actions for contact: %@\n%@\nType:%{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_2();
}

void __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_6_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_4(&dword_1DD140000, v0, (uint64_t)v0, "[Disambiguation Modeler] default action for %{public}@: %@", v1);
  OUTLINED_FUNCTION_2();
}

void __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_9_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_4(&dword_1DD140000, v0, (uint64_t)v0, "[Disambiguation Modeler] recent actions for %{public}@: %@", v1);
  OUTLINED_FUNCTION_2();
}

void __77__CNUIUserActionDisambiguationModeler_targetsChangedObservableForActionType___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD140000, a2, a3, "[Disambiguation Modeler] targets changed for %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_2_cold_1()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  objc_msgSend(v0, "count");
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_5(&dword_1DD140000, v1, v2, "[Disambiguation Modeler] found %ld target(s) for %{public}@: %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_2();
}

void __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_2_22_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 40), "shortDebugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_5(&dword_1DD140000, v1, v2, "[Disambiguation Modeler] target %@ found actions for contact %@\n%@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_1_2();
}

void __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_24_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "shortDebugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_4(&dword_1DD140000, a3, v5, "[Disambiguation Modeler] CombineLatest for contact %@\nEmitted: %@", v6);

}

void __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_26_cold_1()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_1();
  objc_msgSend(v0, "count");
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_5(&dword_1DD140000, v1, v2, "[Disambiguation Modeler] found %ld actions for %{public}@: %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_2();
}

void __69__CNUIUserActionDisambiguationModeler_defaultActionChangedObservable__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1DD140000, a1, a3, "[Disambiguation Modeler] default actions changed", a5, a6, a7, a8, 0);
}

void __64__CNUIUserActionDisambiguationModeler_defaultActionFromActions___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1DD140000, a1, a3, "[Disambiguation Modeler] Continuing with no default action", a5, a6, a7, a8, 0);
}

void __64__CNUIUserActionDisambiguationModeler_defaultActionFromActions___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD140000, a2, a3, "[Disambiguation Modeler] Error identifying default action: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __64__CNUIUserActionDisambiguationModeler_recentActionsFromActions___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_4(&dword_1DD140000, a2, v3, "[Disambiguation Modeler] recent actions (%ld): %@", v4);
}

@end
