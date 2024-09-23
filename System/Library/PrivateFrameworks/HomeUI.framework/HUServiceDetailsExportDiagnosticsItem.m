@implementation HUServiceDetailsExportDiagnosticsItem

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _DWORD v33[2];
  __int16 v34;
  void *v35;
  __int16 v36;
  int v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v38 = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsExportAnalyticsKey"), CFSTR("HUServiceDetailsExportAnalyticsKey"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = HFPreferencesBooleanValueForKey();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[HUServiceDetailsAbstractItem sourceAccessory](self, "sourceAccessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hf_isHomePod") ^ 1;
  if (v7 == 2)
    v11 = v10;
  else
    v11 = 1;
  objc_msgSend(v8, "numberWithInt:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0D30D70];
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D30D70]);

  -[HUServiceDetailsAbstractItem sourceAccessory](self, "sourceAccessory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "mediaProfile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "hf_settingsAdapterManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "adapterForIdentifier:", *MEMORY[0x1E0D30128]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "conformsToProtocol:", &unk_1EF348030))
    v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  v20 = v19;
  if (objc_msgSend(v20, "conformsToProtocol:", &unk_1EF348030))
    v21 = v20;
  else
    v21 = 0;
  v22 = v21;

  objc_msgSend(v22, "inProgressButtonPressFutureForKeyPath:", *MEMORY[0x1E0D30700]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D30B10]);
  if (v23)
    v24 = objc_msgSend(v23, "isFinished") ^ 1;
  else
    v24 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0D30C80]);

  HFLogForCategory();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = v7 == 2;
    objc_msgSend(v6, "objectForKeyedSubscript:", v13);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = 67109634;
    v33[1] = v27;
    v34 = 2112;
    v35 = v28;
    v36 = 1024;
    v37 = v24;
    _os_log_impl(&dword_1B8E1E000, v26, OS_LOG_TYPE_DEFAULT, "User has the HomePod Sysdiagnose profile installed: %{BOOL}d, Show export diagnostics button: %@, isOperationInProgress: %{BOOL}d", (uint8_t *)v33, 0x18u);

  }
  v29 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "futureWithResult:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

@end
