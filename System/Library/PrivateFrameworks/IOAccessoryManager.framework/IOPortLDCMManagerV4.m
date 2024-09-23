@implementation IOPortLDCMManagerV4

- (id)buildMeasurementOutputString:(id)a3 withMeasurementReason:(int)a4 withMeasurementEvent:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  void *v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  unsigned int v57;
  unsigned int v58;
  void *v59;
  const __CFString *v60;
  id v61;

  v7 = (objc_class *)MEMORY[0x1E0CB3578];
  v61 = a5;
  v8 = a3;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v9, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  if (a4 > 3)
    v10 = CFSTR("None");
  else
    v10 = off_1E9214298[a4];
  v60 = v10;
  v59 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v8, "ldcmPortStatus");
  v57 = objc_msgSend(v8, "ldcmMitigationsStatus");
  v56 = objc_msgSend(v8, "ldcmFeatureStatus");
  v55 = objc_msgSend(v8, "ldcmMeasurePin");
  v54 = objc_msgSend(v8, "ldcmCompletion");
  v53 = objc_msgSend(v8, "ldcmWet");
  v13 = objc_msgSend(v8, "ldcmLowImp");
  objc_msgSend(v8, "ldcmLoadImpMag");
  v52 = v14;
  objc_msgSend(v8, "ldcmLoadImpPhase");
  v51 = v15;
  objc_msgSend(v8, "ldcmCalculatedRes");
  v50 = v16;
  objc_msgSend(v8, "ldcmCalculatedCap");
  v49 = v17;
  objc_msgSend(v8, "ldcmTIACurrentAmp");
  v48 = v18;
  objc_msgSend(v8, "ldcmVoltageAmp");
  v47 = v19;
  objc_msgSend(v8, "ldcmLeakageCurrentAmp");
  v46 = v20;
  objc_msgSend(v8, "ldcmMeasureTIASNR");
  v45 = v21;
  objc_msgSend(v8, "ldcmMeasureVoltageSNR");
  v23 = v22;
  objc_msgSend(v8, "ldcmCalTIAAmp");
  v25 = v24;
  objc_msgSend(v8, "ldcmCalVoltageAmp");
  v27 = v26;
  objc_msgSend(v8, "ldcmCalTIASNR");
  v29 = v28;
  objc_msgSend(v8, "ldcmCalVoltageSNR");
  v31 = v30;
  objc_msgSend(v8, "ldcmTIAGainCorrection");
  v33 = v32;
  objc_msgSend(v8, "ldcmVoltageGainCorrection");
  v35 = v34;
  objc_msgSend(v8, "ldcmPhaseComp");
  v37 = v36;
  v38 = objc_msgSend(v8, "ldcmWetStateDuration");
  v39 = objc_msgSend(v8, "ldcmWetStateTooLong");
  v40 = objc_msgSend(v8, "ldcmIncompSNRAmpCnt");
  v41 = objc_msgSend(v8, "ldcmIncompOVPCnt");
  v42 = objc_msgSend(v8, "ldcmIncompTimeoutCnt");

  objc_msgSend(v59, "stringWithFormat:", CFSTR("%@,%@,%@,%.12d,%.12d,%.12d,%.12d,%.12d,%.12d,%.12d,%.12f,%.12f,%.12f,%.12f,%.12f,%.12f,%.12f,%.12f,%.12f,%.12f,%.12f,%.12f,%.12f,%.12f,%.12f,%.12f,%.12d,%.12d,%.12d,%.12d,%.12d\n"), v12, v60, v61, v58, v57, v56, v55, v54, v53, v13, v52, v51, v50, v49, v48, v47,
    v46,
    v45,
    v23,
    v25,
    v27,
    v29,
    v31,
    v33,
    v35,
    v37,
    v38,
    v39,
    v40,
    v41,
    v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

- (void)logInfo:(id)a3
{
  id v4;
  int v5;
  int v6;
  _BOOL4 mitigationsEnabled;
  _BOOL4 overrideEnabled;
  int previousLDCMPortStatus;
  int v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  _BYTE v37[10];
  uint64_t v38;
  _BYTE v39[10];
  __int16 v40;
  _BYTE v41[10];
  __int16 v42;
  _BOOL4 v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(v4, "ldcmFeatureStatus");
    v6 = objc_msgSend(v4, "ldcmMitigationsStatus");
    mitigationsEnabled = self->_mitigationsEnabled;
    overrideEnabled = self->_overrideEnabled;
    v36 = 67111168;
    *(_DWORD *)v37 = v5;
    *(_WORD *)&v37[4] = 1024;
    *(_DWORD *)&v37[6] = v6;
    LOWORD(v38) = 1024;
    *(_DWORD *)((char *)&v38 + 2) = mitigationsEnabled;
    HIWORD(v38) = 1024;
    *(_DWORD *)v39 = overrideEnabled;
    *(_WORD *)&v39[4] = 1024;
    *(_DWORD *)&v39[6] = objc_msgSend(v4, "ldcmPortStatus");
    v40 = 1024;
    *(_DWORD *)v41 = objc_msgSend(v4, "ldcmWet");
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)&v41[6] = objc_msgSend(v4, "ldcmWetStateDuration");
    v42 = 1024;
    v43 = -[IOPortLDCMManagerV4 checkIsReceptacleEmpty](self, "checkIsReceptacleEmpty");
    v44 = 1024;
    v45 = objc_msgSend(v4, "ldcmRREFGated");
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - Feature Status: %x, Mitigations Status: %d, Mitigations Framework State: %d, Override Framework State: %d, Wet Declared %d, Wet Measured: %d, Wet State Duration: %d, Receptacle Empty: %d, RREF Gated: %d", (uint8_t *)&v36, 0x38u);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    previousLDCMPortStatus = self->_previousLDCMPortStatus;
    v10 = objc_msgSend(v4, "ldcmPortStatus");
    v11 = objc_msgSend(v4, "ldcmMeasurePin");
    v12 = objc_msgSend(v4, "ldcmCompletion");
    v13 = objc_msgSend(v4, "ldcmLowImp");
    v36 = 67110144;
    *(_DWORD *)v37 = previousLDCMPortStatus;
    *(_WORD *)&v37[4] = 1024;
    *(_DWORD *)&v37[6] = v10;
    LOWORD(v38) = 1024;
    *(_DWORD *)((char *)&v38 + 2) = v11;
    HIWORD(v38) = 1024;
    *(_DWORD *)v39 = v12;
    *(_WORD *)&v39[4] = 1024;
    *(_DWORD *)&v39[6] = v13;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - Analytics bitfields - _previousLDCMPortStatus %d, ldcmPortStatus %d, ldcmMeasurePin %d, ldcmCompletion %d, ldcmLowImp %d", (uint8_t *)&v36, 0x20u);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "ldcmLoadImpMag");
    v15 = v14;
    objc_msgSend(v4, "ldcmLoadImpPhase");
    v17 = v16;
    objc_msgSend(v4, "ldcmCalculatedRes");
    v19 = v18;
    objc_msgSend(v4, "ldcmCalculatedCap");
    v36 = 134218752;
    *(_QWORD *)v37 = v15;
    *(_WORD *)&v37[8] = 2048;
    v38 = v17;
    *(_WORD *)v39 = 2048;
    *(_QWORD *)&v39[2] = v19;
    v40 = 2048;
    *(_QWORD *)v41 = v20;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - Measurement Data - loadImpMag: %f, loadImpPhase: %f, calculatedRes: %f, calculatedCap: %f", (uint8_t *)&v36, 0x2Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v21 = objc_msgSend(v4, "ldcmWetStateDuration");
    v22 = objc_msgSend(v4, "ldcmWetStateTooLong");
    v23 = objc_msgSend(v4, "ldcmWetTooLongLDCMDisabled");
    v36 = 67109632;
    *(_DWORD *)v37 = v21;
    *(_WORD *)&v37[4] = 1024;
    *(_DWORD *)&v37[6] = v22;
    LOWORD(v38) = 1024;
    *(_DWORD *)((char *)&v38 + 2) = v23;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - Measurement Data - wetStateDuration: %d, wetStateTooLong: %d, wetTooLongLDCMDisabled: %d", (uint8_t *)&v36, 0x14u);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "ldcmMeasureTIASNR");
    v25 = v24;
    objc_msgSend(v4, "ldcmMeasureVoltageSNR");
    v27 = v26;
    objc_msgSend(v4, "ldcmCalTIASNR");
    v29 = v28;
    objc_msgSend(v4, "ldcmCalVoltageSNR");
    v36 = 134218752;
    *(_QWORD *)v37 = v25;
    *(_WORD *)&v37[8] = 2048;
    v38 = v27;
    *(_WORD *)v39 = 2048;
    *(_QWORD *)&v39[2] = v29;
    v40 = 2048;
    *(_QWORD *)v41 = v30;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - Measurement Data - MeasureTIASNR: %f, MeasureVoltageSNR: %f, CalTIASNR: %f, CalVoltageSNR: %f", (uint8_t *)&v36, 0x2Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "ldcmTIAGainCorrection");
    v32 = v31;
    objc_msgSend(v4, "ldcmVoltageGainCorrection");
    v34 = v33;
    objc_msgSend(v4, "ldcmPhaseComp");
    v36 = 134218496;
    *(_QWORD *)v37 = v32;
    *(_WORD *)&v37[8] = 2048;
    v38 = v34;
    *(_WORD *)v39 = 2048;
    *(_QWORD *)&v39[2] = v35;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - Measurement Data - TIAGainCorrection: %f, VoltageGainCorrection: %f, PhaseComp: %f", (uint8_t *)&v36, 0x20u);
  }

}

