@implementation CKSQLiteDatabaseManager

+ (id)managerInDatabase:(id)a3 error:(id *)a4
{
  id v6;
  objc_class *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;

  v6 = a3;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_groupNameWithDomain_domainIdentifier_groupName_(CKSQLiteDatabaseManager, v9, 0, 0, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_tableGroupInDatabase_withName_error_(a1, v11, (uint64_t)v6, (uint64_t)v10, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)migrateDataFromGroup:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v6[16];

  v3 = a3;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v4 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_fault_impl(&dword_18A5C5000, v4, OS_LOG_TYPE_FAULT, "CKSQLiteDatabaseManagerTableGroup migration needed", v6, 2u);
  }

  return 0;
}

- (id)createTables:(id *)a3
{
  CKSQLiteDatabaseRegistry *v4;
  const char *v5;
  uint64_t v6;
  CKSQLiteDatabaseRegistry *v7;
  CKSQLiteDatabaseRegistry *registry;
  CKSQLiteDatabaseActivities *v9;
  const char *v10;
  uint64_t v11;
  CKSQLiteDatabaseActivities *v12;
  CKSQLiteDatabaseActivities *activities;
  CKSQLiteDatabaseActivities *v14;
  const char *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = [CKSQLiteDatabaseRegistry alloc];
  v7 = (CKSQLiteDatabaseRegistry *)objc_msgSend_initWithLogicalTableName_(v4, v5, (uint64_t)CFSTR("Registry"), v6);
  registry = self->_registry;
  self->_registry = v7;

  v9 = [CKSQLiteDatabaseActivities alloc];
  v12 = (CKSQLiteDatabaseActivities *)objc_msgSend_initWithLogicalTableName_(v9, v10, (uint64_t)CFSTR("Activities"), v11);
  activities = self->_activities;
  self->_activities = v12;

  v14 = self->_activities;
  v17[0] = self->_registry;
  v17[1] = v14;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v15, (uint64_t)v17, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)finishInitializing
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKSQLiteDatabaseManagerTimer *v11;
  CKSQLiteDatabaseManagerTimer *timer;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  CKSQLiteDatabaseManagerTimer *v16;
  const char *v17;
  uint64_t v18;
  CKSQLiteDatabaseManagerTimer *v19;
  CKSQLiteDatabaseManagerTimer *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)CKSQLiteDatabaseManager;
  -[CKSQLiteTableGroup finishInitializing](&v30, sel_finishInitializing);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_db(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_databaseManagerTimer(v7, v8, v9, v10);
  v11 = (CKSQLiteDatabaseManagerTimer *)objc_claimAutoreleasedReturnValue();
  timer = self->_timer;
  self->_timer = v11;

  if (self->_timer)
  {
    if (v3)
      goto LABEL_9;
  }
  else
  {
    v16 = [CKSQLiteDatabaseManagerTimer alloc];
    v19 = (CKSQLiteDatabaseManagerTimer *)objc_msgSend_initWithDatabase_(v16, v17, (uint64_t)v7, v18);
    v20 = self->_timer;
    self->_timer = v19;

    objc_msgSend_setDatabaseManagerTimer_(v7, v21, (uint64_t)self->_timer, v22);
    if (v3)
      goto LABEL_9;
  }
  if (objc_msgSend_isFirstInstance(self, v13, v14, v15))
  {
    objc_msgSend_earliestActivityDate(self->_activities, v23, v24, v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
      objc_msgSend_scheduleActivityDate_(self, v26, (uint64_t)v28, v27);

  }
LABEL_9:

  return v3;
}

- (void)databaseWasRemoved:(id)a3
{
  CKSQLiteDatabaseActivities *activities;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  id v14;
  id v15;

  v15 = a3;
  activities = self->_activities;
  objc_msgSend_databaseID(v15, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend_deleteEntriesForDatabase_(activities, v9, (uint64_t)v8, v10);

  v14 = (id)objc_msgSend_deleteObject_(self->_registry, v12, (uint64_t)v15, v13);
}

- (id)activityEntryForTarget:(id)a3 error:(id *)a4
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CKSQLiteDatabaseActivityEntry *v14;
  CKSQLiteDatabaseRegistry *registry;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v39;
  CKSQLiteDatabaseManager *v40;
  const char *v41;
  id v42;

  v7 = a3;
  objc_msgSend_db(self, v8, v9, v10);

  objc_msgSend_databaseManagerData(v7, v11, v12, v13);
  v14 = (CKSQLiteDatabaseActivityEntry *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v14 = objc_alloc_init(CKSQLiteDatabaseActivityEntry);
    registry = self->_registry;
    objc_msgSend_db(v7, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    objc_msgSend_databaseIDForDatabase_error_(registry, v20, (uint64_t)v19, (uint64_t)&v42);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v42;

    if (v22)
    {

      v14 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v22);
      goto LABEL_11;
    }
    objc_msgSend_setDatabaseID_(v14, v23, (uint64_t)v21, v24);
    objc_msgSend__setupActivityEntry_(v7, v25, (uint64_t)v14, v26);
    objc_msgSend_fetchActivityForTarget_(self->_activities, v27, (uint64_t)v14, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_CKIsNoMatchingRowError_(MEMORY[0x1E0CB35C8], v30, (uint64_t)v29, v31))
    {
      objc_msgSend_distantPast(MEMORY[0x1E0C99D68], v32, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setActivityNotBeforeDate_(v14, v36, (uint64_t)v35, v37);
    }
    else
    {
      if (!v29)
        goto LABEL_10;
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v32, v33, v34);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = self;
      v35 = v39;
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v39, v41, (uint64_t)a2, (uint64_t)v40, CFSTR("CKSQLiteDatabaseManager.m"), 555, CFSTR("database error: %@"), v29);
    }

LABEL_10:
    objc_msgSend_setDatabaseManagerData_(v7, v32, (uint64_t)v14, v34);
LABEL_11:

  }
  return v14;
}

