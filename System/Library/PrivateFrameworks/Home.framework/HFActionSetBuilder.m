@implementation HFActionSetBuilder

- (id)compareToObject:(id)a3
{
  id v4;
  HFComparisonResult *v5;
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
  void *v19;
  void *v20;

  v4 = a3;
  v5 = -[HFComparisonResult initWithObjectA:objectB:]([HFComparisonResult alloc], "initWithObjectA:objectB:", self, v4);
  if (!-[HFComparisonResult containsCriticalDifference](v5, "containsCriticalDifference"))
  {
    -[HFActionSetBuilder name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFPropertyDifference compareObjectA:toObjectB:key:priority:](HFPropertyDifference, "compareObjectA:toObjectB:key:priority:", v6, v7, CFSTR("name"), 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFComparisonResult add:](v5, "add:", v8);

    -[HFActionSetBuilder iconDescriptor](self, "iconDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "iconDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFPropertyDifference compareObjectA:toObjectB:key:priority:](HFPropertyDifference, "compareObjectA:toObjectB:key:priority:", v9, v10, CFSTR("iconDescriptor"), 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFComparisonResult add:](v5, "add:", v11);

    -[HFActionSetBuilder iconTintColor](self, "iconTintColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "iconTintColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFPropertyDifference compareObjectA:toObjectB:key:priority:](HFPropertyDifference, "compareObjectA:toObjectB:key:priority:", v12, v13, CFSTR("iconTintColor"), 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFComparisonResult add:](v5, "add:", v14);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HFActionSetBuilder showInHomeDashboard](self, "showInHomeDashboard"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "showInHomeDashboard"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFPropertyDifference compareObjectA:toObjectB:key:priority:](HFPropertyDifference, "compareObjectA:toObjectB:key:priority:", v15, v16, CFSTR("showInHomeDashboard"), 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFComparisonResult add:](v5, "add:", v17);

    -[HFAbstractBaseActionSetBuilder actions](self, "actions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFContainedObjectListDifference containedObjectDifferenceWithKey:objectsA:objectsB:](HFContainedObjectListDifference, "containedObjectDifferenceWithKey:objectsA:objectsB:", CFSTR("actions"), v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFComparisonResult add:](v5, "add:", v20);

  }
  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HFActionSetBuilder name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)performValidation
{
  void *v3;
  NSObject *v4;
  _QWORD v6[5];
  uint8_t buf[4];
  HFActionSetBuilder *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__HFActionSetBuilder_AutomationBuilders__performValidation__block_invoke;
  v6[3] = &unk_1EA72BB00;
  v6[4] = self;
  __59__HFActionSetBuilder_AutomationBuilders__performValidation__block_invoke((uint64_t)v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    HFLogForCategory(0x28uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v8 = self;
      v9 = 2112;
      v10 = v3;
      _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Error validating action set builder: %@. Error: %@", buf, 0x16u);
    }

  }
  return v3;
}

id __59__HFActionSetBuilder_AutomationBuilders__performValidation__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "verifyPropertyIsSet:", CFSTR("name"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "verifyNameIsNotEmpty:", v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "actionSet");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "actionSetType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB8238]);

      if (!v7
        || (objc_msgSend(*(id *)(a1 + 32), "verifyProperty:matchesCondition:description:", CFSTR("actions"), &__block_literal_global_45, CFSTR("Action sets must have at least one action")), (v2 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        objc_msgSend(*(id *)(a1 + 32), "actions");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "na_map:", &__block_literal_global_7_1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstObject");
        v2 = (void *)objc_claimAutoreleasedReturnValue();

        if (v2)
          v10 = v2;

      }
    }
  }
  return v2;
}

BOOL __59__HFActionSetBuilder_AutomationBuilders__performValidation__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "count") != 0;
}

uint64_t __59__HFActionSetBuilder_AutomationBuilders__performValidation__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "validationError");
}

