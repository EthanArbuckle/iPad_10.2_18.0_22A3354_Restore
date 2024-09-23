@implementation HDDatabaseMigrationTransaction

- (HDDatabaseMigrationTransaction)initWithUnprotectedDatabase:(id)a3 protectedDatabase:(id)a4 schemaProviders:(id)a5 behavior:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HDDatabaseMigrationTransaction *v15;
  HDDatabaseMigrationTransaction *v16;
  uint64_t v17;
  NSArray *schemaProviders;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HDDatabaseMigrationTransaction;
  v15 = -[HDDatabaseMigrationTransaction init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_unprotectedDatabase, a3);
    objc_storeStrong((id *)&v16->_protectedDatabase, a4);
    v17 = objc_msgSend(v13, "copy");
    schemaProviders = v16->_schemaProviders;
    v16->_schemaProviders = (NSArray *)v17;

    objc_storeStrong((id *)&v16->_behavior, a6);
  }

  return v16;
}

- (BOOL)isProtectedMigration
{
  return self->_protectedDatabase != 0;
}

- (HDSQLiteDatabase)defaultDatabase
{
  HDSQLiteDatabase *protectedDatabase;

  protectedDatabase = self->_protectedDatabase;
  if (!protectedDatabase)
    protectedDatabase = self->_unprotectedDatabase;
  return protectedDatabase;
}

- (int64_t)accessHistoricHFDWithError:(id *)a3 block:(id)a4
{
  uint64_t (**v7)(id, void *, id *);
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  HDHFDataStore *v12;
  void *v13;
  HDHFDataStore *v14;
  int64_t v15;
  void *v17;

  v7 = (uint64_t (**)(id, void *, id *))a4;
  if (!-[HDDatabaseMigrationTransaction isProtectedMigration](self, "isProtectedMigration"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabaseMigrationTransaction.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self isProtectedMigration]"));

  }
  v8 = (void *)MEMORY[0x1E0D29850];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "profileDirectoryPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "highFrequencyDatabaseURLWithProfileDirectoryPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [HDHFDataStore alloc];
  objc_msgSend(v11, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HDHFDataStore initWithPath:](v12, "initWithPath:", v13);

  v15 = v7[2](v7, v14, a3);
  -[HDHFDataStore flushForInvalidation:](v14, "flushForInvalidation:", 1);

  return v15;
}

- (int64_t)defaultProtectionClass
{
  if (-[HDDatabaseMigrationTransaction isProtectedMigration](self, "isProtectedMigration"))
    return 2;
  else
    return 1;
}

+ (id)unprotectedMigrationTransactionForMigrationTransaction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v4 = a3;
  if ((objc_msgSend(v4, "isProtectedMigration") & 1) != 0)
  {
    v5 = objc_alloc((Class)a1);
    objc_msgSend(v4, "unprotectedDatabase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "schemaProviders");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "behavior");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v5, "initWithUnprotectedDatabase:protectedDatabase:schemaProviders:behavior:", v6, 0, v7, v8);

    objc_msgSend(v4, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", v10);

  }
  else
  {
    v9 = v4;
  }

  return v9;
}

- (int64_t)HFDRebuildState
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  int64_t v6;

  v2 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "profileIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDDatabaseUserDefaultsKeyForProfileIdentifier(CFSTR("HKHFDRebuildStage"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = objc_msgSend(v2, "integerForKey:", v5);

  return v6;
}

- (void)setHFDRebuildState:(int64_t)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  id v7;

  v4 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "profileIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDDatabaseUserDefaultsKeyForProfileIdentifier(CFSTR("HKHFDRebuildStage"), v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "setInteger:forKey:", a3, v7);

}

- (HDSQLiteDatabase)unprotectedDatabase
{
  return self->_unprotectedDatabase;
}

- (HDSQLiteDatabase)protectedDatabase
{
  return self->_protectedDatabase;
}

- (_HKBehavior)behavior
{
  return self->_behavior;
}

- (NSArray)schemaProviders
{
  return self->_schemaProviders;
}

- (HDDatabaseMigrationTransactionDelegate)delegate
{
  return (HDDatabaseMigrationTransactionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_schemaProviders, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_protectedDatabase, 0);
  objc_storeStrong((id *)&self->_unprotectedDatabase, 0);
}

- (int64_t)migrateOrCreateSchemaWithError:(id *)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v12;

  -[HDDatabaseMigrationTransaction delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDatabaseMigrationTransaction behavior](self, "behavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "migrationTransaction:entityClassesWithBehavior:", self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDDatabaseMigrationTransaction unprotectedMigrationTransactionForMigrationTransaction:](HDDatabaseMigrationTransaction, "unprotectedMigrationTransactionForMigrationTransaction:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HDDatabaseMigrationTransaction _migrateOrCreateSchemaWithEntityClasses:error:](v9, v8, a3);
  if (!v10)
  {
    if (!-[HDDatabaseMigrationTransaction isProtectedMigration](self, "isProtectedMigration"))
    {
      v10 = 0;
      goto LABEL_6;
    }
    v10 = -[HDDatabaseMigrationTransaction _migrateOrCreateSchemaWithEntityClasses:error:](self, v8, a3);
  }
  if (v10 == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabase+Schema.m"), 156, CFSTR("Incorrectly returned in-progress migration status."));

  }
