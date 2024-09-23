@implementation ULBackupAndRestore

- (ULBackupAndRestore)initWithDatabase:(ULDatabase *)a3 andEventLogger:(void *)a4
{
  ULBackupAndRestore *v6;
  ULBackupAndRestore *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ULBackupAndRestore;
  v6 = -[ULBackupAndRestore init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[ULBackupAndRestore setDb:](v6, "setDb:", a3);
    -[ULBackupAndRestore setEventLogger:](v7, "setEventLogger:", a4);
  }
  return v7;
}

- (BOOL)exportiCloudBackupWithCancelFunc:(function<BOOL)(
{
  NSObject *v5;
  BOOL v6;
  const char *v7;
  ULDatabase *v8;
  NSObject *v9;
  CLMicroLocationEventLogger *v10;
  uint64_t v11;
  double v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  int v17[7];
  int v18;
  _QWORD v19[6];
  _BYTE v20[24];
  _BYTE *v21;
  __int128 v22;
  Entry buf;
  uint64_t v24;
  char v25;
  _QWORD v26[40];

  v26[39] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(MEMORY[0x24BE669E0], "isMac"))
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
    v5 = logObject_MicroLocation_Default;
    v6 = 0;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf.var0.var0 = 0;
      v7 = "Export iCloud backup - activity disabled for macos";
LABEL_23:
      _os_log_impl(&dword_2419D9000, v5, OS_LOG_TYPE_DEFAULT, v7, buf.var0.var0, 2u);
      return 0;
    }
    return v6;
  }
  if ((ULSettings::get<ULSettings::EnableCloudBackup>() & 1) != 0)
  {
    v8 = -[ULBackupAndRestore db](self, "db");
    if (((*((uint64_t (**)(ULDatabase *))v8->var0 + 2))(v8) & 1) == 0)
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
      v5 = logObject_MicroLocation_Default;
      v6 = 0;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf.var0.var0 = 0;
        v7 = "Export iCloud backup - aborted due to database not valid (possible migration pending)";
        goto LABEL_23;
      }
      return v6;
    }
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
    v9 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf.var0.var0 = 0;
      _os_log_impl(&dword_2419D9000, v9, OS_LOG_TYPE_DEFAULT, "Export iCloud backup", buf.var0.var0, 2u);
    }
    v10 = -[ULBackupAndRestore eventLogger](self, "eventLogger");
    v18 = 0;
    boost::uuids::detail::random_provider_base::random_provider_base((boost::uuids::detail::random_provider_base *)&v18);
    *(_QWORD *)&v22 = boost::uuids::random_generator_pure::operator()((uint64_t)&v18);
    *((_QWORD *)&v22 + 1) = v11;
    v12 = cl::chrono::CFAbsoluteTimeClock::now();
    CLMicroLocationProto::CloudBackupExport::CloudBackupExport((CLMicroLocationProto::CloudBackupExport *)v17);
    CLMicroLocationProtobufHelper::createLoggedEvent<CLMicroLocationProto::CloudBackupExport>(&v22, v17, (uint64_t)&buf, v12);
    CLMicroLocationEventLogger::logEvent(v10, &buf);
    CLMicroLocationProto::ReceivedEvent::~ReceivedEvent((CLMicroLocationProto::ReceivedEvent *)v26);
    CLMicroLocationProto::CloudBackupExport::~CloudBackupExport((CLMicroLocationProto::CloudBackupExport *)v17);
    boost::uuids::detail::random_provider_base::destroy((boost::uuids::detail::random_provider_base *)&v18);
    *(_QWORD *)buf.var0.var0 = 0;
    *(_QWORD *)&buf.var0.var0[8] = &buf;
    v24 = 0x2020000000;
    v25 = 0;
    +[ULTransactionManager shared](ULTransactionManager, "shared");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3321888768;
    v19[2] = __55__ULBackupAndRestore_exportiCloudBackupWithCancelFunc___block_invoke;
    v19[3] = &unk_2511DAF98;
    v19[4] = self;
    v19[5] = &buf;
    v14 = v20;
    std::__function::__value_func<double ()(CLMicroLocationFingerprint const&,CLMicroLocationFingerprint const&)>::__value_func[abi:ne180100]((uint64_t)v20, (uint64_t)a3);
    objc_msgSend(v13, "performUnderTransaction:block:", CFSTR("com.apple.milod.exportiCloudBackup"), v19);

    v6 = *(_BYTE *)(*(_QWORD *)&buf.var0.var0[8] + 24) != 0;
    if (v21 == v20)
    {
      v15 = 4;
    }
    else
    {
      if (!v21)
      {
LABEL_26:
        _Block_object_dispose(&buf, 8);
        return v6;
      }
      v15 = 5;
      v14 = v21;
    }
    (*(void (**)(_QWORD *))(*v14 + 8 * v15))(v14);
    goto LABEL_26;
  }
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
  v5 = logObject_MicroLocation_Default;
  v6 = 0;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf.var0.var0 = 0;
    v7 = "#Warning Tried to export db for iCloud backup, but iCloud backup feature is disabled";
    goto LABEL_23;
  }
  return v6;
}

_QWORD *__55__ULBackupAndRestore_exportiCloudBackupWithCancelFunc___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *result;
  uint64_t v4;
  _BYTE v5[24];
  _BYTE *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  std::__function::__value_func<double ()(CLMicroLocationFingerprint const&,CLMicroLocationFingerprint const&)>::__value_func[abi:ne180100]((uint64_t)v5, a1 + 48);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "_exportiCloudBackupTransactionWithCancelFunc:", v5);
  result = v6;
  if (v6 == v5)
  {
    v4 = 4;
    result = v5;
  }
  else
  {
    if (!v6)
      return result;
    v4 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v4))();
}

