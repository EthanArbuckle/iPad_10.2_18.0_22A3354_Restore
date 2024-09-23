@implementation WDBuddyFlowUserInfo

- (WDBuddyFlowUserInfo)init
{
  WDBuddyFlowUserInfo *v2;
  uint64_t v3;
  NSMutableDictionary *dataEntryItems;
  uint64_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WDBuddyFlowUserInfo;
  v2 = -[WDBuddyFlowUserInfo init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    dataEntryItems = v2->_dataEntryItems;
    v2->_dataEntryItems = (NSMutableDictionary *)v3;

    HKCreateSerialDispatchQueueWithQOSClass();
    v5 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

+ (id)buddyFlowUserInfoWithDemographicsInformation:(id)a3
{
  id v3;
  WDBuddyFlowUserInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  double v19;
  double v20;

  v3 = a3;
  v4 = objc_alloc_init(WDBuddyFlowUserInfo);
  objc_msgSend(v3, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDBuddyFlowUserInfo setFirstName:](v4, "setFirstName:", v5);

  objc_msgSend(v3, "lastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDBuddyFlowUserInfo setLastName:](v4, "setLastName:", v6);

  objc_msgSend(v3, "dateOfBirthComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDBuddyFlowUserInfo setDateOfBirthComponents:](v4, "setDateOfBirthComponents:", v7);

  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "biologicalSexObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "biologicalSex"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDBuddyFlowUserInfo setSex:](v4, "setSex:", v10);

  v11 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "heightQuantity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnitWithMetricPrefix:", 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValueForUnit:", v13);
  objc_msgSend(v11, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "weightQuantity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD4048], "gramUnitWithMetricPrefix:", 9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValueForUnit:", v17);
  objc_msgSend(v15, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDBuddyFlowUserInfo setOriginalHeightInCm:](v4, "setOriginalHeightInCm:", v14);
  -[WDBuddyFlowUserInfo setOriginalWeightInKg:](v4, "setOriginalWeightInKg:", v18);
  if (v14)
  {
    objc_msgSend(v14, "doubleValue");
    if (v19 > 0.0)
      -[WDBuddyFlowUserInfo setHeightInCm:](v4, "setHeightInCm:", v14);
  }
  if (v18)
  {
    objc_msgSend(v18, "doubleValue");
    if (v20 > 0.0)
      -[WDBuddyFlowUserInfo setWeightInKg:](v4, "setWeightInKg:", v18);
  }

  return v4;
}

- (id)defaultDataEntryItems
{
  void *v3;
  id v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDD1730]);
  v5 = objc_msgSend(v4, "isGivenNameFirst");
  v6 = v5;
  -[WDBuddyFlowUserInfo _dataEntryItemForRegistrantField:](self, "_dataEntryItemForRegistrantField:", v5 ^ 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  -[WDBuddyFlowUserInfo _dataEntryItemForRegistrantField:](self, "_dataEntryItemForRegistrantField:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  -[WDBuddyFlowUserInfo _dataEntryItemForRegistrantField:](self, "_dataEntryItemForRegistrantField:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  -[WDBuddyFlowUserInfo _dataEntryItemForRegistrantField:](self, "_dataEntryItemForRegistrantField:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  -[WDBuddyFlowUserInfo _dataEntryItemForRegistrantField:](self, "_dataEntryItemForRegistrantField:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  -[WDBuddyFlowUserInfo _dataEntryItemForRegistrantField:](self, "_dataEntryItemForRegistrantField:", 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  return v3;
}

- (void)saveChangesToHealthStore:(id)a3 andSaveNameCompletion:(id)a4 andOverallCompletion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  NSObject *queue;
  NSObject *v26;
  id v27;
  id v28;
  NSObject *v29;
  id v30;
  id v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD block[5];
  id v36;
  id v37;
  NSObject *v38;
  _QWORD v39[4];
  NSObject *v40;
  id v41;

  v8 = a3;
  v9 = a4;
  v31 = a5;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString hk_copyNonEmptyString](self->_firstName, "hk_copyNonEmptyString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v12);
  v13 = objc_claimAutoreleasedReturnValue();

  -[NSString hk_copyNonEmptyString](self->_lastName, "hk_copyNonEmptyString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v13)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDD46F0]);
  v32 = (void *)v13;
  if (v16)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BDD46F8]);
  v19 = dispatch_group_create();
  objc_msgSend(MEMORY[0x24BDD3C98], "healthAppDefaultsDomainWithHealthStore:", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v19);
  v21 = MEMORY[0x24BDAC760];
  v22 = *MEMORY[0x24BDD4700];
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke;
  v39[3] = &unk_24D38E3A0;
  v41 = v9;
  v23 = v19;
  v40 = v23;
  v24 = v9;
  objc_msgSend(v20, "setPropertyListValue:forKey:completion:", v18, v22, v39);
  dispatch_group_enter(v23);
  queue = self->_queue;
  block[0] = v21;
  block[1] = 3221225472;
  block[2] = __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke_204;
  block[3] = &unk_24D38D410;
  block[4] = self;
  v36 = v8;
  v37 = v10;
  v38 = v23;
  v26 = v23;
  v27 = v10;
  v28 = v8;
  dispatch_async(queue, block);
  v29 = self->_queue;
  v33[0] = v21;
  v33[1] = 3221225472;
  v33[2] = __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke_210;
  v33[3] = &unk_24D38E3C8;
  v34 = v31;
  v30 = v31;
  dispatch_group_notify(v26, v29, v33);

}

void __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
      __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke_cold_1();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke_204(uint64_t a1)
{
  uint64_t v2;
  os_log_t *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
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
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  v3 = (os_log_t *)MEMORY[0x24BDD3070];
  if (v2)
  {
    v4 = *(void **)(a1 + 40);
    v32 = 0;
    objc_msgSend(v4, "_setDateOfBirthComponents:error:", v2, &v32);
    v5 = v32;
    if (v5)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
        __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke_204_cold_2();
    }
  }
  else
  {
    v5 = 0;
  }
  v6 = *(void **)(a1 + 40);
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "integerValue");
  v31 = v5;
  objc_msgSend(v6, "_setBiologicalSex:error:", v7, &v31);
  v8 = v31;

  if (v8)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
      __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke_204_cold_1();
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "doubleValue");
  v11 = v10;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "doubleValue");
  v13 = vabdd_f64(v11, v12);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "doubleValue");
  v15 = v14;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "doubleValue");
  v17 = vabdd_f64(v15, v16);
  if (v13 > 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD35D0]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x24BDD3E50];
    objc_msgSend(MEMORY[0x24BDD4048], "meterUnitWithMetricPrefix:", 5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "doubleValue");
    objc_msgSend(v19, "quantityWithUnit:doubleValue:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD3E68], "quantitySampleWithType:quantity:startDate:endDate:", v18, v21, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 48));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v22);

  }
  if (v17 > 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD33B8]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x24BDD3E50];
    objc_msgSend(MEMORY[0x24BDD4048], "gramUnitWithMetricPrefix:", 9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "doubleValue");
    objc_msgSend(v24, "quantityWithUnit:doubleValue:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD3E68], "quantitySampleWithType:quantity:startDate:endDate:", v23, v26, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 48));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v27);

  }
  if (objc_msgSend(v9, "count"))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
    v28 = *(void **)(a1 + 40);
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke_208;
    v29[3] = &unk_24D38CFB0;
    v30 = *(id *)(a1 + 56);
    objc_msgSend(v28, "saveObjects:withCompletion:", v9, v29);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke_208(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (v4)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
      __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke_208_cold_1();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke_210(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_dataEntryItemForRegistrantField:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dataEntryItems, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    switch(a3)
    {
      case 0uLL:
        v7 = objc_alloc(MEMORY[0x24BE4A858]);
        WDBundle();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FIRST_NAME"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDBuddyFlowUserInfo firstName](self, "firstName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)objc_msgSend(v7, "initWithTitle:registrantModelKey:defaultText:intention:", v9, CFSTR("firstName"), v10, 0);

        v11 = CFSTR("FirstNameEntry");
        goto LABEL_11;
      case 1uLL:
        v12 = objc_alloc(MEMORY[0x24BE4A858]);
        WDBundle();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("LAST_NAME"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDBuddyFlowUserInfo lastName](self, "lastName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)objc_msgSend(v12, "initWithTitle:registrantModelKey:defaultText:intention:", v14, CFSTR("lastName"), v15, 2);

        v11 = CFSTR("LastNameEntry");
        goto LABEL_11;
      case 2uLL:
        -[WDBuddyFlowUserInfo _createDateOfBirthEntryItem](self, "_createDateOfBirthEntryItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v16;
        v17 = CFSTR("DateOfBirthEntry");
        goto LABEL_8;
      case 3uLL:
        -[WDBuddyFlowUserInfo _createSexEntryItem](self, "_createSexEntryItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v16;
        v17 = CFSTR("SexEntry");
LABEL_8:
        objc_msgSend(v16, "setAccessibilityIdentifier:", v17);
        break;
      case 4uLL:
        v18 = objc_alloc(MEMORY[0x24BE4A848]);
        WDBundle();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("HEIGHT"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDBuddyFlowUserInfo heightInCm](self, "heightInCm");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)objc_msgSend(v18, "initWithTitle:registrantModelKey:heightInCm:defaultHeightInCm:", v20, CFSTR("heightInCm"), v21, 0);

        v11 = CFSTR("HeightEntry");
        goto LABEL_11;
      case 5uLL:
        v22 = objc_alloc(MEMORY[0x24BE4A860]);
        WDBundle();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("WEIGHT"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDBuddyFlowUserInfo weightInKg](self, "weightInKg");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)objc_msgSend(v22, "initWithTitle:registrantModelKey:weightInKg:defaultWeightInKg:", v24, CFSTR("weightInKg"), v25, 0);

        v11 = CFSTR("WeightEntry");
LABEL_11:
        objc_msgSend(v6, "setAccessibilityIdentifier:", v11);
        objc_msgSend(v6, "setDelegate:", self);
        break;
      default:
        v6 = 0;
        break;
    }
    objc_msgSend(v6, "setPlaceholderType:", 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dataEntryItems, "setObject:forKeyedSubscript:", v6, v5);
  }

  return v6;
}

