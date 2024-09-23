@implementation HDMCDaySummaryBuilder

- (HDMCDaySummaryBuilder)initWithProfile:(id)a3 dayIndex:(int64_t)a4 orderedWatchSources:(id)a5 calendarCache:(id)a6
{
  id v10;
  id v11;
  id v12;
  HDMCDaySummaryBuilder *v13;
  HDMCDaySummaryBuilder *v14;
  uint64_t v15;
  NSArray *orderedWatchSources;
  objc_super v18;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HDMCDaySummaryBuilder;
  v13 = -[HDMCDaySummaryBuilder init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_profile, v10);
    v14->_dayIndex = a4;
    v15 = objc_msgSend(v11, "copy");
    orderedWatchSources = v14->_orderedWatchSources;
    v14->_orderedWatchSources = (NSArray *)v15;

    objc_storeStrong((id *)&v14->_calendarCache, a6);
  }

  return v14;
}

- (void)addCycleTrackingSample:(id)a3
{
  void *v5;
  uint64_t v6;
  NSMutableArray *basalBodyTemperatureSamples;
  NSMutableArray *v8;
  NSMutableArray *symptomsSamples;
  NSMutableArray *v10;
  NSMutableArray *v11;
  NSMutableArray *v12;
  void *v13;
  NSMutableDictionary *sampleCountByType;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  void *v19;
  NSMutableArray *bleedingAfterPregnancyFlowSamples;
  NSMutableArray *v21;
  HKCalendarCache *calendarCache;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t dayIndex;
  NSMutableArray *startedCycleFactors;
  NSMutableArray *v30;
  NSMutableArray *progesteroneTestResultSamples;
  NSMutableArray *v32;
  NSMutableArray *cervicalMucusQualitySamples;
  NSMutableArray *v34;
  NSMutableArray *ovulationTestResultSamples;
  NSMutableArray *v36;
  NSMutableArray *menstrualFlowSamples;
  NSMutableArray *v38;
  NSMutableArray *intermenstrualBleedingSamples;
  NSMutableArray *v40;
  NSMutableArray *sexualActivitySamples;
  NSMutableArray *v42;
  NSMutableArray *wristTemperatureSamples;
  NSMutableArray *v44;
  NSMutableArray *bleedingInPregnancyFlowSamples;
  NSMutableArray *v46;
  NSMutableArray *pregnancyTestResultSamples;
  NSMutableArray *v48;
  void *v49;
  NSMutableArray *v50;
  NSMutableArray *v51;
  void *v52;
  uint64_t v53;
  NSMutableArray *endedCycleFactors;
  NSMutableArray *v55;
  NSMutableArray *v56;
  NSMutableArray *v57;
  NSMutableArray *v58;
  NSMutableArray *v59;
  NSMutableArray *v60;
  NSMutableArray *v61;
  NSMutableArray *v62;
  NSMutableArray *v63;
  NSMutableArray *v64;
  NSMutableArray *v65;
  NSMutableArray *v66;
  NSMutableArray *v67;
  NSMutableArray *v68;
  id v69;

  v69 = a3;
  objc_msgSend(v69, "sampleType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "code");

  if (v6 <= 190)
  {
    if ((unint64_t)(v6 - 157) >= 0xF)
    {
      switch(v6)
      {
        case 'Z':
          basalBodyTemperatureSamples = self->_basalBodyTemperatureSamples;
          if (basalBodyTemperatureSamples)
          {
            v8 = basalBodyTemperatureSamples;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
          }
          v58 = self->_basalBodyTemperatureSamples;
          self->_basalBodyTemperatureSamples = v8;

          v12 = self->_basalBodyTemperatureSamples;
          goto LABEL_12;
        case '[':
          cervicalMucusQualitySamples = self->_cervicalMucusQualitySamples;
          if (cervicalMucusQualitySamples)
          {
            v34 = cervicalMucusQualitySamples;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v34 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
          }
          v61 = self->_cervicalMucusQualitySamples;
          self->_cervicalMucusQualitySamples = v34;

          v12 = self->_cervicalMucusQualitySamples;
          goto LABEL_12;
        case '\\':
          ovulationTestResultSamples = self->_ovulationTestResultSamples;
          if (ovulationTestResultSamples)
          {
            v36 = ovulationTestResultSamples;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v36 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
          }
          v62 = self->_ovulationTestResultSamples;
          self->_ovulationTestResultSamples = v36;

          v12 = self->_ovulationTestResultSamples;
          goto LABEL_12;
        case '_':
          menstrualFlowSamples = self->_menstrualFlowSamples;
          if (menstrualFlowSamples)
          {
            v38 = menstrualFlowSamples;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v38 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
          }
          v63 = self->_menstrualFlowSamples;
          self->_menstrualFlowSamples = v38;

          v12 = self->_menstrualFlowSamples;
          goto LABEL_12;
          intermenstrualBleedingSamples = self->_intermenstrualBleedingSamples;
          if (intermenstrualBleedingSamples)
          {
            v40 = intermenstrualBleedingSamples;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v40 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
          }
          v64 = self->_intermenstrualBleedingSamples;
          self->_intermenstrualBleedingSamples = v40;

          v12 = self->_intermenstrualBleedingSamples;
          goto LABEL_12;
        case 'a':
          sexualActivitySamples = self->_sexualActivitySamples;
          if (sexualActivitySamples)
          {
            v42 = sexualActivitySamples;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v42 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
          }
          v65 = self->_sexualActivitySamples;
          self->_sexualActivitySamples = v42;

          v12 = self->_sexualActivitySamples;
          goto LABEL_12;
        default:
          goto LABEL_49;
      }
    }
    goto LABEL_8;
  }
  if (v6 > 242)
  {
    if (v6 <= 255)
    {
      if (v6 == 243)
      {
        pregnancyTestResultSamples = self->_pregnancyTestResultSamples;
        if (pregnancyTestResultSamples)
        {
          v48 = pregnancyTestResultSamples;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v48 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        }
        v68 = self->_pregnancyTestResultSamples;
        self->_pregnancyTestResultSamples = v48;

        v12 = self->_pregnancyTestResultSamples;
        goto LABEL_12;
      }
      if (v6 == 244)
      {
        progesteroneTestResultSamples = self->_progesteroneTestResultSamples;
        if (progesteroneTestResultSamples)
        {
          v32 = progesteroneTestResultSamples;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v32 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        }
        v60 = self->_progesteroneTestResultSamples;
        self->_progesteroneTestResultSamples = v32;

        v12 = self->_progesteroneTestResultSamples;
        goto LABEL_12;
      }
    }
    else
    {
      switch(v6)
      {
        case 256:
          wristTemperatureSamples = self->_wristTemperatureSamples;
          if (wristTemperatureSamples)
          {
            v44 = wristTemperatureSamples;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v44 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
          }
          v66 = self->_wristTemperatureSamples;
          self->_wristTemperatureSamples = v44;

          v12 = self->_wristTemperatureSamples;
          goto LABEL_12;
        case 313:
          bleedingInPregnancyFlowSamples = self->_bleedingInPregnancyFlowSamples;
          if (bleedingInPregnancyFlowSamples)
          {
            v46 = bleedingInPregnancyFlowSamples;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v46 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
          }
          v67 = self->_bleedingInPregnancyFlowSamples;
          self->_bleedingInPregnancyFlowSamples = v46;

          v12 = self->_bleedingInPregnancyFlowSamples;
          goto LABEL_12;
        case 314:
          bleedingAfterPregnancyFlowSamples = self->_bleedingAfterPregnancyFlowSamples;
          if (bleedingAfterPregnancyFlowSamples)
          {
            v21 = bleedingAfterPregnancyFlowSamples;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v21 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
          }
          v59 = self->_bleedingAfterPregnancyFlowSamples;
          self->_bleedingAfterPregnancyFlowSamples = v21;

          v12 = self->_bleedingAfterPregnancyFlowSamples;
          goto LABEL_12;
      }
    }
LABEL_49:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDMCDaySummaryBuilder.m"), 148, CFSTR("%@: Invalid data type"), objc_opt_class());
LABEL_59:

    goto LABEL_13;
  }
  if ((unint64_t)(v6 - 229) < 7)
  {
LABEL_8:
    symptomsSamples = self->_symptomsSamples;
    if (symptomsSamples)
    {
      v10 = symptomsSamples;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    }
    v11 = self->_symptomsSamples;
    self->_symptomsSamples = v10;

    v12 = self->_symptomsSamples;
LABEL_12:
    -[NSMutableArray addObject:](v12, "addObject:", v69);
    goto LABEL_13;
  }
  if ((unint64_t)(v6 - 191) >= 3)
    goto LABEL_49;
  calendarCache = self->_calendarCache;
  objc_msgSend(v69, "_timeZone");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCalendarCache calendarForTimeZone:](calendarCache, "calendarForTimeZone:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v69, "hk_dayIndexRangeWithCalendar:", v24);
  v27 = v26;

  dayIndex = self->_dayIndex;
  if (v25 == dayIndex)
  {
    startedCycleFactors = self->_startedCycleFactors;
    if (startedCycleFactors)
    {
      v30 = startedCycleFactors;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v30 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    }
    v50 = self->_startedCycleFactors;
    self->_startedCycleFactors = v30;

    v51 = self->_startedCycleFactors;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v69, "hkmc_cycleFactor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v51, "addObject:", v52);

    dayIndex = self->_dayIndex;
  }
  v53 = v27 + v25 - 1;
  if (v27 <= 0)
    v53 = 0x7FFFFFFFFFFFFFFFLL;
  if (v53 == dayIndex)
  {
    endedCycleFactors = self->_endedCycleFactors;
    if (endedCycleFactors)
    {
      v55 = endedCycleFactors;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v55 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    }
    v56 = self->_endedCycleFactors;
    self->_endedCycleFactors = v55;

    v57 = self->_endedCycleFactors;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v69, "hkmc_cycleFactor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v57, "addObject:", v49);
    goto LABEL_59;
  }
LABEL_13:
  objc_msgSend(v69, "sampleType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "hkmc_requiresMultipleReplaceConfirmation"))
  {
    sampleCountByType = self->_sampleCountByType;
    if (sampleCountByType)
      v15 = sampleCountByType;
    else
      v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v16 = self->_sampleCountByType;
    self->_sampleCountByType = v15;

    v17 = (void *)MEMORY[0x24BDD16E0];
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sampleCountByType, "objectForKeyedSubscript:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v18, "integerValue") + 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sampleCountByType, "setObject:forKeyedSubscript:", v19, v13);

  }
}

- (int64_t)_menstrualFlowWithModificationDay:(int64_t *)a3 startOfCycleFromCycleTracking:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  HKCalendarCache *calendarCache;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int64_t v16;

  -[NSMutableArray sortUsingComparator:](self->_menstrualFlowSamples, "sortUsingComparator:", &__block_literal_global_6);
  -[NSMutableArray lastObject](self->_menstrualFlowSamples, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "_creationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    calendarCache = self->_calendarCache;
    objc_msgSend(v8, "_timeZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCalendarCache calendarForTimeZone:](calendarCache, "calendarForTimeZone:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *a3 = objc_msgSend(v9, "hk_dayIndexWithCalendar:", v12);

    if (objc_msgSend(v8, "hkmc_wasEnteredFromCycleTracking"))
    {
      objc_msgSend(v8, "metadata");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDD31E0]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "BOOLValue");

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v16 = objc_msgSend(v8, "hkmc_daySummaryMenstrualFlow");

  return v16;
}

uint64_t __89__HDMCDaySummaryBuilder__menstrualFlowWithModificationDay_startOfCycleFromCycleTracking___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "hkmc_daySummaryMenstrualFlow"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = objc_msgSend(v5, "hkmc_daySummaryMenstrualFlow");

  objc_msgSend(v7, "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

- (int64_t)_bleedingInPregnancyFlow
{
  void *v3;
  int64_t v4;

  -[NSMutableArray sortUsingComparator:](self->_bleedingInPregnancyFlowSamples, "sortUsingComparator:", &__block_literal_global_193);
  -[NSMutableArray lastObject](self->_bleedingInPregnancyFlowSamples, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hkmc_daySummaryBleedingInPregnancyFlow");

  return v4;
}

uint64_t __49__HDMCDaySummaryBuilder__bleedingInPregnancyFlow__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "hkmc_daySummaryBleedingInPregnancyFlow"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = objc_msgSend(v5, "hkmc_daySummaryBleedingInPregnancyFlow");

  objc_msgSend(v7, "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

- (int64_t)_bleedingAfterPregnancyFlow
{
  void *v3;
  int64_t v4;

  -[NSMutableArray sortUsingComparator:](self->_bleedingAfterPregnancyFlowSamples, "sortUsingComparator:", &__block_literal_global_194);
  -[NSMutableArray lastObject](self->_bleedingAfterPregnancyFlowSamples, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hkmc_daySummaryBleedingAfterPregnancyFlow");

  return v4;
}

uint64_t __52__HDMCDaySummaryBuilder__bleedingAfterPregnancyFlow__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "hkmc_daySummaryBleedingAfterPregnancyFlow"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = objc_msgSend(v5, "hkmc_daySummaryBleedingAfterPregnancyFlow");

  objc_msgSend(v7, "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

- (BOOL)_intermenstrualBleeding
{
  return -[NSMutableArray count](self->_intermenstrualBleedingSamples, "count") != 0;
}

- (unint64_t)_symptoms
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
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
  v2 = self->_symptomsSamples;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 |= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "hkmc_daySummarySymptom", (_QWORD)v9);
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)_sexualActivity
{
  void *v3;
  int64_t v4;

  -[NSMutableArray sortUsingComparator:](self->_sexualActivitySamples, "sortUsingComparator:", &__block_literal_global_195);
  -[NSMutableArray lastObject](self->_sexualActivitySamples, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hkmc_daySummarySexualActivity");

  return v4;
}

uint64_t __40__HDMCDaySummaryBuilder__sexualActivity__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "hkmc_daySummarySexualActivity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = objc_msgSend(v5, "hkmc_daySummarySexualActivity");

  objc_msgSend(v7, "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

- (int64_t)_ovulationTestResult
{
  void *v3;
  int64_t v4;

  -[NSMutableArray sortUsingComparator:](self->_ovulationTestResultSamples, "sortUsingComparator:", &__block_literal_global_196);
  -[NSMutableArray lastObject](self->_ovulationTestResultSamples, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hkmc_daySummaryOvulationTestResult");

  return v4;
}

uint64_t __45__HDMCDaySummaryBuilder__ovulationTestResult__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "hkmc_daySummaryOvulationTestResult"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = objc_msgSend(v5, "hkmc_daySummaryOvulationTestResult");

  objc_msgSend(v7, "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

- (int64_t)_pregnancyTestResult
{
  void *v3;
  int64_t v4;

  -[NSMutableArray sortUsingComparator:](self->_pregnancyTestResultSamples, "sortUsingComparator:", &__block_literal_global_197);
  -[NSMutableArray lastObject](self->_pregnancyTestResultSamples, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hkmc_daySummaryPregnancyTestResult");

  return v4;
}

uint64_t __45__HDMCDaySummaryBuilder__pregnancyTestResult__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "hkmc_daySummaryPregnancyTestResult"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = objc_msgSend(v5, "hkmc_daySummaryPregnancyTestResult");

  objc_msgSend(v7, "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

- (int64_t)_progesteroneTestResult
{
  void *v3;
  int64_t v4;

  -[NSMutableArray sortUsingComparator:](self->_progesteroneTestResultSamples, "sortUsingComparator:", &__block_literal_global_198);
  -[NSMutableArray lastObject](self->_progesteroneTestResultSamples, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hkmc_daySummaryProgesteroneTestResult");

  return v4;
}

uint64_t __48__HDMCDaySummaryBuilder__progesteroneTestResult__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "hkmc_daySummaryProgesteroneTestResult"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = objc_msgSend(v5, "hkmc_daySummaryProgesteroneTestResult");

  objc_msgSend(v7, "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

- (int64_t)_cervicalMucusQuality
{
  void *v3;
  int64_t v4;

  -[NSMutableArray sortUsingComparator:](self->_cervicalMucusQualitySamples, "sortUsingComparator:", &__block_literal_global_199);
  -[NSMutableArray lastObject](self->_cervicalMucusQualitySamples, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hkmc_daySummaryCervicalMucusQuality");

  return v4;
}

uint64_t __46__HDMCDaySummaryBuilder__cervicalMucusQuality__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "hkmc_daySummaryCervicalMucusQuality"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = objc_msgSend(v5, "hkmc_daySummaryCervicalMucusQuality");

  objc_msgSend(v7, "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

- (id)_basalBodyTemperature
{
  void *v3;
  void *v4;

  -[NSMutableArray sortUsingComparator:](self->_basalBodyTemperatureSamples, "sortUsingComparator:", &__block_literal_global_201);
  -[NSMutableArray lastObject](self->_basalBodyTemperatureSamples, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "quantity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __46__HDMCDaySummaryBuilder__basalBodyTemperature__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)_wristTemperature
{
  NSMutableArray *wristTemperatureSamples;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  wristTemperatureSamples = self->_wristTemperatureSamples;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __42__HDMCDaySummaryBuilder__wristTemperature__block_invoke;
  v9[3] = &unk_24DB22C90;
  v9[4] = self;
  -[NSMutableArray sortUsingComparator:](wristTemperatureSamples, "sortUsingComparator:", v9);
  -[NSMutableArray firstObject](self->_wristTemperatureSamples, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  v5 = (void *)MEMORY[0x24BE46C30];
  -[NSMutableArray firstObject](self->_wristTemperatureSamples, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wristTemperatureFromWristTemperatureSample:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __42__HDMCDaySummaryBuilder__wristTemperature__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(v5, "sourceRevision");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "indexOfObject:", v9);

  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(v6, "sourceRevision");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "source");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "indexOfObject:", v13);

  if (v10 >= v14)
  {
    if (v10 > v14)
    {
      v15 = 1;
    }
    else
    {
      objc_msgSend(v6, "startDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "startDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v16, "compare:", v17);

    }
  }
  else
  {
    v15 = -1;
  }

  return v15;
}

- (id)_startedCycleFactors
{
  void *v3;

  v3 = (void *)-[NSMutableArray count](self->_startedCycleFactors, "count");
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", self->_startedCycleFactors);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_endedCycleFactors
{
  void *v3;

  v3 = (void *)-[NSMutableArray count](self->_endedCycleFactors, "count");
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", self->_endedCycleFactors);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)createDaySummaryWithDevice:(id)a3
{
  int64_t v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v15;
  unint64_t v16;
  _BOOL4 v17;
  id v18;
  int64_t v19;
  int64_t v20;
  int64_t dayIndex;
  void *v22;
  int64_t v23;
  id v24;
  uint64_t v25;

  v24 = 0;
  v25 = 0;
  v23 = -[HDMCDaySummaryBuilder _menstrualFlowWithModificationDay:startOfCycleFromCycleTracking:](self, "_menstrualFlowWithModificationDay:startOfCycleFromCycleTracking:", &v25, &v24);
  v18 = v24;
  dayIndex = self->_dayIndex;
  v22 = (void *)MEMORY[0x24BE46B68];
  v20 = -[HDMCDaySummaryBuilder _bleedingInPregnancyFlow](self, "_bleedingInPregnancyFlow");
  v19 = -[HDMCDaySummaryBuilder _bleedingAfterPregnancyFlow](self, "_bleedingAfterPregnancyFlow");
  v17 = -[HDMCDaySummaryBuilder _intermenstrualBleeding](self, "_intermenstrualBleeding");
  v16 = -[HDMCDaySummaryBuilder _symptoms](self, "_symptoms");
  v15 = -[HDMCDaySummaryBuilder _sexualActivity](self, "_sexualActivity");
  v4 = -[HDMCDaySummaryBuilder _ovulationTestResult](self, "_ovulationTestResult");
  v5 = -[HDMCDaySummaryBuilder _pregnancyTestResult](self, "_pregnancyTestResult");
  v6 = -[HDMCDaySummaryBuilder _progesteroneTestResult](self, "_progesteroneTestResult");
  v7 = -[HDMCDaySummaryBuilder _cervicalMucusQuality](self, "_cervicalMucusQuality");
  -[HDMCDaySummaryBuilder _basalBodyTemperature](self, "_basalBodyTemperature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMCDaySummaryBuilder _wristTemperature](self, "_wristTemperature");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v25;
  -[HDMCDaySummaryBuilder _startedCycleFactors](self, "_startedCycleFactors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMCDaySummaryBuilder _endedCycleFactors](self, "_endedCycleFactors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "daySummaryWithDayIndex:menstrualFlow:bleedingInPregnancyFlow:bleedingAfterPregnancyFlow:intermenstrualBleeding:symptoms:sexualActivity:ovulationTestResult:pregnancyTestResult:progesteroneTestResult:cervicalMucusQuality:basalBodyTemperature:wristTemperature:menstrualFlowModificationDayIndex:startOfCycleFromCycleTracking:startedCycleFactors:endedCycleFactors:sampleCountByType:", dayIndex, v23, v20, v19, v17, v16, v15, v4, v5, v6, v7, v8, v9, v10,
    v18,
    v11,
    v12,
    self->_sampleCountByType);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (int64_t)dayIndex
{
  return self->_dayIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleCountByType, 0);
  objc_storeStrong((id *)&self->_endedCycleFactors, 0);
  objc_storeStrong((id *)&self->_startedCycleFactors, 0);
  objc_storeStrong((id *)&self->_wristTemperatureSamples, 0);
  objc_storeStrong((id *)&self->_basalBodyTemperatureSamples, 0);
  objc_storeStrong((id *)&self->_cervicalMucusQualitySamples, 0);
  objc_storeStrong((id *)&self->_progesteroneTestResultSamples, 0);
  objc_storeStrong((id *)&self->_pregnancyTestResultSamples, 0);
  objc_storeStrong((id *)&self->_ovulationTestResultSamples, 0);
  objc_storeStrong((id *)&self->_sexualActivitySamples, 0);
  objc_storeStrong((id *)&self->_symptomsSamples, 0);
  objc_storeStrong((id *)&self->_intermenstrualBleedingSamples, 0);
  objc_storeStrong((id *)&self->_bleedingAfterPregnancyFlowSamples, 0);
  objc_storeStrong((id *)&self->_bleedingInPregnancyFlowSamples, 0);
  objc_storeStrong((id *)&self->_menstrualFlowSamples, 0);
  objc_storeStrong((id *)&self->_orderedWatchSources, 0);
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
