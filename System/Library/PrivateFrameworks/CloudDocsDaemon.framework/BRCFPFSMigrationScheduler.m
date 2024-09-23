@implementation BRCFPFSMigrationScheduler

- (BRCFPFSMigrationScheduler)init
{
  BRCFPFSMigrationScheduler *v2;
  id v3;
  uint64_t v4;
  NSUserDefaults *fpfsFeatureDefaults;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BRCFPFSMigrationScheduler;
  v2 = -[BRCFPFSMigrationScheduler init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v4 = objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x1E0CAA9B0]);
    fpfsFeatureDefaults = v2->_fpfsFeatureDefaults;
    v2->_fpfsFeatureDefaults = (NSUserDefaults *)v4;

  }
  return v2;
}

- (void)scheduleMigrationIfNeeded
{
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  _QWORD *v26;
  uint64_t v27;
  const char *label;
  _QWORD v29[5];
  _QWORD v30[4];
  id v31;
  id location;
  __int128 v33;
  uint64_t v34;
  _BYTE buf[24];
  void *v36;
  NSObject *v37;
  id v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSharedIPad");

  if (v4)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v5;
      _os_log_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] We are running in shared iPad. Currently we do not support FPFS feature%@", buf, 0xCu);
    }

  }
  else
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    objc_msgSend(v5, "fpfsMigrationTrialRefreshXPCActivity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __54__BRCFPFSMigrationScheduler_scheduleMigrationIfNeeded__block_invoke;
    v30[3] = &unk_1E875EA30;
    objc_copyWeak(&v31, &location);
    v9 = v7;
    v10 = v30;
    v11 = v10;
    if (*MEMORY[0x1E0D11060])
    {
      ((void (*)(_QWORD *))*MEMORY[0x1E0D11060])(v10);
      v12 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v12;
    }
    xpc_activity_unregister("com.apple.bird.fpfs-migration-trial-refresh");
    xpc_activity_register("com.apple.bird.fpfs-migration-trial-refresh", v9, v11);

    dispatch_get_global_queue(17, 0);
    v29[0] = v8;
    v29[1] = 3221225472;
    v29[2] = __54__BRCFPFSMigrationScheduler_scheduleMigrationIfNeeded__block_invoke_2;
    v29[3] = &unk_1E875D500;
    v29[4] = self;
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = v29;
    v22 = (void *)MEMORY[0x1D17A6BE8](v14, v15, v16, v17, v18, v19, v20, v21, v29[0]);
    v33 = 0uLL;
    v34 = 0;
    __brc_create_section(0, (uint64_t)"dispatch_async_with_logs", 262, &v33);
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v27 = v33;
      label = dispatch_queue_get_label(v13);
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = label;
      *(_WORD *)&buf[22] = 2112;
      v36 = v23;
      _os_log_debug_impl(&dword_1CBD43000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", buf, 0x20u);
    }

    v39 = v33;
    v40 = v34;
    *(_QWORD *)buf = v8;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __dispatch_async_with_logs_block_invoke_18;
    v36 = &unk_1E875D578;
    v25 = v13;
    v37 = v25;
    v26 = v14;
    v38 = v26;
    dispatch_async(v25, buf);

    objc_autoreleasePoolPop(v22);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

}

void __54__BRCFPFSMigrationScheduler_scheduleMigrationIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_scheduleRebootIfNeeded");
    WeakRetained = v2;
  }

}

uint64_t __54__BRCFPFSMigrationScheduler_scheduleMigrationIfNeeded__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleRebootIfNeeded");
}

- (void)removeSchedule
{
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] Removing FPFS Migration scheduler%@", (uint8_t *)&v5, 0xCu);
  }

  -[BRCFPFSMigrationScheduler _stopTrialRefresh](self, "_stopTrialRefresh");
  -[BRCFPFSMigrationScheduler _stopXPCActivityForReboot](self, "_stopXPCActivityForReboot");
}

- (void)fixFPFSFeatureFlagUserDefaults
{
  void *v3;
  NSObject *v4;
  NSUserDefaults *fpfsFeatureDefaults;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] Fixing FPFS feature in user defaults%@", (uint8_t *)&v8, 0xCu);
  }

  -[NSUserDefaults setObject:forKey:](self->_fpfsFeatureDefaults, "setObject:forKey:", &unk_1E87D7448, *MEMORY[0x1E0CAA9C0]);
  fpfsFeatureDefaults = self->_fpfsFeatureDefaults;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults setObject:forKey:](fpfsFeatureDefaults, "setObject:forKey:", v7, CFSTR("iCloudDrive-on-FPFS-last-boot-uuid"));

  -[NSUserDefaults setBool:forKey:](self->_fpfsFeatureDefaults, "setBool:forKey:", 1, *MEMORY[0x1E0CAA9B8]);
  -[NSUserDefaults setBool:forKey:](self->_fpfsFeatureDefaults, "setBool:forKey:", 1, CFSTR("iCloudDrive-moved-to-FPFS"));
}

- (BOOL)_isMigrationToFPFSDisabled
{
  _BOOL4 v2;
  void *v3;
  NSObject *v4;
  int v6;
  const __CFString *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = -[NSUserDefaults BOOLForKey:](self->_fpfsFeatureDefaults, "BOOLForKey:", CFSTR("do-not-migrate-to-FPFS"));
  if (v2)
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412546;
      v7 = CFSTR("do-not-migrate-to-FPFS");
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] User default %@ is configured to YES, not scheduling migration check%@", (uint8_t *)&v6, 0x16u);
    }

  }
  return v2;
}

