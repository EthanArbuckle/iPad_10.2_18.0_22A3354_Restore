@implementation HURecommendedTriggerItemModuleController

- (Class)cellClassForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moreButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  double v23;
  objc_super v24;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v10 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    objc_msgSend(v12, "setIconDisplayStyle:", 1);
    HUDefaultSizeForIconSize();
    v14 = v13;
    v16 = v15;
    objc_msgSend(v12, "contentMetrics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setIconSize:", v14, v16);

    objc_msgSend(v12, "contentMetrics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setContentInset:", 12.0, 0.0, 12.0, 0.0);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "latestResults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "BOOLValue");

    v22 = v8;
    objc_msgSend(v22, "setDisabled:", v21);
    objc_msgSend(v22, "setAccessoryType:", v21 ^ 1);
    if ((_DWORD)v21)
      v23 = 0.200000003;
    else
      v23 = 1.0;
    objc_msgSend(v22, "setIconAlpha:", v23);
    objc_msgSend(v22, "setTextAlpha:", v23);
    objc_msgSend(v22, "setIconDisplayStyle:", 1);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v8, "setAccessoryType:", 1);
  v24.receiver = self;
  v24.super_class = (Class)HURecommendedTriggerItemModuleController;
  -[HUItemModuleController updateCell:forItem:animated:](&v24, sel_updateCell_forItem_animated_, v8, v9, v5);

}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  HUTriggerBuilderContext *v11;
  void *v12;
  HUTriggerBuilderContext *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "recommendation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hu_triggerBuilderIfAny");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = [HUTriggerBuilderContext alloc];
      objc_msgSend(v10, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[HUTriggerBuilderContext initWithTriggerBuilderContext:](v11, "initWithTriggerBuilderContext:", v12);

      -[HUTriggerBuilderContext setSuggestionItem:](v13, "setSuggestionItem:", v7);
      objc_msgSend(v10, "triggerBuilderWithContext:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[HURecommendedTriggerItemModuleController delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "recommendedTriggerModuleController:didSelectToOpenTriggerBuilder:", self, v14);

    }
  }
  -[HUItemModuleController module](self, "module");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "moreButtonItem");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v17 == v5)
  {
    -[HURecommendedTriggerItemModuleController delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "recommendedTriggerModuleControllerDidSelectShowMore:", self);

  }
  return 0;
}

- (void)didCommitTriggerBuilderForItem:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  v17 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v17;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "recommendation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "analyticsData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7 == 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D30368]);

    objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E7041E30, *MEMORY[0x1E0D302F8]);
    if (v7)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30300]);
    -[HURecommendedTriggerItemModuleController analyticsPresentationContext](self, "analyticsPresentationContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[HURecommendedTriggerItemModuleController analyticsPresentationContext](self, "analyticsPresentationContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D30338]);

    }
    objc_msgSend(MEMORY[0x1E0D31170], "sendEvent:withData:", 14, v13);

  }
}

- (HURecommendedTriggerItemModuleControllerDelegate)delegate
{
  return (HURecommendedTriggerItemModuleControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)analyticsPresentationContext
{
  return self->_analyticsPresentationContext;
}

- (void)setAnalyticsPresentationContext:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsPresentationContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsPresentationContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