- (BOOL)importiCloudBackup
{
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  CLMicroLocationEventLogger *v6;
  uint64_t v7;
  double v8;
  void *v9;
  BOOL v10;
  _QWORD v12[6];
  int v13[7];
  int v14;
  __int128 v15;
  Entry buf;
  uint64_t v17;
  char v18;
  _QWORD v19[40];

  v19[39] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(MEMORY[0x24BE669E0], "isMac"))
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
    v3 = logObject_MicroLocation_Default;
    if (!os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      return 1;
    *(_WORD *)buf.var0.var0 = 0;
    v4 = "Import iCloud backup - activity disabled for macos";
LABEL_16:
    _os_log_impl(&dword_2419D9000, v3, OS_LOG_TYPE_DEFAULT, v4, buf.var0.var0, 2u);
    return 1;
  }
  if ((ULSettings::get<ULSettings::EnableCloudBackup>() & 1) == 0)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
    v3 = logObject_MicroLocation_Default;
    if (!os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      return 1;
    *(_WORD *)buf.var0.var0 = 0;
    v4 = "#Warning Tried to import db from iCloud restored backup, but iCloud backup feature is disabled";
    goto LABEL_16;
  }
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
  v5 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf.var0.var0 = 0;
    _os_log_impl(&dword_2419D9000, v5, OS_LOG_TYPE_DEFAULT, "Import iCloud backup", buf.var0.var0, 2u);
  }
  v6 = -[ULBackupAndRestore eventLogger](self, "eventLogger");
  v14 = 0;
  boost::uuids::detail::random_provider_base::random_provider_base((boost::uuids::detail::random_provider_base *)&v14);
  *(_QWORD *)&v15 = boost::uuids::random_generator_pure::operator()((uint64_t)&v14);
  *((_QWORD *)&v15 + 1) = v7;
  v8 = cl::chrono::CFAbsoluteTimeClock::now();
  CLMicroLocationProto::CloudBackupImport::CloudBackupImport((CLMicroLocationProto::CloudBackupImport *)v13);
  CLMicroLocationProtobufHelper::createLoggedEvent<CLMicroLocationProto::CloudBackupImport>(&v15, v13, (uint64_t)&buf, v8);
  CLMicroLocationEventLogger::logEvent(v6, &buf);
  CLMicroLocationProto::ReceivedEvent::~ReceivedEvent((CLMicroLocationProto::ReceivedEvent *)v19);
  CLMicroLocationProto::CloudBackupImport::~CloudBackupImport((CLMicroLocationProto::CloudBackupImport *)v13);
  boost::uuids::detail::random_provider_base::destroy((boost::uuids::detail::random_provider_base *)&v14);
  *(_QWORD *)buf.var0.var0 = 0;
  *(_QWORD *)&buf.var0.var0[8] = &buf;
  v17 = 0x2020000000;
  v18 = 0;
  +[ULTransactionManager shared](ULTransactionManager, "shared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __40__ULBackupAndRestore_importiCloudBackup__block_invoke;
  v12[3] = &unk_2511D40E0;
  v12[4] = self;
  v12[5] = &buf;
  objc_msgSend(v9, "performUnderTransaction:block:", CFSTR("com.apple.milod.importiCloudBackup"), v12);

  v10 = *(_BYTE *)(*(_QWORD *)&buf.var0.var0[8] + 24) != 0;
  _Block_object_dispose(&buf, 8);
  return v10;
}

uint64_t __40__ULBackupAndRestore_importiCloudBackup__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_importiCloudBackupTransaction");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)deleteBackupFiles
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ULBackupAndRestore getBackupDatabasePath](self, "getBackupDatabasePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeItemAtPath:error:", v3, 0);
  v4 = -[ULBackupAndRestore _getTempBackupDatabaseDirectoryClearCurrent:createNew:](self, "_getTempBackupDatabaseDirectoryClearCurrent:createNew:", 1, 0);

}

- (id)getBackupDatabasePath
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)-[ULBackupAndRestore db](self, "db")[8], "storesDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("miloBackup.db"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_exportiCloudBackupTransactionWithCancelFunc:(function<BOOL)(
{
  void *v5;
  void *v6;
  ULDatabase *v7;
  NSURL *v8;
  NSURL *v9;
  char v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  _QWORD *v14;
  uint64_t v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  char v19;
  BOOL v21;
  _QWORD *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  NSObject *v27;
  double v28;
  double v29;
  NSObject *v30;
  unint64_t v31;
  id v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  double v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  unint64_t v45;
  _BYTE v46[24];
  _BYTE *v47;
  _BYTE v48[24];
  _BYTE *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULBackupAndRestore _getTempBackupDatabaseDirectoryClearCurrent:createNew:](self, "_getTempBackupDatabaseDirectoryClearCurrent:createNew:", 1, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (ULDatabase *)operator new();
    ULDatabase::ULDatabase(v7);
    +[ULPersistenceManager defaultModelsDirectory](ULPersistenceManager, "defaultModelsDirectory");
    v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v6);
    v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v10 = ULDatabase::initWithModelsDirectoryAndStoresDirectory(v7, v8, v9, 0);

    if ((v10 & 1) == 0)
    {
      LOBYTE(v16) = 0;
LABEL_41:
      (*((void (**)(ULDatabase *))v7->var0 + 1))(v7);
      goto LABEL_42;
    }
    +[ULKeychain getSymmetricKeyOrCreateNew:](_TtC19MicroLocationDaemon10ULKeychain, "getSymmetricKeyOrCreateNew:", CFSTR("com.apple.milod.security.database.backup"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
      v17 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2419D9000, v17, OS_LOG_TYPE_ERROR, "Failed to get key for backup encryption", buf, 2u);
      }
      LOBYTE(v16) = 0;
      goto LABEL_40;
    }
    -[ULBackupAndRestore getBackupDatabasePath](self, "getBackupDatabasePath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    std::__function::__value_func<double ()(CLMicroLocationFingerprint const&,CLMicroLocationFingerprint const&)>::__value_func[abi:ne180100]((uint64_t)v48, (uint64_t)a3);
    v13 = -[ULBackupAndRestore _exportToDatabase:withCancelFunc:](self, "_exportToDatabase:withCancelFunc:", v7, v48);
    v14 = v49;
    if (v49 == v48)
    {
      v15 = 4;
      v14 = v48;
    }
    else
    {
      if (!v49)
      {
LABEL_16:
        if (!v13)
          goto LABEL_33;
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "fileExistsAtPath:", v12);

        if (!((v19 & 1) != 0
             ? -[ULBackupAndRestore _setExcludeFromBackupAttribute:withValue:](self, "_setExcludeFromBackupAttribute:withValue:", v12, 1): -[ULBackupAndRestore _createBackupDbPathWithAttributes:](self, "_createBackupDbPathWithAttributes:", v12)))goto LABEL_33;
        std::__function::__value_func<double ()(CLMicroLocationFingerprint const&,CLMicroLocationFingerprint const&)>::__value_func[abi:ne180100]((uint64_t)v46, (uint64_t)a3);
        v21 = -[ULBackupAndRestore _didReceiveCancel:](self, "_didReceiveCancel:", v46);
        v22 = v47;
        if (v47 == v46)
        {
          v23 = 4;
          v22 = v46;
        }
        else
        {
          if (!v47)
          {
LABEL_26:
            if (v21)
            {
              LOBYTE(v16) = 0;
LABEL_39:

LABEL_40:
              goto LABEL_41;
            }
            v33 = v7->var1;
            objc_msgSend(v33, "getLocalStoreURL");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "path");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = +[ULEncryption encryptFile:destinationPath:keyLabel:keychainClass:](_TtC19MicroLocationDaemon12ULEncryption, "encryptFile:destinationPath:keyLabel:keychainClass:", v25, v12, CFSTR("com.apple.milod.security.database.backup"), objc_opt_class());

            if (v26)
            {
              v16 = -[ULBackupAndRestore _setExcludeFromBackupAttribute:withValue:](self, "_setExcludeFromBackupAttribute:withValue:", v12, 0);
LABEL_34:
              -[ULBackupAndRestore _deleteTempDb:](self, "_deleteTempDb:", v7);
              objc_msgSend(v5, "timeIntervalSinceNow");
              v29 = v28;
              if (onceToken_MicroLocation_Default != -1)
                dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
              v30 = (id)logObject_MicroLocation_Default;
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                v31 = -[ULBackupAndRestore _getFileSize:](self, "_getFileSize:", v12);
                *(_DWORD *)buf = 68290051;
                v35 = 0;
                v36 = 2082;
                v37 = "";
                v38 = 1025;
                v39 = v16;
                v40 = 2049;
                v41 = -v29;
                v42 = 2113;
                v43 = v12;
                v44 = 2049;
                v45 = v31;
                _os_log_impl(&dword_2419D9000, v30, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"MiLo export for iCloud backup\", \"result\":%{private}hhd, \"duration [s]\":\"%{private}f\", \"file path\":%{private, location:escape_only}@, \"file size [B]\":%{private}llu}", buf, 0x36u);
              }

              goto LABEL_39;
            }
            _CLLogObjectForCategory_MicroLocation_Default();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2419D9000, v27, OS_LOG_TYPE_ERROR, "Failed to encrypt backup file", buf, 2u);
            }

