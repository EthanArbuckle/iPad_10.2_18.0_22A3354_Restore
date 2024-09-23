@implementation HUTriggerBuilderItem

- (HUTriggerBuilderItem)initWithTriggerBuilder:(id)a3 nameType:(unint64_t)a4
{
  id v7;
  HUTriggerBuilderItem *v8;
  HUTriggerBuilderItem *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUTriggerBuilderItem;
  v8 = -[HUTriggerBuilderItem init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_triggerBuilder, a3);
    v9->_naturalLanguageNameType = a4;
  }

  return v9;
}

- (HUTriggerBuilderItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithTriggerBuilder_nameType_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTriggerBuilderItem.m"), 41, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUTriggerBuilderItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HUTriggerBuilderItem triggerBuilder](self, "triggerBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithTriggerBuilder:nameType:", v5, -[HUTriggerBuilderItem naturalLanguageNameType](self, "naturalLanguageNameType"));

  return v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
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
  void *v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[3];

  v54[2] = *MEMORY[0x1E0C80C00];
  -[HUTriggerBuilderItem triggerBuilder](self, "triggerBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    NSLog(CFSTR("triggerBuilder must be set before asking HUTriggerBuilderItem to update"));
  -[HUTriggerBuilderItem triggerBuilder](self, "triggerBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    -[HUTriggerBuilderItem triggerBuilder](self, "triggerBuilder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    v10 = objc_alloc(MEMORY[0x1E0D31968]);
    -[HUTriggerBuilderItem triggerBuilder](self, "triggerBuilder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trigger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerBuilderItem triggerBuilder](self, "triggerBuilder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v10, "initWithTrigger:inHome:forceDisabled:ignoringDisabled:", v12, v14, 0, 1);

    -[HUTriggerBuilderItem triggerBuilder](self, "triggerBuilder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "naturalLanguageNameOfType:", -[HUTriggerBuilderItem naturalLanguageNameType](self, "naturalLanguageNameType"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[HUTriggerBuilderItem naturalLanguageNameType](self, "naturalLanguageNameType") == 3)
    {
      objc_msgSend(v15, "triggerDisplayTitle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HUTriggerBuilderItem triggerBuilder](self, "triggerBuilder");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "naturalLanguageNameOfType:", -[HUTriggerBuilderItem naturalLanguageNameType](self, "naturalLanguageNameType"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v23;
    }

    if (v18)
      v24 = v18;
    else
      v24 = (void *)MEMORY[0x1E0C9AAB0];
    v25 = (_QWORD *)MEMORY[0x1E0D30D70];
    if (v18)
      v25 = (_QWORD *)MEMORY[0x1E0D30D18];
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, *v25);
    objc_msgSend(MEMORY[0x1E0D31948], "iconDescriptorForTriggerType:", -[HUTriggerBuilderItem _triggerType](self, "_triggerType"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0D30C60]);

    -[HUTriggerBuilderItem triggerBuilder](self, "triggerBuilder");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "home");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "hf_currentUserIsAdministrator");
    v30 = v29 ^ 1u;

    if (v9)
    {
      objc_msgSend(v9, "locationInterface");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "locationEventBuilder");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        if (v29)
        {
          objc_msgSend(v9, "locationInterface");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "locationEventBuilder");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "eventType");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v35 == 0;

        }
        else
        {
          v30 = 1;
        }
        objc_opt_class();
        objc_msgSend(v9, "locationInterface");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "locationEventBuilder");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (objc_opt_isKindOfClass() & 1) != 0 ? v37 : 0;

        if (v38)
        {
          objc_msgSend(v9, "trigger");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "creator");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if ((v30 & 1) != 0)
          {
            v30 = 1;
          }
          else
          {
            -[HUTriggerBuilderItem triggerBuilder](self, "triggerBuilder");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "home");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "currentUser");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v40 != v43;

          }
        }
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v30);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v44, *MEMORY[0x1E0D30C80]);

    v45 = (void *)MEMORY[0x1E0D519C0];
    -[HUTriggerBuilderItem _resultsForTriggerConditions](self, "_resultsForTriggerConditions");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v46;
    -[HUTriggerBuilderItem _forceDisableReasons](self, "_forceDisableReasons");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = v47;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "combineAllFutures:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __52__HUTriggerBuilderItem__subclass_updateWithOptions___block_invoke;
    v52[3] = &unk_1E6F4CD30;
    v53 = v6;
    v50 = v6;
    objc_msgSend(v49, "flatMap:", v52);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    return v51;
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "futureWithError:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    return v21;
  }
}

