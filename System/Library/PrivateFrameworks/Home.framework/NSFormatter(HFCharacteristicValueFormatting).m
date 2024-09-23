@implementation NSFormatter(HFCharacteristicValueFormatting)

+ (id)hf_valueFormatterForCharacteristic:()HFCharacteristicValueFormatting options:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "characteristicType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "hf_valueFormatterForCharacteristicType:withMetadata:options:", v8, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)hf_valueFormatterForCharacteristicType:()HFCharacteristicValueFormatting withMetadata:options:
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
    NSLog(CFSTR("No characteristic type provided!"));
  objc_msgSend(a1, "_hf_customValueFormatterForCharacteristicType:metadata:options:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(a1, "_hf_valueFormatterForCharacteristicMetadata:options:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (id)_hf_customValueFormatterForCharacteristicType:()HFCharacteristicValueFormatting metadata:options:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "_hf_valueSetFormatterForCharacteristicType:options:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    if (_MergedGlobals_320 != -1)
      dispatch_once(&_MergedGlobals_320, &__block_literal_global_7_14);
    v13 = (id)qword_1ED379DA0;
    if (qword_1ED379DA8 != -1)
      dispatch_once(&qword_1ED379DA8, &__block_literal_global_10_16);
    v14 = (id)qword_1ED379DB0;
    if (qword_1ED379DB8 != -1)
      dispatch_once(&qword_1ED379DB8, &__block_literal_global_12_14);
    v15 = (id)qword_1ED379DC0;
    if (qword_1ED379DC8 != -1)
      dispatch_once(&qword_1ED379DC8, &__block_literal_global_14_14);
    v16 = (id)qword_1ED379DD0;
    if (qword_1ED379DD8 != -1)
      dispatch_once(&qword_1ED379DD8, &__block_literal_global_16_9);
    v17 = (id)qword_1ED379DE0;
    if (objc_msgSend(v17, "containsObject:", v8))
    {
      objc_msgSend(a1, "_hf_microgramsPerMeterCubedFormatter");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB88B8]))
    {
      objc_msgSend(a1, "_hf_filterChangeIndicationFormatter");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v13, "containsObject:", v8))
    {
      objc_msgSend(a1, "_hf_positionFormatterWithMetadata:options:", v9, v10);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v15, "containsObject:", v8))
      {
        if (objc_msgSend(v14, "containsObject:", v8)
          || objc_msgSend(v16, "containsObject:", v8)
          && _HFCharacteristicMetadataTypeIsReallyBinary(v9))
        {
          +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "BOOLeanFormatter");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v19 = 0;
        }
        goto LABEL_22;
      }
      objc_msgSend(a1, "_hf_partsPerMillionFormatter");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v19 = (void *)v18;
LABEL_22:
    v12 = v19;

    goto LABEL_23;
  }
  v12 = v11;
LABEL_23:

  return v12;
}

+ (id)_hf_valueSetFormatterForCharacteristicType:()HFCharacteristicValueFormatting options:
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CBA458], "hf_powerStateCharacteristicTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    objc_msgSend(a1, "_hf_powerStateFormatter");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = *MEMORY[0x1E0CB8AA8];
    v21[0] = *MEMORY[0x1E0CB8838];
    v21[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v4);

    if (v10)
    {
      objc_msgSend(a1, "_hf_doorStateFormatter");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = *MEMORY[0x1E0CB8AC0];
      v20[0] = *MEMORY[0x1E0CB8848];
      v20[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsObject:", v4);

      if (v13)
      {
        objc_msgSend(a1, "_hf_heatingCoolingFormatter");
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = *MEMORY[0x1E0CB8AE0];
        v19[0] = *MEMORY[0x1E0CB8868];
        v19[1] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "containsObject:", v4);

        if (v16)
        {
          objc_msgSend(a1, "_hf_lockMechanismStateFormatter");
          v7 = objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB89E8]))
        {
          objc_msgSend(a1, "_hf_rotationDirectionFormatter");
          v7 = objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB8B20]))
        {
          objc_msgSend(a1, "_hf_temperatureUnitFormatter");
          v7 = objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB8938]))
        {
          objc_msgSend(a1, "_hf_lockMechanismLastKnownActionFormatter");
          v7 = objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB87A8]))
        {
          objc_msgSend(a1, "_hf_airParticulateSizeFormatter");
          v7 = objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB87B0]))
        {
          objc_msgSend(a1, "_hf_airQualityFormatter");
          v7 = objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB89B8]))
        {
          objc_msgSend(a1, "_hf_positionStateFormatter");
          v7 = objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB8888]))
        {
          objc_msgSend(a1, "_hf_currentSecuritySystemStateFormatter");
          v7 = objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB8B00]))
        {
          objc_msgSend(a1, "_hf_targetSecuritySystemStateFormatter");
          v7 = objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB8820]))
        {
          objc_msgSend(a1, "_hf_contactStateStateFormatter");
          v7 = objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB8830]))
        {
          objc_msgSend(a1, "_hf_currentAirPurifierStateFormatter");
          v7 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB8918]))
          {
            v17 = 0;
            goto LABEL_32;
          }
          objc_msgSend(a1, "_hf_configurationStateFormatter");
          v7 = objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }
  v17 = (void *)v7;