LABEL_6:

  return v10;
}

- (uint64_t)_migrateOrCreateSchemaWithEntityClasses:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  HDDatabaseMigrator *v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  void *v19;
  void *v20;
  const char *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  void *v39;
  id v40;
  HDDatabaseMigrator *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  HDDatabaseMigrator *v51;
  void *v52;
  id v53;
  HDDatabaseMigrator *v54;
  int v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  id v59;
  int v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  id v65;
  NSObject *v66;
  uint64_t v67;
  id v68;
  void *v69;
  void *v70;
  BOOL v71;
  NSObject *v72;
  uint64_t v73;
  NSObject *v74;
  NSObject *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t k;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  void *v88;
  _QWORD *v89;
  int v90;
  void *v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  int v95;
  os_log_t *v96;
  NSObject *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  BOOL v104;
  id v105;
  NSObject *v106;
  NSObject *v107;
  void *v108;
  BOOL v109;
  id v110;
  id v111;
  os_log_t *v112;
  id v113;
  void *v114;
  void *v115;
  NSObject *v116;
  NSObject *v117;
  NSObject *v118;
  const char *v119;
  void *v120;
  char v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  NSObject *v126;
  void *v127;
  void *v128;
  id v129;
  NSObject *v130;
  void *v131;
  id v133;
  id obj;
  uint64_t v135;
  id v136;
  void *v137;
  void *v138;
  int v139;
  void *v140;
  id v141;
  id v142;
  void *v143;
  void *v144;
  _BOOL4 v145;
  _BOOL4 v146;
  uint64_t v147;
  void *v148;
  void *v149;
  uint64_t v150;
  HDDatabaseMigrator *v151;
  HDDatabaseMigrator *v152;
  _QWORD *v153;
  id v154;
  id v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  id v160;
  _BYTE v161[12];
  __int16 v162;
  id v163;
  _BYTE buf[126];
  uint8_t v165[32];
  __int128 v166;
  __int128 v167;
  uint8_t v168[32];
  __int128 v169;
  __int128 v170;
  uint64_t v171;

  v171 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
  {
    v67 = 0;
    goto LABEL_179;
  }
  objc_msgSend(a1, "defaultDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userVersionWithDatabaseName:error:", 0, a3);
  if (v7 < 0)
    goto LABEL_177;
  v153 = a3;
  if (!v7)
  {
    -[HDDatabaseMigrationTransaction _enableIncrementalAutovacuumIfNeeded](a1);
    v59 = v5;
    v60 = objc_msgSend(a1, "isProtectedMigration");
    objc_msgSend(a1, "defaultDatabase");
    v61 = a1;
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v61, "defaultProtectionClass");
    if (v60)
    {
      v149 = v61;
      if (!objc_msgSend(v62, "isWriter"))
      {
        v67 = 4;
        goto LABEL_116;
      }
      objc_msgSend(v61, "unprotectedDatabase");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v156 = 0;
      +[HDKeyValueEntity retrieveDatabaseIdentifierFromDatabase:error:](HDUnprotectedKeyValueEntity, "retrieveDatabaseIdentifierFromDatabase:error:", v64, &v156);
      a3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v65 = (id)v156;

      if (a3)
      {
        _HKInitializeLogging();
        v66 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v161 = 138543362;
          *(_QWORD *)&v161[4] = a3;
          _os_log_error_impl(&dword_1B7802000, v66, OS_LOG_TYPE_ERROR, "Fatal: Found identifier %{public}@ in unprotected database when creating protected database", v161, 0xCu);
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", v153, 100, CFSTR("Found identifier %@ in unprotected database when creating protected database"), a3);
        v67 = 2;
        goto LABEL_134;
      }
      a3 = v153;
      v61 = v149;
      if (v65)
      {
        if (v153)
        {
          v65 = objc_retainAutorelease(v65);
          a3 = 0;
          *v153 = v65;
        }
        else
        {
          _HKLogDroppedError();
        }
        v67 = 1;
        goto LABEL_134;
      }
    }
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __81__HDDatabaseMigrationTransaction_Schema___createEntitiesWithEntityClasses_error___block_invoke;
    *(_QWORD *)&buf[24] = &__block_descriptor_40_e8_B16__0_8l;
    *(_QWORD *)&buf[32] = v63;
    objc_msgSend(v59, "hk_filter:", buf);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = a3;
    v90 = -[HDDatabaseMigrationTransaction _createDataTablesInDatabase:entityClasses:requiredPrefix:error:]((uint64_t)v61, v62, v88, 0);

    if (v90)
    {
      v149 = v61;
      objc_msgSend(v61, "behavior");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = objc_msgSend(v91, "futureMigrationsEnabled");
      v93 = 100002;
      if (v63 == 2)
        v93 = 100017;
      if (v92)
        v94 = v93;
      else
        v94 = 18006;

      v95 = objc_msgSend(v62, "setUserVersion:withDatabaseName:error:", v94, 0, v89);
      if (v95)
        v67 = 0;
      else
        v67 = 2;
      if ((v95 & v60) != 1)
      {
        a3 = v89;
        goto LABEL_175;
      }
      v144 = v6;
      +[HDKeyValueEntity generateNewDatabaseIdentifier](HDKeyValueEntity, "generateNewDatabaseIdentifier");
      v65 = (id)objc_claimAutoreleasedReturnValue();
      _HKInitializeLogging();
      v96 = (os_log_t *)MEMORY[0x1E0CB52B0];
      v97 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v161 = 138543362;
        *(_QWORD *)&v161[4] = v65;
        _os_log_impl(&dword_1B7802000, v97, OS_LOG_TYPE_DEFAULT, "Inserting identifier %{public}@ in unprotected db", v161, 0xCu);
      }
      +[HDSyncIdentity legacySyncIdentity](HDSyncIdentity, "legacySyncIdentity");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "unprotectedDatabase");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDSyncIdentityEntity insertOrLookupConcreteIdentityForIdentity:database:error:](HDSyncIdentityEntity, "insertOrLookupConcreteIdentityForIdentity:database:error:", v98, v99, v153);
      v100 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v100)
      {
        v113 = 0;
        v6 = v144;
        a3 = v153;
LABEL_173:

        v67 = 2;
        goto LABEL_174;
      }
      v141 = v5;
      objc_msgSend(v100, "entity");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = objc_msgSend(v101, "persistentID");

      objc_msgSend(v61, "unprotectedDatabase");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)v168 = 0;
      v104 = +[HDKeyValueEntity persistDatabaseIdentifier:syncIdentity:database:error:](HDUnprotectedKeyValueEntity, "persistDatabaseIdentifier:syncIdentity:database:error:", v65, v102, v103, v168);
      v105 = *(id *)v168;

      _HKInitializeLogging();
      v106 = *v96;
      v107 = *v96;
      if (v104)
      {
        if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v161 = 138543362;
          *(_QWORD *)&v161[4] = v65;
          _os_log_impl(&dword_1B7802000, v106, OS_LOG_TYPE_DEFAULT, "Inserting identifier %{public}@ in protected db", v161, 0xCu);
        }
        objc_msgSend(v149, "protectedDatabase");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)v165 = v105;
        v109 = +[HDKeyValueEntity persistDatabaseIdentifier:syncIdentity:database:error:](HDProtectedKeyValueEntity, "persistDatabaseIdentifier:syncIdentity:database:error:", v65, v102, v108, v165);
        v110 = *(id *)v165;

        if (v109)
        {

          objc_msgSend(v149, "delegate");
          a3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a3, "migrationTransaction:didCreateDatabasesWithIdentifier:", v149, v65);
          v67 = 0;
          v5 = v141;
          v6 = v144;
