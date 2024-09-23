@implementation HFAbstractBaseActionSetBuilder

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (HFAbstractBaseActionSetBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  id v6;
  HFAbstractBaseActionSetBuilder *v7;
  HFAbstractBaseActionSetBuilder *v8;
  void *v9;
  void *v10;
  void *v11;
  HFMutableSetDiff *v12;
  _QWORD v14[4];
  id v15;
  objc_super v16;

  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HFAbstractBaseActionSetBuilder;
  v7 = -[HFItemBuilder initWithExistingObject:inHome:](&v16, sel_initWithExistingObject_inHome_, a3, v6);
  v8 = v7;
  if (v7)
  {
    -[HFAbstractBaseActionSetBuilder actionSet](v7, "actionSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64__HFAbstractBaseActionSetBuilder_initWithExistingObject_inHome___block_invoke;
    v14[3] = &unk_1EA72BE08;
    v15 = v6;
    objc_msgSend(v10, "na_map:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[HFMutableSetDiff initWithFromSet:]([HFMutableSetDiff alloc], "initWithFromSet:", v11);
    -[HFAbstractBaseActionSetBuilder setActionBuilders:](v8, "setActionBuilders:", v12);

  }
  return v8;
}

id __64__HFAbstractBaseActionSetBuilder_initWithExistingObject_inHome___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HFActionBuilder actionBuilderForAction:inHome:](HFActionBuilder, "actionBuilderForAction:inHome:", a2, *(_QWORD *)(a1 + 32));
}

- (NSArray)actions
{
  void *v2;
  void *v3;
  void *v4;

  -[HFAbstractBaseActionSetBuilder actionBuilders](self, "actionBuilders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)addAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  -[HFAbstractBaseActionSetBuilder actionBuilders](self, "actionBuilders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAbstractBaseActionSetBuilder existingActionBuilder:inSet:](self, "existingActionBuilder:inSet:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "updateWithActionBuilder:", v4);
  objc_opt_class();
  v8 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_opt_class();
  v15 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v15;
  else
    v11 = 0;
  v12 = v11;

  if (v10 && v12)
  {
    -[HFAbstractBaseActionSetBuilder actionBuilders](self, "actionBuilders");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateObject:", v10);
LABEL_14:

    goto LABEL_15;
  }
  if (v8)
  {
    -[HFAbstractBaseActionSetBuilder actionBuilders](self, "actionBuilders");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deleteObject:", v8);

  }
  if (-[HFAbstractBaseActionSetBuilder _updateActionBuildersForLightColorAction:](self, "_updateActionBuildersForLightColorAction:", v15))
  {
    -[HFAbstractBaseActionSetBuilder actionBuilders](self, "actionBuilders");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v15);
    goto LABEL_14;
  }
LABEL_15:

}

- (void)updateAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFAbstractBaseActionSetBuilder _updateActionBuildersForLightColorAction:](self, "_updateActionBuildersForLightColorAction:", v4);
  -[HFAbstractBaseActionSetBuilder actionBuilders](self, "actionBuilders");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateObject:", v4);

}

- (void)removeAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFAbstractBaseActionSetBuilder actionBuilders](self, "actionBuilders");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteObject:", v4);

}

- (void)removeAllActions
{
  id v2;

  -[HFAbstractBaseActionSetBuilder actionBuilders](self, "actionBuilders");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteAllObjects");

}

- (BOOL)requiresDeviceUnlock
{
  void *v2;
  char v3;

  -[HFAbstractBaseActionSetBuilder actions](self, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_181);

  return v3;
}

uint64_t __54__HFAbstractBaseActionSetBuilder_requiresDeviceUnlock__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "requiresDeviceUnlock");
}

- (BOOL)isAffectedByEndEvents
{
  void *v2;
  char v3;

  -[HFAbstractBaseActionSetBuilder actions](self, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_5_12);

  return v3;
}

uint64_t __55__HFAbstractBaseActionSetBuilder_isAffectedByEndEvents__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAffectedByEndEvents");
}

