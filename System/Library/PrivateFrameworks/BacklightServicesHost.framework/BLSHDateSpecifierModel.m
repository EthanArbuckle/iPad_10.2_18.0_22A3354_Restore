@implementation BLSHDateSpecifierModel

- (BLSHDateSpecifierModel)initWithInactiveBudgetPolicy:(id)a3
{
  id v5;
  BLSHDateSpecifierModel *v6;
  BLSHDateSpecifierModel *v7;
  uint64_t v8;
  NSMapTable *environmentModels;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BLSHDateSpecifierModel;
  v6 = -[BLSHDateSpecifierModel init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_inactiveBudgetPolicy, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 512, 4);
    environmentModels = v7->_environmentModels;
    v7->_environmentModels = (NSMapTable *)v8;

  }
  return v7;
}

- (BOOL)missingAnySpecifiersInDateInterval:(id)a3 forPresentation:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a4, "presentationEntries", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "environment");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isAlwaysOnEnabledForEnvironment"))
        {
          -[BLSHDateSpecifierModel environmentModelForKey:]((uint64_t)self, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "dateInterval");
          v14 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "intersectionWithDateInterval:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          LOBYTE(v14) = objc_msgSend(v15, "isEqual:", v6);
          if ((v14 & 1) == 0)
          {

            v16 = 1;
            goto LABEL_12;
          }
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_12:

  return v16;
}

- (BLSHEnvironmentDatesModel)environmentModelForKey:(uint64_t)a1
{
  id v3;
  BLSHEnvironmentDatesModel *v4;

  v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    objc_msgSend(*(id *)(a1 + 16), "objectForKey:", v3);
    v4 = (BLSHEnvironmentDatesModel *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v4 = -[BLSHEnvironmentDatesModel initWithEnvironment:]([BLSHEnvironmentDatesModel alloc], "initWithEnvironment:", v3);
      objc_msgSend(*(id *)(a1 + 16), "setObject:forKey:", v4, v3);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)missingIntervalsForMinimumInterval:(id)a3 requestInterval:(id)a4 ofPresentation:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  BLSHDateSpecifierModel *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v31 = a4;
  v8 = a5;
  objc_msgSend(v8, "expirationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v7, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "compare:", v9);

    if (v11 == 1)
    {
      bls_flipbook_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v7, "bls_shortLoggingString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bls_shortLoggingString");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v39 = self;
        v40 = 2114;
        v41 = v27;
        v42 = 2114;
        v43 = v28;
        v44 = 2114;
        v45 = v8;
        _os_log_fault_impl(&dword_2145AC000, v12, OS_LOG_TYPE_FAULT, "%p minimumInterval:%{public}@ extends past expirationDate:%{public}@ for presentation:%{public}@", buf, 0x2Au);

      }
    }
  }
  v30 = v8;
  objc_msgSend(v8, "presentationEntries", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (!v14)
  {
    v16 = 0;
    goto LABEL_26;
  }
  v15 = v14;
  v16 = 0;
  v17 = *(_QWORD *)v34;
  do
  {
    v18 = 0;
    do
    {
      if (*(_QWORD *)v34 != v17)
        objc_enumerationMutation(v13);
      objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v18), "environment");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v19, "isAlwaysOnEnabledForEnvironment") & 1) != 0)
      {
        -[BLSHDateSpecifierModel environmentModelForKey:]((uint64_t)self, v19);
        v20 = objc_claimAutoreleasedReturnValue();
        -[NSObject dateInterval](v20, "dateInterval");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "intersectionWithDateInterval:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v22, "isEqual:", v7) & 1) == 0)
        {
          -[NSObject missingIntervalForDateInterval:](v20, "missingIntervalForDateInterval:", v31);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            if (!v16)
            {
              objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v16, "addObject:", v23);
          }

        }
        goto LABEL_18;
      }
      bls_flipbook_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v19, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v39 = self;
        v40 = 2114;
        v41 = v22;
        _os_log_debug_impl(&dword_2145AC000, v20, OS_LOG_TYPE_DEBUG, "%p missingIntervals skipping (alwaysOnDisabled) env:%{public}@", buf, 0x16u);
LABEL_18:

      }
      ++v18;
    }
    while (v15 != v18);
    v24 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    v15 = v24;
  }
  while (v24);
LABEL_26:
  v25 = (void *)objc_msgSend(v16, "copy");

  return v25;
}

