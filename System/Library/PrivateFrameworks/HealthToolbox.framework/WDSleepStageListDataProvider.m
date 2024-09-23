@implementation WDSleepStageListDataProvider

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

- (void)_callUpdateHandler
{
  void *v3;
  void *v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *sleepData;
  NSMutableDictionary *v9;
  NSMutableArray *v10;
  NSMutableArray *orderedKeys;
  objc_super v12;

  -[WDSampleListDataProvider samples](self, "samples");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allSamples");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDSleepStageListDataProvider _sleepDataDictionaryFromSamples:](self, "_sleepDataDictionaryFromSamples:", v4);
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allKeys](v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  sleepData = self->_sleepData;
  self->_sleepData = v5;
  v9 = v5;

  v10 = (NSMutableArray *)objc_msgSend(v7, "mutableCopy");
  orderedKeys = self->_orderedKeys;
  self->_orderedKeys = v10;

  v12.receiver = self;
  v12.super_class = (Class)WDSleepStageListDataProvider;
  -[WDSampleListDataProvider _callUpdateHandler](&v12, sel__callUpdateHandler);

}

uint64_t __50__WDSleepStageListDataProvider__callUpdateHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)_sleepDataDictionaryFromSamples:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __objc2_class **p_superclass;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  WDSleepStageSampleBucket *v13;
  __objc2_class **v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v22;
  id obj;
  WDSleepStageSampleBucket *v24;
  id v25;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v28;
    p_superclass = &OBJC_METACLASS___WDSpinnerTableViewCell.superclass;
    v8 = MEMORY[0x24BDAC760];
    do
    {
      v9 = 0;
      v22 = v5;
      do
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v9);
        objc_msgSend(p_superclass + 474, "sleep_timePeriodForSample:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v12, v11);
        }
        v26[0] = v8;
        v26[1] = 3221225472;
        v26[2] = __64__WDSleepStageListDataProvider__sleepDataDictionaryFromSamples___block_invoke;
        v26[3] = &unk_24D38DE40;
        v26[4] = v10;
        objc_msgSend(v12, "hk_firstObjectPassingTest:", v26);
        v13 = (WDSleepStageSampleBucket *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v24 = [WDSleepStageSampleBucket alloc];
          v14 = p_superclass;
          v15 = v6;
          v16 = objc_msgSend(v10, "value");
          objc_msgSend(v10, "sourceRevision");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "device");
          v18 = v8;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v16;
          v6 = v15;
          p_superclass = v14;
          v13 = -[WDSleepStageSampleBucket initWithSleepStage:timePeriod:sourceRevision:device:](v24, "initWithSleepStage:timePeriod:sourceRevision:device:", v20, v11, v17, v19);

          v8 = v18;
          v5 = v22;
          objc_msgSend(v12, "addObject:", v13);
        }
        -[WDSleepStageSampleBucket addSample:](v13, "addSample:", v10);

        ++v9;
      }
      while (v5 != v9);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v5);
  }

  objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_190);
  return v25;
}

uint64_t __64__WDSleepStageListDataProvider__sleepDataDictionaryFromSamples___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sleep_belongsInBucket:", a2);
}

uint64_t __64__WDSleepStageListDataProvider__sleepDataDictionaryFromSamples___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "sortUsingComparator:", &__block_literal_global_192);
}

