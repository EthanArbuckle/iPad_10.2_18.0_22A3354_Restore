@implementation ACHActivityTriggerGenerator

+ (unint64_t)allPossibleTriggers
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = ACHGoalCompletionTrigger(0);
  v3 = ACHGoalCompletionTrigger(3);
  v4 = ACHGoalCompletionTrigger(1);
  return v2 | v3 | v4 | ACHGoalCompletionTrigger(2) | 0x3C9;
}

- (ACHActivityTriggerGenerator)initWithPauseRingsCoordinator:(id)a3
{
  id v5;
  ACHActivityTriggerGenerator *v6;
  ACHActivityTriggerGenerator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACHActivityTriggerGenerator;
  v6 = -[ACHActivityTriggerGenerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pauseRingsCoordinator, a3);

  return v7;
}

- (unint64_t)triggersForNewMoveDataWithDataProvider:(id)a3
{
  return -[ACHActivityTriggerGenerator _triggersForNewActivityDataWithGoalType:dataProvider:goalMetHandler:](self, "_triggersForNewActivityDataWithGoalType:dataProvider:goalMetHandler:", 0, a3, &__block_literal_global_22);
}

BOOL __70__ACHActivityTriggerGenerator_triggersForNewMoveDataWithDataProvider___block_invoke(double a1, double a2)
{
  return a1 >= a2;
}

- (unint64_t)triggersForNewMoveTimeDataWithDataProvider:(id)a3
{
  return -[ACHActivityTriggerGenerator _triggersForNewActivityDataWithGoalType:dataProvider:goalMetHandler:](self, "_triggersForNewActivityDataWithGoalType:dataProvider:goalMetHandler:", 3, a3, &__block_literal_global_184);
}

BOOL __74__ACHActivityTriggerGenerator_triggersForNewMoveTimeDataWithDataProvider___block_invoke(double a1, double a2)
{
  return a1 >= a2;
}

- (unint64_t)triggersForNewExerciseDataWithDataProvider:(id)a3
{
  return -[ACHActivityTriggerGenerator _triggersForNewActivityDataWithGoalType:dataProvider:goalMetHandler:](self, "_triggersForNewActivityDataWithGoalType:dataProvider:goalMetHandler:", 1, a3, &__block_literal_global_185_0);
}

BOOL __74__ACHActivityTriggerGenerator_triggersForNewExerciseDataWithDataProvider___block_invoke(double a1, double a2)
{
  return a1 >= a2;
}

- (unint64_t)triggersForNewStandDataWithDataProvider:(id)a3
{
  return -[ACHActivityTriggerGenerator _triggersForNewActivityDataWithGoalType:dataProvider:goalMetHandler:](self, "_triggersForNewActivityDataWithGoalType:dataProvider:goalMetHandler:", 2, a3, &__block_literal_global_186);
}

BOOL __71__ACHActivityTriggerGenerator_triggersForNewStandDataWithDataProvider___block_invoke(double a1, double a2)
{
  return (uint64_t)llround(a1) >= (uint64_t)llround(a2);
}

