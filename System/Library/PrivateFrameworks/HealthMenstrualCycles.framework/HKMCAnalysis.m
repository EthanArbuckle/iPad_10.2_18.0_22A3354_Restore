@implementation HKMCAnalysis

- (void)encodeWithCoder:(id)a3
{
  HKMCStatistics *statistics;
  id v5;

  statistics = self->_statistics;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", statistics, CFSTR("Statistics"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_menstruationProjections, CFSTR("MenstruationProjections"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fertileWindowProjections, CFSTR("FertileWindowProjections"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_menstruationProjectionsEnabled, CFSTR("MenstruationProjectionsEnabled"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_fertileWindowProjectionsEnabled, CFSTR("FertileWindowProjectionsEnabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cycles, CFSTR("Cycles"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviations, CFSTR("Deviations"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_recentSymptoms, CFSTR("RecentSymptoms"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recentBasalBodyTemperature, CFSTR("RecentBasalBodyTemperature"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastLoggedDayIndex, CFSTR("LastLoggedDayIndex"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastMenstrualFlowDayIndex, CFSTR("LastMenstrualFlowDayIndex"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPeriodLogLate, CFSTR("IsPeriodLogLate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ongoingCycleFactors, CFSTR("OngoingCycleFactors"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numberOfDailySleepHeartRateStatisticsForPast100Days, CFSTR("NumberOfDailySleepHeartRateStatisticsForPast100Days"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numberOfDailyAwakeHeartRateStatisticsForPast100Days, CFSTR("NumberOfDailyAwakeHeartRateStatisticsForPast100Days"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasHealthAppDevicesWithHigherAlgorithmVersions, CFSTR("HasHealthAppDevicesWithHigherAlgorithmVersions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_latestSampleInfo, CFSTR("LatestSampleInfo"));

}

- (HKMCAnalysis)initWithCoder:(id)a3
{
  id v4;
  HKMCAnalysis *v5;
  uint64_t v6;
  HKMCStatistics *statistics;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *menstruationProjections;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *fertileWindowProjections;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *cycles;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSArray *deviations;
  uint64_t v28;
  HKMCRecentBasalBodyTemperature *recentBasalBodyTemperature;
  uint64_t v30;
  NSNumber *lastLoggedDayIndex;
  uint64_t v32;
  NSNumber *lastMenstrualFlowDayIndex;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  HKMCSampleInfo *latestSampleInfo;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)HKMCAnalysis;
  v5 = -[HKMCAnalysis init](&v43, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Statistics"));
    v6 = objc_claimAutoreleasedReturnValue();
    statistics = v5->_statistics;
    v5->_statistics = (HKMCStatistics *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("MenstruationProjections"));
    v11 = objc_claimAutoreleasedReturnValue();
    menstruationProjections = v5->_menstruationProjections;
    v5->_menstruationProjections = (NSArray *)v11;

    v13 = (void *)MEMORY[0x24BDBCF20];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("FertileWindowProjections"));
    v16 = objc_claimAutoreleasedReturnValue();
    fertileWindowProjections = v5->_fertileWindowProjections;
    v5->_fertileWindowProjections = (NSArray *)v16;

    v5->_menstruationProjectionsEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MenstruationProjectionsEnabled"));
    v5->_fertileWindowProjectionsEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("FertileWindowProjectionsEnabled"));
    v18 = (void *)MEMORY[0x24BDBCF20];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("Cycles"));
    v21 = objc_claimAutoreleasedReturnValue();
    cycles = v5->_cycles;
    v5->_cycles = (NSArray *)v21;

    v23 = (void *)MEMORY[0x24BDBCF20];
    v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("Deviations"));
    v26 = objc_claimAutoreleasedReturnValue();
    deviations = v5->_deviations;
    v5->_deviations = (NSArray *)v26;

    v5->_recentSymptoms = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("RecentSymptoms"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RecentBasalBodyTemperature"));
    v28 = objc_claimAutoreleasedReturnValue();
    recentBasalBodyTemperature = v5->_recentBasalBodyTemperature;
    v5->_recentBasalBodyTemperature = (HKMCRecentBasalBodyTemperature *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastLoggedDayIndex"));
    v30 = objc_claimAutoreleasedReturnValue();
    lastLoggedDayIndex = v5->_lastLoggedDayIndex;
    v5->_lastLoggedDayIndex = (NSNumber *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastMenstrualFlowDayIndex"));
    v32 = objc_claimAutoreleasedReturnValue();
    lastMenstrualFlowDayIndex = v5->_lastMenstrualFlowDayIndex;
    v5->_lastMenstrualFlowDayIndex = (NSNumber *)v32;

    v5->_isPeriodLogLate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsPeriodLogLate"));
    v34 = (void *)MEMORY[0x24BDBCF20];
    v35 = objc_opt_class();
    objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("OngoingCycleFactors"));
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = (void *)v37;
    if (v37)
      v39 = (void *)v37;
    else
      v39 = (void *)MEMORY[0x24BDBD1A8];
    objc_storeStrong((id *)&v5->_ongoingCycleFactors, v39);

    v5->_numberOfDailySleepHeartRateStatisticsForPast100Days = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NumberOfDailySleepHeartRateStatisticsForPast100Days"));
    v5->_numberOfDailyAwakeHeartRateStatisticsForPast100Days = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NumberOfDailyAwakeHeartRateStatisticsForPast100Days"));
    v5->_hasHealthAppDevicesWithHigherAlgorithmVersions = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HasHealthAppDevicesWithHigherAlgorithmVersions"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LatestSampleInfo"));
    v40 = objc_claimAutoreleasedReturnValue();
    latestSampleInfo = v5->_latestSampleInfo;
    v5->_latestSampleInfo = (HKMCSampleInfo *)v40;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)hk_redactedDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSArray count](self->_menstruationProjections, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSArray count](self->_fertileWindowProjections, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSArray count](self->_cycles, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSArray count](self->_ongoingCycleFactors, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKSensitiveLogItem();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSArray count](self->_deviations, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasHealthAppDevicesWithHigherAlgorithmVersions);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ menstruation projections, %@ fertility projections, %@ cycles, %@ factors, %@ deviations, mismatch: %@, sample:%@>"), v4, self, v5, v6, v7, v9, v10, v11, self->_latestSampleInfo);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (NSArray)menstruationProjections
{
  return self->_menstruationProjections;
}

- (NSArray)fertileWindowProjections
{
  return self->_fertileWindowProjections;
}

- (NSArray)cycles
{
  return self->_cycles;
}

- (HKMCAnalysis)initWithStatistics:(id)a3 menstruationProjections:(id)a4 fertileWindowProjections:(id)a5 menstruationProjectionsEnabled:(BOOL)a6 fertileWindowProjectionsEnabled:(BOOL)a7 cycles:(id)a8 deviations:(id)a9 recentSymptoms:(unint64_t)a10 recentBasalBodyTemperature:(id)a11 lastLoggedDayIndex:(id)a12 lastMenstrualFlowDayIndex:(id)a13 isPeriodLogLate:(BOOL)a14 ongoingCycleFactors:(id)a15 numberOfDailySleepHeartRateStatisticsForPast100Days:(int64_t)a16 numberOfDailyAwakeHeartRateStatisticsForPast100Days:(int64_t)a17 hasHealthAppDevicesWithHigherAlgorithmVersions:(BOOL)a18
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  HKMCAnalysis *v28;
  uint64_t v29;
  HKMCStatistics *statistics;
  uint64_t v31;
  NSArray *menstruationProjections;
  uint64_t v33;
  NSArray *fertileWindowProjections;
  uint64_t v35;
  NSArray *cycles;
  uint64_t v37;
  NSArray *deviations;
  uint64_t v39;
  HKMCRecentBasalBodyTemperature *recentBasalBodyTemperature;
  uint64_t v41;
  NSArray *ongoingCycleFactors;
  id v46;
  id v47;
  id v48;
  objc_super v49;

  v48 = a3;
  v47 = a4;
  v46 = a5;
  v22 = a8;
  v23 = a9;
  v24 = a11;
  v25 = a12;
  v26 = a13;
  v27 = a15;
  v49.receiver = self;
  v49.super_class = (Class)HKMCAnalysis;
  v28 = -[HKMCAnalysis init](&v49, sel_init);
  if (v28)
  {
    v29 = objc_msgSend(v48, "copy");
    statistics = v28->_statistics;
    v28->_statistics = (HKMCStatistics *)v29;

    v31 = objc_msgSend(v47, "copy");
    menstruationProjections = v28->_menstruationProjections;
    v28->_menstruationProjections = (NSArray *)v31;

    v33 = objc_msgSend(v46, "copy");
    fertileWindowProjections = v28->_fertileWindowProjections;
    v28->_fertileWindowProjections = (NSArray *)v33;

    v28->_menstruationProjectionsEnabled = a6;
    v28->_fertileWindowProjectionsEnabled = a7;
    v35 = objc_msgSend(v22, "copy");
    cycles = v28->_cycles;
    v28->_cycles = (NSArray *)v35;

    v37 = objc_msgSend(v23, "copy");
    deviations = v28->_deviations;
    v28->_deviations = (NSArray *)v37;

    v28->_recentSymptoms = a10;
    v39 = objc_msgSend(v24, "copy");
    recentBasalBodyTemperature = v28->_recentBasalBodyTemperature;
    v28->_recentBasalBodyTemperature = (HKMCRecentBasalBodyTemperature *)v39;

    objc_storeStrong((id *)&v28->_lastLoggedDayIndex, a12);
    objc_storeStrong((id *)&v28->_lastMenstrualFlowDayIndex, a13);
    v28->_isPeriodLogLate = a14;
    v41 = objc_msgSend(v27, "copy");
    ongoingCycleFactors = v28->_ongoingCycleFactors;
    v28->_ongoingCycleFactors = (NSArray *)v41;

    v28->_numberOfDailySleepHeartRateStatisticsForPast100Days = a16;
    v28->_numberOfDailyAwakeHeartRateStatisticsForPast100Days = a17;
    v28->_hasHealthAppDevicesWithHigherAlgorithmVersions = a18;
  }

  return v28;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSArray *menstruationProjections;
  NSNumber *lastLoggedDayIndex;
  NSNumber *lastMenstrualFlowDayIndex;
  NSArray *fertileWindowProjections;
  NSArray *ongoingCycleFactors;
  NSArray *cycles;
  NSArray *deviations;
  void *v13;
  void *v14;
  NSArray *v16;
  HKMCStatistics *statistics;
  uint64_t v18;
  void *v19;

  v19 = (void *)MEMORY[0x24BDD17C8];
  v3 = objc_opt_class();
  statistics = self->_statistics;
  v18 = v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_recentSymptoms);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMCRecentBasalBodyTemperature shortDescription](self->_recentBasalBodyTemperature, "shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_menstruationProjectionsEnabled)
    menstruationProjections = self->_menstruationProjections;
  else
    menstruationProjections = (NSArray *)CFSTR("OFF");
  v16 = menstruationProjections;
  lastLoggedDayIndex = self->_lastLoggedDayIndex;
  lastMenstrualFlowDayIndex = self->_lastMenstrualFlowDayIndex;
  if (self->_fertileWindowProjectionsEnabled)
    fertileWindowProjections = self->_fertileWindowProjections;
  else
    fertileWindowProjections = (NSArray *)CFSTR("OFF");
  ongoingCycleFactors = self->_ongoingCycleFactors;
  cycles = self->_cycles;
  deviations = self->_deviations;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasHealthAppDevicesWithHigherAlgorithmVersions);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@:%p statistics:%@ symptoms:%@ bbt:%@ last log:%@ last flow:%@ menses:%@ fertility:%@ cycles:%@ factors:%@ deviations:%@ mismatch:%@ sample:%@>"), v18, self, statistics, v4, v5, lastLoggedDayIndex, lastMenstrualFlowDayIndex, v16, fertileWindowProjections, cycles, ongoingCycleFactors, deviations, v13, self->_latestSampleInfo);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  HKMCAnalysis *v4;
  unsigned __int8 *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  unint64_t v17;
  int v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  BOOL v30;
  _BOOL4 v31;
  uint64_t v32;
  _BOOL4 v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  _BOOL4 v39;
  uint64_t v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  int v47;
  void *v48;
  unint64_t v49;
  uint64_t v50;
  _BOOL4 v51;
  uint64_t v52;
  void *v53;
  uint64_t v55;
  _BOOL4 v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  _BOOL4 v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  int64_t v70;
  int64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  HKMCAnalysis *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  _BOOL4 v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  _BOOL4 v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  _BOOL4 v97;
  void *v98;
  void *v99;
  void *v100;
  _BOOL4 v101;
  void *v102;
  void *v103;
  _BOOL4 v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  int v112;
  int v113;
  void *v114;
  int v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  _BOOL4 v120;
  void *v121;
  void *v122;

  v4 = (HKMCAnalysis *)a3;
  if (self == v4)
  {
    v19 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HKMCAnalysis ongoingCycleFactors](self, "ongoingCycleFactors");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");
      objc_msgSend(v5, "ongoingCycleFactors");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v7 == v9)
      {
        -[HKMCAnalysis ongoingCycleFactors](self, "ongoingCycleFactors");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");

        if (v11)
        {
          v12 = 0;
          do
          {
            -[HKMCAnalysis ongoingCycleFactors](self, "ongoingCycleFactors");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "ongoingCycleFactors");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectAtIndexedSubscript:", v12);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v13, "isEquivalent:", v15);

            if ((v16 & 1) == 0)
              break;
            ++v12;
            -[HKMCAnalysis ongoingCycleFactors](self, "ongoingCycleFactors");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v8, "count");

          }
          while (v12 < v17);
          v18 = v16 ^ 1;
        }
        else
        {
          v18 = 0;
        }
      }
      else
      {
        v18 = 1;
      }
      -[HKMCAnalysis statistics](self, "statistics");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "statistics");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20 != v21)
      {
        objc_msgSend(v5, "statistics");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          v19 = 0;
LABEL_73:

          goto LABEL_74;
        }
        -[HKMCAnalysis statistics](self, "statistics");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "statistics");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v22, "isEqual:", v23))
        {
          v19 = 0;
LABEL_45:

          goto LABEL_73;
        }
        v118 = v23;
        v119 = v22;
      }
      -[HKMCAnalysis menstruationProjections](self, "menstruationProjections");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "menstruationProjections");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24 == v25)
      {
        v120 = 0;
      }
      else
      {
        objc_msgSend(v5, "menstruationProjections");
        v26 = objc_claimAutoreleasedReturnValue();
        if (!v26)
        {

          v19 = 0;
          goto LABEL_71;
        }
        v112 = v18;
        v120 = v24 != v25;
        v111 = (void *)v26;
        -[HKMCAnalysis menstruationProjections](self, "menstruationProjections");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "menstruationProjections");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = v27;
        if (!objc_msgSend(v27, "isEqual:", v28))
        {
          v19 = 0;
LABEL_44:

          v23 = v118;
          v22 = v119;
          if (v20 == v21)
            goto LABEL_74;
          goto LABEL_45;
        }
        v110 = v28;
        v18 = v112;
      }
      -[HKMCAnalysis fertileWindowProjections](self, "fertileWindowProjections");
      v29 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fertileWindowProjections");
      v121 = (void *)v29;
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29 == (_QWORD)v122;
      v31 = v29 != (_QWORD)v122;
      if (!v30)
      {
        objc_msgSend(v5, "fertileWindowProjections");
        v32 = objc_claimAutoreleasedReturnValue();
        if (!v32)
        {

          v19 = 0;
          if (v24 != v25)
          {
            LOBYTE(v43) = 1;
            goto LABEL_68;
          }
          v43 = 0;
LABEL_76:
          if (!v43)
            goto LABEL_70;
          goto LABEL_69;
        }
        v113 = v18;
        v33 = v31;
        v108 = (void *)v32;
        -[HKMCAnalysis fertileWindowProjections](self, "fertileWindowProjections");
        v34 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "fertileWindowProjections");
        v35 = objc_claimAutoreleasedReturnValue();
        v109 = (void *)v34;
        v36 = (void *)v34;
        v37 = (void *)v35;
        if (!objc_msgSend(v36, "isEqual:", v35))
        {
          v19 = 0;
          v42 = v121;
LABEL_43:

          v28 = v110;
          if (v24 == v25)
            goto LABEL_70;
          goto LABEL_44;
        }
        v107 = v37;
        v31 = v33;
        v18 = v113;
      }
      if (self->_menstruationProjectionsEnabled != v5[8] || self->_fertileWindowProjectionsEnabled != v5[9])
      {
        v19 = 0;
        v42 = v121;
        goto LABEL_36;
      }
      v104 = v31;
      -[HKMCAnalysis cycles](self, "cycles");
      v38 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cycles");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = (void *)v38;
      v30 = v38 == (_QWORD)v105;
      v39 = v38 != (_QWORD)v105;
      if (v30)
      {
        v101 = v39;
      }
      else
      {
        objc_msgSend(v5, "cycles");
        v40 = objc_claimAutoreleasedReturnValue();
        if (!v40)
        {

          v19 = 0;
          v42 = v121;
          if (v121 != v122)
          {
            LOBYTE(v31) = 1;
LABEL_37:

            if (!v31)
              goto LABEL_67;
LABEL_66:

            goto LABEL_67;
          }
          v31 = 0;
LABEL_65:
          if (!v31)
            goto LABEL_67;
          goto LABEL_66;
        }
        v101 = v39;
        v98 = (void *)v40;
        -[HKMCAnalysis cycles](self, "cycles");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "cycles");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = v41;
        if (!objc_msgSend(v41, "isEqual:"))
        {
          v19 = 0;
          v42 = v121;
          goto LABEL_118;
        }
      }
      -[HKMCAnalysis deviations](self, "deviations");
      v44 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviations");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = (void *)v44;
      v30 = v44 == (_QWORD)v102;
      v97 = v44 != (_QWORD)v102;
      v31 = v104;
      if (!v30)
      {
        objc_msgSend(v5, "deviations");
        v45 = objc_claimAutoreleasedReturnValue();
        if (!v45)
        {

          v19 = 0;
          v42 = v121;
          if (v106 != v105)
          {
            LOBYTE(v101) = 1;
            goto LABEL_137;
          }
          v101 = 0;
LABEL_140:
          if (!v101)
            goto LABEL_139;
          goto LABEL_138;
        }
        v114 = v21;
        v46 = v20;
        v47 = v18;
        v94 = (void *)v45;
        -[HKMCAnalysis deviations](self, "deviations");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "deviations");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = v48;
        if (!objc_msgSend(v48, "isEqual:"))
        {
          v19 = 0;
          v42 = v121;
          v20 = v46;
          v21 = v114;
          goto LABEL_117;
        }
        v18 = v47;
        v20 = v46;
        v21 = v114;
      }
      v49 = -[HKMCAnalysis recentSymptoms](self, "recentSymptoms");
      if (v49 != objc_msgSend(v5, "recentSymptoms"))
      {
        v19 = 0;
        v42 = v121;
        v31 = v104;
        if (v103 != v102)
          goto LABEL_134;
        goto LABEL_142;
      }
      v115 = v18;
      -[HKMCAnalysis recentBasalBodyTemperature](self, "recentBasalBodyTemperature");
      v50 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recentBasalBodyTemperature");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = (void *)v50;
      v30 = v50 == (_QWORD)v92;
      v51 = v50 != (_QWORD)v92;
      v31 = v104;
      if (v30)
      {
        v89 = v51;
      }
      else
      {
        objc_msgSend(v5, "recentBasalBodyTemperature");
        v52 = objc_claimAutoreleasedReturnValue();
        if (!v52)
        {

          v19 = 0;
          v42 = v121;
          if (v103 != v102)
          {
            LOBYTE(v97) = 1;
            goto LABEL_134;
          }
          v97 = 0;
LABEL_142:
          if (!v97)
            goto LABEL_136;
LABEL_135:

          goto LABEL_136;
        }
        v89 = v51;
        v86 = (void *)v52;
        -[HKMCAnalysis recentBasalBodyTemperature](self, "recentBasalBodyTemperature");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "recentBasalBodyTemperature");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = v53;
        if (!objc_msgSend(v53, "isEqual:"))
        {
          v19 = 0;
          v42 = v121;
          goto LABEL_116;
        }
      }
      -[HKMCAnalysis lastLoggedDayIndex](self, "lastLoggedDayIndex");
      v55 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastLoggedDayIndex");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = (void *)v55;
      v30 = v55 == (_QWORD)v90;
      v56 = v55 != (_QWORD)v90;
      if (v30)
      {
        v84 = v56;
      }
      else
      {
        objc_msgSend(v5, "lastLoggedDayIndex");
        v57 = objc_claimAutoreleasedReturnValue();
        if (!v57)
        {

          v19 = 0;
          v42 = v121;
          if (v93 != v92)
          {
            LOBYTE(v89) = 1;
            goto LABEL_131;
          }
          v89 = 0;
LABEL_144:
          if (!v89)
            goto LABEL_133;
LABEL_132:

          goto LABEL_133;
        }
        v84 = v56;
        v80 = (void *)v57;
        -[HKMCAnalysis lastLoggedDayIndex](self, "lastLoggedDayIndex");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "lastLoggedDayIndex");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = v58;
        if (!objc_msgSend(v58, "isEqual:"))
        {
          v19 = 0;
          v42 = v121;
          goto LABEL_115;
        }
      }
      -[HKMCAnalysis lastMenstrualFlowDayIndex](self, "lastMenstrualFlowDayIndex");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastMenstrualFlowDayIndex");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      if (v59 != v85)
      {
        objc_msgSend(v5, "lastMenstrualFlowDayIndex");
        v60 = objc_claimAutoreleasedReturnValue();
        if (!v60)
        {

          v19 = 0;
          v42 = v121;
          if (v91 != v90)
          {
            LOBYTE(v84) = 1;
            goto LABEL_128;
          }
          v84 = 0;
          goto LABEL_146;
        }
        v83 = v59;
        v79 = (void *)v60;
        -[HKMCAnalysis lastMenstrualFlowDayIndex](self, "lastMenstrualFlowDayIndex");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "lastMenstrualFlowDayIndex");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = v61;
        if (!objc_msgSend(v61, "isEqual:"))
        {
          v19 = 0;
          v42 = v121;
          goto LABEL_114;
        }
        v59 = v83;
      }
      v62 = -[HKMCAnalysis isPeriodLogLate](self, "isPeriodLogLate");
      if (((v62 ^ objc_msgSend(v5, "isPeriodLogLate") | v115) & 1) != 0)
      {
        v63 = v85;
        v30 = v59 == v85;
        v64 = v59;
        v42 = v121;
        v31 = v104;
        if (!v30)
        {

          v19 = 0;
          goto LABEL_127;
        }
        v83 = v64;
        v19 = 0;
LABEL_126:

LABEL_127:
        if (v91 != v90)
        {
LABEL_128:

          if (!v84)
            goto LABEL_130;
          goto LABEL_129;
        }
LABEL_146:
        if (v84)
LABEL_129:

LABEL_130:
        if (v93 != v92)
        {
LABEL_131:

          if (!v89)
            goto LABEL_133;
          goto LABEL_132;
        }
        goto LABEL_144;
      }
      v83 = v59;
      -[HKMCAnalysis latestSampleInfo](self, "latestSampleInfo");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "latestSampleInfo");
      v66 = objc_claimAutoreleasedReturnValue();
      v67 = (void *)v66;
      v116 = v65;
      if (v65 == (void *)v66)
      {
        v74 = (void *)v66;
        v69 = v65;
        v75 = v8;
        v76 = v4;
      }
      else
      {
        objc_msgSend(v5, "latestSampleInfo");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v73)
          goto LABEL_113;
        v74 = v67;
        v75 = v8;
        v76 = v4;
        -[HKMCAnalysis latestSampleInfo](self, "latestSampleInfo");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "latestSampleInfo");
        v8 = v68;
        v4 = (HKMCAnalysis *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v68, "isEqual:"))
        {
          v19 = 0;
          v67 = v74;
LABEL_122:

          if (v83 == v85)
          {

          }
          else
          {

          }
          if (v91 != v90)
          {

          }
          if (v93 != v92)
          {

          }
          if (v103 != v102)
          {

          }
          if (v106 != v105)
          {

          }
          if (v121 != v122)
          {

          }
          if (v24 != v25)
          {

          }
          v23 = v118;
          v22 = v119;
          v8 = v75;
          v4 = v76;
          if (v20 == v21)
            goto LABEL_74;
          goto LABEL_45;
        }
        v69 = v65;
      }
      v70 = -[HKMCAnalysis numberOfDailySleepHeartRateStatisticsForPast100Days](self, "numberOfDailySleepHeartRateStatisticsForPast100Days");
      if (v70 == objc_msgSend(v5, "numberOfDailySleepHeartRateStatisticsForPast100Days"))
      {
        v71 = -[HKMCAnalysis numberOfDailyAwakeHeartRateStatisticsForPast100Days](self, "numberOfDailyAwakeHeartRateStatisticsForPast100Days");
        if (v71 == objc_msgSend(v5, "numberOfDailyAwakeHeartRateStatisticsForPast100Days"))
        {
          v19 = self->_hasHealthAppDevicesWithHigherAlgorithmVersions == v5[11];
          v65 = v69;
          v67 = v74;
          if (v65 == v74)
          {
LABEL_125:

            v63 = v83;
            v42 = v121;
            v31 = v104;
            v8 = v75;
            v4 = v76;
            if (v83 == v85)
              goto LABEL_126;
            goto LABEL_114;
          }
          goto LABEL_122;
        }
      }
      v72 = v69;
      v67 = v74;
      if (v72 == v74)
      {
        v19 = 0;
        v65 = v116;
        goto LABEL_125;
      }

      v8 = v75;
      v4 = v76;