- (id)getOrCreateActionSetBuilder
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HFActionSetBuilderPair *v9;
  HFActionSetBuilderPair *v10;
  HFActionSetBuilderPair *v12;
  _QWORD v13[5];

  -[HFItemBuilder home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "areAutomationBuildersSupported");

  if (v4)
  {
    -[HFAbstractBaseActionSetBuilder actionSet](self, "actionSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_4;
    -[HFItemBuilder home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionSets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __69__HFActionSetBuilder_AutomationBuilders__getOrCreateActionSetBuilder__block_invoke;
    v13[3] = &unk_1EA728840;
    v13[4] = self;
    objc_msgSend(v7, "na_firstObjectPassingTest:", v13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
LABEL_4:
      v8 = (void *)objc_msgSend(v5, "copyAsBuilder");
      v9 = -[HFActionSetBuilderPair initWithActionSet:builder:]([HFActionSetBuilderPair alloc], "initWithActionSet:builder:", v5, v8);
    }
    else
    {
      v12 = [HFActionSetBuilderPair alloc];
      -[HFItemBuilder home](self, "home");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v5, "newActionSetBuilder");
      v9 = -[HFActionSetBuilderPair initWithBuilder:](v12, "initWithBuilder:", v8);
    }
    v10 = v9;

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

BOOL __69__HFActionSetBuilder_AutomationBuilders__getOrCreateActionSetBuilder__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;

  v3 = a2;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v7))
  {
    objc_msgSend(v3, "actions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") == 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)updateActionSetBuilder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    -[HFActionSetBuilder name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setName:", v6);

    -[HFActionSetBuilder _updateValueForContextType:onActionSetBuilder:](self, "_updateValueForContextType:onActionSetBuilder:", 3, v5);
    -[HFAbstractBaseActionSetBuilder updateActionsInBuilder:](self, "updateActionsInBuilder:", v5);
    v7 = (void *)MEMORY[0x1E0D519C0];
    -[HFActionSetBuilder _updateIconOnBuilder:](self, "_updateIconOnBuilder:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "combineAllFutures:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@:%@ Passed a nil action set builder"), self, v11);

    v12 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "futureWithError:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (void)_updateValueForContextType:(unint64_t)a3 onActionSetBuilder:(id)a4
{
  __CFString *v6;
  char v7;
  _BOOL8 v8;
  _BOOL8 v9;
  int v10;
  char v11;
  __CFString *v12;

  v12 = (__CFString *)a4;
  v6 = CFSTR("ActionSet's value cannot be updated since it cannot be favorited.");
  switch(a3)
  {
    case 0uLL:
    case 2uLL:
      goto LABEL_3;
    case 1uLL:
      v6 = CFSTR("ActionSet's value cannot be updated since it cannot be included in status.");
LABEL_3:
      NSLog(&v6->isa);
      v6 = v12;
      goto LABEL_4;
    case 3uLL:
      v8 = -[HFActionSetBuilder showInHomeDashboard](self, "showInHomeDashboard");
      v10 = -[__CFString hf_isOnForContextType:](v12, "hf_isOnForContextType:", 3);
      v9 = v8;
      if (v8 == v10)
        goto LABEL_7;
      goto LABEL_8;
    default:
LABEL_4:
      v7 = -[__CFString hf_isOnForContextType:](v6, "hf_isOnForContextType:", a3);
      v8 = 0;
      v9 = 0;
      if ((v7 & 1) != 0)
        goto LABEL_8;
LABEL_7:
      v11 = -[__CFString hf_hasSetForContextType:](v12, "hf_hasSetForContextType:", a3);
      v9 = v8;
      if ((v11 & 1) == 0)
LABEL_8:
        -[__CFString hf_setValue:forContextType:](v12, "hf_setValue:forContextType:", v9, a3);

      return;
  }
}

- (id)_updateIconOnBuilder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  objc_msgSend(v4, "hf_iconDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "hf_iconTintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFActionSetBuilder iconDescriptor](self, "iconDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqualToString:", v9);

  if (v10
    && (-[HFActionSetBuilder iconTintColor](self, "iconTintColor"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v7, "isEqual:", v11),
        v11,
        v12))
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HFActionSetBuilder iconDescriptor](self, "iconDescriptor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isSystemImage");

    if ((v15 & 1) == 0)
    {
      -[HFActionSetBuilder iconDescriptor](self, "iconDescriptor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Action Set Builder expected SF Symbol icon. %@"), v16);

    }
    -[HFActionSetBuilder iconDescriptor](self, "iconDescriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFActionSetBuilder iconTintColor](self, "iconTintColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_setIconIdentifier:andTintColor:", v18, v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (NSSet)hf_accessoryLikeObjects
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAbstractBaseActionSetBuilder actions](self, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__HFActionSetBuilder_AccessoryLikeObjectContainer__hf_accessoryLikeObjects__block_invoke;
  v8[3] = &unk_1EA72C4F8;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "na_each:", v8);

  v6 = (void *)objc_msgSend(v5, "copy");
  return (NSSet *)v6;
}

