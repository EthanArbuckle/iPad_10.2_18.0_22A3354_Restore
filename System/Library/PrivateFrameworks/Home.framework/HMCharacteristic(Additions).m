@implementation HMCharacteristic(Additions)

+ (void)hf_characteristicSortComparator
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__HMCharacteristic_Additions__hf_characteristicSortComparator__block_invoke;
  v3[3] = &__block_descriptor_48_e11_q24__0_8_16l;
  v3[4] = a1;
  v3[5] = a2;
  return _Block_copy(v3);
}

+ (uint64_t)hf_sortPriorityForCharacteristicType:()Additions
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = qword_1ED379A18;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1ED379A18, &__block_literal_global_24_7);
  objc_msgSend((id)qword_1ED379A10, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = &unk_1EA7CCE98;
  v7 = objc_msgSend(v6, "integerValue");

  return v7;
}

- (id)hf_characteristicTypeDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_descriptionForCharacteristicType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)hf_descriptionForCharacteristicType:()Additions
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "localizedDescriptionForCharacteristicType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)hf_powerStateCharacteristicTypes
{
  if (_MergedGlobals_293 != -1)
    dispatch_once(&_MergedGlobals_293, &__block_literal_global_2_26);
  return (id)qword_1ED379968;
}

+ (id)hf_sensingCharacteristicTypes
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __60__HMCharacteristic_Additions__hf_sensingCharacteristicTypes__block_invoke;
  v2[3] = &__block_descriptor_40_e5__8__0l;
  v2[4] = a1;
  __60__HMCharacteristic_Additions__hf_sensingCharacteristicTypes__block_invoke((uint64_t)v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)hf_isWritable
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "properties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "containsObject:", *MEMORY[0x1E0CB8788]);

  return v2;
}

- (uint64_t)hf_isReadable
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "properties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "containsObject:", *MEMORY[0x1E0CB8770]);

  return v2;
}

+ (id)_hf_valueRangeCharacteristicTypeToAbnormalValueMap
{
  if (qword_1ED3799C0 != -1)
    dispatch_once(&qword_1ED3799C0, &__block_literal_global_11_11);
  return (id)qword_1ED3799C8;
}

+ (id)_hf_alarmCharacteristicTypeToAbnormalValueMap
{
  if (qword_1ED3799B0 != -1)
    dispatch_once(&qword_1ED3799B0, &__block_literal_global_5_10);
  return (id)qword_1ED3799B8;
}

+ (id)hf_valueRangeCharacteristicTypes
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __63__HMCharacteristic_Additions__hf_valueRangeCharacteristicTypes__block_invoke;
  v2[3] = &__block_descriptor_40_e5__8__0l;
  v2[4] = a1;
  __63__HMCharacteristic_Additions__hf_valueRangeCharacteristicTypes__block_invoke((uint64_t)v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)hf_alarmCharacteristicTypes
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __58__HMCharacteristic_Additions__hf_alarmCharacteristicTypes__block_invoke;
  v2[3] = &__block_descriptor_40_e5__8__0l;
  v2[4] = a1;
  __58__HMCharacteristic_Additions__hf_alarmCharacteristicTypes__block_invoke((uint64_t)v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)hf_continuousValueRangeCharacteristicTypes
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __73__HMCharacteristic_Additions__hf_continuousValueRangeCharacteristicTypes__block_invoke;
  v2[3] = &__block_descriptor_40_e5__8__0l;
  v2[4] = a1;
  __73__HMCharacteristic_Additions__hf_continuousValueRangeCharacteristicTypes__block_invoke((uint64_t)v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)hf_abnormalValueForAlarmCharacteristicType:()Additions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_hf_alarmCharacteristicTypeToAbnormalValueMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)hf_defaultAbnormalValueForValueRangeSensorCharacteristicType:()Additions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_hf_valueRangeCharacteristicTypeToAbnormalValueMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)hf_abnormalValueForSensorCharacteristicType:()Additions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "hf_abnormalValueForAlarmCharacteristicType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(a1, "hf_defaultAbnormalValueForValueRangeSensorCharacteristicType:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

