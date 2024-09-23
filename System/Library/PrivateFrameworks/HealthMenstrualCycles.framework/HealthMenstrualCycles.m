id HDMenstrualCyclesPluginServerInterface()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25501AE10);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_fetchScheduledNotificationsWithCompletion_, 0, 1);
  v2 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_saveDaySummaries_canOverrideCreationDate_completion_, 0, 0);
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_remote_saveBleedingFlowByDayIndex_forBleedingType_completion_, 0, 0);

  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_remote_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion_, 0, 0);

  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_remote_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion_, 1, 0);

  v12 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion_, 2, 0);
  v13 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_confirmAndSaveDeviationWithMenstrualFlowByDayIndex_intermenstrualBleedingByDayIndex_addedCycleFactors_initialAnalysisWindow_completion_, 0, 1);
  return v0;
}

id HKMCCycleFactorsTypes()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD29D8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2960], v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD28B0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id HKMCCycleTrackingSampleTypes()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  HKMCDaySummarySampleTypes();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  HKMCCycleFactorsTypes();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "arrayByAddingObjectsFromArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  HKMCDeviationSampleTypes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id HKMCDeviationSampleTypes()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD29F0]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD29D0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2958]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2940]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id HKMCDaySummarySampleTypes()
{
  void *v0;
  void *v1;
  void *v2;

  HKMCDaySummaryCategoryTypes();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  HKMCDaySummaryQuantityTypes(1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "arrayByAddingObjectsFromArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id HKMCDaySummaryCategoryTypes()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  int v4;
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
  void *v19;
  _QWORD v20[6];
  _QWORD v21[2];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2998]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "features");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "seahorse");

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2878]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v5;
    objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2870]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "arrayByAddingObjectsFromArray:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v1 = (void *)v8;
  }
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2948]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v19;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2A08]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v9;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2890]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v10;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD29C0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v11;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD29E0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v12;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD29E8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "arrayByAddingObjectsFromArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HKMCSymptomSampleTypes();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

id HKMCSymptomSampleTypes()
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
  id v11;
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
  void *v23;
  _QWORD v24[24];

  v24[22] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2840]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v23;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2848]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v22;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2850]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v21;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2868]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v20;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2880]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v19;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2888]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v18;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD28A0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v17;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD28A8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v16;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD28C0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[8] = v15;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD28D0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[9] = v14;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD28E8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[10] = v13;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2900]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[11] = v12;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2910]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v24[12] = v0;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2938]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v24[13] = v1;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2988]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24[14] = v2;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2990]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[15] = v3;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD29A8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[16] = v4;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD29B0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[17] = v5;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD29B8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[18] = v6;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD29C8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[19] = v7;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2A38]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[20] = v8;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2A50]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[21] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 22);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  return v11;
}

id HKMCDaySummaryQuantityTypes(int a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3380]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (a1)
  {
    v8[0] = v2;
    objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3360]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v2;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t HKMenstrualCyclesStoreInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255006230);
}

uint64_t HKMenstrualCyclesDiagnosticsInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255005E28);
}

uint64_t HDMenstrualCyclesDiagnosticsServerInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25501AE70);
}