- (unint64_t)_triggersForNewActivityDataWithGoalType:(int64_t)a3 dataProvider:(id)a4 goalMetHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  __int128 v11;
  void *v12;
  char v13;
  double v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  double *v24;
  double v25;
  uint64_t v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;

  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x2199C8FE0]();
  v11 = 0uLL;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v46 = 0u;
  if (v8)
  {
    objc_msgSend(v8, "currentStateForGoalType:", a3);
    v11 = 0uLL;
  }
  v44 = v11;
  v45 = v11;
  v42 = v11;
  v43 = v11;
  v40 = v11;
  v41 = v11;
  v38 = v11;
  v39 = v11;
  v37 = v11;
  v34 = v52;
  v35 = v53;
  v36 = v54;
  v30 = v48;
  v31 = v49;
  v32 = v50;
  v33 = v51;
  v28 = v46;
  v29 = v47;
  -[ACHActivityTriggerGenerator _incrementWithInitialState:forGoalType:dataProvider:goalMetHandler:](self, "_incrementWithInitialState:forGoalType:dataProvider:goalMetHandler:", &v28, a3, v8, v9);
  v34 = v43;
  v35 = v44;
  v36 = v45;
  v30 = v39;
  v31 = v40;
  v32 = v41;
  v33 = v42;
  v28 = v37;
  v29 = v38;
  objc_msgSend(v8, "setNewState:forGoalType:", &v28, a3);
  objc_msgSend(v8, "todayActivitySummary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isPaused");

  if ((v13 & 1) == 0)
  {
    if ((_BYTE)v45)
    {
      v16 = ACHGoalCompletionTrigger(a3);
      if (objc_msgSend(v8, "allGoalsMetToday"))
        v17 = v16 | 0x40;
      else
        v17 = v16;
    }
    else
    {
      v17 = 0;
    }
    if (a3 == 3 || a3 == 0)
    {
      v14 = *(double *)&v39;
      if (*(double *)&v39 > 2.22044605e-16)
      {
        v19 = floor(*((double *)&v38 + 1) / *(double *)&v39);
        v14 = 1.0;
        v20 = v19 == floor(*(double *)&v38 / *(double *)&v39) || v19 <= 1.0;
        v21 = 8;
        if (v20)
          v21 = 0;
        v17 |= v21;
      }
    }
    switch(a3)
    {
      case 1:
        v22 = 256;
        break;
      case 2:
LABEL_37:
        v15 = v17 | BYTE1(v45);
        goto LABEL_38;
      case 3:
        v22 = 512;
        break;
      default:
        v22 = 128;
        break;
    }
    objc_msgSend(v8, "todayActivitySummary", v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "activityMoveMode") == 2
      && -[ACHActivityTriggerGenerator _goalTypeIsMoveType:](self, "_goalTypeIsMoveType:", a3))
    {
      v24 = (double *)&v44;
    }
    else
    {
      v24 = (double *)&v43 + 1;
    }
    v25 = *v24;

    if (*((double *)&v38 + 1) <= v25)
      v26 = 0;
    else
      v26 = v22;
    v17 |= v26;
    goto LABEL_37;
  }
  v15 = 0;
LABEL_38:
  objc_autoreleasePoolPop(v10);

  return v15;
}