- (void)setSchedulingDataInActivity:(id)a3 date:(id)a4 coalescingInterval:(double)a5 minimumSeparation:(double)a6
{
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  id v30;

  v30 = a3;
  v9 = a4;
  objc_msgSend_setActivityEarliestDate_(v30, v10, (uint64_t)v9, v11);
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v12, v13, v14, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCoalescingInterval_(v30, v16, (uint64_t)v15, v17);

  objc_msgSend_dateByAddingTimeInterval_(v9, v18, v19, v20, a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setActivityLatestDate_(v30, v22, (uint64_t)v21, v23);
  if (a6 > 0.0)
  {
    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v24, v25, v26, a6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSeparationInterval_(v30, v28, (uint64_t)v27, v29);

  }
}

- (id)addActivityTriggerWithTarget:(id)a3 date:(id)a4 coalescingInterval:(double)a5 minimumSeparation:(double)a6
{
  id v10;
  id v11;
  double v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  id v21;
  double v22;
  double v23;

  v10 = a3;
  v11 = a4;
  v12 = 0.001;
  if (a5 > 0.0)
    v12 = a5;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_18A7A5468;
  v19[3] = &unk_1E1F60288;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = a6;
  v13 = v11;
  v14 = v10;
  objc_msgSend_performInTransaction_(self, v15, (uint64_t)v19, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)target:(id)a3 group:(id)a4 willRunActivity:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  pthread_mutex_t *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_db(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = _CKSQLDBSerializerLock((uint64_t)v14 + 8);

  if (v8)
  {
    objc_msgSend_databaseManagerData(v8, v16, v17, v18);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      objc_msgSend_name(v9, v19, v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setGroupName_(v10, v24, (uint64_t)v23, v25);

      v22 = v10;
      objc_msgSend_setDatabaseManagerData_(v8, v26, (uint64_t)v22, v27);
    }
  }
  else
  {
    v22 = v10;
  }
  objc_msgSend_date(MEMORY[0x1E0C99D68], v19, v20, v21);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setActivityStartDate_(v22, v29, (uint64_t)v28, v30);

  objc_msgSend_setActivityEarliestDate_(v22, v31, 0, v32);
  objc_msgSend_setActivityLatestDate_(v22, v33, 0, v34);
  objc_msgSend_setCoalescingInterval_(v22, v35, 0, v36);
  objc_msgSend_distantPast(MEMORY[0x1E0C99D68], v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setActivityNotBeforeDate_(v22, v41, (uint64_t)v40, v42);

  if (v15)
  {
    v15[1].__sig = 0;
    pthread_mutex_unlock(v15);
  }

  return v22;
}

- (void)target:(id)a3 group:(id)a4 didRunActivity:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  pthread_mutex_t *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  double v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  double v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  id v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  double v73;
  _BOOL4 v74;
  id v75;
  id v76;
  void *v77;
  int v78;
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v13 = a5;
  if (!v8)
  {
    v68 = (id)objc_msgSend_deleteObject_(self->_activities, v10, (uint64_t)v13, v12);
    goto LABEL_18;
  }
  objc_msgSend_db(self, v10, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = _CKSQLDBSerializerLock((uint64_t)v14 + 8);

  objc_msgSend_separationInterval(v13, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v19;
  if (v19)
  {
    objc_msgSend_doubleValue(v19, v20, v21, v22);
    objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E0C99D68], v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setActivityNotBeforeDate_(v13, v28, (uint64_t)v27, v29);
    objc_msgSend_activityEarliestDate(v13, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v33;
    if (v33 && objc_msgSend_compare_(v33, v34, (uint64_t)v27, v35) == -1)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v37 = (id)ck_log_facility_sql;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_targetDescription(v13, v38, v39, v40);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = 138543874;
        v79 = v36;
        v80 = 2114;
        v81 = v27;
        v82 = 2114;
        v83 = v77;
        _os_log_debug_impl(&dword_18A5C5000, v37, OS_LOG_TYPE_DEBUG, "CKSQLiteDatabaseManager rescheduled activity: %{public}@ -> %{public}@ for %{public}@", (uint8_t *)&v78, 0x20u);

      }
      objc_msgSend_coalescingInterval(v13, v41, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v44, v45, v46, v47);
      v49 = v48;
      objc_msgSend_separationInterval(v13, v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v53, v54, v55, v56);
      objc_msgSend_setSchedulingDataInActivity_date_coalescingInterval_minimumSeparation_(self, v57, (uint64_t)v13, (uint64_t)v27, v49, v58);

    }
  }
  objc_msgSend_setActivityStartDate_(v13, v20, 0, v22);
  objc_msgSend_activityEarliestDate(v13, v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (v62)
  {

LABEL_15:
    v75 = (id)objc_msgSend_insertOrUpdateActivityDate_(self->_activities, v66, (uint64_t)v13, v67);
    goto LABEL_16;
  }
  objc_msgSend_activityNotBeforeDate(v13, v63, v64, v65);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceNow(v69, v70, v71, v72);
  v74 = v73 > 0.0;

  if (v74)
    goto LABEL_15;
  v76 = (id)objc_msgSend_deleteObject_(self->_activities, v66, (uint64_t)v13, v67);
LABEL_16:

  if (v15)
  {
    v15[1].__sig = 0;
    pthread_mutex_unlock(v15);
  }
LABEL_18:

}

- (id)activitiesStartingBeforeDate:(id)a3
{
  uint64_t v3;

  return (id)objc_msgSend_activitiesStartingBeforeDate_(self->_activities, a2, (uint64_t)a3, v3);
}

- (id)earliestActivityDate
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  pthread_mutex_t *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_db(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _CKSQLDBSerializerLock((uint64_t)v5 + 8);

  objc_msgSend_earliestActivityDate(self->_activities, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v6[1].__sig = 0;
    pthread_mutex_unlock(v6);
  }
  return v10;
}

- (id)registerDatabase:(id)a3
{
  uint64_t v3;

  return (id)objc_msgSend_registerDatabase_(self->_registry, a2, (uint64_t)a3, v3);
}

- (void)scheduleActivityDate:(id)a3
{
  uint64_t v3;

  objc_msgSend_scheduleActivityDate_(self->_timer, a2, (uint64_t)a3, v3);
}

- (void)runActivities:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  int isEqualToNumber;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  int v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  const char *v47;
  void *v48;
  id v49;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  id v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  CKSQLiteDatabaseManager *v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  NSObject *v68;
  const char *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  NSObject *v84;
  void *v85;
  id obj;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  id v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint8_t buf[4];
  id v97;
  __int16 v98;
  id v99;
  __int16 v100;
  id v101;
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v87 = v4;
  objc_msgSend_activitiesStartingBeforeDate_(self, v6, (uint64_t)v4, v7);
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v92, (uint64_t)v102, 16);
  if (v89)
  {
    v85 = v5;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = &unk_1E1FC4BE0;
    v88 = *(_QWORD *)v93;
    while (1)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v93 != v88)
          objc_enumerationMutation(obj);
        v14 = *(id *)(*((_QWORD *)&v92 + 1) + 8 * v13);

        v15 = (void *)MEMORY[0x18D76DE4C]();
        objc_msgSend_databaseID(v14, v16, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToNumber = objc_msgSend_isEqualToNumber_(v12, v20, (uint64_t)v19, v21);

        if (isEqualToNumber)
        {
          v11 = v11;
          if (!v11)
            goto LABEL_12;
        }
        else
        {
          objc_msgSend_databaseID(v14, v23, v24, v25);
          v41 = objc_claimAutoreleasedReturnValue();

          objc_msgSend_databaseWithID_(self->_registry, v42, v41, v43);
          v44 = (id)objc_claimAutoreleasedReturnValue();

          v12 = (void *)v41;
          v11 = v44;
          if (!v44)
          {
LABEL_12:
            v40 = 0;
            v45 = 0;
            objc_msgSend_target_group_willRunActivity_(self, v26, 0, 0, v14);
            goto LABEL_24;
          }
        }
        if (v10
          && (objc_msgSend_groupID(v10, v26, v27, v28),
              v29 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend_groupID(v14, v30, v31, v32),
              v33 = (void *)objc_claimAutoreleasedReturnValue(),
              v36 = objc_msgSend_isEqualToNumber_(v29, v34, (uint64_t)v33, v35),
              v33,
              v29,
              v36))
        {
          v40 = v10;
        }
        else
        {
          objc_msgSend_groupID(v14, v26, v27, v28);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = 0;
          objc_msgSend_tableGroupInDatabase_withID_error_(CKSQLiteTableGroup, v47, (uint64_t)v11, (uint64_t)v46, &v91);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v91;

          if (v49)
          {
            if (ck_log_initialization_predicate != -1)
              dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
            v50 = ck_log_facility_sql;
            if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v97 = v49;
              _os_log_error_impl(&dword_18A5C5000, v50, OS_LOG_TYPE_ERROR, "Failed to fetch group for activity: %{public}@", buf, 0xCu);
            }
          }
          v40 = v48;

          if (!v40)
          {
            v45 = 0;
            v10 = 0;
            objc_msgSend_target_group_willRunActivity_(self, v37, 0, 0, v14);
            goto LABEL_24;
          }
        }
        objc_msgSend_tableName(v14, v37, v38, v39);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (v53)
        {
          objc_msgSend_tableWithName_(v40, v51, (uint64_t)v53, v52);
          v54 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v54 = v40;
        }
        v45 = v54;

        v10 = v40;
        objc_msgSend_target_group_willRunActivity_(self, v55, (uint64_t)v45, (uint64_t)v40, v14);
LABEL_24:
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v45)
        {
          v90 = v11;
          v59 = v15;
          v60 = self;
          v61 = v10;
          objc_msgSend_targetDescription(v9, v56, v57, v58);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = v12;
          if (ck_log_initialization_predicate != -1)
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          v64 = ck_log_facility_sql;
          if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            v97 = v62;
            _os_log_debug_impl(&dword_18A5C5000, v64, OS_LOG_TYPE_DEBUG, "Running database activity on %{public}@", buf, 0xCu);
          }
          objc_msgSend_activityTriggered_(v45, v65, (uint64_t)v87, v66);

          v12 = v63;
          v10 = v61;
          self = v60;
          v15 = v59;
          v11 = v90;
          objc_msgSend_target_group_didRunActivity_(self, v67, (uint64_t)v45, (uint64_t)v40, v9);
        }
        else
        {
          if (ck_log_initialization_predicate != -1)
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          v68 = ck_log_facility_sql;
          if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543874;
            v97 = v9;
            v98 = 2114;
            v99 = v11;
            v100 = 2114;
            v101 = v40;
            _os_log_debug_impl(&dword_18A5C5000, v68, OS_LOG_TYPE_DEBUG, "Skipped database activity %{public}@ with no target. (db = %{public}@, group = %{public}@)", buf, 0x20u);
          }
          objc_msgSend_target_group_didRunActivity_(self, v69, 0, (uint64_t)v40, v9);
        }

        objc_autoreleasePoolPop(v15);
        ++v13;
      }
      while (v89 != v13);
      v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v70, (uint64_t)&v92, (uint64_t)v102, 16);
      if (!v89)
      {

        v5 = v85;
        goto LABEL_39;
      }
    }
  }
  v10 = 0;
  v11 = 0;
  v12 = &unk_1E1FC4BE0;
