@implementation HFHeaterCoolerServiceItem

+ (id)supportedServiceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9A30]);
}

- (id)createControlItemsWithOptions:(id)a3
{
  id v4;
  uint64_t v5;
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
  HFTemperatureUnitControlItem *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  HFMultiStateValueSet *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HFPowerStateControlItem *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  HFTargetModeControlItem *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  HFHeaterCoolerServiceItem *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  unint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  HFMultiStateControlItem *v65;
  id v66;
  HFPowerStateControlItem *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  id v71;
  void *v72;
  HFIncrementalStateControlItem *v73;
  void *v74;
  void *v75;
  HFIncrementalStateControlItem *v76;
  void *v77;
  HFSwingModeControlItem *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  HFMultiStateControlItem *v85;
  void *v86;
  void *v87;
  void *v88;
  HFMultiStateControlItem *v89;
  void *v91;
  void *v92;
  HFMultiStateControlItem *v93;
  HFTargetModeControlItem *v94;
  void *v95;
  HFHeaterCoolerServiceItem *v96;
  HFMultiStateValueSet *v97;
  void *v98;
  HFTemperatureUnitControlItem *v99;
  HFHeaterCoolerThresholdControlItem *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  const __CFString *v114;
  void *v115;
  const __CFString *v116;
  void *v117;
  const __CFString *v118;
  void *v119;
  const __CFString *v120;
  void *v121;
  uint8_t buf[4];
  void *v123;
  __int16 v124;
  void *v125;
  _QWORD v126[2];
  _QWORD v127[2];
  const __CFString *v128;
  void *v129;
  const __CFString *v130;
  void *v131;
  const __CFString *v132;
  void *v133;
  const __CFString *v134;
  void *v135;
  _QWORD v136[2];
  _QWORD v137[4];

  v137[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFServiceItem controlItemValueSourceForPrimaryService](self, "controlItemValueSourceForPrimaryService");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceItem service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_childServices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_firstObjectPassingTest:", &__block_literal_global_166);
  v111 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E20];
  -[HFServiceItem service](self, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "na_safeAddObject:", v111);
  v105 = v11;
  -[HFServiceItem controlItemValueSourceForServices:](self, "controlItemValueSourceForServices:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  -[HFServiceItem service](self, "service");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hf_childServices");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "na_filter:", &__block_literal_global_2_24);
  v15 = objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0C99E20];
  -[HFServiceItem service](self, "service");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithObject:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v103 = (void *)v15;
  objc_msgSend(v18, "unionSet:", v15);
  v102 = v18;
  -[HFServiceItem controlItemValueSourceForServices:](self, "controlItemValueSourceForServices:", v18);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v136[0] = CFSTR("title");
  HFItemOptionalLocalizedString(CFSTR("HFControlShortTitleTemperature"), v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v137[0] = v19;
  v136[1] = CFSTR("controlItemPurpose");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v137[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v137, v136, 2);
  v21 = objc_claimAutoreleasedReturnValue();

  v101 = (void *)v21;
  v113 = v6;
  v100 = -[HFHeaterCoolerThresholdControlItem initWithValueSource:displayResults:]([HFHeaterCoolerThresholdControlItem alloc], "initWithValueSource:displayResults:", v5, v21);
  objc_msgSend(v6, "na_safeAddObject:");
  v22 = [HFTemperatureUnitControlItem alloc];
  v112 = (void *)v5;
  v99 = -[HFTemperatureUnitControlItem initWithValueSource:characteristicType:displayResults:](v22, "initWithValueSource:characteristicType:displayResults:", v5, *MEMORY[0x1E0CB8B20], 0);
  objc_msgSend(v6, "na_safeAddObject:");
  v96 = self;
  -[HFServiceItem service](self, "service");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = *MEMORY[0x1E0CB8AB8];
  objc_msgSend(v23, "hf_characteristicOfType:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "metadata");
  v25 = objc_claimAutoreleasedReturnValue();

  v98 = (void *)v25;
  v26 = -[HFMultiStateValueSet initWithCharacteristicMetadata:]([HFMultiStateValueSet alloc], "initWithCharacteristicMetadata:", v25);
  v134 = CFSTR("title");
  HFItemOptionalLocalizedString(CFSTR("HFServiceThermostatModeAuto"), v4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v135, &v134, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMultiStateValueSet addValue:displayResults:](v26, "addValue:displayResults:", &unk_1EA7CCBF8, v28);

  v132 = CFSTR("title");
  HFItemOptionalLocalizedString(CFSTR("HFServiceThermostatModeHeat"), v4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v133, &v132, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMultiStateValueSet addValue:displayResults:](v26, "addValue:displayResults:", &unk_1EA7CCC10, v30);

  v130 = CFSTR("title");
  HFItemOptionalLocalizedString(CFSTR("HFServiceThermostatModeCool"), v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v131, &v130, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMultiStateValueSet addValue:displayResults:](v26, "addValue:displayResults:", &unk_1EA7CCC28, v32);

  +[HFUtilities comparatorWithSortedObjects:](HFUtilities, "comparatorWithSortedObjects:", &unk_1EA7CDE70);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMultiStateValueSet setValueComparator:](v26, "setValueComparator:", v33);

  v34 = [HFPowerStateControlItem alloc];
  v35 = (void *)MEMORY[0x1E0C99E60];
  +[HFPowerStateTargetValueTuple fanStateTargetValueTuple](HFPowerStateTargetValueTuple, "fanStateTargetValueTuple");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setWithObject:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = CFSTR("title");
  HFItemOptionalLocalizedString(CFSTR("HFControlShortTitlePower"), v4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = v38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v129, &v128, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[HFPowerStateControlItem initWithValueSource:auxiliaryTargetValueTuples:displayResults:](v34, "initWithValueSource:auxiliaryTargetValueTuples:displayResults:", v12, v37, v39);

  v126[0] = CFSTR("title");
  v41 = v4;
  HFItemOptionalLocalizedString(CFSTR("HFControlShortTitleHeatingCoolingMode"), v4);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v126[1] = CFSTR("controlItemPurpose");
  v127[0] = v42;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 12);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v127[1] = v43;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v127, v126, 2);
  v44 = objc_claimAutoreleasedReturnValue();

  v45 = [HFTargetModeControlItem alloc];
  v104 = (void *)v12;
  v46 = v106;
  v97 = v26;
  v107 = (void *)v40;
  v95 = (void *)v44;
  v94 = -[HFTargetModeControlItem initWithValueSource:targetModeCharacteristicType:targetModeValueSet:primaryPowerStateControlItem:displayResults:](v45, "initWithValueSource:targetModeCharacteristicType:targetModeValueSet:primaryPowerStateControlItem:displayResults:", v12, v46, v26, v40, v44);
  objc_msgSend(v113, "addObject:");
  v47 = *MEMORY[0x1E0CB89F0];
  if (v111
    && (objc_msgSend(v111, "hf_characteristicOfType:", v47),
        v48 = (void *)objc_claimAutoreleasedReturnValue(),
        v48,
        v48))
  {
    v49 = v96;
    -[HFServiceItem service](v96, "service");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "hf_characteristicOfType:", v47);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = v41;
    if (v51)
    {
      HFLogForCategory(0x29uLL);
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        -[HFServiceItem service](v96, "service");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v123 = v91;
        v124 = 2112;
        v125 = v111;
        _os_log_error_impl(&dword_1DD34E000, v53, OS_LOG_TYPE_ERROR, "Both the heater/cooler service (%@) and the fan child service (%@) have a rotation speed characteristic. This is not a valid configuration. Arbitrarily choosing to use the child fan's characteristic,", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v111);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFServiceItem controlItemValueSourceForServices:](v96, "controlItemValueSourceForServices:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v111, "hf_characteristicOfType:", *MEMORY[0x1E0CB89E8]);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "metadata");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    HFItemOptionalLocalizedString(CFSTR("HFCharacteristicValueRotationDirectionClockwise"), v41);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    HFItemOptionalLocalizedString(CFSTR("HFCharacteristicValueRotationDirectionCounterClockwise"), v52);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFMultiStateValueSet binaryValueSetWithCharacteristicMetadata:firstValue:firstTitle:secondValue:secondTitle:](HFMultiStateValueSet, "binaryValueSetWithCharacteristicMetadata:firstValue:firstTitle:secondValue:secondTitle:", v56, &unk_1EA7CCBF8, v57, &unk_1EA7CCC10, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = v112;
    v61 = 0x1E0C99000;
    if (v59)
    {
      v93 = [HFMultiStateControlItem alloc];
      objc_msgSend(v108, "characteristicType");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = CFSTR("title");
      HFItemOptionalLocalizedString(CFSTR("HFControlShortTitleRotationDirection"), v52);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = v62;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v121, &v120, 1);
      v63 = v55;
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = -[HFMultiStateControlItem initWithValueSource:characteristicType:possibleValueSet:displayResults:](v93, "initWithValueSource:characteristicType:possibleValueSet:displayResults:", v63, v92, v59, v64);
      objc_msgSend(v113, "na_safeAddObject:", v65);

      v55 = v63;
      v49 = v96;
      v60 = v112;

      v61 = 0x1E0C99000uLL;
    }
    v66 = v55;
    v67 = [HFPowerStateControlItem alloc];
    v118 = CFSTR("title");
    HFItemOptionalLocalizedString(CFSTR("HFControlShortTitlePower"), v52);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = v68;
    objc_msgSend(*(id *)(v61 + 3456), "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = -[HFPowerStateControlItem initWithValueSource:displayResults:](v67, "initWithValueSource:displayResults:", v66, v69);

    v109 = (void *)v70;
    v71 = (id)v70;
    if (v66)
      goto LABEL_15;
  }
  else
  {
    v109 = 0;
    v60 = v112;
    v61 = 0x1E0C99000uLL;
    v52 = v41;
    v49 = v96;
  }
  -[HFServiceItem service](v49, "service");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "hf_characteristicOfType:", v47);
  v66 = (id)objc_claimAutoreleasedReturnValue();

  if (v66)
  {
    v66 = v60;
    v71 = v107;

    if (v66)
    {
      v109 = v71;
LABEL_15:
      v73 = [HFIncrementalStateControlItem alloc];
      v116 = CFSTR("title");
      HFItemOptionalLocalizedString(CFSTR("HFControlShortTitleLinkedFanRotationSpeed"), v52);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = v74;
      objc_msgSend(*(id *)(v61 + 3456), "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = -[HFIncrementalStateControlItem initWithValueSource:primaryStateControlItem:incrementalCharacteristicType:displayResults:](v73, "initWithValueSource:primaryStateControlItem:incrementalCharacteristicType:displayResults:", v66, v71, v47, v75);

      v77 = v113;
      objc_msgSend(v113, "addObject:", v76);

      goto LABEL_18;
    }
    v109 = v71;
  }
  v77 = v113;
LABEL_18:
  v78 = -[HFSwingModeControlItem initWithValueSource:]([HFSwingModeControlItem alloc], "initWithValueSource:", v110);
  objc_msgSend(v77, "na_safeAddObject:", v78);

  -[HFServiceItem service](v49, "service");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "hf_characteristicOfType:", *MEMORY[0x1E0CB8940]);
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v80, "metadata");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  HFItemOptionalLocalizedString(CFSTR("HFCharacteristicValueLockPhysicalControlsUnlocked"), v52);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  HFItemOptionalLocalizedString(CFSTR("HFCharacteristicValueLockPhysicalControlsLocked"), v52);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFMultiStateValueSet binaryValueSetWithCharacteristicMetadata:firstValue:firstTitle:secondValue:secondTitle:](HFMultiStateValueSet, "binaryValueSetWithCharacteristicMetadata:firstValue:firstTitle:secondValue:secondTitle:", v81, &unk_1EA7CCBF8, v82, &unk_1EA7CCC10, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  if (v84)
  {
    v85 = [HFMultiStateControlItem alloc];
    objc_msgSend(v80, "characteristicType");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = CFSTR("title");
    HFItemOptionalLocalizedString(CFSTR("HFControlShortTitleLockPhysicalControls"), v52);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = v87;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = -[HFMultiStateControlItem initWithValueSource:characteristicType:possibleValueSet:displayResults:](v85, "initWithValueSource:characteristicType:possibleValueSet:displayResults:", v112, v86, v84, v88);
    objc_msgSend(v77, "na_safeAddObject:", v89);

  }
  return v113;
}

