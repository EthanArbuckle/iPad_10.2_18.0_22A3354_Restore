@implementation HKCloudSyncObserverStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKCloudSyncObserverStatus)init
{
  return -[HKCloudSyncObserverStatus initWithSyncEnabled:accountSupportsSecureContainer:accountProhibitedForCloudSync:lastPullDate:lastPushDate:lastLitePushDate:lastPulledUpdateDate:restoreCompletionDate:errorRequiringUserAction:dataUploadRequestStatus:dataUploadRequestStartDate:dataUploadRequestCompletionDate:](self, "initWithSyncEnabled:accountSupportsSecureContainer:accountProhibitedForCloudSync:lastPullDate:lastPushDate:lastLitePushDate:lastPulledUpdateDate:restoreCompletionDate:errorRequiringUserAction:dataUploadRequestStatus:dataUploadRequestStartDate:dataUploadRequestCompletionDate:", 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
}

- (HKCloudSyncObserverStatus)initWithSyncEnabled:(BOOL)a3 accountSupportsSecureContainer:(BOOL)a4 accountProhibitedForCloudSync:(BOOL)a5 lastPullDate:(id)a6 lastPushDate:(id)a7 lastLitePushDate:(id)a8 lastPulledUpdateDate:(id)a9 restoreCompletionDate:(id)a10 errorRequiringUserAction:(id)a11 dataUploadRequestStatus:(int64_t)a12 dataUploadRequestStartDate:(id)a13 dataUploadRequestCompletionDate:(id)a14
{
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  HKCloudSyncObserverStatus *v27;
  HKCloudSyncObserverStatus *v28;
  uint64_t v29;
  NSDate *lastPullDate;
  uint64_t v31;
  NSDate *lastPushDate;
  uint64_t v33;
  NSDate *lastLitePushDate;
  uint64_t v35;
  NSDate *lastPulledUpdateDate;
  uint64_t v37;
  NSDate *restoreCompletionDate;
  uint64_t v39;
  NSError *errorRequiringUserAction;
  uint64_t v41;
  NSDate *dataUploadRequestStartDate;
  uint64_t v43;
  NSDate *dataUploadRequestCompletionDate;
  objc_super v48;

  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = v19;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a13;
  v26 = a14;
  v48.receiver = self;
  v48.super_class = (Class)HKCloudSyncObserverStatus;
  v27 = -[HKCloudSyncObserverStatus init](&v48, sel_init);
  v28 = v27;
  if (v27)
  {
    v27->_syncEnabled = a3;
    v27->_accountSupportsSecureContainer = a4;
    v27->_accountProhibitedForCloudSync = a5;
    v29 = objc_msgSend(v18, "copy");
    lastPullDate = v28->_lastPullDate;
    v28->_lastPullDate = (NSDate *)v29;

    v31 = objc_msgSend(v21, "copy");
    lastPushDate = v28->_lastPushDate;
    v28->_lastPushDate = (NSDate *)v31;

    v33 = objc_msgSend(v20, "copy");
    lastLitePushDate = v28->_lastLitePushDate;
    v28->_lastLitePushDate = (NSDate *)v33;

    v35 = objc_msgSend(v22, "copy");
    lastPulledUpdateDate = v28->_lastPulledUpdateDate;
    v28->_lastPulledUpdateDate = (NSDate *)v35;

    v37 = objc_msgSend(v23, "copy");
    restoreCompletionDate = v28->_restoreCompletionDate;
    v28->_restoreCompletionDate = (NSDate *)v37;

    v39 = objc_msgSend(v24, "copy");
    errorRequiringUserAction = v28->_errorRequiringUserAction;
    v28->_errorRequiringUserAction = (NSError *)v39;

    v28->_dataUploadRequestStatus = a12;
    v41 = objc_msgSend(v25, "copy");
    dataUploadRequestStartDate = v28->_dataUploadRequestStartDate;
    v28->_dataUploadRequestStartDate = (NSDate *)v41;

    v43 = objc_msgSend(v26, "copy");
    dataUploadRequestCompletionDate = v28->_dataUploadRequestCompletionDate;
    v28->_dataUploadRequestCompletionDate = (NSDate *)v43;

  }
  return v28;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 syncEnabled;
  id v5;

  syncEnabled = self->_syncEnabled;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", syncEnabled, CFSTR("HKCloudSyncObserverStatusSyncEnabled"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_accountSupportsSecureContainer, CFSTR("HKCloudSyncObserverStatusAccountSupportsSecureContainer"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_accountProhibitedForCloudSync, CFSTR("HKCloudSyncObserverStatusAccountProhibitedForCloudSync"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastPullDate, CFSTR("HKCloudSyncObserverStatusLastPullDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastPushDate, CFSTR("HKCloudSyncObserverStatusLastPushDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastLitePushDate, CFSTR("HKCloudSyncObserverStatusLastLitePushDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastPulledUpdateDate, CFSTR("HKCloudSyncObserverStatusLastPulledUpdateDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_restoreCompletionDate, CFSTR("HKCloudSyncObserverStatusRestoreCompletionDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_errorRequiringUserAction, CFSTR("HKCloudSyncObserverStatusErrorRequiringUserAction"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_dataUploadRequestStatus, CFSTR("_HKCloudSyncObserverStatusDataUploadRequestStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dataUploadRequestStartDate, CFSTR("_HKCloudSyncObserverStatusDataUploadRequestStartDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dataUploadRequestCompletionDate, CFSTR("_HKCloudSyncObserverStatusDataUploadRequestCompletionDate"));

}

- (HKCloudSyncObserverStatus)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  HKCloudSyncObserverStatus *v13;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;

  v3 = a3;
  v17 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("HKCloudSyncObserverStatusSyncEnabled"));
  v16 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("HKCloudSyncObserverStatusAccountSupportsSecureContainer"));
  v15 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("HKCloudSyncObserverStatusAccountProhibitedForCloudSync"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKCloudSyncObserverStatusLastPullDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKCloudSyncObserverStatusLastPushDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKCloudSyncObserverStatusLastLitePushDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKCloudSyncObserverStatusLastPulledUpdateDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKCloudSyncObserverStatusRestoreCompletionDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKCloudSyncObserverStatusErrorRequiringUserAction"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("_HKCloudSyncObserverStatusDataUploadRequestStatus"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_HKCloudSyncObserverStatusDataUploadRequestStartDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_HKCloudSyncObserverStatusDataUploadRequestCompletionDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[HKCloudSyncObserverStatus initWithSyncEnabled:accountSupportsSecureContainer:accountProhibitedForCloudSync:lastPullDate:lastPushDate:lastLitePushDate:lastPulledUpdateDate:restoreCompletionDate:errorRequiringUserAction:dataUploadRequestStatus:dataUploadRequestStartDate:dataUploadRequestCompletionDate:](self, "initWithSyncEnabled:accountSupportsSecureContainer:accountProhibitedForCloudSync:lastPullDate:lastPushDate:lastLitePushDate:lastPulledUpdateDate:restoreCompletionDate:errorRequiringUserAction:dataUploadRequestStatus:dataUploadRequestStartDate:dataUploadRequestCompletionDate:", v17, v16, v15, v4, v5, v6, v7, v8, v9, v10, v11, v12);
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setSyncEnabled:", self->_syncEnabled);
  objc_msgSend(v5, "setAccountSupportsSecureContainer:", self->_accountSupportsSecureContainer);
  objc_msgSend(v5, "setAccountProhibitedForCloudSync:", self->_accountProhibitedForCloudSync);
  objc_msgSend(v5, "setLastPullDate:", self->_lastPullDate);
  objc_msgSend(v5, "setLastPushDate:", self->_lastPushDate);
  objc_msgSend(v5, "setLastLitePushDate:", self->_lastLitePushDate);
  objc_msgSend(v5, "setLastPulledUpdateDate:", self->_lastPulledUpdateDate);
  objc_msgSend(v5, "setRestoreCompletionDate:", self->_restoreCompletionDate);
  objc_msgSend(v5, "setErrorRequiringUserAction:", self->_errorRequiringUserAction);
  objc_msgSend(v5, "setDataUploadRequestStatus:", self->_dataUploadRequestStatus);
  v6 = (void *)-[NSDate copyWithZone:](self->_dataUploadRequestStartDate, "copyWithZone:", a3);
  objc_msgSend(v5, "setDataUploadRequestStartDate:", v6);

  v7 = (void *)-[NSDate copyWithZone:](self->_dataUploadRequestCompletionDate, "copyWithZone:", a3);
  objc_msgSend(v5, "setDataUploadRequestCompletionDate:", v7);

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[NSDate hash](self->_lastPullDate, "hash");
  v4 = -[NSDate hash](self->_lastPushDate, "hash") ^ v3;
  v5 = -[NSDate hash](self->_lastLitePushDate, "hash");
  v6 = v4 ^ v5 ^ -[NSDate hash](self->_lastPulledUpdateDate, "hash");
  v7 = -[NSDate hash](self->_restoreCompletionDate, "hash");
  v8 = v6 ^ v7 ^ -[NSError hash](self->_errorRequiringUserAction, "hash") ^ self->_dataUploadRequestStatus;
  v9 = -[NSDate hash](self->_dataUploadRequestStartDate, "hash");
  return v8 ^ v9 ^ -[NSDate hash](self->_dataUploadRequestCompletionDate, "hash") ^ self->_syncEnabled ^ self->_accountSupportsSecureContainer ^ self->_accountProhibitedForCloudSync;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDate *lastPullDate;
  NSDate *v6;
  NSDate *lastPushDate;
  NSDate *v8;
  NSDate *lastLitePushDate;
  NSDate *v10;
  NSDate *lastPulledUpdateDate;
  NSDate *v12;
  NSDate *restoreCompletionDate;
  NSDate *v14;
  NSError *errorRequiringUserAction;
  NSError *v16;
  NSDate *dataUploadRequestStartDate;
  NSDate *v18;
  NSDate *dataUploadRequestCompletionDate;
  NSDate *v20;
  char v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_30;
  if (self->_syncEnabled != *((unsigned __int8 *)v4 + 8))
    goto LABEL_30;
  if (self->_accountSupportsSecureContainer != *((unsigned __int8 *)v4 + 9))
    goto LABEL_30;
  if (self->_accountProhibitedForCloudSync != *((unsigned __int8 *)v4 + 10))
    goto LABEL_30;
  if (self->_dataUploadRequestStatus != v4[8])
    goto LABEL_30;
  lastPullDate = self->_lastPullDate;
  v6 = (NSDate *)v4[2];
  if (lastPullDate != v6 && (!v6 || !-[NSDate isEqual:](lastPullDate, "isEqual:")))
    goto LABEL_30;
  lastPushDate = self->_lastPushDate;
  v8 = (NSDate *)v4[3];
  if (lastPushDate != v8 && (!v8 || !-[NSDate isEqual:](lastPushDate, "isEqual:")))
    goto LABEL_30;
  lastLitePushDate = self->_lastLitePushDate;
  v10 = (NSDate *)v4[4];
  if (lastLitePushDate != v10 && (!v10 || !-[NSDate isEqual:](lastLitePushDate, "isEqual:")))
    goto LABEL_30;
  lastPulledUpdateDate = self->_lastPulledUpdateDate;
  v12 = (NSDate *)v4[5];
  if (lastPulledUpdateDate != v12 && (!v12 || !-[NSDate isEqual:](lastPulledUpdateDate, "isEqual:")))
    goto LABEL_30;
  restoreCompletionDate = self->_restoreCompletionDate;
  v14 = (NSDate *)v4[6];
  if (restoreCompletionDate != v14 && (!v14 || !-[NSDate isEqual:](restoreCompletionDate, "isEqual:")))
    goto LABEL_30;
  errorRequiringUserAction = self->_errorRequiringUserAction;
  v16 = (NSError *)v4[7];
  if (errorRequiringUserAction != v16
    && (!v16 || !-[NSError isEqual:](errorRequiringUserAction, "isEqual:")))
  {
    goto LABEL_30;
  }
  dataUploadRequestStartDate = self->_dataUploadRequestStartDate;
  v18 = (NSDate *)v4[9];
  if (dataUploadRequestStartDate != v18
    && (!v18 || !-[NSDate isEqual:](dataUploadRequestStartDate, "isEqual:")))
  {
    goto LABEL_30;
  }
  dataUploadRequestCompletionDate = self->_dataUploadRequestCompletionDate;
  v20 = (NSDate *)v4[10];
  if (dataUploadRequestCompletionDate == v20)
  {
    v21 = 1;
    goto LABEL_31;
  }
  if (v20)
    v21 = -[NSDate isEqual:](dataUploadRequestCompletionDate, "isEqual:");
  else
LABEL_30:
    v21 = 0;
LABEL_31:

  return v21;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)HKCloudSyncObserverStatus;
  -[HKCloudSyncObserverStatus description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: syncEnabled: %d, accountSupportsSecureContainer: %d, accountProhibitedForCloudSync: %d, lastPullDate: %@, lastPushDate: %@, lastLitePushDate: %@, lastPulledUpdateDate: %@, restoreCompletionDate: %@, errorRequiringUserAction: %@, dataUploadRequestStatus: %ld, dataUploadRequestStartDate: %@, dataUploadRequestCompletionDate: %@"), v4, self->_syncEnabled, self->_accountSupportsSecureContainer, self->_accountProhibitedForCloudSync, self->_lastPullDate, self->_lastPushDate, self->_lastLitePushDate, self->_lastPulledUpdateDate, self->_restoreCompletionDate, self->_errorRequiringUserAction, self->_dataUploadRequestStatus, self->_dataUploadRequestStartDate, self->_dataUploadRequestCompletionDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)syncEnabled
{
  return self->_syncEnabled;
}

- (void)setSyncEnabled:(BOOL)a3
{
  self->_syncEnabled = a3;
}

- (BOOL)accountSupportsSecureContainer
{
  return self->_accountSupportsSecureContainer;
}

- (void)setAccountSupportsSecureContainer:(BOOL)a3
{
  self->_accountSupportsSecureContainer = a3;
}

- (BOOL)accountProhibitedForCloudSync
{
  return self->_accountProhibitedForCloudSync;
}

- (void)setAccountProhibitedForCloudSync:(BOOL)a3
{
  self->_accountProhibitedForCloudSync = a3;
}

- (NSDate)lastPullDate
{
  return self->_lastPullDate;
}

- (void)setLastPullDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)lastPushDate
{
  return self->_lastPushDate;
}

- (void)setLastPushDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)lastLitePushDate
{
  return self->_lastLitePushDate;
}

- (void)setLastLitePushDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)lastPulledUpdateDate
{
  return self->_lastPulledUpdateDate;
}

