@implementation ACHMonthlyChallengeTemplateSource

- (ACHMonthlyChallengeTemplateSource)initWithDataSource:(id)a3 dataProvider:(id)a4 templateCache:(id)a5
{
  id v9;
  id v10;
  id v11;
  ACHMonthlyChallengeTemplateSource *v12;
  uint64_t v13;
  NSCalendar *currentCalendar;
  uint64_t v15;
  NSDate *currentDate;
  void *v17;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ACHMonthlyChallengeTemplateSource;
  v12 = -[ACHMonthlyChallengeTemplateSource init](&v19, sel_init);
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendarWithLocalTimeZone");
    v13 = objc_claimAutoreleasedReturnValue();
    currentCalendar = v12->_currentCalendar;
    v12->_currentCalendar = (NSCalendar *)v13;

    objc_storeStrong((id *)&v12->_dataSource, a3);
    objc_storeStrong((id *)&v12->_templateDataProvider, a4);
    objc_storeStrong((id *)&v12->_templateCache, a5);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v15 = objc_claimAutoreleasedReturnValue();
    currentDate = v12->_currentDate;
    v12->_currentDate = (NSDate *)v15;

    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_isAppleWatch = objc_msgSend(v17, "isAppleWatch");

  }
  return v12;
}

- (NSString)identifier
{
  return (NSString *)(id)*MEMORY[0x24BE01638];
}

- (int64_t)runCadence
{
  return 2;
}

- (BOOL)sourceShouldRunForDate:(id)a3
{
  return !-[ACHMonthlyChallengeTemplateSource isAppleWatch](self, "isAppleWatch", a3);
}

- (int64_t)_monthlyChallengeTemplateSourceActionForDate:(id)a3 existingTemplate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  char v10;
  int64_t v11;
  void *v12;
  char v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v18;

  v6 = a3;
  v7 = objc_alloc(MEMORY[0x24BDBCF50]);
  v8 = (void *)objc_msgSend(v7, "initWithSuiteName:", *MEMORY[0x24BE01538]);
  v9 = objc_msgSend(v8, "BOOLForKey:", *MEMORY[0x24BE01228]);
  v10 = objc_msgSend(v8, "BOOLForKey:", *MEMORY[0x24BE01220]);
  v11 = v9 ^ 1u;
  if ((v9 & 1) == 0 && (v10 & 1) == 0)
  {
    if (-[ACHMonthlyChallengeTemplateSource _shouldOverrideMonthlyChallengeCadence](self, "_shouldOverrideMonthlyChallengeCadence"))
    {
      v11 = 2;
    }
    else if (-[ACHMonthlyChallengeTemplateSource _isInFirstWeekOfCurrentMonth:](self, "_isInFirstWeekOfCurrentMonth:", v6))
    {
      -[ACHMonthlyChallengeTemplateSource templateDataProvider](self, "templateDataProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      v13 = objc_msgSend(v12, "hasMinimumActiveDaysWithError:", &v18);
      v14 = v18;

      v15 = 5;
      if (!a4)
        v15 = 6;
      v16 = 7;
      if (!v14)
        v16 = 4;
      if ((v13 & 1) != 0)
        v11 = v15;
      else
        v11 = v16;
    }
    else
    {
      v11 = 3;
    }
  }

  return v11;
}

- (void)templatesForDate:(id)a3 completion:(id)a4
{
  -[ACHMonthlyChallengeTemplateSource templatesForDate:databaseContext:completion:](self, "templatesForDate:databaseContext:completion:", a3, 0, a4);
}

- (void)templatesForDate:(id)a3 databaseContext:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  void (**v29)(id, id, id, id);
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  void (**v55)(id, id, id, id);
  id v56;
  ACHMonthlyChallengeTemplateSource *v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  id v72;
  _QWORD v73[4];
  id v74;
  id v75;
  id v76;
  uint64_t *v77;
  id v78;
  _QWORD v79[4];
  id v80;
  _QWORD v81[4];
  id v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  uint8_t buf[4];
  void *v91;
  __int16 v92;
  id v93;
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v56 = a4;
  v54 = v8;
  v55 = (void (**)(id, id, id, id))a5;
  if (-[ACHMonthlyChallengeTemplateSource sourceShouldRunForDate:](self, "sourceShouldRunForDate:", v8))
  {
    v57 = self;
    -[ACHMonthlyChallengeTemplateSource dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDatabaseContext:", v56);

    -[ACHMonthlyChallengeTemplateSource templateCache](self, "templateCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDatabaseContext:", v56);

    -[ACHMonthlyChallengeTemplateSource templateDataProvider](self, "templateDataProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "existingMonthlyChallengeTemplates");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[ACHMonthlyChallengeTemplateSource _dateComponentIntervalForCurrentMonth](self, "_dateComponentIntervalForCurrentMonth");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = 0;
    v85 = &v84;
    v86 = 0x3032000000;
    v87 = __Block_byref_object_copy__20;
    v88 = __Block_byref_object_dispose__20;
    v89 = 0;
    v14 = MEMORY[0x24BDAC760];
    v81[0] = MEMORY[0x24BDAC760];
    v81[1] = 3221225472;
    v81[2] = __81__ACHMonthlyChallengeTemplateSource_templatesForDate_databaseContext_completion___block_invoke;
    v81[3] = &unk_24D13C148;
    v52 = v13;
    v82 = v52;
    v83 = &v84;
    objc_msgSend(v12, "hk_map:", v81);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    v79[0] = v14;
    v79[1] = 3221225472;
    v79[2] = __81__ACHMonthlyChallengeTemplateSource_templatesForDate_databaseContext_completion___block_invoke_3;
    v79[3] = &unk_24D13C1B0;
    v80 = &__block_literal_global_19;
    objc_msgSend(v15, "hk_map:", v79);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHMonthlyChallengeTemplateSource templateCache](self, "templateCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = 0;
    objc_msgSend(v16, "allCachedTemplatesWithError:", &v78);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v78;

    if (v51)
    {
      ACHLogMonthlyChallenges();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[ACHMonthlyChallengeTemplateSource templatesForDate:databaseContext:completion:].cold.1((uint64_t)v51, v17, v18);

    }
    if (objc_msgSend(v53, "count"))
    {
      v19 = objc_alloc_init(MEMORY[0x24BDBCE68]);
      objc_msgSend(v52, "startDateComponents");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setYear:", objc_msgSend(v20, "year"));

      objc_msgSend(v52, "startDateComponents");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setMonth:", objc_msgSend(v21, "month"));

      v73[0] = v14;
      v73[1] = 3221225472;
      v73[2] = __81__ACHMonthlyChallengeTemplateSource_templatesForDate_databaseContext_completion___block_invoke_195;
      v73[3] = &unk_24D13C1D8;
      v76 = &__block_literal_global_19;
      v74 = v49;
      v22 = v19;
      v75 = v22;
      v77 = &v84;
      objc_msgSend(v53, "hk_map:", v73);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "count"))
      {
        objc_msgSend(v15, "setByAddingObjectsFromArray:", v23);
        v24 = objc_claimAutoreleasedReturnValue();

        v15 = (id)v24;
      }

    }
    switch(-[ACHMonthlyChallengeTemplateSource _monthlyChallengeTemplateSourceActionForDate:existingTemplate:](self, "_monthlyChallengeTemplateSourceActionForDate:existingTemplate:", v8, v85[5]))
    {
      case 0:
        ACHLogMonthlyChallenges();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21407B000, v25, OS_LOG_TYPE_DEFAULT, "User has tapped the Monthly Challenge generation button.", buf, 2u);
        }

        v71 = 0;
        v72 = v15;
        -[ACHMonthlyChallengeTemplateSource _createMonthlyChallengeWithMonthDateInterval:monthlyChallengeTemplates:error:](self, "_createMonthlyChallengeWithMonthDateInterval:monthlyChallengeTemplates:error:", v52, &v72, &v71);
        v26 = v72;

        v27 = v71;
        goto LABEL_39;
      case 1:
        ACHLogMonthlyChallenges();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21407B000, v30, OS_LOG_TYPE_DEFAULT, "User has tapped the Monthly Challenge delete button.", buf, 2u);
        }

        v31 = v85[5];
        v69 = 0;
        v70 = v15;
        -[ACHMonthlyChallengeTemplateSource _removeMonthlyChallengeTemplate:monthlyChallengeTemplates:templatesToRemove:](self, "_removeMonthlyChallengeTemplate:monthlyChallengeTemplates:templatesToRemove:", v31, &v70, &v69);
        v26 = v70;

        v48 = v69;
        v50 = 0;
        goto LABEL_40;
      case 2:
        ACHLogMonthlyChallenges();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21407B000, v32, OS_LOG_TYPE_DEFAULT, "Overriding monthly challenge cadence; deleting old monthly challenge and generating a new one.",
            buf,
            2u);
        }

        v33 = v85[5];
        v67 = 0;
        v68 = v15;
        -[ACHMonthlyChallengeTemplateSource _removeMonthlyChallengeTemplate:monthlyChallengeTemplates:templatesToRemove:](self, "_removeMonthlyChallengeTemplate:monthlyChallengeTemplates:templatesToRemove:", v33, &v68, &v67);
        v34 = v68;

        v48 = v67;
        v65 = 0;
        v66 = v34;
        -[ACHMonthlyChallengeTemplateSource _createMonthlyChallengeWithMonthDateInterval:monthlyChallengeTemplates:error:](self, "_createMonthlyChallengeWithMonthDateInterval:monthlyChallengeTemplates:error:", v52, &v66, &v65);
        v15 = v66;

        v50 = v65;
        if (v50)
          goto LABEL_41;
        -[ACHMonthlyChallengeTemplateSource _didOverrideMonthlyChallengeCadence](self, "_didOverrideMonthlyChallengeCadence");
        goto LABEL_35;
      case 3:
        ACHLogMonthlyChallenges();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21407B000, v35, OS_LOG_TYPE_DEFAULT, "Not generating monthly challenge template for current month because not the first week of the month.", buf, 2u);
        }
        goto LABEL_33;
      case 4:
        ACHLogMonthlyChallenges();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21407B000, v35, OS_LOG_TYPE_DEFAULT, "Not generating monthly challenge template for current month because user does not have minimum active days.", buf, 2u);
        }
        goto LABEL_33;
      case 5:
        ACHLogMonthlyChallenges();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend((id)v85[5], "uniqueName");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v91 = v36;
          _os_log_impl(&dword_21407B000, v35, OS_LOG_TYPE_DEFAULT, "Not generating monthly challenge template for current month because one already exists for the month: %{public}@", buf, 0xCu);

        }
        goto LABEL_33;
      case 6:
        ACHLogMonthlyChallenges();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21407B000, v37, OS_LOG_TYPE_DEFAULT, "Attempting to generate a monthly challenge for the current month.", buf, 2u);
        }

        v63 = 0;
        v64 = v15;
        -[ACHMonthlyChallengeTemplateSource _createMonthlyChallengeWithMonthDateInterval:monthlyChallengeTemplates:error:](self, "_createMonthlyChallengeWithMonthDateInterval:monthlyChallengeTemplates:error:", v52, &v64, &v63);
        v26 = v64;

        v27 = v63;