- (HFMediaPlaybackActionBuilder)mediaAction
{
  void *v2;
  void *v3;

  -[HFAbstractBaseActionSetBuilder actions](self, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_firstObjectPassingTest:", &__block_literal_global_6_10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFMediaPlaybackActionBuilder *)v3;
}

uint64_t __45__HFAbstractBaseActionSetBuilder_mediaAction__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSArray)naturalLightingActions
{
  void *v2;
  void *v3;

  -[HFAbstractBaseActionSetBuilder actions](self, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_8_10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __56__HFAbstractBaseActionSetBuilder_naturalLightingActions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)deleteActionSet
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAbstractBaseActionSetBuilder.m"), 164, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFAbstractBaseActionSetBuilder deleteActionSet]", objc_opt_class());

  return 0;
}

- (id)existingActionBuilder:(id)a3 inSet:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = a4;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "canUpdateWithActionBuilder:", v5, (_QWORD)v12))
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (BOOL)_updateActionBuildersForLightColorAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _UNKNOWN **v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  BOOL v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  _UNKNOWN **v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  char v54;
  id obj;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[4];
  id v65;
  _BYTE v66[128];
  uint64_t v67;
  _QWORD v68[2];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFAbstractBaseActionSetBuilder actionBuilders](self, "actionBuilders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_opt_class();
  v8 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v11 = &off_1EA721000;
  objc_opt_class();
  v12 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if (v10)
  {
    if (objc_msgSend(v10, "naturalLightEnabled"))
    {
      v51 = v12;
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __75__HFAbstractBaseActionSetBuilder__updateActionBuildersForLightColorAction___block_invoke;
      v64[3] = &unk_1EA729200;
      v65 = v10;
      objc_msgSend(v7, "na_filter:", v64);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v61;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v61 != v18)
              objc_enumerationMutation(v15);
            v20 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
            -[HFAbstractBaseActionSetBuilder actionBuilders](self, "actionBuilders");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "deleteObject:", v20);

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
        }
        while (v17);
      }

      v22 = 1;
      v12 = v51;
      goto LABEL_51;
    }
LABEL_20:
    v22 = 1;
    goto LABEL_51;
  }
  if (!v14)
    goto LABEL_20;
  v23 = *MEMORY[0x1E0CB88E8];
  v68[0] = *MEMORY[0x1E0CB8A00];
  v68[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "characteristic");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "characteristicType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = *MEMORY[0x1E0CB8810];
  if (objc_msgSend(v26, "isEqualToString:", *MEMORY[0x1E0CB8810]))
  {
    v28 = v24;
  }
  else if (objc_msgSend(v24, "containsObject:", v26))
  {
    v67 = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
    v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = 0;
  }
  v53 = v28;
  if (objc_msgSend(v28, "count"))
  {
    v47 = v26;
    v48 = v24;
    v50 = v7;
    v52 = v12;
    v49 = 0;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    obj = v7;
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v57;
      v54 = 1;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v57 != v31)
            objc_enumerationMutation(obj);
          v33 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
          if (objc_msgSend(v33, "hasSameTargetAsActionBuilder:", v14, v47, v48, v49, v50))
          {
            v34 = v14;
            objc_opt_class();
            v35 = v33;
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v36 = v35;
            else
              v36 = 0;
            v37 = v36;

            v38 = v11;
            objc_opt_class();
            v39 = v35;
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v40 = v39;
            else
              v40 = 0;
            v41 = v40;

            if ((objc_msgSend(v37, "naturalLightEnabled") & 1) != 0)
            {
              v54 = 0;
            }
            else if (v41)
            {
              objc_msgSend(v41, "characteristic");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "characteristicType");
              v43 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v53, "containsObject:", v43))
              {
                -[HFAbstractBaseActionSetBuilder actionBuilders](self, "actionBuilders");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "deleteObject:", v41);

              }
            }

            v11 = v38;
            v14 = v34;
          }
        }
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
      }
      while (v30);
    }
    else
    {
      v54 = 1;
    }

    v10 = v49;
    v7 = v50;
    v12 = v52;
    v26 = v47;
    v24 = v48;
    v45 = v54;
  }
  else
  {
    v45 = 1;
  }

  v22 = v45 & 1;
LABEL_51:

  return v22;
}

