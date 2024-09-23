@implementation WDElectrocardiogramListDataProvider

- (WDElectrocardiogramListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4
{
  WDElectrocardiogramListDataProvider *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WDElectrocardiogramListDataProvider;
  result = -[WDSampleListDataProvider initWithDisplayType:profile:](&v5, sel_initWithDisplayType_profile_, a3, a4);
  if (result)
    result->_mode = 0;
  return result;
}

- (WDElectrocardiogramListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4 mode:(int64_t)a5
{
  WDElectrocardiogramListDataProvider *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WDElectrocardiogramListDataProvider;
  result = -[WDSampleListDataProvider initWithDisplayType:profile:](&v7, sel_initWithDisplayType_profile_, a3, a4);
  if (result)
    result->_mode = a5;
  return result;
}

- (id)activeECGAlgorithmVersion
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;

  v2 = (void *)MEMORY[0x24BDD3B70];
  -[WDSampleListDataProvider profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "healthStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v2, "versionWithHealthStore:error:", v4, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;

  if (v6)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
      -[WDElectrocardiogramListDataProvider activeECGAlgorithmVersion].cold.1((uint64_t)v6, v7);
  }

  return v5;
}

- (id)createQueryForSampleType:(id)a3 predicate:(id)a4 limit:(int64_t)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  objc_super v18;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (-[WDElectrocardiogramListDataProvider recentSampleLimit](self, "recentSampleLimit"))
    a5 = -[WDElectrocardiogramListDataProvider recentSampleLimit](self, "recentSampleLimit");
  v18.receiver = self;
  v18.super_class = (Class)WDElectrocardiogramListDataProvider;
  -[WDSampleListDataProvider createQueryForSampleType:predicate:limit:sortDescriptors:resultsHandler:](&v18, sel_createQueryForSampleType_predicate_limit_sortDescriptors_resultsHandler_, v12, v13, a5, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)updateController:(id)a3 didReceiveUpdateForType:(id)a4 samplesAdded:(id)a5 objectsRemoved:(id)a6 recoveringFromError:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  objc_super v16;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (-[WDElectrocardiogramListDataProvider recentSampleLimit](self, "recentSampleLimit"))
  {
    if (objc_msgSend(v15, "count") || v7)
      goto LABEL_6;
  }
  else if (v7)
  {
LABEL_6:
    -[WDElectrocardiogramListDataProvider setShouldConsiderRequeryDueToDeletedObjects:](self, "setShouldConsiderRequeryDueToDeletedObjects:", 1);
  }
  v16.receiver = self;
  v16.super_class = (Class)WDElectrocardiogramListDataProvider;
  -[WDSampleListDataProvider updateController:didReceiveUpdateForType:samplesAdded:objectsRemoved:recoveringFromError:](&v16, sel_updateController_didReceiveUpdateForType_samplesAdded_objectsRemoved_recoveringFromError_, v12, v13, v14, v15, v7);

}

- (void)refineSamplesWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t i;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void (**v13)(id, void *, _QWORD);

  v13 = (void (**)(id, void *, _QWORD))a3;
  if (-[WDElectrocardiogramListDataProvider recentSampleLimit](self, "recentSampleLimit"))
  {
    -[WDSampleListDataProvider samples](self, "samples");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allSamples");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = -[WDElectrocardiogramListDataProvider recentSampleLimit](self, "recentSampleLimit");
          i < objc_msgSend(v5, "count");
          ++i)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v9);

    }
    v13[2](v13, v6, 0);
    if (-[WDElectrocardiogramListDataProvider shouldConsiderRequeryDueToDeletedObjects](self, "shouldConsiderRequeryDueToDeletedObjects"))
    {
      -[WDElectrocardiogramListDataProvider setShouldConsiderRequeryDueToDeletedObjects:](self, "setShouldConsiderRequeryDueToDeletedObjects:", 0);
      -[WDSampleListDataProvider samples](self, "samples");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");
      v12 = -[WDElectrocardiogramListDataProvider recentSampleLimit](self, "recentSampleLimit");

      if (v11 < v12)
        -[WDSampleListDataProvider viewControllerWantsDataIncludingDate:](self, "viewControllerWantsDataIncludingDate:", 0);
    }

  }
  else
  {
    v13[2](v13, 0, 0);
  }

}