LABEL_39:
        v50 = v27;
        v48 = 0;
LABEL_40:
        v15 = v26;
        goto LABEL_41;
      case 7:
        ACHLogMonthlyChallenges();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21407B000, v35, OS_LOG_TYPE_DEFAULT, "Not generating monthly challenge template for current month because we encountered an error condition.", buf, 2u);
        }
LABEL_33:

        goto LABEL_34;
      default:
LABEL_34:
        v48 = 0;
LABEL_35:
        v50 = 0;
LABEL_41:
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v38 = v15;
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v59, v94, 16);
        if (v39)
        {
          v40 = *(_QWORD *)v60;
          do
          {
            for (i = 0; i != v39; ++i)
            {
              if (*(_QWORD *)v60 != v40)
                objc_enumerationMutation(v38);
              v42 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
              -[ACHMonthlyChallengeTemplateSource templateCache](v57, "templateCache");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = 0;
              objc_msgSend(v43, "cacheTemplate:error:", v42, &v58);
              v44 = v58;

              if (v44)
              {
                ACHLogMonthlyChallenges();
                v45 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v91 = v42;
                  v92 = 2112;
                  v93 = v44;
                  _os_log_impl(&dword_21407B000, v45, OS_LOG_TYPE_DEFAULT, "[#mc] Error caching template %@: %@", buf, 0x16u);
                }

              }
            }
            v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v59, v94, 16);
          }
          while (v39);
        }

        if (v55)
          v55[2](v55, v38, v48, v50);
        -[ACHMonthlyChallengeTemplateSource dataSource](v57, "dataSource");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setDatabaseContext:", 0);

        -[ACHMonthlyChallengeTemplateSource templateCache](v57, "templateCache");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setDatabaseContext:", 0);

        _Block_object_dispose(&v84, 8);
        v29 = v55;
        break;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v55;
    v55[2](v55, v28, 0, 0);

  }
}

id __81__ACHMonthlyChallengeTemplateSource_templatesForDate_databaseContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  int v10;

  v3 = a2;
  ACHMonthlyChallengeTemplateFromTemplate();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = objc_msgSend(v5, "version");
  v7 = v5;
  if (v6 != objc_msgSend(v4, "version"))
  {
    v7 = v4;

  }
  objc_msgSend(v7, "availabilityStart");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "startDateComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v7);

  return v7;
}

id __81__ACHMonthlyChallengeTemplateSource_templatesForDate_databaseContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(a2, "componentsSeparatedByString:", CFSTR("_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 3)
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");

    objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    v7 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v7, "setYear:", v4);
    objc_msgSend(v7, "setMonth:", v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __81__ACHMonthlyChallengeTemplateSource_templatesForDate_databaseContext_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "uniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __81__ACHMonthlyChallengeTemplateSource_templatesForDate_databaseContext_completion___block_invoke_195(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;

  v4 = a2;
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v4, "uniqueName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    if (objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 40)))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v11 = *(_QWORD *)(v9 + 40);
      v10 = (id *)(v9 + 40);
      if (!v11)
        objc_storeStrong(v10, a2);
    }
    v8 = v4;
  }

  return v8;
}

- (BOOL)_createMonthlyChallengeWithMonthDateInterval:(id)a3 monthlyChallengeTemplates:(id *)a4 error:(id *)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  double v11;
  NSObject *v12;
  id v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  double v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  BOOL v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  const __CFString *v54;
  uint64_t v55;
  NSObject *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint8_t buf[4];
  unint64_t v61;
  __int16 v62;
  unint64_t v63;
  __int16 v64;
  double v65;
  __int16 v66;
  double v67;
  uint64_t v68;
  _QWORD v69[2];

  v69[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = -[ACHMonthlyChallengeTemplateSource _getRandomMonthlyChallengeType](self, "_getRandomMonthlyChallengeType");
  if (v9)
  {
    v10 = v9;
    -[ACHMonthlyChallengeTemplateSource _goalValueForCurrentMonthForType:error:](self, "_goalValueForCurrentMonthForType:error:", v9, a5);
    -[ACHMonthlyChallengeTemplateSource _capGoalValueForChallengeType:goalValue:](self, "_capGoalValueForChallengeType:goalValue:", v10);
    if (*a5)
    {
      ACHLogMonthlyChallenges();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
LABEL_25:
        v36 = 1;
        goto LABEL_26;
      }
      v13 = *a5;
      *(_DWORD *)buf = 138412290;
      v61 = (unint64_t)v13;
      v14 = "Error in creating goal for new monthly challenge: %@";
      v15 = v12;
      v16 = 12;
    }
    else
    {
      v22 = v11;
      if (v11 <= 2.22044605e-16)
      {
        ACHLogMonthlyChallenges();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          v61 = v10;
          v62 = 2112;
          v63 = (unint64_t)v8;
          v64 = 2048;
          v65 = v22;
          _os_log_impl(&dword_21407B000, v32, OS_LOG_TYPE_DEFAULT, "[#mc] Monthly challenge template for current month wasn't generated for type (%ld), date interval (%@), and goal (%f)", buf, 0x20u);
        }

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[#mc] Monthly challenge template for current month wasn't generated for type (%ld), date interval (%@), and goal (%f)"), v10, v8, *(_QWORD *)&v22);
        v12 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)MEMORY[0x24BDD1540];
        v55 = *MEMORY[0x24BDD0FC8];
        v56 = v12;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ActivityAchievements"), -1, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
          *a5 = objc_retainAutorelease(v35);

        goto LABEL_25;
      }
      -[ACHMonthlyChallengeTemplateSource _createMonthlyChallengeTemplateWithType:dateCompoonentInterval:goalValue:](self, "_createMonthlyChallengeTemplateWithType:dateCompoonentInterval:goalValue:", v10, v8, v11);
      v23 = objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v12 = v23;
        ACHLogMonthlyChallenges();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject uniqueName](v12, "uniqueName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v61 = (unint64_t)v25;
          _os_log_impl(&dword_21407B000, v24, OS_LOG_TYPE_DEFAULT, "[#mc] Template generated: %@", buf, 0xCu);

        }
        ACHLogMonthlyChallenges();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject uniqueName](v12, "uniqueName");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v61 = (unint64_t)v27;
          v62 = 2048;
          v63 = v10;
          v64 = 2112;
          v65 = *(double *)&v8;
          v66 = 2048;
          v67 = v22;
          _os_log_impl(&dword_21407B000, v26, OS_LOG_TYPE_DEFAULT, "[#mc] Monthly challenge %{public}@ for current month was generated for type (%ld), date interval (%@), and goal (%f)", buf, 0x2Au);

        }
        -[ACHMonthlyChallengeTemplateSource _suffixForCurrentMonthForType:template:goal:error:](self, "_suffixForCurrentMonthForType:template:goal:error:", v10, v12, a5, v22);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          -[NSObject availableSuffixes](v12, "availableSuffixes");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v29;
          if (v29)
          {
            objc_msgSend(v29, "arrayByAddingObject:", v28);
            v31 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v59 = v28;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v59, 1);
            v31 = objc_claimAutoreleasedReturnValue();
          }
          v41 = (void *)v31;
          -[NSObject setAvailableSuffixes:](v12, "setAvailableSuffixes:", v31);

        }
        objc_msgSend(*a4, "hk_map:", &__block_literal_global_203_0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject uniqueName](v12, "uniqueName");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v42, "containsObject:", v43);

        if (v44)
        {
          ACHLogMonthlyChallenges();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            -[NSObject uniqueName](v12, "uniqueName");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v61 = (unint64_t)v46;
            _os_log_impl(&dword_21407B000, v45, OS_LOG_TYPE_DEFAULT, "[#mc] The monthly challenge just created already exists: %{public}@. Skipping it.", buf, 0xCu);

          }
          v47 = (void *)MEMORY[0x24BDD17C8];
          -[NSObject uniqueName](v12, "uniqueName");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "stringWithFormat:", CFSTR("The monthly challenge just created already exists: %@. Skipping it."), v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          v50 = (void *)MEMORY[0x24BDD1540];
          v57 = *MEMORY[0x24BDD0FC8];
          v58 = v49;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ActivityAchievements"), -1, v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          if (v52)
            *a5 = objc_retainAutorelease(v52);

          v36 = 1;
        }
        else
        {
          objc_msgSend(*a4, "setByAddingObject:", v12);
          v36 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_26;
      }
      v39 = (void *)MEMORY[0x24BDD1540];
      v68 = *MEMORY[0x24BDD0FC8];
      v69[0] = CFSTR("Tried to generate a challenge with a valid goal, but failed.");
      v36 = 1;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ActivityAchievements"), -1, v40);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      ACHLogMonthlyChallenges();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
