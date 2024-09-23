@implementation HFCharacteristicGroup

+ (id)_targetCurrentStateCharacteristicTypeMap
{
  if (qword_1ED379BD8 != -1)
    dispatch_once(&qword_1ED379BD8, &__block_literal_global_201);
  return (id)_MergedGlobals_307;
}

void __65__HFCharacteristicGroup__targetCurrentStateCharacteristicTypeMap__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[9];
  _QWORD v15[10];

  v15[9] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB8890];
  v1 = *MEMORY[0x1E0CB8AC0];
  v14[0] = *MEMORY[0x1E0CB8B08];
  v14[1] = v1;
  v2 = *MEMORY[0x1E0CB8848];
  v15[0] = v0;
  v15[1] = v2;
  v3 = *MEMORY[0x1E0CB8880];
  v4 = *MEMORY[0x1E0CB8AA8];
  v14[2] = *MEMORY[0x1E0CB8AF8];
  v14[3] = v4;
  v5 = *MEMORY[0x1E0CB8838];
  v15[2] = v3;
  v15[3] = v5;
  v6 = *MEMORY[0x1E0CB8868];
  v7 = *MEMORY[0x1E0CB8AC8];
  v14[4] = *MEMORY[0x1E0CB8AE0];
  v14[5] = v7;
  v8 = *MEMORY[0x1E0CB8850];
  v15[4] = v6;
  v15[5] = v8;
  v9 = *MEMORY[0x1E0CB8878];
  v10 = *MEMORY[0x1E0CB8B00];
  v14[6] = *MEMORY[0x1E0CB8AF0];
  v14[7] = v10;
  v11 = *MEMORY[0x1E0CB8888];
  v15[6] = v9;
  v15[7] = v11;
  v14[8] = *MEMORY[0x1E0CB8B10];
  v15[8] = *MEMORY[0x1E0CB8898];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 9);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)_MergedGlobals_307;
  _MergedGlobals_307 = v12;

}

+ (id)_currentTargetStateCharacteristicTypeMap
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__HFCharacteristicGroup__currentTargetStateCharacteristicTypeMap__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED379BE8 != -1)
    dispatch_once(&qword_1ED379BE8, block);
  return (id)qword_1ED379BE0;
}

void __65__HFCharacteristicGroup__currentTargetStateCharacteristicTypeMap__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "_targetCurrentStateCharacteristicTypeMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__HFCharacteristicGroup__currentTargetStateCharacteristicTypeMap__block_invoke_2;
  v7[3] = &unk_1EA73D6E0;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  v5 = (void *)qword_1ED379BE0;
  qword_1ED379BE0 = (uint64_t)v4;
  v6 = v4;

}

uint64_t __65__HFCharacteristicGroup__currentTargetStateCharacteristicTypeMap__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a3);
}

+ (id)_targetCurrentStateCharacteristicGroups
{
  if (qword_1ED379BF8 != -1)
    dispatch_once(&qword_1ED379BF8, &__block_literal_global_3_15);
  return (id)qword_1ED379BF0;
}