LABEL_33:
            v16 = 0;
            goto LABEL_34;
          }
          v23 = 5;
        }
        (*(void (**)(void))(*v22 + 8 * v23))();
        goto LABEL_26;
      }
      v15 = 5;
    }
    (*(void (**)(void))(*v14 + 8 * v15))();
    goto LABEL_16;
  }
  LOBYTE(v16) = 0;
LABEL_42:

  return v16;
}

- (BOOL)_importiCloudBackupTransaction
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  ULDatabase *v8;
  NSURL *v9;
  NSURL *v10;
  char v11;
  id v12;
  unint64_t v13;
  void *v14;
  id v15;
  _BOOL4 v16;
  NSObject *v17;
  id v18;
  _DWORD *v19;
  _DWORD *v20;
  NSObject *v21;
  _DWORD *v22;
  NSObject *v23;
  id v24;
  _DWORD *v25;
  double v26;
  double v27;
  NSObject *v28;
  CFAbsoluteTime v30;
  uint8_t buf[8];
  _BYTE v32[26];
  __int16 v33;
  void *v34;
  __int16 v35;
  unint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULBackupAndRestore getBackupDatabasePath](self, "getBackupDatabasePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  if ((v6 & 1) != 0)
  {
    -[ULBackupAndRestore _getTempBackupDatabaseDirectoryClearCurrent:createNew:](self, "_getTempBackupDatabaseDirectoryClearCurrent:createNew:", 1, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (ULDatabase *)operator new();
      ULDatabase::ULDatabase(v8);
      +[ULPersistenceManager defaultModelsDirectory](ULPersistenceManager, "defaultModelsDirectory");
      v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v7);
      v10 = (NSURL *)objc_claimAutoreleasedReturnValue();
      v11 = ULDatabase::initWithModelsDirectoryAndStoresDirectory(v8, v9, v10, 0);

      if ((v11 & 1) != 0)
      {
        +[ULKeychain retrieveSymmetricKey:](_TtC19MicroLocationDaemon10ULKeychain, "retrieveSymmetricKey:", CFSTR("com.apple.milod.security.database.backup"));
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = -[ULBackupAndRestore _getFileSize:](self, "_getFileSize:", v4);
          objc_msgSend(v8->var1, "getLocalStoreURL");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "path");
          v15 = (id)objc_claimAutoreleasedReturnValue();

          if (+[ULEncryption decryptFile:destinationPath:keyLabel:keychainClass:](_TtC19MicroLocationDaemon12ULEncryption, "decryptFile:destinationPath:keyLabel:keychainClass:", v4, v15, CFSTR("com.apple.milod.security.database.backup"), objc_opt_class()))
          {
            -[ULBackupAndRestore _setClassBAttributeToFile:](self, "_setClassBAttributeToFile:", v15);
            v16 = -[ULBackupAndRestore _importFromDatabase:](self, "_importFromDatabase:", v8);
          }
          else
          {
            if (onceToken_MicroLocation_Default != -1)
              dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
            v23 = logObject_MicroLocation_Default;
            if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2419D9000, v23, OS_LOG_TYPE_ERROR, "Failed to decrypt restored backup file", buf, 2u);
            }
            v24 = (id)-[ULBackupAndRestore db](self, "db")[112];
            v30 = cl::chrono::CFAbsoluteTimeClock::now();
            CLMicroLocationMigrationTable::Entry::Entry((uint64_t)&v37, 9, &v30);
            v25 = operator new(0x10uLL);
            *(_QWORD *)v32 = v25 + 4;
            *(_QWORD *)&v32[8] = v25 + 4;
            *(_QWORD *)v25 = v37;
            v25[2] = v38;
            *(_QWORD *)buf = v25;
            objc_msgSend(v24, "insertEntries:", buf);
            if (*(_QWORD *)buf)
            {
              *(_QWORD *)v32 = *(_QWORD *)buf;
              operator delete(*(void **)buf);
            }

            v16 = 0;
          }
          -[ULBackupAndRestore _deleteTempDb:](self, "_deleteTempDb:", v8);
          objc_msgSend(v3, "timeIntervalSinceNow");
          v27 = v26;
          if (onceToken_MicroLocation_Default != -1)
            dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
          v28 = logObject_MicroLocation_Default;
          if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68290051;
            *(_DWORD *)&buf[4] = 0;
            *(_WORD *)v32 = 2082;
            *(_QWORD *)&v32[2] = "";
            *(_WORD *)&v32[10] = 1025;
            *(_DWORD *)&v32[12] = v16;
            *(_WORD *)&v32[16] = 2049;
            *(double *)&v32[18] = -v27;
            v33 = 2113;
            v34 = v4;
            v35 = 2049;
            v36 = v13;
            _os_log_impl(&dword_2419D9000, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"MiLo import from iCloud restored backup\", \"result\":%{private}hhd, \"duration [s]\":\"%{private}f\", \"file path\":%{private, location:escape_only}@, \"file size [B]\":%{private}llu}", buf, 0x36u);
          }
        }
        else
        {
          if (onceToken_MicroLocation_Default != -1)
            dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
          v21 = logObject_MicroLocation_Default;
          if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2419D9000, v21, OS_LOG_TYPE_ERROR, "Failed to get key for backup decryption", buf, 2u);
          }
          v15 = (id)-[ULBackupAndRestore db](self, "db")[112];
          v30 = cl::chrono::CFAbsoluteTimeClock::now();
          CLMicroLocationMigrationTable::Entry::Entry((uint64_t)&v37, 8, &v30);
          v22 = operator new(0x10uLL);
          *(_QWORD *)v32 = v22 + 4;
          *(_QWORD *)&v32[8] = v22 + 4;
          *(_QWORD *)v22 = v37;
          v22[2] = v38;
          *(_QWORD *)buf = v22;
          objc_msgSend(v15, "insertEntries:", buf);
          if (*(_QWORD *)buf)
          {
            *(_QWORD *)v32 = *(_QWORD *)buf;
            operator delete(*(void **)buf);
          }
          LOBYTE(v16) = 0;
        }

      }
      else
      {
        v12 = (id)-[ULBackupAndRestore db](self, "db")[112];
        v30 = cl::chrono::CFAbsoluteTimeClock::now();
        CLMicroLocationMigrationTable::Entry::Entry((uint64_t)&v37, 11, &v30);
        v20 = operator new(0x10uLL);
        *(_QWORD *)v32 = v20 + 4;
        *(_QWORD *)&v32[8] = v20 + 4;
        *(_QWORD *)v20 = v37;
        v20[2] = v38;
        *(_QWORD *)buf = v20;
        objc_msgSend(v12, "insertEntries:", buf);
        if (*(_QWORD *)buf)
        {
          *(_QWORD *)v32 = *(_QWORD *)buf;
          operator delete(*(void **)buf);
        }
        LOBYTE(v16) = 0;
      }

      (*((void (**)(ULDatabase *))v8->var0 + 1))(v8);
    }
    else
    {
      v18 = (id)-[ULBackupAndRestore db](self, "db")[112];
      v30 = cl::chrono::CFAbsoluteTimeClock::now();
      CLMicroLocationMigrationTable::Entry::Entry((uint64_t)&v37, 10, &v30);
      v19 = operator new(0x10uLL);
      *(_QWORD *)v32 = v19 + 4;
      *(_QWORD *)&v32[8] = v19 + 4;
      *(_QWORD *)v19 = v37;
      v19[2] = v38;
      *(_QWORD *)buf = v19;
      objc_msgSend(v18, "insertEntries:", buf);
      if (*(_QWORD *)buf)
      {
        *(_QWORD *)v32 = *(_QWORD *)buf;
        operator delete(*(void **)buf);
      }

      LOBYTE(v16) = 0;
    }

  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
    v17 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289283;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v32 = 2082;
      *(_QWORD *)&v32[2] = "";
      *(_WORD *)&v32[10] = 2113;
      *(_QWORD *)&v32[12] = v4;
      _os_log_impl(&dword_2419D9000, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Skipping Microlocation iCloud restore. Restored backup file does not exist\", \"filePath\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    LOBYTE(v16) = 1;
  }

  return v16;
}

