@implementation HFServiceActionItemProvider

- (HFServiceActionItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_actionSet_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFServiceActionItemProvider.m"), 39, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFServiceActionItemProvider init]",
    v5);

  return 0;
}

- (HFServiceActionItemProvider)initWithHome:(id)a3 actionSet:(id)a4
{
  id v7;
  id v8;
  HFServiceActionItemProvider *v9;
  HFServiceActionItemProvider *v10;
  HFActionSetValueSource *v11;
  HFActionSetValueSource *valueSource;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFServiceActionItemProvider;
  v9 = -[HFItemProvider init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_actionSet, a4);
    v11 = -[HFActionSetValueSource initWithActionSet:]([HFActionSetValueSource alloc], "initWithActionSet:", v8);
    valueSource = v10->_valueSource;
    v10->_valueSource = v11;

  }
  return v10;
}

- (HFServiceActionItemProvider)initWithHome:(id)a3 actionSetBuilder:(id)a4
{
  id v7;
  id v8;
  HFServiceActionItemProvider *v9;
  HFServiceActionItemProvider *v10;
  HFActionSetValueSource *v11;
  HFActionSetValueSource *valueSource;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFServiceActionItemProvider;
  v9 = -[HFItemProvider init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_actionSetBuilder, a4);
    v11 = -[HFActionSetValueSource initWithActionSetBuilder:]([HFActionSetValueSource alloc], "initWithActionSetBuilder:", v8);
    valueSource = v10->_valueSource;
    v10->_valueSource = v11;

  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  -[HFServiceActionItemProvider actionSet](self, "actionSet", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc((Class)objc_opt_class());
  -[HFServiceActionItemProvider home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HFServiceActionItemProvider actionSet](self, "actionSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "initWithHome:actionSet:", v6, v7);
  }
  else
  {
    -[HFServiceActionItemProvider actionSetBuilder](self, "actionSetBuilder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "initWithHome:actionSetBuilder:", v6, v7);
  }
  v9 = (void *)v8;

  return v9;
}

- (HFActionSetValueSourceDelegate)actionSetValueSourceDelegate
{
  void *v2;
  void *v3;

  -[HFServiceActionItemProvider valueSource](self, "valueSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFActionSetValueSourceDelegate *)v3;
}

- (void)setActionSetValueSourceDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFServiceActionItemProvider valueSource](self, "valueSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

}

- (id)reloadItems
{
  HFMutableSetDiff *v3;
  void *v4;
  HFMutableSetDiff *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  char isKindOfClass;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  uint64_t v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t m;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  HFItemProviderReloadResults *v48;
  void *v49;
  void *v50;
  void *v51;
  HFItemProviderReloadResults *v52;
  void *v53;
  HFMutableSetDiff *v55;
  id obj;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[4];
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[4];
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD aBlock[5];
  HFMutableSetDiff *v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v3 = [HFMutableSetDiff alloc];
  -[HFServiceActionItemProvider actionItems](self, "actionItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFMutableSetDiff initWithFromSet:](v3, "initWithFromSet:", v4);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__HFServiceActionItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_1EA73CC70;
  aBlock[4] = self;
  v55 = v5;
  v78 = v55;
  v6 = _Block_copy(aBlock);
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  -[HFServiceActionItemProvider actionItems](self, "actionItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v74 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99E60], "set", v55);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setActions:", v13);

        objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setActionBuilders:", v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
    }
    while (v9);
  }

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  -[HFServiceActionItemProvider actionSet](self, "actionSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "actions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v70;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v70 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * j);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        -[HFSetDiff additions](v55, "additions");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFServiceActionItemProvider home](self, "home");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((isKindOfClass & 1) != 0)
        {
          -[HFServiceActionItemProvider _addOrUpdateActionItemWithMediaAction:mediaActionBuilder:addedActionItems:home:](self, "_addOrUpdateActionItemWithMediaAction:mediaActionBuilder:addedActionItems:home:", v21, 0, v23, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v67[0] = MEMORY[0x1E0C809B0];
          v67[1] = 3221225472;
          v67[2] = __42__HFServiceActionItemProvider_reloadItems__block_invoke_2;
          v67[3] = &unk_1EA73CC98;
          v68 = v6;
          objc_msgSend(v25, "na_each:", v67);

        }
        else
        {
          -[HFServiceActionItemProvider _addOrUpdateActionItemWithAction:actionBuilder:addedActionItems:home:](self, "_addOrUpdateActionItemWithAction:actionBuilder:addedActionItems:home:", v21, 0, v23, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          (*((void (**)(void *, void *))v6 + 2))(v6, v25);
        }

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
    }
    while (v18);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  -[HFServiceActionItemProvider actionSetBuilder](self, "actionSetBuilder");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "actions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v27;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v63, v80, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v64;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v64 != v30)
          objc_enumerationMutation(obj);
        v32 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * k);
        objc_opt_class();
        v33 = objc_opt_isKindOfClass();
        -[HFSetDiff additions](v55, "additions");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFServiceActionItemProvider home](self, "home");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v33 & 1) != 0)
        {
          -[HFServiceActionItemProvider _addOrUpdateActionItemWithMediaAction:mediaActionBuilder:addedActionItems:home:](self, "_addOrUpdateActionItemWithMediaAction:mediaActionBuilder:addedActionItems:home:", 0, v32, v34, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          v61[0] = MEMORY[0x1E0C809B0];
          v61[1] = 3221225472;
          v61[2] = __42__HFServiceActionItemProvider_reloadItems__block_invoke_3;
          v61[3] = &unk_1EA73CC98;
          v62 = v6;
          objc_msgSend(v36, "na_each:", v61);

        }
        else
        {
          -[HFServiceActionItemProvider _addOrUpdateActionItemWithAction:actionBuilder:addedActionItems:home:](self, "_addOrUpdateActionItemWithAction:actionBuilder:addedActionItems:home:", 0, v32, v34, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          (*((void (**)(void *, void *))v6 + 2))(v6, v36);
        }

      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v80, 16);
    }
    while (v29);
  }

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  -[HFServiceActionItemProvider actionItems](self, "actionItems");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v57, v79, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v58;
    do
    {
      for (m = 0; m != v39; ++m)
      {
        if (*(_QWORD *)v58 != v40)
          objc_enumerationMutation(v37);
        v42 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * m);
        objc_msgSend(v42, "actions", v55);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v43, "count"))
        {

        }
        else
        {
          objc_msgSend(v42, "actionBuilders");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "count");

          if (!v45)
            -[HFMutableSetDiff deleteObject:](v55, "deleteObject:", v42);
        }
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v57, v79, 16);
    }
    while (v39);
  }

  -[HFSetDiff toSet](v55, "toSet");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(v46, "mutableCopy");
  -[HFServiceActionItemProvider setActionItems:](self, "setActionItems:", v47);

  v48 = [HFItemProviderReloadResults alloc];
  -[HFSetDiff additions](v55, "additions");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSetDiff deletions](v55, "deletions");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSetDiff updates](v55, "updates");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = -[HFItemProviderReloadResults initWithAddedItems:removedItems:existingItems:](v48, "initWithAddedItems:removedItems:existingItems:", v49, v50, v51);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  return v53;
}

