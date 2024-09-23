@implementation CPMSStateReader

+ (id)log
{
  if (log_onceToken_0 != -1)
    dispatch_once(&log_onceToken_0, &__block_literal_global_0);
  return (id)log_log_0;
}

void __22__CPMSStateReader_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.cpms.control", "framework");
  v1 = (void *)log_log_0;
  log_log_0 = (uint64_t)v0;

}

+ (id)copyCPMSPmaxState:(int *)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  NSObject *v64;
  uint64_t v65;
  id v66;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
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
  uint64_t v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *context;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
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
  mach_port_t connection[2];
  size_t v147;
  __int128 outputStruct;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  uint64_t v164;

  v164 = 0;
  v163 = 0u;
  v162 = 0u;
  v161 = 0u;
  v160 = 0u;
  v159 = 0u;
  v158 = 0u;
  v157 = 0u;
  v156 = 0u;
  v155 = 0u;
  v154 = 0u;
  v153 = 0u;
  v152 = 0u;
  v151 = 0u;
  v150 = 0u;
  v149 = 0u;
  outputStruct = 0u;
  v147 = 264;
  *(_QWORD *)connection = 0;
  context = (void *)MEMORY[0x1D824E9A0](a1, a2);
  if ((openIOConnectObjectForApplePPM(&connection[1], connection) & 1) == 0)
  {
    +[CPMSStateReader log](CPMSStateReader, "log");
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      +[CPMSStateReader copyCPMSPmaxState:].cold.2();
    v88 = 0;
    v87 = 0;
    v86 = 0;
    goto LABEL_4;
  }
  v3 = IOConnectCallMethod(connection[0], 0x22u, 0, 0, 0, 0, 0, 0, &outputStruct, &v147);
  if (!(_DWORD)v3)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(unint64_t)outputStruct / 1000000000.0);
    v5 = objc_claimAutoreleasedReturnValue();
    v85 = objc_alloc(MEMORY[0x1E0C99D80]);
    v88 = v4;
    v87 = (void *)v5;
    objc_msgSend(v4, "stringFromDate:", v5);
    v84 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)outputStruct);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BYTE12(outputStruct));
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BYTE13(outputStruct));
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v164);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", DWORD2(outputStruct));
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = v149;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = DWORD1(v149);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = DWORD2(v149);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = HIDWORD(v149);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = v150;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = DWORD1(v150);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = DWORD2(v150);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = HIDWORD(v150);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = v151;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = DWORD1(v151);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = DWORD2(v151);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = HIDWORD(v151);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = v152;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = DWORD1(v152);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v20) = DWORD2(v152);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v21) = HIDWORD(v152);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = v153;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v23) = DWORD1(v153);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v24) = DWORD2(v153);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = HIDWORD(v153);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = v154;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v27) = DWORD1(v154);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v28) = DWORD2(v154);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v29) = HIDWORD(v154);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v29);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v30) = v155;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v30);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v31) = DWORD1(v155);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v31);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v32) = DWORD2(v155);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v33) = HIDWORD(v155);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v33);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v156);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BYTE1(v156));
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BYTE2(v156));
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v34) = DWORD2(v156);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v35) = HIDWORD(v156);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v157);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BYTE8(v157));
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v36) = v158;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v36);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v37) = DWORD1(v158);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v38) = DWORD2(v158);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v38);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v39) = HIDWORD(v158);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v39);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v40) = v159;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v40);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v41) = DWORD1(v159);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v41);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v42) = DWORD2(v159);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v42);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v43) = HIDWORD(v159);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v43);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v44) = v160;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v44);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v45) = DWORD2(v161);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v45);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v46) = DWORD1(v160);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v46);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v47) = DWORD2(v163);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v47);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v48) = HIDWORD(v163);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v48);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v49) = DWORD2(v160);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v49);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v50) = HIDWORD(v160);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v50);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v51) = DWORD1(v161);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v51);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v52) = v161;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v52);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v53) = HIDWORD(v161);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v53);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v54) = v162;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v54);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v55) = DWORD1(v162);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v57) = DWORD2(v162);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v57);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v58) = HIDWORD(v162);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v60) = v163;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v60);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v61) = DWORD1(v163);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BYTE11(v157));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BYTE13(v157));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BYTE10(v157));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BYTE12(v157));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BYTE9(v157));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v84;
    v86 = (void *)objc_msgSend(v85, "initWithObjectsAndKeys:", v84, CFSTR("Datetime"), v134, CFSTR("Timestamp"), v145, CFSTR("EnableAgingModel"), v133, CFSTR("UseFreshCallParams"), v144, CFSTR("UsingSpecificRCParams"), v126, CFSTR("ChemId"), v143, CFSTR("MeasuredPb (mW)"), v124, CFSTR("MeasuredPp (mW)"), v142,
                    CFSTR("MeasuredPs (mW)"),
                    v141,
                    CFSTR("MeasuredPu (mW)"),
                    v140,
                    CFSTR("ShortHorizonPb (mW)"),
                    v139,
                    CFSTR("ShortHorizonPp (mW)"),
                    v83,
                    CFSTR("ShortHorizonPs (mW)"),
                    v138,
                    CFSTR("ShortHorizonPu (mW)"),
                    v137,
                    CFSTR("PuSouth (mW)"),
                    v136,
                    CFSTR("PsCutoffVoltage (mV)"),
                    v135,
                    CFSTR("PuCutoffVoltage (mV)"),
                    v132,
                    CFSTR("systemLoadFilteredCurrentRc3 (mA)"),
                    v131,
                    CFSTR("systemLoadFilteredCurrentRc4 (mA)"),
                    v130,
                    CFSTR("systemLoadRssFiltered (mΩ)"),
                    v129,
                    CFSTR("WeightFactorModelPs"),
                    v82,
                    CFSTR("WeightFactorModelPp"),
                    v128,
                    CFSTR("systemLoadPmaxVoltage (mV)"),
                    v127,
                    CFSTR("systemLoadPmaxCurrent (mA)"),
                    v125,
                    CFSTR("AlgoTemperature (°C)"),
                    v123,
                    CFSTR("Rss (mΩ)"),
                    v122,
                    CFSTR("WRa (mΩ)"),
                    v121,
                    CFSTR("Iss (mA)"),
                    v120,
                    CFSTR("InstantAmperage (mA)"),
                    v81,
                    CFSTR("Amperage (mA)"),
                    v119);

