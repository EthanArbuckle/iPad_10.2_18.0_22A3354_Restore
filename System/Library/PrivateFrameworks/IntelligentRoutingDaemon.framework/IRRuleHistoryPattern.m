@implementation IRRuleHistoryPattern

+ (BOOL)filterHistoryBySimilarApp:(id)a3 withSystemState:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(a1, "_filterHistoryBySameApp:withSystemState:", v6, v7) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v6, "sharingPolicy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "avInitialRouteSharingPolicy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "isEqual:", v10);

  }
  return v8;
}

+ (BOOL)_filterHistoryBySameApp:(id)a3 withSystemState:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  objc_msgSend(a3, "event");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appInFocusBundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v7, "isEqual:", v8);
  return (char)v5;
}

- (BOOL)_filterHistoryByMilo:(id)a3 withMiloPrediction:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "miloPredictionEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predictionId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "miloPredictionEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scoreForPredictionId:andLabel:", v8, v10);
  v12 = v11;

  +[IRPreferences shared](IRPreferences, "shared");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "miloLslIsSameMiloThreshold");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  return v12 > v16;
}

+ (BOOL)filterHistoryByBrokeredDeviceScan:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "eventType") == 9)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "event");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "eventType") == 10;

  }
  return v5;
}

- (BOOL)_filterHistoryByEventsToWatch:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IRRuleHistoryPattern eventsToWatch](self, "eventsToWatch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "event");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

- (BOOL)_filterHistoryByTimeInterval:(id)a3 comparedToDate:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  v6 = a4;
  objc_msgSend(a3, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  -[IRRuleHistoryPattern timeInterval](self, "timeInterval");
  LOBYTE(self) = v9 < v10;

  return (char)self;
}

- (BOOL)_filterHistoryBySameLoi:(id)a3 withSystemState:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  char v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "systemState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "locationSemanticUserSpecificPlaceType"))
  {

LABEL_4:
    objc_msgSend(v5, "systemState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "locationSemanticUserSpecificPlaceType");
    v11 = v10 == objc_msgSend(v6, "locationSemanticUserSpecificPlaceType");
    goto LABEL_5;
  }
  v8 = objc_msgSend(v6, "locationSemanticUserSpecificPlaceType");

  if (v8)
    goto LABEL_4;
  objc_msgSend(v5, "systemState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "locationSemanticLoiIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v5, "systemState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "locationSemanticLoiIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationSemanticLoiIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v15, "isEqual:", v16);

  }
  else
  {
    v11 = 0;
  }

LABEL_5:
  return v11;
}

- (BOOL)_filterHistoryBySameDay:(id)a3 comparedToDate:(id)a4 withSystemState:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;

  v7 = (void *)MEMORY[0x24BDBCE60];
  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "timeZoneSeconds");

  LOBYTE(v7) = objc_msgSend(v7, "isDate:inSameDayAsDate:forTimeZoneInSeconds:", v10, v9, v11);
  return (char)v7;
}

- (BOOL)_filterHistorywithSameCandidates:(id)a3 withSameCandidates:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(a3, "candidateIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "candidateForCandidateIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7 != 0;
}