void __42__HFServiceActionItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t (**v6)(_QWORD, _QWORD);
  char v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v3 = a2;
  if (v3)
  {
    v11 = v3;
    objc_msgSend(*(id *)(a1 + 32), "filter");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4
      && (v5 = (void *)v4,
          objc_msgSend(*(id *)(a1 + 32), "filter"),
          v6 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(),
          v7 = ((uint64_t (**)(_QWORD, id))v6)[2](v6, v11),
          v6,
          v5,
          (v7 & 1) == 0))
    {
      objc_msgSend(*(id *)(a1 + 40), "deleteObject:", v11);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "actionItems");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "containsObject:", v11);

      v10 = *(void **)(a1 + 40);
      if (v9)
        objc_msgSend(v10, "updateObject:", v11);
      else
        objc_msgSend(v10, "addObject:", v11);
    }
    v3 = v11;
  }

}

uint64_t __42__HFServiceActionItemProvider_reloadItems__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __42__HFServiceActionItemProvider_reloadItems__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)invalidationReasons
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HFServiceActionItemProvider;
  -[HFItemProvider invalidationReasons](&v7, sel_invalidationReasons);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceActionItemProvider actionSet](self, "actionSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "setByAddingObject:", CFSTR("actionSet"));
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (id)_actionItemForCharacteristic:(id)a3 addedActionItems:(id)a4 home:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFServiceActionItemProvider.m"), 186, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

  }
  objc_msgSend(v9, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HFServiceActionItemProvider _findServiceActionForIdentifier:addedActionItems:](self, "_findServiceActionForIdentifier:addedActionItems:", v13, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_actionItemForMediaProfile:(id)a3 addedActionItems:(id)a4 home:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a4;
  objc_msgSend(a3, "accessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HFServiceActionItemProvider _findServiceActionForIdentifier:addedActionItems:](self, "_findServiceActionForIdentifier:addedActionItems:", v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_findServiceActionForIdentifier:(id)a3 addedActionItems:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v36;
  id obj;
  id v38;
  _QWORD v39[4];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v6 = a4;
  -[HFServiceActionItemProvider actionItems](self, "actionItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HFServiceActionItemProvider actionItems](self, "actionItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v6)
    objc_msgSend(v9, "unionSet:", v6);
  v36 = v6;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v46;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v46 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v14, "containingItem", v36);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v14, "containingItem");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "serviceGroup");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "services");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "valueForKey:", CFSTR("uniqueIdentifier"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "containsObject:", v38);

          if ((v21 & 1) != 0)
          {
            v22 = v14;

            if (v22)
              goto LABEL_31;
            goto LABEL_18;
          }

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      if (v11)
        continue;
      break;
    }
  }

