@implementation WDSleepStageCategoryDataProvider

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

- (int64_t)cellStyle
{
  return 0;
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

- (id)_anySample
{
  void *v2;
  void *v3;
  void *v4;

  -[WDSampleListDataProvider samples](self, "samples");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allSamples");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)titleForSection:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  -[WDSleepStageCategoryDataProvider _anySample](self, "_anySample", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[WDTimePeriod sleep_timePeriodForSample:](WDTimePeriod, "sleep_timePeriodForSample:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sleep_titleString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    switch(objc_msgSend(v3, "value"))
    {
      case 1:
        v6 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = CFSTR("ASLEEP_UNSPECIFIED_INTERVALS");
        break;
      case 2:
        v6 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = CFSTR("AWAKE_INTERVALS");
        break;
      case 3:
        v6 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = CFSTR("ASLEEP_CORE_INTERVALS");
        break;
      case 4:
        v6 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = CFSTR("ASLEEP_DEEP_INTERVALS");
        break;
      case 5:
        v6 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = CFSTR("ASLEEP_REM_INTERVALS");
        break;
      default:
        v6 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = CFSTR("IN_BED_INTERVALS");
        break;
    }
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_24D38E7C8, CFSTR("HealthUI-Localizable-Acacia"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v11, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)numberOfObjectsForSection:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  -[WDSampleListDataProvider samples](self, "samples", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)_sleepSampleAtIndex:(unint64_t)a3 section:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[WDSampleListDataProvider samples](self, "samples", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allSamples");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)objectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4
{
  void *v4;
  _WDSleepStageSampleObject *v5;

  -[WDSleepStageCategoryDataProvider _sleepSampleAtIndex:section:](self, "_sleepSampleAtIndex:section:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_WDSleepStageSampleObject initWithSample:]([_WDSleepStageSampleObject alloc], "initWithSample:", v4);

  return v5;
}

- (id)_durationFormatter
{
  if (_durationFormatter_onceToken != -1)
    dispatch_once(&_durationFormatter_onceToken, &__block_literal_global_4);
  return (id)_durationFormatter_formatter;
}

uint64_t __54__WDSleepStageCategoryDataProvider__durationFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD14F8]);
  v1 = (void *)_durationFormatter_formatter;
  _durationFormatter_formatter = (uint64_t)v0;

  objc_msgSend((id)_durationFormatter_formatter, "setUnitsStyle:", 5);
  return objc_msgSend((id)_durationFormatter_formatter, "setAllowedUnits:", 96);
}

- (id)textForObject:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "dateInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "duration");
  v6 = v5;

  -[WDSleepStageCategoryDataProvider _durationFormatter](self, "_durationFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromTimeInterval:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)secondaryTextForObject:(id)a3
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

  objc_msgSend(a3, "dateInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKTimeFormatter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HKTimeFormatter();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SLEEP_DATA_TIME_RANGE_FORMAT"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable-Acacia"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", v12, v6, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)removeObjectAtIndex:(unint64_t)a3 forSection:(unint64_t)a4 sectionRemoved:(BOOL *)a5
{
  void *v7;
  void *v8;
  id v9;

  -[WDSleepStageCategoryDataProvider _sleepSampleAtIndex:section:](self, "_sleepSampleAtIndex:section:", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[WDSampleListDataProvider samples](self, "samples");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeSample:", v9);

  -[WDSampleListDataProvider samples](self, "samples");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *a5 = objc_msgSend(v8, "count") == 0;

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
  _QWORD v17[4];
  id v18;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = objc_msgSend(v12, "row");
  v14 = objc_msgSend(v12, "section");

  -[WDSleepStageCategoryDataProvider _sleepSampleAtIndex:section:](self, "_sleepSampleAtIndex:section:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __92__WDSleepStageCategoryDataProvider_deleteObjectsAtIndexPath_healthStore_options_completion___block_invoke;
  v17[3] = &unk_24D38D9D0;
  v18 = v10;
  v16 = v10;
  objc_msgSend(v15, "deleteObjectWithHealthStore:options:completion:", v11, a5, v17);

}

uint64_t __92__WDSleepStageCategoryDataProvider_deleteObjectsAtIndexPath_healthStore_options_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)viewControllerForItemAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  v6 = objc_msgSend(v4, "section");

  -[WDSleepStageCategoryDataProvider _sleepSampleAtIndex:section:](self, "_sleepSampleAtIndex:section:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A5A0]), "initWithSample:usingInsetStyling:profileName:delegate:", v7, 1, 0, self);

  return v8;
}

@end