LABEL_113:

      v19 = 0;
      v63 = v83;
      v42 = v121;
      v31 = v104;
      if (v83 == v85)
        goto LABEL_126;
LABEL_114:

      if (v91 != v90)
      {
LABEL_115:

        if (v93 != v92)
        {
LABEL_116:

          if (v103 != v102)
          {
LABEL_117:

            if (v106 != v105)
            {
LABEL_118:

              v37 = v107;
              if (v42 == v122)
              {
LABEL_67:

                v43 = v120;
                if (v24 != v25)
                {
LABEL_68:

                  if (v43)
LABEL_69:

LABEL_70:
LABEL_71:
                  if (v20 != v21)
                  {

                    goto LABEL_73;
                  }
LABEL_74:

                  goto LABEL_75;
                }
                goto LABEL_76;
              }
              goto LABEL_43;
            }
            goto LABEL_139;
          }
LABEL_136:

          if (v106 != v105)
          {
LABEL_137:

            if (!v101)
            {
LABEL_139:

LABEL_36:
              if (v42 != v122)
                goto LABEL_37;
              goto LABEL_65;
            }
LABEL_138:

            goto LABEL_139;
          }
          goto LABEL_140;
        }
LABEL_133:

        if (v103 != v102)
        {
LABEL_134:

          if (!v97)
            goto LABEL_136;
          goto LABEL_135;
        }
        goto LABEL_142;
      }
      goto LABEL_130;
    }
    v19 = 0;
  }
