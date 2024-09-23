@implementation HUAvailableRelatedTriggerItemModuleController

- (HUAvailableRelatedTriggerItemModuleController)initWithModule:(id)a3
{
  HUAvailableRelatedTriggerItemModuleController *v3;
  HUAvailableRelatedTriggerItemModuleController *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUAvailableRelatedTriggerItemModuleController;
  v3 = -[HUItemModuleController initWithModule:](&v7, sel_initWithModule_, a3);
  v4 = v3;
  if (v3)
  {
    -[HUItemModuleController module](v3, "module");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEditButtonHeaderDelegate:", v4);

    -[HUAvailableRelatedTriggerItemModuleController setEditing:](v4, "setEditing:", 0);
    -[HUAvailableRelatedTriggerItemModuleController _updateUIAnimated:](v4, "_updateUIAnimated:", 0);
  }
  return v4;
}

- (UIActivityIndicatorView)addAutomationActivityIndicator
{
  UIActivityIndicatorView *addAutomationActivityIndicator;
  UIActivityIndicatorView *v4;
  UIActivityIndicatorView *v5;

  addAutomationActivityIndicator = self->_addAutomationActivityIndicator;
  if (!addAutomationActivityIndicator)
  {
    v4 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
    v5 = self->_addAutomationActivityIndicator;
    self->_addAutomationActivityIndicator = v4;

    addAutomationActivityIndicator = self->_addAutomationActivityIndicator;
  }
  return addAutomationActivityIndicator;
}

- (id)commitSelectedItems
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  id v8;
  id location;

  objc_initWeak(&location, self);
  -[HUItemModuleController module](self, "module");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activateAllSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__HUAvailableRelatedTriggerItemModuleController_commitSelectedItems__block_invoke;
  v7[3] = &unk_1E6F527B0;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  objc_msgSend(v4, "recover:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
  return v5;
}

id __68__HUAvailableRelatedTriggerItemModuleController_commitSelectedItems__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  _QWORD v8[5];

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__HUAvailableRelatedTriggerItemModuleController_commitSelectedItems__block_invoke_2;
  v8[3] = &unk_1E6F4C518;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "_handleError:retryBlock:", v4, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __68__HUAvailableRelatedTriggerItemModuleController_commitSelectedItems__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "commitSelectedItems");
}

- (BOOL)triggerModuleShouldHideAddAutomationButton
{
  void *v2;
  char v3;

  -[HUItemModuleController module](self, "module");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "addAutomationItemShouldBeHidden");

  return v3;
}

- (Class)cellClassForItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

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
    objc_msgSend(v7, "triggerItem");

  }
  else
  {
    -[HUItemModuleController module](self, "module");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAutomationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "isEqual:", v9);

    if (!v10)
    {
      -[HUItemModuleController module](self, "module");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "naturalLightingItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v5, "isEqual:", v12);

      if (!v13)
      {
        v17.receiver = self;
        v17.super_class = (Class)HUAvailableRelatedTriggerItemModuleController;
        -[HUItemModuleController cellClassForItem:](&v17, sel_cellClassForItem_, v5);
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
    }
  }
  objc_opt_class();
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v15 = (void *)v14;

  return (Class)v15;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  objc_super v43;

  v6 = a3;
  v7 = a4;
  v43.receiver = self;
  v43.super_class = (Class)HUAvailableRelatedTriggerItemModuleController;
  -[HUItemModuleController setupCell:forItem:](&v43, sel_setupCell_forItem_, v6, v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v8 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    objc_msgSend(v10, "setIconDisplayStyle:", 1);
    objc_msgSend(v10, "setIconTintColorFollowsDisabledState:", 0);
    HUDefaultSizeForIconSize();
    v12 = v11;
    v14 = v13;
    objc_msgSend(v10, "contentMetrics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setIconSize:", v12, v14);

    objc_msgSend(v10, "contentMetrics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setContentInset:", 12.0, 0.0, 12.0, 0.0);

  }
  objc_opt_class();
  v17 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  if (v19)
  {
    objc_msgSend(v19, "recommendationItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_opt_class();
      v21 = v6;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v22 = v21;
      else
        v22 = 0;
      v23 = v22;

      objc_msgSend(v23, "setDelegate:", self);
LABEL_20:
      objc_msgSend(v23, "setMaxNumberOfTitleLines:", 0);
      objc_msgSend(v23, "setMaxNumberOfDescriptionLines:", 0);
      -[HUItemModuleController module](self, "module");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "context");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setHideIcon:", objc_msgSend(v30, "showsIcons") ^ 1);

LABEL_31:
      goto LABEL_32;
    }
    objc_msgSend(v19, "triggerItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_opt_class();
      v25 = v6;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v26 = v25;
      else
        v26 = 0;
      v23 = v26;

      objc_msgSend(v25, "setAccessoryType:", 1);
      objc_msgSend(MEMORY[0x1E0CEA478], "grayColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "valueLabel");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setTextColor:", v27);

      goto LABEL_20;
    }
  }
  -[HUItemModuleController module](self, "module");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addAutomationItem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v17, "isEqual:", v32);

  if (v33)
  {
    objc_opt_class();
    v34 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v35 = v34;
    else
      v35 = 0;
    v23 = v35;

    objc_msgSend(v23, "setIconForegroundColorFollowsTintColor:", 1);
    objc_msgSend(v23, "setIconDisplayStyle:", 3);
    objc_msgSend(v23, "setTitleColorFollowsTintColor:", 1);
    objc_msgSend(v23, "setHideValue:", 1);
    objc_msgSend(v23, "setHideIcon:", 1);
    goto LABEL_31;
  }
  -[HUItemModuleController module](self, "module");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "naturalLightingItem");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v17, "isEqual:", v37);

  if (v38)
  {
    objc_opt_class();
    v39 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v40 = v39;
    else
      v40 = 0;
    v23 = v40;

    -[HUItemModuleController module](self, "module");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "context");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setHideIcon:", objc_msgSend(v42, "showsIcons") ^ 1);

    objc_msgSend(v23, "setSelectionStyle:", 0);
    objc_msgSend(v23, "setDelegate:", self);
    goto LABEL_31;
  }