void __75__HFActionSetBuilder_AccessoryLikeObjectContainer__hf_accessoryLikeObjects__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(a2, "containedAccessoryRepresentables");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__HFActionSetBuilder_AccessoryLikeObjectContainer__hf_accessoryLikeObjects__block_invoke_2;
  v4[3] = &unk_1EA72C4D0;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_each:", v4);

}

void __75__HFActionSetBuilder_AccessoryLikeObjectContainer__hf_accessoryLikeObjects__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[HFAccessoryLikeObject accessoryLikeObjectsForAccessoryRepresentable:](HFAccessoryLikeObject, "accessoryLikeObjectsForAccessoryRepresentable:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", v3);

}

- (HFActionSetBuilder)initWithHome:(id)a3
{
  HFActionSetBuilder *v3;
  HFImageIconDescriptor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HFActionSetBuilder;
  v3 = -[HFItemBuilder initWithHome:](&v6, sel_initWithHome_, a3);
  if (v3)
  {
    v4 = -[HFImageIconDescriptor initWithSystemImageNamed:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:", CFSTR("house.fill"));
    -[HFActionSetBuilder setIconDescriptor:](v3, "setIconDescriptor:", v4);

    -[HFActionSetBuilder setIsActionSetDeleted:](v3, "setIsActionSetDeleted:", 0);
  }
  return v3;
}

- (HFActionSetBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  HFActionSetBuilder *v4;
  HFActionSetBuilder *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HFActionSetBuilder;
  v4 = -[HFAbstractBaseActionSetBuilder initWithExistingObject:inHome:](&v14, sel_initWithExistingObject_inHome_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HFAbstractBaseActionSetBuilder actionSet](v4, "actionSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFActionSetBuilder setName:](v5, "setName:", v7);

    -[HFAbstractBaseActionSetBuilder actionSet](v5, "actionSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hf_iconDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFActionSetBuilder setIconDescriptor:](v5, "setIconDescriptor:", v9);

    -[HFAbstractBaseActionSetBuilder actionSet](v5, "actionSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hf_iconTintColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFActionSetBuilder setIconTintColor:](v5, "setIconTintColor:", v11);

    -[HFAbstractBaseActionSetBuilder actionSet](v5, "actionSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFActionSetBuilder setShowInHomeDashboard:](v5, "setShowInHomeDashboard:", objc_msgSend(v12, "hf_effectiveShowInHomeDashboard"));

    -[HFActionSetBuilder setIsActionSetDeleted:](v5, "setIsActionSetDeleted:", 0);
  }
  return v5;
}

- (id)deleteActionSet
{
  void *v3;
  void *v4;
  void *v5;

  -[HFAbstractBaseActionSetBuilder actionSet](self, "actionSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemBuilder home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFActionSetBuilder _deleteActionSet:fromHome:](self, "_deleteActionSet:fromHome:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)updateFromActionSetBuilder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFActionSetBuilder setName:](self, "setName:", v5);

  objc_msgSend(v4, "iconDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFActionSetBuilder setIconDescriptor:](self, "setIconDescriptor:", v6);

  -[HFActionSetBuilder setShowInHomeDashboard:](self, "setShowInHomeDashboard:", objc_msgSend(v4, "showInHomeDashboard"));
  objc_msgSend(v4, "actionBuilders");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v8, "mutableCopy");
  -[HFAbstractBaseActionSetBuilder setActionBuilders:](self, "setActionBuilders:", v7);

}

- (id)_lazy_performValidation
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
  id v13;
  _QWORD v15[5];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[HFItemBuilder lazy_verifyPropertyIsSet:](self, "lazy_verifyPropertyIsSet:", CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  -[HFActionSetBuilder name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemBuilder lazy_verifyNameIsNotEmpty:](self, "lazy_verifyNameIsNotEmpty:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFAbstractBaseActionSetBuilder actionSet](self, "actionSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionSetType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB8238]);

  if ((_DWORD)v6)
  {
    -[HFItemBuilder lazy_verifyProperty:matchesCondition:description:](self, "lazy_verifyProperty:matchesCondition:description:", CFSTR("actions"), &__block_literal_global_187, CFSTR("Action sets must have at least one action"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v11);

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "chainFutures:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __45__HFActionSetBuilder__lazy_performValidation__block_invoke_2;
  v15[3] = &unk_1EA726968;
  v15[4] = self;
  v13 = (id)objc_msgSend(v12, "addFailureBlock:", v15);

  return v12;
}

BOOL __45__HFActionSetBuilder__lazy_performValidation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "count") != 0;
}

void __45__HFActionSetBuilder__lazy_performValidation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Error validating action set builder: %@. Error: %@", (uint8_t *)&v6, 0x16u);
  }

}

