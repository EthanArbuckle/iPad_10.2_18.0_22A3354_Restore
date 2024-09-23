@implementation CPSAppClipRecord

- (CPSAppClipRecord)initWithBundleID:(id)a3
{
  id v4;
  CPSAppClipRecord *v5;
  uint64_t v6;
  NSString *bundleID;
  CPSAppClipRecord *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSAppClipRecord;
  v5 = -[CPSAppClipRecord init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (CPSAppClipRecord)initWithSQLiteRow:(id)a3 bundleID:(id)a4
{
  id v6;
  CPSAppClipRecord *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  NSString *fullApplicationName;
  uint64_t v15;
  NSString *fullApplicationCaption;
  void *v17;
  uint64_t v18;
  NSURL *fullApplicationStoreURL;
  CPSAppClipRecord *v20;

  v6 = a3;
  v7 = -[CPSAppClipRecord initWithBundleID:](self, "initWithBundleID:", a4);
  if (v7)
  {
    objc_msgSend(v6, "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v7->_userNotificationGranted, v8);
    objc_msgSend(v6, "objectAtIndex:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v7->_locationConfirmationGranted, v9);
    v7->_locationConfirmationState = (int)objc_msgSend(v6, "intAtIndex:", 2);
    objc_msgSend(v6, "doubleAtIndex:", 3);
    v7->_lastProxCardLaunchTime = v10;
    objc_msgSend(v6, "doubleAtIndex:", 4);
    v7->_lastVersionCheckTime = v11;
    objc_msgSend(v6, "doubleAtIndex:", 5);
    v7->_lastInstallTime = v12;
    objc_msgSend(v6, "stringAtIndex:", 6);
    v13 = objc_claimAutoreleasedReturnValue();
    fullApplicationName = v7->_fullApplicationName;
    v7->_fullApplicationName = (NSString *)v13;

    objc_msgSend(v6, "stringAtIndex:", 7);
    v15 = objc_claimAutoreleasedReturnValue();
    fullApplicationCaption = v7->_fullApplicationCaption;
    v7->_fullApplicationCaption = (NSString *)v15;

    objc_msgSend(v6, "stringAtIndex:", 8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
      fullApplicationStoreURL = v7->_fullApplicationStoreURL;
      v7->_fullApplicationStoreURL = (NSURL *)v18;

    }
    v20 = v7;

  }
  return v7;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)userNotificationGranted
{
  return self->_userNotificationGranted;
}

- (void)setUserNotificationGranted:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)locationConfirmationGranted
{
  return self->_locationConfirmationGranted;
}

- (void)setLocationConfirmationGranted:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)locationConfirmationState
{
  return self->_locationConfirmationState;
}

- (void)setLocationConfirmationState:(int64_t)a3
{
  self->_locationConfirmationState = a3;
}

- (double)lastProxCardLaunchTime
{
  return self->_lastProxCardLaunchTime;
}

- (void)setLastProxCardLaunchTime:(double)a3
{
  self->_lastProxCardLaunchTime = a3;
}

- (double)lastVersionCheckTime
{
  return self->_lastVersionCheckTime;
}

- (void)setLastVersionCheckTime:(double)a3
{
  self->_lastVersionCheckTime = a3;
}

- (double)lastInstallTime
{
  return self->_lastInstallTime;
}

- (void)setLastInstallTime:(double)a3
{
  self->_lastInstallTime = a3;
}

- (NSString)fullApplicationName
{
  return self->_fullApplicationName;
}

- (void)setFullApplicationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)fullApplicationCaption
{
  return self->_fullApplicationCaption;
}

- (void)setFullApplicationCaption:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSURL)fullApplicationStoreURL
{
  return self->_fullApplicationStoreURL;
}

- (void)setFullApplicationStoreURL:(id)a3
{
  objc_storeStrong((id *)&self->_fullApplicationStoreURL, a3);
}

- (id)debug_fullApplicationIcon
{
  return self->_debug_fullApplicationIcon;
}

- (void)debug_setFullApplicationIcon:(id)a3
{
  objc_storeStrong(&self->_debug_fullApplicationIcon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_debug_fullApplicationIcon, 0);
  objc_storeStrong((id *)&self->_fullApplicationStoreURL, 0);
  objc_storeStrong((id *)&self->_fullApplicationCaption, 0);
  objc_storeStrong((id *)&self->_fullApplicationName, 0);
  objc_storeStrong((id *)&self->_locationConfirmationGranted, 0);
  objc_storeStrong((id *)&self->_userNotificationGranted, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