- (id)updatesAfterSpecifier:(id)a3 coalesceFirstUpdateToNowDate:(id)a4 plusRenderEarlyEpsilon:(double)a5 untilGapOverDuration:(double)a6 coaelscingEpsilon:(double)a7 maximumUpdates:(int64_t)a8 lastValidDate:(id)a9 forPresentation:(id)a10 environmentFilter:(id)a11
{
  id v19;
  id v20;
  id v21;
  id v22;
  double v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  uint64_t (**v32)(id, void *);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  const char *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t i;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;
  id v69;
  int v70;
  id v71;
  int v72;
  char v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  int v84;
  id v85;
  void *v86;
  NSObject *v87;
  int v88;
  int v89;
  uint64_t v90;
  NSObject *v91;
  id v92;
  uint64_t v93;
  void *v94;
  uint64_t j;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  NSObject *v106;
  id v107;
  id v108;
  void *v109;
  void *v110;
  int v111;
  NSObject *v112;
  _BOOL4 v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  NSObject *v126;
  void *v127;
  void *v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  double v135;
  NSObject *v136;
  id v137;
  char v138;
  NSObject *v139;
  _BOOL4 v140;
  void *v141;
  void *v142;
  NSObject *v143;
  const char *v144;
  NSObject *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  uint64_t v150;
  NSObject *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  NSObject *v157;
  void *v158;
  void *v159;
  NSObject *v160;
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
  void *v174;
  id v175;
  id v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  NSObject *v189;
  void *v190;
  BLSHPresentationUpdates *v191;
  NSObject *v192;
  void *v193;
  void *v194;
  void *v195;
  int v197;
  void *v198;
  void *v199;
  void *v200;
  BLSHDateSpecifierModel *v201;
  objc_class *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  const char *aSelector;
  id v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  id v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  char v219;
  id v220;
  NSObject *v221;
  char v222;
  int v224;
  int v225;
  uint64_t (**v226)(id, void *);
  void *v227;
  void *v228;
  char v229;
  NSMapTable *table;
  uint64_t v231;
  id v232;
  void *v233;
  NSObject *v234;
  NSObject *v235;
  uint64_t v236;
  int64_t v237;
  char v238;
  int v239;
  void *v241;
  void *v242;
  uint64_t v243;
  void *v244;
  id obj;
  id obja;
  id objb;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  _QWORD v252[4];
  NSObject *v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  _QWORD v266[4];
  id v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  uint8_t buf[4];
  BLSHDateSpecifierModel *v273;
  __int16 v274;
  _BYTE v275[80];
  __int16 v276;
  BLSHPresentationUpdates *v277;
  __int16 v278;
  void *v279;
  _BYTE v280[128];
  _BYTE v281[128];
  _BYTE v282[128];
  _BYTE v283[128];
  _BYTE v284[128];
  uint64_t v285;

  v285 = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  v20 = a4;
  v21 = a9;
  v22 = a10;
  v226 = (uint64_t (**)(id, void *))a11;
  v213 = v19;
  if (a5 > a7 || v19 == 0)
    v24 = a5;
  else
    v24 = a7;
  v211 = v20;
  objc_msgSend(v20, "dateByAddingTimeInterval:", v24);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  bls_flipbook_log();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v210, "bls_shortLoggingString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bls_shortLoggingString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bls_shortLoggingString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134220034;
    v273 = self;
    v274 = 2114;
    *(_QWORD *)v275 = v19;
    *(_WORD *)&v275[8] = 2114;
    *(_QWORD *)&v275[10] = v26;
    *(_WORD *)&v275[18] = 2048;
    *(double *)&v275[20] = a6;
    *(_WORD *)&v275[28] = 2048;
    *(double *)&v275[30] = a7;
    *(_WORD *)&v275[38] = 2048;
    *(_QWORD *)&v275[40] = a8;
    *(_WORD *)&v275[48] = 2114;
    *(_QWORD *)&v275[50] = v27;
    *(_WORD *)&v275[58] = 2114;
    *(_QWORD *)&v275[60] = v28;
    *(_WORD *)&v275[68] = 1024;
    *(_DWORD *)&v275[70] = v226 != 0;
    _os_log_impl(&dword_2145AC000, v25, OS_LOG_TYPE_INFO, "%p updates (start) after:%{public}@ coalesceTo:%{public}@ gapDuration:%1.3lg epsilon:%.3lf max:%ld upTo:%{public}@ pres:%{public}@ filtered:%{BOOL}u", buf, 0x58u);

  }
  if (!v211)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("nowDate != nil"));
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHDateSpecifierModel updatesAfterSpecifier:coalesceFirstUpdateToNowDate:plusRenderEarlyEpsilon:untilGapOverDuration:coaelscingEpsilon:maximumUpdates:lastValidDate:forPresentation:environmentFilter:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v204), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2145CD00CLL);
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isEqualToDate:", v211);

  if (v30)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("distant future should not be now"));
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHDateSpecifierModel updatesAfterSpecifier:coalesceFirstUpdateToNowDate:plusRenderEarlyEpsilon:untilGapOverDuration:coaelscingEpsilon:maximumUpdates:lastValidDate:forPresentation:environmentFilter:].cold.2(a2);
    objc_msgSend(objc_retainAutorelease(v205), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2145CD064);
  }
  if (!v22)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("presentation != nil"));
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHDateSpecifierModel updatesAfterSpecifier:coalesceFirstUpdateToNowDate:plusRenderEarlyEpsilon:untilGapOverDuration:coaelscingEpsilon:maximumUpdates:lastValidDate:forPresentation:environmentFilter:].cold.3(a2);
    objc_msgSend(objc_retainAutorelease(v206), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2145CD0C8);
  }
  aSelector = a2;
  v220 = v21;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  v268 = 0u;
  v269 = 0u;
  v270 = 0u;
  v271 = 0u;
  v217 = v22;
  objc_msgSend(v22, "presentationEntries");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v268, v284, 16);
  v32 = v226;
  if (v31)
  {
    v33 = v31;
    v34 = *(_QWORD *)v269;
    v35 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v36 = 0;
      v243 = v33;
      do
      {
        if (*(_QWORD *)v269 != v34)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v268 + 1) + 8 * v36), "environment");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32 && (v32[2](v32, v37) & 1) == 0)
        {
          bls_flipbook_log();
          v42 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            goto LABEL_26;
          objc_msgSend(v37, "identifier");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v273 = self;
          v274 = 2114;
          *(_QWORD *)v275 = v49;
          v50 = v42;
          v51 = "%p updates skipping env:%{public}@";
          goto LABEL_29;
        }
        if ((objc_msgSend(v37, "isAlwaysOnEnabledForEnvironment") & 1) == 0)
        {
          bls_flipbook_log();
          v42 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            goto LABEL_26;
          objc_msgSend(v37, "identifier");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v273 = self;
          v274 = 2114;
          *(_QWORD *)v275 = v49;
          v50 = v42;
          v51 = "%p updates skipping (alwaysOnDisabled) env:%{public}@";
LABEL_29:
          _os_log_debug_impl(&dword_2145AC000, v50, OS_LOG_TYPE_DEBUG, v51, buf, 0x16u);

          goto LABEL_26;
        }
        v38 = v34;
        v39 = v35 - 1;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v35 - 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "identifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v241, "setValue:forKey:", v40, v41);

        -[BLSHDateSpecifierModel environmentModelForKey:]((uint64_t)self, v37);
        v42 = objc_claimAutoreleasedReturnValue();
        -[NSObject specifiers](v42, "specifiers");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        bls_flipbook_log();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v37, "identifier");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "bls_boundedDescriptionWithMax:transformer:", 6, &__block_literal_global_5);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v273 = self;
          v274 = 2114;
          *(_QWORD *)v275 = v52;
          *(_WORD *)&v275[8] = 2114;
          *(_QWORD *)&v275[10] = v53;
          _os_log_debug_impl(&dword_2145AC000, v44, OS_LOG_TYPE_DEBUG, "%p updates env:%{public}@ specifiers:%{public}@", buf, 0x20u);

        }
        objc_msgSend(v43, "objectEnumerator");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "nextObject");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject dateInterval](v42, "dateInterval");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        +[BLSHEnvironmentDatesEnumerator createWithInitialSpecifier:enumerator:dateInterval:environment:sourceModel:](BLSHEnvironmentDatesEnumerator, "createWithInitialSpecifier:enumerator:dateInterval:environment:sourceModel:", v46, v45, v47, v37, v42);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v227, "addObject:", v48);

        v32 = v226;
        v34 = v38;
        v35 = v39;
        v33 = v243;
