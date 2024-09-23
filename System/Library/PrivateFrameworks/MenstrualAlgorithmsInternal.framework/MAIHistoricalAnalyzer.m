@implementation MAIHistoricalAnalyzer

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_BYTE *)self + 16) = 0;
  *((_BYTE *)self + 20) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (MAIHistoricalAnalyzer)init
{
  id v2;
  uint64_t v3;
  void *v4;
  Nightingale::ngt_HistoricalAnalyzer *v5;
  _QWORD *v6;
  id v7;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MAIHistoricalAnalyzer;
  v2 = -[MAIHistoricalAnalyzer init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    v4 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v3;

    v5 = (Nightingale::ngt_HistoricalAnalyzer *)operator new();
    Nightingale::ngt_HistoricalAnalyzer::ngt_HistoricalAnalyzer(v5);
    std::unique_ptr<Nightingale::ngt_HistoricalAnalyzer>::reset[abi:nn180100]((Nightingale::ngt_HistoricalAnalyzer **)v2 + 1, v5);
    v6 = (_QWORD *)operator new();
    v6[2] = 0;
    v6[1] = 0;
    *v6 = v6 + 1;
    v9 = 0;
    std::unique_ptr<HealthAlgorithms::PhaseCondenser>::reset[abi:nn180100]((uint64_t *)v2 + 3, (uint64_t)v6);
    std::unique_ptr<HealthAlgorithms::PhaseCondenser>::reset[abi:nn180100](&v9, 0);
    v7 = v2;
  }

  return (MAIHistoricalAnalyzer *)v2;
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
  v7 = -[MAIHistoricalAnalyzer watchNumericIdentifierFromString:](self, "watchNumericIdentifierFromString:", v6);

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

    Nightingale::ngt_HistoricalAnalyzer::appendDay((void **)self->_historicalAnalyzer.__ptr_.__value_, &v24);
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
    -[MAIHistoricalAnalyzer watchIdentifiers](self, "watchIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "indexOfObject:", v4);

    if (v6 == (void *)0x7FFFFFFFFFFFFFFFLL)
    {
      -[MAIHistoricalAnalyzer watchIdentifiers](self, "watchIdentifiers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v4);

      -[MAIHistoricalAnalyzer watchIdentifiers](self, "watchIdentifiers");
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

- (id)phaseStringFromNumber:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[9];
  _QWORD v8[10];

  v8[9] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v7[0] = &unk_24E7207A0;
    v7[1] = &unk_24E7207B8;
    v8[0] = CFSTR("Pregnancy");
    v8[1] = CFSTR("Lactation");
    v7[2] = &unk_24E7207D0;
    v7[3] = &unk_24E7207E8;
    v8[2] = CFSTR("ContraceptiveImplant");
    v8[3] = CFSTR("ContraceptiveInjection");
    v7[4] = &unk_24E720800;
    v7[5] = &unk_24E720818;
    v8[4] = CFSTR("ContraceptiveIntrauterineDevice");
    v8[5] = CFSTR("ContraceptiveIntravaginalRing");
    v7[6] = &unk_24E720830;
    v7[7] = &unk_24E720848;
    v8[6] = CFSTR("ContraceptiveOral");
    v8[7] = CFSTR("ContraceptivePatch");
    v7[8] = &unk_24E720860;
    v8[8] = CFSTR("ContraceptiveUnspecified");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (MAIHistoricalAnalyzerOutput)analyze
{
  char *v3;
  char *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  NSObject *v17;
  void *v18;
  unsigned int *v19;
  unsigned int *i;
  void *v21;
  void *v22;
  unsigned __int8 *v23;
  unsigned __int8 *v24;
  unsigned __int8 v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  NSObject *v30;
  unsigned int v31;
  unsigned __int8 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
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
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  char *v71;
  void *v72;
  uint64_t v73;
  unsigned int *v74;
  unsigned int *v75;
  int v76;
  int v77;
  unsigned __int8 v78;
  unsigned int v79;
  unsigned int v80;
  unsigned int v81;
  unsigned int v82;
  unsigned int v83;
  unsigned int v84;
  unsigned int v85;
  unsigned int v86;
  unsigned int v87;
  unsigned int v88;
  unsigned int v89;
  unsigned int v90;
  unsigned int v91;
  unsigned int v92;
  unsigned int v93;
  unsigned int v94;
  unsigned int v95;
  unsigned int v96;
  unsigned int v97;
  unsigned int v98;
  unsigned int v99;
  unsigned int v100;
  unsigned int v101;
  unsigned int v102;
  unsigned int v103;
  unsigned int v104;
  unsigned int v105;
  unsigned int v106;
  unsigned int v107;
  unsigned int v108;
  unsigned int v109;
  unsigned int v110;
  unsigned int v111;
  unsigned int v112;
  unsigned int v113;
  unsigned int v114;
  unsigned int v115;
  unsigned int v116;
  unsigned int v117;
  unsigned int v118;
  unsigned int v119;
  unsigned int v120;
  unsigned int v121;
  unsigned int v122;
  unsigned int v123;
  char v124;
  _QWORD v125[48];
  void *__p;
  char *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  uint64_t v174;
  MAIHistoricalAnalyzerOutput result;

  v174 = *MEMORY[0x24BDAC8D0];
  HealthAlgorithms::PhaseCondenser::phase_updates((HealthAlgorithms::PhaseCondenser *)self->_phaseCondenser.__ptr_.__value_, (uint64_t)&__p);
  v3 = (char *)__p;
  v4 = v127;
  if (__p != v127)
  {
    do
    {
      Nightingale::ngt_HistoricalAnalyzer::appendPhaseSet((std::vector<int> *)self->_historicalAnalyzer.__ptr_.__value_, *(_QWORD *)v3, *((_DWORD *)v3 + 2));
      v3 += 16;
    }
    while (v3 != v4);
    v3 = (char *)__p;
  }
  if (v3)
  {
    v127 = v3;
    operator delete(v3);
  }
  Nightingale::ngt_HistoricalAnalyzer::analyze((Nightingale::ngt_HistoricalAnalyzer *)self->_historicalAnalyzer.__ptr_.__value_, 1, (uint64_t)&v74);
  if (v124)
  {
    v125[0] = CFSTR("countEligibleCycles");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v114);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    __p = v72;
    v125[1] = CFSTR("daysHormonalContraceptionEndLoggedBeforeCycleStartMax");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v113);
    v71 = (char *)objc_claimAutoreleasedReturnValue();
    v127 = v71;
    v125[2] = CFSTR("daysHormonalContraceptionEndLoggedBeforeCycleStartMedian");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v111);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = v70;
    v125[3] = CFSTR("daysHormonalContraceptionEndLoggedBeforeCycleStartMin");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v112);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = v69;
    v125[4] = CFSTR("daysHormonalContraceptionStartLoggedAfterCycleStartMax");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v110);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = v68;
    v125[5] = CFSTR("daysHormonalContraceptionStartLoggedAfterCycleStartMedian");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v108);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = v67;
    v125[6] = CFSTR("daysHormonalContraceptionStartLoggedAfterCycleStartMin");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v109);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = v66;
    v125[7] = CFSTR("daysPregnancyEndLoggedBeforeCycleStartMax");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v107);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = v65;
    v125[8] = CFSTR("daysPregnancyEndLoggedBeforeCycleStartMedian");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v105);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = v64;
    v125[9] = CFSTR("daysPregnancyEndLoggedBeforeCycleStartMin");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v106);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = v63;
    v125[10] = CFSTR("daysPregnancyStartLoggedAfterCycleStartMax");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v104);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = v62;
    v125[11] = CFSTR("daysPregnancyStartLoggedAfterCycleStartMedian");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v102);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = v61;
    v125[12] = CFSTR("daysPregnancyStartLoggedAfterCycleStartMin");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v103);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = v60;
    v125[13] = CFSTR("estimatedLutealPhaseLength25Pct");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v98);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = v59;
    v125[14] = CFSTR("estimatedLutealPhaseLength75Pct");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v100);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v140 = v58;
    v125[15] = CFSTR("estimatedLutealPhaseLengthMax");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v101);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = v57;
    v125[16] = CFSTR("estimatedLutealPhaseLengthMedian");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v99);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = v56;
    v125[17] = CFSTR("estimatedLutealPhaseLengthMin");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v97);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = v55;
    v125[18] = CFSTR("hasMultipleWatch");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v78);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = v54;
    v125[19] = CFSTR("kaliDay2DayNoise");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v90);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v145 = v53;
    v125[20] = CFSTR("kaliFromPrimaryWatchRatio");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v91);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = v52;
    v125[21] = CFSTR("kaliMeetsHistoricalAlgAvailability");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v79);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v147 = v51;
    v125[22] = CFSTR("kaliSignal25PctAtOvulationEstimate");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v80);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v148 = v50;
    v125[23] = CFSTR("kaliSignal25PctDueToOPK");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v85);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = v49;
    v125[24] = CFSTR("kaliSignal75PctAtOvulationEstimate");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v82);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v150 = v48;
    v125[25] = CFSTR("kaliSignal75PctDueToOPK");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v87);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = v47;
    v125[26] = CFSTR("kaliSignalMaxAtOvulationEstimate");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v84);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v152 = v46;
    v125[27] = CFSTR("kaliSignalMaxDueToOPK");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v89);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v153 = v45;
    v125[28] = CFSTR("kaliSignalMedianAtOvulationEstimate");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v81);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v154 = v44;
    v125[29] = CFSTR("kaliSignalMedianDueToOPK");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v86);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v155 = v43;
    v125[30] = CFSTR("kaliSignalMinAtOvulationEstimate");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v83);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = v42;
    v125[31] = CFSTR("kaliSignalMinDueToOPK");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v88);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v157 = v41;
    v125[32] = CFSTR("ovulationConfirmationError25Pct");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v93);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v158 = v40;
    v125[33] = CFSTR("ovulationConfirmationError75Pct");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v95);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v159 = v39;
    v125[34] = CFSTR("ovulationConfirmationErrorMax");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v96);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v160 = v38;
    v125[35] = CFSTR("ovulationConfirmationErrorMedian");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v94);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v161 = v37;
    v125[36] = CFSTR("ovulationConfirmationErrorMin");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v92);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v162 = v36;
    v125[37] = CFSTR("ovulationConfirmationFailureFactors");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v120);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v163 = v35;
    v125[38] = CFSTR("ovulationConfirmationFailureKaliAvailability");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v115);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v164 = v5;
    v125[39] = CFSTR("ovulationConfirmationFailureKaliNoise");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v116);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v165 = v6;
    v125[40] = CFSTR("ovulationConfirmationFailureKaliSignal");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v117);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v166 = v7;
    v125[41] = CFSTR("ovulationConfirmationFailureKaliSNR");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v118);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v167 = v8;
    v125[42] = CFSTR("ovulationConfirmationFailureOPK");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v121);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v168 = v9;
    v125[43] = CFSTR("ovulationConfirmationFailureShortCycles");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v119);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = v10;
    v125[44] = CFSTR("ovulationConfirmationNoFailure");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v122);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v170 = v11;
    v125[45] = CFSTR("ovulationConfirmationNoFailureMT");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v123);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = v12;
    v125[46] = CFSTR("ratioCycleHasOPK");
    LODWORD(v13) = v77;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v172 = v14;
    v125[47] = CFSTR("ratioCycleWith1DayPeriod");
    LODWORD(v15) = v76;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v173 = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &__p, v125, 48);
    v73 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    ha_get_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MAIHistoricalAnalyzer analyze].cold.1(v17);

    v73 = 0;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0x8E38E38E38E38E39 * (((char *)v75 - (char *)v74) >> 3));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v74;
  for (i = v75; v19 != i; v19 += 18)
  {
    v21 = (void *)objc_opt_new();
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", *((_QWORD *)v19 + 5) - *((_QWORD *)v19 + 4));
    v23 = (unsigned __int8 *)*((_QWORD *)v19 + 4);
    v24 = (unsigned __int8 *)*((_QWORD *)v19 + 5);
    while (v23 != v24)
    {
      v25 = *v23;
      if (((*v23 - 1) & 0xF8) != 0)
        v25 = 0;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v26);

      ++v23;
    }
    objc_msgSend(v21, "setPhases:", v22);
    if (*((_BYTE *)v19 + 4))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *v19);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFertilityStartJulianDay:", v27);

    }
    if (*((_BYTE *)v19 + 12))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v19[2]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFertilityEndJulianDay:", v28);

    }
    objc_msgSend(v21, "setJulianDayOfMenstruationStart:", v19[4]);
    objc_msgSend(v21, "setJulianDayOfMenstruationEnd:", v19[5]);
    objc_msgSend(v21, "setIsDeterminant:", *((unsigned __int8 *)v19 + 24));
    v29 = v19[15];
    if (v29 >= 5)
    {
      ha_get_log();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        LODWORD(__p) = 67109120;
        HIDWORD(__p) = v29;
        _os_log_fault_impl(&dword_221550000, v30, OS_LOG_TYPE_FAULT, "Unrecognized failureSrc %d: ", (uint8_t *)&__p, 8u);
      }

      LOBYTE(v29) = 0;
    }
    objc_msgSend(v21, "setOvulationConfirmationFailure:", v29);
    objc_msgSend(v21, "setDailyEligibleWristTemperatureCount:", (int)v19[16]);
    v31 = v19[14];
    if (v31 >= 4)
      v32 = 3;
    else
      v32 = 3 - v31;
    objc_msgSend(v21, "setPredictionPrimarySource:", v32);
    objc_msgSend(v18, "addObject:", v21);

  }
  __p = &v74;
  std::vector<Nightingale::ngt_HistoricCycle>::__destroy_vector::operator()[abi:nn180100]((void ***)&__p);
  v33 = v18;
  v34 = (void *)v73;
  result.var1 = v34;
  result.var0 = v33;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchIdentifiers, 0);
  std::unique_ptr<HealthAlgorithms::PhaseCondenser>::reset[abi:nn180100]((uint64_t *)&self->_phaseCondenser, 0);
  std::unique_ptr<Nightingale::ngt_HistoricalAnalyzer>::reset[abi:nn180100]((Nightingale::ngt_HistoricalAnalyzer **)&self->_historicalAnalyzer, 0);
}

- (void)appendDay:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_221550000, log, OS_LOG_TYPE_FAULT, "days must be appended in order", v1, 2u);
}

- (void)analyze
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_221550000, log, OS_LOG_TYPE_ERROR, "coreAnalyticsOut for historical analyzer has no value", v1, 2u);
}

@end