LABEL_39:

  objc_msgSend_earliestActivityDate(self, v71, v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E0C99D68], v75, v76, v77, 1.0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_laterDate_(v74, v79, (uint64_t)v78, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_scheduleActivityDate_(self, v82, (uint64_t)v81, v83);
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v84 = ck_log_facility_sql;
  if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18A5C5000, v84, OS_LOG_TYPE_DEBUG, "CKSQLiteDatabaseManager finished running activities", buf, 2u);
  }

  objc_autoreleasePoolPop(v5);
}

- (id)nextActivityDate
{
  return (id)((uint64_t (*)(CKSQLiteDatabaseManagerTimer *, char *))MEMORY[0x1E0DE7D20])(self->_timer, sel_nextActivityDate);
}

- (id)nextActivityDateForTarget:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  CKSQLiteDatabaseManagerTimer *timer;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v16;
  const char *v17;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  SEL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  if (!byte_1EDF75458)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, (uint64_t)self, CFSTR("CKSQLiteDatabaseManager.m"), 764, CFSTR("Only for unit tests"));

  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_18A7A411C;
  v26 = sub_18A7A412C;
  timer = self->_timer;
  v27 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_18A7A6528;
  v18[3] = &unk_1E1F65418;
  v18[4] = self;
  v10 = v8;
  v11 = v10;
  v20 = &v22;
  v21 = a2;
  v19 = v10;
  if (timer)
  {
    dispatch_sync((dispatch_queue_t)timer->_activityQueue, v18);
    v12 = v19;
    v13 = (void *)v23[5];
  }
  else
  {
    v13 = 0;
    v12 = v10;
  }
  v14 = v13;

  _Block_object_dispose(&v22, 8);
  return v14;
}

