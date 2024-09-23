@implementation ASActivityDataNotificationRulesEngine

- (id)filterNotificationGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  __int128 v12;
  __int128 v13;

  v4 = a3;
  v12 = ASStandardNotificationRuleset;
  v13 = unk_254D06F18;
  -[ASActivityDataNotificationRulesEngine _filterNotificationGroup:ruleset:](self, "_filterNotificationGroup:ruleset:", v4, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allNotifications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v8 = ASStrictNotificationThreshold;

  if (v7 >= v8)
  {
    v12 = ASStrictNotificationRuleset;
    v13 = unk_254D06F38;
    -[ASActivityDataNotificationRulesEngine _filterNotificationGroup:ruleset:](self, "_filterNotificationGroup:ruleset:", v4, &v12);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v5;
  }
  v10 = v9;

  return v10;
}

- (id)_filterNotificationGroup:(id)a3 ruleset:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  __int128 v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  __int128 v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t var2;
  unint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  BOOL v44;
  _BOOL4 var3;
  NSObject *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  ASActivityDataNotificationGroup *v52;
  __int128 v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  id obj;
  void *v59;
  void *v60;
  uint64_t v61;
  _QWORD v63[5];
  _QWORD v64[5];
  _QWORD v65[5];
  __int128 v66;
  __int128 v67;
  _QWORD v68[5];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  void *v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v59 = v4;
  objc_msgSend(v4, "allNotifications");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v76 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
        objc_msgSend(v13, "friend");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v13, "friend");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setByAddingObject:", v15);
          v16 = objc_claimAutoreleasedReturnValue();

          v7 = (void *)v16;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
    }
    while (v10);
  }

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  obj = v7;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
  if (v17)
  {
    v19 = v17;
    v20 = *(_QWORD *)v72;
    *(_QWORD *)&v18 = 138543618;
    v54 = v18;
    v55 = *(_QWORD *)v72;
    do
    {
      v21 = 0;
      v57 = v19;
      do
      {
        if (*(_QWORD *)v72 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v21);
        ASLoggingInitialize();
        v23 = (void *)ASLogNotifications;
        if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
        {
          v24 = v23;
          objc_msgSend(v22, "UUID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v54;
          v80 = v25;
          v81 = 2112;
          v82 = v22;
          _os_log_impl(&dword_21381F000, v24, OS_LOG_TYPE_DEFAULT, "Collecting notifications for friend %{public}@ - %@", buf, 0x16u);

        }
        if (objc_msgSend(v22, "isMuted", v54))
        {
          ASLoggingInitialize();
          v26 = ASLogNotifications;
          if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21381F000, v26, OS_LOG_TYPE_DEFAULT, "Contact is muted, not allowing any notifications", buf, 2u);
          }
        }
        else
        {
          objc_msgSend(v59, "workoutNotifications");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = v6;
          v68[0] = MEMORY[0x24BDAC760];
          v68[1] = 3221225472;
          v68[2] = __74__ASActivityDataNotificationRulesEngine__filterNotificationGroup_ruleset___block_invoke;
          v68[3] = &unk_24D057E20;
          v68[4] = v22;
          v28 = *(_OWORD *)&a4->var2;
          v69 = *(_OWORD *)&a4->var0;
          v70 = v28;
          objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v68);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "filteredSetUsingPredicate:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "setByAddingObjectsFromSet:", v30);
          v61 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v59, "achievementNotifications");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = MEMORY[0x24BDAC760];
          v65[0] = MEMORY[0x24BDAC760];
          v65[1] = 3221225472;
          v65[2] = __74__ASActivityDataNotificationRulesEngine__filterNotificationGroup_ruleset___block_invoke_186;
          v65[3] = &unk_24D057E20;
          v65[4] = v22;
          v33 = *(_OWORD *)&a4->var2;
          v66 = *(_OWORD *)&a4->var0;
          v67 = v33;
          objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v65);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "filteredSetUsingPredicate:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v64[0] = v32;
          v64[1] = 3221225472;
          v64[2] = __74__ASActivityDataNotificationRulesEngine__filterNotificationGroup_ruleset___block_invoke_188;
          v64[3] = &unk_24D057E48;
          v64[4] = v22;
          objc_msgSend(v35, "hk_filter:", v64);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          var2 = a4->var2;
          v38 = objc_msgSend(v36, "count");
          if (var2 >= v38)
            var2 = v38;
          v39 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend(v36, "allObjects");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "subarrayWithRange:", 0, var2);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setWithArray:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v60, "setByAddingObjectsFromSet:", v42);
          v43 = objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v30, "count"))
            v44 = 1;
          else
            v44 = objc_msgSend(v42, "count") != 0;
          var3 = a4->var3;
          ASLoggingInitialize();
          v46 = ASLogNotifications;
          v47 = os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT);
          if (var3 && v44)
          {
            if (v47)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21381F000, v46, OS_LOG_TYPE_DEFAULT, "Goal completions not allowed, skipping", buf, 2u);
            }
          }
          else
          {
            if (v47)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21381F000, v46, OS_LOG_TYPE_DEFAULT, "Goal completions allowed, collecting", buf, 2u);
            }
            objc_msgSend(v59, "goalCompletionNotifications");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v63[0] = MEMORY[0x24BDAC760];
            v63[1] = 3221225472;
            v63[2] = __74__ASActivityDataNotificationRulesEngine__filterNotificationGroup_ruleset___block_invoke_190;
            v63[3] = &unk_24D057E70;
            v63[4] = v22;
            objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v63);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "filteredSetUsingPredicate:", v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v56, "setByAddingObjectsFromSet:", v50);
            v51 = objc_claimAutoreleasedReturnValue();

            v56 = (void *)v51;
          }
          v19 = v57;
          v20 = v55;

          v6 = (void *)v43;
          v5 = (void *)v61;
        }
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
    }
    while (v19);
  }

  v52 = objc_alloc_init(ASActivityDataNotificationGroup);
  -[ASActivityDataNotificationGroup setGoalCompletionNotifications:](v52, "setGoalCompletionNotifications:", v56);
  -[ASActivityDataNotificationGroup setWorkoutNotifications:](v52, "setWorkoutNotifications:", v5);
  -[ASActivityDataNotificationGroup setAchievementNotifications:](v52, "setAchievementNotifications:", v6);

  return v52;
}