LABEL_26:

        ++v36;
      }
      while (v33 != v36);
      v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v268, v284, 16);
      v33 = v54;
    }
    while (v54);
  }

  v266[0] = MEMORY[0x24BDAC760];
  v266[1] = 3221225472;
  v266[2] = __202__BLSHDateSpecifierModel_updatesAfterSpecifier_coalesceFirstUpdateToNowDate_plusRenderEarlyEpsilon_untilGapOverDuration_coaelscingEpsilon_maximumUpdates_lastValidDate_forPresentation_environmentFilter___block_invoke_16;
  v266[3] = &unk_24D1BC9D0;
  v208 = v241;
  v267 = v208;
  v209 = (void *)MEMORY[0x2199D2BD8](v266);
  v55 = objc_msgSend(v227, "count");
  table = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 512, v55);
  v56 = v213;
  v57 = v220;
  v58 = v217;
  if (v213)
  {
    v264 = 0u;
    v265 = 0u;
    v262 = 0u;
    v263 = 0u;
    objc_msgSend(v213, "specifiers");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v262, v283, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v263;
      do
      {
        for (i = 0; i != v61; ++i)
        {
          if (*(_QWORD *)v263 != v62)
            objc_enumerationMutation(v59);
          v64 = *(void **)(*((_QWORD *)&v262 + 1) + 8 * i);
          objc_msgSend(v64, "environment");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend(v217, "containsEnvironment:", v65);

          if (v66)
          {
            objc_msgSend(v64, "environment");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMapTable setObject:forKey:](table, "setObject:forKey:", v64, v67);

          }
        }
        v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v262, v283, 16);
      }
      while (v61);
    }

    v56 = v213;
  }
  objc_msgSend(v56, "presentationDate");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    objc_msgSend(v211, "earlierDate:", v68);
    v214 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v210, "laterDate:", v68);
    v69 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v214 = v211;
    v69 = v210;
  }
  v215 = 0;
  v216 = v69;
  v224 = 0;
  v70 = 0;
  v237 = 0;
  v221 = 0;
  v212 = 0;
  v218 = v68;
  do
  {
    if (v237 >= a8)
      break;
    v239 = (v68 != 0) & (v224 ^ 1);
    if (v239 == 1)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v242 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v68;
      v224 = 1;
      v72 = v70;
    }
    else if ((v70 & 1) != 0)
    {
      v73 = v70;
      objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
      v242 = (void *)objc_claimAutoreleasedReturnValue();
      v258 = 0u;
      v259 = 0u;
      v260 = 0u;
      v261 = 0u;
      v74 = v227;
      v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v258, v282, 16);
      if (v75)
      {
        v76 = v75;
        v77 = *(_QWORD *)v259;
        do
        {
          v78 = 0;
          v79 = v242;
          do
          {
            if (*(_QWORD *)v259 != v77)
              objc_enumerationMutation(v74);
            objc_msgSend(*(id *)(*((_QWORD *)&v258 + 1) + 8 * v78), "specifier");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "date");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "earlierDate:", v79);
            v82 = objc_claimAutoreleasedReturnValue();

            ++v78;
            v79 = (void *)v82;
          }
          while (v76 != v78);
          v242 = (void *)v82;
          v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v258, v282, 16);
        }
        while (v76);
      }

      objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = objc_msgSend(v242, "isEqualToDate:", v83);

      if (v84)
      {

        v68 = v218;
        v57 = v220;
        break;
      }
      objc_msgSend(v242, "dateByAddingTimeInterval:", a7);
      v71 = (id)objc_claimAutoreleasedReturnValue();
      v72 = 1;
      v68 = v218;
      LOBYTE(v70) = v73;
      v57 = v220;
    }
    else
    {
      if (v68)
      {
        v85 = v68;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
        v85 = (id)objc_claimAutoreleasedReturnValue();
      }
      v86 = v85;
      v71 = v216;
      v242 = v86;
      if (objc_msgSend(v86, "compare:", v71) != -1)
      {
        bls_flipbook_log();
        v87 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v86, "bls_shortLoggingString");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "bls_shortLoggingString");
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218754;
          v273 = self;
          v274 = 1024;
          *(_DWORD *)v275 = v237;
          *(_WORD *)&v275[4] = 2114;
          *(_QWORD *)&v275[6] = v154;
          *(_WORD *)&v275[14] = 2114;
          *(_QWORD *)&v275[16] = v155;
          _os_log_debug_impl(&dword_2145AC000, v87, OS_LOG_TYPE_DEBUG, "%p updates(%d) (skipping initial) valid:(%{public}@->%{public}@)", buf, 0x26u);

        }
        v88 = 18;
        v89 = 1;
        goto LABEL_148;
      }
      v72 = 1;
    }
    v225 = v72;
    if (v57)
    {
      objc_msgSend(v71, "earlierDate:", v57);
      v90 = objc_claimAutoreleasedReturnValue();

      v71 = (id)v90;
    }
    v222 = v70;
    v219 = v70 ^ 1;
    bls_flipbook_log();
    v91 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v242, "bls_shortLoggingString");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "bls_shortLoggingString");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219266;
      v273 = self;
      v274 = 1024;
      *(_DWORD *)v275 = v237;
      *(_WORD *)&v275[4] = 2114;
      *(_QWORD *)&v275[6] = v152;
      *(_WORD *)&v275[14] = 2114;
      *(_QWORD *)&v275[16] = v153;
      *(_WORD *)&v275[24] = 1024;
      *(_DWORD *)&v275[26] = v239;
      *(_WORD *)&v275[30] = 1024;
      *(_DWORD *)&v275[32] = v219 & 1;
      _os_log_debug_impl(&dword_2145AC000, v91, OS_LOG_TYPE_DEBUG, "%p updates(%d) (loop) valid:(%{public}@->%{public}@) (skip:%{BOOL}u initial:%{BOOL}u)", buf, 0x32u);

    }
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v87 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v233 = (void *)objc_claimAutoreleasedReturnValue();
    v254 = 0u;
    v255 = 0u;
    v256 = 0u;
    v257 = 0u;
    v92 = v227;
    v236 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v254, v281, 16);
    if (!v236)
    {

      v138 = 0;
      goto LABEL_123;
    }
    v238 = 0;
    v229 = 0;
    v93 = *(_QWORD *)v255;
    v94 = v242;
    obja = v71;
    v231 = *(_QWORD *)v255;
    v232 = v92;
    do
    {
      for (j = 0; j != v236; ++j)
      {
        if (*(_QWORD *)v255 != v93)
          objc_enumerationMutation(v92);
        v96 = *(void **)(*((_QWORD *)&v254 + 1) + 8 * j);
        objc_msgSend(v96, "specifier");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "date");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "environment");
        v244 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v98, "bls_isOnOrAfter:andOnOrBefore:", v94, v71))
        {
          v109 = v97;
          goto LABEL_112;
        }
        v234 = v87;
        v99 = 0;
        while (1)
        {
          v100 = v99;
          objc_msgSend(v96, "enumerator");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "nextObject");
          v99 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v99, "date");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = v102;
          if (v102)
          {
            v104 = v102;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
            v104 = (id)objc_claimAutoreleasedReturnValue();
          }
          v105 = v104;

          if (objc_msgSend(v105, "bls_isOnOrAfter:andOnOrBefore:", v94, v71))
          {
            bls_flipbook_log();
            v106 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v94, "bls_shortLoggingString");
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(obja, "bls_shortLoggingString");
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v244, "identifier");
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134219778;
              v273 = self;
              v274 = 1024;
              *(_DWORD *)v275 = v237;
              *(_WORD *)&v275[4] = 2114;
              *(_QWORD *)&v275[6] = v97;
              *(_WORD *)&v275[14] = 2114;
              *(_QWORD *)&v275[16] = v99;
              *(_WORD *)&v275[24] = 2114;
              *(_QWORD *)&v275[26] = v119;
              *(_WORD *)&v275[34] = 2114;
              *(_QWORD *)&v275[36] = v120;
              *(_WORD *)&v275[44] = 2048;
              *(double *)&v275[46] = a6;
              *(_WORD *)&v275[54] = 2114;
              *(_QWORD *)&v275[56] = v121;
              _os_log_debug_impl(&dword_2145AC000, v106, OS_LOG_TYPE_DEBUG, "%p updates(%d) (will coaelsce) specifier:%{public}@ nextSpecifier:%{public}@ valid:(%{public}@->%{public}@) gapDuration:%1.3lg env:%{public}@", buf, 0x4Eu);

              v94 = v242;
              v71 = obja;
            }

            v107 = v99;
            goto LABEL_94;
          }
          if (v239)
          {
            v108 = v97;
          }
          else
          {
            -[BLSHInactiveBudgetPolicing_Private validateAndChargeFutureSpecifier:nextSpecifier:forEnvironment:](self->_inactiveBudgetPolicy, "validateAndChargeFutureSpecifier:nextSpecifier:forEnvironment:", v97, v99, v244);
            v108 = (id)objc_claimAutoreleasedReturnValue();
          }
          v109 = v108;
          if (v108)
          {
            bls_flipbook_log();
            v112 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
              goto LABEL_105;
            objc_msgSend(v94, "bls_shortLoggingString");
            v228 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(obja, "bls_shortLoggingString");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v244, "identifier");
            v123 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134220034;
            v273 = self;
            v274 = 1024;
            *(_DWORD *)v275 = v237;
            *(_WORD *)&v275[4] = 2114;
            *(_QWORD *)&v275[6] = v109;
            *(_WORD *)&v275[14] = 2114;
            *(_QWORD *)&v275[16] = v97;
            *(_WORD *)&v275[24] = 2114;
            *(_QWORD *)&v275[26] = v99;
            *(_WORD *)&v275[34] = 2114;
            *(_QWORD *)&v275[36] = v228;
            *(_WORD *)&v275[44] = 2114;
            *(_QWORD *)&v275[46] = v122;
            *(_WORD *)&v275[54] = 2048;
            *(double *)&v275[56] = a6;
            *(_WORD *)&v275[64] = 2114;
            *(_QWORD *)&v275[66] = v123;
            v124 = (void *)v123;
            _os_log_debug_impl(&dword_2145AC000, v112, OS_LOG_TYPE_DEBUG, "%p updates(%d) (will not coaelsce) validSpecifier:%{public}@ specifier:%{public}@ nextSpecifier:%{public}@ valid:(%{public}@->%{public}@) gapDuration:%1.3lg env:%{public}@", buf, 0x58u);
            goto LABEL_103;
          }
          objc_msgSend(v99, "date");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          v111 = objc_msgSend(v110, "bls_isOnOrAfter:andOnOrBefore:", v94, v71);

          bls_flipbook_log();
          v112 = objc_claimAutoreleasedReturnValue();
          v113 = os_log_type_enabled(v112, OS_LOG_TYPE_INFO);
          if (!v111)
            break;
          if (v113)
          {
            objc_msgSend(v242, "bls_shortLoggingString");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(obja, "bls_shortLoggingString");
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v244, "identifier");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134219778;
            v273 = self;
            v274 = 1024;
            *(_DWORD *)v275 = v237;
            *(_WORD *)&v275[4] = 2114;
            *(_QWORD *)&v275[6] = v97;
            *(_WORD *)&v275[14] = 2114;
            *(_QWORD *)&v275[16] = v99;
            *(_WORD *)&v275[24] = 2114;
            *(_QWORD *)&v275[26] = v114;
            *(_WORD *)&v275[34] = 2114;
            *(_QWORD *)&v275[36] = v115;
            *(_WORD *)&v275[44] = 2048;
            *(double *)&v275[46] = a6;
            *(_WORD *)&v275[54] = 2114;
            *(_QWORD *)&v275[56] = v116;
            _os_log_impl(&dword_2145AC000, v112, OS_LOG_TYPE_INFO, "%p updates(%d) (exceeded budget - will coaelsce) specifier:%{public}@ nextSpecifier:%{public}@ valid:(%{public}@->%{public}@) gapDuration:%1.3lg env:%{public}@", buf, 0x4Eu);

          }
          v117 = v99;

          objc_msgSend(v117, "date");
          v118 = objc_claimAutoreleasedReturnValue();

          v238 = 1;
          v94 = v242;
          v98 = (void *)v118;
          if (!v117)
          {
            v71 = obja;
            goto LABEL_95;
          }
          v71 = obja;
