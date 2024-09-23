@implementation ATXSlotResolution

- (ATXSlotResolution)initWithDataStore:(id)a3
{
  id v6;
  ATXSlotResolution *v7;
  ATXSlotResolution *v8;
  void *v9;
  uint64_t v10;
  _ATXScoreInterpreter *slotResolutionInterpreter;
  void *v13;
  objc_super v14;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXSlotResolution.mm"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataStore"));

  }
  v14.receiver = self;
  v14.super_class = (Class)ATXSlotResolution;
  v7 = -[ATXSlotResolution init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_dataStore, a3);
    +[ATXScoreInterpreterCache sharedInstance](ATXScoreInterpreterCache, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scoreInterpreterForConsumerSubType:", 25);
    v10 = objc_claimAutoreleasedReturnValue();
    slotResolutionInterpreter = v8->_slotResolutionInterpreter;
    v8->_slotResolutionInterpreter = (_ATXScoreInterpreter *)v10;

  }
  return v8;
}

- (ATXSlotResolution)init
{
  void *v3;
  ATXSlotResolution *v4;

  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXSlotResolution initWithDataStore:](self, "initWithDataStore:", v3);

  return v4;
}

+ (id)yearMonthDayComponentsForDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", 28, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (double)exponentialDecay:(double)a3 withHalflife:(double)a4
{
  void *v9;

  if (a4 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXSlotResolution.mm"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("halflife > 0"));

  }
  return exp(-0.693147181 / a4 * a3);
}

+ (BOOL)matchForCurrentGeohash:(int64_t)a3 rowGeohash:(int64_t)a4
{
  return a3 == -1 || a3 == a4;
}

+ (BOOL)shouldCountRowForGeohashOccurrencesCalculationForCurrentGeohash:(int64_t)a3 rowGeohash:(int64_t)a4
{
  return a3 == -1 || a4 != -1;
}

+ (BOOL)shouldCountRowForGeohashIndividualContextStatistics:(int64_t)a3 rowGeohash:(int64_t)a4
{
  return a3 != -1 && a4 != -1;
}

- (id)fastStatisticsOnSlotsForBundleId:(id)a3 actionType:(id)a4 currentDate:(id)a5 previousLocationUUID:(id)a6 currentLocationUUID:(id)a7 currentMotionType:(int64_t)a8 currentGeohash:(int64_t)a9 currentCoarseGeohash:(int64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  ATXSlotResolutionStatistics *v25;
  void *v26;
  uint64_t v27;
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
  void *v40;
  void *v41;
  _ATXDataStore *dataStore;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  id v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  ATXSlotResolution *v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  _QWORD *v73;
  _QWORD *v74;
  _QWORD *v75;
  _QWORD *v76;
  _QWORD *v77;
  _QWORD *v78;
  _QWORD *v79;
  _QWORD *v80;
  _QWORD *v81;
  _QWORD *v82;
  _QWORD *v83;
  _QWORD *v84;
  _QWORD *v85;
  _QWORD *v86;
  _QWORD *v87;
  _QWORD *v88;
  _QWORD *v89;
  _QWORD *v90;
  _QWORD *v91;
  _QWORD *v92;
  _QWORD *v93;
  _QWORD *v94;
  _QWORD *v95;
  _QWORD *v96;
  _QWORD *v97;
  _QWORD *v98;
  _QWORD *v99;
  _QWORD *v100;
  _QWORD *v101;
  _QWORD *v102;
  _QWORD *v103;
  _QWORD *v104;
  _QWORD *v105;
  _QWORD *v106;
  _QWORD *v107;
  _QWORD *v108;
  _QWORD *v109;
  _QWORD *v110;
  _QWORD *v111;
  _QWORD *v112;
  _QWORD *v113;
  _QWORD *v114;
  _QWORD *v115;
  _QWORD *v116;
  _QWORD *v117;
  _QWORD *v118;
  _QWORD *v119;
  _QWORD *v120;
  _QWORD *v121;
  _QWORD *v122;
  _QWORD *v123;
  _QWORD *v124;
  _QWORD *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  int64_t v129;
  int64_t v130;
  int64_t v131;
  _QWORD v132[5];
  id v133;
  _QWORD v134[3];
  double v135;
  _QWORD v136[3];
  double v137;
  _QWORD v138[3];
  double v139;
  _QWORD v140[3];
  double v141;
  _QWORD v142[3];
  double v143;
  _QWORD v144[3];
  double v145;
  _QWORD v146[3];
  double v147;
  _QWORD v148[3];
  double v149;
  _QWORD v150[3];
  double v151;
  _QWORD v152[3];
  double v153;
  _QWORD v154[3];
  double v155;
  _QWORD v156[3];
  double v157;
  _QWORD v158[4];
  _QWORD v159[4];
  _QWORD v160[4];
  _QWORD v161[4];
  _QWORD v162[4];
  _QWORD v163[4];
  _QWORD v164[4];
  _QWORD v165[4];
  _QWORD v166[4];
  _QWORD v167[4];
  _QWORD v168[4];
  _QWORD v169[4];
  _QWORD v170[4];
  _QWORD v171[3];
  int v172;
  _QWORD v173[3];
  int v174;
  _QWORD v175[3];
  int v176;
  _QWORD v177[4];
  _QWORD v178[4];
  _QWORD v179[3];
  int v180;
  _QWORD v181[4];
  _QWORD v182[3];
  int v183;
  _QWORD v184[3];
  int v185;
  _QWORD v186[4];
  _QWORD v187[3];
  int v188;
  _QWORD v189[4];
  _QWORD v190[4];
  _QWORD v191[3];
  int v192;
  _QWORD v193[3];
  int v194;
  _QWORD v195[3];
  int v196;
  _QWORD v197[4];
  _QWORD v198[4];
  _QWORD v199[3];
  int v200;
  _QWORD v201[3];
  int v202;
  _QWORD v203[4];
  _QWORD v204[4];
  _QWORD v205[4];
  _QWORD v206[4];
  _QWORD v207[4];
  _QWORD v208[4];
  _QWORD v209[5];

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v58 = a7;
  v59 = v19;
  v61 = v17;
  v62 = v16;
  v60 = v18;
  +[_ATXActionUtils timeOfDayAndDayOfWeekForDate:timeZone:](_ATXActionUtils, "timeOfDayAndDayOfWeekForDate:timeZone:", v18, 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "first");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "integerValue");

  objc_msgSend(v57, "second");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "integerValue");

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = objc_msgSend(v56, "isDateInWeekend:", v18);
  +[ATXSlotResolution yearMonthDayComponentsForDate:](ATXSlotResolution, "yearMonthDayComponentsForDate:", v18);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = [ATXSlotResolutionStatistics alloc];
  objc_msgSend(MEMORY[0x1E0CF8C20], "getActionKeyForBundleId:actionType:", v16, v17);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[ATXSlotResolutionStatistics initWithActionKey:](v25, "initWithActionKey:", v26);

  v209[0] = 0;
  v209[1] = v209;
  v209[2] = 0x2020000000;
  v209[3] = -1;
  v208[0] = 0;
  v208[1] = v208;
  v208[2] = 0x2020000000;
  v208[3] = 0;
  v207[0] = 0;
  v207[1] = v207;
  v207[2] = 0x2020000000;
  v207[3] = 0;
  v206[0] = 0;
  v206[1] = v206;
  v206[2] = 0x2020000000;
  v206[3] = 0;
  v205[0] = 0;
  v205[1] = v205;
  v205[2] = 0x2020000000;
  v205[3] = 0;
  v204[0] = 0;
  v204[1] = v204;
  v204[2] = 0x2020000000;
  v204[3] = 0;
  v203[0] = 0;
  v203[1] = v203;
  v203[2] = 0x2020000000;
  v203[3] = 0;
  v201[0] = 0;
  v201[1] = v201;
  v201[2] = 0x2020000000;
  v202 = 0;
  v199[0] = 0;
  v199[1] = v199;
  v199[2] = 0x2020000000;
  v200 = 0;
  v198[0] = 0;
  v198[1] = v198;
  v198[2] = 0x2020000000;
  v198[3] = 0;
  v197[0] = 0;
  v197[1] = v197;
  v197[2] = 0x2020000000;
  v197[3] = 0;
  v195[0] = 0;
  v195[1] = v195;
  v195[2] = 0x2020000000;
  v196 = 0;
  v193[0] = 0;
  v193[1] = v193;
  v193[2] = 0x2020000000;
  v194 = 0;
  v191[0] = 0;
  v191[1] = v191;
  v191[2] = 0x2020000000;
  v192 = 0;
  v190[0] = 0;
  v190[1] = v190;
  v190[2] = 0x2020000000;
  v190[3] = 0;
  v189[0] = 0;
  v189[1] = v189;
  v189[2] = 0x2020000000;
  v189[3] = 0;
  v187[0] = 0;
  v187[1] = v187;
  v187[2] = 0x2020000000;
  v188 = 0;
  v186[0] = 0;
  v186[1] = v186;
  v186[2] = 0x2020000000;
  v186[3] = 0;
  v184[0] = 0;
  v184[1] = v184;
  v184[2] = 0x2020000000;
  v185 = 0;
  v182[0] = 0;
  v182[1] = v182;
  v182[2] = 0x2020000000;
  v183 = 0;
  v181[0] = 0;
  v181[1] = v181;
  v181[2] = 0x2020000000;
  v181[3] = 0;
  v179[0] = 0;
  v179[1] = v179;
  v179[2] = 0x2020000000;
  v180 = 0;
  v178[0] = 0;
  v178[1] = v178;
  v178[2] = 0x2020000000;
  v178[3] = 0;
  v177[0] = 0;
  v177[1] = v177;
  v177[2] = 0x2020000000;
  v177[3] = 0;
  v175[0] = 0;
  v175[1] = v175;
  v175[2] = 0x2020000000;
  v176 = 0;
  v173[0] = 0;
  v173[1] = v173;
  v173[2] = 0x2020000000;
  v174 = 0;
  v171[0] = 0;
  v171[1] = v171;
  v171[2] = 0x2020000000;
  v172 = 0;
  v170[0] = 0;
  v170[1] = v170;
  v170[2] = 0x2020000000;
  v170[3] = 0;
  v169[0] = 0;
  v169[1] = v169;
  v169[2] = 0x2020000000;
  v169[3] = 0;
  v168[0] = 0;
  v168[1] = v168;
  v168[2] = 0x2020000000;
  v168[3] = 0;
  v167[0] = 0;
  v167[1] = v167;
  v167[2] = 0x2020000000;
  v167[3] = 0;
  v166[0] = 0;
  v166[1] = v166;
  v166[2] = 0x2020000000;
  v166[3] = 0;
  v165[0] = 0;
  v165[1] = v165;
  v165[2] = 0x2020000000;
  v165[3] = 0;
  v164[0] = 0;
  v164[1] = v164;
  v164[2] = 0x2020000000;
  v164[3] = 0;
  v163[0] = 0;
  v163[1] = v163;
  v163[2] = 0x2020000000;
  v163[3] = 0;
  v162[0] = 0;
  v162[1] = v162;
  v162[2] = 0x2020000000;
  v162[3] = 0;
  v161[0] = 0;
  v161[1] = v161;
  v161[2] = 0x2020000000;
  v161[3] = 0;
  v160[0] = 0;
  v160[1] = v160;
  v160[2] = 0x2020000000;
  v160[3] = 0;
  v159[0] = 0;
  v159[1] = v159;
  v159[2] = 0x2020000000;
  v159[3] = 0;
  v158[0] = 0;
  v158[1] = v158;
  v158[2] = 0x2020000000;
  v158[3] = 0;
  v156[0] = 0;
  v156[1] = v156;
  v156[2] = 0x2020000000;
  v157 = 0.0;
  v54 = (void *)v27;
  objc_msgSend(v24, "slotResolutionLaunchDecayHalflife");
  v157 = v28 * 86400.0;
  v154[0] = 0;
  v154[1] = v154;
  v154[2] = 0x2020000000;
  v155 = 0.0;
  objc_msgSend(v24, "slotResolutionTimeOfDayLaunchDecayHalflife");
  v155 = v29 * 86400.0;
  v152[0] = 0;
  v152[1] = v152;
  v152[2] = 0x2020000000;
  v153 = 0.0;
  objc_msgSend(v24, "slotResolutionDayOfWeekLaunchDecayHalflife");
  v153 = v30 * 86400.0;
  v150[0] = 0;
  v150[1] = v150;
  v150[2] = 0x2020000000;
  v151 = 0.0;
  objc_msgSend(v24, "slotResolutionLocationLaunchDecayHalflife");
  v151 = v31 * 86400.0;
  v148[0] = 0;
  v148[1] = v148;
  v148[2] = 0x2020000000;
  v149 = 0.0;
  objc_msgSend(v24, "actionSpecificGeoHashDecayHalflife");
  v149 = v32 * 86400.0;
  v146[0] = 0;
  v146[1] = v146;
  v146[2] = 0x2020000000;
  v147 = 0.0;
  objc_msgSend(v24, "actionCoarseGeoHashDecayHalflife");
  v147 = v33 * 86400.0;
  v144[0] = 0;
  v144[1] = v144;
  v144[2] = 0x2020000000;
  v145 = 0.0;
  objc_msgSend(v24, "slotResolutionPreviousLocationLaunchDecayHalflife");
  v145 = v34 * 86400.0;
  v142[0] = 0;
  v142[1] = v142;
  v142[2] = 0x2020000000;
  v143 = 0.0;
  objc_msgSend(v24, "slotResolutionMotionTypeLaunchDecayHalflife");
  v143 = v35 * 86400.0;
  v140[0] = 0;
  v140[1] = v140;
  v140[2] = 0x2020000000;
  v141 = 0.0;
  objc_msgSend(v24, "appLaunchDecayHalflife");
  v141 = v36 * 86400.0;
  v138[0] = 0;
  v138[1] = v138;
  v138[2] = 0x2020000000;
  v139 = 0.0;
  objc_msgSend(v24, "slotResolutionPartOfWeekLaunchDecayHalflife");
  v139 = v37 * 86400.0;
  v136[0] = 0;
  v136[1] = v136;
  v136[2] = 0x2020000000;
  v137 = 0.0;
  objc_msgSend(v24, "appAndActionCoarseTimePowLocationDecayHalflife");
  v137 = v38 * 86400.0;
  v134[0] = 0;
  v134[1] = v134;
  v134[2] = 0x2020000000;
  v135 = 0.0;
  objc_msgSend(v24, "appAndActionSpecificTimePowLocationDecayHalflife");
  v135 = v39 * 86400.0;
  v40 = (void *)objc_opt_new();
  v132[0] = 0;
  v132[1] = v132;
  v132[2] = 0x3032000000;
  v132[3] = __Block_byref_object_copy__31;
  v132[4] = __Block_byref_object_dispose__31;
  v133 = 0;
  v41 = (void *)objc_opt_new();
  dataStore = self->_dataStore;
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __172__ATXSlotResolution_fastStatisticsOnSlotsForBundleId_actionType_currentDate_previousLocationUUID_currentLocationUUID_currentMotionType_currentGeohash_currentCoarseGeohash___block_invoke;
  v63[3] = &unk_1E82DF770;
  v73 = v209;
  v74 = v208;
  v126 = v21;
  v75 = v207;
  v76 = v206;
  v77 = v205;
  v78 = v204;
  v79 = v203;
  v80 = v201;
  v127 = v23;
  v53 = v56;
  v64 = v53;
  v81 = v171;
  v82 = v195;
  v52 = v58;
  v65 = v52;
  v83 = v199;
  v128 = v22;
  v84 = v198;
  v85 = v197;
  v129 = a8;
  v86 = v193;
  v87 = v191;
  v43 = v59;
  v88 = v190;
  v89 = v189;
  v90 = v187;
  v91 = v186;
  v92 = v184;
  v93 = v182;
  v94 = v181;
  v95 = v179;
  v66 = v43;
  v67 = self;
  v131 = a9;
  v96 = v175;
  v97 = v173;
  v98 = v178;
  v99 = v177;
  v130 = a10;
  v100 = v170;
  v44 = v60;
  v101 = v169;
  v102 = v156;
  v103 = v168;
  v104 = v154;
  v105 = v167;
  v106 = v152;
  v107 = v166;
  v108 = v150;
  v109 = v165;
  v110 = v148;
  v111 = v164;
  v112 = v146;
  v113 = v163;
  v114 = v144;
  v115 = v162;
  v116 = v142;
  v117 = v161;
  v118 = v140;
  v119 = v160;
  v120 = v138;
  v121 = v159;
  v122 = v136;
  v123 = v158;
  v124 = v134;
  v125 = v132;
  v68 = v44;
  v69 = v41;
  v45 = v40;
  v70 = v45;
  v46 = v54;
  v71 = v46;
  v47 = v55;
  v72 = v47;
  v48 = v41;
  -[_ATXDataStore enumerateSlotUuidsOfType:bundleId:block:](dataStore, "enumerateSlotUuidsOfType:bundleId:block:", v61, v62, v63);
  v49 = v72;
  v50 = v46;

  _Block_object_dispose(v132, 8);
  _Block_object_dispose(v134, 8);
  _Block_object_dispose(v136, 8);
  _Block_object_dispose(v138, 8);
  _Block_object_dispose(v140, 8);
  _Block_object_dispose(v142, 8);
  _Block_object_dispose(v144, 8);
  _Block_object_dispose(v146, 8);
  _Block_object_dispose(v148, 8);
  _Block_object_dispose(v150, 8);
  _Block_object_dispose(v152, 8);
  _Block_object_dispose(v154, 8);
  _Block_object_dispose(v156, 8);
  _Block_object_dispose(v158, 8);
  _Block_object_dispose(v159, 8);
  _Block_object_dispose(v160, 8);
  _Block_object_dispose(v161, 8);
  _Block_object_dispose(v162, 8);
  _Block_object_dispose(v163, 8);
  _Block_object_dispose(v164, 8);
  _Block_object_dispose(v165, 8);
  _Block_object_dispose(v166, 8);
  _Block_object_dispose(v167, 8);
  _Block_object_dispose(v168, 8);
  _Block_object_dispose(v169, 8);
  _Block_object_dispose(v170, 8);
  _Block_object_dispose(v171, 8);
  _Block_object_dispose(v173, 8);
  _Block_object_dispose(v175, 8);
  _Block_object_dispose(v177, 8);
  _Block_object_dispose(v178, 8);
  _Block_object_dispose(v179, 8);
  _Block_object_dispose(v181, 8);
  _Block_object_dispose(v182, 8);
  _Block_object_dispose(v184, 8);
  _Block_object_dispose(v186, 8);
  _Block_object_dispose(v187, 8);
  _Block_object_dispose(v189, 8);
  _Block_object_dispose(v190, 8);
  _Block_object_dispose(v191, 8);
  _Block_object_dispose(v193, 8);
  _Block_object_dispose(v195, 8);
  _Block_object_dispose(v197, 8);
  _Block_object_dispose(v198, 8);
  _Block_object_dispose(v199, 8);
  _Block_object_dispose(v201, 8);
  _Block_object_dispose(v203, 8);
  _Block_object_dispose(v204, 8);
  _Block_object_dispose(v205, 8);
  _Block_object_dispose(v206, 8);
  _Block_object_dispose(v207, 8);
  _Block_object_dispose(v208, 8);
  _Block_object_dispose(v209, 8);

  return v50;
}