LABEL_32:

}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  HUAvailableRelatedTriggerItemModuleController *v40;
  id v41;
  objc_super v42;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v42.receiver = self;
  v42.super_class = (Class)HUAvailableRelatedTriggerItemModuleController;
  -[HUItemModuleController updateCell:forItem:animated:](&v42, sel_updateCell_forItem_animated_, v8, v9, v5);
  objc_opt_class();
  v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    objc_msgSend(v12, "recommendationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend(v12, "triggerItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        goto LABEL_10;
      v14 = 3;
    }
    objc_msgSend(v8, "setSelectionStyle:", v14);
  }
LABEL_10:
  -[HUItemModuleController module](self, "module");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAutomationItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v10, "isEqual:", v17);

  if (v18)
  {
    objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("AccessoryDetails.AddAutomationItem"));
    objc_opt_class();
    objc_msgSend(v10, "latestResults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EA8]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
    v22 = v21;

    v23 = objc_msgSend(v22, "BOOLValue");
    -[HUAvailableRelatedTriggerItemModuleController addAutomationActivityIndicator](self, "addAutomationActivityIndicator");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v23)
    {
      objc_msgSend(v8, "setAccessoryView:", v24);

      -[HUAvailableRelatedTriggerItemModuleController addAutomationActivityIndicator](self, "addAutomationActivityIndicator");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "startAnimating");

    }
    else
    {
      objc_msgSend(v24, "stopAnimating");

      objc_msgSend(v8, "setAccessoryView:", 0);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v40 = self;
    v41 = v12;
    v27 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v10, "latestResults");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E28]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "uniqueIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("AccessoryDetails.%@"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "componentsSeparatedByString:", CFSTR("="));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "firstObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringByReplacingOccurrencesOfString:withString:", CFSTR("("), &stru_1E6F60E80);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringByReplacingOccurrencesOfString:withString:", CFSTR(")"), &stru_1E6F60E80);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("."));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityIdentifier:", v35);

    objc_opt_class();
    v36 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v37 = v36;
    else
      v37 = 0;
    v38 = v37;

    objc_msgSend(v38, "setSwitchHidden:", -[HUAvailableRelatedTriggerItemModuleController editing](v40, "editing"));
    if (-[HUAvailableRelatedTriggerItemModuleController editing](v40, "editing"))
      objc_msgSend(v36, "setSelectionStyle:", 3);

    v12 = v41;
  }

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
  _BOOL4 v11;
  void *v12;
  void *v13;
  int v14;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (!v7)
    goto LABEL_9;
  objc_msgSend(v7, "triggerItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    || (objc_msgSend(v7, "recommendationItem"), (v9 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v10 = (void *)v9,
        v11 = -[HUAvailableRelatedTriggerItemModuleController editing](self, "editing"),
        v10,
        v11))
  {
    -[HUAvailableRelatedTriggerItemModuleController _presentTriggerSummaryForAvailableTriggerItem:](self, "_presentTriggerSummaryForAvailableTriggerItem:", v7);
  }
  else
  {
LABEL_9:
    -[HUItemModuleController module](self, "module");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAutomationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v5, "isEqual:", v13);

    if (v14)
      -[HUAvailableRelatedTriggerItemModuleController _presentAddAutomationViewController](self, "_presentAddAutomationViewController");
  }

  return 0;
}

