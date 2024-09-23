@implementation FCSFirstGlanceAchievementEvaluator

- (FCSFirstGlanceAchievementEvaluator)initWithDataSource:(id)a3
{
  id v4;
  FCSFirstGlanceAchievementEvaluator *v5;
  FCSFirstGlanceAchievementEvaluator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FCSFirstGlanceAchievementEvaluator;
  v5 = -[FCSFirstGlanceAchievementEvaluator init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_dataSource, v4);

  return v6;
}

- (void)progressAchievementAndMilestoneWithCurrentDate:(id)a3 calendar:(id)a4 experienceType:(unint64_t)a5 isStandaloneMode:(BOOL)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  BOOL v24;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  -[FCSFirstGlanceAchievementEvaluator dataSource](self, "dataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __137__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithCurrentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke;
  v19[3] = &unk_1E8807E30;
  v19[4] = self;
  v20 = v12;
  v21 = v13;
  v22 = v14;
  v23 = a5;
  v24 = a6;
  v16 = v13;
  v17 = v12;
  v18 = v14;
  objc_msgSend(v15, "monthlyChallengeForDate:calendar:completion:", v17, v16, v19);

}

void __137__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithCurrentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  char v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      _os_log_impl(&dword_1CC325000, v7, OS_LOG_TYPE_DEFAULT, "Error getting monthly challenge %@", buf, 0xCu);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __137__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithCurrentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_183;
  v13[3] = &unk_1E8807E08;
  v17 = *(id *)(a1 + 56);
  v9 = *(void **)(a1 + 40);
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v5;
  v15 = v9;
  v10 = *(id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 64);
  v16 = v10;
  v18 = v11;
  v19 = *(_BYTE *)(a1 + 72);
  v12 = v5;
  objc_msgSend(v8, "achievementsWithNames:completion:", &unk_1E8814998, v13);

}

void __137__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithCurrentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_183(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    objc_msgSend(a2, "hk_mapToDictionary:", &__block_literal_global_0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "progressAchievementAndMilestoneWithMonthlyChallengeAchievement:achievementsMap:currentDate:calendar:experienceType:isStandaloneMode:completion:", *(_QWORD *)(a1 + 40), v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 64));

  }
}

void __137__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithCurrentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_2(uint64_t a1, void *a2, void (**a3)(_QWORD, _QWORD, _QWORD))
{
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "template");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, id))a3)[2](v5, v7, v6);

}

