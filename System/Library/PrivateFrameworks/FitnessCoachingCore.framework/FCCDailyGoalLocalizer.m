@implementation FCCDailyGoalLocalizer

+ (id)localizedAppName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("FITNESS_APP_NAME"), &stru_1E6210A10, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)localizedTitleForIncompleteGoalTypes:(id)a3 percentComplete:(double)a4 valueRemaining:(double)a5 progressEventIdentifier:(id)a6 experienceType:(unint64_t)a7 isStandalone:(BOOL)a8
{
  _BOOL4 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a8;
  objc_msgSend(a1, "_keyForEventType:aboveAverage:", a6, a5 < 0.0, a7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("_STANDALONE"));
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GOAL_INCOMPLETE_TITLE_%@"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  FILocalizationTableForExperienceType();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  FIRandomStringForPrefixWithTableName();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)localizedDescriptionForIncompleteGoalTypes:(id)a3 percentComplete:(double)a4 value:(double)a5 valueRemaining:(double)a6 date:(id)a7 firstName:(id)a8 moveUnit:(id)a9 isWheelchairUser:(BOOL)a10 progressEventIdentifier:(id)a11 minutesToWalkToCompleteRing:(int64_t)a12 hasCurrentMoveStreak:(BOOL)a13 experienceType:(unint64_t)a14 isStandalone:(BOOL)a15
{
  id v20;
  id v21;
  id v22;
  void *v23;
  __CFString *v24;
  const __CFString *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  const __CFString *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t k;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  os_log_t *v68;
  NSObject *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t m;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  int v83;
  void *v84;
  unint64_t v85;
  void *v86;
  const __CFString *v87;
  void *v88;
  int v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  NSObject *v100;
  void *v102;
  void *v103;
  _BOOL4 v104;
  __CFString *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  void *v109;
  id v110;
  id v111;
  id v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  _QWORD v133[4];

  v104 = a10;
  v133[2] = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v21 = a8;
  v112 = a9;
  v22 = a11;
  objc_msgSend(v20, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_keyForGoalType:", objc_msgSend(v23, "integerValue"));
  v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v111 = a1;
  v107 = v20;
  if (objc_msgSend(v20, "count") == 3)
  {
    v25 = CFSTR("ALL");
LABEL_11:

    v36 = v25;
    goto LABEL_12;
  }
  v26 = v22;
  objc_msgSend(v20, "lastObject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "integerValue");

  if (v28 == 4)
  {
    v25 = CFSTR("ALL");
LABEL_10:
    v22 = v26;
    goto LABEL_11;
  }
  if (objc_msgSend(v20, "count") == 2)
  {
    v29 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v20, "firstObject");
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_keyForGoalType:", -[__CFString integerValue](v30, "integerValue"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "lastObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_keyForGoalType:", objc_msgSend(v32, "integerValue"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("%@_%@"), v31, v33);
    v25 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    a1 = v111;
    v24 = v30;
    goto LABEL_10;
  }
  objc_msgSend(v20, "firstObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "isEqual:", &unk_1E62196E8);

  if (v35 && a13)
  {
    v25 = CFSTR("MOVE_STREAK");
    goto LABEL_10;
  }
  v22 = v26;
  v36 = v24;
LABEL_12:
  v106 = v22;
  objc_msgSend(a1, "_keyForEventType:aboveAverage:", v22, a6 < 0.0);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GOAL_INCOMPLETE_DESCRIPTION_%@_%@"), v36, v103);
  v108 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "unitString");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "uppercaseString");
  v38 = objc_claimAutoreleasedReturnValue();

  v39 = (void *)MEMORY[0x1E0C99DE8];
  v109 = (void *)v38;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_%@"), v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "arrayWithObjects:", &stru_1E6210A10, v40, 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByTrimmingCharactersInSet:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v43, "length"))
    {
      v133[0] = CFSTR("_NAME");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_NAME_%@"), v109);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v133[1] = v44;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v133, 2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addObjectsFromArray:", v45);

    }
  }
  v110 = v21;
  if (a12 >= 1)
  {
    v125 = 0u;
    v126 = 0u;
    v127 = 0u;
    v128 = 0u;
    v46 = (id)objc_msgSend(v41, "copy");
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v125, v132, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v126;
      do
      {
        for (i = 0; i != v48; ++i)
        {
          if (*(_QWORD *)v126 != v49)
            objc_enumerationMutation(v46);
          objc_msgSend(*(id *)(*((_QWORD *)&v125 + 1) + 8 * i), "stringByAppendingString:", CFSTR("_WALK"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addObject:", v51);

        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v125, v132, 16);
      }
      while (v48);
    }

    v21 = v110;
    a1 = v111;
  }
  v52 = (void *)v108;
  if (v104)
  {
    v121 = 0u;
    v122 = 0u;
    v123 = 0u;
    v124 = 0u;
    v53 = (id)objc_msgSend(v41, "copy");
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v121, v131, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v122;
      do
      {
        for (j = 0; j != v55; ++j)
        {
          if (*(_QWORD *)v122 != v56)
            objc_enumerationMutation(v53);
          objc_msgSend(*(id *)(*((_QWORD *)&v121 + 1) + 8 * j), "stringByAppendingString:", CFSTR("_WHEELCHAIR"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addObject:", v58);

        }
        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v121, v131, 16);
      }
      while (v55);
    }

    v21 = v110;
    a1 = v111;
  }
  v105 = (__CFString *)v36;
  if (a15)
  {
    v117 = 0u;
    v118 = 0u;
    v119 = 0u;
    v120 = 0u;
    v59 = (id)objc_msgSend(v41, "copy");
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v117, v130, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v118;
      do
      {
        for (k = 0; k != v61; ++k)
        {
          if (*(_QWORD *)v118 != v62)
            objc_enumerationMutation(v59);
          objc_msgSend(*(id *)(*((_QWORD *)&v117 + 1) + 8 * k), "stringByAppendingString:", CFSTR("_STANDALONE"));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addObject:", v64);

        }
        v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v117, v130, 16);
      }
      while (v61);
    }

    a1 = v111;
  }
  FILocalizationTableForExperienceType();
  v65 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  FIRandomStringWithKeyAndPossibleSuffixesWithTableName();
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v67, "containsString:", CFSTR("<hours-remaining>")))
    goto LABEL_57;
  _HKInitializeLogging();
  v68 = (os_log_t *)MEMORY[0x1E0CB5298];
  v69 = *MEMORY[0x1E0CB5298];
  v70 = v112;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEBUG))
    +[FCCDailyGoalLocalizer localizedDescriptionForIncompleteGoalTypes:percentComplete:value:valueRemaining:date:firstName:moveUnit:isWheelchairUser:progressEventIdentifier:minutesToWalkToCompleteRing:hasCurrentMoveStreak:experienceType:isStandalone:].cold.3(v69, a6);
  if (ceil(a6) == 1.0)
  {
    _HKInitializeLogging();
    v71 = *v68;
    if (os_log_type_enabled(*v68, OS_LOG_TYPE_DEBUG))
      +[FCCDailyGoalLocalizer localizedDescriptionForIncompleteGoalTypes:percentComplete:value:valueRemaining:date:firstName:moveUnit:isWheelchairUser:progressEventIdentifier:minutesToWalkToCompleteRing:hasCurrentMoveStreak:experienceType:isStandalone:].cold.2(v71);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    v116 = 0u;
    v73 = v41;
    v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v113, v129, 16);
    if (v74)
    {
      v75 = v74;
      v76 = *(_QWORD *)v114;
      do
      {
        for (m = 0; m != v75; ++m)
        {
          if (*(_QWORD *)v114 != v76)
            objc_enumerationMutation(v73);
          objc_msgSend(CFSTR("_SINGULAR"), "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * m));
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "addObject:", v78);

        }
        v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v113, v129, 16);
      }
      while (v75);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v72);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)v108;
    v21 = v110;
    FIRandomStringWithKeyAndPossibleSuffixesWithTableName();
    v81 = objc_claimAutoreleasedReturnValue();

    a1 = v111;
    v67 = (void *)v81;