- (id)_filterHistoryEvents:(id)a3 withSystemState:(id)a4 date:(id)a5 miloPrediction:(id)a6 candiatesContainer:(id)a7
{
  id v12;
  id v13;
  id v14;
  _BOOL4 v15;
  _BOOL4 v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  _BOOL4 v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  id v36;
  void *v37;
  id v38;
  _BOOL4 v39;
  _BOOL4 v40;
  _BOOL4 v41;
  _BOOL4 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v38 = a6;
  v36 = a7;
  v42 = -[NSSet containsObject:](self->_filters, "containsObject:", CFSTR("kIRRuleHistoryPatternFilterIsSameMilo"));
  v41 = -[NSSet containsObject:](self->_filters, "containsObject:", CFSTR("kIRRuleHistoryPatternFilterIsSameApp"));
  v40 = -[NSSet containsObject:](self->_filters, "containsObject:", CFSTR("kIRRuleHistoryPatternFilterIsSimilarApp"));
  v39 = -[NSSet containsObject:](self->_filters, "containsObject:", CFSTR("kIRRuleHistoryPatternFilterIsSameLoi"));
  v15 = -[NSSet containsObject:](self->_filters, "containsObject:", CFSTR("kIRRuleHistoryPatternFilterIsSameDay"));
  v16 = -[NSSet containsObject:](self->_filters, "containsObject:", CFSTR("kIRRuleHistoryPatternFilterOnlyTestedCandidates"));
  v37 = (void *)objc_opt_new();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v17 = v12;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (!v18)
    goto LABEL_29;
  v19 = v18;
  v20 = *(_QWORD *)v44;
  do
  {
    for (i = 0; i != v19; ++i)
    {
      if (*(_QWORD *)v44 != v20)
        objc_enumerationMutation(v17);
      v22 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
      if (!-[IRRuleHistoryPattern _filterHistoryByEventsToWatch:](self, "_filterHistoryByEventsToWatch:", v22))
        continue;
      v23 = -[IRRuleHistoryPattern _filterHistoryByTimeInterval:comparedToDate:](self, "_filterHistoryByTimeInterval:comparedToDate:", v22, v14);
      if (v42 && v23)
        v24 = -[IRRuleHistoryPattern _filterHistoryByMilo:withMiloPrediction:](self, "_filterHistoryByMilo:withMiloPrediction:", v22, v38);
      else
        v24 = !v42 && v23;
      if ((v41 & v24) == 1)
        v25 = +[IRRuleHistoryPattern _filterHistoryBySameApp:withSystemState:](IRRuleHistoryPattern, "_filterHistoryBySameApp:withSystemState:", v22, v13);
      else
        v25 = !v41 & v24;
      if ((v40 & v25) == 1)
        v26 = +[IRRuleHistoryPattern filterHistoryBySimilarApp:withSystemState:](IRRuleHistoryPattern, "filterHistoryBySimilarApp:withSystemState:", v22, v13);
      else
        v26 = !v40 & v25;
      if ((v39 & v26) == 1)
        v27 = -[IRRuleHistoryPattern _filterHistoryBySameLoi:withSystemState:](self, "_filterHistoryBySameLoi:withSystemState:", v22, v13);
      else
        v27 = !v39 & v26;
      if ((v15 & v27) == 1)
      {
        v28 = -[IRRuleHistoryPattern _filterHistoryBySameDay:comparedToDate:withSystemState:](self, "_filterHistoryBySameDay:comparedToDate:withSystemState:", v22, v14, v13);
        if (!v16)
          goto LABEL_21;
      }
      else
      {
        v28 = !v15 & v27;
        if (!v16)
        {
LABEL_21:
          if (v28)
            goto LABEL_26;
          continue;
        }
      }
      if (v28
        && -[IRRuleHistoryPattern _filterHistorywithSameCandidates:withSameCandidates:](self, "_filterHistorywithSameCandidates:withSameCandidates:", v22, v36))
      {
LABEL_26:
        objc_msgSend(v37, "addObject:", v22);
        continue;
      }
    }
    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  }
  while (v19);
LABEL_29:

  v29 = objc_msgSend(v37, "count");
  v30 = -[IRRuleHistoryPattern maxNumberOfEventsInHistory](self, "maxNumberOfEventsInHistory");
  v31 = (v29 - v30) & ~((uint64_t)(v29 - v30) >> 63);
  v32 = -[IRRuleHistoryPattern maxNumberOfEventsInHistory](self, "maxNumberOfEventsInHistory");
  if (v29 >= v32)
    v33 = v32;
  else
    v33 = v29;
  objc_msgSend(v37, "subarrayWithRange:", v31, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (id)executeRuleWithCandiatesContainer:(id)a3 systemStatus:(id)a4 historyContainer:(id)a5 miloPrediction:(id)a6 nearbyDeviceContainer:(id)a7 date:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  double v37;
  _BOOL4 v38;
  double v39;
  void *v40;
  void *v41;
  IRRuleOutputHistoryPattern *v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  IRRuleHistoryPattern *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a8;
  objc_msgSend(a5, "historyEvents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = self;
  v47 = v15;
  v48 = v14;
  v46 = v16;
  -[IRRuleHistoryPattern _filterHistoryEvents:withSystemState:date:miloPrediction:candiatesContainer:](self, "_filterHistoryEvents:withSystemState:date:miloPrediction:candiatesContainer:", v17, v14, v16, v15, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14E0], "set");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v20 = v18;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v56 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend(v25, "candidateIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          objc_msgSend(v25, "candidateIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v27);

        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    }
    while (v22);
  }

  v45 = v20;
  v28 = objc_msgSend(v20, "count");
  v29 = (void *)objc_opt_new();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v49 = v13;
  objc_msgSend(v13, "candidates");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v52 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
        objc_msgSend(v35, "candidateIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (double)(unint64_t)objc_msgSend(v19, "countForObject:", v36);

        v38 = -[IRRuleHistoryPattern calculateScoreWithoutPortion](v50, "calculateScoreWithoutPortion");
        v39 = v37 / (double)v28;
        if (!v28)
          v39 = 0.0;
        if (v38)
          v39 = v37;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "candidateIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v40, v41);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    }
    while (v32);
  }

  v42 = -[IRRuleOutputHistoryPattern initWithRule:]([IRRuleOutputHistoryPattern alloc], "initWithRule:", v50);
  -[IRRuleOutputHistoryPattern setNumberOfEventsInHistory:](v42, "setNumberOfEventsInHistory:", v28);
  v43 = (void *)objc_msgSend(v29, "copy");
  -[IRRuleOutputHistoryPattern setScoreForCandidates:](v42, "setScoreForCandidates:", v43);

  return v42;
}

