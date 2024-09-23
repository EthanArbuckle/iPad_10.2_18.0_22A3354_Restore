@implementation HFHumidifierDehumidifierServiceItem

+ (id)supportedServiceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9A38]);
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
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  HFMultiStateValueSet *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HFPowerStateControlItem *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  HFTargetModeControlItem *v43;
  uint64_t v44;
  void *v45;
  HFHumidifierDehumidifierServiceItem *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  HFMultiStateControlItem *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  HFMultiStateControlItem *v63;
  id v64;
  HFPowerStateControlItem *v65;
  void *v66;
  void *v67;
  HFPowerStateControlItem *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  HFIncrementalStateControlItem *v74;
  void *v75;
  void *v76;
  HFIncrementalStateControlItem *v77;
  HFSwingModeControlItem *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  HFMultiStateControlItem *v86;
  void *v87;
  void *v88;
  void *v89;
  HFMultiStateControlItem *v90;
  void *v92;
  HFTargetModeControlItem *v93;
  void *v94;
  HFHumidifierDehumidifierServiceItem *v95;
  HFMultiStateValueSet *v96;
  void *v97;
  HFHumidifierDehumidifierThresholdControlItem *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  HFPowerStateControlItem *v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  const __CFString *v112;
  void *v113;
  const __CFString *v114;
  void *v115;
  const __CFString *v116;
  void *v117;
  const __CFString *v118;
  void *v119;
  uint8_t buf[4];
  void *v121;
  __int16 v122;
  void *v123;
  _QWORD v124[2];
  _QWORD v125[2];
  const __CFString *v126;
  void *v127;
  const __CFString *v128;
  void *v129;
  const __CFString *v130;
  void *v131;
  const __CFString *v132;
  void *v133;
  _QWORD v134[2];
  _QWORD v135[4];

  v135[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFServiceItem controlItemValueSourceForPrimaryService](self, "controlItemValueSourceForPrimaryService");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceItem service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_childServices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_firstObjectPassingTest:", &__block_literal_global_123);
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C99E20];
  -[HFServiceItem service](self, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "na_safeAddObject:", v110);
  v102 = v10;
  -[HFServiceItem controlItemValueSourceForServices:](self, "controlItemValueSourceForServices:", v10);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceItem service](self, "service");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hf_childServices");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "na_filter:", &__block_literal_global_5_7);
  v13 = objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0C99E20];
  -[HFServiceItem service](self, "service");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithObject:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v101 = (void *)v13;
  objc_msgSend(v16, "unionSet:", v13);
  v100 = v16;
  -[HFServiceItem controlItemValueSourceForServices:](self, "controlItemValueSourceForServices:", v16);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v134[0] = CFSTR("title");
  HFItemOptionalLocalizedString(CFSTR("HFControlShortTitleHumidity"), v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v135[0] = v17;
  v134[1] = CFSTR("controlItemPurpose");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v135[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v135, v134, 2);
  v19 = objc_claimAutoreleasedReturnValue();

  v106 = (void *)v5;
  v99 = (void *)v19;
  v98 = -[HFHumidifierDehumidifierThresholdControlItem initWithValueSource:displayResults:]([HFHumidifierDehumidifierThresholdControlItem alloc], "initWithValueSource:displayResults:", v5, v19);
  objc_msgSend(v105, "na_safeAddObject:");
  v95 = self;
  -[HFServiceItem service](self, "service");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = *MEMORY[0x1E0CB8AD0];
  objc_msgSend(v20, "hf_characteristicOfType:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "metadata");
  v22 = objc_claimAutoreleasedReturnValue();

  v97 = (void *)v22;
  v23 = -[HFMultiStateValueSet initWithCharacteristicMetadata:]([HFMultiStateValueSet alloc], "initWithCharacteristicMetadata:", v22);
  v132 = CFSTR("title");
  HFItemOptionalLocalizedString(CFSTR("HFServiceHumidifierDehumidifierStateAuto"), v4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v133, &v132, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMultiStateValueSet addValue:displayResults:](v23, "addValue:displayResults:", &unk_1EA7CC4A8, v25);

  v130 = CFSTR("title");
  HFItemOptionalLocalizedString(CFSTR("HFServiceHumidifierDehumidifierStateHumidify"), v4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v131, &v130, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMultiStateValueSet addValue:displayResults:](v23, "addValue:displayResults:", &unk_1EA7CC4C0, v27);

  v128 = CFSTR("title");
  HFItemOptionalLocalizedString(CFSTR("HFServiceHumidifierDehumidifierStateDehumidify"), v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v129, &v128, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMultiStateValueSet addValue:displayResults:](v23, "addValue:displayResults:", &unk_1EA7CC4D8, v29);

  +[HFUtilities comparatorWithSortedObjects:](HFUtilities, "comparatorWithSortedObjects:", &unk_1EA7CDDC8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMultiStateValueSet setValueComparator:](v23, "setValueComparator:", v30);

  v31 = [HFPowerStateControlItem alloc];
  v32 = (void *)MEMORY[0x1E0C99E60];
  +[HFPowerStateTargetValueTuple fanStateTargetValueTuple](HFPowerStateTargetValueTuple, "fanStateTargetValueTuple");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setWithObject:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = CFSTR("title");
  HFItemOptionalLocalizedString(CFSTR("HFControlShortTitlePower"), v4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = v35;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v127, &v126, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[HFPowerStateControlItem initWithValueSource:auxiliaryTargetValueTuples:displayResults:](v31, "initWithValueSource:auxiliaryTargetValueTuples:displayResults:", v109, v34, v36);

  v38 = v105;
  v124[0] = CFSTR("title");
  v39 = v4;
  HFItemOptionalLocalizedString(CFSTR("HFControlShortTitleHumidifierDehumidifierState"), v4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v124[1] = CFSTR("controlItemPurpose");
  v125[0] = v40;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 12);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v125[1] = v41;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v125, v124, 2);
  v42 = objc_claimAutoreleasedReturnValue();

  v43 = [HFTargetModeControlItem alloc];
  v44 = v103;
  v96 = v23;
  v104 = (void *)v37;
  v94 = (void *)v42;
  v93 = -[HFTargetModeControlItem initWithValueSource:targetModeCharacteristicType:targetModeValueSet:primaryPowerStateControlItem:displayResults:](v43, "initWithValueSource:targetModeCharacteristicType:targetModeValueSet:primaryPowerStateControlItem:displayResults:", v109, v44, v23, v37, v42);
  objc_msgSend(v105, "addObject:");
  v111 = *MEMORY[0x1E0CB89F0];
  if (v110
    && (objc_msgSend(v110, "hf_characteristicOfType:", v111),
        v45 = (void *)objc_claimAutoreleasedReturnValue(),
        v45,
        v45))
  {
    v46 = v95;
    -[HFServiceItem service](v95, "service");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "hf_characteristicOfType:", v111);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = v39;
    if (v48)
    {
      HFLogForCategory(0x29uLL);
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        -[HFServiceItem service](v95, "service");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v121 = v92;
        v122 = 2112;
        v123 = v110;
        _os_log_error_impl(&dword_1DD34E000, v50, OS_LOG_TYPE_ERROR, "Both the humidifier/dehumidifier service (%@) and the fan child service (%@) have a rotation speed characteristic. This is not a valid configuration. Arbitrarily choosing to use the child fan's characteristic,", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v110);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFServiceItem controlItemValueSourceForServices:](v95, "controlItemValueSourceForServices:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v110, "hf_characteristicOfType:", *MEMORY[0x1E0CB89E8]);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "metadata");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    HFItemOptionalLocalizedString(CFSTR("HFCharacteristicValueRotationDirectionClockwise"), v49);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    HFItemOptionalLocalizedString(CFSTR("HFCharacteristicValueRotationDirectionCounterClockwise"), v49);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFMultiStateValueSet binaryValueSetWithCharacteristicMetadata:firstValue:firstTitle:secondValue:secondTitle:](HFMultiStateValueSet, "binaryValueSetWithCharacteristicMetadata:firstValue:firstTitle:secondValue:secondTitle:", v54, &unk_1EA7CC4A8, v55, &unk_1EA7CC4C0, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      v58 = [HFMultiStateControlItem alloc];
      objc_msgSend(v53, "characteristicType");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = CFSTR("title");
      HFItemOptionalLocalizedString(CFSTR("HFControlShortTitleRotationDirection"), v49);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = v60;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1);
      v61 = v53;
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = -[HFMultiStateControlItem initWithValueSource:characteristicType:possibleValueSet:displayResults:](v58, "initWithValueSource:characteristicType:possibleValueSet:displayResults:", v52, v59, v57, v62);
      objc_msgSend(v105, "na_safeAddObject:", v63);

      v53 = v61;
    }
    v64 = v52;
    v65 = [HFPowerStateControlItem alloc];
    v116 = CFSTR("title");
    HFItemOptionalLocalizedString(CFSTR("HFControlShortTitlePower"), v49);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = v66;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = -[HFPowerStateControlItem initWithValueSource:displayResults:](v65, "initWithValueSource:displayResults:", v64, v67);

    v38 = v105;
    v69 = v106;
    if (v64)
      goto LABEL_14;
  }
  else
  {
    v68 = 0;
    v69 = v106;
    v49 = v4;
    v46 = v95;
  }
  v107 = v68;
  -[HFServiceItem service](v46, "service");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "hf_characteristicOfType:", v111);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if (v71)
  {
    v64 = v69;
    v68 = v104;

LABEL_14:
    v107 = v68;
    v72 = v49;
    if (v64 && v68)
    {
      v73 = v69;
      v74 = [HFIncrementalStateControlItem alloc];
      v114 = CFSTR("title");
      HFItemOptionalLocalizedString(CFSTR("HFControlShortTitleLinkedFanRotationSpeed"), v72);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = v75;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = -[HFIncrementalStateControlItem initWithValueSource:primaryStateControlItem:incrementalCharacteristicType:displayResults:](v74, "initWithValueSource:primaryStateControlItem:incrementalCharacteristicType:displayResults:", v64, v68, v111, v76);

      objc_msgSend(v38, "addObject:", v77);
    }
    else
    {
      v73 = v69;
    }
    goto LABEL_19;
  }
  v72 = v49;
  v73 = v69;
  v64 = 0;