LABEL_26:

        v37 = v36 == 0;
        goto LABEL_29;
      }
      *(_WORD *)buf = 0;
      v14 = "[#mc] Tried to generate a challenge with a valid goal, but failed.";
      v15 = v12;
      v16 = 2;
    }
    _os_log_impl(&dword_21407B000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    goto LABEL_25;
  }
  ACHLogMonthlyChallenges();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21407B000, v17, OS_LOG_TYPE_DEFAULT, "[#mc] Not generating monthly challenge template for current month because type returned was undefined.", buf, 2u);
  }

  v18 = (void *)MEMORY[0x24BDD1540];
  v53 = *MEMORY[0x24BDD0FC8];
  v54 = CFSTR("Not generating monthly challenge template for current month because type returned was undefined.");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ActivityAchievements"), -1, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v20;
  if (v21)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v21);
    else
      _HKLogDroppedError();
  }

  v37 = 0;
LABEL_29:

  return v37;
}

uint64_t __114__ACHMonthlyChallengeTemplateSource__createMonthlyChallengeWithMonthDateInterval_monthlyChallengeTemplates_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueName");
}

- (void)_removeMonthlyChallengeTemplate:(id)a3 monthlyChallengeTemplates:(id *)a4 templatesToRemove:(id *)a5
{
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  ACHLogMonthlyChallenges();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_21407B000, v8, OS_LOG_TYPE_DEFAULT, "[#mc] Removing existing template: %@", (uint8_t *)&v10, 0xCu);
    }

    v8 = objc_msgSend(*a4, "mutableCopy");
    -[NSObject removeObject:](v8, "removeObject:", v7);
    *a4 = -[NSObject copy](v8, "copy");
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v7);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (v9)
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_21407B000, v8, OS_LOG_TYPE_DEFAULT, "[#mc] Existing template not found.", (uint8_t *)&v10, 2u);
  }

}

- (id)possibleLocalizationSuffixesForTemplate:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE014F0];
  v6[0] = *MEMORY[0x24BE014D8];
  v6[1] = v3;
  v4 = *MEMORY[0x24BE014E0];
  v6[2] = *MEMORY[0x24BE014E8];
  v6[3] = v4;
  v6[4] = *MEMORY[0x24BE014D0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_createMonthlyChallengeTemplateWithType:(unint64_t)a3 dateCompoonentInterval:(id)a4 goalValue:(double)a5
{
  return (id)ACHMonthlyChallengeTemplate();
}

- (id)localizationBundleURLForTemplate:(id)a3
{
  void *v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a3, "uniqueName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = ACHMonthlyChallengeTypeFromTemplateUniqueName();

  if (v5 > 0x1D)
    v6 = 0;
  else
    v6 = off_24D13C280[v5];
  -[ACHMonthlyChallengeTemplateSource _monthlyAchievementsAssetsDirectoryBasePath](self, "_monthlyAchievementsAssetsDirectoryBasePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("localization"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("challenge"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)resourceBundleURLForTemplate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[ACHMonthlyChallengeTemplateSource _modelsDirectoryBasePathForTemplate:](self, "_modelsDirectoryBasePathForTemplate:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("badgemodel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)propertyListBundleURLForTemplate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ACHMonthlyChallengeTemplateSource _modelsDirectoryBasePathForTemplate:](self, "_modelsDirectoryBasePathForTemplate:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("badgeproperties"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("challenge"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)stickerBundleURLForTemplate:(id)a3
{
  return 0;
}

- (id)_monthlyAchievementsAssetsDirectoryBasePath
{
  if (_monthlyAchievementsAssetsDirectoryBasePath_onceToken_0 != -1)
    dispatch_once(&_monthlyAchievementsAssetsDirectoryBasePath_onceToken_0, &__block_literal_global_221);
  return (id)_monthlyAchievementsAssetsDirectoryBasePath_monthlyAchievementsAssetsDirectoryBasePath_0;
}

void __80__ACHMonthlyChallengeTemplateSource__monthlyAchievementsAssetsDirectoryBasePath__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend((id)*MEMORY[0x24BE015D8], "stringByAppendingPathComponent:", CFSTR("MonthlyAchievements"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_monthlyAchievementsAssetsDirectoryBasePath_monthlyAchievementsAssetsDirectoryBasePath_0;
  _monthlyAchievementsAssetsDirectoryBasePath_monthlyAchievementsAssetsDirectoryBasePath_0 = v0;

}

- (id)_modelsDirectoryBasePathForTemplate:(id)a3
{
  if (_modelsDirectoryBasePathForTemplate__onceToken_0 != -1)
    dispatch_once(&_modelsDirectoryBasePathForTemplate__onceToken_0, &__block_literal_global_224_0);
  return (id)_modelsDirectoryBasePathForTemplate__modelsDirectoryBasePath;
}

void __73__ACHMonthlyChallengeTemplateSource__modelsDirectoryBasePathForTemplate___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend((id)*MEMORY[0x24BE015D8], "stringByAppendingPathComponent:", CFSTR("MonthlyAchievements"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("models"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_modelsDirectoryBasePathForTemplate__modelsDirectoryBasePath;
  _modelsDirectoryBasePathForTemplate__modelsDirectoryBasePath = v0;

}

- (id)customPlaceholderValuesForTemplate:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  id v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  int v39;
  id v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (ACHTemplateIsMonthlyChallenge())
  {
    -[ACHMonthlyChallengeTemplateSource _dateComponentIntervalForCurrentMonth](self, "_dateComponentIntervalForCurrentMonth");
    v7 = objc_claimAutoreleasedReturnValue();
    ACHLogMonthlyChallenges();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v39 = 138543362;
      v40 = v6;
      _os_log_impl(&dword_21407B000, v8, OS_LOG_TYPE_DEFAULT, "Progress: selected template: %{public}@.", (uint8_t *)&v39, 0xCu);
    }

    ACHLogMonthlyChallenges();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject startDateComponents](v7, "startDateComponents");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject endDateComponents](v7, "endDateComponents");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138543618;
      v40 = v10;
      v41 = 2114;
      v42 = (uint64_t)v11;
      _os_log_impl(&dword_21407B000, v9, OS_LOG_TYPE_DEFAULT, "Progress: using start date (%{public}@) and end date (%{public}@).", (uint8_t *)&v39, 0x16u);

    }
    objc_msgSend(v6, "uniqueName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = ACHMonthlyChallengeTypeFromTemplateUniqueName();

    objc_msgSend(v6, "availabilityStart");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject startDateComponents](v7, "startDateComponents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = ACHCompareYearMonthDayDateComponents();

    ACHLogMonthlyChallenges();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[ACHMonthlyChallengeTemplateSource customPlaceholderValuesForTemplate:error:].cold.1(v6, v7, v18);
      v19 = 0;
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        ACHMonthlyChallengeNameFromChallengeType();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 138543618;
        v40 = v22;
        v41 = 2048;
        v42 = v13;
        _os_log_impl(&dword_21407B000, v18, OS_LOG_TYPE_DEFAULT, "Progress: Monthly Challenge type: %{public}@ (%lu).", (uint8_t *)&v39, 0x16u);

      }
      -[ACHMonthlyChallengeTemplateSource _dateComponentIntervalForLastMonth](self, "_dateComponentIntervalForLastMonth");
      v18 = objc_claimAutoreleasedReturnValue();
      ACHLogMonthlyChallenges();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject startDateComponents](v18, "startDateComponents");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject endDateComponents](v18, "endDateComponents");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 138543618;
        v40 = v24;
        v41 = 2114;
        v42 = (uint64_t)v25;
        _os_log_impl(&dword_21407B000, v23, OS_LOG_TYPE_DEFAULT, "Progress: retrieving last month value using date component interval: start (%{public}@) vs end date (%{public}@).", (uint8_t *)&v39, 0x16u);

      }
      -[ACHMonthlyChallengeTemplateSource dataSource](self, "dataSource");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACHMonthlyChallengeTemplateSource currentCalendar](self, "currentCalendar");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "valueForMonthlyChallengeType:forDateComponentInterval:calendar:error:", v13, v18, v27, a4);
      v29 = v28;

      v30 = objc_alloc_init(MEMORY[0x24BDD16F0]);
      objc_msgSend(v30, "setNumberStyle:", 1);
      objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setLocale:", v31);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v29);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringFromNumber:", v32);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      ACHLogMonthlyChallenges();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v39 = 138543362;
        v40 = v19;
        _os_log_impl(&dword_21407B000, v33, OS_LOG_TYPE_DEFAULT, "Progress: last month value: %{public}@.", (uint8_t *)&v39, 0xCu);
      }

    }
    v34 = v19;
    v35 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v36 = v35;
    if (v34)
      objc_msgSend(v35, "setObject:forKey:", v34, *MEMORY[0x24BE01230]);
    if ((unint64_t)(v13 - 8) <= 0xB)
    {
      objc_msgSend(MEMORY[0x24BDD4118], "_stringFromWorkoutActivityType:", ACHWorkoutActivityTypeForMonthlyChallengeType());
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setObject:forKey:", v37, *MEMORY[0x24BE015A8]);

    }
    v21 = (void *)objc_msgSend(v36, "copy");

  }
  else
  {
    ACHLogMonthlyChallenges();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "uniqueName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138543362;
      v40 = v20;
      _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "Progress: %{public}@ is not a Monthly Challenge.", (uint8_t *)&v39, 0xCu);

    }
    v21 = 0;
  }

  return v21;
}