- (void)progressAchievementAndMilestoneWithMonthlyChallengeAchievement:(id)a3 achievementsMap:(id)a4 currentDate:(id)a5 calendar:(id)a6 experienceType:(unint64_t)a7 isStandaloneMode:(BOOL)a8 completion:(id)a9
{
  id v13;
  id v14;
  id v15;
  void (**v16)(_QWORD);
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  os_log_t *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  _BOOL4 v57;
  uint64_t v58;
  void *v60;
  void *v61;
  id v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[6];
  _QWORD v67[6];
  _QWORD v68[6];
  _QWORD v69[5];
  _QWORD v70[4];
  id v71;
  _QWORD v72[5];
  _QWORD v73[4];
  id v74;
  id v75;
  unint64_t v76;
  _QWORD aBlock[6];
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  uint64_t v84;
  id *v85;
  uint64_t v86;
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  uint8_t buf[4];
  void *v95;
  uint64_t v96;

  v57 = a8;
  v96 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v63 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(_QWORD))a9;
  v84 = 0;
  v85 = (id *)&v84;
  v86 = 0x3032000000;
  v87 = __Block_byref_object_copy_;
  v88 = __Block_byref_object_dispose_;
  v89 = 0;
  v78 = 0;
  v79 = &v78;
  v80 = 0x3032000000;
  v81 = __Block_byref_object_copy_;
  v82 = __Block_byref_object_dispose_;
  v83 = 0;
  v60 = v14;
  v61 = v15;
  v58 = FCSFirstGlanceDaysRemainingInFitnessWeek((uint64_t)v14, v15);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke;
  aBlock[3] = &unk_1E8807E58;
  aBlock[4] = &v84;
  aBlock[5] = &v78;
  v17 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "persistentDomainForName:", *MEMORY[0x1E0CB7758]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "objectForKey:", CFSTR("progressAchievementMilestoneOverride"));
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v79[5];
  v79[5] = v20;

  v22 = (os_log_t *)MEMORY[0x1E0CB5298];
  if (v79[5])
  {
    _HKInitializeLogging();
    v23 = *v22;
    if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (void *)v79[5];
      *(_DWORD *)buf = 138412290;
      v95 = v24;
      _os_log_impl(&dword_1CC325000, v23, OS_LOG_TYPE_DEFAULT, "Overriding First Glance progress achievement milestone to '%@'", buf, 0xCu);
    }
  }
  objc_msgSend(v19, "objectForKey:", CFSTR("progressAchievementIdentifierOverride"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    _HKInitializeLogging();
    v26 = *v22;
    if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v95 = v25;
      _os_log_impl(&dword_1CC325000, v26, OS_LOG_TYPE_DEFAULT, "Overriding First Glance progress achievement identifier to '%@'", buf, 0xCu);
    }
    objc_msgSend(v63, "objectForKeyedSubscript:", v25);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v85[5];
    v85[5] = (id)v27;

    if (!v85[5])
    {
      objc_msgSend(v13, "template");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "uniqueName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isEqualToString:", v25);

      if (v31)
      {
        _HKInitializeLogging();
        v32 = *v22;
        if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v95 = v25;
          _os_log_impl(&dword_1CC325000, v32, OS_LOG_TYPE_DEFAULT, "Overriding First Glance progress monthly achievement identifier to '%@'", buf, 0xCu);
        }
        objc_storeStrong(v85 + 5, a3);
      }
    }
  }
  v33 = v85[5];
  if (v13 && !v33)
  {
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_189;
    v73[3] = &unk_1E8807E80;
    v74 = v61;
    v75 = v60;
    v76 = a7;
    v34 = _Block_copy(v73);
    v93 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v93, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCSFirstGlanceAchievementEvaluator _firstAchievementFromAchievements:passingMilestoneTest:completion:](self, "_firstAchievementFromAchievements:passingMilestoneTest:completion:", v35, v34, v17);

    v33 = v85[5];
  }
  if (!v33)
  {
    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_192;
    v72[3] = &__block_descriptor_40_e40___NSString_32__0__ACHAchievement_8d16d24l;
    v72[4] = a7;
    v36 = _Block_copy(v72);
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_2;
    v70[3] = &unk_1E8807EC8;
    v37 = v63;
    v71 = v37;
    objc_msgSend(&unk_1E8814950, "hk_map:", v70);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCSFirstGlanceAchievementEvaluator _firstAchievementFromAchievements:passingMilestoneTest:completion:](self, "_firstAchievementFromAchievements:passingMilestoneTest:completion:", v38, v36, v17);

    v39 = v85[5];
    if (a7 != 3 && !v39)
    {
      v69[0] = MEMORY[0x1E0C809B0];
      v69[1] = 3221225472;
      v69[2] = __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_3;
      v69[3] = &__block_descriptor_40_e40___NSString_32__0__ACHAchievement_8d16d24l;
      v69[4] = a7;
      v40 = _Block_copy(v69);
      objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("LongestMoveStreak"));
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = (void *)v41;
      if (v41)
      {
        v92 = v41;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v92, 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCSFirstGlanceAchievementEvaluator _firstAchievementFromAchievements:passingMilestoneTest:completion:](self, "_firstAchievementFromAchievements:passingMilestoneTest:completion:", v43, v40, v17);

      }
      v39 = v85[5];
    }
    if (!v39 && !v57)
    {
      v68[0] = MEMORY[0x1E0C809B0];
      v68[1] = 3221225472;
      v68[2] = __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_4;
      v68[3] = &__block_descriptor_48_e40___NSString_32__0__ACHAchievement_8d16d24l;
      v68[4] = v58;
      v68[5] = a7;
      v44 = _Block_copy(v68);
      objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("PerfectWeekAll"));
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = (void *)v45;
      if (v45)
      {
        v91 = v45;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v91, 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCSFirstGlanceAchievementEvaluator _firstAchievementFromAchievements:passingMilestoneTest:completion:](self, "_firstAchievementFromAchievements:passingMilestoneTest:completion:", v47, v44, v17);

      }
      v39 = v85[5];
    }
    if (!v39)
    {
      v67[0] = MEMORY[0x1E0C809B0];
      v67[1] = 3221225472;
      v67[2] = __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_5;
      v67[3] = &__block_descriptor_48_e40___NSString_32__0__ACHAchievement_8d16d24l;
      v67[4] = v58;
      v67[5] = a7;
      v48 = _Block_copy(v67);
      objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("7WorkoutWeek"));
      v49 = objc_claimAutoreleasedReturnValue();
      v50 = (void *)v49;
      if (v49)
      {
        v90 = v49;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v90, 1);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCSFirstGlanceAchievementEvaluator _firstAchievementFromAchievements:passingMilestoneTest:completion:](self, "_firstAchievementFromAchievements:passingMilestoneTest:completion:", v51, v48, v17);

      }
      if (!v85[5])
      {
        v66[0] = MEMORY[0x1E0C809B0];
        v66[1] = 3221225472;
        v66[2] = __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_6;
        v66[3] = &__block_descriptor_48_e40___NSString_32__0__ACHAchievement_8d16d24l;
        v66[4] = v58;
        v66[5] = a7;
        v52 = _Block_copy(v66);
        v53 = &unk_1E8814980;
        if (v57)
          v53 = &unk_1E8814968;
        v54 = v53;
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_7;
        v64[3] = &unk_1E8807EC8;
        v65 = v37;
        objc_msgSend(v54, "hk_map:", v64);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCSFirstGlanceAchievementEvaluator _firstAchievementFromAchievements:passingMilestoneTest:completion:](self, "_firstAchievementFromAchievements:passingMilestoneTest:completion:", v55, v52, v17);

        if (!v85[5])
          goto LABEL_35;
      }
    }
  }
  if (v79[5])
  {
    v16[2](v16);
  }
  else
  {
LABEL_35:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 96, 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(void (**)(_QWORD), _QWORD, _QWORD, void *))v16[2])(v16, 0, 0, v56);

  }
  _Block_object_dispose(&v78, 8);

  _Block_object_dispose(&v84, 8);
}