uint64_t __172__ATXSlotResolution_fastStatisticsOnSlotsForBundleId_actionType_currentDate_previousLocationUUID_currentLocationUUID_currentMotionType_currentGeohash_currentCoarseGeohash___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8, double a9, uint64_t a10, uint64_t a11, void *a12, void *a13, uint64_t a14, void *a15, void *a16, uint64_t a17, uint64_t a18)
{
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  double v33;
  double v34;
  int v35;
  double v36;
  int v37;
  _BOOL4 v38;
  int v39;
  double v40;
  double v41;
  double v42;
  int v43;
  double v44;
  int v45;
  int v46;
  double v47;
  double v48;
  int v49;
  double v50;
  int v51;
  int v52;
  int v53;
  double v54;
  double v55;
  int v56;
  int v57;
  int v58;
  double v59;
  double v60;
  double v61;
  int v62;
  int v63;
  int v64;
  double v65;
  double v66;
  double v67;
  int v68;
  int v69;
  double v70;
  int v71;
  int v72;
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
  void *v88;
  int v89;
  int v90;
  void *v91;
  void *v92;
  double v93;
  uint64_t v94;
  double v95;
  uint64_t v96;
  double v97;
  uint64_t v98;
  double v99;
  uint64_t v100;
  double v101;
  uint64_t v102;
  double v103;
  double v104;
  uint64_t v105;
  double v106;
  uint64_t v107;
  double v108;
  uint64_t v109;
  double v110;
  uint64_t v111;
  double v112;
  uint64_t v113;
  double v114;
  double v115;
  uint64_t v116;
  double v117;
  uint64_t v118;
  double v119;
  double v120;
  uint64_t v121;
  double v122;
  uint64_t v123;
  double v124;
  uint64_t v125;
  double v126;
  uint64_t v127;
  double v128;
  uint64_t v129;
  double v130;
  uint64_t v131;
  double v132;
  uint64_t v133;
  void *v134;
  void *v135;
  ATXMinimalSlotResolutionParameters *v136;
  NSObject *v137;
  void *v138;
  void *v139;
  void *v140;
  ATXSlotResolutionParametersStatistics *v141;
  uint64_t v142;
  uint64_t v143;
  double v144;
  uint64_t v145;
  double v146;
  uint64_t v147;
  double v148;
  uint64_t v149;
  double v150;
  double v151;
  uint64_t v152;
  double v153;
  double v154;
  uint64_t v155;
  double v156;
  uint64_t v157;
  double v158;
  double v159;
  uint64_t v160;
  double v161;
  uint64_t v162;
  double v163;
  uint64_t v164;
  double v165;
  uint64_t v166;
  double v167;
  uint64_t v168;
  double v169;
  uint64_t v170;
  double v171;
  uint64_t v172;
  double v173;
  double v174;
  uint64_t v175;
  double v176;
  uint64_t v177;
  double v178;
  uint64_t v179;
  double v180;
  uint64_t v181;
  double v182;
  uint64_t v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  double v192;
  double v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  double v205;
  double v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  double v218;
  double v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  double v231;
  double v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  id v237;
  void *v238;
  void *v239;
  id v240;
  void *v241;
  char v242;
  char v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  ATXSlotResolutionSlotSetStatistics *v248;
  void *v249;
  void *v250;
  void *v251;
  double *v252;
  int v254;
  int v255;
  id v257;
  id v258;
  id v259;
  id v260;
  id v261;
  id v262;
  id v264;
  uint8_t buf[4];
  id v266;
  __int16 v267;
  uint64_t v268;
  uint64_t v269;

  v269 = *MEMORY[0x1E0C80C00];
  v262 = a2;
  v259 = a7;
  v264 = a8;
  v261 = a12;
  v260 = a13;
  v258 = a15;
  v257 = a16;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) != a3)
  {
    +[ATXSlotResolutionParametersStatistics _smoothedCountForTimeOfDay:currentTimeOfDay:](ATXSlotResolutionParametersStatistics, "_smoothedCountForTimeOfDay:currentTimeOfDay:", a10, *(_QWORD *)(a1 + 528));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = v24;
    +[ATXSlotResolutionParametersStatistics _smoothedCountForThirtyMinuteWindow:currentTimeOfDay:](ATXSlotResolutionParametersStatistics, "_smoothedCountForThirtyMinuteWindow:currentTimeOfDay:", a10, *(_QWORD *)(a1 + 528));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) = v25;
    +[ATXSlotResolutionParametersStatistics _smoothedCountForHourWindow:currentTimeOfDay:](ATXSlotResolutionParametersStatistics, "_smoothedCountForHourWindow:currentTimeOfDay:", a10, *(_QWORD *)(a1 + 528));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) = v26;
    +[ATXSlotResolutionParametersStatistics _smoothedCountForEightHourWindow:currentTimeOfDay:](ATXSlotResolutionParametersStatistics, "_smoothedCountForEightHourWindow:currentTimeOfDay:", a10, *(_QWORD *)(a1 + 528));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24) = v27;
    +[ATXSlotResolutionParametersStatistics _smoothedCountForCoarseTimeOfDay:currentTimeOfDay:](ATXSlotResolutionParametersStatistics, "_smoothedCountForCoarseTimeOfDay:currentTimeOfDay:", a10, *(_QWORD *)(a1 + 528));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24) = v28;
    +[ATXSlotResolutionParametersStatistics _smoothedBudgetForTimeOfDay:currentTimeOfDay:](ATXSlotResolutionParametersStatistics, "_smoothedBudgetForTimeOfDay:currentTimeOfDay:", a10, *(_QWORD *)(a1 + 528));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24) = v29;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 24) = *(_QWORD *)(a1 + 536) == a11;
    v30 = objc_msgSend(*(id *)(a1 + 32), "isDateInWeekend:", v264);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 24) = +[_ATXActionUtils timeBucketFromZeroToTwentyFour:](_ATXActionUtils, "timeBucketFromZeroToTwentyFour:", a10);
    if (*(_QWORD *)(a1 + 40))
      v31 = objc_msgSend(v260, "isEqual:");
    else
      v31 = 0;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 24) = v31;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 8) + 24) = *(_QWORD *)(a1 + 544) == v30;
    v32 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 8) + 24);
    v33 = 0.0;
    v34 = 0.0;
    if (v32)
    {
      v35 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 24);
      if (v35)
        v34 = (double)(v35 + v32) * 0.5;
    }
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 192) + 8) + 24) = v34;
    v36 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24);
    if (v36 != 0.0)
    {
      v37 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 8) + 24);
      if (v37)
        v33 = (v36 + (double)v37) * 0.5;
    }
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 200) + 8) + 24) = v33;
    v38 = a14 != 4 && *(_QWORD *)(a1 + 552) == a14;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 208) + 8) + 24) = v38;
    if (v261)
      v39 = objc_msgSend(v261, "isEqual:", *(_QWORD *)(a1 + 48));
    else
      v39 = 0;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + 24) = v39;
    v40 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24);
    v41 = 0.0;
    v42 = 0.0;
    if (v40 != 0.0)
    {
      v43 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 24);
      if (v43)
        v42 = (v40 + (double)v43) * 0.5;
    }
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 224) + 8) + 24) = v42;
    v44 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24);
    if (v44 != 0.0)
    {
      v45 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 24);
      if (v45)
        v41 = (v44 + (double)v45) * 0.5;
    }
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 232) + 8) + 24) = v41;
    v46 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 24);
    v47 = 0.0;
    v48 = 0.0;
    if (v46)
    {
      v49 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 24);
      if (v49)
        v48 = (double)(v49 + v46) * 0.5;
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 8) + 24) = (int)v48;
    v50 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24);
    if (v50 != 0.0)
    {
      v51 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 24);
      if (v51)
      {
        v52 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 24);
        if (v52)
          v47 = (v50 + (double)v51 + (double)v52) / 3.0;
      }
    }
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 248) + 8) + 24) = v47;
    v53 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + 24);
    v54 = 0.0;
    v55 = 0.0;
    if (v53)
    {
      v56 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 208) + 8) + 24);
      if (v56)
        v55 = (double)(v56 + v53) * 0.5;
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 256) + 8) + 24) = (int)v55;
    v57 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + 24);
    if (v57)
    {
      v58 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 24);
      if (v58)
        v54 = (double)(v58 + v57) * 0.5;
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 264) + 8) + 24) = (int)v54;
    v59 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24);
    v60 = 0.0;
    v61 = 0.0;
    if (v59 != 0.0)
    {
      v62 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + 24);
      if (v62)
        v61 = (v59 + (double)v62) * 0.5;
    }
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 272) + 8) + 24) = v61;
    v63 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 24);
    if (v63)
    {
      v64 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + 24);
      if (v64)
        v60 = (double)(v64 + v63) * 0.5;
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 280) + 8) + 24) = (int)v60;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 288) + 8) + 24) = objc_msgSend((id)objc_opt_class(), "matchForCurrentGeohash:rowGeohash:", *(_QWORD *)(a1 + 560), a18);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 296) + 8) + 24) = objc_msgSend((id)objc_opt_class(), "matchForCurrentGeohash:rowGeohash:", *(_QWORD *)(a1 + 568), a17);
    v65 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24);
    v66 = 0.0;
    v67 = 0.0;
    if (v65 != 0.0)
    {
      v68 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 8) + 24);
      if (v68)
      {
        v69 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 288) + 8) + 24);
        if (v69)
          v67 = (v65 + (double)v68 + (double)v69) / 3.0;
      }
    }
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 304) + 8) + 24) = v67;
    v70 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24);
    if (v70 != 0.0)
    {
      v71 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 24);
      if (v71)
      {
        v72 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 296) + 8) + 24);
        if (v72)
          v66 = (v70 + (double)v71 + (double)v72) / 3.0;
      }
    }
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 312) + 8) + 24) = v66;
    objc_msgSend(*(id *)(a1 + 64), "timeIntervalSinceDate:", v264);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 320) + 8) + 24) = v73;
    +[ATXSlotResolution exponentialDecay:withHalflife:](ATXSlotResolution, "exponentialDecay:withHalflife:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 320) + 8) + 24), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 336) + 8) + 24));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 328) + 8) + 24) = v74;
    +[ATXSlotResolution exponentialDecay:withHalflife:](ATXSlotResolution, "exponentialDecay:withHalflife:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 320) + 8) + 24), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 352) + 8) + 24));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24) = v75;
    +[ATXSlotResolution exponentialDecay:withHalflife:](ATXSlotResolution, "exponentialDecay:withHalflife:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 320) + 8) + 24), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 368) + 8) + 24));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 360) + 8) + 24) = v76;
    +[ATXSlotResolution exponentialDecay:withHalflife:](ATXSlotResolution, "exponentialDecay:withHalflife:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 320) + 8) + 24), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 384) + 8) + 24));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 376) + 8) + 24) = v77;
    +[ATXSlotResolution exponentialDecay:withHalflife:](ATXSlotResolution, "exponentialDecay:withHalflife:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 320) + 8) + 24), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 400) + 8) + 24));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 392) + 8) + 24) = v78;
    +[ATXSlotResolution exponentialDecay:withHalflife:](ATXSlotResolution, "exponentialDecay:withHalflife:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 320) + 8) + 24), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 416) + 8) + 24));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 408) + 8) + 24) = v79;
    +[ATXSlotResolution exponentialDecay:withHalflife:](ATXSlotResolution, "exponentialDecay:withHalflife:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 320) + 8) + 24), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 432) + 8) + 24));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 424) + 8) + 24) = v80;
    +[ATXSlotResolution exponentialDecay:withHalflife:](ATXSlotResolution, "exponentialDecay:withHalflife:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 320) + 8) + 24), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 448) + 8) + 24));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 440) + 8) + 24) = v81;
    +[ATXSlotResolution exponentialDecay:withHalflife:](ATXSlotResolution, "exponentialDecay:withHalflife:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 320) + 8) + 24), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 464) + 8) + 24));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 456) + 8) + 24) = v82;
    +[ATXSlotResolution exponentialDecay:withHalflife:](ATXSlotResolution, "exponentialDecay:withHalflife:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 320) + 8) + 24), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 480) + 8) + 24));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 472) + 8) + 24) = v83;
    +[ATXSlotResolution exponentialDecay:withHalflife:](ATXSlotResolution, "exponentialDecay:withHalflife:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 320) + 8) + 24), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 496) + 8) + 24));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 488) + 8) + 24) = v84;
    +[ATXSlotResolution exponentialDecay:withHalflife:](ATXSlotResolution, "exponentialDecay:withHalflife:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 320) + 8) + 24), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 512) + 8) + 24));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 504) + 8) + 24) = v85;
    +[ATXSlotResolution yearMonthDayComponentsForDate:](ATXSlotResolution, "yearMonthDayComponentsForDate:", v264);
    v86 = objc_claimAutoreleasedReturnValue();
    v87 = *(_QWORD *)(*(_QWORD *)(a1 + 520) + 8);
    v88 = *(void **)(v87 + 40);
    *(_QWORD *)(v87 + 40) = v86;

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = a3;
    objc_msgSend(*(id *)(a1 + 72), "removeAllObjects");
  }
  v89 = objc_msgSend((id)objc_opt_class(), "shouldCountRowForGeohashOccurrencesCalculationForCurrentGeohash:rowGeohash:", *(_QWORD *)(a1 + 560), a18);
  v90 = objc_msgSend((id)objc_opt_class(), "shouldCountRowForGeohashOccurrencesCalculationForCurrentGeohash:rowGeohash:", *(_QWORD *)(a1 + 568), a17);
  v255 = objc_msgSend((id)objc_opt_class(), "shouldCountRowForGeohashIndividualContextStatistics:rowGeohash:", *(_QWORD *)(a1 + 560), a18);
  v254 = objc_msgSend((id)objc_opt_class(), "shouldCountRowForGeohashIndividualContextStatistics:rowGeohash:", *(_QWORD *)(a1 + 568), a17);
  v91 = *(void **)(a1 + 80);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v91) = objc_msgSend(v91, "containsObject:", v92);

  if ((v91 & 1) == 0)
  {
    *(double *)(*(_QWORD *)(a1 + 88) + 48) = *(double *)(*(_QWORD *)(a1 + 88) + 48)
                                             + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24)
                                             * a9
                                             * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 56) = *(double *)(*(_QWORD *)(a1 + 88) + 56)
                                             + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24)
                                             * a9
                                             * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 64) = *(double *)(*(_QWORD *)(a1 + 88) + 64)
                                             + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24)
                                             * a9
                                             * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 72) = *(double *)(*(_QWORD *)(a1 + 88) + 72)
                                             + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24)
                                             * a9
                                             * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 80) = *(double *)(*(_QWORD *)(a1 + 88) + 80)
                                             + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24)
                                             * a9
                                             * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 88) = *(double *)(*(_QWORD *)(a1 + 88) + 88)
                                             + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 360) + 8) + 24)
                                             * a9
                                             * (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 96) = *(double *)(*(_QWORD *)(a1 + 88) + 96)
                                             + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 472) + 8) + 24)
                                             * a9
                                             * (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 8) + 24);
    v93 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 472) + 8) + 24);
    v94 = *(_QWORD *)(*(_QWORD *)(a1 + 376) + 8);
    if (v93 < *(double *)(v94 + 24))
      v93 = *(double *)(v94 + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 296) = *(double *)(*(_QWORD *)(a1 + 88) + 296)
                                              + v93 * a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 192) + 8) + 24);
    v95 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 472) + 8) + 24);
    v96 = *(_QWORD *)(*(_QWORD *)(a1 + 344) + 8);
    if (v95 < *(double *)(v96 + 24))
      v95 = *(double *)(v96 + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 304) = *(double *)(*(_QWORD *)(a1 + 88) + 304)
                                              + v95 * a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 200) + 8) + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 104) = *(double *)(*(_QWORD *)(a1 + 88) + 104)
                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 376) + 8) + 24)
                                              * a9
                                              * (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 120) = *(double *)(*(_QWORD *)(a1 + 88) + 120)
                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 424) + 8) + 24)
                                              * a9
                                              * (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 112) = *(double *)(*(_QWORD *)(a1 + 88) + 112)
                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 440) + 8) + 24)
                                              * a9
                                              * (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 208) + 8) + 24);
    v97 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24);
    v98 = *(_QWORD *)(*(_QWORD *)(a1 + 360) + 8);
    if (v97 < *(double *)(v98 + 24))
      v97 = *(double *)(v98 + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 240) = *(double *)(*(_QWORD *)(a1 + 88) + 240)
                                              + v97 * a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 224) + 8) + 24);
    v99 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24);
    v100 = *(_QWORD *)(*(_QWORD *)(a1 + 376) + 8);
    if (v99 < *(double *)(v100 + 24))
      v99 = *(double *)(v100 + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 232) = *(double *)(*(_QWORD *)(a1 + 88) + 232)
                                              + v99 * a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 232) + 8) + 24);
    v101 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 360) + 8) + 24);
    v102 = *(_QWORD *)(*(_QWORD *)(a1 + 376) + 8);
    if (v101 < *(double *)(v102 + 24))
      v101 = *(double *)(v102 + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 248) = *(double *)(*(_QWORD *)(a1 + 88) + 248)
                                              + v101
                                              * a9
                                              * (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 8) + 24);
    v103 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24);
    v104 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 360) + 8) + 24);
    v105 = *(_QWORD *)(*(_QWORD *)(a1 + 376) + 8);
    if (v104 < *(double *)(v105 + 24))
      v104 = *(double *)(v105 + 24);
    if (v103 < v104)
      v103 = v104;
    *(double *)(*(_QWORD *)(a1 + 88) + 256) = *(double *)(*(_QWORD *)(a1 + 88) + 256)
                                              + v103 * a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 248) + 8) + 24);
    v106 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 424) + 8) + 24);
    v107 = *(_QWORD *)(*(_QWORD *)(a1 + 440) + 8);
    if (v106 < *(double *)(v107 + 24))
      v106 = *(double *)(v107 + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 264) = *(double *)(*(_QWORD *)(a1 + 88) + 264)
                                              + v106
                                              * a9
                                              * (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 256) + 8) + 24);
    v108 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 424) + 8) + 24);
    v109 = *(_QWORD *)(*(_QWORD *)(a1 + 376) + 8);
    if (v108 < *(double *)(v109 + 24))
      v108 = *(double *)(v109 + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 272) = *(double *)(*(_QWORD *)(a1 + 88) + 272)
                                              + v108
                                              * a9
                                              * (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 264) + 8) + 24);
    v110 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24);
    v111 = *(_QWORD *)(*(_QWORD *)(a1 + 424) + 8);
    if (v110 < *(double *)(v111 + 24))
      v110 = *(double *)(v111 + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 280) = *(double *)(*(_QWORD *)(a1 + 88) + 280)
                                              + v110 * a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 272) + 8) + 24);
    v112 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 360) + 8) + 24);
    v113 = *(_QWORD *)(*(_QWORD *)(a1 + 424) + 8);
    if (v112 < *(double *)(v113 + 24))
      v112 = *(double *)(v113 + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 288) = *(double *)(*(_QWORD *)(a1 + 88) + 288)
                                              + v112
                                              * a9
                                              * (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 280) + 8) + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 440) = *(double *)(*(_QWORD *)(a1 + 88) + 440)
                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 488) + 8) + 24)
                                              * a9
                                              * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 304) + 8) + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 488) = *(double *)(*(_QWORD *)(a1 + 88) + 488)
                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 504) + 8) + 24)
                                              * a9
                                              * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 312) + 8) + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 312) = *(double *)(*(_QWORD *)(a1 + 88) + 312)
                                              + a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 320) = *(double *)(*(_QWORD *)(a1 + 88) + 320)
                                              + a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 360) + 8) + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 328) = *(double *)(*(_QWORD *)(a1 + 88) + 328)
                                              + a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 376) + 8) + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 336) = *(double *)(*(_QWORD *)(a1 + 88) + 336)
                                              + a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 440) + 8) + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 344) = *(double *)(*(_QWORD *)(a1 + 88) + 344)
                                              + a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 424) + 8) + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 352) = *(double *)(*(_QWORD *)(a1 + 88) + 352)
                                              + a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 472) + 8) + 24);
    v114 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24);
    if (v114 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 360) + 8) + 24))
      v114 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 360) + 8) + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 360) = *(double *)(*(_QWORD *)(a1 + 88) + 360) + a9 * v114;
    v115 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24);
    v116 = *(_QWORD *)(*(_QWORD *)(a1 + 376) + 8);
    if (v115 < *(double *)(v116 + 24))
      v115 = *(double *)(v116 + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 368) = *(double *)(*(_QWORD *)(a1 + 88) + 368) + a9 * v115;
    v117 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 360) + 8) + 24);
    v118 = *(_QWORD *)(*(_QWORD *)(a1 + 376) + 8);
    if (v117 < *(double *)(v118 + 24))
      v117 = *(double *)(v118 + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 376) = *(double *)(*(_QWORD *)(a1 + 88) + 376) + a9 * v117;
    v119 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24);
    v120 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 360) + 8) + 24);
    v121 = *(_QWORD *)(*(_QWORD *)(a1 + 376) + 8);
    if (v120 < *(double *)(v121 + 24))
      v120 = *(double *)(v121 + 24);
    if (v119 < v120)
      v119 = v120;
    *(double *)(*(_QWORD *)(a1 + 88) + 384) = *(double *)(*(_QWORD *)(a1 + 88) + 384) + a9 * v119;
    v122 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 424) + 8) + 24);
    v123 = *(_QWORD *)(*(_QWORD *)(a1 + 376) + 8);
    if (v122 < *(double *)(v123 + 24))
      v122 = *(double *)(v123 + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 392) = *(double *)(*(_QWORD *)(a1 + 88) + 392) + a9 * v122;
    v124 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 424) + 8) + 24);
    v125 = *(_QWORD *)(*(_QWORD *)(a1 + 440) + 8);
    if (v124 < *(double *)(v125 + 24))
      v124 = *(double *)(v125 + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 400) = *(double *)(*(_QWORD *)(a1 + 88) + 400) + a9 * v124;
    v126 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24);
    v127 = *(_QWORD *)(*(_QWORD *)(a1 + 424) + 8);
    if (v126 < *(double *)(v127 + 24))
      v126 = *(double *)(v127 + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 408) = *(double *)(*(_QWORD *)(a1 + 88) + 408) + a9 * v126;
    v128 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 360) + 8) + 24);
    v129 = *(_QWORD *)(*(_QWORD *)(a1 + 424) + 8);
    if (v128 < *(double *)(v129 + 24))
      v128 = *(double *)(v129 + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 416) = *(double *)(*(_QWORD *)(a1 + 88) + 416) + a9 * v128;
    v130 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 472) + 8) + 24);
    v131 = *(_QWORD *)(*(_QWORD *)(a1 + 376) + 8);
    if (v130 < *(double *)(v131 + 24))
      v130 = *(double *)(v131 + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 424) = *(double *)(*(_QWORD *)(a1 + 88) + 424) + a9 * v130;
    v132 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 472) + 8) + 24);
    v133 = *(_QWORD *)(*(_QWORD *)(a1 + 344) + 8);
    if (v132 < *(double *)(v133 + 24))
      v132 = *(double *)(v133 + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 432) = *(double *)(*(_QWORD *)(a1 + 88) + 432) + a9 * v132;
    if (v89)
      *(double *)(*(_QWORD *)(a1 + 88) + 448) = *(double *)(*(_QWORD *)(a1 + 88) + 448)
                                                + a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 488) + 8) + 24);
    if (v90)
      *(double *)(*(_QWORD *)(a1 + 88) + 496) = *(double *)(*(_QWORD *)(a1 + 88) + 496)
                                                + a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 504) + 8) + 24);
    if (v255)
      *(double *)(*(_QWORD *)(a1 + 88) + 544) = *(double *)(*(_QWORD *)(a1 + 88) + 544)
                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 408) + 8) + 24)
                                                * a9
                                                * (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 288) + 8) + 24);
    if (v254)
      *(double *)(*(_QWORD *)(a1 + 88) + 552) = *(double *)(*(_QWORD *)(a1 + 88) + 552)
                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 392) + 8) + 24)
                                                * a9
                                                * (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 296) + 8) + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 536) = *(double *)(*(_QWORD *)(a1 + 88) + 536)
                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 360) + 8) + 24)
                                              * a9
                                              * (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 560) = *(double *)(*(_QWORD *)(a1 + 88) + 560)
                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24)
                                              * a9
                                              * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24);
    *(double *)(*(_QWORD *)(a1 + 88) + 32) = *(double *)(*(_QWORD *)(a1 + 88) + 32)
                                             + a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 328) + 8) + 24);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 88) + 128), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 520) + 8) + 40));
    v134 = *(void **)(a1 + 80);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "addObject:", v135);

  }
  v136 = -[ATXMinimalSlotResolutionParameters initWithParameterHash:slotHash:uuid:paramCount:]([ATXMinimalSlotResolutionParameters alloc], "initWithParameterHash:slotHash:uuid:paramCount:", a4, a5, v262, a6);
  if (objc_msgSend(*(id *)(a1 + 72), "containsObject:", v136))
  {
    __atxlog_handle_action_prediction();
    v137 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v266 = v259;
      v267 = 2048;
      v268 = a3;
      _os_log_impl(&dword_1C9A3B000, v137, OS_LOG_TYPE_DEFAULT, "Skipping previously encountered parameter combination for actionType: %@ alogRowID: %lld", buf, 0x16u);
    }

    v138 = v258;
    goto LABEL_194;
  }
  objc_msgSend(*(id *)(a1 + 72), "addObject:", v136);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 88) + 16), "objectForKey:", v136);
  v139 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v139)
  {
    v140 = *(void **)(*(_QWORD *)(a1 + 88) + 16);
    v141 = -[ATXSlotResolutionParametersStatistics initWithNumParameters:]([ATXSlotResolutionParametersStatistics alloc], "initWithNumParameters:", a6);
    objc_msgSend(v140, "setObject:forKey:", v141, v136);

    ++*(_DWORD *)(*(_QWORD *)(a1 + 88) + 40);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 88) + 16), "objectForKeyedSubscript:", v136);
  v142 = objc_claimAutoreleasedReturnValue();
  v143 = v142;
  ++*(_DWORD *)(v142 + 8);
  *(double *)(v142 + 16) = *(double *)(v142 + 16) + a9;
  *(double *)(v142 + 232) = *(double *)(v142 + 232) + a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 328) + 8) + 24);
  *(double *)(v142 + 240) = *(double *)(v142 + 240) + a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24);
  *(double *)(v142 + 248) = *(double *)(v142 + 248) + a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 360) + 8) + 24);
  *(double *)(v142 + 256) = *(double *)(v142 + 256) + a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 472) + 8) + 24);
  *(double *)(v142 + 264) = *(double *)(v142 + 264) + a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 376) + 8) + 24);
  *(double *)(v142 + 272) = *(double *)(v142 + 272) + a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 424) + 8) + 24);
  *(double *)(v142 + 280) = *(double *)(v142 + 280) + a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 440) + 8) + 24);
  v144 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24);
  v145 = *(_QWORD *)(*(_QWORD *)(a1 + 360) + 8);
  if (v144 < *(double *)(v145 + 24))
    v144 = *(double *)(v145 + 24);
  *(double *)(v142 + 288) = *(double *)(v142 + 288) + a9 * v144;
  v146 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24);
  v147 = *(_QWORD *)(*(_QWORD *)(a1 + 376) + 8);
  if (v146 < *(double *)(v147 + 24))
    v146 = *(double *)(v147 + 24);
  *(double *)(v142 + 296) = *(double *)(v142 + 296) + a9 * v146;
  v148 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 360) + 8) + 24);
  v149 = *(_QWORD *)(*(_QWORD *)(a1 + 376) + 8);
  if (v148 < *(double *)(v149 + 24))
    v148 = *(double *)(v149 + 24);
  *(double *)(v142 + 304) = *(double *)(v142 + 304) + a9 * v148;
  v150 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24);
  v151 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 360) + 8) + 24);
  v152 = *(_QWORD *)(*(_QWORD *)(a1 + 376) + 8);
  if (v151 < *(double *)(v152 + 24))
    v151 = *(double *)(v152 + 24);
  if (v150 < v151)
    v150 = v151;
  *(double *)(v142 + 312) = *(double *)(v142 + 312) + a9 * v150;
  v153 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 424) + 8) + 24);
  if (v153 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 440) + 8) + 24))
    v153 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 440) + 8) + 24);
  *(double *)(v142 + 320) = *(double *)(v142 + 320) + a9 * v153;
  v154 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 424) + 8) + 24);
  v155 = *(_QWORD *)(*(_QWORD *)(a1 + 376) + 8);
  if (v154 < *(double *)(v155 + 24))
    v154 = *(double *)(v155 + 24);
  *(double *)(v142 + 328) = *(double *)(v142 + 328) + a9 * v154;
  v156 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24);
  v157 = *(_QWORD *)(*(_QWORD *)(a1 + 424) + 8);
  if (v156 < *(double *)(v157 + 24))
    v156 = *(double *)(v157 + 24);
  *(double *)(v142 + 336) = *(double *)(v142 + 336) + a9 * v156;
  v158 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 360) + 8) + 24);
  if (v158 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 424) + 8) + 24))
    v158 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 424) + 8) + 24);
  *(double *)(v142 + 344) = *(double *)(v142 + 344) + a9 * v158;
  v159 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 472) + 8) + 24);
  v160 = *(_QWORD *)(*(_QWORD *)(a1 + 376) + 8);
  if (v159 < *(double *)(v160 + 24))
    v159 = *(double *)(v160 + 24);
  *(double *)(v142 + 352) = *(double *)(v142 + 352) + a9 * v159;
  v161 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 472) + 8) + 24);
  v162 = *(_QWORD *)(*(_QWORD *)(a1 + 344) + 8);
  if (v161 < *(double *)(v162 + 24))
    v161 = *(double *)(v162 + 24);
  *(double *)(v142 + 360) = *(double *)(v142 + 360) + a9 * v161;
  v138 = v258;
  if (v89)
    *(double *)(v142 + 648) = *(double *)(v142 + 648)
                            + a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 488) + 8) + 24);
  if (v90)
    *(double *)(v142 + 696) = *(double *)(v142 + 696)
                            + a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 504) + 8) + 24);
  *(double *)(v142 + 368) = *(double *)(v142 + 368)
                          + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24)
                          * a9
                          * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
  *(double *)(v142 + 376) = *(double *)(v142 + 376)
                          + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24)
                          * a9
                          * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24);
  *(double *)(v142 + 384) = *(double *)(v142 + 384)
                          + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24)
                          * a9
                          * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24);
  *(double *)(v142 + 392) = *(double *)(v142 + 392)
                          + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24)
                          * a9
                          * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24);
  *(double *)(v142 + 400) = *(double *)(v142 + 400)
                          + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24)
                          * a9
                          * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24);
  *(double *)(v142 + 408) = *(double *)(v142 + 408)
                          + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 360) + 8) + 24)
                          * a9
                          * (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 24);
  *(double *)(v142 + 416) = *(double *)(v142 + 416)
                          + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 472) + 8) + 24)
                          * a9
                          * (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 8) + 24);
  v163 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 472) + 8) + 24);
  v164 = *(_QWORD *)(*(_QWORD *)(a1 + 376) + 8);
  if (v163 < *(double *)(v164 + 24))
    v163 = *(double *)(v164 + 24);
  *(double *)(v142 + 424) = *(double *)(v142 + 424)
                          + v163 * a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 192) + 8) + 24);
  v165 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 472) + 8) + 24);
  v166 = *(_QWORD *)(*(_QWORD *)(a1 + 344) + 8);
  if (v165 < *(double *)(v166 + 24))
    v165 = *(double *)(v166 + 24);
  *(double *)(v142 + 520) = *(double *)(v142 + 520)
                          + v165 * a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 200) + 8) + 24);
  *(double *)(v142 + 432) = *(double *)(v142 + 432)
                          + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 376) + 8) + 24)
                          * a9
                          * (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 24);
  *(double *)(v142 + 448) = *(double *)(v142 + 448)
                          + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 424) + 8) + 24)
                          * a9
                          * (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + 24);
  *(double *)(v142 + 440) = *(double *)(v142 + 440)
                          + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 440) + 8) + 24)
                          * a9
                          * (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 208) + 8) + 24);
  v167 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24);
  v168 = *(_QWORD *)(*(_QWORD *)(a1 + 360) + 8);
  if (v167 < *(double *)(v168 + 24))
    v167 = *(double *)(v168 + 24);
  *(double *)(v142 + 464) = *(double *)(v142 + 464)
                          + v167 * a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 224) + 8) + 24);
  v169 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24);
  v170 = *(_QWORD *)(*(_QWORD *)(a1 + 376) + 8);
  if (v169 < *(double *)(v170 + 24))
    v169 = *(double *)(v170 + 24);
  *(double *)(v142 + 456) = *(double *)(v142 + 456)
                          + v169 * a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 232) + 8) + 24);
  v171 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 360) + 8) + 24);
  v172 = *(_QWORD *)(*(_QWORD *)(a1 + 376) + 8);
  if (v171 < *(double *)(v172 + 24))
    v171 = *(double *)(v172 + 24);
  *(double *)(v142 + 472) = *(double *)(v142 + 472)
                          + v171 * a9 * (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 8) + 24);
  v173 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24);
  v174 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 360) + 8) + 24);
  v175 = *(_QWORD *)(*(_QWORD *)(a1 + 376) + 8);
  if (v174 < *(double *)(v175 + 24))
    v174 = *(double *)(v175 + 24);
  if (v173 < v174)
    v173 = v174;
  *(double *)(v142 + 480) = *(double *)(v142 + 480)
                          + v173 * a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 248) + 8) + 24);
  v176 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 424) + 8) + 24);
  v177 = *(_QWORD *)(*(_QWORD *)(a1 + 440) + 8);
  if (v176 < *(double *)(v177 + 24))
    v176 = *(double *)(v177 + 24);
  *(double *)(v142 + 488) = *(double *)(v142 + 488)
                          + v176 * a9 * (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 256) + 8) + 24);
  v178 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 424) + 8) + 24);
  v179 = *(_QWORD *)(*(_QWORD *)(a1 + 376) + 8);
  if (v178 < *(double *)(v179 + 24))
    v178 = *(double *)(v179 + 24);
  *(double *)(v142 + 496) = *(double *)(v142 + 496)
                          + v178 * a9 * (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 264) + 8) + 24);
  v180 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24);
  v181 = *(_QWORD *)(*(_QWORD *)(a1 + 424) + 8);
  if (v180 < *(double *)(v181 + 24))
    v180 = *(double *)(v181 + 24);
  *(double *)(v142 + 504) = *(double *)(v142 + 504)
                          + v180 * a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 272) + 8) + 24);
  v182 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 360) + 8) + 24);
  v183 = *(_QWORD *)(*(_QWORD *)(a1 + 424) + 8);
  if (v182 < *(double *)(v183 + 24))
    v182 = *(double *)(v183 + 24);
  *(double *)(v142 + 512) = *(double *)(v142 + 512)
                          + v182 * a9 * (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 280) + 8) + 24);
  *(double *)(v142 + 640) = *(double *)(v142 + 640)
                          + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 488) + 8) + 24)
                          * a9
                          * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 304) + 8) + 24);
  *(double *)(v142 + 688) = *(double *)(v142 + 688)
                          + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 504) + 8) + 24)
                          * a9
                          * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 312) + 8) + 24);
  v184 = *(void **)(v142 + 1136);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a11);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "objectForKey:", v185);
  v186 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v186)
  {
    v187 = *(void **)(v143 + 1136);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a11);
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "setObject:forKeyedSubscript:", &unk_1E83CC208, v188);

  }
  v189 = *(void **)(v143 + 1136);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a11);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "objectForKeyedSubscript:", v190);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "doubleValue");
  v193 = v192;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v193 + a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 360) + 8) + 24));
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  v195 = *(void **)(v143 + 1136);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a11);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v195, "setObject:forKeyedSubscript:", v194, v196);

  v197 = *(void **)(v143 + 1144);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 24));
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v197, "objectForKey:", v198);
  v199 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v199)
  {
    v200 = *(void **)(v143 + 1144);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 24));
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v200, "setObject:forKeyedSubscript:", &unk_1E83CC208, v201);

  }
  v202 = *(void **)(v143 + 1144);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 24));
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v202, "objectForKeyedSubscript:", v203);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "doubleValue");
  v206 = v205;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v206 + a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24));
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v208 = *(void **)(v143 + 1144);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 24));
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v208, "setObject:forKeyedSubscript:", v207, v209);

  v210 = *(void **)(v143 + 1152);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a18);
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v210, "objectForKey:", v211);
  v212 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v212)
  {
    v213 = *(void **)(v143 + 1152);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a18);
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v213, "setObject:forKeyedSubscript:", &unk_1E83CC208, v214);

  }
  v215 = *(void **)(v143 + 1152);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a18);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v215, "objectForKeyedSubscript:", v216);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v217, "doubleValue");
  v219 = v218;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v219 + a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 408) + 8) + 24));
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  v221 = *(void **)(v143 + 1152);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a18);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v221, "setObject:forKeyedSubscript:", v220, v222);

  v223 = *(void **)(v143 + 1160);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a17);
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v223, "objectForKey:", v224);
  v225 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v225)
  {
    v226 = *(void **)(v143 + 1160);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a17);
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v226, "setObject:forKeyedSubscript:", &unk_1E83CC208, v227);

  }
  v228 = *(void **)(v143 + 1160);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a17);
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v228, "objectForKeyedSubscript:", v229);
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v230, "doubleValue");
  v232 = v231;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v232 + a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 392) + 8) + 24));
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  v234 = *(void **)(v143 + 1160);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a17);
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v234, "setObject:forKeyedSubscript:", v233, v235);

  if (v255)
  {
    *(double *)(v143 + 744) = *(double *)(v143 + 744)
                            + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 408) + 8) + 24)
                            * a9
                            * (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 288) + 8) + 24);
    *(double *)(v143 + 752) = *(double *)(v143 + 752)
                            + a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 408) + 8) + 24);
  }
  if (v254)
  {
    *(double *)(v143 + 760) = *(double *)(v143 + 760)
                            + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 392) + 8) + 24)
                            * a9
                            * (double)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 296) + 8) + 24);
    *(double *)(v143 + 768) = *(double *)(v143 + 768)
                            + a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 392) + 8) + 24);
  }
  *(double *)(v143 + 736) = *(double *)(v143 + 736) + a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 360) + 8) + 24);
  *(double *)(v143 + 776) = *(double *)(v143 + 776) + a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 344) + 8) + 24);
  v236 = *(void **)(v143 + 48);
  if (v236)
  {
    objc_msgSend(v236, "earlierDate:", v264);
    v237 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v237 = v264;
  }
  v238 = *(void **)(v143 + 48);
  *(_QWORD *)(v143 + 48) = v237;

  v239 = *(void **)(v143 + 56);
  if (v239)
  {
    objc_msgSend(v239, "laterDate:", v264);
    v240 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v240 = v264;
  }
  v241 = *(void **)(v143 + 56);
  *(_QWORD *)(v143 + 56) = v240;

  if (*(_QWORD *)(v143 + 32))
  {
    v242 = objc_msgSend(v258, "isEqualToDate:");
    if (v258)
      v243 = v242;
    else
      v243 = 1;
    if ((v243 & 1) != 0)
      goto LABEL_185;
    goto LABEL_184;
  }
  if (v258)
  {
LABEL_184:
    objc_storeStrong((id *)(v143 + 32), a15);
    *(double *)(v143 + 592) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 456) + 8) + 24) + *(double *)(v143 + 592);
  }