id HKMCAllNotificationCategories()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  HKMCPeriodNotificationCategories();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  HKMCFertileWindowNotificationCategories();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "arrayByAddingObjectsFromArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = CFSTR("MenstrualCyclesAppPlugin.UnconfirmedDeviation");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id HKMCPeriodNotificationCategories()
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x24BDAC8D0];
  HKMCBeforePeriodStartNotificationCategories();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = CFSTR("MenstrualCyclesAppPlugin.AfterPeriodStart");
  v4[1] = CFSTR("MenstrualCyclesAppPlugin.AfterLoggedPeriodEnd");
  v4[2] = CFSTR("MenstrualCyclesAppPlugin.AfterUnloggedPeriodEnd");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "arrayByAddingObjectsFromArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id HKMCFertileWindowNotificationCategories()
{
  void *v0;
  void *v1;
  void *v2;

  HKMCBeforeFertileWindowStartDaysNotificationCategories();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  HKMCSensorBasedFertileWindowNotificationCategories();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "arrayByAddingObjectsFromArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id HKMCBeforePeriodStartNotificationCategories()
{
  void *v0;
  void *v1;
  void *v2;

  HKMCBeforePeriodStartDaysNotificationCategories();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  HKMCBeforePeriodStartWeeksNotificationCategories();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "arrayByAddingObjectsFromArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id HKMCBeforePeriodStartDaysNotificationCategories()
{
  _QWORD v1[11];

  v1[10] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("MenstrualCyclesAppPlugin.BeforePeriodStart1Day");
  v1[1] = CFSTR("MenstrualCyclesAppPlugin.BeforePeriodStart2Days");
  v1[2] = CFSTR("MenstrualCyclesAppPlugin.BeforePeriodStart3Days");
  v1[3] = CFSTR("MenstrualCyclesAppPlugin.BeforePeriodStart4Days");
  v1[4] = CFSTR("MenstrualCyclesAppPlugin.BeforePeriodStart5Days");
  v1[5] = CFSTR("MenstrualCyclesAppPlugin.BeforePeriodStart6Days");
  v1[6] = CFSTR("MenstrualCyclesAppPlugin.BeforePeriodStart7Days");
  v1[7] = CFSTR("MenstrualCyclesAppPlugin.BeforePeriodStart8Days");
  v1[8] = CFSTR("MenstrualCyclesAppPlugin.BeforePeriodStart9Days");
  v1[9] = CFSTR("MenstrualCyclesAppPlugin.BeforePeriodStart10Days");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 10);
  return (id)objc_claimAutoreleasedReturnValue();
}

id HKMCBeforePeriodStartWeeksNotificationCategories()
{
  _QWORD v1[3];

  v1[2] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("MenstrualCyclesAppPlugin.BeforePeriodStart2Weeks");
  v1[1] = CFSTR("MenstrualCyclesAppPlugin.BeforePeriodStart3Weeks");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id HKMCBeforeFertileWindowStartDaysNotificationCategories()
{
  _QWORD v1[2];

  v1[1] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("MenstrualCyclesAppPlugin.BeforeFertileWindowStart3Days");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id HKMCSensorBasedFertileWindowNotificationCategories()
{
  _QWORD v1[3];

  v1[2] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("MenstrualCyclesAppPlugin.UpdatedFertileWindowEnd");
  v1[1] = CFSTR("MenstrualCyclesAppPlugin.OvulationConfirmed");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id HKMCSharedPredictionNotificationCategories()
{
  _QWORD v1[3];

  v1[2] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("MenstrualCyclesAppPlugin.SharedPeriodPrediction");
  v1[1] = CFSTR("MenstrualCyclesAppPlugin.SharedFertileWindowPrediction");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t HKMCNotificationDateComponentScalarFromCategory(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v5;

  objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scanUpToCharactersFromSet:intoString:", v2, 0);

  v5 = 0;
  objc_msgSend(v1, "scanInteger:", &v5);
  v3 = v5;

  return v3;
}

const __CFString *HKMCNotificationCategoryBeforePeriodStartForDays(uint64_t a1)
{
  unint64_t v1;

  v1 = a1 - 2;
  if (a1 < 2)
    return CFSTR("MenstrualCyclesAppPlugin.BeforePeriodStart1Day");
  if ((unint64_t)a1 > 0x11)
    return CFSTR("MenstrualCyclesAppPlugin.BeforePeriodStart3Weeks");
  if (v1 > 8)
    return CFSTR("MenstrualCyclesAppPlugin.BeforePeriodStart2Weeks");
  return off_24D99D5B8[v1];
}

__CFString *HKMCNotificationIdentifierForCategory(void *a1)
{
  id v1;
  __CFString *v2;
  void *v3;
  char v4;
  void *v5;
  char v6;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MenstrualCyclesAppPlugin.UnconfirmedDeviation")) & 1) != 0)
  {
    v2 = CFSTR("MenstrualCyclesAppPlugin.UnconfirmedDeviation");
  }
  else
  {
    HKMCPeriodNotificationCategories();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containsObject:", v1);

    if ((v4 & 1) != 0)
    {
      v2 = CFSTR("MenstrualCyclesAppPlugin.Period");
    }
    else
    {
      HKMCFertileWindowNotificationCategories();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "containsObject:", v1);

      if ((v6 & 1) != 0)
        v2 = CFSTR("MenstrualCyclesAppPlugin.FertileWindow");
      else
        v2 = (__CFString *)v1;
    }
  }

  return v2;
}

void sub_218AA3060(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id HKMCGenerateHeartRateSamplesMatchingTenthPercentile(void *a1, uint64_t a2, float a3)
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  float v18;
  void *v19;
  float v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v29;
  id v30;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;

  v29 = v4;
  objc_msgSend(v4, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v9;

  v11 = objc_alloc(MEMORY[0x24BDD3AF8]);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithName:manufacturer:model:hardwareVersion:firmwareVersion:softwareVersion:localIdentifier:UDIDeviceIdentifier:", CFSTR("Apple Watch"), CFSTR("Apple Inc"), 0, 0, 0, 0, v13, 0);

  objc_msgSend(MEMORY[0x24BDD4048], "unitFromString:", CFSTR("count/min"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 < v10 && a2 >= 1)
  {
    v16 = 0;
    v17 = *MEMORY[0x24BDD43B0];
    v18 = 0.0;
    do
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 <= a2 / 0xAuLL)
      {
        v20 = a3;
      }
      else
      {
        if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * (~(a2 / 0xAuLL) + v16) + 0x1999999999999998, 1) < 0x1999999999999999uLL)
          v18 = v18 + 1.0;
        v20 = v18 + a3;
      }
      v21 = (void *)MEMORY[0x24BDD3E68];
      objc_msgSend(MEMORY[0x24BDD3E80], "heartRateType");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", v15, v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v17;
      v33[0] = &unk_24D9AA1B0;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "quantitySampleWithType:quantity:startDate:endDate:device:metadata:", v22, v23, v19, v19, v14, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "addObject:", v25);
      v7 = v7 + 300.0;
      ++v16;
    }
    while (v7 < v10 && (uint64_t)v16 < a2);
  }
  v27 = (void *)objc_msgSend(v30, "copy");

  return v27;
}

void sub_218AA6D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218AA7E28(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

unint64_t HAMenstrualAlgorithmsFlowFromHKMCMenstrualFlow(unint64_t a1)
{
  unint64_t v1;

  v1 = 0x40302010500uLL >> (8 * a1);
  if (a1 >= 6)
    LOBYTE(v1) = 0;
  return v1 & 7;
}

unint64_t HAMenstrualAlgorithmsOvulationTestResultFromHKMCOvulationTestResult(unint64_t a1)
{
  unint64_t v1;

  v1 = 0x203010300uLL >> (8 * a1);
  if (a1 >= 5)
    LOBYTE(v1) = 0;
  return v1 & 3;
}

uint64_t HKMCCycleFactorFromHAMenstrualAlgorithmsCycleFactor(char a1)
{
  if ((a1 - 1) > 7u)
    return 2;
  else
    return qword_218AC7D28[(char)(a1 - 1)];
}

uint64_t HAMenstrualAlgorithmsPhaseFromHKMCCycleFactor(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 8)
    return 0;
  else
    return byte_218AC7CF8[a1 - 1];
}

uint64_t HKMCPredictionPrimarySourceFromHAMenstrualAlgorithmsPredictionPrimarySource(unsigned int a1)
{
  unsigned __int8 v1;
  void *v3;

  v1 = a1;
  if (a1 < 4)
    return a1 + 1;
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_FAULT))
    HKMCPredictionPrimarySourceFromHAMenstrualAlgorithmsPredictionPrimarySource_cold_1(v3, v1);
  return 1;
}