LABEL_134:

          a3 = v153;
LABEL_174:

LABEL_175:
          if (v67)
            goto LABEL_178;
          v7 = objc_msgSend(v6, "userVersionWithDatabaseName:error:", 0, a3);
          a1 = v149;
          if ((v7 & 0x8000000000000000) == 0)
            goto LABEL_4;
LABEL_177:
          v67 = 1;
          goto LABEL_178;
        }
        _HKInitializeLogging();
        v116 = *v96;
        v5 = v141;
        if (os_log_type_enabled(*v96, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v161 = 138543618;
          *(_QWORD *)&v161[4] = v65;
          v162 = 2114;
          v163 = v110;
          _os_log_error_impl(&dword_1B7802000, v116, OS_LOG_TYPE_ERROR, "Failed inserting protected identifier %{public}@: %{public}@", v161, 0x16u);
        }
        v113 = v110;
        v6 = v144;
        if (!v113)
        {
          a3 = v153;
          goto LABEL_172;
        }
        a3 = v153;
        if (!v153)
          goto LABEL_139;
      }
      else
      {
        if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v161 = 138543618;
          *(_QWORD *)&v161[4] = v65;
          v162 = 2114;
          v163 = v105;
          _os_log_error_impl(&dword_1B7802000, v106, OS_LOG_TYPE_ERROR, "Failed inserting unprotected identifier %{public}@: %{public}@", v161, 0x16u);
        }
        v113 = v105;
        v5 = v141;
        v6 = v144;
        a3 = v153;
        if (!v113)
          goto LABEL_172;
        if (!v153)
        {
LABEL_139:
          _HKLogDroppedError();
          goto LABEL_172;
        }
      }
      v113 = objc_retainAutorelease(v113);
      *a3 = v113;