LABEL_19:
  v78 = -[HFSwingModeControlItem initWithValueSource:]([HFSwingModeControlItem alloc], "initWithValueSource:", v108);
  objc_msgSend(v38, "na_safeAddObject:", v78);

  -[HFServiceItem service](v46, "service");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "hf_characteristicOfType:", *MEMORY[0x1E0CB8940]);
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v80, "metadata");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  HFItemOptionalLocalizedString(CFSTR("HFCharacteristicValueLockPhysicalControlsUnlocked"), v72);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  HFItemOptionalLocalizedString(CFSTR("HFCharacteristicValueLockPhysicalControlsLocked"), v72);
  v83 = v38;
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFMultiStateValueSet binaryValueSetWithCharacteristicMetadata:firstValue:firstTitle:secondValue:secondTitle:](HFMultiStateValueSet, "binaryValueSetWithCharacteristicMetadata:firstValue:firstTitle:secondValue:secondTitle:", v81, &unk_1EA7CC4A8, v82, &unk_1EA7CC4C0, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  if (v85)
  {
    v86 = [HFMultiStateControlItem alloc];
    objc_msgSend(v80, "characteristicType");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = CFSTR("title");
    HFItemOptionalLocalizedString(CFSTR("HFControlShortTitleLockPhysicalControls"), v72);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = v88;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v113, &v112, 1);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = -[HFMultiStateControlItem initWithValueSource:characteristicType:possibleValueSet:displayResults:](v86, "initWithValueSource:characteristicType:possibleValueSet:displayResults:", v73, v87, v85, v89);
    objc_msgSend(v83, "na_safeAddObject:", v90);

  }
  return v83;
}