void HKMCAppendCycleFactorsPhaseFromDaySummary(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v4, "startedCycleFactors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v9), "integerValue") - 1;
        if (v10 > 8)
          v11 = 0;
        else
          v11 = byte_218AC7CF8[v10];
        objc_msgSend(v3, "beginPhase:onJulianDay:", v11, objc_msgSend(v4, "dayIndex"));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v4, "endedCycleFactors", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "integerValue") - 1;
        if (v17 > 8)
          v18 = 0;
        else
          v18 = byte_218AC7CF8[v17];
        objc_msgSend(v3, "endPhase:onJulianDay:", v18, objc_msgSend(v4, "dayIndex"));
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

}

uint64_t HKHAMenstrualAlgorithmsDayStreamProcessorAlgorithmVersion()
{
  return objc_msgSend(MEMORY[0x24BE3F590], "algorithmVersion");
}

id OUTLINED_FUNCTION_0(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

id HKMCDaySummarySymptomArrayFromSymptoms(int a1)
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = v2;
  if ((a1 & 1) != 0)
  {
    objc_msgSend(v2, "addObject:", &unk_24D9AA1C8);
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0)
        goto LABEL_4;
      goto LABEL_27;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "addObject:", &unk_24D9AA1E0);
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 0x100000) == 0)
      goto LABEL_5;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "addObject:", &unk_24D9AA1F8);
  if ((a1 & 0x100000) == 0)
  {
LABEL_5:
    if ((a1 & 8) == 0)
      goto LABEL_6;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v3, "addObject:", &unk_24D9AA210);
  if ((a1 & 8) == 0)
  {
LABEL_6:
    if ((a1 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v3, "addObject:", &unk_24D9AA228);
  if ((a1 & 0x10) == 0)
  {
LABEL_7:
    if ((a1 & 0x20000) == 0)
      goto LABEL_8;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v3, "addObject:", &unk_24D9AA240);
  if ((a1 & 0x20000) == 0)
  {
LABEL_8:
    if ((a1 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v3, "addObject:", &unk_24D9AA258);
  if ((a1 & 0x20) == 0)
  {
LABEL_9:
    if ((a1 & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v3, "addObject:", &unk_24D9AA270);
  if ((a1 & 0x40) == 0)
  {
LABEL_10:
    if ((a1 & 0x80000) == 0)
      goto LABEL_11;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v3, "addObject:", &unk_24D9AA288);
  if ((a1 & 0x80000) == 0)
  {
LABEL_11:
    if ((a1 & 0x4000) == 0)
      goto LABEL_12;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v3, "addObject:", &unk_24D9AA2A0);
  if ((a1 & 0x4000) == 0)
  {
LABEL_12:
    if ((a1 & 0x40000) == 0)
      goto LABEL_13;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(v3, "addObject:", &unk_24D9AA2B8);
  if ((a1 & 0x40000) == 0)
  {
LABEL_13:
    if ((a1 & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(v3, "addObject:", &unk_24D9AA2D0);
  if ((a1 & 0x80) == 0)
  {
LABEL_14:
    if ((a1 & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(v3, "addObject:", &unk_24D9AA2E8);
  if ((a1 & 0x100) == 0)
  {
LABEL_15:
    if ((a1 & 0x200) == 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(v3, "addObject:", &unk_24D9AA300);
  if ((a1 & 0x200) == 0)
  {
LABEL_16:
    if ((a1 & 0x200000) == 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(v3, "addObject:", &unk_24D9AA318);
  if ((a1 & 0x200000) == 0)
  {
LABEL_17:
    if ((a1 & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(v3, "addObject:", &unk_24D9AA330);
  if ((a1 & 0x400) == 0)
  {
LABEL_18:
    if ((a1 & 0x800) == 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(v3, "addObject:", &unk_24D9AA348);
  if ((a1 & 0x800) == 0)
  {
LABEL_19:
    if ((a1 & 0x10000) == 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(v3, "addObject:", &unk_24D9AA360);
  if ((a1 & 0x10000) == 0)
  {
LABEL_20:
    if ((a1 & 0x1000) == 0)
      goto LABEL_21;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(v3, "addObject:", &unk_24D9AA378);
  if ((a1 & 0x1000) == 0)
  {
LABEL_21:
    if ((a1 & 0x2000) == 0)
      goto LABEL_22;
LABEL_45:
    objc_msgSend(v3, "addObject:", &unk_24D9AA3A8);
    if ((a1 & 0x8000) == 0)
      return v3;
    goto LABEL_23;
  }
LABEL_44:
  objc_msgSend(v3, "addObject:", &unk_24D9AA390);
  if ((a1 & 0x2000) != 0)
    goto LABEL_45;
LABEL_22:
  if ((a1 & 0x8000) != 0)
LABEL_23:
    objc_msgSend(v3, "addObject:", &unk_24D9AA3C0);
  return v3;
}

BOOL HKMCDaySummaryBleedingFlowHasFlow(uint64_t a1)
{
  return (unint64_t)(a1 - 2) < 4;
}

void sub_218AADCAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

void sub_218AB12EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t HKMCTodayIndex(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;

  v1 = (void *)MEMORY[0x24BDBCE60];
  v2 = a1;
  objc_msgSend(v1, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hk_dayIndexWithCalendar:", v2);

  return v4;
}

id HKMCAllDisplayTypeIdentifiers()
{
  _QWORD v1[13];

  v1[12] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("DisplayTypeIdentifierMenstrualFlow");
  v1[1] = CFSTR("DisplayTypeIdentifierBleedingInPregnancyFlow");
  v1[2] = CFSTR("DisplayTypeIdentifierBleedingAfterPregnancyFlow");
  v1[3] = CFSTR("DisplayTypeIdentifierSymptoms");
  v1[4] = CFSTR("DisplayTypeIdentifierIntermenstrualBleeding");
  v1[5] = CFSTR("DisplayTypeIdentifierSexualActivity");
  v1[6] = CFSTR("DisplayTypeIdentifierOvulationTestResult");
  v1[7] = CFSTR("DisplayTypeIdentifierProgesteroneTestResult");
  v1[8] = CFSTR("DisplayTypeIdentifierPregnancyTestResult");
  v1[9] = CFSTR("DisplayTypeIdentifierCervicalMucusQuality");
  v1[10] = CFSTR("DisplayTypeIdentifierBasalBodyTemperature");
  v1[11] = CFSTR("DisplayTypeIdentifierCycleFactors");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 12);
  return (id)objc_claimAutoreleasedReturnValue();
}

const __CFString *HKMCDisplayTypeIdentifierForSampleType(void *a1)
{
  id v1;
  uint64_t v2;
  const __CFString *v3;
  void *v4;
  char v5;
  void *v6;
  int v7;

  v1 = a1;
  v2 = objc_msgSend(v1, "code");
  if (v2 > 242)
  {
    if (v2 > 312)
    {
      if (v2 == 314)
      {
        v3 = CFSTR("DisplayTypeIdentifierBleedingAfterPregnancyFlow");
        goto LABEL_24;
      }
      if (v2 == 313)
      {
        v3 = CFSTR("DisplayTypeIdentifierBleedingInPregnancyFlow");
        goto LABEL_24;
      }
    }
    else
    {
      if (v2 == 243)
      {
        v3 = CFSTR("DisplayTypeIdentifierPregnancyTestResult");
        goto LABEL_24;
      }
      if (v2 == 244)
      {
        v3 = CFSTR("DisplayTypeIdentifierProgesteroneTestResult");
        goto LABEL_24;
      }
    }
LABEL_17:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      HKMCSymptomSampleTypes();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "containsObject:", v1);

      if ((v5 & 1) != 0)
      {
        v3 = CFSTR("DisplayTypeIdentifierSymptoms");
      }
      else
      {
        HKMCCycleFactorsTypes();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "containsObject:", v1);

        if (v7)
          v3 = CFSTR("DisplayTypeIdentifierCycleFactors");
        else
          v3 = 0;
      }
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = CFSTR("DisplayTypeIdentifierMenstrualFlow");
    switch(v2)
    {
      case 'Z':
        v3 = CFSTR("DisplayTypeIdentifierBasalBodyTemperature");
        break;
      case '[':
        v3 = CFSTR("DisplayTypeIdentifierCervicalMucusQuality");
        break;
      case '\\':
        v3 = CFSTR("DisplayTypeIdentifierOvulationTestResult");
        break;
      case '_':
        break;
        v3 = CFSTR("DisplayTypeIdentifierIntermenstrualBleeding");
        break;
      case 'a':
        v3 = CFSTR("DisplayTypeIdentifierSexualActivity");
        break;
      default:
        goto LABEL_17;
    }
  }
LABEL_24:

  return v3;
}

uint64_t HKMCCategoryValueVaginalBleedingFromBleedingFlow(uint64_t a1)
{
  uint64_t result;

  result = 1;
  switch(a1)
  {
    case 0:
      result = HKMCCategoryValueNotSet;
      break;
    case 1:
      result = 5;
      break;
    case 3:
      result = 2;
      break;
    case 4:
      result = 3;
      break;
    case 5:
      result = 4;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t HKMCCategoryValueCervicalMucusQualityFromCervicalMucusQuality(uint64_t a1)
{
  uint64_t result;

  result = 1;
  switch(a1)
  {
    case 0:
      result = HKMCCategoryValueNotSet;
      break;
    case 2:
    case 3:
    case 4:
    case 5:
      result = a1;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t HKMCCategoryValueOvulationTestResultFromOvulationTestResult(uint64_t a1)
{
  uint64_t result;

  result = 1;
  switch(a1)
  {
    case 0:
      result = HKMCCategoryValueNotSet;
      break;
    case 1:
      result = 3;
      break;
    case 3:
      result = 4;
      break;
    case 4:
      result = 2;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t HKMCCategoryValuePregnancyTestResultFromPregnancyTestResult(uint64_t a1)
{
  if (a1 == 3)
    return 2;
  if (a1 == 1)
    return 3;
  if (a1)
    return 1;
  return HKMCCategoryValueNotSet;
}

uint64_t HKMCCategoryValueProgesteroneTestResultFromProgesteroneTestResult(uint64_t a1)
{
  if (a1 == 3)
    return 2;
  if (a1 == 1)
    return 3;
  if (a1)
    return 1;
  return HKMCCategoryValueNotSet;
}

uint64_t HKMCCategoryValueContraceptiveFromCycleFactor(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;
  void *v5;

  result = 1;
  switch(a1)
  {
    case 1:
    case 2:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "HKCategoryValueContraceptive HKMCCategoryValueContraceptiveFromCycleFactor(HKMCCycleFactor)");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("HKMCDefines.m"), 225, CFSTR("%s: Invalid cycle factor: %@"), "HKCategoryValueContraceptive HKMCCategoryValueContraceptiveFromCycleFactor(HKMCCycleFactor)", v5);

      result = 0;
      break;
    case 4:
      result = 2;
      break;
    case 5:
      result = 3;
      break;
    case 6:
      result = 4;
      break;
    case 7:
      result = 5;
      break;
    case 8:
      result = 6;
      break;
    case 9:
      result = 7;
      break;
    default:
      return result;
  }
  return result;
}

const __CFString *NSStringFromCycleFactor(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 8)
    return CFSTR("Pregnancy");
  else
    return off_24D99DE10[a1 - 1];
}

id NSStringFromCycleFactors(void *a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  const __CFString *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "integerValue", (_QWORD)v12) - 1;
        v9 = CFSTR("Pregnancy");
        if (v8 <= 8)
          v9 = off_24D99DE10[v8];
        objc_msgSend(v2, "addObject:", v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t HKMCAlgorithmSuppressPeriodPredictionsFromCycleFactorSamples(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v8 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * i);
        if (objc_msgSend(v5, "hkmc_cycleFactor", (_QWORD)v7) == 2
          && (objc_msgSend(v5, "hasUndeterminedDuration") & 1) != 0)
        {
          v2 = 1;
          goto LABEL_12;
        }
      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_12:

  return v2;
}

uint64_t HKMCForceDisablePeriodProjectionsFromCycleFactorSamples(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  uint64_t v6;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v10 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        v6 = objc_msgSend(v5, "hkmc_cycleFactor", (_QWORD)v9);
        v7 = v6 == 8 || v6 == 2;
        if (v7 && (objc_msgSend(v5, "hasUndeterminedDuration") & 1) != 0)
        {
          v2 = 1;
          goto LABEL_16;
        }
      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_16:

  return v2;
}

uint64_t HKMCForceDisableFertileWindowProjectionsFromCycleFactorSamples(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  uint64_t v6;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v10 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        v6 = objc_msgSend(v5, "hkmc_cycleFactor", (_QWORD)v9);
        v7 = (unint64_t)(v6 - 4) < 6 || v6 == 2;
        if (v7 && (objc_msgSend(v5, "hasUndeterminedDuration") & 1) != 0)
        {
          v2 = 1;
          goto LABEL_16;
        }
      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_16:

  return v2;
}

const __CFString *NSStringFromDeviationType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("Prolonged");
  else
    return off_24D99DE58[a1 - 1];
}

id HKCategoryTypeFromDeviationType(void *a1)
{
  uint64_t v1;
  uint64_t v2;

  if ((unint64_t)a1 <= 3)
  {
    objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", **((_QWORD **)&unk_24D99DE70 + (_QWORD)a1), v1, v2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

void *HKMCAllDeviationTypes()
{
  return &unk_24D9AA4F0;
}

uint64_t HKMCBleedingFlowFromCategoryValueVaginalBleeding(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
    return 0;
  else
    return qword_218AC7E08[a1 - 1];
}

uint64_t HKMCCervicalMucusQualityFromCategoryValueCervicalMucusQuality(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 5)
    return 0;
  return result;
}

uint64_t HKMCOvulationTestResultFromCategoryValueOvulationTestResult(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return 0;
  else
    return qword_218AC7E30[a1 - 1];
}

uint64_t HKMCPregnancyTestResultFromCategoryValuePregnancyTestResult(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return 0;
  else
    return qword_218AC7E50[a1 - 1];
}

uint64_t HKMCProgesteroneTestResultFromCategoryValueProgesteroneTestResult(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return 0;
  else
    return qword_218AC7E50[a1 - 1];
}

uint64_t HKMCDataTypeCodeFromMenstrualSymptom(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;

  HKMCDaySummarySymptomArrayFromSymptoms(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3 != 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "_HKDataTypeCode HKMCDataTypeCodeFromMenstrualSymptom(HKMCDaySummarySymptoms)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("HKMCDefines.m"), 481, CFSTR("%s: Invalid symptom: %@"), "_HKDataTypeCode HKMCDataTypeCodeFromMenstrualSymptom(HKMCDaySummarySymptoms)", v10);

  }
  result = 157;
  if (a1 <= 2047)
  {
    if (a1 <= 63)
    {
      switch(a1)
      {
        case 0:
          result = HKMCDataTypeCodeNotSet;
          break;
        case 1:
        case 3:
        case 5:
        case 6:
        case 7:
          return result;
        case 2:
          result = 161;
          break;
        case 4:
          result = 170;
          break;
        case 8:
          result = 159;
          break;
        default:
          v5 = 158;
          v6 = 165;
          if (a1 != 32)
            v6 = 157;
          v7 = a1 == 16;
          goto LABEL_36;
      }
      return result;
    }
    if (a1 > 255)
    {
      switch(a1)
      {
        case 256:
          return 171;
        case 512:
          return 162;
        case 1024:
          return 164;
      }
      return result;
    }
    v5 = 166;
    v6 = 160;
    if (a1 != 128)
      v6 = 157;
    v7 = a1 == 64;
LABEL_36:
    if (v7)
      return v5;
    else
      return v6;
  }
  if (a1 < 0x10000)
  {
    if (a1 < 0x2000)
    {
      v5 = 168;
      v6 = 163;
      if (a1 != 4096)
        v6 = 157;
      v7 = a1 == 2048;
      goto LABEL_36;
    }
    switch(a1)
    {
      case 0x2000:
        return 169;
      case 0x4000:
        return 167;
      case 0x8000:
        return 229;
    }
  }
  else if (a1 >= 0x80000)
  {
    switch(a1)
    {
      case 0x80000:
        return 233;
      case 0x100000:
        return 234;
      case 0x200000:
        return 235;
    }
  }
  else
  {
    switch(a1)
    {
      case 0x10000:
        return 230;
      case 0x20000:
        return 231;
      case 0x40000:
        return 232;
    }
  }
  return result;
}

uint64_t HKMCMenstrualSymptomFromDataTypeCode(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1 - 157;
  result = 1;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      result = 16;
      break;
    case 2:
      result = 8;
      break;
    case 3:
      result = 128;
      break;
    case 4:
      result = 2;
      break;
    case 5:
      result = 512;
      break;
    case 6:
      result = 4096;
      break;
    case 7:
      result = 1024;
      break;
    case 8:
      result = 32;
      break;
    case 9:
      result = 64;
      break;
    case 10:
      result = 0x4000;
      break;
    case 11:
      result = 2048;
      break;
    case 12:
      result = 0x2000;
      break;
    case 13:
      result = 4;
      break;
    case 14:
      result = 256;
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "HKMCDaySummarySymptoms HKMCMenstrualSymptomFromDataTypeCode(_HKDataTypeCode)");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("HKMCDefines.m"), 579, CFSTR("%s: Invalid data type code: %@"), "HKMCDaySummarySymptoms HKMCMenstrualSymptomFromDataTypeCode(_HKDataTypeCode)", v5);

      result = 0;
      break;
  }
  return result;
}

uint64_t HKMCDataTypeCodeFromCycleFactors(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 8)
    return 191;
  else
    return qword_218AC7E68[a1 - 1];
}

id HKMCLocalizedString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDD1488];
  v2 = a1;
  objc_msgSend(v1, "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, &stru_24D99FB00, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id HKMCLocalizedStringSelene(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDD1488];
  v2 = a1;
  objc_msgSend(v1, "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, &stru_24D99FB00, CFSTR("Localizable-Selene"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id HKMCCycleChartMainTypes()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  int v4;
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
  void *v19;
  _QWORD v20[8];
  _QWORD v21[2];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2998]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "features");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "seahorse");

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2878]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v5;
    objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2870]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "arrayByAddingObjectsFromArray:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v1 = (void *)v8;
  }
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2948]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v19;
  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3380]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v9;
  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3360]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v10;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2A08]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v11;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD29C0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v12;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD29E8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v13;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD29E0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[6] = v14;
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2890]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[7] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "arrayByAddingObjectsFromArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t HKMCIsAlgorithmsVersionSameOnPairedDevice(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x24BE6B390]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDD3118]);
  else
    v3 = 0;

  return v3;
}

id HKMCActiveWatchPairedProductType()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "getActivePairedDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "valueForProperty:", *MEMORY[0x24BE6B3B0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

BOOL HKMCHeartRateContextIsSedentary(uint64_t a1)
{
  return ((a1 - 3) & 0xFFFFFFFFFFFFFFF7) == 0;
}

const __CFString *NSStringFromPredictionPrimarySource(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) > 2)
    return CFSTR("Calendar");
  else
    return off_24D99DE90[a1 - 2];
}

uint64_t _HKMCAppleSleepingWristTemperatureType()
{
  return objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3360]);
}

uint64_t HKFeatureSettingsKeyForIsLoggingHiddenForDisplayTypeIdentifier(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("IsLoggingHidden_%@"), a1);
}

__CFString *HKFeatureSettingsKeyForDeviationDetectionTypeEnabled(unint64_t a1)
{
  if (a1 < 4)
    return off_24D99DEA8[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown-%ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_218AB67F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t HKMCExperienceStoreClientInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25500AC58);
}

uint64_t HKMCExperienceStoreServerInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25501AF30);
}

id _HKMCMenstruationDisplayTypeIdentifiers()
{
  if (_HKMCMenstruationDisplayTypeIdentifiers_onceToken != -1)
    dispatch_once(&_HKMCMenstruationDisplayTypeIdentifiers_onceToken, &__block_literal_global_2);
  return (id)_HKMCMenstruationDisplayTypeIdentifiers_displayTypeIdentifiers;
}

id _HKMCFertilityDisplayTypeIdentifiers()
{
  _QWORD v1[6];

  v1[5] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("DisplayTypeIdentifierOvulationTestResult");
  v1[1] = CFSTR("DisplayTypeIdentifierPregnancyTestResult");
  v1[2] = CFSTR("DisplayTypeIdentifierProgesteroneTestResult");
  v1[3] = CFSTR("DisplayTypeIdentifierCervicalMucusQuality");
  v1[4] = CFSTR("DisplayTypeIdentifierBasalBodyTemperature");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id _AnalysisSettingKeys()
{
  _QWORD v1[11];

  v1[10] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("MenstruationProjectionsEnabled");
  v1[1] = CFSTR("FertileWindowProjectionsEnabled");
  v1[2] = CFSTR("SensorBasedProjectionsEnabled");
  v1[3] = CFSTR("WristTemperatureBasedProjectionsEnabled");
  v1[4] = CFSTR("InternalCycleFactorsOverrideEnabled");
  v1[5] = CFSTR("InternalIgnoreOvulationTestResultsEnabled");
  v1[6] = CFSTR("ProlongedDeviationDetectionEnabled");
  v1[7] = CFSTR("SpottingDeviationDetectionEnabled");
  v1[8] = CFSTR("IrregularDeviationDetectionEnabled");
  v1[9] = CFSTR("InfrequentDeviationDetectionEnabled");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 10);
  return (id)objc_claimAutoreleasedReturnValue();
}

id _NotificationSettingKeys()
{
  _QWORD v1[5];

  v1[4] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("MenstruationNotificationsEnabled");
  v1[1] = CFSTR("MenstruationNotificationTimeOfDay");
  v1[2] = CFSTR("FertileWindowNotificationsEnabled");
  v1[3] = CFSTR("FertileWindowNotificationTimeOfDay");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id _HiddenDisplayTypeSettingKeys()
{
  _QWORD v1[2];

  v1[1] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("ShouldHideByDisplayTypeIdentifier");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id _AlgorithmVersionMismatchSettingKeys()
{
  _QWORD v1[8];

  v1[7] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("MenstruationProjectionsDisabledForVersionMismatch");
  v1[1] = CFSTR("FertileWindowProjectionsDisabledForVersionMismatch");
  v1[2] = CFSTR("LocalizedTextForVersionMismatchAndDisabledProjections");
  v1[3] = CFSTR("MenstruationProjectionsAlgorithmAttributesPhone");
  v1[4] = CFSTR("FertileWindowProjectionsAlgorithmAttributesPhone");
  v1[5] = CFSTR("MenstruationProjectionsAlgorithmAttributesWatch");
  v1[6] = CFSTR("FertileWindowProjectionsAlgorithmAttributesWatch");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 7);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_218AB90EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return objc_opt_class();
}

id OUTLINED_FUNCTION_3_1(id a1)
{
  return a1;
}

id OUTLINED_FUNCTION_4(id a1)
{
  return a1;
}

void sub_218ABD1B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_4_0(uint64_t a1, void *a2)
{
  return a2;
}

const __CFString *HKMCDeviationDetectionAnalyticsKeyFromDeviationType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("ProlongedDeviationDetectedDayIndices");
  else
    return *(&off_24D99E3E8 + a1 - 1);
}

void HKMCPredictionPrimarySourceFromHAMenstrualAlgorithmsPredictionPrimarySource_cold_1(void *a1, unsigned __int8 a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a1;
  objc_msgSend(v3, "numberWithUnsignedChar:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v5;
  _os_log_fault_impl(&dword_218A9C000, v4, OS_LOG_TYPE_FAULT, "Passed an unknown primary source: %@", (uint8_t *)&v6, 0xCu);

}

uint64_t AnalyticsIsEventUsed()
{
  return MEMORY[0x24BE1A1A8]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x24BDD2B20]();
}

uint64_t HKImproveHealthAndActivityAnalyticsAllowed()
{
  return MEMORY[0x24BDD2F40]();
}

uint64_t HKIntersectionDayIndexRange()
{
  return MEMORY[0x24BDD2F58]();
}

uint64_t HKSafeObject()
{
  return MEMORY[0x24BDD3708]();
}

uint64_t HKSensitiveLogItem()
{
  return MEMORY[0x24BDD3730]();
}

uint64_t HKSynchronizeNanoPreferencesUserDefaults()
{
  return MEMORY[0x24BDD3800]();
}

uint64_t HKUnionDayIndexRange()
{
  return MEMORY[0x24BDD3808]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t NSStringFromHKDayIndexRange()
{
  return MEMORY[0x24BDD38A0]();
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _HKBackgroundAndSedentaryPrivateHeartRateContexts()
{
  return MEMORY[0x24BDD4298]();
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x24BDD4338]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x24BDD4340]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x24BDAF150](*(_QWORD *)&val);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

