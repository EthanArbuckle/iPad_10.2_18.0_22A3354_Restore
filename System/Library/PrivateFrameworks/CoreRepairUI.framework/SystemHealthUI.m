@implementation SystemHealthUI

+ (id)sharedInstance
{
  if (qword_255B49878 != -1)
    dispatch_once(&qword_255B49878, &unk_24F4D4988);
  return (id)qword_255B49870;
}

- (SystemHealthUI)init
{
  SystemHealthUI *v2;
  SystemHealthUI *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *asyncQueue;
  uint64_t v6;
  CRUIAnalytics *analytics;
  uint64_t v8;
  CRRepairHistory *localRepairHistory;
  uint64_t v10;
  MRLocalization *locale;
  void *v12;
  uint64_t v13;
  NSArray *cachedSpecifiers;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SystemHealthUI;
  v2 = -[SystemHealthUI init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->failedComponentsCount = 0;
    v4 = dispatch_queue_create("async", MEMORY[0x24BDAC9C0]);
    asyncQueue = v3->asyncQueue;
    v3->asyncQueue = (OS_dispatch_queue *)v4;

    v6 = objc_opt_new();
    analytics = v3->analytics;
    v3->analytics = (CRUIAnalytics *)v6;

    v3->deviceFDRVersion1 = 0;
    v3->isRepaired = 0;
    v8 = objc_opt_new();
    localRepairHistory = v3->localRepairHistory;
    v3->localRepairHistory = (CRRepairHistory *)v8;

    v3->isRCHLDevice = -[CRRepairHistory isRCHLRepairHistoryDevice](v3->localRepairHistory, "isRCHLRepairHistoryDevice");
    if (AMFDRSealingMapGetFDRDataVersionForDevice() == 1)
      v3->deviceFDRVersion1 = 1;
    v3->isRepaired = objc_msgSend(MEMORY[0x24BE27E98], "hasHadAuthorizedRepair");
    v10 = objc_opt_new();
    locale = v3->locale;
    v3->locale = (MRLocalization *)v10;

    v12 = (void *)MGCopyAnswer();
    v3->deviceClass = objc_msgSend(v12, "intValue");

    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    cachedSpecifiers = v3->cachedSpecifiers;
    v3->cachedSpecifiers = (NSArray *)v13;

  }
  return v3;
}

- (void)showActionSheets
{
  SystemHealthUI *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  SystemHealthUI *v20;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(v3, "localizedStringWithKey:defaultString:", CFSTR("RESTART_AND_FINISH_REPAIR"), CFSTR("RESTART_AND_FINISH_REPAIR"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = sub_22AC67700;
  v18 = &unk_24F4D4AA0;
  v7 = v3;
  v19 = v7;
  v20 = v2;
  objc_msgSend(v5, "actionWithTitle:style:handler:", v6, 2, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v8, v15, v16, v17, v18);

  v9 = (void *)MEMORY[0x24BEBD3A8];
  -[MRLocalization localizedStringWithKey:defaultString:](v2->locale, "localizedStringWithKey:defaultString:", CFSTR("NOT_NOW"), CFSTR("NOT_NOW"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v11);

  -[SystemHealthUI presentViewController:animated:completion:](v2, "presentViewController:animated:completion:", v4, 1, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
  v13 = objc_msgSend(v12, "integerForKey:", CFSTR("clearFinishRepairFollowup"));

  if (v13 <= 1)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
    objc_msgSend(v14, "setInteger:forKey:", v13 + 1, CFSTR("clearFinishRepairFollowup"));

    notify_post("com.apple.mobilerepair.refreshui");
  }

  objc_sync_exit(v2);
}

- (int)getBatteryHealthServiceState
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = IOPSGetBatteryHealthState();
  sub_22AC82A9C(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_22AC85508(v2, v3, v4, v5, v6, v7, v8, v9);

  return -1;
}

- (id)valueForSpecifierUnknown
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[MRLocalization localizedStringWithKey:defaultString:](self->locale, "localizedStringWithKey:defaultString:", CFSTR("BATTERY_UNKNOWN"), CFSTR("BATTERY_UNKNOWN"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v2);
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("exclamationmark.triangle.fill"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithTintColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "imageWithRenderingMode:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB4B8], "textAttachmentWithImage:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendAttributedString:", v9);

  return v3;
}

- (id)valueForSpecifierFinishRepair
{
  void *v2;
  void *v3;
  void *v4;

  -[MRLocalization localizedStringWithKey:defaultString:](self->locale, "localizedStringWithKey:defaultString:", CFSTR("FINISH_REPAIR"), CFSTR("FINISH_REPAIR"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v3);
  return v4;
}

- (id)valueForSpecifierUsed
{
  void *v2;
  void *v3;
  void *v4;

  -[MRLocalization localizedStringWithKey:defaultString:](self->locale, "localizedStringWithKey:defaultString:", CFSTR("USED"), CFSTR("USED"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v3);
  return v4;
}

- (id)valueForSpecifierService
{
  void *v2;
  void *v3;
  void *v4;

  -[MRLocalization localizedStringWithKey:defaultString:](self->locale, "localizedStringWithKey:defaultString:", CFSTR("Service"), CFSTR("Service"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v3);
  return v4;
}

- (id)valueForSpecifierRepaired
{
  void *v2;
  void *v3;
  void *v4;

  -[MRLocalization localizedStringWithKey:defaultString:](self->locale, "localizedStringWithKey:defaultString:", CFSTR("GENUINE_APPLE_PART"), CFSTR("GENUINE_APPLE_PART"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v3);
  return v4;
}

- (id)valueForSpecifierIssue
{
  void *v2;
  void *v3;
  void *v4;

  -[MRLocalization localizedStringWithKey:defaultString:](self->locale, "localizedStringWithKey:defaultString:", CFSTR("PART_ISSUE"), CFSTR("PART_ISSUE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v3);
  return v4;
}

- (id)valueForSpecifierPartProperty:(id)a3
{
  return CFSTR("Property");
}

- (id)valueForSpecifierPartRC:(id)a3
{
  return CFSTR("RC");
}

- (id)valueForSpecifierPartDate:(id)a3
{
  return CFSTR("Date");
}

- (id)valueForSpecifierPartData:(id)a3
{
  return CFSTR("Classes");
}

- (id)valueForSpecifierPartService:(id)a3
{
  return (id)-[MRLocalization localizedStringWithKey:defaultString:](self->locale, "localizedStringWithKey:defaultString:", CFSTR("Service"), CFSTR("Service"));
}

- (int64_t)getCpuUptimeInSec
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  timespec v12;

  v12.tv_sec = 0;
  v12.tv_nsec = 0;
  v2 = clock_gettime(_CLOCK_UPTIME_RAW, &v12);
  if (!(_DWORD)v2)
    return v12.tv_sec;
  v3 = v2;
  sub_22AC82A9C(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_22AC8556C(v3, v4, v5, v6, v7, v8, v9, v10);

  return -1;
}

- (void)scheduleNetworkActivityWith:(int64_t)a3
{
  void *v3;
  _QWORD v4[6];

  v3 = (void *)*MEMORY[0x24BDAC5A0];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_22AC68A24;
  v4[3] = &unk_24F4D4AC8;
  v4[4] = self;
  v4[5] = a3;
  xpc_activity_register("com.apple.corerepair.CAA", v3, v4);
}

- (BOOL)isVaildCAA:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint8_t buf[8];
  id v17;

  v4 = a3;
  if (v4)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x24BE27E98], "isServicePartWithError:", &v17);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v17;
    if (v5)
    {
      sub_22AC82A9C(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22AC64000, v7, OS_LOG_TYPE_DEFAULT, "SrvP exists, always trust CAA", buf, 2u);
      }
      goto LABEL_18;
    }
    if (objc_msgSend(MEMORY[0x24BE27E98], "hasHadAuthorizedRepairForComponent:", 0))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vcrt"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {

      }
      else
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bcrt"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          sub_22AC82A9C(0);
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            sub_22AC855D0();
          goto LABEL_27;
        }
      }
      -[CRUIAnalytics sendAsyncAnalyticsForEventIfNeeded:moduleName:](self->analytics, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", CFSTR("RepairUsingCAA"), CFSTR("Battery"));
    }
    if (objc_msgSend(MEMORY[0x24BE27E98], "hasHadAuthorizedRepairForComponent:", 1))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("drp#"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        sub_22AC82A9C(0);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          sub_22AC855FC();
        goto LABEL_27;
      }
      -[CRUIAnalytics sendAsyncAnalyticsForEventIfNeeded:moduleName:](self->analytics, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", CFSTR("RepairUsingCAA"), CFSTR("Display"));
    }
    if (!objc_msgSend(MEMORY[0x24BE27E98], "hasHadAuthorizedRepairForComponent:", 2))
    {
LABEL_17:
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird"));
      v14 = objc_msgSend(v13, "integerForKey:", CFSTR("retryCount"));

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("retryPassedCount:%ld"), v14);
      v7 = objc_claimAutoreleasedReturnValue();
      -[CRUIAnalytics sendAsyncAnalyticsForEventIfNeeded:moduleName:](self->analytics, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", v7, CFSTR("PassedRetryCount"));
LABEL_18:
      v8 = 1;
LABEL_19:

      goto LABEL_20;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CmCl"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[CRUIAnalytics sendAsyncAnalyticsForEventIfNeeded:moduleName:](self->analytics, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", CFSTR("RepairUsingCAA"), CFSTR("Camera"));
      goto LABEL_17;
    }
    sub_22AC82A9C(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_22AC85628();
LABEL_27:
    v8 = 0;
    goto LABEL_19;
  }
  v8 = 0;
LABEL_20:

  return v8;
}

- (void)requestCAA
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  sub_22AC82A9C(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22AC64000, v3, OS_LOG_TYPE_DEFAULT, "Requesting CAA ...", buf, 2u);
  }

  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22AC68F94;
  block[3] = &unk_24F4D4AF0;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)clearCAARequestHistory
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  sub_22AC82A9C(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22AC64000, v2, OS_LOG_TYPE_DEFAULT, "Clearing CAA request history ...", v4, 2u);
  }

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird"));
  objc_msgSend(v3, "setInteger:forKey:", 0, CFSTR("backOffCount"));
  objc_msgSend(v3, "setInteger:forKey:", 0, CFSTR("retryCount"));
  objc_msgSend(v3, "setInteger:forKey:", 0, CFSTR("lastUptime"));
  objc_msgSend(v3, "setDouble:forKey:", CFSTR("lastTime"), 0.0);

}

