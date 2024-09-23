@implementation NSFormatter

id __126__NSFormatter_HFCharacteristicValueFormatting__hf_controlDescriptionFormatterForCharacteristicType_withMetadata_options_form___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  __CFString *v5;

  v2 = a2;
  _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicValuePowerStateOn"), CFSTR("HFCharacteristicValuePowerStateOn"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if (v4)
    v5 = CFSTR("HFCharacteristicTitlePowerStateOn");
  else
    v5 = CFSTR("HFCharacteristicTitlePowerStateOff");
  _HFLocalizedStringWithDefaultValue(v5, v5, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __71__NSFormatter_HFCharacteristicValueFormatting___hf_powerStateFormatter__block_invoke()
{
  _QWORD v1[2];
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v1[0] = MEMORY[0x1E0C9AAB0];
  v1[1] = MEMORY[0x1E0C9AAA0];
  v2[0] = CFSTR("HFCharacteristicValuePowerStateOn");
  v2[1] = CFSTR("HFCharacteristicValuePowerStateOff");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __111__NSFormatter_HFCharacteristicValueFormatting___hf_customValueFormatterForCharacteristicType_metadata_options___block_invoke_8()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB8908];
  v5[0] = *MEMORY[0x1E0CB8998];
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED379DD0;
  qword_1ED379DD0 = v3;

}

void __111__NSFormatter_HFCharacteristicValueFormatting___hf_customValueFormatterForCharacteristicType_metadata_options___block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB8AF0];
  v5[0] = *MEMORY[0x1E0CB8878];
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED379DA0;
  qword_1ED379DA0 = v3;

}

id __79__NSFormatter_HFCharacteristicValueFormatting___hf_lockMechanismStateFormatter__block_invoke()
{
  _QWORD v1[4];
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v1[0] = &unk_1EA7CD4B0;
  v1[1] = &unk_1EA7CD4C8;
  v2[0] = CFSTR("HFCharacteristicValueLockMechanismStateUnsecured");
  v2[1] = CFSTR("HFCharacteristicValueLockMechanismStateSecured");
  v1[2] = &unk_1EA7CD4E0;
  v1[3] = &unk_1EA7CD4F8;
  v2[2] = CFSTR("HFCharacteristicValueLockMechanismStateJammed");
  v2[3] = CFSTR("HFCharacteristicValueLockMechanismStateUnknown");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __111__NSFormatter_HFCharacteristicValueFormatting___hf_customValueFormatterForCharacteristicType_metadata_options___block_invoke_6()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB8800];
  v6[0] = *MEMORY[0x1E0CB87F8];
  v6[1] = v1;
  v2 = *MEMORY[0x1E0CB87E8];
  v6[2] = *MEMORY[0x1E0CB87E0];
  v6[3] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED379DC0;
  qword_1ED379DC0 = v4;

}

id __70__NSFormatter_HFCharacteristicValueFormatting___hf_doorStateFormatter__block_invoke()
{
  _QWORD v1[5];
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v1[0] = &unk_1EA7CD4B0;
  v1[1] = &unk_1EA7CD4C8;
  v2[0] = CFSTR("HFCharacteristicValueDoorStateOpen");
  v2[1] = CFSTR("HFCharacteristicValueDoorStateClosed");
  v1[2] = &unk_1EA7CD4E0;
  v1[3] = &unk_1EA7CD4F8;
  v2[2] = CFSTR("HFCharacteristicValueDoorStateOpening");
  v2[3] = CFSTR("HFCharacteristicValueDoorStateClosing");
  v1[4] = &unk_1EA7CD510;
  v2[4] = CFSTR("HFCharacteristicValueDoorStateStopped");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __111__NSFormatter_HFCharacteristicValueFormatting___hf_customValueFormatterForCharacteristicType_metadata_options___block_invoke_10()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB8978];
  v7[0] = *MEMORY[0x1E0CB89A0];
  v7[1] = v1;
  v2 = *MEMORY[0x1E0CB89B0];
  v7[2] = *MEMORY[0x1E0CB8A70];
  v7[3] = v2;
  v3 = *MEMORY[0x1E0CB8B30];
  v7[4] = *MEMORY[0x1E0CB89A8];
  v7[5] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ED379DE0;
  qword_1ED379DE0 = v5;

}