LABEL_57:
    v70 = v112;
  }
  objc_msgSend(MEMORY[0x1E0CB6CD0], "jouleUnitWithMetricPrefix:", 9);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v70, "isEqual:", v82);

  v102 = (void *)v65;
  if (v83)
  {
    objc_msgSend(v52, "stringByAppendingString:", CFSTR("_KILOJOULES_REMAINING"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = a14;
    objc_msgSend(a1, "_localizeCount:forKey:experienceType:", v84, a14, a6);
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    v87 = CFSTR("<kilojoules-remaining>");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB6CD0], "minuteUnit");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v70, "isEqual:", v88);

    if (v89)
    {
      objc_msgSend(v52, "stringByAppendingString:", CFSTR("_MOVE_MINUTES_REMAINING"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = a14;
      objc_msgSend(a1, "_localizeCount:forKey:experienceType:", v90, a14, a6);
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      v87 = CFSTR("<move-minutes-remaining>");
    }
    else
    {
      objc_msgSend(v52, "stringByAppendingString:", CFSTR("_CALORIES_REMAINING"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = a14;
      objc_msgSend(a1, "_localizeCount:forKey:experienceType:", v91, a14, a6);
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      v87 = CFSTR("<calories-remaining>");
    }
  }
  objc_msgSend(v67, "stringByReplacingOccurrencesOfString:withString:", v87, v86);
  v92 = v52;
  v93 = a1;
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v92, "stringByAppendingString:", CFSTR("_WALK_VALUE"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "_localizeCount:forKey:experienceType:", v95, v85, (double)a12);
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  FILocalizeCount();
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<walk-value>"), v96);
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v98, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<hours-remaining>"), v97);
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v99)
  {
    _HKInitializeLogging();
    v100 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_ERROR))
      +[FCCDailyGoalLocalizer localizedDescriptionForIncompleteGoalTypes:percentComplete:value:valueRemaining:date:firstName:moveUnit:isWheelchairUser:progressEventIdentifier:minutesToWalkToCompleteRing:hasCurrentMoveStreak:experienceType:isStandalone:].cold.1(v100);
  }

  return v99;
}

