@implementation ULDataMigrator

- (ULDataMigrator)initWithLocalDb:(ULDatabase *)a3 dataProtectionDelegate:(IDataProtectionDelegate *)a4 andEventLogger:(void *)a5
{
  ULDataMigrator *v8;
  ULDataMigrator *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ULDataMigrator;
  v8 = -[ULDataMigrator init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ULDataMigrator setLocalDb:](v8, "setLocalDb:", a3);
    -[ULDataMigrator setDataProtectionDelegate:](v9, "setDataProtectionDelegate:", a4);
    -[ULDataMigrator setEventLogger:](v9, "setEventLogger:", a5);
  }
  return v9;
}

- (BOOL)migrateMiloData
{
  NSObject *v3;
  id v4;
  _DWORD *v5;
  CLMicroLocationEventLogger *v6;
  uint64_t v7;
  double v8;
  void *v9;
  BOOL v10;
  id v11;
  _DWORD *v12;
  NSObject *v13;
  _QWORD v15[6];
  int v16;
  uint64_t v17;
  int v18;
  __int128 v19;
  Entry buf;
  uint64_t v21;
  char v22;
  _QWORD v23[40];

  v23[39] = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_27);
  v3 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf.var0.var0 = 0;
    _os_log_impl(&dword_2419D9000, v3, OS_LOG_TYPE_DEFAULT, "Migrating milo data", buf.var0.var0, 2u);
  }
  v4 = (id)-[ULDataMigrator localDb](self, "localDb")[112];
  *(_QWORD *)&v19 = cl::chrono::CFAbsoluteTimeClock::now();
  CLMicroLocationMigrationTable::Entry::Entry((uint64_t)&v17, 3, &v19);
  v5 = operator new(0x10uLL);
  *(_QWORD *)&buf.var0.var0[8] = v5 + 4;
  v21 = (uint64_t)(v5 + 4);
  *(_QWORD *)v5 = v17;
  v5[2] = v18;
  *(_QWORD *)buf.var0.var0 = v5;
  objc_msgSend(v4, "insertEntries:", &buf);
  if (*(_QWORD *)buf.var0.var0)
  {
    *(_QWORD *)&buf.var0.var0[8] = *(_QWORD *)buf.var0.var0;
    operator delete(*(void **)buf.var0.var0);
  }

  if ((ULDatabase::isDatabaseConnected(-[ULDataMigrator localDb](self, "localDb")) & 1) != 0)
  {
    v6 = -[ULDataMigrator eventLogger](self, "eventLogger");
    v16 = 0;
    boost::uuids::detail::random_provider_base::random_provider_base((boost::uuids::detail::random_provider_base *)&v16);
    *(_QWORD *)&v19 = boost::uuids::random_generator_pure::operator()((uint64_t)&v16);
    *((_QWORD *)&v19 + 1) = v7;
    v8 = cl::chrono::CFAbsoluteTimeClock::now();
    CLMicroLocationProto::DataMigration::DataMigration((CLMicroLocationProto::DataMigration *)&v17);
    CLMicroLocationProtobufHelper::createLoggedEvent<CLMicroLocationProto::DataMigration>(&v19, (int *)&v17, (uint64_t)&buf, v8);
    CLMicroLocationEventLogger::logEvent(v6, &buf);
    CLMicroLocationProto::ReceivedEvent::~ReceivedEvent((CLMicroLocationProto::ReceivedEvent *)v23);
    CLMicroLocationProto::DataMigration::~DataMigration((CLMicroLocationProto::DataMigration *)&v17);
    boost::uuids::detail::random_provider_base::destroy((boost::uuids::detail::random_provider_base *)&v16);
    *(_QWORD *)buf.var0.var0 = 0;
    *(_QWORD *)&buf.var0.var0[8] = &buf;
    v21 = 0x2020000000;
    v22 = 0;
    +[ULTransactionManager shared](ULTransactionManager, "shared");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __33__ULDataMigrator_migrateMiloData__block_invoke;
    v15[3] = &unk_2511D40E0;
    v15[4] = self;
    v15[5] = &buf;
    objc_msgSend(v9, "performUnderTransaction:block:", CFSTR("com.apple.milod.migrateData"), v15);

    v10 = *(_BYTE *)(*(_QWORD *)&buf.var0.var0[8] + 24) != 0;
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v11 = (id)-[ULDataMigrator localDb](self, "localDb")[112];
    *(_QWORD *)&v19 = cl::chrono::CFAbsoluteTimeClock::now();
    CLMicroLocationMigrationTable::Entry::Entry((uint64_t)&v17, 6, &v19);
    v12 = operator new(0x10uLL);
    *(_QWORD *)&buf.var0.var0[8] = v12 + 4;
    v21 = (uint64_t)(v12 + 4);
    *(_QWORD *)v12 = v17;
    v12[2] = v18;
    *(_QWORD *)buf.var0.var0 = v12;
    objc_msgSend(v11, "insertEntries:", &buf);
    if (*(_QWORD *)buf.var0.var0)
    {
      *(_QWORD *)&buf.var0.var0[8] = *(_QWORD *)buf.var0.var0;
      operator delete(*(void **)buf.var0.var0);
    }

    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_27);
    v13 = logObject_MicroLocation_Default;
    v10 = 0;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf.var0.var0 = 0;
      _os_log_impl(&dword_2419D9000, v13, OS_LOG_TYPE_DEFAULT, "local milo database is not connected", buf.var0.var0, 2u);
      return 0;
    }
  }
  return v10;
}

