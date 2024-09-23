@implementation HFTriggerUISummary

- (HFTriggerUISummary)initWithTrigger:(id)a3 inHome:(id)a4 forceDisabled:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  HFTriggerUISummary *v10;
  HFTriggerUISummary *v11;
  objc_super v13;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HFTriggerUISummary;
  v10 = -[HFTriggerUISummary init](&v13, sel_init);
  v11 = v10;
  if (v10)
    -[HFTriggerUISummary _updateWithTrigger:inHome:forceDisabled:ignoringDisabled:](v10, "_updateWithTrigger:inHome:forceDisabled:ignoringDisabled:", v8, v9, v5, 0);

  return v11;
}

- (HFTriggerUISummary)initWithTrigger:(id)a3 inHome:(id)a4 forceDisabled:(BOOL)a5 ignoringDisabled:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  HFTriggerUISummary *v12;
  HFTriggerUISummary *v13;
  objc_super v15;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HFTriggerUISummary;
  v12 = -[HFTriggerUISummary init](&v15, sel_init);
  v13 = v12;
  if (v12)
    -[HFTriggerUISummary _updateWithTrigger:inHome:forceDisabled:ignoringDisabled:](v12, "_updateWithTrigger:inHome:forceDisabled:ignoringDisabled:", v10, v11, v7, v6);

  return v13;
}

- (void)_updateWithTrigger:(id)a3 inHome:(id)a4 forceDisabled:(BOOL)a5 ignoringDisabled:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  id v11;
  int v12;
  HFTriggerActionSetsBuilder *v13;
  void *v14;
  HFTriggerActionSetsBuilder *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  NSString *v20;
  NSString *triggerDescription;
  NSArray *v22;
  NSArray *triggerSummaryIconDescriptors;
  HFIconDescriptor *v24;
  HFIconDescriptor *triggerIconDescriptor;
  id v26;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  -[HFTriggerUISummary _getTriggerName:home:](self, "_getTriggerName:home:", v10, v11);
  v12 = objc_msgSend(v10, "isEnabled");
  v13 = [HFTriggerActionSetsBuilder alloc];
  objc_msgSend(v10, "actionSets");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HFTriggerActionSetsBuilder initWithActionSets:inHome:filterEmptyActionSets:](v13, "initWithActionSets:inHome:filterEmptyActionSets:", v14, v11, 1);

  -[HFTriggerActionSetsBuilder actionSetsSummary](v15, "actionSetsSummary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v26 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v26;
  else
    v17 = 0;
  v18 = v17;

  v19 = objc_msgSend(v11, "hf_remoteAccessState");
  if (v19 == 1 || objc_msgSend(v18, "triggerActivationState") == 1)
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFTriggerDescriptionRemoteAccessStateNotCapable"), CFSTR("HFTriggerDescriptionRemoteAccessStateNotCapable"), 1);
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v16, "summaryText:", v12 & !v7 | v6);
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  triggerDescription = self->_triggerDescription;
  self->_triggerDescription = v20;

  objc_msgSend(v16, "summaryIconDescriptors");
  v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
  triggerSummaryIconDescriptors = self->_triggerSummaryIconDescriptors;
  self->_triggerSummaryIconDescriptors = v22;

  self->_triggerType = objc_msgSend(v26, "hf_triggerType");
  +[HFTriggerIconFactory iconDescriptorForTrigger:](HFTriggerIconFactory, "iconDescriptorForTrigger:", v26);
  v24 = (HFIconDescriptor *)objc_claimAutoreleasedReturnValue();
  triggerIconDescriptor = self->_triggerIconDescriptor;
  self->_triggerIconDescriptor = v24;

}

- (void)_getTriggerName:(id)a3 home:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *triggerName;
  NSString *v12;
  NSString *triggerNaturalLanguageTitle;
  uint64_t v14;
  id v15;

  v15 = a3;
  v6 = a4;
  objc_msgSend(v15, "configuredName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_triggerNameIsConfigured = v7 != 0;

  objc_msgSend(v15, "configuredName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v15, "name");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  triggerName = self->_triggerName;
  self->_triggerName = v10;

  objc_msgSend(v15, "hf_naturalLanguageNameWithHome:type:", v6, 2);
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();

  triggerNaturalLanguageTitle = self->_triggerNaturalLanguageTitle;
  self->_triggerNaturalLanguageTitle = v12;

  v14 = 24;
  if (!self->_triggerNameIsConfigured)
    v14 = 32;
  objc_storeStrong((id *)&self->_triggerDisplayTitle, *(id *)((char *)&self->super.isa + v14));
  objc_storeStrong((id *)&self->_triggerTitle, self->_triggerDisplayTitle);

}

- (NSString)triggerDisplayTitle
{
  return self->_triggerDisplayTitle;
}

- (NSString)triggerName
{
  return self->_triggerName;
}

- (NSString)triggerNaturalLanguageTitle
{
  return self->_triggerNaturalLanguageTitle;
}

- (BOOL)triggerNameIsConfigured
{
  return self->_triggerNameIsConfigured;
}

- (NSString)triggerTitle
{
  return self->_triggerTitle;
}

- (NSString)triggerDescription
{
  return self->_triggerDescription;
}

- (unint64_t)triggerType
{
  return self->_triggerType;
}

- (HFIconDescriptor)triggerIconDescriptor
{
  return self->_triggerIconDescriptor;
}

- (NSArray)triggerSummaryIconDescriptors
{
  return self->_triggerSummaryIconDescriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerSummaryIconDescriptors, 0);
  objc_storeStrong((id *)&self->_triggerIconDescriptor, 0);
  objc_storeStrong((id *)&self->_triggerDescription, 0);
  objc_storeStrong((id *)&self->_triggerTitle, 0);
  objc_storeStrong((id *)&self->_triggerNaturalLanguageTitle, 0);
  objc_storeStrong((id *)&self->_triggerName, 0);
  objc_storeStrong((id *)&self->_triggerDisplayTitle, 0);
}

@end
