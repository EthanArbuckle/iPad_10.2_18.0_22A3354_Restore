@implementation HMAccessoryCapabilities

- (HMAccessoryCapabilities)initWithTagUUID:(id)a3 capabilities:(_HMAccessoryCapabilitiesStruct)a4
{
  id v6;
  HMAccessoryCapabilities *v7;
  uint64_t v8;
  NSString *tag;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMAccessoryCapabilities;
  v7 = -[HMAccessoryCapabilities init](&v11, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "UUIDString");
    v8 = objc_claimAutoreleasedReturnValue();
    tag = v7->_tag;
    v7->_tag = (NSString *)v8;

    v7->_capabilities = a4;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  HMAccessoryCapabilities *v4;
  HMAccessoryCapabilities *v5;
  HMAccessoryCapabilities *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMAccessoryCapabilities *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMAccessoryCapabilities tag](self, "tag");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessoryCapabilities tag](v6, "tag");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMAccessoryCapabilities tag](self, "tag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isLocalEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  _BOOL4 v44;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (!v6)
    goto LABEL_42;
  v7 = -[HMAccessoryCapabilities supportsKeychainSync](self, "supportsKeychainSync");
  if (v7 != objc_msgSend(v6, "supportsKeychainSync"))
    goto LABEL_42;
  v8 = -[HMAccessoryCapabilities supportsDeviceSetup](self, "supportsDeviceSetup");
  if (v8 != objc_msgSend(v6, "supportsDeviceSetup"))
    goto LABEL_42;
  v9 = -[HMAccessoryCapabilities supportsKeyTransferClient](self, "supportsKeyTransferClient");
  if (v9 != objc_msgSend(v6, "supportsKeyTransferClient"))
    goto LABEL_42;
  v10 = -[HMAccessoryCapabilities supportsKeyTransferServer](self, "supportsKeyTransferServer");
  if (v10 != objc_msgSend(v6, "supportsKeyTransferServer"))
    goto LABEL_42;
  v11 = -[HMAccessoryCapabilities supportsStandaloneMode](self, "supportsStandaloneMode");
  if (v11 != objc_msgSend(v6, "supportsStandaloneMode"))
    goto LABEL_42;
  v12 = -[HMAccessoryCapabilities supportsCloudDataSync](self, "supportsCloudDataSync");
  if (v12 != objc_msgSend(v6, "supportsCloudDataSync"))
    goto LABEL_42;
  v13 = -[HMAccessoryCapabilities supportsWholeHouseAudio](self, "supportsWholeHouseAudio");
  if (v13 != objc_msgSend(v6, "supportsWholeHouseAudio"))
    goto LABEL_42;
  v14 = -[HMAccessoryCapabilities supportsAssistantAccessControl](self, "supportsAssistantAccessControl");
  if (v14 != objc_msgSend(v6, "supportsAssistantAccessControl"))
    goto LABEL_42;
  v15 = -[HMAccessoryCapabilities supportsHomeInvitation](self, "supportsHomeInvitation");
  if (v15 != objc_msgSend(v6, "supportsHomeInvitation"))
    goto LABEL_42;
  v16 = -[HMAccessoryCapabilities supportsTargetControl](self, "supportsTargetControl");
  if (v16 != objc_msgSend(v6, "supportsTargetControl"))
    goto LABEL_42;
  v17 = -[HMAccessoryCapabilities supportsMultiUser](self, "supportsMultiUser");
  if (v17 != objc_msgSend(v6, "supportsMultiUser"))
    goto LABEL_42;
  v18 = -[HMAccessoryCapabilities supportsHomeLevelLocationServiceSetting](self, "supportsHomeLevelLocationServiceSetting");
  if (v18 != objc_msgSend(v6, "supportsHomeLevelLocationServiceSetting"))
    goto LABEL_42;
  v19 = -[HMAccessoryCapabilities supportsCompanionInitiatedRestart](self, "supportsCompanionInitiatedRestart");
  if (v19 != objc_msgSend(v6, "supportsCompanionInitiatedRestart"))
    goto LABEL_42;
  v20 = -[HMAccessoryCapabilities supportsMusicAlarm](self, "supportsMusicAlarm");
  if (v20 != objc_msgSend(v6, "supportsMusicAlarm"))
    goto LABEL_42;
  v21 = -[HMAccessoryCapabilities supportsAnnounce](self, "supportsAnnounce");
  if (v21 != objc_msgSend(v6, "supportsAnnounce"))
    goto LABEL_42;
  v22 = -[HMAccessoryCapabilities supportsAudioAnalysis](self, "supportsAudioAnalysis");
  if (v22 != objc_msgSend(v6, "supportsAudioAnalysis"))
    goto LABEL_42;
  v23 = -[HMAccessoryCapabilities supportsThirdPartyMusic](self, "supportsThirdPartyMusic");
  if (v23 != objc_msgSend(v6, "supportsThirdPartyMusic"))
    goto LABEL_42;
  v24 = -[HMAccessoryCapabilities supportsPreferredMediaUser](self, "supportsPreferredMediaUser");
  if (v24 != objc_msgSend(v6, "supportsPreferredMediaUser"))
    goto LABEL_42;
  v25 = -[HMAccessoryCapabilities supportsThreadBorderRouter](self, "supportsThreadBorderRouter");
  if (v25 != objc_msgSend(v6, "supportsThreadBorderRouter"))
    goto LABEL_42;
  v26 = -[HMAccessoryCapabilities supportsDoorbellChime](self, "supportsDoorbellChime");
  if (v26 != objc_msgSend(v6, "supportsDoorbellChime"))
    goto LABEL_42;
  v27 = -[HMAccessoryCapabilities supportsUserMediaSettings](self, "supportsUserMediaSettings");
  if (v27 != objc_msgSend(v6, "supportsUserMediaSettings"))
    goto LABEL_42;
  v28 = -[HMAccessoryCapabilities supportsCoordinationDoorbellChime](self, "supportsCoordinationDoorbellChime");
  if (v28 != objc_msgSend(v6, "supportsCoordinationDoorbellChime"))
    goto LABEL_42;
  v29 = -[HMAccessoryCapabilities supportsHomeHub](self, "supportsHomeHub");
  if (v29 != objc_msgSend(v6, "supportsHomeHub"))
    goto LABEL_42;
  v30 = -[HMAccessoryCapabilities supportsAudioReturnChannel](self, "supportsAudioReturnChannel");
  if (v30 != objc_msgSend(v6, "supportsAudioReturnChannel"))
    goto LABEL_42;
  v31 = -[HMAccessoryCapabilities supportsManagedConfigurationProfile](self, "supportsManagedConfigurationProfile");
  if (v31 != objc_msgSend(v6, "supportsManagedConfigurationProfile"))
    goto LABEL_42;
  v32 = -[HMAccessoryCapabilities supportsCaptiveNetworks](self, "supportsCaptiveNetworks");
  if (v32 != objc_msgSend(v6, "supportsCaptiveNetworks"))
    goto LABEL_42;
  v33 = -[HMAccessoryCapabilities supportsMessagedHomePodSettings](self, "supportsMessagedHomePodSettings");
  if (v33 != objc_msgSend(v6, "supportsMessagedHomePodSettings"))
    goto LABEL_42;
  v34 = -[HMAccessoryCapabilities supportsMediaActions](self, "supportsMediaActions");
  if (v34 != objc_msgSend(v6, "supportsMediaActions"))
    goto LABEL_42;
  v35 = -[HMAccessoryCapabilities supportsDropIn](self, "supportsDropIn");
  if (v35 != objc_msgSend(v6, "supportsDropIn"))
    goto LABEL_42;
  v36 = -[HMAccessoryCapabilities supportsRMVonAppleTV](self, "supportsRMVonAppleTV");
  if (v36 != objc_msgSend(v6, "supportsRMVonAppleTV") && (_os_feature_enabled_impl() & 1) != 0)
    goto LABEL_42;
  if (((v37 = -[HMAccessoryCapabilities supportsJustSiri](self, "supportsJustSiri"),
         v37 == objc_msgSend(v6, "supportsJustSiri"))
     || (_os_feature_enabled_impl() & 1) == 0)
    && (v38 = -[HMAccessoryCapabilities supportsInstallManagedConfigurationProfile](self, "supportsInstallManagedConfigurationProfile"), v38 == objc_msgSend(v6, "supportsInstallManagedConfigurationProfile"))&& (v39 = -[HMAccessoryCapabilities supportsCoordinationFreeDoorbellChime](self, "supportsCoordinationFreeDoorbellChime"), v39 == objc_msgSend(v6, "supportsCoordinationFreeDoorbellChime"))&& (v40 = -[HMAccessoryCapabilities supportsCompanionInitiatedObliterate](self, "supportsCompanionInitiatedObliterate"), v40 == objc_msgSend(v6, "supportsCompanionInitiatedObliterate"))&& (v41 = -[HMAccessoryCapabilities supportsLoreto](self, "supportsLoreto"), v41 == objc_msgSend(v6, "supportsLoreto")))
  {
    v44 = -[HMAccessoryCapabilities supportsTVOSUpdateManualUpdateAvailableNotification](self, "supportsTVOSUpdateManualUpdateAvailableNotification");
    v42 = v44 ^ objc_msgSend(v6, "supportsTVOSUpdateManualUpdateAvailableNotification") ^ 1;
  }
  else
  {
LABEL_42:
    LOBYTE(v42) = 0;
  }

  return v42;
}