+ (id)localizedTitleForGoalsCompleted:(id)a3 isWheelchairUser:(BOOL)a4 experienceType:(unint64_t)a5
{
  _BOOL4 v5;
  id v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  const __CFString *v18;

  v5 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "count") == 3
    || (objc_msgSend(v6, "firstObject"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "integerValue"),
        v7,
        v8 == 4))
  {
    v9 = CFSTR("ALL");
  }
  else if (objc_msgSend(v6, "count") == 2)
  {
    v9 = CFSTR("TWO");
  }
  else
  {
    objc_msgSend(v6, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "unsignedIntegerValue");

    if (v16 == 3)
    {
      if (v5)
        v18 = CFSTR("_WHEELCHAIR");
      else
        v18 = &stru_1E6210A10;
      objc_msgSend(CFSTR("STAND"), "stringByAppendingString:", v18);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = CFSTR("UNDEFINED");
      if (v16 == 1)
        v17 = CFSTR("MOVE");
      if (v16 == 2)
        v9 = CFSTR("EXERCISE");
      else
        v9 = (__CFString *)v17;
    }
  }
  objc_msgSend(CFSTR("GOAL_COMPLETE_TITLE_"), "stringByAppendingString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  FILocalizationTableForExperienceType();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  FIRandomStringForPrefixWithTableName();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)localizedDescriptionForGoalsCompleted:(id)a3 singleGoalExceeded:(BOOL)a4 date:(id)a5 firstName:(id)a6 isWheelchairUser:(BOOL)a7 experienceType:(unint64_t)a8 isStandalone:(BOOL)a9
{
  _BOOL4 v9;
  _BOOL4 v12;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  __CFString *v20;
  char v21;
  const __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __CFString *v43;
  void *v44;
  void *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v9 = a7;
  v12 = a4;
  v57 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  if ((unint64_t)objc_msgSend(v14, "count") > 2)
  {
    objc_msgSend(a1, "_keyForGoalType:", 4);
    v17 = objc_claimAutoreleasedReturnValue();
    v19 = 1;
  }
  else
  {
    objc_msgSend(a1, "_keyForGoalTypes:", v14);
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "integerValue") == 4;

  }
  if (objc_msgSend(v14, "count") == 2)
  {
    v20 = &stru_1E6210A10;
  }
  else
  {
    objc_msgSend(a1, "_keyForTimeOfDayAtDate:", v15);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v14, "count") == 3
    && -[__CFString isEqualToString:](v20, "isEqualToString:", CFSTR("_LATEEVENING")))
  {

    v20 = CFSTR("_EVENING");
  }
  v21 = (unint64_t)objc_msgSend(v14, "count") > 1 || v19;
  if ((v21 & 1) != 0)
  {
    v22 = &stru_1E6210A10;
  }
  else
  {
    v23 = CFSTR("_MET");
    if (v12)
      v23 = CFSTR("_EXCEEDED");
    v22 = v23;
  }
  v43 = (__CFString *)v22;
  v44 = (void *)v17;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GOAL_COMPLETE_DESCRIPTION_%@%@%@"), v17, v20, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", &stru_1E6210A10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v16)
    objc_msgSend(v25, "addObject:", CFSTR("_NAME"));
  v45 = v16;
  v46 = v15;
  if (v9)
  {
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v27 = (id)objc_msgSend(v26, "copy");
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v52 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "stringByAppendingString:", CFSTR("_WHEELCHAIR"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v32);

        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v29);
    }

    v15 = v46;
  }
  if (a9)
  {
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v33 = (id)objc_msgSend(v26, "copy");
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v48 != v36)
            objc_enumerationMutation(v33);
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * j), "stringByAppendingString:", CFSTR("_STANDALONE"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v38);

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      }
      while (v35);
    }

    v15 = v46;
  }
  FILocalizationTableForExperienceType();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  FIRandomStringWithKeyAndPossibleSuffixesWithTableName();
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