uint64_t __33__ULDataMigrator_migrateMiloData__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_migrateMiloDataTransaction");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_migrateMiloDataTransaction
{
  ULBackupAndRestore *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _DWORD *v12;
  NSObject *v13;
  const char *v14;
  CFAbsoluteTime v16;
  uint8_t buf[8];
  _BYTE v18[20];
  uint64_t v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = -[ULBackupAndRestore initWithDatabase:andEventLogger:]([ULBackupAndRestore alloc], "initWithDatabase:andEventLogger:", -[ULDataMigrator localDb](self, "localDb"), -[ULDataMigrator eventLogger](self, "eventLogger"));
  if ((objc_msgSend(MEMORY[0x24BE669E0], "isMac") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULBackupAndRestore getBackupDatabasePath](v3, "getBackupDatabasePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

    if (v6)
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_27);
      v7 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2419D9000, v7, OS_LOG_TYPE_DEFAULT, "Migrating data from milod restored iCloud backup file", buf, 2u);
      }
      v8 = -[ULBackupAndRestore importiCloudBackup](v3, "importiCloudBackup");
      v9 = 0;
      if (!v8)
        goto LABEL_17;
LABEL_14:
      v11 = (id)-[ULDataMigrator localDb](self, "localDb")[112];
      v16 = cl::chrono::CFAbsoluteTimeClock::now();
      CLMicroLocationMigrationTable::Entry::Entry((uint64_t)&v19, 2, &v16);
      v12 = operator new(0x10uLL);
      *(_QWORD *)v18 = v12 + 4;
      *(_QWORD *)&v18[8] = v12 + 4;
      *(_QWORD *)v12 = v19;
      v12[2] = v20;
      *(_QWORD *)buf = v12;
      objc_msgSend(v11, "insertEntries:", buf);
      if (*(_QWORD *)buf)
      {
        *(_QWORD *)v18 = *(_QWORD *)buf;
        operator delete(*(void **)buf);
      }

      goto LABEL_17;
    }
  }
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_27);
  v10 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2419D9000, v10, OS_LOG_TYPE_DEFAULT, "Migrating data from locationd", buf, 2u);
  }
  v8 = -[ULDataMigrator _migrateMiloDataFromLocationd](self, "_migrateMiloDataFromLocationd");
  v9 = 1;
  if (v8)
    goto LABEL_14;