- (void)_presentTriggerSummaryForAvailableTriggerItem:(id)a3
{
  HUTriggerBuilderContext *v4;
  void *v5;
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
  void *v21;
  HUTriggerActionFlow *v22;
  id v23;

  v23 = a3;
  v4 = objc_alloc_init(HUTriggerBuilderContext);
  objc_msgSend(v23, "recommendationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_4;
  objc_msgSend(v23, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerBuilderContext setTriggerContextAwareTitle:](v4, "setTriggerContextAwareTitle:", v7);

  objc_msgSend(v23, "recommendationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recommendation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hu_triggerBuilderIfAny");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trigger");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerBuilderContext setShowTriggerDeleteButton:](v4, "setShowTriggerDeleteButton:", v11 != 0);

  -[HUTriggerBuilderContext setSuggestionItem:](v4, "setSuggestionItem:", v23);
  if ((objc_msgSend(v23, "isActive") & 1) != 0)
    goto LABEL_4;
  -[HUItemModuleController module](self, "module");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemModuleController module](self, "module");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "relatedItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "buildersForActivating:inHome:withContext:serviceLikeItems:", 1, v13, v4, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
LABEL_4:
    v18 = (void *)MEMORY[0x1E0D31938];
    objc_msgSend(v23, "trigger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemModuleController module](self, "module");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "home");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "triggerBuilderForTrigger:inHome:context:", v19, v21, v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v22 = -[HUTriggerActionFlow initWithFlowState:]([HUTriggerActionFlow alloc], "initWithFlowState:", 3);
  -[HUAvailableRelatedTriggerItemModuleController _presentTriggerSummaryForTriggerBuilder:flow:](self, "_presentTriggerSummaryForTriggerBuilder:flow:", v17, v22);

}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  objc_msgSend(a3, "item");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HUAvailableRelatedTriggerItemModuleController _enableItemPressed:enabled:](self, "_enableItemPressed:enabled:", v6, v4);

}

- (void)triggerEditor:(id)a3 didFinishWithTriggerBuilder:(id)a4
{
  id v4;

  v4 = -[HUAvailableRelatedTriggerItemModuleController _dismissViewController:](self, "_dismissViewController:", a3, a4);
}

- (void)triggerEditor:(id)a3 didCommitTriggerBuilder:(id)a4 withError:(id)a5
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  id v15;

  v15 = a5;
  objc_msgSend(a4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "suggestionItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v9 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    -[HUItemModuleController module](self, "module");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsItem:", v11);

    if (v13)
    {
      -[HUItemModuleController module](self, "module");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "didActivateItem:active:error:", v11, 1, v15);

    }
  }

}

- (void)itemSection:(id)a3 accessoryButtonPressedInHeader:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v6 = a4;
  objc_opt_class();
  v16 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v16;
  else
    v7 = 0;
  v8 = v7;

  -[HUAvailableRelatedTriggerItemModuleController setSectionEditButtonHeader:](self, "setSectionEditButtonHeader:", v8);
  -[HUAvailableRelatedTriggerItemModuleController setEditing:](self, "setEditing:", -[HUAvailableRelatedTriggerItemModuleController editing](self, "editing") ^ 1);
  -[HUAvailableRelatedTriggerItemModuleController _updateUIAnimated:](self, "_updateUIAnimated:", 1);
  v9 = (void *)MEMORY[0x1E0D314C0];
  -[HUItemModuleController module](self, "module");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "itemProviders");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestToReloadItemProviders:senderSelector:", v11, a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemModuleController module](self, "module");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "itemUpdater");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "performItemUpdateRequest:", v12);

}

- (void)_updateUIAnimated:(BOOL)a3
{
  _BOOL8 v3;
  const __CFString *v5;
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
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v3 = a3;
  if (-[HUAvailableRelatedTriggerItemModuleController editing](self, "editing"))
    v5 = CFSTR("HUSmartAutomationEditButtonDoneTitle");
  else
    v5 = CFSTR("HUSmartAutomationEditButtonTitle");
  -[HUItemModuleController module](self, "module");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSectionHeaderEditButtonTitleKey:", v5);

  -[HUAvailableRelatedTriggerItemModuleController sectionEditButtonHeader](self, "sectionEditButtonHeader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HUItemModuleController module](self, "module");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sectionHeaderEditButtonTitleKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(v9, v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAvailableRelatedTriggerItemModuleController sectionEditButtonHeader](self, "sectionEditButtonHeader");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setOverrideAccessoryButtonTitle:", v10);

    -[HUAvailableRelatedTriggerItemModuleController sectionEditButtonHeader](self, "sectionEditButtonHeader");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "defaultAccessoryButtonFont");
    v19 = (id)objc_claimAutoreleasedReturnValue();

    if (-[HUAvailableRelatedTriggerItemModuleController editing](self, "editing"))
    {
      v13 = (void *)MEMORY[0x1E0CEA5E8];
      objc_msgSend(v19, "fontDescriptor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fontDescriptorWithSymbolicTraits:", 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "pointSize");
      objc_msgSend(v13, "fontWithDescriptor:size:", v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v19 = (id)v16;
    }
    -[HUAvailableRelatedTriggerItemModuleController sectionEditButtonHeader](self, "sectionEditButtonHeader");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAccessoryButtonFont:", v19);

    -[HUAvailableRelatedTriggerItemModuleController sectionEditButtonHeader](self, "sectionEditButtonHeader");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "updateUIWithAnimation:", v3);

  }
}