- (IRRuleHistoryPattern)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IRRuleHistoryPattern;
  return -[IRRuleHistoryPattern init](&v3, sel_init);
}

- (IRRuleHistoryPattern)initWithEventsToWatch:(id)a3 filters:(id)a4 timeInterval:(double)a5 maxNumberOfEventsInHistory:(unint64_t)a6 minNumberOfEventsInHistory:(unint64_t)a7 threshold:(double)a8
{
  id v14;
  id v15;
  IRRuleHistoryPattern *v16;
  IRRuleHistoryPattern *v17;
  objc_super v19;

  v14 = a3;
  v15 = a4;
  v19.receiver = self;
  v19.super_class = (Class)IRRuleHistoryPattern;
  v16 = -[IRRuleHistoryPattern init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    -[IRRuleHistoryPattern setEventsToWatch:](v16, "setEventsToWatch:", v14);
    -[IRRuleHistoryPattern setFilters:](v17, "setFilters:", v15);
    -[IRRuleHistoryPattern setTimeInterval:](v17, "setTimeInterval:", a5);
    -[IRRuleHistoryPattern setMaxNumberOfEventsInHistory:](v17, "setMaxNumberOfEventsInHistory:", a6);
    -[IRRuleHistoryPattern setMinNumberOfEventsInHistory:](v17, "setMinNumberOfEventsInHistory:", a7);
    -[IRRuleHistoryPattern setThreshold:](v17, "setThreshold:", a8);
  }

  return v17;
}

- (NSSet)eventsToWatch
{
  return self->_eventsToWatch;
}

- (void)setEventsToWatch:(id)a3
{
  objc_storeStrong((id *)&self->_eventsToWatch, a3);
}

- (NSSet)filters
{
  return self->_filters;
}

- (void)setFilters:(id)a3
{
  objc_storeStrong((id *)&self->_filters, a3);
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (void)setTimeInterval:(double)a3
{
  self->_timeInterval = a3;
}

- (unint64_t)maxNumberOfEventsInHistory
{
  return self->_maxNumberOfEventsInHistory;
}

- (void)setMaxNumberOfEventsInHistory:(unint64_t)a3
{
  self->_maxNumberOfEventsInHistory = a3;
}

- (unint64_t)minNumberOfEventsInHistory
{
  return self->_minNumberOfEventsInHistory;
}

- (void)setMinNumberOfEventsInHistory:(unint64_t)a3
{
  self->_minNumberOfEventsInHistory = a3;
}

- (double)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(double)a3
{
  self->_threshold = a3;
}

- (BOOL)calculateScoreWithoutPortion
{
  return self->_calculateScoreWithoutPortion;
}

- (void)setCalculateScoreWithoutPortion:(BOOL)a3
{
  self->_calculateScoreWithoutPortion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_eventsToWatch, 0);
}

@end