- (id)publishAnalytics:(id)a3 withMeasurementReason:(int)a4 withWaveformRawData:(char *)a5 withWaveformDataLen:(unint64_t)a6
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
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
  void *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const __CFString *v45;
  void *v46;
  int v47;
  NSObject *v48;
  const char *v49;
  void *v50;
  int v51;
  uint32_t v52;
  id v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  int v90;
  id v91;
  void *v92;
  int v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  int v127;
  int v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
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
  int v149;
  int v150;
  _BOOL4 v151;
  _BOOL4 v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  _BOOL4 v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  int v190;
  int v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  int v221;
  _BYTE v223[48];
  uint64_t v224;

  v224 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = v10;
  if (!self->_previousLDCMPortStatus
    && objc_msgSend(v10, "ldcmPortStatus") == 1
    && (!objc_msgSend(v11, "ldcmMeasurePin") || objc_msgSend(v11, "ldcmMeasurePin") == 1)
    && !objc_msgSend(v11, "ldcmCompletion")
    && !objc_msgSend(v11, "ldcmLowImp"))
  {
    -[IOPortLDCMManagerV4 storeWaveform:withWaveformDataLen:](self, "storeWaveform:withWaveformDataLen:", a5, a6);
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v137 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "ldcmCalculatedCap");
    objc_msgSend(v137, "numberWithDouble:");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v138, CFSTR("capacitance"));

    v139 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "ldcmLoadImpMag");
    objc_msgSend(v139, "numberWithDouble:");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v140, CFSTR("impedance"));

    v141 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "ldcmLoadImpPhase");
    objc_msgSend(v141, "numberWithDouble:");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v142, CFSTR("impedancePhase"));

    v143 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "ldcmCalculatedRes");
    objc_msgSend(v143, "numberWithDouble:");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v144, CFSTR("resistance"));

    v145 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "ldcmMeasureTIASNR");
    objc_msgSend(v145, "numberWithDouble:");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v146, CFSTR("measurementCurrentSNR"));

    v147 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "ldcmMeasureVoltageSNR");
    objc_msgSend(v147, "numberWithDouble:");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v148, CFSTR("measurementVoltageSNR"));

    v149 = objc_msgSend(v11, "ldcmWet");
    if (!a4 || v149 == 1)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v223 = 0;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - wetOnConnect!!!", v223, 2u);
      }
      v45 = CFSTR("com.apple.ioaccessorymanager.ldcm.usbc.wetOnConnect");
    }
    else
    {
      v150 = objc_msgSend(v11, "ldcmWet");
      if (a4 == 1 || v150 == 2)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v223 = 0;
          _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - wetOnDisconnect!!!", v223, 2u);
        }
        v45 = CFSTR("com.apple.ioaccessorymanager.ldcm.usbc.wetOnDisconnect");
      }
      else
      {
        v151 = -[IOPortLDCMManagerV4 checkIsReceptacleEmpty](self, "checkIsReceptacleEmpty");
        v152 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
        if (v151)
        {
          if (v152)
          {
            *(_WORD *)v223 = 0;
            _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - dryToWetTransition!!!", v223, 2u);
          }
          v45 = CFSTR("com.apple.ioaccessorymanager.ldcm.usbc.dryToWetTransition");
        }
        else
        {
          if (v152)
          {
            *(_WORD *)v223 = 0;
            _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - dryToWetTransitionPortNotEmpty!!!", v223, 2u);
          }
          v45 = CFSTR("com.apple.ioaccessorymanager.ldcm.usbc.dryToWetTransitionPortNotEmpty");
        }
      }
    }
    AnalyticsSendEvent();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "ldcmLoadImpMag");
      v193 = v192;
      objc_msgSend(v11, "ldcmLoadImpPhase");
      v195 = v194;
      objc_msgSend(v11, "ldcmCalculatedRes");
      v197 = v196;
      objc_msgSend(v11, "ldcmCalculatedCap");
      *(_DWORD *)v223 = 134218752;
      *(_QWORD *)&v223[4] = v193;
      *(_WORD *)&v223[12] = 2048;
      *(_QWORD *)&v223[14] = v195;
      *(_WORD *)&v223[22] = 2048;
      *(_QWORD *)&v223[24] = v197;
      *(_WORD *)&v223[32] = 2048;
      *(_QWORD *)&v223[34] = v198;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - dryToWetTransition - loadImpMag: %f, loadImpPhase: %f, calculatedRes: %f, calculatedCap: %f", v223, 0x2Au);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "ldcmTIACurrentAmp");
      v200 = v199;
      objc_msgSend(v11, "ldcmVoltageAmp");
      v202 = v201;
      objc_msgSend(v11, "ldcmLeakageCurrentAmp");
      *(_DWORD *)v223 = 134218496;
      *(_QWORD *)&v223[4] = v200;
      *(_WORD *)&v223[12] = 2048;
      *(_QWORD *)&v223[14] = v202;
      *(_WORD *)&v223[22] = 2048;
      *(_QWORD *)&v223[24] = v203;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - dryToWetTransition - TIACurrentAmp: %f, VoltageAmp: %f, LeakageCurrentAmp: %f", v223, 0x20u);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "ldcmMeasureTIASNR");
      v205 = v204;
      objc_msgSend(v11, "ldcmMeasureVoltageSNR");
      v207 = v206;
      objc_msgSend(v11, "ldcmLeakageCurrentAmp");
      *(_DWORD *)v223 = 134218496;
      *(_QWORD *)&v223[4] = v205;
      *(_WORD *)&v223[12] = 2048;
      *(_QWORD *)&v223[14] = v207;
      *(_WORD *)&v223[22] = 2048;
      *(_QWORD *)&v223[24] = v208;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - dryToWetTransition - MeasureTIASNR: %f, MeasureVoltageSNR: %f, LeakageCurrentAmp: %f", v223, 0x20u);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "ldcmCalTIAAmp");
      v210 = v209;
      objc_msgSend(v11, "ldcmCalVoltageAmp");
      v212 = v211;
      objc_msgSend(v11, "ldcmCalTIASNR");
      v214 = v213;
      objc_msgSend(v11, "ldcmCalVoltageSNR");
      *(_DWORD *)v223 = 134218752;
      *(_QWORD *)&v223[4] = v210;
      *(_WORD *)&v223[12] = 2048;
      *(_QWORD *)&v223[14] = v212;
      *(_WORD *)&v223[22] = 2048;
      *(_QWORD *)&v223[24] = v214;
      *(_WORD *)&v223[32] = 2048;
      *(_QWORD *)&v223[34] = v215;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - dryToWetTransition - CalTIAAmp: %f, CalVoltageAmp: %f, CalTIASNR: %f, CalVoltageSNR: %f", v223, 0x2Au);
    }
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_127;
    objc_msgSend(v11, "ldcmTIAGainCorrection");
    v217 = v216;
    objc_msgSend(v11, "ldcmVoltageGainCorrection");
    v219 = v218;
    objc_msgSend(v11, "ldcmPhaseComp");
    *(_DWORD *)v223 = 134218496;
    *(_QWORD *)&v223[4] = v217;
    *(_WORD *)&v223[12] = 2048;
    *(_QWORD *)&v223[14] = v219;
    *(_WORD *)&v223[22] = 2048;
    *(_QWORD *)&v223[24] = v220;
    v48 = MEMORY[0x1E0C81028];
    v49 = "LDCM - dryToWetTransition - TIAGainCorrection: %f, VoltageGainCorrection: %f, PhaseComp: %f";
    v52 = 32;
    goto LABEL_32;
  }
  if (-[IOPortLDCMManagerV4 previousLDCMPortStatus](self, "previousLDCMPortStatus") == 1
    && !objc_msgSend(v11, "ldcmPortStatus")
    && (!objc_msgSend(v11, "ldcmMeasurePin") || objc_msgSend(v11, "ldcmMeasurePin") == 1)
    && !objc_msgSend(v11, "ldcmCompletion")
    && !objc_msgSend(v11, "ldcmLowImp"))
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v153 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "ldcmLoadImpMag");
    objc_msgSend(v153, "numberWithDouble:");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v154, CFSTR("initialImpedance"));

    v155 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "ldcmCalculatedRes");
    objc_msgSend(v155, "numberWithDouble:");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v156, CFSTR("initialResistance"));

    v157 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "ldcmCalculatedCap");
    objc_msgSend(v157, "numberWithDouble:");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v158, CFSTR("initialCapacitance"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "ldcmWetStateDuration"));
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v159, CFSTR("wetDuration"));

    LODWORD(v159) = -[IOPortLDCMManagerV4 checkIsReceptacleEmpty](self, "checkIsReceptacleEmpty");
    v160 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v159)
    {
      if (v160)
      {
        *(_WORD *)v223 = 0;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - wetToDryTransition!!!", v223, 2u);
      }
      v45 = CFSTR("com.apple.ioaccessorymanager.ldcm.usbc.wetToDryTransition");
    }
    else
    {
      if (v160)
      {
        *(_WORD *)v223 = 0;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - wetToDryTransitionPortNotEmpty!!!", v223, 2u);
      }
      v45 = CFSTR("com.apple.ioaccessorymanager.ldcm.usbc.wetToDryTransitionPortNotEmpty");
    }
    AnalyticsSendEvent();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v223 = 0;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - wetToDryTransition!!!", v223, 2u);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "ldcmLoadImpMag");
      v162 = v161;
      objc_msgSend(v11, "ldcmLoadImpPhase");
      v164 = v163;
      objc_msgSend(v11, "ldcmCalculatedRes");
      v166 = v165;
      objc_msgSend(v11, "ldcmCalculatedCap");
      *(_DWORD *)v223 = 134218752;
      *(_QWORD *)&v223[4] = v162;
      *(_WORD *)&v223[12] = 2048;
      *(_QWORD *)&v223[14] = v164;
      *(_WORD *)&v223[22] = 2048;
      *(_QWORD *)&v223[24] = v166;
      *(_WORD *)&v223[32] = 2048;
      *(_QWORD *)&v223[34] = v167;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - wetToDryTransition - loadImpMag: %f, loadImpPhase: %f, calculatedRes: %f, calculatedCap: %f", v223, 0x2Au);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "ldcmTIACurrentAmp");
      v169 = v168;
      objc_msgSend(v11, "ldcmVoltageAmp");
      v171 = v170;
      objc_msgSend(v11, "ldcmLeakageCurrentAmp");
      *(_DWORD *)v223 = 134218496;
      *(_QWORD *)&v223[4] = v169;
      *(_WORD *)&v223[12] = 2048;
      *(_QWORD *)&v223[14] = v171;
      *(_WORD *)&v223[22] = 2048;
      *(_QWORD *)&v223[24] = v172;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - wetToDryTransition - TIACurrentAmp: %f, VoltageAmp: %f, LeakageCurrentAmp: %f", v223, 0x20u);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "ldcmMeasureTIASNR");
      v174 = v173;
      objc_msgSend(v11, "ldcmMeasureVoltageSNR");
      v176 = v175;
      objc_msgSend(v11, "ldcmLeakageCurrentAmp");
      *(_DWORD *)v223 = 134218496;
      *(_QWORD *)&v223[4] = v174;
      *(_WORD *)&v223[12] = 2048;
      *(_QWORD *)&v223[14] = v176;
      *(_WORD *)&v223[22] = 2048;
      *(_QWORD *)&v223[24] = v177;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - wetToDryTransition - MeasureTIASNR: %f, MeasureVoltageSNR: %f, LeakageCurrentAmp: %f", v223, 0x20u);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "ldcmCalTIAAmp");
      v179 = v178;
      objc_msgSend(v11, "ldcmCalVoltageAmp");
      v181 = v180;
      objc_msgSend(v11, "ldcmCalTIASNR");
      v183 = v182;
      objc_msgSend(v11, "ldcmCalVoltageSNR");
      *(_DWORD *)v223 = 134218752;
      *(_QWORD *)&v223[4] = v179;
      *(_WORD *)&v223[12] = 2048;
      *(_QWORD *)&v223[14] = v181;
      *(_WORD *)&v223[22] = 2048;
      *(_QWORD *)&v223[24] = v183;
      *(_WORD *)&v223[32] = 2048;
      *(_QWORD *)&v223[34] = v184;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - wetToDryTransition - CalTIAAmp: %f, CalVoltageAmp: %f, CalTIASNR: %f, CalVoltageSNR: %f", v223, 0x2Au);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "ldcmTIAGainCorrection");
      v186 = v185;
      objc_msgSend(v11, "ldcmVoltageGainCorrection");
      v188 = v187;
      objc_msgSend(v11, "ldcmPhaseComp");
      *(_DWORD *)v223 = 134218496;
      *(_QWORD *)&v223[4] = v186;
      *(_WORD *)&v223[12] = 2048;
      *(_QWORD *)&v223[14] = v188;
      *(_WORD *)&v223[22] = 2048;
      *(_QWORD *)&v223[24] = v189;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - wetToDryTransition - TIAGainCorrection: %f, VoltageGainCorrection: %f, PhaseComp: %f", v223, 0x20u);
    }
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_127;
    v190 = objc_msgSend(v11, "ldcmWetStateDuration");
    v191 = objc_msgSend(v11, "ldcmWetStateTooLong");
    *(_DWORD *)v223 = 67109376;
    *(_DWORD *)&v223[4] = v190;
    *(_WORD *)&v223[8] = 1024;
    *(_DWORD *)&v223[10] = v191;
    v48 = MEMORY[0x1E0C81028];
    v49 = "LDCM - wetToDryTransition - WetStateDuration: %d, WetStateTooLong: %d";
    v52 = 14;
    goto LABEL_32;
  }
  if (objc_msgSend(v11, "ldcmCompletion") == 1)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v223 = 0;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - badMeasurement!!!", v223, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "ldcmIncompSNRAmpCnt"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("count"));

    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "ldcmTIACurrentAmp");
    objc_msgSend(v14, "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v15, CFSTR("badMeasurementCurrentAmp"));

    v16 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "ldcmVoltageAmp");
    objc_msgSend(v16, "numberWithDouble:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v17, CFSTR("badMeasurementVoltageAmp"));

    v18 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "ldcmCalVoltageAmp");
    objc_msgSend(v18, "numberWithDouble:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v19, CFSTR("badCalVoltageAmp"));

    v20 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "ldcmCalTIAAmp");
    objc_msgSend(v20, "numberWithDouble:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v21, CFSTR("badCalCurrentAmp"));

    v22 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "ldcmMeasureTIASNR");
    objc_msgSend(v22, "numberWithDouble:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v23, CFSTR("badMeasurementCurrentSNR"));

    v24 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "ldcmMeasureVoltageSNR");
    objc_msgSend(v24, "numberWithDouble:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v25, CFSTR("badMeasurementVoltageSNR"));

    v26 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "ldcmCalVoltageSNR");
    objc_msgSend(v26, "numberWithDouble:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v27, CFSTR("badCalVoltageSNR"));

    v28 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "ldcmCalTIASNR");
    objc_msgSend(v28, "numberWithDouble:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v29, CFSTR("badCalCurrentSNR"));

    AnalyticsSendEvent();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v30 = objc_msgSend(v11, "ldcmIncompSNRAmpCnt");
      objc_msgSend(v11, "ldcmTIACurrentAmp");
      v32 = v31;
      objc_msgSend(v11, "ldcmVoltageAmp");
      v34 = v33;
      objc_msgSend(v11, "ldcmCalTIAAmp");
      v36 = v35;
      objc_msgSend(v11, "ldcmCalVoltageAmp");
      *(_DWORD *)v223 = 67110144;
      *(_DWORD *)&v223[4] = v30;
      *(_WORD *)&v223[8] = 2048;
      *(_QWORD *)&v223[10] = v32;
      *(_WORD *)&v223[18] = 2048;
      *(_QWORD *)&v223[20] = v34;
      *(_WORD *)&v223[28] = 2048;
      *(_QWORD *)&v223[30] = v36;
      *(_WORD *)&v223[38] = 2048;
      *(_QWORD *)&v223[40] = v37;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - IncompSNRAmpCnt: %d, TIACurrentAmp: %f, VoltageAmp: %f, CalTIAAmp: %f, CalVoltageAmp: %f", v223, 0x30u);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "ldcmMeasureTIASNR");
      v39 = v38;
      objc_msgSend(v11, "ldcmMeasureVoltageSNR");
      v41 = v40;
      objc_msgSend(v11, "ldcmCalTIASNR");
      v43 = v42;
      objc_msgSend(v11, "ldcmCalVoltageSNR");
      *(_DWORD *)v223 = 134218752;
      *(_QWORD *)&v223[4] = v39;
      *(_WORD *)&v223[12] = 2048;
      *(_QWORD *)&v223[14] = v41;
      *(_WORD *)&v223[22] = 2048;
      *(_QWORD *)&v223[24] = v43;
      *(_WORD *)&v223[32] = 2048;
      *(_QWORD *)&v223[34] = v44;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - TIACurrentSNR: %f, VoltageSNR: %f, CalTIASNR: %f, CalVoltageSNR: %f", v223, 0x2Au);
    }
    v45 = CFSTR("com.apple.ioaccessorymanager.ldcm.usbc.badMeasurement");
    goto LABEL_127;
  }
  if (objc_msgSend(v11, "ldcmCompletion") == 2)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v223 = 0;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - ovpError!!!", v223, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "ldcmIncompOVPCnt"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v46, CFSTR("count"));

    v45 = CFSTR("com.apple.ioaccessorymanager.ldcm.usbc.ovpError");
    AnalyticsSendEvent();
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_127;
    v47 = objc_msgSend(v11, "ldcmIncompOVPCnt");
    *(_DWORD *)v223 = 67109120;
    *(_DWORD *)&v223[4] = v47;
    v48 = MEMORY[0x1E0C81028];
    v49 = "LDCM - IncompOVPCnt: %d";
    goto LABEL_31;
  }
  if (objc_msgSend(v11, "ldcmCompletion") == 3)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v223 = 0;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - ldcmPreempted!!!", v223, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "ldcmIncompTimeoutCnt"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v50, CFSTR("count"));

    v45 = CFSTR("com.apple.ioaccessorymanager.ldcm.usbc.ldcmPreempted");
    AnalyticsSendEvent();
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_127;
    v51 = objc_msgSend(v11, "ldcmIncompTimeoutCnt");
    *(_DWORD *)v223 = 67109120;
    *(_DWORD *)&v223[4] = v51;
    v48 = MEMORY[0x1E0C81028];
    v49 = "LDCM - IncompTimeoutCnt: %d";