- (id)createActionSetBuilder
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[5];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HFActionSetBuilder;
  -[HFAbstractBaseActionSetBuilder createActionSetBuilder](&v11, sel_createActionSetBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    v5 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __44__HFActionSetBuilder_createActionSetBuilder__block_invoke;
    v10[3] = &unk_1EA73C630;
    v10[4] = self;
    objc_msgSend(v3, "flatMap:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __44__HFActionSetBuilder_createActionSetBuilder__block_invoke_3;
    v9[3] = &unk_1EA73C630;
    v9[4] = self;
    objc_msgSend(v6, "flatMap:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

id __44__HFActionSetBuilder_createActionSetBuilder__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_lazy_performValidation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__HFActionSetBuilder_createActionSetBuilder__block_invoke_2;
  v8[3] = &unk_1EA726940;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __44__HFActionSetBuilder_createActionSetBuilder__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

id __44__HFActionSetBuilder_createActionSetBuilder__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setName:", v4);

  v5 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(*(id *)(a1 + 32), "_lazilyUpdateIncludedContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  objc_msgSend(*(id *)(a1 + 32), "_lazilyUpdateIcon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "combineAllFutures:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__HFActionSetBuilder_createActionSetBuilder__block_invoke_4;
  v13[3] = &unk_1EA726940;
  v14 = v3;
  v10 = v3;
  objc_msgSend(v9, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __44__HFActionSetBuilder_createActionSetBuilder__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

- (id)commitItem
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  __CFString **v21;
  __CFString *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  __CFString *v29;
  _QWORD v31[5];
  __CFString *v32;
  _QWORD v33[4];
  id v34;
  os_signpost_id_t v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (-[HFActionSetBuilder isActionSetDeleted](self, "isActionSetDeleted"))
  {
    HFLogForCategory(0x28uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[HFActionSetBuilder name](self, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v37 = v4;
      _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Skipping commit of action set with name: %@. Reason: Action set was previously deleted.", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    HFLogForCategory(0x31uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_signpost_id_make_with_pointer(v6, self);

    v8 = (void *)MEMORY[0x1E0CB3940];
    -[HFAbstractBaseActionSetBuilder actionSet](self, "actionSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v10 = CFSTR("Committing");
    else
      v10 = CFSTR("Creating");
    -[HFActionSetBuilder name](self, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAbstractBaseActionSetBuilder actionSet](self, "actionSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      -[HFAbstractBaseActionSetBuilder actionSet](self, "actionSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "uniqueIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR(" (%@)"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ action set: %@%@"), v10, v11, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ action set: %@%@"), v10, v11, &stru_1EA741FF8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }

    HFLogForCategory(0x31uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v17;
      _os_signpost_emit_with_name_impl(&dword_1DD34E000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v7, "HFActionSetBuilderCommit", "%@", buf, 0xCu);
    }

    -[HFAbstractBaseActionSetBuilder actionSet](self, "actionSet");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = HFOperationEditActionSet;
    if (!v20)
      v21 = HFOperationAddActionSet;
    v22 = *v21;

    -[HFItemBuilder home](self, "home");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "areAutomationBuildersSupported");

    if (v24)
      -[HFActionSetBuilder _builderCommitItem](self, "_builderCommitItem");
    else
      -[HFActionSetBuilder _legacyCommitItemWithOperationType:](self, "_legacyCommitItemWithOperationType:", v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __32__HFActionSetBuilder_commitItem__block_invoke;
    v33[3] = &unk_1EA73C658;
    v34 = v17;
    v35 = v7;
    v27 = v17;
    v28 = (id)objc_msgSend(v25, "addCompletionBlock:", v33);
    v31[0] = v26;
    v31[1] = 3221225472;
    v31[2] = __32__HFActionSetBuilder_commitItem__block_invoke_30;
    v31[3] = &unk_1EA726990;
    v31[4] = self;
    v32 = v22;
    v29 = v22;
    objc_msgSend(v25, "recover:", v31);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

void __32__HFActionSetBuilder_commitItem__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  __CFString *v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x31uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" error: %@"), v4);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = &stru_1EA741FF8;
    }
    *(_DWORD *)buf = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_signpost_emit_with_name_impl(&dword_1DD34E000, v6, OS_SIGNPOST_INTERVAL_END, v7, "HFActionSetBuilderCommit", "%@%@", buf, 0x16u);
    if (v4)

  }
}

id __32__HFActionSetBuilder_commitItem__block_invoke_30(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(*(id *)(a1 + 32), "transformedError:withOperationType:", a2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithError:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)notifyObserversForCreatedActionSet:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__HFActionSetBuilder_notifyObserversForCreatedActionSet___block_invoke;
  v7[3] = &unk_1EA7277C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "dispatchHomeObserverMessage:sender:", v7, 0);

}

void __57__HFActionSetBuilder_notifyObserversForCreatedActionSet___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "home:didAddActionSet:", v3, *(_QWORD *)(a1 + 40));

  }
}