+ (id)_hf_valueRangeCharacteristicTypeToVisibleTriggerValueStepMap
{
  if (qword_1ED3799D0 != -1)
    dispatch_once(&qword_1ED3799D0, &__block_literal_global_17_10);
  return (id)qword_1ED3799D8;
}

- (id)hf_formattedValueUpdatedTime
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (qword_1ED3799E8 != -1)
    dispatch_once(&qword_1ED3799E8, &__block_literal_global_19_8);
  objc_msgSend(a1, "valueUpdatedTime");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)qword_1ED3799E0;
    objc_msgSend(a1, "valueUpdatedTime");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringFromDate:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)hf_defaultValue
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "format");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB86F8]) & 1) != 0)
  {
    v3 = (id)MEMORY[0x1E0C9AAA0];
  }
  else if (objc_msgSend(v1, "hf_isNumeric"))
  {
    objc_msgSend(v1, "minimumValue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    v6 = &unk_1EA7CD8E0;
    if (v4)
      v6 = (void *)v4;
    v3 = v6;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)hf_associatedCharacteristicType
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_associatedCharacteristicTypeForCharacteristicType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)hf_associatedCharacteristicTypeForCharacteristicType:()Additions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "hf_currentStateCharacteristicTypeForTargetStateCharacteristicType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(a1, "hf_targetStateCharacteristicTypeForCurrentStateCharacteristicType:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)hf_targetStateCharacteristicTypeForCurrentStateCharacteristicType:()Additions
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1ED3799F8;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1ED3799F8, &__block_literal_global_22_7);
  objc_msgSend((id)qword_1ED3799F0, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hf_currentStateCharacteristicTypeForTargetStateCharacteristicType:()Additions
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1ED379A08;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1ED379A08, &__block_literal_global_23_5);
  objc_msgSend((id)qword_1ED379A00, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)hf_sortPriority
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "hf_sortPriorityForCharacteristicType:", v3);

  return v4;
}

+ (uint64_t)hf_shouldCaptureCharacteristicTypeInActionSets:()Additions
{
  id v3;
  id v4;
  int v5;

  v3 = a3;
  if (qword_1ED379A20 != -1)
    dispatch_once(&qword_1ED379A20, &__block_literal_global_51_3);
  v4 = (id)qword_1ED379A28;
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5 ^ 1u;
}

- (uint64_t)hf_shouldCaptureInActionSets
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (!objc_msgSend(a1, "hf_isReadable") || !objc_msgSend(a1, "hf_isWritable"))
    return 0;
  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "hf_shouldCaptureCharacteristicTypeInActionSets:", v3);

  return v4;
}