LABEL_31:
    v52 = 8;
LABEL_32:
    _os_log_impl(&dword_1D13BF000, v48, OS_LOG_TYPE_DEFAULT, v49, v223, v52);
LABEL_127:

    goto LABEL_128;
  }
  if (objc_msgSend(v11, "ldcmCompletion") == 4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v223 = 0;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - ldcmDisabled!!!", v223, 2u);
    }
    v53 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "ldcmFeatureStatus"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setObject:forKey:", v54, CFSTR("disable_reason"));

    AnalyticsSendEvent();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v55 = objc_msgSend(v11, "ldcmFeatureStatus");
      *(_DWORD *)v223 = 67109120;
      *(_DWORD *)&v223[4] = v55;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - ldcmDisabled - FeatureStatus: %d", v223, 8u);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v223 = 0;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - selfTestFailure!!!", v223, 2u);
    }
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);

    v56 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "ldcmCalculatedRes");
    objc_msgSend(v56, "numberWithDouble:");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v57, CFSTR("resistance"));

    v58 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "ldcmCalculatedCap");
    objc_msgSend(v58, "numberWithDouble:");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v59, CFSTR("capacitance"));

    AnalyticsSendEvent();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "ldcmLoadImpMag");
      v61 = v60;
      objc_msgSend(v11, "ldcmLoadImpPhase");
      v63 = v62;
      objc_msgSend(v11, "ldcmCalculatedRes");
      v65 = v64;
      objc_msgSend(v11, "ldcmCalculatedCap");
      *(_DWORD *)v223 = 134218752;
      *(_QWORD *)&v223[4] = v61;
      *(_WORD *)&v223[12] = 2048;
      *(_QWORD *)&v223[14] = v63;
      *(_WORD *)&v223[22] = 2048;
      *(_QWORD *)&v223[24] = v65;
      *(_WORD *)&v223[32] = 2048;
      *(_QWORD *)&v223[34] = v66;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - selfTestFailure - loadImpMag: %f, loadImpPhase: %f, calculatedRes: %f, calculatedCap: %f", v223, 0x2Au);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "ldcmTIACurrentAmp");
      v68 = v67;
      objc_msgSend(v11, "ldcmVoltageAmp");
      v70 = v69;
      objc_msgSend(v11, "ldcmLeakageCurrentAmp");
      *(_DWORD *)v223 = 134218496;
      *(_QWORD *)&v223[4] = v68;
      *(_WORD *)&v223[12] = 2048;
      *(_QWORD *)&v223[14] = v70;
      *(_WORD *)&v223[22] = 2048;
      *(_QWORD *)&v223[24] = v71;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - selfTestFailure - TIACurrentAmp: %f, VoltageAmp: %f, LeakageCurrentAmp: %f", v223, 0x20u);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "ldcmMeasureTIASNR");
      v73 = v72;
      objc_msgSend(v11, "ldcmMeasureVoltageSNR");
      v75 = v74;
      objc_msgSend(v11, "ldcmLeakageCurrentAmp");
      *(_DWORD *)v223 = 134218496;
      *(_QWORD *)&v223[4] = v73;
      *(_WORD *)&v223[12] = 2048;
      *(_QWORD *)&v223[14] = v75;
      *(_WORD *)&v223[22] = 2048;
      *(_QWORD *)&v223[24] = v76;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - selfTestFailure - MeasureTIASNR: %f, MeasureVoltageSNR: %f, LeakageCurrentAmp: %f", v223, 0x20u);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "ldcmCalTIAAmp");
      v78 = v77;
      objc_msgSend(v11, "ldcmCalVoltageAmp");
      v80 = v79;
      objc_msgSend(v11, "ldcmCalTIASNR");
      v82 = v81;
      objc_msgSend(v11, "ldcmCalVoltageSNR");
      *(_DWORD *)v223 = 134218752;
      *(_QWORD *)&v223[4] = v78;
      *(_WORD *)&v223[12] = 2048;
      *(_QWORD *)&v223[14] = v80;
      *(_WORD *)&v223[22] = 2048;
      *(_QWORD *)&v223[24] = v82;
      *(_WORD *)&v223[32] = 2048;
      *(_QWORD *)&v223[34] = v83;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - selfTestFailure - CalTIAAmp: %f, CalVoltageAmp: %f, CalTIASNR: %f, CalVoltageSNR: %f", v223, 0x2Au);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "ldcmTIAGainCorrection");
      v85 = v84;
      objc_msgSend(v11, "ldcmVoltageGainCorrection");
      v87 = v86;
      objc_msgSend(v11, "ldcmPhaseComp");
      *(_DWORD *)v223 = 134218496;
      *(_QWORD *)&v223[4] = v85;
      *(_WORD *)&v223[12] = 2048;
      *(_QWORD *)&v223[14] = v87;
      *(_WORD *)&v223[22] = 2048;
      *(_QWORD *)&v223[24] = v88;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - selfTestFailure - TIAGainCorrection: %f, VoltageGainCorrection: %f, PhaseComp: %f", v223, 0x20u);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v89 = objc_msgSend(v11, "ldcmWetStateDuration");
      v90 = objc_msgSend(v11, "ldcmWetStateTooLong");
      *(_DWORD *)v223 = 67109376;
      *(_DWORD *)&v223[4] = v89;
      *(_WORD *)&v223[8] = 1024;
      *(_DWORD *)&v223[10] = v90;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - selfTestFailure - WetStateDuration: %d, WetStateTooLong: %d", v223, 0xEu);
    }
    v45 = CFSTR("com.apple.ioaccessorymanager.ldcm.usbc.selfTestFailure");
    goto LABEL_127;
  }
  if (objc_msgSend(v11, "ldcmCompletion") == 5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v223 = 0;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - ldcmDisabled!!!", v223, 2u);
    }
    v91 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "ldcmFeatureStatus"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setObject:forKey:", v92, CFSTR("disable_reason"));

    AnalyticsSendEvent();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v93 = objc_msgSend(v11, "ldcmFeatureStatus");
      *(_DWORD *)v223 = 67109120;
      *(_DWORD *)&v223[4] = v93;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - ldcmDisabled - FeatureStatus: %d", v223, 8u);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v223 = 0;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - referenceMeasurementFailure!!!", v223, 2u);
    }
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);

    v94 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "ldcmCalculatedRes");
    objc_msgSend(v94, "numberWithDouble:");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v95, CFSTR("resistance"));

    v96 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "ldcmCalculatedCap");
    objc_msgSend(v96, "numberWithDouble:");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v97, CFSTR("capacitance"));

    AnalyticsSendEvent();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "ldcmLoadImpMag");
      v99 = v98;
      objc_msgSend(v11, "ldcmLoadImpPhase");
      v101 = v100;
      objc_msgSend(v11, "ldcmCalculatedRes");
      v103 = v102;
      objc_msgSend(v11, "ldcmCalculatedCap");
      *(_DWORD *)v223 = 134218752;
      *(_QWORD *)&v223[4] = v99;
      *(_WORD *)&v223[12] = 2048;
      *(_QWORD *)&v223[14] = v101;
      *(_WORD *)&v223[22] = 2048;
      *(_QWORD *)&v223[24] = v103;
      *(_WORD *)&v223[32] = 2048;
      *(_QWORD *)&v223[34] = v104;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - referenceMeasurementFailure - loadImpMag: %f, loadImpPhase: %f, calculatedRes: %f, calculatedCap: %f", v223, 0x2Au);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "ldcmTIACurrentAmp");
      v106 = v105;
      objc_msgSend(v11, "ldcmVoltageAmp");
      v108 = v107;
      objc_msgSend(v11, "ldcmLeakageCurrentAmp");
      *(_DWORD *)v223 = 134218496;
      *(_QWORD *)&v223[4] = v106;
      *(_WORD *)&v223[12] = 2048;
      *(_QWORD *)&v223[14] = v108;
      *(_WORD *)&v223[22] = 2048;
      *(_QWORD *)&v223[24] = v109;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - referenceMeasurementFailure - TIACurrentAmp: %f, VoltageAmp: %f, LeakageCurrentAmp: %f", v223, 0x20u);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "ldcmMeasureTIASNR");
      v111 = v110;
      objc_msgSend(v11, "ldcmMeasureVoltageSNR");
      v113 = v112;
      objc_msgSend(v11, "ldcmLeakageCurrentAmp");
      *(_DWORD *)v223 = 134218496;
      *(_QWORD *)&v223[4] = v111;
      *(_WORD *)&v223[12] = 2048;
      *(_QWORD *)&v223[14] = v113;
      *(_WORD *)&v223[22] = 2048;
      *(_QWORD *)&v223[24] = v114;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - referenceMeasurementFailure - MeasureTIASNR: %f, MeasureVoltageSNR: %f, LeakageCurrentAmp: %f", v223, 0x20u);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "ldcmCalTIAAmp");
      v116 = v115;
      objc_msgSend(v11, "ldcmCalVoltageAmp");
      v118 = v117;
      objc_msgSend(v11, "ldcmCalTIASNR");
      v120 = v119;
      objc_msgSend(v11, "ldcmCalVoltageSNR");
      *(_DWORD *)v223 = 134218752;
      *(_QWORD *)&v223[4] = v116;
      *(_WORD *)&v223[12] = 2048;
      *(_QWORD *)&v223[14] = v118;
      *(_WORD *)&v223[22] = 2048;
      *(_QWORD *)&v223[24] = v120;
      *(_WORD *)&v223[32] = 2048;
      *(_QWORD *)&v223[34] = v121;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - referenceMeasurementFailure - CalTIAAmp: %f, CalVoltageAmp: %f, CalTIASNR: %f, CalVoltageSNR: %f", v223, 0x2Au);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "ldcmTIAGainCorrection");
      v123 = v122;
      objc_msgSend(v11, "ldcmVoltageGainCorrection");
      v125 = v124;
      objc_msgSend(v11, "ldcmPhaseComp");
      *(_DWORD *)v223 = 134218496;
      *(_QWORD *)&v223[4] = v123;
      *(_WORD *)&v223[12] = 2048;
      *(_QWORD *)&v223[14] = v125;
      *(_WORD *)&v223[22] = 2048;
      *(_QWORD *)&v223[24] = v126;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - referenceMeasurementFailure - TIAGainCorrection: %f, VoltageGainCorrection: %f, PhaseComp: %f", v223, 0x20u);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v127 = objc_msgSend(v11, "ldcmWetStateDuration");
      v128 = objc_msgSend(v11, "ldcmWetStateTooLong");
      *(_DWORD *)v223 = 67109376;
      *(_DWORD *)&v223[4] = v127;
      *(_WORD *)&v223[8] = 1024;
      *(_DWORD *)&v223[10] = v128;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - referenceMeasurementFailure - WetStateDuration: %d, WetStateTooLong: %d", v223, 0xEu);
    }
    v45 = CFSTR("com.apple.ioaccessorymanager.ldcm.usbc.referenceMeasurementFailure");
    goto LABEL_127;
  }
  if (objc_msgSend(v11, "ldcmLowImp") == 1)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v223 = 0;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - impedanceTooLow!!!", v223, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "ldcmIncompTimeoutCnt"));
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v129, CFSTR("count"));

    v45 = CFSTR("com.apple.ioaccessorymanager.ldcm.usbc.impedanceTooLow");
    AnalyticsSendEvent();
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_127;
    objc_msgSend(v11, "ldcmLoadImpMag");
    v131 = v130;
    objc_msgSend(v11, "ldcmLoadImpPhase");
    v133 = v132;
    objc_msgSend(v11, "ldcmCalculatedRes");
    v135 = v134;
    objc_msgSend(v11, "ldcmCalculatedCap");
    *(_DWORD *)v223 = 134218752;
    *(_QWORD *)&v223[4] = v131;
    *(_WORD *)&v223[12] = 2048;
    *(_QWORD *)&v223[14] = v133;
    *(_WORD *)&v223[22] = 2048;
    *(_QWORD *)&v223[24] = v135;
    *(_WORD *)&v223[32] = 2048;
    *(_QWORD *)&v223[34] = v136;
    v48 = MEMORY[0x1E0C81028];
    v49 = "LDCM - impedanceTooLow - loadImpMag: %f, loadImpPhase: %f, calculatedRes: %f, calculatedCap: %f";
    v52 = 42;
    goto LABEL_32;
  }
  v45 = CFSTR("None");
