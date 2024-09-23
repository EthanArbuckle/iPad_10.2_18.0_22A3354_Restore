@implementation HDTTRPromptController

- (HDTTRPromptController)initWithProfile:(id)a3 domainName:(id)a4 loggingCategory:(id)a5
{
  id v7;
  id v8;
  HDTTRPromptController *v9;
  HDTTRPromptController *v10;
  uint64_t v11;
  NSString *name;
  uint64_t v13;
  NSString *notificationTitle;
  uint64_t v15;
  NSString *notificationMessage;
  uint64_t v17;
  NSString *radarTitle;
  uint64_t v19;
  NSString *radarDescription;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HDTTRPromptController;
  v9 = -[HDTTRPromptController init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_profile, v7);
    +[HDTTRPromptController _nameForDomainName:]((uint64_t)HDTTRPromptController, v8);
    v11 = objc_claimAutoreleasedReturnValue();
    name = v10->_name;
    v10->_name = (NSString *)v11;

    v10->_minimumPromptInterval = 604800.0;
    v10->_maximumErrorCount = 7;
    v10->_canRepromptOnSameBuild = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Health error, %@"), v10->_name);
    v13 = objc_claimAutoreleasedReturnValue();
    notificationTitle = v10->_notificationTitle;
    v10->_notificationTitle = (NSString *)v13;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Health has run into a number of errors. Please file a radar with Tap-to-Radar against 'Health'"));
    v15 = objc_claimAutoreleasedReturnValue();
    notificationMessage = v10->_notificationMessage;
    v10->_notificationMessage = (NSString *)v15;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] Multiple errors detected"), v10->_name);
    v17 = objc_claimAutoreleasedReturnValue();
    radarTitle = v10->_radarTitle;
    v10->_radarTitle = (NSString *)v17;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Multiple errors detected %@"), v10->_name);
    v19 = objc_claimAutoreleasedReturnValue();
    radarDescription = v10->_radarDescription;
    v10->_radarDescription = (NSString *)v19;

  }
  return v10;
}

+ (id)_nameForDomainName:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), objc_opt_self(), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_stringByRemovingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HDTTRPromptController)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

+ (id)formattedPersistedValuesForDomainName:(id)a3 database:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  id v28;
  id v29;

  v6 = a4;
  +[HDTTRPromptController _nameForDomainName:]((uint64_t)HDTTRPromptController, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDTTRPromptController _persistedValueKeys]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  +[HDKeyValueEntity _rawValuesForKeys:domain:category:database:error:](HDUnprotectedKeyValueEntity, "_rawValuesForKeys:domain:category:database:error:", v8, v7, 0, v6, &v29);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v29;
  if (v9)
  {
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Errors"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (void *)MEMORY[0x1E0CB3710];
        v13 = (void *)MEMORY[0x1E0C99E60];
        v14 = objc_opt_class();
        objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v10;
        objc_msgSend(v12, "unarchivedObjectOfClasses:fromData:error:", v15, v11, &v28);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v28;

        if (!v16)
        {
          v18 = 0;
          v10 = v17;
LABEL_14:

          goto LABEL_15;
        }
        v10 = v17;
      }
      else
      {
        v16 = 0;
      }
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("LastPromptDate"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v27 = v11;
      if (v19)
      {
        v21 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v19, "doubleValue");
        objc_msgSend(v21, "dateWithTimeIntervalSinceReferenceDate:");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = 0;
      }
      v23 = (void *)MEMORY[0x1E0CB3940];
      HKDiagnosticStringFromDate();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("LastPromptBuild"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("%@ Values:\n%@: %@\n%@: %@\n%@: %@\n"), v7, CFSTR("LastPromptDate"), v24, CFSTR("LastPromptBuild"), v25, CFSTR("Errors"), v16);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v11 = v27;
      goto LABEL_14;
    }
    v18 = &stru_1E6D11BB8;
  }
  else
  {
    v18 = 0;
  }
LABEL_15:

  return v18;
}

