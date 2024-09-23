@implementation WDHeartEventListDataProvider

- (id)sampleTypes
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  -[WDHeartEventListDataProvider _heartEventType](self, "_heartEventType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)cellStyle
{
  return 2;
}

- (double)customCellHeight
{
  return *MEMORY[0x24BDF7DE0];
}

- (double)customEstimatedCellHeight
{
  return *MEMORY[0x24BDF7DE0];
}

- (id)customCellForObject:(id)a3 indexPath:(id)a4 tableView:(id)a5
{
  id v6;
  WDDataTableViewCell *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  objc_msgSend(a5, "dequeueReusableCellWithIdentifier:", CFSTR("CellIdentifier"));
  v7 = (WDDataTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = -[WDDataTableViewCell initWithStyle:reuseIdentifier:]([WDDataTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, CFSTR("CellIdentifier"));
  -[WDDataTableViewCell setAccessoryType:](v7, "setAccessoryType:", 1);
  objc_msgSend(v6, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", *MEMORY[0x24BDD43B8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[WDDataTableViewCell setDisplayValue:](v7, "setDisplayValue:", v9);
  }
  else
  {
    WDBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("HEART_RATE_NO_VALUE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDDataTableViewCell setDisplayValue:](v7, "setDisplayValue:", v11);

  }
  objc_msgSend(v6, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HKFormattedStringForDate();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataTableViewCell setDateString:](v7, "setDateString:", v13);

  return v7;
}

- (id)titleForSection:(unint64_t)a3
{
  void *v3;
  void *v4;
  __CFString *v5;

  -[WDSampleListDataProvider samples](self, "samples", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") < 1)
  {
    v5 = &stru_24D38E7C8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("LONG_BEATS_PER_MINUTE"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)createQueryForSampleType:(id)a3 predicate:(id)a4 limit:(int64_t)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7
{
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v20[5];
  id v21;

  v11 = a7;
  v12 = (objc_class *)MEMORY[0x24BDD3F00];
  v13 = a6;
  v14 = a4;
  v15 = [v12 alloc];
  -[WDHeartEventListDataProvider _heartEventType](self, "_heartEventType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __104__WDHeartEventListDataProvider_createQueryForSampleType_predicate_limit_sortDescriptors_resultsHandler___block_invoke;
  v20[3] = &unk_24D38DD20;
  v20[4] = self;
  v21 = v11;
  v17 = v11;
  v18 = (void *)objc_msgSend(v15, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v16, v14, a5, v13, v20);

  return v18;
}

void __104__WDHeartEventListDataProvider_createQueryForSampleType_predicate_limit_sortDescriptors_resultsHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  id obj;
  uint64_t v31;
  _QWORD block[4];
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[6];
  NSObject *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    v27 = v9;
    v29 = v7;
    v11 = dispatch_group_create();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v28 = v8;
    obj = v8;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v12)
    {
      v13 = v12;
      v31 = *(_QWORD *)v40;
      v14 = *MEMORY[0x24BDD35B8];
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v40 != v31)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v15);
          dispatch_group_enter(v11);
          v17 = (void *)MEMORY[0x24BDD3E88];
          objc_msgSend(v16, "startDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "endDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "predicateForSamplesWithStartDate:endDate:inclusiveEndDates:options:", v18, v19, 1, 3);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD3DC0], "quantityTypeForIdentifier:", v14);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_alloc(MEMORY[0x24BDD3F00]);
          v37[0] = MEMORY[0x24BDAC760];
          v37[1] = 3221225472;
          v37[2] = __104__WDHeartEventListDataProvider_createQueryForSampleType_predicate_limit_sortDescriptors_resultsHandler___block_invoke_2;
          v37[3] = &unk_24D38D600;
          v37[4] = *(_QWORD *)(a1 + 32);
          v37[5] = v16;
          v38 = v11;
          v23 = (void *)objc_msgSend(v22, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v21, v20, 0, 0, v37);
          objc_msgSend(*(id *)(a1 + 32), "profile");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "healthStore");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "executeQuery:", v23);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v13);
    }

    dispatch_get_global_queue(0, 0);
    v26 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __104__WDHeartEventListDataProvider_createQueryForSampleType_predicate_limit_sortDescriptors_resultsHandler___block_invoke_3;
    block[3] = &unk_24D38DCF8;
    v36 = *(id *)(a1 + 40);
    v7 = v29;
    v33 = v29;
    v34 = obj;
    v10 = v27;
    v35 = v27;
    dispatch_group_notify(v11, v26, block);

    v8 = v28;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __104__WDHeartEventListDataProvider_createQueryForSampleType_predicate_limit_sortDescriptors_resultsHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v4 = (void *)MEMORY[0x24BE4A670];
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "displayTypeController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "unitController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minMaxStringForHeartRates:displayTypeController:unitController:", v6, v7, v8);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 40), "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    v11 = v10;
    if (v10)
      v12 = v10;
    else
      v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v13 = v12;

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BDD43B8]);
    objc_msgSend(*(id *)(a1 + 40), "_setMetadata:", v13);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __104__WDHeartEventListDataProvider_createQueryForSampleType_predicate_limit_sortDescriptors_resultsHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (id)_heartEventType
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