uint64_t __74__ASActivityDataNotificationRulesEngine__filterNotificationGroup_ruleset___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  int IsNotificationEventDateBeforeRelationshipBeganWithFriend;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  char v29;
  int v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "friend");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    objc_msgSend(v3, "sample");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ASLoggingInitialize();
    v9 = ASLogNotifications;
    if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
    {
      v31 = 138412290;
      v32 = v8;
      _os_log_impl(&dword_21381F000, v9, OS_LOG_TYPE_DEFAULT, "Evaluating workout: %@", (uint8_t *)&v31, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", v11);
    v13 = v12;
    v14 = *(double *)(a1 + 40);

    if (v13 <= v14)
    {
      objc_msgSend(v8, "endDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      IsNotificationEventDateBeforeRelationshipBeganWithFriend = _IsNotificationEventDateBeforeRelationshipBeganWithFriend(v18, *(void **)(a1 + 32));

      if (IsNotificationEventDateBeforeRelationshipBeganWithFriend)
      {
        ASLoggingInitialize();
        v15 = ASLogNotifications;
        v16 = 0;
        if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v31) = 0;
          v17 = "Workout completed prior to the relationship starting, skipping";
          goto LABEL_17;
        }
      }
      else
      {
        objc_msgSend(v8, "endDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *(void **)(a1 + 32);
        v22 = (void *)MEMORY[0x24BDBCE48];
        v23 = v21;
        objc_msgSend(v22, "hk_gregorianCalendar");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "timeZone");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setTimeZone:", v25);

        objc_msgSend(v23, "currentDateComponents");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "dateFromComponents:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        ASLoggingInitialize();
        v28 = ASLogNotifications;
        if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
        {
          v31 = 138412290;
          v32 = v27;
          _os_log_impl(&dword_21381F000, v28, OS_LOG_TYPE_DEFAULT, "Friend current date: %@", (uint8_t *)&v31, 0xCu);
        }
        v29 = objc_msgSend(v24, "isDate:inSameDayAsDate:", v20, v27);

        if ((v29 & 1) != 0)
        {
          v16 = 1;
        }
        else
        {
          ASLoggingInitialize();
          v15 = ASLogNotifications;
          v16 = 0;
          if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v31) = 0;
            v17 = "Workout is not in the current day for friend, skipping";
            goto LABEL_17;
          }
        }
      }
    }
    else
    {
      ASLoggingInitialize();
      v15 = ASLogNotifications;
      v16 = 0;
      if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v31) = 0;
        v17 = "Workout is too old, skipping";
