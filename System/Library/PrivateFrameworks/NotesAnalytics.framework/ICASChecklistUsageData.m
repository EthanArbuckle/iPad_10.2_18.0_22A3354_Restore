@implementation ICASChecklistUsageData

- (ICASChecklistUsageData)initWithChecklistAction:(id)a3 moveCheckedItemsToBottomSwitchSetting:(id)a4
{
  id v7;
  id v8;
  ICASChecklistUsageData *v9;
  ICASChecklistUsageData *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASChecklistUsageData;
  v9 = -[ICASChecklistUsageData init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_checklistAction, a3);
    objc_storeStrong((id *)&v10->_moveCheckedItemsToBottomSwitchSetting, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("ChecklistUsageData");
}

- (id)toDict
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("checklistAction");
  -[ICASChecklistUsageData checklistAction](self, "checklistAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICASChecklistUsageData checklistAction](self, "checklistAction");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = CFSTR("moveCheckedItemsToBottomSwitchSetting");
  v12[0] = v4;
  -[ICASChecklistUsageData moveCheckedItemsToBottomSwitchSetting](self, "moveCheckedItemsToBottomSwitchSetting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ICASChecklistUsageData moveCheckedItemsToBottomSwitchSetting](self, "moveCheckedItemsToBottomSwitchSetting");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (ICASChecklistAction)checklistAction
{
  return self->_checklistAction;
}

- (ICASMoveCheckedItemsToBottomSwitchSetting)moveCheckedItemsToBottomSwitchSetting
{
  return self->_moveCheckedItemsToBottomSwitchSetting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moveCheckedItemsToBottomSwitchSetting, 0);
  objc_storeStrong((id *)&self->_checklistAction, 0);
}

@end
