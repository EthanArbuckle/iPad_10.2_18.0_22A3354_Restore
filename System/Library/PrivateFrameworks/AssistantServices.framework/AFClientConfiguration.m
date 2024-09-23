@implementation AFClientConfiguration

- (AFClientConfiguration)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFClientConfigurationMutation *);
  AFClientConfiguration *v5;
  AFClientConfiguration *v6;
  _AFClientConfigurationMutation *v7;
  void *v8;
  uint64_t v9;
  AFAccessibilityState *accessibilityState;
  float v11;
  void *v12;
  uint64_t v13;
  AFAudioPlaybackRequest *tapToSiriAudioPlaybackRequest;
  void *v15;
  uint64_t v16;
  AFAudioPlaybackRequest *twoShotAudioPlaybackRequest;
  void *v18;
  uint64_t v19;
  NSDate *deviceSetupFlowBeginDate;
  void *v21;
  uint64_t v22;
  NSDate *deviceSetupFlowEndDate;
  objc_super v25;

  v4 = (void (**)(id, _AFClientConfigurationMutation *))a3;
  v25.receiver = self;
  v25.super_class = (Class)AFClientConfiguration;
  v5 = -[AFClientConfiguration init](&v25, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFClientConfigurationMutation initWithBase:]([_AFClientConfigurationMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFClientConfigurationMutation isDirty](v7, "isDirty"))
    {
      -[_AFClientConfigurationMutation getAccessibilityState](v7, "getAccessibilityState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      accessibilityState = v6->_accessibilityState;
      v6->_accessibilityState = (AFAccessibilityState *)v9;

      v6->_deviceRingerSwitchState = -[_AFClientConfigurationMutation getDeviceRingerSwitchState](v7, "getDeviceRingerSwitchState");
      v6->_isDeviceInCarDNDMode = -[_AFClientConfigurationMutation getIsDeviceInCarDNDMode](v7, "getIsDeviceInCarDNDMode");
      v6->_isDeviceInStarkMode = -[_AFClientConfigurationMutation getIsDeviceInStarkMode](v7, "getIsDeviceInStarkMode");
      v6->_supportsCarPlayVehicleData = -[_AFClientConfigurationMutation getSupportsCarPlayVehicleData](v7, "getSupportsCarPlayVehicleData");
      v6->_isDeviceWatchAuthenticated = -[_AFClientConfigurationMutation getIsDeviceWatchAuthenticated](v7, "getIsDeviceWatchAuthenticated");
      v6->_areAnnouncementRequestsPermittedByPresentationWhileActive = -[_AFClientConfigurationMutation getAreAnnouncementRequestsPermittedByPresentationWhileActive](v7, "getAreAnnouncementRequestsPermittedByPresentationWhileActive");
      -[_AFClientConfigurationMutation getOutputVolume](v7, "getOutputVolume");
      v6->_outputVolume = v11;
      -[_AFClientConfigurationMutation getTapToSiriAudioPlaybackRequest](v7, "getTapToSiriAudioPlaybackRequest");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "copy");
      tapToSiriAudioPlaybackRequest = v6->_tapToSiriAudioPlaybackRequest;
      v6->_tapToSiriAudioPlaybackRequest = (AFAudioPlaybackRequest *)v13;

      -[_AFClientConfigurationMutation getTwoShotAudioPlaybackRequest](v7, "getTwoShotAudioPlaybackRequest");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "copy");
      twoShotAudioPlaybackRequest = v6->_twoShotAudioPlaybackRequest;
      v6->_twoShotAudioPlaybackRequest = (AFAudioPlaybackRequest *)v16;

      -[_AFClientConfigurationMutation getDeviceSetupFlowBeginDate](v7, "getDeviceSetupFlowBeginDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "copy");
      deviceSetupFlowBeginDate = v6->_deviceSetupFlowBeginDate;
      v6->_deviceSetupFlowBeginDate = (NSDate *)v19;

      -[_AFClientConfigurationMutation getDeviceSetupFlowEndDate](v7, "getDeviceSetupFlowEndDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "copy");
      deviceSetupFlowEndDate = v6->_deviceSetupFlowEndDate;
      v6->_deviceSetupFlowEndDate = (NSDate *)v22;

    }
  }

  return v6;
}