- (void)_enableItemPressed:(id)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;

  v4 = a4;
  v30 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v30;
    -[HUItemModuleController module](self, "module");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "commitsAutomatically");

    if (v10)
    {
      v11 = -[HUAvailableRelatedTriggerItemModuleController _activateItem:active:](self, "_activateItem:active:", v7, v4);
    }
    else
    {
      objc_msgSend(v7, "setActive:", v4);
      v24 = (void *)MEMORY[0x1E0D314C0];
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "requestToUpdateItems:senderSelector:", v25, a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      -[HUItemModuleController module](self, "module");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "itemUpdater");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (id)objc_msgSend(v28, "performItemUpdateRequest:", v26);

    }
    goto LABEL_7;
  }
  -[HUItemModuleController module](self, "module");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "naturalLightingItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v30, "isEqual:", v13);

  if (v14)
  {
    -[HUItemModuleController module](self, "module");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEnableNaturalLighting:", v4);

    v16 = (void *)MEMORY[0x1E0D314C0];
    v17 = (void *)MEMORY[0x1E0C99E60];
    -[HUItemModuleController module](self, "module");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "naturalLightingItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithObject:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "requestToUpdateItems:senderSelector:", v20, a2);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[HUItemModuleController module](self, "module");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "itemUpdater");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (id)objc_msgSend(v22, "performItemUpdateRequest:", v7);

LABEL_7:
  }

}

- (id)_activateItem:(id)a3 active:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  BOOL v15;
  id location;

  v4 = a4;
  v6 = a3;
  objc_initWeak(&location, self);
  -[HUItemModuleController module](self, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activateItem:active:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__HUAvailableRelatedTriggerItemModuleController__activateItem_active___block_invoke;
  v12[3] = &unk_1E6F527D8;
  objc_copyWeak(&v14, &location);
  v9 = v6;
  v13 = v9;
  v15 = v4;
  objc_msgSend(v8, "recover:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v10;
}

id __70__HUAvailableRelatedTriggerItemModuleController__activateItem_active___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD v7[4];
  id v8;
  id v9;
  char v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__HUAvailableRelatedTriggerItemModuleController__activateItem_active___block_invoke_2;
  v7[3] = &unk_1E6F518F8;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v8 = *(id *)(a1 + 32);
  v10 = *(_BYTE *)(a1 + 48);
  objc_msgSend(WeakRetained, "_handleError:retryBlock:", v3, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  return v5;
}

id __70__HUAvailableRelatedTriggerItemModuleController__activateItem_active___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_activateItem:active:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_handleError:(id)a3 retryBlock:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_msgSend(v6, "na_isCancelledError");
    v9 = (void *)MEMORY[0x1E0D519C0];
    if (!v8)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __73__HUAvailableRelatedTriggerItemModuleController__handleError_retryBlock___block_invoke;
      v13[3] = &unk_1E6F52800;
      v13[4] = self;
      v14 = v6;
      v15 = v7;
      objc_msgSend(v9, "futureWithBlock:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
LABEL_7:

  return v11;
}

void __73__HUAvailableRelatedTriggerItemModuleController__handleError_retryBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "module");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "errorHandlingStrategy");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __73__HUAvailableRelatedTriggerItemModuleController__handleError_retryBlock___block_invoke_3;
    v19[3] = &unk_1E6F4D3E8;
    v9 = *(_QWORD *)(a1 + 40);
    v21 = *(id *)(a1 + 48);
    v20 = v3;
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __73__HUAvailableRelatedTriggerItemModuleController__handleError_retryBlock___block_invoke_5;
    v17[3] = &unk_1E6F4D988;
    v18 = v20;
    objc_msgSend(v7, "handleError:operationType:options:retryBlock:cancelBlock:", v9, 0, MEMORY[0x1E0C9AA70], v19, v17);

    v10 = v21;
  }
  else
  {
    v26 = *MEMORY[0x1E0D305A0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUSmartAutomationErrorHandlingStrategyContinueCancelButtonText"), CFSTR("HUSmartAutomationErrorHandlingStrategyContinueCancelButtonText"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *(void **)(a1 + 40);
    v24 = *MEMORY[0x1E0D305C0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUSmartAutomationErrorHandlingStrategyContinueDescriptionText"), CFSTR("HUSmartAutomationErrorHandlingStrategyContinueDescriptionText"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hf_errorWithAddedUserInfo:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __73__HUAvailableRelatedTriggerItemModuleController__handleError_retryBlock___block_invoke_2;
    v22[3] = &unk_1E6F4D988;
    v23 = v3;
    objc_msgSend(v16, "handleError:operationType:options:retryBlock:cancelBlock:", v15, 0, v10, 0, v22);

  }
}

uint64_t __73__HUAvailableRelatedTriggerItemModuleController__handleError_retryBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

void __73__HUAvailableRelatedTriggerItemModuleController__handleError_retryBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__HUAvailableRelatedTriggerItemModuleController__handleError_retryBlock___block_invoke_4;
  v4[3] = &unk_1E6F4C610;
  v5 = *(id *)(a1 + 32);
  v3 = (id)objc_msgSend(v2, "addCompletionBlock:", v4);

}