- (void)notifyObserversForRenamedActionSet:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__HFActionSetBuilder_notifyObserversForRenamedActionSet___block_invoke;
  v7[3] = &unk_1EA7277C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "dispatchHomeObserverMessage:sender:", v7, 0);

}

void __57__HFActionSetBuilder_notifyObserversForRenamedActionSet___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "home:didUpdateNameForActionSet:", v3, *(_QWORD *)(a1 + 40));

  }
}

- (id)transformedError:(id)a3 withOperationType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[HFActionSetBuilder name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_errorWithOperationType:failedItemName:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_builderCommitItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  HFActionSetBuilder *v17;

  -[HFActionSetBuilder performValidation](self, "performValidation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HFActionSetBuilder getOrCreateActionSetBuilder](self, "getOrCreateActionSetBuilder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "builder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFActionSetBuilder updateActionSetBuilder:](self, "updateActionSetBuilder:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __40__HFActionSetBuilder__builderCommitItem__block_invoke;
    v15[3] = &unk_1EA732620;
    v9 = v5;
    v16 = v9;
    v17 = self;
    objc_msgSend(v7, "flatMap:", v15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __40__HFActionSetBuilder__builderCommitItem__block_invoke_2;
    v13[3] = &unk_1EA735638;
    v13[4] = self;
    v14 = v9;
    v10 = v9;
    v11 = (id)objc_msgSend(v4, "addSuccessBlock:", v13);

  }
  return v4;
}

id __40__HFActionSetBuilder__builderCommitItem__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "commitActionSetInHome:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __40__HFActionSetBuilder__builderCommitItem__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "setActionSet:");
  objc_msgSend(*(id *)(a1 + 40), "actionSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  if (v4)
    objc_msgSend(v5, "notifyObserversForRenamedActionSet:", v6);
  else
    objc_msgSend(v5, "notifyObserversForCreatedActionSet:", v6);

}

- (id)_legacyCommitItemWithOperationType:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  id *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  HFActionSetBuilder *v31;
  _QWORD v32[5];
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[4];
  id v38;
  _QWORD v39[5];
  _QWORD v40[5];
  id location;
  _QWORD v42[6];

  v42[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  -[HFAbstractBaseActionSetBuilder actionSet](self, "actionSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == 0;

  v7 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    -[HFItemBuilder home](self, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "actionSets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v7;
    v40[1] = 3221225472;
    v40[2] = __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke;
    v40[3] = &unk_1EA728840;
    v40[4] = self;
    objc_msgSend(v9, "na_firstObjectPassingTest:", v40);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAbstractBaseActionSetBuilder setActionSet:](self, "setActionSet:", v10);

  }
  -[HFAbstractBaseActionSetBuilder actionSet](self, "actionSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == 0;

  -[HFActionSetBuilder _lazy_performValidation](self, "_lazy_performValidation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v39[0] = v7;
    v39[1] = 3221225472;
    v39[2] = __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_2;
    v39[3] = &unk_1EA726940;
    v39[4] = self;
    objc_msgSend(v13, "flatMap:", v39);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v37[0] = v7;
    v37[1] = 3221225472;
    v37[2] = __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_4;
    v37[3] = &unk_1EA73C680;
    v15 = &v38;
    objc_copyWeak(&v38, &location);
    v18 = (id)objc_msgSend(v14, "addSuccessBlock:", v37);
    v36[0] = v7;
    v36[1] = 3221225472;
    v36[2] = __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_39;
    v36[3] = &unk_1EA726968;
    v36[4] = self;
    v19 = (id)objc_msgSend(v14, "addFailureBlock:", v36);
  }
  else
  {
    v35[0] = v7;
    v35[1] = 3221225472;
    v35[2] = __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_40;
    v35[3] = &unk_1EA726940;
    v35[4] = self;
    objc_msgSend(v13, "flatMap:", v35);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v33[0] = v7;
    v33[1] = 3221225472;
    v33[2] = __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_3_43;
    v33[3] = &unk_1EA73C6A8;
    v15 = &v34;
    objc_copyWeak(&v34, &location);
    v33[4] = self;
    v16 = (id)objc_msgSend(v14, "addSuccessBlock:", v33);
    v32[0] = v7;
    v32[1] = 3221225472;
    v32[2] = __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_45;
    v32[3] = &unk_1EA726968;
    v32[4] = self;
    v17 = (id)objc_msgSend(v14, "addFailureBlock:", v32);
  }
  objc_destroyWeak(v15);
  v20 = (void *)MEMORY[0x1E0D519C0];
  v42[0] = v14;
  -[HFAbstractBaseActionSetBuilder lazilyUpdateActions](self, "lazilyUpdateActions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v21;
  -[HFActionSetBuilder _lazilyUpdateIncludedContext](self, "_lazilyUpdateIncludedContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v22;
  -[HFActionSetBuilder _lazilyUpdateIcon](self, "_lazilyUpdateIcon");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "chainFutures:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = v7;
  v29[1] = 3221225472;
  v29[2] = __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_49;
  v29[3] = &unk_1EA726990;
  v26 = v4;
  v30 = v26;
  v31 = self;
  objc_msgSend(v25, "recover:", v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&location);
  return v27;
}

BOOL __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;

  v3 = a2;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v7))
  {
    objc_msgSend(v3, "actions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") == 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_2(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_3;
  v2[3] = &unk_1EA7268F0;
  v2[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithCompletionHandlerAdapterBlock:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "home");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addActionSetWithName:completionHandler:", v5, v4);

}

void __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  HFLogForCategory(0x28uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Created action set with name:%@.", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(WeakRetained, "setActionSet:", v3);
  objc_msgSend(WeakRetained, "notifyObserversForCreatedActionSet:", v3);

}

void __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_39(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Failed to create action set with name:%@. Error: %@", (uint8_t *)&v6, 0x16u);

  }
}

id __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_40(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_2_41;
  v2[3] = &unk_1EA7268C8;
  v2[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_2_41(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "actionSet");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateName:completionHandler:", v5, v4);

}

void __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_3_43(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "actionSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "notifyObserversForRenamedActionSet:", v3);

  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Updated action set name:%@.", (uint8_t *)&v6, 0xCu);

  }
}

void __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_45(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logError:operationDescription:", v3, CFSTR("HFActionSetBuilder.updateName"));

  HFLogForCategory(0x28uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "2 Failed to update action set name name:%@. Error: %@", (uint8_t *)&v7, 0x16u);

  }
}

id __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_49(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  if (*(__CFString **)(a1 + 32) == CFSTR("HFOperationAddActionSet"))
  {
    v5 = *(void **)(a1 + 40);
    v6 = a2;
    objc_msgSend(v5, "deleteActionSet");
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0D519C0];
    v4 = a2;
    objc_msgSend(v3, "futureWithNoResult");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_2_50;
  v17[3] = &unk_1EA726940;
  v10 = v8;
  v18 = v10;
  objc_msgSend(v7, "flatMap:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_3_51;
  v15[3] = &unk_1EA72A050;
  v16 = v10;
  v12 = v10;
  objc_msgSend(v11, "recover:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_2_50(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_3_51(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)_lazilyUpdateIncludedContext
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__HFActionSetBuilder__lazilyUpdateIncludedContext__block_invoke;
  v3[3] = &unk_1EA728A78;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0D519C0], "lazyFutureWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __50__HFActionSetBuilder__lazilyUpdateIncludedContext__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_updateValueForContextType:", 3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "completionHandlerAdapter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (id)objc_msgSend(v6, "addCompletionBlock:", v4);
}

- (id)_updateValueForContextType:(unint64_t)a3
{
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  _QWORD v11[6];
  char v12;

  switch(a3)
  {
    case 0uLL:
    case 2uLL:
      NSLog(CFSTR("ActionSet's value cannot be updated since it cannot be favorited."), a2);
      goto LABEL_4;
    case 1uLL:
      NSLog(CFSTR("ActionSet's value cannot be updated since it cannot be included in status."), a2);
      goto LABEL_4;
    case 3uLL:
      v5 = -[HFActionSetBuilder showInHomeDashboard](self, "showInHomeDashboard");
      goto LABEL_6;
    default:
LABEL_4:
      v5 = 0;
LABEL_6:
      -[HFAbstractBaseActionSetBuilder actionSet](self, "actionSet");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 == objc_msgSend(v6, "hf_isOnForContextType:", a3))
      {
        -[HFAbstractBaseActionSetBuilder actionSet](self, "actionSet");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "hf_hasSetForContextType:", a3);

        if (v8)
        {
          objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          return v9;
        }
      }
      else
      {

      }
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __49__HFActionSetBuilder__updateValueForContextType___block_invoke;
      v11[3] = &unk_1EA72CB90;
      v12 = v5;
      v11[4] = self;
      v11[5] = a3;
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithBlock:", v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      return v9;
  }
}