- (void)_stopTrialRefresh
{
  void *v2;
  void *v3;
  xpc_activity_handler_t handler;

  v2 = (void *)*MEMORY[0x1E0C80748];
  if (*MEMORY[0x1E0D11060])
  {
    ((void (*)(void *, SEL))*MEMORY[0x1E0D11060])(&__block_literal_global_46_0, a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &__block_literal_global_46_0;
  }
  handler = v3;
  xpc_activity_unregister("com.apple.bird.fpfs-migration-trial-refresh");
  xpc_activity_register("com.apple.bird.fpfs-migration-trial-refresh", v2, handler);

}

- (void)_stopXPCActivityForReboot
{
  void *v2;
  void *v3;
  xpc_activity_handler_t handler;

  v2 = (void *)*MEMORY[0x1E0C80748];
  if (*MEMORY[0x1E0D11060])
  {
    ((void (*)(void *, SEL))*MEMORY[0x1E0D11060])(&__block_literal_global_46_0, a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &__block_literal_global_46_0;
  }
  handler = v3;
  xpc_activity_unregister("com.apple.bird.fpfs-migration-scheduler");
  xpc_activity_register("com.apple.bird.fpfs-migration-scheduler", v2, handler);

}

- (id)_getBootUUID
{
  void *v2;
  NSObject *v3;
  void *v4;
  size_t v6;
  uint8_t buf[4];
  void *v8;
  __int16 v9;
  void *v10;
  _BYTE v11[37];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  memset(v11, 0, sizeof(v11));
  v6 = 37;
  if (sysctlbyname("kern.bootsessionuuid", v11, &v6, 0, 0))
  {
    brc_bread_crumbs();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v8 = v4;
      v9 = 2112;
      v10 = v2;
      _os_log_impl(&dword_1CBD43000, v3, OS_LOG_TYPE_DEFAULT, "[WARNING] Got error checking the boot uuid: %@%@", buf, 0x16u);

    }
    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_getBootTime
{
  void *v2;
  NSObject *v3;
  void *v4;
  size_t v6;
  _QWORD v7[2];
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7[0] = 0;
  v7[1] = 0;
  v6 = 16;
  if (sysctlbyname("kern.boottime", v7, &v6, 0, 0))
  {
    brc_bread_crumbs();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v9 = v4;
      v10 = 2112;
      v11 = v2;
      _os_log_impl(&dword_1CBD43000, v3, OS_LOG_TYPE_DEFAULT, "[WARNING] Got error checking the boot time: %@%@", buf, 0x16u);

    }
    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v7[0]);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)_enableFPFSFeature
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  BOOL v9;
  void *v10;
  NSObject *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v3;
    _os_log_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] Enabling FPFS feature in user defaults%@", (uint8_t *)&v13, 0xCu);
  }

  -[BRCFPFSMigrationScheduler _getBootUUID](self, "_getBootUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCFPFSMigrationScheduler _getBootTime](self, "_getBootTime");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  v9 = !v8;
  if (v8)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCFPFSMigrationScheduler _enableFPFSFeature].cold.1();
  }
  else
  {
    -[NSUserDefaults setObject:forKey:](self->_fpfsFeatureDefaults, "setObject:forKey:", v6, *MEMORY[0x1E0CAA9C0]);
    -[NSUserDefaults setObject:forKey:](self->_fpfsFeatureDefaults, "setObject:forKey:", v5, CFSTR("iCloudDrive-on-FPFS-last-boot-uuid"));
    -[NSUserDefaults setBool:forKey:](self->_fpfsFeatureDefaults, "setBool:forKey:", 1, *MEMORY[0x1E0CAA9B8]);
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412802;
      v14 = v5;
      v15 = 2112;
      v16 = v7;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEFAULT, "[NOTICE] Enabled FPFS in user defaults. Boot UUID: %@, Boot Time: %@%@", (uint8_t *)&v13, 0x20u);
    }
  }

  return v9;
}

- (void)_scheduleXPCActivityForReboot
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[BRCFPFSMigrationScheduler _stopTrialRefresh](self, "_stopTrialRefresh");
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] Registering XPC Activity for reboot%@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(v2, "fpfsMigrationSchedulerXPCActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (*MEMORY[0x1E0D11060])
  {
    ((void (*)(void *))*MEMORY[0x1E0D11060])(&__block_literal_global_43);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &__block_literal_global_43;
  }
  xpc_activity_unregister("com.apple.bird.fpfs-migration-scheduler");
  xpc_activity_register("com.apple.bird.fpfs-migration-scheduler", v5, v6);

}

void __58__BRCFPFSMigrationScheduler__scheduleXPCActivityForReboot__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D23288], "sharedService");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D23280]), "initWithReason:", CFSTR("iCloud Drive FPFS Migration"));
  objc_msgSend(v1, "setRebootType:", 1);
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1CBD43000, v3, OS_LOG_TYPE_DEFAULT, "[NOTICE] Rebooting the device%@", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(v0, "shutdownWithOptions:", v1);
}

- (void)_removeUserDefaultsForMigrationDisabled
{
  -[NSUserDefaults removeObjectForKey:](self->_fpfsFeatureDefaults, "removeObjectForKey:", *MEMORY[0x1E0CAA9B8]);
  -[NSUserDefaults removeObjectForKey:](self->_fpfsFeatureDefaults, "removeObjectForKey:", *MEMORY[0x1E0CAA9C0]);
  -[NSUserDefaults removeObjectForKey:](self->_fpfsFeatureDefaults, "removeObjectForKey:", CFSTR("iCloudDrive-on-FPFS-last-boot-uuid"));
}

- (void)_scheduleRebootIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: bootUUID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fpfsFeatureDefaults, 0);
  objc_storeStrong((id *)&self->_trialRefreshSource, 0);
  objc_storeStrong((id *)&self->_trialRefreshQueue, 0);
}

- (void)_enableFPFSFeature
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Failed getting boot time and boot uuid%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