LABEL_32:

  return v17;
}

+ (id)_hf_lockMechanismStateFormatter
{
  void *v2;
  void *v3;

  HFValueSetStringProviderWithMap(a2, &__block_literal_global_106_5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFValueSetFormatter formatterWithStringProvider:](HFValueSetFormatter, "formatterWithStringProvider:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_hf_doorStateFormatter
{
  void *v2;
  void *v3;

  HFValueSetStringProviderWithMap(a2, &__block_literal_global_71_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFValueSetFormatter formatterWithStringProvider:](HFValueSetFormatter, "formatterWithStringProvider:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_hf_valueFormatterForCharacteristicMetadata:()HFCharacteristicValueFormatting options:
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "units");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CB8740];
  v7 = *MEMORY[0x1E0CB8748];
  v20[0] = *MEMORY[0x1E0CB8740];
  v20[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v5);

  if (!v9)
  {
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB8758]))
    {
      objc_msgSend(a1, "_hf_percentFormatterForMetadata:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        goto LABEL_14;
    }
    else
    {
      if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB8760]))
      {
        +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeIntervalFormatter");
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB8738]))
      {
        +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "arcDegreeFormatter");
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB8750]))
          goto LABEL_15;
        +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "luxFormatter");
        v13 = objc_claimAutoreleasedReturnValue();
      }
      v11 = (void *)v13;

      if (v11)
        goto LABEL_14;
    }
LABEL_15:
    objc_msgSend(v4, "format");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB86F8]))
    {
      +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "BOOLeanFormatter");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB8710]))
    {
      +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identityFormatter");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v4, "hf_isNumeric"))
      {
        v18 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
LABEL_23:
        v14 = v18;

        goto LABEL_24;
      }
      +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "emptyStringFormatter");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (id)v17;

    goto LABEL_23;
  }
  +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "temperatureFormatter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setInputIsCelsius:", objc_msgSend(v5, "isEqualToString:", v6));
  if (!v11)
    goto LABEL_15;
LABEL_14:
  v14 = v11;
LABEL_24:

  return v14;
}

+ (id)_hf_percentFormatterForMetadata:()HFCharacteristicValueFormatting
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "percentFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "maximumValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "maximumValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMaximumValue:", v7);

  }
  return v5;
}

