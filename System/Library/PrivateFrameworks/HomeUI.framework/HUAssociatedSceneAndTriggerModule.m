@implementation HUAssociatedSceneAndTriggerModule

- (HUAssociatedSceneAndTriggerModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_home_serviceLikeItem_context_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAssociatedSceneAndTriggerModule.m"), 28, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUAssociatedSceneAndTriggerModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (HUAssociatedSceneAndTriggerModule)initWithItemUpdater:(id)a3 home:(id)a4 serviceLikeItem:(id)a5 context:(unint64_t)a6
{
  id v11;
  id v12;
  HUAssociatedSceneAndTriggerModule *v13;
  HUAssociatedSceneAndTriggerModule *v14;
  HUAssociatedSceneListItem *v15;
  HFItem *scenesItem;
  id v17;
  void *v18;
  uint64_t v19;
  HFItem *triggersItem;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  HFStaticItemProvider *staticItemProvider;
  objc_super v30;
  _QWORD v31[2];
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v30.receiver = self;
  v30.super_class = (Class)HUAssociatedSceneAndTriggerModule;
  v13 = -[HFItemModule initWithItemUpdater:](&v30, sel_initWithItemUpdater_, a3);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_home, a4);
    objc_storeStrong((id *)&v14->_serviceLikeItem, a5);
    v14->_context = a6;
    v15 = -[HUAssociatedSceneListItem initWithHome:serviceLikeItem:context:]([HUAssociatedSceneListItem alloc], "initWithHome:serviceLikeItem:context:", v11, v12, a6);
    scenesItem = v14->_scenesItem;
    v14->_scenesItem = &v15->super;

    v17 = objc_alloc(MEMORY[0x1E0D31840]);
    v32 = *MEMORY[0x1E0D30D70];
    v33[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "initWithResults:", v18);
    triggersItem = v14->_triggersItem;
    v14->_triggersItem = (HFItem *)v19;

    v21 = objc_alloc(MEMORY[0x1E0D31848]);
    v22 = (void *)MEMORY[0x1E0C99E60];
    -[HUAssociatedSceneAndTriggerModule scenesItem](v14, "scenesItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v23;
    -[HUAssociatedSceneAndTriggerModule triggersItem](v14, "triggersItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setWithArray:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v21, "initWithItems:", v26);
    staticItemProvider = v14->_staticItemProvider;
    v14->_staticItemProvider = (HFStaticItemProvider *)v27;

  }
  return v14;
}

- (id)itemProviders
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUAssociatedSceneAndTriggerModule staticItemProvider](self, "staticItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D31570];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithIdentifier:", CFSTR("ScenesAndTriggers"));
  -[HUAssociatedSceneAndTriggerModule scenesItem](self, "scenesItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  -[HUAssociatedSceneAndTriggerModule triggersItem](self, "triggersItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v9);

  v10 = (void *)MEMORY[0x1E0D314B0];
  v14 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "filterSections:toDisplayedItems:", v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (HMHome)home
{
  return self->_home;
}

- (HFServiceLikeItem)serviceLikeItem
{
  return self->_serviceLikeItem;
}

- (unint64_t)context
{
  return self->_context;
}

- (HFItem)scenesItem
{
  return self->_scenesItem;
}

- (HFItem)triggersItem
{
  return self->_triggersItem;
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_triggersItem, 0);
  objc_storeStrong((id *)&self->_scenesItem, 0);
  objc_storeStrong((id *)&self->_serviceLikeItem, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
