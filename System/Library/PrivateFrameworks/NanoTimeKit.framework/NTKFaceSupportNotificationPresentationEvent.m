@implementation NTKFaceSupportNotificationPresentationEvent

- (NTKFaceSupportNotificationPresentationEvent)initWithBundleIdentifier:(id)a3 status:(int64_t)a4 artworkUsed:(int64_t)a5 delayFromServerPush:(double)a6 delayFromBundleUnlock:(double)a7 schedulingErrorCode:(int64_t)a8 optOutSources:(int64_t)a9
{
  id v16;
  NTKFaceSupportNotificationPresentationEvent *v17;
  NTKFaceSupportNotificationPresentationEvent *v18;
  uint64_t v19;
  NSString *bundleIdentifier;
  objc_super v22;

  v16 = a3;
  v17 = 0;
  if (objc_msgSend(v16, "length")
    && (unint64_t)(a4 - 5) >= 0xFFFFFFFFFFFFFFFCLL
    && a6 > 0.0
    && a7 > 0.0
    && (unint64_t)a9 <= 3)
  {
    v22.receiver = self;
    v22.super_class = (Class)NTKFaceSupportNotificationPresentationEvent;
    v18 = -[NTKFaceSupportNotificationPresentationEvent init](&v22, sel_init);
    if (v18)
    {
      v19 = objc_msgSend(v16, "copy");
      bundleIdentifier = v18->_bundleIdentifier;
      v18->_bundleIdentifier = (NSString *)v19;

      v18->_status = a4;
      v18->_artworkUsed = a5;
      v18->_delayFromServerPush = a6;
      v18->_delayFromBundleUnlock = a7;
      v18->_schedulingErrorCode = a8;
      v18->_optOutSources = a9;
    }
    self = v18;
    v17 = self;
  }

  return v17;
}

- (NSString)ntkfs_analyticsEventName
{
  return (NSString *)CFSTR("com.apple.nanotimekit.facesupport.notification_presentation");
}

- (NSDictionary)ntkfs_analyticsJSONRepresentation
{
  void *v3;
  int64_t v4;
  int64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[7];
  _QWORD v21[8];

  v21[7] = *MEMORY[0x1E0C80C00];
  -[NTKFaceSupportNotificationPresentationEvent bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NTKFaceSupportNotificationPresentationEvent status](self, "status");
  v5 = -[NTKFaceSupportNotificationPresentationEvent artworkUsed](self, "artworkUsed");
  -[NTKFaceSupportNotificationPresentationEvent delayFromServerPush](self, "delayFromServerPush");
  v7 = v6;
  -[NTKFaceSupportNotificationPresentationEvent delayFromBundleUnlock](self, "delayFromBundleUnlock");
  v9 = v8;
  v10 = -[NTKFaceSupportNotificationPresentationEvent schedulingErrorCode](self, "schedulingErrorCode");
  v11 = -[NTKFaceSupportNotificationPresentationEvent optOutSources](self, "optOutSources");
  v21[0] = v3;
  v20[0] = CFSTR("bundle_identifier");
  v20[1] = CFSTR("status");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v12;
  v20[2] = CFSTR("artwork_used");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v13;
  v20[3] = CFSTR("delay_from_server_push");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v14;
  v20[4] = CFSTR("delay_from_bundle_unlock");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v15;
  v20[5] = CFSTR("scheduling_error_code");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v16;
  v20[6] = CFSTR("opt_out_sources");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[6] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v18;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int64_t)status
{
  return self->_status;
}

- (int64_t)artworkUsed
{
  return self->_artworkUsed;
}

- (double)delayFromServerPush
{
  return self->_delayFromServerPush;
}

- (double)delayFromBundleUnlock
{
  return self->_delayFromBundleUnlock;
}

- (int64_t)schedulingErrorCode
{
  return self->_schedulingErrorCode;
}

- (int64_t)optOutSources
{
  return self->_optOutSources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