+ (id)hf_controlDescriptionFormatterForCharacteristic:()HFCharacteristicValueFormatting options:form:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "characteristicType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "hf_controlDescriptionFormatterForCharacteristicType:withMetadata:options:form:", v10, v11, v8, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (HFFormatterTransformer)hf_controlDescriptionFormatterForCharacteristicType:()HFCharacteristicValueFormatting withMetadata:options:form:
{
  id v10;
  id v11;
  void *v12;
  id v13;
  HFFormatterTransformer *v14;
  void *v15;
  int v16;
  HFFormatterTransformer *v17;
  void *v18;
  HFFormatterTransformer *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  HFFormatterTransformer *v25;
  void *v26;
  void *v27;
  HFFormatterTransformer *v28;
  void *v29;
  HFFormatterTransformer *v30;
  void *v31;
  HFFormatterTransformer *v32;
  void *v34;
  HFFormatterTransformer *v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  void *v46;
  uint64_t v47;
  _QWORD v48[8];

  v48[7] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  objc_msgSend(a1, "hf_valueFormatterForCharacteristicType:withMetadata:options:", v10, a4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1ED379DE8 != -1)
    dispatch_once(&qword_1ED379DE8, &__block_literal_global_186_0);
  v13 = (id)qword_1ED379DF0;
  if (objc_msgSend(v13, "containsObject:", v10))
  {
    v14 = v12;
LABEL_8:
    v19 = v14;
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0CBA458], "hf_powerStateCharacteristicTypes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsObject:", v10);

  if (v16)
  {
    v17 = [HFFormatterTransformer alloc];
    v18 = &__block_literal_global_187_1;
LABEL_7:
    v14 = -[HFFormatterTransformer initWithSourceFormatter:transformBlock:](v17, "initWithSourceFormatter:transformBlock:", v12, v18);
    goto LABEL_8;
  }
  v20 = *MEMORY[0x1E0CB87D8];
  v48[0] = *MEMORY[0x1E0CB87B0];
  v48[1] = v20;
  v21 = *MEMORY[0x1E0CB8930];
  v48[2] = *MEMORY[0x1E0CB87F0];
  v48[3] = v21;
  v22 = *MEMORY[0x1E0CB8988];
  v48[4] = *MEMORY[0x1E0CB8958];
  v48[5] = v22;
  v48[6] = *MEMORY[0x1E0CB8A38];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "containsObject:", v10);

  if (v24)
  {
    v25 = [HFFormatterTransformer alloc];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __126__NSFormatter_HFCharacteristicValueFormatting__hf_controlDescriptionFormatterForCharacteristicType_withMetadata_options_form___block_invoke_4;
    v44[3] = &unk_1EA73F6A8;
    v46 = a1;
    v45 = v10;
    v47 = a6;
    v19 = -[HFFormatterTransformer initWithSourceFormatter:transformBlock:](v25, "initWithSourceFormatter:transformBlock:", v12, v44);
    v26 = v45;
LABEL_20:

    goto LABEL_21;
  }
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB8880]))
  {
    objc_msgSend(v11, "objectForKey:", CFSTR("roomName"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v28 = [HFFormatterTransformer alloc];
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __126__NSFormatter_HFCharacteristicValueFormatting__hf_controlDescriptionFormatterForCharacteristicType_withMetadata_options_form___block_invoke_5;
      v42[3] = &unk_1EA73F6D0;
      v43 = v11;
      v19 = -[HFFormatterTransformer initWithSourceFormatter:transformBlock:](v28, "initWithSourceFormatter:transformBlock:", v12, v42);
      v26 = v43;
      goto LABEL_20;
    }
  }
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB8890]))
  {
    objc_msgSend(v11, "objectForKey:", CFSTR("roomName"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = [HFFormatterTransformer alloc];
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __126__NSFormatter_HFCharacteristicValueFormatting__hf_controlDescriptionFormatterForCharacteristicType_withMetadata_options_form___block_invoke_6;
      v40[3] = &unk_1EA73F6D0;
      v41 = v11;
      v19 = -[HFFormatterTransformer initWithSourceFormatter:transformBlock:](v30, "initWithSourceFormatter:transformBlock:", v12, v40);
      v26 = v41;
      goto LABEL_20;
    }
  }
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB8860]))
  {
    objc_msgSend(v11, "objectForKey:", CFSTR("roomName"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      v32 = [HFFormatterTransformer alloc];
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __126__NSFormatter_HFCharacteristicValueFormatting__hf_controlDescriptionFormatterForCharacteristicType_withMetadata_options_form___block_invoke_7;
      v38[3] = &unk_1EA73F6D0;
      v39 = v11;
      v19 = -[HFFormatterTransformer initWithSourceFormatter:transformBlock:](v32, "initWithSourceFormatter:transformBlock:", v12, v38);
      v26 = v39;
      goto LABEL_20;
    }
  }
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB8B48]))
  {
    v17 = [HFFormatterTransformer alloc];
    v18 = &__block_literal_global_198_3;
    goto LABEL_7;
  }
  objc_msgSend(a1, "_hf_controlTitleForCharacteristicType:", v10);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = [HFFormatterTransformer alloc];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __126__NSFormatter_HFCharacteristicValueFormatting__hf_controlDescriptionFormatterForCharacteristicType_withMetadata_options_form___block_invoke_9;
    v36[3] = &unk_1EA73F6D0;
    v37 = v34;
    v19 = -[HFFormatterTransformer initWithSourceFormatter:transformBlock:](v35, "initWithSourceFormatter:transformBlock:", v12, v36);

  }
  else
  {
    v19 = v12;
  }