LABEL_17:
        _os_log_impl(&dword_21381F000, v15, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v31, 2u);
        v16 = 0;
      }
    }

    goto LABEL_19;
  }
  v16 = 0;
LABEL_19:

  return v16;
}

uint64_t __74__ASActivityDataNotificationRulesEngine__filterNotificationGroup_ruleset___block_invoke_186(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "friend");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    objc_msgSend(v3, "sample");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ASLoggingInitialize();
    v9 = ASLogNotifications;
    if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412290;
      v25 = v8;
      _os_log_impl(&dword_21381F000, v9, OS_LOG_TYPE_DEFAULT, "Evaluating achievement: %@", (uint8_t *)&v24, 0xCu);
    }
    if (!v8)
    {
      v12 = 0;
LABEL_23:

      goto LABEL_24;
    }
    if (ACHShouldUseNewAwardsSystem())
    {
      objc_msgSend(v8, "relevantEarnedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "earnedDateComponents");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "earnedInstances");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "earnedDateComponents");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (!v11)
    {
      ASLoggingInitialize();
      v22 = ASLogNotifications;
      v12 = 0;
      if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_21381F000, v22, OS_LOG_TYPE_DEFAULT, "Achievement is missing earned date, skipping", (uint8_t *)&v24, 2u);
        v12 = 0;
      }
      goto LABEL_22;
    }
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dateFromComponents:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceDate:", v15);
    v18 = v17;
    v19 = *(double *)(a1 + 48);

    if (v18 <= v19)
    {
      if (!_IsNotificationEventDateBeforeRelationshipBeganWithFriend(v15, *(void **)(a1 + 32)))
      {
        v12 = 1;
        goto LABEL_21;
      }
      ASLoggingInitialize();
      v20 = ASLogNotifications;
      v12 = 0;
      if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        v21 = "Achievement completed prior to the relationship starting, skipping";
        goto LABEL_19;
      }
    }
    else
    {
      ASLoggingInitialize();
      v20 = ASLogNotifications;
      v12 = 0;
      if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        v21 = "Achievement is too old, skipping";
LABEL_19:
        _os_log_impl(&dword_21381F000, v20, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v24, 2u);
        v12 = 0;
      }
    }
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
  v12 = 0;
LABEL_24:

  return v12;
}

uint64_t __74__ASActivityDataNotificationRulesEngine__filterNotificationGroup_ruleset___block_invoke_188(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  const char *v17;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "sample");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "template");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sample");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "template");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sourceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v6;
  MoveGoal200PercentTemplate();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uniqueName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", v12) & 1) != 0)
    goto LABEL_4;
  MoveGoal300PercentTemplate();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "uniqueName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", v14) & 1) != 0)
  {

LABEL_4:
    goto LABEL_5;
  }
  MoveGoal400PercentTemplate();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "uniqueName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v10, "isEqualToString:", v20);

  if ((v21 & 1) != 0)
  {
LABEL_5:
    ASLoggingInitialize();
    v15 = ASLogNotifications;
    v16 = 0;
    if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 138412290;
      v31 = v10;
      v17 = "Dropping achievement with template unique name %@, move percent";
LABEL_7:
      _os_log_impl(&dword_21381F000, v15, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v30, 0xCu);
      v16 = 0;
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (objc_msgSend(v10, "containsString:", CFSTR("CompetitionParticipation")))
  {
    ASLoggingInitialize();
    v15 = ASLogNotifications;
    v16 = 0;
    if (!os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    v30 = 138412290;
    v31 = v10;
    v17 = "Dropping achievement with template unique name %@, competition participation";
    goto LABEL_7;
  }
  LongestMoveStreakTemplate();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "uniqueName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v10, "isEqualToString:", v23);

  if (v24)
  {
    ASLoggingInitialize();
    v15 = ASLogNotifications;
    v16 = 0;
    if (!os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    v30 = 138412290;
    v31 = v10;
    v17 = "Dropping achievement with template unique name %@, move streak";
    goto LABEL_7;
  }
  if (objc_msgSend(v10, "containsString:", CFSTR("CompetitionVictory")))
  {
    objc_msgSend(*(id *)(a1 + 32), "contact");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "primaryRemoteRelationship");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "UUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "UUIDString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v10, "containsString:", v28);

    if (v29)
    {
      ASLoggingInitialize();
      v15 = ASLogNotifications;
      v16 = 0;
      if (!os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
        goto LABEL_8;
      v30 = 138412290;
      v31 = v10;
      v17 = "Dropping achievement with template unique name %@, competition victory against me";
      goto LABEL_7;
    }
  }
  if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE01648]))
  {
    v16 = 1;
    goto LABEL_8;
  }
  ASLoggingInitialize();
  v15 = ASLogNotifications;
  v16 = 0;
  if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    v30 = 138412290;
    v31 = v10;
    v17 = "Dropping achievement with template unique name %@, source is Remote";
    goto LABEL_7;
  }
