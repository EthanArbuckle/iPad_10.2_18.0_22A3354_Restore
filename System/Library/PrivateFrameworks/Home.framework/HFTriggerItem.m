@implementation HFTriggerItem

- (HFTriggerItem)initWithHome:(id)a3 trigger:(id)a4
{
  id v7;
  id v8;
  HFTriggerItem *v9;
  HFTriggerItem *v10;
  HFServiceActionItemProvider *serviceActionItemProvider;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HFTriggerItem;
  v9 = -[HFTriggerItem init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_trigger, a4);
    serviceActionItemProvider = v10->_serviceActionItemProvider;
    v10->_serviceActionItemProvider = 0;

    v10->_usesRichIconDescriptors = 0;
  }

  return v10;
}

- (HFTriggerItem)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFTriggerItem.m"), 55, CFSTR("Use -initWithHome:trigger:"));

  return 0;
}

- (HFServiceActionItemProvider)serviceActionItemProvider
{
  void *v3;
  void *v4;
  void *v5;
  HFServiceActionItemProvider *v6;
  void *v7;
  HFServiceActionItemProvider *v8;
  HFServiceActionItemProvider *serviceActionItemProvider;

  if (!self->_serviceActionItemProvider && -[HFTriggerItem usesRichIconDescriptors](self, "usesRichIconDescriptors"))
  {
    -[HFTriggerItem trigger](self, "trigger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "actionSets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_140);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = [HFServiceActionItemProvider alloc];
      -[HFTriggerItem home](self, "home");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[HFServiceActionItemProvider initWithHome:actionSet:](v6, "initWithHome:actionSet:", v7, v5);
      serviceActionItemProvider = self->_serviceActionItemProvider;
      self->_serviceActionItemProvider = v8;

    }
  }
  return self->_serviceActionItemProvider;
}

uint64_t __42__HFTriggerItem_serviceActionItemProvider__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isAnonymous");
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  HFTriggerItem *v16;
  _QWORD v17[4];
  id v18;
  HFTriggerItem *v19;

  v4 = a3;
  -[HFTriggerItem trigger](self, "trigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    NSLog(CFSTR("trigger must be set on HFTriggerItem before requesting an update"));
  -[HFTriggerItem trigger](self, "trigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __45__HFTriggerItem__subclass_updateWithOptions___block_invoke;
    v17[3] = &unk_1EA730ED0;
    v8 = v4;
    v18 = v8;
    v19 = self;
    __45__HFTriggerItem__subclass_updateWithOptions___block_invoke((uint64_t)v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __45__HFTriggerItem__subclass_updateWithOptions___block_invoke_17;
    v14[3] = &unk_1EA737CC8;
    v15 = v8;
    v16 = self;
    objc_msgSend(v9, "flatMap:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "futureWithError:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

id __45__HFTriggerItem__subclass_updateWithOptions___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", HFItemUpdateOptionFastInitialUpdate);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", &unk_1EA7CC6B8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "trigger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_forceDisableReasons");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

id __45__HFTriggerItem__subclass_updateWithOptions___block_invoke_17(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  HFTriggerUISummary *v9;
  void *v10;
  void *v11;
  HFTriggerUISummary *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  __CFString **v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  _QWORD v35[4];
  id v36;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a2;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", HFTriggerItemIgnoresDisabledStateOptionKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  v9 = [HFTriggerUISummary alloc];
  objc_msgSend(*(id *)(a1 + 40), "trigger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HFTriggerUISummary initWithTrigger:inHome:forceDisabled:ignoringDisabled:](v9, "initWithTrigger:inHome:forceDisabled:ignoringDisabled:", v10, v11, v6 != 0, v8);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("HFResultTriggerUISummaryKey"));
  -[HFTriggerUISummary triggerDisplayTitle](v12, "triggerDisplayTitle");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = MEMORY[0x1E0C9AAB0];
  if (v13)
    v16 = v13;
  else
    v16 = MEMORY[0x1E0C9AAB0];
  v17 = HFResultHiddenKey;
  if (v13)
    v17 = HFResultDisplayTitleKey;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, *v17);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("accessWhileLockedSettingDependency"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("userNotificationSettingsDependency"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("remoteAccessDependency"));
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "trigger");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  objc_msgSend(*(id *)(a1 + 40), "home");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "hf_remoteAccessState") == 1 || objc_msgSend(v20, "triggerActivationState") == 1;

  -[HFTriggerUISummary triggerDescription](v12, "triggerDescription");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("description"));
  if (v6)
    v24 = 1;
  else
    v24 = v22;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("displayWarningIcon"));

  v26 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "trigger");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v27, "hf_triggerType"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, CFSTR("triggerType"));

  -[HFTriggerUISummary triggerIconDescriptor](v12, "triggerIconDescriptor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, CFSTR("icon"));

  -[HFTriggerUISummary triggerSummaryIconDescriptors](v12, "triggerSummaryIconDescriptors");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "createRichIconDescriptors:options:", v30, *(_QWORD *)(a1 + 32));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __45__HFTriggerItem__subclass_updateWithOptions___block_invoke_2;
  v35[3] = &unk_1EA72ADB0;
  v36 = v5;
  v32 = v5;
  objc_msgSend(v31, "flatMap:", v35);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