- (void)_deleteTempDb:(ULDatabase *)a3
{
  void *v4;
  void *v5;
  id v6;

  ULDatabase::destroyStore(a3);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3->var1, "getLocalStoreURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeItemAtPath:error:", v5, 0);

}

- (unint64_t)_getFileSize:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v4, "attributesOfItemAtPath:error:", v3, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  v7 = objc_msgSend(v5, "fileSize");

  if (v6)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
    v8 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289539;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2113;
      v16 = v3;
      v17 = 2113;
      v18 = v6;
      _os_log_impl(&dword_2419D9000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Failed to get file size\", \"filePath\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
    }
  }

  return v7;
}

- (BOOL)_clearTempBackupDirectory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  id v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ULPersistenceManager defaultLocalStoreFilename](ULPersistenceManager, "defaultLocalStoreFilename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "fileExistsAtPath:", v6))
  {
    v8 = 0;
    goto LABEL_13;
  }
  v13 = 0;
  v7 = objc_msgSend(v4, "removeItemAtPath:error:", v6, &v13);
  v8 = v13;
  if ((v7 & 1) != 0)
  {
LABEL_13:
    v11 = 1;
    goto LABEL_14;
  }
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
  v9 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 68289539;
    v15 = 0;
    v16 = 2082;
    v17 = "";
    v18 = 2113;
    v19 = v6;
    v20 = 2114;
    v21 = v8;
    _os_log_impl(&dword_2419D9000, v9, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Failed to remove existing temp database\", \"filePath\":%{private, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
  v10 = logObject_MicroLocation_Default;
  if (os_signpost_enabled((os_log_t)logObject_MicroLocation_Default))
  {
    *(_DWORD *)buf = 68289539;
    v15 = 0;
    v16 = 2082;
    v17 = "";
    v18 = 2113;
    v19 = v6;
    v20 = 2114;
    v21 = v8;
    _os_signpost_emit_with_name_impl(&dword_2419D9000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Failed to remove existing temp database", "{\"msg%{public}.0s\":\"Failed to remove existing temp database\", \"filePath\":%{private, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  v11 = 0;
LABEL_14:

  return v11;
}

- (BOOL)_createTempBackupDirectoryIfNotExists:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "fileExistsAtPath:", v3) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 511);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x24BDD0CC8];
    v22[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v5 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, v7, &v12);
    v8 = v12;

    if ((v5 & 1) == 0)
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
      v9 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289539;
        v14 = 0;
        v15 = 2082;
        v16 = "";
        v17 = 2113;
        v18 = v3;
        v19 = 2114;
        v20 = v8;
        _os_log_impl(&dword_2419D9000, v9, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Failed to create temp backup directory\", \"directory\":%{private, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
      }
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
      v10 = logObject_MicroLocation_Default;
      if (os_signpost_enabled((os_log_t)logObject_MicroLocation_Default))
      {
        *(_DWORD *)buf = 68289539;
        v14 = 0;
        v15 = 2082;
        v16 = "";
        v17 = 2113;
        v18 = v3;
        v19 = 2114;
        v20 = v8;
        _os_signpost_emit_with_name_impl(&dword_2419D9000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Failed to create temp backup directory", "{\"msg%{public}.0s\":\"Failed to create temp backup directory\", \"directory\":%{private, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
      }
    }

  }
  return v5;
}

