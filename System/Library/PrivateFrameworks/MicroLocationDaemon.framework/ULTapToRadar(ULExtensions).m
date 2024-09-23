@implementation ULTapToRadar(ULExtensions)

+ (uint64_t)createMicroLocationTapToRadarWithTitle:()ULExtensions description:extensionIDs:displayReason:completionHandler:
{
  uint64_t v8;

  LOBYTE(v8) = 0;
  return objc_msgSend(MEMORY[0x24BE669E8], "createRadarWithComponentName:componentVersion:componentID:classification:reproducibility:title:description:extensionIDs:processName:displayReason:isUserInitiated:completionHandler:", CFSTR("Location Rooms"), CFSTR("All"), &unk_2511ED378, 6, 6, a3, a4, a5, CFSTR("MicroLocation"), a6, v8, a7);
}

+ (void)createRadarForMigrationFailure
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  char v4;
  char v5;
  NSObject *v6;
  uint8_t v7[16];

  +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "defaultsDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULTTROnMigrationErrorEnabled");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = objc_msgSend(MEMORY[0x24BDBD1C8], "BOOLValue");
  v5 = v4;

  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE669E8], "createMicroLocationTapToRadarWithTitle:description:extensionIDs:displayReason:completionHandler:", CFSTR("MicroLocation - Migration Completed with Error"), CFSTR("Migration error with status: ULMigrationStatusCompletedWithError"), &unk_2511EE880, CFSTR("migration completed with error"), &__block_literal_global_8);
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_266);
    v6 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2419D9000, v6, OS_LOG_TYPE_DEFAULT, "[ULTapToRadar:createRadarForMigrationFailure]: aborted. disabled in settings", v7, 2u);
    }
  }
}

+ (void)createRadarForDatabaseAccessFailure
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  char v4;
  char v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  +[ULDefaultsSingleton shared](ULDefaultsSingleton, "shared");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "defaultsDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ULTTROnDatabaseAccessErrorEnabled");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = objc_msgSend(MEMORY[0x24BDBD1C8], "BOOLValue");
  v5 = v4;

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.milod"));
    objc_msgSend(v6, "objectForKey:", CFSTR("ULTTROnDatabaseAccessErrorLastTriggerDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (v8 = v7) != 0)
    {
      v9 = v8;
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_266);
      v10 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v9;
        _os_log_impl(&dword_2419D9000, v10, OS_LOG_TYPE_DEFAULT, "[ULTapToRadar:createRadarForDatabaseAccessError]: aborted. already triggered at %@", buf, 0xCu);
      }
    }
    else
    {
      v12 = (void *)MEMORY[0x24BE669E8];
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __65__ULTapToRadar_ULExtensions__createRadarForDatabaseAccessFailure__block_invoke;
      v13[3] = &unk_2511D2F70;
      v14 = v6;
      objc_msgSend(v12, "createMicroLocationTapToRadarWithTitle:description:extensionIDs:displayReason:completionHandler:", CFSTR("MicroLocation - Database access Error"), CFSTR("Got Error on access to database while database is connected"), &unk_2511EE898, CFSTR("access to database error"), v13);

      v9 = 0;
    }

  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_266);
    v11 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2419D9000, v11, OS_LOG_TYPE_DEFAULT, "[ULTapToRadar:createRadarForDatabaseAccessError]: aborted. disabled in settings", buf, 2u);
    }
  }
}

@end
