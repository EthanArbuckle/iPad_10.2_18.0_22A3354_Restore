@implementation CXStartCallAction

- (CXStartCallAction)initWithCallUUID:(NSUUID *)callUUID handle:(CXHandle *)handle
{
  CXHandle *v6;
  CXStartCallAction *v7;
  uint64_t v8;
  NSArray *handles;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = handle;
  v11.receiver = self;
  v11.super_class = (Class)CXStartCallAction;
  v7 = -[CXCallAction initWithCallUUID:](&v11, sel_initWithCallUUID_, callUUID);
  if (v7)
  {
    if (!v6)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXStartCallAction initWithCallUUID:handle:]", CFSTR("handle"));
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    handles = v7->_handles;
    v7->_handles = (NSArray *)v8;

  }
  return v7;
}

- (CXStartCallAction)initWithCallUUID:(id)a3 handles:(id)a4
{
  id v7;
  CXStartCallAction *v8;
  objc_super v10;

  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CXStartCallAction;
  v8 = -[CXCallAction initWithCallUUID:](&v10, sel_initWithCallUUID_, a3);
  if (v8)
  {
    if (!objc_msgSend(v7, "count"))
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: array '%@' cannot be empty"), "-[CXStartCallAction initWithCallUUID:handles:]", CFSTR("handles"));
    objc_storeStrong((id *)&v8->_handles, a4);
  }

  return v8;
}

- (CXHandle)handle
{
  void *v2;
  void *v3;

  -[CXStartCallAction handles](self, "handles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CXHandle *)v3;
}

- (void)setHandle:(CXHandle *)handle
{
  void *v4;
  CXHandle *v5;
  void *v6;
  CXHandle *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = handle;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = handle;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CXStartCallAction setHandles:](self, "setHandles:", v6, v7, v8);
}

- (id)customDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  NSSize v12;
  NSSize v13;

  v11.receiver = self;
  v11.super_class = (Class)CXStartCallAction;
  -[CXCallAction customDescription](&v11, sel_customDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXStartCallAction handles](self, "handles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" handles=%@"), v4);

  -[CXStartCallAction contactIdentifier](self, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" contactIdentifier=%@"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(" video=%d"), -[CXStartCallAction isVideo](self, "isVideo"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" relay=%d"), -[CXStartCallAction isRelay](self, "isRelay"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" upgrade=%d"), -[CXStartCallAction isUpgrade](self, "isUpgrade"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" retry=%d"), -[CXStartCallAction isRetry](self, "isRetry"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" emergency=%d"), -[CXStartCallAction isEmergency](self, "isEmergency"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" isVoicemail=%d"), -[CXStartCallAction isVoicemail](self, "isVoicemail"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" ttyType=%ld"), -[CXStartCallAction ttyType](self, "ttyType"));
  -[CXStartCallAction localLandscapeAspectRatio](self, "localLandscapeAspectRatio");
  NSStringFromSize(v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" localLandscapeAspectRatio=%@"), v6);

  -[CXStartCallAction localPortraitAspectRatio](self, "localPortraitAspectRatio");
  NSStringFromSize(v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" localPortraitAspectRatio=%@"), v7);

  -[CXStartCallAction dateStarted](self, "dateStarted");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" dateStarted=%@"), v8);

  -[CXStartCallAction localSenderIdentityUUID](self, "localSenderIdentityUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" localSenderIdentityUUID=%@"), v9);

  objc_msgSend(v3, "appendFormat:", CFSTR(" shouldSuppressInCallUI=%d"), -[CXStartCallAction shouldSuppressInCallUI](self, "shouldSuppressInCallUI"));
  return v3;
}

+ (double)timeout
{
  return 600.0;
}

- (void)fulfill
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CXStartCallAction fulfillWithDateStarted:](self, "fulfillWithDateStarted:", v3);

}

- (void)fulfillWithDateStarted:(NSDate *)dateStarted
{
  void *v4;
  void *v5;
  NSDate *v6;

  v6 = dateStarted;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CXStartCallAction fulfillWithDateStarted:]", CFSTR("dateStarted"));
  v4 = (void *)-[CXStartCallAction copy](self, "copy");
  objc_msgSend(v4, "updateAsFulfilledWithDateStarted:", v6);
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionCompleted:", v4);

}

- (BOOL)shouldTimeout
{
  return !-[CXStartCallAction isEmergency](self, "isEmergency");
}