- (BOOL)supportsKeychainSync
{
  return -[HMAccessoryCapabilities capabilities](self, "capabilities") & 1;
}

- (BOOL)supportsDeviceSetup
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 1) & 1;
}

- (BOOL)supportsKeyTransferClient
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 2) & 1;
}

- (BOOL)supportsKeyTransferServer
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 3) & 1;
}

- (BOOL)supportsStandaloneMode
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 4) & 1;
}

- (BOOL)supportsCloudDataSync
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 5) & 1;
}

- (BOOL)supportsWholeHouseAudio
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 6) & 1;
}

- (BOOL)supportsAssistantAccessControl
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 7) & 1;
}

- (BOOL)supportsHomeInvitation
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 8) & 1;
}

- (BOOL)supportsTargetControl
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 9) & 1;
}

- (BOOL)supportsMultiUser
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 10) & 1;
}

- (BOOL)supportsHomeLevelLocationServiceSetting
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 11) & 1;
}

- (BOOL)supportsCompanionInitiatedRestart
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 12) & 1;
}

- (BOOL)supportsMusicAlarm
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 13) & 1;
}

- (BOOL)supportsAnnounce
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 14) & 1;
}

- (BOOL)supportsAudioAnalysis
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 15) & 1;
}

- (BOOL)supportsThirdPartyMusic
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 16) & 1;
}