- (BOOL)isGoalValueForMonthlyChallengeTypeValid:(unint64_t)a3 error:(id *)a4
{
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  BOOL v14;
  BOOL v15;
  BOOL v16;

  -[ACHMonthlyChallengeTemplateSource _targetGoalValueForCurrentMonthForType:error:](self, "_targetGoalValueForCurrentMonthForType:error:", a3, a4);
  v7 = v6;
  -[ACHMonthlyChallengeTemplateSource _maximumValueForMonthlyChallengeType:](self, "_maximumValueForMonthlyChallengeType:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeTemplateSource _minimumValueForMonthlyChallengeType:](self, "_minimumValueForMonthlyChallengeType:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v11 = v10;
  objc_msgSend(v9, "doubleValue");
  v13 = 1;
  if (v8 && v7 >= v11)
    v13 = vabdd_f64(v11, v7) < 2.22044605e-16;
  v14 = 1;
  if (v9 && v7 <= v12)
    v14 = vabdd_f64(v12, v7) < 2.22044605e-16;
  v15 = v13 && v14;
  v16 = v7 > 0.0 && v15;

  return v16;
}

- (id)_pairedWatchDeviceCapabilities
{
  NSObject *v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t v27[4];
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (-[ACHMonthlyChallengeTemplateSource isStandalonePhoneFitnessMode](self, "isStandalonePhoneFitnessMode"))
  {
    ACHLogMonthlyChallenges();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21407B000, v3, OS_LOG_TYPE_DEFAULT, "Companion is in standalone mode, not checking paired watch device capabilities", buf, 2u);
    }

    return MEMORY[0x24BDBD1B8];
  }
  else
  {
    *(_QWORD *)buf = 0;
    v22 = buf;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__20;
    v25 = __Block_byref_object_dispose__20;
    v26 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    ACHDeviceCapabilitiesForMonthlyChallenges();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v18;
      v8 = MEMORY[0x24BDBD1C0];
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*((id *)v22 + 5), "setObject:forKeyedSubscript:", v8, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v9++));
        }
        while (v6 != v9);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
      }
      while (v6);
    }

    ACHLogMonthlyChallenges();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_21407B000, v10, OS_LOG_TYPE_DEFAULT, "Companion is not in standalone mode, checking paired watches for Monthly Challenge Compatibility", v27, 2u);
    }

    -[ACHMonthlyChallengeTemplateSource pairedDeviceRegistrySharedInstance](self, "pairedDeviceRegistrySharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getPairedDevices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ACHLogMonthlyChallenges();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v12, "count");
      *(_DWORD *)v27 = 134217984;
      v28 = v14;
      _os_log_impl(&dword_21407B000, v13, OS_LOG_TYPE_DEFAULT, "Companion is paired with %lu watches", v27, 0xCu);
    }

    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __67__ACHMonthlyChallengeTemplateSource__pairedWatchDeviceCapabilities__block_invoke;
    v16[3] = &unk_24D13C260;
    v16[4] = buf;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v16);
    v15 = (void *)objc_msgSend(*((id *)v22 + 5), "copy");

    _Block_object_dispose(buf, 8);
    return v15;
  }
}

void __67__ACHMonthlyChallengeTemplateSource__pairedWatchDeviceCapabilities__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v16;
    *(_QWORD *)&v6 = 138412290;
    v14 = v6;
    v9 = MEMORY[0x24BDBD1C8];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v3, "supportsCapability:", v11, v14))
        {
          ACHLogMonthlyChallenges();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v11, "UUIDString");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v14;
            v20 = v13;
            _os_log_impl(&dword_21407B000, v12, OS_LOG_TYPE_DEFAULT, "Companion has one paired device that is eligibile for %@", buf, 0xCu);

          }
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v9, v11);
        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v7);
  }

}