- (void)updateAsFulfilledWithDateStarted:(id)a3
{
  id v4;

  v4 = a3;
  -[CXAction updateAsFulfilled](self, "updateAsFulfilled");
  -[CXStartCallAction setDateStarted:](self, "setDateStarted:", v4);

}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CXStartCallAction;
  v6 = a3;
  -[CXCallAction updateSanitizedCopy:withZone:](&v10, sel_updateSanitizedCopy_withZone_, v6, a4);
  -[CXStartCallAction dateStarted](self, "dateStarted", v10.receiver, v10.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDateStarted:", v7);

  -[CXStartCallAction handles](self, "handles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHandles:", v8);

  -[CXStartCallAction contactIdentifier](self, "contactIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContactIdentifier:", v9);

  objc_msgSend(v6, "setVideo:", -[CXStartCallAction isVideo](self, "isVideo"));
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CXStartCallAction;
  v6 = a3;
  -[CXAction updateCopy:withZone:](&v9, sel_updateCopy_withZone_, v6, a4);
  objc_msgSend(v6, "setRelay:", -[CXStartCallAction isRelay](self, "isRelay", v9.receiver, v9.super_class));
  objc_msgSend(v6, "setUpgrade:", -[CXStartCallAction isUpgrade](self, "isUpgrade"));
  objc_msgSend(v6, "setEmergency:", -[CXStartCallAction isEmergency](self, "isEmergency"));
  objc_msgSend(v6, "setVoicemail:", -[CXStartCallAction isVoicemail](self, "isVoicemail"));
  objc_msgSend(v6, "setTTYType:", -[CXStartCallAction ttyType](self, "ttyType"));
  -[CXStartCallAction localSenderIdentityUUID](self, "localSenderIdentityUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocalSenderIdentityUUID:", v7);

  objc_msgSend(v6, "setShouldSuppressInCallUI:", -[CXStartCallAction shouldSuppressInCallUI](self, "shouldSuppressInCallUI"));
  -[CXStartCallAction localLandscapeAspectRatio](self, "localLandscapeAspectRatio");
  objc_msgSend(v6, "setLocalLandscapeAspectRatio:");
  -[CXStartCallAction localPortraitAspectRatio](self, "localPortraitAspectRatio");
  objc_msgSend(v6, "setLocalPortraitAspectRatio:");
  -[CXStartCallAction handles](self, "handles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHandles:", v8);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXStartCallAction)initWithCoder:(NSCoder *)aDecoder
{
  NSCoder *v4;
  CXStartCallAction *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSArray *handles;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSString *contactIdentifier;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSUUID *localSenderIdentityUUID;
  void *v25;
  void *v26;
  CGFloat v27;
  CGFloat v28;
  void *v29;
  CGFloat v30;
  CGFloat v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSDate *dateStarted;
  objc_super v37;

  v4 = aDecoder;
  v37.receiver = self;
  v37.super_class = (Class)CXStartCallAction;
  v5 = -[CXCallAction initWithCoder:](&v37, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_handles);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeArrayOfObjectsOfClass:forKey:](v4, "decodeArrayOfObjectsOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    handles = v5->_handles;
    v5->_handles = (NSArray *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_contactIdentifier);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v12;

    NSStringFromSelector(sel_isVideo);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_video = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", v14);

    NSStringFromSelector(sel_isRelay);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_relay = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", v15);

    NSStringFromSelector(sel_isUpgrade);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_upgrade = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", v16);

    NSStringFromSelector(sel_isRetry);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_retry = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", v17);

    NSStringFromSelector(sel_isEmergency);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_emergency = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", v18);

    NSStringFromSelector(sel_isVoicemail);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_voicemail = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", v19);

    NSStringFromSelector(sel_ttyType);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_ttyType = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", v20);

    v21 = objc_opt_class();
    NSStringFromSelector(sel_localSenderIdentityUUID);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    localSenderIdentityUUID = v5->_localSenderIdentityUUID;
    v5->_localSenderIdentityUUID = (NSUUID *)v23;

    NSStringFromSelector(sel_shouldSuppressInCallUI);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldSuppressInCallUI = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", v25);

    NSStringFromSelector(sel_localLandscapeAspectRatio);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeSizeForKey:](v4, "decodeSizeForKey:", v26);
    v5->_localLandscapeAspectRatio.width = v27;
    v5->_localLandscapeAspectRatio.height = v28;

    NSStringFromSelector(sel_localPortraitAspectRatio);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeSizeForKey:](v4, "decodeSizeForKey:", v29);
    v5->_localPortraitAspectRatio.width = v30;
    v5->_localPortraitAspectRatio.height = v31;

    v32 = objc_opt_class();
    NSStringFromSelector(sel_dateStarted);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", v32, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    dateStarted = v5->_dateStarted;
    v5->_dateStarted = (NSDate *)v34;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  int64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)CXStartCallAction;
  v4 = a3;
  -[CXCallAction encodeWithCoder:](&v39, sel_encodeWithCoder_, v4);
  -[CXStartCallAction handles](self, "handles", v39.receiver, v39.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_handles);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[CXStartCallAction contactIdentifier](self, "contactIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_contactIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  v9 = -[CXStartCallAction isVideo](self, "isVideo");
  NSStringFromSelector(sel_isVideo);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v9, v10);

  v11 = -[CXStartCallAction isRelay](self, "isRelay");
  NSStringFromSelector(sel_isRelay);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v11, v12);

  v13 = -[CXStartCallAction isUpgrade](self, "isUpgrade");
  NSStringFromSelector(sel_isUpgrade);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v13, v14);

  v15 = -[CXStartCallAction isRetry](self, "isRetry");
  NSStringFromSelector(sel_isRetry);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v15, v16);

  v17 = -[CXStartCallAction isEmergency](self, "isEmergency");
  NSStringFromSelector(sel_isEmergency);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v17, v18);

  v19 = -[CXStartCallAction isVoicemail](self, "isVoicemail");
  NSStringFromSelector(sel_isVoicemail);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v19, v20);

  v21 = -[CXStartCallAction ttyType](self, "ttyType");
  NSStringFromSelector(sel_ttyType);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v21, v22);

  -[CXStartCallAction localSenderIdentityUUID](self, "localSenderIdentityUUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localSenderIdentityUUID);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, v24);

  v25 = -[CXStartCallAction shouldSuppressInCallUI](self, "shouldSuppressInCallUI");
  NSStringFromSelector(sel_shouldSuppressInCallUI);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v25, v26);

  -[CXStartCallAction localLandscapeAspectRatio](self, "localLandscapeAspectRatio");
  v28 = v27;
  v30 = v29;
  NSStringFromSelector(sel_localLandscapeAspectRatio);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeSize:forKey:", v31, v28, v30);

  -[CXStartCallAction localPortraitAspectRatio](self, "localPortraitAspectRatio");
  v33 = v32;
  v35 = v34;
  NSStringFromSelector(sel_localPortraitAspectRatio);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeSize:forKey:", v36, v33, v35);

  -[CXStartCallAction dateStarted](self, "dateStarted");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_dateStarted);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v37, v38);

}