LABEL_128:
  if (self->_previousLDCMPortStatus == 1)
  {
    v221 = objc_msgSend(v11, "ldcmPortStatus");
    if (!a4 && v221 == 1)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v223 = 0;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - WetReplug", v223, 2u);
      }
      AnalyticsSendEvent();
    }
  }
  self->_previousLDCMPortStatus = objc_msgSend(v11, "ldcmPortStatus", *(_OWORD *)v223, *(_OWORD *)&v223[16], *(_QWORD *)&v223[32], *(_QWORD *)&v223[40]);

  return (id)v45;
}

- (unsigned)previousLDCMPortStatus
{
  return self->_previousLDCMPortStatus;
}

- (void)performLDCMMeasurement:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  LDCMMeasurementV4 *v7;
  LDCMMeasurementV4 *v8;
  LDCMMeasurementV4 *v9;
  __CFString *v10;
  uint64_t v11;
  int64_t v12;
  NSObject *timer;
  dispatch_time_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint8_t buf[4];
  int v48;
  _BYTE v49[55];
  uint64_t v50;

  v3 = *(_QWORD *)&a3;
  v50 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v48 = v3;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - Beginning LDCM measurement. Reason: %d", buf, 8u);
  }
  v46 = 55;
  memset(v49, 0, sizeof(v49));
  v45 = 1152;
  bzero(buf, 0x480uLL);
  if (!self->_waveformExtractionDisabled)
  {
    v5 = -[IOPortLDCMManagerV4 getWaveform::](self, "getWaveform::", buf, &v45);
    if ((_DWORD)v5)
    {
      v30 = v5;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[IOPortLDCMManagerV4 performLDCMMeasurement:].cold.4(v30, v31, v32, v33, v34, v35, v36, v37);
    }
    if (v45 != 1152 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[IOPortLDCMManagerV4 performLDCMMeasurement:].cold.3((uint64_t)&v45, v38, v39, v40, v41, v42, v43, v44);
  }
  v6 = -[IOPortLDCMManagerV4 getData::](self, "getData::", v49, &v46, v45);
  if ((_DWORD)v6)
  {
    v15 = v6;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[IOPortLDCMManagerV4 performLDCMMeasurement:].cold.2(v15, v16, v17, v18, v19, v20, v21, v22);
    goto LABEL_27;
  }
  if (v46 != 55)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[IOPortLDCMManagerV4 performLDCMMeasurement:].cold.1((uint64_t)&v46, v23, v24, v25, v26, v27, v28, v29);
LABEL_27:
    v9 = 0;
    v10 = CFSTR("None");
    goto LABEL_20;
  }
  v7 = [LDCMMeasurementV4 alloc];
  v8 = -[LDCMMeasurementV4 initWithParams::](v7, "initWithParams::", v49, v46);
  v9 = v8;
  if ((_DWORD)v3 != 2)
    -[IOPortLDCMManagerV4 handleMeasurementResults:](self, "handleMeasurementResults:", -[LDCMMeasurementV4 ldcmPortStatus](v8, "ldcmPortStatus"));
  -[IOPortLDCMManagerV4 publishAnalytics:withMeasurementReason:withWaveformRawData:withWaveformDataLen:](self, "publishAnalytics:withMeasurementReason:withWaveformRawData:withWaveformDataLen:", v9, v3, buf, v45);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  self->_measurementInfoOutputString = (NSString *)-[IOPortLDCMManagerV4 buildMeasurementOutputString:withMeasurementReason:withMeasurementEvent:](self, "buildMeasurementOutputString:withMeasurementReason:withMeasurementEvent:", v9, v3, v10);
  if (self->_buildType != 2)
  {
    -[IOPortLDCMManagerV4 logInfo:](self, "logInfo:", v9);
    -[IOPortLDCMManagerV4 generateLDCMCSVData](self, "generateLDCMCSVData");
  }
  if (-[LDCMMeasurementV4 ldcmPortStatus](v9, "ldcmPortStatus") == 1)
  {
    self->_isWet = 1;
    -[IOPortLDCMManagerV4 setMitigations:](self, "setMitigations:", 1);
    if (!self->_isReceptacleEmpty)
      -[IOPortLDCMManagerV4 measureOccupiedWetPortDuration](self, "measureOccupiedWetPortDuration");
  }
  else
  {
    if (-[IOPortLDCMManagerV4 checkIsReceptacleEmpty](self, "checkIsReceptacleEmpty"))
    {
      -[IOPortLDCMManagerV4 setUserOverride:](self, "setUserOverride:", 0);
      -[IOPortLDCMManagerV4 setMitigations:](self, "setMitigations:", 0);
    }
    self->_isWet = 0;
  }
  if ((_DWORD)v3 == 1)
    -[IOPortLDCMManagerV4 measureOccupiedWetPortDuration](self, "measureOccupiedWetPortDuration");
