@implementation HMDCloudSyncUploadReasonLogEvent

- (HMDCloudSyncUploadReasonLogEvent)initWithUploadReason:(id)a3 legacyPushCount:(int64_t)a4 homeZonePushCount:(int64_t)a5 homeManagerPushCount:(int64_t)a6
{
  id v11;
  HMDCloudSyncUploadReasonLogEvent *v12;
  HMDCloudSyncUploadReasonLogEvent *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMDCloudSyncUploadReasonLogEvent;
  v12 = -[HMMLogEvent init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_saveReason, a3);
    v13->_legacyPushCount = a4;
    v13->_homeZonePushCount = a5;
    v13->_homeManagerPushCount = a6;
  }

  return v13;
}

- (int64_t)legacyPushCount
{
  return self->_legacyPushCount;
}

- (int64_t)homeZonePushCount
{
  return self->_homeZonePushCount;
}

- (int64_t)homeManagerPushCount
{
  return self->_homeManagerPushCount;
}

- (NSString)saveReason
{
  return self->_saveReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveReason, 0);
}

+ (id)uploadReason:(id)a3 acceptedLegacyPush:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  HMDCloudSyncUploadReasonLogEvent *v6;
  uint64_t v7;
  HMDCloudSyncUploadReasonLogEvent *v8;

  v4 = a4;
  v5 = a3;
  v6 = [HMDCloudSyncUploadReasonLogEvent alloc];
  if (v4)
    v7 = 1;
  else
    v7 = -1;
  v8 = -[HMDCloudSyncUploadReasonLogEvent initWithUploadReason:legacyPushCount:homeZonePushCount:homeManagerPushCount:](v6, "initWithUploadReason:legacyPushCount:homeZonePushCount:homeManagerPushCount:", v5, v7, 0, 0);

  return v8;
}

+ (id)uploadReason:(id)a3 acceptedHomeZonePush:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  HMDCloudSyncUploadReasonLogEvent *v6;
  uint64_t v7;
  HMDCloudSyncUploadReasonLogEvent *v8;

  v4 = a4;
  v5 = a3;
  v6 = [HMDCloudSyncUploadReasonLogEvent alloc];
  if (v4)
    v7 = 1;
  else
    v7 = -1;
  v8 = -[HMDCloudSyncUploadReasonLogEvent initWithUploadReason:legacyPushCount:homeZonePushCount:homeManagerPushCount:](v6, "initWithUploadReason:legacyPushCount:homeZonePushCount:homeManagerPushCount:", v5, 0, v7, 0);

  return v8;
}

+ (id)uploadReason:(id)a3 acceptedHomeManagerZonePush:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  HMDCloudSyncUploadReasonLogEvent *v6;
  uint64_t v7;
  HMDCloudSyncUploadReasonLogEvent *v8;

  v4 = a4;
  v5 = a3;
  v6 = [HMDCloudSyncUploadReasonLogEvent alloc];
  if (v4)
    v7 = 1;
  else
    v7 = -1;
  v8 = -[HMDCloudSyncUploadReasonLogEvent initWithUploadReason:legacyPushCount:homeZonePushCount:homeManagerPushCount:](v6, "initWithUploadReason:legacyPushCount:homeZonePushCount:homeManagerPushCount:", v5, 0, 0, v7);

  return v8;
}

@end
