@implementation MPRemotePlaybackQueue

- (MPRemotePlaybackQueue)initWithMediaRemotePlaybackQueue:(_MRSystemAppPlaybackQueue *)a3 options:(id)a4
{
  id v7;
  MPRemotePlaybackQueue *v8;
  MPRemotePlaybackQueue *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  ICUserIdentity *userIdentity;
  uint64_t v19;
  NSString *siriReferenceIdentifier;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v34;
  void *v35;
  objc_super v36;
  id v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  _QWORD v46[3];

  v46[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)MPRemotePlaybackQueue;
  v8 = -[MPRemotePlaybackQueue init](&v36, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_mediaRemotePlaybackQueue = a3;
    objc_msgSend(v7, "valueForKey:", *MEMORY[0x1E0D4CD30]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0CB3710];
      v12 = objc_opt_class();
      v37 = 0;
      objc_msgSend(v11, "unarchivedObjectOfClass:fromData:error:", v12, v10, &v37);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v37;
      v15 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
      v16 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_193B9B000, v16, OS_LOG_TYPE_ERROR, "userIdentityForMediaRemoteOptions -❗️Cannot decode override user identity. Using active account.", buf, 2u);
        }

        objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
        v16 = v13;
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v39 = v13;
        _os_log_impl(&dword_193B9B000, v16, OS_LOG_TYPE_DEFAULT, "userIdentityForMediaRemoteOptions - Decoded override user identity: %{private}@.", buf, 0xCu);
      }

    }
    else
    {
      v17 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_193B9B000, v17, OS_LOG_TYPE_DEFAULT, "userIdentityForMediaRemoteOptions - No user identity data. Using active account.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
      v13 = objc_claimAutoreleasedReturnValue();
    }

    userIdentity = v9->_userIdentity;
    v9->_userIdentity = (ICUserIdentity *)v13;

    objc_storeStrong((id *)&v9->_mediaRemoteOptions, a4);
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CBD0]);
    v19 = objc_claimAutoreleasedReturnValue();
    siriReferenceIdentifier = v9->_siriReferenceIdentifier;
    v9->_siriReferenceIdentifier = (NSString *)v19;

    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CCA0]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v9->_privateListeningOverride, v21);
    if (!v9->_privateListeningOverride
      && +[MPHomeMonitor isCurrentDeviceValidHomeAccessory](MPHomeMonitor, "isCurrentDeviceValidHomeAccessory"))
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CBF8]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v22);
        if (v23)
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CBE0]);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)MEMORY[0x1E0C99E60];
          v46[0] = objc_opt_class();
          v46[1] = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setWithArray:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v27, v24, 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v28, "count"))
          {
            v35 = v24;
            +[MPHomeUserMonitor userMonitorWithHomeIdentifier:](MPHomeUserMonitor, "userMonitorWithHomeIdentifier:", v23);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v29;
            if (v29)
            {
              objc_msgSend(v29, "privateListeningEnabledForGroupWithRouteIDs:", v28);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if (v31)
              {
                objc_storeStrong((id *)&v9->_privateListeningOverride, v31);
                _MPLogCategoryRemoteControl();
                v32 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v28, "msv_compactDescription");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544130;
                  v39 = (uint64_t)v9;
                  v40 = 2114;
                  v41 = v22;
                  v42 = 2114;
                  v43 = v34;
                  v44 = 2114;
                  v45 = v31;
                  _os_log_impl(&dword_193B9B000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: Applying HomeKit private listening override: homeKitUserID=%{public}@ destinationUIDs=%{public}@ privateListeningOverride=%{public}@", buf, 0x2Au);

                }
              }

            }
            v24 = v35;
          }

        }
      }

    }
  }

  return v9;
}