- (void)retryCAA
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  int64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  int64_t v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird"));
  v4 = objc_msgSend(v3, "integerForKey:", CFSTR("backOffCount"));
  v5 = objc_msgSend(v3, "integerForKey:", CFSTR("retryCount"));
  v6 = objc_msgSend(v3, "integerForKey:", CFSTR("lastUptime"));
  objc_msgSend(v3, "doubleForKey:", CFSTR("lastTime"));
  v8 = v7;
  v9 = -[SystemHealthUI getCpuUptimeInSec](self, "getCpuUptimeInSec");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSince1970");
  v12 = v11;

  objc_msgSend(v3, "doubleForKey:", CFSTR("timeIntervalOverride"));
  v14 = v13;
  if ((os_variant_has_internal_content() & (v13 != 0.0)) != 0)
    v15 = (uint64_t)v14;
  else
    v15 = v4;
  sub_22AC82A9C(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 134219264;
    v23 = v15;
    v24 = 2048;
    v25 = v5;
    v26 = 2048;
    v27 = v6;
    v28 = 2048;
    v29 = v9;
    v30 = 2048;
    v31 = v8;
    v32 = 2048;
    v33 = v12;
    _os_log_impl(&dword_22AC64000, v16, OS_LOG_TYPE_DEFAULT, "Retry CAA request (BackOff: %ld RetryCount: %ld LastUptime: %ld CurrentUptime: %ld LastTime: %lf CurrentTime: %lf) ...", (uint8_t *)&v22, 0x3Eu);
  }

  if (v5 > 7)
  {
    -[CRUIAnalytics sendAnalyticsForRepairHistoryMismatch](self->analytics, "sendAnalyticsForRepairHistoryMismatch");
    -[SystemHealthUI clearCAARequestHistory](self, "clearCAARequestHistory");
    objc_msgSend(MEMORY[0x24BE27E98], "getLocalSealingManifest");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("cachedSealingManifest"));
    objc_msgSend(v3, "synchronize");

  }
  else
  {
    if ((unint64_t)(v6 + 1) <= 1)
    {
      sub_22AC82A9C(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        v18 = "First request or uptime error, requesting CAA.";
LABEL_22:
        _os_log_impl(&dword_22AC64000, v17, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v22, 2u);
        goto LABEL_23;
      }
      goto LABEL_23;
    }
    v20 = v9 - v6;
    if (v9 < v6)
    {
      sub_22AC82A9C(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        v18 = "System must have rebooted (currentUptime < lastUptime), requesting CAA.";
        goto LABEL_22;
      }
LABEL_23:

      -[SystemHealthUI requestCAA](self, "requestCAA");
      objc_msgSend(v3, "setInteger:forKey:", v5 + 1, CFSTR("retryCount"));
      objc_msgSend(v3, "setInteger:forKey:", 6 * v15 + 4, CFSTR("backOffCount"));
      objc_msgSend(v3, "synchronize");
      objc_msgSend(v3, "setInteger:forKey:", v9, CFSTR("lastUptime"));
      objc_msgSend(v3, "setDouble:forKey:", CFSTR("lastTime"), v12);
      objc_msgSend(v3, "synchronize");
      goto LABEL_24;
    }
    if (v20 >= v15)
    {
      sub_22AC82A9C(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        v18 = "Backoff time has elapsed, requesting CAA.";
        goto LABEL_22;
      }
      goto LABEL_23;
    }
    sub_22AC82A9C(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 134218240;
      v23 = (uint64_t)(v12 - v8);
      v24 = 2048;
      v25 = v20;
      _os_log_impl(&dword_22AC64000, v21, OS_LOG_TYPE_DEFAULT, "intervalTime: %lld intervalUptime: %lld", (uint8_t *)&v22, 0x16u);
    }

    if (v20 + 5 < (uint64_t)(v12 - v8))
    {
      sub_22AC82A9C(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        v18 = "System must have rebooted (Uptime rolls), requesting CAA.";
        goto LABEL_22;
      }
      goto LABEL_23;
    }
  }
LABEL_24:

}

- (void)performMiniPreflight
{
  id v2;
  NSObject *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = sub_22AC68124;
  v8[4] = sub_22AC68134;
  v9 = 0;
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("miniPreflight"));
  dispatch_get_global_queue(21, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_22AC69580;
  v5[3] = &unk_24F4D4B40;
  v6 = v2;
  v7 = v8;
  v4 = v2;
  dispatch_async(v3, v5);

  _Block_object_dispose(v8, 8);
}

- (BOOL)isPreFlightDone
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
  objc_msgSend(v2, "objectForKey:", CFSTR("cachedPreFlightResults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (void)getCAAForRepairHistory
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  SystemHealthUI *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint8_t buf[16];
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24F4DDA60, *MEMORY[0x24BE2C470]);
  v4 = *MEMORY[0x24BE2C410];
  v21[0] = *MEMORY[0x24BE2C400];
  v21[1] = v4;
  v21[2] = *MEMORY[0x24BE2C458];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE2C448]);

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_22AC68124;
  v18[4] = sub_22AC68134;
  v19 = 0;
  v6 = (void *)objc_opt_new();
  v7 = dispatch_queue_create("async", MEMORY[0x24BDAC9C0]);
  sub_22AC82A9C(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22AC64000, v8, OS_LOG_TYPE_DEFAULT, "Getting CAA for Repair History", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22AC69A94;
  block[3] = &unk_24F4D4B90;
  v12 = v6;
  v13 = v3;
  v16 = v18;
  v14 = self;
  v15 = v20;
  v9 = v3;
  v10 = v6;
  dispatch_async(v7, block);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
}

- (void)extractMtubSpecifiers:(id)a3 caaRepairHistory:(id)a4 srvp:(id)a5 rchlHistory:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CRUIAnalytics *analytics;
  void *v20;
  _BOOL4 deviceFDRVersion1;
  void *v22;
  NSObject *v23;
  const char *v24;
  uint8_t *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[2];
  __int16 v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!self->isRCHLDevice)
  {
    deviceFDRVersion1 = self->deviceFDRVersion1;
    if (v11 && !self->deviceFDRVersion1)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SrvP"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        sub_22AC82A9C(0);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v31 = 0;
          v24 = "CAA has MTUB repair history.";
          v25 = (uint8_t *)&v31;
LABEL_16:
          _os_log_impl(&dword_22AC64000, v23, OS_LOG_TYPE_DEFAULT, v24, v25, 2u);
          goto LABEL_17;
        }
        goto LABEL_17;
      }
      deviceFDRVersion1 = self->deviceFDRVersion1;
    }
    if ((deviceFDRVersion1 || (objc_msgSend(v12, "isEqualToString:", CFSTR("0")) & 1) == 0)
      && !_os_feature_enabled_impl())
    {
      goto LABEL_19;
    }
    sub_22AC82A9C(0);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v24 = "Local data shows repaired history for MTUB. CAA is unavailable for now.";
      v25 = buf;
      goto LABEL_16;
    }