LABEL_18:
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v23 = obj;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (!v24)
  {
LABEL_28:

    goto LABEL_30;
  }
  v25 = v24;
  v26 = *(_QWORD *)v42;
LABEL_20:
  v27 = 0;
  while (1)
  {
    if (*(_QWORD *)v42 != v26)
      objc_enumerationMutation(v23);
    v28 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v27);
    objc_msgSend(v28, "containingItem", v36);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v30 = objc_opt_isKindOfClass();

    if ((v30 & 1) == 0)
      goto LABEL_26;
    objc_msgSend(v28, "containingItem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "service");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "uniqueIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isEqual:", v38);

    if ((v34 & 1) != 0)
      break;

LABEL_26:
    if (v25 == ++v27)
    {
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      if (v25)
        goto LABEL_20;
      goto LABEL_28;
    }
  }
  v22 = v28;

  if (v22)
    goto LABEL_31;
LABEL_30:
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __80__HFServiceActionItemProvider__findServiceActionForIdentifier_addedActionItems___block_invoke;
  v39[3] = &unk_1EA73CCC0;
  v40 = v38;
  objc_msgSend(v23, "na_firstObjectPassingTest:", v39);
  v22 = (id)objc_claimAutoreleasedReturnValue();

LABEL_31:
  return v22;
}

uint64_t __80__HFServiceActionItemProvider__findServiceActionForIdentifier_addedActionItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  objc_opt_class();
  objc_msgSend(v3, "containingItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "accessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __80__HFServiceActionItemProvider__findServiceActionForIdentifier_addedActionItems___block_invoke_2;
    v10[3] = &unk_1EA727840;
    v11 = *(id *)(a1 + 32);
    v8 = objc_msgSend(v7, "na_any:", v10);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __80__HFServiceActionItemProvider__findServiceActionForIdentifier_addedActionItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_createActionItemForCharacteristic:(id)a3 home:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HFServiceGroupItem *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  HFServiceActionItem *v14;

  v6 = a4;
  objc_msgSend(a3, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_serviceGroupsForService:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [HFServiceGroupItem alloc];
    -[HFServiceActionItemProvider valueSource](self, "valueSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HFServiceGroupItem initWithValueSource:serviceGroup:](v10, "initWithValueSource:serviceGroup:", v11, v9);
  }
  else
  {
    if (!v7 || !objc_msgSend(v7, "hf_isVisible"))
    {
      v13 = 0;
LABEL_10:
      v14 = 0;
      goto LABEL_11;
    }
    -[HFServiceActionItemProvider valueSource](self, "valueSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFServiceItem serviceItemForService:valueSource:](HFServiceItem, "serviceItemForService:valueSource:", v7, v11);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  if (!v13 || !objc_msgSend(v13, "containsActions"))
    goto LABEL_10;
  v14 = -[HFServiceActionItem initWithHome:containingItem:]([HFServiceActionItem alloc], "initWithHome:containingItem:", v6, v13);
LABEL_11:

  return v14;
}

- (id)_createActionItemForMediaProfile:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HFServiceActionItem *v8;
  HFMediaAccessoryItem *v9;
  void *v10;
  HFMediaAccessoryItem *v11;
  HFServiceActionItem *v12;

  v6 = a4;
  v7 = a3;
  v8 = [HFServiceActionItem alloc];
  v9 = [HFMediaAccessoryItem alloc];
  -[HFServiceActionItemProvider valueSource](self, "valueSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HFMediaAccessoryItem initWithValueSource:mediaProfileContainer:](v9, "initWithValueSource:mediaProfileContainer:", v10, v7);

  v12 = -[HFServiceActionItem initWithHome:containingItem:](v8, "initWithHome:containingItem:", v6, v11);
  return v12;
}

- (id)_addOrUpdateActionItemWithAction:(id)a3 actionBuilder:(id)a4 addedActionItems:(id)a5 home:(id)a6
{
  unint64_t v11;
  unint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;

  v11 = (unint64_t)a3;
  v12 = (unint64_t)a4;
  v13 = a5;
  v14 = a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFServiceActionItemProvider.m"), 293, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

  }
  if (v11 | v12)
  {
    if (v11 && v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFServiceActionItemProvider.m"), 295, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!action || !actionBuilder"));

    }
    else if (!v11)
    {
      if (!v12)
      {
LABEL_18:
        v16 = 0;
        goto LABEL_19;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend((id)v12, "characteristic");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFServiceActionItemProvider _actionItemForCharacteristic:addedActionItems:home:](self, "_actionItemForCharacteristic:addedActionItems:home:", v15, v13, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          -[HFServiceActionItemProvider _createActionItemForCharacteristic:home:](self, "_createActionItemForCharacteristic:home:", v15, v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v16, "addActionBuilder:", v12);
        goto LABEL_16;
      }
LABEL_17:
      objc_opt_class();
      objc_opt_isKindOfClass();
      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend((id)v11, "characteristic");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFServiceActionItemProvider _actionItemForCharacteristic:addedActionItems:home:](self, "_actionItemForCharacteristic:addedActionItems:home:", v15, v13, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        -[HFServiceActionItemProvider _createActionItemForCharacteristic:home:](self, "_createActionItemForCharacteristic:home:", v15, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v16, "addAction:", v11);
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFServiceActionItemProvider.m"), 294, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action || actionBuilder"));
  v16 = 0;
LABEL_16:

LABEL_19:
  return v16;
}