uint64_t __75__HFAbstractBaseActionSetBuilder__updateActionBuildersForLightColorAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "hasSameTargetAsActionBuilder:", *(_QWORD *)(a1 + 32)))
  {
    v4 = *MEMORY[0x1E0CB8810];
    v13[0] = *MEMORY[0x1E0CB8A00];
    v13[1] = v4;
    v13[2] = *MEMORY[0x1E0CB88E8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v6 = v3;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    objc_msgSend(v8, "characteristic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "characteristicType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v5, "containsObject:", v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)commitItem
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAbstractBaseActionSetBuilder.m"), 301, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFAbstractBaseActionSetBuilder commitItem]", objc_opt_class());

  return 0;
}

- (id)createActionSetBuilder
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  -[HFItemBuilder home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "areAutomationBuildersSupported");

  if (v4)
  {
    -[HFItemBuilder home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "newActionSetBuilder");

    -[HFAbstractBaseActionSetBuilder updateActionsInBuilder:](self, "updateActionsInBuilder:", v6);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)updateActionsInBuilder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HFAbstractBaseActionSetBuilder actionBuilders](self, "actionBuilders");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "toSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_map:", &__block_literal_global_17_11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_filter:", &__block_literal_global_19_9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActions:", v7);

}

uint64_t __57__HFAbstractBaseActionSetBuilder_updateActionsInBuilder___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createNewAction");
}

BOOL __57__HFAbstractBaseActionSetBuilder_updateActionsInBuilder___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return a2 != 0;
}

- (id)lazilyUpdateActions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[5];
  _QWORD aBlock[5];

  objc_opt_class();
  -[HFAbstractBaseActionSetBuilder actionSet](self, "actionSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    -[HFAbstractBaseActionSetBuilder updateActionsInBuilder:](self, "updateActionsInBuilder:", v5);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke;
    aBlock[3] = &unk_1EA73B4F0;
    aBlock[4] = self;
    v8 = _Block_copy(aBlock);
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_26;
    v17[3] = &unk_1EA73B4F0;
    v17[4] = self;
    v9 = _Block_copy(v17);
    v10 = (void *)MEMORY[0x1E0D519C0];
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_30;
    v14[3] = &unk_1EA73B518;
    v14[4] = self;
    v15 = v8;
    v16 = v9;
    v11 = v8;
    v12 = v9;
    objc_msgSend(v10, "lazyFutureWithBlock:", v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

id __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v5 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_2;
  v21[3] = &unk_1EA728590;
  v21[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v22 = v6;
  objc_msgSend(v4, "futureWithErrorOnlyHandlerAdapterBlock:", v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  v18[1] = 3221225472;
  v18[2] = __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_3;
  v18[3] = &unk_1EA72CB68;
  v8 = v6;
  v9 = *(_QWORD *)(a1 + 32);
  v19 = v8;
  v20 = v9;
  v10 = (id)objc_msgSend(v7, "addSuccessBlock:", v18);
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_23;
  v15[3] = &unk_1EA726360;
  v11 = *(_QWORD *)(a1 + 32);
  v16 = v8;
  v17 = v11;
  v12 = v8;
  v13 = (id)objc_msgSend(v7, "addFailureBlock:", v15);

  return v7;
}

void __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "actionSet");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:completionHandler:", v5, v4);

}

void __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x28uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "action");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "actionSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_prettyDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "Added action: %@ to action set:%@", (uint8_t *)&v6, 0x16u);

  }
}

void __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "action");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "actionSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_prettyDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v5;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Failed to add action: %@ to action set: %@. Error: %@", (uint8_t *)&v8, 0x20u);

  }
}

id __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_26(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v5 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_2_27;
  v21[3] = &unk_1EA728590;
  v21[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v22 = v6;
  objc_msgSend(v4, "futureWithErrorOnlyHandlerAdapterBlock:", v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  v18[1] = 3221225472;
  v18[2] = __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_3_28;
  v18[3] = &unk_1EA72CB68;
  v8 = v6;
  v9 = *(_QWORD *)(a1 + 32);
  v19 = v8;
  v20 = v9;
  v10 = (id)objc_msgSend(v7, "addSuccessBlock:", v18);
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_29;
  v15[3] = &unk_1EA726360;
  v11 = *(_QWORD *)(a1 + 32);
  v16 = v8;
  v17 = v11;
  v12 = v8;
  v13 = (id)objc_msgSend(v7, "addFailureBlock:", v15);

  return v7;
}

void __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_2_27(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "actionSet");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAction:completionHandler:", v5, v4);

}

void __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_3_28(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x28uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "action");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "actionSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_prettyDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "Removed action: %@ from action set:%@", (uint8_t *)&v6, 0x16u);

  }
}