- (id)_createDateOfBirthEntryItem
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  -[WDBuddyFlowUserInfo _todayBirthdayDateComponents](self, "_todayBirthdayDateComponents");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE4A840], "gregorianGMTCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)v3;
  objc_msgSend(v4, "dateFromComponents:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 4, -130, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 4, -30, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_dateOfBirthComponents)
  {
    objc_msgSend(v4, "dateFromComponents:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_alloc(MEMORY[0x24BE4A840]);
  HKHealthKitFrameworkBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DATE_OF_BIRTH"), &stru_24D38E7C8, *MEMORY[0x24BDD2F10]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE4A920], "valueRangeWithMinValue:maxValue:", v6, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithTitle:registrantModelKey:date:defaultDate:dateRange:exportFormatter:", v11, CFSTR("dateOfBirthComponents"), v8, v7, v12, 0);

  objc_msgSend(v13, "setDelegate:", self);
  return v13;
}

- (id)_createSexEntryItem
{
  void *v3;
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
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x24BDAC8D0];
  WDBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("BIOLOGICAL_SEX_NOT_SET"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v4;
  WDBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FEMALE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v6;
  WDBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MALE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v8;
  WDBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("OTHER"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDBuddyFlowUserInfo sex](self, "sex");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToNumber:", &unk_24D3A5E70) & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    -[WDBuddyFlowUserInfo sex](self, "sex");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v14 = objc_alloc(MEMORY[0x24BE4A850]);
  HKHealthKitFrameworkBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("BIOLOGICAL_SEX"), &stru_24D38E7C8, *MEMORY[0x24BDD2F10]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithTitle:registrantModelKey:choices:choiceDisplayNames:defaultChoice:", v16, CFSTR("sex"), &unk_24D3A6368, v11, v13);

  objc_msgSend(v17, "setDelegate:", self);
  return v17;
}

- (id)_todayBirthdayDateComponents
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE4A840], "gregorianGMTCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_dateOfBirthDateComponentsWithDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)dataEntryItemDidUpdateValue:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "formattedKeyAndValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDBuddyFlowUserInfo valueForKey:](self, "valueForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "isEqual:", v11) & 1) == 0)
          -[WDBuddyFlowUserInfo setValue:forKey:](self, "setValue:forKey:", v10, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (WDBuddyFlowUserInfoDelegate)delegate
{
  return (WDBuddyFlowUserInfoDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_storeStrong((id *)&self->_firstName, a3);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_storeStrong((id *)&self->_lastName, a3);
}

- (NSDateComponents)dateOfBirthComponents
{
  return self->_dateOfBirthComponents;
}

- (void)setDateOfBirthComponents:(id)a3
{
  objc_storeStrong((id *)&self->_dateOfBirthComponents, a3);
}

- (NSNumber)sex
{
  return self->_sex;
}

- (void)setSex:(id)a3
{
  objc_storeStrong((id *)&self->_sex, a3);
}

- (NSNumber)heightInCm
{
  return self->_heightInCm;
}

- (void)setHeightInCm:(id)a3
{
  objc_storeStrong((id *)&self->_heightInCm, a3);
}

- (NSNumber)weightInKg
{
  return self->_weightInKg;
}

- (void)setWeightInKg:(id)a3
{
  objc_storeStrong((id *)&self->_weightInKg, a3);
}

- (NSNumber)originalHeightInCm
{
  return self->_originalHeightInCm;
}

- (void)setOriginalHeightInCm:(id)a3
{
  objc_storeStrong((id *)&self->_originalHeightInCm, a3);
}

- (NSNumber)originalWeightInKg
{
  return self->_originalWeightInKg;
}

- (void)setOriginalWeightInKg:(id)a3
{
  objc_storeStrong((id *)&self->_originalWeightInKg, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalWeightInKg, 0);
  objc_storeStrong((id *)&self->_originalHeightInCm, 0);
  objc_storeStrong((id *)&self->_weightInKg, 0);
  objc_storeStrong((id *)&self->_heightInCm, 0);
  objc_storeStrong((id *)&self->_sex, 0);
  objc_storeStrong((id *)&self->_dateOfBirthComponents, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dataEntryItems, 0);
}

void __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_215814000, v0, v1, "Failed to save first/last name in buddy: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke_204_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_215814000, v0, v1, "Failed to save biological sex in buddy: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke_204_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_215814000, v0, v1, "Failed to save date of birth in buddy: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke_208_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_215814000, v0, v1, "Failed to save height and weight samples in buddy: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