uint64_t __69__HFHumidifierDehumidifierServiceItem_createControlItemsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB9B10]);

  return v3;
}

uint64_t __69__HFHumidifierDehumidifierServiceItem_createControlItemsWithOptions___block_invoke_2(uint64_t a1, void *a2)
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
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = *MEMORY[0x1E0CB8790];
  v6 = *MEMORY[0x1E0CB8880];
  v7 = *MEMORY[0x1E0CB8858];
  v8 = *MEMORY[0x1E0CB8AD0];
  v9 = *MEMORY[0x1E0CB88F0];
  v10 = *MEMORY[0x1E0CB88A8];
  v11 = *MEMORY[0x1E0CB8B48];
  v12 = a3;
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceItem performStandardUpdateWithCharacteristicTypes:options:](self, "performStandardUpdateWithCharacteristicTypes:options:", v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __67__HFHumidifierDehumidifierServiceItem__subclass_updateWithOptions___block_invoke;
  v17[3] = &unk_1EA726480;
  v17[4] = self;
  objc_msgSend(v14, "flatMap:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __67__HFHumidifierDehumidifierServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;

  v3 = a2;
  objc_msgSend(v3, "readResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "standardResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v30 = a1;
  v31 = 0;
  v7 = *(void **)(a1 + 32);
  v32 = 0;
  v33 = 0;
  objc_msgSend(v7, "_formatDescription:controlDescription:optionalDescriptions:forResponse:", &v33, &v32, &v31, v4);
  v8 = v33;
  v9 = v32;
  v10 = v31;
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("description"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("description"));
  }
  objc_msgSend(v6, "na_safeSetObject:forKey:", v9, CFSTR("controlDescription"));
  objc_msgSend(v6, "addEntriesFromDictionary:", v10);
  objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8858]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueWithExpectedClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8B48]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "valueWithExpectedClass:", objc_opt_class());
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v13)
  {
    if (v15)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("detailedControlDescription"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        objc_msgSend(v14, "characteristic");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "metadata");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "hf_percentageForCharacteristicValue:", v16);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "integerValue") == 2 && (objc_msgSend(v29, "doubleValue"), v20 <= 0.2)
          || objc_msgSend(v13, "integerValue") == 3 && (objc_msgSend(v29, "doubleValue"), v21 >= 0.8))
        {
          v22 = *(void **)(v30 + 32);
          objc_msgSend(v14, "characteristic");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "controlDescriptionForCharacteristic:withValue:", v23, v16);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, CFSTR("detailedControlDescription"));

        }
      }
    }
  }
  objc_msgSend(*(id *)(v30 + 32), "applyInflectionToDescriptions:", v6);
  v25 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "futureWithResult:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (void)_formatDescription:(id *)a3 controlDescription:(id *)a4 optionalDescriptions:(id *)a5 forResponse:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  unint64_t v25;
  void *v26;
  HFRelativePercentValue *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HFRelativePercentValue *v32;
  void *v33;
  void *v34;
  HFRelativePercentValue *v35;
  void *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  HFRelativePercentValue *v93;
  uint64_t *v94;
  id v95;
  void *v96;
  unint64_t v97;
  void *v98;
  HFRelativePercentValue *v99;
  void *v100;
  void *v101;
  void (**v102)(_QWORD);
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  _QWORD aBlock[10];
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t (*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  id v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t (*v117)(uint64_t, uint64_t);
  void (*v118)(uint64_t);
  id v119;
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t (*v123)(uint64_t, uint64_t);
  void (*v124)(uint64_t);
  id v125;
  _QWORD v126[2];
  _QWORD v127[4];

  v127[2] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v120 = 0;
  v121 = &v120;
  v122 = 0x3032000000;
  v123 = __Block_byref_object_copy__17;
  v124 = __Block_byref_object_dispose__17;
  v125 = 0;
  v114 = 0;
  v115 = &v114;
  v116 = 0x3032000000;
  v117 = __Block_byref_object_copy__17;
  v118 = __Block_byref_object_dispose__17;
  v119 = 0;
  v108 = 0;
  v109 = &v108;
  v110 = 0x3032000000;
  v111 = __Block_byref_object_copy__17;
  v112 = __Block_byref_object_dispose__17;
  v113 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __110__HFHumidifierDehumidifierServiceItem__formatDescription_controlDescription_optionalDescriptions_forResponse___block_invoke;
  aBlock[3] = &unk_1EA7352A8;
  aBlock[4] = &v120;
  aBlock[5] = &v114;
  aBlock[8] = a4;
  aBlock[9] = a5;
  aBlock[6] = &v108;
  aBlock[7] = a3;
  v102 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[HFServiceItem service](self, "service");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hf_childServices");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "na_firstObjectPassingTest:", &__block_literal_global_50_4);
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "responseForCharacteristicType:", *MEMORY[0x1E0CB8858]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueWithExpectedClass:", objc_opt_class());
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "responseForCharacteristicType:", *MEMORY[0x1E0CB8AD0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "valueWithExpectedClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFServiceItem service](self, "service");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0CB8790];
  objc_msgSend(v10, "responseForCharacteristicType:inService:", *MEMORY[0x1E0CB8790], v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "valueWithExpectedClass:", objc_opt_class());
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  if (v104)
  {
    objc_msgSend(v10, "responseForCharacteristicType:inService:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "valueWithExpectedClass:", objc_opt_class());
    v103 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_49;
  }
  else
  {
    v103 = 0;
    if (!v15)
      goto LABEL_49;
  }
  if (v106 && v105)
  {
    v101 = (void *)objc_msgSend(CFSTR("HFServiceDescriptionHumidifier"), "mutableCopy");
    if (objc_msgSend(v15, "integerValue"))
    {
      v20 = objc_msgSend(v106, "integerValue");
      if (v20 >= 2)
      {
        if (v20 == 2)
        {
          v21 = CFSTR("Humidify");
        }
        else
        {
          if (v20 != 3)
          {
            NSLog(CFSTR("Unexpected current humidify / dehumidify mode %@"), v106);
LABEL_48:

            goto LABEL_49;
          }
          v21 = CFSTR("Dehumidify");
        }
        goto LABEL_21;
      }
      if ((objc_msgSend(v105, "BOOLValue") & 1) != 0)
      {
        v23 = objc_msgSend(v15, "integerValue");
        switch(v23)
        {
          case 0:
LABEL_22:
            v22 = 1;
            goto LABEL_28;
          case 1:
            v21 = CFSTR("TargetHumidify");
            break;
          case 2:
            v21 = CFSTR("TargetDehumidify");
            break;
          default:
            NSLog(CFSTR("Unexpected target humidify / dehumidify mode %@"), v15);
            goto LABEL_48;
        }
LABEL_21:
        objc_msgSend(v101, "appendString:", v21);
        goto LABEL_22;
      }
      if (objc_msgSend(v103, "BOOLValue"))
        v24 = CFSTR("FanOnly");
      else
        v24 = CFSTR("Off");
    }
    else
    {
      if (objc_msgSend(v105, "BOOLValue"))
      {
        objc_msgSend(v101, "appendString:", CFSTR("Auto"));
        v22 = 2;
        goto LABEL_28;
      }
      v24 = CFSTR("Off");
    }
    objc_msgSend(v101, "appendString:", v24);
    v22 = 0;
LABEL_28:
    v97 = +[HFTargetRangeUtilities rangeModeForTargetHumidifierDehumidifierState:](HFTargetRangeUtilities, "rangeModeForTargetHumidifierDehumidifierState:", objc_msgSend(v15, "integerValue"));
    v25 = +[HFTargetRangeUtilities rangeModeForCurrentHumidifierDehumidifierState:](HFTargetRangeUtilities, "rangeModeForCurrentHumidifierDehumidifierState:", objc_msgSend(v106, "integerValue"));
    objc_msgSend(v10, "responseForCharacteristicType:", *MEMORY[0x1E0CB88A8]);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "value");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v27 = [HFRelativePercentValue alloc];
      objc_msgSend(v100, "valueWithExpectedClass:", objc_opt_class());
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "characteristic");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = -[HFRelativePercentValue initWithValue:forCharacteristic:](v27, "initWithValue:forCharacteristic:", v28, v29);

    }
    else
    {
      v99 = 0;
    }

    objc_msgSend(v10, "responseForCharacteristicType:", *MEMORY[0x1E0CB88F0]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "value");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v32 = [HFRelativePercentValue alloc];
      objc_msgSend(v30, "valueWithExpectedClass:", objc_opt_class());
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "characteristic");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[HFRelativePercentValue initWithValue:forCharacteristic:](v32, "initWithValue:forCharacteristic:", v33, v34);

    }
    else
    {
      v35 = 0;
    }

    +[HFTargetRangeUtilities targetRelativePercentValueWithTargetMode:currentMode:rawTargetResponse:minimumThresholdResponse:maximumThresholdResponse:](HFTargetRangeUtilities, "targetRelativePercentValueWithTargetMode:currentMode:rawTargetResponse:minimumThresholdResponse:maximumThresholdResponse:", v97, v25, 0, v30, v100);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "percentFormatter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend(v38, "stringForRelativePercentValue:", v36);
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
LABEL_36:
        if (v22 != 1 && v35 && v99)
        {
          objc_msgSend(v101, "appendString:", CFSTR("WithHumidityRange"));
          objc_msgSend(v38, "stringForRelativePercentValue:", v35);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "stringForRelativePercentValue:", v99);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          HFLocalizedStringWithFormat(v101, CFSTR("%@%@"), v42, v43, v44, v45, v46, v47, (uint64_t)v40);
          v48 = objc_claimAutoreleasedReturnValue();
          v49 = (void *)v121[5];
          v121[5] = v48;

          objc_msgSend(v38, "stringForRelativePercentValue:", v35);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "stringForRelativePercentValue:", v99);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          HFLocalizedStringWithFormat(CFSTR("HFServiceControlDescriptionHumidifierAutoWithHumidityRange"), CFSTR("%@%@"), v51, v52, v53, v54, v55, v56, (uint64_t)v50);
          v57 = objc_claimAutoreleasedReturnValue();
          v58 = (void *)v115[5];
          v115[5] = v57;

          v126[0] = CFSTR("humidifyThresholdDescription");
          objc_msgSend(v38, "stringForRelativePercentValue:", v35);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          HFLocalizedStringWithFormat(CFSTR("HFServiceControlDescriptionHumidifierHumidifyWithHumidity"), CFSTR("%@"), v60, v61, v62, v63, v64, v65, (uint64_t)v59);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          v126[1] = CFSTR("dehumidifyThresholdDescription");
          v127[0] = v98;
          objc_msgSend(v38, "stringForRelativePercentValue:", v99);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          HFLocalizedStringWithFormat(CFSTR("HFServiceControlDescriptionHumidifierDehumidifyWithHumidity"), CFSTR("%@"), v67, v68, v69, v70, v71, v72, (uint64_t)v66);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v127[1] = v73;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v127, v126, 2);
          v74 = objc_claimAutoreleasedReturnValue();
          v75 = (void *)v109[5];
          v109[5] = v74;

        }
        else
        {
          objc_msgSend(v101, "appendString:", CFSTR("WithHumidity"));
          HFLocalizedStringWithFormat(v101, CFSTR("%@"), v85, v86, v87, v88, v89, v90, (uint64_t)v39);
          v91 = objc_claimAutoreleasedReturnValue();
          v92 = (void *)v121[5];
          v121[5] = v91;

          v93 = v35;
          v94 = v115;
          v95 = (id)v121[5];
          v59 = (void *)v94[5];
          v94[5] = (uint64_t)v95;
          v35 = v93;
        }