- ($A5E8A54F69D71102DC6A95EAED28A9DA)_incrementWithInitialState:(SEL)a3 forGoalType:(id *)a4 dataProvider:(int64_t)a5 goalMetHandler:(id)a6
{
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  char v22;
  uint64_t v23;
  void *v24;
  int v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  const __CFString *v41;
  NSObject *v42;
  const __CFString *v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  const __CFString *v47;
  NSObject *v48;
  int v49;
  uint64_t v50;
  id v51;
  id v52;
  id v53;
  void (**v54)(_QWORD);
  id v55;
  id v56;
  void (**v57)(_QWORD);
  void (**v58)(_QWORD);
  void (**v59)(_QWORD);
  id v60;
  void (**v61)(_QWORD);
  uint64_t v62;
  double *v63;
  double *v64;
  _OWORD *v65;
  char v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  $A5E8A54F69D71102DC6A95EAED28A9DA *result;
  id v72;
  id v73;
  void *v74;
  void *v75;
  char v76;
  int v77;
  void (**v78)(void);
  _BOOL4 v79;
  int v80;
  _BOOL4 v81;
  int64_t v82;
  int v84;
  int v85;
  void *v86;
  void *v87;
  void *v88;
  void (**v89)(_QWORD, double, double);
  uint64_t v90;
  id v91;
  void *v92;
  _QWORD v93[4];
  id v94;
  ACHActivityTriggerGenerator *v95;
  uint64_t *v96;
  int64_t v97;
  _QWORD v98[5];
  char v99;
  char v100;
  _QWORD v101[4];
  id v102;
  uint64_t *v103;
  _QWORD v104[4];
  id v105;
  id v106;
  id v107;
  uint64_t *v108;
  uint64_t v109;
  _QWORD v110[4];
  id v111;
  id v112;
  id v113;
  uint64_t *v114;
  uint64_t v115;
  _QWORD v116[4];
  id v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t v120;
  double *v121;
  uint64_t v122;
  void *v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  uint8_t buf[4];
  _BYTE v134[10];
  uint64_t v135;
  __int16 v136;
  const __CFString *v137;
  uint64_t v138;

  v138 = *MEMORY[0x24BDAC8D0];
  v91 = a6;
  v89 = (void (**)(_QWORD, double, double))a7;
  v82 = a5;
  ACHGoalDisplayName(a5);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v91, "todayIndex"))
  {
    v26 = *(_OWORD *)&a4->var14;
    *(_OWORD *)&retstr->var12 = *(_OWORD *)&a4->var12;
    *(_OWORD *)&retstr->var14 = v26;
    *(_OWORD *)&retstr->var16 = *(_OWORD *)&a4->var16;
    v27 = *(_OWORD *)&a4->var6;
    *(_OWORD *)&retstr->var4 = *(_OWORD *)&a4->var4;
    *(_OWORD *)&retstr->var6 = v27;
    v28 = *(_OWORD *)&a4->var10;
    *(_OWORD *)&retstr->var8 = *(_OWORD *)&a4->var8;
    *(_OWORD *)&retstr->var10 = v28;
    v29 = *(_OWORD *)&a4->var2;
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&a4->var0;
    *(_OWORD *)&retstr->var2 = v29;
    goto LABEL_58;
  }
  v120 = 0;
  v121 = (double *)&v120;
  v11 = *(_OWORD *)&a4->var14;
  v130 = *(_OWORD *)&a4->var12;
  v131 = v11;
  v132 = *(_OWORD *)&a4->var16;
  v12 = *(_OWORD *)&a4->var6;
  v126 = *(_OWORD *)&a4->var4;
  v127 = v12;
  v13 = *(_OWORD *)&a4->var10;
  v128 = *(_OWORD *)&a4->var8;
  v129 = v13;
  v14 = *(_OWORD *)&a4->var2;
  v124 = *(_OWORD *)&a4->var0;
  v125 = v14;
  v123 = &unk_21410B3BF;
  v90 = *((_QWORD *)&v124 + 1) - v124;
  v122 = 0xB010000000;
  if ((unint64_t)(*((_QWORD *)&v124 + 1) - v124 + 86399) >= 0x2A2FF)
    *(_QWORD *)&v125 = 0;
  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "todayIndex");
  _HKActivityCacheDateComponentsFromCacheIndex();
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "dateFromComponents:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "hk_dateBySubtractingDays:fromDate:", 1, v15);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = _HKCacheIndexFromDate();
  objc_msgSend(v92, "year");
  objc_msgSend(v92, "month");
  ACHDateComponentsForYearMonthDay();
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  ACHStartOfFitnessWeekBeforeDateInCalendar();
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "components:fromDate:", 28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "features");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "pauseRings");

  v89[2](v89, v121[9], v121[10]);
  v77 = v21;
  v22 = ((uint64_t (*)(_QWORD, double, double))v89[2])(v89, v121[6], v121[8]);
  v84 = ((uint64_t (*)(_QWORD, double, double))v89[2])(v89, v121[7], v121[8]);
  if (v20)
  {
    v85 = objc_msgSend(v91, "ringsPausedToday");
    if (v16 >= *((_QWORD *)v121 + 4))
      v23 = *((_QWORD *)v121 + 4);
    else
      v23 = v16;
    -[ACHActivityTriggerGenerator pauseRingsCoordinator](self, "pauseRingsCoordinator");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isPausedForActivitySummaryCacheIndexStart:end:", v23, v16);

    v76 = v85;
    if ((v22 & 1) == 0)
    {
LABEL_9:
      v80 = v84 & (v85 ^ 1);
      goto LABEL_16;
    }
  }
  else
  {
    v25 = 0;
    v85 = 0;
    v76 = 0;
    if (v16 >= *((_QWORD *)v121 + 4))
      v23 = *((_QWORD *)v121 + 4);
    else
      v23 = v16;
    if ((v22 & 1) == 0)
      goto LABEL_9;
  }
  v80 = 0;
