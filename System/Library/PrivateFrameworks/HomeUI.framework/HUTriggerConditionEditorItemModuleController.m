@implementation HUTriggerConditionEditorItemModuleController

- (HUTriggerConditionEditorItemModuleController)initWithModule:(id)a3 delegate:(id)a4
{
  id v6;
  HUTriggerConditionEditorItemModuleController *v7;
  HUTriggerConditionEditorItemModuleController *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HUTriggerConditionEditorItemModuleController;
  v7 = -[HUItemModuleController initWithModule:](&v10, sel_initWithModule_, a3);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->_delegate, v6);

  return v8;
}

- (Class)cellClassForItem:(id)a3
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v14;

  v5 = a3;
  -[HUItemModuleController module](self, "module");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isShowConditionOptionsItem:", v5);

  if (v7)
    goto LABEL_4;
  -[HUItemModuleController module](self, "module");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isCustomConditionSwitchItem:", v5);

  if (v9
    || (-[HUItemModuleController module](self, "module"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isConditionOptionItem:", v5),
        v10,
        v11))
  {
LABEL_4:
    objc_opt_class();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTriggerConditionEditorItemModuleController.m"), 57, CFSTR("Unknown item %@"), v5);

    v12 = 0;
  }

  return (Class)v12;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v6 = a4;
  -[HUItemModuleController module](self, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isShowConditionOptionsItem:", v6);

  if (v8)
  {
    v9 = objc_opt_class();
    v10 = v22;
    if (v10)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
      v12 = v10;
      if (v11)
        goto LABEL_9;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v9, objc_opt_class());

    }
    v12 = 0;
LABEL_9:

    objc_msgSend(v12, "setHideIcon:", 1);
    objc_msgSend(v12, "setValueColorFollowsTintColor:", 1);
    objc_msgSend(v12, "setAccessoryType:", 0);
LABEL_19:

    goto LABEL_20;
  }
  -[HUItemModuleController module](self, "module");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isCustomConditionSwitchItem:", v6);

  if (v16)
  {
    v17 = objc_opt_class();
    v18 = v22;
    if (v18)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;
      v12 = v18;
      if (v19)
        goto LABEL_18;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v17, objc_opt_class());

    }
    v12 = 0;
LABEL_18:

    objc_msgSend(v12, "setDelegate:", self);
    goto LABEL_19;
  }
LABEL_20:

}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  v24 = a3;
  v7 = a4;
  -[HUItemModuleController module](self, "module");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isConditionOptionItem:", v7);

  if (!v9)
    goto LABEL_15;
  v10 = objc_opt_class();
  v11 = v24;
  if (v11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v11;
    if (v12)
      goto LABEL_9;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v10, objc_opt_class());

  }
  v13 = 0;
LABEL_9:

  objc_msgSend(v7, "latestResults");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitleText:", v17);

  objc_msgSend(v7, "latestResults");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDescriptionText:", v19);

  objc_msgSend(v7, "latestResults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E20]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "unsignedIntegerValue");

  objc_msgSend(v13, "setChecked:", v22 == 2);
  if (v22 == 2)
  {
    if (-[HUTriggerConditionEditorItemModuleController _canEditConditionOptionItem:](self, "_canEditConditionOptionItem:", v7))
    {
      v23 = 4;
    }
    else
    {
      v23 = 0;
    }
  }
  else
  {
    v23 = 0;
  }
  objc_msgSend(v13, "setAccessoryType:", v23);

LABEL_15:
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isShowConditionOptionsItem:", v4);

  -[HUItemModuleController module](self, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    v9 = objc_msgSend(v7, "conditionTypeForItem:", v4);

    -[HUItemModuleController module](self, "module");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "shouldShowConditionOptionsForType:", v9) ^ 1;

    -[HUItemModuleController module](self, "module");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShowConditionOptions:forType:", v11, v9);
LABEL_9:

    goto LABEL_10;
  }
  v13 = objc_msgSend(v7, "isConditionOptionItem:", v4);

  if (v13)
  {
    -[HUItemModuleController module](self, "module");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "doesConditionOptionItemRequireInitialConfiguration:", v4);

    if (v15)
    {
      -[HUTriggerConditionEditorItemModuleController _presentDetailEditorForConditionOptionItem:](self, "_presentDetailEditorForConditionOptionItem:", v4);
    }
    else
    {
      -[HUItemModuleController module](self, "module");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "conditionTypeForItem:", v4);

      -[HUItemModuleController module](self, "module");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setSelectedConditionOptionItem:forType:", v4, v17);

    }
    -[HUTriggerConditionEditorItemModuleController delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      -[HUTriggerConditionEditorItemModuleController delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUItemModuleController module](self, "module");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "conditionCollection");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "conditionEditorModuleController:didUpdateConditionCollection:", self, v22);

      goto LABEL_9;
    }
  }
