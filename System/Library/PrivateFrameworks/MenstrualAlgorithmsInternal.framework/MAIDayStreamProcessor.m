@implementation MAIDayStreamProcessor

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_BYTE *)self + 16) = 0;
  *((_BYTE *)self + 20) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (MAIDayStreamProcessor)initWithConfig:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
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
  NSObject *v22;
  float v23;
  void *v24;
  void *v25;
  int v26;
  Nightingale::ngt_DayStreamProcessor *v27;
  _QWORD *v28;
  id v29;
  _OWORD v31[4];
  int v32;
  char v33;
  int v34;
  char v35;
  int v36;
  char v37;
  int v38;
  char v39;
  int v40;
  char v41;
  char v42;
  char v43;
  float v44;
  char v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  char v51;
  objc_super v52;

  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)MAIDayStreamProcessor;
  v5 = -[MAIDayStreamProcessor init](&v52, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    v7 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v6;

    LOBYTE(v32) = 0;
    v33 = 0;
    LOBYTE(v34) = 0;
    v35 = 0;
    LOBYTE(v36) = 0;
    v37 = 0;
    LOBYTE(v38) = 0;
    v39 = 0;
    LOBYTE(v40) = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    LOBYTE(v44) = 0;
    v45 = 0;
    v51 = 0;
    v46 = 0;
    LOBYTE(v47) = 0;
    objc_msgSend(v4, "userReportedCycleLength");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "userReportedCycleLength");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 1;
      v32 = objc_msgSend(v9, "unsignedIntValue");

    }
    objc_msgSend(v4, "julianDayOfUserReportedCycleLength");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "julianDayOfUserReportedCycleLength");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 1;
      v36 = objc_msgSend(v11, "unsignedIntValue");

    }
    objc_msgSend(v4, "userReportedMenstruationLength");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "userReportedMenstruationLength");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 1;
      v34 = objc_msgSend(v13, "unsignedIntValue");

    }
    objc_msgSend(v4, "julianDayOfUserReportedMenstruationLength");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "julianDayOfUserReportedMenstruationLength");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 1;
      v38 = objc_msgSend(v15, "unsignedIntValue");

    }
    objc_msgSend(v4, "birthDateComponents");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "birthDateComponents");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timeIntervalSinceNow");
      v20 = v19 / -31557600.0;

      if (v20 >= 1.0 && v20 <= 200.0)
      {
        v23 = v20;
        v44 = v23;
        v45 = 1;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v20);
        v22 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setUserAgeInYears:", v22);
      }
      else
      {
        ha_get_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          -[MAIDayStreamProcessor initWithConfig:].cold.1(v22, v20);
      }

    }
    objc_msgSend(v4, "deviationInput");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "deviationInput");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      HealthAlgorithms::deviationInput(v25, v31);
      v47 = v31[0];
      v48 = v31[1];
      v49 = v31[2];
      v50 = v31[3];
      v51 = 1;

    }
    v26 = objc_msgSend(v4, "todayAsJulianDay");
    v41 = 1;
    v40 = v26;
    v27 = (Nightingale::ngt_DayStreamProcessor *)operator new();
    Nightingale::ngt_DayStreamProcessor::ngt_DayStreamProcessor(v27, &v32);
    std::unique_ptr<Nightingale::ngt_DayStreamProcessor>::reset[abi:nn180100]((Nightingale::ngt_DayStreamProcessor **)v5 + 1, v27);
    v28 = (_QWORD *)operator new();
    v28[2] = 0;
    v28[1] = 0;
    *v28 = v28 + 1;
    *(_QWORD *)&v31[0] = 0;
    std::unique_ptr<HealthAlgorithms::PhaseCondenser>::reset[abi:nn180100]((uint64_t *)v5 + 3, (uint64_t)v28);
    std::unique_ptr<HealthAlgorithms::PhaseCondenser>::reset[abi:nn180100]((uint64_t *)v31, 0);
    v29 = v5;
  }

  return (MAIDayStreamProcessor *)v5;
}

- (void)setUserAgeInYears:(id)a3
{
  objc_storeStrong((id *)&self->_userAgeInYears, a3);
}

