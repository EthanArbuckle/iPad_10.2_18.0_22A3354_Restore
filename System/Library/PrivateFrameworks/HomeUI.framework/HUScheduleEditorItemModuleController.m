@implementation HUScheduleEditorItemModuleController

- (Class)cellClassForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HUScheduleEditorItemModuleController _editorItemModule](self, "_editorItemModule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v5, "addScheduleRuleItem");

    }
  }
  objc_opt_class();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v6;
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
  void *v14;
  uint64_t v15;
  objc_super v16;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HUScheduleEditorItemModuleController;
  -[HUItemModuleController updateCell:forItem:animated:](&v16, sel_updateCell_forItem_animated_, v8, v9, v5);
  objc_opt_class();
  v10 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "latestResults");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DA0]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "BOOLValue"))
        v15 = 3;
      else
        v15 = 0;
      objc_msgSend(v12, "setAccessoryType:", v15);

      objc_msgSend(v12, "setDisabled:", 0);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "setAccessoryType:", 1);
      objc_msgSend(v12, "setDisabled:", 0);
    }
  }

}

- (unint64_t)didSelectItem:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *p_super;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  HUScheduleRuleEditorViewController *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  int v27;
  void *v28;
  id v29;
  void *v30;
  int v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  HUScheduleRuleEditorViewController *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  unint64_t v48;
  unint64_t v49;
  NSObject *v50;
  void *v51;
  int v52;
  HUScheduleEditorItemModuleController *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  NSObject *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 138412802;
    v53 = self;
    v54 = 2112;
    v55 = v7;
    v56 = 2112;
    v57 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User selected item [%@]", (uint8_t *)&v52, 0x20u);

  }
  -[HUScheduleEditorItemModuleController _editorItemModule](self, "_editorItemModule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "updateSelectedScheduleType:", v5);
    HFLogForCategory();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "selectedScheduleType"));
      v11 = objc_claimAutoreleasedReturnValue();
      v52 = 138412802;
      v53 = self;
      v54 = 2112;
      v55 = v10;
      v56 = 2112;
      v57 = v11;
      _os_log_impl(&dword_1B8E1E000, p_super, OS_LOG_TYPE_DEFAULT, "%@:%@ Updating selected schedule type to [%@].", (uint8_t *)&v52, 0x20u);

    }
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v12 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    p_super = v13;

    v14 = objc_msgSend(v8, "selectedScheduleType");
    HFLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject rule](p_super, "rule");
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 138413058;
      v53 = self;
      v54 = 2112;
      v55 = v16;
      v56 = 2112;
      v57 = v17;
      v58 = 2112;
      v59 = v18;
      _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@ User is attempting to view existing schedule rule [%@] for selected schedule type [%@].", (uint8_t *)&v52, 0x2Au);

    }
    if ((unint64_t)(v14 - 1) <= 1)
    {
      objc_msgSend(v8, "updatedScheduleBuilder");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        v21 = v19;
      }
      else
      {
        objc_msgSend(v8, "originalScheduleBuilder");
        v21 = objc_claimAutoreleasedReturnValue();
      }
      v40 = v21;

      HFLogForCategory();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 138412802;
        v53 = self;
        v54 = 2112;
        v55 = v42;
        v56 = 2112;
        v57 = v40;
        _os_log_impl(&dword_1B8E1E000, v41, OS_LOG_TYPE_DEFAULT, "%@:%@ Preparing to show schedule rule editor for schedule builder [%@].", (uint8_t *)&v52, 0x20u);

      }
      v43 = [HUScheduleRuleEditorViewController alloc];
      -[NSObject rule](p_super, "rule");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[HUScheduleRuleEditorViewController initWithScheduleType:scheduleRule:scheduleBuilder:delegate:](v43, "initWithScheduleType:scheduleRule:scheduleBuilder:delegate:", v14, v44, v40, self);

      goto LABEL_16;
    }
LABEL_15:
    v22 = 0;
