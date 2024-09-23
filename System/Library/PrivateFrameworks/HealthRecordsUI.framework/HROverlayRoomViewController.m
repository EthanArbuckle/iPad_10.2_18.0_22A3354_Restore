@implementation HROverlayRoomViewController

- (HROverlayRoomViewController)initWithOntologyConcept:(id)a3 configuration:(id)a4 displayDate:(id)a5 masterDataSource:(id)a6 seriesDataSources:(id)a7 outOfRangeDataSource:(id)a8 noRangeDataSource:(id)a9 overlayMode:(int64_t)a10 applicationItems:(id)a11
{
  id v18;
  id v19;
  HROverlayRoomViewController *v20;
  HROverlayRoomViewController *v21;
  uint64_t v22;
  NSArray *seriesDataSources;
  void *v24;
  void *v25;
  uint64_t v26;
  NSArray *displayTypes;
  id obj;
  id v30;
  id v31;
  id v32;
  id v33;
  objc_super v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v32 = a4;
  obj = a6;
  v18 = a6;
  v19 = a7;
  v31 = a8;
  v30 = a9;
  v34.receiver = self;
  v34.super_class = (Class)HROverlayRoomViewController;
  v20 = -[HKOverlayRoomViewController initWithDisplayDate:applicationItems:factorDisplayTypes:mode:](&v34, sel_initWithDisplayDate_applicationItems_factorDisplayTypes_mode_, a5, a11, 0, a10);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_ontologyConcept, a3);
    objc_storeStrong((id *)&v21->_configuration, a4);
    objc_storeStrong((id *)&v21->_masterDataSource, obj);
    v22 = objc_msgSend(v19, "copy");
    seriesDataSources = v21->_seriesDataSources;
    v21->_seriesDataSources = (NSArray *)v22;

    objc_storeStrong((id *)&v21->_outOfRangeDataSource, a8);
    objc_storeStrong((id *)&v21->_noRangeDataSource, a9);
    objc_msgSend((id)objc_opt_class(), "_verticalAxis");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "chartDisplayTypeWithVerticalAxis:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v26 = objc_claimAutoreleasedReturnValue();
    displayTypes = v21->_displayTypes;
    v21->_displayTypes = (NSArray *)v26;

  }
  return v21;
}

- (HROverlayRoomViewController)initWithUserConcept:(id)a3 configuration:(id)a4 displayDate:(id)a5 masterDataSource:(id)a6 seriesDataSources:(id)a7 outOfRangeDataSource:(id)a8 noRangeDataSource:(id)a9 overlayMode:(int64_t)a10 applicationItems:(id)a11
{
  id v18;
  id v19;
  HROverlayRoomViewController *v20;
  HROverlayRoomViewController *v21;
  uint64_t v22;
  NSArray *seriesDataSources;
  void *v24;
  void *v25;
  uint64_t v26;
  NSArray *displayTypes;
  id obj;
  id v30;
  id v31;
  id v32;
  id v33;
  objc_super v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v32 = a4;
  obj = a6;
  v18 = a6;
  v19 = a7;
  v31 = a8;
  v30 = a9;
  v34.receiver = self;
  v34.super_class = (Class)HROverlayRoomViewController;
  v20 = -[HKOverlayRoomViewController initWithDisplayDate:applicationItems:factorDisplayTypes:mode:](&v34, sel_initWithDisplayDate_applicationItems_factorDisplayTypes_mode_, a5, a11, 0, a10);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_userConcept, a3);
    objc_storeStrong((id *)&v21->_configuration, a4);
    objc_storeStrong((id *)&v21->_masterDataSource, obj);
    v22 = objc_msgSend(v19, "copy");
    seriesDataSources = v21->_seriesDataSources;
    v21->_seriesDataSources = (NSArray *)v22;

    objc_storeStrong((id *)&v21->_outOfRangeDataSource, a8);
    objc_storeStrong((id *)&v21->_noRangeDataSource, a9);
    objc_msgSend((id)objc_opt_class(), "_verticalAxis");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "chartDisplayTypeWithVerticalAxis:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v26 = objc_claimAutoreleasedReturnValue();
    displayTypes = v21->_displayTypes;
    v21->_displayTypes = (NSArray *)v26;

  }
  return v21;
}