- (void)appendDay:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  unsigned int val;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  float v23;
  __int128 v24;
  int v25;
  char v26;
  int v27;
  char v28;
  int v29;
  char v30;
  int v31;
  char v32;
  int v33;
  float v34;
  char v35;

  v4 = a3;
  objc_msgSend(v4, "wristTemperature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "watchIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MAIDayStreamProcessor watchNumericIdentifierFromString:](self, "watchNumericIdentifierFromString:", v6);

  if (self->_julianDayOfLastInput.__engaged_
    && (val = self->_julianDayOfLastInput.var0.__val_, val >= objc_msgSend(v4, "julianDay")))
  {
    ha_get_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[MAIHistoricalAnalyzer appendDay:].cold.1(v14);

  }
  else
  {
    self->_julianDayOfLastInput.var0.__val_ = objc_msgSend(v4, "julianDay");
    self->_julianDayOfLastInput.__engaged_ = 1;
    v9 = v4;
    LOBYTE(v25) = 0;
    v26 = 0;
    LOBYTE(v27) = 0;
    v28 = 0;
    LOBYTE(v29) = 0;
    v30 = 0;
    LOBYTE(v31) = 0;
    v32 = 0;
    LOBYTE(v33) = 0;
    v35 = 0;
    LODWORD(v24) = objc_msgSend(v9, "julianDay");
    DWORD1(v24) = objc_msgSend(v9, "flow");
    BYTE8(v24) = objc_msgSend(v9, "spotting");
    HIDWORD(v24) = objc_msgSend(v9, "ovulationTestResult");
    objc_msgSend(v9, "sedentaryHeartRateStatistics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lowerPercentile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v10, "lowerPercentile");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "floatValue");
      v25 = v13;
      v26 = 1;

      v30 = 1;
      v29 = objc_msgSend(v10, "sampleCount");
    }
    else
    {
      v29 = 0;
      v30 = 1;
    }

    objc_msgSend(v9, "sleepHeartRateStatistics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lowerPercentile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v15, "lowerPercentile");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "floatValue");
      v27 = v18;
      v28 = 1;

      v32 = 1;
      v31 = objc_msgSend(v15, "sampleCount");
    }
    else
    {
      v31 = 0;
      v32 = 1;
    }

    objc_msgSend(v9, "wristTemperature");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v9, "wristTemperature");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "temperatureCelsius");
      v22 = v21;

      v23 = v22;
      v33 = v7;
      v34 = v23;
      v35 = 1;
    }

    Nightingale::ngt_DayStreamProcessor::appendDay((void **)self->_dayStreamProcessor.__ptr_.__value_, &v24);
  }

}

