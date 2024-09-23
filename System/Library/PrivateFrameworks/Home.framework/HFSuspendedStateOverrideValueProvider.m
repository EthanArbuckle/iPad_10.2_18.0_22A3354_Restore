@implementation HFSuspendedStateOverrideValueProvider

- (BOOL)valueSource:(id)a3 shouldOverrideValueForCharacteristic:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a4;
  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hf_isSuspended"))
  {
    objc_msgSend((id)objc_opt_class(), "overrideDefaultValueForCharacteristicType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "characteristicType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)valueSource:(id)a3 overrideValueForCharacteristic:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hf_isSuspended");

  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "overrideDefaultValueForCharacteristicType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "characteristicType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory(0x38uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "characteristicType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "service");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "accessory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412802;
      v17 = v12;
      v18 = 2112;
      v19 = v10;
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "Overriding characteristic %@ value with %@ for suspended accessory %@", (uint8_t *)&v16, 0x20u);

    }
  }
  else
  {
    objc_msgSend(v4, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (NSDictionary)overrideDefaultValueForCharacteristicType
{
  if (_MergedGlobals_289 != -1)
    dispatch_once(&_MergedGlobals_289, &__block_literal_global_2_23);
  return (NSDictionary *)(id)qword_1ED379928;
}

void __82__HFSuspendedStateOverrideValueProvider_overrideDefaultValueForCharacteristicType__block_invoke_2()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB8798];
  v3[0] = *MEMORY[0x1E0CB8790];
  v3[1] = v0;
  v4[0] = &unk_1EA7CCB68;
  v4[1] = &unk_1EA7CCB68;
  v3[2] = *MEMORY[0x1E0CB89C8];
  v4[2] = &unk_1EA7CCB68;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ED379928;
  qword_1ED379928 = v1;

}

@end