void __49__HFActionSetBuilder__updateValueForContextType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  char v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "actionSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_updateValue:forContextType:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__HFActionSetBuilder__updateValueForContextType___block_invoke_2;
  v10[3] = &unk_1EA73C6D0;
  v13 = *(_BYTE *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v11 = v3;
  v12 = v6;
  v10[4] = v7;
  v8 = v3;
  v9 = (id)objc_msgSend(v5, "addCompletionBlock:", v10);

}

void __49__HFActionSetBuilder__updateValueForContextType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  int v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  HFLogForCategory(0x28uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(unsigned __int8 *)(a1 + 56);
      v10 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "actionSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hf_prettyDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109890;
      v18 = v9;
      v19 = 2048;
      v20 = v10;
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v5;
      _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "Failed to set state:%{BOOL}d for context type:%lu for actionSet:%@. Error: %@", buf, 0x26u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(unsigned __int8 *)(a1 + 56);
    v14 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "actionSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hf_prettyDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109634;
    v18 = v13;
    v19 = 2048;
    v20 = v14;
    v21 = 2112;
    v22 = v12;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Set state:%{BOOL}d for context type:%lu for actionSet:%@", buf, 0x1Cu);
    goto LABEL_6;
  }

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __49__HFActionSetBuilder__updateValueForContextType___block_invoke_57;
  v16[3] = &unk_1EA726918;
  v16[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v15, "dispatchHomeObserverMessage:sender:", v16, 0);

  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:error:", v6, v5);
}