- (AFClientConfiguration)init
{
  return -[AFClientConfiguration initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFClientConfiguration)initWithAccessibilityState:(id)a3 deviceRingerSwitchState:(int64_t)a4 isDeviceInCarDNDMode:(BOOL)a5 isDeviceInStarkMode:(BOOL)a6 supportsCarPlayVehicleData:(BOOL)a7 isDeviceWatchAuthenticated:(BOOL)a8 areAnnouncementRequestsPermittedByPresentationWhileActive:(BOOL)a9 outputVolume:(float)a10 tapToSiriAudioPlaybackRequest:(id)a11 twoShotAudioPlaybackRequest:(id)a12 deviceSetupFlowBeginDate:(id)a13 deviceSetupFlowEndDate:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  AFClientConfiguration *v29;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  int64_t v39;
  float v40;
  BOOL v41;
  BOOL v42;
  BOOL v43;
  BOOL v44;
  BOOL v45;

  v19 = a3;
  v20 = a11;
  v21 = a12;
  v22 = a13;
  v23 = a14;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __348__AFClientConfiguration_initWithAccessibilityState_deviceRingerSwitchState_isDeviceInCarDNDMode_isDeviceInStarkMode_supportsCarPlayVehicleData_isDeviceWatchAuthenticated_areAnnouncementRequestsPermittedByPresentationWhileActive_outputVolume_tapToSiriAudioPlaybackRequest_twoShotAudioPlaybackRequest_deviceSetupFlowBeginDate_deviceSetupFlowEndDate___block_invoke;
  v33[3] = &unk_1E3A2FA88;
  v41 = a5;
  v42 = a6;
  v43 = a7;
  v44 = a8;
  v45 = a9;
  v40 = a10;
  v34 = v19;
  v35 = v20;
  v36 = v21;
  v37 = v22;
  v38 = v23;
  v39 = a4;
  v24 = v23;
  v25 = v22;
  v26 = v21;
  v27 = v20;
  v28 = v19;
  v29 = -[AFClientConfiguration initWithBuilder:](self, "initWithBuilder:", v33);

  return v29;
}