- (BOOL)supportsPreferredMediaUser
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 17) & 1;
}

- (BOOL)supportsThreadBorderRouter
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 18) & 1;
}

- (BOOL)supportsDoorbellChime
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 19) & 1;
}

- (BOOL)supportsUserMediaSettings
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 20) & 1;
}

- (BOOL)supportsCoordinationDoorbellChime
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 21) & 1;
}

- (BOOL)supportsHomeHub
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 22) & 1;
}

- (BOOL)supportsAudioReturnChannel
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 23) & 1;
}

- (BOOL)supportsManagedConfigurationProfile
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 24) & 1;
}

- (BOOL)supportsCaptiveNetworks
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 25) & 1;
}

- (BOOL)supportsMessagedHomePodSettings
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 26) & 1;
}

- (BOOL)supportsMediaActions
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 27) & 1;
}

- (BOOL)supportsDropIn
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 28) & 1;
}

- (BOOL)supportsRMVonAppleTV
{
  if ((-[HMAccessoryCapabilities capabilities](self, "capabilities") & 0x20000000) != 0)
    return _os_feature_enabled_impl();
  else
    return 0;
}

- (BOOL)supportsJustSiri
{
  if ((-[HMAccessoryCapabilities capabilities](self, "capabilities") & 0x40000000) != 0)
    return _os_feature_enabled_impl();
  else
    return 0;
}

- (BOOL)supportsInstallManagedConfigurationProfile
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 31) & 1;
}

- (BOOL)supportsCoordinationFreeDoorbellChime
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 32) & 1;
}

- (BOOL)supportsCompanionInitiatedObliterate
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 33) & 1;
}

- (BOOL)supportsLoreto
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 34) & 1;
}