LABEL_172:

      goto LABEL_173;
    }
    v67 = 2;
LABEL_116:

    goto LABEL_178;
  }
LABEL_4:
  v150 = v7;
  v8 = v5;
  v9 = objc_msgSend(a1, "isProtectedMigration");
  objc_msgSend(a1, "defaultDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(a1, "defaultProtectionClass");
  objc_msgSend(a1, "behavior");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "futureMigrationsEnabled");
  v14 = 100002;
  if (v11 == 2)
    v14 = 100017;
  if (!v13)
    v14 = 18006;
  v147 = v14;

  v15 = -[HDDatabaseMigrator initWithTransaction:]([HDDatabaseMigrator alloc], "initWithTransaction:", a1);
  objc_msgSend(a1, "schemaProviders");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = 0;
  v151 = v15;
  v17 = -[HDDatabaseMigrationTransaction _migrationRequiredForProtectionClass:migrator:schemaProviders:error:](v11, v15, v16, &v160);
  v18 = v160;

  if (!v17)
  {
    v18 = v18;
    v5 = v8;
    if (v18)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v18);
      else
        _HKLogDroppedError();
    }
    v67 = v18 != 0;

    goto LABEL_151;
  }
  if (v9 && !objc_msgSend(v10, "isWriter"))
  {
    v67 = 4;
    v5 = v8;
    goto LABEL_151;
  }
  v139 = v9;
  v138 = v10;
  v143 = v6;
  if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBool:forKey:", 0, CFSTR("HDHasPresentedRollbackWarningDialog"));

  }
  v140 = v8;
  v142 = v18;
  v145 = v17;
  _HKInitializeLogging();
  v20 = (void *)*MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
  {
    if (v9)
      v21 = "protected";
    else
      v21 = "unprotected";
    v22 = (void *)MEMORY[0x1E0CB6F18];
    v23 = v20;
    objc_msgSend(v22, "currentOSBuild");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = v21;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v150;
    *(_WORD *)&buf[22] = 2048;
    *(_QWORD *)&buf[24] = v147;
    *(_WORD *)&buf[32] = 2114;
    *(_QWORD *)&buf[34] = v24;
    _os_log_impl(&dword_1B7802000, v23, OS_LOG_TYPE_DEFAULT, "Will migrate %s database from version %ld to %ld (build version %{public}@)", buf, 0x2Au);

  }
  v158 = 0u;
  v159 = 0u;
  v156 = 0u;
  v157 = 0u;
  v148 = a1;
  objc_msgSend(a1, "schemaProviders");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v156, v161, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v157;
    if (v9)
      v29 = "protected";
    else
      v29 = "unprotected";
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v157 != v28)
          objc_enumerationMutation(v25);
        v31 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * i);
        -[HDDatabaseMigrator schemaManager](v151, "schemaManager");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "schemaName");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v32, "currentVersionForSchema:protectionClass:error:", v33, v11, v153);

        if (v34 < 0)
        {

          v67 = 1;
          v5 = v140;
          v6 = v143;
          a3 = v153;
          a1 = v148;
LABEL_130:
          v17 = v145;
          v10 = v138;
          v18 = v142;
          goto LABEL_151;
        }
        v35 = objc_msgSend(v31, "currentSchemaVersionForProtectionClass:", v11);
        if (v34 != v35)
        {
          v36 = v35;
          _HKInitializeLogging();
          v37 = (void *)*MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
          {
            v38 = v37;
            objc_msgSend(v31, "schemaName");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = v29;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v39;
            *(_WORD *)&buf[22] = 2048;
            *(_QWORD *)&buf[24] = v34;
            *(_WORD *)&buf[32] = 2048;
            *(_QWORD *)&buf[34] = v36;
            _os_log_impl(&dword_1B7802000, v38, OS_LOG_TYPE_DEFAULT, "Will migrate %s database schema '%{public}@' from version %ld to %ld", buf, 0x2Au);

          }
        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v156, v161, 16);
    }
    while (v27);
  }

  -[HDDatabaseMigrator addPrimaryMigrationSteps](v151, "addPrimaryMigrationSteps");
  a1 = v148;
  objc_msgSend(v148, "schemaProviders");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  v41 = v151;
  v152 = v41;
  if (!objc_msgSend(v40, "count"))
  {

    a3 = v153;
    goto LABEL_66;
  }
  v136 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  memset(v165, 0, sizeof(v165));
  v166 = 0u;
  v167 = 0u;
  obj = v40;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", v165, buf, 16);
  a3 = v153;
  if (!v42)
    goto LABEL_50;
  v43 = v42;
  v135 = **(_QWORD **)&v165[16];
  v133 = v40;
  while (2)
  {
    for (j = 0; j != v43; ++j)
    {
      if (**(_QWORD **)&v165[16] != v135)
        objc_enumerationMutation(obj);
      v45 = *(void **)(*(_QWORD *)&v165[8] + 8 * j);
      objc_msgSend(v45, "schemaName");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v46)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 3, CFSTR("Plugin '%@' provided no schema name."), v45);