LABEL_94:
          LOBYTE(v117) = 1;
LABEL_95:

          v97 = v99;
          if ((v117 & 1) == 0)
          {
            v109 = v99;
            goto LABEL_106;
          }
        }
        if (v113)
        {
          objc_msgSend(v242, "bls_shortLoggingString");
          v228 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obja, "bls_shortLoggingString");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v244, "identifier");
          v125 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219778;
          v273 = self;
          v274 = 1024;
          *(_DWORD *)v275 = v237;
          *(_WORD *)&v275[4] = 2114;
          *(_QWORD *)&v275[6] = v97;
          *(_WORD *)&v275[14] = 2114;
          *(_QWORD *)&v275[16] = v99;
          *(_WORD *)&v275[24] = 2114;
          *(_QWORD *)&v275[26] = v228;
          *(_WORD *)&v275[34] = 2114;
          *(_QWORD *)&v275[36] = v122;
          *(_WORD *)&v275[44] = 2048;
          *(double *)&v275[46] = a6;
          *(_WORD *)&v275[54] = 2114;
          *(_QWORD *)&v275[56] = v125;
          v124 = (void *)v125;
          v238 = 1;
          _os_log_impl(&dword_2145AC000, v112, OS_LOG_TYPE_INFO, "%p updates(%d) (exceeded budget - will not coaelsce) specifier:%{public}@ nextSpecifier:%{public}@ valid:(%{public}@->%{public}@) gapDuration:%1.3lg env:%{public}@", buf, 0x4Eu);