- (MPRemotePlaybackQueue)init
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99750];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithMediaRemotePlaybackQueue_options_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("You must provide %@ with a MediaRemote playback queue. Use %@ instead."), v6, v7);

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_mediaRemotePlaybackQueue)
    MRSystemAppPlaybackQueueDestroy();
  v3.receiver = self;
  v3.super_class = (Class)MPRemotePlaybackQueue;
  -[MPRemotePlaybackQueue dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *ExternalRepresentation;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (self->_mediaRemotePlaybackQueue)
  {
    ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation();
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", ExternalRepresentation, 0, 0, &v16);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v17 = CFSTR("error");
      v5 = v16;
      objc_msgSend(v5, "msv_description");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      v8 = CFSTR("failed to parse external representation");
      if (v6)
        v8 = (const __CFString *)v6;
      v18[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v4 = 0;
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = objc_opt_class();
  -[MPRemotePlaybackQueue userIdentity](self, "userIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountDSID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  MPCreateLoggableValueForDSID(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@:%p [%@] siriReferenceIdentifier=%@ privateListeningOverride=%@ mediaRemoteQueueAsDictionary=%@>"), v10, self, v13, self->_siriReferenceIdentifier, self->_privateListeningOverride, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (MPRemotePlaybackQueue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MPRemotePlaybackQueue *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("queue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[MPRemotePlaybackQueue initWithMediaRemotePlaybackQueue:options:](self, "initWithMediaRemotePlaybackQueue:options:", MRSystemAppPlaybackQueueCreateFromExternalRepresentation(), 0);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v3;
  id ExternalRepresentation;

  v3 = a3;
  ExternalRepresentation = (id)MRSystemAppPlaybackQueueCreateExternalRepresentation();
  objc_msgSend(v3, "encodeObject:forKey:", ExternalRepresentation, CFSTR("queue"));

}

- (BOOL)isRequestingImmediatePlayback
{
  return MRSystemAppPlaybackQueueIsRequestingImmediatePlayback();
}

- (void)setRequestingImmediatePlayback:(BOOL)a3
{
  MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
}

- (NSString)siriRecommendationIdentifier
{
  return (NSString *)MRSystemAppPlaybackQueueGetSiriRecommendationIdentifier();
}

- (NSString)siriAssetInfo
{
  return (NSString *)MRSystemAppPlaybackQueueGetSiriAssetInfo();
}

- (NSString)featureName
{
  return (NSString *)(id)MRSystemAppPlaybackQueueCopyFeatureName();
}

- (NSDictionary)siriWHAMetricsInfo
{
  return (NSDictionary *)MRSystemAppPlaybackQueueGetSiriWHAMetricsInfo();
}

- (void)setSiriRecommendationIdentifier:(id)a3
{
  MRSystemAppPlaybackQueueSetSiriRecommendationIdentifier();
}

- (int64_t)replaceIntent
{
  uint64_t v2;

  v2 = MRSystemAppPlaybackQueueGetReplaceIntent() - 1;
  if (v2 < 3)
    return v2 + 1;
  else
    return 0;
}

- (void)setReplaceIntent:(int64_t)a3
{
  MRSystemAppPlaybackQueueSetReplaceIntent();
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)MRSystemAppPlaybackQueueGetUserInfo();
}

- (void)setUserInfo:(id)a3
{
  MRSystemAppPlaybackQueueSetUserInfo();
}

- (BOOL)verifyWithError:(id *)a3
{
  return 1;
}

- (_MRSystemAppPlaybackQueue)_mediaRemotePlaybackQueue
{
  return self->_mediaRemotePlaybackQueue;
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (NSNumber)privateListeningOverride
{
  return self->_privateListeningOverride;
}

- (NSString)siriReferenceIdentifier
{
  return self->_siriReferenceIdentifier;
}

- (NSString)queueGroupingID
{
  return self->_queueGroupingID;
}

- (NSDictionary)mediaRemoteOptions
{
  return self->_mediaRemoteOptions;
}

- (void)setMediaRemoteOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRemoteOptions, 0);
  objc_storeStrong((id *)&self->_queueGroupingID, 0);
  objc_storeStrong((id *)&self->_siriReferenceIdentifier, 0);
  objc_storeStrong((id *)&self->_privateListeningOverride, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
}

+ (id)queueWithMediaRemotePlaybackQueue:(_MRSystemAppPlaybackQueue *)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "queueWithMediaRemotePlaybackQueue:options:", a3, 0);
}

+ (id)queueWithMediaRemotePlaybackQueue:(_MRSystemAppPlaybackQueue *)a3 options:(id)a4
{
  id v7;
  unsigned int Type;
  objc_class *v9;
  void *v10;
  void *v12;

  v7 = a4;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPRemotePlaybackQueue.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mrQueue"));

  }
  Type = MRSystemAppPlaybackQueueGetType();
  if (Type <= 8 && ((0x1EFu >> Type) & 1) != 0)
    v9 = (objc_class *)objc_opt_class();
  else
    v9 = 0;
  v10 = (void *)objc_msgSend([v9 alloc], "initWithMediaRemotePlaybackQueue:options:", a3, v7);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
