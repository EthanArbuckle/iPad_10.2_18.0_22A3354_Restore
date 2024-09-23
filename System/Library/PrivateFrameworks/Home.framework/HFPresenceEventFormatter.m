@implementation HFPresenceEventFormatter

- (HFPresenceEventFormatter)initWithHome:(id)a3
{
  id v5;
  HFPresenceEventFormatter *v6;
  HFPresenceEventFormatter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFPresenceEventFormatter;
  v6 = -[HFPresenceEventFormatter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_home, a3);

  return v7;
}

- (HFPresenceEventFormatter)initWithOptions:(id)a3
{
  id v4;
  void *v5;
  HFPresenceEventFormatter *v6;

  v4 = a3;
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HFPresenceEventFormatter initWithHome:](self, "initWithHome:", v5);

  if (v6)
  {
    v6->_nameType = objc_msgSend(v4, "nameType");
    objc_storeWeak((id *)&v6->_options, v4);
  }

  return v6;
}

- (id)stringForPresenceEvent:(id)a3
{
  id v4;
  HFPresenceEventBuilder *v5;
  void *v6;

  v4 = a3;
  v5 = -[HFPresenceEventBuilder initWithEvent:]([HFPresenceEventBuilder alloc], "initWithEvent:", v4);

  -[HFPresenceEventFormatter stringForPresenceEventBuilder:](self, "stringForPresenceEventBuilder:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)stringForPresenceEventBuilder:(id)a3
{
  return -[HFPresenceEventFormatter stringForPresenceEventBuilder:actionsDescription:](self, "stringForPresenceEventBuilder:actionsDescription:", a3, 0);
}

- (id)stringForPresenceEventBuilder:(id)a3 actionsDescription:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  id v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  unint64_t v16;
  unint64_t v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  _QWORD aBlock[4];
  id v44;
  uint64_t v45;
  _QWORD v46[4];
  id v47;
  HFPresenceEventFormatter *v48;
  id v49;
  _QWORD v50[4];
  id v51;
  HFPresenceEventFormatter *v52;
  id v53;
  _QWORD v54[5];
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = objc_msgSend(v8, "activationGranularity");
  v10 = CFSTR("ActivationGranularityUser");
  if (v9)
    v10 = &stru_1EA741FF8;
  if (v9 == 1)
    v10 = CFSTR("ActivationGranularityHome");
  v11 = v10;
  v12 = v8;
  v13 = objc_msgSend(v12, "locationEventType");
  v14 = CFSTR("Arriving");
  if (v13 != 1)
    v14 = &stru_1EA741FF8;
  if (v13 == 2)
    v14 = CFSTR("Leaving");
  v15 = v14;
  v16 = -[HFPresenceEventFormatter style](self, "style");
  if (v16 == 1)
  {
    v18 = CFSTR("HFPresenceEventActivationDescription");
  }
  else if (v16)
  {
    v18 = &stru_1EA741FF8;
  }
  else
  {
    v17 = -[HFPresenceEventFormatter nameType](self, "nameType");
    v18 = CFSTR("HFPresenceTriggerNameFullSentence");
    if (v17 == 1)
      v18 = CFSTR("HFPresenceTriggerName");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_%@"), v18, v11, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "users");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "type");

  if (!v21)
  {
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __77__HFPresenceEventFormatter_stringForPresenceEventBuilder_actionsDescription___block_invoke_4;
    v54[3] = &unk_1EA727AC0;
    v54[4] = self;
    if (__77__HFPresenceEventFormatter_stringForPresenceEventBuilder_actionsDescription___block_invoke_4((uint64_t)v54))
      v28 = CFSTR("_CurrentUser");
    else
      v28 = CFSTR("_AllUsers");
    goto LABEL_24;
  }
  objc_msgSend(v12, "users");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPresenceEventFormatter home](self, "home");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "resolveSelectedUsersWithHome:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (v25 == 2)
  {
    if (!objc_msgSend(v12, "activationGranularity"))
    {
      objc_msgSend(v19, "stringByAppendingString:", CFSTR("_ListOfUsers"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __77__HFPresenceEventFormatter_stringForPresenceEventBuilder_actionsDescription___block_invoke_6;
      v46[3] = &unk_1EA727AE8;
      v47 = v7;
      v48 = self;
      v49 = v12;
      v30 = _Block_copy(v46);

      v31 = v47;
      goto LABEL_29;
    }
    goto LABEL_26;
  }
  if (v25 != 1)
  {
LABEL_26:
    objc_msgSend(v19, "stringByAppendingString:", CFSTR("_NumberOfUsers"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __77__HFPresenceEventFormatter_stringForPresenceEventBuilder_actionsDescription___block_invoke_7;
    aBlock[3] = &unk_1EA727B10;
    v44 = v7;
    v45 = v25;
    v30 = _Block_copy(aBlock);
    v31 = v44;
LABEL_29:

    goto LABEL_30;
  }
  objc_msgSend(v12, "users");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "type");

  if (v27 != 1)
  {
    objc_msgSend(v19, "stringByAppendingString:", CFSTR("_SingleUser"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __77__HFPresenceEventFormatter_stringForPresenceEventBuilder_actionsDescription___block_invoke_5;
    v50[3] = &unk_1EA727AE8;
    v51 = v7;
    v52 = self;
    v53 = v12;
    v30 = _Block_copy(v50);

    v31 = v51;
    goto LABEL_29;
  }
  v28 = CFSTR("_CurrentUser");
LABEL_24:
  objc_msgSend(v19, "stringByAppendingString:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0;
LABEL_30:
  if (objc_msgSend(v7, "length") && -[HFPresenceEventFormatter nameType](self, "nameType") == 2)
  {
    objc_msgSend(v29, "stringByAppendingString:", CFSTR("_WithAction"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __77__HFPresenceEventFormatter_stringForPresenceEventBuilder_actionsDescription___block_invoke_8;
      v41[3] = &unk_1EA727B38;
      v42 = v7;
      v30 = _Block_copy(v41);

    }
  }
  else
  {
    v32 = v29;
  }
  _HFLocalizedStringWithDefaultValue(CFSTR("HFUnknownLocationTriggerName"), CFSTR("HFUnknownLocationTriggerName"), 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  HFLocalizedStringWithFormatterBlock(v32, v33, v30);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "isEqualToString:", v33))
  {
    HFLogForCategory(0x2EuLL);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v40 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v56 = v40;
      v57 = 2112;
      v58 = v32;
      _os_log_error_impl(&dword_1DD34E000, v35, OS_LOG_TYPE_ERROR, "%@: failed to localize string with key: %@", buf, 0x16u);
    }

  }
  if (!-[HFPresenceEventFormatter nameType](self, "nameType"))
  {
    v36 = (void *)MEMORY[0x1E0CBA920];
    -[HFPresenceEventFormatter home](self, "home");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "hf_sanitizeTriggerName:home:", v34, v37);
    v38 = objc_claimAutoreleasedReturnValue();

    v34 = (void *)v38;
  }

  return v34;
}

BOOL __77__HFPresenceEventFormatter_stringForPresenceEventBuilder_actionsDescription___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(*(id *)(a1 + 32), "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "shouldUseFirstPersonPronounIfPossible"))
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hf_allUsersIncludingCurrentUser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") == 1 && objc_msgSend(*(id *)(a1 + 32), "nameType") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id __77__HFPresenceEventFormatter_stringForPresenceEventBuilder_actionsDescription___block_invoke_5(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = (void *)MEMORY[0x1E0CB3940];
  if (*(_QWORD *)(a1 + 32))
  {
    v21 = 0;
    v6 = *(void **)(a1 + 40);
    v5 = *(void **)(a1 + 48);
    v7 = a2;
    objc_msgSend(v5, "users");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_formattedListForSelectedUsers:inHome:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 32);
    v11 = (id *)&v21;
    objc_msgSend(v4, "stringWithValidatedFormat:validFormatSpecifiers:error:", v7, CFSTR("%@%@"), &v21, v10, v19, v20, 0);
  }
  else
  {
    v20 = 0;
    v13 = *(void **)(a1 + 40);
    v12 = *(void **)(a1 + 48);
    v14 = a2;
    objc_msgSend(v12, "users");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_formattedListForSelectedUsers:inHome:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id *)&v20;
    objc_msgSend(v4, "stringWithValidatedFormat:validFormatSpecifiers:error:", v14, CFSTR("%@"), &v20, v10, v18, 0, v21);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = *v11;
  return v15;
}

id __77__HFPresenceEventFormatter_stringForPresenceEventBuilder_actionsDescription___block_invoke_6(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = (void *)MEMORY[0x1E0CB3940];
  if (*(_QWORD *)(a1 + 32))
  {
    v21 = 0;
    v6 = *(void **)(a1 + 40);
    v5 = *(void **)(a1 + 48);
    v7 = a2;
    objc_msgSend(v5, "users");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_formattedListForSelectedUsers:inHome:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 32);
    v11 = (id *)&v21;
    objc_msgSend(v4, "stringWithValidatedFormat:validFormatSpecifiers:error:", v7, CFSTR("%@%@"), &v21, v10, v19, v20, 0);
  }
  else
  {
    v20 = 0;
    v13 = *(void **)(a1 + 40);
    v12 = *(void **)(a1 + 48);
    v14 = a2;
    objc_msgSend(v12, "users");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_formattedListForSelectedUsers:inHome:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id *)&v20;
    objc_msgSend(v4, "stringWithValidatedFormat:validFormatSpecifiers:error:", v14, CFSTR("%@"), &v20, v10, v18, 0, v21);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = *v11;
  return v15;
}

id __77__HFPresenceEventFormatter_stringForPresenceEventBuilder_actionsDescription___block_invoke_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v8 = 0;
    v3 = (id *)&v8;
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", a2, CFSTR("%ld%@"), &v8, *(_QWORD *)(a1 + 40), v2, v7, 0);
  }
  else
  {
    v7 = 0;
    v3 = (id *)&v7;
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", a2, CFSTR("%ld"), &v7, *(_QWORD *)(a1 + 40), v6, 0, v8);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __77__HFPresenceEventFormatter_stringForPresenceEventBuilder_actionsDescription___block_invoke_8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", a2, CFSTR("%@"), &v4, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_formattedListForSelectedUsers:(id)a3 inHome:(id)a4
{
  id v5;
  id v6;
  HFUserNameFormatter *v7;
  void *v8;
  void *v9;
  HFUserNameFormatter *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  id (*v19)(uint64_t, uint64_t);
  void *v20;
  id v21;
  HFUserNameFormatter *v22;

  v5 = a4;
  v6 = a3;
  v7 = -[HFUserNameFormatter initWithHome:]([HFUserNameFormatter alloc], "initWithHome:", v5);
  -[HFUserNameFormatter setStyle:](v7, "setStyle:", 1);
  objc_msgSend(v6, "resolveSelectedUsersWithHome:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __66__HFPresenceEventFormatter__formattedListForSelectedUsers_inHome___block_invoke;
  v20 = &unk_1EA727B60;
  v21 = v5;
  v22 = v7;
  v10 = v7;
  v11 = v5;
  objc_msgSend(v9, "na_map:", &v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sortedArrayUsingSelector:", sel_localizedStandardCompare_, v17, v18, v19, v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (_MergedGlobals_6 != -1)
    dispatch_once(&_MergedGlobals_6, &__block_literal_global_50);
  v14 = (id)qword_1F03ED238;
  objc_msgSend(v14, "setListStyle:", 1);
  objc_msgSend(v14, "stringForObjectValue:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __66__HFPresenceEventFormatter__formattedListForSelectedUsers_inHome___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "hf_handleForUser:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "stringForObjectValue:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __66__HFPresenceEventFormatter__formattedListForSelectedUsers_inHome___block_invoke_3()
{
  HFListFormatter *v0;
  void *v1;

  v0 = objc_alloc_init(HFListFormatter);
  v1 = (void *)qword_1F03ED238;
  qword_1F03ED238 = (uint64_t)v0;

}

- (unint64_t)nameType
{
  return self->_nameType;
}

- (void)setNameType:(unint64_t)a3
{
  self->_nameType = a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (HFTriggerNaturalLanguageOptions)options
{
  return (HFTriggerNaturalLanguageOptions *)objc_loadWeakRetained((id *)&self->_options);
}

- (void)setOptions:(id)a3
{
  objc_storeWeak((id *)&self->_options, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_options);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