LABEL_4:
    LODWORD(v65) = 0;
    goto LABEL_5;
  }
  v65 = v3;
  +[CPMSStateReader log](CPMSStateReader, "log");
  v64 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    +[CPMSStateReader copyCPMSPmaxState:].cold.1(v65, v64, v68, v69, v70, v71, v72, v73);
  v88 = 0;
  v87 = 0;
  v86 = 0;
LABEL_5:

  closeIOConnectObjectForApplePPM((unint64_t)&connection[1], connection);
  if (a3 && (_DWORD)v65)
    *a3 = v65;
  objc_autoreleasePoolPop(context);
  v66 = v86;

  return v66;
}

+ (id)copyCPMSControlStateSnapshots
{
  void *v3;
  size_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  NSObject *v11;
  mach_port_t connection[2];
  size_t outputStructCnt;
  _BYTE outputStruct[7104];

  bzero(outputStruct, 0x1BC0uLL);
  *(_QWORD *)connection = 0;
  outputStructCnt = 7104;
  v3 = (void *)MEMORY[0x1D824E9A0]();
  if ((openIOConnectObjectForApplePPM(&connection[1], connection) & 1) == 0)
  {
    +[CPMSStateReader log](CPMSStateReader, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[CPMSStateReader copyCPMSPmaxState:].cold.2();
    goto LABEL_14;
  }
  if (IOConnectCallStructMethod(connection[0], 0x1Eu, 0, 0, outputStruct, &outputStructCnt))
  {
    +[CPMSStateReader log](CPMSStateReader, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[CPMSStateReader copyCPMSControlStateSnapshots].cold.1();
LABEL_14:

    v9 = 0;
    v5 = 0;
    goto LABEL_9;
  }
  v4 = outputStructCnt / 0x378;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (int)(outputStructCnt / 0x378));
  if ((int)v4 >= 1)
  {
    v6 = v4;
    v7 = outputStruct;
    do
    {
      if (*v7)
      {
        objc_msgSend(a1, "getCPMSControlStateSnapshotDictionary:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v8);

      }
      v7 += 111;
      --v6;
    }
    while (v6);
  }
  v9 = (void *)objc_msgSend(v5, "copy");
LABEL_9:
  closeIOConnectObjectForApplePPM((unint64_t)&connection[1], connection);
  objc_autoreleasePoolPop(v3);

  return v9;
}

+ (id)getCPMSControlStateSnapshotDictionary:(CPMSPPMControlStateSnapshot *)a3
{
  void *v5;
  double v6;
  uint64_t i;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t j;
  void *v14;
  void *v15;
  uint64_t k;
  void *v17;
  void *v18;
  uint64_t m;
  void *v20;
  void *v21;
  uint64_t n;
  void *v23;
  void *v24;
  uint64_t ii;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
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
  _QWORD v65[28];
  _QWORD v66[30];

  v66[28] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 7);
  for (i = 8; i != 36; i += 4)
  {
    LODWORD(v6) = *(_DWORD *)((char *)&a3->var0 + i);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

  }
  v64 = v5;
  v9 = 6;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 6);
  do
  {
    objc_msgSend(v10, "addObject:", &unk_1E9529820);
    --v9;
  }
  while (v9);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 8);
  for (j = 840; j != 872; j += 4)
  {
    LODWORD(v12) = *(_DWORD *)((char *)&a3->var0 + j);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v14);

  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 8);
  for (k = 740; k != 772; k += 4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)((char *)&a3->var0 + k));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v17);

  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  for (m = 776; m != 788; m += 4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)((char *)&a3->var0 + m));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v20);

  }
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 20);
  for (n = 60; n != 400; n += 17)
  {
    objc_msgSend(a1, "getPowerBudgetDictionary:", (char *)a3 + n);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      objc_msgSend(v21, "addObject:", v23);

  }
  v63 = v21;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 20);
  for (ii = 400; ii != 740; ii += 17)
  {
    objc_msgSend(a1, "getPowerBudgetDictionary:", (char *)a3 + ii);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      objc_msgSend(v24, "addObject:", v26);

  }
  v65[0] = CFSTR("timestamp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3->var0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v62;
  v65[1] = CFSTR("reason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3->var9[6].var2[0].var0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v61;
  v65[2] = CFSTR("overrideFlags");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3->var9[6].var2[0].var1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v66[2] = v60;
  v65[3] = CFSTR("mode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)&a3->var9[6].var0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v66[3] = v59;
  v65[4] = CFSTR("AllowPolicyRun");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->var9[6].var2[1].var0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v66[4] = v58;
  v65[5] = CFSTR("SystemLoadFraction");
  LODWORD(v27) = a3->var9[6].var2[1].var1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v66[5] = v57;
  v65[6] = CFSTR("droopCE");
  *(float *)&v28 = a3->var4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v66[6] = v56;
  v65[7] = CFSTR("droopIS");
  *(float *)&v29 = a3->var5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v29);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v66[7] = v55;
  v65[8] = CFSTR("undroopCE");
  *(float *)&v30 = a3->var6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v30);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v66[8] = v54;
  v65[9] = CFSTR("undroopIS");
  *(float *)&v31 = a3->var7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v31);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v66[9] = v53;
  v65[10] = CFSTR("zeroSumCE");
  *(float *)&v32 = a3->var3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v66[10] = v52;
  v65[11] = CFSTR("servoCEs");
  v51 = (void *)objc_msgSend(v64, "copy");
  v66[11] = v51;
  v65[12] = CFSTR("remCapCEFloors");
  v50 = (void *)objc_msgSend(v10, "copy");
  v66[12] = v50;
  v65[13] = CFSTR("laneCEs");
  v49 = (void *)objc_msgSend(v11, "copy");
  v66[13] = v49;
  v65[14] = CFSTR("peakPowerPressureLevel");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3->var2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v66[14] = v48;
  v65[15] = CFSTR("batteryPowerConsumption");
  v47 = (void *)objc_msgSend(v15, "copy");
  v66[15] = v47;
  v65[16] = CFSTR("systemCapability");
  v46 = (void *)objc_msgSend(v18, "copy");
  v66[16] = v46;
  v65[17] = CFSTR("systemCapabilitySource");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3->var9[5].var2[1].var0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v66[17] = v45;
  v65[18] = CFSTR("requestedBudgets");
  v44 = (void *)objc_msgSend(v63, "copy");
  v66[18] = v44;
  v65[19] = CFSTR("grantedBudgets");
  v43 = (void *)objc_msgSend(v24, "copy");
  v66[19] = v43;
  v65[20] = CFSTR("lastEngagedCriticalDroopTimeStamp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)&a3->var9[7].var2[0].var1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v66[20] = v42;
  v65[21] = CFSTR("lastDisengagedCriticalDroopTimeStamp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)&a3->var9[7].var2[1].var1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v66[21] = v41;
  v65[22] = CFSTR("lastEngagedPolicyTimeStamp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)&a3->var9[6].var2[2]);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v66[22] = v40;
  v65[23] = CFSTR("lastDisengagedPolicyTimeStamp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)&a3->var9[7].var0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v66[23] = v39;
  v65[24] = CFSTR("remainingCapacity");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)&a3->var9[9].var0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v66[24] = v33;
  v65[25] = CFSTR("brownoutRiskSysCap");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)&a3->var9[9].var2[0].var0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v66[25] = v34;
  v65[26] = CFSTR("brownoutRiskPu");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->var9[9].var2[0].var1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v66[26] = v35;
  v65[27] = CFSTR("brownoutRiskNotificationEngaged");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->var9[9].var2[1].var0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v66[27] = v36;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 28);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

+ (id)getPowerBudgetDictionary:(CPMSPPMPowerBudget *)a3
{
  CPMSPPMPowerBudget *v3;
  uint64_t var1;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[2];
  _QWORD v20[3];

  v3 = a3;
  v20[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return v3;
  var1 = a3->var1;
  if (!a3->var1)
  {
    v3 = 0;
    return v3;
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", var1);
  v6 = 0;
  v7 = 5 * var1;
  do
  {
    v19[0] = CFSTR("timescale");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", *((char *)&v3->var1 + v6 + 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = CFSTR("level");
    v20[0] = v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(&v3->var1 + v6 + 2));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);

    v6 += 5;
  }
  while (v7 != v6);
  v11 = (&clientNames)[v3->var0];
  v17[0] = CFSTR("clientID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v17[1] = CFSTR("clientName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v13;
  v17[2] = CFSTR("timescales");
  v14 = (void *)objc_msgSend(v5, "copy");
  v18[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)timescaleDisplayName:(char)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a3 <= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (&timescaleNames)[a3], v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (void)copyCPMSPmaxState:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1D33CB000, a2, a3, "<Error> GetBatteryPmaxState call failed with error %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

+ (void)copyCPMSPmaxState:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1D33CB000, v0, v1, "<Error> Failed to open connection to ApplePPM", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)copyCPMSControlStateSnapshots
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1D33CB000, v0, v1, "<Error> failed to get control state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
