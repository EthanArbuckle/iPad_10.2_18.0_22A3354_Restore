@implementation HUTriggerDurationModuleController

- (Class)cellClassForItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_class *v8;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "durationSummaryItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v4)
  {
    -[HUItemModuleController module](self, "module");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "durationPickerItem");

  }
  v8 = (objc_class *)(id)objc_opt_class();

  return v8;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HUTriggerDurationModuleController;
  -[HUItemModuleController setupCell:forItem:](&v21, sel_setupCell_forItem_, v6, v7);
  -[HUItemModuleController module](self, "module");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "durationSummaryItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
  {
    objc_opt_class();
    v11 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    objc_msgSend(v13, "setHideIcon:", 1);
    objc_msgSend(v13, "setValueColorFollowsTintColor:", 1);
    goto LABEL_15;
  }
  -[HUItemModuleController module](self, "module");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "durationPickerItem");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15 == v7)
  {
    v16 = objc_opt_class();
    v17 = v6;
    if (v17)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
      v13 = v17;
      if (v18)
        goto LABEL_14;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v16, objc_opt_class());

    }
    v13 = 0;
LABEL_14:

    objc_msgSend(v13, "setDelegate:", self);
LABEL_15:

  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v7 = a4;
  -[HUItemModuleController module](self, "module");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "durationPickerItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (!v10)
    goto LABEL_13;
  v11 = objc_opt_class();
  v12 = v21;
  if (v12)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v12;
    if (v13)
      goto LABEL_9;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v11, objc_opt_class());

  }
  v14 = 0;
LABEL_9:

  -[HUTriggerDurationModuleController _durationEventBuilder](self, "_durationEventBuilder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v17, "duration");
    objc_msgSend(v19, "numberWithDouble:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCurrentDuration:", v20);

  }
  else
  {
    objc_msgSend(v14, "setCurrentDuration:", 0);
  }

LABEL_13:
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "durationSummaryItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[HUItemModuleController module](self, "module");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "durationPickerShown");
    v9 = v8;
    v10 = v8 ^ 1u;

    -[HUItemModuleController module](self, "module");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDurationPickerShown:", v10);

    if ((v9 & 1) == 0)
    {
      -[HUTriggerDurationModuleController delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUItemModuleController module](self, "module");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "durationPickerItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "durationModuleController:requestsScrollToItem:", self, v14);

    }
  }
  return 0;
}

- (void)durationPicker:(id)a3 didSelectDuration:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  if (v10)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D31390]);
    objc_msgSend(v10, "doubleValue");
    objc_msgSend(v5, "setDuration:");
    -[HUItemModuleController module](self, "module");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "triggerBuilder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEndEvent:", v5);

  }
  else
  {
    -[HUItemModuleController module](self, "module");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "triggerBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllEndEventBuilders");
  }

  -[HUItemModuleController module](self, "module");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "triggerBuilderDidChange");

}

- (id)_durationEventBuilder
{
  void *v2;
  void *v3;
  void *v4;

  -[HUItemModuleController module](self, "module");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "designatedDurationEventBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HUTriggerDurationModuleControllerDelegate)delegate
{
  return (HUTriggerDurationModuleControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
