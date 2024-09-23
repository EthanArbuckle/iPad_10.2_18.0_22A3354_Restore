@implementation AMSMetricsIdentifierStoreInfo

- (NSDate)started
{
  return self->_started;
}

- (NSString)storeUUID
{
  return self->_storeUUID;
}

- (NSString)storeKey
{
  return self->_storeKey;
}

- (BOOL)crossDeviceSync
{
  return self->_crossDeviceSync;
}

- (double)resetInterval
{
  return self->_resetInterval;
}

- (void)setModified:(id)a3
{
  objc_storeStrong((id *)&self->_modified, a3);
}

- (void)setCrossDeviceSync:(BOOL)a3
{
  self->_crossDeviceSync = a3;
}

- (void)setStoreUUID:(id)a3
{
  objc_storeStrong((id *)&self->_storeUUID, a3);
}

- (void)setStoreKey:(id)a3
{
  objc_storeStrong((id *)&self->_storeKey, a3);
}

- (void)setStarted:(id)a3
{
  objc_storeStrong((id *)&self->_started, a3);
}

- (void)setResetInterval:(double)a3
{
  self->_resetInterval = a3;
}

- (void)setLastSync:(id)a3
{
  objc_storeStrong((id *)&self->_lastSync, a3);
}

- (void)setDeleted:(BOOL)a3
{
  self->_deleted = a3;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (NSDate)modified
{
  return self->_modified;
}

- (NSDate)lastSync
{
  return self->_lastSync;
}

- (NSString)account
{
  return self->_account;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modified, 0);
  objc_storeStrong((id *)&self->_lastSync, 0);
  objc_storeStrong((id *)&self->_storeUUID, 0);
  objc_storeStrong((id *)&self->_storeKey, 0);
  objc_storeStrong((id *)&self->_started, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (id)description
{
  void *v3;
  NSString *storeUUID;
  NSString *storeKey;
  NSDate *started;
  void *v7;
  NSDate *modified;
  NSDate *lastSync;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AMSMetricsIdentifierStoreInfo;
  -[AMSMetricsIdentifierStoreInfo description](&v14, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  storeKey = self->_storeKey;
  storeUUID = self->_storeUUID;
  started = self->_started;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_resetInterval);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  lastSync = self->_lastSync;
  modified = self->_modified;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_crossDeviceSync);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_deleted);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" (storeKey: %@, storeUUID: %@, started: %@, storeUUID: %@, resetInterval: %@, modified: %@, lastSync: %@, crossDeviceSync: %@, deleted: %@, account: %@)"), storeKey, storeUUID, started, storeUUID, v7, modified, lastSync, v10, v11, self->_account);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
