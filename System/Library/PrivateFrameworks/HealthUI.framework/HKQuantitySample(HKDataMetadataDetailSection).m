@implementation HKQuantitySample(HKDataMetadataDetailSection)

- (void)addDetailValuesToSection:()HKDataMetadataDetailSection
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
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
  int v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  __CFString *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  char v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  objc_super v86;
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[4];

  v91[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "displayTypeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sampleType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayTypeForObjectType:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v85 = v4;
  objc_msgSend(v4, "unitController");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "unitForDisplayType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "quantity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValueForUnit:", v8);
  v11 = v10;

  objc_msgSend(v7, "presentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "adjustedValueForDaemonValue:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v82 = v14;
  if (objc_msgSend(v7, "displayTypeIdentifier") == 275)
  {
    objc_msgSend(a1, "quantity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKSleepApneaUtilities localizedTitleForBreathingDisturbances:](HKSleepApneaUtilities, "localizedTitleForBreathingDisturbances:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("LEVEL_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v91[0] = *MEMORY[0x1E0CB5A60];
    v91[1] = CFSTR("Level");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "addText:detail:baseIdentifier:", v16, v18, v20);

    v14 = v82;
  }
  objc_msgSend(MEMORY[0x1E0CB6CD0], "percentUnit");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v8, "isEqual:", v21);

  if (v22)
  {
    objc_msgSend(v7, "objectType");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "code");

    if (v24 == 249)
      +[HKTieredDecimalPrecisionRule numberFormatter](HKTieredDecimalPrecisionRule, "numberFormatter");
    else
      +[HKTieredDecimalPrecisionRule percentageFormatter](HKTieredDecimalPrecisionRule, "percentageFormatter");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    HKFormattedStringFromValueForContext(v14, v7, v84, 0, v25, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "metadata");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0CB5598]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v14;
    v30 = objc_msgSend(v28, "BOOLValue");

    if (v30)
    {
      HKAFibBurdenClampedLowerBoundLocalizedString(v29);
      v31 = objc_claimAutoreleasedReturnValue();

      v83 = v31;
    }
    else
    {
      v83 = (uint64_t)v26;
    }
    goto LABEL_20;
  }
  HKFormattedStringFromValueForContext(v14, v7, v84, 0, 0, 1);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  if ((HKFormatterIncludesUnitForDisplayTypeInContext(v7, 1, v84) & 1) != 0)
  {
    v25 = v25;
    v83 = (uint64_t)v25;
    goto LABEL_20;
  }
  objc_msgSend(v84, "localizedDisplayNameForDisplayType:value:nameContext:", v7, v14, 3);
  v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "displayTypeIdentifier") == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB6CD0], "footUnit");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqual:", v33))
    {

    }
    else
    {
      v75 = objc_msgSend(a1, "_shouldOmitUnitsInSampleDetailViewForDisplayType:", v7);

      if ((v75 & 1) == 0)
        goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (objc_msgSend(a1, "_shouldOmitUnitsInSampleDetailViewForDisplayType:", v7))
  {
LABEL_16:

    v32 = &stru_1E9C4C428;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB6CD0], "decibelAWeightedSoundPressureLevelUnit");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v8, "isEqual:", v34);

  if (v35)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("SPL_DECIBEL_UNIT_LONG_FORM"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v37 = objc_claimAutoreleasedReturnValue();

    v32 = (__CFString *)v37;
  }
  HKFormatValueAndUnit(v25, v32);
  v83 = objc_claimAutoreleasedReturnValue();