LABEL_103:

          v94 = v242;
          goto LABEL_105;
        }
        v238 = 1;
        v94 = v242;
LABEL_105:

        v71 = obja;
LABEL_106:
        objc_msgSend(v96, "setSpecifier:", v99);
        bls_flipbook_log();
        v126 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v126, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v94, "bls_shortLoggingString");
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "bls_shortLoggingString");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v244, "identifier");
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219778;
          v273 = self;
          v274 = 1024;
          *(_DWORD *)v275 = v237;
          *(_WORD *)&v275[4] = 2114;
          *(_QWORD *)&v275[6] = v109;
          *(_WORD *)&v275[14] = 2114;
          *(_QWORD *)&v275[16] = v99;
          *(_WORD *)&v275[24] = 2114;
          *(_QWORD *)&v275[26] = v132;
          *(_WORD *)&v275[34] = 2114;
          *(_QWORD *)&v275[36] = v133;
          *(_WORD *)&v275[44] = 2048;
          *(double *)&v275[46] = a6;
          *(_WORD *)&v275[54] = 2114;
          *(_QWORD *)&v275[56] = v134;
          _os_log_debug_impl(&dword_2145AC000, v126, OS_LOG_TYPE_DEBUG, "%p updates(%d) (set enumerater) validSpecifier:%{public}@ nextSpecifier:%{public}@ valid:(%{public}@->%{public}@) gapDuration:%1.3lg env:%{public}@", buf, 0x4Eu);

          v71 = obja;
        }

        if (v109)
        {
          objc_msgSend(v109, "date");
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "date");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          +[BLSHEnvironmentDateSpecifier specifierWithPresentationDate:fidelity:environment:userObject:](BLSHEnvironmentDateSpecifier, "specifierWithPresentationDate:fidelity:environment:userObject:", v128, objc_msgSend(v109, "fidelity"), v244, 0);
          v129 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMapTable setObject:forKey:](table, "setObject:forKey:", v129, v244);
          objc_msgSend(v127, "laterDate:", v234);
          v130 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v98, "earlierDate:", v233);
          v131 = objc_claimAutoreleasedReturnValue();

          v229 = 1;
          v233 = (void *)v131;
          v71 = obja;
          v87 = v130;
        }
        else
        {
          v87 = v234;
        }
        v92 = v232;

        v93 = v231;