LABEL_185:
  if ((objc_msgSend(*(id *)(v143 + 40), "containsObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 520) + 8) + 40)) & 1) == 0)
  {
    if (objc_msgSend(*(id *)(v143 + 40), "count"))
    {
      objc_msgSend((id)v143, "_updateTimeOfDayBudgetStatisticsForNewTimeOfDayBudget:", *(double *)(v143 + 632));
      *(_QWORD *)(v143 + 632) = 0;
    }
    objc_msgSend(*(id *)(v143 + 40), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 520) + 8) + 40));
  }
  *(double *)(v143 + 632) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24) + *(double *)(v143 + 632);
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 520) + 8) + 40), "isEqual:", *(_QWORD *)(a1 + 96)))*(double *)(v143 + 624) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24) + *(double *)(v143 + 624);
  v244 = *(void **)(*(_QWORD *)(a1 + 88) + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5);
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v244, "objectForKey:", v245);
  v246 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v246)
  {
    v247 = *(void **)(*(_QWORD *)(a1 + 88) + 24);
    v248 = objc_alloc_init(ATXSlotResolutionSlotSetStatistics);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5);
    v249 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v247, "setObject:forKey:", v248, v249);

  }
  v250 = *(void **)(*(_QWORD *)(a1 + 88) + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5);
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v250, "objectForKeyedSubscript:", v251);
  v252 = (double *)objc_claimAutoreleasedReturnValue();

  v252[2] = v252[2] + a9 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 328) + 8) + 24);