- (BOOL)isMonthlyChallengeOfTypeAvailable:(unint64_t)a3 error:(id *)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  void *v16;
  NSObject *v17;
  ACHMonthlyChallengeEvaluationEnvironment *v18;
  void *v19;
  void *v20;
  void *v21;
  ACHMonthlyChallengeEvaluationEnvironment *v22;
  void *v23;
  int v24;
  id v25;
  NSObject *v26;
  int v27;
  const __CFString *v28;
  id *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  int v35;
  int v36;
  void *v37;
  int HasRequiredDeviceCapability;
  int v39;
  _BOOL4 v40;
  id v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  id *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  double v70;
  double v71;
  void *v72;
  uint64_t v73;
  NSObject *v74;
  double v75;
  double v76;
  void *v77;
  uint64_t v78;
  NSObject *v79;
  double v80;
  double v81;
  void *v82;
  uint64_t v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  int64_t v88;
  double v89;
  void *v90;
  uint64_t v91;
  NSObject *v92;
  const char *v93;
  double v94;
  double v95;
  void *v96;
  uint64_t v97;
  NSObject *v98;
  void *v99;
  int v100;
  NSObject *v101;
  const char *v102;
  void *v103;
  uint64_t v104;
  NSObject *v105;
  const char *v106;
  void *v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  BOOL v115;
  const __CFString *v118;
  void *v119;
  ACHMonthlyChallengeEvaluationEnvironment *v120;
  NSObject *v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  uint8_t buf[4];
  id v141;
  __int16 v142;
  unint64_t v143;
  __int16 v144;
  int v145;
  __int16 v146;
  int v147;
  __int16 v148;
  const __CFString *v149;
  __int16 v150;
  _BOOL4 v151;
  __int16 v152;
  int v153;
  uint64_t v154;

  v154 = *MEMORY[0x24BDAC8D0];
  ACHLogMonthlyChallenges();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    ACHMonthlyChallengeNameFromChallengeType();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v141 = v8;
    v142 = 2048;
    v143 = a3;
    _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "Checking validity of monthly challenge type %{public}@ (%lu)", buf, 0x16u);

  }
  -[ACHMonthlyChallengeTemplateSource templateDataProvider](self, "templateDataProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeTemplateSource _dateComponentIntervalForLastMonth](self, "_dateComponentIntervalForLastMonth");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startDateComponents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "monthlyChallengeTypeForMonth:", v11);

  if (v12 == a3)
  {
    ACHLogMonthlyChallenges();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      ACHMonthlyChallengeNameFromChallengeType();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v141 = v14;
      v142 = 2048;
      v143 = a3;
      _os_log_impl(&dword_21407B000, v13, OS_LOG_TYPE_DEFAULT, "Type %{public}@ (%lu) is not available because it was suggested last month", buf, 0x16u);

    }
    v15 = 0;
    goto LABEL_38;
  }
  -[ACHMonthlyChallengeTemplateSource _dateComponentIntervalForLastMonth](self, "_dateComponentIntervalForLastMonth");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "startDateComponents");
  v17 = objc_claimAutoreleasedReturnValue();

  v18 = [ACHMonthlyChallengeEvaluationEnvironment alloc];
  -[ACHMonthlyChallengeTemplateSource dataSource](self, "dataSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeTemplateSource _dateComponentIntervalForLastMonth](self, "_dateComponentIntervalForLastMonth");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeTemplateSource currentCalendar](self, "currentCalendar");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[ACHMonthlyChallengeEvaluationEnvironment initWithMonthlyChallengeDataSource:dateComponentInterval:calendar:](v18, "initWithMonthlyChallengeDataSource:dateComponentInterval:calendar:", v19, v20, v21);

  v120 = v22;
  v121 = v17;
  switch(a3)
  {
    case 0uLL:
    case 0x1DuLL:
      v25 = 0;
      v27 = 0;
      v28 = CFSTR("Invalid monthly challenge type");
      goto LABEL_24;
    case 1uLL:
      v46 = a4;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PerfectMonth-%04ld-%02ld"), -[NSObject year](v17, "year"), -[NSObject month](v17, "month"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACHMonthlyChallengeTemplateSource templateDataProvider](self, "templateDataProvider");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACHMonthlyChallengeTemplateSource _dateComponentIntervalForLastMonth](self, "_dateComponentIntervalForLastMonth");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACHMonthlyChallengeTemplateSource currentCalendar](self, "currentCalendar");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = 0;
      v51 = objc_msgSend(v48, "numberOfEarnedInstancesOfTemplateWithUniqueName:inDateComponentInterval:withCalendar:error:", v47, v49, v50, &v139);
      v25 = v139;

      v27 = 0;
      a4 = v46;
      if (!v25 && !v51)
        v27 = !-[ACHMonthlyChallengeTemplateSource isStandalonePhoneFitnessMode](self, "isStandalonePhoneFitnessMode");

      v28 = CFSTR("Received Perfect Month achievement last month or is standalone phone Fitness mode");
      goto LABEL_24;
    case 2uLL:
      v52 = a4;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PerfectMonth-%04ld-%02ld"), -[NSObject year](v17, "year"), -[NSObject month](v17, "month"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACHMonthlyChallengeTemplateSource templateDataProvider](self, "templateDataProvider");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACHMonthlyChallengeTemplateSource _dateComponentIntervalForLastMonth](self, "_dateComponentIntervalForLastMonth");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACHMonthlyChallengeTemplateSource currentCalendar](self, "currentCalendar");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v138 = 0;
      v57 = objc_msgSend(v54, "numberOfEarnedInstancesOfTemplateWithUniqueName:inDateComponentInterval:withCalendar:error:", v53, v55, v56, &v138);
      v25 = v138;

      if (v25)
        goto LABEL_46;
      -[ACHMonthlyChallengeTemplateSource templateDataProvider](self, "templateDataProvider");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACHMonthlyChallengeTemplateSource _dateComponentIntervalForLastMonth](self, "_dateComponentIntervalForLastMonth");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACHMonthlyChallengeTemplateSource currentCalendar](self, "currentCalendar");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = 0;
      v61 = objc_msgSend(v58, "numberOfEarnedInstancesOfTemplateWithUniqueName:inDateComponentInterval:withCalendar:error:", CFSTR("PerfectWeekMove"), v59, v60, &v137);
      v25 = v137;

      if (v25)
      {
LABEL_46:
        v27 = 0;
      }
      else
      {
        if (v57)
          v115 = 0;
        else
          v115 = v61 < 3;
        v27 = v115;
      }
      a4 = v52;

      v28 = CFSTR("Received Perfect Month achievement last month or Perfect Week (Move) Achievement 3 times during the previous month");
      goto LABEL_24;
    case 3uLL:
      v29 = a4;
      -[ACHMonthlyChallengeTemplateSource templateDataProvider](self, "templateDataProvider");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACHMonthlyChallengeTemplateSource _dateComponentIntervalForLastMonth](self, "_dateComponentIntervalForLastMonth");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACHMonthlyChallengeTemplateSource currentCalendar](self, "currentCalendar");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v136 = 0;
      v65 = objc_msgSend(v62, "numberOfEarnedInstancesOfTemplateWithUniqueName:inDateComponentInterval:withCalendar:error:", CFSTR("PerfectWeekExercise"), v63, v64, &v136);
      v25 = v136;

      v27 = 0;
      v28 = CFSTR("Received Perfect Week (Exercise) Achievement 3 times during the previous month or is standalone phone Fitness mode");
      if (v25)
        goto LABEL_23;
      a4 = v29;
      if (v65 <= 2)
      {
        v25 = 0;
        v27 = !-[ACHMonthlyChallengeTemplateSource isStandalonePhoneFitnessMode](self, "isStandalonePhoneFitnessMode");
        v28 = CFSTR("Received Perfect Week (Exercise) Achievement 3 times during the previous month or is standalone phone Fitness mode");
      }
      goto LABEL_24;
    case 4uLL:
      v29 = a4;
      -[ACHMonthlyChallengeTemplateSource templateDataProvider](self, "templateDataProvider");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACHMonthlyChallengeTemplateSource _dateComponentIntervalForLastMonth](self, "_dateComponentIntervalForLastMonth");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACHMonthlyChallengeTemplateSource currentCalendar](self, "currentCalendar");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v135 = 0;
      v69 = objc_msgSend(v66, "numberOfEarnedInstancesOfTemplateWithUniqueName:inDateComponentInterval:withCalendar:error:", CFSTR("PerfectWeekStand"), v67, v68, &v135);
      v25 = v135;

      v27 = 0;
      v28 = CFSTR("Received Perfect Week (Stand) Achievement 3 times during the previous month or is standalone phone Fitness mode");
      if (v25)
        goto LABEL_23;
      a4 = v29;
      if (v69 <= 2)
      {
        v25 = 0;
        v27 = !-[ACHMonthlyChallengeTemplateSource isStandalonePhoneFitnessMode](self, "isStandalonePhoneFitnessMode");
        v28 = CFSTR("Received Perfect Week (Stand) Achievement 3 times during the previous month or is standalone phone Fitness mode");
      }
      goto LABEL_24;
    case 5uLL:
    case 6uLL:
    case 0x14uLL:
    case 0x16uLL:
      v25 = 0;
      v27 = 0;
      v28 = CFSTR("Monthly Challenge type is deprecated");
      goto LABEL_24;
    case 7uLL:
      -[ACHMonthlyChallengeEvaluationEnvironment numberOfWorkoutsCompletedInCurrentMonth](v22, "numberOfWorkoutsCompletedInCurrentMonth");
      v71 = v70;
      -[ACHMonthlyChallengeTemplateSource templateDataProvider](self, "templateDataProvider");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v131 = 0;
      v73 = objc_msgSend(v72, "currentExperienceTypeWithError:", &v131);
      v25 = v131;

      if (v25)
      {
        ACHLogMonthlyChallenges();
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v141 = v25;
          _os_log_impl(&dword_21407B000, v74, OS_LOG_TYPE_DEFAULT, "Error getting experience type: %@", buf, 0xCu);
        }

        v27 = 0;
      }
      else
      {
        v27 = v71 >= 2.0 && v73 == 1;
      }
      v28 = CFSTR("Required at least 1 workout last monthand and is in standard Fitness experience");
      goto LABEL_24;
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
      -[ACHMonthlyChallengeTemplateSource templateDataProvider](self, "templateDataProvider");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = 0;
      v24 = objc_msgSend(v23, "isWheelchairUserWithError:", &v133);
      v25 = v133;

      if (!v25)
      {
        v29 = a4;
        -[ACHMonthlyChallengeTemplateSource templateDataProvider](self, "templateDataProvider");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v132 = 0;
        v31 = objc_msgSend(v30, "currentExperienceTypeWithError:", &v132);
        v25 = v132;

        if (v25)
        {
          ACHLogMonthlyChallenges();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v141 = v25;
            _os_log_impl(&dword_21407B000, v32, OS_LOG_TYPE_DEFAULT, "Error getting experience type: %@", buf, 0xCu);
          }

          v27 = 0;
        }
        else
        {
          -[ACHMonthlyChallengeEvaluationEnvironment eligibleSpecificWorkoutChallengeType](v22, "eligibleSpecificWorkoutChallengeType");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v33, "isEqual:", v34);
          if (v31 == 1)
            v36 = v35;
          else
            v36 = 0;
          v27 = v36 & (v24 ^ 1);

          v25 = 0;
        }
        v28 = CFSTR("Required at least 3 workouts of the same type in the last month, is in standard Fitness experience, and cannot be wheelchair user");
        goto LABEL_23;
      }
      ACHLogMonthlyChallenges();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v141 = v25;
        _os_log_impl(&dword_21407B000, v26, OS_LOG_TYPE_DEFAULT, "Error fetching wheelchair use: %@", buf, 0xCu);
      }

      v27 = 0;
      v28 = CFSTR("Required at least 3 workouts of the same type in the last month, is in standard Fitness experience, and cannot be wheelchair user");
      goto LABEL_24;
    case 0x15uLL:
      -[ACHMonthlyChallengeEvaluationEnvironment numberOfDaysDoublingMoveGoalInCurrentMonth](v22, "numberOfDaysDoublingMoveGoalInCurrentMonth");
      v76 = v75;
      -[ACHMonthlyChallengeTemplateSource templateDataProvider](self, "templateDataProvider");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v130 = 0;
      v78 = objc_msgSend(v77, "currentExperienceTypeWithError:", &v130);
      v25 = v130;

      if (v25)
      {
        ACHLogMonthlyChallenges();
        v79 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v141 = v25;
          _os_log_impl(&dword_21407B000, v79, OS_LOG_TYPE_DEFAULT, "Error getting experience type: %@", buf, 0xCu);
        }

        v27 = 0;
      }
      else
      {
        v27 = v76 >= 2.0 && v78 == 1;
      }
      v28 = CFSTR("Required at least 1 day doubling move goal last month and cannot be Fitness jr user");
      goto LABEL_24;
    case 0x17uLL:
      -[ACHMonthlyChallengeEvaluationEnvironment numberOfDaysDoublingExerciseGoalInCurrentMonth](v22, "numberOfDaysDoublingExerciseGoalInCurrentMonth");
      v81 = v80;
      -[ACHMonthlyChallengeTemplateSource templateDataProvider](self, "templateDataProvider");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = 0;
      v83 = objc_msgSend(v82, "currentExperienceTypeWithError:", &v129);
      v25 = v129;

      if (v25)
      {
        ACHLogMonthlyChallenges();
        v84 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v141 = v25;
          _os_log_impl(&dword_21407B000, v84, OS_LOG_TYPE_DEFAULT, "Error getting experience type: %@", buf, 0xCu);
        }

        v27 = 0;
        goto LABEL_100;
      }
      v27 = 0;
      v28 = CFSTR("Required at least 3 days doubling exericise goal last month, cannot be Fitness Jr user, and cannot be standalone phone Fitness mode");
      if (v81 >= 2.0 && v83 == 1)
      {
        v25 = 0;
        v27 = !-[ACHMonthlyChallengeTemplateSource isStandalonePhoneFitnessMode](self, "isStandalonePhoneFitnessMode");
LABEL_100:
        v28 = CFSTR("Required at least 3 days doubling exericise goal last month, cannot be Fitness Jr user, and cannot be standalone phone Fitness mode");
        goto LABEL_24;
      }
      goto LABEL_24;
    case 0x18uLL:
      -[ACHMonthlyChallengeTemplateSource currentCalendar](self, "currentCalendar");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACHMonthlyChallengeTemplateSource currentDate](self, "currentDate");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "hk_startOfMonthForDate:addingMonths:", v86, -1);
      v87 = (void *)objc_claimAutoreleasedReturnValue();

      v88 = -[ACHMonthlyChallengeTemplateSource _numberOfDaysInMonthForDate:](self, "_numberOfDaysInMonthForDate:", v87)
          - 3;
      -[ACHMonthlyChallengeEvaluationEnvironment longestMoveStreakInCurrentMonth](v22, "longestMoveStreakInCurrentMonth");
      v27 = v89 < (double)v88 && v89 >= 5.0;

      v25 = 0;
      v28 = CFSTR("Move streak > 5 during last month, and move streak < number of days in last month - 3");
      goto LABEL_24;
    case 0x19uLL:
      -[ACHMonthlyChallengeTemplateSource templateDataProvider](self, "templateDataProvider");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v126 = 0;
      v91 = objc_msgSend(v90, "currentActivityMoveModeWithError:", &v126);
      v25 = v126;

      if (v25)
      {
        ACHLogMonthlyChallenges();
        v92 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
          goto LABEL_105;
        *(_DWORD *)buf = 138412290;
        v141 = v25;
        v93 = "Unable to fetch activity move mode: %@";
        goto LABEL_104;
      }
      v29 = a4;
      -[ACHMonthlyChallengeTemplateSource templateDataProvider](self, "templateDataProvider");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = 0;
      v110 = objc_msgSend(v109, "currentExperienceTypeWithError:", &v125);
      v25 = v125;

      if (!v25)
      {
        v27 = v91 != 2 && v110 == 1;
        v28 = CFSTR("Cannot be Apple Move Time user, and cannot be Fitness jr user");
        goto LABEL_23;
      }
      ACHLogMonthlyChallenges();
      v92 = objc_claimAutoreleasedReturnValue();
      a4 = v29;
      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v141 = v25;
        v93 = "Error getting experience type: %@";
LABEL_104:
        _os_log_impl(&dword_21407B000, v92, OS_LOG_TYPE_DEFAULT, v93, buf, 0xCu);
      }
