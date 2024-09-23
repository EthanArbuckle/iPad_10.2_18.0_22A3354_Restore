@implementation HUTriggerCustomConditionEditorSectionModule

- (HUTriggerCustomConditionEditorSectionModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_home_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTriggerCustomConditionEditorSectionModule.m"), 27, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUTriggerCustomConditionEditorSectionModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (HUTriggerCustomConditionEditorSectionModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v7;
  HUTriggerCustomConditionEditorSectionModule *v8;
  HUTriggerCustomConditionEditorSectionModule *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUTriggerCustomConditionEditorSectionModule;
  v8 = -[HFItemModule initWithItemUpdater:](&v11, sel_initWithItemUpdater_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    -[HUTriggerCustomConditionEditorSectionModule _buildItemProviders](v9, "_buildItemProviders");
  }

  return v9;
}

- (unint64_t)conditionType
{
  return 2;
}

- (id)itemProviders
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUTriggerCustomConditionEditorSectionModule itemProvider](self, "itemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
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
  -[HUTriggerCustomConditionEditorSectionModule itemProvider](self, "itemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "na_setByIntersectingWithSet:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("custom"));
    objc_msgSend(v7, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedArrayUsingComparator:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setItems:", v11);

    v14[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (void)updateEnabledConditions:(id)a3 disabledConditions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  -[HUTriggerCustomConditionEditorSectionModule setMutableEnabledConditions:](self, "setMutableEnabledConditions:", v8);

  v9 = (void *)objc_msgSend(v6, "mutableCopy");
  -[HUTriggerCustomConditionEditorSectionModule setMutableDisabledConditions:](self, "setMutableDisabledConditions:", v9);

  objc_msgSend(v7, "setByAddingObjectsFromSet:", v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[HUTriggerCustomConditionEditorSectionModule sourceConditionItemProvider](self, "sourceConditionItemProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConditions:", v11);

}

- (id)conditionForItem:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
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

  v3 = a3;
  v4 = objc_opt_class();
  v5 = v3;
  if (!v5)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v5;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v4, objc_opt_class());

LABEL_7:
    v7 = 0;
  }

  objc_msgSend(v7, "sourceItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = &unk_1EF348270;
  if (!v10)
  {
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  if (objc_msgSend(v10, "conformsToProtocol:", v11))
    v12 = v10;
  else
    v12 = 0;
  v13 = v10;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("NSObject+NAAdditions.h"), 71, CFSTR("Expected protocol %@"), v16);

    goto LABEL_14;
  }
LABEL_15:

  objc_msgSend(v13, "condition");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)itemForCondition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HUTriggerCustomConditionEditorSectionModule itemProvider](self, "itemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__HUTriggerCustomConditionEditorSectionModule_itemForCondition___block_invoke;
  v10[3] = &unk_1E6F4DAD8;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __64__HUTriggerCustomConditionEditorSectionModule_itemForCondition___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
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
  uint64_t v19;

  v3 = a2;
  v4 = objc_opt_class();
  v5 = v3;
  if (!v5)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v5;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v4, objc_opt_class());

LABEL_7:
    v7 = 0;
  }

  objc_msgSend(v7, "sourceItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = &unk_1EF348270;
  if (!v10)
  {
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  if (objc_msgSend(v10, "conformsToProtocol:", v11))
    v12 = v10;
  else
    v12 = 0;
  v13 = v10;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("NSObject+NAAdditions.h"), 71, CFSTR("Expected protocol %@"), v16);

    goto LABEL_14;
  }
LABEL_15:

  v17 = *(void **)(a1 + 32);
  objc_msgSend(v13, "condition");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "isEqual:", v18);

  return v19;
}

- (BOOL)isConditionEnabled:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HUTriggerCustomConditionEditorSectionModule enabledConditions](self, "enabledConditions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)setConditionEnabled:(BOOL)a3 forCondition:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = a4;
  if (-[HUTriggerCustomConditionEditorSectionModule isConditionEnabled:](self, "isConditionEnabled:") != v4)
  {
    if (v4)
    {
      -[HUTriggerCustomConditionEditorSectionModule mutableDisabledConditions](self, "mutableDisabledConditions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObject:", v9);

      -[HUTriggerCustomConditionEditorSectionModule mutableEnabledConditions](self, "mutableEnabledConditions");
    }
    else
    {
      -[HUTriggerCustomConditionEditorSectionModule mutableEnabledConditions](self, "mutableEnabledConditions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObject:", v9);

      -[HUTriggerCustomConditionEditorSectionModule mutableDisabledConditions](self, "mutableDisabledConditions");
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
}

- (void)_buildItemProviders
{
  id v3;
  void *v4;
  void *v5;
  HFConditionItemProvider *v6;
  HFConditionItemProvider *sourceConditionItemProvider;
  id v8;
  void *v9;
  HFTransformItemProvider *v10;
  HFTransformItemProvider *itemProvider;
  _QWORD v12[4];
  id v13;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x1E0D31310]);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerCustomConditionEditorSectionModule home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (HFConditionItemProvider *)objc_msgSend(v3, "initWithConditions:home:", v4, v5);
  sourceConditionItemProvider = self->_sourceConditionItemProvider;
  self->_sourceConditionItemProvider = v6;

  v8 = objc_alloc(MEMORY[0x1E0D31928]);
  -[HUTriggerCustomConditionEditorSectionModule sourceConditionItemProvider](self, "sourceConditionItemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__HUTriggerCustomConditionEditorSectionModule__buildItemProviders__block_invoke;
  v12[3] = &unk_1E6F581A8;
  objc_copyWeak(&v13, &location);
  v10 = (HFTransformItemProvider *)objc_msgSend(v8, "initWithSourceProvider:transformationBlock:", v9, v12);
  itemProvider = self->_itemProvider;
  self->_itemProvider = v10;

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

id __66__HUTriggerCustomConditionEditorSectionModule__buildItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D31920]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__HUTriggerCustomConditionEditorSectionModule__buildItemProviders__block_invoke_2;
  v8[3] = &unk_1E6F50430;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v5 = v3;
  v9 = v5;
  v6 = (void *)objc_msgSend(v4, "initWithSourceItem:transformationBlock:", v5, v8);

  objc_destroyWeak(&v10);
  return v6;
}

id __66__HUTriggerCustomConditionEditorSectionModule__buildItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = (void *)objc_msgSend(v4, "mutableCopy");

  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "condition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "isConditionEnabled:", v8);
  objc_msgSend(v7, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D30E20]);

  return v6;
}

- (HMHome)home
{
  return self->_home;
}

- (HFConditionItemProvider)sourceConditionItemProvider
{
  return self->_sourceConditionItemProvider;
}

- (HFTransformItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (NSMutableSet)mutableEnabledConditions
{
  return self->_mutableEnabledConditions;
}

- (void)setMutableEnabledConditions:(id)a3
{
  objc_storeStrong((id *)&self->_mutableEnabledConditions, a3);
}

- (NSMutableSet)mutableDisabledConditions
{
  return self->_mutableDisabledConditions;
}

- (void)setMutableDisabledConditions:(id)a3
{
  objc_storeStrong((id *)&self->_mutableDisabledConditions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableDisabledConditions, 0);
  objc_storeStrong((id *)&self->_mutableEnabledConditions, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_sourceConditionItemProvider, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