LABEL_20:
  v38 = objc_msgSend(v7, "displayTypeIdentifier");
  objc_msgSend(a1, "_titleStringForValueSectionWithDisplayType:", v7);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38 == 275)
  {
    v90[0] = *MEMORY[0x1E0CB5A60];
    v90[1] = CFSTR("BreathingDisturbanceValue");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)v83;
    objc_msgSend(v85, "addText:detail:baseIdentifier:", v83, v39, v41);
  }
  else
  {
    objc_msgSend(a1, "sampleType");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "identifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v89[0] = v41;
    v89[1] = CFSTR("Sample");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "addText:detail:baseIdentifier:", v83, v39, v44);

    v42 = (void *)v83;
  }

  if (objc_msgSend(v7, "displayTypeIdentifier") == 249)
  {
    objc_msgSend(a1, "quantity");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = +[HKMobilityUtilities classificationForAppleWalkingSteadinessQuantity:](HKMobilityUtilities, "classificationForAppleWalkingSteadinessQuantity:", v45);

    +[HKMobilityUtilities localizedTitleForClassification:](HKMobilityUtilities, "localizedTitleForClassification:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "localizedStringForKey:value:table:", CFSTR("LEVEL_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "sampleType");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "identifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v88[0] = v50;
      v88[1] = CFSTR("SteadinessLevel");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 2);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      HKUIJoinStringsForAutomationIdentifier(v51);
      v52 = v7;
      v53 = v8;
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "addText:detail:baseIdentifier:", v47, v48, v54);

      v8 = v53;
      v7 = v52;

      v42 = (void *)v83;
    }

  }
  if (objc_msgSend(v7, "displayTypeIdentifier") == 248)
  {
    v81 = v8;
    v55 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(a1, "startDate");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "endDate");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)objc_msgSend(v55, "initWithStartDate:endDate:", v56, v57);

    objc_msgSend(a1, "_timeZone");
    v59 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "calendarCache");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = (void *)v59;
    objc_msgSend(v60, "calendarForTimeZone:", v59);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    v62 = (void *)MEMORY[0x1E0CB3588];
    objc_msgSend(v85, "calendarCache");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "currentCalendar");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "hk_julianDayDateIntervalFromOpenUpperBoundDateInterval:sourceCalendar:localCalendar:", v58, v61, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (v65)
    {
      objc_msgSend(MEMORY[0x1E0CB3590], "hk_mediumDateStyleIntervalFormatter");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "stringFromDateInterval:", v65);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      if (v67)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "localizedStringForKey:value:table:", CFSTR("AFIB_BURDEN_DATE_RANGE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-AFibBurden"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "sampleType");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "identifier");
        v78 = v58;
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v87[0] = v69;
        v87[1] = CFSTR("DateRange");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 2);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        HKUIJoinStringsForAutomationIdentifier(v70);
        v71 = v61;
        v72 = v66;
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "addText:detail:baseIdentifier:", v67, v68, v73);

        v66 = v72;
        v61 = v71;

        v58 = v78;
        v42 = (void *)v83;

      }
    }
    else
    {
      _HKInitializeLogging();
      v74 = *MEMORY[0x1E0CB5378];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_FAULT))
        -[HKQuantitySample(HKDataMetadataDetailSection) addDetailValuesToSection:].cold.1(v74);
    }

    v8 = v81;
  }
  v86.receiver = a1;
  v86.super_class = (Class)&off_1F0228678;
  objc_msgSendSuper2(&v86, sel_addDetailValuesToSection_, v85);

}

- (id)_titleStringForValueSectionWithDisplayType:()HKDataMetadataDetailSection
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "displayTypeIdentifier") == 275)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SLEEP_BREATHING_DISTURBANCES_SAMPLE_DETAIL_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Nebula"));
  }
  else
  {
    objc_msgSend(v3, "localization");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayName");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_shouldOmitUnitsInSampleDetailViewForDisplayType:()HKDataMetadataDetailSection
{
  return objc_msgSend(a3, "displayTypeIdentifier") == 275;
}

- (id)detailFooter
{
  void *v1;
  void *v2;
  int v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "sampleType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A68]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "isEqual:", v2);

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SLEEPING_WRIST_TEMPERATURE_METADATA_DETAIL_FOOTER"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Kali"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)addDetailValuesToSection:()HKDataMetadataDetailSection .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D7813000, log, OS_LOG_TYPE_FAULT, "AFibBurden sample with instantaneous duration detected", v1, 2u);
}

@end