LABEL_16:
  v31 = objc_msgSend(v17, "year");
  if (v31 == objc_msgSend(v92, "year") && (v32 = objc_msgSend(v17, "month"), v32 == objc_msgSend(v92, "month")))
  {
    v33 = objc_msgSend(v17, "day");
    v81 = v33 == objc_msgSend(v92, "day");
  }
  else
  {
    v81 = 0;
  }
  v34 = objc_msgSend(v86, "year");
  if (v34 == objc_msgSend(v92, "year") && (v35 = objc_msgSend(v86, "month"), v35 == objc_msgSend(v92, "month")))
  {
    v36 = objc_msgSend(v86, "day");
    v79 = v36 == objc_msgSend(v92, "day");
  }
  else
  {
    v79 = 0;
  }
  ACHLogAwardEngine();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v38 = objc_msgSend(v91, "todayIndex");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v134 = v38;
    _os_log_impl(&dword_21407B000, v37, OS_LOG_TYPE_DEFAULT, "[ACHActivityTriggerGenerator] Today's Index: %ld", buf, 0xCu);
  }

  ACHLogAwardEngine();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v134 = v92;
    _os_log_impl(&dword_21407B000, v39, OS_LOG_TYPE_DEFAULT, "[ACHActivityTriggerGenerator] Today's Date Components: %@", buf, 0xCu);
  }

  ACHLogAwardEngine();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    v41 = CFSTR("NO");
    if (v20)
      v41 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v134 = v41;
    _os_log_impl(&dword_21407B000, v40, OS_LOG_TYPE_DEFAULT, "[ACHActivityTriggerGenerator] Pause Rings Feature Enabled: %@", buf, 0xCu);
  }

  ACHLogAwardEngine();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    v43 = CFSTR("NO");
    if (v85)
      v43 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v134 = v43;
    _os_log_impl(&dword_21407B000, v42, OS_LOG_TYPE_DEFAULT, "[ACHActivityTriggerGenerator] Today is paused: %@", buf, 0xCu);
  }

  ACHLogAwardEngine();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    v45 = *((_QWORD *)v121 + 4);
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v134 = v45;
    _os_log_impl(&dword_21407B000, v44, OS_LOG_TYPE_DEFAULT, "[ACHActivityTriggerGenerator] Last Checked Summary Index: %lld", buf, 0xCu);
  }

  ACHLogAwardEngine();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    v47 = CFSTR("NO");
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)v134 = v23;
    if (v25)
      v47 = CFSTR("YES");
    *(_WORD *)&v134[8] = 2048;
    v135 = v16;
    v136 = 2112;
    v137 = v47;
    _os_log_impl(&dword_21407B000, v46, OS_LOG_TYPE_DEFAULT, "[ACHActivityTriggerGenerator] Paused since last checked index (%lld -> %lld): %@", buf, 0x20u);
  }

  ACHLogAwardEngine();
  v48 = objc_claimAutoreleasedReturnValue();
  v30 = v90 > 172799;
  v49 = (v30 | ~v77) & (v25 ^ 1);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v134 = (v30 | ~v77) & (v25 ^ 1);
    *(_WORD *)&v134[4] = 1024;
    *(_DWORD *)&v134[6] = v81;
    LOWORD(v135) = 1024;
    *(_DWORD *)((char *)&v135 + 2) = v79;
    _os_log_impl(&dword_21407B000, v48, OS_LOG_TYPE_DEFAULT, "[ACHActivityTriggerGenerator] Should Reset Streak [All, Week, Month]: [%{BOOL}d, %{BOOL}d, %{BOOL}d]", buf, 0x14u);
  }

  v50 = MEMORY[0x24BDAC760];
  v116[0] = MEMORY[0x24BDAC760];
  v116[1] = 3221225472;
  v116[2] = __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke;
  v116[3] = &unk_24D13C8A8;
  v51 = v88;
  v117 = v51;
  v118 = &v120;
  v119 = v90 / 86400;
  v78 = (void (**)(void))MEMORY[0x2199C9184](v116);
  v110[0] = v50;
  v110[1] = 3221225472;
  v110[2] = __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_193;
  v110[3] = &unk_24D13C8D0;
  v52 = v51;
  v111 = v52;
  v114 = &v120;
  v115 = v90 / 86400;
  v53 = v15;
  v112 = v53;
  v73 = v17;
  v113 = v73;
  v54 = (void (**)(_QWORD))MEMORY[0x2199C9184](v110);
  v104[0] = v50;
  v104[1] = 3221225472;
  v104[2] = __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_194;
  v104[3] = &unk_24D13C8D0;
  v55 = v52;
  v105 = v55;
  v108 = &v120;
  v109 = v90 / 86400;
  v72 = v53;
  v106 = v72;
  v56 = v86;
  v107 = v56;
  v57 = (void (**)(_QWORD))MEMORY[0x2199C9184](v104);
  v101[0] = v50;
  v101[1] = 3221225472;
  v101[2] = __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_195;
  v101[3] = &unk_24D13AC40;
  v103 = &v120;
  v102 = v55;
  v58 = (void (**)(_QWORD))MEMORY[0x2199C9184](v101);
  v98[0] = v50;
  v98[1] = 3221225472;
  v98[2] = __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_196;
  v98[3] = &unk_24D13C8F8;
  v99 = v84;
  v98[4] = &v120;
  v100 = v76;
  v59 = (void (**)(_QWORD))MEMORY[0x2199C9184](v98);
  v93[0] = v50;
  v93[1] = 3221225472;
  v93[2] = __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_2;
  v93[3] = &unk_24D13A460;
  v60 = v91;
  v94 = v60;
  v95 = self;
  v96 = &v120;
  v97 = v82;
  v61 = (void (**)(_QWORD))MEMORY[0x2199C9184](v93);
  if (v90 > 86399)
  {
    if (v49)
      v78[2]();
    if ((v85 & 1) == 0)
    {
      ++*((_QWORD *)v121 + 16);
      v61[2](v61);
    }
  }
  if (v79)
    v57[2](v57);
  if (v81)
    v54[2](v54);
  if (v80)
    v58[2](v58);
  v59[2](v59);
  v62 = objc_msgSend(v60, "todayIndex");
  v63 = v121;
  v64 = v121;
  *((_QWORD *)v121 + 4) = v62;
  v65 = v64 + 4;
  v66 = v84;
  if (v84)
    v66 = v80 & (v85 ^ 1);
  *((_BYTE *)v63 + 160) = v66;
  *((_BYTE *)v63 + 161) = (unint64_t)(v90 - 86400) < 0x15180;
  v67 = v65[7];
  *(_OWORD *)&retstr->var12 = v65[6];
  *(_OWORD *)&retstr->var14 = v67;
  v68 = v65[3];
  *(_OWORD *)&retstr->var4 = v65[2];
  *(_OWORD *)&retstr->var6 = v68;
  v69 = v65[5];
  *(_OWORD *)&retstr->var8 = v65[4];
  *(_OWORD *)&retstr->var10 = v69;
  v70 = v65[1];
  *(_OWORD *)&retstr->var0 = *v65;
  *(_OWORD *)&retstr->var2 = v70;
  *(_OWORD *)&retstr->var16 = v65[8];

  _Block_object_dispose(&v120, 8);