LABEL_17:
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_27);
  v13 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v14 = "fail";
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v18 = 2082;
    *(_QWORD *)&v18[2] = "";
    if (v8)
      v14 = "success";
    *(_WORD *)&v18[10] = 2082;
    *(_QWORD *)&v18[12] = v14;
    _os_log_impl(&dword_2419D9000, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"data migration iteration status.\", \"result\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  if (ULDatabase::getMigrationStatus(-[ULDataMigrator localDb](self, "localDb"), 1) - 3 <= 1)
    -[ULDataMigrator _sendCoreAnalyticsEventForMigrationIfNecessary:](self, "_sendCoreAnalyticsEventForMigrationIfNecessary:", v9);

  return v8;
}

- (void)_sendCoreAnalyticsEventForMigrationIfNecessary:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _DWORD v14[2];
  __int16 v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultsDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULAnalyticsSendEventEnabled");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v9 = objc_msgSend(v8, "BOOLValue");
  else
    v9 = objc_msgSend(MEMORY[0x24BDBD1C8], "BOOLValue");
  v10 = v9;

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ULDataMigrator _initializeMigrationStatusMetricsDict:forType:](self, "_initializeMigrationStatusMetricsDict:forType:", v11, a3))
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_27);
      v12 = (id)logObject_MicroLocation_Default;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14[0] = 68289538;
        v14[1] = 0;
        v15 = 2082;
        v16 = "";
        v17 = 2082;
        v18 = objc_msgSend(CFSTR("com.apple.MicroLocation.DataMigration"), "UTF8String");
        v19 = 2114;
        v20 = v11;
        _os_log_impl(&dword_2419D9000, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Sending Migration CoreAnalytics\", \"Event name\":%{public, location:escape_only}s, \"metricsDict\":%{public, location:escape_only}@}", (uint8_t *)v14, 0x26u);
      }

      AnalyticsSendEvent();
    }

  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_27);
    v13 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14[0]) = 0;
      _os_log_impl(&dword_2419D9000, v13, OS_LOG_TYPE_DEFAULT, "#Data Migrator, CoreAnalytics Disabled", (uint8_t *)v14, 2u);
    }
  }
}

- (id)_getPreviouslyExportedFileIfExistsAtPath:(id)a3
{
  id v4;
  void *v5;
  int v6;
  _QWORD *v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;
  _DWORD *v13;
  _DWORD *v14;
  void *__p;
  void *v16;
  _QWORD *v17;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x24BE669E0], "isMac") & 1) != 0
    || (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "fileExistsAtPath:", v4),
        v5,
        !v6))
  {
    v10 = 0;
    goto LABEL_6;
  }
  v7 = operator new(8uLL);
  __p = v7;
  *v7 = 4;
  v16 = v7 + 1;
  v17 = v7 + 1;
  v8 = (id)-[ULDataMigrator localDb](self, "localDb")[112];
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "fetchMigrationEntriesWithStates:limit:", &__p, 1);
  }
  else
  {
    v13 = 0;
    v14 = 0;
  }

  v12 = v13;
  if (v14 != v13)
  {
    if (v13[2] == 4)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v13;
      if (!v13)
        goto LABEL_16;
    }
    else
    {
      v10 = 0;
    }
LABEL_15:
    operator delete(v12);
    goto LABEL_16;
  }
  v10 = 0;
  v12 = v14;
  if (v14)
    goto LABEL_15;
LABEL_16:
  if (__p)
  {
    v16 = __p;
    operator delete(__p);
  }
LABEL_6:

  return v10;
}