LABEL_105:

      v27 = 0;
      v28 = CFSTR("Cannot be Apple Move Time user, and cannot be Fitness jr user");
      goto LABEL_24;
    case 0x1AuLL:
      -[ACHMonthlyChallengeEvaluationEnvironment totalExerciseMinutesInCurrentMonth](v22, "totalExerciseMinutesInCurrentMonth");
      v95 = v94;
      -[ACHMonthlyChallengeTemplateSource templateDataProvider](self, "templateDataProvider");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v134 = 0;
      v97 = objc_msgSend(v96, "currentExperienceTypeWithError:", &v134);
      v25 = v134;

      if (v25)
      {
        ACHLogMonthlyChallenges();
        v98 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v141 = v25;
          _os_log_impl(&dword_21407B000, v98, OS_LOG_TYPE_DEFAULT, "Error getting experience type: %@", buf, 0xCu);
        }

        v27 = 0;
        goto LABEL_109;
      }
      v27 = 0;
      v28 = CFSTR("Required at least 30 Exercise minutes last month, cannot be Fitness jr user, and cannot be standalone phone Fitness mode");
      if (v95 >= 30.0 && v97 == 1)
      {
        v25 = 0;
        v27 = !-[ACHMonthlyChallengeTemplateSource isStandalonePhoneFitnessMode](self, "isStandalonePhoneFitnessMode");
LABEL_109:
        v28 = CFSTR("Required at least 30 Exercise minutes last month, cannot be Fitness jr user, and cannot be standalone phone Fitness mode");
        goto LABEL_24;
      }
      goto LABEL_24;
    case 0x1BuLL:
      -[ACHMonthlyChallengeTemplateSource templateDataProvider](self, "templateDataProvider");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = 0;
      v100 = objc_msgSend(v99, "isWheelchairUserWithError:", &v128);
      v25 = v128;

      if (v25)
      {
        ACHLogMonthlyChallenges();
        v101 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
          goto LABEL_114;
        *(_DWORD *)buf = 138412290;
        v141 = v25;
        v102 = "Error fetching wheelchair use: %@";
        goto LABEL_113;
      }
      v29 = a4;
      -[ACHMonthlyChallengeTemplateSource templateDataProvider](self, "templateDataProvider");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = 0;
      v112 = objc_msgSend(v111, "currentExperienceTypeWithError:", &v127);
      v25 = v127;

      if (!v25)
      {
        v27 = (v112 == 1) & ~v100;
        v28 = CFSTR("Cannot be wheelchair user and is in the standard fitness experience");
        goto LABEL_23;
      }
      ACHLogMonthlyChallenges();
      v101 = objc_claimAutoreleasedReturnValue();
      a4 = v29;
      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v141 = v25;
        v102 = "Error getting experience type: %@";
LABEL_113:
        _os_log_impl(&dword_21407B000, v101, OS_LOG_TYPE_DEFAULT, v102, buf, 0xCu);
      }
LABEL_114:

      v27 = 0;
      v28 = CFSTR("Cannot be wheelchair user and is in the standard fitness experience");
      goto LABEL_24;
    case 0x1CuLL:
      -[ACHMonthlyChallengeTemplateSource templateDataProvider](self, "templateDataProvider");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = 0;
      v104 = objc_msgSend(v103, "currentActivityMoveModeWithError:", &v124);
      v25 = v124;

      if (v25)
      {
        ACHLogMonthlyChallenges();
        v105 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
          goto LABEL_119;
        *(_DWORD *)buf = 138412290;
        v141 = v25;
        v106 = "Error getting move mode: %@";
        goto LABEL_118;
      }
      v29 = a4;
      -[ACHMonthlyChallengeTemplateSource templateDataProvider](self, "templateDataProvider");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = 0;
      v114 = objc_msgSend(v113, "currentExperienceTypeWithError:", &v123);
      v25 = v123;

      if (!v25)
      {
        v27 = v104 == 2 && v114 != 3;
        v28 = CFSTR("Must be Apple Move Time user, and cannot be Simplified Fitness jr user");
LABEL_23:
        a4 = v29;
        goto LABEL_24;
      }
      ACHLogMonthlyChallenges();
      v105 = objc_claimAutoreleasedReturnValue();
      a4 = v29;
      if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v141 = v25;
        v106 = "Error getting experience type: %@";
LABEL_118:
        _os_log_impl(&dword_21407B000, v105, OS_LOG_TYPE_DEFAULT, v106, buf, 0xCu);
      }
LABEL_119:

      v27 = 0;
      v28 = CFSTR("Must be Apple Move Time user, and cannot be Simplified Fitness jr user");
LABEL_24:
      v118 = v28;
      -[ACHMonthlyChallengeTemplateSource _pairedWatchDeviceCapabilities](self, "_pairedWatchDeviceCapabilities");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[ACHMonthlyChallengeTemplateSource isStandalonePhoneFitnessMode](self, "isStandalonePhoneFitnessMode"))
        HasRequiredDeviceCapability = 1;
      else
        HasRequiredDeviceCapability = ACHMonthlyChallengeHasRequiredDeviceCapability();
      if (a4 && v25)
        *a4 = objc_retainAutorelease(v25);
      v119 = v25;
      v39 = v27 & HasRequiredDeviceCapability;
      v122 = 0;
      v40 = -[ACHMonthlyChallengeTemplateSource isGoalValueForMonthlyChallengeTypeValid:error:](self, "isGoalValueForMonthlyChallengeTypeValid:error:", a3, &v122);
      v41 = v122;
      if (v41)
      {
        ACHLogMonthlyChallenges();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v141 = v41;
          _os_log_impl(&dword_21407B000, v42, OS_LOG_TYPE_DEFAULT, "Error validating goal: %@", buf, 0xCu);
        }

        if (a4)
          *a4 = objc_retainAutorelease(v41);
      }
      v15 = v40 & v39;
      ACHLogMonthlyChallenges();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        ACHMonthlyChallengeNameFromChallengeType();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544898;
        v141 = v44;
        v142 = 2048;
        v143 = a3;
        v144 = 1024;
        v145 = v40 & v39;
        v146 = 1024;
        v147 = v39;
        v148 = 2112;
        v149 = v118;
        v150 = 1024;
        v151 = v40;
        v152 = 1024;
        v153 = HasRequiredDeviceCapability;
        _os_log_impl(&dword_21407B000, v43, OS_LOG_TYPE_DEFAULT, "Monthly Challenge Type: %{public}@ (%ld), Overall Available: %{BOOL}d, Type Is Available: %{BOOL}d, Type Explanation: %@, Goal is Valid: %{BOOL}d, deviceCapabilityRequirementMet: %{BOOL}d", buf, 0x38u);

      }
      v13 = v121;
LABEL_38:

      return v15;
    default:
      v25 = 0;
      v27 = 0;
      v28 = CFSTR("Type is available");
      goto LABEL_24;
  }
}

- (id)_availableMonthlyChallengeTypes
{
  __int128 v2;
  char v4;
  char *v5;
  void *v6;
  _BOOL4 v7;
  char *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  __int128 v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  char *v23;
  uint64_t v24;

  v4 = 0;
  v5 = 0;
  v24 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BDBD1A8];
  *(_QWORD *)&v2 = 138543618;
  v18 = v2;
  do
  {
    v19 = 0;
    v7 = -[ACHMonthlyChallengeTemplateSource isMonthlyChallengeOfTypeAvailable:error:](self, "isMonthlyChallengeOfTypeAvailable:error:", v5, &v19, v18);
    v8 = (char *)v19;
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "arrayByAddingObject:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v10;
    }
    else
    {
      ACHLogMonthlyChallenges();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        ACHMonthlyChallengeNameFromChallengeType();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v18;
        v21 = (uint64_t)v11;
        v22 = 2048;
        v23 = v5;
        _os_log_impl(&dword_21407B000, v9, OS_LOG_TYPE_DEFAULT, "Monthly challenge of type %{public}@ (%lu) is unavailable.", buf, 0x16u);

      }
    }

    if (v8)
    {
      ACHLogMonthlyChallenges();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v21 = (uint64_t)v5;
        v22 = 2112;
        v23 = v8;
        _os_log_impl(&dword_21407B000, v12, OS_LOG_TYPE_DEFAULT, "Unable to check availability of monthly challenge type %ld: %@", buf, 0x16u);
      }

      v4 = objc_msgSend(v8, "hk_isDatabaseAccessibilityError");
    }

    ++v5;
  }
  while (v5 != (char *)29);
  if (!((objc_msgSend(v6, "count") != 0) | v4 & 1))
  {
    if (-[ACHMonthlyChallengeTemplateSource isStandalonePhoneFitnessMode](self, "isStandalonePhoneFitnessMode"))
      v13 = 2;
    else
      v13 = 1;
    ACHLogMonthlyChallenges();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v21 = v13;
      _os_log_impl(&dword_21407B000, v14, OS_LOG_TYPE_DEFAULT, "No valid monthly challenge types; adding type of %lu",
        buf,
        0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayByAddingObject:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v16;
  }
  return v6;
}