LABEL_47:

        goto LABEL_48;
      }
    }
    else
    {
      v39 = &stru_1EA741FF8;
      if (v22)
        goto LABEL_36;
    }
    _HFLocalizedStringWithDefaultValue(v101, v101, 1);
    v76 = objc_claimAutoreleasedReturnValue();
    v77 = (void *)v121[5];
    v121[5] = v76;

    if (v36 && v39)
    {
      HFLocalizedStringWithFormat(CFSTR("HFServiceControlDescriptionHumidifierOff"), CFSTR("%@"), v78, v79, v80, v81, v82, v83, (uint64_t)v39);
      v84 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceControlDescriptionHumidifierOffNoTargetHumidity"), CFSTR("HFServiceControlDescriptionHumidifierOffNoTargetHumidity"), 1);
      v84 = objc_claimAutoreleasedReturnValue();
    }
    v59 = (void *)v115[5];
    v115[5] = v84;
    goto LABEL_47;
  }
LABEL_49:

  if (v102)
    v102[2](v102);

  _Block_object_dispose(&v108, 8);
  _Block_object_dispose(&v114, 8);

  _Block_object_dispose(&v120, 8);
}

void __110__HFHumidifierDehumidifierServiceItem__formatDescription_controlDescription_optionalDescriptions_forResponse___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (*(_QWORD *)(a1 + 56))
    **(_QWORD **)(a1 + 56) = objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  if (*(_QWORD *)(a1 + 64))
  {
    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v2)
      v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    **(_QWORD **)(a1 + 64) = objc_retainAutorelease(v2);
  }
  if (*(_QWORD *)(a1 + 72))
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v3)
    {
      **(_QWORD **)(a1 + 72) = objc_retainAutorelease(v3);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      **(_QWORD **)(a1 + 72) = v4;

    }
  }
}

uint64_t __110__HFHumidifierDehumidifierServiceItem__formatDescription_controlDescription_optionalDescriptions_forResponse___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB9B10]);

  return v3;
}

@end