id __45__HFTriggerItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, CFSTR("iconDescriptorList"));
  v3 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)createRichIconDescriptors:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v6 = a3;
  v7 = a4;
  if (-[HFTriggerItem usesRichIconDescriptors](self, "usesRichIconDescriptors")
    && (-[HFTriggerItem serviceActionItemProvider](self, "serviceActionItemProvider"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    -[HFTriggerItem serviceActionItemProvider](self, "serviceActionItemProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reloadItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __51__HFTriggerItem_createRichIconDescriptors_options___block_invoke;
    v17[3] = &unk_1EA737D18;
    v17[4] = self;
    v18 = v7;
    objc_msgSend(v10, "flatMap:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __51__HFTriggerItem_createRichIconDescriptors_options___block_invoke_3;
    v15[3] = &unk_1EA732620;
    v15[4] = self;
    v16 = v6;
    objc_msgSend(v12, "flatMap:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

id __51__HFTriggerItem_createRichIconDescriptors_options___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "serviceActionItemProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__HFTriggerItem_createRichIconDescriptors_options___block_invoke_2;
  v9[3] = &unk_1EA737CF0;
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v3, "na_map:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(v4, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "combineAllFutures:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __51__HFTriggerItem_createRichIconDescriptors_options___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateWithOptions:", *(_QWORD *)(a1 + 32));
}

id __51__HFTriggerItem_createRichIconDescriptors_options___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "serviceActionItemProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(*(id *)(a1 + 32), "translateToRichIconDescriptors:basedOnActionItems:", *(_QWORD *)(a1 + 40), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)translateToRichIconDescriptors:(id)a3 basedOnActionItems:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v5 = (objc_class *)MEMORY[0x1E0C99E10];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  v9 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __67__HFTriggerItem_translateToRichIconDescriptors_basedOnActionItems___block_invoke;
  v22[3] = &unk_1EA737D40;
  v23 = v8;
  v10 = v8;
  objc_msgSend(v7, "na_each:", v22);
  objc_msgSend(v7, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_31_5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "na_map:", &__block_literal_global_33_2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_90_2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __67__HFTriggerItem_translateToRichIconDescriptors_basedOnActionItems___block_invoke_5;
  v19[3] = &unk_1EA737E48;
  v20 = v13;
  v21 = v11;
  v15 = v11;
  v16 = v13;
  objc_msgSend(v14, "na_flatMap:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void __67__HFTriggerItem_translateToRichIconDescriptors_basedOnActionItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __67__HFTriggerItem_translateToRichIconDescriptors_basedOnActionItems___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

HFCAPackageIconDescriptor *__67__HFTriggerItem_translateToRichIconDescriptors_basedOnActionItems___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  HFCAPackageIconDescriptor *v5;
  HFCAPackageIconDescriptor *v6;
  HFCAPackageIconDescriptor *v7;
  void *v8;
  void *v9;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("icon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1F03F3370))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v7 = [HFCAPackageIconDescriptor alloc];
    -[HFCAPackageIconDescriptor packageIdentifier](v6, "packageIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCAPackageIconDescriptor state](v6, "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:state:](v7, "initWithPackageIdentifier:state:", v8, v9);
  }
  return v5;
}

uint64_t __67__HFTriggerItem_translateToRichIconDescriptors_basedOnActionItems___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

id __67__HFTriggerItem_translateToRichIconDescriptors_basedOnActionItems___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "allObjects");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_92_2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v4);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __67__HFTriggerItem_translateToRichIconDescriptors_basedOnActionItems___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (HMHome)home
{
  return self->_home;
}

- (HMTrigger)trigger
{
  return self->_trigger;
}

- (BOOL)usesRichIconDescriptors
{
  return self->_usesRichIconDescriptors;
}

- (void)setUsesRichIconDescriptors:(BOOL)a3
{
  self->_usesRichIconDescriptors = a3;
}

- (void)setServiceActionItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_serviceActionItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceActionItemProvider, 0);
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
