@implementation HFHumiditySensorServiceItem

+ (id)supportedServiceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9A40]);
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
  v6 = *MEMORY[0x1E0CB8880];
  v7 = a3;
  objc_msgSend(v5, "setWithObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceItem performStandardUpdateWithCharacteristicTypes:options:](self, "performStandardUpdateWithCharacteristicTypes:options:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__HFHumiditySensorServiceItem__subclass_updateWithOptions___block_invoke;
  v12[3] = &unk_1EA729250;
  v12[4] = self;
  v12[5] = a2;
  objc_msgSend(v9, "flatMap:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __59__HFHumiditySensorServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
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
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "readResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8880]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "characteristic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueWithExpectedClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "standardResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "hf_isHomePod")
    && ((objc_msgSend(v11, "hf_isReadyToInstallSoftwareUpdate") & 1) != 0
     || objc_msgSend(v11, "hf_isSoftwareUpdateInProgress")))
  {
    HFLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138412546;
      v30 = v13;
      v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@ Clearing display elements for SU for Homepod Humidity Sensor", (uint8_t *)&v29, 0x16u);

    }
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, CFSTR("description"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, CFSTR("detailedControlDescription"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, CFSTR("badge"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, CFSTR("descriptionBadge"));
  }
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "descriptionForCharacteristic:withValue:", v6, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("description"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("description"));
    }
    objc_msgSend(*(id *)(a1 + 32), "controlDescriptionForCharacteristic:withValue:", v6, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_safeSetObject:forKey:", v17, CFSTR("controlDescription"));

  }
  objc_msgSend(*(id *)(a1 + 32), "service");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "accessory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isCalibrating");

  if (v20)
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceDescriptionCalibrating"), CFSTR("HFServiceDescriptionCalibrating"), 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, CFSTR("description"));

    HFLogForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138412802;
      v30 = v23;
      v31 = 2112;
      v32 = v24;
      v33 = 2112;
      v34 = v9;
      _os_log_impl(&dword_1DD34E000, v22, OS_LOG_TYPE_DEFAULT, "%@:%@ Sensor calibrating, resetting potential error descriptions: %@", (uint8_t *)&v29, 0x20u);

    }
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, CFSTR("errorDescription"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, CFSTR("longErrorDescription"));
  }
  objc_msgSend(*(id *)(a1 + 32), "applyInflectionToDescriptions:", v9);
  v25 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "futureWithResult:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

@end