LABEL_20:
  v11 = 64;
  if (!self->_isWet)
    v11 = 72;
  v12 = *(int64_t *)((char *)&self->super.isa + v11);
  timer = self->_timer;
  v14 = dispatch_walltime(0, v12);
  dispatch_source_set_timer(timer, v14, 0xFFFFFFFFFFFFFFFFLL, 0);

}

- (BOOL)checkIsReceptacleEmpty
{
  mach_port_t v2;
  const __CFDictionary *v3;
  kern_return_t MatchingServices;
  io_object_t v5;
  BOOL v6;
  BOOL v7;
  io_object_t v8;
  io_registry_entry_t v9;
  const __CFAllocator *v10;
  const __CFNumber *CFProperty;
  const __CFNumber *v12;
  const __CFBoolean *v13;
  const __CFBoolean *v14;
  int valuePtr;
  io_iterator_t existing;

  existing = 0;
  v2 = *MEMORY[0x1E0CBBAA8];
  v3 = IOServiceMatching("IOPort");
  MatchingServices = IOServiceGetMatchingServices(v2, v3, &existing);
  v5 = existing;
  if (MatchingServices)
    v6 = 1;
  else
    v6 = existing == 0;
  if (v6)
  {
    v7 = 1;
    if (!existing)
      return !v7;
    goto LABEL_22;
  }
  v8 = IOIteratorNext(existing);
  if (v8)
  {
    v9 = v8;
    v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    do
    {
      valuePtr = 0;
      CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v9, CFSTR("PortType"), v10, 0);
      v12 = CFProperty;
      if (CFProperty)
      {
        CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr);
        if (valuePtr == 2)
        {
          v13 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v9, CFSTR("ConnectionActive"), v10, 0);
          if (v13)
          {
            v14 = v13;
            v7 = CFBooleanGetValue(v13) != 0;
            CFRelease(v14);
          }
          else
          {
            v7 = 1;
          }
          IOObjectRelease(v9);
          goto LABEL_20;
        }
      }
      v9 = IOIteratorNext(existing);
    }
    while (v9);
    v7 = 1;
    if (!v12)
      goto LABEL_21;
LABEL_20:
    CFRelease(v12);
  }
  else
  {
    v7 = 1;
  }
LABEL_21:
  v5 = existing;
  if (existing)
LABEL_22:
    IOObjectRelease(v5);
  return !v7;
}

- (int)getWaveform:(char *)a3 :(unint64_t *)a4
{
  return IOConnectCallStructMethod(self->_ldcmFeatureConnect, 0x3F0u, 0, 0, a3, a4);
}

- (int)getData:(char *)outputStruct :(unint64_t *)outputStructCnt
{
  mach_port_t ldcmFeatureConnect;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  ldcmFeatureConnect = self->_ldcmFeatureConnect;
  input[0] = 1;
  return IOConnectCallMethod(ldcmFeatureConnect, 0x3EDu, input, 1u, 0, 0, 0, 0, outputStruct, outputStructCnt);
}

- (void)generateLDCMCSVData
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  int v37;
  id v38;
  void *v39;
  id v40;
  char v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  _QWORD v52[4];
  __CFString *v53;
  id v54;
  char v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  -[IOPortLDCMManagerV4 getMeasurementOutputString](self, "getMeasurementOutputString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IOPortLDCMManagerV4 buildMeasurementHeaderString](self, "buildMeasurementHeaderString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && objc_msgSend(v3, "length"))
  {
    v55 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", CFSTR("/var/logs/ldcm/"), &v55);

    if ((v6 & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = 0;
      objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/logs/ldcm/"), 1, 0, &v54);
      v9 = v54;

      v7 = 0;
      if (v9)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v57 = "-[IOPortLDCMManagerV4 generateLDCMCSVData]";
          v58 = 2112;
          v59 = v9;
          _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s Error in creating directory. %@\n", buf, 0x16u);
        }
        v7 = v9;
      }
    }
    v45 = v7;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = objc_claimAutoreleasedReturnValue();

    v46 = (void *)v11;
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@%@%@.csv"), CFSTR("/var/logs/ldcm/"), CFSTR("internalMeasurementData"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentsOfDirectoryAtPath:error:", CFSTR("/var/logs/ldcm/"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self BEGINSWITH[cd] 'internalMeasurementData'"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "filteredArrayUsingPredicate:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v16, "count"))
    {
      v30 = v45;
LABEL_14:
      objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingAtPath:", v12);
      v32 = objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        v33 = (void *)v32;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "createFileAtPath:contents:attributes:", v12, 0, 0);

        objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingAtPath:", v12);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v33)
        {
          objc_msgSend(v4, "dataUsingEncoding:", 4);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = 0;
          objc_msgSend(v33, "writeData:error:", v35, &v50);
          v36 = v50;

          v30 = v36;
        }
      }
      v49 = 0;
      v37 = objc_msgSend(v33, "seekToEndReturningOffset:error:", 0, &v49);
      v38 = v49;

      if (v37)
      {
        objc_msgSend(v3, "dataUsingEncoding:", 4);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 0;
        objc_msgSend(v33, "writeData:error:", v39, &v48);
        v40 = v48;

        v38 = v40;
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v57 = "-[IOPortLDCMManagerV4 generateLDCMCSVData]";
        v58 = 2112;
        v59 = v38;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s LDCM - Error in seeking to end of file. %@\n", buf, 0x16u);
      }
      v47 = 0;
      v41 = objc_msgSend(v33, "closeAndReturnError:", &v47);
      v42 = v47;

      if ((v41 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v57 = "-[IOPortLDCMManagerV4 generateLDCMCSVData]";
        v58 = 2112;
        v59 = v42;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s LDCM - Error in closing file. %@\n", buf, 0x16u);
      }

      goto LABEL_26;
    }
    v43 = v4;
    v44 = v3;
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __42__IOPortLDCMManagerV4_generateLDCMCSVData__block_invoke;
    v52[3] = &unk_1E9214278;
    v53 = CFSTR("/var/logs/ldcm/");
    objc_msgSend(v16, "sortedArrayUsingComparator:", v52);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v17, "lastObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@%@"), CFSTR("/var/logs/ldcm/"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "attributesOfItemAtPath:error:", v21, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "valueForKey:", *MEMORY[0x1E0CB2AF0]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 10485760);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "unsignedLongLongValue");
    if (v25 <= objc_msgSend(v24, "unsignedLongLongValue"))
    {
      v31 = (void *)MEMORY[0x1E0CB37A0];
      objc_msgSend(v17, "lastObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", CFSTR("%@%@"), CFSTR("/var/logs/ldcm/"), v28);
      v29 = v12;
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((unint64_t)objc_msgSend(v16, "count") < 0xA)
      {
LABEL_13:
        v30 = v45;

        v4 = v43;
        v3 = v44;
        goto LABEL_14;
      }
      v26 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v17, "firstObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", CFSTR("%@%@"), CFSTR("/var/logs/ldcm/"), v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0;
      objc_msgSend(v29, "removeItemAtPath:error:", v28, &v51);
    }

    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Nothing to write to csv file.\n", buf, 2u);
  }
LABEL_26:

}

- (NSString)measurementInfoOutputString
{
  return self->_measurementInfoOutputString;
}