+ (id)_persistedValueKeys
{
  _QWORD v1[4];

  v1[3] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v1[0] = CFSTR("Errors");
  v1[1] = CFSTR("LastPromptDate");
  v1[2] = CFSTR("LastPromptBuild");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)HDTTRPromptController;
  -[HDTTRPromptController description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@>"), v4, self->_name);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)promptIfRequiredForReason:(id)a3 success:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *loggingCategory;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id WeakRetained;
  void *v39;
  void *v40;
  unint64_t v41;
  unint64_t maximumErrorCount;
  double v43;
  BOOL v44;
  char v45;
  char v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  NSString *radarDescription;
  id v54;
  void *v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  NSObject *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  NSObject *v65;
  NSObject *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  id v71;
  NSObject *v72;
  NSObject *v73;
  NSObject *v74;
  BOOL *p_isPresenting;
  void *v77;
  uint64_t v78;
  id v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  NSObject *v84;
  NSObject *v85;
  id v86;
  id v87;
  id v88;
  uint64_t v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  _BYTE buf[24];
  void *v110;
  _BYTE v111[20];
  __int16 v112;
  id v113;
  _QWORD v114[3];
  _QWORD v115[3];
  _QWORD v116[2];
  _QWORD v117[4];

  v6 = a4;
  v117[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if ((objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall") & 1) != 0 || _HDIsUnitTesting)
  {
    -[HDTTRPromptController _keyValueDomain]((HDKeyValueDomain *)self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("Errors"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = 0;
      v13 = objc_msgSend(v11, "removeValuesForKeys:error:", v12, &v108);
      v14 = v108;

      if ((v13 & 1) == 0)
      {
        _HKInitializeLogging();
        loggingCategory = self->_loggingCategory;
        if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = CFSTR("Errors");
          *(_WORD *)&buf[22] = 2114;
          v110 = v14;
          _os_log_error_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_ERROR, "%{public}@: unable to clear value for %{public}@: %{public}@", buf, 0x20u);
        }
      }
      v16 = (uint64_t)v9;
      goto LABEL_77;
    }
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Error not provided"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v101 = v11;
    if (self)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.ErrorDate"), self->_name);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    v116[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HKDiagnosticStringFromDate();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v117[0] = v19;
    if (self)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.Reason"), self->_name);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
    v116[1] = v20;
    v117[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v117, v116, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hk_errorByAddingEntriesToUserInfo:", v21);
    v16 = objc_claimAutoreleasedReturnValue();

    +[HDTTRPromptController _persistedValueKeys]();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = 0;
    v11 = v101;
    objc_msgSend(v101, "valuesForKeys:error:", v22, &v107);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v107;
    if (!v23)
    {
      _HKInitializeLogging();
      v32 = self->_loggingCategory;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v22;
        *(_WORD *)&buf[22] = 2114;
        v110 = v14;
        _os_log_error_impl(&dword_1B7802000, v32, OS_LOG_TYPE_ERROR, "%{public}@: unable to get values for keys %@: %{public}@", buf, 0x20u);
      }
      goto LABEL_76;
    }
    v97 = v22;
    v100 = v23;
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("Errors"));
    v24 = objc_claimAutoreleasedReturnValue();
    v96 = (void *)v24;
    if (v24)
    {
      v25 = v24;
      v26 = (void *)MEMORY[0x1E0CB3710];
      v27 = (void *)MEMORY[0x1E0C99E60];
      v28 = objc_opt_class();
      objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = v14;
      objc_msgSend(v26, "unarchivedObjectOfClasses:fromData:error:", v29, v25, &v106);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v31 = v106;

      if (!v30)
      {
        _HKInitializeLogging();
        v73 = self->_loggingCategory;
        if (!os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          v11 = v101;
          v63 = v96;
          v22 = v97;
LABEL_75:

          v14 = v31;
          v23 = v100;
LABEL_76:

LABEL_77:
          v9 = (id)v16;
          goto LABEL_78;
        }
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        v63 = v96;
        *(_QWORD *)&buf[14] = v96;
        *(_WORD *)&buf[22] = 2112;
        v110 = v31;
        _os_log_error_impl(&dword_1B7802000, v73, OS_LOG_TYPE_ERROR, "%{public}@: unable to unarchive errors from data %@: %@", buf, 0x20u);
        v11 = v101;
LABEL_74:
        v22 = v97;
        goto LABEL_75;
      }
      v14 = v31;
    }
    else
    {
      v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    }
    v92 = v8;
    objc_msgSend(v30, "insertObject:atIndex:", v16, 0);
    while ((unint64_t)objc_msgSend(v30, "count") > self->_maximumErrorCount)
      objc_msgSend(v30, "removeLastObject");
    v33 = v16;
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("LastPromptDate"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = v34;
    if (v34)
    {
      v35 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v34, "doubleValue");
      objc_msgSend(v35, "dateWithTimeIntervalSinceReferenceDate:");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v36 = 0;
    }
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("LastPromptBuild"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "behavior");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "currentOSBuild");
    v99 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = objc_msgSend(v30, "count");
    maximumErrorCount = self->_maximumErrorCount;
    v98 = v36;
    if (v36)
    {
      objc_msgSend(v36, "timeIntervalSinceNow");
      v44 = fabs(v43) <= self->_minimumPromptInterval;
    }
    else
    {
      v44 = 0;
    }
    v16 = v33;
    if (self->_canRepromptOnSameBuild)
    {
      v45 = 0;
      v8 = v92;
    }
    else
    {
      v8 = v92;
      if (v37 == v99)
        goto LABEL_46;
      if (v99)
        v45 = objc_msgSend(v37, "isEqualToString:");
      else
        v45 = 0;
    }
    v46 = v41 < maximumErrorCount || v44;
    if ((v46 & 1) == 0 && (v45 & 1) == 0)
    {
      v89 = v16;
      v47 = v30;
      v48 = v37;
      v49 = v47;
      v90 = v48;
      v50 = v48;
      v51 = v98;
      v52 = (void *)MEMORY[0x1E0CB3940];
      radarDescription = self->_radarDescription;
      v54 = v99;
      v93 = v51;
      HKDiagnosticStringFromDate();
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v49, "count");
      v88 = v49;
      v86 = v49;
      v57 = v50;
      objc_msgSend(v52, "stringWithFormat:", CFSTR("%@. Last Prompt (%@, %@), Current (%@) Errors (%lu): %@"), radarDescription, v50, v55, v54, v56, v86);
      v58 = objc_claimAutoreleasedReturnValue();
      v87 = v54;

      _HKInitializeLogging();
      v59 = self->_loggingCategory;
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v58;
        _os_log_impl(&dword_1B7802000, v59, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
      }
      v91 = (void *)v58;
      v60 = v57;
      if (_HDIsUnitTesting)
      {
        v61 = _Block_copy(self->_unitTest_willPresentTTRAlertHandler);
        v62 = v61;
        v63 = v96;
        v16 = v89;
        v37 = v90;
        if (v61)
        {
          v64 = v88;
          (*((void (**)(void *, HDTTRPromptController *, id, void *, void *))v61 + 2))(v61, self, v88, v60, v93);
        }
        else
        {
LABEL_62:
          v64 = v88;
        }

      }
      else
      {
        p_isPresenting = &self->_isPresenting;
        v63 = v96;
        v16 = v89;
        v37 = v90;
        while (!__ldaxr((unsigned __int8 *)p_isPresenting))
        {
          if (!__stlxr(1u, (unsigned __int8 *)p_isPresenting))
          {
            v62 = objc_alloc_init(MEMORY[0x1E0D298D0]);
            objc_msgSend(v62, "setTitle:", self->_notificationTitle);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@. Please file a radar with Tap-to-Radar against 'Health'"), self->_notificationMessage);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "setMessage:", v77);

            objc_msgSend(v62, "setDefaultButton:", CFSTR("Tap-to-Radar"));
            objc_msgSend(v62, "setCancelButton:", CFSTR("Not Now"));
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __96__HDTTRPromptController__presentTTRPromptForErrors_lastPromptBuild_lastPromptDate_currentBuild___block_invoke;
            v110 = &unk_1E6CEEA08;
            *(_QWORD *)v111 = self;
            *(_QWORD *)&v111[8] = v91;
            objc_msgSend(v62, "presentWithResponseHandler:", buf);

            goto LABEL_62;
          }
        }
        __clrex();
        v64 = v88;
      }

      v105 = v14;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v64, 1, &v105);
      v78 = objc_claimAutoreleasedReturnValue();
      v79 = v105;

      v94 = (void *)v78;
      if (v78)
      {
        v115[0] = v78;
        v114[0] = CFSTR("Errors");
        v114[1] = CFSTR("LastPromptDate");
        v80 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "timeIntervalSinceReferenceDate");
        objc_msgSend(v80, "numberWithDouble:");
        v82 = objc_claimAutoreleasedReturnValue();
        v114[2] = CFSTR("LastPromptBuild");
        v115[1] = v82;
        v115[2] = v87;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v115, v114, 3);
        v83 = (void *)objc_claimAutoreleasedReturnValue();

        v104 = v79;
        LOBYTE(v82) = objc_msgSend(v101, "setValuesWithDictionary:error:", v83, &v104);
        v31 = v104;

        if ((v82 & 1) == 0)
        {
          _HKInitializeLogging();
          v84 = self->_loggingCategory;
          if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v83;
            *(_WORD *)&buf[22] = 2114;
            v110 = v31;
            _os_log_error_impl(&dword_1B7802000, v84, OS_LOG_TYPE_ERROR, "%{public}@: unable to set values %{public}@: %{public}@", buf, 0x20u);
          }
        }

      }
      else
      {
        _HKInitializeLogging();
        v85 = self->_loggingCategory;
        if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v64;
          *(_WORD *)&buf[22] = 2112;
          v110 = v79;
          _os_log_error_impl(&dword_1B7802000, v85, OS_LOG_TYPE_ERROR, "%{public}@: unable to archive errors %@: %@", buf, 0x20u);
        }
        v31 = v79;
      }
      v11 = v101;

      goto LABEL_73;
    }