- (BOOL)supportsTVOSUpdateManualUpdateAvailableNotification
{
  return ((unint64_t)-[HMAccessoryCapabilities capabilities](self, "capabilities") >> 35) & 1;
}

- (id)pbCapabilities
{
  HMProtoAccessoryCapabilities *v3;
  void *v4;

  v3 = objc_alloc_init(HMProtoAccessoryCapabilities);
  -[HMAccessoryCapabilities tag](self, "tag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMProtoAccessoryCapabilities setTag:](v3, "setTag:", v4);

  -[HMProtoAccessoryCapabilities setSupportsKeychainSync:](v3, "setSupportsKeychainSync:", -[HMAccessoryCapabilities supportsKeychainSync](self, "supportsKeychainSync"));
  -[HMProtoAccessoryCapabilities setSupportsDeviceSetup:](v3, "setSupportsDeviceSetup:", -[HMAccessoryCapabilities supportsDeviceSetup](self, "supportsDeviceSetup"));
  -[HMProtoAccessoryCapabilities setSupportsKeyTransferClient:](v3, "setSupportsKeyTransferClient:", -[HMAccessoryCapabilities supportsKeyTransferClient](self, "supportsKeyTransferClient"));
  -[HMProtoAccessoryCapabilities setSupportsKeyTransferServer:](v3, "setSupportsKeyTransferServer:", -[HMAccessoryCapabilities supportsKeyTransferServer](self, "supportsKeyTransferServer"));
  -[HMProtoAccessoryCapabilities setSupportsStandaloneMode:](v3, "setSupportsStandaloneMode:", -[HMAccessoryCapabilities supportsStandaloneMode](self, "supportsStandaloneMode"));
  -[HMProtoAccessoryCapabilities setSupportsCloudDataSync:](v3, "setSupportsCloudDataSync:", -[HMAccessoryCapabilities supportsCloudDataSync](self, "supportsCloudDataSync"));
  -[HMProtoAccessoryCapabilities setSupportsWholeHouseAudio:](v3, "setSupportsWholeHouseAudio:", -[HMAccessoryCapabilities supportsWholeHouseAudio](self, "supportsWholeHouseAudio"));
  -[HMProtoAccessoryCapabilities setSupportsAssistantAccessControl:](v3, "setSupportsAssistantAccessControl:", -[HMAccessoryCapabilities supportsAssistantAccessControl](self, "supportsAssistantAccessControl"));
  -[HMProtoAccessoryCapabilities setSupportsHomeInvitation:](v3, "setSupportsHomeInvitation:", -[HMAccessoryCapabilities supportsHomeInvitation](self, "supportsHomeInvitation"));
  -[HMProtoAccessoryCapabilities setSupportsTargetControl:](v3, "setSupportsTargetControl:", -[HMAccessoryCapabilities supportsTargetControl](self, "supportsTargetControl"));
  -[HMProtoAccessoryCapabilities setSupportsMultiUser:](v3, "setSupportsMultiUser:", -[HMAccessoryCapabilities supportsMultiUser](self, "supportsMultiUser"));
  -[HMProtoAccessoryCapabilities setSupportsHomeLevelLocationServiceSetting:](v3, "setSupportsHomeLevelLocationServiceSetting:", -[HMAccessoryCapabilities supportsHomeLevelLocationServiceSetting](self, "supportsHomeLevelLocationServiceSetting"));
  -[HMProtoAccessoryCapabilities setSupportsCompanionInitiatedRestart:](v3, "setSupportsCompanionInitiatedRestart:", -[HMAccessoryCapabilities supportsCompanionInitiatedRestart](self, "supportsCompanionInitiatedRestart"));
  -[HMProtoAccessoryCapabilities setSupportsMusicAlarm:](v3, "setSupportsMusicAlarm:", -[HMAccessoryCapabilities supportsMusicAlarm](self, "supportsMusicAlarm"));
  -[HMProtoAccessoryCapabilities setSupportsAnnounce:](v3, "setSupportsAnnounce:", -[HMAccessoryCapabilities supportsAnnounce](self, "supportsAnnounce"));
  -[HMProtoAccessoryCapabilities setSupportsf9cc0d9d6aa54e7:](v3, "setSupportsf9cc0d9d6aa54e7:", -[HMAccessoryCapabilities supportsAudioAnalysis](self, "supportsAudioAnalysis"));
  -[HMProtoAccessoryCapabilities setSupportsThirdPartyMusic:](v3, "setSupportsThirdPartyMusic:", -[HMAccessoryCapabilities supportsThirdPartyMusic](self, "supportsThirdPartyMusic"));
  -[HMProtoAccessoryCapabilities setSupportsPreferredMediaUser:](v3, "setSupportsPreferredMediaUser:", -[HMAccessoryCapabilities supportsPreferredMediaUser](self, "supportsPreferredMediaUser"));
  -[HMProtoAccessoryCapabilities setSupportsThreadBorderRouter:](v3, "setSupportsThreadBorderRouter:", -[HMAccessoryCapabilities supportsThreadBorderRouter](self, "supportsThreadBorderRouter"));
  -[HMProtoAccessoryCapabilities setSupportsDoorbellChime:](v3, "setSupportsDoorbellChime:", -[HMAccessoryCapabilities supportsDoorbellChime](self, "supportsDoorbellChime"));
  -[HMProtoAccessoryCapabilities setSupportsUserMediaSettings:](v3, "setSupportsUserMediaSettings:", -[HMAccessoryCapabilities supportsUserMediaSettings](self, "supportsUserMediaSettings"));
  -[HMProtoAccessoryCapabilities setSupportsCoordinationDoorbellChime:](v3, "setSupportsCoordinationDoorbellChime:", -[HMAccessoryCapabilities supportsCoordinationDoorbellChime](self, "supportsCoordinationDoorbellChime"));
  -[HMProtoAccessoryCapabilities setSupportsHomeHub:](v3, "setSupportsHomeHub:", -[HMAccessoryCapabilities supportsHomeHub](self, "supportsHomeHub"));
  -[HMProtoAccessoryCapabilities setSupportsAudioReturnChannel:](v3, "setSupportsAudioReturnChannel:", -[HMAccessoryCapabilities supportsAudioReturnChannel](self, "supportsAudioReturnChannel"));
  -[HMProtoAccessoryCapabilities setSupportsManagedConfigurationProfile:](v3, "setSupportsManagedConfigurationProfile:", -[HMAccessoryCapabilities supportsManagedConfigurationProfile](self, "supportsManagedConfigurationProfile"));
  -[HMProtoAccessoryCapabilities setSupportsCaptiveNetworks:](v3, "setSupportsCaptiveNetworks:", -[HMAccessoryCapabilities supportsCaptiveNetworks](self, "supportsCaptiveNetworks"));
  -[HMProtoAccessoryCapabilities setSupportsMessagedHomePodSettings:](v3, "setSupportsMessagedHomePodSettings:", -[HMAccessoryCapabilities supportsMessagedHomePodSettings](self, "supportsMessagedHomePodSettings"));
  -[HMProtoAccessoryCapabilities setSupportsMediaActions:](v3, "setSupportsMediaActions:", -[HMAccessoryCapabilities supportsMediaActions](self, "supportsMediaActions"));
  -[HMProtoAccessoryCapabilities setSupports90bb069d6bx54e7:](v3, "setSupports90bb069d6bx54e7:", -[HMAccessoryCapabilities supportsDropIn](self, "supportsDropIn"));
  -[HMProtoAccessoryCapabilities setSupports89024c1cadcb8b00:](v3, "setSupports89024c1cadcb8b00:", -[HMAccessoryCapabilities supportsRMVonAppleTV](self, "supportsRMVonAppleTV"));
  -[HMProtoAccessoryCapabilities setSupports2c25465bb0b47366:](v3, "setSupports2c25465bb0b47366:", -[HMAccessoryCapabilities supportsJustSiri](self, "supportsJustSiri"));
  -[HMProtoAccessoryCapabilities setSupportsInstallManagedConfigurationProfile:](v3, "setSupportsInstallManagedConfigurationProfile:", -[HMAccessoryCapabilities supportsInstallManagedConfigurationProfile](self, "supportsInstallManagedConfigurationProfile"));
  -[HMProtoAccessoryCapabilities setSupportsCoordinationFreeDoorbellChime:](v3, "setSupportsCoordinationFreeDoorbellChime:", -[HMAccessoryCapabilities supportsCoordinationFreeDoorbellChime](self, "supportsCoordinationFreeDoorbellChime"));
  -[HMProtoAccessoryCapabilities setSupportsCompanionInitiatedObliterate:](v3, "setSupportsCompanionInitiatedObliterate:", -[HMAccessoryCapabilities supportsCompanionInitiatedObliterate](self, "supportsCompanionInitiatedObliterate"));
  -[HMProtoAccessoryCapabilities setSupports45c051b0b1f0:](v3, "setSupports45c051b0b1f0:", -[HMAccessoryCapabilities supportsLoreto](self, "supportsLoreto"));
  -[HMProtoAccessoryCapabilities setSupportsTVOSUpdateManualUpdateAvailableNotification:](v3, "setSupportsTVOSUpdateManualUpdateAvailableNotification:", -[HMAccessoryCapabilities supportsTVOSUpdateManualUpdateAvailableNotification](self, "supportsTVOSUpdateManualUpdateAvailableNotification"));
  return v3;
}

- (HMAccessoryCapabilities)initWithProtoData:(id)a3
{
  id v4;
  HMProtoAccessoryCapabilities *v5;
  HMAccessoryCapabilities *v6;

  v4 = a3;
  v5 = -[HMProtoAccessoryCapabilities initWithData:]([HMProtoAccessoryCapabilities alloc], "initWithData:", v4);

  if (v5)
  {
    self = -[HMAccessoryCapabilities initWithProtoCapabilities:](self, "initWithProtoCapabilities:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (HMAccessoryCapabilities)initWithProtoCapabilities:(id)a3
{
  id v4;
  HMAccessoryCapabilities *v5;
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;

  v4 = a3;
  objc_msgSend(v4, "tag");
  v5 = (HMAccessoryCapabilities *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v4, "tag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = (void *)objc_msgSend(v6, "initWithUUIDString:", v7);

    v8 = objc_msgSend(v4, "supportsKeychainSync");
    v9 = objc_msgSend(v4, "supportsDeviceSetup");
    v10 = 2;
    if (!v9)
      v10 = 0;
    v11 = v10 | v8;
    if (objc_msgSend(v4, "supportsKeyTransferClient"))
      v12 = 4;
    else
      v12 = 0;
    v13 = objc_msgSend(v4, "supportsKeyTransferServer");
    v14 = 8;
    if (!v13)
      v14 = 0;
    v91 = v11 | v12 | v14;
    if (objc_msgSend(v4, "supportsStandaloneMode"))
      v15 = 16;
    else
      v15 = 0;
    if (objc_msgSend(v4, "supportsCloudDataSync"))
      v16 = 32;
    else
      v16 = 0;
    if (objc_msgSend(v4, "supportsWholeHouseAudio"))
      v17 = 64;
    else
      v17 = 0;
    v89 = v15 | v16;
    v90 = v17;
    v18 = objc_msgSend(v4, "supportsAssistantAccessControl");
    v19 = 128;
    if (!v18)
      v19 = 0;
    v88 = v19;
    v20 = objc_msgSend(v4, "supportsHomeInvitation");
    v21 = 256;
    if (!v20)
      v21 = 0;
    v87 = v21;
    v22 = objc_msgSend(v4, "supportsTargetControl");
    v23 = 512;
    if (!v22)
      v23 = 0;
    v86 = v23;
    v24 = objc_msgSend(v4, "supportsMultiUser");
    v25 = 1024;
    if (!v24)
      v25 = 0;
    v85 = v25;
    v26 = objc_msgSend(v4, "supportsHomeLevelLocationServiceSetting");
    v27 = 2048;
    if (!v26)
      v27 = 0;
    v84 = v27;
    v28 = objc_msgSend(v4, "supportsCompanionInitiatedRestart");
    v29 = 4096;
    if (!v28)
      v29 = 0;
    v83 = v29;
    v30 = objc_msgSend(v4, "supportsMusicAlarm");
    v31 = 0x2000;
    if (!v30)
      v31 = 0;
    v82 = v31;
    v32 = objc_msgSend(v4, "supportsAnnounce");
    v33 = 0x4000;
    if (!v32)
      v33 = 0;
    v81 = v33;
    v34 = objc_msgSend(v4, "supportsf9cc0d9d6aa54e7");
    v35 = 0x8000;
    if (!v34)
      v35 = 0;
    v80 = v35;
    v36 = objc_msgSend(v4, "supportsThirdPartyMusic");
    v37 = 0x10000;
    if (!v36)
      v37 = 0;
    v79 = v37;
    v38 = objc_msgSend(v4, "supportsPreferredMediaUser");
    v39 = 0x20000;
    if (!v38)
      v39 = 0;
    v78 = v39;
    v40 = objc_msgSend(v4, "supportsThreadBorderRouter");
    v41 = 0x40000;
    if (!v40)
      v41 = 0;
    v77 = v41;
    v42 = objc_msgSend(v4, "supportsDoorbellChime");
    v43 = 0x80000;
    if (!v42)
      v43 = 0;
    v76 = v43;
    v44 = objc_msgSend(v4, "supportsUserMediaSettings");
    v45 = 0x100000;
    if (!v44)
      v45 = 0;
    v75 = v45;
    v46 = objc_msgSend(v4, "supportsCoordinationDoorbellChime");
    v47 = 0x200000;
    if (!v46)
      v47 = 0;
    v74 = v47;
    v48 = objc_msgSend(v4, "supportsHomeHub");
    v49 = 0x400000;
    if (!v48)
      v49 = 0;
    v73 = v49;
    v50 = objc_msgSend(v4, "supportsAudioReturnChannel");
    v51 = 0x800000;
    if (!v50)
      v51 = 0;
    v72 = v51;
    v52 = objc_msgSend(v4, "supportsManagedConfigurationProfile");
    v53 = 0x1000000;
    if (!v52)
      v53 = 0;
    v71 = v53;
    v54 = objc_msgSend(v4, "supportsCaptiveNetworks");
    v55 = 0x2000000;
    if (!v54)
      v55 = 0;
    v70 = v55;
    v56 = objc_msgSend(v4, "supportsMessagedHomePodSettings");
    v57 = 0x4000000;
    if (!v56)
      v57 = 0;
    v69 = v57;
    if (objc_msgSend(v4, "supportsMediaActions"))
      v58 = 0x8000000;
    else
      v58 = 0;
    if (objc_msgSend(v4, "supports90bb069d6bx54e7"))
      v59 = 0x10000000;
    else
      v59 = 0;
    if (objc_msgSend(v4, "supports89024c1cadcb8b00"))
      v60 = 0x20000000;
    else
      v60 = 0;
    if (objc_msgSend(v4, "supports2c25465bb0b47366"))
      v61 = 0x40000000;
    else
      v61 = 0;
    if (objc_msgSend(v4, "supportsInstallManagedConfigurationProfile"))
      v62 = 0x80000000;
    else
      v62 = 0;
    if (objc_msgSend(v4, "supportsCoordinationFreeDoorbellChime"))
      v63 = 0x100000000;
    else
      v63 = 0;
    if (objc_msgSend(v4, "supportsCompanionInitiatedObliterate"))
      v64 = 0x200000000;
    else
      v64 = 0;
    if (objc_msgSend(v4, "supports45c051b0b1f0"))
      v65 = 0x400000000;
    else
      v65 = 0;
    v66 = objc_msgSend(v4, "supportsTVOSUpdateManualUpdateAvailableNotification");
    v67 = 0x800000000;
    if (!v66)
      v67 = 0;
    self = -[HMAccessoryCapabilities initWithTagUUID:capabilities:](self, "initWithTagUUID:capabilities:", v92, v91 | v89 | v90 | v88 | v87 | v86 | v85 | v84 | v83 | v82 | v81 | v80 | v79 | v78 | v77 | v76 | v75 | v74 | v73 | v72 | v71 | v70 | v69 | v58 | v59 | v60 | v61 | v62 | v63 | v64 | v65 | v67);

    v5 = self;
  }

  return v5;
}

- (NSString)tag
{
  return self->_tag;
}

- (_HMAccessoryCapabilitiesStruct)capabilities
{
  return self->_capabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
}

@end