- (id)buildMeasurementHeaderString
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("date,measurementReason,measurementEvent,ldcmPortStatus,ldcmMitigationsStatus,ldcmFeatureStatus,ldcmMeasurePin,ldcmCompletion,ldcmWet,ldcmLowImp,ldcmLoadImpMag,ldcmLoadImpPhase,ldcmCalculatedRes,ldcmCalculatedCap,ldcmTIACurrentAmp,ldcmVoltageAmp,ldcmLeakageCurrentAmp,ldcmMeasureTIASNR,ldcmMeasureVoltageSNR,ldcmCalTIAAmp,ldcmCalVoltageAmp,ldcmCalTIASNR,ldcmCalVoltageSNR,ldcmTIAGainCorrection,ldcmVoltageGainCorrection,ldcmPhaseComp,ldcmWetStateDuration,ldcmWetStateTooLong,ldcmIncompSNRAmpCnt,ldcmIncompOVPCnt,ldcmIncompTimeoutCnt\n"));
}

uint64_t __112__IOPortLDCMManagerV4_initWithParams_withDryPollingInterval_withService_withNotificationPort_withServerRunloop___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performLDCMMeasurement:", 2);
}

- (IOPortLDCMManagerV4)initWithParams:(unint64_t)a3 withDryPollingInterval:(unint64_t)a4 withService:(unsigned int)a5 withNotificationPort:(IONotificationPort *)a6 withServerRunloop:(__CFRunLoop *)a7
{
  IOPortLDCMManagerV4 *v12;
  void *v13;
  void *v14;
  char *v15;
  unsigned __int8 *v16;
  LDCMNotificationUIManagerV4 *v17;
  void *v18;
  const void *v19;
  const void *v20;
  int v21;
  const void *v22;
  const void *v23;
  int v24;
  int v25;
  int v26;
  NSObject *v27;
  const char *v28;
  dispatch_queue_t v29;
  void *v30;
  NSObject *v31;
  dispatch_source_t v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  const char *v36;
  uint32_t v37;
  IOPortLDCMManagerV4 *v38;
  objc_super v41;
  _QWORD v42[4];
  IOPortLDCMManagerV4 *v43;
  io_registry_entry_t parent;
  uint8_t buf[4];
  const char *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  parent = 0;
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __112__IOPortLDCMManagerV4_initWithParams_withDryPollingInterval_withService_withNotificationPort_withServerRunloop___block_invoke;
  v42[3] = &unk_1E9214228;
  v12 = self;
  v43 = v12;
  v13 = (void *)MEMORY[0x1D17E7C6C](v42);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v41.receiver = v12;
  v41.super_class = (Class)IOPortLDCMManagerV4;
  v15 = -[IOPortLDCMManagerV4 init](&v41, sel_init);
  v16 = (unsigned __int8 *)v15;
  if (!v15)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    *(_DWORD *)buf = 136315138;
    v46 = "-[IOPortLDCMManagerV4 initWithParams:withDryPollingInterval:withService:withNotificationPort:withServerRunloop:]";
    v35 = MEMORY[0x1E0C81028];
    v36 = "%s Failed to initialize IOPortLDCMManagerV4 super\n";
    goto LABEL_67;
  }
  *((_DWORD *)v15 + 5) = 0;
  *((_WORD *)v15 + 4) = 0;
  *((_QWORD *)v15 + 8) = a3;
  *((_QWORD *)v15 + 9) = a4;
  *(_WORD *)(v15 + 11) = 0;
  v15[15] = objc_msgSend(v14, "BOOLForKey:", CFSTR("LDCMV4DisableMitigations"));
  v16[16] = objc_msgSend(v14, "BOOLForKey:", CFSTR("LDCMV4DisableUI"));
  v16[14] = objc_msgSend(v14, "BOOLForKey:", CFSTR("LDCMWaveformExtractionDisabled"));
  *((_DWORD *)v16 + 9) = 0;
  v16[10] = objc_msgSend(v16, "checkIsReceptacleEmpty");
  v17 = -[LDCMNotificationUIManagerV4 initWithParams::]([LDCMNotificationUIManagerV4 alloc], "initWithParams::", a7, v16);
  v18 = (void *)*((_QWORD *)v16 + 7);
  *((_QWORD *)v16 + 7) = v17;

  if (IOServiceOpen(a5, *MEMORY[0x1E0C83DA0], 0, (io_connect_t *)v16 + 6))
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    *(_DWORD *)buf = 136315138;
    v46 = "-[IOPortLDCMManagerV4 initWithParams:withDryPollingInterval:withService:withNotificationPort:withServerRunloop:]";
    v35 = MEMORY[0x1E0C81028];
    v36 = "%s Failed to open LDCM kernel service\n";
    goto LABEL_67;
  }
  if (IOServiceAddInterestNotification(a6, a5, "IOGeneralInterest", (IOServiceInterestCallback)IOPortLDCMFeatureInterestCallback, v16, (io_object_t *)v16 + 5))
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    *(_DWORD *)buf = 136315138;
    v46 = "-[IOPortLDCMManagerV4 initWithParams:withDryPollingInterval:withService:withNotificationPort:withServerRunloop:]";
    v35 = MEMORY[0x1E0C81028];
    v36 = "%s Failed to set up LDCM interrupts interest notification\n";
    goto LABEL_67;
  }
  if (IORegistryEntryGetParentEntry(a5, "IOService", &parent))
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    *(_DWORD *)buf = 136315138;
    v46 = "-[IOPortLDCMManagerV4 initWithParams:withDryPollingInterval:withService:withNotificationPort:withServerRunloop:]";
    v35 = MEMORY[0x1E0C81028];
    v36 = "%s Failed to get IOPort kernel service\n";
    goto LABEL_67;
  }
  if (!parent)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    *(_DWORD *)buf = 136315138;
    v46 = "-[IOPortLDCMManagerV4 initWithParams:withDryPollingInterval:withService:withNotificationPort:withServerRunloop:]";
    v35 = MEMORY[0x1E0C81028];
    v36 = "%s Failed to get IOPort kernel service\n";
    goto LABEL_67;
  }
  if (!IOObjectConformsTo(parent, "IOPort"))
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    *(_DWORD *)buf = 136315138;
    v46 = "-[IOPortLDCMManagerV4 initWithParams:withDryPollingInterval:withService:withNotificationPort:withServerRunloop:]";
    v35 = MEMORY[0x1E0C81028];
    v36 = "%s Failed to get IOPort kernel service\n";
    goto LABEL_67;
  }
  if (IOServiceAddInterestNotification(a6, parent, "IOGeneralInterest", (IOServiceInterestCallback)IOPortLDCMPortInterestCallback, v16, (io_object_t *)v16 + 5))
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    *(_DWORD *)buf = 136315138;
    v46 = "-[IOPortLDCMManagerV4 initWithParams:withDryPollingInterval:withService:withNotificationPort:withServerRunloop:]";
    v35 = MEMORY[0x1E0C81028];
    v36 = "%s Failed to set up LDCM attach/detach interest notification\n";
    goto LABEL_67;
  }
  v19 = (const void *)MGCopyAnswer();
  if (v19)
  {
    v20 = v19;
    if (CFEqual(v19, CFSTR("Internal")))
    {
      *((_DWORD *)v16 + 7) = 0;
    }
    else
    {
      if (CFEqual(v20, CFSTR("NonUI")))
        v21 = 1;
      else
        v21 = 2;
      *((_DWORD *)v16 + 7) = v21;
    }
    CFRelease(v20);
  }
  else
  {
    *((_DWORD *)v16 + 7) = 2;
  }
  v22 = (const void *)MGCopyAnswer();
  if (v22)
  {
    v23 = v22;
    if (CFEqual(v22, CFSTR("iPhone")))
    {
      *((_DWORD *)v16 + 8) = 0;
    }
    else
    {
      if (CFEqual(v23, CFSTR("iPad")))
        v24 = 1;
      else
        v24 = 2;
      *((_DWORD *)v16 + 8) = v24;
    }
    CFRelease(v23);
  }
  else
  {
    *((_DWORD *)v16 + 8) = 2;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v25 = v16[14];
    *(_DWORD *)buf = 67109120;
    LODWORD(v46) = v25;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - Waveform extraction default setting: %d", buf, 8u);
  }
  v26 = *((_DWORD *)v16 + 7);
  if (!v16[14])
  {
    if (v26 != 2)
    {
      if (objc_msgSend(v16, "setWaveformExtractionEnabled:", 1))
      {
        v16[14] = 1;
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_36;
        *(_WORD *)buf = 0;
        v27 = MEMORY[0x1E0C81028];
        v28 = "LDCM - Failed to enable waveform extraction!";
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_36;
        *(_WORD *)buf = 0;
        v27 = MEMORY[0x1E0C81028];
        v28 = "LDCM - Successfully enabled waveform extraction.";
      }
LABEL_35:
      _os_log_impl(&dword_1D13BF000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 2u);
      goto LABEL_36;
    }
LABEL_33:
    v16[14] = 1;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_36;
    *(_WORD *)buf = 0;
    v27 = MEMORY[0x1E0C81028];
    v28 = "LDCM - Waveform extraction not enabled due to build type.";
    goto LABEL_35;
  }
  if (v26 == 2)
    goto LABEL_33;
LABEL_36:
  v29 = dispatch_queue_create("ldcmV4DispatchQueue", 0);
  v30 = (void *)*((_QWORD *)v16 + 5);
  *((_QWORD *)v16 + 5) = v29;

  v31 = *((_QWORD *)v16 + 5);
  if (!v31)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    *(_DWORD *)buf = 136315138;
    v46 = "-[IOPortLDCMManagerV4 initWithParams:withDryPollingInterval:withService:withNotificationPort:withServerRunloop:]";
    v35 = MEMORY[0x1E0C81028];
    v36 = "%s Failed to create ldcmV4DispatchQueue\n";
LABEL_67:
    v37 = 12;
LABEL_40:
    _os_log_impl(&dword_1D13BF000, v35, OS_LOG_TYPE_DEFAULT, v36, buf, v37);
    goto LABEL_41;
  }
  v32 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v31);
  v33 = (void *)*((_QWORD *)v16 + 6);
  *((_QWORD *)v16 + 6) = v32;

  v34 = *((_QWORD *)v16 + 6);
  if (v34)
  {
    dispatch_source_set_event_handler(v34, v13);
    dispatch_source_set_timer(*((dispatch_source_t *)v16 + 6), 0, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume(*((dispatch_object_t *)v16 + 6));
    objc_msgSend(v16, "setOverride:", 0);
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v35 = MEMORY[0x1E0C81028];
    v36 = "LDCM - IOPortLDCMManagerV4 successfully initialized!";
    v37 = 2;
    goto LABEL_40;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v46 = "-[IOPortLDCMManagerV4 initWithParams:withDryPollingInterval:withService:withNotificationPort:withServerRunloop:]";
    v35 = MEMORY[0x1E0C81028];
    v36 = "%s Failed to create LDCM V4 Timer\n";
    goto LABEL_67;
  }
LABEL_41:
  if (parent)
    IOObjectRelease(parent);
  v38 = v16;

  return v38;
}