- (BOOL)_checkKeybagUnlocked
{
  IDataProtectionDelegate *v3;
  char v4;
  id v5;
  _DWORD *v6;
  NSObject *v7;
  CFAbsoluteTime v9;
  void *__p;
  void *v11;
  char *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = -[ULDataMigrator dataProtectionDelegate](self, "dataProtectionDelegate");
  v4 = (*((uint64_t (**)(IDataProtectionDelegate *))v3->var0 + 2))(v3);
  if ((v4 & 1) == 0)
  {
    v5 = (id)-[ULDataMigrator localDb](self, "localDb")[112];
    v9 = cl::chrono::CFAbsoluteTimeClock::now();
    CLMicroLocationMigrationTable::Entry::Entry((uint64_t)&v13, 7, &v9);
    v6 = operator new(0x10uLL);
    v11 = v6 + 4;
    v12 = (char *)(v6 + 4);
    *(_QWORD *)v6 = v13;
    v6[2] = v14;
    __p = v6;
    objc_msgSend(v5, "insertEntries:", &__p);
    if (__p)
    {
      v11 = __p;
      operator delete(__p);
    }

    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_27);
    v7 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(__p) = 0;
      _os_log_impl(&dword_2419D9000, v7, OS_LOG_TYPE_DEFAULT, "data migration aborted. keybag is locked", (uint8_t *)&__p, 2u);
    }
  }
  return v4;
}

- (BOOL)_migrateMiloDataFromLocationd
{
  void *v3;
  ULCLDatabaseMigrator *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  _DWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  unsigned int v18;
  __int128 v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  _DWORD *v23;
  int v24;
  id v26;
  _DWORD *v27;
  __int128 v28;
  void *v29;
  CFAbsoluteTime v30;
  void *__p;
  __int128 v32;
  __int16 v33;
  unsigned int v34;
  uint64_t v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (-[ULDataMigrator _checkKeybagUnlocked](self, "_checkKeybagUnlocked"))
  {
    -[ULDataMigrator _createLocationManagerWithMicroLocationBundle](self, "_createLocationManagerWithMicroLocationBundle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULDataMigrator _getPreviouslyExportedFileIfExistsAtPath:](self, "_getPreviouslyExportedFileIfExistsAtPath:", CFSTR("/var/tmp/com.apple.locationd/microLocationDB/ExportedMiloDB.db"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v11 = (id)-[ULDataMigrator localDb](self, "localDb")[112];
      v30 = cl::chrono::CFAbsoluteTimeClock::now();
      CLMicroLocationMigrationTable::Entry::Entry((uint64_t)&v35, 0, &v30);
      v12 = operator new(0x10uLL);
      *(_QWORD *)&v32 = v12 + 4;
      *((_QWORD *)&v32 + 1) = v12 + 4;
      *(_QWORD *)v12 = v35;
      v12[2] = v36;
      __p = v12;
      objc_msgSend(v11, "insertEntries:", &__p);
      if (__p)
      {
        *(_QWORD *)&v32 = __p;
        operator delete(__p);
      }

      +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "defaultsDictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULLocationdMigrationExportMaxAttempts");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        v17 = objc_msgSend(v16, "unsignedIntValue");
      else
        v17 = objc_msgSend(&unk_2511ED630, "unsignedIntValue");
      v18 = v17;

      if (!v18)
      {
LABEL_24:
        if (onceToken_MicroLocation_Default != -1)
          dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_27);
        v22 = logObject_MicroLocation_Default;
        if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(__p) = 0;
          _os_log_impl(&dword_2419D9000, v22, OS_LOG_TYPE_DEFAULT, "Failed to export milo data from locationd", (uint8_t *)&__p, 2u);
        }
        v4 = (ULCLDatabaseMigrator *)(id)-[ULDataMigrator localDb](self, "localDb")[112];
        v30 = cl::chrono::CFAbsoluteTimeClock::now();
        CLMicroLocationMigrationTable::Entry::Entry((uint64_t)&v35, 5, &v30);
        v23 = operator new(0x10uLL);
        *(_QWORD *)&v32 = v23 + 4;
        *((_QWORD *)&v32 + 1) = v23 + 4;
        *(_QWORD *)v23 = v35;
        v23[2] = v36;
        __p = v23;
        -[ULCLDatabaseMigrator insertEntries:](v4, "insertEntries:", &__p);
        if (__p)
        {
          *(_QWORD *)&v32 = __p;
          operator delete(__p);
        }
        v3 = 0;
        LOBYTE(v5) = 0;
        goto LABEL_34;
      }
      v20 = 1;
      *(_QWORD *)&v19 = 68289538;
      v28 = v19;
      while (1)
      {
        if (!-[ULDataMigrator _checkKeybagUnlocked](self, "_checkKeybagUnlocked", v28))
        {
          v3 = 0;
          goto LABEL_36;
        }
        -[ULDataMigrator _exportMiloDataFromLocationd:](self, "_exportMiloDataFromLocationd:", v29);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (v3)
          break;
        if (onceToken_MicroLocation_Default != -1)
          dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_27);
        v21 = logObject_MicroLocation_Default;
        if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
        {
          __p = (void *)v28;
          LOWORD(v32) = 2082;
          *(_QWORD *)((char *)&v32 + 2) = "";
          WORD5(v32) = 1026;
          HIDWORD(v32) = v20;
          v33 = 1026;
          v34 = v18;
          _os_log_impl(&dword_2419D9000, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Attempt to export data from locationd failed\", \"attempt\":%{public}u, \"maxAttempts\":%{public}u}", (uint8_t *)&__p, 0x1Eu);
        }
        if (++v20 > v18)
          goto LABEL_24;
      }
      v26 = (id)-[ULDataMigrator localDb](self, "localDb")[112];
      v30 = cl::chrono::CFAbsoluteTimeClock::now();
      CLMicroLocationMigrationTable::Entry::Entry((uint64_t)&v35, 4, &v30);
      v27 = operator new(0x10uLL);
      *(_QWORD *)&v32 = v27 + 4;
      *((_QWORD *)&v32 + 1) = v27 + 4;
      *(_QWORD *)v27 = v35;
      v27[2] = v36;
      __p = v27;
      objc_msgSend(v26, "insertEntries:", &__p);
      if (__p)
      {
        *(_QWORD *)&v32 = __p;
        operator delete(__p);
      }

    }
    if (!-[ULDataMigrator _checkKeybagUnlocked](self, "_checkKeybagUnlocked"))
    {
LABEL_36:
      LOBYTE(v5) = 0;
      goto LABEL_37;
    }
    v4 = -[ULCLDatabaseMigrator initWithLocalDb:]([ULCLDatabaseMigrator alloc], "initWithLocalDb:", -[ULDataMigrator localDb](self, "localDb"));
    v5 = -[ULCLDatabaseMigrator migrateCLDatabaseFromPath:](v4, "migrateCLDatabaseFromPath:", v3);
    if (((objc_msgSend(MEMORY[0x24BE669E0], "isMac") | !v5) & 1) == 0)
    {
      +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "defaultsDictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULDataMigrationPurgeLocationd");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        v10 = objc_msgSend(v9, "BOOLValue");
      else
        v10 = objc_msgSend(MEMORY[0x24BDBD1C8], "BOOLValue");
      v24 = v10;

      if (v24)
        objc_msgSend(v29, "purgeMicroLocationData");
    }