LABEL_75:

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 fertileWindowProjectionsEnabled;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  int64_t v23;
  unint64_t v24;
  void *v26;
  void *v27;
  void *v28;

  -[HKMCAnalysis statistics](self, "statistics");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v28, "hash");
  -[HKMCAnalysis menstruationProjections](self, "menstruationProjections");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v27, "hash") ^ v3;
  -[HKMCAnalysis fertileWindowProjections](self, "fertileWindowProjections");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 ^ objc_msgSend(v26, "hash") ^ self->_menstruationProjectionsEnabled;
  fertileWindowProjectionsEnabled = self->_fertileWindowProjectionsEnabled;
  -[HKMCAnalysis cycles](self, "cycles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5 ^ fertileWindowProjectionsEnabled ^ objc_msgSend(v7, "hash");
  -[HKMCAnalysis deviations](self, "deviations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  v11 = v10 ^ -[HKMCAnalysis recentSymptoms](self, "recentSymptoms");
  -[HKMCAnalysis recentBasalBodyTemperature](self, "recentBasalBodyTemperature");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");
  -[HKMCAnalysis lastLoggedDayIndex](self, "lastLoggedDayIndex");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 ^ objc_msgSend(v14, "hash");
  -[HKMCAnalysis lastMenstrualFlowDayIndex](self, "lastMenstrualFlowDayIndex");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v8 ^ v15 ^ objc_msgSend(v16, "hash");
  v18 = -[HKMCAnalysis isPeriodLogLate](self, "isPeriodLogLate");
  -[HKMCAnalysis ongoingCycleFactors](self, "ongoingCycleFactors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 ^ objc_msgSend(v19, "hash");
  -[HKMCAnalysis latestSampleInfo](self, "latestSampleInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");
  v23 = v22 ^ -[HKMCAnalysis numberOfDailySleepHeartRateStatisticsForPast100Days](self, "numberOfDailySleepHeartRateStatisticsForPast100Days");
  v24 = v17 ^ v23 ^ -[HKMCAnalysis numberOfDailyAwakeHeartRateStatisticsForPast100Days](self, "numberOfDailyAwakeHeartRateStatisticsForPast100Days") ^ self->_hasHealthAppDevicesWithHigherAlgorithmVersions;

  return v24;
}

- (HKMCStatistics)statistics
{
  return self->_statistics;
}

- (BOOL)menstruationProjectionsEnabled
{
  return self->_menstruationProjectionsEnabled;
}

- (BOOL)fertileWindowProjectionsEnabled
{
  return self->_fertileWindowProjectionsEnabled;
}

- (NSArray)deviations
{
  return self->_deviations;
}

- (unint64_t)recentSymptoms
{
  return self->_recentSymptoms;
}

- (HKMCRecentBasalBodyTemperature)recentBasalBodyTemperature
{
  return self->_recentBasalBodyTemperature;
}

- (NSNumber)lastLoggedDayIndex
{
  return self->_lastLoggedDayIndex;
}

- (NSNumber)lastMenstrualFlowDayIndex
{
  return self->_lastMenstrualFlowDayIndex;
}

- (BOOL)isPeriodLogLate
{
  return self->_isPeriodLogLate;
}

- (NSArray)ongoingCycleFactors
{
  return self->_ongoingCycleFactors;
}

- (BOOL)hasHealthAppDevicesWithHigherAlgorithmVersions
{
  return self->_hasHealthAppDevicesWithHigherAlgorithmVersions;
}

- (HKMCSampleInfo)latestSampleInfo
{
  return self->_latestSampleInfo;
}

- (void)setLatestSampleInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (int64_t)numberOfDailySleepHeartRateStatisticsForPast100Days
{
  return self->_numberOfDailySleepHeartRateStatisticsForPast100Days;
}

- (int64_t)numberOfDailyAwakeHeartRateStatisticsForPast100Days
{
  return self->_numberOfDailyAwakeHeartRateStatisticsForPast100Days;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestSampleInfo, 0);
  objc_storeStrong((id *)&self->_ongoingCycleFactors, 0);
  objc_storeStrong((id *)&self->_lastMenstrualFlowDayIndex, 0);
  objc_storeStrong((id *)&self->_lastLoggedDayIndex, 0);
  objc_storeStrong((id *)&self->_recentBasalBodyTemperature, 0);
  objc_storeStrong((id *)&self->_deviations, 0);
  objc_storeStrong((id *)&self->_cycles, 0);
  objc_storeStrong((id *)&self->_fertileWindowProjections, 0);
  objc_storeStrong((id *)&self->_menstruationProjections, 0);
  objc_storeStrong((id *)&self->_statistics, 0);
}

@end