LABEL_112:

      }
      v236 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v254, v281, 16);
    }
    while (v236);

    if ((v229 & 1) == 0)
    {
      v57 = v220;
      v58 = v217;
      v68 = v218;
      v138 = v238;
LABEL_123:
      if (v239)
      {
        bls_flipbook_log();
        v139 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v139, OS_LOG_TYPE_DEBUG))
          goto LABEL_125;
        objc_msgSend(v242, "bls_shortLoggingString");
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "bls_shortLoggingString");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v273 = self;
        v274 = 1024;
        *(_DWORD *)v275 = v237;
        *(_WORD *)&v275[4] = 2114;
        *(_QWORD *)&v275[6] = v141;
        *(_WORD *)&v275[14] = 2114;
        *(_QWORD *)&v275[16] = v142;
        v143 = v139;
        v144 = "%p updates(%d) (skip invalid - continuing) valid:(%{public}@->%{public}@)";
      }
      else
      {
        if ((v222 & 1) == 0)
        {
          v145 = v216;

          bls_flipbook_log();
          v139 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v139, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v242, "bls_shortLoggingString");
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "bls_shortLoggingString");
            v157 = v87;
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218754;
            v273 = self;
            v274 = 1024;
            *(_DWORD *)v275 = v237;
            *(_WORD *)&v275[4] = 2114;
            *(_QWORD *)&v275[6] = v156;
            *(_WORD *)&v275[14] = 2114;
            *(_QWORD *)&v275[16] = v158;
            _os_log_debug_impl(&dword_2145AC000, v139, OS_LOG_TYPE_DEBUG, "%p updates(%d) (initial invalid - continuing) valid:(%{public}@->%{public}@)", buf, 0x26u);

            v87 = v157;
          }
          v88 = 18;
