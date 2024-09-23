@implementation HFTelevisionServiceItem

+ (id)supportedServiceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9AF0]);
}

- (id)createControlItemsWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  HFPowerStateControlItem *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  HFTVInputControlItem *v14;
  void *v15;
  HFTVInputControlItem *v16;
  void *v17;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceItem controlItemValueSourceForPrimaryService](self, "controlItemValueSourceForPrimaryService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = CFSTR("controlItemPurpose");
  v22[0] = &unk_1EA7CBF20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFPowerStateControlItem initWithValueSource:displayResults:]([HFPowerStateControlItem alloc], "initWithValueSource:displayResults:", v5, v6);
  objc_msgSend(v4, "addObject:", v7);
  -[HFServiceItem service](self, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hf_childServices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_filter:", &__block_literal_global_64);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    -[HFServiceItem service](self, "service");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setByAddingObject:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    -[HFServiceItem controlItemValueSourceForServices:](self, "controlItemValueSourceForServices:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = [HFTVInputControlItem alloc];
    v19 = CFSTR("controlItemPurpose");
    v20 = &unk_1EA7CBF38;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HFTVInputControlItem initWithValueSource:displayResults:](v14, "initWithValueSource:displayResults:", v13, v15);

    objc_msgSend(v4, "addObject:", v16);
    v10 = (void *)v12;
  }
  v17 = (void *)objc_msgSend(v4, "copy");

  return v17;
}

uint64_t __57__HFTelevisionServiceItem_createControlItemsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB9A48]);

  return v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = *MEMORY[0x1E0CB8798];
  v15[0] = *MEMORY[0x1E0CB8790];
  v15[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFServiceItem performStandardUpdateWithCharacteristicTypes:options:](self, "performStandardUpdateWithCharacteristicTypes:options:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__HFTelevisionServiceItem__subclass_updateWithOptions___block_invoke;
  v13[3] = &unk_1EA72A770;
  v13[4] = self;
  v14 = v4;
  v10 = v4;
  objc_msgSend(v9, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __55__HFTelevisionServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  const char *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint32_t v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v46;
  const char *v47;
  NSObject *v48;
  os_log_type_t v49;
  uint32_t v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  _QWORD v55[4];
  id v56;
  uint8_t buf[4];
  uint64_t v58;
  os_activity_scope_state_s state;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "readResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0CB8790];
  objc_msgSend(*(id *)(a1 + 32), "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseForCharacteristicType:inService:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "valueWithExpectedClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "standardResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("suspendedState"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  objc_msgSend(v3, "standardResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v3, "displayMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "error");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("errorDescription"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      if (!v8)
        goto LABEL_35;
      objc_msgSend(v3, "readResponse");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "responseForCharacteristicType:", *MEMORY[0x1E0CB8798]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "valueWithExpectedClass:", objc_opt_class());
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "service");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "hf_childServices");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __55__HFTelevisionServiceItem__subclass_updateWithOptions___block_invoke_2;
      v55[3] = &unk_1EA7283A0;
      v54 = v23;
      v56 = v54;
      objc_msgSend(v25, "na_filter:", v55);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", HFItemUpdateOptionLogger);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v27;
      if (objc_msgSend(MEMORY[0x1E0CBA1A8], "hf_isSuspendedStateSuspended:", v11))
      {
        if (v27)
        {
          state.opaque[0] = 0;
          state.opaque[1] = 0;
          objc_msgSend(v27, "loggerActivity", v27);
          v28 = objc_claimAutoreleasedReturnValue();
          os_activity_scope_enter(v28, &state);

          HFLogForCategory(0x29uLL);
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v58 = v11;
            v30 = "HFTelevision is suspended with state %lu";
            v31 = v29;
            v32 = OS_LOG_TYPE_DEFAULT;
            v33 = 12;
LABEL_22:
            _os_log_impl(&dword_1DD34E000, v31, v32, v30, buf, v33);
          }
LABEL_23:

          os_activity_scope_leave(&state);
          goto LABEL_24;
        }
        HFLogForCategory(0x29uLL);
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(state.opaque[0]) = 134217984;
          *(uint64_t *)((char *)state.opaque + 4) = v11;
          v47 = "HFTelevision is suspended with state %lu";
          v48 = v46;
          v49 = OS_LOG_TYPE_DEFAULT;
          v50 = 12;