LABEL_16:

    p_super = &v22->super.super.super.super.super.super;
    goto LABEL_17;
  }
  objc_msgSend(v8, "addScheduleRuleItem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[NSObject isEqual:](v5, "isEqual:", v30);

  if (v31)
  {
    v32 = objc_msgSend(v8, "selectedScheduleType");
    HFLogForCategory();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v32);
      v35 = objc_claimAutoreleasedReturnValue();
      v52 = 138412802;
      v53 = self;
      v54 = 2112;
      v55 = v34;
      v56 = 2112;
      v57 = v35;
      _os_log_impl(&dword_1B8E1E000, v33, OS_LOG_TYPE_DEFAULT, "%@:%@ User is attempting to add schedule rule for selected schedule type [%@].", (uint8_t *)&v52, 0x20u);

    }
    if ((unint64_t)(v32 - 1) <= 1)
    {
      objc_msgSend(v8, "updatedScheduleBuilder");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v36;
      if (v36)
      {
        v38 = v36;
      }
      else
      {
        objc_msgSend(v8, "originalScheduleBuilder");
        v38 = objc_claimAutoreleasedReturnValue();
      }
      p_super = v38;

      HFLogForCategory();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 138412802;
        v53 = self;
        v54 = 2112;
        v55 = v46;
        v56 = 2112;
        v57 = p_super;
        _os_log_impl(&dword_1B8E1E000, v45, OS_LOG_TYPE_DEFAULT, "%@:%@ Preparing to show schedule rule editor for schedule builder [%@].", (uint8_t *)&v52, 0x20u);

      }
      -[NSObject rules](p_super, "rules");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "count");
      v49 = -[NSObject maxNumberOfRules](p_super, "maxNumberOfRules");

      if (v48 >= v49)
      {
        HFLogForCategory();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = 138412546;
          v53 = self;
          v54 = 2112;
          v55 = v51;
          _os_log_error_impl(&dword_1B8E1E000, v50, OS_LOG_TYPE_ERROR, "%@:%@ Unsupported action. Max number of rules reached. Cannot add any more rules.", (uint8_t *)&v52, 0x16u);

        }
        _HULocalizedStringWithDefaultValue(CFSTR("HUScheduleRuleEditor_UnsupportedAction_Title"), CFSTR("HUScheduleRuleEditor_UnsupportedAction_Title"), 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        _HULocalizedStringWithDefaultValue(CFSTR("HUScheduleRuleEditor_UnsupportedAction_MaxDateTimePeriodsReached_Message"), CFSTR("HUScheduleRuleEditor_UnsupportedAction_MaxDateTimePeriodsReached_Message"), 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUScheduleEditorItemModuleController _presentErrorAlertWithTitle:message:](self, "_presentErrorAlertWithTitle:message:", v23, v28);
        goto LABEL_31;
      }
      v22 = -[HUScheduleRuleEditorViewController initWithScheduleType:scheduleRule:scheduleBuilder:delegate:]([HUScheduleRuleEditorViewController alloc], "initWithScheduleType:scheduleRule:scheduleBuilder:delegate:", v32, 0, p_super, self);
      goto LABEL_16;
    }
  }
  p_super = 0;
LABEL_17:
  objc_opt_class();
  -[HUItemModuleController host](self, "host");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v24 = v23;
  else
    v24 = 0;
  v25 = v24;

  if (v25 && p_super)
  {
    objc_msgSend(v8, "addScheduleRuleItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[NSObject isEqual:](v5, "isEqual:", v26);

    if (v27)
    {
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", p_super);
      objc_msgSend(v28, "setModalPresentationStyle:", 2);
      v29 = (id)objc_msgSend(v25, "hu_presentPreloadableViewController:animated:", v28, 1);
    }
    else
    {
      objc_msgSend(v25, "navigationController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "pushViewController:animated:", p_super, 1);
    }
LABEL_31:

    v25 = v23;
  }

  return 0;
}

- (void)didUpdateScheduleBuilder:(id)a3 scheduleBuilder:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  HUScheduleEditorItemModuleController *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = self;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Requesting to update schedule builder to %@", (uint8_t *)&v10, 0x20u);

  }
  -[HUScheduleEditorItemModuleController _editorItemModule](self, "_editorItemModule");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateScheduleBuilder:", v6);

}

- (void)_presentErrorAlertWithTitle:(id)a3 message:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUOkTitle"), CFSTR("HUOkTitle"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionWithTitle:style:handler:", v6, 0, &__block_literal_global_216);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v7);

  +[HUViewControllerPresentationRequest requestWithViewController:](HUViewControllerPresentationRequest, "requestWithViewController:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreferredPresentationType:", 0);
  -[HUItemModuleController host](self, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "moduleController:presentViewControllerForRequest:", self, v8);

}

void __76__HUScheduleEditorItemModuleController__presentErrorAlertWithTitle_message___block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[HUScheduleEditorItemModuleController _presentErrorAlertWithTitle:message:]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v0, OS_LOG_TYPE_DEFAULT, "(%s) User tapped OK button from the alert popup", (uint8_t *)&v1, 0xCu);
  }

}

- (id)_editorItemModule
{
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

@end