LABEL_46:
    _HKInitializeLogging();
    v65 = self->_loggingCategory;
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      v66 = v65;
      HKDiagnosticStringFromDate();
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v30, "count");
      *(_DWORD *)buf = 138544642;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v67;
      *(_WORD *)&buf[22] = 2114;
      v110 = v37;
      *(_WORD *)v111 = 2114;
      *(_QWORD *)&v111[2] = v99;
      *(_WORD *)&v111[10] = 2048;
      *(_QWORD *)&v111[12] = v68;
      v112 = 2114;
      v113 = v30;
      _os_log_impl(&dword_1B7802000, v66, OS_LOG_TYPE_INFO, "%{public}@: TTR alert: lastPromptDate %{public}@, lastPromptBuild %{public}@ (current build %{public}@), errors (%lu) %{public}@", buf, 0x3Eu);

    }
    v103 = v14;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v30, 1, &v103);
    v69 = objc_claimAutoreleasedReturnValue();
    v31 = v103;

    v11 = v101;
    if (v69)
    {
      v102 = v31;
      v70 = objc_msgSend(v101, "setData:forKey:error:", v69, CFSTR("Errors"), &v102);
      v71 = v102;

      if ((v70 & 1) == 0)
      {
        _HKInitializeLogging();
        v72 = self->_loggingCategory;
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = CFSTR("Errors");
          *(_WORD *)&buf[22] = 2114;
          v110 = v71;
          _os_log_error_impl(&dword_1B7802000, v72, OS_LOG_TYPE_ERROR, "%{public}@: unable to set values for %{public}@: %{public}@", buf, 0x20u);
        }
      }
      v63 = (void *)v69;
      v31 = v71;
      v11 = v101;
    }
    else
    {
      _HKInitializeLogging();
      v74 = self->_loggingCategory;
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v30;
        *(_WORD *)&buf[22] = 2112;
        v110 = v31;
        _os_log_error_impl(&dword_1B7802000, v74, OS_LOG_TYPE_ERROR, "%{public}@: unable to archive errors %@: %@", buf, 0x20u);
      }
      v63 = 0;
    }