uint64_t __59__HFHeaterCoolerServiceItem_createControlItemsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB9B10]);

  return v3;
}

uint64_t __59__HFHeaterCoolerServiceItem_createControlItemsWithOptions___block_invoke_2(uint64_t a1, void *a2)
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
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = *MEMORY[0x1E0CB8790];
  v6 = *MEMORY[0x1E0CB8890];
  v7 = *MEMORY[0x1E0CB8840];
  v8 = *MEMORY[0x1E0CB8AB8];
  v9 = *MEMORY[0x1E0CB8828];
  v10 = *MEMORY[0x1E0CB88D8];
  v11 = a3;
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceItem performStandardUpdateWithCharacteristicTypes:options:](self, "performStandardUpdateWithCharacteristicTypes:options:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__HFHeaterCoolerServiceItem__subclass_updateWithOptions___block_invoke;
  v16[3] = &unk_1EA726480;
  v16[4] = self;
  objc_msgSend(v13, "flatMap:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __57__HFHeaterCoolerServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  HFTemperatureIconDescriptor *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;

  v3 = a2;
  objc_msgSend(v3, "readResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8890]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueWithExpectedClass:", objc_opt_class());
  v6 = objc_claimAutoreleasedReturnValue();

  +[HFTemperatureItemUtilities currentHeatingCoolingModeValueInResponse:](HFTemperatureItemUtilities, "currentHeatingCoolingModeValueInResponse:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFTemperatureItemUtilities targetHeatingCoolingModeValueInResponse:](HFTemperatureItemUtilities, "targetHeatingCoolingModeValueInResponse:", v4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "standardResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "temperatureFormatter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setInputIsCelsius:", 1);
  v27 = 0;
  v28 = 0;
  v25 = a1;
  v26 = 0;
  objc_msgSend(*(id *)(a1 + 32), "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFThermostatItemUtilities getDescription:controlDescription:optionalDescriptions:forResponse:primaryService:temperatureFormatter:](HFThermostatItemUtilities, "getDescription:controlDescription:optionalDescriptions:forResponse:primaryService:temperatureFormatter:", &v28, &v27, &v26, v4, v12, v11);
  v13 = v28;
  v14 = v27;
  v15 = v26;

  if (v13)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("description"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("description"));
  }
  objc_msgSend(v9, "na_safeSetObject:forKey:", v14, CFSTR("controlDescription"));
  objc_msgSend(v9, "addEntriesFromDictionary:", v15);
  objc_msgSend(v11, "stringForObjectValue:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)v6;
  v18 = -[HFTemperatureIconDescriptor initWithFormattedTemperature:heatingCoolingMode:targetHeatingCoolingMode:]([HFTemperatureIconDescriptor alloc], "initWithFormattedTemperature:heatingCoolingMode:targetHeatingCoolingMode:", v17, objc_msgSend(v7, "integerValue"), objc_msgSend(v24, "integerValue"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, CFSTR("icon"));

  objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("tempreatureUnitDependency"));
  objc_msgSend(*(id *)(v25 + 32), "applyInflectionToDescriptions:", v9);
  v19 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "futureWithResult:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

@end