LABEL_194:

  return 1;
}

- (id)updateStatisticsWithFeedbackForBundleId:(id)a3 actionType:(id)a4 statistics:(id)a5 currentDate:(id)a6 currentGeohash:(int64_t)a7 currentCoarseGeohash:(int64_t)a8
{
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _ATXDataStore *dataStore;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  ATXSlotResolution *v42;
  id v43;
  id v44;
  id v45;
  _QWORD *v46;
  _QWORD *v47;
  _QWORD *v48;
  _QWORD *v49;
  _QWORD *v50;
  _QWORD *v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int64_t v56;
  int64_t v57;
  _QWORD v58[3];
  double v59;
  _QWORD v60[3];
  double v61;
  _QWORD v62[3];
  double v63;
  _QWORD v64[3];
  double v65;
  _QWORD v66[3];
  double v67;
  _QWORD v68[3];
  double v69;
  _QWORD v70[3];
  double v71;

  v39 = a3;
  v38 = a4;
  v37 = a5;
  v14 = a6;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXActionUtils timeOfDayAndDayOfWeekForDate:timeZone:](_ATXActionUtils, "timeOfDayAndDayOfWeekForDate:timeZone:", v14, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "first");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "integerValue");

  objc_msgSend(v35, "second");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "integerValue");

  LODWORD(v18) = objc_msgSend(v36, "isDateInWeekend:", v14);
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x2020000000;
  v71 = 0.0;
  objc_msgSend(v15, "slotResolutionTimeOfDayLaunchDecayHalflife");
  v71 = v20 * 86400.0;
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x2020000000;
  v69 = 0.0;
  objc_msgSend(v15, "slotResolutionDayOfWeekLaunchDecayHalflife");
  v69 = v21 * 86400.0;
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x2020000000;
  v67 = 0.0;
  objc_msgSend(v15, "slotResolutionPartOfWeekLaunchDecayHalflife");
  v67 = v22 * 86400.0;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x2020000000;
  v65 = 0.0;
  objc_msgSend(v15, "appAndActionCoarseTimePowLocationDecayHalflife");
  v65 = v23 * 86400.0;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x2020000000;
  v63 = 0.0;
  objc_msgSend(v15, "appAndActionSpecificTimePowLocationDecayHalflife");
  v63 = v24 * 86400.0;
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x2020000000;
  v61 = 0.0;
  objc_msgSend(v15, "actionCoarseGeoHashDecayHalflife");
  v61 = v25 * 86400.0;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x2020000000;
  v59 = 0.0;
  objc_msgSend(v15, "actionSpecificGeoHashDecayHalflife");
  v59 = v26 * 86400.0;
  dataStore = self->_dataStore;
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __131__ATXSlotResolution_updateStatisticsWithFeedbackForBundleId_actionType_statistics_currentDate_currentGeohash_currentCoarseGeohash___block_invoke;
  v40[3] = &unk_1E82DF798;
  v53 = v17;
  v54 = v19;
  v28 = v36;
  v41 = v28;
  v42 = self;
  v56 = a8;
  v57 = a7;
  v46 = v70;
  v47 = v68;
  v48 = v66;
  v49 = v64;
  v50 = v62;
  v51 = v60;
  v55 = v18;
  v52 = v58;
  v29 = v37;
  v43 = v29;
  v30 = v14;
  v44 = v30;
  v31 = v15;
  v45 = v31;
  -[_ATXDataStore enumerateFeedbackForActionOfType:bundleId:block:](dataStore, "enumerateFeedbackForActionOfType:bundleId:block:", v38, v39, v40);
  v32 = v45;
  v33 = v29;

  _Block_object_dispose(v58, 8);
  _Block_object_dispose(v60, 8);
  _Block_object_dispose(v62, 8);
  _Block_object_dispose(v64, 8);
  _Block_object_dispose(v66, 8);
  _Block_object_dispose(v68, 8);
  _Block_object_dispose(v70, 8);

  return v33;
}

