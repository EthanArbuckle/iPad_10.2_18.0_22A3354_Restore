@implementation NMSAppActivityStatus

- (NMSAppActivityStatus)initWithBundleID:(id)a3
{
  id v5;
  NMSAppActivityStatus *v6;
  NMSAppActivityStatus *v7;
  NMSAppActivityStatus *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NMSAppActivityStatus;
  v6 = -[NMSAppActivityStatus init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleID, a3);
    v8 = v7;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSAppActivityStatus bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "installDateForBundleID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSAppActivityStatus bundleID](self, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastUserPinningChangeDateForBundleID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSAppActivityStatus bundleID](self, "bundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastContentUsedDateForBundleID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSAppActivityStatus bundleID](self, "bundleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastLocalPlaybackDateForBundleID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSAppActivityStatus bundleID](self, "bundleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "dormancyIntervalInHoursForBundleID:", v16);

  v18 = (void *)MEMORY[0x24BDD17C8];
  v23.receiver = self;
  v23.super_class = (Class)NMSAppActivityStatus;
  -[NMSAppActivityStatus description](&v23, sel_description);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSAppActivityStatus bundleID](self, "bundleID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("%@ bundleID <%@> installDate <%@> lastPinChange <%@> lastContentUsedDate <%@> lastLocalPlaybackDate <%@> dormancyIntervalInHours <%ld>"), v19, v20, v5, v8, v11, v14, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (BOOL)_exceedsDormancyInterval:(double)a3 forDate:(id)a4
{
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;

  if (!a4)
    return 1;
  v5 = (void *)MEMORY[0x24BDBCE60];
  v6 = a4;
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v8 = v7;
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v10 = v9;

  return v8 - v10 >= a3;
}

- (BOOL)isAppContentDormant
{
  -[NMSAppActivityStatus _defaultDormancyInterval](self, "_defaultDormancyInterval");
  return -[NMSAppActivityStatus isAppContentDormantWithInterval:](self, "isAppContentDormantWithInterval:");
}

- (BOOL)isAppContentDormantWithInterval:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSAppActivityStatus bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastUserLaunchDateForBundleID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NMSAppActivityStatus _exceedsDormancyInterval:forDate:](self, "_exceedsDormancyInterval:forDate:", v7, a3))
  {
    +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSAppActivityStatus bundleID](self, "bundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastContentUsedDateForBundleID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[NMSAppActivityStatus _exceedsDormancyInterval:forDate:](self, "_exceedsDormancyInterval:forDate:", v10, a3))
      v11 = -[NMSAppActivityStatus isAppDownloadingDormantWithInterval:](self, "isAppDownloadingDormantWithInterval:", a3);
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isAppDownloadingDormant
{
  -[NMSAppActivityStatus _defaultDormancyInterval](self, "_defaultDormancyInterval");
  return -[NMSAppActivityStatus isAppDownloadingDormantWithInterval:](self, "isAppDownloadingDormantWithInterval:");
}

- (BOOL)isAppDownloadingDormantWithInterval:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSAppActivityStatus bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastUserPinningChangeDateForBundleID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NMSAppActivityStatus _exceedsDormancyInterval:forDate:](self, "_exceedsDormancyInterval:forDate:", v7, a3))
  {
    +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSAppActivityStatus bundleID](self, "bundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastLocalPlaybackDateForBundleID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[NMSAppActivityStatus _exceedsDormancyInterval:forDate:](self, "_exceedsDormancyInterval:forDate:", v10, a3))
    {
      +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NMSAppActivityStatus bundleID](self, "bundleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "installDateForBundleID:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = -[NMSAppActivityStatus _exceedsDormancyInterval:forDate:](self, "_exceedsDormancyInterval:forDate:", v13, a3);
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (double)_defaultDormancyInterval
{
  void *v3;
  void *v4;
  uint64_t v5;

  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSAppActivityStatus bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "dormancyIntervalInHoursForBundleID:", v4);

  return (double)(3600 * v5);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
