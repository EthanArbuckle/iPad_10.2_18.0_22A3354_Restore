@implementation HFAirPurifierServiceItem

+ (id)supportedServiceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB99A8]);
}

- (id)createControlItemsWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  HFPowerStateTargetValueTuple *v24;
  HFPowerStateTargetValueTuple *v25;
  uint64_t v26;
  HFPowerStateControlItem *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  HFMultiStateControlItem *v40;
  void *v41;
  void *v42;
  void *v43;
  HFMultiStateControlItem *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  HFPowerStateControlItem *v51;
  HFPowerStateControlItem *v52;
  HFIncrementalStateControlItem *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  HFMultiStateControlItem *v60;
  void *v61;
  void *v62;
  void *v63;
  HFMultiStateControlItem *v64;
  HFSwingModeControlItem *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  HFMultiStateControlItem *v73;
  void *v74;
  void *v75;
  void *v76;
  HFMultiStateControlItem *v77;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  const __CFString *v93;
  void *v94;
  const __CFString *v95;
  void *v96;
  _QWORD v97[3];
  _QWORD v98[3];
  const __CFString *v99;
  void *v100;
  uint8_t buf[4];
  void *v102;
  __int16 v103;
  void *v104;
  _QWORD v105[2];
  _QWORD v106[4];

  v106[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFServiceItem controlItemValueSourceForPrimaryService](self, "controlItemValueSourceForPrimaryService");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceItem service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_childServices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_firstObjectPassingTest:", &__block_literal_global_83);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E20];
  -[HFServiceItem service](self, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "na_safeAddObject:", v8);
  v89 = v11;
  -[HFServiceItem controlItemValueSourceForServices:](self, "controlItemValueSourceForServices:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  -[HFServiceItem service](self, "service");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hf_childServices");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "na_filter:", &__block_literal_global_2_9);
  v15 = objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0C99E20];
  -[HFServiceItem service](self, "service");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithObject:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v87 = (void *)v15;
  objc_msgSend(v18, "unionSet:", v15);
  v86 = v18;
  -[HFServiceItem controlItemValueSourceForServices:](self, "controlItemValueSourceForServices:", v18);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v105[0] = CFSTR("title");
  HFItemOptionalLocalizedString(CFSTR("HFControlShortTitlePower"), v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v106[0] = v19;
  v105[1] = CFSTR("controlItemPurpose");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v106[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, v105, 2);
  v21 = objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0C99E60];
  +[HFPowerStateTargetValueTuple fanStateTargetValueTuple](HFPowerStateTargetValueTuple, "fanStateTargetValueTuple");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = [HFPowerStateTargetValueTuple alloc];
  v81 = *MEMORY[0x1E0CB8AA0];
  v25 = -[HFPowerStateTargetValueTuple initWithCharacteristicType:onTargetValue:offTargetValue:](v24, "initWithCharacteristicType:onTargetValue:offTargetValue:");
  objc_msgSend(v22, "setWithObjects:", v23, v25, 0);
  v26 = objc_claimAutoreleasedReturnValue();

  v88 = (void *)v12;
  v84 = (void *)v26;
  v85 = (void *)v21;
  v27 = -[HFPowerStateControlItem initWithValueSource:auxiliaryTargetValueTuples:displayResults:]([HFPowerStateControlItem alloc], "initWithValueSource:auxiliaryTargetValueTuples:displayResults:", v12, v26, v21);
  objc_msgSend(v5, "addObject:", v27);

  v28 = *MEMORY[0x1E0CB89F0];
  v90 = v8;
  if (v8)
  {
    objc_msgSend(v8, "hf_characteristicOfType:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      -[HFServiceItem service](self, "service");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "hf_characteristicOfType:", v28);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        HFLogForCategory(0x29uLL);
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          -[HFServiceItem service](self, "service");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v102 = v79;
          v103 = 2112;
          v104 = v8;
          _os_log_error_impl(&dword_1DD34E000, v32, OS_LOG_TYPE_ERROR, "Both the air purifier service (%@) and the fan child service (%@) have a rotation speed characteristic. This is not a valid configuration. Arbitrarily choosing to use the child fan's characteristic,", buf, 0x16u);

        }
      }
      v80 = v5;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFServiceItem controlItemValueSourceForServices:](self, "controlItemValueSourceForServices:", v33);
      v34 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "hf_characteristicOfType:", *MEMORY[0x1E0CB89E8]);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "metadata");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      HFItemOptionalLocalizedString(CFSTR("HFCharacteristicValueRotationDirectionClockwise"), v4);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      HFItemOptionalLocalizedString(CFSTR("HFCharacteristicValueRotationDirectionCounterClockwise"), v4);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFMultiStateValueSet binaryValueSetWithCharacteristicMetadata:firstValue:firstTitle:secondValue:secondTitle:](HFMultiStateValueSet, "binaryValueSetWithCharacteristicMetadata:firstValue:firstTitle:secondValue:secondTitle:", v36, &unk_1EA7CC250, v37, &unk_1EA7CC238, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        v40 = [HFMultiStateControlItem alloc];
        objc_msgSend(v35, "characteristicType");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = CFSTR("title");
        HFItemOptionalLocalizedString(CFSTR("HFControlShortTitleRotationDirection"), v4);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = v42;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = -[HFMultiStateControlItem initWithValueSource:characteristicType:possibleValueSet:displayResults:](v40, "initWithValueSource:characteristicType:possibleValueSet:displayResults:", v34, v41, v39, v43);
        objc_msgSend(v80, "na_safeAddObject:", v44);

      }
      v5 = v80;
      if (v34)
        goto LABEL_12;
    }
  }
  -[HFServiceItem service](self, "service");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "hf_characteristicOfType:", v28);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46 && (v34 = v92) != 0)
  {
LABEL_12:
    v97[0] = CFSTR("title");
    HFItemOptionalLocalizedString(CFSTR("HFControlShortTitleLinkedFanRotationSpeed"), v4);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v98[0] = v47;
    v97[1] = CFSTR("controlDescription");
    HFItemOptionalLocalizedString(CFSTR("HFControlShortTitleLinkedFanRotationSpeed"), v4);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v98[1] = v48;
    v97[2] = CFSTR("controlItemPurpose");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 4);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v98[2] = v49;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 3);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = [HFPowerStateControlItem alloc];
    v52 = -[HFPowerStateControlItem initWithValueSource:displayResults:](v51, "initWithValueSource:displayResults:", v34, MEMORY[0x1E0C9AA70]);
    v83 = v34;
    v53 = -[HFIncrementalStateControlItem initWithValueSource:primaryStateControlItem:incrementalCharacteristicType:displayResults:]([HFIncrementalStateControlItem alloc], "initWithValueSource:primaryStateControlItem:incrementalCharacteristicType:displayResults:", v34, v52, v28, v50);
    objc_msgSend(v5, "addObject:", v53);

  }
  else
  {
    v83 = 0;
  }
  -[HFServiceItem service](self, "service");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "hf_characteristicOfType:", v81);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v55, "metadata");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  HFItemOptionalLocalizedString(CFSTR("HFCharacteristicValueAirPurifierTargetStateManual"), v4);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  HFItemOptionalLocalizedString(CFSTR("HFCharacteristicValueAirPurifierTargetStateAuto"), v4);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFMultiStateValueSet binaryValueSetWithCharacteristicMetadata:firstValue:firstTitle:secondValue:secondTitle:](HFMultiStateValueSet, "binaryValueSetWithCharacteristicMetadata:firstValue:firstTitle:secondValue:secondTitle:", v56, &unk_1EA7CC250, v57, &unk_1EA7CC238, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    v60 = [HFMultiStateControlItem alloc];
    objc_msgSend(v55, "characteristicType");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = CFSTR("title");
    HFItemOptionalLocalizedString(CFSTR("HFControlShortTitleAirPurifierState"), v4);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v62;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = -[HFMultiStateControlItem initWithValueSource:characteristicType:possibleValueSet:displayResults:](v60, "initWithValueSource:characteristicType:possibleValueSet:displayResults:", v92, v61, v59, v63);
    objc_msgSend(v5, "na_safeAddObject:", v64);

  }
  v82 = v55;
  v65 = -[HFSwingModeControlItem initWithValueSource:]([HFSwingModeControlItem alloc], "initWithValueSource:", v91);
  objc_msgSend(v5, "na_safeAddObject:", v65);

  -[HFServiceItem service](self, "service");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "hf_characteristicOfType:", *MEMORY[0x1E0CB8940]);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v67, "metadata");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  HFItemOptionalLocalizedString(CFSTR("HFCharacteristicValueLockPhysicalControlsUnlocked"), v4);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  HFItemOptionalLocalizedString(CFSTR("HFCharacteristicValueLockPhysicalControlsLocked"), v4);
  v70 = v5;
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFMultiStateValueSet binaryValueSetWithCharacteristicMetadata:firstValue:firstTitle:secondValue:secondTitle:](HFMultiStateValueSet, "binaryValueSetWithCharacteristicMetadata:firstValue:firstTitle:secondValue:secondTitle:", v68, &unk_1EA7CC250, v69, &unk_1EA7CC238, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    v73 = [HFMultiStateControlItem alloc];
    objc_msgSend(v67, "characteristicType");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = CFSTR("title");
    HFItemOptionalLocalizedString(CFSTR("HFControlShortTitleLockPhysicalControls"), v4);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = v75;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = -[HFMultiStateControlItem initWithValueSource:characteristicType:possibleValueSet:displayResults:](v73, "initWithValueSource:characteristicType:possibleValueSet:displayResults:", v92, v74, v72, v76);
    objc_msgSend(v70, "na_safeAddObject:", v77);

  }
  return v70;
}