uint64_t __73__HUAvailableRelatedTriggerItemModuleController__handleError_retryBlock___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

void __73__HUAvailableRelatedTriggerItemModuleController__handleError_retryBlock___block_invoke_5(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D30598], 52, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithError:", v2);

}

- (void)_addAutomationCancelButtonPressed
{
  void *v3;
  void *v4;
  id v5;

  -[HUAvailableRelatedTriggerItemModuleController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUAvailableRelatedTriggerItemModuleController presentedViewController](self, "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[HUAvailableRelatedTriggerItemModuleController _dismissViewController:](self, "_dismissViewController:", v4);

    -[HUAvailableRelatedTriggerItemModuleController setPresentedViewController:](self, "setPresentedViewController:", 0);
  }
}

- (id)_dismissViewController:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[5];
  id v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HUAvailableRelatedTriggerItemModuleController setEditing:](self, "setEditing:", 0);
  -[HUAvailableRelatedTriggerItemModuleController _updateUIAnimated:](self, "_updateUIAnimated:", 0);
  +[HUViewControllerDismissalRequest requestWithViewController:](HUViewControllerDismissalRequest, "requestWithViewController:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0D314C0]);
  -[HUItemModuleController module](self, "module");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemProviders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemModuleController module](self, "module");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v7, "initWithItemProviders:items:senderSelector:", v9, v11, a2);

  -[HUItemModuleController host](self, "host");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "moduleController:dismissViewControllerForRequest:", self, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D519C0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __72__HUAvailableRelatedTriggerItemModuleController__dismissViewController___block_invoke;
  v23[3] = &unk_1E6F4D600;
  v23[4] = self;
  v24 = v12;
  v16 = v12;
  objc_msgSend(v15, "lazyFutureWithBlock:", v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0D519C0];
  v25[0] = v14;
  v25[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "chainFutures:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "recover:", &__block_literal_global_78);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

void __72__HUAvailableRelatedTriggerItemModuleController__dismissViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "module");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemUpdater");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performItemUpdateRequest:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__HUAvailableRelatedTriggerItemModuleController__dismissViewController___block_invoke_2;
  v9[3] = &unk_1E6F52828;
  v10 = v3;
  v7 = v3;
  v8 = (id)objc_msgSend(v6, "addCompletionBlock:", v9);

}

uint64_t __72__HUAvailableRelatedTriggerItemModuleController__dismissViewController___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

uint64_t __72__HUAvailableRelatedTriggerItemModuleController__dismissViewController___block_invoke_3()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (void)updatePresentedViewControllerForNewModuleController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HUAvailableRelatedTriggerItemModuleController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentedViewController:", v5);

  -[HUAvailableRelatedTriggerItemModuleController presentedViewControllerDelegateWrapper](self, "presentedViewControllerDelegateWrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v4);

  -[HUAvailableRelatedTriggerItemModuleController presentedViewControllerDelegateWrapper](self, "presentedViewControllerDelegateWrapper");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentedViewControllerDelegateWrapper:", v7);

}

- (_TriggerEditorDelegateWrapper)presentedViewControllerDelegateWrapper
{
  _TriggerEditorDelegateWrapper *presentedViewControllerDelegateWrapper;
  _TriggerEditorDelegateWrapper *v4;
  _TriggerEditorDelegateWrapper *v5;

  presentedViewControllerDelegateWrapper = self->_presentedViewControllerDelegateWrapper;
  if (!presentedViewControllerDelegateWrapper)
  {
    v4 = objc_alloc_init(_TriggerEditorDelegateWrapper);
    v5 = self->_presentedViewControllerDelegateWrapper;
    self->_presentedViewControllerDelegateWrapper = v4;

    -[_TriggerEditorDelegateWrapper setDelegate:](self->_presentedViewControllerDelegateWrapper, "setDelegate:", self);
    presentedViewControllerDelegateWrapper = self->_presentedViewControllerDelegateWrapper;
  }
  return presentedViewControllerDelegateWrapper;
}