- (id)_getTempBackupDatabaseDirectoryClearCurrent:(BOOL)a3 createNew:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  id v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v4 = a4;
  v5 = a3;
  v30[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSTemporaryDirectory();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 493);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = *MEMORY[0x24BDD0CC8];
  v30[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v11 = objc_msgSend(v7, "setAttributes:ofItemAtPath:error:", v10, v8, &v20);
  v12 = v20;

  if ((v11 & 1) == 0)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
    v16 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      *(_DWORD *)buf = 68289539;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2081;
      v26 = v17;
      v27 = 2114;
      v28 = v12;
      _os_log_impl(&dword_2419D9000, v16, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Failed to set attributes for directory\", \"directory\":%{private, location:escape_only}s, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
    }

    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
    v14 = (id)logObject_MicroLocation_Default;
    if (os_signpost_enabled(v14))
    {
      v18 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      *(_DWORD *)buf = 68289539;
      v22 = 0;
      v23 = 2082;
      v24 = "";
      v25 = 2081;
      v26 = v18;
      v27 = 2114;
      v28 = v12;
      _os_signpost_emit_with_name_impl(&dword_2419D9000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Failed to set attributes for directory", "{\"msg%{public}.0s\":\"Failed to set attributes for directory\", \"directory\":%{private, location:escape_only}s, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
    }
    goto LABEL_15;
  }
  objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("com.apple.milod"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingPathComponent:", CFSTR("miloTempBackup"));
  v14 = objc_claimAutoreleasedReturnValue();

  if (v5 && !-[ULBackupAndRestore _clearTempBackupDirectory:](self, "_clearTempBackupDirectory:", v14)
    || v4
    && !-[ULBackupAndRestore _createTempBackupDirectoryIfNotExists:](self, "_createTempBackupDirectoryIfNotExists:", v14))
  {
LABEL_15:
    v15 = 0;
    goto LABEL_16;
  }
  v14 = v14;
  v15 = v14;
LABEL_16:

  return v15;
}

- (BOOL)_createBackupDbPathWithAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  NSObject *v9;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x24BDD0CF0];
  v17[0] = *MEMORY[0x24BDD0CD8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "createFileAtPath:contents:attributes:", v4, 0, v6);

  if ((v7 & 1) != 0)
  {
    v8 = -[ULBackupAndRestore _setExcludeFromBackupAttribute:withValue:](self, "_setExcludeFromBackupAttribute:withValue:", v4, 1);
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
    v9 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_INFO))
    {
      v11[0] = 68289283;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2113;
      v15 = v4;
      _os_log_impl(&dword_2419D9000, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Failed to create file at path\", \"filename\":%{private, location:escape_only}@}", (uint8_t *)v11, 0x1Cu);
    }
    v8 = 0;
  }

  return v8;
}

- (BOOL)_setClassBAttributeToFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x24BDD0CF0];
  v21[0] = *MEMORY[0x24BDD0CD8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v6 = objc_msgSend(v4, "setAttributes:ofItemAtPath:error:", v5, v3, &v11);
  v7 = v11;

  if ((v6 & 1) == 0)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
    v8 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289539;
      v13 = 0;
      v14 = 2082;
      v15 = "";
      v16 = 2113;
      v17 = v3;
      v18 = 2113;
      v19 = v7;
      _os_log_impl(&dword_2419D9000, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Failed to set attribute for path\", \"path\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
    }
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
    v9 = logObject_MicroLocation_Default;
    if (os_signpost_enabled((os_log_t)logObject_MicroLocation_Default))
    {
      *(_DWORD *)buf = 68289539;
      v13 = 0;
      v14 = 2082;
      v15 = "";
      v16 = 2113;
      v17 = v3;
      v18 = 2113;
      v19 = v7;
      _os_signpost_emit_with_name_impl(&dword_2419D9000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Failed to set attribute for path", "{\"msg%{public}.0s\":\"Failed to set attribute for path\", \"path\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
    }
  }

  return v6;
}

- (BOOL)_setExcludeFromBackupAttribute:(id)a3 withValue:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDBCC68];
  v14 = 0;
  v9 = objc_msgSend(v6, "setResourceValue:forKey:error:", v7, v8, &v14);
  v10 = v14;

  if ((v9 & 1) == 0)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
    v11 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289539;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = v5;
      v21 = 2113;
      v22 = v10;
      _os_log_impl(&dword_2419D9000, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Failed to set attribute for path\", \"path\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
    }
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
    v12 = logObject_MicroLocation_Default;
    if (os_signpost_enabled((os_log_t)logObject_MicroLocation_Default))
    {
      *(_DWORD *)buf = 68289539;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = v5;
      v21 = 2113;
      v22 = v10;
      _os_signpost_emit_with_name_impl(&dword_2419D9000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Failed to set attribute for path", "{\"msg%{public}.0s\":\"Failed to set attribute for path\", \"path\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
    }
  }

  return v9;
}

- (BOOL)_didReceiveCancel:(function<BOOL)(
{
  void *var1;
  int v4;
  NSObject *v5;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  var1 = a3->var0.var1;
  if (!var1)
    std::__throw_bad_function_call[abi:ne180100]();
  v4 = (*(uint64_t (**)(void *, SEL))(*(_QWORD *)var1 + 48))(var1, a2);
  if (v4)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
    v5 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 68289026;
      v7[1] = 0;
      v8 = 2082;
      v9 = "";
      _os_log_impl(&dword_2419D9000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Export backup - activity cancelled\"}", (uint8_t *)v7, 0x12u);
    }
  }
  return v4;
}