- (id)description
{
  return -[AFClientConfiguration _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t deviceRingerSwitchState;
  AFAccessibilityState *accessibilityState;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  objc_super v18;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v18.receiver = self;
  v18.super_class = (Class)AFClientConfiguration;
  -[AFClientConfiguration description](&v18, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityState = self->_accessibilityState;
  deviceRingerSwitchState = self->_deviceRingerSwitchState;
  if (deviceRingerSwitchState > 2)
    v8 = CFSTR("(unknown)");
  else
    v8 = off_1E3A2E3E0[deviceRingerSwitchState];
  v9 = v8;
  v10 = v9;
  v11 = CFSTR("YES");
  if (self->_isDeviceInCarDNDMode)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  if (self->_isDeviceInStarkMode)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  if (self->_supportsCarPlayVehicleData)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  if (self->_isDeviceWatchAuthenticated)
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  if (!self->_areAnnouncementRequestsPermittedByPresentationWhileActive)
    v11 = CFSTR("NO");
  v16 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {accessibilityState = %@, deviceRingerSwitchState = %@, isDeviceInCarDNDMode = %@, isDeviceInStarkMode = %@, supportsCarPlayVehicleData = %@, isDeviceWatchAuthenticated = %@, areAnnouncementRequestsPermittedByPresentationWhileActive = %@, outputVolume = %f, tapToSiriAudioPlaybackRequest = %@, twoShotAudioPlaybackRequest = %@, deviceSetupFlowBeginDate = %@, deviceSetupFlowEndDate = %@}"), v5, accessibilityState, v9, v12, v13, v14, v15, v11, self->_outputVolume, self->_tapToSiriAudioPlaybackRequest, self->_twoShotAudioPlaybackRequest, self->_deviceSetupFlowBeginDate, self->_deviceSetupFlowEndDate);

  return v16;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;

  v3 = -[AFAccessibilityState hash](self->_accessibilityState, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_deviceRingerSwitchState);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDeviceInCarDNDMode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDeviceInStarkMode);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsCarPlayVehicleData);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDeviceWatchAuthenticated);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_areAnnouncementRequestsPermittedByPresentationWhileActive);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9 ^ v13 ^ objc_msgSend(v14, "hash");
  *(float *)&v16 = self->_outputVolume;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hash");
  v19 = v18 ^ -[AFAudioPlaybackRequest hash](self->_tapToSiriAudioPlaybackRequest, "hash");
  v20 = v19 ^ -[AFAudioPlaybackRequest hash](self->_twoShotAudioPlaybackRequest, "hash");
  v21 = v15 ^ v20 ^ -[NSDate hash](self->_deviceSetupFlowBeginDate, "hash");
  v22 = v21 ^ -[NSDate hash](self->_deviceSetupFlowEndDate, "hash");

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  AFClientConfiguration *v4;
  AFClientConfiguration *v5;
  int64_t deviceRingerSwitchState;
  _BOOL4 isDeviceInCarDNDMode;
  _BOOL4 isDeviceInStarkMode;
  _BOOL4 supportsCarPlayVehicleData;
  _BOOL4 isDeviceWatchAuthenticated;
  _BOOL4 areAnnouncementRequestsPermittedByPresentationWhileActive;
  float outputVolume;
  float v13;
  BOOL v14;
  AFAccessibilityState *v16;
  AFAccessibilityState *accessibilityState;
  AFAudioPlaybackRequest *v18;
  AFAudioPlaybackRequest *tapToSiriAudioPlaybackRequest;
  AFAudioPlaybackRequest *v20;
  AFAudioPlaybackRequest *twoShotAudioPlaybackRequest;
  NSDate *v22;
  NSDate *deviceSetupFlowBeginDate;
  NSDate *v24;
  NSDate *deviceSetupFlowEndDate;

  v4 = (AFClientConfiguration *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      deviceRingerSwitchState = self->_deviceRingerSwitchState;
      if (deviceRingerSwitchState == -[AFClientConfiguration deviceRingerSwitchState](v5, "deviceRingerSwitchState")
        && (isDeviceInCarDNDMode = self->_isDeviceInCarDNDMode,
            isDeviceInCarDNDMode == -[AFClientConfiguration isDeviceInCarDNDMode](v5, "isDeviceInCarDNDMode"))
        && (isDeviceInStarkMode = self->_isDeviceInStarkMode,
            isDeviceInStarkMode == -[AFClientConfiguration isDeviceInStarkMode](v5, "isDeviceInStarkMode"))
        && (supportsCarPlayVehicleData = self->_supportsCarPlayVehicleData,
            supportsCarPlayVehicleData == -[AFClientConfiguration supportsCarPlayVehicleData](v5, "supportsCarPlayVehicleData"))&& (isDeviceWatchAuthenticated = self->_isDeviceWatchAuthenticated, isDeviceWatchAuthenticated == -[AFClientConfiguration isDeviceWatchAuthenticated](v5, "isDeviceWatchAuthenticated"))&& (areAnnouncementRequestsPermittedByPresentationWhileActive = self->_areAnnouncementRequestsPermittedByPresentationWhileActive, areAnnouncementRequestsPermittedByPresentationWhileActive == -[AFClientConfiguration areAnnouncementRequestsPermittedByPresentationWhileActive](v5, "areAnnouncementRequestsPermittedByPresentationWhileActive"))&& (outputVolume = self->_outputVolume, -[AFClientConfiguration outputVolume](v5, "outputVolume"), outputVolume == v13))
      {
        -[AFClientConfiguration accessibilityState](v5, "accessibilityState");
        v16 = (AFAccessibilityState *)objc_claimAutoreleasedReturnValue();
        accessibilityState = self->_accessibilityState;
        if (accessibilityState == v16 || -[AFAccessibilityState isEqual:](accessibilityState, "isEqual:", v16))
        {
          -[AFClientConfiguration tapToSiriAudioPlaybackRequest](v5, "tapToSiriAudioPlaybackRequest");
          v18 = (AFAudioPlaybackRequest *)objc_claimAutoreleasedReturnValue();
          tapToSiriAudioPlaybackRequest = self->_tapToSiriAudioPlaybackRequest;
          if (tapToSiriAudioPlaybackRequest == v18
            || -[AFAudioPlaybackRequest isEqual:](tapToSiriAudioPlaybackRequest, "isEqual:", v18))
          {
            -[AFClientConfiguration twoShotAudioPlaybackRequest](v5, "twoShotAudioPlaybackRequest");
            v20 = (AFAudioPlaybackRequest *)objc_claimAutoreleasedReturnValue();
            twoShotAudioPlaybackRequest = self->_twoShotAudioPlaybackRequest;
            if (twoShotAudioPlaybackRequest == v20
              || -[AFAudioPlaybackRequest isEqual:](twoShotAudioPlaybackRequest, "isEqual:", v20))
            {
              -[AFClientConfiguration deviceSetupFlowBeginDate](v5, "deviceSetupFlowBeginDate");
              v22 = (NSDate *)objc_claimAutoreleasedReturnValue();
              deviceSetupFlowBeginDate = self->_deviceSetupFlowBeginDate;
              if (deviceSetupFlowBeginDate == v22
                || -[NSDate isEqual:](deviceSetupFlowBeginDate, "isEqual:", v22))
              {
                -[AFClientConfiguration deviceSetupFlowEndDate](v5, "deviceSetupFlowEndDate");
                v24 = (NSDate *)objc_claimAutoreleasedReturnValue();
                deviceSetupFlowEndDate = self->_deviceSetupFlowEndDate;
                v14 = deviceSetupFlowEndDate == v24
                   || -[NSDate isEqual:](deviceSetupFlowEndDate, "isEqual:", v24);

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
  }

  return v14;
}

- (AFClientConfiguration)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  AFClientConfiguration *v23;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClientConfiguration::accessibilityState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClientConfiguration::deviceRingerSwitchState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClientConfiguration::isDeviceInCarDNDMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClientConfiguration::isDeviceInStarkMode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClientConfiguration::supportsCarPlayVehicleData"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClientConfiguration::isDeviceWatchAuthenticated"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClientConfiguration::areAnnouncementRequestsPermittedByPresentationWhileActive"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClientConfiguration::outputVolume"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "floatValue");
  v17 = v16;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClientConfiguration::tapToSiriAudioPlaybackRequest"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClientConfiguration::twoShotAudioPlaybackRequest"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClientConfiguration::deviceSetupFlowBeginDate"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFClientConfiguration::deviceSetupFlowEndDate"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v25) = v14;
  LODWORD(v22) = v17;
  v23 = -[AFClientConfiguration initWithAccessibilityState:deviceRingerSwitchState:isDeviceInCarDNDMode:isDeviceInStarkMode:supportsCarPlayVehicleData:isDeviceWatchAuthenticated:areAnnouncementRequestsPermittedByPresentationWhileActive:outputVolume:tapToSiriAudioPlaybackRequest:twoShotAudioPlaybackRequest:deviceSetupFlowBeginDate:deviceSetupFlowEndDate:](self, "initWithAccessibilityState:deviceRingerSwitchState:isDeviceInCarDNDMode:isDeviceInStarkMode:supportsCarPlayVehicleData:isDeviceWatchAuthenticated:areAnnouncementRequestsPermittedByPresentationWhileActive:outputVolume:tapToSiriAudioPlaybackRequest:twoShotAudioPlaybackRequest:deviceSetupFlowBeginDate:deviceSetupFlowEndDate:", v4, v27, v26, v8, v10, v12, v22, v25, v18, v19, v20, v21);

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  AFAccessibilityState *accessibilityState;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  id v13;

  accessibilityState = self->_accessibilityState;
  v13 = a3;
  objc_msgSend(v13, "encodeObject:forKey:", accessibilityState, CFSTR("AFClientConfiguration::accessibilityState"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_deviceRingerSwitchState);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v5, CFSTR("AFClientConfiguration::deviceRingerSwitchState"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDeviceInCarDNDMode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v6, CFSTR("AFClientConfiguration::isDeviceInCarDNDMode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDeviceInStarkMode);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v7, CFSTR("AFClientConfiguration::isDeviceInStarkMode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsCarPlayVehicleData);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v8, CFSTR("AFClientConfiguration::supportsCarPlayVehicleData"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDeviceWatchAuthenticated);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v9, CFSTR("AFClientConfiguration::isDeviceWatchAuthenticated"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_areAnnouncementRequestsPermittedByPresentationWhileActive);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v10, CFSTR("AFClientConfiguration::areAnnouncementRequestsPermittedByPresentationWhileActive"));

  *(float *)&v11 = self->_outputVolume;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("AFClientConfiguration::outputVolume"));

  objc_msgSend(v13, "encodeObject:forKey:", self->_tapToSiriAudioPlaybackRequest, CFSTR("AFClientConfiguration::tapToSiriAudioPlaybackRequest"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_twoShotAudioPlaybackRequest, CFSTR("AFClientConfiguration::twoShotAudioPlaybackRequest"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_deviceSetupFlowBeginDate, CFSTR("AFClientConfiguration::deviceSetupFlowBeginDate"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_deviceSetupFlowEndDate, CFSTR("AFClientConfiguration::deviceSetupFlowEndDate"));

}

- (AFAccessibilityState)accessibilityState
{
  return self->_accessibilityState;
}

- (int64_t)deviceRingerSwitchState
{
  return self->_deviceRingerSwitchState;
}

- (BOOL)isDeviceInCarDNDMode
{
  return self->_isDeviceInCarDNDMode;
}

- (BOOL)isDeviceInStarkMode
{
  return self->_isDeviceInStarkMode;
}

- (BOOL)supportsCarPlayVehicleData
{
  return self->_supportsCarPlayVehicleData;
}

- (BOOL)isDeviceWatchAuthenticated
{
  return self->_isDeviceWatchAuthenticated;
}

- (BOOL)areAnnouncementRequestsPermittedByPresentationWhileActive
{
  return self->_areAnnouncementRequestsPermittedByPresentationWhileActive;
}

- (float)outputVolume
{
  return self->_outputVolume;
}

- (AFAudioPlaybackRequest)tapToSiriAudioPlaybackRequest
{
  return self->_tapToSiriAudioPlaybackRequest;
}

- (AFAudioPlaybackRequest)twoShotAudioPlaybackRequest
{
  return self->_twoShotAudioPlaybackRequest;
}

- (NSDate)deviceSetupFlowBeginDate
{
  return self->_deviceSetupFlowBeginDate;
}

- (NSDate)deviceSetupFlowEndDate
{
  return self->_deviceSetupFlowEndDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceSetupFlowEndDate, 0);
  objc_storeStrong((id *)&self->_deviceSetupFlowBeginDate, 0);
  objc_storeStrong((id *)&self->_twoShotAudioPlaybackRequest, 0);
  objc_storeStrong((id *)&self->_tapToSiriAudioPlaybackRequest, 0);
  objc_storeStrong((id *)&self->_accessibilityState, 0);
}

void __348__AFClientConfiguration_initWithAccessibilityState_deviceRingerSwitchState_isDeviceInCarDNDMode_isDeviceInStarkMode_supportsCarPlayVehicleData_isDeviceWatchAuthenticated_areAnnouncementRequestsPermittedByPresentationWhileActive_outputVolume_tapToSiriAudioPlaybackRequest_twoShotAudioPlaybackRequest_deviceSetupFlowBeginDate_deviceSetupFlowEndDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "setAccessibilityState:", v3);
  objc_msgSend(v5, "setDeviceRingerSwitchState:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v5, "setIsDeviceInCarDNDMode:", *(unsigned __int8 *)(a1 + 84));
  objc_msgSend(v5, "setIsDeviceInStarkMode:", *(unsigned __int8 *)(a1 + 85));
  objc_msgSend(v5, "setSupportsCarPlayVehicleData:", *(unsigned __int8 *)(a1 + 86));
  objc_msgSend(v5, "setIsDeviceWatchAuthenticated:", *(unsigned __int8 *)(a1 + 87));
  objc_msgSend(v5, "setAreAnnouncementRequestsPermittedByPresentationWhileActive:", *(unsigned __int8 *)(a1 + 88));
  LODWORD(v4) = *(_DWORD *)(a1 + 80);
  objc_msgSend(v5, "setOutputVolume:", v4);
  objc_msgSend(v5, "setTapToSiriAudioPlaybackRequest:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setTwoShotAudioPlaybackRequest:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "setDeviceSetupFlowBeginDate:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v5, "setDeviceSetupFlowEndDate:", *(_QWORD *)(a1 + 64));

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFClientConfigurationMutation *);
  _AFClientConfigurationMutation *v5;
  AFClientConfiguration *v6;
  void *v7;
  uint64_t v8;
  AFAccessibilityState *accessibilityState;
  float v10;
  void *v11;
  uint64_t v12;
  AFAudioPlaybackRequest *tapToSiriAudioPlaybackRequest;
  void *v14;
  uint64_t v15;
  AFAudioPlaybackRequest *twoShotAudioPlaybackRequest;
  void *v17;
  uint64_t v18;
  NSDate *deviceSetupFlowBeginDate;
  void *v20;
  uint64_t v21;
  NSDate *deviceSetupFlowEndDate;

  v4 = (void (**)(id, _AFClientConfigurationMutation *))a3;
  if (v4)
  {
    v5 = -[_AFClientConfigurationMutation initWithBase:]([_AFClientConfigurationMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFClientConfigurationMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFClientConfiguration);
      -[_AFClientConfigurationMutation getAccessibilityState](v5, "getAccessibilityState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      accessibilityState = v6->_accessibilityState;
      v6->_accessibilityState = (AFAccessibilityState *)v8;

      v6->_deviceRingerSwitchState = -[_AFClientConfigurationMutation getDeviceRingerSwitchState](v5, "getDeviceRingerSwitchState");
      v6->_isDeviceInCarDNDMode = -[_AFClientConfigurationMutation getIsDeviceInCarDNDMode](v5, "getIsDeviceInCarDNDMode");
      v6->_isDeviceInStarkMode = -[_AFClientConfigurationMutation getIsDeviceInStarkMode](v5, "getIsDeviceInStarkMode");
      v6->_supportsCarPlayVehicleData = -[_AFClientConfigurationMutation getSupportsCarPlayVehicleData](v5, "getSupportsCarPlayVehicleData");
      v6->_isDeviceWatchAuthenticated = -[_AFClientConfigurationMutation getIsDeviceWatchAuthenticated](v5, "getIsDeviceWatchAuthenticated");
      v6->_areAnnouncementRequestsPermittedByPresentationWhileActive = -[_AFClientConfigurationMutation getAreAnnouncementRequestsPermittedByPresentationWhileActive](v5, "getAreAnnouncementRequestsPermittedByPresentationWhileActive");
      -[_AFClientConfigurationMutation getOutputVolume](v5, "getOutputVolume");
      v6->_outputVolume = v10;
      -[_AFClientConfigurationMutation getTapToSiriAudioPlaybackRequest](v5, "getTapToSiriAudioPlaybackRequest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      tapToSiriAudioPlaybackRequest = v6->_tapToSiriAudioPlaybackRequest;
      v6->_tapToSiriAudioPlaybackRequest = (AFAudioPlaybackRequest *)v12;

      -[_AFClientConfigurationMutation getTwoShotAudioPlaybackRequest](v5, "getTwoShotAudioPlaybackRequest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      twoShotAudioPlaybackRequest = v6->_twoShotAudioPlaybackRequest;
      v6->_twoShotAudioPlaybackRequest = (AFAudioPlaybackRequest *)v15;

      -[_AFClientConfigurationMutation getDeviceSetupFlowBeginDate](v5, "getDeviceSetupFlowBeginDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      deviceSetupFlowBeginDate = v6->_deviceSetupFlowBeginDate;
      v6->_deviceSetupFlowBeginDate = (NSDate *)v18;

      -[_AFClientConfigurationMutation getDeviceSetupFlowEndDate](v5, "getDeviceSetupFlowEndDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      deviceSetupFlowEndDate = v6->_deviceSetupFlowEndDate;
      v6->_deviceSetupFlowEndDate = (NSDate *)v21;

    }
    else
    {
      v6 = (AFClientConfiguration *)-[AFClientConfiguration copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFClientConfiguration *)-[AFClientConfiguration copy](self, "copy");
  }

  return v6;
}

@end