- (id)sampleTypes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  -[WDSampleListDataProvider displayType](self, "displayType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sampleType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)numberOfSections
{
  void *v2;
  unint64_t v3;

  -[WDSampleListDataProvider samples](self, "samples");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") > 0;

  return v3;
}

- (unint64_t)numberOfObjectsForSection:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WDElectrocardiogramListDataProvider;
  return -[WDSampleListDataProvider numberOfObjectsForSection:](&v4, sel_numberOfObjectsForSection_, a3);
}

- (BOOL)calendarDateSelectorVisible
{
  return 1;
}

- (BOOL)canEditRowAtIndexPath:(id)a3
{
  return 0;
}

- (id)queryDateForSelectedDate:(id)a3
{
  return (id)objc_msgSend(a3, "dateByAddingTimeInterval:", -(double)(unint64_t)(*MEMORY[0x24BDD2818] * *MEMORY[0x24BDD2B68]));
}

- (id)titleForSection:(unint64_t)a3
{
  return 0;
}

- (id)textForObject:(id)a3
{
  return &stru_24D38E7C8;
}

- (int64_t)cellStyle
{
  return 2;
}

- (void)customizeTableView:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)WDElectrocardiogramListDataProvider;
  -[WDSampleListDataProvider customizeTableView:](&v6, sel_customizeTableView_, v4);
  if (!-[WDElectrocardiogramListDataProvider recentSampleLimit](self, "recentSampleLimit")
    && !-[WDElectrocardiogramListDataProvider mode](self, "mode"))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSeparatorColor:", v5);

  }
}

- (double)customCellHeight
{
  return *MEMORY[0x24BDF7DE0];
}

- (double)customEstimatedCellHeight
{
  double result;

  objc_msgSend(MEMORY[0x24BE4A620], "estimatedHeight");
  return result;
}

- (id)_cellForSample:(id)a3 indexPath:(id)a4 tableView:(id)a5 activeAlgorithmVersion:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  if (-[WDElectrocardiogramListDataProvider mode](self, "mode"))
    -[WDElectrocardiogramListDataProvider _compactCellForSample:indexPath:tableView:activeAlgorithmVersion:](self, "_compactCellForSample:indexPath:tableView:activeAlgorithmVersion:", v12, v11, v10, a6);
  else
    -[WDElectrocardiogramListDataProvider _waveCellForSample:indexPath:tableView:activeAlgorithmVersion:](self, "_waveCellForSample:indexPath:tableView:activeAlgorithmVersion:", v12, v11, v10, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_waveCellForSample:(id)a3 indexPath:(id)a4 tableView:(id)a5 activeAlgorithmVersion:(int64_t)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v10 = a3;
  v11 = (void *)MEMORY[0x24BE4A620];
  v12 = a5;
  v13 = a4;
  objc_msgSend(v11, "defaultReuseIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dequeueReusableCellWithIdentifier:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "setSample:", v10);
    objc_msgSend(v15, "setActiveAlgorithmVersion:", a6);
  }
  else
  {
    v16 = objc_alloc(MEMORY[0x24BE4A620]);
    -[WDSampleListDataProvider profile](self, "profile");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dateCache");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v16, "initWithSample:dateCache:onboarding:activeAlgorithmVersion:", v10, v18, 0, a6);

  }
  v19 = objc_msgSend(v13, "row");

  -[WDSampleListDataProvider samples](self, "samples");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "allSamples");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBottomPaddingDisabled:", v19 == objc_msgSend(v21, "count") - 1);

  return v15;
}