- (void)dealloc
{
  io_connect_t ldcmFeatureConnect;
  io_object_t notification;
  objc_super v5;

  ldcmFeatureConnect = self->_ldcmFeatureConnect;
  if (ldcmFeatureConnect)
    IOServiceClose(ldcmFeatureConnect);
  notification = self->_notification;
  if (notification)
    IOObjectRelease(notification);
  v5.receiver = self;
  v5.super_class = (Class)IOPortLDCMManagerV4;
  -[IOPortLDCMManagerV4 dealloc](&v5, sel_dealloc);
}

- (void)handleAttachEvent
{
  NSObject *ldcmV4DispatchQueue;
  _QWORD block[5];

  ldcmV4DispatchQueue = self->_ldcmV4DispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__IOPortLDCMManagerV4_handleAttachEvent__block_invoke;
  block[3] = &unk_1E9214228;
  block[4] = self;
  dispatch_async(ldcmV4DispatchQueue, block);
}

uint64_t __40__IOPortLDCMManagerV4_handleAttachEvent__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "performLDCMMeasurement:", 0);
}

- (void)handleDetachEvent
{
  NSObject *ldcmV4DispatchQueue;
  _QWORD block[5];

  ldcmV4DispatchQueue = self->_ldcmV4DispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__IOPortLDCMManagerV4_handleDetachEvent__block_invoke;
  block[3] = &unk_1E9214228;
  block[4] = self;
  dispatch_async(ldcmV4DispatchQueue, block);
}

uint64_t __40__IOPortLDCMManagerV4_handleDetachEvent__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 1;
  objc_msgSend(*(id *)(a1 + 32), "hideUI");
  return objc_msgSend(*(id *)(a1 + 32), "performLDCMMeasurement:", 1);
}

- (void)handleLDCMInterrupt
{
  NSObject *ldcmV4DispatchQueue;
  _QWORD block[5];

  ldcmV4DispatchQueue = self->_ldcmV4DispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__IOPortLDCMManagerV4_handleLDCMInterrupt__block_invoke;
  block[3] = &unk_1E9214228;
  block[4] = self;
  dispatch_async(ldcmV4DispatchQueue, block);
}

uint64_t __42__IOPortLDCMManagerV4_handleLDCMInterrupt__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performLDCMMeasurement:", 3);
}

- (void)handleLDCMMitigationsStatusChange:(int)a3
{
  NSObject *ldcmV4DispatchQueue;
  _QWORD v4[5];
  int v5;

  ldcmV4DispatchQueue = self->_ldcmV4DispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__IOPortLDCMManagerV4_handleLDCMMitigationsStatusChange___block_invoke;
  v4[3] = &unk_1E9214250;
  v4[4] = self;
  v5 = a3;
  dispatch_async(ldcmV4DispatchQueue, v4);
}

uint64_t __57__IOPortLDCMManagerV4_handleLDCMMitigationsStatusChange___block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  const char *v3;
  uint8_t *v4;
  _DWORD *v5;
  uint64_t v6;
  __int16 v7;
  uint8_t buf[16];
  uint8_t v9[16];

  *(_DWORD *)(*(_QWORD *)(result + 32) + 36) = *(_DWORD *)(result + 40);
  v1 = result;
  switch(*(_DWORD *)(result + 40))
  {
    case 0:
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      v7 = 0;
      v2 = MEMORY[0x1E0C81028];
      v3 = "LDCM - Mitigations no longer active.";
      v4 = (uint8_t *)&v7;
      goto LABEL_10;
    case 1:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - Mitigations successful. Showing UI", v9, 2u);
      }
      result = objc_msgSend(*(id *)(v1 + 32), "showUI");
      break;
    case 2:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - WARNING: Mitigations failed!!!", buf, 2u);
      }
      v5 = *(_DWORD **)(v1 + 32);
      if (v5[8] == 1)
        objc_msgSend(v5, "showUI");
      else
        objc_msgSend(v5, "hideUI");
      result = AnalyticsSendEvent();
      break;
    case 3:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v6) = 0;
        v2 = MEMORY[0x1E0C81028];
        v3 = "LDCM - Mitigations triggered... Waiting for attach and/or mitigations success.";
        v4 = (uint8_t *)&v6;
LABEL_10:
        _os_log_impl(&dword_1D13BF000, v2, OS_LOG_TYPE_DEFAULT, v3, v4, 2u);
      }
LABEL_11:
      result = objc_msgSend(*(id *)(v1 + 32), "hideUI", v6);
      break;
    default:
      return result;
  }
  return result;
}

- (void)handleMeasurementResults:(int)a3
{
  IOPortLDCMManagerV4 *v3;

  v3 = self;
  if (a3 == 1)
  {
    self->_isWet = 1;
LABEL_8:
    -[IOPortLDCMManagerV4 setMitigations:](self, "setMitigations:", *(_QWORD *)&a3);
    return;
  }
  self->_isWet = 0;
  if (-[IOPortLDCMManagerV4 checkIsReceptacleEmpty](self, "checkIsReceptacleEmpty"))
  {
    if (v3->_overrideEnabled)
      -[IOPortLDCMManagerV4 setUserOverride:](v3, "setUserOverride:", 0);
    if (v3->_mitigationsEnabled)
    {
      self = v3;
      *(_QWORD *)&a3 = 0;
      goto LABEL_8;
    }
  }
}

- (void)storeWaveform:(char *)a3 withWaveformDataLen:(unint64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  id v23;
  char v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (a4 == 1152)
  {
    if (self->_waveformExtractionDisabled)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[IOPortLDCMManagerV4 storeWaveform:withWaveformDataLen:].cold.1();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a3, 1152);
      v35 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", CFSTR("/var/logs/ldcm/"), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self BEGINSWITH[cd] 'internalWaveformData'"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v5;
      objc_msgSend(v5, "filteredArrayUsingPredicate:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v41 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("/var/logs/ldcm/"), *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = 0;
            objc_msgSend(v14, "removeItemAtPath:error:", v13, &v39);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        }
        while (v10);
      }

      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUIDString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@%@%@.bin"), CFSTR("/var/logs/ldcm/"), CFSTR("internalWaveformData"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "createFileAtPath:contents:attributes:", v17, 0, 0);

      objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingAtPath:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
      v20 = objc_msgSend(v19, "seekToEndReturningOffset:error:", 0, &v38);
      v21 = v38;
      if (v20)
      {
        v37 = 0;
        v22 = (void *)v35;
        objc_msgSend(v19, "writeData:error:", v35, &v37);
        v23 = v37;

        v21 = v23;
      }
      else
      {
        v22 = (void *)v35;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v45 = "-[IOPortLDCMManagerV4 storeWaveform:withWaveformDataLen:]";
          v46 = 2112;
          v47 = v21;
          _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s LDCM - Error in seeking to end of file. %@\n", buf, 0x16u);
        }
      }
      v36 = 0;
      v24 = objc_msgSend(v19, "closeAndReturnError:", &v36);
      v25 = v36;

      if ((v24 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v45 = "-[IOPortLDCMManagerV4 storeWaveform:withWaveformDataLen:]";
        v46 = 2112;
        v47 = v25;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s LDCM - Error in closing file. %@\n", buf, 0x16u);
      }

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[IOPortLDCMManagerV4 storeWaveform:withWaveformDataLen:].cold.2(a4, v27, v28, v29, v30, v31, v32, v33);
  }
}

- (void)measureOccupiedWetPortDuration
{
  double v3;
  unint64_t v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_isReceptacleEmpty)
  {
    if (measureOccupiedWetPortDuration_currentlyMeasuring)
    {
      -[NSDate timeIntervalSinceNow](self->_portAttachedTime, "timeIntervalSinceNow");
      v4 = llround(-v3);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315394;
        v9 = "-[IOPortLDCMManagerV4 measureOccupiedWetPortDuration]";
        v10 = 2048;
        v11 = v4;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s LDCM - Duration of port attached: %ld\n", (uint8_t *)&v8, 0x16u);
      }
      v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("attachDuration"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_currentMitigationsStatus);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("mitigationStatus"));

      AnalyticsSendEvent();
      measureOccupiedWetPortDuration_currentlyMeasuring = 0;

    }
  }
  else if ((measureOccupiedWetPortDuration_currentlyMeasuring & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[IOPortLDCMManagerV4 measureOccupiedWetPortDuration]";
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s Starting measurement of occupied port\n", (uint8_t *)&v8, 0xCu);
    }
    self->_portAttachedTime = (NSDate *)(id)objc_msgSend(MEMORY[0x1E0C99D68], "now");
    measureOccupiedWetPortDuration_currentlyMeasuring = 1;
  }
}

- (id)extractData:(unsigned int *)a3 :(unint64_t)a4
{
  return -[LDCMMeasurementV4 initWithParams::]([LDCMMeasurementV4 alloc], "initWithParams::", a3, a4);
}

- (int)setLiquidDetected:(unsigned __int8)a3
{
  mach_port_t ldcmFeatureConnect;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  ldcmFeatureConnect = self->_ldcmFeatureConnect;
  input[0] = a3;
  return IOConnectCallMethod(ldcmFeatureConnect, 0x3E8u, input, 1u, 0, 0, 0, 0, 0, 0);
}

- (int)setMitigations:(unsigned __int8)a3
{
  int v3;
  _BOOL4 v5;
  int result;
  uint8_t v7[4];
  int v8;
  uint8_t buf[8];
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  if (a3 && self->_behaviorOverrideDisableMitigations)
  {
    v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - Skipping mitigations due to behavior override!", buf, 2u);
      return 0;
    }
  }
  else
  {
    *(_QWORD *)buf = a3;
    self->_mitigationsEnabled = a3 != 0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v7 = 67109120;
      v8 = v3;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - Setting Mitigations in Port Manager: %d!!!", v7, 8u);
    }
    return IOConnectCallMethod(self->_ldcmFeatureConnect, 0x3E9u, (const uint64_t *)buf, 1u, 0, 0, 0, 0, 0, 0);
  }
  return result;
}