- (void)_presentTriggerSummaryForTriggerBuilder:(id)a3 flow:(id)a4
{
  id v6;
  id v7;
  HUTriggerSummaryViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v6 = a4;
  v7 = a3;
  -[HUAvailableRelatedTriggerItemModuleController presentedViewControllerDelegateWrapper](self, "presentedViewControllerDelegateWrapper");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v8 = -[HUTriggerSummaryViewController initWithTriggerBuilder:flow:delegate:]([HUTriggerSummaryViewController alloc], "initWithTriggerBuilder:flow:delegate:", v7, v6, v19);

  v9 = (void *)MEMORY[0x1E0C99E60];
  -[HUItemModuleController module](self, "module");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "relatedItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "na_flatMap:", &__block_literal_global_113_0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "na_flatMap:", &__block_literal_global_238);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerSummaryViewController setPrioritizedAccessories:](v8, "setPrioritizedAccessories:", v14);

  -[HUAvailableRelatedTriggerItemModuleController setPresentedViewController:](self, "setPresentedViewController:", v8);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v8);
  objc_msgSend(v15, "setModalPresentationStyle:", 2);
  +[HUViewControllerPresentationRequest requestWithViewController:](HUViewControllerPresentationRequest, "requestWithViewController:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPreferredPresentationType:", 0);
  -[HUItemModuleController host](self, "host");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v17, "moduleController:presentViewControllerForRequest:", self, v16);

}

id __94__HUAvailableRelatedTriggerItemModuleController__presentTriggerSummaryForTriggerBuilder_flow___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "mediaProfileContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "conformsToProtocol:", &unk_1EF347348);

    objc_msgSend(v6, "mediaProfileContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      objc_msgSend(v3, "addObject:", v9);
    }
    else
    {
      objc_msgSend(v9, "mediaProfiles");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "unionSet:", v11);

    }
  }
  objc_msgSend(v4, "services");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v12);

  return v3;
}

uint64_t __94__HUAvailableRelatedTriggerItemModuleController__presentTriggerSummaryForTriggerBuilder_flow___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D310C0], "accessoryLikeObjectsForAccessoryRepresentable:", a2);
}

- (void)_presentAddAutomationViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  dispatch_time_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id location;
  _QWORD block[4];
  id v17;
  HUAvailableRelatedTriggerItemModuleController *v18;
  _QWORD v19[5];

  -[HUAvailableRelatedTriggerItemModuleController addAutomationPresentingFuture](self, "addAutomationPresentingFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[HUAvailableRelatedTriggerItemModuleController _createAddAutomationViewController](self, "_createAddAutomationViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reschedule:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __84__HUAvailableRelatedTriggerItemModuleController__presentAddAutomationViewController__block_invoke;
    v19[3] = &unk_1E6F528D0;
    v19[4] = self;
    objc_msgSend(v6, "flatMap:", v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAvailableRelatedTriggerItemModuleController setAddAutomationPresentingFuture:](self, "setAddAutomationPresentingFuture:", v8);

    v9 = dispatch_time(0, 100000000);
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __84__HUAvailableRelatedTriggerItemModuleController__presentAddAutomationViewController__block_invoke_2;
    block[3] = &unk_1E6F4C638;
    v10 = v6;
    v17 = v10;
    v18 = self;
    dispatch_after(v9, MEMORY[0x1E0C80D38], block);
    objc_initWeak(&location, self);
    -[HUAvailableRelatedTriggerItemModuleController addAutomationPresentingFuture](self, "addAutomationPresentingFuture");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __84__HUAvailableRelatedTriggerItemModuleController__presentAddAutomationViewController__block_invoke_3;
    v13[3] = &unk_1E6F4E380;
    objc_copyWeak(&v14, &location);
    v12 = (id)objc_msgSend(v11, "addCompletionBlock:", v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
}

id __84__HUAvailableRelatedTriggerItemModuleController__presentAddAutomationViewController__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setPresentedViewController:", v4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, *(_QWORD *)(a1 + 32), sel__addAutomationCancelButtonPressed);
  objc_msgSend(v4, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLeftBarButtonItem:", v5);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v4);
  objc_msgSend(v7, "setModalPresentationStyle:", 2);
  +[HUViewControllerPresentationRequest requestWithViewController:](HUViewControllerPresentationRequest, "requestWithViewController:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreferredPresentationType:", 0);
  objc_msgSend(*(id *)(a1 + 32), "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "moduleController:presentViewControllerForRequest:", *(_QWORD *)(a1 + 32), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __84__HUAvailableRelatedTriggerItemModuleController__presentAddAutomationViewController__block_invoke_2(uint64_t a1)
{
  id v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "module");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAutomationItemIsLoading:", 1);

  }
}

void __84__HUAvailableRelatedTriggerItemModuleController__presentAddAutomationViewController__block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "module");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAutomationItemIsLoading:", 0);

  objc_msgSend(WeakRetained, "setAddAutomationPresentingFuture:", 0);
}