LABEL_43:
          _os_log_impl(&dword_1DD34E000, v48, v49, v47, (uint8_t *)&state, v50);
        }
LABEL_44:

LABEL_24:
        objc_msgSend(v26, "anyObject", v51);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v26;
        if (objc_msgSend(v8, "BOOLValue") && v36)
        {
          objc_msgSend(v36, "name");
          v37 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (objc_msgSend(v8, "BOOLValue"))
            v38 = CFSTR("HFCharacteristicValuePowerStateOn");
          else
            v38 = CFSTR("HFCharacteristicValuePowerStateOff");
          _HFLocalizedStringWithDefaultValue(v38, v38, 1);
          v37 = objc_claimAutoreleasedReturnValue();
        }
        v39 = (void *)v37;
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v37, CFSTR("description"));

        if ((objc_msgSend(v8, "BOOLValue") & 1) == 0
          && objc_msgSend(MEMORY[0x1E0CBA1A8], "hf_isSuspendedStateSuspended:", v11))
        {
          _HFLocalizedStringWithDefaultValue(CFSTR("HFTelevisionServiceDetailedErrorDescriptionSuspended"), CFSTR("HFTelevisionServiceDetailedErrorDescriptionSuspended"), 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v40, CFSTR("persistentWarningDescription"));

        }
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("description"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v41, CFSTR("controlDescription"));

        objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1EA7CBF50, CFSTR("controlSummaryStyle"));
        goto LABEL_35;
      }
      if (objc_msgSend(v26, "count", v27))
      {
        if ((unint64_t)objc_msgSend(v26, "count") < 2)
          goto LABEL_24;
        if (v27)
        {
          state.opaque[0] = 0;
          state.opaque[1] = 0;
          objc_msgSend(v27, "loggerActivity");
          v34 = objc_claimAutoreleasedReturnValue();
          os_activity_scope_enter(v34, &state);

          HFLogForCategory(0x29uLL);
          v29 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            goto LABEL_23;
          *(_WORD *)buf = 0;
          v30 = "HFTelevision should have only one input source but currently has more than one";
LABEL_21:
          v31 = v29;
          v32 = OS_LOG_TYPE_ERROR;
          v33 = 2;
          goto LABEL_22;
        }
        HFLogForCategory(0x29uLL);
        v46 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          goto LABEL_44;
        LOWORD(state.opaque[0]) = 0;
        v47 = "HFTelevision should have only one input source but currently has more than one";
      }
      else
      {
        if (v27)
        {
          state.opaque[0] = 0;
          state.opaque[1] = 0;
          objc_msgSend(v27, "loggerActivity");
          v35 = objc_claimAutoreleasedReturnValue();
          os_activity_scope_enter(v35, &state);

          HFLogForCategory(0x29uLL);
          v29 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            goto LABEL_23;
          *(_WORD *)buf = 0;
          v30 = "HFTelevision should have an input source but currently has none";
          goto LABEL_21;
        }
        HFLogForCategory(0x29uLL);
        v46 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          goto LABEL_44;
        LOWORD(state.opaque[0]) = 0;
        v47 = "HFTelevision should have an input source but currently has none";
      }
      v48 = v46;
      v49 = OS_LOG_TYPE_ERROR;
      v50 = 2;
      goto LABEL_43;
    }
  }
  if (objc_msgSend(v15, "category") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "service");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "hasSleepDiscoveryMode") & 1) == 0)
    {
LABEL_7:

      goto LABEL_35;
    }
    objc_msgSend(*(id *)(a1 + 32), "service");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "lastKnownSleepDiscoveryMode");

    if (!v19)
    {
      _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceDescriptionNoResponse"), CFSTR("HFServiceDescriptionNoResponse"), 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceLongFormErrorNotReachableEcoMode"), CFSTR("HFServiceLongFormErrorNotReachableEcoMode"), 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("description"));
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, CFSTR("longErrorDescription"));

      goto LABEL_7;
    }
  }
LABEL_35:
  objc_msgSend(*(id *)(a1 + 32), "applyInflectionToDescriptions:", v13);
  v42 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v13);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "futureWithResult:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

uint64_t __55__HFTelevisionServiceItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  if (!*(_QWORD *)(a1 + 32))
    return 0;
  objc_msgSend(a2, "mediaSourceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToNumber:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end