- (int)setUserOverride:(unsigned __int8)a3
{
  int v3;
  _BOOL4 v5;
  int result;
  uint8_t buf[4];
  int v8;
  uint64_t input[2];

  v3 = a3;
  input[1] = *MEMORY[0x1E0C80C00];
  input[0] = a3;
  if (a3 && self->_overrideEnabled == a3)
  {
    v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - Override already enabled, no action taken", buf, 2u);
      return 0;
    }
  }
  else
  {
    if (a3)
      AnalyticsSendEvent();
    self->_overrideEnabled = v3 != 0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v8 = v3;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LDCM - Setting Override in Port Manager: %d!!!", buf, 8u);
    }
    return IOConnectCallMethod(self->_ldcmFeatureConnect, 0x3EAu, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  return result;
}

- (int)setLDCMState:(int)a3
{
  mach_port_t ldcmFeatureConnect;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  ldcmFeatureConnect = self->_ldcmFeatureConnect;
  input[0] = a3;
  return IOConnectCallMethod(ldcmFeatureConnect, 0x3EBu, input, 1u, 0, 0, 0, 0, 0, 0);
}

- (int)setLDCMMeasurementStatus:(int)a3
{
  mach_port_t ldcmFeatureConnect;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  ldcmFeatureConnect = self->_ldcmFeatureConnect;
  input[0] = a3;
  return IOConnectCallMethod(ldcmFeatureConnect, 0x3ECu, input, 1u, 0, 0, 0, 0, 0, 0);
}

- (int)setWaveformExtractionEnabled:(unsigned __int8)a3
{
  int v3;
  uint8_t buf[4];
  int v7;
  uint64_t input[2];

  v3 = a3;
  input[1] = *MEMORY[0x1E0C80C00];
  input[0] = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v7 = v3;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "LDCM - Setting waveform extraction: %d...", buf, 8u);
  }
  return IOConnectCallMethod(self->_ldcmFeatureConnect, 0x3F1u, input, 1u, 0, 0, 0, 0, 0, 0);
}

- (void)showUI
{
  int buildType;
  _BOOL4 behaviorOverrideDisableUI;
  _BOOL4 overrideEnabled;
  _DWORD v6[2];
  __int16 v7;
  _BOOL4 v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    LOWORD(v6[0]) = 0;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "LDCM - Showing UI, if applicable", (uint8_t *)v6, 2u);
  }
  if (self->_buildType == 1 || self->_behaviorOverrideDisableUI || self->_overrideEnabled)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      buildType = self->_buildType;
      behaviorOverrideDisableUI = self->_behaviorOverrideDisableUI;
      overrideEnabled = self->_overrideEnabled;
      v6[0] = 67109632;
      v6[1] = buildType;
      v7 = 1024;
      v8 = behaviorOverrideDisableUI;
      v9 = 1024;
      v10 = overrideEnabled;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "LDCM - Not showing UI (buildtype: %d override: %d userOverride: %d)", (uint8_t *)v6, 0x14u);
    }
  }
  else
  {
    if (self->_uiActive)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        LOWORD(v6[0]) = 0;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "LDCM - UI already active, not showing UI", (uint8_t *)v6, 2u);
      }
    }
    else
    {
      AnalyticsSendEvent();
      -[LDCMNotificationUIManagerV4 showUI::](self->_notificationUIManager, "showUI::", 1, self->_buildType == 0);
    }
    self->_uiActive = 1;
  }
}

- (void)hideUI
{
  uint8_t v3[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "LDCM - Hiding UI, if applicable", v3, 2u);
  }
  if (self->_uiActive)
    IOAccessoryNotifyWetCancel();
  self->_uiActive = 0;
}

uint64_t __42__IOPortLDCMManagerV4_generateLDCMCSVData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v22;
  id v23;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), *(_QWORD *)(a1 + 32), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v7, "attributesOfItemAtPath:error:", v8, &v23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v23;

  if (v10)
  {
    objc_msgSend(v10, "localizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Error fetching fileA attributes. File ordering could be out of order. Error:%@ File:%@"), v11, v5);

  }
  v12 = *MEMORY[0x1E0CB2A38];
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CB2A38]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), *(_QWORD *)(a1 + 32), v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v14, "attributesOfItemAtPath:error:", v15, &v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v22;

  if (v17)
  {
    objc_msgSend(v17, "localizedDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Error fetching fileB attributes. File ordering could be out of order. Error:%@ File:%@"), v18, v6);

  }
  objc_msgSend(v16, "objectForKey:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v13, "compare:", v19);

  return v20;
}

- (void)processBehaviorDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  _BOOL4 behaviorOverrideDisableMitigations;
  _BOOL4 behaviorOverrideDisableUI;
  int v18;
  const char *v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DisableMitigations"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DisableMitigations"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DisableMitigations"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        self->_behaviorOverrideDisableMitigations = objc_msgSend(v10, "BOOLValue");

        objc_msgSend(v5, "setBool:forKey:", self->_behaviorOverrideDisableMitigations, CFSTR("LDCMV4DisableMitigations"));
      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DisableUI"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DisableUI"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v14 = objc_opt_isKindOfClass();

      if ((v14 & 1) != 0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DisableUI"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        self->_behaviorOverrideDisableUI = objc_msgSend(v15, "BOOLValue");

        objc_msgSend(v5, "setBool:forKey:", self->_behaviorOverrideDisableUI, CFSTR("LDCMV4DisableUI"));
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      behaviorOverrideDisableMitigations = self->_behaviorOverrideDisableMitigations;
      behaviorOverrideDisableUI = self->_behaviorOverrideDisableUI;
      v18 = 136315650;
      v19 = "-[IOPortLDCMManagerV4 processBehaviorDictionary:]";
      v20 = 1024;
      v21 = behaviorOverrideDisableMitigations;
      v22 = 1024;
      v23 = behaviorOverrideDisableUI;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s behavior overrides - mitigations: %d ui: %d", (uint8_t *)&v18, 0x18u);
    }

  }
}

- (OS_dispatch_queue)ldcmV4DispatchQueue
{
  return self->_ldcmV4DispatchQueue;
}

- (void)setLdcmV4DispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_ldcmV4DispatchQueue, a3);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (LDCMNotificationUIManagerV4)notificationUIManager
{
  return self->_notificationUIManager;
}

- (void)setNotificationUIManager:(id)a3
{
  objc_storeStrong((id *)&self->_notificationUIManager, a3);
}

- (unsigned)notification
{
  return self->_notification;
}

- (void)setNotification:(unsigned int)a3
{
  self->_notification = a3;
}

- (unsigned)ldcmFeatureConnect
{
  return self->_ldcmFeatureConnect;
}

- (void)setLdcmFeatureConnect:(unsigned int)a3
{
  self->_ldcmFeatureConnect = a3;
}

- (unint64_t)wetPollingInterval
{
  return self->_wetPollingInterval;
}

- (void)setWetPollingInterval:(unint64_t)a3
{
  self->_wetPollingInterval = a3;
}

- (unint64_t)dryPollingInterval
{
  return self->_dryPollingInterval;
}

- (void)setDryPollingInterval:(unint64_t)a3
{
  self->_dryPollingInterval = a3;
}

- (unsigned)isWet
{
  return self->_isWet;
}

- (void)setIsWet:(unsigned __int8)a3
{
  self->_isWet = a3;
}

- (int)buildType
{
  return self->_buildType;
}

- (void)setBuildType:(int)a3
{
  self->_buildType = a3;
}

- (int)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(int)a3
{
  self->_deviceClass = a3;
}

- (void)setPreviousLDCMPortStatus:(unsigned __int8)a3
{
  self->_previousLDCMPortStatus = a3;
}

- (BOOL)isReceptacleEmpty
{
  return self->_isReceptacleEmpty;
}

- (void)setIsReceptacleEmpty:(BOOL)a3
{
  self->_isReceptacleEmpty = a3;
}

- (BOOL)mitigationsEnabled
{
  return self->_mitigationsEnabled;
}

- (void)setMitigationsEnabled:(BOOL)a3
{
  self->_mitigationsEnabled = a3;
}

- (BOOL)overrideEnabled
{
  return self->_overrideEnabled;
}

- (void)setOverrideEnabled:(BOOL)a3
{
  self->_overrideEnabled = a3;
}

- (void)setMeasurementInfoOutputString:(id)a3
{
  self->_measurementInfoOutputString = (NSString *)a3;
}

- (BOOL)uiActive
{
  return self->_uiActive;
}

- (void)setUiActive:(BOOL)a3
{
  self->_uiActive = a3;
}

- (BOOL)waveformExtractionDisabled
{
  return self->_waveformExtractionDisabled;
}

- (void)setWaveformExtractionDisabled:(BOOL)a3
{
  self->_waveformExtractionDisabled = a3;
}

- (BOOL)behaviorOverrideDisableMitigations
{
  return self->_behaviorOverrideDisableMitigations;
}

- (void)setBehaviorOverrideDisableMitigations:(BOOL)a3
{
  self->_behaviorOverrideDisableMitigations = a3;
}

- (BOOL)behaviorOverrideDisableUI
{
  return self->_behaviorOverrideDisableUI;
}

- (void)setBehaviorOverrideDisableUI:(BOOL)a3
{
  self->_behaviorOverrideDisableUI = a3;
}

- (int)currentMitigationsStatus
{
  return self->_currentMitigationsStatus;
}

- (void)setCurrentMitigationsStatus:(int)a3
{
  self->_currentMitigationsStatus = a3;
}

- (NSDate)portAttachedTime
{
  return self->_portAttachedTime;
}

- (void)setPortAttachedTime:(id)a3
{
  self->_portAttachedTime = (NSDate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationUIManager, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_ldcmV4DispatchQueue, 0);
}

- (void)performLDCMMeasurement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D13BF000, MEMORY[0x1E0C81028], a3, "LDCM - Data size mismatch!!! Size returned: %zu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)performLDCMMeasurement:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1D13BF000, MEMORY[0x1E0C81028], a3, "LDCM - Failed to copy data!!! Error: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)performLDCMMeasurement:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D13BF000, MEMORY[0x1E0C81028], a3, "LDCM - WARNING: Waveform data size mismatch! Size returned: %zu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)performLDCMMeasurement:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1D13BF000, MEMORY[0x1E0C81028], a3, "LDCM - WARNING: Failed to copy waveform! Error: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)storeWaveform:withWaveformDataLen:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "LDCM - Skipping waveform storage due to waveform extraction default setting.", v0, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)storeWaveform:(uint64_t)a3 withWaveformDataLen:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D13BF000, MEMORY[0x1E0C81028], a3, "LDCM - Skipping waveform storage due to data size mismatch!!! Size returned: %zu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

@end