LABEL_58:

  return result;
}

void __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;

  ACHLogAwardEngine();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_cold_1();

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 88) = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 96) = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 104) = 0;
}

void __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_193(uint64_t a1)
{
  NSObject *v2;

  ACHLogAwardEngine();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_193_cold_1();

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 96) = 0;
}

void __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_194(uint64_t a1)
{
  NSObject *v2;

  ACHLogAwardEngine();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_194_cold_1();

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 104) = 0;
}

double __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_195(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  double result;
  NSObject *v6;
  uint64_t v7;

  v1 = a1 + 40;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 88);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 96);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 104);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 120);
  ACHLogAwardEngine();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_195_cold_3();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 8);
  if (*(_QWORD *)(v3 + 88) > *(_QWORD *)(v3 + 112))
  {
    ACHLogAwardEngine();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_195_cold_2();

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 8) + 112) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 8) + 88);
    v3 = *(_QWORD *)(*(_QWORD *)v1 + 8);
  }
  result = *(double *)(v3 + 64);
  if (result > *(double *)(v3 + 152))
  {
    ACHLogAwardEngine();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_195_cold_1();

    v7 = *(_QWORD *)(*(_QWORD *)v1 + 8);
    result = *(double *)(v7 + 64);
    *(double *)(v7 + 152) = result;
  }
  return result;
}

