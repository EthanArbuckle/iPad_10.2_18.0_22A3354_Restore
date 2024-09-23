@implementation HUTriggerBuilderContext

- (HUTriggerBuilderContext)initWithTriggerBuilderContext:(id)a3
{
  id v4;
  HUTriggerBuilderContext *v5;
  HUTriggerBuilderContext *v6;
  int allowConvertToShortcut;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = a3;
  v5 = -[HUTriggerBuilderContext init](self, "init");
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v5->_showTriggerEnableSwitch = objc_msgSend(v4, "showTriggerEnableSwitch");
      v6->_showTriggerSummary = objc_msgSend(v4, "showTriggerSummary");
      v6->_showTriggerDeleteButton = objc_msgSend(v4, "showTriggerDeleteButton");
      v6->_showActionSetsInstructions = objc_msgSend(v4, "showActionSetsInstructions");
      v6->_showConditionTriggers = objc_msgSend(v4, "showConditionTriggers");
      v6->_allowDurationEditing = objc_msgSend(v4, "allowDurationEditing");
      allowConvertToShortcut = objc_msgSend(v4, "allowConvertToShortcut");
    }
    else
    {
      allowConvertToShortcut = v5->_allowConvertToShortcut;
    }
    v6->_allowConvertToShortcut = allowConvertToShortcut != 0;
    objc_msgSend(v4, "testActionsInstructionDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[HUTriggerBuilderContext setTestActionsInstructionDescription:](v6, "setTestActionsInstructionDescription:", v8);
    }
    else
    {
      -[HUTriggerBuilderContext testActionsInstructionDescription](v6, "testActionsInstructionDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTriggerBuilderContext setTestActionsInstructionDescription:](v6, "setTestActionsInstructionDescription:", v9);

    }
    objc_msgSend(v4, "serviceActionsInstructionDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[HUTriggerBuilderContext setServiceActionsInstructionDescription:](v6, "setServiceActionsInstructionDescription:", v10);
    }
    else
    {
      -[HUTriggerBuilderContext serviceActionsInstructionDescription](v6, "serviceActionsInstructionDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTriggerBuilderContext setServiceActionsInstructionDescription:](v6, "setServiceActionsInstructionDescription:", v11);

    }
    objc_msgSend(v4, "deleteInstructionDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[HUTriggerBuilderContext setDeleteInstructionDescription:](v6, "setDeleteInstructionDescription:", v12);
    }
    else
    {
      -[HUTriggerBuilderContext deleteInstructionDescription](v6, "deleteInstructionDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTriggerBuilderContext setDeleteInstructionDescription:](v6, "setDeleteInstructionDescription:", v13);

    }
    objc_msgSend(v4, "actionEditorInstructionsDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[HUTriggerBuilderContext setActionEditorInstructionsDescription:](v6, "setActionEditorInstructionsDescription:", v14);
    }
    else
    {
      -[HUTriggerBuilderContext actionEditorInstructionsDescription](v6, "actionEditorInstructionsDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTriggerBuilderContext setActionEditorInstructionsDescription:](v6, "setActionEditorInstructionsDescription:", v15);

    }
    objc_msgSend(v4, "triggerContextAwareTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[HUTriggerBuilderContext setTriggerContextAwareTitle:](v6, "setTriggerContextAwareTitle:", v16);
    }
    else
    {
      -[HUTriggerBuilderContext triggerContextAwareTitle](v6, "triggerContextAwareTitle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTriggerBuilderContext setTriggerContextAwareTitle:](v6, "setTriggerContextAwareTitle:", v17);

    }
    objc_msgSend(v4, "unsupportedTriggers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[HUTriggerBuilderContext setUnsupportedTriggers:](v6, "setUnsupportedTriggers:", v18);
    }
    else
    {
      -[HUTriggerBuilderContext unsupportedTriggers](v6, "unsupportedTriggers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTriggerBuilderContext setUnsupportedTriggers:](v6, "setUnsupportedTriggers:", v19);

    }
    objc_msgSend(v4, "deleteConfirmationAlertTitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      -[HUTriggerBuilderContext setDeleteConfirmationAlertTitle:](v6, "setDeleteConfirmationAlertTitle:", v20);
    }
    else
    {
      -[HUTriggerBuilderContext deleteConfirmationAlertTitle](v6, "deleteConfirmationAlertTitle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTriggerBuilderContext setDeleteConfirmationAlertTitle:](v6, "setDeleteConfirmationAlertTitle:", v21);

    }
    objc_msgSend(v4, "deleteConfirmationAlertMessage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      -[HUTriggerBuilderContext setDeleteConfirmationAlertMessage:](v6, "setDeleteConfirmationAlertMessage:", v22);
    }
    else
    {
      -[HUTriggerBuilderContext deleteConfirmationAlertMessage](v6, "deleteConfirmationAlertMessage");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTriggerBuilderContext setDeleteConfirmationAlertMessage:](v6, "setDeleteConfirmationAlertMessage:", v23);

    }
    objc_msgSend(v4, "doneButtonTitle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      -[HUTriggerBuilderContext setDoneButtonTitle:](v6, "setDoneButtonTitle:", v24);
    }
    else
    {
      -[HUTriggerBuilderContext doneButtonTitle](v6, "doneButtonTitle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTriggerBuilderContext setDoneButtonTitle:](v6, "setDoneButtonTitle:", v25);

    }
    objc_msgSend(v4, "suggestionItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      -[HUTriggerBuilderContext setSuggestionItem:](v6, "setSuggestionItem:", v26);
    }
    else
    {
      -[HUTriggerBuilderContext suggestionItem](v6, "suggestionItem");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTriggerBuilderContext setSuggestionItem:](v6, "setSuggestionItem:", v27);

    }
  }

  return v6;
}

- (HUTriggerBuilderContext)init
{
  HUTriggerBuilderContext *v2;
  HUTriggerBuilderContext *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUTriggerBuilderContext;
  v2 = -[HUTriggerBuilderContext init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    -[HUTriggerBuilderContext setShowTriggerSummary:](v2, "setShowTriggerSummary:", 1);
    -[HUTriggerBuilderContext setShowTriggerEnableSwitch:](v3, "setShowTriggerEnableSwitch:", 1);
    -[HUTriggerBuilderContext setShowTriggerDeleteButton:](v3, "setShowTriggerDeleteButton:", 1);
    -[HUTriggerBuilderContext setShowActionSetsInstructions:](v3, "setShowActionSetsInstructions:", 1);
    -[HUTriggerBuilderContext setShowConditionTriggers:](v3, "setShowConditionTriggers:", 1);
    -[HUTriggerBuilderContext setAllowDurationEditing:](v3, "setAllowDurationEditing:", 1);
    -[HUTriggerBuilderContext setAllowConvertToShortcut:](v3, "setAllowConvertToShortcut:", 1);
    -[HUTriggerBuilderContext setFiltersEmptyActionSets:](v3, "setFiltersEmptyActionSets:", 0);
    _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerSummaryTestTriggerButtonTitle"), CFSTR("HUTriggerSummaryTestTriggerButtonTitle"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerBuilderContext setTestActionsInstructionDescription:](v3, "setTestActionsInstructionDescription:", v4);

    _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerSummaryAddActionButtonTitle"), CFSTR("HUTriggerSummaryAddActionButtonTitle"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerBuilderContext setServiceActionsInstructionDescription:](v3, "setServiceActionsInstructionDescription:", v5);

    _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerSummaryDeleteTriggerButtonTitle"), CFSTR("HUTriggerSummaryDeleteTriggerButtonTitle"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerBuilderContext setDeleteInstructionDescription:](v3, "setDeleteInstructionDescription:", v6);

    _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerActionEditorInstructionsDescription"), CFSTR("HUTriggerActionEditorInstructionsDescription"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerBuilderContext setActionEditorInstructionsDescription:](v3, "setActionEditorInstructionsDescription:", v7);

    if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerSummaryDeleteTriggerConfirmationAlertTitleMac"), CFSTR("HUTriggerSummaryDeleteTriggerConfirmationAlertTitleMac"), 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTriggerBuilderContext setDeleteConfirmationAlertTitle:](v3, "setDeleteConfirmationAlertTitle:", v8);

      _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerSummaryDeleteTriggerConfirmationAlertMessageMac"), CFSTR("HUTriggerSummaryDeleteTriggerConfirmationAlertMessageMac"), 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTriggerBuilderContext setDeleteConfirmationAlertMessage:](v3, "setDeleteConfirmationAlertMessage:", v9);

    }
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerBuilderContext setUnsupportedTriggers:](v3, "setUnsupportedTriggers:", v10);

  }
  return v3;
}

- (BOOL)showTriggerSummary
{
  return self->_showTriggerSummary;
}

- (void)setShowTriggerSummary:(BOOL)a3
{
  self->_showTriggerSummary = a3;
}

- (BOOL)showTriggerEnableSwitch
{
  return self->_showTriggerEnableSwitch;
}

- (void)setShowTriggerEnableSwitch:(BOOL)a3
{
  self->_showTriggerEnableSwitch = a3;
}

- (BOOL)showTriggerDeleteButton
{
  return self->_showTriggerDeleteButton;
}

- (void)setShowTriggerDeleteButton:(BOOL)a3
{
  self->_showTriggerDeleteButton = a3;
}

- (BOOL)showActionSetsInstructions
{
  return self->_showActionSetsInstructions;
}

- (void)setShowActionSetsInstructions:(BOOL)a3
{
  self->_showActionSetsInstructions = a3;
}

- (BOOL)showConditionTriggers
{
  return self->_showConditionTriggers;
}

- (void)setShowConditionTriggers:(BOOL)a3
{
  self->_showConditionTriggers = a3;
}

- (BOOL)allowDurationEditing
{
  return self->_allowDurationEditing;
}

- (void)setAllowDurationEditing:(BOOL)a3
{
  self->_allowDurationEditing = a3;
}

- (BOOL)allowConvertToShortcut
{
  return self->_allowConvertToShortcut;
}

- (void)setAllowConvertToShortcut:(BOOL)a3
{
  self->_allowConvertToShortcut = a3;
}

- (BOOL)filtersEmptyActionSets
{
  return self->_filtersEmptyActionSets;
}

- (void)setFiltersEmptyActionSets:(BOOL)a3
{
  self->_filtersEmptyActionSets = a3;
}

- (NSString)testActionsInstructionDescription
{
  return self->_testActionsInstructionDescription;
}

- (void)setTestActionsInstructionDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)serviceActionsInstructionDescription
{
  return self->_serviceActionsInstructionDescription;
}

- (void)setServiceActionsInstructionDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)deleteInstructionDescription
{
  return self->_deleteInstructionDescription;
}