- (void)waitForTargetActivityComplete:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  const char *v27;
  int v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!byte_1EDF75458)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6, v7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v27, (uint64_t)a2, (uint64_t)self, CFSTR("CKSQLiteDatabaseManager.m"), 778, CFSTR("Only for unit tests"));

  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v9 = (void *)ck_log_facility_sql;
  if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_DEBUG))
  {
    v20 = v9;
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138412290;
    v29 = v22;
    _os_log_debug_impl(&dword_18A5C5000, v20, OS_LOG_TYPE_DEBUG, "%@ started waiting for complete", (uint8_t *)&v28, 0xCu);

  }
  objc_msgSend_nextActivityDateForTarget_(self, v10, (uint64_t)v8, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v15 = (void *)v12;
    do
    {
      objc_msgSend_sleepUntilDate_(MEMORY[0x1E0CB3978], v13, (uint64_t)v15, v14);
      objc_msgSend_nextActivityDateForTarget_(self, v16, (uint64_t)v8, v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v18;
    }
    while (v18);
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v19 = (void *)ck_log_facility_sql;
  if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_DEBUG))
  {
    v23 = v19;
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138412290;
    v29 = v25;
    _os_log_debug_impl(&dword_18A5C5000, v23, OS_LOG_TYPE_DEBUG, "%@ finished waiting for complete", (uint8_t *)&v28, 0xCu);

  }
}

