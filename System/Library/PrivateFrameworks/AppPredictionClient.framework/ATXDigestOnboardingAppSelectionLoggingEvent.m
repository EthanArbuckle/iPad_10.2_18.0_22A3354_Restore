@implementation ATXDigestOnboardingAppSelectionLoggingEvent

- (ATXDigestOnboardingAppSelectionLoggingEvent)initWithSessionUUID:(id)a3 bundleId:(id)a4 avgNumBasicNotifications:(unint64_t)a5 avgNumMessageNotifications:(unint64_t)a6 avgNumTimeSensitiveNonMessageNotifications:(unint64_t)a7 rank:(unint64_t)a8 addedToDigest:(BOOL)a9 wasShownInDigestOnboarding:(BOOL)a10
{
  id v17;
  id v18;
  ATXDigestOnboardingAppSelectionLoggingEvent *v19;
  ATXDigestOnboardingAppSelectionLoggingEvent *v20;
  objc_super v22;

  v17 = a3;
  v18 = a4;
  v22.receiver = self;
  v22.super_class = (Class)ATXDigestOnboardingAppSelectionLoggingEvent;
  v19 = -[ATXDigestOnboardingAppSelectionLoggingEvent init](&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_sessionUUID, a3);
    objc_storeStrong((id *)&v20->_bundleId, a4);
    v20->_avgNumBasicNotifications = a5;
    v20->_avgNumMessageNotfications = a6;
    v20->_avgNumTimeSensitiveNonMessageNotifications = a7;
    v20->_rank = a8;
    v20->_addedToDigest = a9;
    v20->_wasShownInDigestOnboarding = a10;
  }

  return v20;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  return v6;
}

- (ATXDigestOnboardingAppSelectionLoggingEvent)initWithProtoData:(id)a3
{
  id v4;
  ATXPBDigestOnboardingAppSelectionLoggingEvent *v5;
  ATXDigestOnboardingAppSelectionLoggingEvent *v6;

  v4 = a3;
  v5 = -[ATXPBDigestOnboardingAppSelectionLoggingEvent initWithData:]([ATXPBDigestOnboardingAppSelectionLoggingEvent alloc], "initWithData:", v4);

  v6 = -[ATXDigestOnboardingAppSelectionLoggingEvent initWithProto:](self, "initWithProto:", v5);
  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXDigestOnboardingAppSelectionLoggingEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXDigestOnboardingAppSelectionLoggingEvent)initWithProto:(id)a3
{
  id v4;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  ATXDigestOnboardingAppSelectionLoggingEvent *v16;
  NSObject *v17;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v16 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_notification_management();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[ATXDigestTimeline initWithProto:].cold.1((uint64_t)self, v17);

    goto LABEL_7;
  }
  v5 = (objc_class *)MEMORY[0x1E0CB3A28];
  v6 = v4;
  v7 = [v5 alloc];
  objc_msgSend(v6, "sessionUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);

  objc_msgSend(v6, "bundleId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v6, "avgNumBasicNotifications");
  v11 = objc_msgSend(v6, "avgNumMessageNotifications");
  v12 = objc_msgSend(v6, "avgNumTimeSensitiveNonMessageNotifications");
  v13 = objc_msgSend(v6, "rank");
  v14 = objc_msgSend(v6, "addedToDigest");
  v15 = objc_msgSend(v6, "wasShownInDigestOnboarding");

  BYTE1(v19) = v15;
  LOBYTE(v19) = v14;
  self = -[ATXDigestOnboardingAppSelectionLoggingEvent initWithSessionUUID:bundleId:avgNumBasicNotifications:avgNumMessageNotifications:avgNumTimeSensitiveNonMessageNotifications:rank:addedToDigest:wasShownInDigestOnboarding:](self, "initWithSessionUUID:bundleId:avgNumBasicNotifications:avgNumMessageNotifications:avgNumTimeSensitiveNonMessageNotifications:rank:addedToDigest:wasShownInDigestOnboarding:", v9, v10, v20, v11, v12, v13, v19);

  v16 = self;
LABEL_8:

  return v16;
}

- (id)proto
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[NSUUID UUIDString](self->_sessionUUID, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSessionUUID:", v4);

  objc_msgSend(v3, "setBundleId:", self->_bundleId);
  objc_msgSend(v3, "setAvgNumBasicNotifications:", LODWORD(self->_avgNumBasicNotifications));
  objc_msgSend(v3, "setAvgNumMessageNotifications:", LODWORD(self->_avgNumMessageNotfications));
  objc_msgSend(v3, "setAvgNumTimeSensitiveNonMessageNotifications:", LODWORD(self->_avgNumTimeSensitiveNonMessageNotifications));
  objc_msgSend(v3, "setRank:", LODWORD(self->_rank));
  objc_msgSend(v3, "setAddedToDigest:", self->_addedToDigest);
  objc_msgSend(v3, "setWasShownInDigestOnboarding:", self->_wasShownInDigestOnboarding);
  return v3;
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (unint64_t)avgNumBasicNotifications
{
  return self->_avgNumBasicNotifications;
}

- (unint64_t)avgNumMessageNotfications
{
  return self->_avgNumMessageNotfications;
}

- (unint64_t)avgNumTimeSensitiveNonMessageNotifications
{
  return self->_avgNumTimeSensitiveNonMessageNotifications;
}

- (unint64_t)rank
{
  return self->_rank;
}

- (BOOL)addedToDigest
{
  return self->_addedToDigest;
}

- (BOOL)wasShownInDigestOnboarding
{
  return self->_wasShownInDigestOnboarding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end