LABEL_8:

  return v16;
}

uint64_t __74__ASActivityDataNotificationRulesEngine__filterNotificationGroup_ruleset___block_invoke_190(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  int IsNotificationEventDateBeforeRelationshipBeganWithFriend;
  NSObject *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  int v21;
  int v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "friend");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    objc_msgSend(v3, "sample");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ASLoggingInitialize();
    v9 = ASLogNotifications;
    if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412290;
      v24 = (uint64_t)v8;
      _os_log_impl(&dword_21381F000, v9, OS_LOG_TYPE_DEFAULT, "Evaluating snapshot: %@", (uint8_t *)&v23, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "currentCacheIndex");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "longLongValue");

    v12 = objc_msgSend(v8, "snapshotIndex");
    ASLoggingInitialize();
    v13 = ASLogNotifications;
    if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 134217984;
      v24 = v11;
      _os_log_impl(&dword_21381F000, v13, OS_LOG_TYPE_DEFAULT, "friend current index: %lld", (uint8_t *)&v23, 0xCu);
    }
    ASLoggingInitialize();
    v14 = ASLogNotifications;
    if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 134217984;
      v24 = v12;
      _os_log_impl(&dword_21381F000, v14, OS_LOG_TYPE_DEFAULT, "Snapshot index: %lld", (uint8_t *)&v23, 0xCu);
    }
    if (v11 == v12)
    {
      objc_msgSend(v8, "snapshotUploadedDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      IsNotificationEventDateBeforeRelationshipBeganWithFriend = _IsNotificationEventDateBeforeRelationshipBeganWithFriend(v15, *(void **)(a1 + 32));

      if (IsNotificationEventDateBeforeRelationshipBeganWithFriend)
      {
        ASLoggingInitialize();
        v17 = ASLogNotifications;
        v18 = 0;
        if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v23) = 0;
          v19 = "Snapshot uploaded prior to relationship starting, skipping";
LABEL_18:
          _os_log_impl(&dword_21381F000, v17, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v23, 2u);
          v18 = 0;
        }
      }
      else
      {
        objc_msgSend(v8, "endDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = _IsNotificationEventDateBeforeRelationshipBeganWithFriend(v20, *(void **)(a1 + 32));

        if (!v21)
        {
          v18 = 1;
          goto LABEL_20;
        }
        ASLoggingInitialize();
        v17 = ASLogNotifications;
        v18 = 0;
        if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v23) = 0;
          v19 = "Snapshot is for a date prior to when the relationship began, skipping";
          goto LABEL_18;
        }
      }
    }
    else
    {
      ASLoggingInitialize();
      v17 = ASLogNotifications;
      v18 = 0;
      if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        v19 = "Snapshot is not in the current day for friend, skipping";
        goto LABEL_18;
      }
    }
LABEL_20:

    goto LABEL_21;
  }
  v18 = 0;
LABEL_21:

  return v18;
}

@end