- (id)_addOrUpdateActionItemWithMediaAction:(id)a3 mediaActionBuilder:(id)a4 addedActionItems:(id)a5 home:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id *v17;
  id *v18;
  id *v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFServiceActionItemProvider.m"), 329, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

  }
  if ((v11 != 0) == (v12 != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFServiceActionItemProvider.m"), 330, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(action != nil) ^ (actionBuilder != nil)"));

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "mediaProfiles");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __110__HFServiceActionItemProvider__addOrUpdateActionItemWithMediaAction_mediaActionBuilder_addedActionItems_home___block_invoke;
      v30[3] = &unk_1EA73CCE8;
      v30[4] = self;
      v17 = &v31;
      v31 = v13;
      v18 = &v32;
      v32 = v14;
      v19 = &v33;
      v33 = v11;
      v20 = v30;
LABEL_11:
      objc_msgSend(v16, "na_map:", v20);
      v21 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v21;
    }
  }
  else if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "mediaProfiles");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __110__HFServiceActionItemProvider__addOrUpdateActionItemWithMediaAction_mediaActionBuilder_addedActionItems_home___block_invoke_2;
      v26[3] = &unk_1EA73CCE8;
      v26[4] = self;
      v17 = &v27;
      v27 = v13;
      v18 = &v28;
      v28 = v14;
      v19 = &v29;
      v29 = v12;
      v20 = v26;
      goto LABEL_11;
    }
  }
  objc_msgSend(v15, "allObjects");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

id __110__HFServiceActionItemProvider__addOrUpdateActionItemWithMediaAction_mediaActionBuilder_addedActionItems_home___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_actionItemForMediaProfile:addedActionItems:home:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_createActionItemForMediaProfile:home:", v3, *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "addAction:", *(_QWORD *)(a1 + 56));

  return v4;
}

id __110__HFServiceActionItemProvider__addOrUpdateActionItemWithMediaAction_mediaActionBuilder_addedActionItems_home___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_actionItemForMediaProfile:addedActionItems:home:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_createActionItemForMediaProfile:home:", v3, *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "addActionBuilder:", *(_QWORD *)(a1 + 56));

  return v4;
}

- (HMHome)home
{
  return self->_home;
}

- (HMActionSet)actionSet
{
  return self->_actionSet;
}

- (void)setActionSet:(id)a3
{
  objc_storeStrong((id *)&self->_actionSet, a3);
}

- (HFActionSetBuilderProtocol)actionSetBuilder
{
  return self->_actionSetBuilder;
}

- (void)setActionSetBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_actionSetBuilder, a3);
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSMutableSet)actionItems
{
  return self->_actionItems;
}

- (void)setActionItems:(id)a3
{
  objc_storeStrong((id *)&self->_actionItems, a3);
}

- (HFActionSetValueSource)valueSource
{
  return self->_valueSource;
}

- (void)setValueSource:(id)a3
{
  objc_storeStrong((id *)&self->_valueSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_actionItems, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_actionSetBuilder, 0);
  objc_storeStrong((id *)&self->_actionSet, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
