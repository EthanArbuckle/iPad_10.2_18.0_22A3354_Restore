@implementation HFFanServiceItem

- (id)createControlItemsWithOptions:(id)a3
{
  id v4;
  uint64_t v5;
  HFPowerStateControlItem *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  HFIncrementalStateControlItem *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  HFMultiStateControlItem *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HFMultiStateControlItem *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  HFMultiStateControlItem *v34;
  void *v35;
  void *v36;
  void *v37;
  HFMultiStateControlItem *v38;
  HFSwingModeControlItem *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  HFMultiStateControlItem *v46;
  void *v47;
  void *v48;
  void *v49;
  HFMultiStateControlItem *v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  HFFanServiceItem *v60;
  const __CFString *v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  _QWORD v65[2];
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[4];

  v69[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFServiceItem controlItemValueSourceForPrimaryService](self, "controlItemValueSourceForPrimaryService");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = [HFPowerStateControlItem alloc];
  v7 = -[HFPowerStateControlItem initWithValueSource:displayResults:](v6, "initWithValueSource:displayResults:", v5, MEMORY[0x1E0C9AA70]);
  v68[0] = CFSTR("title");
  HFItemOptionalLocalizedString(CFSTR("HFControlShortTitleRotationSpeed"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v8;
  v68[1] = CFSTR("controlItemPurpose");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v69[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
  v10 = objc_claimAutoreleasedReturnValue();

  v11 = [HFIncrementalStateControlItem alloc];
  v57 = (void *)v10;
  v12 = -[HFIncrementalStateControlItem initWithValueSource:primaryStateControlItem:incrementalCharacteristicType:displayResults:](v11, "initWithValueSource:primaryStateControlItem:incrementalCharacteristicType:displayResults:", v5, v7, *MEMORY[0x1E0CB89F0], v10);
  v13 = (void *)MEMORY[0x1E0C99E20];
  v58 = (void *)v7;
  v67[0] = v7;
  v67[1] = v12;
  v56 = (void *)v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = self;
  -[HFServiceItem service](self, "service");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hf_characteristicOfType:", *MEMORY[0x1E0CB89E8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "metadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  HFItemOptionalLocalizedString(CFSTR("HFCharacteristicValueRotationDirectionClockwise"), v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  HFItemOptionalLocalizedString(CFSTR("HFCharacteristicValueRotationDirectionCounterClockwise"), v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFMultiStateValueSet binaryValueSetWithCharacteristicMetadata:firstValue:firstTitle:secondValue:secondTitle:](HFMultiStateValueSet, "binaryValueSetWithCharacteristicMetadata:firstValue:firstTitle:secondValue:secondTitle:", v17, &unk_1EA7CBA70, v18, &unk_1EA7CBA88, v19);
  v20 = objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = [HFMultiStateControlItem alloc];
    objc_msgSend(v16, "characteristicType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = CFSTR("title");
    HFItemOptionalLocalizedString(CFSTR("HFControlShortTitleRotationDirection"), v4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v65[1] = CFSTR("controlItemPurpose");
    v66[0] = v23;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v66[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[HFMultiStateControlItem initWithValueSource:characteristicType:possibleValueSet:displayResults:](v21, "initWithValueSource:characteristicType:possibleValueSet:displayResults:", v5, v22, v20, v25);
    objc_msgSend(v59, "na_safeAddObject:", v26);

  }
  v54 = (void *)v20;
  v55 = v16;
  -[HFServiceItem service](v60, "service");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "hf_characteristicOfType:", *MEMORY[0x1E0CB8AB0]);
  v28 = (void *)v5;
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "metadata");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  HFItemOptionalLocalizedString(CFSTR("HFCharacteristicValueFanTargetStateManual"), v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  HFItemOptionalLocalizedString(CFSTR("HFCharacteristicValueFanTargetStateAuto"), v4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFMultiStateValueSet binaryValueSetWithCharacteristicMetadata:firstValue:firstTitle:secondValue:secondTitle:](HFMultiStateValueSet, "binaryValueSetWithCharacteristicMetadata:firstValue:firstTitle:secondValue:secondTitle:", v30, &unk_1EA7CBA70, v31, &unk_1EA7CBA88, v32);
  v33 = objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    v34 = [HFMultiStateControlItem alloc];
    objc_msgSend(v29, "characteristicType");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = CFSTR("title");
    HFItemOptionalLocalizedString(CFSTR("HFControlShortTitleFanMode"), v4);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v36;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[HFMultiStateControlItem initWithValueSource:characteristicType:possibleValueSet:displayResults:](v34, "initWithValueSource:characteristicType:possibleValueSet:displayResults:", v28, v35, v33, v37);
    objc_msgSend(v59, "na_safeAddObject:", v38);

  }
  v52 = (void *)v33;
  v53 = v29;
  v39 = -[HFSwingModeControlItem initWithValueSource:]([HFSwingModeControlItem alloc], "initWithValueSource:", v28);
  objc_msgSend(v59, "na_safeAddObject:", v39);

  -[HFServiceItem service](v60, "service");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "hf_characteristicOfType:", *MEMORY[0x1E0CB8940]);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v41, "metadata");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  HFItemOptionalLocalizedString(CFSTR("HFCharacteristicValueLockPhysicalControlsUnlocked"), v4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  HFItemOptionalLocalizedString(CFSTR("HFCharacteristicValueLockPhysicalControlsLocked"), v4);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFMultiStateValueSet binaryValueSetWithCharacteristicMetadata:firstValue:firstTitle:secondValue:secondTitle:](HFMultiStateValueSet, "binaryValueSetWithCharacteristicMetadata:firstValue:firstTitle:secondValue:secondTitle:", v42, &unk_1EA7CBA70, v43, &unk_1EA7CBA88, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    v46 = [HFMultiStateControlItem alloc];
    objc_msgSend(v41, "characteristicType", v52, v29);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = CFSTR("title");
    HFItemOptionalLocalizedString(CFSTR("HFControlShortTitleLockPhysicalControls"), v4);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v48;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = -[HFMultiStateControlItem initWithValueSource:characteristicType:possibleValueSet:displayResults:](v46, "initWithValueSource:characteristicType:possibleValueSet:displayResults:", v28, v47, v45, v49);
    objc_msgSend(v59, "na_safeAddObject:", v50);

  }
  return v59;
}

+ (id)supportedServiceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_fanServiceTypes");
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  HFFanServiceItem *v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E20];
  v5 = *MEMORY[0x1E0CB89F0];
  v6 = a3;
  objc_msgSend(v4, "setWithObjects:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceItem service](self, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)*MEMORY[0x1E0CB89C8];
  objc_msgSend(v8, "hf_characteristicOfType:", *MEMORY[0x1E0CB89C8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    || (-[HFServiceItem service](self, "service"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = (void *)*MEMORY[0x1E0CB8790],
        objc_msgSend(v11, "hf_characteristicOfType:", *MEMORY[0x1E0CB8790]),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        v12))
  {
    v13 = v9;
  }
  else
  {
    HFLogForCategory(0x29uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      -[HFServiceItem service](self, "service");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "hf_prettyDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v20;
      _os_log_error_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_ERROR, "Fan (%@) has neither a powerState nor an active characteristic type!", buf, 0xCu);

    }
    v13 = 0;
  }
  objc_msgSend(v7, "na_safeAddObject:", v13);
  -[HFServiceItem performStandardUpdateWithCharacteristicTypes:options:](self, "performStandardUpdateWithCharacteristicTypes:options:", v7, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __48__HFFanServiceItem__subclass_updateWithOptions___block_invoke;
  v21[3] = &unk_1EA72A770;
  v22 = v13;
  v23 = self;
  v15 = v13;
  objc_msgSend(v14, "flatMap:", v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __48__HFFanServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v3 = a2;
  objc_msgSend(v3, "readResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseForCharacteristicType:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "characteristic");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueWithExpectedClass:", objc_opt_class());
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB89F0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "characteristic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v7;
  objc_msgSend(v7, "valueWithExpectedClass:", objc_opt_class());
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "standardResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v3, "displayMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "primaryState");
  v35 = (void *)v9;
  v36 = (void *)v6;
  v33 = v4;
  if (v9)
  {
    v32 = v5;
    v14 = &unk_1EA7CBAA0;
    if (v13 == 2)
      v14 = (void *)v9;
    v15 = v14;
    objc_msgSend(v8, "metadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hf_percentageForCharacteristicValue:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("subPriority"));
    v18 = a1;
    objc_msgSend(*(id *)(a1 + 40), "descriptionForCharacteristic:withValue:", v8, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("description"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v8;
    if (v20)
    {
      v23 = v33;
      v22 = v34;
    }
    else
    {
      v22 = v34;
      if (v19 && v13 == 2)
      {
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, CFSTR("description"));
        v23 = v33;
        goto LABEL_19;
      }
      if (v36)
      {
        objc_msgSend(*(id *)(v18 + 40), "descriptionForCharacteristic:withValue:", v37);
        v26 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "na_safeSetObject:forKey:", v26, CFSTR("description"));
        v19 = (void *)v26;
      }
      v23 = v33;
    }
    if (v13 == 1)
    {
      _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicTitleIncrementalStateOff"), CFSTR("HFCharacteristicTitleIncrementalStateOff"), 1);
      v27 = objc_claimAutoreleasedReturnValue();
LABEL_20:
      v24 = (void *)v27;

LABEL_21:
      v5 = v32;
      goto LABEL_22;
    }
LABEL_19:
    objc_msgSend(*(id *)(v18 + 40), "controlDescriptionForCharacteristic:withValue:", v21, v15, v32);
    v27 = objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (v6)
  {
    v18 = a1;
    objc_msgSend(*(id *)(a1 + 40), "controlDescriptionForCharacteristic:withValue:", v37, v6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("description"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      v32 = v5;
      objc_msgSend(*(id *)(a1 + 40), "descriptionForCharacteristic:withValue:", v37, v6);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("description"));
      v17 = 0;
      v21 = v8;
      v23 = v33;
      v22 = v34;
      goto LABEL_21;
    }
    v17 = 0;
    v21 = v8;
  }
  else
  {
    v24 = 0;
    v17 = 0;
    v21 = v8;
    v18 = a1;
  }
  v23 = v33;
  v22 = v34;
LABEL_22:
  objc_msgSend(v11, "na_safeSetObject:forKey:", v24, CFSTR("controlDescription"), v32);
  objc_msgSend(*(id *)(v18 + 40), "applyInflectionToDescriptions:", v11);
  v28 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v11);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "futureWithResult:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

@end