LABEL_73:

    goto LABEL_74;
  }
  _HKInitializeLogging();
  v10 = self->_loggingCategory;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = self;
    _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: skip TTR prompt check", buf, 0xCu);
  }
LABEL_78:

}

- (HDKeyValueDomain)_keyValueDomain
{
  HDKeyValueDomain *v1;
  HDKeyValueDomain *v2;
  int64_t category;
  id WeakRetained;

  v1 = a1;
  if (a1)
  {
    v2 = [HDKeyValueDomain alloc];
    category = v1->_category;
    WeakRetained = objc_loadWeakRetained((id *)&v1->_profile);
    v1 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v2, "initWithCategory:domainName:profile:", 0, category, WeakRetained);

  }
  return v1;
}

void __96__HDTTRPromptController__presentTTRPromptForErrors_lastPromptBuild_lastPromptDate_currentBuild___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 24));
  if (a3 == 1)
  {
    _HKInitializeLogging();
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(NSObject **)(v13 + 16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v13;
      _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: TTR alert: 'Not Now' button pressed", buf, 0xCu);
    }
  }
  else if (!a3)
  {
    _HKInitializeLogging();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(NSObject **)(v9 + 16);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v9;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: TTR alert: 'Tap-to-Radar' button pressed", buf, 0xCu);
      v9 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "hk_tapToHealthRadarURLWithTitle:description:classification:reproducibility:keywords:autoDiagnostics:attachments:", *(_QWORD *)(v9 + 72), *(_QWORD *)(a1 + 40), 6, 6, 0, 2, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "openURL:configuration:completionHandler:", v11, 0, &__block_literal_global_208);

  }
}