- (void)setLastPulledUpdateDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)restoreCompletionDate
{
  return self->_restoreCompletionDate;
}

- (void)setRestoreCompletionDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSError)errorRequiringUserAction
{
  return self->_errorRequiringUserAction;
}

- (void)setErrorRequiringUserAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)dataUploadRequestStatus
{
  return self->_dataUploadRequestStatus;
}

- (void)setDataUploadRequestStatus:(int64_t)a3
{
  self->_dataUploadRequestStatus = a3;
}

- (NSDate)dataUploadRequestStartDate
{
  return self->_dataUploadRequestStartDate;
}

- (void)setDataUploadRequestStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDate)dataUploadRequestCompletionDate
{
  return self->_dataUploadRequestCompletionDate;
}

- (void)setDataUploadRequestCompletionDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataUploadRequestCompletionDate, 0);
  objc_storeStrong((id *)&self->_dataUploadRequestStartDate, 0);
  objc_storeStrong((id *)&self->_errorRequiringUserAction, 0);
  objc_storeStrong((id *)&self->_restoreCompletionDate, 0);
  objc_storeStrong((id *)&self->_lastPulledUpdateDate, 0);
  objc_storeStrong((id *)&self->_lastLitePushDate, 0);
  objc_storeStrong((id *)&self->_lastPushDate, 0);
  objc_storeStrong((id *)&self->_lastPullDate, 0);
}

@end