+ (void)determineChartabilityOfOntologyConcept:(id)a3 withApplicationItems:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "healthStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0CB4A38];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __102__HROverlayRoomViewController_determineChartabilityOfOntologyConcept_withApplicationItems_completion___block_invoke;
  v16[3] = &unk_1E74D15B0;
  v18 = v8;
  v19 = v9;
  v17 = v7;
  v13 = v8;
  v14 = v9;
  v15 = v7;
  objc_msgSend(v10, "fetchRecordsForConceptId:keyPath:completion:", v11, v12, v16);

}

void __102__HROverlayRoomViewController_determineChartabilityOfOntologyConcept_withApplicationItems_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _TtC15HealthRecordsUI35MedicalRecordChartabilityDeterminer *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5 = objc_alloc_init(_TtC15HealthRecordsUI35MedicalRecordChartabilityDeterminer);
  v4 = a1[4];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __102__HROverlayRoomViewController_determineChartabilityOfOntologyConcept_withApplicationItems_completion___block_invoke_2;
  v6[3] = &unk_1E74D1588;
  v9 = a1[6];
  v7 = a1[4];
  v8 = a1[5];
  -[MedicalRecordChartabilityDeterminer determineChartabilityForConcept:records:completion:](v5, "determineChartabilityForConcept:records:completion:", v4, v3, v6);

}

void __102__HROverlayRoomViewController_determineChartabilityOfOntologyConcept_withApplicationItems_completion___block_invoke_2(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __102__HROverlayRoomViewController_determineChartabilityOfOntologyConcept_withApplicationItems_completion___block_invoke_3;
  v5[3] = &unk_1E74D1560;
  v6 = v3;
  v9 = a1[6];
  v7 = a1[4];
  v8 = a1[5];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __102__HROverlayRoomViewController_determineChartabilityOfOntologyConcept_withApplicationItems_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  HROverlayRoomViewController *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HROverlayRoomViewController *v12;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = objc_msgSend(v2, "shouldProduceAtLeastOneOverlay");
    v4 = [HROverlayRoomViewController alloc];
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "latestChartableDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "masterDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "seriesDataSources");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "outOfRangeDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "noRangeDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HROverlayRoomViewController initWithOntologyConcept:configuration:displayDate:masterDataSource:seriesDataSources:outOfRangeDataSource:noRangeDataSource:overlayMode:applicationItems:](v4, "initWithOntologyConcept:configuration:displayDate:masterDataSource:seriesDataSources:outOfRangeDataSource:noRangeDataSource:overlayMode:applicationItems:", v5, v6, v7, v8, v9, v10, v11, v3, *(_QWORD *)(a1 + 48));

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

+ (void)determineChartabilityOfUserConcept:(id)a3 records:(id)a4 withApplicationItems:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _TtC15HealthRecordsUI35MedicalRecordChartabilityDeterminer *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = a4;
  v16 = objc_alloc_init(_TtC15HealthRecordsUI35MedicalRecordChartabilityDeterminer);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __106__HROverlayRoomViewController_determineChartabilityOfUserConcept_records_withApplicationItems_completion___block_invoke;
  v17[3] = &unk_1E74D1588;
  v19 = v10;
  v20 = v11;
  v18 = v9;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  -[MedicalRecordChartabilityDeterminer determineChartabilityForUserConcept:records:completion:](v16, "determineChartabilityForUserConcept:records:completion:", v14, v12, v17);

}