- (id)_compactCellForSample:(id)a3 indexPath:(id)a4 tableView:(id)a5 activeAlgorithmVersion:(int64_t)a6
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v8 = a3;
  v9 = (void *)MEMORY[0x24BE4A620];
  v10 = a5;
  objc_msgSend(v9, "defaultReuseIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dequeueReusableCellWithIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v20 = objc_alloc(MEMORY[0x24BDF6E60]);
    objc_msgSend(MEMORY[0x24BE4A620], "defaultReuseIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v20, "initWithStyle:reuseIdentifier:", 3, v21);

    if (v8)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("ECG_CARD_LOADING_TEXT"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable-Cinnamon"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    HKConditionallyRedactedHeartRhythmString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setText:", v24);

    objc_msgSend(v12, "detailTextLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", &stru_24D38E7C8);
    goto LABEL_9;
  }
  if (!v8)
    goto LABEL_8;
LABEL_3:
  objc_msgSend(v8, "_localizedClassificationWithActiveAlgorithmVersion:", a6);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = CFSTR(" ");
  objc_msgSend(v12, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v15);

  objc_msgSend(v8, "endDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  HKLocalizedStringForDateAndTemplate();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "detailTextLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setText:", v18);

LABEL_9:
  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "detailTextLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTextColor:", v26);

  objc_msgSend(v12, "setAccessoryType:", 1);
  return v12;
}

- (id)customCellForObject:(id)a3 indexPath:(id)a4 tableView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WDElectrocardiogramListDataProvider activeECGAlgorithmVersion](self, "activeECGAlgorithmVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    -[WDElectrocardiogramListDataProvider _cellForSample:indexPath:tableView:activeAlgorithmVersion:](self, "_cellForSample:indexPath:tableView:activeAlgorithmVersion:", v8, v9, v10, objc_msgSend(v11, "integerValue"));
  else
    -[WDElectrocardiogramListDataProvider placeholderCellAtIndexPath:tableView:](self, "placeholderCellAtIndexPath:tableView:", v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)placeholderCellAtIndexPath:(id)a3 tableView:(id)a4
{
  return -[WDElectrocardiogramListDataProvider _cellForSample:indexPath:tableView:activeAlgorithmVersion:](self, "_cellForSample:indexPath:tableView:activeAlgorithmVersion:", 0, a3, a4, 0);
}

- (id)customLoadingCellForRowAtIndexPath:(id)a3 tableView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  +[WDSpinnerTableViewCell defaultReuseIdentifier](WDSpinnerTableViewCell, "defaultReuseIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v9);

  return v8;
}

- (id)viewControllerForItemAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  WDElectrocardiogramDataMetadataViewController *v8;
  int64_t v9;
  void *v10;
  WDElectrocardiogramDataMetadataViewController *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  v6 = objc_msgSend(v4, "section");

  -[WDSampleListDataProvider objectAtIndex:forSection:](self, "objectAtIndex:forSection:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [WDElectrocardiogramDataMetadataViewController alloc];
  v9 = -[WDElectrocardiogramListDataProvider mode](self, "mode");
  -[WDElectrocardiogramListDataProvider activeECGAlgorithmVersion](self, "activeECGAlgorithmVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WDElectrocardiogramDataMetadataViewController initWithSample:delegate:mode:activeAlgorithmVersion:](v8, "initWithSample:delegate:mode:activeAlgorithmVersion:", v7, self, v9, v10);

  return v11;
}

- (unint64_t)recentSampleLimit
{
  return self->_recentSampleLimit;
}

- (void)setRecentSampleLimit:(unint64_t)a3
{
  self->_recentSampleLimit = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (BOOL)shouldConsiderRequeryDueToDeletedObjects
{
  return self->_shouldConsiderRequeryDueToDeletedObjects;
}

- (void)setShouldConsiderRequeryDueToDeletedObjects:(BOOL)a3
{
  self->_shouldConsiderRequeryDueToDeletedObjects = a3;
}

- (void)activeECGAlgorithmVersion
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136446466;
  v3 = "-[WDElectrocardiogramListDataProvider activeECGAlgorithmVersion]";
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl(&dword_215814000, a2, OS_LOG_TYPE_ERROR, "[%{public}s] Failed to fetch algorithm version: %{public}@", (uint8_t *)&v2, 0x16u);
}

@end