void __49__HFActionSetBuilder__updateValueForContextType___block_invoke_57(uint64_t a1, void *a2)
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
    objc_msgSend(v5, "home:didUpdateApplicationDataForActionSet:", v3, v4);

  }
}

- (id)_lazilyUpdateIcon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[5];

  -[HFAbstractBaseActionSetBuilder actionSet](self, "actionSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_iconDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFAbstractBaseActionSetBuilder actionSet](self, "actionSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_iconTintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFActionSetBuilder iconDescriptor](self, "iconDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "isEqualToString:", v9);

  if (v10
    && (-[HFActionSetBuilder iconTintColor](self, "iconTintColor"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v7, "isEqual:", v11),
        v11,
        v12))
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __39__HFActionSetBuilder__lazilyUpdateIcon__block_invoke;
    v16[3] = &unk_1EA728A78;
    v16[4] = self;
    objc_msgSend(MEMORY[0x1E0D519C0], "lazyFutureWithBlock:", v16);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;

  return v14;
}

void __39__HFActionSetBuilder__lazilyUpdateIcon__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "iconDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSystemImage");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "iconDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Action Set Builder expected SF Symbol icon. %@"), v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "actionSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "iconDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "iconTintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_setIconIdentifier:andTintColor:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __39__HFActionSetBuilder__lazilyUpdateIcon__block_invoke_2;
  v14[3] = &unk_1EA72A0C8;
  v14[4] = *(_QWORD *)(a1 + 32);
  v15 = v3;
  v12 = v3;
  v13 = (id)objc_msgSend(v11, "addCompletionBlock:", v14);

}

void __39__HFActionSetBuilder__lazilyUpdateIcon__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  HFLogForCategory(0x28uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "iconDescriptor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "actionSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hf_prettyDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v16 = v10;
      v17 = 2112;
      v18 = v12;
      v19 = 2112;
      v20 = v5;
      _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "Failed to set icon:%@ for actionSet:%@. Error: %@", buf, 0x20u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "iconDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "actionSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hf_prettyDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v16 = v10;
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Set icon:%@ for actionSet:%@", buf, 0x16u);
    goto LABEL_6;
  }

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __39__HFActionSetBuilder__lazilyUpdateIcon__block_invoke_62;
  v14[3] = &unk_1EA726918;
  v14[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v13, "dispatchHomeObserverMessage:sender:", v14, 0);

  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:error:", v6, v5);
}

void __39__HFActionSetBuilder__lazilyUpdateIcon__block_invoke_62(uint64_t a1, void *a2)
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
    objc_msgSend(v5, "home:didUpdateApplicationDataForActionSet:", v3, v4);

  }
}