- (uint64_t)hf_shouldValidateActionTargetValues
{
  id v2;
  void *v3;
  uint64_t v4;

  if (qword_1ED379A30 != -1)
    dispatch_once(&qword_1ED379A30, &__block_literal_global_53_2);
  v2 = (id)qword_1ED379A38;
  objc_msgSend(a1, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (HFMultiStateValueSet)hf_programmableSwitchValidValueSet
{
  void *v2;
  HFMultiStateValueSet *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD aBlock[4];
  id v22;
  id location;

  objc_msgSend(a1, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[HFMultiStateValueSet initWithCharacteristicMetadata:]([HFMultiStateValueSet alloc], "initWithCharacteristicMetadata:", v2);
  objc_msgSend(a1, "characteristicType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB8908]);

  if ((v5 & 1) == 0)
  {
    NSLog(CFSTR("Method called from non-programmable switch; Bailing."), 0);
    goto LABEL_14;
  }
  objc_initWeak(&location, a1);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__HMCharacteristic_Additions__hf_programmableSwitchValidValueSet__block_invoke;
  aBlock[3] = &unk_1EA73AF78;
  objc_copyWeak(&v22, &location);
  v6 = _Block_copy(aBlock);
  objc_msgSend(v2, "validValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "validValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
    goto LABEL_11;
  objc_msgSend(v2, "format");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB8730]);

  if (v10)
  {
    objc_msgSend(v2, "minimumValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11)
      v11 = &unk_1EA7CCE98;
    v13 = objc_msgSend(v11, "integerValue");

    objc_msgSend(v2, "maximumValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14)
      v14 = &unk_1EA7CCEB0;
    v16 = objc_msgSend(v14, "integerValue");

    objc_msgSend(v2, "stepValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (!v17)
      v17 = &unk_1EA7CCE38;
    v19 = objc_msgSend(v17, "integerValue");

    objc_msgSend(MEMORY[0x1E0C99D20], "hf_arrayWithNumbersInRange:stride:", v13, v16 - v13, v19);
    v8 = v7;
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  }
  -[HFMultiStateValueSet addValuesFromArray:displayResultsGenerator:](v3, "addValuesFromArray:displayResultsGenerator:", v7, v6);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
LABEL_14:

  return v3;
}

- (id)hf_home
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "service");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hf_eventTriggers
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "hf_home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "triggers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__HMCharacteristic_Additions__hf_eventTriggers__block_invoke;
  v10[3] = &unk_1EA73AFC8;
  v10[4] = a1;
  objc_msgSend(v4, "na_filter:", v10);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1E0C9AA60];
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  objc_msgSend(v2, "addObjectsFromArray:", v8);
  return v2;
}

- (id)hf_eventTriggersForTriggerValue:()Additions
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v15;
  _QWORD v16[5];
  id v17;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HMCharacteristic+HFAdditions.m"), 478, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("triggerValue"));

  }
  v6 = (void *)objc_opt_new();
  objc_msgSend(a1, "hf_home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "triggers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__HMCharacteristic_Additions__hf_eventTriggersForTriggerValue___block_invoke;
  v16[3] = &unk_1EA73B018;
  v16[4] = a1;
  v17 = v5;
  v9 = v5;
  objc_msgSend(v8, "na_filter:", v16);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = (void *)MEMORY[0x1E0C9AA60];
  if (v10)
    v12 = (void *)v10;
  v13 = v12;

  objc_msgSend(v6, "addObjectsFromArray:", v13);
  return v6;
}

- (id)hf_designatedEventTriggerForProgrammableSwitchWithTriggerValue:()Additions
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "hf_eventTriggersForTriggerValue:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_72_3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "count") >= 2)
    NSLog(CFSTR("HomeApp somehow created two event triggers for one programmable switch characteristic.  That's bad."));
  if (objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(v2, "anyObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)objc_msgSend(v1, "mutableCopy");
    objc_msgSend(v4, "minusSet:", v2);
    if (objc_msgSend(v4, "count") == 1)
    {
      objc_msgSend(v4, "anyObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (id)hf_programmableSwitchTriggerValueToEventTriggersMap
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  objc_msgSend(a1, "hf_eventTriggers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(a1, "hf_programmableSwitchValidValueSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __82__HMCharacteristic_Additions__hf_programmableSwitchTriggerValueToEventTriggersMap__block_invoke;
    v10[3] = &unk_1EA73B0D0;
    v6 = v3;
    v11 = v6;
    v12 = v2;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

    v7 = v12;
    v8 = v6;

  }
  else
  {
    v8 = (id)MEMORY[0x1E0C9AA70];
  }

  return v8;
}

- (id)hf_valueBeforeTriggerValue:()Additions
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "hf_triggerValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)objc_opt_class(), "hf_indexOfSortedValues:closestToValue:", v5, v4);

  if ((unint64_t)(v6 - 1) > 0x7FFFFFFFFFFFFFFDLL)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)hf_valueAfterTriggerValue:()Additions
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "hf_triggerValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)objc_opt_class(), "hf_indexOfSortedValues:closestToValue:", v5, v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL || v6 >= objc_msgSend(v5, "count") - 1)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v6 + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)hf_thresholdValueForRange:()Additions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;

  v4 = a3;
  objc_msgSend(v4, "minValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maxValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "minValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5 != v6)
  {
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(a1, "hf_minimumTriggerValue");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    objc_msgSend(v4, "maxValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(a1, "hf_maximumTriggerValue");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;

    objc_msgSend(a1, "hf_minimumTriggerValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "compare:", v15))
    {

    }
    else
    {
      objc_msgSend(a1, "hf_maximumTriggerValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v14, "compare:", v17);

      if (v18)
      {
        objc_msgSend(a1, "hf_valueAfterTriggerValue:", v14);
        v19 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
    }
    objc_msgSend(a1, "hf_maximumTriggerValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "compare:", v16))
    {

LABEL_12:
      v8 = 0;
LABEL_18:

      goto LABEL_19;
    }
    objc_msgSend(a1, "hf_minimumTriggerValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v10, "compare:", v20);

    if (!v21)
      goto LABEL_12;
    objc_msgSend(a1, "hf_valueBeforeTriggerValue:", v10);
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v8 = (void *)v19;
    goto LABEL_18;
  }
LABEL_19:

  return v8;
}

- (id)hf_minimumTriggerValue
{
  void *v2;
  char v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "characteristicType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB87B0]);

  if ((v3 & 1) != 0)
  {
    v4 = &unk_1EA7CCEC8;
  }
  else
  {
    objc_msgSend(a1, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "minimumValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)hf_maximumTriggerValue
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "maximumValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_triggerValues
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  float v18;
  double v19;
  void *v20;
  void *v21;

  objc_msgSend(a1, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "hf_isNumeric") & 1) == 0
    || (objc_msgSend(a1, "hf_minimumTriggerValue"), (v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_10;
  }
  v4 = (void *)v3;
  objc_msgSend(a1, "hf_maximumTriggerValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_10:
    v9 = 0;
    return v9;
  }
  objc_msgSend(a1, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "format");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB8700]);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_hf_stepValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v12 = v11;

    objc_msgSend(a1, "hf_minimumTriggerValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    v15 = v14;

    objc_msgSend(a1, "hf_maximumTriggerValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "floatValue");
    v18 = v17;

    for (; v15 <= v18; v15 = v12 + v15)
    {
      *(float *)&v19 = v15;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v20);

    }
    if ((float)(v15 - v12) < v18)
    {
      *(float *)&v19 = v18;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v21);

    }
  }
  else
  {
    objc_msgSend(a1, "_hf_triggerValuesWithMinStepValue:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)hf_visibleTriggerValues
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "characteristicType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB8860]);

  if (v3)
  {
    objc_msgSend(a1, "_hf_lightLevelVisibleTriggerValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_hf_valueRangeCharacteristicTypeToVisibleTriggerValueStepMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "characteristicType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(a1, "_hf_triggerValuesWithMinStepValue:", v7);
    else
      objc_msgSend(a1, "hf_triggerValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (uint64_t)hf_indexOfSortedValues:()Additions closestToValue:
{
  id v6;
  id v7;
  uint64_t v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
    v8 = objc_msgSend(a1, "_hf_indexOfSortedValues:closestToValue:top:bottom:", v6, v7, objc_msgSend(v6, "count") - 1, 0);
  else
    v8 = 0x7FFFFFFFFFFFFFFFLL;

  return v8;
}

+ (uint64_t)_hf_indexOfSortedValues:()Additions closestToValue:top:bottom:
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  unint64_t v32;

  v10 = a3;
  v11 = a4;
  if (objc_msgSend(v10, "count"))
  {
    v12 = vcvtpd_u64_f64((double)(a5 - a6) * 0.5 + (double)a6);
    objc_msgSend(v10, "objectAtIndexedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (a5 - a6 <= 1)
    {
      v15 = v12 - 1;
      v16 = v12 + 1;
      v17 = objc_msgSend(v10, "count") - 1;
      if (v12 + 1 < v17)
        v17 = v12 + 1;
      while (v15 <= v17)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "doubleValue");
        v21 = v20;
        objc_msgSend(v11, "doubleValue");
        v23 = vabdd_f64(v21, v22);
        objc_msgSend(v19, "doubleValue");
        v25 = v24;
        objc_msgSend(v11, "doubleValue");
        if (v23 < vabdd_f64(v25, v26))
          v12 = v15;

        ++v15;
        v17 = objc_msgSend(v10, "count") - 1;
        if (v16 < v17)
          v17 = v16;
      }
      goto LABEL_17;
    }
    v27 = objc_msgSend(v13, "compare:", v11);
    if (v27 == -1)
    {
      v28 = a1;
      v29 = v10;
      v30 = v11;
      v31 = a5;
      v32 = v12;
    }
    else
    {
      if (v27 != 1)
      {
LABEL_17:

        goto LABEL_18;
      }
      v28 = a1;
      v29 = v10;
      v30 = v11;
      v31 = v12;
      v32 = a6;
    }
    v12 = objc_msgSend(v28, "_hf_indexOfSortedValues:closestToValue:top:bottom:", v29, v30, v31, v32);
    goto LABEL_17;
  }
  v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_18:

  return v12;
}

- (id)_hf_lightLevelVisibleTriggerValues
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend((id)objc_opt_class(), "_hf_visibleLightLevelTriggerValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__HMCharacteristic_Additions___hf_lightLevelVisibleTriggerValues__block_invoke;
  v5[3] = &unk_1EA72AD88;
  v5[4] = a1;
  objc_msgSend(v2, "na_map:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_hf_triggerValuesWithMinStepValue:()Additions
{
  id v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  void *v21;
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __65__HMCharacteristic_Additions___hf_triggerValuesWithMinStepValue___block_invoke;
  v20 = &unk_1EA73B0F8;
  v21 = a1;
  v6 = v4;
  v22 = v6;
  v7 = __65__HMCharacteristic_Additions___hf_triggerValuesWithMinStepValue___block_invoke((uint64_t)&v17);
  objc_msgSend(a1, "hf_minimumTriggerValue", v17, v18, v19, v20, v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "intValue");

  objc_msgSend(a1, "hf_maximumTriggerValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue");

  if ((int)v9 <= v11)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v12);

      v9 = (v9 + v7);
      objc_msgSend(a1, "hf_maximumTriggerValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "intValue");

    }
    while ((int)v9 <= v14);
  }
  v15 = (void *)objc_msgSend(v5, "copy");

  return v15;
}

- (id)_hf_stepValue
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  float v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  float v15;
  float v16;
  double v17;
  uint64_t v18;

  objc_msgSend(a1, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stepValue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &unk_1EA7CDEC8;
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  objc_msgSend(a1, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "format");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB8700]);

  if (v9)
  {
    objc_msgSend(v6, "floatValue");
    if (v10 < 0.01)
    {

      v6 = &unk_1EA7CDED8;
    }
    objc_msgSend(a1, "hf_maximumTriggerValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    v13 = v12;
    objc_msgSend(a1, "hf_minimumTriggerValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    v16 = vabds_f32(v13, v15);

    objc_msgSend(v6, "floatValue");
    if ((float)(v16 / *(float *)&v17) > 10000.0)
    {
      *(float *)&v17 = v16 / 10000.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v18;
    }
  }
  return v6;
}

+ (id)_hf_visibleLightLevelTriggerValues
{
  if (qword_1ED379A40 != -1)
    dispatch_once(&qword_1ED379A40, &__block_literal_global_83);
  return (id)qword_1ED379A48;
}

@end