- (unsigned)watchNumericIdentifierFromString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    -[MAIDayStreamProcessor watchIdentifiers](self, "watchIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "indexOfObject:", v4);

    if (v6 == (void *)0x7FFFFFFFFFFFFFFFLL)
    {
      -[MAIDayStreamProcessor watchIdentifiers](self, "watchIdentifiers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v4);

      -[MAIDayStreamProcessor watchIdentifiers](self, "watchIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v6) = objc_msgSend(v7, "count") - 1;

    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)beginPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4
{
  uint64_t **value;
  unsigned int v5;

  value = (uint64_t **)self->_phaseCondenser.__ptr_.__value_;
  if (((a3 - 1) & 0xF8) != 0)
    v5 = 0;
  else
    v5 = a3;
  HealthAlgorithms::PhaseCondenser::begin_phase(value, v5, a4);
}

- (void)endPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4
{
  uint64_t **value;
  unsigned int v5;

  value = (uint64_t **)self->_phaseCondenser.__ptr_.__value_;
  if (((a3 - 1) & 0xF8) != 0)
    v5 = 0;
  else
    v5 = a3;
  HealthAlgorithms::PhaseCondenser::end_phase(value, v5, a4);
}

- (MAIDayStreamProcessorOutput)analyzeWithMostRecentMenstrualFlowJulianDayUpdated:(SEL)a3
{
  char *v6;
  char *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  NSObject *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  unsigned int *v33;
  unsigned int *v34;
  void *v35;
  unsigned int v36;
  unsigned __int8 v37;
  void *v38;
  unsigned int *v39;
  unsigned int *v40;
  void *v41;
  unsigned int v42;
  unsigned __int8 v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  MAIDayStreamProcessorOutput *result;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  NSObject *v90;
  void *v92;
  void *v93;
  char *v94;
  void *__p;
  unsigned int *v96;
  unsigned int v97;
  char v98;
  unsigned int v99;
  char v100;
  unsigned int v101;
  char v102;
  unsigned int v103;
  char v104;
  unsigned int v105;
  char v106;
  unsigned int v107;
  char v108;
  unsigned int v109;
  char v110;
  unsigned int v111;
  char v112;
  unsigned int v113;
  char v114;
  unsigned __int8 v115[136];
  char v116;
  unsigned __int8 v117;
  unsigned __int8 v118;
  unsigned __int8 v119;
  unsigned int v120;
  char v121;
  unsigned int v122;
  char v123;
  unsigned __int8 v124;
  unsigned __int8 v125;
  unsigned int v126;
  unsigned int v127;
  unsigned int v128;
  unsigned int v129;
  unsigned int v130;
  unsigned int v131;
  unsigned int v132;
  unsigned __int8 v133;
  int v134;
  unsigned int v135;
  unsigned int v136;
  unsigned int v137;
  unsigned int v138;
  int v139;
  int v140;
  int v141;
  int v142;
  int v143;
  int v144;
  unsigned __int8 v145;
  unsigned __int8 v146;
  unsigned __int8 v147;
  unsigned int v148;
  unsigned int v149;
  unsigned int v150;
  unsigned int v151;
  unsigned int v152;
  char v153;
  _QWORD v154[33];
  _QWORD v155[35];

  v155[33] = *MEMORY[0x24BDAC8D0];
  HealthAlgorithms::PhaseCondenser::phase_updates((HealthAlgorithms::PhaseCondenser *)self->_phaseCondenser.__ptr_.__value_, (uint64_t)&v93);
  v6 = (char *)v93;
  v7 = v94;
  if (v93 != v94)
  {
    do
    {
      Nightingale::ngt_DayStreamProcessor::appendPhaseSet((std::vector<int> *)self->_dayStreamProcessor.__ptr_.__value_, *(_QWORD *)v6, *((_DWORD *)v6 + 2));
      v6 += 16;
    }
    while (v6 != v7);
    v6 = (char *)v93;
  }
  if (v6)
  {
    v94 = v6;
    operator delete(v6);
  }
  v8 = (void *)objc_opt_new();
  retstr->var1 = 0;
  retstr->var2 = 0;
  v9 = v8;
  retstr->var0 = v9;
  v92 = v9;
  Nightingale::ngt_DayStreamProcessor::analyze((uint64_t)self->_dayStreamProcessor.__ptr_.__value_, a4 & 0xFFFFFF00 | a4 & ~((int)a4 >> 31) | ((unint64_t)((int)a4 > 0) << 32), 1, (uint64_t)&v93);
  objc_msgSend(v9, "setIsUserInactive:", v118);
  if (v116)
  {
    HealthAlgorithms::deviationAnalysis((uint64_t)v115);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDeviationAnalysis:", v10);

  }
  if (v153)
  {
    retrieve_id_for_core_analytics();
    v90 = (id)objc_claimAutoreleasedReturnValue();
    v154[0] = CFSTR("awakeSHRMissingRate");
    LODWORD(v11) = v134;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v155[0] = v89;
    v154[1] = CFSTR("calFWErr");
    if (v123)
      v12 = v122;
    else
      v12 = 1000;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v12);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v155[1] = v88;
    v154[2] = CFSTR("currentCycleFactor");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v128);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v155[2] = v87;
    v154[3] = CFSTR("daysBetweenConfirmedOvulationAndNotificationDay");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v150);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v155[3] = v86;
    v154[4] = CFSTR("daysPassedEPAvailability");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v129);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v155[4] = v85;
    v154[5] = CFSTR("daysWithWristTempInPast12Days");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v130);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v155[5] = v84;
    v154[6] = CFSTR("daysWithWristTempInPast19Days");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v131);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v155[6] = v83;
    v154[7] = CFSTR("daysWithWristTempInPast45Days");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v132);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v155[7] = v82;
    v154[8] = CFSTR("deltaBetweenTodayAndCalOvulation");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v127);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v155[8] = v81;
    v154[9] = CFSTR("dlFWErr");
    if (v121)
      v13 = v120;
    else
      v13 = 1000;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v13);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v155[9] = v80;
    v154[10] = CFSTR("fertileWindowPeriodUpdateCombination");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v133);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v155[10] = v79;
    v154[11] = CFSTR("hasMultipleWatchWithKali");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v125);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v155[11] = v78;
    v154[12] = CFSTR("isOnCycleFactors");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v124);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v155[12] = v77;
    v154[13] = CFSTR("isOngoingMenstruation");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v119);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v155[13] = v76;
    v154[14] = CFSTR("kaliDay2DayNoiseAnchoredByToday");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v149);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v155[14] = v75;
    v154[15] = CFSTR("kaliMeetsDLLSTMAvailability");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v147);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v155[15] = v74;
    v154[16] = CFSTR("kaliMeetsDLRFAvailability");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v146);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v155[16] = v73;
    v154[17] = CFSTR("kaliMeetsExpeditedPathAvailability");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v145);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v155[17] = v72;
    v154[18] = CFSTR("kaliSignalAtOvulationEstimate");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v148);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v155[18] = v71;
    v154[19] = CFSTR("ovulationConfirmationMethod");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v151);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v155[19] = v70;
    v154[20] = CFSTR("ovulationConfirmationNoUpdateReason");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v152);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v155[20] = v69;
    v154[21] = CFSTR("percentile30AwakeSHRCountOver45Days");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v137);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v155[21] = v68;
    v154[22] = CFSTR("percentile50AwakeSHRCountOver45Days");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v135);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v155[22] = v67;
    v154[23] = CFSTR("percentile30NightSHRCountOver45Days");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v138);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v155[23] = v66;
    v154[24] = CFSTR("percentile50NightSHRCountOver45Days");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v136);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v155[24] = v14;
    v154[25] = CFSTR("periodPredictionMethod");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v126);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v155[25] = v15;
    v155[26] = v90;
    v154[26] = CFSTR("pseudoDeviceID");
    v154[27] = CFSTR("ratioAwakeSedentaryHeartRateCountMoreThan12");
    LODWORD(v16) = v139;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v155[27] = v17;
    v154[28] = CFSTR("ratioAwakeSedentaryHeartRateCountMoreThan18");
    LODWORD(v18) = v140;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v155[28] = v19;
    v154[29] = CFSTR("ratioAwakeSedentaryHeartRateCountMoreThan24");
    LODWORD(v20) = v141;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v155[29] = v21;
    v154[30] = CFSTR("ratioSleepSedentaryHeartRateCountMoreThan12");
    LODWORD(v22) = v142;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v155[30] = v23;
    v154[31] = CFSTR("ratioSleepSedentaryHeartRateCountMoreThan18");
    LODWORD(v24) = v143;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v155[31] = v25;
    v154[32] = CFSTR("ratioSleepSedentaryHeartRateCountMoreThan24");
    LODWORD(v26) = v144;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v155[32] = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v155, v154, 33);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    retstr->var1 = v65;
  }
  else
  {
    ha_get_log();
    v28 = objc_claimAutoreleasedReturnValue();
    v90 = v28;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[MAIDayStreamProcessor analyzeWithMostRecentMenstrualFlowJulianDayUpdated:].cold.1(v28);
  }

  if (v116)
  {
    retrieve_id_for_core_analytics();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v117;
    -[MAIDayStreamProcessor userAgeInYears](self, "userAgeInYears");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    HealthAlgorithms::deviationAnalysisHIDCoreAnalytics(v115, v29, v30 != 0, v31);
    retstr->var2 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0x4EC4EC4EC4EC4EC5 * (((char *)v96 - (_BYTE *)__p) >> 3), v65);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (unsigned int *)__p;
  v34 = v96;
  if (__p != v96)
  {
    do
    {
      if (*((_BYTE *)v33 + 40))
      {
        v35 = (void *)objc_opt_new();
        objc_msgSend(v35, "setJulianDayOfWindowStart:", *v33);
        if (*((_BYTE *)v33 + 40))
        {
          objc_msgSend(v35, "setStartProbabilityMean:", *((double *)v33 + 1));
          objc_msgSend(v35, "setStartProbabilityStdDev:", *((double *)v33 + 2));
        }
        if (*((_BYTE *)v33 + 80))
        {
          objc_msgSend(v35, "setEndProbabilityMean:", *((double *)v33 + 6));
          objc_msgSend(v35, "setEndProbabilityStdDev:", *((double *)v33 + 7));
        }
        objc_msgSend(v35, "setLowRange:", (int)v33[22], (int)v33[23]);
        objc_msgSend(v35, "setDaysOffsetFromCalendarMethod:", (int)v33[24]);
        v36 = v33[25];
        if (v36 >= 4)
          v37 = 3;
        else
          v37 = 3 - v36;
        objc_msgSend(v35, "setPredictionPrimarySource:", v37);
        objc_msgSend(v32, "addObject:", v35);

      }
      v33 += 26;
    }
    while (v33 != v34);
  }
  objc_msgSend(v92, "setFertilityPredictions:", v32);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0x4EC4EC4EC4EC4EC5 * ((v94 - (_BYTE *)v93) >> 3));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (unsigned int *)v93;
  v40 = (unsigned int *)v94;
  if (v93 != v94)
  {
    do
    {
      v41 = (void *)objc_opt_new();
      objc_msgSend(v41, "setJulianDayOfWindowStart:", *v39);
      if (*((_BYTE *)v39 + 40))
      {
        objc_msgSend(v41, "setStartProbabilityMean:", *((double *)v39 + 1));
        objc_msgSend(v41, "setStartProbabilityStdDev:", *((double *)v39 + 2));
      }
      if (*((_BYTE *)v39 + 80))
      {
        objc_msgSend(v41, "setEndProbabilityMean:", *((double *)v39 + 6));
        objc_msgSend(v41, "setEndProbabilityStdDev:", *((double *)v39 + 7));
      }
      objc_msgSend(v41, "setLowRange:", (int)v39[22], (int)v39[23]);
      objc_msgSend(v41, "setDaysOffsetFromCalendarMethod:", (int)v39[24]);
      v42 = v39[25];
      if (v42 >= 4)
        v43 = 3;
      else
        v43 = 3 - v42;
      objc_msgSend(v41, "setPredictionPrimarySource:", v43);
      objc_msgSend(v38, "addObject:", v41);

      v39 += 26;
    }
    while (v39 != v40);
  }
  if (v117 && objc_msgSend(v38, "count"))
  {
    objc_msgSend(v38, "firstObject");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setIsOngoingMenstruation:", 1);

  }
  objc_msgSend(v92, "setMenstruationPredictions:", v38);
  v45 = (void *)objc_opt_new();
  objc_msgSend(v92, "setStats:", v45);

  if (v98)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v97);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "stats");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setMedianCycleLength:", v46);

  }
  if (v100)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v99);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "stats");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setMedianMenstruationLength:", v48);

  }
  if (v106)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v105);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "stats");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setLowerCycleLengthPercentile:", v50);

  }
  if (v102)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v101);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "stats");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setLowerMenstruationLengthPercentile:", v52);

  }
  if (v108)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v107);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "stats");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setUpperCycleLengthPercentile:", v54);

  }
  if (v104)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v103);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "stats");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setUpperMenstruationLengthPercentile:", v56);

  }
  if (v110)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v109);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "stats");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setNumberOfCyclesFound:", v58);

  }
  if (v112)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v111);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "stats");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setJulianDayOfFirstCycleStart:", v60);

  }
  if (v114)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v113);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "stats");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setJulianDayOfLastCycleStart:", v62);

  }
  if (__p)
  {
    v96 = (unsigned int *)__p;
    operator delete(__p);
  }
  if (v93)
  {
    v94 = (char *)v93;
    operator delete(v93);
  }

  return result;
}

- (NSMutableArray)watchIdentifiers
{
  return self->_watchIdentifiers;
}

- (void)setWatchIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_watchIdentifiers, a3);
}

- (NSNumber)userAgeInYears
{
  return self->_userAgeInYears;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgeInYears, 0);
  objc_storeStrong((id *)&self->_watchIdentifiers, 0);
  std::unique_ptr<HealthAlgorithms::PhaseCondenser>::reset[abi:nn180100]((uint64_t *)&self->_phaseCondenser, 0);
  std::unique_ptr<Nightingale::ngt_DayStreamProcessor>::reset[abi:nn180100]((Nightingale::ngt_DayStreamProcessor **)&self->_dayStreamProcessor, 0);
}

- (void)initWithConfig:(os_log_t)log .cold.1(os_log_t log, double a2)
{
  int v2;
  double v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a2;
  _os_log_fault_impl(&dword_221550000, log, OS_LOG_TYPE_FAULT, "age of %f years doesn't make sense: ignoring it", (uint8_t *)&v2, 0xCu);
}

- (void)analyzeWithMostRecentMenstrualFlowJulianDayUpdated:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_221550000, log, OS_LOG_TYPE_ERROR, "coreAnalyticsOut for day stream processor has no value", v1, 2u);
}

@end