LABEL_21:
  return v19;
}

+ (uint64_t)hf_controlDescriptionFormatterForCharacteristic:()HFCharacteristicValueFormatting options:
{
  return objc_msgSend(a1, "hf_controlDescriptionFormatterForCharacteristic:options:form:", a3, a4, 0);
}

+ (id)_hf_powerStateFormatter
{
  void *v2;
  void *v3;

  HFValueSetStringProviderWithMap(a2, &__block_literal_global_66_3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFValueSetFormatter formatterWithStringProvider:](HFValueSetFormatter, "formatterWithStringProvider:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_hf_positionFormatterWithMetadata:()HFCharacteristicValueFormatting options:
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "_hf_percentFormatterForMetadata:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CB9B28];
  v20[0] = *MEMORY[0x1E0CB9A00];
  v20[1] = v8;
  v21[0] = CFSTR("HMServiceTypeDoor");
  v21[1] = CFSTR("HMServiceTypeWindow");
  v20[2] = *MEMORY[0x1E0CB9B30];
  v21[2] = CFSTR("HMServiceTypeWindowCovering");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("serviceType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("serviceType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("No format string suffix for service type %@"), v12);

  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __90__NSFormatter_HFCharacteristicValueFormatting___hf_positionFormatterWithMetadata_options___block_invoke;
  v17[3] = &unk_1EA73F3E0;
  v18 = v11;
  v19 = v7;
  v13 = v7;
  v14 = v11;
  +[HFValueSetFormatter formatterWithStringProvider:](HFValueSetFormatter, "formatterWithStringProvider:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (HFValueSetFormatter)_hf_filterChangeIndicationFormatter
{
  return +[HFValueSetFormatter formatterWithStringProvider:](HFValueSetFormatter, "formatterWithStringProvider:", &__block_literal_global_42_6);
}

+ (HFFormatterTransformer)_hf_partsPerMillionFormatter
{
  id v0;
  HFFormatterTransformer *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v0, "setUsesGroupingSeparator:", 1);
  v1 = -[HFFormatterTransformer initWithSourceFormatter:transformBlock:]([HFFormatterTransformer alloc], "initWithSourceFormatter:transformBlock:", v0, &__block_literal_global_52_1);

  return v1;
}

+ (HFFormatterTransformer)_hf_microgramsPerMeterCubedFormatter
{
  id v0;
  HFFormatterTransformer *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v0, "setUsesGroupingSeparator:", 1);
  v1 = -[HFFormatterTransformer initWithSourceFormatter:transformBlock:]([HFFormatterTransformer alloc], "initWithSourceFormatter:transformBlock:", v0, &__block_literal_global_59_2);

  return v1;
}

+ (id)_hf_heatingCoolingFormatter
{
  void *v2;
  void *v3;

  HFValueSetStringProviderWithMap(a2, &__block_literal_global_87_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFValueSetFormatter formatterWithStringProvider:](HFValueSetFormatter, "formatterWithStringProvider:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_hf_rotationDirectionFormatter
{
  void *v2;
  void *v3;

  HFValueSetStringProviderWithMap(a2, &__block_literal_global_96_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFValueSetFormatter formatterWithStringProvider:](HFValueSetFormatter, "formatterWithStringProvider:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_hf_temperatureUnitFormatter
{
  void *v2;
  void *v3;

  HFValueSetStringProviderWithMap(a2, &__block_literal_global_101_1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFValueSetFormatter formatterWithStringProvider:](HFValueSetFormatter, "formatterWithStringProvider:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_hf_airParticulateSizeFormatter
{
  void *v2;
  void *v3;

  HFValueSetStringProviderWithMap(a2, &__block_literal_global_115_3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFValueSetFormatter formatterWithStringProvider:](HFValueSetFormatter, "formatterWithStringProvider:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_hf_airQualityFormatter
{
  void *v2;
  void *v3;

  HFValueSetStringProviderWithMap(a2, &__block_literal_global_124_3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFValueSetFormatter formatterWithStringProvider:](HFValueSetFormatter, "formatterWithStringProvider:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_hf_positionStateFormatter
{
  void *v2;
  void *v3;

  HFValueSetStringProviderWithMap(a2, &__block_literal_global_138_2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFValueSetFormatter formatterWithStringProvider:](HFValueSetFormatter, "formatterWithStringProvider:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_hf_currentSecuritySystemStateFormatter
{
  void *v2;
  void *v3;

  HFValueSetStringProviderWithMap(a2, &__block_literal_global_145_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFValueSetFormatter formatterWithStringProvider:](HFValueSetFormatter, "formatterWithStringProvider:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_hf_targetSecuritySystemStateFormatter
{
  void *v2;
  void *v3;

  HFValueSetStringProviderWithMap(a2, &__block_literal_global_156_2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFValueSetFormatter formatterWithStringProvider:](HFValueSetFormatter, "formatterWithStringProvider:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_hf_contactStateStateFormatter
{
  void *v2;
  void *v3;

  HFValueSetStringProviderWithMap(a2, &__block_literal_global_165_1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFValueSetFormatter formatterWithStringProvider:](HFValueSetFormatter, "formatterWithStringProvider:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_hf_currentAirPurifierStateFormatter
{
  void *v2;
  void *v3;

  HFValueSetStringProviderWithMap(a2, &__block_literal_global_173);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFValueSetFormatter formatterWithStringProvider:](HFValueSetFormatter, "formatterWithStringProvider:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_hf_configurationStateFormatter
{
  void *v2;
  void *v3;

  HFValueSetStringProviderWithMap(a2, &__block_literal_global_180_2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFValueSetFormatter formatterWithStringProvider:](HFValueSetFormatter, "formatterWithStringProvider:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (uint64_t)_hf_lockMechanismLastKnownActionFormatter
{
  return 0;
}

+ (uint64_t)hf_controlDescriptionFormatterForCharacteristicType:()HFCharacteristicValueFormatting withMetadata:options:
{
  return objc_msgSend(a1, "hf_controlDescriptionFormatterForCharacteristicType:withMetadata:options:form:", a3, a4, a5, 0);
}

+ (uint64_t)_hf_controlDescriptionForDetectionCharacteristicOfType:()HFCharacteristicValueFormatting withValue:valueDescription:
{
  return objc_msgSend(a1, "_hf_controlDescriptionForDetectionCharacteristicOfType:withValue:valueDescription:form:", a3, a4, a5, 0);
}

+ (id)_hf_controlDescriptionForDetectionCharacteristicOfType:()HFCharacteristicValueFormatting withValue:valueDescription:form:
{
  id v9;
  id v10;
  id v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = CFSTR("Simple");
  if (a6 != 1)
    v12 = 0;
  if (a6)
    v13 = v12;
  else
    v13 = &stru_1EA741FF8;
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB87B0]))
  {
    HFLocalizedStringWithFormat(CFSTR("HFCharacteristicDescriptionFormatAirQuality"), CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB87D8]))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFCharacteristicTitleCO2Detected%@"), v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFCharacteristicTitleNoCO2Detected%@"), v13);
    }
    else if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB87F0]))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFCharacteristicTitleCODetected%@"), v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFCharacteristicTitleNoCODetected%@"), v13);
    }
    else if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB8930]))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFCharacteristicTitleLeakDetected%@"), v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFCharacteristicTitleNoLeakDetected%@"), v13);
    }
    else if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB8958]))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFCharacteristicTitleMotionDetected%@"), v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFCharacteristicTitleNoMotionDetected%@"), v13);
    }
    else if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB8988]))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFCharacteristicTitleOccupancyDetected%@"), v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFCharacteristicTitleNoOccupancyDetected%@"), v13);
    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB8A38]))
      {
        v20 = 0;
        goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFCharacteristicTitleSmokeDetected%@"), v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFCharacteristicTitleNoSmokeDetected%@"), v13);
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "BOOLValue"))
      v23 = v21;
    else
      v23 = v22;
    _HFLocalizedStringWithDefaultValue(v23, v23, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_24:

  return v20;
}

+ (id)_hf_controlTitleForCharacteristicType:()HFCharacteristicValueFormatting
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (qword_1ED379DF8 != -1)
    dispatch_once(&qword_1ED379DF8, &__block_literal_global_232_0);
  v4 = (id)qword_1ED379E00;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CBA458], "hf_associatedCharacteristicTypeForCharacteristicType:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_5;
    objc_msgSend(v4, "objectForKeyedSubscript:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = 0;
      goto LABEL_5;
    }
  }
  _HFLocalizedStringWithDefaultValue(v5, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
  return v6;
}

@end
