@implementation HUTriggerListSubheadlineItem

- (HUTriggerListSubheadlineItem)initWithRemoteAccessInfo:(id)a3
{
  id v5;
  HUTriggerListSubheadlineItem *v6;
  HUTriggerListSubheadlineItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUTriggerListSubheadlineItem;
  v6 = -[HUTriggerListSubheadlineItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_remoteAccessInfo, a3);

  return v7;
}

- (HUTriggerListSubheadlineItem)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTriggerListSubheadlineItem.m"), 31, CFSTR("Use -initWithHome:"));

  return 0;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[HUTriggerListSubheadlineItem remoteAccessInfo](self, "remoteAccessInfo", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    NSLog(CFSTR("remoteAccessInfo must be set on HUTriggerListSubheadlineItem before requesting an update"));
  -[HUTriggerListSubheadlineItem remoteAccessInfo](self, "remoteAccessInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D519C0];
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0D314B8];
    -[HUTriggerListSubheadlineItem remoteAccessInfo](self, "remoteAccessInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerListSubheadlineItem resultsForRemoteAccessState:](self, "resultsForRemoteAccessState:", objc_msgSend(v8, "hf_remoteAccessState"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "outcomeWithResults:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "futureWithResult:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "futureWithError:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)resultsForRemoteAccessState:(unint64_t)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
    -[HUTriggerListSubheadlineItem _attributedDescriptionForNoRemoteAccess](self, "_attributedDescriptionForNoRemoteAccess");
  else
    -[HUTriggerListSubheadlineItem _attributedDescription](self, "_attributedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D30D50];
  v7[0] = *MEMORY[0x1E0D30BF8];
  v7[1] = v4;
  v8[0] = v3;
  v8[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_attributedDescriptionForNoRemoteAccess
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = *MEMORY[0x1E0CEA0C0];
  objc_msgSend(MEMORY[0x1E0D31970], "aboutResidentDeviceURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x1E0CB3778]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerListHeadlineDescriptionWithoutResident"), CFSTR("HUTriggerListHeadlineDescriptionWithoutResident"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithString:", v5);

  v7 = objc_alloc(MEMORY[0x1E0CB3498]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerListHeadlineDescriptionLearnMore"), CFSTR("HUTriggerListHeadlineDescriptionLearnMore"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:attributes:", v8, v3);

  objc_msgSend(v6, "appendAttributedString:", v9);
  return v6;
}

- (id)_attributedDescription
{
  return _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerListHeadlineDescription"), CFSTR("HUTriggerListHeadlineDescription"), 1);
}

- (Class)mapsToViewClass
{
  return (Class)objc_opt_class();
}

- (HasRemoteAccessState)remoteAccessInfo
{
  return self->_remoteAccessInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAccessInfo, 0);
}

@end