void __106__HROverlayRoomViewController_determineChartabilityOfUserConcept_records_withApplicationItems_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __106__HROverlayRoomViewController_determineChartabilityOfUserConcept_records_withApplicationItems_completion___block_invoke_2;
  v5[3] = &unk_1E74D1560;
  v6 = v3;
  v9 = a1[6];
  v7 = a1[4];
  v8 = a1[5];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __106__HROverlayRoomViewController_determineChartabilityOfUserConcept_records_withApplicationItems_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  HROverlayRoomViewController *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HROverlayRoomViewController *v12;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = objc_msgSend(v2, "shouldProduceAtLeastOneOverlay");
    v4 = [HROverlayRoomViewController alloc];
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "latestChartableDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "masterDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "seriesDataSources");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "outOfRangeDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "noRangeDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HROverlayRoomViewController initWithUserConcept:configuration:displayDate:masterDataSource:seriesDataSources:outOfRangeDataSource:noRangeDataSource:overlayMode:applicationItems:](v4, "initWithUserConcept:configuration:displayDate:masterDataSource:seriesDataSources:outOfRangeDataSource:noRangeDataSource:overlayMode:applicationItems:", v5, v6, v7, v8, v9, v10, v11, v3, *(_QWORD *)(a1 + 48));

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (BOOL)supportsShowAllFilters
{
  if (-[HKOverlayRoomViewController controllerMode](self, "controllerMode") == 3)
    return 0;
  if (-[NSArray count](self->_seriesDataSources, "count") > 1)
    return 1;
  if (!self->_outOfRangeDataSource)
    return 0;
  return self->_noRangeDataSource != 0;
}

- (id)createChartOverlayViewController
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  NSArray *displayTypes;
  id v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = objc_alloc((Class)-[MedicalRecordChartConfiguration chartControllerClass](self->_configuration, "chartControllerClass"));
  displayTypes = self->_displayTypes;
  v17 = v3;
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "healthStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "unitController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dateCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chartDataCacheController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeScopeController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController applicationItems](self, "applicationItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sampleDateRangeController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewController displayDate](self, "displayDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v17, "initWithDisplayTypes:healthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:", displayTypes, v15, v4, v5, v7, v9, v11, v12, 0, 1280);

  objc_msgSend(v13, "addChartViewObserver:", v13);
  return v13;
}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[HKConcept localizedPreferredName](self->_ontologyConcept, "localizedPreferredName", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[HROverlayRoomViewController title](self, "title");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)primaryDisplayTypeWithApplicationItems:(id)a3
{
  return -[NSArray firstObject](self->_displayTypes, "firstObject", a3);
}

- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;
  _TtC15HealthRecordsUI32MedicalRecordChartOverlayContext *v11;
  void *v12;
  void *v13;
  _TtC15HealthRecordsUI32MedicalRecordChartOverlayContext *v14;
  _TtC15HealthRecordsUI32MedicalRecordChartOverlayContext *v15;
  void *v16;
  void *v17;
  _TtC15HealthRecordsUI32MedicalRecordChartOverlayContext *v18;
  NSArray *seriesDataSources;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  id v29;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_verticalAxis");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0D2F8D0], "chartFilterDefaultForSingle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D2F8D0], "chartFilterDefaultForMultiple");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -1;
  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v10, "count") < v9 && self->_outOfRangeDataSource)
  {
    v11 = [_TtC15HealthRecordsUI32MedicalRecordChartOverlayContext alloc];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("RECORDS_OUT_OF_RANGE"), &stru_1E74EA150, CFSTR("HealthUI-Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MedicalRecordChartOverlayContext initWithTitle:dataSource:defaultColors:selectedColors:verticalAxis:](v11, "initWithTitle:dataSource:defaultColors:selectedColors:verticalAxis:", v13, self->_outOfRangeDataSource, v8, 0, v7);

    objc_msgSend(v10, "addObject:", v14);
  }
  if (objc_msgSend(v10, "count") < v9 && self->_noRangeDataSource)
  {
    v15 = [_TtC15HealthRecordsUI32MedicalRecordChartOverlayContext alloc];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("RECORDS_NO_RANGE"), &stru_1E74EA150, CFSTR("HealthUI-Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[MedicalRecordChartOverlayContext initWithTitle:dataSource:defaultColors:selectedColors:verticalAxis:](v15, "initWithTitle:dataSource:defaultColors:selectedColors:verticalAxis:", v17, self->_noRangeDataSource, v8, 0, v7);

    objc_msgSend(v10, "addObject:", v18);
  }
  if (objc_msgSend(v10, "count") < v9 && -[NSArray count](self->_seriesDataSources, "count") >= 2)
  {
    seriesDataSources = self->_seriesDataSources;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __103__HROverlayRoomViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke;
    v27[3] = &unk_1E74D15D8;
    v28 = v8;
    v29 = v7;
    -[NSArray hk_map:](seriesDataSources, "hk_map:", v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v20);

  }
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2F7F8]), "initWithSectionTitle:overlayContextItems:", 0, v10);
  v22 = objc_alloc(MEMORY[0x1E0D2F800]);
  v30 = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithContainerTitle:overlayContextSections:", 0, v23);
  v31[0] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

