@implementation HKActivitySummary(ActivitySharing)

- (id)as_moveProgressStringWithContext:()ActivitySharing formattingManager:snapshot:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "keyColorForDisplayMode:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "multilineDataFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "multilineUnitFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_moveStringWithFont:smallCapsFont:color:formattingManager:snapshot:", v12, v13, v11, v9, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)as_movePercentStringWithContext:()ActivitySharing snapshot:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "keyColorForDisplayMode:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "_isEmptyMoveSummaryForSnapshot:", v6))
  {
    ActivitySharingBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("LIST_VIEW_EMPTY_VALUE"), &stru_24EE9E808, CFSTR("Localizable"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = objc_msgSend(v6, "isAmm");
    v12 = (void *)MEMORY[0x24BE37938];
    v13 = (void *)MEMORY[0x24BDD16E0];
    if (v11)
      objc_msgSend(v6, "mmPercent");
    else
      objc_msgSend(v6, "energyBurnedGoalPercentage");
    objc_msgSend(v13, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "percentStringWithNumber:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v10;

  v15 = objc_alloc(MEMORY[0x24BDD1688]);
  v20[0] = *MEMORY[0x24BEBB360];
  objc_msgSend(v7, "multilineDataFont");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v20[1] = *MEMORY[0x24BEBB368];
  v21[0] = v16;
  v21[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithString:attributes:", v14, v17);

  return v18;
}

- (id)_moveStringWithFont:()ActivitySharing smallCapsFont:color:formattingManager:snapshot:
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v48;
  id v49;
  id v50;
  id v51;
  _QWORD v52[2];
  _QWORD v53[3];

  v53[2] = *MEMORY[0x24BDAC8D0];
  v50 = a3;
  v51 = a5;
  v12 = a6;
  v13 = a7;
  v49 = a4;
  v48 = v12;
  if (objc_msgSend(v13, "isAmm"))
  {
    v14 = (void *)MEMORY[0x24BE37938];
    v15 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v13, "mmvQuantity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValueForUnit:", v17);
    objc_msgSend(v15, "numberWithDouble:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithNumber:decimalPrecision:", v18, 1);
    v19 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x24BE37938];
    v21 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v13, "mmgQuantity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValueForUnit:", v23);
    objc_msgSend(v21, "numberWithDouble:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithNumber:decimalPrecision:", v24, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    ActivitySharingBundle();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("MIN"), &stru_24EE9E808, CFSTR("Localizable"));
  }
  else
  {
    objc_msgSend(a1, "activeEnergyBurned");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringWithActiveEnergy:", v27);
    v19 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "activeEnergyBurnedGoal");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringWithActiveEnergy:", v28);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "localizedShortActiveEnergyUnitString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedUppercaseString");
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = objc_msgSend(a1, "_isEmptyMoveSummaryForSnapshot:", v13);
  if ((v30 & 1) != 0)
  {
    ActivitySharingBundle();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("LIST_VIEW_EMPTY_RATIO"), &stru_24EE9E808, CFSTR("Localizable"));
  }
  else
  {
    v32 = (void *)MEMORY[0x24BDD17C8];
    ASActivitySummaryGoalFormatString();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringWithFormat:", v31, v19, v25, v29, v12);
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)v19;

  v35 = objc_alloc(MEMORY[0x24BDD1688]);
  v37 = *MEMORY[0x24BEBB368];
  v52[0] = *MEMORY[0x24BEBB360];
  v36 = v52[0];
  v52[1] = v37;
  v53[0] = v50;
  v53[1] = v51;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v35, "initWithString:attributes:", v33, v38);

  objc_msgSend(v50, "fu_shortSlashFont");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "string");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "rangeOfString:", CFSTR("/"));
  objc_msgSend(v39, "addAttribute:value:range:", v36, v40, v42, v43);

  objc_msgSend(v39, "string");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "rangeOfString:", v29);
  objc_msgSend(v39, "addAttribute:value:range:", v36, v49, v45, v46);

  return v39;
}

- (uint64_t)_isEmptyMoveSummaryForSnapshot:()ActivitySharing
{
  id v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_msgSend(a1, "isPaused");
  v6 = 1;
  if (v4 && (v5 & 1) == 0)
  {
    objc_msgSend(a1, "activeEnergyBurned");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "_isZero"))
    {
      objc_msgSend(a1, "activeEnergyBurnedGoal");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "_isZero"))
      {
        objc_msgSend(v4, "mmvQuantity");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "_isZero"))
        {
          objc_msgSend(v4, "mmgQuantity");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v10, "_isZero");

        }
        else
        {
          v6 = 0;
        }

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (id)as_moveStringWithContext:()ActivitySharing formattingManager:snapshot:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "dataFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unitFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "keyColorForDisplayMode:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_moveStringWithFont:smallCapsFont:color:formattingManager:snapshot:", v11, v12, v13, v9, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)as_exerciseDurationStringWithContext:()ActivitySharing
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[2];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "keyColorForDisplayMode:", 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "appleExerciseTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", v7);
  objc_msgSend(v5, "numberWithDouble:");
  v8 = objc_claimAutoreleasedReturnValue();

  v37 = (void *)v8;
  objc_msgSend(MEMORY[0x24BE37938], "stringWithNumber:decimalPrecision:", v8, 1);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "appleExerciseTimeGoal");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValueForUnit:", v12);
  objc_msgSend(v10, "numberWithDouble:");
  v13 = objc_claimAutoreleasedReturnValue();

  v36 = (void *)v13;
  objc_msgSend(MEMORY[0x24BE37938], "stringWithNumber:decimalPrecision:", v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  ActivitySharingBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("MIN"), &stru_24EE9E808, CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)v9;
  if ((objc_msgSend(a1, "_isEmptyExerciseSummary") & 1) != 0)
  {
    ActivitySharingBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("LIST_VIEW_EMPTY_RATIO"), &stru_24EE9E808, CFSTR("Localizable"));
  }
  else
  {
    v18 = (void *)MEMORY[0x24BDD17C8];
    ASActivitySummaryGoalFormatString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v17, v9, v14, v16, v9);
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_alloc(MEMORY[0x24BDD1688]);
  v39[0] = *MEMORY[0x24BEBB360];
  v21 = v39[0];
  objc_msgSend(v4, "multilineDataFont");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = *MEMORY[0x24BEBB368];
  v40[0] = v22;
  v40[1] = v38;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v20, "initWithString:attributes:", v19, v23);

  objc_msgSend(v4, "multilineDataFont");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "fu_shortSlashFont");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "string");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "rangeOfString:", CFSTR("/"));
  objc_msgSend(v24, "addAttribute:value:range:", v21, v26, v28, v29);

  objc_msgSend(v4, "multilineUnitFont");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "string");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "rangeOfString:", v16);
  objc_msgSend(v24, "addAttribute:value:range:", v21, v30, v32, v33);

  return v24;
}