- (BOOL)_exportToDatabase:(ULDatabase *)a3 withCancelFunc:(function<BOOL)(
{
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  _QWORD *v16;
  uint64_t v17;
  NSObject *v18;
  BOOL v19;
  char *v20;
  id v21;
  uint64_t v22;
  id v23;
  int v24;
  char v25;
  BOOL v26;
  _QWORD *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  int v31;
  BOOL v32;
  _QWORD *v33;
  uint64_t v34;
  BOOL v35;
  _QWORD *v36;
  uint64_t v37;
  ULStore *v38;
  id v39;
  unsigned int v40;
  NSObject *v41;
  id v42;
  int v43;
  id v44;
  int v45;
  id v46;
  int v47;
  int v48;
  NSObject *v49;
  NSObject *v50;
  void *__p;
  void *v53;
  uint64_t v54;
  void *v55;
  _BYTE *v56;
  uint64_t v57;
  uint8_t *v58;
  uint8_t buf[8];
  __int128 v60;
  __int16 v61;
  int v62;
  __int16 v63;
  int v64;
  __int16 v65;
  int v66;
  _BYTE v67[24];
  _BYTE *v68;
  _BYTE v69[24];
  _BYTE *v70;
  _BYTE v71[24];
  _BYTE *v72;
  _BYTE v73[24];
  _BYTE *v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
  v7 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2419D9000, v7, OS_LOG_TYPE_DEFAULT, "Exporting milo data", buf, 2u);
  }
  v8 = (id)-[ULBackupAndRestore db](self, "db")[56];
  +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultsDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULCloudBackupMaxLoiGroupIdsToExport");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v13 = objc_msgSend(v12, "unsignedIntValue");
  else
    v13 = objc_msgSend(&unk_2511EE2A8, "unsignedIntValue");
  v14 = v13;

  if (v8)
  {
    objc_msgSend(v8, "getDistinctHomeLoiGroupIdsWithLimit:", v14);
  }
  else
  {
    v55 = 0;
    v56 = 0;
    v57 = 0;
  }

  if (v56 == v55)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
    v18 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2419D9000, v18, OS_LOG_TYPE_DEFAULT, "No Home LoiGroupIds found in LOI table. Will backup an empty db", buf, 2u);
    }
    goto LABEL_20;
  }
  std::__function::__value_func<double ()(CLMicroLocationFingerprint const&,CLMicroLocationFingerprint const&)>::__value_func[abi:ne180100]((uint64_t)v73, (uint64_t)a4);
  v15 = -[ULBackupAndRestore _didReceiveCancel:](self, "_didReceiveCancel:", v73);
  v16 = v74;
  if (v74 == v73)
  {
    v17 = 4;
    v16 = v73;
  }
  else
  {
    if (!v74)
      goto LABEL_23;
    v17 = 5;
  }
  (*(void (**)(void))(*v16 + 8 * v17))();
LABEL_23:
  if (v15)
    goto LABEL_71;
  v20 = (char *)v55;
  if (v55 == v56)
  {
    v24 = 1;
  }
  else
  {
    do
    {
      v21 = (id)-[ULBackupAndRestore db](self, "db")[32];
      v22 = ULSettings::get<ULSettings::CloudBackupDefaultTableLimit>();
      if (v21)
      {
        objc_msgSend(v21, "fetchLatestConfigurationPerTypeAtLoi:withLimit:", v20, v22);
      }
      else
      {
        *(_QWORD *)buf = 0;
        v60 = 0uLL;
      }

      v23 = a3->var4;
      v24 = objc_msgSend(v23, "insertEntries:", buf);

      v58 = buf;
      std::vector<CLMicroLocationConfigurationTable::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&v58);
      v20 += 16;
      if (v20 == v56)
        v25 = 0;
      else
        v25 = v24;
    }
    while ((v25 & 1) != 0);
  }
  std::__function::__value_func<double ()(CLMicroLocationFingerprint const&,CLMicroLocationFingerprint const&)>::__value_func[abi:ne180100]((uint64_t)v71, (uint64_t)a4);
  v26 = -[ULBackupAndRestore _didReceiveCancel:](self, "_didReceiveCancel:", v71);
  v27 = v72;
  if (v72 == v71)
  {
    v28 = 4;
    v27 = v71;
  }
  else
  {
    if (!v72)
      goto LABEL_39;
    v28 = 5;
  }
  (*(void (**)(void))(*v27 + 8 * v28))();
LABEL_39:
  if (v26)
    goto LABEL_71;
  if (v24)
  {
    v29 = (id)-[ULBackupAndRestore db](self, "db")[56];
    v30 = ULSettings::get<ULSettings::CloudBackupDefaultTableLimit>();
    if (v29)
    {
      objc_msgSend(v29, "fetchLoiIdEntriesforLoiGroupIds:withLimit:", &v55, v30);
    }
    else
    {
      *(_QWORD *)buf = 0;
      v60 = 0uLL;
    }

    v31 = objc_msgSend(a3->var7, "insertEntries:", buf);
    v58 = buf;
    std::vector<CLMiLoLoiTable::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&v58);
  }
  else
  {
    v31 = 0;
  }
  std::__function::__value_func<double ()(CLMicroLocationFingerprint const&,CLMicroLocationFingerprint const&)>::__value_func[abi:ne180100]((uint64_t)v69, (uint64_t)a4);
  v32 = -[ULBackupAndRestore _didReceiveCancel:](self, "_didReceiveCancel:", v69);
  v33 = v70;
  if (v70 == v69)
  {
    v34 = 4;
    v33 = v69;
  }
  else
  {
    if (!v70)
      goto LABEL_51;
    v34 = 5;
  }
  (*(void (**)(void))(*v33 + 8 * v34))();
LABEL_51:
  if (v32)
    goto LABEL_71;
  if (v31)
  {
    __p = 0;
    v53 = 0;
    v54 = 0;
    std::vector<boost::uuids::uuid>::__init_with_size[abi:ne180100]<boost::uuids::uuid*,boost::uuids::uuid*>(&__p, v55, (uint64_t)v56, (v56 - (_BYTE *)v55) >> 4);
    v31 = -[ULBackupAndRestore _exportRecordingEventsForLoiGroupIds:toDatabase:](self, "_exportRecordingEventsForLoiGroupIds:toDatabase:", &__p, a3);
    if (__p)
    {
      v53 = __p;
      operator delete(__p);
    }
  }
  std::__function::__value_func<double ()(CLMicroLocationFingerprint const&,CLMicroLocationFingerprint const&)>::__value_func[abi:ne180100]((uint64_t)v67, (uint64_t)a4);
  v35 = -[ULBackupAndRestore _didReceiveCancel:](self, "_didReceiveCancel:", v67);
  v36 = v68;
  if (v68 == v67)
  {
    v37 = 4;
    v36 = v67;
  }
  else
  {
    if (!v68)
      goto LABEL_60;
    v37 = 5;
  }
  (*(void (**)(void))(*v36 + 8 * v37))();