uint64_t __131__ATXSlotResolution_updateStatisticsWithFeedbackForBundleId_actionType_statistics_currentDate_currentGeohash_currentCoarseGeohash___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10)
{
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  unsigned int v36;
  unsigned int v37;
  BOOL v38;
  unsigned int v39;
  double v40;
  unsigned int v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  double *v53;
  double v54;
  double v55;
  int v56;
  double v57;
  double v58;
  int *v59;
  double v60;
  int v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  uint64_t v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  int v78;
  int v79;
  double v80;
  double v81;
  double v83;
  double v84;
  double v85;
  double v86;
  ATXMinimalSlotResolutionParameters *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  void *v94;
  id v95;
  void *v96;
  unsigned int v97;
  id v98;

  v95 = a2;
  v98 = a3;
  v17 = a4;
  objc_msgSend(v17, "timeIntervalSinceNow");
  v19 = v18;
  +[_ATXFeedbackConstants actionDecayHalfLifeSeconds](_ATXFeedbackConstants, "actionDecayHalfLifeSeconds");
  +[ATXSlotResolution exponentialDecay:withHalflife:](ATXSlotResolution, "exponentialDecay:withHalflife:", -v19, v20);
  v93 = v21;
  +[ATXSlotResolution yearMonthDayComponentsForDate:](ATXSlotResolution, "yearMonthDayComponentsForDate:", v17);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXActionUtils timeOfDayAndDayOfWeekForDate:timeZone:](_ATXActionUtils, "timeOfDayAndDayOfWeekForDate:timeZone:", v17, 0);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "first");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "integerValue");

  objc_msgSend(v94, "second");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "integerValue");

  +[ATXSlotResolutionParametersStatistics _smoothedCountForTimeOfDay:currentTimeOfDay:](ATXSlotResolutionParametersStatistics, "_smoothedCountForTimeOfDay:currentTimeOfDay:", v23, *(_QWORD *)(a1 + 128));
  v27 = v26;
  +[ATXSlotResolutionParametersStatistics _smoothedCountForCoarseTimeOfDay:currentTimeOfDay:](ATXSlotResolutionParametersStatistics, "_smoothedCountForCoarseTimeOfDay:currentTimeOfDay:", v23, *(_QWORD *)(a1 + 128));
  v29 = v28;
  +[ATXSlotResolutionParametersStatistics _smoothedCountForThirtyMinuteWindow:currentTimeOfDay:](ATXSlotResolutionParametersStatistics, "_smoothedCountForThirtyMinuteWindow:currentTimeOfDay:", v23, *(_QWORD *)(a1 + 128));
  v31 = v30;
  +[ATXSlotResolutionParametersStatistics _smoothedCountForHourWindow:currentTimeOfDay:](ATXSlotResolutionParametersStatistics, "_smoothedCountForHourWindow:currentTimeOfDay:", v23, *(_QWORD *)(a1 + 128));
  v88 = v32;
  v33 = *(_QWORD *)(a1 + 136);
  v34 = objc_msgSend(*(id *)(a1 + 32), "isDateInWeekend:", v17);
  v35 = *(_QWORD *)(a1 + 144);
  v97 = objc_msgSend((id)objc_opt_class(), "matchForCurrentGeohash:rowGeohash:", *(_QWORD *)(a1 + 152), a8);
  v36 = objc_msgSend((id)objc_opt_class(), "matchForCurrentGeohash:rowGeohash:", *(_QWORD *)(a1 + 160), a7);
  v37 = v36;
  v38 = v29 != 0.0 && v35 == v34;
  v39 = v97;
  if (!v38)
    v39 = 0;
  v40 = (v29 + 1.0 + 1.0) / 3.0;
  if (v39 != 1)
    v40 = 0.0;
  v90 = v40;
  if (v31 != 0.0 && v33 == v25)
    v42 = v36;
  else
    v42 = 0;
  if (v42 == 1)
    v43 = (v31 + 1.0 + 1.0) / 3.0;
  else
    v43 = 0.0;
  +[ATXSlotResolution exponentialDecay:withHalflife:](ATXSlotResolution, "exponentialDecay:withHalflife:", -v19, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  v92 = v44;
  +[ATXSlotResolution exponentialDecay:withHalflife:](ATXSlotResolution, "exponentialDecay:withHalflife:", -v19, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
  v91 = v45;
  +[ATXSlotResolution exponentialDecay:withHalflife:](ATXSlotResolution, "exponentialDecay:withHalflife:", -v19, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24));
  v85 = v46;
  +[ATXSlotResolution exponentialDecay:withHalflife:](ATXSlotResolution, "exponentialDecay:withHalflife:", -v19, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24));
  v89 = v47;
  +[ATXSlotResolution exponentialDecay:withHalflife:](ATXSlotResolution, "exponentialDecay:withHalflife:", -v19, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24));
  v49 = v48;
  +[ATXSlotResolution exponentialDecay:withHalflife:](ATXSlotResolution, "exponentialDecay:withHalflife:", -v19, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24));
  v86 = v50;
  +[ATXSlotResolution exponentialDecay:withHalflife:](ATXSlotResolution, "exponentialDecay:withHalflife:", -v19, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24));
  if (v19 <= 0.0)
  {
    v84 = v51;
    v87 = -[ATXMinimalSlotResolutionParameters initWithAction:slots:]([ATXMinimalSlotResolutionParameters alloc], "initWithAction:slots:", v95, v98);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "objectForKey:", v87);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v52)
    {
LABEL_96:

      goto LABEL_97;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "objectForKeyedSubscript:", v87);
    v53 = (double *)objc_claimAutoreleasedReturnValue();
    v83 = v19 / -60.0;
    if (objc_msgSend(MEMORY[0x1E0CF9508], "isActionSpotlightConsumerSubType:", a5))
    {
      if (v19 >= -3600.0)
      {
        if (a9 != 0.0)
          v53[17] = v53[17] + 1.0;
        if (a10 != 0.0)
          v53[18] = v53[18] + 1.0;
      }
      if (v19 >= -7200.0)
      {
        if (a9 != 0.0)
          v53[19] = v53[19] + 1.0;
        if (a10 != 0.0)
          v53[20] = v53[20] + 1.0;
      }
      if (objc_msgSend(*(id *)(a1 + 32), "isDate:inSameDayAsDate:", v17, *(_QWORD *)(a1 + 56)))
      {
        if (a9 != 0.0)
          v53[21] = v53[21] + 1.0;
        if (a10 != 0.0)
          v53[22] = v53[22] + 1.0;
      }
      objc_msgSend(*(id *)(a1 + 64), "maximumActionFeedbackMeanCalculationEntryAge");
      if (v54 * 86400.0 >= -v19)
      {
        if (a10 != 0.0)
          *(double *)(*(_QWORD *)(a1 + 48) + 184) = *(double *)(*(_QWORD *)(a1 + 48) + 184) + 1.0;
        if (a9 != 0.0)
          *(double *)(*(_QWORD *)(a1 + 48) + 176) = *(double *)(*(_QWORD *)(a1 + 48) + 176) + 1.0;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 192), "addObject:", v96);
      }
      if (a9 != 0.0)
      {
        v55 = v53[11];
        if (v55 >= v83)
          v55 = v19 / -60.0;
        v53[11] = v55;
        v53[68] = v53[68] + v92 * v27;
        v53[69] = v53[69] + v92 * v29;
        v53[23] = v93 + v53[23];
        *(double *)(*(_QWORD *)(a1 + 48) + 160) = v93 + *(double *)(*(_QWORD *)(a1 + 48) + 160);
        if (*(_QWORD *)(a1 + 136) == v25)
          v53[67] = v91 + v53[67];
        v56 = objc_msgSend(*(id *)(a1 + 32), "isDateInWeekend:", *(_QWORD *)(a1 + 56));
        if (v56 == objc_msgSend(*(id *)(a1 + 32), "isDateInWeekend:", v17))
          v53[66] = v85 + v53[66];
      }
      v57 = v88;
      v58 = v43;
      if (a10 == 0.0)
        goto LABEL_83;
      v53[24] = v93 + v53[24];
      *(double *)(*(_QWORD *)(a1 + 48) + 168) = v93 + *(double *)(*(_QWORD *)(a1 + 48) + 168);
      if (a6 != 2)
        goto LABEL_83;
      v59 = &OBJC_IVAR___ATXSlotResolutionParametersStatistics__minutesSinceLastExplicitRejectInSpotlight;
    }
    else
    {
      v57 = v88;
      v58 = v43;
      if ((a5 - 38) < 2 || (_DWORD)a5 == 36)
      {
        if (a9 != 0.0)
        {
          v63 = 0.0;
          if (v33 == v25)
            v63 = 1.0;
          v64 = v91 * v63;
          v53[114] = v53[114] + v64 * a9;
          v53[118] = v53[118] + v88 * v92 * a9;
          v65 = v86 * (double)v97;
          v53[122] = v53[122] + v65 * a9;
          v66 = v84 * (double)v37;
          v53[126] = v53[126] + v66 * a9;
          v53[130] = v53[130] + v90 * v89 * a9;
          v53[134] = v53[134] + v43 * v49 * a9;
          v53[115] = v53[115] + v91 * a9;
          v53[119] = v53[119] + v92 * a9;
          v53[123] = v53[123] + v86 * a9;
          v53[127] = v53[127] + v84 * a9;
          v53[131] = v53[131] + v89 * a9;
          v53[135] = v53[135] + v49 * a9;
          *(double *)(*(_QWORD *)(a1 + 48) + 632) = *(double *)(*(_QWORD *)(a1 + 48) + 632) + v64 * a9;
          *(double *)(*(_QWORD *)(a1 + 48) + 648) = *(double *)(*(_QWORD *)(a1 + 48) + 648) + v88 * v92 * a9;
          *(double *)(*(_QWORD *)(a1 + 48) + 664) = *(double *)(*(_QWORD *)(a1 + 48) + 664) + v65 * a9;
          *(double *)(*(_QWORD *)(a1 + 48) + 680) = *(double *)(*(_QWORD *)(a1 + 48) + 680) + v66 * a9;
          *(double *)(*(_QWORD *)(a1 + 48) + 696) = *(double *)(*(_QWORD *)(a1 + 48) + 696) + v90 * v89 * a9;
          *(double *)(*(_QWORD *)(a1 + 48) + 712) = *(double *)(*(_QWORD *)(a1 + 48) + 712) + v43 * v49 * a9;
        }
        if (a10 == 0.0)
          goto LABEL_83;
        v67 = 0.0;
        if (v33 == v25)
          v67 = 1.0;
        v68 = v91 * v67;
        v53[116] = v53[116] + v68 * a10;
        v53[120] = v53[120] + v88 * v92 * a10;
        v69 = v86 * (double)v97;
        v53[124] = v53[124] + v69 * a10;
        v70 = v84 * (double)v37;
        v53[128] = v53[128] + v70 * a10;
        v53[132] = v53[132] + v90 * v89 * a10;
        v53[136] = v53[136] + v43 * v49 * a10;
        v53[117] = v53[117] + v91 * a10;
        v53[121] = v53[121] + v92 * a10;
        v53[125] = v53[125] + v86 * a10;
        v53[129] = v53[129] + v84 * a10;
        v53[133] = v53[133] + v89 * a10;
        v53[137] = v53[137] + v49 * a10;
        *(double *)(*(_QWORD *)(a1 + 48) + 640) = *(double *)(*(_QWORD *)(a1 + 48) + 640) + v68 * a10;
        *(double *)(*(_QWORD *)(a1 + 48) + 656) = *(double *)(*(_QWORD *)(a1 + 48) + 656) + v88 * v92 * a10;
        *(double *)(*(_QWORD *)(a1 + 48) + 672) = *(double *)(*(_QWORD *)(a1 + 48) + 672) + v69 * a10;
        *(double *)(*(_QWORD *)(a1 + 48) + 688) = *(double *)(*(_QWORD *)(a1 + 48) + 688) + v70 * a10;
        *(double *)(*(_QWORD *)(a1 + 48) + 704) = *(double *)(*(_QWORD *)(a1 + 48) + 704) + v90 * v89 * a10;
        *(double *)(*(_QWORD *)(a1 + 48) + 720) = *(double *)(*(_QWORD *)(a1 + 48) + 720) + v43 * v49 * a10;
        if (a6 != 2)
          goto LABEL_83;
        v59 = &OBJC_IVAR___ATXSlotResolutionParametersStatistics__minutesSinceLastExplicitRejectInHomeScreen;
      }
      else
      {
        if ((_DWORD)a5 != 22)
          goto LABEL_83;
        if (objc_msgSend(*(id *)(a1 + 32), "isDate:inSameDayAsDate:", v17, *(_QWORD *)(a1 + 56)))
        {
          if (a9 != 0.0)
          {
            v53[25] = v53[25] + 1.0;
            *(double *)(*(_QWORD *)(a1 + 48) + 200) = *(double *)(*(_QWORD *)(a1 + 48) + 200) + 1.0;
          }
          if (a10 != 0.0)
          {
            v53[26] = v53[26] + 1.0;
            *(double *)(*(_QWORD *)(a1 + 48) + 208) = *(double *)(*(_QWORD *)(a1 + 48) + 208) + 1.0;
          }
        }
        v57 = v88;
        v58 = v43;
        if (a9 != 0.0)
        {
          v60 = v53[13];
          if (v60 >= v83)
            v60 = v83;
          v53[13] = v60;
          v53[72] = v53[72] + v92 * v27;
          v53[73] = v53[73] + v92 * v29;
          v53[27] = v93 + v53[27];
          *(double *)(*(_QWORD *)(a1 + 48) + 216) = v93 + *(double *)(*(_QWORD *)(a1 + 48) + 216);
          if (*(_QWORD *)(a1 + 136) == v25)
            v53[71] = v91 + v53[71];
          v61 = objc_msgSend(*(id *)(a1 + 32), "isDateInWeekend:", *(_QWORD *)(a1 + 56));
          v57 = v88;
          v58 = v43;
          if (v61 == objc_msgSend(*(id *)(a1 + 32), "isDateInWeekend:", v17))
            v53[70] = v85 + v53[70];
        }
        if (a10 == 0.0)
          goto LABEL_83;
        v62 = v53[14];
        if (v62 >= v83)
          v62 = v83;
        v53[14] = v62;
        v53[28] = v93 + v53[28];
        *(double *)(*(_QWORD *)(a1 + 48) + 224) = v93 + *(double *)(*(_QWORD *)(a1 + 48) + 224);
        if (a6 != 2)
          goto LABEL_83;
        v59 = &OBJC_IVAR___ATXSlotResolutionParametersStatistics__minutesSinceLastExplicitRejectInLockscreen;
      }
    }
    v71 = *v59;
    v72 = *(double *)((char *)v53 + v71);
    if (v72 >= v83)
      v72 = v83;
    *(double *)((char *)v53 + v71) = v72;