uint64_t __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_196(uint64_t result)
{
  uint64_t v1;
  double v2;

  if (*(_BYTE *)(result + 40))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
    v2 = *(double *)(v1 + 64);
    if (v2 > *(double *)(v1 + 152) && !*(_BYTE *)(result + 41))
      *(double *)(v1 + 152) = v2;
  }
  return result;
}

void __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  double v7;

  objc_msgSend(*(id *)(a1 + 32), "yesterdayActivitySummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "activityMoveMode") == 2)
  {
    v3 = objc_msgSend(*(id *)(a1 + 40), "_goalTypeIsMoveType:", *(_QWORD *)(a1 + 56));

    if (v3)
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v5 = *(double *)(v4 + 72);
      if (v5 > *(double *)(v4 + 144) + 2.22044605e-16)
        *(double *)(v4 + 144) = v5;
      return;
    }
  }
  else
  {

  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(double *)(v6 + 72);
  if (v7 > *(double *)(v6 + 136) + 2.22044605e-16)
    *(double *)(v6 + 136) = v7;
}

- (BOOL)_goalTypeIsMoveType:(int64_t)a3
{
  return !a3 || a3 == 3;
}

- (FIPauseRingsCoordinator)pauseRingsCoordinator
{
  return self->_pauseRingsCoordinator;
}

- (void)setPauseRingsCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_pauseRingsCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseRingsCoordinator, 0);
}

void __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_cold_1()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  os_log_t v5;
  uint8_t v6[22];
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5_0();
  v7 = 2114;
  v8 = v0;
  v9 = v1;
  v10 = v2;
  v11 = 2114;
  v12 = v0;
  v13 = v1;
  v14 = v3;
  v15 = v1;
  v16 = v4;
  _os_log_debug_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEBUG, "[ACHActivityTriggerGenerator] Resetting current %{public}@ streak of %ld days, current week %{public}@ streak of %ld days, and current month %{public}@ streak of %ld after advancing %ld days", v6, 0x48u);
}

void __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_193_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_4_1(&dword_21407B000, v0, v1, "[ACHActivityTriggerGenerator] Resetting current Week %{public}@ streak of %ld days after advancing %ld days. Today = %@, startOfFitnessWeekDate = %@", v2, v3, v4, v5, v6);
}

void __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_194_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_4_1(&dword_21407B000, v0, v1, "[ACHActivityTriggerGenerator] Resetting current Month %{public}@ streak of %ld days after advancing %ld days. Today = %@, start of month = %@", v2, v3, v4, v5, v6);
}

void __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_195_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_3_3(&dword_21407B000, v0, v1, "%{public}@: best goal value achieved! New: %f; Old: %f");
}

void __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_195_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_3_3(&dword_21407B000, v0, v1, "%{public}@: best streak value achieved! New: %ld; Old: %ld");
}

void __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_195_cold_3()
{
  __int16 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  os_log_t v5;
  uint8_t v6[22];
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;

  OUTLINED_FUNCTION_1_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5_0();
  v7 = v0;
  v8 = v1;
  v9 = v0;
  v10 = v2;
  v11 = v0;
  v12 = v3;
  v13 = 2114;
  v14 = v4;
  _os_log_debug_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEBUG, "[ACHActivityTriggerGenerator] %{public}@: streak extended to %ld days (week streak to %ld days, monthy streak to %ld days), %ld total %{public}@ goals made", v6, 0x3Eu);
}

@end