id __52__HUTriggerBuilderItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__HUTriggerBuilderItem__subclass_updateWithOptions___block_invoke_2;
  v8[3] = &unk_1E6F520D0;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(a2, "na_each:", v8);
  v4 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __52__HUTriggerBuilderItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", a2);
}

- (id)_resultsForTriggerConditions
{
  HUTriggerConditionSummaryItem *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HUTriggerConditionSummaryItem *v9;
  void *v10;
  void *v11;

  v3 = [HUTriggerConditionSummaryItem alloc];
  -[HUTriggerBuilderItem triggerBuilder](self, "triggerBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conditionCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "conditions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerBuilderItem triggerBuilder](self, "triggerBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HUTriggerConditionSummaryItem initWithConditions:home:](v3, "initWithConditions:home:", v6, v8);

  -[HUTriggerConditionSummaryItem updateWithOptions:](v9, "updateWithOptions:", MEMORY[0x1E0C9AA70]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "flatMap:", &__block_literal_global_72);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __52__HUTriggerBuilderItem__resultsForTriggerConditions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30BF8]);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_forceDisableReasons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[5];

  v3 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D319A0], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notificationSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "flatMap:", &__block_literal_global_28_0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recover:", &__block_literal_global_30_3);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__HUTriggerBuilderItem__forceDisableReasons__block_invoke_3;
  v12[3] = &unk_1E6F4CD58;
  v12[4] = self;
  objc_msgSend(v5, "flatMap:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __44__HUTriggerBuilderItem__forceDisableReasons__block_invoke(uint64_t a1, void *a2)
{
  _BOOL8 v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_msgSend(a2, "authorizationStatus") != 2;
  v3 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __44__HUTriggerBuilderItem__forceDisableReasons__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "futureWithResult:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __44__HUTriggerBuilderItem__forceDisableReasons__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  char v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  unsigned __int8 v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  v5 = objc_msgSend(v3, "unsignedIntegerValue");

  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D319D0], "isAVisionPro") & 1) != 0)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "homeManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isAccessAllowedWhenLocked");

    if (v9)
      v10 = v5;
    else
      v10 = v5 | 2;
    objc_msgSend(*(id *)(a1 + 32), "triggerBuilder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v11, "requiresLocationServicesAuthorization");

    if (v6)
      v5 = v10 | 0x10;
    else
      v5 = v10;
  }
  objc_msgSend(*(id *)(a1 + 32), "triggerBuilder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "requiresUpdatedHomeHub");

  if (v13)
    v14 = v5 | 8;
  else
    v14 = v5;
  objc_msgSend(*(id *)(a1 + 32), "triggerBuilder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "requiresHomeHub");

  if (v16)
    v17 = v14 | 4;
  else
    v17 = v14;
  v18 = v16 | v13 | v6;
  objc_msgSend(*(id *)(a1 + 32), "triggerBuilder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "requiresFMFDeviceToRun");

  if (v20)
  {
    objc_msgSend(*(id *)(a1 + 32), "triggerBuilder");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "home");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "currentUser");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "homeAccessControlForUser:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "presenceComputationStatus");

    if (v25 == 3)
    {
      v17 |= 0x20uLL;
      v18 = 1;
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "triggerBuilder");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "requiresConfirmationToRun");

  if ((v18 & 1) != 0 || v27)
  {
    v29 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "triggerBuilder");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "home");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_detailedErrorDescriptionForForceDisableReasons:inHome:", v17, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0D30C18]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, CFSTR("activeForceDisableReasons"));

    v28 = v17;
  }
  else
  {
    v28 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "triggerBuilder");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "secureActionsRequireConfirmationToRun");

  if (v35)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v36, CFSTR("forceDisableReasonsForSecureCharacteristicControl"));

  }
  objc_msgSend(*(id *)(a1 + 32), "triggerBuilder");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "enabled");

  if ((v38 & (v28 == 0)) != 0)
    v39 = 2;
  else
    v39 = 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v40, *MEMORY[0x1E0D30E20]);

  v41 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D40]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v41, *MEMORY[0x1E0D30D68]);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