_TtC15HealthRecordsUI32MedicalRecordChartOverlayContext *__103__HROverlayRoomViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _TtC15HealthRecordsUI32MedicalRecordChartOverlayContext *v4;
  void *v5;
  _TtC15HealthRecordsUI32MedicalRecordChartOverlayContext *v6;

  v3 = a2;
  v4 = [_TtC15HealthRecordsUI32MedicalRecordChartOverlayContext alloc];
  objc_msgSend(v3, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MedicalRecordChartOverlayContext initWithTitle:dataSource:defaultColors:selectedColors:verticalAxis:](v4, "initWithTitle:dataSource:defaultColors:selectedColors:verticalAxis:", v5, v3, *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));

  return v6;
}

- (id)initialSelectedContextForMode:(int64_t)a3
{
  return 0;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithOntologyConcept:configuration:displayDate:masterDataSource:seriesDataSources:outOfRangeDataSource:noRangeDataSource:overlayMode:applicationItems:", self->_ontologyConcept, self->_configuration, v9, self->_masterDataSource, self->_seriesDataSources, self->_outOfRangeDataSource, self->_noRangeDataSource, a3, v8);

  return v10;
}

+ (id)_verticalAxis
{
  return (id)objc_msgSend(MEMORY[0x1E0D2F7C0], "standardNumericYAxisWithConfigurationOverrides:", 0);
}

- (BOOL)hasChart
{
  return self->_hasChart;
}

- (HKConcept)ontologyConcept
{
  return self->_ontologyConcept;
}

- (void)setOntologyConcept:(id)a3
{
  objc_storeStrong((id *)&self->_ontologyConcept, a3);
}

- (HKUserDomainConcept)userConcept
{
  return self->_userConcept;
}

- (void)setUserConcept:(id)a3
{
  objc_storeStrong((id *)&self->_userConcept, a3);
}

- (_TtP15HealthRecordsUI31MedicalRecordChartConfiguration_)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (NSArray)displayTypes
{
  return self->_displayTypes;
}

- (void)setDisplayTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1360);
}

- (_TtC15HealthRecordsUI28MedicalRecordChartDataSource)masterDataSource
{
  return self->_masterDataSource;
}

- (void)setMasterDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_masterDataSource, a3);
}

- (NSArray)seriesDataSources
{
  return self->_seriesDataSources;
}

- (void)setSeriesDataSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1376);
}

- (_TtC15HealthRecordsUI28MedicalRecordChartDataSource)outOfRangeDataSource
{
  return self->_outOfRangeDataSource;
}

- (void)setOutOfRangeDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_outOfRangeDataSource, a3);
}

- (_TtC15HealthRecordsUI28MedicalRecordChartDataSource)noRangeDataSource
{
  return self->_noRangeDataSource;
}

- (void)setNoRangeDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_noRangeDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noRangeDataSource, 0);
  objc_storeStrong((id *)&self->_outOfRangeDataSource, 0);
  objc_storeStrong((id *)&self->_seriesDataSources, 0);
  objc_storeStrong((id *)&self->_masterDataSource, 0);
  objc_storeStrong((id *)&self->_displayTypes, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_userConcept, 0);
  objc_storeStrong((id *)&self->_ontologyConcept, 0);
}

@end