- (unint64_t)_getRandomMonthlyChallengeType
{
  void *v2;
  uint32_t v3;
  void *v4;
  unint64_t v5;

  -[ACHMonthlyChallengeTemplateSource _availableMonthlyChallengeTypes](self, "_availableMonthlyChallengeTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  if (v3)
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", arc4random_uniform(v3));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_isInFirstWeekOfCurrentMonth:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ACHMonthlyChallengeTemplateSource currentCalendar](self, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 16, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "day") < 8;
  return (char)v4;
}

- (id)_dateComponentIntervalForCurrentMonth
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[ACHMonthlyChallengeTemplateSource currentCalendar](self, "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeTemplateSource currentDate](self, "currentDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_startOfMonthForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHMonthlyChallengeTemplateSource currentCalendar](self, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeTemplateSource currentDate](self, "currentDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_startOfMonthForDate:addingMonths:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHMonthlyChallengeTemplateSource currentCalendar](self, "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_startOfDateBySubtractingDays:fromDate:", 1, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHMonthlyChallengeTemplateSource currentCalendar](self, "currentCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BE012A8];
  objc_msgSend(v11, "components:fromDate:", *MEMORY[0x24BE012A8], v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHMonthlyChallengeTemplateSource currentCalendar](self, "currentCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "components:fromDate:", v12, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE01828]), "initWithStartDateComponents:endDateComponents:", v13, v15);
  return v16;
}

- (id)_dateComponentIntervalForLastMonth
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[ACHMonthlyChallengeTemplateSource currentCalendar](self, "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeTemplateSource currentDate](self, "currentDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_startOfMonthForDate:addingMonths:", v4, -1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHMonthlyChallengeTemplateSource currentCalendar](self, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeTemplateSource currentDate](self, "currentDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_startOfMonthForDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHMonthlyChallengeTemplateSource currentCalendar](self, "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_startOfDateBySubtractingDays:fromDate:", 1, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHMonthlyChallengeTemplateSource currentCalendar](self, "currentCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BE012A8];
  objc_msgSend(v11, "components:fromDate:", *MEMORY[0x24BE012A8], v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHMonthlyChallengeTemplateSource currentCalendar](self, "currentCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "components:fromDate:", v12, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE01828]), "initWithStartDateComponents:endDateComponents:", v13, v15);
  return v16;
}

- (id)_dateComponentIntervalForTwoMonthsAgo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[ACHMonthlyChallengeTemplateSource currentCalendar](self, "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeTemplateSource currentDate](self, "currentDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_startOfMonthForDate:addingMonths:", v4, -2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHMonthlyChallengeTemplateSource currentCalendar](self, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeTemplateSource currentDate](self, "currentDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_startOfMonthForDate:addingMonths:", v7, -1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHMonthlyChallengeTemplateSource currentCalendar](self, "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_startOfDateBySubtractingDays:fromDate:", 1, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHMonthlyChallengeTemplateSource currentCalendar](self, "currentCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BE012A8];
  objc_msgSend(v11, "components:fromDate:", *MEMORY[0x24BE012A8], v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHMonthlyChallengeTemplateSource currentCalendar](self, "currentCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "components:fromDate:", v12, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE01828]), "initWithStartDateComponents:endDateComponents:", v13, v15);
  return v16;
}

- (unint64_t)_numberOfDaysInMonthForDate:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;

  v4 = a3;
  -[ACHMonthlyChallengeTemplateSource currentCalendar](self, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rangeOfUnit:inUnit:forDate:", 16, 8, v4);
  v7 = v6;

  return v7;
}

- (BOOL)_shouldOverrideMonthlyChallengeCadence
{
  id v2;
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  NSObject *v10;
  BOOL v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDBCF50]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x24BE01538]);
  v4 = objc_msgSend(v3, "BOOLForKey:", *MEMORY[0x24BE01540]);
  ACHLogMonthlyChallenges();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 67109120;
    LODWORD(v14) = v4;
    _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "Internal override monthly challenge cadence setting is: %d.", (uint8_t *)&v13, 8u);
  }

  if (v4)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("AppleInternalMonthlyChallengeCadenceLastOverrideDateKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ACHLogMonthlyChallenges();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v6;
      _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "Internal override monthly challenge cadence last override date was: %@.", (uint8_t *)&v13, 0xCu);
    }

    if (v6
      && (objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "isDateInToday:", v6),
          v8,
          v9))
    {
      ACHLogMonthlyChallenges();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_21407B000, v10, OS_LOG_TYPE_DEFAULT, "Internal override monthly challenge cadence last override date was today; not forcing another.",
          (uint8_t *)&v13,
          2u);
      }

      v11 = 0;
    }
    else
    {
      v11 = 1;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_didOverrideMonthlyChallengeCadence
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_alloc(MEMORY[0x24BDBCF50]);
  v4 = (id)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x24BE01538]);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v3, CFSTR("AppleInternalMonthlyChallengeCadenceLastOverrideDateKey"));
  objc_msgSend(v4, "synchronize");

}

- (double)_targetGoalValueForCurrentMonthForType:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  NSObject *v18;
  double v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  NSObject *v23;
  _BOOL4 v24;
  double v25;
  int v27;
  double v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[ACHMonthlyChallengeTemplateSource dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeTemplateSource _dateComponentIntervalForLastMonth](self, "_dateComponentIntervalForLastMonth");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeTemplateSource currentCalendar](self, "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForMonthlyChallengeType:forDateComponentInterval:calendar:error:", a3, v8, v9, a4);
  v11 = v10;

  -[ACHMonthlyChallengeTemplateSource dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeTemplateSource _dateComponentIntervalForTwoMonthsAgo](self, "_dateComponentIntervalForTwoMonthsAgo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeTemplateSource currentCalendar](self, "currentCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueForMonthlyChallengeType:forDateComponentInterval:calendar:error:", a3, v13, v14, a4);
  v16 = v15;

  ACHLogMonthlyChallenges();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 134218240;
    v28 = v11;
    v29 = 2048;
    v30 = v16;
    _os_log_impl(&dword_21407B000, v17, OS_LOG_TYPE_DEFAULT, "Creating goal value for this month with last month value: %f, two months ago value: %f", (uint8_t *)&v27, 0x16u);
  }

  if (a3 != 29 && a3)
  {
    ACHLogMonthlyChallenges();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v16 >= 1.0)
    {
      if (v24)
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_21407B000, v23, OS_LOG_TYPE_DEFAULT, "Target goal = lowest month of the last 2 months", (uint8_t *)&v27, 2u);
      }

      if (v11 >= v16)
        v11 = v16;
    }
    else
    {
      if (v24)
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_21407B000, v23, OS_LOG_TYPE_DEFAULT, "If there is no data two months ago, match last month's value", (uint8_t *)&v27, 2u);
      }

    }
    -[ACHMonthlyChallengeTemplateSource _roundedGoalValue:monthlyChallengeType:](self, "_roundedGoalValue:monthlyChallengeType:", a3, v11);
    v19 = v25;
    ACHLogMonthlyChallenges();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 134217984;
      v28 = v19;
      v20 = "Target value (%f) created";
      v21 = v18;
      v22 = 12;
      goto LABEL_17;
    }
  }
  else
  {
    ACHLogMonthlyChallenges();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = -1.0;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      v20 = "Trying to create goal value for ACHMonthlyChallengeTypeUndefined or ACHMonthlyChallengeTypeMaxValue, returning";
      v21 = v18;
      v22 = 2;
LABEL_17:
      _os_log_impl(&dword_21407B000, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v27, v22);
    }
  }

  return v19;
}

- (double)_goalValueForCurrentMonthForType:(unint64_t)a3 error:(id *)a4
{
  double v6;
  double v7;
  double result;
  NSObject *v9;

  -[ACHMonthlyChallengeTemplateSource _targetGoalValueForCurrentMonthForType:error:](self, "_targetGoalValueForCurrentMonthForType:error:");
  v7 = v6;
  result = 0.0;
  if (!*a4)
  {
    result = v7;
    if (v7 < 2.22044605e-16)
    {
      ACHLogMonthlyChallenges();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[ACHMonthlyChallengeTemplateSource _goalValueForCurrentMonthForType:error:].cold.1(a3, v9);

      return 0.0;
    }
  }
  return result;
}

- (double)_capGoalValueForChallengeType:(unint64_t)a3 goalValue:(double)a4
{
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v14;

  -[ACHMonthlyChallengeTemplateSource _maximumValueForMonthlyChallengeType:](self, "_maximumValueForMonthlyChallengeType:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeTemplateSource _minimumValueForMonthlyChallengeType:](self, "_minimumValueForMonthlyChallengeType:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v10 = v9;
  objc_msgSend(v8, "doubleValue");
  if (v10 >= a4)
    v12 = a4;
  else
    v12 = v10;
  if (!v7)
    v12 = a4;
  if (v11 < v12 || v8 == 0)
    v14 = v12;
  else
    v14 = v11;

  return v14;
}

- (id)_suffixForCurrentMonthForType:(unint64_t)a3 template:(id)a4 goal:(double)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  double v24;
  double v25;
  double v26;
  NSObject *v27;
  void *v28;
  double v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  const char *v35;
  NSObject *v36;
  NSObject *v37;
  double v38;
  _BOOL4 v39;
  _BOOL4 v40;
  _BOOL4 v41;
  _BOOL4 v43;
  _BOOL4 v44;
  _BOOL4 v45;
  int v46;
  double v47;
  __int16 v48;
  double v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  -[ACHMonthlyChallengeTemplateSource dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeTemplateSource _dateComponentIntervalForLastMonth](self, "_dateComponentIntervalForLastMonth");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeTemplateSource currentCalendar](self, "currentCalendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForMonthlyChallengeType:forDateComponentInterval:calendar:error:", a3, v12, v13, a6);
  v15 = v14;

  -[ACHMonthlyChallengeTemplateSource dataSource](self, "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeTemplateSource _dateComponentIntervalForTwoMonthsAgo](self, "_dateComponentIntervalForTwoMonthsAgo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMonthlyChallengeTemplateSource currentCalendar](self, "currentCalendar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "valueForMonthlyChallengeType:forDateComponentInterval:calendar:error:", a3, v17, v18, a6);
  v20 = v19;

  ACHLogMonthlyChallenges();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v46 = 134218240;
    v47 = v15;
    v48 = 2048;
    v49 = v20;
    _os_log_impl(&dword_21407B000, v21, OS_LOG_TYPE_DEFAULT, "Obtaining suffix for this month with last month value: %f, two months ago value: %f", (uint8_t *)&v46, 0x16u);
  }

  if (a3 != 29 && a3)
  {
    -[ACHMonthlyChallengeTemplateSource _targetGoalValueForCurrentMonthForType:error:](self, "_targetGoalValueForCurrentMonthForType:error:", a3, a6);
    v25 = v24;
    -[ACHMonthlyChallengeTemplateSource _maximumValueForMonthlyChallengeType:](self, "_maximumValueForMonthlyChallengeType:", a3);
    v22 = objc_claimAutoreleasedReturnValue();
    -[NSObject doubleValue](v22, "doubleValue");
    if (v22 && v25 > v26)
    {
      ACHLogMonthlyChallenges();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v46) = 0;
        _os_log_impl(&dword_21407B000, v27, OS_LOG_TYPE_DEFAULT, "Target goal is over challenge type's maximum. Suffix is nil.", (uint8_t *)&v46, 2u);
      }
      v23 = 0;
      goto LABEL_41;
    }
    -[ACHMonthlyChallengeTemplateSource possibleLocalizationSuffixesForTemplate:](self, "possibleLocalizationSuffixesForTemplate:", v10);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    ACHLowRuleThresholdForChallenge();
    if (v29 >= a5)
    {
      ACHLogMonthlyChallenges();
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
      v34 = (void *)*MEMORY[0x24BE014D8];
      if (!v33)
        goto LABEL_21;
      v46 = 138543362;
      v47 = *(double *)&v34;
      v35 = "If goal is lower than Low Rule Threshold, suffix is %{public}@.";
      goto LABEL_20;
    }
    if (v20 < 1.0)
    {
      ACHLogMonthlyChallenges();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v46) = 0;
        _os_log_impl(&dword_21407B000, v30, OS_LOG_TYPE_DEFAULT, "If there is no data two months ago, suffix is nil.", (uint8_t *)&v46, 2u);
      }
      v31 = 0;
      goto LABEL_26;
    }
    v38 = v15 / v20 * 100.0 + -100.0;
    if (v38 <= -25.0)
    {
      ACHLogMonthlyChallenges();
      v32 = objc_claimAutoreleasedReturnValue();
      v40 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
      v34 = (void *)*MEMORY[0x24BE014D0];
      if (v40)
      {
        v46 = 138543362;
        v47 = *(double *)&v34;
        v35 = "Decrease from Month A to Month B = 25%%+, suffix is %{public}@.";
        goto LABEL_20;
      }
    }
    else if (v38 >= -10.0)
    {
      if (v38 >= 0.0)
      {
        if (v38 >= 25.0)
        {
          ACHLogMonthlyChallenges();
          v32 = objc_claimAutoreleasedReturnValue();
          v43 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
          v34 = (void *)*MEMORY[0x24BE014D0];
          if (v43)
          {
            v46 = 138543362;
            v47 = *(double *)&v34;
            v35 = "Increase from Month A to Month B = 25%%+, suffix is %{public}@.";
            goto LABEL_20;
          }
        }
        else if (v38 >= 10.0)
        {
          ACHLogMonthlyChallenges();
          v32 = objc_claimAutoreleasedReturnValue();
          v44 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
          v34 = (void *)*MEMORY[0x24BE014E0];
          if (v44)
          {
            v46 = 138543362;
            v47 = *(double *)&v34;
            v35 = "Increase from Month A to Month B = 10 - 24%%, suffix is %{public}@.";
            goto LABEL_20;
          }
        }
        else
        {
          if (v38 < 0.0)
            goto LABEL_39;
          ACHLogMonthlyChallenges();
          v32 = objc_claimAutoreleasedReturnValue();
          v45 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
          v34 = (void *)*MEMORY[0x24BE014F0];
          if (v45)
          {
            v46 = 138543362;
            v47 = *(double *)&v34;
            v35 = "Increase from Month A to Month B = 0 - 9%%, suffix is %{public}@.";
            goto LABEL_20;
          }
        }
      }
      else
      {
        ACHLogMonthlyChallenges();
        v32 = objc_claimAutoreleasedReturnValue();
        v41 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
        v34 = (void *)*MEMORY[0x24BE014E8];
        if (v41)
        {
          v46 = 138543362;
          v47 = *(double *)&v34;
          v35 = "Decrease from Month A to Month B = 0-9%%, suffix is %{public}@.";
          goto LABEL_20;
        }
      }
    }
    else
    {
      ACHLogMonthlyChallenges();
      v32 = objc_claimAutoreleasedReturnValue();
      v39 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
      v34 = (void *)*MEMORY[0x24BE014E0];
      if (v39)
      {
        v46 = 138543362;
        v47 = *(double *)&v34;
        v35 = "Decrease from Month A to Month B = 10-24%%, suffix is %{public}@.";
LABEL_20:
        _os_log_impl(&dword_21407B000, v32, OS_LOG_TYPE_DEFAULT, v35, (uint8_t *)&v46, 0xCu);
      }
    }