- (unint64_t)_triggerType
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  char isKindOfClass;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  _QWORD v23[4];
  id v24;

  objc_opt_class();
  -[HUTriggerBuilderItem triggerBuilder](self, "triggerBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  -[HUTriggerBuilderItem triggerBuilder](self, "triggerBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v8 = 1;
  }
  else if (v5)
  {
    objc_msgSend(v5, "eventTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10 <= 1)
    {
      objc_msgSend(v5, "eventTypes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "containsObject:", *MEMORY[0x1E0D305D8]);

      if (v14)
      {
        objc_msgSend(v5, "locationInterface");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "locationEventBuilder");
        v16 = (id)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = 2;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v16, "locationEventType") == 2)
              v8 = 4;
            else
              v8 = 3;
          }
          else
          {
            v8 = 0;
          }
        }
      }
      else
      {
        objc_msgSend(v5, "eventTypes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "containsObject:", *MEMORY[0x1E0D305D0]);

        if (!v18)
        {
          v8 = 0;
          goto LABEL_27;
        }
        objc_msgSend(MEMORY[0x1E0CBA458], "hf_sensingCharacteristicTypes");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "characteristics");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __36__HUTriggerBuilderItem__triggerType__block_invoke;
        v23[3] = &unk_1E6F4EE30;
        v24 = v19;
        v16 = v19;
        v21 = objc_msgSend(v20, "na_any:", v23);

        if (v21)
          v8 = 6;
        else
          v8 = 5;

      }
      goto LABEL_27;
    }
    v8 = 8;
  }
  else
  {
    -[HUTriggerBuilderItem triggerBuilder](self, "triggerBuilder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v12 = objc_opt_isKindOfClass();

    if ((v12 & 1) != 0)
      v8 = 7;
    else
      v8 = 0;
  }
LABEL_27:

  return v8;
}

uint64_t __36__HUTriggerBuilderItem__triggerType__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

+ (id)_detailedErrorDescriptionForForceDisableReasons:(unint64_t)a3 inHome:(id)a4
{
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v34;

  v5 = a4;
  v6 = v5;
  if ((a3 & 8) != 0)
  {
    objc_msgSend(v5, "hf_primaryResidentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      HULocalizedStringWithFormat(CFSTR("HUTriggerRequiresUpdatedHomeHub"), CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v9);
    else
      _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerRequiresUpdatedHomeHubGenericName"), CFSTR("HUTriggerRequiresUpdatedHomeHubGenericName"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if ((a3 & 4) != 0)
    {
      v7 = CFSTR("HUTriggerRequiresHomeHub");
      goto LABEL_14;
    }
    if ((a3 & 0x10) != 0)
    {
      v7 = CFSTR("HUTriggerRequiresLocationServicesAuthorization");
      goto LABEL_14;
    }
    if ((a3 & 1) != 0)
    {
      v17 = CFSTR("RequiresConfirmationToRunButNotificationsAreDisabled");
    }
    else if ((a3 & 2) != 0)
    {
      v17 = CFSTR("RequiresConfirmationToRunButAccessWhileLockedIsDisabled");
    }
    else
    {
      if ((a3 & 0x20) == 0)
      {
        v7 = CFSTR("HUTriggerRequiresConfirmationToRunWarning");
LABEL_14:
        _HULocalizedStringWithDefaultValue(v7, v7, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      v17 = CFSTR("RequiresFMFDevice");
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HUTrigger%@SettingsLinkTitle"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(v18, v18, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HUTrigger%@WarningFormat"), v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(v20, CFSTR("%@"), v21, v22, v23, v24, v25, v26, (uint64_t)v19);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v27);
    v28 = objc_msgSend(v27, "rangeOfString:options:", v19, 4);
    if (v28 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v30 = v28;
      v34 = v29;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "settingsURLForForceDisableReasons:", a3);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "na_safeSetObject:forKey:", v32, *MEMORY[0x1E0CEA0C0]);

      objc_msgSend(v16, "addAttributes:range:", v31, v30, v34);
    }

  }
LABEL_21:

  return v16;
}

+ (id)settingsURLForForceDisableReasons:(unint64_t)a3
{
  void *v4;

  if ((a3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "hf_notificationSettingsURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if ((a3 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "hf_allowAccessWhileLockedSettingsURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((a3 & 0x20) == 0)
      return 0;
    objc_msgSend(MEMORY[0x1E0C99E98], "hf_locationDeviceSettingsURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (HFTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (unint64_t)naturalLanguageNameType
{
  return self->_naturalLanguageNameType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerBuilder, 0);
}

@end