void __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "action");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "actionSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_prettyDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v5;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Failed to remove action: %@ from action set: %@. Error: %@", (uint8_t *)&v8, 0x20u);

  }
}

void __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_30(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v3 = a2;
  v4 = (void *)a1[4];
  objc_msgSend(v4, "actionBuilders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commitItemBuilderSetDiff:addBlock:deleteBlock:", v5, a1[5], a1[6]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_2_31;
  v9[3] = &unk_1EA72A0C8;
  v9[4] = a1[4];
  v10 = v3;
  v7 = v3;
  v8 = (id)objc_msgSend(v6, "addCompletionBlock:", v9);

}

void __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_2_31(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HFMutableSetDiff *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  HFMutableSetDiff *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  if (!v5)
  {
    HFLogForCategory(0x28uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "actionBuilders");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v15;
      _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "Update actionBuilders: %@", buf, 0xCu);

    }
    v16 = [HFMutableSetDiff alloc];
    objc_msgSend(*(id *)(a1 + 32), "actionBuilders");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "toSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HFMutableSetDiff initWithFromSet:](v16, "initWithFromSet:", v11);
    objc_msgSend(*(id *)(a1 + 32), "setActionBuilders:", v12);
    goto LABEL_9;
  }
  objc_msgSend(v5, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HFItemBuilderErrorUserInfoSuccessfulChangesKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x28uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "actionBuilders");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v21 = v18;
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v5;
    _os_log_error_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_ERROR, "Failed to update actionBuilders: %@, successful changes: %@. Error: %@", buf, 0x20u);

  }
  if (v8)
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v10, "actionBuilders");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_removeSuccessfulChanges:fromSetDiff:", v8, v11);
    v12 = (HFMutableSetDiff *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)-[HFMutableSetDiff mutableCopy](v12, "mutableCopy");
    objc_msgSend(*(id *)(a1 + 32), "setActionBuilders:", v13);

LABEL_9:
  }

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_33;
  v19[3] = &unk_1EA726918;
  v19[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v17, "dispatchHomeObserverMessage:sender:", v19, 0);

  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:error:", v6, v5);
}

void __53__HFAbstractBaseActionSetBuilder_lazilyUpdateActions__block_invoke_33(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "actionSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "home:didUpdateActionsForActionSet:", v3, v4);

  }
}

- (id)_removeSuccessfulChanges:(id)a3 fromSetDiff:(id)a4
{
  id v5;
  id v6;
  HFMutableSetDiff *v7;
  void *v8;
  HFMutableSetDiff *v9;
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

  v5 = a4;
  v6 = a3;
  v7 = [HFMutableSetDiff alloc];
  objc_msgSend(v6, "toSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HFMutableSetDiff initWithFromSet:](v7, "initWithFromSet:", v8);

  objc_msgSend(v5, "additions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "additions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "na_setByRemovingObjectsFromSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableSetDiff addObjects:](v9, "addObjects:", v12);

  objc_msgSend(v5, "updates");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "na_setByRemovingObjectsFromSet:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableSetDiff updateObjects:](v9, "updateObjects:", v15);

  objc_msgSend(v5, "deletions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "deletions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "na_setByRemovingObjectsFromSet:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableSetDiff deleteObjects:](v9, "deleteObjects:", v18);

  v19 = (void *)-[HFMutableSetDiff copy](v9, "copy");
  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = objc_alloc((Class)objc_opt_class());
  -[HFAbstractBaseActionSetBuilder actionSet](self, "actionSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemBuilder home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithExistingObject:inHome:", v6, v7);

  -[HFAbstractBaseActionSetBuilder actionBuilders](self, "actionBuilders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopyWithZone:", a3);
  objc_msgSend(v8, "setActionBuilders:", v10);

  return v8;
}

- (HFMutableSetDiff)actionBuilders
{
  return self->_actionBuilders;
}

- (void)setActionBuilders:(id)a3
{
  objc_storeStrong((id *)&self->_actionBuilders, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionBuilders, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

@end