LABEL_83:
    if (objc_msgSend((id)objc_opt_class(), "shouldCountRowForGeohashOccurrencesCalculationForCurrentGeohash:rowGeohash:", *(_QWORD *)(a1 + 152), a8))
    {
      v53[83] = v53[83] + v89 * a9;
      v53[85] = v53[85] + v89 * a10;
      *(double *)(*(_QWORD *)(a1 + 48) + 464) = *(double *)(*(_QWORD *)(a1 + 48) + 464) + v89 * a9;
      *(double *)(*(_QWORD *)(a1 + 48) + 480) = *(double *)(*(_QWORD *)(a1 + 48) + 480) + v89 * a10;
    }
    if (objc_msgSend((id)objc_opt_class(), "shouldCountRowForGeohashOccurrencesCalculationForCurrentGeohash:rowGeohash:", *(_QWORD *)(a1 + 160), a7))
    {
      v53[89] = v53[89] + v49 * a9;
      v53[91] = v53[91] + v49 * a10;
      *(double *)(*(_QWORD *)(a1 + 48) + 512) = *(double *)(*(_QWORD *)(a1 + 48) + 512) + v49 * a9;
      *(double *)(*(_QWORD *)(a1 + 48) + 528) = *(double *)(*(_QWORD *)(a1 + 48) + 528) + v49 * a10;
    }
    v73 = v90 * v89;
    v53[82] = v53[82] + v90 * v89 * a9;
    v74 = v58 * v49;
    v53[88] = v53[88] + v58 * v49 * a9;
    v53[84] = v53[84] + v90 * v89 * a10;
    v53[90] = v53[90] + v58 * v49 * a10;
    v75 = v57 * v92;
    v53[98] = v53[98] + v57 * v92 * a9;
    v76 = 0.0;
    if (v33 == v25)
      v76 = 1.0;
    v77 = v91 * v76;
    v53[102] = v53[102] + v91 * v76 * a9;
    v53[100] = v53[100] + v75 * a10;
    v53[104] = v53[104] + v91 * v76 * a10;
    v53[99] = v53[99] + v92 * a9;
    v53[103] = v53[103] + v91 * a9;
    v53[101] = v53[101] + v92 * a10;
    v53[105] = v53[105] + v91 * a10;
    v78 = objc_msgSend((id)objc_opt_class(), "shouldCountRowForGeohashIndividualContextStatistics:rowGeohash:", *(_QWORD *)(a1 + 160), a7);
    v79 = objc_msgSend((id)objc_opt_class(), "shouldCountRowForGeohashIndividualContextStatistics:rowGeohash:", *(_QWORD *)(a1 + 152), a8);
    if (v78)
    {
      v80 = v84 * (double)v37;
      v53[110] = v53[110] + v80 * a9;
      v53[111] = v53[111] + v84 * a9;
      v53[113] = v53[113] + v84 * a10;
      v53[112] = v53[112] + v80 * a10;
      *(double *)(*(_QWORD *)(a1 + 48) + 616) = *(double *)(*(_QWORD *)(a1 + 48) + 616) + v80 * a9;
      *(double *)(*(_QWORD *)(a1 + 48) + 624) = *(double *)(*(_QWORD *)(a1 + 48) + 624) + v80 * a10;
    }
    if (v79)
    {
      v81 = v86 * (double)v97;
      v53[106] = v53[106] + v81 * a9;
      v53[107] = v53[107] + v86 * a9;
      v53[109] = v53[109] + v86 * a10;
      v53[108] = v53[108] + v81 * a10;
      *(double *)(*(_QWORD *)(a1 + 48) + 600) = *(double *)(*(_QWORD *)(a1 + 48) + 600) + v81 * a9;
      *(double *)(*(_QWORD *)(a1 + 48) + 608) = *(double *)(*(_QWORD *)(a1 + 48) + 608) + v81 * a10;
    }
    *(double *)(*(_QWORD *)(a1 + 48) + 456) = *(double *)(*(_QWORD *)(a1 + 48) + 456) + v73 * a9;
    *(double *)(*(_QWORD *)(a1 + 48) + 504) = *(double *)(*(_QWORD *)(a1 + 48) + 504) + v74 * a9;
    *(double *)(*(_QWORD *)(a1 + 48) + 472) = *(double *)(*(_QWORD *)(a1 + 48) + 472) + v73 * a10;
    *(double *)(*(_QWORD *)(a1 + 48) + 520) = *(double *)(*(_QWORD *)(a1 + 48) + 520) + v74 * a10;
    *(double *)(*(_QWORD *)(a1 + 48) + 584) = *(double *)(*(_QWORD *)(a1 + 48) + 584) + v77 * a9;
    *(double *)(*(_QWORD *)(a1 + 48) + 592) = *(double *)(*(_QWORD *)(a1 + 48) + 592) + v77 * a10;
    *(double *)(*(_QWORD *)(a1 + 48) + 568) = *(double *)(*(_QWORD *)(a1 + 48) + 568) + v75 * a9;
    *(double *)(*(_QWORD *)(a1 + 48) + 576) = *(double *)(*(_QWORD *)(a1 + 48) + 576) + v75 * a10;
    v53[8] = v53[8] + v93 * a9;
    v53[9] = v53[9] + v93 * a10;
    *(double *)(*(_QWORD *)(a1 + 48) + 136) = *(double *)(*(_QWORD *)(a1 + 48) + 136) + v93 * a9;
    *(double *)(*(_QWORD *)(a1 + 48) + 144) = *(double *)(*(_QWORD *)(a1 + 48) + 144) + v93 * a10;
    if (a6 == 2)
    {
      *(double *)(*(_QWORD *)(a1 + 48) + 152) = *(double *)(*(_QWORD *)(a1 + 48) + 152) + a10;
      v53[10] = v53[10] + a10;
    }

    goto LABEL_96;
  }
LABEL_97:

  return 1;
}

- (id)updateStatisticsWithHigherLevelFeaturesForStatistics:(id)a3
{
  _QWORD *v3;
  void *v4;
  _QWORD *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)v3[2];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__ATXSlotResolution_updateStatisticsWithHigherLevelFeaturesForStatistics___block_invoke;
  v7[3] = &unk_1E82DF7C0;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

void __74__ATXSlotResolution_updateStatisticsWithHigherLevelFeaturesForStatistics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double *v10;
  long double v11;
  double v12;
  double v13;
  long double v14;
  double v15;
  double v16;
  long double v17;
  double v18;
  double v19;
  long double v20;
  double v21;
  double v22;
  long double v23;
  double v24;
  double v25;
  id v26;

  v26 = a2;
  v5 = a3;
  objc_msgSend(v5, "_totalFeedbackEvents");
  if (v6 > 0.0)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "_confirmRatio");
    objc_msgSend(v7, "_updateConfirmRatioStatisticsForNewConfirmRatio:");
  }
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v26, "slotHash"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (double *)objc_claimAutoreleasedReturnValue();

  ATXProbability(v5[29], v10[2]);
  v12 = v11;
  v13 = log2(v11);
  if (v12 <= 0.0)
    v13 = 0.0;
  v10[1] = v10[1] - v13 * v12;
  ATXProbability(v5[48], *(double *)(*(_QWORD *)(a1 + 32) + 560));
  v15 = v14;
  v16 = log2(v14);
  if (v15 <= 0.0)
    v16 = 0.0;
  v5[138] = v5[138] - v16 * v15;
  ATXProbability(v5[51], *(double *)(*(_QWORD *)(a1 + 32) + 536));
  v18 = v17;
  v19 = log2(v17);
  if (v18 <= 0.0)
    v19 = 0.0;
  v5[139] = v5[139] - v19 * v18;
  ATXProbability(v5[93], *(double *)(*(_QWORD *)(a1 + 32) + 544));
  v21 = v20;
  v22 = log2(v20);
  if (v21 <= 0.0)
    v22 = 0.0;
  v5[140] = v5[140] - v22 * v21;
  ATXProbability(v5[95], *(double *)(*(_QWORD *)(a1 + 32) + 552));
  v24 = v23;
  v25 = log2(v23);
  if (v24 <= 0.0)
    v25 = 0.0;
  v5[141] = v5[141] - v25 * v24;
  objc_msgSend(v5, "_updateTimeOfDayBudgetStatisticsForNewTimeOfDayBudget:", v5[79]);

}

- (id)statisticsForActionKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int64_t v17;
  int64_t v18;
  void *v19;
  void *v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previousLOIAndCurrentLOI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "first");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "second");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D80E08], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getCurrentActivity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "getCurrentLocation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "locationEnabled");

  v17 = +[ATXPrivacyPreservingLocationHash privacyPreservingGeohashForLocation:locationEnabled:](ATXPrivacyPreservingLocationHash, "privacyPreservingGeohashForLocation:locationEnabled:", v14, v16);
  v18 = +[ATXPrivacyPreservingLocationHash privacyPreservingCoarseGeohashForLocation:locationEnabled:](ATXPrivacyPreservingLocationHash, "privacyPreservingCoarseGeohashForLocation:locationEnabled:", v14, v16);
  v19 = (void *)objc_opt_new();
  -[ATXSlotResolution statisticsForActionKey:currentDate:previousLocationUUID:currentLocationUUID:currentMotionType:currentGeohash:currentCoarseGeohash:](self, "statisticsForActionKey:currentDate:previousLocationUUID:currentLocationUUID:currentMotionType:currentGeohash:currentCoarseGeohash:", v4, v19, v8, v10, objc_msgSend(v12, "motiontype"), v17, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)statisticsForActionKey:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v5 = a4;
  objc_msgSend(v5, "timeContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationMotionContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "previousLOI");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "uuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationMotionContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "currentLOI");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationMotionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "motionType");
  objc_msgSend(v5, "locationMotionContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "geohash");
  objc_msgSend(v5, "locationMotionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSlotResolution statisticsForActionKey:currentDate:previousLocationUUID:currentLocationUUID:currentMotionType:currentGeohash:currentCoarseGeohash:](self, "statisticsForActionKey:currentDate:previousLocationUUID:currentLocationUUID:currentMotionType:currentGeohash:currentCoarseGeohash:", v22, v21, v18, v6, v8, v10, objc_msgSend(v11, "coarseGeohash"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)statisticsForActionKey:(id)a3 currentDate:(id)a4 previousLocationUUID:(id)a5 currentLocationUUID:(id)a6 currentMotionType:(int64_t)a7 currentGeohash:(int64_t)a8 currentCoarseGeohash:(int64_t)a9
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  ATXSlotResolutionStatistics *v27;
  void *v28;
  void *v29;
  void *v31;
  id v32;
  id v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v33 = a4;
  v32 = a5;
  v15 = a6;
  +[_ATXActionUtils getBundleIdAndActionTypeFromActionKey:](_ATXActionUtils, "getBundleIdAndActionTypeFromActionKey:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "first");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "second");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v17)
    v20 = v18 == 0;
  else
    v20 = 1;
  if (v20)
  {
    __atxlog_handle_action_prediction();
    v21 = objc_claimAutoreleasedReturnValue();
    v29 = v33;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v14;
      _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_DEFAULT, "Error parsing '%@'", buf, 0xCu);
    }

    v27 = -[ATXSlotResolutionStatistics initWithActionKey:]([ATXSlotResolutionStatistics alloc], "initWithActionKey:", v14);
  }
  else
  {
    v22 = MEMORY[0x1CAA48B6C]();
    v23 = v15;
    v24 = (void *)v22;
    v31 = v23;
    -[ATXSlotResolution fastStatisticsOnSlotsForBundleId:actionType:currentDate:previousLocationUUID:currentLocationUUID:currentMotionType:currentGeohash:currentCoarseGeohash:](self, "fastStatisticsOnSlotsForBundleId:actionType:currentDate:previousLocationUUID:currentLocationUUID:currentMotionType:currentGeohash:currentCoarseGeohash:", v17, v19, v33, v32, a8, a9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXSlotResolution updateStatisticsWithFeedbackForBundleId:actionType:statistics:currentDate:currentGeohash:currentCoarseGeohash:](self, "updateStatisticsWithFeedbackForBundleId:actionType:statistics:currentDate:currentGeohash:currentCoarseGeohash:", v17, v19, v25, v33, a8, a9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[ATXSlotResolution updateStatisticsWithHigherLevelFeaturesForStatistics:](self, "updateStatisticsWithHigherLevelFeaturesForStatistics:", v26);
    v27 = (ATXSlotResolutionStatistics *)objc_claimAutoreleasedReturnValue();

    v28 = v24;
    v15 = v31;
    v29 = v33;
    objc_autoreleasePoolPop(v28);
  }

  return v27;
}

- (id)actionPredictionsForStatistics:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[ATXSlotResolution actionPredictionsForStatistics:appActionPredictionItem:appActionLogProbability:scoreLogger:currentDate:](self, "actionPredictionsForStatistics:appActionPredictionItem:appActionLogProbability:scoreLogger:currentDate:", v4, 0, 0, v5, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)actionPredictionsForStatistics:(id)a3 appActionPredictionItem:(const ATXPredictionItem *)a4 appActionLogProbability:(double)a5 scoreLogger:(id)a6 currentDate:(id)a7
{
  _QWORD *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t i;
  const ATXPredictionItem *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  _QWORD v26[4];
  _QWORD *v27;
  id v28;
  id v29;
  id v30;
  ATXSlotResolution *v31;
  id v32;
  _QWORD *v33;
  const ATXPredictionItem *v34;
  double v35;
  _QWORD v36[5];
  id v37;
  _BYTE buf[3276];
  float v39;
  __int16 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  +[_ATXActionUtils getBundleIdFromActionKey:](_ATXActionUtils, "getBundleIdFromActionKey:", v12[1]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    *(_QWORD *)buf = 0;
    v39 = -31337.0;
    v40 = 0;
    for (i = 16; i != 3284; i += 4)
      *(float *)&buf[i] = -31337.0;
    if (a4)
      v17 = a4;
    else
      v17 = (const ATXPredictionItem *)buf;
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x3032000000;
    v36[3] = __Block_byref_object_copy__31;
    v36[4] = __Block_byref_object_dispose__31;
    v37 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D815C8]), "initWithCountLimit:", 2);
    v18 = (void *)objc_opt_new();
    v19 = (void *)v12[2];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __124__ATXSlotResolution_actionPredictionsForStatistics_appActionPredictionItem_appActionLogProbability_scoreLogger_currentDate___block_invoke;
    v26[3] = &unk_1E82DF7E8;
    v27 = v12;
    v28 = v13;
    v34 = v17;
    v35 = a5;
    v29 = v14;
    v33 = v36;
    v30 = v15;
    v31 = self;
    v20 = v18;
    v32 = v20;
    objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v26);
    v21 = v32;
    v22 = v20;

    _Block_object_dispose(v36, 8);
  }
  else
  {
    __atxlog_handle_action_prediction();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v12[1];
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v24;
      _os_log_impl(&dword_1C9A3B000, v23, OS_LOG_TYPE_DEFAULT, "Error parsing '%@'", buf, 0xCu);
    }

    v22 = (id)MEMORY[0x1E0C9AA60];
  }

  return v22;
}

void __124__ATXSlotResolution_actionPredictionsForStatistics_appActionPredictionItem_appActionLogProbability_scoreLogger_currentDate___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id *v11;
  id v12;
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
  double v56;
  double v57;
  double v58;
  double v59;
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
  double v71;
  double v72;
  void *v73;
  void *v74;
  double *v75;
  double v76;
  void *v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  double v82;
  double v83;
  float v84;
  ATXActionPredictionContainer *v85;
  double v86;
  ATXActionPredictionContainer *v87;
  id v88;
  void *v89;
  id v90;
  id v91;
  id v92;
  id v93;
  _BYTE v94[3282];
  id v95;
  _QWORD v96[411];
  _QWORD v97[3];

  v2 = MEMORY[0x1E0C80A78](a1, a2);
  v4 = v3;
  v5 = v2;
  v97[1] = *MEMORY[0x1E0C80C00];
  v92 = v6;
  v7 = v4;
  v90 = *(id *)(*(_QWORD *)(v5 + 32) + 8);
  if (*(_QWORD *)(v5 + 40))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ActionKey: %@\nSlotSet Hash: %lu\nParameter Hash: %lu"), *(_QWORD *)(*(_QWORD *)(v5 + 32) + 8), objc_msgSend(v92, "slotHash"), objc_msgSend(v92, "hash"));
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v9 = (void *)v8;

      v10 = v9;
      goto LABEL_9;
    }
    if (*(_QWORD *)(v5 + 40))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%tu"), *(_QWORD *)(*(_QWORD *)(v5 + 32) + 8), objc_msgSend(v92, "hash"));
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      }
    }
  }
  v10 = v90;