void __126__NSFormatter_HFCharacteristicValueFormatting__hf_controlDescriptionFormatterForCharacteristicType_withMetadata_options_form___block_invoke_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[9];

  v8[8] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB8838];
  v8[0] = *MEMORY[0x1E0CB8AA8];
  v8[1] = v1;
  v2 = *MEMORY[0x1E0CB8868];
  v8[2] = *MEMORY[0x1E0CB8AE0];
  v8[3] = v2;
  v3 = *MEMORY[0x1E0CB8888];
  v8[4] = *MEMORY[0x1E0CB8B00];
  v8[5] = v3;
  v4 = *MEMORY[0x1E0CB8918];
  v8[6] = *MEMORY[0x1E0CB8830];
  v8[7] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)qword_1ED379DF0;
  qword_1ED379DF0 = v6;

}

void __111__NSFormatter_HFCharacteristicValueFormatting___hf_customValueFormatterForCharacteristicType_metadata_options___block_invoke_4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[12];

  v9[11] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB87F0];
  v9[0] = *MEMORY[0x1E0CB87D8];
  v9[1] = v1;
  v2 = *MEMORY[0x1E0CB8930];
  v9[2] = *MEMORY[0x1E0CB8808];
  v9[3] = v2;
  v3 = *MEMORY[0x1E0CB8A08];
  v9[4] = *MEMORY[0x1E0CB8988];
  v9[5] = v3;
  v4 = *MEMORY[0x1E0CB8A50];
  v9[6] = *MEMORY[0x1E0CB8A38];
  v9[7] = v4;
  v5 = *MEMORY[0x1E0CB8A60];
  v9[8] = *MEMORY[0x1E0CB8A58];
  v9[9] = v5;
  v9[10] = *MEMORY[0x1E0CB8A68];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_1ED379DB0;
  qword_1ED379DB0 = v7;

}

__CFString *__90__NSFormatter_HFCharacteristicValueFormatting___hf_positionFormatterWithMetadata_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    v5 = objc_msgSend(v3, "integerValue");
    if (v5)
    {
      if (v5 != 100)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFFormatterPositionIntermediate_%@"), *(_QWORD *)(a1 + 32));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "stringForObjectValue:", v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        HFLocalizedStringWithFormat(v7, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v8);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFFormatterPositionOpen_%@"), *(_QWORD *)(a1 + 32));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFFormatterPositionClosed_%@"), *(_QWORD *)(a1 + 32));
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _HFLocalizedStringWithDefaultValue(v7, v7, 1);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_9:

    goto LABEL_10;
  }
  v6 = &stru_1EA741FF8;
LABEL_10:

  return v6;
}