- (id)as_exerciseProgressStringWithContext:()ActivitySharing
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "keyColorForDisplayMode:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "_isEmptyExerciseSummary") & 1) != 0)
  {
    ActivitySharingBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LIST_VIEW_EMPTY_VALUE"), &stru_24EE9E808, CFSTR("Localizable"));
  }
  else
  {
    v7 = (void *)MEMORY[0x24BE37938];
    v8 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(a1, "_exerciseTimeCompletionPercentage");
    objc_msgSend(v8, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "percentStringWithNumber:", v6);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x24BDD1688]);
  v15[0] = *MEMORY[0x24BEBB360];
  objc_msgSend(v4, "multilineDataFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15[1] = *MEMORY[0x24BEBB368];
  v16[0] = v11;
  v16[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithString:attributes:", v9, v12);

  return v13;
}

- (id)as_stepsStringWithContext:()ActivitySharing
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "keyColorForDisplayMode:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "stepCount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValueForUnit:", v8);
  objc_msgSend(v6, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE37938], "stringWithNumber:decimalPrecision:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "integerValue");
  v12 = (void *)MEMORY[0x24BDD17C8];
  ActivitySharingBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("STEPS"), &stru_24EE9E808, CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v14, v11, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedUppercaseString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc(MEMORY[0x24BDD1688]);
  v27[0] = *MEMORY[0x24BEBB360];
  v18 = v27[0];
  objc_msgSend(v4, "multilineUnitFont");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = *MEMORY[0x24BEBB368];
  v28[0] = v19;
  v28[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v17, "initWithString:attributes:", v16, v20);

  objc_msgSend(v4, "multilineDataFont");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "string");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "rangeOfString:", v10);
  objc_msgSend(v21, "addAttribute:value:range:", v18, v22, v24, v25);

  return v21;
}

- (uint64_t)as_distanceStringWithContext:()ActivitySharing formattingManager:
{
  return objc_msgSend(a1, "as_distanceStringWithContext:formattingManager:distanceUnitFormat:", a3, a4, 0);
}

- (id)as_distanceStringWithContext:()ActivitySharing formattingManager:distanceUnitFormat:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  void *v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "keyColorForDisplayMode:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "distanceWalkingRunning");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValueForUnit:", v13);
  v15 = v14;

  v40 = *MEMORY[0x24BEBB548];
  v16 = *MEMORY[0x24BEBB598];
  v37[0] = *MEMORY[0x24BEBB5A0];
  v37[1] = v16;
  v38[0] = &unk_24EEA3530;
  v38[1] = &unk_24EEA3548;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "multilineDataFont");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "fontDescriptor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fontDescriptorByAddingAttributes:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(v10, "multilineDataFont");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "pointSize");
  objc_msgSend(v23, "fontWithDescriptor:size:", v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v34 = 0;
    objc_msgSend(v8, "localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:", 1, 0, &v34, v15);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedShortUnitStringForDistanceUnit:textCase:", v34, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v9, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v8, "localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:", 1, 2, 0, v15);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = objc_alloc(MEMORY[0x24BDD1688]);
  v30 = *MEMORY[0x24BEBB368];
  v35[0] = *MEMORY[0x24BEBB360];
  v35[1] = v30;
  v36[0] = v25;
  v36[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v29, "initWithString:attributes:", v28, v31);

  return v32;
}

- (id)as_pushesStringWithContext:()ActivitySharing
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "keyColorForDisplayMode:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "_pushCount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValueForUnit:", v8);
  objc_msgSend(v6, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE37938], "stringWithNumber:decimalPrecision:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x24BDD1688]);
  v16[0] = *MEMORY[0x24BEBB360];
  objc_msgSend(v4, "dataFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[1] = *MEMORY[0x24BEBB368];
  v17[0] = v12;
  v17[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithString:attributes:", v10, v13);

  return v14;
}

- (uint64_t)_isEmptyExerciseSummary
{
  uint64_t v2;
  void *v3;
  void *v4;

  if ((objc_msgSend(a1, "isPaused") & 1) != 0)
    return 1;
  objc_msgSend(a1, "appleExerciseTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_isZero"))
  {
    objc_msgSend(a1, "appleExerciseTimeGoal");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v4, "_isZero");

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end