LABEL_60:
  if (!v35)
  {
    if (v31)
    {
      v38 = -[ULStore initWithDb:]([ULStore alloc], "initWithDb:", a3);
      v39 = (id)-[ULBackupAndRestore db](self, "db")[64];
      v40 = ULSettings::get<ULSettings::CloudBackupPageSize>();
      LOBYTE(v40) = objc_msgSend(v39, "batchTransferRecordsUsingBatchSize:andLimit:usingDistinctRecords:intoTargetStore:", v40, ULSettings::get<ULSettings::CloudBackupMeasurementsLimit>(), 1, v38);

      if ((v40 & 1) != 0)
      {
        _CLLogObjectForCategory_MicroLocation_Default();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          v42 = a3->var11;
          v43 = objc_msgSend(v42, "count");
          v44 = a3->var8;
          v45 = objc_msgSend(v44, "count");
          v46 = a3->var4;
          v47 = objc_msgSend(v46, "count");
          v48 = objc_msgSend(a3->var7, "count");
          *(_DWORD *)buf = 68290051;
          *(_DWORD *)&buf[4] = 0;
          LOWORD(v60) = 2082;
          *(_QWORD *)((char *)&v60 + 2) = "";
          WORD5(v60) = 1025;
          HIDWORD(v60) = v43;
          v61 = 1025;
          v62 = v45;
          v63 = 1025;
          v64 = v47;
          v65 = 1025;
          v66 = v48;
          _os_log_impl(&dword_2419D9000, v41, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Successfully exported milo data\", \"RecordingEvent\":%{private}u, \"Measurement\":%{private}u, \"Configuration\":%{private}u, \"LOI\":%{private}u}", buf, 0x2Au);

        }
LABEL_20:
        v19 = 1;
        goto LABEL_72;
      }
    }
    _CLLogObjectForCategory_MicroLocation_Default();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      LOWORD(v60) = 2082;
      *(_QWORD *)((char *)&v60 + 2) = "";
      _os_log_impl(&dword_2419D9000, v49, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Failed to export milo data\"}", buf, 0x12u);
    }

    _CLLogObjectForCategory_MicroLocation_Default();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v50))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      LOWORD(v60) = 2082;
      *(_QWORD *)((char *)&v60 + 2) = "";
      _os_signpost_emit_with_name_impl(&dword_2419D9000, v50, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Failed to export milo data", "{\"msg%{public}.0s\":\"Failed to export milo data\"}", buf, 0x12u);
    }

  }
LABEL_71:
  v19 = 0;
LABEL_72:
  if (v55)
  {
    v56 = v55;
    operator delete(v55);
  }
  return v19;
}

- (BOOL)_exportRecordingEventsForLoiGroupIds:()vector<boost:(std:(ULDatabase *)a4 :allocator<boost::uuids::uuid>> *)a3 :uuids::uuid toDatabase:
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  int v23;
  uuid *var0;
  id v26;
  void *v27;
  __int128 *v28;
  char *v29;
  ULStore *v30;
  id v31;
  id v32;
  int v33;
  char *v35;
  char *v36;
  uint64_t v37;
  void *__p;
  char *v39;
  unint64_t v40;
  void *v41;
  _BYTE *v42;
  void **v43;
  void *v44[2];
  uint64_t v45;
  __int128 v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultsDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULCloudBackupRecordingEventsTableLimit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v11 = objc_msgSend(v10, "unsignedIntValue");
  else
    v11 = objc_msgSend(&unk_2511EE2F0, "unsignedIntValue");
  v12 = v11;

  ULSettings::getRecordingEventsForModelType((char **)&v41);
  v39 = 0;
  v40 = 0;
  __p = 0;
  std::vector<CLMicroLocationProto::EventType>::__init_with_size[abi:ne180100]<std::__wrap_iter<CLMicroLocationProto::EventType*>,std::__wrap_iter<CLMicroLocationProto::EventType*>>(&__p, v41, (uint64_t)v42, (v42 - (_BYTE *)v41) >> 2);
  v13 = v39;
  if ((unint64_t)v39 >= v40)
  {
    v15 = (char *)__p;
    v16 = (v39 - (_BYTE *)__p) >> 2;
    v17 = v16 + 1;
    if ((unint64_t)(v16 + 1) >> 62)
      std::vector<CLMicroLocationProto::ConfidenceReason>::__throw_length_error[abi:ne180100]();
    v18 = v40 - (_QWORD)__p;
    if ((uint64_t)(v40 - (_QWORD)__p) >> 1 > v17)
      v17 = v18 >> 1;
    if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFFCLL)
      v19 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v19 = v17;
    if (v19)
    {
      v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CLMicroLocationProto::ConfidenceReason>>((uint64_t)&v40, v19);
      v15 = (char *)__p;
      v13 = v39;
    }
    else
    {
      v20 = 0;
    }
    v21 = &v20[4 * v16];
    v22 = &v20[4 * v19];
    *(_DWORD *)v21 = 1;
    v14 = v21 + 4;
    while (v13 != v15)
    {
      v23 = *((_DWORD *)v13 - 1);
      v13 -= 4;
      *((_DWORD *)v21 - 1) = v23;
      v21 -= 4;
    }
    __p = v21;
    v39 = v14;
    v40 = (unint64_t)v22;
    if (v15)
      operator delete(v15);
  }
  else
  {
    *(_DWORD *)v39 = 1;
    v14 = v13 + 4;
  }
  v39 = v14;
  var0 = a3->var0;
  if (a3->var0 != a3->var1 && (_DWORD)v12 != 0)
  {
    do
    {
      v26 = (id)-[ULBackupAndRestore db](self, "db", v35, v36, v37)[88];
      v27 = v26;
      *(uuid *)v44 = *var0;
      LOBYTE(v45) = 1;
      if (v26)
      {
        objc_msgSend(v26, "fetchRecordingEventTriggersForLearningMeasurements:atLoiGroupId:", &v41, v44);
      }
      else
      {
        v35 = 0;
        v36 = 0;
        v37 = 0;
      }

      v44[0] = 0;
      v44[1] = 0;
      v45 = 0;
      std::vector<boost::uuids::uuid>::reserve(v44, 0xEF7BDEF7BDEF7BDFLL * ((v36 - v35) >> 3));
      v28 = (__int128 *)v35;
      v29 = v36;
      v43 = v44;
      while (v28 != (__int128 *)v29)
      {
        v46 = *v28;
        std::back_insert_iterator<std::vector<boost::uuids::uuid>>::operator=[abi:ne180100](&v43, &v46);
        v28 = (__int128 *)((char *)v28 + 248);
      }
      v30 = -[ULStore initWithDb:]([ULStore alloc], "initWithDb:", a4);
      v31 = (id)-[ULBackupAndRestore db](self, "db")[88];
      objc_msgSend(v31, "batchTransferRecordingEventsForRecordingUUIDs:withEventTypes:batchSize:andLimit:intoTargetStore:", v44, &__p, ULSettings::get<ULSettings::CloudBackupPageSize>(), v12, v30);

      v32 = a4->var11;
      v33 = objc_msgSend(v32, "count");

      if (v44[0])
      {
        v44[1] = v44[0];
        operator delete(v44[0]);
      }
      v44[0] = &v35;
      std::vector<CLMicroLocationRecordingEventsTable::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)v44);
      if (++var0 == a3->var1)
        break;
      v12 = (v12 - v33);
    }
    while ((_DWORD)v12);
  }
  if (__p)
  {
    v39 = (char *)__p;
    operator delete(__p);
  }
  if (v41)
  {
    v42 = v41;
    operator delete(v41);
  }
  return 1;
}