void __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

id __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_189(uint64_t a1, void *a2, double a3, double a4)
{
  id v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = objc_msgSend(*(id *)(a1 + 32), "component:fromDate:", 16, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "rangeOfUnit:inUnit:forDate:", 16, 8, *(_QWORD *)(a1 + 40));
  if (floor((double)v9 * 0.25) != (double)v8)
  {
    _HKInitializeLogging();
    v15 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1CC325000, v15, OS_LOG_TYPE_DEFAULT, "Not coaching for Monthly Challenge progress", (uint8_t *)&v18, 2u);
    }
    goto LABEL_15;
  }
  v10 = v9;
  v11 = CFSTR("QUARTER_IN");
  if (v11)
  {
    if (a3 < a4)
    {
      if (ACHMonthlyChallengeAchievementIsDayBased())
      {
        v12 = v10 - v8;
        if ((uint64_t)a4 - (uint64_t)a3 > v12)
        {
          _HKInitializeLogging();
          v13 = *MEMORY[0x1E0CB5298];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
          {
            v18 = 134218240;
            v19 = (uint64_t)a4 - (uint64_t)a3;
            v20 = 2048;
            v21 = *(double *)&v12;
            _os_log_impl(&dword_1CC325000, v13, OS_LOG_TYPE_DEFAULT, "Not coaching to Monthly Challenge - days needed (%ld) exceed days remaining in month (%ld)", (uint8_t *)&v18, 0x16u);
          }

          v11 = 0;
        }
      }
      goto LABEL_9;
    }
    _HKInitializeLogging();
    v16 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
    {
      v18 = 134218240;
      v19 = *(_QWORD *)&a3;
      v20 = 2048;
      v21 = a4;
      _os_log_impl(&dword_1CC325000, v16, OS_LOG_TYPE_DEFAULT, "Not coaching to Monthly Challenge - progress (%ff) already matches or exceeds goal (%f).", (uint8_t *)&v18, 0x16u);
    }

LABEL_15:
    v14 = 0;
    goto LABEL_16;
  }