LABEL_34:

LABEL_37:
    return v5;
  }
  LOBYTE(v5) = 0;
  return v5;
}

- (id)_createLocationManagerWithMicroLocationBundle
{
  dispatch_queue_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  v3 = dispatch_queue_create("com.apple.milod.exportMiloDataFromLocationd", 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFA88]), "initWithEffectiveBundlePath:delegate:onQueue:", CFSTR("/System/Library/LocationBundles/Milod.bundle"), self, v3);
  if (!v4)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_27);
    v5 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2419D9000, v5, OS_LOG_TYPE_FAULT, "Failed to create location manager using MicroLocation bundle", v7, 2u);
    }
  }

  return v4;
}

- (id)_exportMiloDataFromLocationd:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  dispatch_time_t v13;
  NSObject *v14;
  id v15;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t buf;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = dispatch_semaphore_create(0);
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__5;
  v27 = __Block_byref_object_dispose__5;
  v28 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__5;
  v21[4] = __Block_byref_object_dispose__5;
  v22 = 0;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_27);
  v5 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    buf = 68289026;
    v30 = 2082;
    v31 = "";
    _os_log_impl(&dword_2419D9000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#dataMigrator, requesting export of milo database from locationd\"}", (uint8_t *)&buf, 0x12u);
  }
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __47__ULDataMigrator__exportMiloDataFromLocationd___block_invoke;
  v17[3] = &unk_2511D4108;
  v19 = &v23;
  v20 = v21;
  v6 = v4;
  v18 = v6;
  objc_msgSend(v3, "exportMicroLocationDataForMigrationWithCompletion:", v17);
  +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultsDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULLocationdMigrationExportTimeout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v11 = objc_msgSend(v10, "unsignedIntValue");
  else
    v11 = objc_msgSend(&unk_2511ED618, "unsignedIntValue");
  v12 = v11;

  v13 = dispatch_time(0, 1000000000 * v12);
  if (dispatch_semaphore_wait(v6, v13))
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_27);
    v14 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_2419D9000, v14, OS_LOG_TYPE_DEFAULT, "#dataMigrator, timed out waiting for locationd db export to complete", (uint8_t *)&buf, 2u);
    }
  }
  v15 = (id)v24[5];

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v23, 8);

  return v15;
}