LABEL_129:

        v67 = 1;
        v5 = v140;
        v6 = v143;
        goto LABEL_130;
      }
      objc_msgSend(v136, "objectForKeyedSubscript:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (v47)
      {
        v114 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v136, "objectForKeyedSubscript:", v46);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "hk_assignError:code:format:", a3, 3, CFSTR("Schema '%@' provided by both %@ and %@."), v46, v45, v115);

        v41 = v152;
        goto LABEL_129;
      }
      -[HDDatabaseMigrator schemaManager](v41, "schemaManager");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "currentVersionForSchema:protectionClass:error:", v46, v11, a3);

      if (v49 < 0)
        goto LABEL_129;
      if (v49)
      {
        objc_msgSend(v45, "registerMigrationStepsForProtectionClass:migrator:", v11, v41);
      }
      else
      {
        v50 = v45;
        v51 = v41;
        if ((objc_msgSend(v148, "isProtectedMigration") & 1) != 0)
          objc_msgSend(v148, "protectedDatabase");
        else
          objc_msgSend(v148, "unprotectedDatabase");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)v168 = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v168[8] = 3221225472;
        *(_QWORD *)&v168[16] = __106__HDDatabaseMigrationTransaction_Schema___createEntitiesForSchemaProvider_protectionClass_migrator_error___block_invoke;
        *(_QWORD *)&v168[24] = &unk_1E6CF2340;
        v53 = v50;
        *((_QWORD *)&v170 + 1) = v11;
        *(_QWORD *)&v169 = v53;
        *((_QWORD *)&v169 + 1) = v148;
        v54 = v51;
        *(_QWORD *)&v170 = v54;
        v55 = objc_msgSend(v52, "performTransactionWithType:error:usingBlock:", 1, v153, v168);

        a3 = v153;
        v41 = v152;
        if (!v55)
          goto LABEL_129;
        _HKInitializeLogging();
        v56 = (void *)*MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
        {
          v57 = v56;
          v58 = objc_msgSend(v53, "currentSchemaVersionForProtectionClass:", v11);
          *(_DWORD *)v168 = 138543618;
          *(_QWORD *)&v168[4] = v46;
          *(_WORD *)&v168[12] = 2048;
          *(_QWORD *)&v168[14] = v58;
          _os_log_impl(&dword_1B7802000, v57, OS_LOG_TYPE_DEFAULT, "Created entities for '%{public}@' at version %ld", v168, 0x16u);

        }
      }

    }
    v40 = v133;
    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", v165, buf, 16);
    if (v43)
      continue;
    break;
  }
LABEL_50:

LABEL_66:
  v68 = 0;
  v67 = 3;
  v6 = v143;
  v17 = v145;