uint64_t __64__WDSleepStageListDataProvider__sleepDataDictionaryFromSamples___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "sortNumber");
  if (v6 >= objc_msgSend(v5, "sortNumber"))
  {
    v8 = objc_msgSend(v4, "sortNumber");
    v7 = v8 > objc_msgSend(v5, "sortNumber");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (int64_t)cellStyle
{
  return 1;
}

- (unint64_t)numberOfSections
{
  return -[NSMutableArray count](self->_orderedKeys, "count");
}

- (id)titleForSection:(unint64_t)a3
{
  void *v5;
  __CFString *v6;

  if (-[NSMutableArray count](self->_orderedKeys, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_orderedKeys, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sleep_titleString");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_24D38E7C8;
  }
  return v6;
}

- (unint64_t)numberOfObjectsForSection:(unint64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[NSMutableArray objectAtIndexedSubscript:](self->_orderedKeys, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sleepData, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (id)_sleepSampleBucketAtIndex:(unint64_t)a3 section:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;

  -[NSMutableArray objectAtIndexedSubscript:](self->_orderedKeys, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sleepData, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_durationFormatter
{
  if (_durationFormatter_onceToken_0 != -1)
    dispatch_once(&_durationFormatter_onceToken_0, &__block_literal_global_196);
  return (id)_durationFormatter_formatter_0;
}

uint64_t __50__WDSleepStageListDataProvider__durationFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD14F8]);
  v1 = (void *)_durationFormatter_formatter_0;
  _durationFormatter_formatter_0 = (uint64_t)v0;

  objc_msgSend((id)_durationFormatter_formatter_0, "setUnitsStyle:", 5);
  return objc_msgSend((id)_durationFormatter_formatter_0, "setAllowedUnits:", 96);
}

- (id)textForObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[WDSleepStageListDataProvider _durationFormatter](self, "_durationFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "totalDuration");
  objc_msgSend(v5, "stringFromTimeInterval:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("INTERVALS_OF_TIME_NUMBERED_UNIT"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "numberOfSamples");

  objc_msgSend(v7, "localizedStringWithFormat:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SLEEP_DATA_INTERVALS_FORMAT"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable-Acacia"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringWithFormat:", v14, v11, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)secondaryTextForObject:(id)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;

  switch(objc_msgSend(a3, "sleepStage"))
  {
    case 1:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("ASLEEP_UNSPECIFIED");
      goto LABEL_9;
    case 2:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("AWAKE");
      goto LABEL_5;
    case 3:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("ASLEEP_CORE");
      goto LABEL_9;
    case 4:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("ASLEEP_DEEP");
      goto LABEL_9;
    case 5:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("ASLEEP_REM");
LABEL_9:
      v6 = CFSTR("HealthUI-Localizable-Acacia");
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("IN_BED");
LABEL_5:
      v6 = CFSTR("HealthUI-Localizable");
      break;
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24D38E7C8, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)removeObjectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4 sectionRemoved:(BOOL *)a5
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[NSMutableArray objectAtIndexedSubscript:](self->_orderedKeys, "objectAtIndexedSubscript:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sleepData, "objectForKeyedSubscript:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v8, "samples");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[WDSampleListDataProvider samples](self, "samples");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeSample:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  objc_msgSend(v7, "removeObjectAtIndex:", a3);
  if (objc_msgSend(v7, "count"))
  {
    v16 = 0;
  }
  else
  {
    -[NSMutableArray removeObjectAtIndex:](self->_orderedKeys, "removeObjectAtIndex:", a4);
    v16 = 1;
  }
  *a5 = v16;

}

- (void)deleteAllData
{
  NSMutableDictionary *v3;
  NSMutableDictionary *sleepData;
  NSMutableArray *v5;
  NSMutableArray *orderedKeys;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WDSleepStageListDataProvider;
  -[WDSampleListDataProvider deleteAllData](&v7, sel_deleteAllData);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  sleepData = self->_sleepData;
  self->_sleepData = v3;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  orderedKeys = self->_orderedKeys;
  self->_orderedKeys = v5;

}

- (void)deleteObjectsAtIndexPath:(id)a3 healthStore:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = objc_msgSend(v12, "row");
  v14 = objc_msgSend(v12, "section");

  -[WDSleepStageListDataProvider _sleepSampleBucketAtIndex:section:](self, "_sleepSampleBucketAtIndex:section:", v13, v14);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "samples");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deleteObjects:options:withCompletion:", v15, a5, v10);

}

- (id)viewControllerForItemAtIndexPath:(id)a3
{
  id v4;
  WDSleepStageCategoryDataProvider *v5;
  void *v6;
  void *v7;
  WDSleepStageCategoryDataProvider *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  WDDataListViewController *v13;
  void *v14;
  void *v15;
  WDDataListViewController *v16;

  v4 = a3;
  v5 = [WDSleepStageCategoryDataProvider alloc];
  -[WDSampleListDataProvider displayType](self, "displayType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSampleListDataProvider profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WDSampleListDataProvider initWithDisplayType:profile:](v5, "initWithDisplayType:profile:", v6, v7);

  v9 = objc_msgSend(v4, "row");
  v10 = objc_msgSend(v4, "section");

  -[WDSleepStageListDataProvider _sleepSampleBucketAtIndex:section:](self, "_sleepSampleBucketAtIndex:section:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSampleListDataProvider setDefaultQueryPredicate:](v8, "setDefaultQueryPredicate:", v12);

  v13 = [WDDataListViewController alloc];
  -[WDSampleListDataProvider displayType](self, "displayType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDSampleListDataProvider profile](self, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[WDDataListViewController initWithDisplayType:profile:dataProvider:usingInsetStyling:](v13, "initWithDisplayType:profile:dataProvider:usingInsetStyling:", v14, v15, v8, 1);

  return v16;
}

- (NSMutableDictionary)sleepData
{
  return self->_sleepData;
}

- (NSMutableArray)orderedKeys
{
  return self->_orderedKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedKeys, 0);
  objc_storeStrong((id *)&self->_sleepData, 0);
}

@end