void __96__HDTTRPromptController__presentTTRPromptForErrors_lastPromptBuild_lastPromptDate_currentBuild___block_invoke_236(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!a2)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = v4;
      _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "Could not open Tap-to-Radar URL %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }

}

- (BOOL)unitTest_setLastPromptDate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[HDTTRPromptController _keyValueDomain]((HDKeyValueDomain *)self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "setDate:forKey:error:", v6, CFSTR("LastPromptDate"), a4);

  return (char)a4;
}

- (BOOL)unitTest_setLastPromptBuild:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[HDTTRPromptController _keyValueDomain]((HDKeyValueDomain *)self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "setString:forKey:error:", v6, CFSTR("LastPromptBuild"), a4);

  return (char)a4;
}

- (NSString)name
{
  return self->_name;
}

- (double)minimumPromptInterval
{
  return self->_minimumPromptInterval;
}

- (void)setMinimumPromptInterval:(double)a3
{
  self->_minimumPromptInterval = a3;
}

- (int64_t)maximumErrorCount
{
  return self->_maximumErrorCount;
}

- (void)setMaximumErrorCount:(int64_t)a3
{
  self->_maximumErrorCount = a3;
}

- (BOOL)canRepromptOnSameBuild
{
  return self->_canRepromptOnSameBuild;
}

- (void)setCanRepromptOnSameBuild:(BOOL)a3
{
  self->_canRepromptOnSameBuild = a3;
}

- (NSString)notificationTitle
{
  return self->_notificationTitle;
}

- (void)setNotificationTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)notificationMessage
{
  return self->_notificationMessage;
}

- (void)setNotificationMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)radarTitle
{
  return self->_radarTitle;
}

- (void)setRadarTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)radarDescription
{
  return self->_radarDescription;
}

- (void)setRadarDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)unitTest_willPresentTTRAlertHandler
{
  return self->_unitTest_willPresentTTRAlertHandler;
}

- (void)setUnitTest_willPresentTTRAlertHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_willPresentTTRAlertHandler, 0);
  objc_storeStrong((id *)&self->_radarDescription, 0);
  objc_storeStrong((id *)&self->_radarTitle, 0);
  objc_storeStrong((id *)&self->_notificationMessage, 0);
  objc_storeStrong((id *)&self->_notificationTitle, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