- (id)_createAddAutomationViewController
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
  uint64_t v12;
  HUTriggerTypePickerViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;

  -[HUAvailableRelatedTriggerItemModuleController presentedViewControllerDelegateWrapper](self, "presentedViewControllerDelegateWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemModuleController module](self, "module");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sensorCharacteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
    goto LABEL_4;
  -[HUItemModuleController module](self, "module");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionBuilderFactories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {

LABEL_4:
    goto LABEL_5;
  }
  -[HUItemModuleController module](self, "module");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "eventOptionsItems");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (!v21)
  {
    v22 = (void *)MEMORY[0x1E0C99E60];
    -[HUItemModuleController module](self, "module");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sensorCharacteristics");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setWithArray:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAvailableRelatedTriggerItemModuleController _addAutomationViewControllerWithSensorCharacteristics:](self, "_addAutomationViewControllerWithSensorCharacteristics:", v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
LABEL_5:
  -[HUItemModuleController module](self, "module");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionBuilderFactories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "count"))
  {

    goto LABEL_9;
  }
  -[HUItemModuleController module](self, "module");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sensorCharacteristics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
LABEL_9:
    v17 = (void *)MEMORY[0x1E0D519C0];
    v13 = -[HUTriggerTypePickerViewController initWithActionSetBuilder:delegate:]([HUTriggerTypePickerViewController alloc], "initWithActionSetBuilder:delegate:", 0, v3);
    objc_msgSend(v17, "futureWithResult:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  -[HUItemModuleController module](self, "module");
  v13 = (HUTriggerTypePickerViewController *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerTypePickerViewController actionBuilderFactories](v13, "actionBuilderFactories");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAvailableRelatedTriggerItemModuleController _addAutomationViewControllerWithActionFactories:](self, "_addAutomationViewControllerWithActionFactories:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __83__HUAvailableRelatedTriggerItemModuleController__createAddAutomationViewController__block_invoke;
  v26[3] = &unk_1E6F4F2D0;
  v27 = v3;
  objc_msgSend(v15, "recover:", v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
LABEL_11:

  return v16;
}

id __83__HUAvailableRelatedTriggerItemModuleController__createAddAutomationViewController__block_invoke(uint64_t a1)
{
  void *v1;
  HUTriggerTypePickerViewController *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0D519C0];
  v2 = -[HUTriggerTypePickerViewController initWithActionSetBuilder:delegate:]([HUTriggerTypePickerViewController alloc], "initWithActionSetBuilder:delegate:", 0, *(_QWORD *)(a1 + 32));
  objc_msgSend(v1, "futureWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_addAutomationViewControllerWithSensorCharacteristics:(id)a3
{
  id v4;
  void *v5;
  HUTriggerBuilderContext *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  HUAccessoryEventPickerViewController *v27;
  void *v28;
  void *v29;
  HUCharacteristicTriggerEventViewController *v30;
  void *v32;
  _QWORD aBlock[4];
  id v34;

  v4 = a3;
  -[HUAvailableRelatedTriggerItemModuleController presentedViewControllerDelegateWrapper](self, "presentedViewControllerDelegateWrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(HUTriggerBuilderContext);
  v7 = objc_alloc(MEMORY[0x1E0D313C0]);
  -[HUItemModuleController module](self, "module");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithHome:context:", v9, v6);

  v11 = objc_alloc(MEMORY[0x1E0D312B0]);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithEventBuilders:", v12);

  if (objc_msgSend(v4, "count") == 1)
  {
    v32 = v5;
    objc_msgSend(v4, "anyObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CBA458];
    objc_msgSend(v14, "characteristicType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hf_abnormalValueForSensorCharacteristicType:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CBA458], "hf_continuousValueRangeCharacteristicTypes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "characteristicType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "containsObject:", v19);

    if (v20)
    {
      -[HUItemModuleController module](self, "module");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "home");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "hf_characteristicValueManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "cachedValueForCharacteristic:", v14);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        objc_msgSend(MEMORY[0x1E0CBA718], "numberRangeWithMaxValue:", v24);
        v25 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v25 = 0;
      }
      v5 = v32;

      v17 = (void *)v25;
    }
    else
    {
      v5 = v32;
    }
    objc_msgSend(v13, "setCharacteristics:triggerValue:", v4, v17);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "applyEventBuilderDiff:", v29);
    v30 = -[HUCharacteristicTriggerEventViewController initWithCharacteristicEventBuilderItem:triggerBuilder:mode:delegate:]([HUCharacteristicTriggerEventViewController alloc], "initWithCharacteristicEventBuilderItem:triggerBuilder:mode:delegate:", v13, v10, 0, v5);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v30);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __103__HUAvailableRelatedTriggerItemModuleController__addAutomationViewControllerWithSensorCharacteristics___block_invoke;
    aBlock[3] = &unk_1E6F4DAD8;
    v34 = v4;
    v26 = _Block_copy(aBlock);
    v27 = -[HUAccessoryEventPickerViewController initWithEventBuilderItem:triggerBuilder:mode:source:delegate:]([HUAccessoryEventPickerViewController alloc], "initWithEventBuilderItem:triggerBuilder:mode:source:delegate:", v13, v10, 0, 0, v5);
    -[HUAccessoryEventPickerViewController setFilter:](v27, "setFilter:", v26);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v28;
}

uint64_t __103__HUAvailableRelatedTriggerItemModuleController__addAutomationViewControllerWithSensorCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF2AC378))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "services");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __103__HUAvailableRelatedTriggerItemModuleController__addAutomationViewControllerWithSensorCharacteristics___block_invoke_2;
    v10[3] = &unk_1E6F4EE58;
    v11 = *(id *)(a1 + 32);
    v8 = objc_msgSend(v7, "na_any:", v10);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