LABEL_67:
  v69 = v68;
  v18 = v142;
  while (v67 == 3)
  {
    v155 = v69;
    v67 = -[HDDatabaseMigrator migrateFromVersion:toVersion:error:](v152, "migrateFromVersion:toVersion:error:", v150, v147, &v155);
    v68 = v155;

    v69 = v68;
    if (!v67)
    {

      objc_msgSend(v148, "schemaProviders");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v154 = 0;
      v71 = -[HDDatabaseMigrationTransaction _migrationRequiredForProtectionClass:migrator:schemaProviders:error:](v11, v152, v70, &v154);
      v142 = v154;

      v67 = 0;
      if (!v71 && v142)
      {
        _HKInitializeLogging();
        v72 = *MEMORY[0x1E0CB52B0];
        v67 = 1;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1B7802000, v72, OS_LOG_TYPE_ERROR, "Migration step indicated success but failed to increment the user version. This will be reported as a failure.", buf, 2u);
          v67 = 1;
        }
      }
      goto LABEL_67;
    }
  }
  v137 = v69;
  if (v67)
  {
    v111 = v69;
    v5 = v140;
    v112 = (os_log_t *)MEMORY[0x1E0CB52B0];
    if (v111)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v111);
      else
        _HKLogDroppedError();
    }

    _HKInitializeLogging();
    v117 = *v112;
    if (os_log_type_enabled(*v112, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v67;
      *(_WORD *)&buf[8] = 2048;
      *(_QWORD *)&buf[10] = v150;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = v147;
      *(_WORD *)&buf[28] = 2114;
      *(_QWORD *)&buf[30] = v111;
      _os_log_error_impl(&dword_1B7802000, v117, OS_LOG_TYPE_ERROR, "Migrator returned %d for migration from %ld to %ld: %{public}@", buf, 0x26u);
    }
    _HKInitializeLogging();
    v118 = *v112;
    if (os_log_type_enabled(*v112, OS_LOG_TYPE_INFO))
    {
      v119 = "unprotected";
      if (v139)
        v119 = "protected";
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v119;
      _os_log_impl(&dword_1B7802000, v118, OS_LOG_TYPE_INFO, "Finished %s database migration with success=NO", buf, 0xCu);
    }
    a3 = v153;
  }
  else
  {
    v73 = objc_msgSend(v138, "userVersionWithDatabaseName:error:", 0, a3);
    _HKInitializeLogging();
    v74 = *MEMORY[0x1E0CB52B0];
    v5 = v140;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v73;
      _os_log_impl(&dword_1B7802000, v74, OS_LOG_TYPE_DEFAULT, "Finished database migration with success=YES, version %ld", buf, 0xCu);
    }
    if (v73 < 0)
    {
      v67 = 1;
    }
    else
    {
      if (v73 != v147)
      {
        _HKInitializeLogging();
        v75 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v147;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v73;
          _os_log_fault_impl(&dword_1B7802000, v75, OS_LOG_TYPE_FAULT, "Database migration returned success but failed to update user version to current version (expected %ld but final version is %ld)", buf, 0x16u);
        }
      }
      v169 = 0u;
      v170 = 0u;
      memset(v168, 0, sizeof(v168));
      objc_msgSend(v148, "schemaProviders");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", v168, buf, 16);
      if (v77)
      {
        v78 = v77;
        v67 = 0;
        v79 = **(_QWORD **)&v168[16];
        do
        {
          for (k = 0; k != v78; ++k)
          {
            if (**(_QWORD **)&v168[16] != v79)
              objc_enumerationMutation(v76);
            v81 = *(void **)(*(_QWORD *)&v168[8] + 8 * k);
            -[HDDatabaseMigrator schemaManager](v152, "schemaManager");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "schemaName");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = objc_msgSend(v82, "currentVersionForSchema:protectionClass:error:", v83, v11, a3);

            if (v84 < 0)
              v67 = 1;
            v85 = objc_msgSend(v81, "currentSchemaVersionForProtectionClass:", v11);
            if (v84 != v85)
            {
              v86 = v85;
              _HKInitializeLogging();
              v87 = *MEMORY[0x1E0CB52B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)v165 = 134218240;
                *(_QWORD *)&v165[4] = v86;
                *(_WORD *)&v165[12] = 2048;
                *(_QWORD *)&v165[14] = v84;
                _os_log_fault_impl(&dword_1B7802000, v87, OS_LOG_TYPE_FAULT, "Database migration returned success but failed to update user version to current version (expected %ld but final version is %ld)", v165, 0x16u);
              }
            }
            a3 = v153;
          }
          v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", v168, buf, 16);
        }
        while (v78);
      }
      else
      {
        v67 = 0;
      }

      v5 = v140;
      v18 = v142;
      v6 = v143;
      a1 = v148;
      v17 = v145;
    }
  }
  v10 = v138;
  -[HDDatabaseMigrator invalidate](v152, "invalidate");

LABEL_151:
  if (!objc_msgSend(a1, "isProtectedMigration") || v67)
  {
LABEL_160:
    if (!v17)
      goto LABEL_178;
    goto LABEL_161;
  }
  objc_msgSend(a1, "protectedDatabase");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = objc_msgSend(v120, "isWriter");

  if ((v121 & 1) == 0)
  {
    v67 = 0;
    goto LABEL_160;
  }
  v122 = a1;
  objc_msgSend(a1, "protectedDatabase");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)v161 = 0;
  +[HDKeyValueEntity retrieveDatabaseIdentifierFromDatabase:error:](HDProtectedKeyValueEntity, "retrieveDatabaseIdentifierFromDatabase:error:", v123, v161);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = *(id *)v161;

  if (!v124 && v125)
  {
    _HKInitializeLogging();
    v126 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v125;
      _os_log_impl(&dword_1B7802000, v126, OS_LOG_TYPE_INFO, "temporary SQL error reading identifiers: %{public}@", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:underlyingError:", a3, 100, CFSTR("Retry: temporary SQL error reading identifiers"), v125);
    v127 = 0;
    v67 = 1;
    goto LABEL_170;
  }
  v146 = v17;
  objc_msgSend(v122, "unprotectedDatabase");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)v168 = v125;
  +[HDKeyValueEntity retrieveDatabaseIdentifierFromDatabase:error:](HDUnprotectedKeyValueEntity, "retrieveDatabaseIdentifierFromDatabase:error:", v128, v168);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = *(id *)v168;

  if (v124 && v127 && (objc_msgSend(v124, "isEqualToData:", v127) & 1) != 0)
  {

    v67 = 0;
    a1 = v122;
    if (!v146)
      goto LABEL_178;
LABEL_161:
    -[HDDatabaseMigrationTransaction _enableIncrementalAutovacuumIfNeeded](a1);
    goto LABEL_178;
  }
  _HKInitializeLogging();
  v130 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v124;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v127;
    _os_log_error_impl(&dword_1B7802000, v130, OS_LOG_TYPE_ERROR, "FATAL: database identifiers do not match (protected: %{public}@, unprotected: %{public}@)", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a3, 100, CFSTR("Fatal: database identifiers did not match"));
  objc_msgSend(v122, "delegate");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "migrationTransaction:didEncounterDatabaseMismatchWithUnprotectedIdentifier:protectedIdentifier:", v122, v127, v124);

  v67 = 2;
  v125 = v129;