- (void)waitForComplete
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  void *v29;
  void *v31;
  const char *v32;
  int v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!byte_1EDF75458)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2, v3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v31, v32, (uint64_t)a2, (uint64_t)self, CFSTR("CKSQLiteDatabaseManager.m"), 791, CFSTR("Only for unit tests"));

  }
  objc_msgSend_date(MEMORY[0x1E0C99D68], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v6 = (void *)ck_log_facility_sql;
  if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_DEBUG))
  {
    v19 = v6;
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138412290;
    v34 = v21;
    _os_log_debug_impl(&dword_18A5C5000, v19, OS_LOG_TYPE_DEBUG, "%@ started waiting for complete", (uint8_t *)&v33, 0xCu);

  }
  objc_msgSend_earliestActivityDate(self, v7, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v13 = (void *)v10;
    do
    {
      objc_msgSend_sleepUntilDate_(MEMORY[0x1E0CB3978], v11, (uint64_t)v13, v12);
      objc_msgSend_earliestActivityDate(self, v14, v15, v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v17;
    }
    while (v17);
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v18 = (void *)ck_log_facility_sql;
  if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_DEBUG))
  {
    v22 = v18;
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceNow(v5, v25, v26, v27);
    CKDescriptionForTimeInterval(-v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138412546;
    v34 = v24;
    v35 = 2114;
    v36 = v29;
    _os_log_debug_impl(&dword_18A5C5000, v22, OS_LOG_TYPE_DEBUG, "%@ finished waiting for complete (%{public}@)", (uint8_t *)&v33, 0x16u);

  }
}