+ (id)_keyForGoalType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return &stru_1E6210A10;
  else
    return off_1E6210190[a3 - 1];
}

+ (id)_keyForTimeOfDayAtDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  unint64_t v6;
  const __CFString *v8;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "component:fromDate:", 32, v4);

  if (v6 < 4)
    return CFSTR("_MIDDLENIGHT");
  if (v6 < 8)
    return CFSTR("_EARLYMORNING");
  if (v6 < 0xC)
    return CFSTR("_LATEMORNING");
  v8 = CFSTR("_LATEEVENING");
  if (v6 < 0x13)
    v8 = CFSTR("_EVENING");
  if (v6 >= 0x10)
    return (id)v8;
  else
    return CFSTR("_AFTERNOON");
}

+ (id)_keyForGoalTypes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "_keyForGoalType:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "unsignedIntegerValue", (_QWORD)v14));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("_"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_keyForEventType:(id)a3 aboveAverage:(BOOL)a4
{
  id v5;
  const __CFString *v6;

  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.nanolifestyle.NLCoachingProgressMorningUpdateEvent"))&& a4)
  {
    v6 = CFSTR("EARLY_OVERACHIEVER");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.nanolifestyle.NLCoachingProgressMorningUpdateEvent")) & 1) != 0)
  {
    v6 = CFSTR("EARLY");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.nanolifestyle.NLCoachingProgressEveningUpdateEvent")) & 1) != 0)
  {
    v6 = CFSTR("LATE");
  }
  else
  {
    objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.nanolifestyle.NLCoachingProgressAlmostThereEvent"));
    v6 = CFSTR("ALMOST_THERE");
  }

  return (id)v6;
}

+ (id)_localizeCount:(double)a3 forKey:(id)a4 experienceType:(unint64_t)a5
{
  id v7;
  id v8;
  unint64_t v9;
  _QWORD *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v7 = a4;
  v8 = (id)*MEMORY[0x1E0D216C8];
  v9 = a5 & 0xFFFFFFFFFFFFFFFELL;
  v10 = (_QWORD *)MEMORY[0x1E0D216D0];
  v11 = v8;
  if (v9 == 2)
  {
    v11 = (id)*MEMORY[0x1E0D216D0];

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", v7, &stru_1E6210A10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "isEqualToString:", v7)
    && objc_msgSend(v11, "isEqualToString:", *v10))
  {
    v14 = v8;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", v7, &stru_1E6210A10, v14);
    v16 = objc_claimAutoreleasedReturnValue();

    v11 = v14;
    v13 = (void *)v16;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v13, vcvtpd_s64_f64(a3));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (void)localizedDescriptionForIncompleteGoalTypes:(os_log_t)log percentComplete:value:valueRemaining:date:firstName:moveUnit:isWheelchairUser:progressEventIdentifier:minutesToWalkToCompleteRing:hasCurrentMoveStreak:experienceType:isStandalone:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B0C58000, log, OS_LOG_TYPE_ERROR, "Trying to add or update a bulletin that we can't localize! PLEASE FILE A RADAR.", v1, 2u);
}

+ (void)localizedDescriptionForIncompleteGoalTypes:(os_log_t)log percentComplete:value:valueRemaining:date:firstName:moveUnit:isWheelchairUser:progressEventIdentifier:minutesToWalkToCompleteRing:hasCurrentMoveStreak:experienceType:isStandalone:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B0C58000, log, OS_LOG_TYPE_DEBUG, "Localization value is singular, trying singular suffixes", v1, 2u);
}

+ (void)localizedDescriptionForIncompleteGoalTypes:(os_log_t)log percentComplete:(double)a2 value:valueRemaining:date:firstName:moveUnit:isWheelchairUser:progressEventIdentifier:minutesToWalkToCompleteRing:hasCurrentMoveStreak:experienceType:isStandalone:.cold.3(os_log_t log, double a2)
{
  int v2;
  double v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a2;
  _os_log_debug_impl(&dword_1B0C58000, log, OS_LOG_TYPE_DEBUG, "Localization checking for singular using remaining value %lf", (uint8_t *)&v2, 0xCu);
}

@end