LABEL_9:
  v11 = *(id **)(v5 + 88);
  v12 = *v11;
  memcpy(v96, v11 + 1, 0xCD2uLL);
  v91 = v10;
  v95 = v91;

  v96[0] = objc_msgSend(v92, "hash");
  ATXSetInput((uint64_t)&v95, 0x17DuLL, *(float *)(*(_QWORD *)(v5 + 88) + 3284));
  ATXSetInput((uint64_t)&v95, 0x17EuLL, *(double *)(v5 + 96));
  ATXProbability(*((double *)v7 + 29), *(double *)(*(_QWORD *)(v5 + 32) + 32));
  ATXSetInput((uint64_t)&v95, 0xBBuLL, v13);
  ATXSmoothedProbability(*((double *)v7 + 46), *((double *)v7 + 30));
  ATXSetInput((uint64_t)&v95, 0xD0uLL, v14);
  ATXProbability(*((double *)v7 + 47), *(double *)(*(_QWORD *)(v5 + 32) + 56));
  ATXSetInput((uint64_t)&v95, 0xBDuLL, v15);
  ATXProbability(*((double *)v7 + 48), *(double *)(*(_QWORD *)(v5 + 32) + 64));
  ATXSetInput((uint64_t)&v95, 0xBEuLL, v16);
  ATXProbability(*((double *)v7 + 49), *(double *)(*(_QWORD *)(v5 + 32) + 72));
  ATXSetInput((uint64_t)&v95, 0xBFuLL, v17);
  ATXSetInput((uint64_t)&v95, 0xE1uLL, *((double *)v7 + 46));
  ATXSetInput((uint64_t)&v95, 0xE5uLL, *((double *)v7 + 47));
  ATXSetInput((uint64_t)&v95, 0xE6uLL, *((double *)v7 + 48));
  ATXSetInput((uint64_t)&v95, 0xE7uLL, *((double *)v7 + 49));
  ATXProbability(*((double *)v7 + 46), *(double *)(*(_QWORD *)(v5 + 32) + 48));
  ATXSetInput((uint64_t)&v95, 0xBCuLL, v18);
  ATXSmoothedProbability(*((double *)v7 + 51), *((double *)v7 + 31));
  ATXSetInput((uint64_t)&v95, 0xD2uLL, v19);
  ATXSmoothedProbability(*((double *)v7 + 52), *((double *)v7 + 32));
  ATXSetInput((uint64_t)&v95, 0xD3uLL, v20);
  ATXSmoothedProbability(*((double *)v7 + 53), *((double *)v7 + 44));
  ATXSetInput((uint64_t)&v95, 0xD4uLL, v21);
  ATXProbability(*((double *)v7 + 53), *(double *)(*(_QWORD *)(v5 + 32) + 296));
  ATXSetInput((uint64_t)&v95, 0xC2uLL, v22);
  ATXSetInput((uint64_t)&v95, 0xE2uLL, *((double *)v7 + 51));
  ATXSetInput((uint64_t)&v95, 0xE3uLL, *((double *)v7 + 52));
  ATXProbability(*((double *)v7 + 51), *(double *)(*(_QWORD *)(v5 + 32) + 88));
  ATXSetInput((uint64_t)&v95, 0xC0uLL, v23);
  ATXProbability(*((double *)v7 + 52), *(double *)(*(_QWORD *)(v5 + 32) + 96));
  ATXSetInput((uint64_t)&v95, 0xC1uLL, v24);
  ATXSmoothedProbability(*((double *)v7 + 50), *((double *)v7 + 30));
  ATXSetInput((uint64_t)&v95, 0xD1uLL, v25);
  ATXSetInput((uint64_t)&v95, 0xE4uLL, *((double *)v7 + 50));
  ATXProbability(*((double *)v7 + 50), *(double *)(*(_QWORD *)(v5 + 32) + 80));
  ATXSetInput((uint64_t)&v95, 0xC3uLL, v26);
  ATXSetInputAge((uint64_t)&v95, 0xFBuLL, *((void **)v7 + 7), *(void **)(v5 + 48));
  ATXSmoothedProbability(*((double *)v7 + 54), *((double *)v7 + 33));
  ATXSetInput((uint64_t)&v95, 0xD5uLL, v27);
  ATXSetInput((uint64_t)&v95, 0xE8uLL, *((double *)v7 + 54));
  ATXProbability(*((double *)v7 + 54), *(double *)(*(_QWORD *)(v5 + 32) + 104));
  ATXSetInput((uint64_t)&v95, 0xC4uLL, v28);
  ATXSmoothedProbability(*((double *)v7 + 56), *((double *)v7 + 34));
  ATXSetInput((uint64_t)&v95, 0xD7uLL, v29);
  ATXSetInput((uint64_t)&v95, 0xEAuLL, *((double *)v7 + 56));
  ATXProbability(*((double *)v7 + 56), *(double *)(*(_QWORD *)(v5 + 32) + 120));
  ATXSetInput((uint64_t)&v95, 0xC6uLL, v30);
  ATXSmoothedProbability(*((double *)v7 + 55), *((double *)v7 + 35));
  ATXSetInput((uint64_t)&v95, 0xD6uLL, v31);
  ATXSetInput((uint64_t)&v95, 0xE9uLL, *((double *)v7 + 55));
  ATXProbability(*((double *)v7 + 55), *(double *)(*(_QWORD *)(v5 + 32) + 112));
  ATXSetInput((uint64_t)&v95, 0xC5uLL, v32);
  ATXSetInput((uint64_t)&v95, 0x101uLL, (double)*((int *)v7 + 6));
  ATXSetInput((uint64_t)&v95, 0xFFuLL, *((double *)v7 + 29));
  *(float *)&v33 = ATXSetInput((uint64_t)&v95, 0xFDuLL, (double)*((int *)v7 + 2));
  *(float *)&v34 = ATXSetInput((uint64_t)&v95, 0xBAuLL, (double)(unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(v5 + 32) + 128), "count", v33));
  ATXSetInput((uint64_t)&v95, 0xFEuLL, (double)(unint64_t)objc_msgSend(*((id *)v7 + 5), "count", v34));
  *(float *)&v35 = ATXSetInput((uint64_t)&v95, 0x107uLL, *((double *)v7 + 75));
  objc_msgSend(v7, "_timeOfDayBudgetStandardDeviation", v35);
  ATXSetInput((uint64_t)&v95, 0x108uLL, v36);
  ATXSetInput((uint64_t)&v95, 0x109uLL, *((double *)v7 + 78));
  ATXSetInput((uint64_t)&v95, 0xB9uLL, *(double *)(*(_QWORD *)(v5 + 32) + 32));
  ATXSetInput((uint64_t)&v95, 0xB8uLL, (double)*(int *)(*(_QWORD *)(v5 + 32) + 40));
  ATXSetInput((uint64_t)&v95, 0xEBuLL, *((double *)v7 + 30));
  ATXSetInput((uint64_t)&v95, 0xECuLL, *((double *)v7 + 31));
  ATXSetInput((uint64_t)&v95, 0xEDuLL, *((double *)v7 + 33));
  ATXSetInput((uint64_t)&v95, 0xEEuLL, *((double *)v7 + 35));
  ATXSetInput((uint64_t)&v95, 0xEFuLL, *((double *)v7 + 34));
  ATXSetInput((uint64_t)&v95, 0xF0uLL, *((double *)v7 + 32));
  ATXSetInput((uint64_t)&v95, 0xF1uLL, *((double *)v7 + 36));
  ATXSetInput((uint64_t)&v95, 0xF2uLL, *((double *)v7 + 37));
  ATXSetInput((uint64_t)&v95, 0xF3uLL, *((double *)v7 + 38));
  ATXSetInput((uint64_t)&v95, 0xF4uLL, *((double *)v7 + 39));
  ATXSetInput((uint64_t)&v95, 0xF5uLL, *((double *)v7 + 41));
  ATXSetInput((uint64_t)&v95, 0xF6uLL, *((double *)v7 + 40));
  ATXSetInput((uint64_t)&v95, 0xF7uLL, *((double *)v7 + 42));
  ATXSetInput((uint64_t)&v95, 0xF8uLL, *((double *)v7 + 43));
  ATXSetInput((uint64_t)&v95, 0xF9uLL, *((double *)v7 + 44));
  ATXSetInput((uint64_t)&v95, 0xFAuLL, *((double *)v7 + 45));
  ATXProbability(*((double *)v7 + 58), *(double *)(*(_QWORD *)(v5 + 32) + 240));
  ATXSetInput((uint64_t)&v95, 0xC7uLL, v37);
  ATXSmoothedProbability(*((double *)v7 + 58), *((double *)v7 + 36));
  ATXSetInput((uint64_t)&v95, 0xD8uLL, v38);
  ATXProbability(*((double *)v7 + 65), *(double *)(*(_QWORD *)(v5 + 32) + 304));
  ATXSetInput((uint64_t)&v95, 0xCFuLL, v39);
  ATXSmoothedProbability(*((double *)v7 + 65), *((double *)v7 + 45));
  ATXSetInput((uint64_t)&v95, 0xE0uLL, v40);
  ATXProbability(*((double *)v7 + 57), *(double *)(*(_QWORD *)(v5 + 32) + 232));
  ATXSetInput((uint64_t)&v95, 0xC8uLL, v41);
  ATXSmoothedProbability(*((double *)v7 + 57), *((double *)v7 + 37));
  ATXSetInput((uint64_t)&v95, 0xD9uLL, v42);
  ATXProbability(*((double *)v7 + 59), *(double *)(*(_QWORD *)(v5 + 32) + 248));
  ATXSetInput((uint64_t)&v95, 0xC9uLL, v43);
  ATXSmoothedProbability(*((double *)v7 + 59), *((double *)v7 + 38));
  ATXSetInput((uint64_t)&v95, 0xDAuLL, v44);
  ATXProbability(*((double *)v7 + 60), *(double *)(*(_QWORD *)(v5 + 32) + 256));
  ATXSetInput((uint64_t)&v95, 0xCAuLL, v45);
  ATXSmoothedProbability(*((double *)v7 + 60), *((double *)v7 + 39));
  ATXSetInput((uint64_t)&v95, 0xDBuLL, v46);
  ATXProbability(*((double *)v7 + 62), *(double *)(*(_QWORD *)(v5 + 32) + 272));
  ATXSetInput((uint64_t)&v95, 0xCCuLL, v47);
  ATXSmoothedProbability(*((double *)v7 + 62), *((double *)v7 + 41));
  ATXSetInput((uint64_t)&v95, 0xDDuLL, v48);
  ATXProbability(*((double *)v7 + 61), *(double *)(*(_QWORD *)(v5 + 32) + 264));
  ATXSetInput((uint64_t)&v95, 0xCBuLL, v49);
  ATXSmoothedProbability(*((double *)v7 + 61), *((double *)v7 + 40));
  ATXSetInput((uint64_t)&v95, 0xDCuLL, v50);
  ATXProbability(*((double *)v7 + 63), *(double *)(*(_QWORD *)(v5 + 32) + 280));
  ATXSetInput((uint64_t)&v95, 0xCDuLL, v51);
  ATXSmoothedProbability(*((double *)v7 + 63), *((double *)v7 + 42));
  ATXSetInput((uint64_t)&v95, 0xDEuLL, v52);
  ATXProbability(*((double *)v7 + 64), *(double *)(*(_QWORD *)(v5 + 32) + 288));
  ATXSetInput((uint64_t)&v95, 0xCEuLL, v53);
  ATXSmoothedProbability(*((double *)v7 + 64), *((double *)v7 + 43));
  *(float *)&v55 = ATXSetInput((uint64_t)&v95, 0xDFuLL, v54);
  objc_msgSend(v7, "_confirmRatio", v55);
  ATXSetInput((uint64_t)&v95, 0x110uLL, v56);
  ATXSetInput((uint64_t)&v95, 0x10AuLL, *((double *)v7 + 8));
  ATXSetInput((uint64_t)&v95, 0x10BuLL, *((double *)v7 + 9));
  ATXSetInput((uint64_t)&v95, 0x10CuLL, *((double *)v7 + 10));
  ATXSetInput((uint64_t)&v95, 0x10DuLL, *(double *)(*(_QWORD *)(v5 + 32) + 136));
  ATXSetInput((uint64_t)&v95, 0x10EuLL, *(double *)(*(_QWORD *)(v5 + 32) + 144));
  ATXSetInput((uint64_t)&v95, 0x10FuLL, *(double *)(*(_QWORD *)(v5 + 32) + 152));
  *(float *)&v57 = ATXSetInput((uint64_t)&v95, 0x112uLL, *(double *)(*(_QWORD *)(v5 + 32) + 736));
  objc_msgSend(*(id *)(v5 + 32), "_totalConfirmRatioStandardDeviation", v57);
  ATXSetInput((uint64_t)&v95, 0x111uLL, v58);
  ATXSetInput((uint64_t)&v95, 0x113uLL, (double)*(int *)(*(_QWORD *)(v5 + 32) + 728));
  ATXSetInput((uint64_t)&v95, 0x114uLL, *((double *)v7 + 16));
  ATXSetInput((uint64_t)&v95, 0x115uLL, *((double *)v7 + 11));
  ATXSetInput((uint64_t)&v95, 0x116uLL, *((double *)v7 + 12));
  ATXSetInput((uint64_t)&v95, 0x117uLL, *((double *)v7 + 17));
  ATXSetInput((uint64_t)&v95, 0x118uLL, *((double *)v7 + 18));
  ATXSetInput((uint64_t)&v95, 0x119uLL, *((double *)v7 + 19));
  ATXSetInput((uint64_t)&v95, 0x11AuLL, *((double *)v7 + 20));
  ATXSetInput((uint64_t)&v95, 0x11BuLL, *((double *)v7 + 21));
  ATXSetInput((uint64_t)&v95, 0x11CuLL, *((double *)v7 + 22));
  ATXSetInput((uint64_t)&v95, 0x11DuLL, *((double *)v7 + 23));
  ATXSetInput((uint64_t)&v95, 0x11EuLL, *((double *)v7 + 24));
  ATXSetInput((uint64_t)&v95, 0x123uLL, *(double *)(*(_QWORD *)(v5 + 32) + 160));
  ATXSetInput((uint64_t)&v95, 0x124uLL, *(double *)(*(_QWORD *)(v5 + 32) + 168));
  ATXSetInput((uint64_t)&v95, 0x11FuLL, *((double *)v7 + 66));
  ATXSetInput((uint64_t)&v95, 0x120uLL, *((double *)v7 + 67));
  ATXSetInput((uint64_t)&v95, 0x121uLL, *((double *)v7 + 68));
  ATXSetInput((uint64_t)&v95, 0x122uLL, *((double *)v7 + 69));
  ATXSetInput((uint64_t)&v95, 0x125uLL, *((double *)v7 + 25));
  ATXSetInput((uint64_t)&v95, 0x126uLL, *((double *)v7 + 26));
  ATXSetInput((uint64_t)&v95, 0x127uLL, *((double *)v7 + 13));
  ATXSetInput((uint64_t)&v95, 0x128uLL, *((double *)v7 + 14));
  ATXSetInput((uint64_t)&v95, 0x129uLL, *((double *)v7 + 15));
  ATXSetInput((uint64_t)&v95, 0x12AuLL, *((double *)v7 + 27));
  ATXSetInput((uint64_t)&v95, 0x12BuLL, *((double *)v7 + 28));
  ATXSetInput((uint64_t)&v95, 0x130uLL, *(double *)(*(_QWORD *)(v5 + 32) + 200));
  ATXSetInput((uint64_t)&v95, 0x131uLL, *(double *)(*(_QWORD *)(v5 + 32) + 208));
  ATXSetInput((uint64_t)&v95, 0x132uLL, *(double *)(*(_QWORD *)(v5 + 32) + 216));
  ATXSetInput((uint64_t)&v95, 0x133uLL, *(double *)(*(_QWORD *)(v5 + 32) + 224));
  ATXSetInput((uint64_t)&v95, 0x12CuLL, *((double *)v7 + 70));
  ATXSetInput((uint64_t)&v95, 0x12DuLL, *((double *)v7 + 71));
  ATXSetInput((uint64_t)&v95, 0x12EuLL, *((double *)v7 + 72));
  ATXSetInput((uint64_t)&v95, 0x12FuLL, *((double *)v7 + 73));
  ATXSetInput((uint64_t)&v95, 0x1A5uLL, *((double *)v7 + 80));
  ATXSetInput((uint64_t)&v95, 0x1A7uLL, *((double *)v7 + 81));
  ATXSetInput((uint64_t)&v95, 0x1A9uLL, *((double *)v7 + 82));
  ATXSetInput((uint64_t)&v95, 0x1ABuLL, *((double *)v7 + 83));
  ATXSetInput((uint64_t)&v95, 0x1ADuLL, *((double *)v7 + 84));
  ATXSetInput((uint64_t)&v95, 0x1AFuLL, *((double *)v7 + 85));
  ATXSetInput((uint64_t)&v95, 0x1B1uLL, *((double *)v7 + 86));
  ATXSetInput((uint64_t)&v95, 0x1B3uLL, *((double *)v7 + 87));
  ATXSetInput((uint64_t)&v95, 0x1B5uLL, *((double *)v7 + 88));
  ATXSetInput((uint64_t)&v95, 0x1B7uLL, *((double *)v7 + 89));
  ATXSetInput((uint64_t)&v95, 0x1B9uLL, *((double *)v7 + 90));
  ATXSetInput((uint64_t)&v95, 0x1BBuLL, *((double *)v7 + 91));
  ATXSetInput((uint64_t)&v95, 0x232uLL, *((double *)v7 + 48));
  ATXSetInput((uint64_t)&v95, 0x234uLL, *((double *)v7 + 97));
  ATXSetInput((uint64_t)&v95, 0x229uLL, *((double *)v7 + 51));
  ATXSetInput((uint64_t)&v95, 0x22BuLL, *((double *)v7 + 92));
  ATXSetInput((uint64_t)&v95, 0x22CuLL, *((double *)v7 + 93));
  ATXSetInput((uint64_t)&v95, 0x22EuLL, *((double *)v7 + 94));
  ATXSetInput((uint64_t)&v95, 0x22FuLL, *((double *)v7 + 95));
  ATXSetInput((uint64_t)&v95, 0x231uLL, *((double *)v7 + 96));
  ATXSetInput((uint64_t)&v95, 0x235uLL, *((double *)v7 + 98));
  ATXSetInput((uint64_t)&v95, 0x237uLL, *((double *)v7 + 99));
  ATXSetInput((uint64_t)&v95, 0x238uLL, *((double *)v7 + 100));
  ATXSetInput((uint64_t)&v95, 0x23AuLL, *((double *)v7 + 101));
  ATXSetInput((uint64_t)&v95, 0x23BuLL, *((double *)v7 + 102));
  ATXSetInput((uint64_t)&v95, 0x23DuLL, *((double *)v7 + 103));
  ATXSetInput((uint64_t)&v95, 0x23EuLL, *((double *)v7 + 104));
  ATXSetInput((uint64_t)&v95, 0x240uLL, *((double *)v7 + 105));
  ATXSetInput((uint64_t)&v95, 0x241uLL, *((double *)v7 + 106));
  ATXSetInput((uint64_t)&v95, 0x243uLL, *((double *)v7 + 107));
  ATXSetInput((uint64_t)&v95, 0x244uLL, *((double *)v7 + 108));
  ATXSetInput((uint64_t)&v95, 0x246uLL, *((double *)v7 + 109));
  ATXSetInput((uint64_t)&v95, 0x247uLL, *((double *)v7 + 110));
  ATXSetInput((uint64_t)&v95, 0x249uLL, *((double *)v7 + 111));
  ATXSetInput((uint64_t)&v95, 0x24AuLL, *((double *)v7 + 112));
  ATXSetInput((uint64_t)&v95, 0x24CuLL, *((double *)v7 + 113));
  ATXSetInput((uint64_t)&v95, 0x302uLL, *((double *)v7 + 114));
  ATXSetInput((uint64_t)&v95, 0x305uLL, *((double *)v7 + 118));
  ATXSetInput((uint64_t)&v95, 0x308uLL, *((double *)v7 + 122));
  ATXSetInput((uint64_t)&v95, 0x30BuLL, *((double *)v7 + 126));
  ATXSetInput((uint64_t)&v95, 0x30EuLL, *((double *)v7 + 130));
  ATXSetInput((uint64_t)&v95, 0x311uLL, *((double *)v7 + 134));
  ATXSetInput((uint64_t)&v95, 0x314uLL, *((double *)v7 + 116));
  ATXSetInput((uint64_t)&v95, 0x317uLL, *((double *)v7 + 120));
  ATXSetInput((uint64_t)&v95, 0x31AuLL, *((double *)v7 + 124));
  ATXSetInput((uint64_t)&v95, 0x31DuLL, *((double *)v7 + 128));
  ATXSetInput((uint64_t)&v95, 0x320uLL, *((double *)v7 + 132));
  ATXSetInput((uint64_t)&v95, 0x323uLL, *((double *)v7 + 136));
  ATXSetInput((uint64_t)&v95, 0x304uLL, *((double *)v7 + 115));
  ATXSetInput((uint64_t)&v95, 0x307uLL, *((double *)v7 + 119));
  ATXSetInput((uint64_t)&v95, 0x30AuLL, *((double *)v7 + 123));
  ATXSetInput((uint64_t)&v95, 0x30DuLL, *((double *)v7 + 127));
  ATXSetInput((uint64_t)&v95, 0x310uLL, *((double *)v7 + 131));
  ATXSetInput((uint64_t)&v95, 0x313uLL, *((double *)v7 + 135));
  ATXSetInput((uint64_t)&v95, 0x316uLL, *((double *)v7 + 117));
  ATXSetInput((uint64_t)&v95, 0x319uLL, *((double *)v7 + 121));
  ATXSetInput((uint64_t)&v95, 0x31CuLL, *((double *)v7 + 125));
  ATXSetInput((uint64_t)&v95, 0x31FuLL, *((double *)v7 + 129));
  ATXSetInput((uint64_t)&v95, 0x322uLL, *((double *)v7 + 133));
  *(float *)&v59 = ATXSetInput((uint64_t)&v95, 0x325uLL, *((double *)v7 + 137));
  objc_msgSend(*((id *)v7 + 145), "allValues", v59);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)v7 + 144), "allValues");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", *((_QWORD *)v7 + 143));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXSlotResolution setDistributionBasedScoreInputsForTimeOfDayForItem:withLaunchDistribution:](ATXSlotResolution, "setDistributionBasedScoreInputsForTimeOfDayForItem:withLaunchDistribution:", &v95, v61);

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", *((_QWORD *)v7 + 142));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXSlotResolution setDistributionBasedScoreInputsForDayOfWeekForItem:withLaunchDistribution:](ATXSlotResolution, "setDistributionBasedScoreInputsForDayOfWeekForItem:withLaunchDistribution:", &v95, v62);

  +[ATXSlotResolution setDistributionBasedScoreInputsForItem:withGeoHashResolution:withLaunchCounts:](ATXSlotResolution, "setDistributionBasedScoreInputsForItem:withGeoHashResolution:withLaunchCounts:", &v95, 0, v89);
  +[ATXSlotResolution setDistributionBasedScoreInputsForItem:withGeoHashResolution:withLaunchCounts:](ATXSlotResolution, "setDistributionBasedScoreInputsForItem:withGeoHashResolution:withLaunchCounts:", &v95, 1, v60);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v5 + 80) + 8) + 40), "objectForKey:", *(_QWORD *)(v5 + 56));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v62) = v63 == 0;

  if ((_DWORD)v62)
  {
    v64 = *(void **)(*(_QWORD *)(*(_QWORD *)(v5 + 80) + 8) + 40);
    v65 = (void *)MEMORY[0x1E0CB37E8];
    +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "histogramForLaunchType:", 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v97[0] = *(_QWORD *)(v5 + 56);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 1);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "totalLaunchesForBundleIds:", v68);
    objc_msgSend(v65, "numberWithDouble:");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setObject:forKey:", v69, *(_QWORD *)(v5 + 56));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v5 + 80) + 8) + 40), "objectForKey:", *(_QWORD *)(v5 + 56));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "doubleValue");
  ATXSetInput((uint64_t)&v95, 0x103uLL, v71 + 1.0);

  ATXSetInput((uint64_t)&v95, 0x104uLL, *((double *)v7 + 74));
  *(float *)&v72 = ATXSetInput((uint64_t)&v95, 0x102uLL, -31337.0);
  v73 = *(void **)(*(_QWORD *)(v5 + 32) + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v92, "slotHash", v72));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "objectForKeyedSubscript:", v74);
  v75 = (double *)objc_claimAutoreleasedReturnValue();

  ATXSetInput((uint64_t)&v95, 0x105uLL, v75[1]);
  ATXSetInput((uint64_t)&v95, 0x286uLL, *((double *)v7 + 138));
  ATXSetInput((uint64_t)&v95, 0x287uLL, *((double *)v7 + 139));
  ATXSetInput((uint64_t)&v95, 0x288uLL, *((double *)v7 + 140));
  ATXSetInput((uint64_t)&v95, 0x289uLL, *((double *)v7 + 141));
  *(float *)&v76 = ATXSetInput((uint64_t)&v95, 0x106uLL, v75[2]);
  +[ATXActionLOIBoost sharedInstance](ATXActionLOIBoost, "sharedInstance", v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "boostForActionKey:", *(_QWORD *)(*(_QWORD *)(v5 + 32) + 8));
  ATXSetInput((uint64_t)&v95, 0x100uLL, v78);

  *(float *)&v79 = ATXSetInput((uint64_t)&v95, 0xFCuLL, (double)(+[ATXSlotResolution isNotLaunchedWithinShortTimeSpan:](ATXSlotResolution, "isNotLaunchedWithinShortTimeSpan:", v7) ^ 1));
  +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance", v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setupScoreLogger:forConsumerSubType:", *(_QWORD *)(v5 + 40), 25);

  +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "_predictionScoreAndUpdateConfidenceForItem:interpreter:consumerSubType:scoreLogger:intentType:", &v95, *(_QWORD *)(*(_QWORD *)(v5 + 64) + 16), 25, *(_QWORD *)(v5 + 40), 0);
  v83 = v82;

  v84 = v83;
  *((float *)&v96[409] + 1) = v84;
  ATXSetInput((uint64_t)&v95, 0x17FuLL, v83);
  v85 = [ATXActionPredictionContainer alloc];
  *(float *)&v86 = v83;
  v87 = -[ATXActionPredictionContainer initWithMinimalSlotResolutionParameters:score:actionKey:](v85, "initWithMinimalSlotResolutionParameters:score:actionKey:", v92, *(_QWORD *)(*(_QWORD *)(v5 + 32) + 8), v86);
  v88 = v95;
  v93 = v88;
  memcpy(v94, v96, sizeof(v94));
  if (v87)
    -[ATXActionPredictionContainer setPredictionItem:](v87, "setPredictionItem:", &v93);
  else

  objc_msgSend(*(id *)(v5 + 72), "addObject:", v87);
}