void __47__ULDataMigrator__exportMiloDataFromLocationd___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  int v30;
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  _QWORD v40[3];

  v40[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_27);
  v7 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v30 = 68289026;
    v31 = 0;
    v32 = 2082;
    v33 = "";
    _os_log_impl(&dword_2419D9000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#dataMigrator, export milo database handler called\"}", (uint8_t *)&v30, 0x12u);
  }
  if (v5 || !v6)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_27);
    v25 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "localizedDescription");
      v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v27 = objc_msgSend(v26, "UTF8String");
      v30 = 68289282;
      v31 = 0;
      v32 = 2082;
      v33 = "";
      v34 = 2082;
      v35 = v27;
      _os_log_impl(&dword_2419D9000, v25, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#dataMigrator, locationd export of milo database failed!\", \"error: \":%{public, location:escape_only}s}", (uint8_t *)&v30, 0x1Cu);

    }
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_27);
    v9 = (id)logObject_MicroLocation_Default;
    if (os_signpost_enabled(v9))
    {
      objc_msgSend(v5, "localizedDescription");
      v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v29 = objc_msgSend(v28, "UTF8String");
      v30 = 68289282;
      v31 = 0;
      v32 = 2082;
      v33 = "";
      v34 = 2082;
      v35 = v29;
      _os_signpost_emit_with_name_impl(&dword_2419D9000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#dataMigrator, locationd export of milo database failed!", "{\"msg%{public}.0s\":\"#dataMigrator, locationd export of milo database failed!\", \"error: \":%{public, location:escape_only}s}", (uint8_t *)&v30, 0x1Cu);

    }
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("ExportDir"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");

    objc_msgSend(v6, "objectForKey:", CFSTR("FileName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

    v12 = (void *)MEMORY[0x24BDBCF48];
    v40[0] = v9;
    v40[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fileURLWithPathComponents:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    objc_msgSend(v6, "objectForKey:", CFSTR("SandboxExt"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_27);
    v21 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = -[NSObject UTF8String](objc_retainAutorelease(v9), "UTF8String");
      v23 = objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
      v24 = objc_msgSend(objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)), "UTF8String");
      v30 = 68289795;
      v31 = 0;
      v32 = 2082;
      v33 = "";
      v34 = 2081;
      v35 = v22;
      v36 = 2081;
      v37 = v23;
      v38 = 2081;
      v39 = v24;
      _os_log_impl(&dword_2419D9000, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#dataMigrator, locationd export of milo database completed successfully.\", \"exportedDatabaseDirectory: \":%{private, location:escape_only}s, \"microLocationExportedDatabaseFileName: \":%{private, location:escape_only}s, \"sandbox token: \":%{private, location:escape_only}s}", (uint8_t *)&v30, 0x30u);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (int64_t)_getCAMigrationErrorTypeForLastMigrationStateAfterMaxFailures:(int)a3
{
  if ((a3 - 1) > 0xA)
    return 3;
  else
    return qword_241BB40F0[a3 - 1];
}

- (BOOL)_initializeMigrationStatusMetricsDict:(id)a3 forType:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  double *v10;
  double *v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  unsigned int v22;
  double *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  __int16 v31;
  void *__p;
  char *v33;
  uint64_t v34;

  v6 = a3;
  if (v6)
  {
    v7 = (id)-[ULDataMigrator localDb](self, "localDb")[112];
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "fetchAllRecordsWithLimit:", 0);
    }
    else
    {
      __p = 0;
      v33 = 0;
      v34 = 0;
    }

    v10 = (double *)__p;
    v11 = (double *)v33;
    if (__p == v33)
    {
      v12 = 0;
      v16 = -1;
      v11 = (double *)__p;
      goto LABEL_29;
    }
    v12 = 0;
    v13 = (char *)__p;
    do
    {
      if (*((_DWORD *)v13 + 2) == 3)
        ++v12;
      v13 += 16;
    }
    while (v13 != v33);
    v14 = (char *)__p;
    while (*((_DWORD *)v14 + 2) != 2)
    {
      v14 += 16;
      if (v14 == v33)
      {
        v15 = (char *)__p;
        goto LABEL_18;
      }
    }
    v15 = (char *)__p;
    if (v14 != v33)
    {
      v16 = -1;
      goto LABEL_29;
    }
LABEL_18:
    while (*((_DWORD *)v15 + 2) != 1)
    {
      v15 += 16;
      if (v15 == v33)
        goto LABEL_23;
    }
    if (v15 != v33)
    {
      v12 = 0;
      v16 = 4;
      goto LABEL_29;
    }
LABEL_23:
    +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "defaultsDictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULDataMigrationMaxAttempts");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v21 = objc_msgSend(v20, "unsignedIntValue");
    else
      v21 = objc_msgSend(&unk_2511ED600, "unsignedIntValue");
    v22 = v21;

    if (v12 >= v22)
    {
      v16 = -[ULDataMigrator _getCAMigrationErrorTypeForLastMigrationStateAfterMaxFailures:](self, "_getCAMigrationErrorTypeForLastMigrationStateAfterMaxFailures:", *((unsigned int *)__p + 2));
      v12 = 0;
      v10 = (double *)__p;
      v11 = (double *)v33;
LABEL_29:
      while (v11 != v10)
      {
        v23 = v11;
        v24 = *((_DWORD *)v11 - 2);
        v11 -= 2;
        if (v24 == 3)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v25, CFSTR("MigrationType"));

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, CFSTR("MigrationAttampts"));

          if (!v12)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v16);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v27, CFSTR("MigrationErrorType"));

          }
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)__p - *(v23 - 2));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v28, CFSTR("MigrationDuration"));

          v9 = 1;
          goto LABEL_39;
        }
      }
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_27);
      v29 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        v31 = 0;
        _os_log_impl(&dword_2419D9000, v29, OS_LOG_TYPE_ERROR, "unexpected Error, MigrationInit entry not found", (uint8_t *)&v31, 2u);
      }
    }
    v9 = 0;
LABEL_39:
    if (__p)
    {
      v33 = (char *)__p;
      operator delete(__p);
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (ULDatabase)localDb
{
  return self->_localDb;
}

- (void)setLocalDb:(ULDatabase *)a3
{
  self->_localDb = a3;
}

- (IDataProtectionDelegate)dataProtectionDelegate
{
  return self->_dataProtectionDelegate;
}

- (void)setDataProtectionDelegate:(IDataProtectionDelegate *)a3
{
  self->_dataProtectionDelegate = a3;
}

- (void)eventLogger
{
  return self->_eventLogger;
}

- (void)setEventLogger:(void *)a3
{
  self->_eventLogger = a3;
}

@end