LABEL_170:

LABEL_178:
LABEL_179:

  return v67;
}

- (void)_enableIncrementalAutovacuumIfNeeded
{
  void *v1;
  char v2;
  id v3;
  NSObject *v4;
  id v5;
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "defaultDatabase");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v2 = objc_msgSend(v1, "enableIncrementalAutovacuumForDatabaseWithName:error:", 0, &v5);
  v3 = v5;

  if ((v2 & 1) == 0)
  {
    _HKInitializeLogging();
    v4 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v7 = v3;
      _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "Failed to enable autovacuum for database: %{public}@", buf, 0xCu);
    }
  }

}

BOOL __81__HDDatabaseMigrationTransaction_Schema___createEntitiesWithEntityClasses_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "protectionClass") == *(_QWORD *)(a1 + 32);
}

- (uint64_t)_createDataTablesInDatabase:(uint64_t)a1 entityClasses:(void *)a2 requiredPrefix:(void *)a3 error:(void *)a4
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  int v14;
  uint64_t v15;
  id obj;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    obj = v8;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(obj);
          v18 = v9;
          v19 = v7;
          v14 = HKWithAutoreleasePool();

          if (!v14)
          {
            v15 = 0;
            goto LABEL_13;
          }
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v11)
          continue;
        break;
      }
      v15 = 1;
    }
    else
    {
      v15 = 1;
    }
LABEL_13:

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __105__HDDatabaseMigrationTransaction_Schema___createDataTablesInDatabase_entityClasses_requiredPrefix_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "behavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createTableSQLWithBehavior:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 56), "databaseTable");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "hasPrefix:", *(_QWORD *)(a1 + 40));

      if ((v8 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a2, 3, CFSTR("Entity '%@' missing required prefix '%@'"), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
        goto LABEL_26;
      }
    }
    if (!objc_msgSend(*(id *)(a1 + 48), "executeUncachedSQL:error:bindingHandler:enumerationHandler:", v6, a2, 0, 0))
    {
LABEL_26:
      v31 = 0;
      goto LABEL_27;
    }
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v9 = *(void **)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "behavior");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indicesWithBehavior:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v38;
LABEL_7:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v38 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v15);
      if (objc_msgSend(v16, "entityClass") == *(_QWORD *)(a1 + 56))
      {
        objc_msgSend(v16, "creationSQL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(*(id *)(a1 + 48), "executeUncachedSQL:error:bindingHandler:enumerationHandler:", v17, a2, 0, 0);

        if (!v18)
          goto LABEL_24;
      }
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        if (v13)
          goto LABEL_7;
        break;
      }
    }
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v19 = *(void **)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "behavior");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "triggersWithBehavior:", v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v34;
LABEL_16:
    v24 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v23)
        objc_enumerationMutation(v11);
      v25 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v24);
      if (objc_msgSend(v25, "entityClass") == *(_QWORD *)(a1 + 56))
      {
        objc_msgSend(v25, "creationSQL");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(*(id *)(a1 + 48), "executeUncachedSQL:error:", v26, a2);

        if (!v27)
          break;
      }
      if (v22 == ++v24)
      {
        v22 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v22)
          goto LABEL_16;
        goto LABEL_23;
      }
    }
LABEL_24:

    goto LABEL_26;
  }
LABEL_23:

  v28 = *(_QWORD *)(a1 + 32);
  v29 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "privateSubEntities");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[HDDatabaseMigrationTransaction _createDataTablesInDatabase:entityClasses:requiredPrefix:error:](v28, v29, v30, *(_QWORD *)(a1 + 40), a2);

LABEL_27:
  return v31;
}