uint64_t __103__HUAvailableRelatedTriggerItemModuleController__addAutomationViewControllerWithSensorCharacteristics___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __103__HUAvailableRelatedTriggerItemModuleController__addAutomationViewControllerWithSensorCharacteristics___block_invoke_3;
  v6[3] = &unk_1E6F4EE30;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __103__HUAvailableRelatedTriggerItemModuleController__addAutomationViewControllerWithSensorCharacteristics___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (id)_addAutomationViewControllerWithActionFactories:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  dispatch_time_t v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _QWORD block[4];
  id v17;
  _QWORD v18[5];

  v4 = a3;
  -[HUAvailableRelatedTriggerItemModuleController presentedViewControllerDelegateWrapper](self, "presentedViewControllerDelegateWrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __97__HUAvailableRelatedTriggerItemModuleController__addAutomationViewControllerWithActionFactories___block_invoke;
  v18[3] = &unk_1E6F528F8;
  v18[4] = self;
  objc_msgSend(v4, "na_map:", v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = dispatch_time(0, 2000000000);
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __97__HUAvailableRelatedTriggerItemModuleController__addAutomationViewControllerWithActionFactories___block_invoke_2;
  block[3] = &unk_1E6F4D988;
  v17 = v8;
  v10 = v8;
  dispatch_after(v9, MEMORY[0x1E0C80D38], block);
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __97__HUAvailableRelatedTriggerItemModuleController__addAutomationViewControllerWithActionFactories___block_invoke_3;
  v14[3] = &unk_1E6F4CD30;
  v15 = v5;
  v11 = v5;
  objc_msgSend(v10, "flatMap:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __97__HUAvailableRelatedTriggerItemModuleController__addAutomationViewControllerWithActionFactories___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "module");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentStateActionBuildersForHome:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __97__HUAvailableRelatedTriggerItemModuleController__addAutomationViewControllerWithActionFactories___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isFinished");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "cancel");
  return result;
}

id __97__HUAvailableRelatedTriggerItemModuleController__addAutomationViewControllerWithActionFactories___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  HUTriggerTypePickerViewController *v4;
  void *v5;

  objc_msgSend(a2, "na_flatMap:", &__block_literal_global_267);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HUTriggerTypePickerViewController initWithActionSetBuilder:anonymousActionBuilders:delegate:]([HUTriggerTypePickerViewController alloc], "initWithActionSetBuilder:anonymousActionBuilders:delegate:", 0, v3, *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __97__HUAvailableRelatedTriggerItemModuleController__addAutomationViewControllerWithActionFactories___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "allObjects");
}

- (NAFuture)addAutomationPresentingFuture
{
  return self->_addAutomationPresentingFuture;
}

- (void)setAddAutomationPresentingFuture:(id)a3
{
  objc_storeStrong((id *)&self->_addAutomationPresentingFuture, a3);
}

- (void)setAddAutomationActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_addAutomationActivityIndicator, a3);
}

- (UIViewController)presentedViewController
{
  return self->_presentedViewController;
}

- (void)setPresentedViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentedViewController, a3);
}

- (void)setPresentedViewControllerDelegateWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_presentedViewControllerDelegateWrapper, a3);
}

- (HUAccessoryButtonTableViewHeaderView)sectionEditButtonHeader
{
  return (HUAccessoryButtonTableViewHeaderView *)objc_loadWeakRetained((id *)&self->_sectionEditButtonHeader);
}

- (void)setSectionEditButtonHeader:(id)a3
{
  objc_storeWeak((id *)&self->_sectionEditButtonHeader, a3);
}

- (BOOL)editing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sectionEditButtonHeader);
  objc_storeStrong((id *)&self->_presentedViewControllerDelegateWrapper, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_storeStrong((id *)&self->_addAutomationActivityIndicator, 0);
  objc_storeStrong((id *)&self->_addAutomationPresentingFuture, 0);
}

@end
