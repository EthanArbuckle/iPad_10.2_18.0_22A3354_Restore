@implementation MFMailMessageLibraryMigrator

- (BOOL)migrateWithDatabaseConnection:(id)a3 schema:(id)a4
{
  id v6;
  id v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  BOOL v15;
  void *v16;
  NSObject *v17;
  unint64_t v18;
  __int128 v19;
  void *v20;
  void *v21;
  NSObject *v22;
  int64_t v23;
  __int128 v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  unint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6 && (objc_msgSend(v6, "isValid") & 1) != 0)
  {
    v27 = 0;
    v8 = objc_msgSend(v6, "performWithOptions:transactionError:block:", 6, &v27, &__block_literal_global_42);
    v9 = v27;
    if ((v8 & 1) != 0)
    {
      v10 = _LibraryVersion((sqlite3 *)objc_msgSend(v6, "sqlDB"));
      if ((_DWORD)v10 == 220024)
      {
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v29 = 220024;
          v12 = "Database is already at current version %lld. No migration needed.";
          v13 = v11;
          v14 = 12;
LABEL_26:
          _os_log_impl(&dword_1A4F90000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
          goto LABEL_27;
        }
        goto LABEL_27;
      }
      +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4F90000, v17, OS_LOG_TYPE_DEFAULT, "Starting migration", buf, 2u);
      }

      objc_msgSend(v6, "executeStatementString:errorMessage:", CFSTR("PRAGMA foreign_keys = OFF;"),
        CFSTR("disabling foreign keys"));
      EFRegisterContentProtectionObserver();
      v18 = 0;
      *(_QWORD *)&v19 = 134218240;
      v26 = v19;
      do
      {
        -[MFMailMessageLibraryMigrator migrationState](self, "migrationState", v26);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "lockWhenCondition:", 0);

        -[MFMailMessageLibraryMigrator migrationState](self, "migrationState");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "unlock");

        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v26;
          v29 = (int)v10;
          v30 = 2048;
          v31 = v18;
          _os_log_impl(&dword_1A4F90000, v22, OS_LOG_TYPE_DEFAULT, "Starting migration steps from version %lld, attempt %lu", buf, 0x16u);
        }

        v23 = -[MFMailMessageLibraryMigrator _runMigrationStepsFromVersion:connection:schema:](self, "_runMigrationStepsFromVersion:connection:schema:", v10, v6, v7);
        if (v23 != 1)
          break;
      }
      while (v18++ < 5);
      EFUnregisterContentProtectionObserver();
      objc_msgSend(v6, "executeStatementString:errorMessage:", CFSTR("PRAGMA foreign_keys = ON;"),
        CFSTR("reënable foreign keys"));
      if (!v23)
      {
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v12 = "Finished migration";
          v13 = v11;
          v14 = 2;
          goto LABEL_26;
        }
LABEL_27:
        v15 = 1;
        goto LABEL_28;
      }
      +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[MFMailMessageLibraryMigrator migrateWithDatabaseConnection:schema:].cold.2(v11);
    }
    else
    {
      +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        -[NSObject ef_publicDescription](v9, "ef_publicDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFMailMessageLibraryMigrator migrateWithDatabaseConnection:schema:].cold.3(v16, (uint64_t)buf, v11);
      }
    }
    v15 = 0;
LABEL_28:

    goto LABEL_29;
  }
  +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[MFMailMessageLibraryMigrator migrateWithDatabaseConnection:schema:].cold.1(v9);
  v15 = 0;
LABEL_29:

  return v15;
}

- (MFMailMessageLibraryMigrator)initWithDelegate:(id)a3
{
  id v4;
  MFMailMessageLibraryMigrator *v5;
  MFMailMessageLibraryMigrator *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *contentProtectionQueue;
  uint64_t v10;
  NSConditionLock *migrationState;
  NSMutableArray *v12;
  NSMutableArray *postMigrationBlocks;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MFMailMessageLibraryMigrator;
  v5 = -[MFMailMessageLibraryMigrator init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.message.MFMailMessageLibraryMigrator.contentProtectionQueue", v7);
    contentProtectionQueue = v6->_contentProtectionQueue;
    v6->_contentProtectionQueue = (OS_dispatch_queue *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
    migrationState = v6->_migrationState;
    v6->_migrationState = (NSConditionLock *)v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    postMigrationBlocks = v6->_postMigrationBlocks;
    v6->_postMigrationBlocks = v12;

  }
  return v6;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__MFMailMessageLibraryMigrator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_15 != -1)
    dispatch_once(&log_onceToken_15, block);
  return (OS_os_log *)(id)log_log_15;
}

void __35__MFMailMessageLibraryMigrator_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_15;
  log_log_15 = (uint64_t)v1;

}

BOOL __69__MFMailMessageLibraryMigrator_migrateWithDatabaseConnection_schema___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  sqlite3 *v3;
  int v4;
  int v5;
  _BOOL8 v6;

  v2 = a2;
  v3 = (sqlite3 *)objc_msgSend(v2, "sqlDB");
  v4 = sqlite3_exec_retry(v3, "PRAGMA page_size = 4096;", 0, 0, 0);
  _HandleSQLiteError(v3, CFSTR("setting page_size"));
  if (v4
    || (v5 = sqlite3_exec_retry(v3, "PRAGMA auto_vacuum=2", 0, 0, 0),
        _HandleSQLiteError(v3, CFSTR("setting auto_vacuum")),
        v5))
  {
    v6 = 0;
  }
  else
  {
    v6 = sqlite3_exec_retry(v3, "PRAGMA journal_mode=WAL", 0, 0, 0) == 0;
    _HandleSQLiteError(v3, CFSTR("setting journal mode"));
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationState, 0);
  objc_storeStrong((id *)&self->_contentProtectionQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_postMigrationBlocks, 0);
}

+ (int)currentVersion
{
  return 220024;
}

- (int64_t)_runMigrationStepsFromVersion:(int)a3 connection:(id)a4 schema:(id)a5
{
  id v8;
  id v9;
  id v10;
  int64_t v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  BOOL (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  MFMailMessageLibraryMigrator *v20;
  id v21;
  uint64_t *v22;
  id *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  id location;
  id *p_location;
  uint64_t v30;
  char v31;
  _QWORD v32[4];
  id v33;

  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(v10, "addIndex:", 170010);
  objc_msgSend(v10, "addIndex:", 170054);
  objc_msgSend(v10, "addIndex:", 200006);
  objc_msgSend(v10, "addIndex:", 200009);
  objc_msgSend(v10, "addIndex:", 200010);
  objc_msgSend(v10, "addIndex:", 200011);
  objc_msgSend(v10, "addIndex:", 200012);
  objc_msgSend(v10, "addIndex:", 200019);
  objc_msgSend(v10, "addIndex:", 220004);
  objc_msgSend(v10, "addIndex:", 220005);
  objc_msgSend(v10, "addIndex:", 220008);
  objc_msgSend(v10, "addIndex:", 220019);
  objc_msgSend(v10, "addIndex:", 220020);
  if (a3 && objc_msgSend(v10, "indexGreaterThanOrEqualToIndex:", a3) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = -[MFMailMessageLibraryMigrator attachProtectedDatabaseWithConnection:](self, "attachProtectedDatabaseWithConnection:", v8);
    if (v11)
      goto LABEL_14;
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __80__MFMailMessageLibraryMigrator__runMigrationStepsFromVersion_connection_schema___block_invoke;
    v32[3] = &unk_1E4E8D1F8;
    objc_copyWeak(&v33, &location);
    -[MFMailMessageLibraryMigrator addPostMigrationBlock:](self, "addPostMigrationBlock:", v32);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  location = 0;
  p_location = &location;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __80__MFMailMessageLibraryMigrator__runMigrationStepsFromVersion_connection_schema___block_invoke_2;
  v18 = &unk_1E4E8D260;
  v22 = &v24;
  v23 = &location;
  v19 = v9;
  v20 = self;
  v12 = v8;
  v21 = v12;
  objc_msgSend(v12, "performWithOptions:transactionError:block:", 7, 0, &v15);
  -[MFMailMessageLibraryMigrator runPostMigrationBlocksWithConnection:](self, "runPostMigrationBlocksWithConnection:", v12, v15, v16, v17, v18);
  if (*((_BYTE *)p_location + 24)
    && -[MFMailMessageLibraryMigrator needsSpotlightReindex](self, "needsSpotlightReindex"))
  {
    -[MFMailMessageLibraryMigrator delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mailMessageLibraryMigratorScheduleSpotlightReindex:", self);

  }
  if (*((_BYTE *)p_location + 24))
  {
    v11 = 0;
  }
  else if (objc_msgSend(v10, "containsIndex:", *((int *)v25 + 6)))
  {
    v11 = -[MFMailMessageLibraryMigrator _checkContentProtectionState](self, "_checkContentProtectionState");
  }
  else
  {
    v11 = 2;
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&location, 8);
LABEL_14:

  return v11;
}

void __80__MFMailMessageLibraryMigrator__runMigrationStepsFromVersion_connection_schema___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "detachProtectedDatabaseWithConnection:", v3);

}

BOOL __80__MFMailMessageLibraryMigrator__runMigrationStepsFromVersion_connection_schema___block_invoke_2(uint64_t a1, void *a2)
{
  sqlite3 *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  int v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  int v40;
  NSObject *v41;
  NSObject *v42;
  int v43;
  _BOOL4 v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  int v50;
  id v51;
  _BOOL4 v52;
  sqlite3_stmt *v53;
  int v54;
  void *v55;
  BOOL v56;
  id v57;
  const char *v58;
  char *v59;
  int v60;
  NSObject *v61;
  int v62;
  NSObject *v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  int v68;
  NSObject *v69;
  NSObject *v70;
  NSObject *v71;
  NSObject *v72;
  NSObject *v73;
  NSObject *v74;
  NSObject *v75;
  NSObject *v76;
  NSObject *v77;
  MFMailMessageLibraryMailboxURLMigrationStep *v78;
  NSObject *v79;
  NSObject *v80;
  NSObject *v81;
  NSObject *v82;
  NSObject *v83;
  NSObject *v84;
  NSObject *v85;
  MFMailMessageLibraryLocalActionsTablesMigrationStep *v86;
  BOOL v87;
  NSObject *v88;
  NSObject *v89;
  NSObject *v90;
  MFMailMessageLibraryLocalActionsTablesMigrationStep *v91;
  BOOL v92;
  NSObject *v93;
  NSObject *v94;
  int v95;
  NSObject *v96;
  MFMailMessageLibraryModifyColumnDefinitionsMigrationStep *v97;
  BOOL v98;
  NSObject *v99;
  MFMailMessageLibraryAdoptSharedSchemaMigrationStep *v100;
  BOOL v101;
  NSObject *v102;
  NSObject *v103;
  NSObject *v104;
  NSObject *v105;
  NSObject *v106;
  NSObject *v107;
  NSObject *v108;
  NSObject *v109;
  NSObject *v110;
  NSObject *v111;
  char v112;
  void *v113;
  NSObject *v114;
  NSObject *v115;
  NSObject *v116;
  NSObject *v117;
  NSObject *v118;
  NSObject *v119;
  NSObject *v120;
  NSObject *v121;
  NSObject *v122;
  NSObject *v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  const char *v128;
  NSObject *v129;
  NSObject *v130;
  NSObject *v131;
  NSObject *v132;
  NSObject *v133;
  NSObject *v134;
  NSObject *v135;
  int v136;
  int v137;
  NSObject *v138;
  NSObject *v139;
  NSObject *v140;
  NSObject *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  id v147;
  const char *v148;
  int v149;
  NSObject *v150;
  NSObject *v151;
  NSObject *v152;
  NSObject *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  id v159;
  const char *v160;
  NSObject *v161;
  NSObject *v162;
  NSObject *v163;
  NSObject *v164;
  NSObject *v165;
  NSObject *v166;
  NSObject *v167;
  NSObject *v168;
  NSObject *v169;
  NSObject *v170;
  NSObject *v171;
  NSObject *v172;
  NSObject *v173;
  NSObject *v174;
  NSObject *v175;
  NSObject *v176;
  NSObject *v177;
  NSObject *v178;
  NSObject *v179;
  NSObject *v180;
  NSObject *v181;
  NSObject *v182;
  NSObject *v183;
  NSObject *v184;
  NSObject *v185;
  NSObject *v186;
  NSObject *v187;
  NSObject *v188;
  NSObject *v189;
  NSObject *v190;
  NSObject *v191;
  NSObject *v192;
  NSObject *v193;
  NSObject *v194;
  NSObject *v195;
  void *v196;
  uint64_t v197;
  void *v198;
  NSObject *v199;
  NSObject *v200;
  NSObject *v201;
  NSObject *v202;
  NSObject *v203;
  id v204;
  BOOL v205;
  NSObject *v206;
  NSObject *v207;
  NSObject *v208;
  NSObject *v209;
  NSObject *v210;
  NSObject *v211;
  NSObject *v212;
  id v213;
  BOOL v214;
  NSObject *v215;
  NSObject *v216;
  id v217;
  BOOL v218;
  NSObject *v219;
  void *v220;
  void *v221;
  void *v222;
  MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep *v223;
  BOOL v224;
  NSObject *v225;
  NSObject *v226;
  NSObject *v227;
  NSObject *v228;
  NSObject *v229;
  NSObject *v230;
  NSObject *v231;
  NSObject *v232;
  id v233;
  BOOL v234;
  NSObject *v235;
  NSObject *v236;
  NSObject *v237;
  NSObject *v238;
  NSObject *v239;
  NSObject *v240;
  NSObject *v241;
  NSObject *v242;
  NSObject *v243;
  NSObject *v244;
  NSObject *v245;
  NSObject *v246;
  NSObject *v247;
  NSObject *v248;
  NSObject *v249;
  NSObject *v250;
  NSObject *v251;
  NSObject *v252;
  NSObject *v253;
  NSObject *v254;
  BOOL v255;
  id v256;
  void *v257;
  NSObject *v258;
  NSObject *v259;
  id v260;
  BOOL v261;
  NSObject *v262;
  uint64_t v263;
  char v264;
  id v265;
  BOOL v266;
  NSObject *v267;
  NSObject *v268;
  NSObject *v269;
  void *v270;
  char v271;
  NSObject *v272;
  int v273;
  int v274;
  BOOL v275;
  NSObject *v276;
  _BOOL8 v277;
  NSObject *v279;
  id v280;
  id v281;
  id v282;
  _BYTE buf[24];
  uint64_t v284;

  v284 = *MEMORY[0x1E0C80C00];
  v280 = a2;
  v3 = (sqlite3 *)objc_msgSend(v280, "sqlDB");
  v4 = _LibraryVersion(v3);
  v5 = a1 + 56;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v4;
  +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl(&dword_1A4F90000, v6, OS_LOG_TYPE_DEFAULT, "Starting write transaction at version %lld", buf, 0xCu);
  }

  if (v4 > 179999)
  {
    if (v4 <= 210000)
    {
      if (v4 > 200000)
      {
        switch(v4)
        {
          case 200001:
            goto LABEL_439;
          case 200002:
            goto LABEL_442;
          case 200003:
            goto LABEL_445;
          case 200004:
            goto LABEL_448;
          case 200005:
            goto LABEL_451;
          case 200006:
            goto LABEL_454;
          case 200007:
            goto LABEL_457;
          case 200008:
            goto LABEL_460;
          case 200009:
            goto LABEL_463;
          case 200010:
            goto LABEL_466;
          case 200011:
            goto LABEL_469;
          case 200012:
            goto LABEL_473;
          case 200013:
            goto LABEL_476;
          case 200014:
            goto LABEL_479;
          case 200015:
            goto LABEL_482;
          case 200016:
            goto LABEL_485;
          case 200017:
            goto LABEL_491;
          case 200018:
            goto LABEL_494;
          case 200019:
            goto LABEL_497;
          case 200020:
            goto LABEL_501;
          case 200021:
            goto LABEL_504;
          case 200022:
            goto LABEL_507;
          case 200023:
            goto LABEL_511;
          case 200024:
            goto LABEL_514;
          case 200025:
            goto LABEL_518;
          case 200026:
            goto LABEL_521;
          case 200027:
            goto LABEL_524;
          case 200028:
            goto LABEL_527;
          default:
            goto LABEL_31;
        }
      }
      switch(v4)
      {
        case 180500:
          goto LABEL_389;
        case 180501:
          goto LABEL_392;
        case 180502:
          goto LABEL_395;
        case 180503:
          goto LABEL_398;
        case 180504:
          goto LABEL_402;
        case 180505:
          goto LABEL_405;
        case 180506:
          goto LABEL_408;
        case 180507:
          goto LABEL_411;
        case 180508:
          goto LABEL_414;
        case 180509:
          goto LABEL_418;
        default:
          switch(v4)
          {
            case 190001:
              goto LABEL_421;
            case 190002:
              goto LABEL_424;
            case 190003:
              goto LABEL_427;
            case 190004:
              goto LABEL_430;
            case 190005:
              goto LABEL_433;
            case 190006:
              goto LABEL_436;
            default:
              switch(v4)
              {
                case 180000:
                  goto LABEL_377;
                case 180001:
                  goto LABEL_380;
                case 180002:
                  goto LABEL_383;
                case 180003:
                  goto LABEL_386;
                default:
                  goto LABEL_31;
              }
          }
      }
    }
    if (v4 > 220000)
    {
      switch(v4)
      {
        case 220001:
          goto LABEL_555;
        case 220002:
          goto LABEL_558;
        case 220003:
          goto LABEL_562;
        case 220004:
          goto LABEL_565;
        case 220005:
          goto LABEL_569;
        case 220007:
          goto LABEL_572;
        case 220008:
          goto LABEL_575;
        case 220009:
          goto LABEL_578;
        case 220010:
          goto LABEL_581;
        case 220011:
          goto LABEL_584;
        case 220012:
          goto LABEL_587;
        case 220013:
          goto LABEL_590;
        case 220014:
          goto LABEL_593;
        case 220015:
          goto LABEL_596;
        case 220016:
          goto LABEL_599;
        case 220017:
          goto LABEL_602;
        case 220018:
          goto LABEL_605;
        case 220019:
          goto LABEL_608;
        case 220020:
          goto LABEL_613;
        case 220021:
          goto LABEL_616;
        case 220022:
          goto LABEL_619;
        case 220023:
          goto LABEL_623;
        case 220024:
          goto LABEL_626;
        default:
          goto LABEL_31;
      }
    }
    switch(v4)
    {
      case 210001:
        goto LABEL_530;
      case 210002:
        goto LABEL_533;
      case 210003:
        goto LABEL_536;
      case 210004:
        goto LABEL_539;
      case 210005:
        goto LABEL_542;
      case 210006:
        goto LABEL_546;
      default:
        if (v4 == 212001)
          goto LABEL_549;
        if (v4 != 214001)
          goto LABEL_31;
        goto LABEL_552;
    }
  }
  if (v4 <= 159999)
  {
    switch(v4)
    {
      case 0:
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_DEFAULT, "Initializing schema", buf, 2u);
        }

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _InitializeSchema(v3, *(void **)(a1 + 32));
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        {
          objc_msgSend(*(id *)(a1 + 40), "noteNeedsSpotlightReindex");
          objc_msgSend(*(id *)(a1 + 40), "delegate");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "mailMessageLibraryMigrator:isInitializingDatabaseWithConnection:", *(_QWORD *)(a1 + 40), v280);

        }
        goto LABEL_629;
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 53:
      case 55:
      case 56:
        goto LABEL_31;
      case 22:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 22;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 22;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "TellurideVersion";
          _os_log_impl(&dword_1A4F90000, v10, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _FixZeroedConversationHashes(v3);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          goto LABEL_37;
        goto LABEL_629;
      case 23:
LABEL_37:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 23;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 23;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "SundanceConversationHashesMustBeNonZeroVersion";
          _os_log_impl(&dword_1A4F90000, v11, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 40), "noteRebuildMessageInfoIndex");
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _DropMessageDeletedIndex(v3);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          goto LABEL_40;
        goto LABEL_629;
      case 24:
LABEL_40:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 24;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 24;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "SundanceCreateMessageInfosCoveringIndexVersion";
          _os_log_impl(&dword_1A4F90000, v12, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 40), "noteRebuildMessageInfoIndex");
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _AddVIPSenderColumn(v3);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          goto LABEL_43;
        goto LABEL_629;
      case 25:
LABEL_43:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 25;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 25;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "SundanceMessagesHaveVIPSenderFlag";
          _os_log_impl(&dword_1A4F90000, v13, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _AddUniqueRemoteIDColumn(v3);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          goto LABEL_46;
        goto LABEL_629;
      case 26:
LABEL_46:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 26;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 26;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "InnsbruckMessagesHaveUniqueRemoteID";
          _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _AddContentTransactionIDColumn(v3);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          goto LABEL_49;
        goto LABEL_629;
      case 27:
LABEL_49:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 27;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 27;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "InnsbruckMessagesHaveContentTransactionID";
          _os_log_impl(&dword_1A4F90000, v15, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _ImproveMessageConversationIndexes(v3);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          goto LABEL_52;
        goto LABEL_629;
      case 28:
LABEL_52:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 28;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 28;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "InnsbruckBetterMessageConversationIndexes";
          _os_log_impl(&dword_1A4F90000, v16, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _AddSequenceIdentifierIndex(v3);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          goto LABEL_55;
        goto LABEL_629;
      case 29:
LABEL_55:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 29;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 29;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "InnsbruckCondStoreSequenceIdentifierIndex";
          _os_log_impl(&dword_1A4F90000, v17, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _AddFlaggedAndAttachmentColumnsAndTriggers(v3);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          goto LABEL_58;
        goto LABEL_629;
      case 30:
LABEL_58:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 30;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 30;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "InnsbruckFlaggedAndAttachmentCounts";
          _os_log_impl(&dword_1A4F90000, v18, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _AddToCcCountColumnAndTriggers(v3);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          goto LABEL_61;
        goto LABEL_629;
      case 31:
LABEL_61:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 31;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 31;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "InnsbruckToCcCounts";
          _os_log_impl(&dword_1A4F90000, v19, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _AddServerOnlyUnreadCountColumn(v3);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          goto LABEL_64;
        goto LABEL_629;
      case 32:
LABEL_64:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 32;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 32;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "InnsbruckServerOnlyUnreadCounts";
          _os_log_impl(&dword_1A4F90000, v20, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_67;
      case 33:
LABEL_67:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 33;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 33;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "SochiFixFlaggedCount";
          _os_log_impl(&dword_1A4F90000, v21, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _SochiFixFlaggedCount(v3);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          goto LABEL_70;
        goto LABEL_629;
      case 34:
LABEL_70:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 34;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 34;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "SochiFixFlaggedCount2";
          _os_log_impl(&dword_1A4F90000, v22, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _AddConversationFlags(v3);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          goto LABEL_73;
        goto LABEL_629;
      case 35:
LABEL_73:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 35;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 35;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "OkemoConversationFlags";
          _os_log_impl(&dword_1A4F90000, v23, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_76;
      case 36:
LABEL_76:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 36;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 36;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "MonarchAddSuggestionsProcessingStateColumn";
          _os_log_impl(&dword_1A4F90000, v24, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_79;
      case 37:
LABEL_79:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 37;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 37;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "MonarchResetSuggestionsProcessingStateColumn";
          _os_log_impl(&dword_1A4F90000, v25, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_82;
      case 38:
LABEL_82:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 38;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 38;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "MonarchDuplicatesSuppression";
          _os_log_impl(&dword_1A4F90000, v26, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 40), "noteNeedsRebuildTriggers");
        goto LABEL_85;
      case 39:
LABEL_85:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 39;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 39;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "MonarchRestoreTriggers";
          _os_log_impl(&dword_1A4F90000, v27, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 40), "noteRebuildMessageInfoIndex");
        goto LABEL_88;
      case 40:
LABEL_88:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 40;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 40;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "MonarchUpdateMessageInfoCoveringIndex";
          _os_log_impl(&dword_1A4F90000, v28, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 40), "noteNeedsRebuildTriggers");
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _ExecuteQueries(v3, (uint64_t)off_1E4E8D320, 6, CFSTR("updating mailboxes counts"));
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          goto LABEL_91;
        goto LABEL_629;
      case 41:
LABEL_91:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 41;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 41;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "MonarchUnreadCountDuplicateSuppression";
          _os_log_impl(&dword_1A4F90000, v29, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_94;
      case 42:
LABEL_94:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 42;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 42;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "MonarchUnreadCountIgnoreSearchResult";
          _os_log_impl(&dword_1A4F90000, v30, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 40), "noteNeedsRebuildTriggers");
        v31 = sqlite3_exec(v3, "UPDATE mailboxes SET unread_count = (SELECT COUNT(DISTINCT(message_id)) FROM messages WHERE (flags&1 = 0 AND flags&128 = 0 AND flags&1048576 = 0) AND (mailbox = mailboxes.ROWID));",
                0,
                0,
                0);
        _HandleSQLiteError(v3, CFSTR("updating mailboxes unread_count"));
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v31 == 0;
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          goto LABEL_97;
        goto LABEL_629;
      case 43:
LABEL_97:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 43;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 43;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "MonarchUnreadCountPreventNegativeValue";
          _os_log_impl(&dword_1A4F90000, v32, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _ExecuteQueries(v3, (uint64_t)off_1E4E8D350, 2, CFSTR("updating message_content_index_transaction_id"));
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          goto LABEL_100;
        goto LABEL_629;
      case 44:
LABEL_100:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 44;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 44;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "MonarchFasterSpotlightIndexing";
          _os_log_impl(&dword_1A4F90000, v33, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(_QWORD *)buf = "CREATE INDEX message_mailbox_content_index ON messages (mailbox, content_index_transaction_id, "
                         "flags, date_received ASC)";
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _ExecuteQueries(v3, (uint64_t)buf, 1, CFSTR("adding message_mailbox_content_index"));
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          goto LABEL_103;
        goto LABEL_629;
      case 45:
LABEL_103:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 45;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 45;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "MonarchOldestNonIndexedMessagesLookup";
          _os_log_impl(&dword_1A4F90000, v34, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_106;
      case 46:
LABEL_106:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 46;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 46;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "MonarchForceSpotlightReindex";
          _os_log_impl(&dword_1A4F90000, v35, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _ExecuteQueries(v3, (uint64_t)off_1E4E8D360, 3, CFSTR("adding spotlight tombstones table"));
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          goto LABEL_109;
        goto LABEL_629;
      case 47:
LABEL_109:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 47;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 47;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "BoulderAddSpotlightTombstones";
          _os_log_impl(&dword_1A4F90000, v36, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_112;
      case 48:
LABEL_112:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 48;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 48;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "BoulderForceSpotlightReindex";
          _os_log_impl(&dword_1A4F90000, v37, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_115;
      case 49:
LABEL_115:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 49;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 49;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "BoulderForceSpotlightReindex2";
          _os_log_impl(&dword_1A4F90000, v38, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_118;
      case 50:
LABEL_118:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 50;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 50;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "BoulderForceSpotlightReindex3";
          _os_log_impl(&dword_1A4F90000, v39, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        v40 = sqlite3_exec(v3, "UPDATE mailboxes SET server_unread_count = 0 WHERE url LIKE \"pop:%\";", 0, 0, 0);
        _HandleSQLiteError(v3, CFSTR("updating mailboxes unread_count"));
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v40 == 0;
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          goto LABEL_121;
        goto LABEL_629;
      case 51:
LABEL_121:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 51;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 51;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "BoulderZeroOutPOPServerUnreadCount";
          _os_log_impl(&dword_1A4F90000, v41, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_124;
      case 52:
LABEL_124:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 52;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 52;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "BoulderForceSpotlightReindex4";
          _os_log_impl(&dword_1A4F90000, v42, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        v43 = sqlite3_exec(v3, "ALTER TABLE messages ADD COLUMN list_id_hash INTEGER;", 0, 0, 0);
        _HandleSQLiteError(v3, CFSTR("adding list_id_hash column"));
        if (v43)
        {
          LOBYTE(v44) = 0;
        }
        else
        {
          v44 = sqlite3_exec(v3, "CREATE INDEX message_list_id_hash_index ON messages(list_id_hash);", 0, 0, 0) == 0;
          _HandleSQLiteError(v3, CFSTR("adding message_list_id_hash_index index"));
        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v44;
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          goto LABEL_130;
        goto LABEL_629;
      case 54:
LABEL_130:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 54;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 54;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "WhitetailAddListIDColumn";
          _os_log_impl(&dword_1A4F90000, v45, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
        goto LABEL_133;
      case 57:
LABEL_133:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 57;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 57;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "WhitetailRemoveDecluttering";
          _os_log_impl(&dword_1A4F90000, v46, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_136;
      case 58:
LABEL_136:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 58;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 58;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "WhitetailForceSpotlightReindex";
          _os_log_impl(&dword_1A4F90000, v47, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_139;
      case 59:
LABEL_139:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 59;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 59;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "WhitetailForceSpotlightReindex2";
          _os_log_impl(&dword_1A4F90000, v48, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 40), "resetTTRPromptAndForceReindex");
        goto LABEL_142;
      case 60:
LABEL_142:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 60;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 60;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "TigrisForceSpotlightReindexConversationID";
          _os_log_impl(&dword_1A4F90000, v49, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        if (_ExecuteQueries(v3, (uint64_t)off_1E4E8D378, 2, CFSTR("adding mailboxes status count columns")))
        {
          *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
          v50 = sqlite3_prepare_v2(v3, "SELECT DISTINCT mailbox FROM messages WHERE flags&64 = 64;",
                  -1,
                  (sqlite3_stmt **)buf,
                  0);
          v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v52 = v50 == 0;
          if (!v50)
          {
            v53 = *(sqlite3_stmt **)buf;
            if (*(_QWORD *)buf)
            {
              while (1)
              {
                v54 = sqlite3_step(v53);
                if (v54 != 100)
                  break;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", sqlite3_column_int64(*(sqlite3_stmt **)buf, 0));
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "addObject:", v55);

                v53 = *(sqlite3_stmt **)buf;
              }
              _HandleSQLiteError(v3, CFSTR("finding mailbox IDs of draft mailboxes"));
              v52 = v54 == 101;
              sqlite3_finalize(*(sqlite3_stmt **)buf);
            }
          }
          if (v52)
          {
            if (objc_msgSend(v51, "count"))
            {
              objc_msgSend(v51, "componentsJoinedByString:", CFSTR(", "));
              v57 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v58 = (const char *)objc_msgSend(v57, "UTF8String");

              v59 = sqlite3_mprintf("UPDATE mailboxes SET last_sync_status_count = unread_count + server_unread_count, most_recent_status_count = unread_count + server_unread_count WHERE url LIKE 'imap:%%' AND rowid NOT IN (%s)", v58);
              LODWORD(v58) = sqlite3_exec(v3, v59, 0, 0, 0);
              sqlite3_free(v59);
              v56 = (_DWORD)v58 == 0;
              _HandleSQLiteError(v3, CFSTR("updating count columns for non-draft mailboxes"));
            }
            else
            {
              v60 = sqlite3_exec(v3, "UPDATE mailboxes SET last_sync_status_count = unread_count + server_unread_count, most_recent_status_count = unread_count + server_unread_count WHERE url LIKE 'imap:%'", 0, 0, 0);
              _HandleSQLiteError(v3, CFSTR("updating count columns"));
              v56 = v60 == 0;
            }
          }
          else
          {
            v56 = 0;
          }

        }
        else
        {
          v56 = 0;
        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v56;
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          goto LABEL_158;
        goto LABEL_629;
      case 61:
LABEL_158:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 61;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 61;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "TigrisAddUnseenCountColumn";
          _os_log_impl(&dword_1A4F90000, v61, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        v62 = sqlite3_exec(v3, "ALTER TABLE mailboxes ADD COLUMN reconcile;", 0, 0, 0);
        _HandleSQLiteError(v3, CFSTR("adding reconcile column"));
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v62 == 0;
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          goto LABEL_161;
        goto LABEL_629;
      case 62:
LABEL_161:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 62;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 62;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "TigrisAddReconcileColumn";
          _os_log_impl(&dword_1A4F90000, v63, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 40), "noteNeedsRebuildTriggers");
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _ExecuteQueries(v3, (uint64_t)off_1E4E8D388, 3, CFSTR("adding spotlight message reindex table"));
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          goto LABEL_164;
        goto LABEL_629;
      case 63:
LABEL_164:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 63;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 63;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "TigrisAddSpotlightReindexTable";
          _os_log_impl(&dword_1A4F90000, v64, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_167;
      case 64:
LABEL_167:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 64;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 64;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "TigrisAddMBLQueueTable";
          _os_log_impl(&dword_1A4F90000, v65, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 40), "noteNeedsSpotlightReindex");
        goto LABEL_170;
      case 65:
LABEL_170:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 65;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 65;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "TigrisForceSpotlightReindexSupportDND";
          _os_log_impl(&dword_1A4F90000, v66, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        *(_QWORD *)buf = "DROP TABLE IF EXISTS mbl_queue;";
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _ExecuteQueries(v3, (uint64_t)buf, 1, CFSTR("removing mbl_queue table"));
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          goto LABEL_173;
        goto LABEL_629;
      case 66:
LABEL_173:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 66;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v67 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 66;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "TigrisRemoveMBDLQueueTable";
          _os_log_impl(&dword_1A4F90000, v67, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 40), "noteRebuildMessageInfoIndex");
        v68 = sqlite3_exec(v3, "ALTER TABLE messages ADD COLUMN journaled DEFAULT '0';", 0, 0, 0);
        _HandleSQLiteError(v3, CFSTR("adding journaled column"));
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v68 == 0;
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          goto LABEL_176;
        goto LABEL_629;
      case 67:
LABEL_176:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 67;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v69 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 67;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "TigrisAddUnmergedColumn";
          _os_log_impl(&dword_1A4F90000, v69, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        if (v4 < 60)
          goto LABEL_180;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _ResetStatusCountsForDrafts(v3);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          goto LABEL_180;
        goto LABEL_629;
      case 68:
LABEL_180:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 68;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v70 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 68;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "TigrisResetStatusCountsForDrafts";
          _os_log_impl(&dword_1A4F90000, v70, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_183;
      case 69:
LABEL_183:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 69;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 69;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "TigrisSetSpotlightDataTypes";
          _os_log_impl(&dword_1A4F90000, v71, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 40), "noteNeedsSpotlightReindex");
        goto LABEL_186;
      case 70:
LABEL_186:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 70;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v72 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 70;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "TigrisUpgradePadding70";
          _os_log_impl(&dword_1A4F90000, v72, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_189;
      case 71:
LABEL_189:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 71;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 71;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "TigrisUpgradePadding71";
          _os_log_impl(&dword_1A4F90000, v73, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_192;
      case 72:
LABEL_192:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 72;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 72;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "TigrisUpgradePadding72";
          _os_log_impl(&dword_1A4F90000, v74, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_195;
      case 73:
LABEL_195:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 73;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v75 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 73;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "LastDeprecatedNumberingScheme";
          _os_log_impl(&dword_1A4F90000, v75, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        goto LABEL_198;
      default:
        if (v4 == 155000)
        {
LABEL_198:
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 155000;
          +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
          v76 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            *(_QWORD *)&buf[4] = 155000;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "EmetBaseline";
            _os_log_impl(&dword_1A4F90000, v76, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
          }

        }
        else if (v4 != 155001)
        {
          goto LABEL_31;
        }
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 155001;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 155001;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "EmetSetSpotlightDataOwner";
          _os_log_impl(&dword_1A4F90000, v77, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        v78 = -[MFMailMessageLibraryMailboxURLMigrationStep initWithSQLiteConnection:]([MFMailMessageLibraryMailboxURLMigrationStep alloc], "initWithSQLiteConnection:", *(_QWORD *)(a1 + 48));
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = -[MFMailMessageLibraryMailboxURLMigrationStep performMigrationStep](v78, "performMigrationStep");
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        {
          objc_msgSend(*(id *)(a1 + 40), "noteNeedsSpotlightReindex");

          goto LABEL_205;
        }

        break;
    }
    goto LABEL_629;
  }
  if (v4 > 169999)
  {
    switch(v4)
    {
      case 170000:
        goto LABEL_214;
      case 170001:
        goto LABEL_217;
      case 170002:
        goto LABEL_220;
      case 170003:
        goto LABEL_223;
      case 170004:
        goto LABEL_226;
      case 170005:
        goto LABEL_229;
      case 170006:
        goto LABEL_232;
      case 170007:
        goto LABEL_236;
      case 170008:
        goto LABEL_239;
      case 170009:
        goto LABEL_242;
      case 170010:
        goto LABEL_246;
      case 170011:
        goto LABEL_249;
      case 170012:
        goto LABEL_253;
      case 170013:
        goto LABEL_256;
      case 170014:
        goto LABEL_259;
      case 170015:
        goto LABEL_263;
      case 170016:
        goto LABEL_266;
      case 170017:
        goto LABEL_269;
      case 170018:
        goto LABEL_272;
      case 170019:
        goto LABEL_275;
      case 170020:
        goto LABEL_278;
      case 170021:
        goto LABEL_281;
      case 170022:
        goto LABEL_284;
      case 170023:
        goto LABEL_288;
      case 170024:
        goto LABEL_291;
      case 170025:
        goto LABEL_295;
      case 170026:
        goto LABEL_298;
      case 170027:
        goto LABEL_301;
      case 170028:
        goto LABEL_304;
      case 170029:
        goto LABEL_307;
      case 170030:
        goto LABEL_310;
      case 170031:
        goto LABEL_313;
      case 170032:
        goto LABEL_316;
      case 170033:
        goto LABEL_319;
      case 170034:
        goto LABEL_322;
      case 170035:
        goto LABEL_325;
      case 170036:
        goto LABEL_328;
      case 170037:
        goto LABEL_331;
      case 170038:
        goto LABEL_334;
      case 170039:
        goto LABEL_338;
      case 170050:
        goto LABEL_342;
      case 170051:
        goto LABEL_345;
      case 170052:
        goto LABEL_352;
      case 170053:
        goto LABEL_355;
      case 170054:
        goto LABEL_358;
      case 170055:
        goto LABEL_362;
      case 170056:
        goto LABEL_365;
      case 170057:
        goto LABEL_368;
      case 170058:
        goto LABEL_371;
      case 170059:
        goto LABEL_374;
      default:
        goto LABEL_31;
    }
  }
  switch(v4)
  {
    case 160000:
LABEL_205:
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 160000;
      +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
      v79 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = 160000;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "PeaceBaseline";
        _os_log_impl(&dword_1A4F90000, v79, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
      }

      break;
    case 160001:
      break;
    case 160002:
      goto LABEL_211;
    default:
LABEL_31:
      if (v4 <= 220024)
      {
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          __80__MFMailMessageLibraryMigrator__runMigrationStepsFromVersion_connection_schema___block_invoke_2_cold_2(v4, v9);
      }
      else
      {
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          __80__MFMailMessageLibraryMigrator__runMigrationStepsFromVersion_connection_schema___block_invoke_2_cold_1(v4, v9);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      goto LABEL_629;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 160001;
  +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
  v80 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = 160001;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "PeaceAddMessageJournaledIndex";
    _os_log_impl(&dword_1A4F90000, v80, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
  }

LABEL_211:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 160002;
  +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
  v81 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = 160002;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "PeaceAddMessageJournaledConversationIndex";
    _os_log_impl(&dword_1A4F90000, v81, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
  }

LABEL_214:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170000;
  +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
  v82 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = 170000;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "YukonBaseline";
    _os_log_impl(&dword_1A4F90000, v82, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
  }

LABEL_217:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170001;
  +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
  v83 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = 170001;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "YukonAddDocumentIDColumn";
    _os_log_impl(&dword_1A4F90000, v83, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
  }

LABEL_220:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170002;
  +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
  v84 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = 170002;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "YukonUpdateMuteThreadFlagBit";
    _os_log_impl(&dword_1A4F90000, v84, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
  }

LABEL_223:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170003;
  +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
  v85 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = 170003;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "YukonAddMessageJournaledIndex";
    _os_log_impl(&dword_1A4F90000, v85, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
  }

  v86 = -[MFMailMessageLibraryLocalActionsTablesMigrationStep initWithSQLiteConnection:]([MFMailMessageLibraryLocalActionsTablesMigrationStep alloc], "initWithSQLiteConnection:", *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = -[MFMailMessageLibraryLocalActionsTablesMigrationStep performMigrationStep](v86, "performMigrationStep");
  v87 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) == 0;

  if (!v87)
  {
LABEL_226:
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170004;
    +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
    v88 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = 170004;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "YukonAddLocalMessageActionsTables";
      _os_log_impl(&dword_1A4F90000, v88, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
    }

LABEL_229:
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170005;
    +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
    v89 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = 170005;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "YukonMessageInteractionMetricsColumns";
      _os_log_impl(&dword_1A4F90000, v89, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
    }

LABEL_232:
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170006;
    +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
    v90 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = 170006;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "YukonAddCategoryColumnsNoLongerUsed";
      _os_log_impl(&dword_1A4F90000, v90, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
    }

    if (v4 <= 169999
      || (v91 = -[MFMailMessageLibraryLocalActionsTablesMigrationStep initWithSQLiteConnection:]([MFMailMessageLibraryLocalActionsTablesMigrationStep alloc], "initWithSQLiteConnection:", *(_QWORD *)(a1 + 48)), *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = -[MFMailMessageLibraryLocalActionsTablesMigrationStep performMigrationStep](v91, "performMigrationStep"), v92 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) == 0, v91, !v92))
    {
LABEL_236:
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170007;
      +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
      v93 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = 170007;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "YukonFixBrokenUpgradesFromPeace";
        _os_log_impl(&dword_1A4F90000, v93, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
      }

LABEL_239:
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170008;
      +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
      v94 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = 170008;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "YukonAddCategoryColumns";
        _os_log_impl(&dword_1A4F90000, v94, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
      }

      v95 = sqlite3_exec(v3, "DROP TABLE IF EXISTS offline_cache_operations;\n"
              "DROP TABLE IF EXISTS offline_cache_replay_data;\n"
              "DROP TRIGGER after_delete_account;\n",
              0,
              0,
              0);
      _HandleSQLiteError(v3, CFSTR("removing offline cache tables"));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v95 == 0;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      {
LABEL_242:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170009;
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v96 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = 170009;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "YukonRemoveOfflineCacheTables";
          _os_log_impl(&dword_1A4F90000, v96, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
        }

        if (v4 <= 170003
          || (v97 = -[MFMailMessageLibraryModifyColumnDefinitionsMigrationStep initWithSQLiteConnection:]([MFMailMessageLibraryModifyColumnDefinitionsMigrationStep alloc], "initWithSQLiteConnection:", *(_QWORD *)(a1 + 48)), *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = -[MFMailMessageLibraryModifyColumnDefinitionsMigrationStep performMigrationStep](v97, "performMigrationStep"), v98 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) == 0, v97, !v98))
        {
LABEL_246:
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170010;
          +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
          v99 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            *(_QWORD *)&buf[4] = 170010;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "YukonModifyColumnDefinitions";
            _os_log_impl(&dword_1A4F90000, v99, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
          }

          objc_msgSend(*(id *)(a1 + 40), "noteNeedsRebuildTriggers");
          objc_msgSend(*(id *)(a1 + 40), "addPostMigrationBlock:", &__block_literal_global_94_1);
          v100 = -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep initWithSQLiteConnection:protectedDatabaseName:]([MFMailMessageLibraryAdoptSharedSchemaMigrationStep alloc], "initWithSQLiteConnection:protectedDatabaseName:", *(_QWORD *)(a1 + 48), CFSTR("protected"));
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = -[MFMailMessageLibraryAdoptSharedSchemaMigrationStep performMigrationStep](v100, "performMigrationStep");
          v101 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) == 0;

          if (!v101)
          {
LABEL_249:
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170011;
            +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
            v102 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              *(_QWORD *)&buf[4] = 170011;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "YukonAdoptSharedSchema";
              _os_log_impl(&dword_1A4F90000, v102, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
            }

            if (v4 != 170011
              || (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _AddProtectedDataIndexes(v3)) != 0)
            {
LABEL_253:
              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170012;
              +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
              v103 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218242;
                *(_QWORD *)&buf[4] = 170012;
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = "YukonAddProtectedDataIndexes";
                _os_log_impl(&dword_1A4F90000, v103, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
              }

LABEL_256:
              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170013;
              +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
              v104 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218242;
                *(_QWORD *)&buf[4] = 170013;
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = "YukonAddInteractionLogTable";
                _os_log_impl(&dword_1A4F90000, v104, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
              }

LABEL_259:
              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170014;
              +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
              v105 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218242;
                *(_QWORD *)&buf[4] = 170014;
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = "YukonAddReadLaterTable";
                _os_log_impl(&dword_1A4F90000, v105, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
              }

              if (v4 <= 170010
                || (objc_msgSend(*(id *)(a1 + 40), "noteNeedsRebuildTriggers"),
                    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EBD8], "runWithConnection:", v280) == 0, _HandleSQLiteError(v3, CFSTR("Renaming threads to message_references")), *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)))
              {
LABEL_263:
                *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170015;
                +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                v106 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134218242;
                  *(_QWORD *)&buf[4] = 170015;
                  *(_WORD *)&buf[12] = 2080;
                  *(_QWORD *)&buf[14] = "YukonRenameThreadsTable";
                  _os_log_impl(&dword_1A4F90000, v106, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                }

                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EA28], "runWithConnection:", v280) == 0;
                _HandleSQLiteError(v3, CFSTR("Creating messages deleted date received index"));
                if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                {
LABEL_266:
                  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170016;
                  +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                  v107 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 134218242;
                    *(_QWORD *)&buf[4] = 170016;
                    *(_WORD *)&buf[12] = 2080;
                    *(_QWORD *)&buf[14] = "YukonAddMessageDeletedDateReceivedIndex";
                    _os_log_impl(&dword_1A4F90000, v107, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                  }

                  objc_msgSend(*(id *)(a1 + 40), "noteNeedsRebuildTriggers");
                  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = +[MFMailMessageLibraryAddSearchableIndexTablesUpgradeStep runWithConnection:](MFMailMessageLibraryAddSearchableIndexTablesUpgradeStep, "runWithConnection:", v280) == 0;
                  _HandleSQLiteError(v3, CFSTR("Creating searchable index tables"));
                  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                  {
LABEL_269:
                    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170017;
                    +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                    v108 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 134218242;
                      *(_QWORD *)&buf[4] = 170017;
                      *(_WORD *)&buf[12] = 2080;
                      *(_QWORD *)&buf[14] = "YukonAddSearchableIndexTables";
                      _os_log_impl(&dword_1A4F90000, v108, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                    }

                    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = +[MFMailMessageLibraryAddJournaledConversationIDDateReceivedUpgradeStep runWithConnection:](MFMailMessageLibraryAddJournaledConversationIDDateReceivedUpgradeStep, "runWithConnection:", v280) == 0;
                    _HandleSQLiteError(v3, CFSTR("Creating messages_journaled_conversation_id_date_received_index"));
                    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                    {
LABEL_272:
                      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170018;
                      +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                      v109 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 134218242;
                        *(_QWORD *)&buf[4] = 170018;
                        *(_WORD *)&buf[12] = 2080;
                        *(_QWORD *)&buf[14] = "YukonAddJournaledConversationIDDateReceivedIndex";
                        _os_log_impl(&dword_1A4F90000, v109, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                      }

                      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EA88], "runWithConnection:", v280) == 0;
                      _HandleSQLiteError(v3, CFSTR("Adding thread tables"));
                      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                      {
LABEL_275:
                        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170019;
                        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                        v110 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 134218242;
                          *(_QWORD *)&buf[4] = 170019;
                          *(_WORD *)&buf[12] = 2080;
                          *(_QWORD *)&buf[14] = "YukonAddThreadTables";
                          _os_log_impl(&dword_1A4F90000, v110, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                        }

LABEL_278:
                        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170020;
                        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                        v111 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 134218242;
                          *(_QWORD *)&buf[4] = 170020;
                          *(_WORD *)&buf[12] = 2080;
                          *(_QWORD *)&buf[14] = "YukonAddThreadsScopeConverationDateIndex";
                          _os_log_impl(&dword_1A4F90000, v111, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                        }

                        v112 = objc_msgSend(MEMORY[0x1E0D1EB58], "run");
                        objc_msgSend(MEMORY[0x1E0D1EB58], "propertiesToMigrate");
                        v113 = (void *)objc_claimAutoreleasedReturnValue();
                        +[MFUserDefaultMigrator migrateDefaults:](MFUserDefaultMigrator, "migrateDefaults:", v113);

                        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v112;
                        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                        {
LABEL_281:
                          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170021;
                          +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                          v114 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 134218242;
                            *(_QWORD *)&buf[4] = 170021;
                            *(_WORD *)&buf[12] = 2080;
                            *(_QWORD *)&buf[14] = "YukonMigrateEmailUserDefaults";
                            _os_log_impl(&dword_1A4F90000, v114, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                          }

                          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = +[MFMailMessageLibrarySetThreadSendersRecipientsConflictResolutionUpgradeStep runWithConnection:](MFMailMessageLibrarySetThreadSendersRecipientsConflictResolutionUpgradeStep, "runWithConnection:", v280) == 0;
                          _HandleSQLiteError(v3, CFSTR("Setting conflict resolution for primary key of thread_senders and thread_recipients"));
                          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                          {
LABEL_284:
                            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170022;
                            +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                            v115 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)buf = 134218242;
                              *(_QWORD *)&buf[4] = 170022;
                              *(_WORD *)&buf[12] = 2080;
                              *(_QWORD *)&buf[14] = "YukonSetConflictResolutionForThreadSendersAndRecipients";
                              _os_log_impl(&dword_1A4F90000, v115, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                            }

                            if (v4 <= 170010
                              || (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = +[MFMailMessageLibraryResetSequenceNumberMigrationStep runWithConnection:](MFMailMessageLibraryResetSequenceNumberMigrationStep, "runWithConnection:", v280) == 0, _HandleSQLiteError(v3, CFSTR("Reset sequence_identifier for messages")), *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)))
                            {
LABEL_288:
                              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170023;
                              +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                              v116 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
                              {
                                *(_DWORD *)buf = 134218242;
                                *(_QWORD *)&buf[4] = 170023;
                                *(_WORD *)&buf[12] = 2080;
                                *(_QWORD *)&buf[14] = "YukonResetSequenceIdentifierForFlagColors";
                                _os_log_impl(&dword_1A4F90000, v116, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                              }

                              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _AddThreadsSendersAndRecipientsIndexes(v3);
                              if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                              {
LABEL_291:
                                *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170024;
                                +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                v117 = objc_claimAutoreleasedReturnValue();
                                if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
                                {
                                  *(_DWORD *)buf = 134218242;
                                  *(_QWORD *)&buf[4] = 170024;
                                  *(_WORD *)&buf[12] = 2080;
                                  *(_QWORD *)&buf[14] = "YukonAddThreadSendersAndRecipientsIndexes";
                                  _os_log_impl(&dword_1A4F90000, v117, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                }

                                if (v4 <= 170010
                                  || (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = +[MFMailMessageLibraryThreadFlagColorsUpgradeStep runWithConnection:](MFMailMessageLibraryThreadFlagColorsUpgradeStep, "runWithConnection:", v280) == 0, _HandleSQLiteError(v3, CFSTR("Adding flag support to threads")), *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)))
                                {
LABEL_295:
                                  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170025;
                                  +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                  v118 = objc_claimAutoreleasedReturnValue();
                                  if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
                                  {
                                    *(_DWORD *)buf = 134218242;
                                    *(_QWORD *)&buf[4] = 170025;
                                    *(_WORD *)&buf[12] = 2080;
                                    *(_QWORD *)&buf[14] = "YukonAddThreadFlagColorsColumns";
                                    _os_log_impl(&dword_1A4F90000, v118, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                  }

                                  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _AddThreadsJournaledColumn(v3);
                                  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                  {
LABEL_298:
                                    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170026;
                                    +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                    v119 = objc_claimAutoreleasedReturnValue();
                                    if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
                                    {
                                      *(_DWORD *)buf = 134218242;
                                      *(_QWORD *)&buf[4] = 170026;
                                      *(_WORD *)&buf[12] = 2080;
                                      *(_QWORD *)&buf[14] = "YukonAddThreadJournaledColumn";
                                      _os_log_impl(&dword_1A4F90000, v119, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                    }

                                    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _AddMessageIndexesForThreadQueries(v3);
                                    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                    {
LABEL_301:
                                      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170027;
                                      +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                      v120 = objc_claimAutoreleasedReturnValue();
                                      if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
                                      {
                                        *(_DWORD *)buf = 134218242;
                                        *(_QWORD *)&buf[4] = 170027;
                                        *(_WORD *)&buf[12] = 2080;
                                        *(_QWORD *)&buf[14] = "YukonAddMessageIndexesForThreadQueries";
                                        _os_log_impl(&dword_1A4F90000, v120, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                      }

                                      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _AddMessageIDIndex(v3);
                                      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                      {
LABEL_304:
                                        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170028;
                                        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                        v121 = objc_claimAutoreleasedReturnValue();
                                        if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
                                        {
                                          *(_DWORD *)buf = 134218242;
                                          *(_QWORD *)&buf[4] = 170028;
                                          *(_WORD *)&buf[12] = 2080;
                                          *(_QWORD *)&buf[14] = "YukonAddMessageIDIndex";
                                          _os_log_impl(&dword_1A4F90000, v121, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                        }

                                        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _AddSenderVIPUnreadCountQueryIndex(v3);
                                        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                        {
LABEL_307:
                                          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170029;
                                          +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                          v122 = objc_claimAutoreleasedReturnValue();
                                          if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
                                          {
                                            *(_DWORD *)buf = 134218242;
                                            *(_QWORD *)&buf[4] = 170029;
                                            *(_WORD *)&buf[12] = 2080;
                                            *(_QWORD *)&buf[14] = "YukonSenderVIPCountQueryIndex";
                                            _os_log_impl(&dword_1A4F90000, v122, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                          }

LABEL_310:
                                          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170030;
                                          +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                          v123 = objc_claimAutoreleasedReturnValue();
                                          if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
                                          {
                                            *(_DWORD *)buf = 134218242;
                                            *(_QWORD *)&buf[4] = 170030;
                                            *(_WORD *)&buf[12] = 2080;
                                            *(_QWORD *)&buf[14] = "YukonRemoveCategorySchema";
                                            _os_log_impl(&dword_1A4F90000, v123, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                          }

                                          v124 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFF8]), "initWithTableName:columnNames:", CFSTR("messages"), &unk_1E4F69568);
                                          *(_QWORD *)buf = CFSTR("DROP INDEX IF EXISTS messages_deleted_mailbox_index;");
                                          objc_msgSend(v124, "definitionWithDatabaseName:", 0);
                                          v125 = (void *)objc_claimAutoreleasedReturnValue();
                                          *(_QWORD *)&buf[8] = v125;
                                          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 2);
                                          v126 = (void *)objc_claimAutoreleasedReturnValue();
                                          objc_msgSend(v126, "componentsJoinedByString:", CFSTR("\n"));
                                          v127 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                                          v128 = (const char *)objc_msgSend(v127, "UTF8String");

                                          LODWORD(v125) = sqlite3_exec(v3, v128, 0, 0, 0);
                                          _HandleSQLiteError(v3, CFSTR("Creating messages_deleted_mailbox_date_received_index"));

                                          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = (_DWORD)v125 == 0;
                                          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                          {
LABEL_313:
                                            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170031;
                                            +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                            v129 = objc_claimAutoreleasedReturnValue();
                                            if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
                                            {
                                              *(_DWORD *)buf = 134218242;
                                              *(_QWORD *)&buf[4] = 170031;
                                              *(_WORD *)&buf[12] = 2080;
                                              *(_QWORD *)&buf[14] = "YukonModifyDeletedMailboxIndex";
                                              _os_log_impl(&dword_1A4F90000, v129, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                            }

                                            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _AddJournaledUndeletedIndex(v3);
                                            if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                            {
LABEL_316:
                                              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170032;
                                              +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                              v130 = objc_claimAutoreleasedReturnValue();
                                              if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
                                              {
                                                *(_DWORD *)buf = 134218242;
                                                *(_QWORD *)&buf[4] = 170032;
                                                *(_WORD *)&buf[12] = 2080;
                                                *(_QWORD *)&buf[14] = "YukonAddJournaledUndeletedIndex";
                                                _os_log_impl(&dword_1A4F90000, v130, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                              }

LABEL_319:
                                              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170033;
                                              +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                              v131 = objc_claimAutoreleasedReturnValue();
                                              if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
                                              {
                                                *(_DWORD *)buf = 134218242;
                                                *(_QWORD *)&buf[4] = 170033;
                                                *(_WORD *)&buf[12] = 2080;
                                                *(_QWORD *)&buf[14] = "YukonCachedMetadataTableUnused1";
                                                _os_log_impl(&dword_1A4F90000, v131, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                              }

                                              objc_msgSend(*(id *)(a1 + 40), "noteNeedsRebuildTriggers");
                                              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EBD0], "runWithConnection:", v280) == 0;
                                              if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                              {
LABEL_322:
                                                *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170034;
                                                +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                v132 = objc_claimAutoreleasedReturnValue();
                                                if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
                                                {
                                                  *(_DWORD *)buf = 134218242;
                                                  *(_QWORD *)&buf[4] = 170034;
                                                  *(_WORD *)&buf[12] = 2080;
                                                  *(_QWORD *)&buf[14] = "YukonRemoveReadLaterSchema";
                                                  _os_log_impl(&dword_1A4F90000, v132, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                }

LABEL_325:
                                                *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170035;
                                                +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                v133 = objc_claimAutoreleasedReturnValue();
                                                if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
                                                {
                                                  *(_DWORD *)buf = 134218242;
                                                  *(_QWORD *)&buf[4] = 170035;
                                                  *(_WORD *)&buf[12] = 2080;
                                                  *(_QWORD *)&buf[14] = "YukonRemoveReadLaterSchemaDotsubmission";
                                                  _os_log_impl(&dword_1A4F90000, v133, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                }

LABEL_328:
                                                *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170036;
                                                +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                v134 = objc_claimAutoreleasedReturnValue();
                                                if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
                                                {
                                                  *(_DWORD *)buf = 134218242;
                                                  *(_QWORD *)&buf[4] = 170036;
                                                  *(_WORD *)&buf[12] = 2080;
                                                  *(_QWORD *)&buf[14] = "YukonCachedMetadataTableUnused2";
                                                  _os_log_impl(&dword_1A4F90000, v134, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                }

                                                *(_QWORD *)buf = "CREATE TABLE IF NOT EXISTS table_metadata (table_name T"
                                                                 "EXT COLLATE BINARY NOT NULL,\n"
                                                                 "                                           largest_dele"
                                                                 "ted_rowid INTEGER NOT NULL DEFAULT 0,\n"
                                                                 "                                           PRIMARY KEY("
                                                                 "table_name)) WITHOUT ROWID;";
                                                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _ExecuteQueries(v3, (uint64_t)buf, 1, CFSTR("creating table_metadata table"));
                                                if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                {
LABEL_331:
                                                  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170037;
                                                  +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                  v135 = objc_claimAutoreleasedReturnValue();
                                                  if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
                                                  {
                                                    *(_DWORD *)buf = 134218242;
                                                    *(_QWORD *)&buf[4] = 170037;
                                                    *(_WORD *)&buf[12] = 2080;
                                                    *(_QWORD *)&buf[14] = "YukonAddTableMetadataTable";
                                                    _os_log_impl(&dword_1A4F90000, v135, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                  }

                                                  objc_msgSend(*(id *)(a1 + 40), "noteNeedsRebuildTriggers");
                                                  v136 = executeQuery(1, v3, "DROP TABLE IF EXISTS message_metadata;",
                                                           CFSTR("Dropping table message_metadata."));
                                                  v137 = executeQuery(v136, v3, "CREATE TABLE message_metadata (message_id INTEGER PRIMARY KEY, timestamp INTEGER NOT NULL, json_values TEXT COLLATE BINARY NOT NULL);",
                                                           CFSTR("Creating message_metadata table."));
                                                  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = executeQuery(v137, v3, "CREATE INDEX message_metadata_timestamp_index ON message_metadata(timestamp);", CFSTR("Creating message_metadata index."));
                                                  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                  {
LABEL_334:
                                                    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170038;
                                                    +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                    v138 = objc_claimAutoreleasedReturnValue();
                                                    if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      *(_DWORD *)buf = 134218242;
                                                      *(_QWORD *)&buf[4] = 170038;
                                                      *(_WORD *)&buf[12] = 2080;
                                                      *(_QWORD *)&buf[14] = "YukonCachedMetadataTable";
                                                      _os_log_impl(&dword_1A4F90000, v138, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                    }

                                                    if (v4 <= 170010
                                                      || (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = +[MFMailMessageLibraryFixPopUidsUniquenessConstraintUpgradeStep runWithConnection:](MFMailMessageLibraryFixPopUidsUniquenessConstraintUpgradeStep, "runWithConnection:", v280) == 0) != 0)
                                                    {
LABEL_338:
                                                      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170039;
                                                      +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                      v139 = objc_claimAutoreleasedReturnValue();
                                                      if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
                                                      {
                                                        *(_DWORD *)buf = 134218242;
                                                        *(_QWORD *)&buf[4] = 170039;
                                                        *(_WORD *)&buf[12] = 2080;
                                                        *(_QWORD *)&buf[14] = "YukonFixPopUidsUniquenessConstraint";
                                                        _os_log_impl(&dword_1A4F90000, v139, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                      }

                                                      if (v4 <= 170025
                                                        || (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _AddThreadJournaledDateIndex(v3)) != 0)
                                                      {
LABEL_342:
                                                        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170050;
                                                        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                        v140 = objc_claimAutoreleasedReturnValue();
                                                        if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
                                                        {
                                                          *(_DWORD *)buf = 134218242;
                                                          *(_QWORD *)&buf[4] = 170050;
                                                          *(_WORD *)&buf[12] = 2080;
                                                          *(_QWORD *)&buf[14] = "YukonAddThreadJournaledDateIndex";
                                                          _os_log_impl(&dword_1A4F90000, v140, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                        }

                                                        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EB40], "run");
                                                        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                        {
LABEL_345:
                                                          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170051;
                                                          +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                          v141 = objc_claimAutoreleasedReturnValue();
                                                          if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            *(_DWORD *)buf = 134218242;
                                                            *(_QWORD *)&buf[4] = 170051;
                                                            *(_WORD *)&buf[12] = 2080;
                                                            *(_QWORD *)&buf[14] = "YukonMigrateBlockedSenderEnabledToActionEnum";
                                                            _os_log_impl(&dword_1A4F90000, v141, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                          }

                                                          v142 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFF8]), "initWithTableName:columnNames:", CFSTR("conversations"), &unk_1E4F695B0);
                                                          *(_QWORD *)buf = v142;
                                                          v143 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFF8]), "initWithTableName:columnNames:", CFSTR("messages"), &unk_1E4F695C8);
                                                          *(_QWORD *)&buf[8] = v143;
                                                          v144 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFF8]), "initWithTableName:columnNames:", CFSTR("messages"), &unk_1E4F695E0);
                                                          *(_QWORD *)&buf[16] = v144;
                                                          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 3);
                                                          v145 = (void *)objc_claimAutoreleasedReturnValue();

                                                          objc_msgSend(v145, "ef_map:", &__block_literal_global_707);
                                                          v146 = (void *)objc_claimAutoreleasedReturnValue();
                                                          objc_msgSend(v146, "componentsJoinedByString:", CFSTR("\n"));
                                                          v147 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                                                          v148 = (const char *)objc_msgSend(v147, "UTF8String");

                                                          LODWORD(v146) = sqlite3_exec(v3, v148, 0, 0, 0);
                                                          _HandleSQLiteError(v3, CFSTR("Creating indexes for conversations and message unread counts"));
                                                          if ((_DWORD)v146)
                                                            LOBYTE(v149) = 0;
                                                          else
                                                            v149 = _ExecuteQueries(v3, (uint64_t)off_1E4E8D400, 2, CFSTR("Updating indexes for unread counts"));

                                                          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v149;
                                                          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                          {
LABEL_352:
                                                            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170052;
                                                            +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                            v150 = objc_claimAutoreleasedReturnValue();
                                                            if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
                                                            {
                                                              *(_DWORD *)buf = 134218242;
                                                              *(_QWORD *)&buf[4] = 170052;
                                                              *(_WORD *)&buf[12] = 2080;
                                                              *(_QWORD *)&buf[14] = "YukonAddUnreadCountIndexes";
                                                              _os_log_impl(&dword_1A4F90000, v150, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                            }

                                                            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _AddAppBadgeCountIndexes(v3);
                                                            if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                          + 24))
                                                            {
LABEL_355:
                                                              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170053;
                                                              +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                              v151 = objc_claimAutoreleasedReturnValue();
                                                              if (os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT))
                                                              {
                                                                *(_DWORD *)buf = 134218242;
                                                                *(_QWORD *)&buf[4] = 170053;
                                                                *(_WORD *)&buf[12] = 2080;
                                                                *(_QWORD *)&buf[14] = "YukonAddAppBadgeCountIndexes";
                                                                _os_log_impl(&dword_1A4F90000, v151, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                              }

LABEL_358:
                                                              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170054;
                                                              +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                              v152 = objc_claimAutoreleasedReturnValue();
                                                              if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
                                                              {
                                                                *(_DWORD *)buf = 134218242;
                                                                *(_QWORD *)&buf[4] = 170054;
                                                                *(_WORD *)&buf[12] = 2080;
                                                                *(_QWORD *)&buf[14] = "YukonResetThreadScopes";
                                                                _os_log_impl(&dword_1A4F90000, v152, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                              }

                                                              if (!_protectedIndexHasBeenInitialized(*(void **)(a1 + 48))
                                                                || (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                             + 24) = _ResetSummary(v3)) != 0)
                                                              {
LABEL_362:
                                                                *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170055;
                                                                +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                v153 = objc_claimAutoreleasedReturnValue();
                                                                if (os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT))
                                                                {
                                                                  *(_DWORD *)buf = 134218242;
                                                                  *(_QWORD *)&buf[4] = 170055;
                                                                  *(_WORD *)&buf[12] = 2080;
                                                                  *(_QWORD *)&buf[14] = "YukonResetSummary";
                                                                  _os_log_impl(&dword_1A4F90000, v153, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                }

                                                                v154 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFF8]), "initWithTableName:columnNames:", CFSTR("messages"), &unk_1E4F69658);
                                                                *(_QWORD *)buf = v154;
                                                                v155 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFF8]), "initWithTableName:columnNames:", CFSTR("messages"), &unk_1E4F69670);
                                                                *(_QWORD *)&buf[8] = v155;
                                                                v156 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EFF8]), "initWithTableName:columnNames:", CFSTR("messages"), &unk_1E4F69688);
                                                                *(_QWORD *)&buf[16] = v156;
                                                                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 3);
                                                                v157 = (void *)objc_claimAutoreleasedReturnValue();

                                                                objc_msgSend(v157, "ef_map:", &__block_literal_global_738);
                                                                v158 = (void *)objc_claimAutoreleasedReturnValue();
                                                                objc_msgSend(v158, "componentsJoinedByString:", CFSTR("\n"));
                                                                v159 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                                                                v160 = (const char *)objc_msgSend(v159, "UTF8String");

                                                                LODWORD(v158) = sqlite3_exec(v3, v160, 0, 0, 0);
                                                                _HandleSQLiteError(v3, CFSTR("Adding sender_vip/conversation message indexes"));

                                                                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = (_DWORD)v158 == 0;
                                                                if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                              + 24))
                                                                {
LABEL_365:
                                                                  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170056;
                                                                  +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                  v161 = objc_claimAutoreleasedReturnValue();
                                                                  if (os_log_type_enabled(v161, OS_LOG_TYPE_DEFAULT))
                                                                  {
                                                                    *(_DWORD *)buf = 134218242;
                                                                    *(_QWORD *)&buf[4] = 170056;
                                                                    *(_WORD *)&buf[12] = 2080;
                                                                    *(_QWORD *)&buf[14] = "YukonAddSenderVIPAndConversationIndexes";
                                                                    _os_log_impl(&dword_1A4F90000, v161, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                  }

                                                                  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                           + 24) = _AddDeletedToMessagesConversationIDIndexes(v3);
                                                                  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                + 24))
                                                                  {
LABEL_368:
                                                                    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170057;
                                                                    +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                    v162 = objc_claimAutoreleasedReturnValue();
                                                                    if (os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
                                                                    {
                                                                      *(_DWORD *)buf = 134218242;
                                                                      *(_QWORD *)&buf[4] = 170057;
                                                                      *(_WORD *)&buf[12] = 2080;
                                                                      *(_QWORD *)&buf[14] = "YukonResetThreadScopes2";
                                                                      _os_log_impl(&dword_1A4F90000, v162, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                    }

                                                                    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                             + 24) = _AddFilterIndexesAndRemoveTriggers(v3);
                                                                    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64)
                                                                                              + 8)
                                                                                  + 24))
                                                                    {
LABEL_371:
                                                                      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 170058;
                                                                      +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                      v163 = objc_claimAutoreleasedReturnValue();
                                                                      if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
                                                                      {
                                                                        *(_DWORD *)buf = 134218242;
                                                                        *(_QWORD *)&buf[4] = 170058;
                                                                        *(_WORD *)&buf[12] = 2080;
                                                                        *(_QWORD *)&buf[14] = "YukonAddFilterIndexesAndRemoveTriggers";
                                                                        _os_log_impl(&dword_1A4F90000, v163, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                      }

                                                                      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                               + 24) = +[MFMailMessageLibraryRebuildThreadsTableUpgradeStep runWithConnection:](MFMailMessageLibraryRebuildThreadsTableUpgradeStep, "runWithConnection:", v280) == 0;
                                                                      _HandleSQLiteError(v3, CFSTR("Removing deleted column from threads"));
                                                                      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64)
                                                                                                + 8)
                                                                                    + 24))
                                                                      {
LABEL_374:
                                                                        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8)
                                                                                  + 24) = 170059;
                                                                        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                        v164 = objc_claimAutoreleasedReturnValue();
                                                                        if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
                                                                        {
                                                                          *(_DWORD *)buf = 134218242;
                                                                          *(_QWORD *)&buf[4] = 170059;
                                                                          *(_WORD *)&buf[12] = 2080;
                                                                          *(_QWORD *)&buf[14] = "YukonResetThreadScopes3";
                                                                          _os_log_impl(&dword_1A4F90000, v164, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                        }

LABEL_377:
                                                                        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8)
                                                                                  + 24) = 180000;
                                                                        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                        v165 = objc_claimAutoreleasedReturnValue();
                                                                        if (os_log_type_enabled(v165, OS_LOG_TYPE_DEFAULT))
                                                                        {
                                                                          *(_DWORD *)buf = 134218242;
                                                                          *(_QWORD *)&buf[4] = 180000;
                                                                          *(_WORD *)&buf[12] = 2080;
                                                                          *(_QWORD *)&buf[14] = "YukonCDEBaseline";
                                                                          _os_log_impl(&dword_1A4F90000, v165, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                        }

                                                                        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                 + 24) = objc_msgSend(MEMORY[0x1E0D1EA38], "runWithConnection:", v280) == 0;
                                                                        _HandleSQLiteError(v3, CFSTR("Adding searchable_message column to messages"));
                                                                        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64)
                                                                                                  + 8)
                                                                                      + 24))
                                                                        {
LABEL_380:
                                                                          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8)
                                                                                    + 24) = 180001;
                                                                          +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                          v166 = objc_claimAutoreleasedReturnValue();
                                                                          if (os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT))
                                                                          {
                                                                            *(_DWORD *)buf = 134218242;
                                                                            *(_QWORD *)&buf[4] = 180001;
                                                                            *(_WORD *)&buf[12] = 2080;
                                                                            *(_QWORD *)&buf[14] = "YukonCDEAddMessagesSea"
                                                                                                  "rchableMessageColumn";
                                                                            _os_log_impl(&dword_1A4F90000, v166, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                          }

                                                                          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64)
                                                                                               + 8)
                                                                                   + 24) = _ModifyMessagesSearchableMessageIndex(v3);
                                                                          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                        + 24))
                                                                          {
LABEL_383:
                                                                            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8)
                                                                                      + 24) = 180002;
                                                                            +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                            v167 = objc_claimAutoreleasedReturnValue();
                                                                            if (os_log_type_enabled(v167, OS_LOG_TYPE_DEFAULT))
                                                                            {
                                                                              *(_DWORD *)buf = 134218242;
                                                                              *(_QWORD *)&buf[4] = 180002;
                                                                              *(_WORD *)&buf[12] = 2080;
                                                                              *(_QWORD *)&buf[14] = "YukonCDEModifyMessagesSearchableMessageIndex";
                                                                              _os_log_impl(&dword_1A4F90000, v167, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                            }

                                                                            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64)
                                                                                                 + 8)
                                                                                     + 24) = _AddMessagesMailboxDeletedDateReceivedIndex(v3);
LABEL_386:
                                                                            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8)
                                                                                      + 24) = 180003;
                                                                            +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                            v168 = objc_claimAutoreleasedReturnValue();
                                                                            if (os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT))
                                                                            {
                                                                              *(_DWORD *)buf = 134218242;
                                                                              *(_QWORD *)&buf[4] = 180003;
                                                                              *(_WORD *)&buf[12] = 2080;
                                                                              *(_QWORD *)&buf[14] = "YukonCDEAddInMemoryThreadIndex";
                                                                              _os_log_impl(&dword_1A4F90000, v168, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                            }

LABEL_389:
                                                                            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8)
                                                                                      + 24) = 180500;
                                                                            +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                            v169 = objc_claimAutoreleasedReturnValue();
                                                                            if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
                                                                            {
                                                                              *(_DWORD *)buf = 134218242;
                                                                              *(_QWORD *)&buf[4] = 180500;
                                                                              *(_WORD *)&buf[12] = 2080;
                                                                              *(_QWORD *)&buf[14] = "AzulBaseline";
                                                                              _os_log_impl(&dword_1A4F90000, v169, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                            }

                                                                            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64)
                                                                                                 + 8)
                                                                                     + 24) = +[MFMailMessageLibraryGlobalDataUpgradeStep runWithConnection:](MFMailMessageLibraryGlobalDataUpgradeStep, "runWithConnection:", v280) == 0;
                                                                            _HandleSQLiteError(v3, CFSTR("Adding global data table"));
                                                                            if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                          + 24))
                                                                            {
LABEL_392:
                                                                              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8)
                                                                                        + 24) = 180501;
                                                                              +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                              v170 = objc_claimAutoreleasedReturnValue();
                                                                              if (os_log_type_enabled(v170, OS_LOG_TYPE_DEFAULT))
                                                                              {
                                                                                *(_DWORD *)buf = 134218242;
                                                                                *(_QWORD *)&buf[4] = 180501;
                                                                                *(_WORD *)&buf[12] = 2080;
                                                                                *(_QWORD *)&buf[14] = "AzulAddMessageGlobalData";
                                                                                _os_log_impl(&dword_1A4F90000, v170, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                              }

                                                                              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                       + 24) = executeQuery(1, v3, "DELETE FROM message_metadata;",
                                                                                                   CFSTR("Removing all entries from message_metadata."));
                                                                              if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                            + 24))
                                                                              {
LABEL_395:
                                                                                *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8)
                                                                                          + 24) = 180502;
                                                                                +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                v171 = objc_claimAutoreleasedReturnValue();
                                                                                if (os_log_type_enabled(v171, OS_LOG_TYPE_DEFAULT))
                                                                                {
                                                                                  *(_DWORD *)buf = 134218242;
                                                                                  *(_QWORD *)&buf[4] = 180502;
                                                                                  *(_WORD *)&buf[12] = 2080;
                                                                                  *(_QWORD *)&buf[14] = "AzulResetMessageMetadata";
                                                                                  _os_log_impl(&dword_1A4F90000, v171, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                }

                                                                                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                         + 24) = objc_msgSend(MEMORY[0x1E0D1EA58], "runWithConnection:", v280) == 0;
                                                                                _HandleSQLiteError(v3, CFSTR("Adding remote_content_links table"));
                                                                                if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                              + 24))
                                                                                {
LABEL_398:
                                                                                  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8)
                                                                                            + 24) = 180503;
                                                                                  +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                  v172 = objc_claimAutoreleasedReturnValue();
                                                                                  if (os_log_type_enabled(v172, OS_LOG_TYPE_DEFAULT))
                                                                                  {
                                                                                    *(_DWORD *)buf = 134218242;
                                                                                    *(_QWORD *)&buf[4] = 180503;
                                                                                    *(_WORD *)&buf[12] = 2080;
                                                                                    *(_QWORD *)&buf[14] = "AzulAddRemoteContentLinksTable";
                                                                                    _os_log_impl(&dword_1A4F90000, v172, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                  }

                                                                                  if (v4 <= 180500
                                                                                    || (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                                 + 24) = +[MFMailMessageLibraryRecreateMessageIndicesUpgradeStep runWithConnection:](MFMailMessageLibraryRecreateMessageIndicesUpgradeStep, "runWithConnection:", v280)) != 0)
                                                                                  {
LABEL_402:
                                                                                    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8)
                                                                                              + 24) = 180504;
                                                                                    +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                    v173 = objc_claimAutoreleasedReturnValue();
                                                                                    if (os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT))
                                                                                    {
                                                                                      *(_DWORD *)buf = 134218242;
                                                                                      *(_QWORD *)&buf[4] = 180504;
                                                                                      *(_WORD *)&buf[12] = 2080;
                                                                                      *(_QWORD *)&buf[14] = "AzulRecreateMessageIndices";
                                                                                      _os_log_impl(&dword_1A4F90000, v173, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                    }

                                                                                    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                             + 24) = executeQuery(1, v3, "INSERT INTO properties (key, value) VALUES ('UseLegacyMessageIDHashFormat', 1) ON CONFLICT(key) DO UPDATE SET value = 1;", CFSTR("Inserting UseLegacyMessageIDHashFormat property."));
                                                                                    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                                  + 24))
                                                                                    {
LABEL_405:
                                                                                      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8)
                                                                                                + 24) = 180505;
                                                                                      +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                      v174 = objc_claimAutoreleasedReturnValue();
                                                                                      if (os_log_type_enabled(v174, OS_LOG_TYPE_DEFAULT))
                                                                                      {
                                                                                        *(_DWORD *)buf = 134218242;
                                                                                        *(_QWORD *)&buf[4] = 180505;
                                                                                        *(_WORD *)&buf[12] = 2080;
                                                                                        *(_QWORD *)&buf[14] = "AzulSetUseLegacyMessageIDHashFormat";
                                                                                        _os_log_impl(&dword_1A4F90000, v174, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                      }

                                                                                      objc_msgSend(*(id *)(a1 + 40), "noteNeedsSpotlightReindex");
LABEL_408:
                                                                                      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8)
                                                                                                + 24) = 180506;
                                                                                      +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                      v175 = objc_claimAutoreleasedReturnValue();
                                                                                      if (os_log_type_enabled(v175, OS_LOG_TYPE_DEFAULT))
                                                                                      {
                                                                                        *(_DWORD *)buf = 134218242;
                                                                                        *(_QWORD *)&buf[4] = 180506;
                                                                                        *(_WORD *)&buf[12] = 2080;
                                                                                        *(_QWORD *)&buf[14] = "AzulReindexMessagesMailMessageID";
                                                                                        _os_log_impl(&dword_1A4F90000, v175, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                      }

                                                                                      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                               + 24) = executeQuery(1, v3, "DROP TABLE IF EXISTS remote_content_links;", CFSTR("Removing remote_content_links table."));
                                                                                      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                      {
LABEL_411:
                                                                                        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8)
                                                                                                  + 24) = 180507;
                                                                                        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                        v176 = objc_claimAutoreleasedReturnValue();
                                                                                        if (os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT))
                                                                                        {
                                                                                          *(_DWORD *)buf = 134218242;
                                                                                          *(_QWORD *)&buf[4] = 180507;
                                                                                          *(_WORD *)&buf[12] = 2080;
                                                                                          *(_QWORD *)&buf[14] = "AzulRemoveRemoteContentLinksTable";
                                                                                          _os_log_impl(&dword_1A4F90000, v176, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                        }

                                                                                        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                                 + 24) = objc_msgSend(MEMORY[0x1E0D1EC40], "runWithConnection:", *(_QWORD *)(a1 + 48)) == 0;
                                                                                        _HandleSQLiteError(v3, CFSTR("Adding searchable_messages index"));
                                                                                        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                        {
LABEL_414:
                                                                                          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 180508;
                                                                                          +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                          v177 = objc_claimAutoreleasedReturnValue();
                                                                                          if (os_log_type_enabled(v177, OS_LOG_TYPE_DEFAULT))
                                                                                          {
                                                                                            *(_DWORD *)buf = 134218242;
                                                                                            *(_QWORD *)&buf[4] = 180508;
                                                                                            *(_WORD *)&buf[12] = 2080;
                                                                                            *(_QWORD *)&buf[14] = "AzulUpdateSearchableMessagesIndex";
                                                                                            _os_log_impl(&dword_1A4F90000, v177, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                          }

                                                                                          if (v4 <= 180500
                                                                                            || (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _UpdateGlobalIDIndex(*(void **)(a1 + 48)),
                                                                                                _HandleSQLiteError(v3, CFSTR("Updating globalMessageID index")), *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)))
                                                                                          {
LABEL_418:
                                                                                            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 180509;
                                                                                            +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                            v178 = objc_claimAutoreleasedReturnValue();
                                                                                            if (os_log_type_enabled(v178, OS_LOG_TYPE_DEFAULT))
                                                                                            {
                                                                                              *(_DWORD *)buf = 134218242;
                                                                                              *(_QWORD *)&buf[4] = 180509;
                                                                                              *(_WORD *)&buf[12] = 2080;
                                                                                              *(_QWORD *)&buf[14] = "AzulUpdateGlobalMessageIDIndex";
                                                                                              _os_log_impl(&dword_1A4F90000, v178, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                            }

                                                                                            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EA58], "runWithConnection:", v280) == 0;
                                                                                            _HandleSQLiteError(v3, CFSTR("Adding remote_content_links table"));
                                                                                            if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                            {
LABEL_421:
                                                                                              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 190001;
                                                                                              +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                              v179 = objc_claimAutoreleasedReturnValue();
                                                                                              if (os_log_type_enabled(v179, OS_LOG_TYPE_DEFAULT))
                                                                                              {
                                                                                                *(_DWORD *)buf = 134218242;
                                                                                                *(_QWORD *)&buf[4] = 190001;
                                                                                                *(_WORD *)&buf[12] = 2080;
                                                                                                *(_QWORD *)&buf[14] = "SkyAddRemoteContentLinksTable";
                                                                                                _os_log_impl(&dword_1A4F90000, v179, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                              }

LABEL_424:
                                                                                              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 190002;
                                                                                              +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                              v180 = objc_claimAutoreleasedReturnValue();
                                                                                              if (os_log_type_enabled(v180, OS_LOG_TYPE_DEFAULT))
                                                                                              {
                                                                                                *(_DWORD *)buf = 134218242;
                                                                                                *(_QWORD *)&buf[4] = 190002;
                                                                                                *(_WORD *)&buf[12] = 2080;
                                                                                                *(_QWORD *)&buf[14] = "SkyMigrateRemoteContentDefault";
                                                                                                _os_log_impl(&dword_1A4F90000, v180, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                              }

LABEL_427:
                                                                                              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 190003;
                                                                                              +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                              v181 = objc_claimAutoreleasedReturnValue();
                                                                                              if (os_log_type_enabled(v181, OS_LOG_TYPE_DEFAULT))
                                                                                              {
                                                                                                *(_DWORD *)buf = 134218242;
                                                                                                *(_QWORD *)&buf[4] = 190003;
                                                                                                *(_WORD *)&buf[12] = 2080;
                                                                                                *(_QWORD *)&buf[14] = "SkyBogusStep";
                                                                                                _os_log_impl(&dword_1A4F90000, v181, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                              }

LABEL_430:
                                                                                              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 190004;
                                                                                              +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                              v182 = objc_claimAutoreleasedReturnValue();
                                                                                              if (os_log_type_enabled(v182, OS_LOG_TYPE_DEFAULT))
                                                                                              {
                                                                                                *(_DWORD *)buf = 134218242;
                                                                                                *(_QWORD *)&buf[4] = 190004;
                                                                                                *(_WORD *)&buf[12] = 2080;
                                                                                                *(_QWORD *)&buf[14] = "SkyBogusStep2";
                                                                                                _os_log_impl(&dword_1A4F90000, v182, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                              }

                                                                                              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EC58], "runWithConnection:", *(_QWORD *)(a1 + 48)) == 0;
                                                                                              _HandleSQLiteError(v3, CFSTR("Adding message_attachments table and update attachment table"));
                                                                                              if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                              {
LABEL_433:
                                                                                                *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 190005;
                                                                                                +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                v183 = objc_claimAutoreleasedReturnValue();
                                                                                                if (os_log_type_enabled(v183, OS_LOG_TYPE_DEFAULT))
                                                                                                {
                                                                                                  *(_DWORD *)buf = 134218242;
                                                                                                  *(_QWORD *)&buf[4] = 190005;
                                                                                                  *(_WORD *)&buf[12] = 2080;
                                                                                                  *(_QWORD *)&buf[14] = "SkyAddMessageAttachmentsAndUpdateAttachmentsTable";
                                                                                                  _os_log_impl(&dword_1A4F90000, v183, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                }

                                                                                                objc_msgSend(*(id *)(a1 + 40), "noteNeedsSpotlightReindex");
LABEL_436:
                                                                                                *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 190006;
                                                                                                +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                v184 = objc_claimAutoreleasedReturnValue();
                                                                                                if (os_log_type_enabled(v184, OS_LOG_TYPE_DEFAULT))
                                                                                                {
                                                                                                  *(_DWORD *)buf = 134218242;
                                                                                                  *(_QWORD *)&buf[4] = 190006;
                                                                                                  *(_WORD *)&buf[12] = 2080;
                                                                                                  *(_QWORD *)&buf[14] = "SkyBIndexSpotlightWithGlobalMessageID";
                                                                                                  _os_log_impl(&dword_1A4F90000, v184, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                }

                                                                                                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EA48], "runWithConnection:", *(_QWORD *)(a1 + 48)) == 0;
                                                                                                _HandleSQLiteError(v3, CFSTR("Adding read_later table"));
                                                                                                if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                {
LABEL_439:
                                                                                                  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 200001;
                                                                                                  +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                  v185 = objc_claimAutoreleasedReturnValue();
                                                                                                  if (os_log_type_enabled(v185, OS_LOG_TYPE_DEFAULT))
                                                                                                  {
                                                                                                    *(_DWORD *)buf = 134218242;
                                                                                                    *(_QWORD *)&buf[4] = 200001;
                                                                                                    *(_WORD *)&buf[12] = 2080;
                                                                                                    *(_QWORD *)&buf[14] = "SydneyAddReadLaterTable";
                                                                                                    _os_log_impl(&dword_1A4F90000, v185, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                  }

                                                                                                  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EA90], "runWithConnection:", *(_QWORD *)(a1 + 48)) == 0;
                                                                                                  _HandleSQLiteError(v3, CFSTR("Adding unsubscribe_type column"));
                                                                                                  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                  {
LABEL_442:
                                                                                                    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 200002;
                                                                                                    +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                    v186 = objc_claimAutoreleasedReturnValue();
                                                                                                    if (os_log_type_enabled(v186, OS_LOG_TYPE_DEFAULT))
                                                                                                    {
                                                                                                      *(_DWORD *)buf = 134218242;
                                                                                                      *(_QWORD *)&buf[4] = 200002;
                                                                                                      *(_WORD *)&buf[12] = 2080;
                                                                                                      *(_QWORD *)&buf[14] = "SydneyAddUnsubscribeFlags";
                                                                                                      _os_log_impl(&dword_1A4F90000, v186, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                    }

                                                                                                    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EA70], "runWithConnection:", *(_QWORD *)(a1 + 48)) == 0;
                                                                                                    _HandleSQLiteError(v3, CFSTR("Adding send_later table"));
                                                                                                    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                    {
LABEL_445:
                                                                                                      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 200003;
                                                                                                      +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                      v187 = objc_claimAutoreleasedReturnValue();
                                                                                                      if (os_log_type_enabled(v187, OS_LOG_TYPE_DEFAULT))
                                                                                                      {
                                                                                                        *(_DWORD *)buf = 134218242;
                                                                                                        *(_QWORD *)&buf[4] = 200003;
                                                                                                        *(_WORD *)&buf[12] = 2080;
                                                                                                        *(_QWORD *)&buf[14] = "SydneyAddSendLaterTable";
                                                                                                        _os_log_impl(&dword_1A4F90000, v187, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                      }

LABEL_448:
                                                                                                      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 200004;
                                                                                                      +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                      v188 = objc_claimAutoreleasedReturnValue();
                                                                                                      if (os_log_type_enabled(v188, OS_LOG_TYPE_DEFAULT))
                                                                                                      {
                                                                                                        *(_DWORD *)buf = 134218242;
                                                                                                        *(_QWORD *)&buf[4] = 200004;
                                                                                                        *(_WORD *)&buf[12] = 2080;
                                                                                                        *(_QWORD *)&buf[14] = "SydneyAddDataDetectionTable";
                                                                                                        _os_log_impl(&dword_1A4F90000, v188, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                      }

                                                                                                      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = +[MFMailMessageLibraryAddMailboxActionsUpgradeStep runWithConnection:](MFMailMessageLibraryAddMailboxActionsUpgradeStep, "runWithConnection:", *(_QWORD *)(a1 + 48)) == 0;
LABEL_451:
                                                                                                      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 200005;
                                                                                                      +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                      v189 = objc_claimAutoreleasedReturnValue();
                                                                                                      if (os_log_type_enabled(v189, OS_LOG_TYPE_DEFAULT))
                                                                                                      {
                                                                                                        *(_DWORD *)buf = 134218242;
                                                                                                        *(_QWORD *)&buf[4] = 200005;
                                                                                                        *(_WORD *)&buf[12] = 2080;
                                                                                                        *(_QWORD *)&buf[14] = "SydneyAddMailboxActionsTable";
                                                                                                        _os_log_impl(&dword_1A4F90000, v189, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                      }

                                                                                                      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EA68], "runWithConnection:", *(_QWORD *)(a1 + 48)) == 0;
                                                                                                      _HandleSQLiteError(v3, CFSTR("Adding searchable data detection table"));
                                                                                                      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                      {
LABEL_454:
                                                                                                        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 200006;
                                                                                                        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                        v190 = objc_claimAutoreleasedReturnValue();
                                                                                                        if (os_log_type_enabled(v190, OS_LOG_TYPE_DEFAULT))
                                                                                                        {
                                                                                                          *(_DWORD *)buf = 134218242;
                                                                                                          *(_QWORD *)&buf[4] = 200006;
                                                                                                          *(_WORD *)&buf[12] = 2080;
                                                                                                          *(_QWORD *)&buf[14] = "SydneyAddSearchableDataDetectionTable";
                                                                                                          _os_log_impl(&dword_1A4F90000, v190, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                        }

                                                                                                        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EA20], "runWithConnection:", *(_QWORD *)(a1 + 48)) == 0;
                                                                                                        _HandleSQLiteError(v3, CFSTR("Adding brand_indicator column to messages table"));
                                                                                                        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                        {
LABEL_457:
                                                                                                          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 200007;
                                                                                                          +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                          v191 = objc_claimAutoreleasedReturnValue();
                                                                                                          if (os_log_type_enabled(v191, OS_LOG_TYPE_DEFAULT))
                                                                                                          {
                                                                                                            *(_DWORD *)buf = 134218242;
                                                                                                            *(_QWORD *)&buf[4] = 200007;
                                                                                                            *(_WORD *)&buf[12] = 2080;
                                                                                                            *(_QWORD *)&buf[14] = "SydneyAddBrandIndicatorTable";
                                                                                                            _os_log_impl(&dword_1A4F90000, v191, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                          }

                                                                                                          objc_msgSend(*(id *)(a1 + 40), "noteNeedsSpotlightReindex");
LABEL_460:
                                                                                                          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 200008;
                                                                                                          +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                          v192 = objc_claimAutoreleasedReturnValue();
                                                                                                          if (os_log_type_enabled(v192, OS_LOG_TYPE_DEFAULT))
                                                                                                          {
                                                                                                            *(_DWORD *)buf = 134218242;
                                                                                                            *(_QWORD *)&buf[4] = 200008;
                                                                                                            *(_WORD *)&buf[12] = 2080;
                                                                                                            *(_QWORD *)&buf[14] = "SydneyReindexSenderAttachmentItems";
                                                                                                            _os_log_impl(&dword_1A4F90000, v192, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                          }

                                                                                                          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EA30], "runWithConnection:", *(_QWORD *)(a1 + 48)) == 0;
                                                                                                          _HandleSQLiteError(v3, CFSTR("Adding follow_up_date column to message_global_data table"));
                                                                                                          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                          {
LABEL_463:
                                                                                                            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 200009;
                                                                                                            +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                            v193 = objc_claimAutoreleasedReturnValue();
                                                                                                            if (os_log_type_enabled(v193, OS_LOG_TYPE_DEFAULT))
                                                                                                            {
                                                                                                              *(_DWORD *)buf = 134218242;
                                                                                                              *(_QWORD *)&buf[4] = 200009;
                                                                                                              *(_WORD *)&buf[12] = 2080;
                                                                                                              *(_QWORD *)&buf[14] = "SydneyAddMessagesFollowUpColumnUpgradeStep";
                                                                                                              _os_log_impl(&dword_1A4F90000, v193, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                            }

LABEL_466:
                                                                                                            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 200010;
                                                                                                            +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                            v194 = objc_claimAutoreleasedReturnValue();
                                                                                                            if (os_log_type_enabled(v194, OS_LOG_TYPE_DEFAULT))
                                                                                                            {
                                                                                                              *(_DWORD *)buf = 134218242;
                                                                                                              *(_QWORD *)&buf[4] = 200010;
                                                                                                              *(_WORD *)&buf[12] = 2080;
                                                                                                              *(_QWORD *)&buf[14] = "SydneyAddSendersTableUpgradeStep";
                                                                                                              _os_log_impl(&dword_1A4F90000, v194, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                            }

                                                                                                            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EA80], "runWithConnection:", *(_QWORD *)(a1 + 48)) == 0;
                                                                                                            _HandleSQLiteError(v3, CFSTR("Adding senders and sender_addresses tables"));
                                                                                                            if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                            {
LABEL_469:
                                                                                                              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 200011;
                                                                                                              +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                              v195 = objc_claimAutoreleasedReturnValue();
                                                                                                              if (os_log_type_enabled(v195, OS_LOG_TYPE_DEFAULT))
                                                                                                              {
                                                                                                                *(_DWORD *)buf = 134218242;
                                                                                                                *(_QWORD *)&buf[4] = 200011;
                                                                                                                *(_WORD *)&buf[12] = 2080;
                                                                                                                *(_QWORD *)&buf[14] = "SydneyRepopulateSendersTableUpgradeStep";
                                                                                                                _os_log_impl(&dword_1A4F90000, v195, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                              }

                                                                                                              if (!_protectedIndexHasBeenInitialized(*(void **)(a1 + 48)) || (v196 = (void *)MEMORY[0x1E0D1E9D0], v197 = *(_QWORD *)(a1 + 48), +[MFProtectedDatabasePersistence_iOS protectedDatabaseName](MFProtectedDatabasePersistence_iOS, "protectedDatabaseName"), v198 = (void *)objc_claimAutoreleasedReturnValue(), *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v196, "runWithConnection:databaseName:", v197, v198) == 0, v198, _HandleSQLiteError(v3, CFSTR("Re-adding brand_indicators table")), *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)))
                                                                                                              {
LABEL_473:
                                                                                                                *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 200012;
                                                                                                                +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                v199 = objc_claimAutoreleasedReturnValue();
                                                                                                                if (os_log_type_enabled(v199, OS_LOG_TYPE_DEFAULT))
                                                                                                                {
                                                                                                                  *(_DWORD *)buf = 134218242;
                                                                                                                  *(_QWORD *)&buf[4] = 200012;
                                                                                                                  *(_WORD *)&buf[12] = 2080;
                                                                                                                  *(_QWORD *)&buf[14] = "SydneyReAddBrandIndicatorsTableUpgradeStep";
                                                                                                                  _os_log_impl(&dword_1A4F90000, v199, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                }

                                                                                                                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = executeQuery(1, v3, "DROP INDEX IF EXISTS brand_indicators_indicator_url_indicator_hash_hash_algorithm_index;", CFSTR("Removing brand_indicators_indicator_url_indicator_hash_hash_algorithm_index."));
                                                                                                                if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                                {
LABEL_476:
                                                                                                                  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 200013;
                                                                                                                  +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                  v200 = objc_claimAutoreleasedReturnValue();
                                                                                                                  if (os_log_type_enabled(v200, OS_LOG_TYPE_DEFAULT))
                                                                                                                  {
                                                                                                                    *(_DWORD *)buf = 134218242;
                                                                                                                    *(_QWORD *)&buf[4] = 200013;
                                                                                                                    *(_WORD *)&buf[12] = 2080;
                                                                                                                    *(_QWORD *)&buf[14] = "SydneyRemoveIncompatibleBrandIndicatorsIndexUpgradeStep";
                                                                                                                    _os_log_impl(&dword_1A4F90000, v200, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                  }

                                                                                                                  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = executeQuery(1, v3, "ALTER TABLE mailbox_actions ADD COLUMN new_mailbox_name TEXT;", CFSTR("Adding new_mailbox_name column."));
                                                                                                                  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                                  {
LABEL_479:
                                                                                                                    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 200014;
                                                                                                                    +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                    v201 = objc_claimAutoreleasedReturnValue();
                                                                                                                    if (os_log_type_enabled(v201, OS_LOG_TYPE_DEFAULT))
                                                                                                                    {
                                                                                                                      *(_DWORD *)buf = 134218242;
                                                                                                                      *(_QWORD *)&buf[4] = 200014;
                                                                                                                      *(_WORD *)&buf[12] = 2080;
                                                                                                                      *(_QWORD *)&buf[14] = "SydneyAddMailboxRenameActionStep";
                                                                                                                      _os_log_impl(&dword_1A4F90000, v201, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                    }

                                                                                                                    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EA50], "runWithConnection:", *(_QWORD *)(a1 + 48)) == 0;
                                                                                                                    _HandleSQLiteError(v3, CFSTR("Adding rebuild table"));
                                                                                                                    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                                    {
LABEL_482:
                                                                                                                      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 200015;
                                                                                                                      +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                      v202 = objc_claimAutoreleasedReturnValue();
                                                                                                                      if (os_log_type_enabled(v202, OS_LOG_TYPE_DEFAULT))
                                                                                                                      {
                                                                                                                        *(_DWORD *)buf = 134218242;
                                                                                                                        *(_QWORD *)&buf[4] = 200015;
                                                                                                                        *(_WORD *)&buf[12] = 2080;
                                                                                                                        *(_QWORD *)&buf[14] = "SydneyAddRebuildTableUpgradeStep";
                                                                                                                        _os_log_impl(&dword_1A4F90000, v202, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                      }

                                                                                                                      objc_msgSend(*(id *)(a1 + 40), "noteNeedsSpotlightReindex");
                                                                                                                      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
LABEL_485:
                                                                                                                      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 200016;
                                                                                                                      +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                      v203 = objc_claimAutoreleasedReturnValue();
                                                                                                                      if (os_log_type_enabled(v203, OS_LOG_TYPE_DEFAULT))
                                                                                                                      {
                                                                                                                        *(_DWORD *)buf = 134218242;
                                                                                                                        *(_QWORD *)&buf[4] = 200016;
                                                                                                                        *(_WORD *)&buf[12] = 2080;
                                                                                                                        *(_QWORD *)&buf[14] = "SydneyTriggerSpotlightReIndexUpgradeStep";
                                                                                                                        _os_log_impl(&dword_1A4F90000, v203, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                      }

                                                                                                                      v204 = *(id *)(a1 + 48);
                                                                                                                      if (objc_msgSend(MEMORY[0x1E0D1E9E8], "runWithConnection:", v204))
                                                                                                                        v205 = 0;
                                                                                                                      else
                                                                                                                        v205 = sqlite3_exec((sqlite3 *)objc_msgSend(v204, "sqlDB"), "CREATE INDEX IF NOT EXISTS messages_mailbox_deleted_display_date_index ON messages(mailbox, deleted, display_date) WHERE journaled = 0;CREATE INDEX IF NOT EXISTS messages_deleted_conversation_id_display_date_index ON messages(deleted, conversation_id, display_date);", 0, 0, 0) == 0;

                                                                                                                      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v205;
                                                                                                                      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                                      {
LABEL_491:
                                                                                                                        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 200017;
                                                                                                                        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                        v206 = objc_claimAutoreleasedReturnValue();
                                                                                                                        if (os_log_type_enabled(v206, OS_LOG_TYPE_DEFAULT))
                                                                                                                        {
                                                                                                                          *(_DWORD *)buf = 134218242;
                                                                                                                          *(_QWORD *)&buf[4] = 200017;
                                                                                                                          *(_WORD *)&buf[12] = 2080;
                                                                                                                          *(_QWORD *)&buf[14] = "SydneyAddDisplayDateColumnUpgradeStep";
                                                                                                                          _os_log_impl(&dword_1A4F90000, v206, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                        }

LABEL_494:
                                                                                                                        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 200018;
                                                                                                                        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                        v207 = objc_claimAutoreleasedReturnValue();
                                                                                                                        if (os_log_type_enabled(v207, OS_LOG_TYPE_DEFAULT))
                                                                                                                        {
                                                                                                                          *(_DWORD *)buf = 134218242;
                                                                                                                          *(_QWORD *)&buf[4] = 200018;
                                                                                                                          *(_WORD *)&buf[12] = 2080;
                                                                                                                          *(_QWORD *)&buf[14] = "SydneyAddRichLinkTable";
                                                                                                                          _os_log_impl(&dword_1A4F90000, v207, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                        }

                                                                                                                        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EA60], "runWithConnection:", *(_QWORD *)(a1 + 48)) == 0;
                                                                                                                        _HandleSQLiteError(v3, CFSTR("Adding rich links table"));
                                                                                                                        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                                        {
LABEL_497:
                                                                                                                          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 200019;
                                                                                                                          +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                          v208 = objc_claimAutoreleasedReturnValue();
                                                                                                                          if (os_log_type_enabled(v208, OS_LOG_TYPE_DEFAULT))
                                                                                                                          {
                                                                                                                            *(_DWORD *)buf = 134218242;
                                                                                                                            *(_QWORD *)&buf[4] = 200019;
                                                                                                                            *(_WORD *)&buf[12] = 2080;
                                                                                                                            *(_QWORD *)&buf[14] = "SydneyAddSearchableRichLinkTable";
                                                                                                                            _os_log_impl(&dword_1A4F90000, v208, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                          }

                                                                                                                          if (!_protectedIndexHasBeenInitialized(*(void **)(a1 + 48)) || (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = +[MFMailMessageLibraryPopulateSendersTableMigrationStep runWithConnection:](MFMailMessageLibraryPopulateSendersTableMigrationStep, "runWithConnection:", *(_QWORD *)(a1 + 48)) == 0, _HandleSQLiteError(v3, CFSTR("Populating senders and sender_addresses tables")), *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)))
                                                                                                                          {
LABEL_501:
                                                                                                                            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 200020;
                                                                                                                            +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                            v209 = objc_claimAutoreleasedReturnValue();
                                                                                                                            if (os_log_type_enabled(v209, OS_LOG_TYPE_DEFAULT))
                                                                                                                            {
                                                                                                                              *(_DWORD *)buf = 134218242;
                                                                                                                              *(_QWORD *)&buf[4] = 200020;
                                                                                                                              *(_WORD *)&buf[12] = 2080;
                                                                                                                              *(_QWORD *)&buf[14] = "SydneyRepopulateSendersTableUpgradeStep2";
                                                                                                                              _os_log_impl(&dword_1A4F90000, v209, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                            }

                                                                                                                            objc_msgSend(*(id *)(a1 + 40), "noteNeedsSpotlightReindex");
                                                                                                                            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
LABEL_504:
                                                                                                                            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 200021;
                                                                                                                            +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                            v210 = objc_claimAutoreleasedReturnValue();
                                                                                                                            if (os_log_type_enabled(v210, OS_LOG_TYPE_DEFAULT))
                                                                                                                            {
                                                                                                                              *(_DWORD *)buf = 134218242;
                                                                                                                              *(_QWORD *)&buf[4] = 200021;
                                                                                                                              *(_WORD *)&buf[12] = 2080;
                                                                                                                              *(_QWORD *)&buf[14] = "SydneyAddSearchableFlagColorsUpgradeStep";
                                                                                                                              _os_log_impl(&dword_1A4F90000, v210, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                            }

                                                                                                                            objc_msgSend(*(id *)(a1 + 40), "noteNeedsSpotlightReindex");
                                                                                                                            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
LABEL_507:
                                                                                                                            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 200022;
                                                                                                                            +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                            v211 = objc_claimAutoreleasedReturnValue();
                                                                                                                            if (os_log_type_enabled(v211, OS_LOG_TYPE_DEFAULT))
                                                                                                                            {
                                                                                                                              *(_DWORD *)buf = 134218242;
                                                                                                                              *(_QWORD *)&buf[4] = 200022;
                                                                                                                              *(_WORD *)&buf[12] = 2080;
                                                                                                                              *(_QWORD *)&buf[14] = "SydneyAddSearchableMailAttachmentTypeUpgradeStep";
                                                                                                                              _os_log_impl(&dword_1A4F90000, v211, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                            }

                                                                                                                            if (v4 > 200002)
                                                                                                                            {
                                                                                                                              _resetLocalAccountMboxCache();
                                                                                                                              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
                                                                                                                            }
LABEL_511:
                                                                                                                            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 200023;
                                                                                                                            +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                            v212 = objc_claimAutoreleasedReturnValue();
                                                                                                                            if (os_log_type_enabled(v212, OS_LOG_TYPE_DEFAULT))
                                                                                                                            {
                                                                                                                              *(_DWORD *)buf = 134218242;
                                                                                                                              *(_QWORD *)&buf[4] = 200023;
                                                                                                                              *(_WORD *)&buf[12] = 2080;
                                                                                                                              *(_QWORD *)&buf[14] = "SydneyCleanUpLocalMboxCacheUpgradeStep";
                                                                                                                              _os_log_impl(&dword_1A4F90000, v212, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                            }

                                                                                                                            v213 = *(id *)(a1 + 48);
                                                                                                                            v214 = sqlite3_exec((sqlite3 *)objc_msgSend(v213, "sqlDB"), "ALTER TABLE threads ADD COLUMN display_date INTEGER NOT NULL DEFAULT 0;UPDATE threads SET display_date = date;CREATE INDEX IF NOT EXISTS threads_scope_display_date_conversation_index ON threads(scope, display_date, conversation);", 0, 0, 0) == 0;

                                                                                                                            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v214;
                                                                                                                            if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                                            {
LABEL_514:
                                                                                                                              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 200024;
                                                                                                                              +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                              v215 = objc_claimAutoreleasedReturnValue();
                                                                                                                              if (os_log_type_enabled(v215, OS_LOG_TYPE_DEFAULT))
                                                                                                                              {
                                                                                                                                *(_DWORD *)buf = 134218242;
                                                                                                                                *(_QWORD *)&buf[4] = 200024;
                                                                                                                                *(_WORD *)&buf[12] = 2080;
                                                                                                                                *(_QWORD *)&buf[14] = "SydneyAddThreadsDisplayDateColumn";
                                                                                                                                _os_log_impl(&dword_1A4F90000, v215, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                              }

                                                                                                                              if (v4 >= 200000 || (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _AddFilterPredicateToInboxThreadScopes(*(void **)(a1 + 48), 1)) != 0)
                                                                                                                              {
LABEL_518:
                                                                                                                                *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 200025;
                                                                                                                                +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                v216 = objc_claimAutoreleasedReturnValue();
                                                                                                                                if (os_log_type_enabled(v216, OS_LOG_TYPE_DEFAULT))
                                                                                                                                {
                                                                                                                                  *(_DWORD *)buf = 134218242;
                                                                                                                                  *(_QWORD *)&buf[4] = 200025;
                                                                                                                                  *(_WORD *)&buf[12] = 2080;
                                                                                                                                  *(_QWORD *)&buf[14] = "SydneySetThreadScopePredicateFilter";
                                                                                                                                  _os_log_impl(&dword_1A4F90000, v216, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                }

                                                                                                                                v217 = *(id *)(a1 + 48);
                                                                                                                                v218 = sqlite3_exec((sqlite3 *)objc_msgSend(v217, "sqlDB"), "ALTER TABLE message_global_data ADD COLUMN follow_up_jsonstringformodelevaluationforsuggestions TEXT COLLATE BINARY;CREATE INDEX IF NOT EXISTS message_global_data_follow_up_jsonstringformodelevaluationforsuggestions_index ON message_global_data(follow_up_jsonstringformodelevaluationforsuggestions);", 0, 0, 0) == 0;

                                                                                                                                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v218;
                                                                                                                                if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                                                {
LABEL_521:
                                                                                                                                  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 200026;
                                                                                                                                  +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                  v219 = objc_claimAutoreleasedReturnValue();
                                                                                                                                  if (os_log_type_enabled(v219, OS_LOG_TYPE_DEFAULT))
                                                                                                                                  {
                                                                                                                                    *(_DWORD *)buf = 134218242;
                                                                                                                                    *(_QWORD *)&buf[4] = 200026;
                                                                                                                                    *(_WORD *)&buf[12] = 2080;
                                                                                                                                    *(_QWORD *)&buf[14] = "SydneyAddFollowUpJsonStringForModelEvaluationForSuggestionsColumnUpgradeStep";
                                                                                                                                    _os_log_impl(&dword_1A4F90000, v219, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                  }

                                                                                                                                  v220 = (void *)MEMORY[0x1E0D1EA98];
                                                                                                                                  objc_msgSend(MEMORY[0x1E0D1E2B8], "baseMailDirectory");
                                                                                                                                  v221 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                                  objc_msgSend(v220, "attachmentDirectoryURLWithBasePath:", v221);
                                                                                                                                  v222 = (void *)objc_claimAutoreleasedReturnValue();

                                                                                                                                  v223 = -[MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep initWithBaseAttachmentsDirectory:]([MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep alloc], "initWithBaseAttachmentsDirectory:", v222);
                                                                                                                                  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = -[MFMessageLibrarySetContentProtectionForAttachmentsUpgradeStep performMigrationStep](v223, "performMigrationStep");
                                                                                                                                  v224 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) == 0;

                                                                                                                                  if (!v224)
                                                                                                                                  {
LABEL_524:
                                                                                                                                    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 200027;
                                                                                                                                    +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                    v225 = objc_claimAutoreleasedReturnValue();
                                                                                                                                    if (os_log_type_enabled(v225, OS_LOG_TYPE_DEFAULT))
                                                                                                                                    {
                                                                                                                                      *(_DWORD *)buf = 134218242;
                                                                                                                                      *(_QWORD *)&buf[4] = 200027;
                                                                                                                                      *(_WORD *)&buf[12] = 2080;
                                                                                                                                      *(_QWORD *)&buf[14] = "SydneyMarkAttachmentsAsClassBProtected";
                                                                                                                                      _os_log_impl(&dword_1A4F90000, v225, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                    }

LABEL_527:
                                                                                                                                    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 200028;
                                                                                                                                    +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                    v226 = objc_claimAutoreleasedReturnValue();
                                                                                                                                    if (os_log_type_enabled(v226, OS_LOG_TYPE_DEFAULT))
                                                                                                                                    {
                                                                                                                                      *(_DWORD *)buf = 134218242;
                                                                                                                                      *(_QWORD *)&buf[4] = 200028;
                                                                                                                                      *(_WORD *)&buf[12] = 2080;
                                                                                                                                      *(_QWORD *)&buf[14] = "SydneyAddDownloadStateToMessageGlobalDataUpgradeStep";
                                                                                                                                      _os_log_impl(&dword_1A4F90000, v226, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                    }

                                                                                                                                    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EBC8], "runWithConnection:", *(_QWORD *)(a1 + 48)) == 0;
                                                                                                                                    _HandleSQLiteError(v3, CFSTR("Removing send later and read later tables"));
                                                                                                                                    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                                                    {
LABEL_530:
                                                                                                                                      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 210001;
                                                                                                                                      +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                      v227 = objc_claimAutoreleasedReturnValue();
                                                                                                                                      if (os_log_type_enabled(v227, OS_LOG_TYPE_DEFAULT))
                                                                                                                                      {
                                                                                                                                        *(_DWORD *)buf = 134218242;
                                                                                                                                        *(_QWORD *)&buf[4] = 210001;
                                                                                                                                        *(_WORD *)&buf[12] = 2080;
                                                                                                                                        *(_QWORD *)&buf[14] = "DawnDropReadAndSendLaterTables";
                                                                                                                                        _os_log_impl(&dword_1A4F90000, v227, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                      }

                                                                                                                                      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1E9F8], "runWithConnection:", *(_QWORD *)(a1 + 48)) == 0;
                                                                                                                                      _HandleSQLiteError(v3, CFSTR("Adding download state to message_global_data"));
                                                                                                                                      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                                                      {
LABEL_533:
                                                                                                                                        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 210002;
                                                                                                                                        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                        v228 = objc_claimAutoreleasedReturnValue();
                                                                                                                                        if (os_log_type_enabled(v228, OS_LOG_TYPE_DEFAULT))
                                                                                                                                        {
                                                                                                                                          *(_DWORD *)buf = 134218242;
                                                                                                                                          *(_QWORD *)&buf[4] = 210002;
                                                                                                                                          *(_WORD *)&buf[12] = 2080;
                                                                                                                                          *(_QWORD *)&buf[14] = "DawnAddDownloadStateToMessageGlobalDataUpgradeStep";
                                                                                                                                          _os_log_impl(&dword_1A4F90000, v228, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                        }

LABEL_536:
                                                                                                                                        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 210003;
                                                                                                                                        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                        v229 = objc_claimAutoreleasedReturnValue();
                                                                                                                                        if (os_log_type_enabled(v229, OS_LOG_TYPE_DEFAULT))
                                                                                                                                        {
                                                                                                                                          *(_DWORD *)buf = 134218242;
                                                                                                                                          *(_QWORD *)&buf[4] = 210003;
                                                                                                                                          *(_WORD *)&buf[12] = 2080;
                                                                                                                                          *(_QWORD *)&buf[14] = "DawnEncryptedMailAddressMetadataUpgradeStep";
                                                                                                                                          _os_log_impl(&dword_1A4F90000, v229, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                        }

                                                                                                                                        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EA10], "runWithConnection:", *(_QWORD *)(a1 + 48)) == 0;
                                                                                                                                        _HandleSQLiteError(v3, CFSTR("Adding download state to message_global_data"));
                                                                                                                                        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                                                        {
LABEL_539:
                                                                                                                                          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 210004;
                                                                                                                                          +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                          v230 = objc_claimAutoreleasedReturnValue();
                                                                                                                                          if (os_log_type_enabled(v230, OS_LOG_TYPE_DEFAULT))
                                                                                                                                          {
                                                                                                                                            *(_DWORD *)buf = 134218242;
                                                                                                                                            *(_QWORD *)&buf[4] = 210004;
                                                                                                                                            *(_WORD *)&buf[12] = 2080;
                                                                                                                                            *(_QWORD *)&buf[14] = "DawnMailboxDatabaseIDInActionsUpgradeStep";
                                                                                                                                            _os_log_impl(&dword_1A4F90000, v230, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                          }

                                                                                                                                          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EAE0], "runWithConnection:", *(_QWORD *)(a1 + 48)) == 0;
                                                                                                                                          _HandleSQLiteError(v3, CFSTR("Removing messages_read_index"));
                                                                                                                                          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                                                          {
LABEL_542:
                                                                                                                                            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 210005;
                                                                                                                                            +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                            v231 = objc_claimAutoreleasedReturnValue();
                                                                                                                                            if (os_log_type_enabled(v231, OS_LOG_TYPE_DEFAULT))
                                                                                                                                            {
                                                                                                                                              *(_DWORD *)buf = 134218242;
                                                                                                                                              *(_QWORD *)&buf[4] = 210005;
                                                                                                                                              *(_WORD *)&buf[12] = 2080;
                                                                                                                                              *(_QWORD *)&buf[14] = "DawnDropMessagesReadIndexUpgradeStep";
                                                                                                                                              _os_log_impl(&dword_1A4F90000, v231, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                            }

                                                                                                                                            if (v4 <= 210000 || (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EC80], "runWithConnection:", *(_QWORD *)(a1 + 48)) == 0, _HandleSQLiteError(v3, CFSTR("Truncate mailboxes to 10K messages")), *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)))
                                                                                                                                            {
LABEL_546:
                                                                                                                                              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 210006;
                                                                                                                                              +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                              v232 = objc_claimAutoreleasedReturnValue();
                                                                                                                                              if (os_log_type_enabled(v232, OS_LOG_TYPE_DEFAULT))
                                                                                                                                              {
                                                                                                                                                *(_DWORD *)buf = 134218242;
                                                                                                                                                *(_QWORD *)&buf[4] = 210006;
                                                                                                                                                *(_WORD *)&buf[12] = 2080;
                                                                                                                                                *(_QWORD *)&buf[14] = "DawnCheckMailboxSize";
                                                                                                                                                _os_log_impl(&dword_1A4F90000, v232, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                              }

                                                                                                                                              v233 = *(id *)(a1 + 48);
                                                                                                                                              v234 = sqlite3_exec((sqlite3 *)objc_msgSend(v233, "sqlDB"), "CREATE INDEX IF NOT EXISTS messages_read_deleted_global_message_id_mailbox_read0_deleted0_index ON messages(read, deleted, global_message_id, mailbox) WHERE (read = 0 AND deleted = 0);", 0, 0, 0) == 0;

                                                                                                                                              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v234;
                                                                                                                                              if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                                                              {
LABEL_549:
                                                                                                                                                *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 212001;
                                                                                                                                                +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                                v235 = objc_claimAutoreleasedReturnValue();
                                                                                                                                                if (os_log_type_enabled(v235, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                {
                                                                                                                                                  *(_DWORD *)buf = 134218242;
                                                                                                                                                  *(_QWORD *)&buf[4] = 212001;
                                                                                                                                                  *(_WORD *)&buf[12] = 2080;
                                                                                                                                                  *(_QWORD *)&buf[14] = "DawnCAddUnreadCountIndex";
                                                                                                                                                  _os_log_impl(&dword_1A4F90000, v235, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                }

                                                                                                                                                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _AddFilterPredicateToInboxThreadScopes(*(void **)(a1 + 48), 2);
                                                                                                                                                if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                                                                {
LABEL_552:
                                                                                                                                                  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 214001;
                                                                                                                                                  +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                                  v236 = objc_claimAutoreleasedReturnValue();
                                                                                                                                                  if (os_log_type_enabled(v236, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                  {
                                                                                                                                                    *(_DWORD *)buf = 134218242;
                                                                                                                                                    *(_QWORD *)&buf[4] = 214001;
                                                                                                                                                    *(_WORD *)&buf[12] = 2080;
                                                                                                                                                    *(_QWORD *)&buf[14] = "DawnEUpdateThreadScopesForRemindMeEverywhere";
                                                                                                                                                    _os_log_impl(&dword_1A4F90000, v236, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                  }

LABEL_555:
                                                                                                                                                  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 220001;
                                                                                                                                                  +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                                  v237 = objc_claimAutoreleasedReturnValue();
                                                                                                                                                  if (os_log_type_enabled(v237, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                  {
                                                                                                                                                    *(_DWORD *)buf = 134218242;
                                                                                                                                                    *(_QWORD *)&buf[4] = 220001;
                                                                                                                                                    *(_WORD *)&buf[12] = 2080;
                                                                                                                                                    *(_QWORD *)&buf[14] = "CrystalAddMessagesValidationStateUpgradeStep";
                                                                                                                                                    _os_log_impl(&dword_1A4F90000, v237, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                  }

                                                                                                                                                  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EA40], "runWithConnection:", *(_QWORD *)(a1 + 48)) == 0;
                                                                                                                                                  _HandleSQLiteError(v3, CFSTR("Adding validation state to message_global_data table"));
                                                                                                                                                  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                                                                  {
LABEL_558:
                                                                                                                                                    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 220002;
                                                                                                                                                    +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                                    v238 = objc_claimAutoreleasedReturnValue();
                                                                                                                                                    if (os_log_type_enabled(v238, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                    {
                                                                                                                                                      *(_DWORD *)buf = 134218242;
                                                                                                                                                      *(_QWORD *)&buf[4] = 220002;
                                                                                                                                                      *(_WORD *)&buf[12] = 2080;
                                                                                                                                                      *(_QWORD *)&buf[14] = "CrystalAddMessagesValidationStateToMessageGlobalDataUpgradeStep";
                                                                                                                                                      _os_log_impl(&dword_1A4F90000, v238, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                    }

                                                                                                                                                    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EB28], "runWithConnection:", *(_QWORD *)(a1 + 48)) == 0;
                                                                                                                                                    _HandleSQLiteError(v3, CFSTR("Adding category column to messages_global_data"));
                                                                                                                                                    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                                                                    {
                                                                                                                                                      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EA78], "runWithConnection:", *(_QWORD *)(a1 + 48)) == 0;
                                                                                                                                                      _HandleSQLiteError(v3, CFSTR("Adding category column to senders table"));
                                                                                                                                                      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                                                                      {
LABEL_562:
                                                                                                                                                        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 220003;
                                                                                                                                                        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                                        v239 = objc_claimAutoreleasedReturnValue();
                                                                                                                                                        if (os_log_type_enabled(v239, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                        {
                                                                                                                                                          *(_DWORD *)buf = 134218242;
                                                                                                                                                          *(_QWORD *)&buf[4] = 220003;
                                                                                                                                                          *(_WORD *)&buf[12] = 2080;
                                                                                                                                                          *(_QWORD *)&buf[14] = "CrystalAddBlackPearlCategoryColumnsUpgradeStep";
                                                                                                                                                          _os_log_impl(&dword_1A4F90000, v239, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                        }

LABEL_565:
                                                                                                                                                        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 220004;
                                                                                                                                                        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                                        v240 = objc_claimAutoreleasedReturnValue();
                                                                                                                                                        if (os_log_type_enabled(v240, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                        {
                                                                                                                                                          *(_DWORD *)buf = 134218242;
                                                                                                                                                          *(_QWORD *)&buf[4] = 220004;
                                                                                                                                                          *(_WORD *)&buf[12] = 2080;
                                                                                                                                                          *(_QWORD *)&buf[14] = "CrystalAddBusinessesTableUpgradeStep";
                                                                                                                                                          _os_log_impl(&dword_1A4F90000, v240, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                        }

                                                                                                                                                        if (!_protectedIndexHasBeenInitialized(*(void **)(a1 + 48)) || (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1E9F0], "runWithConnection:databaseName:", *(_QWORD *)(a1 + 48), CFSTR("protected")) == 0, _HandleSQLiteError(v3, CFSTR("Add domain and businesses column to addresses table")), *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)))
                                                                                                                                                        {
LABEL_569:
                                                                                                                                                          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 220005;
                                                                                                                                                          +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                                          v241 = objc_claimAutoreleasedReturnValue();
                                                                                                                                                          if (os_log_type_enabled(v241, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                          {
                                                                                                                                                            *(_DWORD *)buf = 134218242;
                                                                                                                                                            *(_QWORD *)&buf[4] = 220005;
                                                                                                                                                            *(_WORD *)&buf[12] = 2080;
                                                                                                                                                            *(_QWORD *)&buf[14] = "CrystalAddDomainAndBusinessColumnsUpgradeStep";
                                                                                                                                                            _os_log_impl(&dword_1A4F90000, v241, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                          }

                                                                                                                                                          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1E9E0], "runWithConnection:databaseName:updateProtectedSchema:", *(_QWORD *)(a1 + 48), CFSTR("protected"), _protectedIndexHasBeenInitialized(*(void **)(a1 + 48))) == 0;
                                                                                                                                                          _HandleSQLiteError(v3, CFSTR("Creating new business schema"));
                                                                                                                                                          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                                                                          {
LABEL_572:
                                                                                                                                                            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 220007;
                                                                                                                                                            +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                                            v242 = objc_claimAutoreleasedReturnValue();
                                                                                                                                                            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                            {
                                                                                                                                                              *(_DWORD *)buf = 134218242;
                                                                                                                                                              *(_QWORD *)&buf[4] = 220007;
                                                                                                                                                              *(_WORD *)&buf[12] = 2080;
                                                                                                                                                              *(_QWORD *)&buf[14] = "CrystalAddNewBusinessesSchemaUpgradeStep";
                                                                                                                                                              _os_log_impl(&dword_1A4F90000, v242, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                            }

                                                                                                                                                            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EB48], "runWithConnection:", *(_QWORD *)(a1 + 48)) == 0;
                                                                                                                                                            _HandleSQLiteError(v3, CFSTR("Update category columns in messages_global_data"));
                                                                                                                                                            if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                                                                            {
LABEL_575:
                                                                                                                                                              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 220008;
                                                                                                                                                              +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                                              v243 = objc_claimAutoreleasedReturnValue();
                                                                                                                                                              if (os_log_type_enabled(v243, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                              {
                                                                                                                                                                *(_DWORD *)buf = 134218242;
                                                                                                                                                                *(_QWORD *)&buf[4] = 220008;
                                                                                                                                                                *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                *(_QWORD *)&buf[14] = "CrystalMigrateCategoryTypeUpgradeStep";
                                                                                                                                                                _os_log_impl(&dword_1A4F90000, v243, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                              }

LABEL_578:
                                                                                                                                                              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 220009;
                                                                                                                                                              +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                                              v244 = objc_claimAutoreleasedReturnValue();
                                                                                                                                                              if (os_log_type_enabled(v244, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                              {
                                                                                                                                                                *(_DWORD *)buf = 134218242;
                                                                                                                                                                *(_QWORD *)&buf[4] = 220009;
                                                                                                                                                                *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                *(_QWORD *)&buf[14] = "CrystalPopulateBusinessSchema";
                                                                                                                                                                _os_log_impl(&dword_1A4F90000, v244, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                              }

                                                                                                                                                              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EAB8], "runWithConnection:", *(_QWORD *)(a1 + 48)) == 0;
                                                                                                                                                              _HandleSQLiteError(v3, CFSTR("Clean model version column in messages_global_data"));
                                                                                                                                                              if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                                                                              {
LABEL_581:
                                                                                                                                                                *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 220010;
                                                                                                                                                                +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                                                v245 = objc_claimAutoreleasedReturnValue();
                                                                                                                                                                if (os_log_type_enabled(v245, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                {
                                                                                                                                                                  *(_DWORD *)buf = 134218242;
                                                                                                                                                                  *(_QWORD *)&buf[4] = 220010;
                                                                                                                                                                  *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                  *(_QWORD *)&buf[14] = "CrystalCleanModelVersionColumnUpgradeStep";
                                                                                                                                                                  _os_log_impl(&dword_1A4F90000, v245, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                }

                                                                                                                                                                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EA00], "runWithConnection:", *(_QWORD *)(a1 + 48)) == 0;
                                                                                                                                                                _HandleSQLiteError(v3, CFSTR("Add frecency and server_metadata to mailboxes"));
                                                                                                                                                                if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                                                                                {
LABEL_584:
                                                                                                                                                                  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 220011;
                                                                                                                                                                  +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                                                  v246 = objc_claimAutoreleasedReturnValue();
                                                                                                                                                                  if (os_log_type_enabled(v246, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                  {
                                                                                                                                                                    *(_DWORD *)buf = 134218242;
                                                                                                                                                                    *(_QWORD *)&buf[4] = 220011;
                                                                                                                                                                    *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                    *(_QWORD *)&buf[14] = "CrystalFrecencyAndServerMetadata";
                                                                                                                                                                    _os_log_impl(&dword_1A4F90000, v246, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                  }

                                                                                                                                                                  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EB50], "runWithConnection:", *(_QWORD *)(a1 + 48)) == 0;
                                                                                                                                                                  _HandleSQLiteError(v3, CFSTR("Add frecency and server_metadata to mailboxes"));
                                                                                                                                                                  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                                                                                  {
LABEL_587:
                                                                                                                                                                    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 220012;
                                                                                                                                                                    +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                                                    v247 = objc_claimAutoreleasedReturnValue();
                                                                                                                                                                    if (os_log_type_enabled(v247, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                    {
                                                                                                                                                                      *(_DWORD *)buf = 134218242;
                                                                                                                                                                      *(_QWORD *)&buf[4] = 220012;
                                                                                                                                                                      *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                      *(_QWORD *)&buf[14] = "CrystalMigratedServerMetadataFromPList";
                                                                                                                                                                      _os_log_impl(&dword_1A4F90000, v247, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                    }

                                                                                                                                                                    objc_msgSend(*(id *)(a1 + 40), "noteNeedsSpotlightReindex");
                                                                                                                                                                    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
LABEL_590:
                                                                                                                                                                    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 220013;
                                                                                                                                                                    +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                                                    v248 = objc_claimAutoreleasedReturnValue();
                                                                                                                                                                    if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                    {
                                                                                                                                                                      *(_DWORD *)buf = 134218242;
                                                                                                                                                                      *(_QWORD *)&buf[4] = 220013;
                                                                                                                                                                      *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                      *(_QWORD *)&buf[14] = "CrystalSemanticSearchReindexStep";
                                                                                                                                                                      _os_log_impl(&dword_1A4F90000, v248, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                    }

                                                                                                                                                                    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EC88], "runWithConnection:", *(_QWORD *)(a1 + 48)) == 0;
                                                                                                                                                                    _HandleSQLiteError(v3, CFSTR("Failed to update category type for messages categorized as others"));
                                                                                                                                                                    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                                                                                    {
LABEL_593:
                                                                                                                                                                      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 220014;
                                                                                                                                                                      +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                                                      v249 = objc_claimAutoreleasedReturnValue();
                                                                                                                                                                      if (os_log_type_enabled(v249, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                      {
                                                                                                                                                                        *(_DWORD *)buf = 134218242;
                                                                                                                                                                        *(_QWORD *)&buf[4] = 220014;
                                                                                                                                                                        *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                        *(_QWORD *)&buf[14] = "CrystalUpdateOthersCategoryUpgradeStep";
                                                                                                                                                                        _os_log_impl(&dword_1A4F90000, v249, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                      }

                                                                                                                                                                      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EA08], "runWithConnection:", *(_QWORD *)(a1 + 48)) == 0;
                                                                                                                                                                      _HandleSQLiteError(v3, CFSTR("Failed generated summary upgrade step"));
                                                                                                                                                                      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                                                                                      {
LABEL_596:
                                                                                                                                                                        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 220015;
                                                                                                                                                                        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                                                        v250 = objc_claimAutoreleasedReturnValue();
                                                                                                                                                                        if (os_log_type_enabled(v250, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                        {
                                                                                                                                                                          *(_DWORD *)buf = 134218242;
                                                                                                                                                                          *(_QWORD *)&buf[4] = 220015;
                                                                                                                                                                          *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                          *(_QWORD *)&buf[14] = "CrystalAddGeneratedSummaryUpgradeStep";
                                                                                                                                                                          _os_log_impl(&dword_1A4F90000, v250, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                        }

LABEL_599:
                                                                                                                                                                        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 220016;
                                                                                                                                                                        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                                                        v251 = objc_claimAutoreleasedReturnValue();
                                                                                                                                                                        if (os_log_type_enabled(v251, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                        {
                                                                                                                                                                          *(_DWORD *)buf = 134218242;
                                                                                                                                                                          *(_QWORD *)&buf[4] = 220016;
                                                                                                                                                                          *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                          *(_QWORD *)&buf[14] = "CrystalAddAddressesColumnBusinessCategories";
                                                                                                                                                                          _os_log_impl(&dword_1A4F90000, v251, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                        }

                                                                                                                                                                        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1E9D8], "runWithConnection:", *(_QWORD *)(a1 + 48)) == 0;
                                                                                                                                                                        _HandleSQLiteError(v3, CFSTR("Failed to populate address column to business_categories"));
                                                                                                                                                                        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                                                                                        {
LABEL_602:
                                                                                                                                                                          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 220017;
                                                                                                                                                                          +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                                                          v252 = objc_claimAutoreleasedReturnValue();
                                                                                                                                                                          if (os_log_type_enabled(v252, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                          {
                                                                                                                                                                            *(_DWORD *)buf = 134218242;
                                                                                                                                                                            *(_QWORD *)&buf[4] = 220017;
                                                                                                                                                                            *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                            *(_QWORD *)&buf[14] = "CrystalPopulateBusinessCategoriesTable";
                                                                                                                                                                            _os_log_impl(&dword_1A4F90000, v252, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                          }

                                                                                                                                                                          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = _addThreadNewestMessageColumn(*(void **)(a1 + 48));
                                                                                                                                                                          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                                                                                          {
LABEL_605:
                                                                                                                                                                            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 220018;
                                                                                                                                                                            +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                                                            v253 = objc_claimAutoreleasedReturnValue();
                                                                                                                                                                            if (os_log_type_enabled(v253, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                            {
                                                                                                                                                                              *(_DWORD *)buf = 134218242;
                                                                                                                                                                              *(_QWORD *)&buf[4] = 220018;
                                                                                                                                                                              *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                              *(_QWORD *)&buf[14] = "CrystalAddThreadNewestMessageUpgradeStep";
                                                                                                                                                                              _os_log_impl(&dword_1A4F90000, v253, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                            }

                                                                                                                                                                            objc_msgSend(*(id *)(a1 + 40), "noteNeedsSpotlightReindex");
                                                                                                                                                                            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
LABEL_608:
                                                                                                                                                                            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 220019;
                                                                                                                                                                            +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                                                            v254 = objc_claimAutoreleasedReturnValue();
                                                                                                                                                                            if (os_log_type_enabled(v254, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                            {
                                                                                                                                                                              *(_DWORD *)buf = 134218242;
                                                                                                                                                                              *(_QWORD *)&buf[4] = 220019;
                                                                                                                                                                              *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                              *(_QWORD *)&buf[14] = "CrystalRedonateToSpotlightWithGlobalMessageID";
                                                                                                                                                                              _os_log_impl(&dword_1A4F90000, v254, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                            }

                                                                                                                                                                            if (_protectedIndexHasBeenInitialized(*(void **)(a1 + 48)))
                                                                                                                                                                            {
                                                                                                                                                                              v282 = 0;
                                                                                                                                                                              v255 = +[MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep runWithConnection:error:](MFMailMessageLibraryBusinessCommonPrefixGroupingUpgradeStep, "runWithConnection:error:", v280, &v282);
                                                                                                                                                                              v256 = v282;
                                                                                                                                                                              v257 = v256;
                                                                                                                                                                              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v255;
                                                                                                                                                                              if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                                                                                              {
                                                                                                                                                                                +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                                                                v279 = objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                if (os_log_type_enabled(v279, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                                {
                                                                                                                                                                                  *(_DWORD *)buf = 138543362;
                                                                                                                                                                                  *(_QWORD *)&buf[4] = v257;
                                                                                                                                                                                  _os_log_impl(&dword_1A4F90000, v279, OS_LOG_TYPE_DEFAULT, "Updating businesses grouping to high level domain + common prefix: %{public}@", buf, 0xCu);
                                                                                                                                                                                }

                                                                                                                                                                                goto LABEL_629;
                                                                                                                                                                              }

                                                                                                                                                                            }
LABEL_613:
                                                                                                                                                                            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 220020;
                                                                                                                                                                            +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                                                            v258 = objc_claimAutoreleasedReturnValue();
                                                                                                                                                                            if (os_log_type_enabled(v258, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                            {
                                                                                                                                                                              *(_DWORD *)buf = 134218242;
                                                                                                                                                                              *(_QWORD *)&buf[4] = 220020;
                                                                                                                                                                              *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                              *(_QWORD *)&buf[14] = "CrystalChangeBusinessesToSmartGroupingUpgradeStep";
                                                                                                                                                                              _os_log_impl(&dword_1A4F90000, v258, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                            }

                                                                                                                                                                            objc_msgSend(*(id *)(a1 + 40), "noteNeedsSpotlightReindex");
                                                                                                                                                                            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
LABEL_616:
                                                                                                                                                                            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 220021;
                                                                                                                                                                            +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                                                            v259 = objc_claimAutoreleasedReturnValue();
                                                                                                                                                                            if (os_log_type_enabled(v259, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                            {
                                                                                                                                                                              *(_DWORD *)buf = 134218242;
                                                                                                                                                                              *(_QWORD *)&buf[4] = 220021;
                                                                                                                                                                              *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                              *(_QWORD *)&buf[14] = "CrystalRedonateToSpotlightWithEncodedEntityInstanceIdentifier";
                                                                                                                                                                              _os_log_impl(&dword_1A4F90000, v259, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                            }

                                                                                                                                                                            v260 = *(id *)(a1 + 48);
                                                                                                                                                                            v261 = sqlite3_exec((sqlite3 *)objc_msgSend(v260, "sqlDB"), "CREATE INDEX IF NOT EXISTS message_global_data_validation_state_equals_zero_index ON message_global_data(validation_state) WHERE validation_state = 0;", 0, 0, 0) == 0;

                                                                                                                                                                            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v261;
                                                                                                                                                                            if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                                                                                            {
LABEL_619:
                                                                                                                                                                              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 220022;
                                                                                                                                                                              +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                                                              v262 = objc_claimAutoreleasedReturnValue();
                                                                                                                                                                              if (os_log_type_enabled(v262, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                              {
                                                                                                                                                                                *(_DWORD *)buf = 134218242;
                                                                                                                                                                                *(_QWORD *)&buf[4] = 220022;
                                                                                                                                                                                *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                                *(_QWORD *)&buf[14] = "CrystalAddMessageGlobalDataValidationStateIndexUpgradeStep";
                                                                                                                                                                                _os_log_impl(&dword_1A4F90000, v262, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                              }

                                                                                                                                                                              if (v4 <= 219999)
                                                                                                                                                                                goto LABEL_623;
                                                                                                                                                                              v263 = *(_QWORD *)(a1 + 48);
                                                                                                                                                                              v281 = 0;
                                                                                                                                                                              v264 = objc_msgSend(MEMORY[0x1E0D1EAF0], "runWithConnection:error:", v263, &v281);
                                                                                                                                                                              v265 = v281;
                                                                                                                                                                              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v264;
                                                                                                                                                                              _HandleSQLiteError(v3, CFSTR("Failed to force recategorization"));
                                                                                                                                                                              v266 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) == 0;

                                                                                                                                                                              if (!v266)
                                                                                                                                                                              {
LABEL_623:
                                                                                                                                                                                *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 220023;
                                                                                                                                                                                +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                                                                v267 = objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                if (os_log_type_enabled(v267, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                                {
                                                                                                                                                                                  *(_DWORD *)buf = 134218242;
                                                                                                                                                                                  *(_QWORD *)&buf[4] = 220023;
                                                                                                                                                                                  *(_WORD *)&buf[12] = 2080;
                                                                                                                                                                                  *(_QWORD *)&buf[14] = "CrystalForceRecategorizationUpgradeStep";
                                                                                                                                                                                  _os_log_impl(&dword_1A4F90000, v267, OS_LOG_TYPE_DEFAULT, "Upgrading from %lu (%s)", buf, 0x16u);
                                                                                                                                                                                }

                                                                                                                                                                                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D1EA18], "runWithConnection:", *(_QWORD *)(a1 + 48)) == 0;
                                                                                                                                                                                _HandleSQLiteError(v3, CFSTR("Add sync_info to mailboxes"));
                                                                                                                                                                                if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
                                                                                                                                                                                {
LABEL_626:
                                                                                                                                                                                  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24) = 220024;
                                                                                                                                                                                  +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
                                                                                                                                                                                  v268 = objc_claimAutoreleasedReturnValue();
                                                                                                                                                                                  if (os_log_type_enabled(v268, OS_LOG_TYPE_DEFAULT))
                                                                                                                                                                                  {
                                                                                                                                                                                    *(_DWORD *)buf = 134217984;
                                                                                                                                                                                    *(_QWORD *)&buf[4] = 220024;
                                                                                                                                                                                    _os_log_impl(&dword_1A4F90000, v268, OS_LOG_TYPE_DEFAULT, "Migrated to current version %lu", buf, 0xCu);
                                                                                                                                                                                  }

                                                                                                                                                                                  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
                                                                                                                                                                                }
                                                                                                                                                                              }
                                                                                                                                                                            }
                                                                                                                                                                          }
                                                                                                                                                                        }
                                                                                                                                                                      }
                                                                                                                                                                    }
                                                                                                                                                                  }
                                                                                                                                                                }
                                                                                                                                                              }
                                                                                                                                                            }
                                                                                                                                                          }
                                                                                                                                                        }
                                                                                                                                                      }
                                                                                                                                                    }
                                                                                                                                                  }
                                                                                                                                                }
                                                                                                                                              }
                                                                                                                                            }
                                                                                                                                          }
                                                                                                                                        }
                                                                                                                                      }
                                                                                                                                    }
                                                                                                                                  }
                                                                                                                                }
                                                                                                                              }
                                                                                                                            }
                                                                                                                          }
                                                                                                                        }
                                                                                                                      }
                                                                                                                    }
                                                                                                                  }
                                                                                                                }
                                                                                                              }
                                                                                                            }
                                                                                                          }
                                                                                                        }
                                                                                                      }
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_629:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "_checkForeignKeysWithConnection:", v280);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      if (objc_msgSend(*(id *)(a1 + 40), "needsRebuildTriggers"))
      {
        +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
        v269 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v269, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4F90000, v269, OS_LOG_TYPE_DEFAULT, "Rebuilding triggers", buf, 2u);
        }

        _SQLFromFile();
        v270 = (void *)objc_claimAutoreleasedReturnValue();
        v271 = _ExecuteSQL(v3, v270, CFSTR("performing statements from file \"triggers.sql\"));

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v271;
      }
    }
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)
    && objc_msgSend(*(id *)(a1 + 40), "needsRebuildMessageInfoIndex"))
  {
    +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
    v272 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v272, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4F90000, v272, OS_LOG_TYPE_DEFAULT, "Rebuilding Message Info Index", buf, 2u);
    }

    v273 = sqlite3_exec(v3, "DROP INDEX IF EXISTS message_infos_index;\n"
             "CREATE INDEX message_infos_index ON messages(mailbox, deleted, journaled, sender_vip, flags, conversation_i"
             "d, date_sent, message_id, date_received DESC, ROWID DESC);",
             0,
             0,
             0);
    _HandleSQLiteError(v3, CFSTR("updating message_infos_index covering index"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v273 == 0;
  }
  v274 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    v275 = v4 == 220024;
  else
    v275 = 1;
  if (!v275)
  {
    +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
    v276 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v276, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4F90000, v276, OS_LOG_TYPE_DEFAULT, "Updating library version", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    if (sqlite3_prepare_v2(v3, "INSERT OR REPLACE INTO properties (key, value) values ('version', ?)", -1, (sqlite3_stmt **)buf, 0))
    {
      _HandleSQLiteError(v3, CFSTR("preparing library version insert statement"));
    }
    else
    {
      sqlite3_bind_int(*(sqlite3_stmt **)buf, 1, 220024);
      sqlite3_step(*(sqlite3_stmt **)buf);
      _HandleSQLiteError(v3, CFSTR("setting library version"));
      sqlite3_finalize(*(sqlite3_stmt **)buf);
    }
    v274 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  }
  v277 = v274 != 0;

  return v277;
}

uint64_t __80__MFMailMessageLibraryMigrator__runMigrationStepsFromVersion_connection_schema___block_invoke_93(uint64_t a1, uint64_t a2)
{
  return +[MFMailMessageLibraryAdoptSharedSchemaMigrationStep cleanUpAfterMigrationWithConnection:](MFMailMessageLibraryAdoptSharedSchemaMigrationStep, "cleanUpAfterMigrationWithConnection:", a2);
}

- (int64_t)_checkContentProtectionState
{
  NSObject *v3;
  int64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[8];
  _QWORD block[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[MFMailMessageLibraryMigrator contentProtectionQueue](self, "contentProtectionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MFMailMessageLibraryMigrator__checkContentProtectionState__block_invoke;
  block[3] = &unk_1E4E8D288;
  block[4] = &v11;
  dispatch_sync(v3, block);

  if (*((_BYTE *)v12 + 24))
  {
    v4 = 2;
  }
  else
  {
    -[MFMailMessageLibraryMigrator migrationState](self, "migrationState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lock");

    -[MFMailMessageLibraryMigrator migrationState](self, "migrationState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unlockWithCondition:", 1);

    +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_DEFAULT, "Protected Index unavailable", v9, 2u);
    }

    v4 = 1;
  }
  _Block_object_dispose(&v11, 8);
  return v4;
}

uint64_t __60__MFMailMessageLibraryMigrator__checkContentProtectionState__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = EFProtectedDataAvailable();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)_checkForeignKeysWithConnection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  _QWORD v14[2];
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[4];
  const __CFString *v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "preparedStatementForQueryString:", CFSTR("PRAGMA foreign_key_check"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v15 = __64__MFMailMessageLibraryMigrator__checkForeignKeysWithConnection___block_invoke;
  v16 = &unk_1E4E8D2B0;
  v19 = &v21;
  v6 = v4;
  v17 = v6;
  v20 = &v25;
  v7 = v3;
  v18 = v7;
  v8 = v5;
  v9 = v14;
  v10 = mach_absolute_time();
  v15((uint64_t)v9);
  v11 = mach_absolute_time();
  if (EFGetElapsedTimeSinceAbsoluteTime_onceToken_0 != -1)
    dispatch_once(&EFGetElapsedTimeSinceAbsoluteTime_onceToken_0, &__block_literal_global_463);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v30 = CFSTR("PRAGMA foreign_key_check");
    v31 = 2048;
    v32 = (double)((v11 - v10)
                 * EFGetElapsedTimeSinceAbsoluteTime_sTimebaseInfo_0
                 / *(unsigned int *)algn_1EE7C23F4)
        / 1000000000.0;
    _os_log_impl(&dword_1A4F90000, v8, OS_LOG_TYPE_DEFAULT, "%@ : took %fs", buf, 0x16u);
  }

  if (*((_BYTE *)v22 + 24))
    v12 = v26[3] == 0;
  else
    v12 = 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

void __64__MFMailMessageLibraryMigrator__checkForeignKeysWithConnection___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  id v5;
  _QWORD v6[5];

  v2 = *(void **)(a1 + 32);
  v5 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__MFMailMessageLibraryMigrator__checkForeignKeysWithConnection___block_invoke_2;
  v6[3] = &unk_1E4E8A268;
  v6[4] = *(_QWORD *)(a1 + 56);
  v3 = objc_msgSend(v2, "executeUsingBlock:error:", v6, &v5);
  v4 = v5;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 40), "handleError:message:", v4, CFSTR("Checking foreign keys"));

}

void __64__MFMailMessageLibraryMigrator__checkForeignKeysWithConnection___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  *a4 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) > 9;
  +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "int64Value");
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 134218498;
    v15 = v9;
    v16 = 2114;
    v17 = v11;
    v18 = 2114;
    v19 = v13;
    _os_log_error_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_ERROR, "Foreign key violation on row %lld of table %{public}@ with reference to table %{public}@", (uint8_t *)&v14, 0x20u);

  }
}

- (void)noteNeedsRebuildTriggers
{
  self->_needsRebuildTriggers = 1;
}

- (BOOL)needsRebuildTriggers
{
  return self->_needsRebuildTriggers;
}

- (void)noteRebuildMessageInfoIndex
{
  self->_needsRebuildMessageInfoIndex = 1;
}

- (BOOL)needsRebuildMessageInfoIndex
{
  return self->_needsRebuildMessageInfoIndex;
}

- (void)resetTTRPromptAndForceReindex
{
  MFMobileMailPreferenceDomain();
  MFMobileMailContainerPath();
  _CFPreferencesSetValueWithContainer();
  _CFPreferencesSetValueWithContainer();
  -[MFMailMessageLibraryMigrator noteNeedsSpotlightReindex](self, "noteNeedsSpotlightReindex");
}

- (void)noteNeedsSpotlightReindex
{
  self->_needsSpotlightReindex = 1;
}

- (BOOL)needsSpotlightReindex
{
  return self->_needsSpotlightReindex;
}

- (void)addPostMigrationBlock:(id)a3
{
  NSMutableArray *postMigrationBlocks;
  id v4;

  postMigrationBlocks = self->_postMigrationBlocks;
  v4 = _Block_copy(a3);
  -[NSMutableArray addObject:](postMigrationBlocks, "addObject:");

}

- (void)runPostMigrationBlocksWithConnection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)-[NSMutableArray copy](self->_postMigrationBlocks, "copy");
  -[NSMutableArray removeAllObjects](self->_postMigrationBlocks, "removeAllObjects");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (int64_t)attachProtectedDatabaseWithConnection:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  int64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  char v12;
  unint64_t v13;
  id v15;

  v4 = a3;
  -[MFMailMessageLibraryMigrator delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v6 = objc_msgSend(v5, "mailMessageLibraryMigrator:attachProtectedDatabaseWithName:connection:error:", self, CFSTR("protected"), v4, &v15);
  v7 = v15;

  if ((v6 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MFMailMessageLibraryMigrator attachProtectedDatabaseWithConnection:].cold.1((uint64_t)v7, v9, v10);

    objc_msgSend(v7, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D1EE10]);

    if ((v12 & 1) != 0)
    {
      v13 = objc_msgSend(v7, "code");
      v8 = 2;
      if (v13 <= 0x17 && ((1 << v13) & 0x804400) != 0)
        v8 = -[MFMailMessageLibraryMigrator _checkContentProtectionState](self, "_checkContentProtectionState");
    }
    else
    {
      v8 = 2;
    }
  }

  return v8;
}

- (void)detachProtectedDatabaseWithConnection:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFMailMessageLibraryMigrator delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mailMessageLibraryMigrator:detachProtectedDatabaseWithConnection:", self, v5);

}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  -[MFMailMessageLibraryMigrator contentProtectionQueue](self, "contentProtectionQueue", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (EFProtectedDataAvailable())
  {
    +[MFMailMessageLibraryMigrator log](MFMailMessageLibraryMigrator, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A4F90000, v6, OS_LOG_TYPE_DEFAULT, "Protected Index became available", v9, 2u);
    }

    -[MFMailMessageLibraryMigrator migrationState](self, "migrationState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lock");

    -[MFMailMessageLibraryMigrator migrationState](self, "migrationState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unlockWithCondition:", 0);

  }
}

- (MFMailMessageLibraryMigratorDelegate)delegate
{
  return (MFMailMessageLibraryMigratorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)contentProtectionQueue
{
  return self->_contentProtectionQueue;
}

- (NSConditionLock)migrationState
{
  return self->_migrationState;
}

- (void)migrateWithDatabaseConnection:(os_log_t)log schema:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "Error: invalid connection", v1, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)migrateWithDatabaseConnection:(os_log_t)log schema:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A4F90000, log, OS_LOG_TYPE_FAULT, "Failed migration", v1, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)migrateWithDatabaseConnection:(NSObject *)a3 schema:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a3, (uint64_t)a3, "Error initializing database parameters: %{public}@", (uint8_t *)a2);

}

void __80__MFMailMessageLibraryMigrator__runMigrationStepsFromVersion_connection_schema___block_invoke_2_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109376;
  v2[1] = a1;
  v3 = 2048;
  v4 = 220024;
  _os_log_error_impl(&dword_1A4F90000, a2, OS_LOG_TYPE_ERROR, "Error: Downgrading from version %d to version %ld is not supported", (uint8_t *)v2, 0x12u);
  OUTLINED_FUNCTION_5();
}

void __80__MFMailMessageLibraryMigrator__runMigrationStepsFromVersion_connection_schema___block_invoke_2_cold_2(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A4F90000, a2, OS_LOG_TYPE_ERROR, "Error: Migration is not supported for version %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_9();
}

- (void)attachProtectedDatabaseWithConnection:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a2, a3, "Error attaching protected index while migrating: %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

@end
