@implementation HUServiceDetailsCameraSettingsReaderWriter

- (HUServiceDetailsCameraSettingsReaderWriter)initWithConfigurator:(id)a3
{
  id v4;
  HUServiceDetailsCameraSettingsReaderWriter *v5;
  HUServiceDetailsCameraSettingsReaderWriter *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUServiceDetailsCameraSettingsReaderWriter;
  v5 = -[HUServiceDetailsCameraSettingsReaderWriter init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_configurator, v4);

  return v6;
}

- (id)readWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v31[4];
  id v32;
  id v33;
  HUServiceDetailsCameraSettingsReaderWriter *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUServiceDetailsCameraSettingsReaderWriter configurator](self, "configurator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HUServiceDetailsCameraSettingsReaderWriter configurator](self, "configurator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cameraSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUServiceDetailsCameraSettingsReaderWriter configurator](self, "configurator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "characteristicForSettings:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[HUServiceDetailsCameraSettingsReaderWriter configurator](self, "configurator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "itemTitle");
      v11 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30910]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "BOOLValue");

      if (v13)
      {
        v14 = (void *)MEMORY[0x1E0D519C0];
        v15 = (void *)MEMORY[0x1E0D314B8];
        -[HUServiceDetailsCameraSettingsReaderWriter _fastUpdateResultsForCharacteristic:withTitle:](self, "_fastUpdateResultsForCharacteristic:withTitle:", v9, v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "outcomeWithResults:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "futureWithResult:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUServiceDetailsCameraSettingsReaderWriter configurator](self, "configurator");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "characteristicValueManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "readValuesForCharacteristics:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __62__HUServiceDetailsCameraSettingsReaderWriter_readWithOptions___block_invoke;
      v31[3] = &unk_1E6F4F140;
      v11 = v11;
      v32 = v11;
      v33 = v9;
      v34 = self;
      v35 = v26;
      v29 = v26;
      objc_msgSend(v28, "flatMap:", v31);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      HFLogForCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        -[HUServiceDetailsCameraSettingsReaderWriter configurator](self, "configurator");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v39 = v22;
        _os_log_impl(&dword_1B8E1E000, v21, OS_LOG_TYPE_DEFAULT, "Failed to get characteristic for configurator:%@", buf, 0xCu);

      }
      v23 = (void *)MEMORY[0x1E0D519C0];
      v24 = (void *)MEMORY[0x1E0D314B8];
      v36 = *MEMORY[0x1E0D30D70];
      v37 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "outcomeWithResults:", v11);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "futureWithResult:", v25);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_11;
  }
  v19 = (void *)MEMORY[0x1E0D519C0];
  v20 = (void *)MEMORY[0x1E0D314B8];
  v40 = *MEMORY[0x1E0D30D70];
  v41[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "outcomeWithResults:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "futureWithResult:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v18;
}

id __62__HUServiceDetailsCameraSettingsReaderWriter_readWithOptions___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0D31578];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0D30D18]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AccessoryDetails.%@"), *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("::"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(":"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E6F60E80);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("AccessoryDetails."), "stringByAppendingString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D30BA0]);

  objc_msgSend(*(id *)(a1 + 48), "configurator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "itemTitleLocalizationKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D30D20]);

  objc_msgSend(v4, "responseForCharacteristic:", *(_QWORD *)(a1 + 40));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (uint64_t *)MEMORY[0x1E0D30E20];
  if (v15)
  {
    objc_msgSend(v15, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      HFLogForCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v34 = v19;
        _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "Failed attempt to read value for characteristic:%@", buf, 0xCu);
      }

    }
    objc_msgSend(v15, "valueWithExpectedClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      v22 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v20, "BOOLValue");
      objc_msgSend(v22, "numberWithInteger:", HFPrimaryStateFromBOOL());
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, *v16);

    }
  }
  v24 = *v16;
  objc_msgSend(v5, "objectForKeyedSubscript:", *v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 40), "value");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v26;
    else
      v27 = 0;
    v28 = v27;

    v29 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v28, "BOOLValue");
    objc_msgSend(v29, "numberWithInteger:", HFPrimaryStateFromBOOL());
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v30, v24);

  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), *MEMORY[0x1E0D30B80]);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (id)_fastUpdateResultsForCharacteristic:(id)a3 withTitle:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30D18]);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AccessoryDetails.%@"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("::"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(":"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E6F60E80);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("AccessoryDetails."), "stringByAppendingString:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D30BA0]);

  objc_opt_class();
  objc_msgSend(v7, "value");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  v19 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v18, "BOOLValue");
  objc_msgSend(v19, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D30E20]);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v7, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D30B80]);
  return v8;
}

- (id)updateUserSettingsWithValue:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  -[HUServiceDetailsCameraSettingsReaderWriter configurator](self, "configurator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HUServiceDetailsCameraSettingsReaderWriter configurator](self, "configurator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cameraSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUServiceDetailsCameraSettingsReaderWriter configurator](self, "configurator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "characteristicForSettings:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUServiceDetailsCameraSettingsReaderWriter configurator](self, "configurator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "transactionReason");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v25 = objc_msgSend(v13, "BOOLValue");
      v26 = 2112;
      v27 = v10;
      _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "Attempt to update value allowed %{BOOL}d for characteristic:%@", buf, 0x12u);
    }

    -[HUServiceDetailsCameraSettingsReaderWriter configurator](self, "configurator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "characteristicValueManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "beginTransactionWithReason:", v12);
    v17 = objc_alloc_init(MEMORY[0x1E0D312D8]);
    objc_msgSend(v17, "setValue:forCharacteristic:", v13, v10);
    objc_msgSend(v16, "writeValuesForCharacteristics:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __74__HUServiceDetailsCameraSettingsReaderWriter_updateUserSettingsWithValue___block_invoke;
    v22[3] = &unk_1E6F4CDD0;
    v19 = v6;
    v23 = v19;
    v20 = (id)objc_msgSend(v18, "addCompletionBlock:", v22);

    objc_msgSend(v16, "commitTransactionWithReason:", v12);
    return v19;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

uint64_t __74__HUServiceDetailsCameraSettingsReaderWriter_updateUserSettingsWithValue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

- (HUServiceDetailsCameraSettingsReaderWriterConfigurator)configurator
{
  return (HUServiceDetailsCameraSettingsReaderWriterConfigurator *)objc_loadWeakRetained((id *)&self->_configurator);
}

- (void)setConfigurator:(id)a3
{
  objc_storeWeak((id *)&self->_configurator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_configurator);
}

@end