LABEL_21:

    v36 = v34;
    if (v36)
    {
      v30 = v36;
      if (objc_msgSend(v28, "containsObject:", v36))
        v37 = v30;
      else
        v37 = 0;
      v31 = v37;
LABEL_26:

LABEL_40:
      v27 = v31;

      v23 = v27;
LABEL_41:

      goto LABEL_42;
    }
LABEL_39:
    v31 = 0;
    goto LABEL_40;
  }
  ACHLogMonthlyChallenges();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v46) = 0;
    _os_log_impl(&dword_21407B000, v22, OS_LOG_TYPE_DEFAULT, "Trying to obtain suffix for ACHMonthlyChallengeTypeUndefined or ACHMonthlyChallengeTypeMaxValue, returning", (uint8_t *)&v46, 2u);
  }
  v23 = 0;
LABEL_42:

  return v23;
}

- (double)_roundedGoalValue:(double)a3 monthlyChallengeType:(unint64_t)a4
{
  double v4;
  double v5;
  double v6;
  NSObject *v7;
  void *v8;
  int v10;
  double v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v4 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  if (a3 >= 2.22044605e-16)
  {
    if (a4 == 20 || a4 == 6)
    {
      v4 = ceil(a3 / 10.0) * 10.0;
    }
    else
    {
      v5 = ceil(a3);
      v6 = ceil(v4 / 100.0);
      if (a4 == 5)
        v4 = v6 * 100.0;
      else
        v4 = v5;
    }
    ACHLogMonthlyChallenges();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      ACHMonthlyChallengeNameFromChallengeType();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 134218242;
      v11 = v4;
      v12 = 2114;
      v13 = v8;
      _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "Rounded goal value (%f) set for Monthly Challenge: %{public}@", (uint8_t *)&v10, 0x16u);

    }
  }
  return v4;
}

- (id)_maximumValueForMonthlyChallengeType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (a3 > 0x18)
  {
    v6 = 0;
  }
  else if (((1 << a3) & 0x10FFF9E) != 0)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    -[ACHMonthlyChallengeTemplateSource currentDate](self, "currentDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithUnsignedInteger:", -[ACHMonthlyChallengeTemplateSource _numberOfDaysInMonthForDate:](self, "_numberOfDaysInMonthForDate:", v5) - 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (((1 << a3) & 0xA00000) != 0)
  {
    v6 = &unk_24D15B5B8;
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_minimumValueForMonthlyChallengeType:(unint64_t)a3
{
  if (a3 - 1 > 0x1B)
    return 0;
  else
    return (id)qword_24D13C370[a3 - 1];
}

- (void)setCurrentDateOverride:(id)a3
{
  objc_storeStrong((id *)&self->_currentDateOverride, a3);
}

- (void)setCurrentCalendarOverride:(id)a3
{
  objc_storeStrong((id *)&self->_currentCalendarOverride, a3);
}

- (void)setIsStandalonePhoneFitnessModeOverride:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *isStandalonePhoneFitnessModeOverride;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  isStandalonePhoneFitnessModeOverride = self->_isStandalonePhoneFitnessModeOverride;
  self->_isStandalonePhoneFitnessModeOverride = v4;

}

- (void)setPairedDeviceRegistrySharedInstanceOverride:(id)a3
{
  objc_storeStrong((id *)&self->_pairedDeviceRegistrySharedInstanceOverride, a3);
}

- (NSDate)currentDate
{
  NSDate *currentDateOverride;

  currentDateOverride = self->_currentDateOverride;
  if (currentDateOverride)
    return currentDateOverride;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSCalendar)currentCalendar
{
  NSCalendar *currentCalendarOverride;

  currentCalendarOverride = self->_currentCalendarOverride;
  if (currentCalendarOverride)
    return currentCalendarOverride;
  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendarWithLocalTimeZone");
  return (NSCalendar *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isStandalonePhoneFitnessMode
{
  NSNumber *isStandalonePhoneFitnessModeOverride;
  void *v4;
  char v5;

  isStandalonePhoneFitnessModeOverride = self->_isStandalonePhoneFitnessModeOverride;
  if (isStandalonePhoneFitnessModeOverride)
    return -[NSNumber BOOLValue](isStandalonePhoneFitnessModeOverride, "BOOLValue");
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isStandalonePhoneFitnessMode");

  return v5;
}

- (BOOL)subObjectsHaveDatabaseAssertions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[ACHMonthlyChallengeTemplateSource dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "databaseContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[ACHMonthlyChallengeTemplateSource templateCache](self, "templateCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "databaseContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)pairedDeviceRegistrySharedInstance
{
  NRPairedDeviceRegistry *pairedDeviceRegistrySharedInstanceOverride;

  pairedDeviceRegistrySharedInstanceOverride = self->_pairedDeviceRegistrySharedInstanceOverride;
  if (pairedDeviceRegistrySharedInstanceOverride)
    return pairedDeviceRegistrySharedInstanceOverride;
  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setCurrentCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_currentCalendar, a3);
}

- (void)setCurrentDate:(id)a3
{
  objc_storeStrong((id *)&self->_currentDate, a3);
}

- (void)setIsStandalonePhoneFitnessMode:(BOOL)a3
{
  self->_isStandalonePhoneFitnessMode = a3;
}

- (ACHMonthlyChallengeDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (ACHMonthlyChallengeTemplateDataProvider)templateDataProvider
{
  return self->_templateDataProvider;
}

- (void)setTemplateDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_templateDataProvider, a3);
}

- (ACHSyncingMonthlyChallengeTemplateCache)templateCache
{
  return self->_templateCache;
}

- (void)setTemplateCache:(id)a3
{
  objc_storeStrong((id *)&self->_templateCache, a3);
}

- (BOOL)isAppleWatch
{
  return self->_isAppleWatch;
}

- (void)setIsAppleWatch:(BOOL)a3
{
  self->_isAppleWatch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateCache, 0);
  objc_storeStrong((id *)&self->_templateDataProvider, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_pairedDeviceRegistrySharedInstanceOverride, 0);
  objc_storeStrong((id *)&self->_isStandalonePhoneFitnessModeOverride, 0);
  objc_storeStrong((id *)&self->_currentCalendarOverride, 0);
  objc_storeStrong((id *)&self->_currentDateOverride, 0);
}

- (void)templatesForDate:(uint64_t)a1 databaseContext:(NSObject *)a2 completion:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_21407B000, a2, a3, "Error loading cached templates: %@", (uint8_t *)&v3);
}

- (void)customPlaceholderValuesForTemplate:(NSObject *)a3 error:.cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "availabilityStart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "startDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_debug_impl(&dword_21407B000, a3, OS_LOG_TYPE_DEBUG, "Progress: not adding progress as challenge not for current month: availability start (%{public}@) vs current month start date (%{public}@).", (uint8_t *)&v7, 0x16u);

}

- (void)_goalValueForCurrentMonthForType:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_0(&dword_21407B000, a2, v4, "Calculated a zero target value for type %{public}@", (uint8_t *)&v5);

}

@end