LABEL_137:
          v221 = v145;
          goto LABEL_146;
        }
        bls_flipbook_log();
        v139 = objc_claimAutoreleasedReturnValue();
        v140 = os_log_type_enabled(v139, OS_LOG_TYPE_DEBUG);
        if ((v138 & 1) == 0)
        {
          if (v140)
          {
            objc_msgSend(v242, "bls_shortLoggingString");
            v172 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "bls_shortLoggingString");
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218754;
            v273 = self;
            v274 = 1024;
            *(_DWORD *)v275 = v237;
            *(_WORD *)&v275[4] = 2114;
            *(_QWORD *)&v275[6] = v172;
            *(_WORD *)&v275[14] = 2114;
            *(_QWORD *)&v275[16] = v173;
            _os_log_debug_impl(&dword_2145AC000, v139, OS_LOG_TYPE_DEBUG, "%p updates(%d) (invalid - stopping) valid:(%{public}@->%{public}@)", buf, 0x26u);

          }
          v88 = 19;
          goto LABEL_146;
        }
        if (!v140)
        {
LABEL_125:
          v88 = 18;
LABEL_146:

          v137 = v233;
          goto LABEL_147;
        }
        objc_msgSend(v242, "bls_shortLoggingString");
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "bls_shortLoggingString");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v273 = self;
        v274 = 1024;
        *(_DWORD *)v275 = v237;
        *(_WORD *)&v275[4] = 2114;
        *(_QWORD *)&v275[6] = v141;
        *(_WORD *)&v275[14] = 2114;
        *(_QWORD *)&v275[16] = v142;
        v143 = v139;
        v144 = "%p updates(%d) (invalid, exceeded budget - continuing) valid:(%{public}@->%{public}@)";
      }
      _os_log_debug_impl(&dword_2145AC000, v143, OS_LOG_TYPE_DEBUG, v144, buf, 0x26u);

      goto LABEL_125;
    }
    v57 = v220;
    v58 = v217;
    v68 = v218;
    if (!v221 || (-[NSObject timeIntervalSinceDate:](v87, "timeIntervalSinceDate:"), v135 <= a6))
    {
      if ((v239 & 1) == 0)
      {
        v87 = v87;

        v146 = v215;
        if (!v215)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v146 = (void *)objc_claimAutoreleasedReturnValue();
        }
        NSAllMapTableValues(table);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        v252[0] = MEMORY[0x24BDAC760];
        v252[1] = 3221225472;
        v252[2] = __202__BLSHDateSpecifierModel_updatesAfterSpecifier_coalesceFirstUpdateToNowDate_plusRenderEarlyEpsilon_untilGapOverDuration_coaelscingEpsilon_maximumUpdates_lastValidDate_forPresentation_environmentFilter___block_invoke_21;
        v252[3] = &unk_24D1BC9F8;
        v253 = v209;
        objc_msgSend(v147, "sortedArrayUsingComparator:", v252);
        v148 = (void *)objc_claimAutoreleasedReturnValue();

        +[BLSHPresentationDateSpecifier specifierWithPresentationDate:specifiers:](BLSHPresentationDateSpecifier, "specifierWithPresentationDate:specifiers:", v87, v148);
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        v215 = v146;
        objc_msgSend(v146, "addObject:", v149);
        ++v237;
        objc_msgSend(v214, "earlierDate:", v87);
        v150 = objc_claimAutoreleasedReturnValue();

        bls_flipbook_log();
        v151 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v151, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v242, "bls_shortLoggingString");
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "bls_shortLoggingString");
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v216, "bls_shortLoggingString");
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219778;
          v273 = self;
          v274 = 1024;
          *(_DWORD *)v275 = v237;
          *(_WORD *)&v275[4] = 2114;
          *(_QWORD *)&v275[6] = v149;
          *(_WORD *)&v275[14] = 2114;
          *(_QWORD *)&v275[16] = v163;
          *(_WORD *)&v275[24] = 2114;
          *(_QWORD *)&v275[26] = v164;
          *(_WORD *)&v275[34] = 1024;
          *(_DWORD *)&v275[36] = v219 & 1;
          *(_WORD *)&v275[40] = 2114;
          *(_QWORD *)&v275[42] = v165;
          *(_WORD *)&v275[50] = 2048;
          *(double *)&v275[52] = a6;
          _os_log_debug_impl(&dword_2145AC000, v151, OS_LOG_TYPE_DEBUG, "%p updates(%d) (add) update:%{public}@ valid:(%{public}@->%{public}@) (initial:%{BOOL}u) startingAtDate:%{public}@ gapDuration:%1.3lg", buf, 0x4Au);

          v68 = v218;
          v71 = obja;

        }
        v88 = 0;
        v139 = v253;
        v221 = v87;
        v214 = (id)v150;
        goto LABEL_146;
      }
      v145 = v216;

      bls_flipbook_log();
      v139 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v139, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v242, "bls_shortLoggingString");
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "bls_shortLoggingString");
        v160 = v87;
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject bls_shortLoggingString](v145, "bls_shortLoggingString");
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219522;
        v273 = self;
        v274 = 1024;
        *(_DWORD *)v275 = v237;
        *(_WORD *)&v275[4] = 2114;
        *(_QWORD *)&v275[6] = v159;
        *(_WORD *)&v275[14] = 2114;
        *(_QWORD *)&v275[16] = v161;
        *(_WORD *)&v275[24] = 1024;
        *(_DWORD *)&v275[26] = v219 & 1;
        v71 = obja;
        *(_WORD *)&v275[30] = 2114;
        *(_QWORD *)&v275[32] = v162;
        *(_WORD *)&v275[40] = 2048;
        *(double *)&v275[42] = a6;
        _os_log_debug_impl(&dword_2145AC000, v139, OS_LOG_TYPE_DEBUG, "%p updates(%d) (skipping) previous=start valid:(%{public}@->%{public}@) (initial:%{BOOL}u) startingAtDate:%{public}@ gapDuration:%1.3lg", buf, 0x40u);

        v87 = v160;
      }
      v88 = 0;
      goto LABEL_137;
    }
    bls_flipbook_log();
    v136 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG))
    {
      -[NSObject bls_shortLoggingString](v221, "bls_shortLoggingString");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v233, "bls_shortLoggingString");
      v235 = v87;
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject bls_shortLoggingString](v235, "bls_shortLoggingString");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v242, "bls_shortLoggingString");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "bls_shortLoggingString");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v216, "bls_shortLoggingString");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134220290;
      v273 = self;
      v274 = 1024;
      *(_DWORD *)v275 = v237;
      *(_WORD *)&v275[4] = 2114;
      *(_QWORD *)&v275[6] = v166;
      *(_WORD *)&v275[14] = 2112;
      *(_QWORD *)&v275[16] = v167;
      *(_WORD *)&v275[24] = 2112;
      *(_QWORD *)&v275[26] = v168;
      *(_WORD *)&v275[34] = 2114;
      *(_QWORD *)&v275[36] = v169;
      *(_WORD *)&v275[44] = 2114;
      *(_QWORD *)&v275[46] = v170;
      *(_WORD *)&v275[54] = 1024;
      *(_DWORD *)&v275[56] = v219 & 1;
      *(_WORD *)&v275[60] = 2114;
      *(_QWORD *)&v275[62] = v171;
      *(_WORD *)&v275[70] = 2048;
      *(double *)&v275[72] = a6;
      _os_log_debug_impl(&dword_2145AC000, v136, OS_LOG_TYPE_DEBUG, "%p updates(%d) (gap reached - stopping) previous:%{public}@ earliest:%@ latest:%@ valid:(%{public}@->%{public}@) (initial:%{BOOL}u) startingAtDate:%{public}@ gapDuration:%1.3lg", buf, 0x5Eu);

      v68 = v218;
      v71 = obja;

      v87 = v235;
    }

    v137 = v233;
    if (v239)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("!isSkipUpdate"));
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(aSelector);
        v201 = (BLSHDateSpecifierModel *)objc_claimAutoreleasedReturnValue();
        v202 = (objc_class *)objc_opt_class();
        NSStringFromClass(v202);
        v203 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v273 = v201;
        v274 = 2114;
        *(_QWORD *)v275 = v203;
        *(_WORD *)&v275[8] = 2048;
        *(_QWORD *)&v275[10] = self;
        *(_WORD *)&v275[18] = 2114;
        *(_QWORD *)&v275[20] = CFSTR("BLSHDateSpecifierModel.m");
        *(_WORD *)&v275[28] = 1024;
        *(_DWORD *)&v275[30] = 344;
        *(_WORD *)&v275[34] = 2114;
        *(_QWORD *)&v275[36] = v200;
        _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v200), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x2145CCFA8);
    }
    v88 = 19;
    v212 = v137;
LABEL_147:

    v89 = v225;