uint64_t __58__HFAirPurifierServiceItem_createControlItemsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB9B10]);

  return v3;
}

uint64_t __58__HFAirPurifierServiceItem_createControlItemsWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB9AB0]);

  return v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = *MEMORY[0x1E0CB8830];
  v6 = *MEMORY[0x1E0CB8790];
  v7 = *MEMORY[0x1E0CB88B8];
  v8 = a3;
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceItem performStandardUpdateWithCharacteristicTypes:options:](self, "performStandardUpdateWithCharacteristicTypes:options:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__HFAirPurifierServiceItem__subclass_updateWithOptions___block_invoke;
  v13[3] = &unk_1EA726480;
  v13[4] = self;
  objc_msgSend(v10, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __56__HFAirPurifierServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
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
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;

  v3 = a2;
  objc_msgSend(v3, "readResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8830]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = v5;
  objc_msgSend(v5, "valueWithExpectedClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "readResponse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CB8790];
  objc_msgSend(*(id *)(a1 + 32), "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "responseForCharacteristicType:inService:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = v10;
  objc_msgSend(v10, "valueWithExpectedClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "readResponse");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "responseForCharacteristicType:", *MEMORY[0x1E0CB88B8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueWithExpectedClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "service");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hf_childServices");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "na_firstObjectPassingTest:", &__block_literal_global_34_1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v3, "readResponse");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "responseForCharacteristicType:inService:", v8, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "valueWithExpectedClass:", objc_opt_class());
    v39 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v39 = 0;
  }
  objc_msgSend(v3, "standardResults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  if (!v6)
    goto LABEL_19;
  if (!objc_msgSend(v11, "isEqual:", MEMORY[0x1E0C9AAA0])
    || !objc_msgSend(v39, "isEqual:", MEMORY[0x1E0C9AAB0]))
  {
    if (objc_msgSend(v11, "isEqual:", MEMORY[0x1E0C9AAB0])
      && objc_msgSend(v6, "isEqual:", &unk_1EA7CC250))
    {
      v23 = CFSTR("HFServiceDescriptionAirPurifierTurningOn");
    }
    else
    {
      if (!objc_msgSend(v11, "isEqual:", MEMORY[0x1E0C9AAA0])
        || (objc_msgSend(v6, "isEqual:", &unk_1EA7CC250) & 1) != 0)
      {
        v24 = *(void **)(a1 + 32);
        objc_msgSend(v38, "characteristic");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "controlDescriptionForCharacteristic:withValue:", v25, v6);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "na_safeSetObject:forKey:", v26, CFSTR("controlDescription"));

        v27 = *(void **)(a1 + 32);
        objc_msgSend(v38, "characteristic");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "descriptionForCharacteristic:withValue:", v28, v6);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_16;
      }
      v23 = CFSTR("HFServiceDescriptionAirPurifierTurningOff");
    }
    _HFLocalizedStringWithDefaultValue(v23, v23, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v29, CFSTR("controlDescription"));

    _HFLocalizedStringWithDefaultValue(v23, v23, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isInStateTransition"));
    goto LABEL_16;
  }
  _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceDescriptionAirPurifierFanOnlyMode"), CFSTR("HFServiceDescriptionAirPurifierFanOnlyMode"), 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("description"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("description"));

LABEL_19:
  if (v14 && objc_msgSend(v14, "integerValue") == 1)
  {
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("detailedControlDescription"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v31)
    {
      _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceDetailedControlDescriptionChangeFilterSoon"), CFSTR("HFServiceDetailedControlDescriptionChangeFilterSoon"), 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v32, CFSTR("detailedControlDescription"));

    }
    objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_1EA7CC268, CFSTR("badge"));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_1EA7CC280, CFSTR("descriptionBadge"));
  }
  objc_msgSend(*(id *)(a1 + 32), "applyInflectionToDescriptions:", v21);
  v33 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v21);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "futureWithResult:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

uint64_t __56__HFAirPurifierServiceItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB9B10]);

  return v3;
}

@end
