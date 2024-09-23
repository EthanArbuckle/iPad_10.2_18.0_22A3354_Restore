@implementation CKSQLiteDatabaseActivities

+ (id)dbProperties
{
  return &unk_1E1FC4D60;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (id)wakeFromDatabase
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  int isFirstInstance;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CKSQLiteDatabaseActivities;
  -[CKSQLiteTable wakeFromDatabase](&v16, sel_wakeFromDatabase);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tableGroup(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isFirstInstance = objc_msgSend_isFirstInstance(v7, v8, v9, v10);

  if (isFirstInstance && !v3)
  {
    objc_msgSend_deleteCompletedActivities(self, v12, v13, v14);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)fetchActivityForTarget:(id)a3
{
  return (id)objc_msgSend_fetchProperties_inObject_matchingDBProperties_label_(self, a2, 0, (uint64_t)a3, &unk_1E1FC4298, off_1E1F65308);
}

- (id)activitiesStartingBeforeDate:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  CKSQLiteDatabaseActivities *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_18A7A411C;
  v19 = sub_18A7A412C;
  v20 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A7A4134;
  v11[3] = &unk_1E1F60688;
  v5 = v4;
  v12 = v5;
  v13 = self;
  v14 = &v15;
  v8 = (id)objc_msgSend_performInTransaction_(self, v6, (uint64_t)v11, v7);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (id)earliestActivityDate
{
  return (id)objc_msgSend_minimumValueOfProperty_label_error_(self, a2, (uint64_t)CFSTR("activityLatestDate"), (uint64_t)off_1E1F65358, 0);
}

- (id)insertOrUpdateActivityDate:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_insertObject_orUpdateProperties_label_, a3, &unk_1E1FC42B0);
}

- (id)deleteCompletedActivities
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  id v9;
  id v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = CFSTR("NOW");
  objc_msgSend_date(MEMORY[0x1E0C99D68], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v6, (uint64_t)v13, (uint64_t)&v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v8, (uint64_t)v7, (uint64_t)off_1E1F65388, &v11, &unk_1E1F653A0);
  v9 = v11;

  return v9;
}

- (id)deleteEntriesForDatabase:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  id v9;
  id v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = CFSTR("DATABASEID");
  v13[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(v4, v6, (uint64_t)v13, (uint64_t)&v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend_deleteEntriesMatching_label_error_predicate_(self, v8, (uint64_t)v7, (uint64_t)off_1E1F653C0, &v11, &unk_1E1F653D8);
  v9 = v11;

  return v9;
}

- (BOOL)hasPendingActivities:(id *)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  char v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18A7A4544;
  v9[3] = &unk_1E1F60490;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend_performInTransaction_(self, a2, (uint64_t)v9, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 && v5)
    *a3 = objc_retainAutorelease(v5);
  v7 = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v7;
}

@end