LABEL_148:

    v70 = v89;
  }
  while (v88 != 19);
  v174 = v212;
  if (!v212)
  {
    if (v57)
    {
      v175 = v57;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
      v175 = (id)objc_claimAutoreleasedReturnValue();
    }
    v174 = v175;
    v250 = 0u;
    v251 = 0u;
    v248 = 0u;
    v249 = 0u;
    v176 = v227;
    v177 = objc_msgSend(v176, "countByEnumeratingWithState:objects:count:", &v248, v280, 16);
    if (v177)
    {
      v178 = v177;
      v179 = *(_QWORD *)v249;
      objb = v176;
      do
      {
        v180 = 0;
        v181 = v174;
        do
        {
          if (*(_QWORD *)v249 != v179)
            objc_enumerationMutation(objb);
          v182 = *(void **)(*((_QWORD *)&v248 + 1) + 8 * v180);
          objc_msgSend(v182, "specifier");
          v183 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v183, "date");
          v184 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v182, "sourceModel");
          v185 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v185, "dateInterval");
          v186 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v186, "endDate");
          v187 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v184, "earlierDate:", v187);
          v188 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v181, "earlierDate:", v188);
          v174 = (void *)objc_claimAutoreleasedReturnValue();

          ++v180;
          v181 = v174;
        }
        while (v178 != v180);
        v176 = objb;
        v178 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v248, v280, 16);
      }
      while (v178);
    }

    bls_flipbook_log();
    v189 = objc_claimAutoreleasedReturnValue();
    v57 = v220;
    if (os_log_type_enabled(v189, OS_LOG_TYPE_DEBUG))
    {
      v197 = objc_msgSend(v176, "count");
      objc_msgSend(v174, "bls_shortLoggingString");
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v216, "bls_shortLoggingString");
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v273 = self;
      v274 = 1024;
      *(_DWORD *)v275 = v237;
      *(_WORD *)&v275[4] = 1024;
      *(_DWORD *)&v275[6] = v197;
      *(_WORD *)&v275[10] = 2114;
      *(_QWORD *)&v275[12] = v198;
      *(_WORD *)&v275[20] = 2114;
      *(_QWORD *)&v275[22] = v199;
      _os_log_debug_impl(&dword_2145AC000, v189, OS_LOG_TYPE_DEBUG, "%p updates(%d) (no nextStart) - will use earliest of %u environment model end next:%{public}@ startingAtDate:%{public}@", buf, 0x2Cu);

    }
    v58 = v217;
    v68 = v218;
  }
  v190 = v174;
  v191 = -[BLSHPresentationUpdates initWithStartDate:updates:nextUpdatesStart:]([BLSHPresentationUpdates alloc], "initWithStartDate:updates:nextUpdatesStart:", v214, v215, v174);
  bls_flipbook_log();
  v192 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v192, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v210, "bls_shortLoggingString");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "bls_shortLoggingString");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v216, "bls_shortLoggingString");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134220802;
    v273 = self;
    v274 = 1024;
    *(_DWORD *)v275 = v237;
    *(_WORD *)&v275[4] = 2048;
    *(_QWORD *)&v275[6] = v213;
    *(_WORD *)&v275[14] = 2114;
    *(_QWORD *)&v275[16] = v193;
    *(_WORD *)&v275[24] = 2048;
    *(double *)&v275[26] = a6;
    *(_WORD *)&v275[34] = 2048;
    *(double *)&v275[36] = a7;
    *(_WORD *)&v275[44] = 2048;
    *(_QWORD *)&v275[46] = a8;
    *(_WORD *)&v275[54] = 2114;
    *(_QWORD *)&v275[56] = v194;
    *(_WORD *)&v275[64] = 2048;
    *(_QWORD *)&v275[66] = v58;
    *(_WORD *)&v275[74] = 1024;
    *(_DWORD *)&v275[76] = v226 != 0;
    v276 = 2114;
    v277 = v191;
    v278 = 2114;
    v279 = v195;
    _os_log_impl(&dword_2145AC000, v192, OS_LOG_TYPE_INFO, "%p updates(%d) (complete) after:%p coalesceTo:%{public}@ gapDuration:%1.3lg epsilon:%.3lf max:%ld upTo:%{public}@ pres:%p filtered:%{BOOL}u result:%{public}@ startingAtDate:%{public}@", buf, 0x72u);

  }
  return v191;
}

uint64_t __202__BLSHDateSpecifierModel_updatesAfterSpecifier_coalesceFirstUpdateToNowDate_plusRenderEarlyEpsilon_untilGapOverDuration_coaelscingEpsilon_maximumUpdates_lastValidDate_forPresentation_environmentFilter___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_shortLoggingString");
}

uint64_t __202__BLSHDateSpecifierModel_updatesAfterSpecifier_coalesceFirstUpdateToNowDate_plusRenderEarlyEpsilon_untilGapOverDuration_coaelscingEpsilon_maximumUpdates_lastValidDate_forPresentation_environmentFilter___block_invoke_16(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "environmentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "unsignedIntegerValue");
  else
    v5 = 0;

  return v5;
}

uint64_t __202__BLSHDateSpecifierModel_updatesAfterSpecifier_coalesceFirstUpdateToNowDate_plusRenderEarlyEpsilon_untilGapOverDuration_coaelscingEpsilon_maximumUpdates_lastValidDate_forPresentation_environmentFilter___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v7 == v8)
  {
    objc_msgSend(v5, "environmentIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "environmentIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "compare:", v10);

  }
  else if (v7 > v8)
  {
    v11 = -1;
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (void)purgeSpecifiersBefore:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMapTable objectEnumerator](self->_environmentModels, "objectEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "purgeSpecifiersBefore:", v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)registerSpecifiers:(id)a3 forDateInterval:(id)a4 environment:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[BLSHDateSpecifierModel environmentModelForKey:]((uint64_t)self, a5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerSpecifiers:forDateInterval:", v9, v8);

}

- (void)clearSpecifiersForEnvironment:(id)a3
{
  id v3;

  -[BLSHDateSpecifierModel environmentModelForKey:]((uint64_t)self, a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearAllSpecifiers");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentModels, 0);
  objc_storeStrong((id *)&self->_inactiveBudgetPolicy, 0);
}

- (void)updatesAfterSpecifier:(const char *)a1 coalesceFirstUpdateToNowDate:plusRenderEarlyEpsilon:untilGapOverDuration:coaelscingEpsilon:maximumUpdates:lastValidDate:forPresentation:environmentFilter:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)updatesAfterSpecifier:(const char *)a1 coalesceFirstUpdateToNowDate:plusRenderEarlyEpsilon:untilGapOverDuration:coaelscingEpsilon:maximumUpdates:lastValidDate:forPresentation:environmentFilter:.cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)updatesAfterSpecifier:(const char *)a1 coalesceFirstUpdateToNowDate:plusRenderEarlyEpsilon:untilGapOverDuration:coaelscingEpsilon:maximumUpdates:lastValidDate:forPresentation:environmentFilter:.cold.3(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