- (BOOL)_importFromDatabase:(ULDatabase *)a3
{
  NSObject *v5;
  id v6;
  _DWORD *v7;
  ULStore *v8;
  id v9;
  char v10;
  id v11;
  char v12;
  id v13;
  char v14;
  id v15;
  char v16;
  char v17;
  NSObject *v18;
  id v19;
  int v20;
  id v21;
  int v22;
  id v23;
  int v24;
  id v25;
  int v26;
  NSObject *v27;
  NSObject *v28;
  CFAbsoluteTime v30;
  uint8_t buf[8];
  __int128 v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  uint64_t v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
  v5 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2419D9000, v5, OS_LOG_TYPE_DEFAULT, "Importing milo data", buf, 2u);
  }
  v6 = (id)-[ULBackupAndRestore db](self, "db")[112];
  v30 = cl::chrono::CFAbsoluteTimeClock::now();
  CLMicroLocationMigrationTable::Entry::Entry((uint64_t)&v39, 1, &v30);
  v7 = operator new(0x10uLL);
  *(_QWORD *)&v32 = v7 + 4;
  *((_QWORD *)&v32 + 1) = v7 + 4;
  *(_QWORD *)v7 = v39;
  v7[2] = v40;
  *(_QWORD *)buf = v7;
  objc_msgSend(v6, "insertEntries:", buf);
  if (*(_QWORD *)buf)
  {
    *(_QWORD *)&v32 = *(_QWORD *)buf;
    operator delete(*(void **)buf);
  }

  v8 = -[ULStore initWithDb:]([ULStore alloc], "initWithDb:", -[ULBackupAndRestore db](self, "db"));
  v9 = a3->var4;
  v10 = objc_msgSend(v9, "batchTransferRecordsUsingBatchSize:andLimit:intoTargetStore:", ULSettings::get<ULSettings::CloudBackupPageSize>(), 0, v8);

  v11 = a3->var7;
  v12 = objc_msgSend(v11, "batchTransferRecordsUsingBatchSize:andLimit:intoTargetStore:", ULSettings::get<ULSettings::CloudBackupPageSize>(), 0, v8);

  v13 = a3->var11;
  v14 = objc_msgSend(v13, "batchTransferRecordsUsingBatchSize:andLimit:intoTargetStore:", ULSettings::get<ULSettings::CloudBackupPageSize>(), 0, v8);

  v15 = a3->var8;
  v16 = objc_msgSend(v15, "batchTransferRecordsUsingBatchSize:andLimit:usingDistinctRecords:intoTargetStore:", ULSettings::get<ULSettings::CloudBackupPageSize>(), 0, 0, v8);

  v17 = v10 & v12 & v14 & v16;
  if ((v17 & 1) != 0)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
    v18 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = a3->var11;
      v20 = objc_msgSend(v19, "count");
      v21 = a3->var8;
      v22 = objc_msgSend(v21, "count");
      v23 = a3->var4;
      v24 = objc_msgSend(v23, "count");
      v25 = a3->var7;
      v26 = objc_msgSend(v25, "count");
      *(_DWORD *)buf = 68290051;
      *(_DWORD *)&buf[4] = 0;
      LOWORD(v32) = 2082;
      *(_QWORD *)((char *)&v32 + 2) = "";
      WORD5(v32) = 1025;
      HIDWORD(v32) = v20;
      v33 = 1025;
      v34 = v22;
      v35 = 1025;
      v36 = v24;
      v37 = 1025;
      v38 = v26;
      _os_log_impl(&dword_2419D9000, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Successfully imported milo data\", \"RecordingEvent\":%{private}u, \"Measurement\":%{private}u, \"Configuration\":%{private}u, \"LOI\":%{private}u}", buf, 0x2Au);

    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
    v27 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      LOWORD(v32) = 2082;
      *(_QWORD *)((char *)&v32 + 2) = "";
      _os_log_impl(&dword_2419D9000, v27, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Failed to import milo data\"}", buf, 0x12u);
    }
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_110);
    v28 = logObject_MicroLocation_Default;
    if (os_signpost_enabled((os_log_t)logObject_MicroLocation_Default))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      LOWORD(v32) = 2082;
      *(_QWORD *)((char *)&v32 + 2) = "";
      _os_signpost_emit_with_name_impl(&dword_2419D9000, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Failed to import milo data", "{\"msg%{public}.0s\":\"Failed to import milo data\"}", buf, 0x12u);
    }
  }

  return v17;
}

- (ULDatabase)db
{
  return self->_db;
}

- (void)setDb:(ULDatabase *)a3
{
  self->_db = a3;
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
