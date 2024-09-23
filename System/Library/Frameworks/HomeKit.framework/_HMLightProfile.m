@implementation _HMLightProfile

- (HMLightProfileSettings)settings
{
  return (HMLightProfileSettings *)objc_getProperty(self, a2, 72, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_registerNotificationHandlers
{
  void *v3;
  id v4;

  -[_HMAccessoryProfile context](self, "context");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:selector:", CFSTR("HMLightProfile.sdum"), self, sel_handleSettingsDidUpdate_);

}

- (_HMLightProfile)initWithCoder:(id)a3
{
  id v4;
  _HMAccessoryProfile *v5;
  void *v6;
  void *v7;
  void *v8;
  _HMLightProfile *v9;

  v4 = a3;
  v5 = -[_HMAccessoryProfile initWithCoder:]([_HMAccessoryProfile alloc], "initWithCoder:", v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hmlp.sck"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[_HMAccessoryProfile profileUniqueIdentifier](v5, "profileUniqueIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMAccessoryProfile services](v5, "services");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[_HMLightProfile initWithUUID:services:settings:](self, "initWithUUID:services:settings:", v7, v8, v6);

      v9 = self;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (_HMLightProfile)initWithUUID:(id)a3 services:(id)a4 settings:(id)a5
{
  id v9;
  _HMLightProfile *v10;
  _HMLightProfile *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_HMLightProfile;
  v10 = -[_HMAccessoryProfile initWithUUID:services:](&v13, sel_initWithUUID_services_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_settings, a5);

  return v11;
}

- (HMLightProfile)lightProfile
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[_HMAccessoryProfile accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lightProfiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31___HMLightProfile_lightProfile__block_invoke;
  v7[3] = &unk_1E3AAEB08;
  v7[4] = self;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMLightProfile *)v5;
}

- (void)handleSettingsDidUpdate:(id)a3
{
  _HMLightProfile *v4;
  void *v5;
  void *v6;
  _HMLightProfile *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _HMLightProfile *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _HMLightProfile *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  _HMLightProfile *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (_HMLightProfile *)a3;
  -[_HMLightProfile lightProfile](self, "lightProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v9;
      v26 = 2112;
      v27 = v4;
      v28 = 2112;
      v29 = v5;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling message for light profile %@:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    v23 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HMLightProfile unarchivedObjectForKey:ofClasses:](v4, "unarchivedObjectForKey:ofClasses:", CFSTR("hmlp.sck"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[_HMLightProfile name](v4, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "updateSettings:withReason:", v11, v12);

    }
    else
    {
      v18 = (void *)MEMORY[0x1A1AC1AAC]();
      v19 = v7;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[_HMLightProfile messagePayload](v4, "messagePayload");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v25 = v21;
        v26 = 2112;
        v27 = v4;
        v28 = 2112;
        v29 = v22;
        _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode light profile settings from message: %@ with payload: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      v11 = 0;
    }
  }
  else
  {
    -[_HMAccessoryProfile accessory](self, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lightProfiles");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v16;
      v26 = 2112;
      v27 = v14;
      v28 = 2112;
      v29 = v17;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Skipping settings update, light profile not found in accessory light profiles %@:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (void)setSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