LABEL_9:
  ValidMilestoneForExperienceType(v11, *(_QWORD *)(a1 + 48));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v14;
}

id __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_192(uint64_t a1, double a2, double a3)
{
  uint64_t v4;
  __CFString **v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;

  v4 = (uint64_t)a2;
  if ((uint64_t)a2 == vcvtmd_s64_f64(a3 * 0.5))
  {
    v5 = FCSFirstGlanceAchievementProgressHalfway;
  }
  else if (v4 == vcvtmd_s64_f64(a3 * 0.75))
  {
    v5 = &FCSFirstGlanceAchievementProgressThreeQuartersIn;
  }
  else
  {
    v6 = (uint64_t)a3 - v4;
    if (v6 == 3)
    {
      v5 = FCSFirstGlanceAchievementProgressThreeDaysAway;
    }
    else
    {
      if (v6 != 1)
      {
        v7 = 0;
        goto LABEL_10;
      }
      v5 = FCSFirstGlanceAchievementProgressOneDayAway;
    }
  }
  v7 = *v5;
LABEL_10:
  ValidMilestoneForExperienceType(v7, *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "earnedInstanceCount"))
    v3 = 0;
  else
    v3 = v2;

  return v3;
}

id __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_3(uint64_t a1, double a2, double a3)
{
  __CFString **v4;
  __CFString *v5;
  void *v6;

  if ((uint64_t)a2 == vcvtmd_s64_f64(a3 * 0.75))
  {
    v4 = &FCSFirstGlanceAchievementProgressThreeQuartersIn;
  }
  else
  {
    if ((uint64_t)a3 - (uint64_t)a2 != 3)
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = FCSFirstGlanceAchievementProgressThreeDaysAway;
  }
  v5 = *v4;
LABEL_7:
  ValidMilestoneForExperienceType(v5, *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_4(uint64_t a1, double a2, double a3)
{
  uint64_t v4;
  __CFString **v5;
  __CFString *v6;
  void *v7;

  v4 = (uint64_t)a3 - (uint64_t)a2;
  if (v4 == 1)
  {
    if (*(_QWORD *)(a1 + 32) == 1)
    {
      v5 = FCSFirstGlanceAchievementProgressOneDayAway;
      goto LABEL_7;
    }
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  if (v4 != 3 || *(_QWORD *)(a1 + 32) != 3)
    goto LABEL_8;
  v5 = FCSFirstGlanceAchievementProgressThreeDaysAway;
LABEL_7:
  v6 = *v5;
LABEL_9:
  ValidMilestoneForExperienceType(v6, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_5(uint64_t a1, double a2, double a3)
{
  uint64_t v4;
  __CFString **v5;
  __CFString *v6;
  void *v7;

  v4 = (uint64_t)a3 - (uint64_t)a2;
  if (v4 == 1)
  {
    v5 = FCSFirstGlanceAchievementProgressOneDayAway;
    goto LABEL_7;
  }
  if (v4 == 3 && *(uint64_t *)(a1 + 32) >= 3)
  {
    v5 = FCSFirstGlanceAchievementProgressThreeDaysAway;
LABEL_7:
    v6 = *v5;
    goto LABEL_8;
  }
  v6 = 0;
LABEL_8:
  ValidMilestoneForExperienceType(v6, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_6(uint64_t a1, double a2, double a3)
{
  __CFString *v4;
  void *v5;

  if ((uint64_t)a3 - (uint64_t)a2 == 1 && *(_QWORD *)(a1 + 32) == 1)
    v4 = CFSTR("ONE_AWAY");
  else
    v4 = 0;
  ValidMilestoneForExperienceType(v4, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

- (id)progressLocalizationKeyForAchievement:(id)a3 progressMilestone:(id)a4 experienceType:(unint64_t)a5
{
  NSString *progressLocalizationKeyOverride;
  NSString *v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  progressLocalizationKeyOverride = self->_progressLocalizationKeyOverride;
  if (progressLocalizationKeyOverride)
  {
    v6 = progressLocalizationKeyOverride;
  }
  else
  {
    v8 = a4;
    FCSFirstGlanceAchievementLocalizationBundle(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ACHIEVEMENT_UNACHIEVED_PROGRESS_%@_DESC"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    FILocalizationTableForExperienceType();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    FIRandomKeyForPrefixWithTableName();
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)yesterdayLocalizationKeyForAchievement:(id)a3 experienceType:(unint64_t)a4
{
  NSString *yesterdayLocalizationKeyOverride;
  NSString *v5;
  id v6;
  void *v7;
  __CFString *v8;
  int IsLongestMoveStreakAchievement;
  int IsMultipleOfTargetValue;
  uint64_t v11;
  void *v12;

  yesterdayLocalizationKeyOverride = self->_yesterdayLocalizationKeyOverride;
  if (yesterdayLocalizationKeyOverride)
  {
    v5 = yesterdayLocalizationKeyOverride;
  }
  else
  {
    v6 = a3;
    FCSFirstGlanceAchievementLocalizationBundle(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("ACHIEVEMENT_YESTERDAY_DESC");
    IsLongestMoveStreakAchievement = FCSFirstGlanceAchievementIsLongestMoveStreakAchievement(v6);
    IsMultipleOfTargetValue = FCSFirstGlanceAchievementValueIsMultipleOfTargetValue(v6, 50);

    if (IsLongestMoveStreakAchievement && IsMultipleOfTargetValue)
    {
      -[__CFString stringByAppendingString:](v8, "stringByAppendingString:", CFSTR("_MILESTONE"));
      v11 = objc_claimAutoreleasedReturnValue();

      v8 = (__CFString *)v11;
    }
    FILocalizationTableForExperienceType();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    FIRandomKeyForPrefixWithTableName();
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)evaluateYesterdayAchievements:(id)a3 isStandaloneMode:(BOOL)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  BOOL v12;
  _QWORD v13[4];
  BOOL v14;

  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __85__FCSFirstGlanceAchievementEvaluator_evaluateYesterdayAchievements_isStandaloneMode___block_invoke;
  v13[3] = &__block_descriptor_33_e24_B16__0__ACHAchievement_8l;
  v14 = a4;
  objc_msgSend(a3, "hk_filter:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_filter:", &__block_literal_global_248);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __85__FCSFirstGlanceAchievementEvaluator_evaluateYesterdayAchievements_isStandaloneMode___block_invoke_3;
  v11[3] = &__block_descriptor_33_e43_q24__0__ACHAchievement_8__ACHAchievement_16l;
  v12 = a4;
  objc_msgSend(v7, "sortedArrayUsingComparator:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

BOOL __85__FCSFirstGlanceAchievementEvaluator_evaluateYesterdayAchievements_isStandaloneMode___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  FCSFirstGlanceRankingForAchievement(a2, *(unsigned __int8 *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __85__FCSFirstGlanceAchievementEvaluator_evaluateYesterdayAchievements_isStandaloneMode___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  int IsLongestMoveStreakAchievement;
  int IsLessThanTargetValue;
  unsigned int IsMultipleOfTargetValue;

  v2 = a2;
  IsLongestMoveStreakAchievement = FCSFirstGlanceAchievementIsLongestMoveStreakAchievement(v2);
  IsLessThanTargetValue = FCSFirstGlanceAchievementValueIsLessThanTargetValue(v2, 50);
  IsMultipleOfTargetValue = FCSFirstGlanceAchievementValueIsMultipleOfTargetValue(v2, 50);

  return IsLongestMoveStreakAchievement ^ 1 | IsLessThanTargetValue | IsMultipleOfTargetValue;
}

uint64_t __85__FCSFirstGlanceAchievementEvaluator_evaluateYesterdayAchievements_isStandaloneMode___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  int v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(unsigned __int8 *)(a1 + 32);
  v6 = a3;
  FCSFirstGlanceRankingForAchievement(a2, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  FCSFirstGlanceRankingForAchievement(v6, *(unsigned __int8 *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

- (void)_firstAchievementFromAchievements:(id)a3 passingMilestoneTest:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, void *, double, double);
  void (**v9)(id, void *, uint64_t);
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  os_log_t *v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  uint64_t v25;
  os_log_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[4];
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, void *, double, double))a4;
  v9 = (void (**)(id, void *, uint64_t))a5;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    v14 = (os_log_t *)MEMORY[0x1E0CB5298];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v16, "template");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "canonicalUnit");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v16, "goal");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "doubleValueForUnit:", v18);
          v21 = v20;

          objc_msgSend(v16, "progress");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "doubleValueForUnit:", v18);
          v24 = v23;

          if (FCSFirstGlanceAchievementCanCoachWithProgressAndGoal((uint64_t)v24, (uint64_t)v21))
          {
            v8[2](v8, v16, v24, v21);
            v25 = objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              v27 = (void *)v25;
              v9[2](v9, v16, v25);

              goto LABEL_15;
            }
          }
        }
        else
        {
          _HKInitializeLogging();
          v26 = *v14;
          if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
            -[FCSFirstGlanceAchievementEvaluator _firstAchievementFromAchievements:passingMilestoneTest:completion:].cold.1(v32, v26, v16, &v33);
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v12);
  }

  v9[2](v9, 0, 0);
LABEL_15:

}

- (void)setLocalizationKeyOverride:(id)a3
{
  NSString *v5;
  NSString *yesterdayLocalizationKeyOverride;

  v5 = (NSString *)a3;
  objc_storeStrong((id *)&self->_progressLocalizationKeyOverride, a3);
  yesterdayLocalizationKeyOverride = self->_yesterdayLocalizationKeyOverride;
  self->_yesterdayLocalizationKeyOverride = v5;

}

- (FCSFirstGlanceAchievementEvaluatorDataSource)dataSource
{
  return (FCSFirstGlanceAchievementEvaluatorDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_yesterdayLocalizationKeyOverride, 0);
  objc_storeStrong((id *)&self->_progressLocalizationKeyOverride, 0);
}

- (void)_firstAchievementFromAchievements:(void *)a3 passingMilestoneTest:(_QWORD *)a4 completion:.cold.1(uint8_t *a1, void *a2, void *a3, _QWORD *a4)
{
  NSObject *v7;
  void *v8;
  void *v9;

  v7 = a2;
  objc_msgSend(a3, "template");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a4 = v9;
  _os_log_error_impl(&dword_1CC325000, v7, OS_LOG_TYPE_ERROR, "Achievement missing canonical unit, can't evaluating for coaching: %{public}@", a1, 0xCu);

}

@end