- (void)setDeleteInstructionDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)actionEditorInstructionsDescription
{
  return self->_actionEditorInstructionsDescription;
}

- (void)setActionEditorInstructionsDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)triggerContextAwareTitle
{
  return self->_triggerContextAwareTitle;
}

- (void)setTriggerContextAwareTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSSet)unsupportedTriggers
{
  return self->_unsupportedTriggers;
}

- (void)setUnsupportedTriggers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (HFItem)suggestionItem
{
  return self->_suggestionItem;
}

- (void)setSuggestionItem:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionItem, a3);
}

- (NSString)doneButtonTitle
{
  return self->_doneButtonTitle;
}

- (void)setDoneButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)deleteConfirmationAlertTitle
{
  return self->_deleteConfirmationAlertTitle;
}

- (void)setDeleteConfirmationAlertTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)deleteConfirmationAlertMessage
{
  return self->_deleteConfirmationAlertMessage;
}

- (void)setDeleteConfirmationAlertMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteConfirmationAlertMessage, 0);
  objc_storeStrong((id *)&self->_deleteConfirmationAlertTitle, 0);
  objc_storeStrong((id *)&self->_doneButtonTitle, 0);
  objc_storeStrong((id *)&self->_suggestionItem, 0);
  objc_storeStrong((id *)&self->_unsupportedTriggers, 0);
  objc_storeStrong((id *)&self->_triggerContextAwareTitle, 0);
  objc_storeStrong((id *)&self->_actionEditorInstructionsDescription, 0);
  objc_storeStrong((id *)&self->_deleteInstructionDescription, 0);
  objc_storeStrong((id *)&self->_serviceActionsInstructionDescription, 0);
  objc_storeStrong((id *)&self->_testActionsInstructionDescription, 0);
}

@end