- (CGSize)localPortraitAspectRatio
{
  double width;
  double height;
  CGSize result;

  width = self->_localPortraitAspectRatio.width;
  height = self->_localPortraitAspectRatio.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLocalPortraitAspectRatio:(CGSize)a3
{
  self->_localPortraitAspectRatio = a3;
}

- (CGSize)localLandscapeAspectRatio
{
  double width;
  double height;
  CGSize result;

  width = self->_localLandscapeAspectRatio.width;
  height = self->_localLandscapeAspectRatio.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLocalLandscapeAspectRatio:(CGSize)a3
{
  self->_localLandscapeAspectRatio = a3;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(NSString *)contactIdentifier
{
  objc_setProperty_nonatomic_copy(self, a2, contactIdentifier, 72);
}

- (BOOL)isVideo
{
  return self->_video;
}

- (void)setVideo:(BOOL)video
{
  self->_video = video;
}

- (NSDate)dateStarted
{
  return self->_dateStarted;
}

- (void)setDateStarted:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)isRelay
{
  return self->_relay;
}

- (void)setRelay:(BOOL)a3
{
  self->_relay = a3;
}

- (BOOL)isUpgrade
{
  return self->_upgrade;
}

- (void)setUpgrade:(BOOL)a3
{
  self->_upgrade = a3;
}

- (BOOL)isRetry
{
  return self->_retry;
}

- (void)setRetry:(BOOL)a3
{
  self->_retry = a3;
}

- (BOOL)isEmergency
{
  return self->_emergency;
}

- (void)setEmergency:(BOOL)a3
{
  self->_emergency = a3;
}

- (BOOL)isVoicemail
{
  return self->_voicemail;
}

- (void)setVoicemail:(BOOL)a3
{
  self->_voicemail = a3;
}

- (int64_t)ttyType
{
  return self->_ttyType;
}

- (void)setTTYType:(int64_t)a3
{
  self->_ttyType = a3;
}

- (NSUUID)localSenderIdentityUUID
{
  return self->_localSenderIdentityUUID;
}

- (void)setLocalSenderIdentityUUID:(id)a3
{
  objc_storeStrong((id *)&self->_localSenderIdentityUUID, a3);
}

- (BOOL)shouldSuppressInCallUI
{
  return self->_shouldSuppressInCallUI;
}

- (void)setShouldSuppressInCallUI:(BOOL)a3
{
  self->_shouldSuppressInCallUI = a3;
}

- (NSArray)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_localSenderIdentityUUID, 0);
  objc_storeStrong((id *)&self->_dateStarted, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end