LABEL_10:

  return 0;
}

- (void)accessoryButtonTappedForItem:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  -[HUItemModuleController module](self, "module");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isConditionOptionItem:", v6);

  if (v5)
    -[HUTriggerConditionEditorItemModuleController _presentDetailEditorForConditionOptionItem:](self, "_presentDetailEditorForConditionOptionItem:", v6);

}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a4;
  v15 = a3;
  -[HUItemModuleController module](self, "module");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isCustomConditionSwitchItem:", v7);

  if (v8)
  {
    -[HUItemModuleController module](self, "module");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "item");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v9, "setCustomConditionEnabled:forItem:", v4, v10);

    -[HUTriggerConditionEditorItemModuleController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[HUTriggerConditionEditorItemModuleController delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUItemModuleController module](self, "module");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "conditionCollection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "conditionEditorModuleController:didUpdateConditionCollection:", self, v14);

    }
  }

}

- (void)timeConditionEditor:(id)a3 didFinishWithCondition:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[HUItemModuleController module](self, "module");
  v7 = objc_claimAutoreleasedReturnValue();
  -[HUTriggerConditionEditorItemModuleController detailEditingContext](self, "detailEditingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "optionItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v7, "updateCondition:forOptionItem:", v6, v9);

  -[HUTriggerConditionEditorItemModuleController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[HUTriggerConditionEditorItemModuleController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemModuleController module](self, "module");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "conditionCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "conditionEditorModuleController:didUpdateConditionCollection:", self, v13);

  }
  -[HUTriggerConditionEditorItemModuleController _dismissDetailEditor:](self, "_dismissDetailEditor:", v14);

}

- (BOOL)_canEditConditionOptionItem:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "conditionForOptionItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  LOBYTE(v5) = objc_opt_isKindOfClass();

  return v5 & 1;
}

- (void)_dismissDetailEditor:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[HUTriggerConditionEditorItemModuleController detailEditingContext](self, "detailEditingContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v10)
  {
    -[HUTriggerConditionEditorItemModuleController detailEditingContext](self, "detailEditingContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Unrecognized editor %@ or nil context %@!"), v10, v6);

  }
  -[HUTriggerConditionEditorItemModuleController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerConditionEditorItemModuleController detailEditingContext](self, "detailEditingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "conditionEditorModuleController:dismissDetailViewController:", self, v9);

  -[HUTriggerConditionEditorItemModuleController setDetailEditingContext:](self, "setDetailEditingContext:", 0);
}

- (void)_presentDetailEditorForConditionOptionItem:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  HUTriggerTimeConditionDetailEditorViewController *v9;
  void *v10;
  HUTriggerConditionDetailEditingContext *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[HUItemModuleController module](self, "module");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conditionForOptionItem:", v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v6 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    v9 = -[HUTriggerTimeConditionDetailEditorViewController initWithRangeCondition:delegate:]([HUTriggerTimeConditionDetailEditorViewController alloc], "initWithRangeCondition:delegate:", v8, self);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v9);
    objc_msgSend(v10, "setModalPresentationStyle:", 2);
    v11 = objc_alloc_init(HUTriggerConditionDetailEditingContext);
    -[HUTriggerConditionDetailEditingContext setOptionItem:](v11, "setOptionItem:", v14);
    -[HUTriggerConditionDetailEditingContext setViewController:](v11, "setViewController:", v9);
    -[HUTriggerConditionDetailEditingContext setNavigationController:](v11, "setNavigationController:", v10);
    -[HUTriggerConditionEditorItemModuleController detailEditingContext](self, "detailEditingContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      NSLog(CFSTR("Already have a detail editing context!"));
    -[HUTriggerConditionEditorItemModuleController setDetailEditingContext:](self, "setDetailEditingContext:", v11);
    -[HUTriggerConditionEditorItemModuleController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "conditionEditorModuleController:presentDetailViewController:", self, v10);

  }
  else
  {
    NSLog(CFSTR("The time condition detail editor currently only supports time range conditions; condition %@ is unsupported."),
      v6);
  }

}

- (HUTriggerConditionEditorItemModuleControllerDelegate)delegate
{
  return (HUTriggerConditionEditorItemModuleControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (HUTriggerConditionDetailEditingContext)detailEditingContext
{
  return self->_detailEditingContext;
}

- (void)setDetailEditingContext:(id)a3
{
  objc_storeStrong((id *)&self->_detailEditingContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailEditingContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