uint64_t __106__HDDatabaseMigrationTransaction_Schema___createEntitiesForSchemaProvider_protectionClass_migrator_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = a2;
  objc_msgSend(v5, "databaseEntitiesForProtectionClass:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "schemaName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = -[HDDatabaseMigrationTransaction _createDataTablesInDatabase:entityClasses:requiredPrefix:error:](v9, v7, v8, v10);

  if ((_DWORD)v9)
  {
    objc_msgSend(*(id *)(a1 + 48), "schemaManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(*(id *)(a1 + 32), "currentSchemaVersionForProtectionClass:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "schemaName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "setVersion:schema:protectionClass:error:", v12, v13, *(_QWORD *)(a1 + 56), a3);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_presentRollbackAlertForSchema:(void *)a1 protectionClass:(uint64_t)a2 foundVersion:(uint64_t)a3 currentVersion:(uint64_t)a4
{
  __CFString *v7;
  NSObject *v8;
  id v9;
  char v10;
  const char *v11;
  const __CFString *v12;
  _BYTE v13[22];
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  _HKInitializeLogging();
  v8 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
  {
    v11 = "main";
    if (a2 == 2)
      v11 = "protected";
    *(_DWORD *)v13 = 136315906;
    *(_QWORD *)&v13[4] = v11;
    v12 = CFSTR("<primary>");
    *(_WORD *)&v13[12] = 2114;
    if (v7)
      v12 = v7;
    *(_QWORD *)&v13[14] = v12;
    v14 = 2048;
    v15 = a3;
    v16 = 2048;
    v17 = a4;
    _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "Detected attempt to rollback %s database (schema: %{public}@) from a newer build (Found version %ld but current version is %ld); failing migration.",
      v13,
      0x2Au);
  }
  if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall", *(_OWORD *)v13)
    && (_presentRollbackAlertForSchema_protectionClass_foundVersion_currentVersion__isPresenting & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "BOOLForKey:", CFSTR("HDHasPresentedRollbackWarningDialog")) & 1) != 0)
    {
LABEL_7:

      goto LABEL_8;
    }
    v10 = objc_msgSend(MEMORY[0x1E0CB6F18], "isTestingDevice");

    if ((v10 & 1) == 0)
    {
      _presentRollbackAlertForSchema_protectionClass_foundVersion_currentVersion__isPresenting = 1;
      v9 = objc_alloc_init(MEMORY[0x1E0D298D0]);
      objc_msgSend(v9, "setTitle:", CFSTR("Health DB Version Mismatch"));
      objc_msgSend(v9, "setMessage:", CFSTR("Your Health database appears to be from a newer build. Rolling back to earlier builds is not supported, and Health apps will not be functional."));
      objc_msgSend(v9, "setDefaultButton:", CFSTR("OK"));
      objc_msgSend(v9, "presentWithResponseHandler:", &__block_literal_global_62);
      goto LABEL_7;
    }
  }
LABEL_8:

}

void __117__HDDatabaseMigrationTransaction_Schema___presentRollbackAlertForSchema_protectionClass_foundVersion_currentVersion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v4;

  _presentRollbackAlertForSchema_protectionClass_foundVersion_currentVersion__isPresenting = 0;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBool:forKey:", 1, CFSTR("HDHasPresentedRollbackWarningDialog"));

  }
}

- (BOOL)_migrationRequiredForProtectionClass:(uint64_t)a1 migrator:(void *)a2 schemaProviders:(void *)a3 error:(_QWORD *)a4
{
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(v7, "schemaManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "currentVersionForSchema:protectionClass:error:", 0, a1, a4);

  if ((v10 & 0x8000000000000000) != 0)
  {
LABEL_26:
    v16 = 0;
    goto LABEL_27;
  }
  objc_msgSend(v7, "behavior");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "futureMigrationsEnabled");
  v13 = 100002;
  if (a1 == 2)
    v13 = 100017;
  if (v12)
    v14 = v13;
  else
    v14 = 18006;

  if (v10 > v14)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_databaseSchemaRolledBackError");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v15);
      else
        _HKLogDroppedError();
    }

    -[HDDatabaseMigrationTransaction _presentRollbackAlertForSchema:protectionClass:foundVersion:currentVersion:](0, a1, v10, v14);
    goto LABEL_26;
  }
  if (v10 >= v14)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = v8;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v33;
      v30 = v8;
      while (2)
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v33 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v20);
          objc_msgSend(v7, "schemaManager", v30);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "schemaName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "currentVersionForSchema:protectionClass:error:", v23, a1, a4);

          v16 = v24 >= 0;
          if (v24 < 0)
            goto LABEL_33;
          v25 = objc_msgSend(v21, "currentSchemaVersionForProtectionClass:", a1);
          if (v24 > v25)
          {
            v27 = v25;
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_databaseSchemaRolledBackError");
            v28 = (id)objc_claimAutoreleasedReturnValue();
            if (v28)
            {
              if (a4)
                *a4 = objc_retainAutorelease(v28);
              else
                _HKLogDroppedError();
            }

            objc_msgSend(v21, "schemaName");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDDatabaseMigrationTransaction _presentRollbackAlertForSchema:protectionClass:foundVersion:currentVersion:](v29, a1, v24, v27);

            v16 = 0;
LABEL_33:

            v8 = v30;
            goto LABEL_27;
          }
          if (v24 < v25)
            goto LABEL_33;
          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        v8 = v30;
        if (v18)
          continue;
        break;
      }
    }

    goto LABEL_26;
  }
  v16 = 1;
LABEL_27:

  return v16;
}

@end
