@implementation HFTemperatureSensorServiceItem

+ (id)supportedServiceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9AF8]);
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[6];

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = *MEMORY[0x1E0CB8890];
  v7 = a3;
  objc_msgSend(v5, "setWithObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceItem performStandardUpdateWithCharacteristicTypes:options:](self, "performStandardUpdateWithCharacteristicTypes:options:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__HFTemperatureSensorServiceItem__subclass_updateWithOptions___block_invoke;
  v12[3] = &unk_1EA729250;
  v12[4] = self;
  v12[5] = a2;
  objc_msgSend(v9, "flatMap:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __62__HFTemperatureSensorServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "readResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8890]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "characteristic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueWithExpectedClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "standardResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("tempreatureUnitDependency"));
  objc_msgSend(*(id *)(a1 + 32), "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isCalibrating");

  if (v12)
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceDescriptionCalibrating"), CFSTR("HFServiceDescriptionCalibrating"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("description"));

    HFLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138412802;
      v33 = v15;
      v34 = 2112;
      v35 = v16;
      v36 = 2112;
      v37 = v9;
      _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ Sensor calibrating, resetting potential error descriptions: %@", (uint8_t *)&v32, 0x20u);

    }
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, CFSTR("errorDescription"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, CFSTR("longErrorDescription"));
  }
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "service");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "accessory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "hf_isHomePod")
      && ((objc_msgSend(v18, "hf_isReadyToInstallSoftwareUpdate") & 1) != 0
       || objc_msgSend(v18, "hf_isSoftwareUpdateInProgress")))
    {
      HFLogForCategory(0);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *(_QWORD *)(a1 + 32);
        NSStringFromSelector(*(SEL *)(a1 + 40));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138412546;
        v33 = v20;
        v34 = 2112;
        v35 = v21;
        _os_log_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_DEFAULT, "%@:%@ Clearing display elements for SU for Homepod Temperature Sensor", (uint8_t *)&v32, 0x16u);

      }
      objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, CFSTR("description"));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, CFSTR("detailedControlDescription"));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, CFSTR("badge"));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, CFSTR("descriptionBadge"));
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("description"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "temperatureFormatter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "setInputIsCelsius:", 1);
      objc_msgSend(v24, "stringForObjectValue:", v7);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v25, CFSTR("description"));

    }
    objc_msgSend(*(id *)(a1 + 32), "controlDescriptionForCharacteristic:withValue:", v6, v7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeSetObject:forKey:", v26, CFSTR("controlDescription"));

    objc_msgSend(*(id *)(a1 + 32), "applyInflectionToDescriptions:", v9);
    v27 = (void *)MEMORY[0x1E0D519C0];
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "futureWithResult:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v30 = (void *)MEMORY[0x1E0D519C0];
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "futureWithResult:", v18);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v29;
}

@end