void __64__HFCharacteristicGroup__targetCurrentStateCharacteristicGroups__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  v12 = (void *)MEMORY[0x1E0C99E60];
  HFNewTargetCurrentGroup(CFSTR("DoorState"), CFSTR("HFCharacteristicGroupTitleDoorState"), (void *)*MEMORY[0x1E0CB8AA8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v0;
  HFNewTargetCurrentGroup(CFSTR("HeatingCooling"), CFSTR("HFCharacteristicGroupTitleHeatingCooling"), (void *)*MEMORY[0x1E0CB8AC0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v1;
  HFNewTargetCurrentGroup(CFSTR("LockMechanismState"), CFSTR("HFCharacteristicGroupTitleLockMechanismState"), (void *)*MEMORY[0x1E0CB8AE0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v2;
  HFNewTargetCurrentGroup(CFSTR("HorizontalTilt"), CFSTR("HFCharacteristicGroupTitleHorizontalTilt"), (void *)*MEMORY[0x1E0CB8AC8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v3;
  HFNewTargetCurrentGroup(CFSTR("Position"), CFSTR("HFCharacteristicGroupTitlePosition"), (void *)*MEMORY[0x1E0CB8AF0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v4;
  HFNewTargetCurrentGroup(CFSTR("RelativeHumidity"), CFSTR("HFCharacteristicGroupTitleRelativeHumidity"), (void *)*MEMORY[0x1E0CB8AF8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v5;
  HFNewTargetCurrentGroup(CFSTR("SecuritySystemState"), CFSTR("HFCharacteristicGroupTitleSecuritySystemState"), (void *)*MEMORY[0x1E0CB8B00]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v6;
  HFNewTargetCurrentGroup(CFSTR("Temperature"), CFSTR("HFCharacteristicGroupTitleTemperature"), (void *)*MEMORY[0x1E0CB8B08]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[7] = v7;
  HFNewTargetCurrentGroup(CFSTR("VerticalTilt"), CFSTR("HFCharacteristicGroupTitleVerticalTilt"), (void *)*MEMORY[0x1E0CB8B10]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[8] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)qword_1ED379BF0;
  qword_1ED379BF0 = v10;

}

+ (id)allCharacteristicGroups
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__HFCharacteristicGroup_allCharacteristicGroups__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED379C08 != -1)
    dispatch_once(&qword_1ED379C08, block);
  return (id)qword_1ED379C00;
}

void __48__HFCharacteristicGroup_allCharacteristicGroups__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  HFCharacteristicGroup *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HFCharacteristicGroup *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  HFCharacteristicGroup *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  HFCharacteristicGroup *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  HFCharacteristicGroup *v25;
  void *v26;
  void *v27;
  HFCharacteristicGroup *v28;
  id v29;
  HFCharacteristicGroup *v30;
  void *v31;
  void *v32;
  HFCharacteristicGroup *v33;
  uint64_t v34;
  id v35;
  HFCharacteristicGroup *v36;
  void *v37;
  void *v38;
  HFCharacteristicGroup *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  HFCharacteristicGroup *v47;
  HFCharacteristicGroup *v48;
  id v49;
  HFCharacteristicGroup *v50;
  id v51;
  HFCharacteristicGroup *v52;
  id v53;
  void *v54;
  _QWORD v56[2];
  uint64_t v57;
  _QWORD v58[2];
  _QWORD v59[6];
  _QWORD v60[3];
  _QWORD v61[3];
  _QWORD v62[9];
  _QWORD v63[9];

  v63[7] = *MEMORY[0x1E0C80C00];
  v54 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB87A0];
  v62[0] = *MEMORY[0x1E0CB87B0];
  v62[1] = v1;
  v2 = *MEMORY[0x1E0CB89A0];
  v62[2] = *MEMORY[0x1E0CB87A8];
  v62[3] = v2;
  v3 = *MEMORY[0x1E0CB8A70];
  v62[4] = *MEMORY[0x1E0CB8978];
  v62[5] = v3;
  v4 = *MEMORY[0x1E0CB89A8];
  v62[6] = *MEMORY[0x1E0CB89B0];
  v62[7] = v4;
  v62[8] = *MEMORY[0x1E0CB8B30];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 9);
  v53 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [HFCharacteristicGroup alloc];
  _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicGroupTitleAirQuality"), CFSTR("HFCharacteristicGroupTitleAirQuality"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v53);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = -[HFCharacteristicGroup initWithID:title:characteristicTypes:](v5, "initWithID:title:characteristicTypes:", CFSTR("AirQuality"), v6, v7);
  v63[0] = v52;
  v8 = *MEMORY[0x1E0CB87F8];
  v61[0] = *MEMORY[0x1E0CB87F0];
  v61[1] = v8;
  v61[2] = *MEMORY[0x1E0CB8800];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 3);
  v51 = (id)objc_claimAutoreleasedReturnValue();
  v9 = [HFCharacteristicGroup alloc];
  _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicGroupTitleCarbonMonoxide"), CFSTR("HFCharacteristicGroupTitleCarbonMonoxide"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v51);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = -[HFCharacteristicGroup initWithID:title:characteristicTypes:](v9, "initWithID:title:characteristicTypes:", CFSTR("CarbonMonoxide"), v10, v11);
  v63[1] = v50;
  v12 = *MEMORY[0x1E0CB87E0];
  v60[0] = *MEMORY[0x1E0CB87D8];
  v60[1] = v12;
  v60[2] = *MEMORY[0x1E0CB87E8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 3);
  v49 = (id)objc_claimAutoreleasedReturnValue();
  v13 = [HFCharacteristicGroup alloc];
  _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicGroupTitleCarbonDioxide"), CFSTR("HFCharacteristicGroupTitleCarbonDioxide"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v49);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = -[HFCharacteristicGroup initWithID:title:characteristicTypes:](v13, "initWithID:title:characteristicTypes:", CFSTR("CarbonDioxide"), v14, v15);
  v63[2] = v48;
  v16 = *MEMORY[0x1E0CB87B8];
  v59[0] = *MEMORY[0x1E0CB8A60];
  v59[1] = v16;
  v17 = *MEMORY[0x1E0CB8A48];
  v59[2] = *MEMORY[0x1E0CB8808];
  v59[3] = v17;
  v18 = *MEMORY[0x1E0CB8A68];
  v59[4] = *MEMORY[0x1E0CB8A50];
  v59[5] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 6);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v20 = [HFCharacteristicGroup alloc];
  _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicGroupTitleSensorStatus"), CFSTR("HFCharacteristicGroupTitleSensorStatus"), 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = -[HFCharacteristicGroup initWithID:title:characteristicTypes:](v20, "initWithID:title:characteristicTypes:", CFSTR("SensorStatus"), v21, v22);
  v63[3] = v47;
  v23 = *MEMORY[0x1E0CB88C0];
  v58[0] = *MEMORY[0x1E0CB88B8];
  v58[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v25 = [HFCharacteristicGroup alloc];
  _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicGroupTitleFilterStatus"), CFSTR("HFCharacteristicGroupTitleFilterStatus"), 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = -[HFCharacteristicGroup initWithID:title:characteristicTypes:](v25, "initWithID:title:characteristicTypes:", CFSTR("FilterStatus"), v26, v27);
  v63[4] = v28;
  v57 = *MEMORY[0x1E0CB8918];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v30 = [HFCharacteristicGroup alloc];
  _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicGroupTitleIsConfigured"), CFSTR("HFCharacteristicGroupTitleIsConfigured"), 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v29);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = -[HFCharacteristicGroup initWithID:title:characteristicTypes:](v30, "initWithID:title:characteristicTypes:", CFSTR("ConfiguredValve"), v31, v32);
  v63[5] = v33;
  v34 = *MEMORY[0x1E0CB89E0];
  v56[0] = *MEMORY[0x1E0CB8A28];
  v56[1] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
  v35 = (id)objc_claimAutoreleasedReturnValue();
  v36 = [HFCharacteristicGroup alloc];
  _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicGroupTitleSetDuration"), CFSTR("HFCharacteristicGroupTitleSetDuration"), 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v35);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = -[HFCharacteristicGroup initWithID:title:characteristicTypes:](v36, "initWithID:title:characteristicTypes:", CFSTR("Duration"), v37, v38);
  v63[6] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 7);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setWithArray:", v40);
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = (void *)qword_1ED379C00;
  qword_1ED379C00 = v41;

  v43 = (void *)qword_1ED379C00;
  objc_msgSend(*(id *)(a1 + 32), "_targetCurrentStateCharacteristicGroups");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setByAddingObjectsFromSet:", v44);
  v45 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)qword_1ED379C00;
  qword_1ED379C00 = v45;

}

+ (id)groupedTitleForCharacteristicType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "_currentTargetStateCharacteristicTypeMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if (v7)
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicStateGroupedCurrentTitle"), CFSTR("HFCharacteristicStateGroupedCurrentTitle"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (qword_1ED379C18 != -1)
      dispatch_once(&qword_1ED379C18, &__block_literal_global_71);
    objc_msgSend((id)qword_1ED379C10, "objectForKeyedSubscript:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      _HFLocalizedStringWithDefaultValue(v9, v9, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

void __59__HFCharacteristicGroup_groupedTitleForCharacteristicType___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[14];
  _QWORD v10[15];

  v10[14] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB87D8];
  v9[0] = *MEMORY[0x1E0CB87B8];
  v9[1] = v0;
  v10[0] = CFSTR("HFCharacteristicStateGroupedTitleBatteryLevel");
  v10[1] = CFSTR("HFCharacteristicStateGroupedTitleCarbonDioxideDetected");
  v1 = *MEMORY[0x1E0CB87E8];
  v9[2] = *MEMORY[0x1E0CB87E0];
  v9[3] = v1;
  v10[2] = CFSTR("HFCharacteristicStateGroupedTitleCarbonDioxideLevel");
  v10[3] = CFSTR("HFCharacteristicStateGroupedTitleCarbonDioxidePeakLevel");
  v2 = *MEMORY[0x1E0CB87F8];
  v9[4] = *MEMORY[0x1E0CB87F0];
  v9[5] = v2;
  v10[4] = CFSTR("HFCharacteristicStateGroupedTitleCarbonMonoxideDetected");
  v10[5] = CFSTR("HFCharacteristicStateGroupedTitleCarbonMonoxideLevel");
  v3 = *MEMORY[0x1E0CB8808];
  v9[6] = *MEMORY[0x1E0CB8800];
  v9[7] = v3;
  v10[6] = CFSTR("HFCharacteristicStateGroupedTitleCarbonMonoxidePeakLevel");
  v10[7] = CFSTR("HFCharacteristicStateGroupedTitleBatteryCharging");
  v4 = *MEMORY[0x1E0CB8A50];
  v9[8] = *MEMORY[0x1E0CB8A48];
  v9[9] = v4;
  v10[8] = CFSTR("HFCharacteristicStateGroupedTitleStatusActive");
  v10[9] = CFSTR("HFCharacteristicStateGroupedTitleStatusFault");
  v5 = *MEMORY[0x1E0CB8A68];
  v9[10] = *MEMORY[0x1E0CB8A60];
  v9[11] = v5;
  v10[10] = CFSTR("HFCharacteristicStateGroupedTitleStatusLowBattery");
  v10[11] = CFSTR("HFCharacteristicStateGroupedTitleStatusTampered");
  v6 = *MEMORY[0x1E0CB88C0];
  v9[12] = *MEMORY[0x1E0CB88B8];
  v9[13] = v6;
  v10[12] = CFSTR("HFCharacteristicStateGroupedTitleFilterCondition");
  v10[13] = CFSTR("HFCharacteristicStateGroupedTitleFilterLife");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 14);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_1ED379C10;
  qword_1ED379C10 = v7;

}

+ (id)characteristicGroupForCharacteristicType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "allCharacteristicGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__HFCharacteristicGroup_characteristicGroupForCharacteristicType___block_invoke;
  v9[3] = &unk_1EA73D748;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __66__HFCharacteristicGroup_characteristicGroupForCharacteristicType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "characteristicTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (id)characteristicGroupForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "allCharacteristicGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__HFCharacteristicGroup_characteristicGroupForIdentifier___block_invoke;
  v9[3] = &unk_1EA73D748;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __58__HFCharacteristicGroup_characteristicGroupForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (HFCharacteristicGroup)initWithID:(id)a3 title:(id)a4 characteristicTypes:(id)a5
{
  id v9;
  id v10;
  id v11;
  HFCharacteristicGroup *v12;
  HFCharacteristicGroup *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HFCharacteristicGroup;
  v12 = -[HFCharacteristicGroup init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_title, a4);
    objc_storeStrong((id *)&v13->_characteristicTypes, a5);
  }

  return v13;
}

- (HFCharacteristicGroup)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithID_title_characteristicTypes_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicGroup.m"), 221, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFCharacteristicGroup init]",
    v5);

  return 0;
}

- (int64_t)groupSortPriority
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HFCharacteristicGroup characteristicTypes](self, "characteristicTypes", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = -1000;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v8 = objc_msgSend(MEMORY[0x1E0CBA458], "hf_sortPriorityForCharacteristicType:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
        if (v6 <= v8)
          v6 = v8;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = -1000;
  }

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSSet)characteristicTypes
{
  return self->_characteristicTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicTypes, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