id __83__NSFormatter_HFCharacteristicValueFormatting___hf_filterChangeIndicationFormatter__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  __CFString *v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;

  v2 = a2;
  objc_opt_class();
  v3 = CFSTR("HFFormatterFilterChangeIndicationUnknown");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(v2, "integerValue");
    v5 = CFSTR("HFFormatterFilterChangeIndicationChangeSoon");
    if (v4 != 1)
      v5 = CFSTR("HFFormatterFilterChangeIndicationUnknown");
    if (v4)
      v3 = (__CFString *)v5;
    else
      v3 = CFSTR("HFFormatterFilterChangeIndicationGood");
  }
  _HFLocalizedStringWithDefaultValue(v3, v3, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __76__NSFormatter_HFCharacteristicValueFormatting___hf_partsPerMillionFormatter__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v11;

  v2 = a2;
  _HFLocalizedStringWithDefaultValue(CFSTR("HFFormatterPartsPerMillionUnit"), CFSTR("HFFormatterPartsPerMillionUnit"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HFLocalizedStringWithFormat(CFSTR("HFFormatterPartsPerMillionFormatString"), CFSTR("%@%@"), v3, v4, v5, v6, v7, v8, (uint64_t)v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __84__NSFormatter_HFCharacteristicValueFormatting___hf_microgramsPerMeterCubedFormatter__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v11;

  v2 = a2;
  _HFLocalizedStringWithDefaultValue(CFSTR("HFFormatterMicrogramsPerCubicMeterUnit"), CFSTR("HFFormatterMicrogramsPerCubicMeterUnit"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HFLocalizedStringWithFormat(CFSTR("HFFormatterMicrogramsPerCubicMeterFormatString"), CFSTR("%@%@"), v3, v4, v5, v6, v7, v8, (uint64_t)v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __75__NSFormatter_HFCharacteristicValueFormatting___hf_heatingCoolingFormatter__block_invoke()
{
  _QWORD v1[4];
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v1[0] = &unk_1EA7CD4B0;
  v1[1] = &unk_1EA7CD4C8;
  v2[0] = CFSTR("HFCharacteristicValueHeatingCoolingOff");
  v2[1] = CFSTR("HFCharacteristicValueHeatingCoolingHeat");
  v1[2] = &unk_1EA7CD4E0;
  v1[3] = &unk_1EA7CD4F8;
  v2[2] = CFSTR("HFCharacteristicValueHeatingCoolingCool");
  v2[3] = CFSTR("HFCharacteristicValueHeatingCoolingAuto");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __78__NSFormatter_HFCharacteristicValueFormatting___hf_rotationDirectionFormatter__block_invoke()
{
  _QWORD v1[2];
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v1[0] = &unk_1EA7CD4B0;
  v1[1] = &unk_1EA7CD4C8;
  v2[0] = CFSTR("HFCharacteristicValueRotationDirectionClockwise");
  v2[1] = CFSTR("HFCharacteristicValueRotationDirectionCounterClockwise");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __76__NSFormatter_HFCharacteristicValueFormatting___hf_temperatureUnitFormatter__block_invoke()
{
  _QWORD v1[2];
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v1[0] = &unk_1EA7CD4B0;
  v1[1] = &unk_1EA7CD4C8;
  v2[0] = CFSTR("HFCharacteristicValueTemperatureUnitCelsius");
  v2[1] = CFSTR("HFCharacteristicValueTemperatureUnitFahrenheit");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __79__NSFormatter_HFCharacteristicValueFormatting___hf_airParticulateSizeFormatter__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v18[0] = &unk_1EA7CD4B0;
  HFLocalizedStringWithFormat(CFSTR("HFCharacteristicValueAirParticulateSize2_5"), CFSTR("%.1f"), a3, a4, a5, a6, a7, a8, 0x4004000000000000);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = &unk_1EA7CD4C8;
  v19[0] = v8;
  HFLocalizedStringWithFormat(CFSTR("HFCharacteristicValueAirParticulateSize10"), CFSTR("%d"), v9, v10, v11, v12, v13, v14, 10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __71__NSFormatter_HFCharacteristicValueFormatting___hf_airQualityFormatter__block_invoke()
{
  _QWORD v1[6];
  _QWORD v2[7];

  v2[6] = *MEMORY[0x1E0C80C00];
  v1[0] = &unk_1EA7CD4B0;
  v1[1] = &unk_1EA7CD4C8;
  v2[0] = CFSTR("HFCharacteristicValueAirQualityUnknown");
  v2[1] = CFSTR("HFCharacteristicValueAirQualityExcellent");
  v1[2] = &unk_1EA7CD4E0;
  v1[3] = &unk_1EA7CD4F8;
  v2[2] = CFSTR("HFCharacteristicValueAirQualityGood");
  v2[3] = CFSTR("HFCharacteristicValueAirQualityFair");
  v1[4] = &unk_1EA7CD510;
  v1[5] = &unk_1EA7CD528;
  v2[4] = CFSTR("HFCharacteristicValueAirQualityInferior");
  v2[5] = CFSTR("HFCharacteristicValueAirQualityPoor");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __74__NSFormatter_HFCharacteristicValueFormatting___hf_positionStateFormatter__block_invoke()
{
  _QWORD v1[3];
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  v1[0] = &unk_1EA7CD4B0;
  v1[1] = &unk_1EA7CD4C8;
  v2[0] = CFSTR("HFCharacteristicValuePositionStateClosing");
  v2[1] = CFSTR("HFCharacteristicValuePositionStateOpening");
  v1[2] = &unk_1EA7CD4E0;
  v2[2] = CFSTR("HFCharacteristicValuePositionStateStopped");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __87__NSFormatter_HFCharacteristicValueFormatting___hf_currentSecuritySystemStateFormatter__block_invoke()
{
  _QWORD v1[5];
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v1[0] = &unk_1EA7CD4B0;
  v1[1] = &unk_1EA7CD4C8;
  v2[0] = CFSTR("HFCharacteristicValueCurrentSecuritySystemStateStayArm");
  v2[1] = CFSTR("HFCharacteristicValueCurrentSecuritySystemStateAwayArm");
  v1[2] = &unk_1EA7CD4E0;
  v1[3] = &unk_1EA7CD4F8;
  v2[2] = CFSTR("HFCharacteristicValueCurrentSecuritySystemStateNightArm");
  v2[3] = CFSTR("HFCharacteristicValueCurrentSecuritySystemStateDisarmed");
  v1[4] = &unk_1EA7CD510;
  v2[4] = CFSTR("HFCharacteristicValueCurrentSecuritySystemStateTriggered");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __86__NSFormatter_HFCharacteristicValueFormatting___hf_targetSecuritySystemStateFormatter__block_invoke()
{
  _QWORD v1[4];
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v1[0] = &unk_1EA7CD4B0;
  v1[1] = &unk_1EA7CD4C8;
  v2[0] = CFSTR("HFCharacteristicValueTargetSecuritySystemStateStayArm");
  v2[1] = CFSTR("HFCharacteristicValueTargetSecuritySystemStateAwayArm");
  v1[2] = &unk_1EA7CD4E0;
  v1[3] = &unk_1EA7CD4F8;
  v2[2] = CFSTR("HFCharacteristicValueTargetSecuritySystemStateNightArm");
  v2[3] = CFSTR("HFCharacteristicValueTargetSecuritySystemStateDisarm");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __78__NSFormatter_HFCharacteristicValueFormatting___hf_contactStateStateFormatter__block_invoke()
{
  _QWORD v1[2];
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v1[0] = &unk_1EA7CD540;
  v1[1] = &unk_1EA7CD558;
  v2[0] = CFSTR("HFCharacteristicValueContactStateContactDetected");
  v2[1] = CFSTR("HFCharacteristicValueContactStateContactNotDetected");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __84__NSFormatter_HFCharacteristicValueFormatting___hf_currentAirPurifierStateFormatter__block_invoke()
{
  _QWORD v1[3];
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  v1[0] = &unk_1EA7CD4B0;
  v1[1] = &unk_1EA7CD4C8;
  v2[0] = CFSTR("HFCharacteristicValueCurrentAirPurifierStateInactive");
  v2[1] = CFSTR("HFCharacteristicValueCurrentAirPurifierStateIdle");
  v1[2] = &unk_1EA7CD4E0;
  v2[2] = CFSTR("HFCharacteristicValueCurrentAirPurifierStateActive");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __79__NSFormatter_HFCharacteristicValueFormatting___hf_configurationStateFormatter__block_invoke()
{
  _QWORD v1[2];
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v1[0] = &unk_1EA7CD4B0;
  v1[1] = &unk_1EA7CD4C8;
  v2[0] = CFSTR("HFCharacteristicValueConfigurationStateNotConfigured");
  v2[1] = CFSTR("HFCharacteristicValueConfigurationStateConfigured");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __126__NSFormatter_HFCharacteristicValueFormatting__hf_controlDescriptionFormatterForCharacteristicType_withMetadata_options_form___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 40), "_hf_controlDescriptionForDetectionCharacteristicOfType:withValue:valueDescription:form:", *(_QWORD *)(a1 + 32), a3, a2, *(_QWORD *)(a1 + 48));
}

id __126__NSFormatter_HFCharacteristicValueFormatting__hf_controlDescriptionFormatterForCharacteristicType_withMetadata_options_form___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v12;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "objectForKey:", CFSTR("roomName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HFLocalizedStringWithFormat(CFSTR("HFCharacteristicDescriptionFormatHumiditySensor"), CFSTR("%@%@"), v4, v5, v6, v7, v8, v9, (uint64_t)v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __126__NSFormatter_HFCharacteristicValueFormatting__hf_controlDescriptionFormatterForCharacteristicType_withMetadata_options_form___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v12;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "objectForKey:", CFSTR("roomName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HFLocalizedStringWithFormat(CFSTR("HFCharacteristicDescriptionFormatTemperatureSensor"), CFSTR("%@%@"), v4, v5, v6, v7, v8, v9, (uint64_t)v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __126__NSFormatter_HFCharacteristicValueFormatting__hf_controlDescriptionFormatterForCharacteristicType_withMetadata_options_form___block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v12;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "objectForKey:", CFSTR("roomName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HFLocalizedStringWithFormat(CFSTR("HFCharacteristicDescriptionFormatLightSensor"), CFSTR("%@%@"), v4, v5, v6, v7, v8, v9, (uint64_t)v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __126__NSFormatter_HFCharacteristicValueFormatting__hf_controlDescriptionFormatterForCharacteristicType_withMetadata_options_form___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return HFLocalizedStringWithFormat(CFSTR("HFCharacteristicDescriptionFormatWaterLevel"), CFSTR("%@"), a3, a4, a5, a6, a7, a8, a2);
}

id __126__NSFormatter_HFCharacteristicValueFormatting__hf_controlDescriptionFormatterForCharacteristicType_withMetadata_options_form___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return HFLocalizedStringWithFormat(CFSTR("HFCharacteristicDescriptionFormatTitleValue"), CFSTR("%@%@"), a3, a4, a5, a6, a7, a8, a2);
}

void __86__NSFormatter_HFCharacteristicValueFormatting___hf_controlTitleForCharacteristicType___block_invoke_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[7];
  _QWORD v6[8];

  v6[7] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB89C8];
  v5[0] = *MEMORY[0x1E0CB87C0];
  v5[1] = v0;
  v6[0] = CFSTR("HFCharacteristicTitleBrightness");
  v6[1] = CFSTR("HFCharacteristicTitlePowerState");
  v1 = *MEMORY[0x1E0CB89F0];
  v5[2] = *MEMORY[0x1E0CB8790];
  v5[3] = v1;
  v6[2] = CFSTR("HFCharacteristicTitleActive");
  v6[3] = CFSTR("HFCharacteristicTitleRotationSpeed");
  v2 = *MEMORY[0x1E0CB8AE0];
  v5[4] = *MEMORY[0x1E0CB8AA8];
  v5[5] = v2;
  v6[4] = CFSTR("HFCharacteristicTitleDoorState");
  v6[5] = CFSTR("HFCharacteristicTitleLockState");
  v5[6] = *MEMORY[0x1E0CB8B00];
  v6[6] = CFSTR("HFCharacteristicTitleSecuritySystemState");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 7);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED379E00;
  qword_1ED379E00 = v3;

}

@end