- (void)flush
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  CKSQLiteDatabaseManagerTimer *timer;
  void *v17;
  CKSQLiteDatabaseActivities *activities;
  char hasPendingActivities;
  id v20;
  void *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  id v32;
  _QWORD block[5];
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!byte_1EDF75458)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2, v3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v29, (uint64_t)a2, (uint64_t)self, CFSTR("CKSQLiteDatabaseManager.m"), 805, CFSTR("Only for unit tests"));

  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v6 = (void *)ck_log_facility_sql;
  if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_DEBUG))
  {
    v22 = v6;
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v35 = v24;
    _os_log_debug_impl(&dword_18A5C5000, v22, OS_LOG_TYPE_DEBUG, "%@ started flush", buf, 0xCu);

  }
  v10 = 0;
  v11 = MEMORY[0x1E0C809B0];
  do
  {
    objc_msgSend_earliestActivityDate(self, v7, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      do
      {
        timer = self->_timer;
        block[0] = v11;
        block[1] = 3221225472;
        block[2] = sub_18A7A6E04;
        block[3] = &unk_1E1F5FAA8;
        block[4] = self;
        if (timer)
          dispatch_sync((dispatch_queue_t)timer->_activityQueue, block);
        objc_msgSend_earliestActivityDate(self, v13, v14, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      while (v17);
    }
    activities = self->_activities;
    v32 = v10;
    hasPendingActivities = objc_msgSend_hasPendingActivities_(activities, v13, (uint64_t)&v32, v15);
    v20 = v32;

    v10 = v20;
  }
  while ((hasPendingActivities & 1) != 0);
  if (v20)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v31, (uint64_t)a2, (uint64_t)self, CFSTR("CKSQLiteDatabaseManager.m"), 819, CFSTR("Error waiting for complete"), v20);

  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v21 = (void *)ck_log_facility_sql;
  if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_DEBUG))
  {
    v25 = v21;
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v35 = v27;
    _os_log_debug_impl(&dword_18A5C5000, v25, OS_LOG_TYPE_DEBUG, "%@ finished flush", buf, 0xCu);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_registry, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