+ (void)setDistributionBasedScoreInputsForTimeOfDayForItem:(ATXPredictionItem *)a3 withLaunchDistribution:(id)a4
{
  uint64_t i;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  v12 = a4;
  for (i = 0; i != 25; ++i)
  {
    v6 = (void *)MEMORY[0x1CAA48B6C]();
    v7 = +[_ATXScoreTypes mappingForTimeOfDayDistributionSignals:forScoreInputCategory:](_ATXScoreTypes, "mappingForTimeOfDayDistributionSignals:forScoreInputCategory:", i, 1);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    ATXSetInput((uint64_t)a3, v7, v11);
    objc_autoreleasePoolPop(v6);
  }

}

+ (void)setDistributionBasedScoreInputsForDayOfWeekForItem:(ATXPredictionItem *)a3 withLaunchDistribution:(id)a4
{
  uint64_t i;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  v12 = a4;
  for (i = 0; i != 7; ++i)
  {
    v6 = (void *)MEMORY[0x1CAA48B6C]();
    v7 = +[_ATXScoreTypes mappingForDayOfWeekDistributionSignals:forScoreInputCategory:](_ATXScoreTypes, "mappingForDayOfWeekDistributionSignals:forScoreInputCategory:", i, 1);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    ATXSetInput((uint64_t)a3, v7, v11);
    objc_autoreleasePoolPop(v6);
  }

}

+ (void)setDistributionBasedScoreInputsForItem:(ATXPredictionItem *)a3 withGeoHashResolution:(unint64_t)a4 withLaunchCounts:(id)a5
{
  double v7;
  int v8;
  int *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unint64_t i;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v34 = a5;
  v8 = 0;
  if ((uint64_t)a4 <= 1)
  {
    if (a4)
    {
      if (a4 != 1)
        goto LABEL_11;
      *(float *)&v7 = ATXSetInput((uint64_t)a3, 0x28BuLL, (double)(unint64_t)objc_msgSend(v34, "count"));
      v9 = &kATXActionNumberOfScoreInputsForCoarseGeoHash;
    }
    else
    {
      *(float *)&v7 = ATXSetInput((uint64_t)a3, 0x28AuLL, (double)(unint64_t)objc_msgSend(v34, "count"));
      v9 = &kATXActionNumberOfScoreInputsForSpecificGeoHash;
    }
    v8 = *v9;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 0, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v35[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "sortedArrayUsingDescriptors:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    for (i = 0; ; ++i)
    {
      v21 = objc_msgSend(v19, "count");
      v22 = v21 >= v8 ? v8 : v21;
      if (i >= v22)
        break;
      v23 = (void *)MEMORY[0x1CAA48B6C]();
      v24 = +[_ATXScoreTypes mappingForTopRankedGeoHashSignalsWithResolution:withRank:forScoreInputCategory:](_ATXScoreTypes, "mappingForTopRankedGeoHashSignalsWithResolution:withRank:forScoreInputCategory:", a4, i, 1);
      objc_msgSend(v19, "objectAtIndex:", i);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "doubleValue");
      ATXSetInput((uint64_t)a3, v24, v26);

      objc_autoreleasePoolPop(v23);
    }

    goto LABEL_18;
  }
  if (a4 == 2)
  {
    __atxlog_handle_action_prediction();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[ATXSlotResolution setDistributionBasedScoreInputsForItem:withGeoHashResolution:withLaunchCounts:].cold.1(v10, v27, v28, v29, v30, v31, v32, v33);
  }
  else
  {
    if (a4 != 0xFFFFFFFF)
      goto LABEL_11;
    __atxlog_handle_action_prediction();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[ATXSlotResolution setDistributionBasedScoreInputsForItem:withGeoHashResolution:withLaunchCounts:].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);
  }
LABEL_18:

}

+ (BOOL)isNotLaunchedWithinShortTimeSpan:(id)a3
{
  _QWORD *v3;
  void *v4;
  double v5;
  BOOL v6;

  v3 = a3;
  if (+[ATXSlotResolution isNotLaunchedWithinShortTimeSpan:]::onceToken != -1)
    dispatch_once(&+[ATXSlotResolution isNotLaunchedWithinShortTimeSpan:]::onceToken, &__block_literal_global_68);
  v6 = 1;
  if (v3[6])
  {
    v4 = (void *)v3[7];
    if (v4)
    {
      objc_msgSend(v4, "timeIntervalSinceDate:");
      if (v5 <= (double)+[ATXSlotResolution isNotLaunchedWithinShortTimeSpan:]::minimumTimespanForOnceOffActions)
        v6 = 0;
    }
  }

  return v6;
}

void __54__ATXSlotResolution_isNotLaunchedWithinShortTimeSpan___block_invoke()
{
  id v0;

  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  +[ATXSlotResolution isNotLaunchedWithinShortTimeSpan:]::minimumTimespanForOnceOffActions = objc_msgSend(v0, "minimumTimespanForOnceOffActions");

}

+ (void)setSlotResolutionPredictionItemForTopUpcomingMediaActionContainer:(id)a3 appActionPredictionItem:(const ATXPredictionItem *)a4 appActionLogProbability:(double)a5
{
  double v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _BYTE v12[3282];
  id v13;
  _BYTE v14[3282];

  v5 = MEMORY[0x1E0C80A78](a1, a2);
  v7 = v6;
  v9 = v8;
  if (v7)
  {
    v13 = *(id *)v7;
    memcpy(v14, (const void *)(v7 + 8), sizeof(v14));
    ATXSetInput((uint64_t)&v13, 0x17DuLL, *(float *)(v7 + 3284));
    ATXSetInput((uint64_t)&v13, 0x17EuLL, v5);
    v10 = v13;
    v11 = v10;
    memcpy(v12, v14, sizeof(v12));
    if (v9)
      objc_msgSend(v9, "setPredictionItem:", &v11);
    else

  }
}

+ (void)setSlotLogProbabilityForCandidateActionPredictions:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  float v9;
  id v10;
  id v11;
  _BYTE v12[3282];
  id v13;
  _BYTE v14[3282];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  MEMORY[0x1E0C80A78](a1, a2);
  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        if (v8)
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v7), "predictionItem");
        else
          bzero(&v13, 0xCE0uLL);
        objc_msgSend(v8, "score", v11);
        ATXSetInput((uint64_t)&v13, 0x180uLL, v9);
        v10 = v13;
        v11 = v10;
        memcpy(v12, v14, sizeof(v12));
        if (v8)
          objc_msgSend(v8, "setPredictionItem:", &v11);
        else

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16, v11);
    }
    while (v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotResolutionInterpreter, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
}

+ (void)setDistributionBasedScoreInputsForItem:(uint64_t)a3 withGeoHashResolution:(uint64_t)a4 withLaunchCounts:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "GeoHash Resolution not supported in ATXSlotResolution: %lu", a5, a6, a7, a8, 0);
}

+ (void)setDistributionBasedScoreInputsForItem:(uint64_t)a3 withGeoHashResolution:(uint64_t)a4 withLaunchCounts:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "Unknown GeoHash Resolution: %lu", a5, a6, a7, a8, 0);
}

@end