LABEL_17:

    v26 = (void *)MEMORY[0x24BE75590];
    -[MRLocalization localizedStringWithKey:defaultString:](self->locale, "localizedStringWithKey:defaultString:", CFSTR("REAR_SYSTEM"), CFSTR("REAR_SYSTEM"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v27, self, 0, 0, objc_opt_class(), 2, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("MTUB"), "stringByAppendingString:", CFSTR("Repair"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setProperty:forKey:", v28, *MEMORY[0x24BE75AC0]);

    -[SystemHealthUI valueForSpecifierRepaired](self, "valueForSpecifierRepaired");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setProperty:forKey:", v29, CFSTR("CRImageAlertKey"));

    objc_msgSend(v16, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(v10, "addObject:", v16);
    goto LABEL_18;
  }
  if ((-[CRRepairHistory hasHadRCHLBasedRepairForComponent:withHistory:](self->localRepairHistory, "hasHadRCHLBasedRepairForComponent:withHistory:", CFSTR("MTUB"), v13) & 1) != 0|| _os_feature_enabled_impl())
  {
    v14 = (void *)MEMORY[0x24BE75590];
    -[MRLocalization localizedStringWithKey:defaultString:](self->locale, "localizedStringWithKey:defaultString:", CFSTR("REAR_SYSTEM"), CFSTR("REAR_SYSTEM"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, 0, objc_opt_class(), 2, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("MTUB"), "stringByAppendingString:", CFSTR("Repair"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setProperty:forKey:", v17, *MEMORY[0x24BE75AC0]);

    -[SystemHealthUI valueForSpecifierRepaired](self, "valueForSpecifierRepaired");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setProperty:forKey:", v18, CFSTR("CRImageAlertKey"));

    objc_msgSend(v16, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(v10, "addObject:", v16);
    analytics = self->analytics;
    objc_msgSend(CFSTR("MTUB"), "stringByAppendingString:", CFSTR("Repair"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUIAnalytics sendAsyncAnalyticsForEventIfNeeded:moduleName:](analytics, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", CFSTR("RepairUsingRCHL"), v20);

LABEL_18:
  }
LABEL_19:

}

- (void)extractCameraSpecifiers:(id)a3 componentsInfoSpecifiers:(id)a4 configurationSpecifiers:(id)a5 caaRepairHistory:(id)a6 srvp:(id)a7 rchlHistory:(id)a8 claimCount:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  int v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CRUIAnalytics *analytics;
  const __CFString *v32;
  _BOOL4 deviceFDRVersion1;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  uint8_t v50[16];
  uint8_t buf[16];

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v49 = a6;
  v48 = a7;
  v18 = a8;
  v19 = a9;
  v20 = _os_feature_enabled_impl();
  v21 = (void *)objc_opt_new();
  v22 = objc_msgSend(v21, "copyComponentStatus");

  _os_feature_enabled_impl();
  v23 = -[CRRepairHistory checkUsedStatusFor:withHistory:withClaimCount:](self->localRepairHistory, "checkUsedStatusFor:withHistory:withClaimCount:", CFSTR("Camera"), v18, v19);

  if (v22 == -3)
  {
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, 0, objc_opt_class(), 2, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("Camera"), "stringByAppendingString:", CFSTR("FinishRepair"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setProperty:forKey:", v25, *MEMORY[0x24BE75AC0]);

    -[SystemHealthUI valueForSpecifierFinishRepair](self, "valueForSpecifierFinishRepair");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setProperty:forKey:", v26, CFSTR("CRImageAlertKey"));

    objc_msgSend(v24, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(v17, "addObject:", v24);
    -[CRUIAnalytics sendAsyncAnalyticsForEventIfNeeded:moduleName:](self->analytics, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", CFSTR("FinishRepair"), CFSTR("Camera"));
LABEL_7:

    goto LABEL_8;
  }
  if (objc_msgSend(MEMORY[0x24BE27E68], "isFDRDataClassSupported:", CFSTR("CmCl")))
  {
    if (v22 == -1 || (_os_feature_enabled_impl() & v20) == 1)
    {
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, 0, objc_opt_class(), 2, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setIdentifier:", CFSTR("warningId"));
      -[SystemHealthUI valueForSpecifierUnknown](self, "valueForSpecifierUnknown");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setProperty:forKey:", v27, CFSTR("CRImageAlertKey"));

      objc_msgSend(v24, "setProperty:forKey:", CFSTR("Camera"), *MEMORY[0x24BE75AC0]);
      objc_msgSend(v24, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
      objc_msgSend(v16, "addObject:", v24);
      ++self->failedComponentsCount;
      goto LABEL_7;
    }
    if (self->isRCHLDevice)
    {
      if ((-[CRRepairHistory hasHadRCHLBasedRepairForComponent:withHistory:](self->localRepairHistory, "hasHadRCHLBasedRepairForComponent:withHistory:", CFSTR("Camera"), v18) & 1) != 0|| (_os_feature_enabled_impl() & v20) == 1)
      {
        objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, 0, objc_opt_class(), 2, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("Camera"), "stringByAppendingString:", CFSTR("Repair"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setProperty:forKey:", v29, *MEMORY[0x24BE75AC0]);

        if (v23)
        {
          -[SystemHealthUI valueForSpecifierUsed](self, "valueForSpecifierUsed");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setProperty:forKey:", v30, CFSTR("CRImageAlertKey"));

          analytics = self->analytics;
          v32 = CFSTR("Used");
        }
        else
        {
          -[SystemHealthUI valueForSpecifierRepaired](self, "valueForSpecifierRepaired");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setProperty:forKey:", v39, CFSTR("CRImageAlertKey"));

          analytics = self->analytics;
          v32 = CFSTR("Repair");
        }
        objc_msgSend(CFSTR("Camera"), "stringByAppendingString:", v32);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = CFSTR("RepairUsingRCHL");
LABEL_38:
        -[CRUIAnalytics sendAsyncAnalyticsForEventIfNeeded:moduleName:](analytics, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", v41, v40);

        objc_msgSend(v28, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
        objc_msgSend(v16, "addObject:", v28);

      }
    }
    else
    {
      deviceFDRVersion1 = self->deviceFDRVersion1;
      if (v49 && !self->deviceFDRVersion1)
      {
        objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("CmCl"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          sub_22AC82A9C(0);
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22AC64000, v35, OS_LOG_TYPE_DEFAULT, "CAA has Camera repair history.", buf, 2u);
          }

          objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, 0, objc_opt_class(), 2, 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("Camera"), "stringByAppendingString:", CFSTR("Repair"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setProperty:forKey:", v36, *MEMORY[0x24BE75AC0]);

          if (v23)
          {
            -[SystemHealthUI valueForSpecifierUsed](self, "valueForSpecifierUsed");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setProperty:forKey:", v37, CFSTR("CRImageAlertKey"));

            analytics = self->analytics;
            v38 = CFSTR("Used");
          }
          else
          {
            -[SystemHealthUI valueForSpecifierRepaired](self, "valueForSpecifierRepaired");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setProperty:forKey:", v47, CFSTR("CRImageAlertKey"));

            analytics = self->analytics;
            v38 = CFSTR("Repair");
          }
          objc_msgSend(CFSTR("Camera"), "stringByAppendingString:", v38);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = CFSTR("RepairUsingCAA");
          goto LABEL_38;
        }
        deviceFDRVersion1 = self->deviceFDRVersion1;
      }
      if (!deviceFDRVersion1
        && self->isRepaired
        && objc_msgSend(MEMORY[0x24BE27E98], "hasHadAuthorizedRepairForComponent:", 2)
        && !objc_msgSend(v48, "isEqualToString:", CFSTR("0"))
        || (_os_feature_enabled_impl() & v20) == 1)
      {
        sub_22AC82A9C(0);
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v50 = 0;
          _os_log_impl(&dword_22AC64000, v42, OS_LOG_TYPE_DEFAULT, "Local data shows repaired history for Camera. CAA is unavailable for now.", v50, 2u);
        }

        objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, 0, objc_opt_class(), 2, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("Camera"), "stringByAppendingString:", CFSTR("Repair"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setProperty:forKey:", v43, *MEMORY[0x24BE75AC0]);

        if (v23)
        {
          -[SystemHealthUI valueForSpecifierUsed](self, "valueForSpecifierUsed");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setProperty:forKey:", v44, CFSTR("CRImageAlertKey"));

          analytics = self->analytics;
          v45 = CFSTR("Used");
        }
        else
        {
          -[SystemHealthUI valueForSpecifierRepaired](self, "valueForSpecifierRepaired");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setProperty:forKey:", v46, CFSTR("CRImageAlertKey"));

          analytics = self->analytics;
          v45 = CFSTR("Repair");
        }
        objc_msgSend(CFSTR("Camera"), "stringByAppendingString:", v45);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = CFSTR("RepairUsingFDR");
        goto LABEL_38;
      }
    }
  }
LABEL_8:

}

- (void)extractiPadCameraSpecifiers:(id)a3 componentsInfoSpecifiers:(id)a4 configurationSpecifiers:(id)a5 caaRepairHistory:(id)a6 rchlHistory:(id)a7
{
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  v11 = objc_msgSend(v10, "copyComponentStatus");

  if (v11 == -3)
  {
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, 0, objc_opt_class(), 2, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setIdentifier:", CFSTR("finishRepairId"));
    -[SystemHealthUI valueForSpecifierFinishRepair](self, "valueForSpecifierFinishRepair");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setProperty:forKey:", v13, CFSTR("CRImageAlertKey"));

    objc_msgSend(CFSTR("Camera"), "stringByAppendingString:", CFSTR("FinishRepair"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setProperty:forKey:", v14, *MEMORY[0x24BE75AC0]);

    objc_msgSend(v12, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(v9, "addObject:", v12);
    -[CRUIAnalytics sendAsyncAnalyticsForEventIfNeeded:moduleName:](self->analytics, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", CFSTR("FinishRepair"), CFSTR("Camera"));

  }
}

- (void)extractFaceIDSpecifiers:(id)a3 configurationSpecifiers:(id)a4 caaRepairHistory:(id)a5 rchlHistory:(id)a6 claimCount:(id)a7
{
  id v12;
  id v13;
  id v14;
  MRLocalization *locale;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  CRUIAnalytics *analytics;
  const __CFString *v36;
  _BOOL4 deviceFDRVersion1;
  void *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  id v50;
  uint8_t v51[16];
  uint8_t buf[16];

  v50 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  locale = self->locale;
  v16 = a7;
  -[MRLocalization localizedStringWithKey:defaultString:](locale, "localizedStringWithKey:defaultString:", CFSTR("FACEID_COMPONENT"), CFSTR("FACEID_COMPONENT"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_opt_new();
  v19 = objc_msgSend(v18, "copyComponentStatus");

  v20 = -[CRRepairHistory checkUsedStatusFor:withHistory:withClaimCount:](self->localRepairHistory, "checkUsedStatusFor:withHistory:withClaimCount:", CFSTR("FaceID"), v14, v16);
  v21 = _os_feature_enabled_impl();
  v22 = _os_feature_enabled_impl();
  if (v19 == -1)
    goto LABEL_5;
  if (v19 == -3)
  {
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v17, self, 0, 0, objc_opt_class(), 2, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("FaceID"), "stringByAppendingString:", CFSTR("FinishRepair"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setProperty:forKey:", v24, *MEMORY[0x24BE75AC0]);

    objc_msgSend(v23, "setIdentifier:", CFSTR("finishRepairId"));
    -[SystemHealthUI valueForSpecifierFinishRepair](self, "valueForSpecifierFinishRepair");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setProperty:forKey:", v25, CFSTR("CRImageAlertKey"));

    objc_msgSend(v23, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    v26 = v12;
    objc_msgSend(v12, "addObject:", v23);
    -[CRUIAnalytics sendAsyncAnalyticsForEventIfNeeded:moduleName:](self->analytics, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", CFSTR("FinishRepair"), CFSTR("FaceID"));

    v27 = v50;
    goto LABEL_36;
  }
  v28 = v22;
  if ((_os_feature_enabled_impl() & v21) == 1)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v17, self, 0, 0, objc_opt_class(), 2, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setProperty:forKey:", CFSTR("FaceID"), *MEMORY[0x24BE75AC0]);
    -[SystemHealthUI valueForSpecifierIssue](self, "valueForSpecifierIssue");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setProperty:forKey:", v30, CFSTR("CRImageAlertKey"));

    objc_msgSend(v29, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(v50, "addObject:", v29);
    -[CRUIAnalytics sendAsyncAnalyticsForEventIfNeeded:moduleName:](self->analytics, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", CFSTR("SGAViewSeen"), CFSTR("FaceID"));
    ++self->failedComponentsCount;

    v26 = v12;
    v27 = v50;
    goto LABEL_36;
  }
  v31 = v28 & v21 | v20;
  if (self->isRCHLDevice)
  {
    v26 = v12;
    v27 = v50;
    if ((-[CRRepairHistory hasHadRCHLBasedRepairForComponent:withHistory:](self->localRepairHistory, "hasHadRCHLBasedRepairForComponent:withHistory:", CFSTR("FaceID"), v14) & 1) != 0|| (_os_feature_enabled_impl() & v21) == 1)
    {
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v17, self, 0, 0, objc_opt_class(), 2, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("FaceID"), "stringByAppendingString:", CFSTR("Repair"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setProperty:forKey:", v33, *MEMORY[0x24BE75AC0]);

      if (v31)
      {
        -[SystemHealthUI valueForSpecifierUsed](self, "valueForSpecifierUsed");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setProperty:forKey:", v34, CFSTR("CRImageAlertKey"));

        analytics = self->analytics;
        v36 = CFSTR("Used");
      }
      else
      {
        -[SystemHealthUI valueForSpecifierRepaired](self, "valueForSpecifierRepaired");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setProperty:forKey:", v39, CFSTR("CRImageAlertKey"));

        analytics = self->analytics;
        v36 = CFSTR("Repair");
      }
      objc_msgSend(CFSTR("FaceID"), "stringByAppendingString:", v36);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = CFSTR("RepairUsingRCHL");
LABEL_34:
      -[CRUIAnalytics sendAsyncAnalyticsForEventIfNeeded:moduleName:](analytics, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", v41, v40);
LABEL_35:

      objc_msgSend(v32, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
      objc_msgSend(v27, "addObject:", v32);

      goto LABEL_36;
    }
    goto LABEL_36;
  }
  deviceFDRVersion1 = self->deviceFDRVersion1;
  if (v13 && !self->deviceFDRVersion1)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("psd2"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {

LABEL_18:
      sub_22AC82A9C(0);
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22AC64000, v43, OS_LOG_TYPE_DEFAULT, "CAA has FaceID repair history.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v17, self, 0, 0, objc_opt_class(), 2, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("FaceID"), "stringByAppendingString:", CFSTR("Repair"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setProperty:forKey:", v44, *MEMORY[0x24BE75AC0]);

      v26 = v12;
      if (v31)
        -[SystemHealthUI valueForSpecifierUsed](self, "valueForSpecifierUsed");
      else
        -[SystemHealthUI valueForSpecifierRepaired](self, "valueForSpecifierRepaired");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v50;
      objc_msgSend(v32, "setProperty:forKey:", v40, CFSTR("CRImageAlertKey"));
      goto LABEL_35;
    }
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("prpc"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
      goto LABEL_18;
    deviceFDRVersion1 = self->deviceFDRVersion1;
  }
  v26 = v12;
  v27 = v50;
  if (!deviceFDRVersion1 && (objc_msgSend(MEMORY[0x24BE27E98], "hasHadAuthorizedRepairForComponent:", 5) & 1) != 0
    || (_os_feature_enabled_impl() & v21) == 1)
  {
    sub_22AC82A9C(0);
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v51 = 0;
      _os_log_impl(&dword_22AC64000, v45, OS_LOG_TYPE_DEFAULT, "Local data shows repaired history for Pearl. CAA is unavailable for now.", v51, 2u);
    }

    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v17, self, 0, 0, objc_opt_class(), 2, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("FaceID"), "stringByAppendingString:", CFSTR("Repair"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setProperty:forKey:", v46, *MEMORY[0x24BE75AC0]);

    if (v31)
    {
      -[SystemHealthUI valueForSpecifierUsed](self, "valueForSpecifierUsed");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setProperty:forKey:", v47, CFSTR("CRImageAlertKey"));

      analytics = self->analytics;
      v48 = CFSTR("Used");
    }
    else
    {
      -[SystemHealthUI valueForSpecifierRepaired](self, "valueForSpecifierRepaired");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setProperty:forKey:", v49, CFSTR("CRImageAlertKey"));

      analytics = self->analytics;
      v48 = CFSTR("Repair");
    }
    objc_msgSend(CFSTR("FaceID"), "stringByAppendingString:", v48);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = CFSTR("RepairUsingFDR");
    goto LABEL_34;
  }
LABEL_36:

}

- (void)extractTouchIDSpecifiers:(id)a3 configurationSpecifiers:(id)a4 caaRepairHistory:(id)a5 rchlHistory:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  CRUIAnalytics *analytics;
  const __CFString *v30;
  _BOOL4 deviceFDRVersion1;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  uint8_t v47[16];
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[MRLocalization localizedStringWithKey:defaultString:](self->locale, "localizedStringWithKey:defaultString:", CFSTR("TOUCH_ID_COMPONENT"), CFSTR("TOUCH_ID_COMPONENT"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = _os_feature_enabled_impl();
  v16 = (void *)objc_opt_new();
  v17 = objc_msgSend(v16, "copyComponentStatus");

  v18 = _os_feature_enabled_impl();
  if (v17 == -1)
    goto LABEL_5;
  if (v17 == -3)
  {
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, 0, 0, objc_opt_class(), 2, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("TouchID"), "stringByAppendingString:", CFSTR("FinishRepair"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setProperty:forKey:", v20, *MEMORY[0x24BE75AC0]);

    objc_msgSend(v19, "setIdentifier:", CFSTR("finishRepairId"));
    -[SystemHealthUI valueForSpecifierFinishRepair](self, "valueForSpecifierFinishRepair");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setProperty:forKey:", v21, CFSTR("CRImageAlertKey"));

    objc_msgSend(v19, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(v11, "addObject:", v19);
    -[CRUIAnalytics sendAsyncAnalyticsForEventIfNeeded:moduleName:](self->analytics, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", CFSTR("FinishRepair"), CFSTR("TouchID"));
LABEL_6:

    goto LABEL_7;
  }
  v22 = v18;
  if ((_os_feature_enabled_impl() & v15) == 1)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, 0, 0, objc_opt_class(), 2, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setProperty:forKey:", CFSTR("TouchID"), *MEMORY[0x24BE75AC0]);
    -[SystemHealthUI valueForSpecifierIssue](self, "valueForSpecifierIssue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setProperty:forKey:", v23, CFSTR("CRImageAlertKey"));

    objc_msgSend(v19, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(v10, "addObject:", v19);
    -[CRUIAnalytics sendAsyncAnalyticsForEventIfNeeded:moduleName:](self->analytics, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", CFSTR("SGAViewSeen"), CFSTR("TouchID"));
    ++self->failedComponentsCount;
    goto LABEL_6;
  }
  v24 = v22 & v15;
  if (self->isRCHLDevice)
  {
    if ((-[CRRepairHistory hasHadRCHLBasedRepairForComponent:withHistory:](self->localRepairHistory, "hasHadRCHLBasedRepairForComponent:withHistory:", CFSTR("TouchID"), v13) & 1) != 0|| (_os_feature_enabled_impl() & v15) == 1)
    {
      v25 = (void *)MEMORY[0x24BE75590];
      -[MRLocalization localizedStringWithKey:defaultString:](self->locale, "localizedStringWithKey:defaultString:", CFSTR("TOUCHID_REPAIR"), CFSTR("TOUCHID_REPAIR"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v26, self, 0, 0, objc_opt_class(), 2, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(CFSTR("TouchID"), "stringByAppendingString:", CFSTR("Repair"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setProperty:forKey:", v27, *MEMORY[0x24BE75AC0]);

      if (v24)
      {
        -[SystemHealthUI valueForSpecifierUsed](self, "valueForSpecifierUsed");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setProperty:forKey:", v28, CFSTR("CRImageAlertKey"));

        analytics = self->analytics;
        v30 = CFSTR("Used");
      }
      else
      {
        -[SystemHealthUI valueForSpecifierRepaired](self, "valueForSpecifierRepaired");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setProperty:forKey:", v37, CFSTR("CRImageAlertKey"));

        analytics = self->analytics;
        v30 = CFSTR("Repair");
      }
      objc_msgSend(CFSTR("TouchID"), "stringByAppendingString:", v30);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = CFSTR("RepairUsingRCHL");
LABEL_32:
      -[CRUIAnalytics sendAsyncAnalyticsForEventIfNeeded:moduleName:](analytics, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", v39, v38);
LABEL_33:

      objc_msgSend(v19, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
      objc_msgSend(v10, "addObject:", v19);
      goto LABEL_6;
    }
  }
  else
  {
    deviceFDRVersion1 = self->deviceFDRVersion1;
    if (v12 && !self->deviceFDRVersion1)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("FSCl"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        sub_22AC82A9C(0);
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22AC64000, v33, OS_LOG_TYPE_DEFAULT, "CAA has Pearl repair history.", buf, 2u);
        }

        v34 = (void *)MEMORY[0x24BE75590];
        -[MRLocalization localizedStringWithKey:defaultString:](self->locale, "localizedStringWithKey:defaultString:", CFSTR("TOUCHID_REPAIR"), CFSTR("TOUCHID_REPAIR"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v35, self, 0, 0, objc_opt_class(), 2, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(CFSTR("TouchID"), "stringByAppendingString:", CFSTR("Repair"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setProperty:forKey:", v36, *MEMORY[0x24BE75AC0]);

        if (v24)
          -[SystemHealthUI valueForSpecifierUsed](self, "valueForSpecifierUsed");
        else
          -[SystemHealthUI valueForSpecifierRepaired](self, "valueForSpecifierRepaired");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setProperty:forKey:", v38, CFSTR("CRImageAlertKey"));
        goto LABEL_33;
      }
      deviceFDRVersion1 = self->deviceFDRVersion1;
    }
    if (!deviceFDRVersion1 && (objc_msgSend(MEMORY[0x24BE27E98], "hasHadAuthorizedRepairForComponent:", 6) & 1) != 0
      || (_os_feature_enabled_impl() & v15) == 1)
    {
      sub_22AC82A9C(0);
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v47 = 0;
        _os_log_impl(&dword_22AC64000, v40, OS_LOG_TYPE_DEFAULT, "Local data shows repaired history for Touch ID. CAA is unavailable for now.", v47, 2u);
      }

      v41 = (void *)MEMORY[0x24BE75590];
      -[MRLocalization localizedStringWithKey:defaultString:](self->locale, "localizedStringWithKey:defaultString:", CFSTR("TOUCHID_REPAIR"), CFSTR("TOUCHID_REPAIR"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v42, self, 0, 0, objc_opt_class(), 2, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(CFSTR("TouchID"), "stringByAppendingString:", CFSTR("Repair"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setProperty:forKey:", v43, *MEMORY[0x24BE75AC0]);

      if (v24)
      {
        -[SystemHealthUI valueForSpecifierUsed](self, "valueForSpecifierUsed");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setProperty:forKey:", v44, CFSTR("CRImageAlertKey"));

        analytics = self->analytics;
        v45 = CFSTR("Used");
      }
      else
      {
        -[SystemHealthUI valueForSpecifierRepaired](self, "valueForSpecifierRepaired");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setProperty:forKey:", v46, CFSTR("CRImageAlertKey"));

        analytics = self->analytics;
        v45 = CFSTR("Repair");
      }
      objc_msgSend(CFSTR("TouchID"), "stringByAppendingString:", v45);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = CFSTR("RepairUsingFDR");
      goto LABEL_32;
    }
  }
LABEL_7:

}

- (void)extractWifiSpecifiers
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_opt_new();
  v4 = objc_msgSend(v3, "copyComponentStatus");

  if (v4 == -1)
  {
    MGGetBoolAnswer();
    ++self->failedComponentsCount;
  }
}

- (void)extractDisplaySpecifiers:(id)a3 configurationSpecifiers:(id)a4 caaRepairHistory:(id)a5 srvp:(id)a6 rchlHistory:(id)a7 claimCount:(id)a8
{
  id v14;
  id v15;
  id v16;
  MRLocalization *locale;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  CRUIAnalytics *analytics;
  const __CFString *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  uint8_t v51[16];
  uint8_t buf[16];

  v14 = a3;
  v15 = a4;
  v50 = a5;
  v49 = a6;
  v16 = a7;
  locale = self->locale;
  v18 = a8;
  -[MRLocalization localizedStringWithKey:defaultString:](locale, "localizedStringWithKey:defaultString:", CFSTR("Display"), CFSTR("Display"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_opt_new();
  v21 = objc_msgSend(v20, "copyComponentStatus");

  v22 = -[CRRepairHistory checkUsedStatusFor:withHistory:withClaimCount:](self->localRepairHistory, "checkUsedStatusFor:withHistory:withClaimCount:", CFSTR("Display"), v16, v18);
  v23 = _os_feature_enabled_impl();
  v24 = _os_feature_enabled_impl();
  if (v21 == -3)
  {
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v19, self, 0, 0, objc_opt_class(), 2, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("Display"), "stringByAppendingString:", CFSTR("FinishRepair"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setProperty:forKey:", v26, *MEMORY[0x24BE75AC0]);

    objc_msgSend(v25, "setIdentifier:", CFSTR("finishRepairId"));
    -[SystemHealthUI valueForSpecifierFinishRepair](self, "valueForSpecifierFinishRepair");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setProperty:forKey:", v27, CFSTR("CRImageAlertKey"));

    objc_msgSend(v25, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(v15, "addObject:", v25);
    -[CRUIAnalytics sendAsyncAnalyticsForEventIfNeeded:moduleName:](self->analytics, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", CFSTR("FinishRepair"), CFSTR("Display"));
LABEL_7:

    goto LABEL_8;
  }
  v28 = v24;
  if (objc_msgSend(MEMORY[0x24BE27E68], "isFDRDataClassSupported:", CFSTR("tcrt")))
  {
    if (v21 == -1 || (_os_feature_enabled_impl() & v23) == 1)
    {
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v19, self, 0, 0, objc_opt_class(), 2, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setIdentifier:", CFSTR("warningId"));
      -[SystemHealthUI valueForSpecifierUnknown](self, "valueForSpecifierUnknown");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setProperty:forKey:", v29, CFSTR("CRImageAlertKey"));

      objc_msgSend(v25, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
      objc_msgSend(v25, "setProperty:forKey:", CFSTR("TouchController"), *MEMORY[0x24BE75AC0]);
      objc_msgSend(v14, "addObject:", v25);
      ++self->failedComponentsCount;
      goto LABEL_7;
    }
    v30 = v28 & v23 | v22;
    if (self->isRCHLDevice || v21 != 1)
    {
      if (self->isRCHLDevice
        && v21 == 1
        && ((-[CRRepairHistory hasHadRCHLBasedRepairForComponent:withHistory:](self->localRepairHistory, "hasHadRCHLBasedRepairForComponent:withHistory:", CFSTR("Display"), v16) & 1) != 0|| (_os_feature_enabled_impl() & v23) == 1))
      {
        objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v19, self, 0, 0, objc_opt_class(), 2, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("Display"), "stringByAppendingString:", CFSTR("Repair"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setProperty:forKey:", v32, *MEMORY[0x24BE75AC0]);

        if (v30)
        {
          -[SystemHealthUI valueForSpecifierUsed](self, "valueForSpecifierUsed");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setProperty:forKey:", v33, CFSTR("CRImageAlertKey"));

          analytics = self->analytics;
          v35 = CFSTR("Used");
        }
        else
        {
          -[SystemHealthUI valueForSpecifierRepaired](self, "valueForSpecifierRepaired");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setProperty:forKey:", v47, CFSTR("CRImageAlertKey"));

          analytics = self->analytics;
          v35 = CFSTR("Repair");
        }
        objc_msgSend(CFSTR("Display"), "stringByAppendingString:", v35);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = CFSTR("RepairUsingRCHL");
LABEL_39:
        -[CRUIAnalytics sendAsyncAnalyticsForEventIfNeeded:moduleName:](analytics, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", v42, v41);

        objc_msgSend(v25, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
        objc_msgSend(v14, "addObject:", v25);
        goto LABEL_7;
      }
    }
    else
    {
      if (!v50 || self->deviceFDRVersion1)
      {
        if ((_os_feature_enabled_impl() & v23) == 1)
          goto LABEL_22;
      }
      else
      {
        objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("drp#"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {

LABEL_22:
          sub_22AC82A9C(0);
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22AC64000, v36, OS_LOG_TYPE_DEFAULT, "CAA has Display repair history.", buf, 2u);
          }

          objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v19, self, 0, 0, objc_opt_class(), 2, 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("Display"), "stringByAppendingString:", CFSTR("Repair"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setProperty:forKey:", v37, *MEMORY[0x24BE75AC0]);

          if (v30)
          {
            -[SystemHealthUI valueForSpecifierUsed](self, "valueForSpecifierUsed");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setProperty:forKey:", v38, CFSTR("CRImageAlertKey"));

            analytics = self->analytics;
            v39 = CFSTR("Used");
          }
          else
          {
            -[SystemHealthUI valueForSpecifierRepaired](self, "valueForSpecifierRepaired");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setProperty:forKey:", v40, CFSTR("CRImageAlertKey"));

            analytics = self->analytics;
            v39 = CFSTR("Repair");
          }
          objc_msgSend(CFSTR("Display"), "stringByAppendingString:", v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = CFSTR("RepairUsingCAA");
          goto LABEL_39;
        }
        if ((_os_feature_enabled_impl() & v23 & 1) != 0)
          goto LABEL_22;
      }
      if (!self->deviceFDRVersion1
        && self->isRepaired
        && objc_msgSend(MEMORY[0x24BE27E98], "hasHadAuthorizedRepairForComponent:", 1)
        && (objc_msgSend(v49, "isEqualToString:", CFSTR("0")) & 1) == 0)
      {
        sub_22AC82A9C(0);
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v51 = 0;
          _os_log_impl(&dword_22AC64000, v43, OS_LOG_TYPE_DEFAULT, "Local data shows repaired history for Display. CAA is unavailable for now.", v51, 2u);
        }

        objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v19, self, 0, 0, objc_opt_class(), 2, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("Display"), "stringByAppendingString:", CFSTR("Repair"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setProperty:forKey:", v44, *MEMORY[0x24BE75AC0]);

        if (v30)
        {
          -[SystemHealthUI valueForSpecifierUsed](self, "valueForSpecifierUsed");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setProperty:forKey:", v45, CFSTR("CRImageAlertKey"));

          analytics = self->analytics;
          v46 = CFSTR("Used");
        }
        else
        {
          -[SystemHealthUI valueForSpecifierRepaired](self, "valueForSpecifierRepaired");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setProperty:forKey:", v48, CFSTR("CRImageAlertKey"));

          analytics = self->analytics;
          v46 = CFSTR("Repair");
        }
        objc_msgSend(CFSTR("Display"), "stringByAppendingString:", v46);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = CFSTR("RepairUsingFDR");
        goto LABEL_39;
      }
    }
  }
LABEL_8:

}

- (void)extractBatterySpecifiers:(id)a3 configurationSpecifiers:(id)a4 caaRepairHistory:(id)a5 rchlHistory:(id)a6 claimCount:(id)a7
{
  id v12;
  id v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  int v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  _BOOL4 deviceFDRVersion1;
  int v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  CRUIAnalytics *analytics;
  const __CFString *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  id v57;
  id v58;
  id v59;
  uint8_t v60[16];
  uint8_t buf[16];

  v59 = a3;
  v57 = a4;
  v58 = a5;
  v12 = a6;
  v13 = a7;
  v14 = -[SystemHealthUI getBatteryHealthServiceState](self, "getBatteryHealthServiceState");
  -[MRLocalization localizedStringWithKey:defaultString:](self->locale, "localizedStringWithKey:defaultString:", CFSTR("Battery"), CFSTR("Battery"));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_opt_new();
  v17 = objc_msgSend(v16, "copyComponentStatus");

  v18 = v12;
  v19 = -[CRRepairHistory checkUsedStatusFor:withHistory:withClaimCount:](self->localRepairHistory, "checkUsedStatusFor:withHistory:withClaimCount:", CFSTR("Battery"), v12, v13);

  v20 = _os_feature_enabled_impl();
  v21 = _os_feature_enabled_impl();
  if (v17 == -1)
    goto LABEL_5;
  if (v17 == -3)
  {
    v22 = (void *)v15;
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, 0, objc_opt_class(), 2, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("Battery"), "stringByAppendingString:", CFSTR("FinishRepair"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setProperty:forKey:", v24, *MEMORY[0x24BE75AC0]);

    objc_msgSend(v23, "setIdentifier:", CFSTR("finishRepairId"));
    -[SystemHealthUI valueForSpecifierFinishRepair](self, "valueForSpecifierFinishRepair");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setProperty:forKey:", v25, CFSTR("CRImageAlertKey"));

    objc_msgSend(v23, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    v26 = v57;
    objc_msgSend(v57, "addObject:", v23);
    -[CRUIAnalytics sendAsyncAnalyticsForEventIfNeeded:moduleName:](self->analytics, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", CFSTR("FinishRepair"), CFSTR("Battery"));

    v28 = v58;
    v27 = v59;
    goto LABEL_7;
  }
  v29 = v21;
  if ((_os_feature_enabled_impl() & v21) == 1)
  {
LABEL_5:
    v22 = (void *)v15;
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, 0, objc_opt_class(), 2, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setIdentifier:", CFSTR("warningId"));
    -[SystemHealthUI valueForSpecifierUnknown](self, "valueForSpecifierUnknown");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setProperty:forKey:", v31, CFSTR("CRImageAlertKey"));

    objc_msgSend(v30, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(v30, "setProperty:forKey:", CFSTR("Battery"), *MEMORY[0x24BE75AC0]);
    v27 = v59;
    objc_msgSend(v59, "addObject:", v30);
    ++self->failedComponentsCount;
LABEL_6:

    v26 = v57;
    v28 = v58;
    goto LABEL_7;
  }
  if (v14 == 3)
  {
    v22 = (void *)v15;
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, 0, 0, 4, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setIdentifier:", CFSTR("NeedsService"));
    -[SystemHealthUI valueForSpecifierService](self, "valueForSpecifierService");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setProperty:forKey:", v32, CFSTR("CRImageAlertKey"));

    objc_msgSend(v30, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(v30, "setProperty:forKey:", CFSTR("NeedsService"), *MEMORY[0x24BE75AC0]);
    v27 = v59;
    objc_msgSend(v59, "addObject:", v30);
    goto LABEL_6;
  }
  v33 = v20 | v19;
  if (self->isRCHLDevice || v17 != 1)
  {
    v56 = v20 | v19;
    v26 = v57;
    v28 = v58;
    v27 = v59;
    v22 = (void *)v15;
    if (self->isRCHLDevice
      && v17 == 1
      && ((-[CRRepairHistory hasHadRCHLBasedRepairForComponent:withHistory:](self->localRepairHistory, "hasHadRCHLBasedRepairForComponent:withHistory:", CFSTR("Battery"), v18) & 1) != 0|| (_os_feature_enabled_impl() & v29) == 1))
    {
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, 0, objc_opt_class(), 2, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("Battery"), "stringByAppendingString:", CFSTR("Repair"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setProperty:forKey:", v43, *MEMORY[0x24BE75AC0]);

      if (v56)
      {
        -[SystemHealthUI valueForSpecifierUsed](self, "valueForSpecifierUsed");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setProperty:forKey:", v44, CFSTR("CRImageAlertKey"));

        analytics = self->analytics;
        v45 = CFSTR("Used");
      }
      else
      {
        -[SystemHealthUI valueForSpecifierRepaired](self, "valueForSpecifierRepaired");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setProperty:forKey:", v53, CFSTR("CRImageAlertKey"));

        analytics = self->analytics;
        v45 = CFSTR("Repair");
      }
      objc_msgSend(CFSTR("Battery"), "stringByAppendingString:", v45);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = CFSTR("RepairUsingRCHL");
LABEL_43:
      -[CRUIAnalytics sendAsyncAnalyticsForEventIfNeeded:moduleName:](analytics, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", v48, v47);

      objc_msgSend(v38, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
      v27 = v59;
      objc_msgSend(v59, "addObject:", v38);

    }
  }
  else
  {
    deviceFDRVersion1 = self->deviceFDRVersion1;
    v26 = v57;
    v28 = v58;
    v27 = v59;
    if (v58)
    {
      v35 = v33;
      if (!self->deviceFDRVersion1)
      {
        objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("vcrt"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36
          || (objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("bcrt")),
              (v36 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {

          v22 = (void *)v15;
LABEL_17:
          sub_22AC82A9C(0);
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22AC64000, v37, OS_LOG_TYPE_DEFAULT, "CAA has Battery repair history.", buf, 2u);
          }

          objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v22, self, 0, 0, objc_opt_class(), 2, 0);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("Battery"), "stringByAppendingString:", CFSTR("Repair"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setProperty:forKey:", v39, *MEMORY[0x24BE75AC0]);

          if (v35)
          {
            -[SystemHealthUI valueForSpecifierUsed](self, "valueForSpecifierUsed");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "setProperty:forKey:", v40, CFSTR("CRImageAlertKey"));

            analytics = self->analytics;
            v42 = CFSTR("Used");
          }
          else
          {
            -[SystemHealthUI valueForSpecifierRepaired](self, "valueForSpecifierRepaired");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "setProperty:forKey:", v46, CFSTR("CRImageAlertKey"));

            analytics = self->analytics;
            v42 = CFSTR("Repair");
          }
          objc_msgSend(CFSTR("Battery"), "stringByAppendingString:", v42);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = CFSTR("RepairUsingCAA");
          goto LABEL_43;
        }
        objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("SrvP"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = (void *)v15;
        if (v55)
          goto LABEL_17;
        deviceFDRVersion1 = self->deviceFDRVersion1;
        v27 = v59;
      }
    }
    else
    {
      v35 = v33;
    }
    v22 = (void *)v15;
    if (!deviceFDRVersion1
      && self->isRepaired
      && (objc_msgSend(MEMORY[0x24BE27E98], "hasHadAuthorizedRepairForComponent:", 0) & 1) != 0
      || (_os_feature_enabled_impl() & v29) == 1)
    {
      sub_22AC82A9C(0);
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v60 = 0;
        _os_log_impl(&dword_22AC64000, v49, OS_LOG_TYPE_DEFAULT, "Local data shows repaired history for Battery. CAA is unavailable for now.", v60, 2u);
      }

      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, 0, objc_opt_class(), 2, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("Battery"), "stringByAppendingString:", CFSTR("Repair"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setProperty:forKey:", v50, *MEMORY[0x24BE75AC0]);

      if (v35)
      {
        -[SystemHealthUI valueForSpecifierUsed](self, "valueForSpecifierUsed");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setProperty:forKey:", v51, CFSTR("CRImageAlertKey"));

        analytics = self->analytics;
        v52 = CFSTR("Used");
      }
      else
      {
        -[SystemHealthUI valueForSpecifierRepaired](self, "valueForSpecifierRepaired");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setProperty:forKey:", v54, CFSTR("CRImageAlertKey"));

        analytics = self->analytics;
        v52 = CFSTR("Repair");
      }
      objc_msgSend(CFSTR("Battery"), "stringByAppendingString:", v52);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = CFSTR("RepairUsingFDR");
      goto LABEL_43;
    }
  }
LABEL_7:

}

- (void)extractAudioSpecifiers
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)objc_opt_new();
  v4 = objc_msgSend(v3, "copyComponentStatus");

  if (v4 == -1)
    ++self->failedComponentsCount;
  v5 = (void *)objc_opt_new();
  v6 = objc_msgSend(v5, "copyComponentStatus");

  if (v6 == -1)
    ++self->failedComponentsCount;
}

- (void)extractRCameraHWFailureSpecifiers
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_opt_new();
  v4 = objc_msgSend(v3, "copyComponentStatus");

  if (v4 == -1)
    ++self->failedComponentsCount;
}

- (void)setupCAARetry:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  uint8_t *v14;
  uint8_t v15[16];
  __int16 v16;
  uint8_t v17[2];
  uint8_t buf[16];

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird"));
  objc_msgSend(v5, "objectForKey:", CFSTR("cachedSealingManifest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE27E98], "getLocalSealingManifest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->deviceFDRVersion1 && self->isRepaired)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird"));
    objc_msgSend(v9, "objectForKey:", CFSTR("cachedCAACert"));
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8 && -[NSObject length](v8, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v8, 0, 0, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v7, "isEqualToData:", v6))
    {
      sub_22AC82A9C(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22AC64000, v10, OS_LOG_TYPE_DEFAULT, "Local sealing data matches cached one. CAA has been requested before. Skipping ...", buf, 2u);
      }

      goto LABEL_19;
    }
    sub_22AC82A9C(0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v12)
      {
        v16 = 0;
        v13 = "Requesting CAA due to local and cached sealing data mismatch ...";
        v14 = (uint8_t *)&v16;
LABEL_17:
        _os_log_impl(&dword_22AC64000, v11, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
      }
    }
    else if (v12)
    {
      *(_WORD *)v17 = 0;
      v13 = "Requesting CAA due to no cached sealing data ...";
      v14 = v17;
      goto LABEL_17;
    }

    -[SystemHealthUI retryCAA](self, "retryCAA");
    goto LABEL_19;
  }
  sub_22AC82A9C(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_22AC64000, v8, OS_LOG_TYPE_DEFAULT, "FDR data indicates no repair happened on this device.", v15, 2u);
  }
LABEL_19:

}

- (void)extractBluetoohSpecifiers
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_opt_new();
  v4 = objc_msgSend(v3, "copyComponentStatus");

  if (v4 == -1)
    ++self->failedComponentsCount;
}

- (void)extractBasebandSpecifiers:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_opt_new();
  v5 = objc_msgSend(v4, "copyComponentStatus");

  if (v5 == -1)
  {
    v6 = (void *)MEMORY[0x24BE75590];
    -[MRLocalization localizedStringWithKey:defaultString:](self->locale, "localizedStringWithKey:defaultString:", CFSTR("Baseband"), CFSTR("Baseband"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, self, 0, 0, objc_opt_class(), 2, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setProperty:forKey:", CFSTR("Baseband"), *MEMORY[0x24BE75AC0]);
    -[SystemHealthUI valueForSpecifierIssue](self, "valueForSpecifierIssue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProperty:forKey:", v9, CFSTR("CRImageAlertKey"));

    objc_msgSend(v8, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(v10, "addObject:", v8);
    -[CRUIAnalytics sendAsyncAnalyticsForEventIfNeeded:moduleName:](self->analytics, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", CFSTR("SGAViewSeen"), CFSTR("Baseband"));
    ++self->failedComponentsCount;

  }
}

- (void)extractBackGlassSpecifiers:(id)a3 configurationSpecifiers:(id)a4 caaRepairHistory:(id)a5 rchlHistory:(id)a6
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  -[MRLocalization localizedStringWithKey:defaultString:](self->locale, "localizedStringWithKey:defaultString:", CFSTR("BACK_GLASS"), CFSTR("BACK_GLASS"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v9 = objc_msgSend(v8, "copyComponentStatus");

  if (v9 == -3)
  {
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, self, 0, 0, objc_opt_class(), 2, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("BackGlass"), "stringByAppendingString:", CFSTR("FinishRepair"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setProperty:forKey:", v11, *MEMORY[0x24BE75AC0]);

    objc_msgSend(v10, "setIdentifier:", CFSTR("finishRepairId"));
    -[SystemHealthUI valueForSpecifierFinishRepair](self, "valueForSpecifierFinishRepair");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setProperty:forKey:", v12, CFSTR("CRImageAlertKey"));

    objc_msgSend(v10, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(v13, "addObject:", v10);
    -[CRUIAnalytics sendAsyncAnalyticsForEventIfNeeded:moduleName:](self->analytics, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", CFSTR("FinishRepair"), CFSTR("BackGlass"));

  }
}

- (void)extractEnclosureSpecifiers:(id)a3 caaRepairHistory:(id)a4 rchlHistory:(id)a5
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[MRLocalization localizedStringWithKey:defaultString:](self->locale, "localizedStringWithKey:defaultString:", CFSTR("ENCLOSURE"), CFSTR("ENCLOSURE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v8 = objc_msgSend(v7, "copyComponentStatus");

  if (v8 == -3)
  {
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, 0, objc_opt_class(), 2, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("Enclosure"), "stringByAppendingString:", CFSTR("FinishRepair"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProperty:forKey:", v10, *MEMORY[0x24BE75AC0]);

    objc_msgSend(v9, "setIdentifier:", CFSTR("finishRepairId"));
    -[SystemHealthUI valueForSpecifierFinishRepair](self, "valueForSpecifierFinishRepair");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProperty:forKey:", v11, CFSTR("CRImageAlertKey"));

    objc_msgSend(v9, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(v12, "addObject:", v9);
    -[CRUIAnalytics sendAsyncAnalyticsForEventIfNeeded:moduleName:](self->analytics, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", CFSTR("FinishRepair"), CFSTR("Enclosure"));

  }
}

- (void)extractNFCSpecifiers:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_opt_new();
  v5 = objc_msgSend(v4, "copyComponentStatus");

  if (v5 == -1)
  {
    -[MRLocalization localizedStringWithKey:defaultString:](self->locale, "localizedStringWithKey:defaultString:", CFSTR("NFC"), CFSTR("NFC"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, 0, objc_opt_class(), 2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", CFSTR("NFC"), *MEMORY[0x24BE75AC0]);
    -[SystemHealthUI valueForSpecifierIssue](self, "valueForSpecifierIssue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v8, CFSTR("CRImageAlertKey"));

    objc_msgSend(v7, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(v9, "addObject:", v7);
    -[CRUIAnalytics sendAsyncAnalyticsForEventIfNeeded:moduleName:](self->analytics, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", CFSTR("SGAViewSeen"), CFSTR("NFC"));
    ++self->failedComponentsCount;

  }
}

- (void)extractUWBSpecifiers:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_opt_new();
  v5 = objc_msgSend(v4, "copyComponentStatus");

  if (v5 == -1)
  {
    -[MRLocalization localizedStringWithKey:defaultString:](self->locale, "localizedStringWithKey:defaultString:", CFSTR("UWB"), CFSTR("UWB"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, 0, objc_opt_class(), 2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", CFSTR("UWB"), *MEMORY[0x24BE75AC0]);
    -[SystemHealthUI valueForSpecifierIssue](self, "valueForSpecifierIssue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v8, CFSTR("CRImageAlertKey"));

    objc_msgSend(v7, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(v9, "addObject:", v7);
    -[CRUIAnalytics sendAsyncAnalyticsForEventIfNeeded:moduleName:](self->analytics, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", CFSTR("SGAViewSeen"), CFSTR("UWB"));
    ++self->failedComponentsCount;

  }
}

- (id)setupGroupSpecifer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x24BE75590];
  -[MRLocalization localizedStringWithKey:defaultString:](self->locale, "localizedStringWithKey:defaultString:", CFSTR("SERVICE_HISTORY"), CFSTR("SERVICE_HISTORY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupSpecifierWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRLocalization localizedStringWithKey:defaultString:](self->locale, "localizedStringWithKey:defaultString:", CFSTR("PART_SERVICE_HISTORY_URL"), CFSTR("PART_SERVICE_HISTORY_URL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CRRepairHistory isSupportedIPad](self->localRepairHistory, "isSupportedIPad"))
  {
    -[MRLocalization localizedStringWithKey:defaultString:](self->locale, "localizedStringWithKey:defaultString:", CFSTR("PART_SERVICE_HISTORY_URL_IPAD"), CFSTR("PART_SERVICE_HISTORY_URL_IPAD"));
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  objc_msgSend(v5, "setProperty:forKey:", CFSTR("COMPONENT_GROUP"), *MEMORY[0x24BE75AC0]);
  objc_msgSend(v5, "setProperty:forKey:", v6, *MEMORY[0x24BE75A60]);

  return v5;
}

- (BOOL)hasUnsealedComponents
{
  void *v2;
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)objc_opt_new();
  if (objc_msgSend(v2, "copyComponentStatus") == -3)
  {
    v3 = 1;
  }
  else
  {
    v4 = (void *)objc_opt_new();
    if (objc_msgSend(v4, "copyComponentStatus") == -3)
    {
      v3 = 1;
    }
    else
    {
      v5 = (void *)objc_opt_new();
      if (objc_msgSend(v5, "copyComponentStatus") == -3)
      {
        v3 = 1;
      }
      else
      {
        v6 = (void *)objc_opt_new();
        if (objc_msgSend(v6, "copyComponentStatus") == -3)
        {
          v3 = 1;
        }
        else
        {
          v7 = (void *)objc_opt_new();
          if (objc_msgSend(v7, "copyComponentStatus") == -3)
          {
            v3 = 1;
          }
          else
          {
            v8 = (void *)objc_opt_new();
            if (objc_msgSend(v8, "copyComponentStatus") == -3)
            {
              v3 = 1;
            }
            else
            {
              v9 = (void *)objc_opt_new();
              v3 = objc_msgSend(v9, "copyComponentStatus") == -3;

            }
          }

        }
      }

    }
  }

  return v3;
}

- (id)getCurrentSystemHealthInfoSpecifiers
{
  return self->cachedSpecifiers;
}

- (id)reloadCurrentSystemHealthInfoSpecifiers
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[16];

  if (-[CRRepairHistory isSupportedIPad](self->localRepairHistory, "isSupportedIPad"))
  {
    sub_22AC82A9C(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22AC64000, v3, OS_LOG_TYPE_DEFAULT, "Enabling Parts and Service History for supported iPads", buf, 2u);
    }

  }
  else if (self->deviceClass != 1)
  {
    return 0;
  }
  v4 = (void *)objc_opt_new();
  -[SystemHealthUI getCurrentDetailsWithPrivacySpecifier:](self, "getCurrentDetailsWithPrivacySpecifier:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x24BE75AC0];
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("PARTS_AND_SERVICE_GROUP"), *MEMORY[0x24BE75AC0]);
    v8 = (void *)MEMORY[0x24BE75590];
    -[MRLocalization localizedStringWithKey:defaultString:](self->locale, "localizedStringWithKey:defaultString:", CFSTR("PARTS_AND_SERVICE_HISTORY"), CFSTR("PARTS_AND_SERVICE_HISTORY"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, 0, 0, objc_opt_class(), 2, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("MAIN_PARTS_AND_SERVICE"), v7);
    objc_msgSend(v4, "addObject:", v6);
    objc_msgSend(v4, "addObject:", v10);

  }
  v11 = v4;

  return v11;
}

- (void)setupPrivacyFooterFor:(id)a3 withPrivacySpecifier:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];

  v4 = a4;
  v6 = a3;
  if (v4
    && +[MRDataCollectionNotice shouldShowDataCollectionNoticeForComponent:](MRDataCollectionNotice, "shouldShowDataCollectionNoticeForComponent:", 10))
  {
    -[MRLocalization localizedStringWithKey:defaultString:](self->locale, "localizedStringWithKey:defaultString:", CFSTR("INFORMATION_COLLECTION_TEXT"), CFSTR("INFORMATION_COLLECTION_TEXT"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BE75A68];
    objc_msgSend(v6, "setProperty:forKey:", v7, *MEMORY[0x24BE75A68]);

    if (self->deviceClass == 3)
    {
      -[MRLocalization localizedStringWithKey:defaultString:](self->locale, "localizedStringWithKey:defaultString:", CFSTR("INFORMATION_COLLECTION_TEXT_IPAD"), CFSTR("INFORMATION_COLLECTION_TEXT_IPAD"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setProperty:forKey:", v9, v8);

    }
    +[MRDataCollectionNotice didShowDataCollectionNoticeForComponent:](MRDataCollectionNotice, "didShowDataCollectionNoticeForComponent:", 10);
LABEL_9:
    -[SystemHealthUI scheduleNetworkActivityWith:](self, "scheduleNetworkActivityWith:", 1);
    goto LABEL_10;
  }
  sub_22AC82A9C(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_22AC64000, v10, OS_LOG_TYPE_DEFAULT, "Do not need to show data collection specifier", v11, 2u);
  }

  if (-[SystemHealthUI hasUnsealedComponents](self, "hasUnsealedComponents"))
    goto LABEL_9;
LABEL_10:

}

- (id)getCurrentDetailsWithPrivacySpecifier:(BOOL)a3
{
  CRRepairHistory *localRepairHistory;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  _QWORD block[4];
  id v51;
  SystemHealthUI *v52;
  id v53;
  id v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v45 = a3;
  v59 = *MEMORY[0x24BDAC8D0];
  self->failedComponentsCount = 0;
  localRepairHistory = self->localRepairHistory;
  v54 = 0;
  -[CRRepairHistory extractRCHLRepairHistoryAndClaimCount:](localRepairHistory, "extractRCHLRepairHistoryAndClaimCount:", &v54);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v54;
  sub_22AC82A9C(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v56 = (uint64_t)v6;
    _os_log_impl(&dword_22AC64000, v7, OS_LOG_TYPE_DEFAULT, "claimcount:%@", buf, 0xCu);
  }

  if (-[CRRepairHistory isSupportedIPad](self->localRepairHistory, "isSupportedIPad"))
  {
    sub_22AC82A9C(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22AC64000, v8, OS_LOG_TYPE_DEFAULT, "Enabling Parts and Service History for supported iPads", buf, 2u);
    }

  }
  else if (self->deviceClass != 1)
  {
    v47 = 0;
    v10 = 0;
    v9 = 0;
    v35 = 0;
    goto LABEL_37;
  }
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  v11 = objc_opt_new();
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird"));
  -[CRRepairHistory getUseCountExceptionsWith:](self->localRepairHistory, "getUseCountExceptionsWith:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(21, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22AC6E6E4;
  block[3] = &unk_24F4D4BB8;
  v39 = v12;
  v51 = v39;
  v52 = self;
  v14 = v6;
  v53 = v14;
  dispatch_async(v13, block);

  v49 = 0;
  objc_msgSend(MEMORY[0x24BE27E98], "isServicePartWithError:", &v49);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v49;
  sub_22AC82A9C(0);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v56 = v15;
    v57 = 2112;
    v58 = v16;
    _os_log_impl(&dword_22AC64000, v17, OS_LOG_TYPE_DEFAULT, "SrvP: %@ error: %@", buf, 0x16u);
  }
  v37 = (void *)v15;

  -[MRLocalization localizedStringWithKey:defaultString:](self->locale, "localizedStringWithKey:defaultString:", CFSTR("Camera"), CFSTR("Camera"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v6;
  v40 = (void *)v11;
  v38 = v16;
  if (v45 && !self->isRCHLDevice)
  {
    v18 = v5;
    v48 = 0;
    -[SystemHealthUI setupCAARetry:](self, "setupCAARetry:", &v48);
    v47 = v48;
  }
  else
  {
    v18 = v5;
    v47 = 0;
  }
  -[SystemHealthUI setupGroupSpecifer](self, "setupGroupSpecifer");
  v43 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BE75590];
  -[MRLocalization localizedStringWithKey:defaultString:](self->locale, "localizedStringWithKey:defaultString:", CFSTR("CONFIGURATION_AVAILABLE"), CFSTR("CONFIGURATION_AVAILABLE"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "groupSpecifierWithName:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = v21;
  objc_msgSend(v21, "setIdentifier:", CFSTR("CONFIGURATION_AVAILABLE"));
  v22 = (void *)MEMORY[0x24BE75590];
  -[MRLocalization localizedStringWithKey:defaultString:](self->locale, "localizedStringWithKey:defaultString:", CFSTR("RESTART_FINISH_REPAIR"), CFSTR("RESTART_FINISH_REPAIR"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[SystemHealthUI sharedInstance](SystemHealthUI, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v23, v24, 0, 0, 0, 13, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "setIdentifier:", CFSTR("PARTSBUTTON"));
  v5 = v18;
  if (self->deviceClass == 1)
  {
    -[SystemHealthUI extractBatterySpecifiers:configurationSpecifiers:caaRepairHistory:rchlHistory:claimCount:](self, "extractBatterySpecifiers:configurationSpecifiers:caaRepairHistory:rchlHistory:claimCount:", v9, v10, v47, v18, v14);
    -[SystemHealthUI extractBackGlassSpecifiers:configurationSpecifiers:caaRepairHistory:rchlHistory:](self, "extractBackGlassSpecifiers:configurationSpecifiers:caaRepairHistory:rchlHistory:", v9, v10, v47, v18);
    -[SystemHealthUI extractEnclosureSpecifiers:caaRepairHistory:rchlHistory:](self, "extractEnclosureSpecifiers:caaRepairHistory:rchlHistory:", v10, v47, v18);
    -[SystemHealthUI extractMtubSpecifiers:caaRepairHistory:srvp:rchlHistory:](self, "extractMtubSpecifiers:caaRepairHistory:srvp:rchlHistory:", v9, v47, v37, v18);
    -[SystemHealthUI extractCameraSpecifiers:componentsInfoSpecifiers:configurationSpecifiers:caaRepairHistory:srvp:rchlHistory:claimCount:](self, "extractCameraSpecifiers:componentsInfoSpecifiers:configurationSpecifiers:caaRepairHistory:srvp:rchlHistory:claimCount:", v46, v9, v10, v47, v37, v18, v14);
  }
  -[SystemHealthUI extractDisplaySpecifiers:configurationSpecifiers:caaRepairHistory:srvp:rchlHistory:claimCount:](self, "extractDisplaySpecifiers:configurationSpecifiers:caaRepairHistory:srvp:rchlHistory:claimCount:", v9, v10, v47, v37, v18, v14);
  -[SystemHealthUI extractBluetoohSpecifiers](self, "extractBluetoohSpecifiers");
  -[SystemHealthUI extractWifiSpecifiers](self, "extractWifiSpecifiers");
  -[SystemHealthUI extractBasebandSpecifiers:](self, "extractBasebandSpecifiers:", v9);
  -[SystemHealthUI extractNFCSpecifiers:](self, "extractNFCSpecifiers:", v9);
  -[SystemHealthUI extractUWBSpecifiers:](self, "extractUWBSpecifiers:", v9);
  -[SystemHealthUI extractAudioSpecifiers](self, "extractAudioSpecifiers");
  if (MGGetBoolAnswer())
    -[SystemHealthUI extractFaceIDSpecifiers:configurationSpecifiers:caaRepairHistory:rchlHistory:claimCount:](self, "extractFaceIDSpecifiers:configurationSpecifiers:caaRepairHistory:rchlHistory:claimCount:", v9, v10, v47, v18, v14);
  -[SystemHealthUI extractRCameraHWFailureSpecifiers](self, "extractRCameraHWFailureSpecifiers");
  if (self->deviceClass == 3)
  {
    -[SystemHealthUI extractiPadCameraSpecifiers:componentsInfoSpecifiers:configurationSpecifiers:caaRepairHistory:rchlHistory:](self, "extractiPadCameraSpecifiers:componentsInfoSpecifiers:configurationSpecifiers:caaRepairHistory:rchlHistory:", v46, v9, v10, v47, v18);
    if (MGGetBoolAnswer())
      -[SystemHealthUI extractTouchIDSpecifiers:configurationSpecifiers:caaRepairHistory:rchlHistory:](self, "extractTouchIDSpecifiers:configurationSpecifiers:caaRepairHistory:rchlHistory:", v9, v10, v47, v18);
  }
  v26 = (void *)v43;
  if (objc_msgSend(v10, "count") || objc_msgSend(v9, "count"))
  {
    if (objc_msgSend(v10, "count"))
    {
      -[SystemHealthUI setupPrivacyFooterFor:withPrivacySpecifier:](self, "setupPrivacyFooterFor:withPrivacySpecifier:", v44, v45);
      objc_msgSend(v40, "addObject:", v44);
      if (objc_msgSend(v10, "count") == 1
        && (objc_msgSend(v10, "objectAtIndexedSubscript:", 0),
            v27 = (void *)objc_claimAutoreleasedReturnValue(),
            v28 = objc_msgSend(v27, "detailControllerClass"),
            v27,
            v28))
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "detailControllerClass");
        v30 = (void *)objc_opt_new();

        objc_msgSend(v30, "componentName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setTitleText:", v31);

        objc_msgSend(v30, "specifiers");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32)
          objc_msgSend(v40, "addObjectsFromArray:", v32);

        v26 = (void *)v43;
      }
      else
      {
        objc_msgSend(v40, "addObjectsFromArray:", v10);
      }
      objc_msgSend(v25, "setButtonAction:", sel_showActionSheets);
      objc_msgSend(v40, "addObject:", v25);
    }
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v40, "addObject:", v26);
      objc_msgSend(v40, "addObjectsFromArray:", v9);
    }
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird"));
    objc_msgSend(v33, "setBool:forKey:", 1, CFSTR("settingsView"));

  }
  if (self->failedComponentsCount)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("FailedComponentsCount:%d"), self->failedComponentsCount);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUIAnalytics sendAsyncAnalyticsForEventIfNeeded:moduleName:](self->analytics, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", v34, CFSTR("FailedComponentsCount"));

  }
  v35 = v40;

  v6 = v42;
LABEL_37:

  return v35;
}

- (void)updateSpecifiersWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id buf[2];

  v4 = a3;
  sub_22AC82A9C(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_22AC64000, v5, OS_LOG_TYPE_DEFAULT, "updateSpecifiersWithCompletionHandler", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  dispatch_get_global_queue(21, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_22AC6EA24;
  v8[3] = &unk_24F4D4C30;
  objc_copyWeak(&v10, buf);
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

- (id)findSpecifierToInsertAfter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char *v7;
  char *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  char *v15;
  void *v16;
  char isKindOfClass;
  int v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    -[SystemHealthUI parentViewController](self, "parentViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "specifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_3;
LABEL_11:
    sub_22AC82A9C(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_22AC856E8();
    v7 = 0;
    goto LABEL_23;
  }
  objc_msgSend(v4, "specifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_11;
LABEL_3:
  if (!objc_msgSend(v6, "count"))
  {
LABEL_20:
    v7 = 0;
    goto LABEL_21;
  }
  v7 = 0;
  while (1)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
    v8 = (char *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_8;
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("INFORMATION_GROUP")))
      break;
    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("PARTS_AND_SERVICE_GROUP"));

    if (v11)
      goto LABEL_15;
LABEL_8:

    if ((unint64_t)++v7 >= objc_msgSend(v6, "count"))
      goto LABEL_18;
  }

LABEL_15:
  sub_22AC82A9C(0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = v8;
    _os_log_impl(&dword_22AC64000, v14, OS_LOG_TYPE_DEFAULT, "Anchor specifier %@", (uint8_t *)&v19, 0xCu);
  }

  if (!v7)
    goto LABEL_21;
LABEL_18:
  v15 = v7 - 1;
  objc_msgSend(v6, "objectAtIndexedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_20;
  objc_msgSend(v6, "objectAtIndexedSubscript:", v15);
  v7 = (char *)objc_claimAutoreleasedReturnValue();
LABEL_21:
  sub_22AC82A9C(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = v7;
    _os_log_impl(&dword_22AC64000, v13, OS_LOG_TYPE_DEFAULT, "Insert after %@", (uint8_t *)&v19, 0xCu);
  }
LABEL_23:

  return v7;
}

- (void)_updateSpecifiers:(id)a3 specifierToInsertAfter:(id)a4 withUpdates:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSArray *cachedSpecifiers;
  void *v13;
  int v14;
  NSArray *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  sub_22AC82A9C(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    cachedSpecifiers = self->cachedSpecifiers;
    v14 = 138412546;
    v15 = cachedSpecifiers;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_22AC64000, v11, OS_LOG_TYPE_DEFAULT, "Updating specifiers: %@ -> %@", (uint8_t *)&v14, 0x16u);
  }

  objc_msgSend(v9, "removeSpecifierWithID:", CFSTR("PARTS_AND_SERVICE_GROUP"));
  objc_msgSend(v9, "removeSpecifierWithID:", CFSTR("MAIN_PARTS_AND_SERVICE"));
  objc_msgSend(v9, "insertContiguousSpecifiers:afterSpecifier:", v8, v10);

  v13 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->cachedSpecifiers, v13);
  if (!v8)

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cachedSpecifiers, 0);
  objc_storeStrong((id *)&self->locale, 0);
  objc_storeStrong((id *)&self->localRepairHistory, 0);
  objc_storeStrong((id *)&self->analytics, 0);
  objc_storeStrong((id *)&self->asyncQueue, 0);
}

@end