- (id)_deleteActionSet:(id)a3 fromHome:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  HFActionSetBuilder *v28;
  _QWORD v29[4];
  id v30;
  id v31;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v8)
  {
    objc_msgSend(v6, "actionSetType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB8238]);
    v11 = (void *)MEMORY[0x1E0D519C0];
    v12 = MEMORY[0x1E0C809B0];
    if (v10)
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __48__HFActionSetBuilder__deleteActionSet_fromHome___block_invoke;
      v29[3] = &unk_1EA728590;
      v13 = v7;
      v30 = v13;
      v14 = v6;
      v31 = v14;
      objc_msgSend(v11, "futureWithErrorOnlyHandlerAdapterBlock:", v29);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v12;
      v25[1] = 3221225472;
      v25[2] = __48__HFActionSetBuilder__deleteActionSet_fromHome___block_invoke_2;
      v25[3] = &unk_1EA726EF8;
      v26 = v13;
      v27 = v14;
      v28 = self;
      objc_msgSend(v15, "addCompletionBlock:", v25);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v30;
    }
    else
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __48__HFActionSetBuilder__deleteActionSet_fromHome___block_invoke_67;
      v23[3] = &unk_1EA729F18;
      v23[4] = self;
      v24 = v6;
      objc_msgSend(v11, "futureWithBlock:", v23);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v24;
    }

    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __48__HFActionSetBuilder__deleteActionSet_fromHome___block_invoke_68;
    v21[3] = &unk_1EA726940;
    v22 = v9;
    v19 = v9;
    objc_msgSend(v16, "flatMap:", v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

uint64_t __48__HFActionSetBuilder__deleteActionSet_fromHome___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeActionSet:completionHandler:", *(_QWORD *)(a1 + 40), a2);
}

void __48__HFActionSetBuilder__deleteActionSet_fromHome___block_invoke_2(id *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __48__HFActionSetBuilder__deleteActionSet_fromHome___block_invoke_3;
  v13 = &unk_1EA7277C8;
  v14 = a1[4];
  v15 = a1[5];
  objc_msgSend(v5, "dispatchHomeObserverMessage:sender:", &v10, 0);

  objc_msgSend(a1[6], "setActionSet:", 0, v10, v11, v12, v13);
  objc_msgSend(a1[6], "setIsActionSetDeleted:", 1);
  HFLogForCategory(0x28uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1[5], "hf_prettyDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "home");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v17 = v4;
      v18 = 2112;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      _os_log_error_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_ERROR, "Failed to delete actionSet (error = %@) :%@ home:%@", buf, 0x20u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1[5], "hf_prettyDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Deleted actionSet:%@ home:%@", buf, 0x16u);
    goto LABEL_6;
  }

}

void __48__HFActionSetBuilder__deleteActionSet_fromHome___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "home:didRemoveActionSet:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __48__HFActionSetBuilder__deleteActionSet_fromHome___block_invoke_67(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "removeAllActions");
  HFLogForCategory(0x28uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "hf_prettyDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Removed all actions from actionSet:%@ home:%@", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(v4, "finishWithNoResult");

}

uint64_t __48__HFActionSetBuilder__deleteActionSet_fromHome___block_invoke_68(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HFActionSetBuilder;
  v5 = -[HFAbstractBaseActionSetBuilder copyWithZone:](&v11, sel_copyWithZone_);
  -[HFActionSetBuilder name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setName:", v7);

  objc_msgSend(v5, "setShowInHomeDashboard:", -[HFActionSetBuilder showInHomeDashboard](self, "showInHomeDashboard"));
  -[HFActionSetBuilder iconDescriptor](self, "iconDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIconDescriptor:", v8);

  -[HFActionSetBuilder iconTintColor](self, "iconTintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIconTintColor:", v9);

  objc_msgSend(v5, "setIsActionSetDeleted:", -[HFActionSetBuilder isActionSetDeleted](self, "isActionSetDeleted"));
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)showInHomeDashboard
{
  return self->_showInHomeDashboard;
}

- (void)setShowInHomeDashboard:(BOOL)a3
{
  self->_showInHomeDashboard = a3;
}

- (HFImageIconDescriptor)iconDescriptor
{
  return self->_iconDescriptor;
}

- (void)setIconDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_iconDescriptor, a3);
}

- (UIColor)iconTintColor
{
  return self->_iconTintColor;
}

- (void)setIconTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_iconTintColor, a3);
}

- (BOOL)isActionSetDeleted
{
  return self->_isActionSetDeleted;
}

- (void)setIsActionSetDeleted:(BOOL)a3
{
  self->_isActionSetDeleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconTintColor, 0);
  objc_storeStrong((id *)&self->_iconDescriptor, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
