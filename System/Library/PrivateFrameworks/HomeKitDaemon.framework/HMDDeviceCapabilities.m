@implementation HMDDeviceCapabilities

- (BOOL)supportsCloudDataSync
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsCloudDataSync");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsKeychainSync
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsKeychainSync");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isResidentCapable
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentCapable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (HMDDeviceCapabilities)deviceCapabilities
{
  if (deviceCapabilities_onceToken != -1)
    dispatch_once(&deviceCapabilities_onceToken, &__block_literal_global_203578);
  return (HMDDeviceCapabilities *)(id)deviceCapabilities_deviceCapabilities;
}

- (HMDDeviceCapabilities)initWithProductInfo:(id)a3
{
  return -[HMDDeviceCapabilities initWithProductInfo:mobileGestaltClient:homekitVersion:](self, "initWithProductInfo:mobileGestaltClient:homekitVersion:", a3, 0, 0);
}

- (HMDDeviceCapabilities)initWithProductInfo:(id)a3 mobileGestaltClient:(id)a4
{
  return -[HMDDeviceCapabilities initWithProductInfo:mobileGestaltClient:homekitVersion:](self, "initWithProductInfo:mobileGestaltClient:homekitVersion:", a3, a4, 0);
}

- (HMDDeviceCapabilities)initWithProductInfo:(id)a3 mobileGestaltClient:(id)a4 homekitVersion:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDDeviceCapabilitiesModel *v11;
  void *v12;
  HMDDeviceCapabilitiesModel *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  _BOOL8 v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  NSObject *v82;
  void *v83;
  HMDDeviceCapabilities *v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  __int128 v91;
  uint64_t v92;
  uint8_t buf[16];
  uint64_t v94;
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v11 = [HMDDeviceCapabilitiesModel alloc];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMDBackingStoreModelObject initWithUUID:](v11, "initWithUUID:", v12);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsKeychainSync(v8));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsKeychainSync:](v13, "setSupportsKeychainSync:", v14);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsDeviceSetup(v8));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsDeviceSetup:](v13, "setSupportsDeviceSetup:", v15);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsKeyTransferClient(v8, v9, v10));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsKeyTransferClient:](v13, "setSupportsKeyTransferClient:", v16);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsKeyTransferServer(v8));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsKeyTransferServer:](v13, "setSupportsKeyTransferServer:", v17);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsKeychainSync(v8));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsStandaloneMode:](v13, "setSupportsStandaloneMode:", v18);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsCloudDataSync(v8));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsCloudDataSync:](v13, "setSupportsCloudDataSync:", v19);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsWholeHouseAudio(v8));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsWholeHouseAudio:](v13, "setSupportsWholeHouseAudio:", v20);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsAssistantAccessControl(v8));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsAssistantAccessControl:](v13, "setSupportsAssistantAccessControl:", v21);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productIsResidentCapable(v8));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setResidentCapable:](v13, "setResidentCapable:", v22);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "productClass") == 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setRemoteGatewayCapable:](v13, "setRemoteGatewayCapable:", v23);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsHomeInvitation(v8));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsHomeInvitation:](v13, "setSupportsHomeInvitation:", v24);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsTargetControl(v8));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsTargetControl:](v13, "setSupportsTargetControl:", v25);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsMultiUser(v8));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsMultiUser:](v13, "setSupportsMultiUser:", v26);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsHomeLevelLocationServiceSetting(v8));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsHomeLevelLocationServiceSetting:](v13, "setSupportsHomeLevelLocationServiceSetting:", v27);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsCompanionInitiatedRestart(v8));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsCompanionInitiatedRestart:](v13, "setSupportsCompanionInitiatedRestart:", v28);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsCompanionInitiatedObliterate(v8));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsCompanionInitiatedObliterate:](v13, "setSupportsCompanionInitiatedObliterate:", v29);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsCameraRecording(v8));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsCameraRecording:](v13, "setSupportsCameraRecording:", v30);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsRouterManagement(v8));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsRouterManagement:](v13, "setSupportsRouterManagement:", v31);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsShortcutActions(v8));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsShortcutActions:](v13, "setSupportsShortcutActions:", v32);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsMediaActions(v8));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsMediaActions:](v13, "setSupportsMediaActions:", v33);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsFirmwareUpdate(v8));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsFirmwareUpdate:](v13, "setSupportsFirmwareUpdate:", v34);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsResidentFirmwareUpdate(v8));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsResidentFirmwareUpdate:](v13, "setSupportsResidentFirmwareUpdate:", v35);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsCameraActivityZones(v8));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsCameraActivityZones:](v13, "setSupportsCameraActivityZones:", v36);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsMusicAlarm(v8));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsMusicAlarm:](v13, "setSupportsMusicAlarm:", v37);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsCameraActivityZones(v8));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsFaceClassification:](v13, "setSupportsFaceClassification:", v38);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsCameraActivityZones(v8));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsNaturalLighting:](v13, "setSupportsNaturalLighting:", v39);

    v40 = (void *)MEMORY[0x24BDD16E0];
    v41 = objc_msgSend(v8, "productPlatform");
    v43 = v41 > 5 || (v41 & 0x3F) == 4;
    objc_msgSend(v40, "numberWithBool:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsIDSActivityMonitorPresence:](v13, "setSupportsIDSActivityMonitorPresence:", v44);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsCameraActivityZones(v8));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsCameraRecordingReachabilityNotifications:](v13, "setSupportsCameraRecordingReachabilityNotifications:", v45);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsAnnounce(v8));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsAnnounce:](v13, "setSupportsAnnounce:", v46);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsAudioAnalysis(v8, v9));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsAudioAnalysis:](v13, "setSupportsAudioAnalysis:", v47);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsDropIn(v8, v9));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsDropIn:](v13, "setSupportsDropIn:", v48);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsThirdPartyMusic(v8));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsThirdPartyMusic:](v13, "setSupportsThirdPartyMusic:", v49);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsPreferredMediaUser(v8));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsPreferredMediaUser:](v13, "setSupportsPreferredMediaUser:", v50);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsThreadBorderRouter:](v13, "setSupportsThreadBorderRouter:", v51);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsThirdPartyMusic(v8));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsDoorbellChime:](v13, "setSupportsDoorbellChime:", v52);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsUserMediaSettings(v8));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsUserMediaSettings:](v13, "setSupportsUserMediaSettings:", v53);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsCoordinationDoorbellChime(v8));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsCoordinationDoorbellChime:](v13, "setSupportsCoordinationDoorbellChime:", v54);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsCoordinationFreeDoorbellChime(v8));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsCoordinationFreeDoorbellChime:](v13, "setSupportsCoordinationFreeDoorbellChime:", v55);

    v56 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v8, "productClass");
    objc_msgSend(v56, "numberWithBool:", 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsTVOSUpdateManualUpdateAvailableNotification:](v13, "setSupportsTVOSUpdateManualUpdateAvailableNotification:", v57);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsSiriEndpointSetup(v8));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsSiriEndpointSetup:](v13, "setSupportsSiriEndpointSetup:", v58);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsHomeHub(v8, v9));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsHomeHub:](v13, "setSupportsHomeHub:", v59);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsWakeOnLAN(v8));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsWakeOnLAN:](v13, "setSupportsWakeOnLAN:", v60);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsLockNotificationContext(v8));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsLockNotificationContext:](v13, "setSupportsLockNotificationContext:", v61);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsAudioReturnChannel(v8, v9));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsAudioReturnChannel:](v13, "setSupportsAudioReturnChannel:", v62);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsLockNotificationContext(v8));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsWalletKey:](v13, "setSupportsWalletKey:", v63);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsLockNotificationContext(v8));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsCameraPackageDetection:](v13, "setSupportsCameraPackageDetection:", v64);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsLockNotificationContext(v8));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsAccessCodes:](v13, "setSupportsAccessCodes:", v65);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsLockNotificationContext(v8));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsCHIP:](v13, "setSupportsCHIP:", v66);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsUnifiedMediaNotifications(v8));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsUnifiedMediaNotifications:](v13, "setSupportsUnifiedMediaNotifications:", v67);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsUserMediaSettings(v8));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsManagedConfigurationProfile:](v13, "setSupportsManagedConfigurationProfile:", v68);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsCaptiveNetworks(v8));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsCaptiveNetworks:](v13, "setSupportsCaptiveNetworks:", v69);

    -[HMDDeviceCapabilitiesModel setSupportsModernTransport:](v13, "setSupportsModernTransport:", MEMORY[0x24BDBD1C0]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsResidentFirstAccessoryCommunication(v8));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsResidentFirstAccessoryCommunication:](v13, "setSupportsResidentFirstAccessoryCommunication:", v70);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsMessagedHomePodSettings(v8, v10));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsMessagedHomePodSettings:](v13, "setSupportsMessagedHomePodSettings:", v71);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsCustomMediaApplicationDestination(v8));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsCustomMediaApplicationDestination:](v13, "setSupportsCustomMediaApplicationDestination:", v72);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsThreadNetworkCredentialSharing(v8, v9, v10));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsThreadNetworkCredentialSharing:](v13, "setSupportsThreadNetworkCredentialSharing:", v73);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsMatterSharedAdminPairing(v8, v9, v10));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsMatterSharedAdminPairing:](v13, "setSupportsMatterSharedAdminPairing:", v74);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsRMVonAppleTV(v8));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsRMVonAppleTV:](v13, "setSupportsRMVonAppleTV:", v75);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsJustSiri(v8));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsJustSiri:](v13, "setSupportsJustSiri:", v76);

    v77 = (void *)MEMORY[0x24BDD16E0];
    v94 = 0;
    memset(buf, 0, sizeof(buf));
    v78 = v8;
    objc_msgSend(v78, "softwareVersion");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v79;
    if (v79)
    {
      objc_msgSend(v79, "operatingSystemVersion");
    }
    else
    {
      memset(buf, 0, sizeof(buf));
      v94 = 0;
    }

    v85 = objc_msgSend(v78, "productPlatform");
    v86 = objc_msgSend(v78, "productClass");

    if (v85 == 1)
    {
      v91 = *(_OWORD *)buf;
      v92 = v94;
      if (HMFOperatingSystemVersionCompare() != 1
        && (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled() & 1) != 0)
      {
        goto LABEL_22;
      }
    }
    v87 = 0;
    if (v86 > 0xA || ((1 << v86) & 0x78A) == 0)
      goto LABEL_24;
    if (v85 == 2
      && (v91 = *(_OWORD *)buf, v92 = v94, HMFOperatingSystemVersionCompare() != 1)
      && isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled())
    {
LABEL_22:
      v87 = MGGetBoolAnswer();
    }
    else
    {
      v87 = 0;
    }
LABEL_24:
    objc_msgSend(v77, "numberWithBool:", v87, v91, v92);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsThreadService:](v13, "setSupportsThreadService:", v88);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", productSupportsMatterOwnerCertFetch(v78, v9, v10));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceCapabilitiesModel setSupportsMatterOwnerCertFetch:](v13, "setSupportsMatterOwnerCertFetch:", v89);

    self = -[HMDDeviceCapabilities initWithObjectModel:](self, "initWithObjectModel:", v13);
    v84 = self;
    goto LABEL_25;
  }
  v81 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v82 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v83;
    _os_log_impl(&dword_2218F0000, v82, OS_LOG_TYPE_ERROR, "%{public}@Product info is a required argument", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v81);
  v84 = 0;
LABEL_25:

  return v84;
}

- (HMDDeviceCapabilities)initWithObjectModel:(id)a3
{
  id v5;
  HMDDeviceCapabilities *v6;
  HMDDeviceCapabilities *v7;
  HMDDeviceCapabilities *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    v13.receiver = self;
    v13.super_class = (Class)HMDDeviceCapabilities;
    v6 = -[HMDDeviceCapabilities init](&v13, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_objectModel, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Model object is a required argument", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  -[HMDDeviceCapabilities supportsKeychainSync](self, "supportsKeychainSync");
  -[HMDDeviceCapabilities supportsDeviceSetup](self, "supportsDeviceSetup");
  -[HMDDeviceCapabilities supportsKeyTransferClient](self, "supportsKeyTransferClient");
  -[HMDDeviceCapabilities supportsKeyTransferServer](self, "supportsKeyTransferServer");
  -[HMDDeviceCapabilities supportsStandaloneMode](self, "supportsStandaloneMode");
  -[HMDDeviceCapabilities supportsCloudDataSync](self, "supportsCloudDataSync");
  -[HMDDeviceCapabilities supportsWholeHouseAudio](self, "supportsWholeHouseAudio");
  -[HMDDeviceCapabilities supportsAssistantAccessControl](self, "supportsAssistantAccessControl");
  -[HMDDeviceCapabilities isResidentCapable](self, "isResidentCapable");
  -[HMDDeviceCapabilities isRemoteGatewayCapable](self, "isRemoteGatewayCapable");
  -[HMDDeviceCapabilities supportsHomeInvitation](self, "supportsHomeInvitation");
  -[HMDDeviceCapabilities supportsTargetControl](self, "supportsTargetControl");
  -[HMDDeviceCapabilities supportsMultiUser](self, "supportsMultiUser");
  -[HMDDeviceCapabilities supportsHomeLevelLocationServiceSetting](self, "supportsHomeLevelLocationServiceSetting");
  -[HMDDeviceCapabilities supportsCompanionInitiatedRestart](self, "supportsCompanionInitiatedRestart");
  -[HMDDeviceCapabilities supportsCompanionInitiatedObliterate](self, "supportsCompanionInitiatedObliterate");
  -[HMDDeviceCapabilities supportsCameraRecording](self, "supportsCameraRecording");
  -[HMDDeviceCapabilities supportsRouterManagement](self, "supportsRouterManagement");
  -[HMDDeviceCapabilities supportsShortcutActions](self, "supportsShortcutActions");
  -[HMDDeviceCapabilities supportsMediaActions](self, "supportsMediaActions");
  -[HMDDeviceCapabilities supportsFirmwareUpdate](self, "supportsFirmwareUpdate");
  -[HMDDeviceCapabilities supportsResidentFirmwareUpdate](self, "supportsResidentFirmwareUpdate");
  -[HMDDeviceCapabilities supportsCameraActivityZones](self, "supportsCameraActivityZones");
  -[HMDDeviceCapabilities supportsMusicAlarm](self, "supportsMusicAlarm");
  -[HMDDeviceCapabilities supportsFaceClassification](self, "supportsFaceClassification");
  -[HMDDeviceCapabilities supportsNaturalLighting](self, "supportsNaturalLighting");
  -[HMDDeviceCapabilities supportsIDSActivityMonitorPresence](self, "supportsIDSActivityMonitorPresence");
  -[HMDDeviceCapabilities supportsCameraRecordingReachabilityNotifications](self, "supportsCameraRecordingReachabilityNotifications");
  -[HMDDeviceCapabilities supportsAnnounce](self, "supportsAnnounce");
  -[HMDDeviceCapabilities supportsAudioAnalysis](self, "supportsAudioAnalysis");
  -[HMDDeviceCapabilities supportsDropIn](self, "supportsDropIn");
  -[HMDDeviceCapabilities supportsDoorbellChime](self, "supportsDoorbellChime");
  -[HMDDeviceCapabilities supportsThirdPartyMusic](self, "supportsThirdPartyMusic");
  -[HMDDeviceCapabilities supportsThreadBorderRouter](self, "supportsThreadBorderRouter");
  -[HMDDeviceCapabilities supportsPreferredMediaUser](self, "supportsPreferredMediaUser");
  -[HMDDeviceCapabilities supportsSiriEndpointSetup](self, "supportsSiriEndpointSetup");
  -[HMDDeviceCapabilities supportsHomeHub](self, "supportsHomeHub");
  -[HMDDeviceCapabilities supportsWakeOnLAN](self, "supportsWakeOnLAN");
  -[HMDDeviceCapabilities supportsLockNotificationContext](self, "supportsLockNotificationContext");
  -[HMDDeviceCapabilities supportsCoordinationDoorbellChime](self, "supportsCoordinationDoorbellChime");
  -[HMDDeviceCapabilities supportsCoordinationFreeDoorbellChime](self, "supportsCoordinationFreeDoorbellChime");
  -[HMDDeviceCapabilities supportsTVOSUpdateManualUpdateAvailableNotification](self, "supportsTVOSUpdateManualUpdateAvailableNotification");
  -[HMDDeviceCapabilities supportsAudioReturnChannel](self, "supportsAudioReturnChannel");
  -[HMDDeviceCapabilities supportsWalletKey](self, "supportsWalletKey");
  -[HMDDeviceCapabilities supportsCameraPackageDetection](self, "supportsCameraPackageDetection");
  -[HMDDeviceCapabilities supportsAccessCodes](self, "supportsAccessCodes");
  -[HMDDeviceCapabilities supportsCHIP](self, "supportsCHIP");
  -[HMDDeviceCapabilities supportsUnifiedMediaNotifications](self, "supportsUnifiedMediaNotifications");
  -[HMDDeviceCapabilities supportsManagedConfigurationProfile](self, "supportsManagedConfigurationProfile");
  -[HMDDeviceCapabilities supportsUserMediaSettings](self, "supportsUserMediaSettings");
  -[HMDDeviceCapabilities supportsCaptiveNetworks](self, "supportsCaptiveNetworks");
  -[HMDDeviceCapabilities supportsModernTransport](self, "supportsModernTransport");
  -[HMDDeviceCapabilities supportsResidentFirstAccessoryCommunication](self, "supportsResidentFirstAccessoryCommunication");
  -[HMDDeviceCapabilities supportsMessagedHomePodSettings](self, "supportsMessagedHomePodSettings");
  -[HMDDeviceCapabilities supportsCustomMediaApplicationDestination](self, "supportsCustomMediaApplicationDestination");
  -[HMDDeviceCapabilities supportsThreadNetworkCredentialSharing](self, "supportsThreadNetworkCredentialSharing");
  -[HMDDeviceCapabilities supportsMatterSharedAdminPairing](self, "supportsMatterSharedAdminPairing");
  -[HMDDeviceCapabilities supportsRMVonAppleTV](self, "supportsRMVonAppleTV");
  -[HMDDeviceCapabilities supportsJustSiri](self, "supportsJustSiri");
  -[HMDDeviceCapabilities supportsThreadService](self, "supportsThreadService");
  return -[HMDDeviceCapabilities supportsMatterOwnerCertFetch](self, "supportsMatterOwnerCertFetch");
}

- (BOOL)isEqual:(id)a3
{
  HMDDeviceCapabilities *v4;
  HMDDeviceCapabilities *v5;
  HMDDeviceCapabilities *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  _BOOL4 v21;
  _BOOL4 v22;
  _BOOL4 v23;
  _BOOL4 v24;
  _BOOL4 v25;
  _BOOL4 v26;
  _BOOL4 v27;
  _BOOL4 v28;
  _BOOL4 v29;
  _BOOL4 v30;
  _BOOL4 v31;
  _BOOL4 v32;
  _BOOL4 v33;
  _BOOL4 v34;
  _BOOL4 v35;
  _BOOL4 v36;
  _BOOL4 v37;
  _BOOL4 v38;
  _BOOL4 v39;
  _BOOL4 v40;
  _BOOL4 v41;
  _BOOL4 v42;
  _BOOL4 v43;
  _BOOL4 v44;
  _BOOL4 v45;
  _BOOL4 v46;
  _BOOL4 v47;
  _BOOL4 v48;
  _BOOL4 v49;
  _BOOL4 v50;
  _BOOL4 v51;
  _BOOL4 v52;
  _BOOL4 v53;
  _BOOL4 v54;
  _BOOL4 v55;
  _BOOL4 v56;
  _BOOL4 v57;
  _BOOL4 v58;
  _BOOL4 v59;
  _BOOL4 v60;
  _BOOL4 v61;
  _BOOL4 v62;
  _BOOL4 v63;
  _BOOL4 v64;
  _BOOL4 v65;
  _BOOL4 v67;

  v4 = (HMDDeviceCapabilities *)a3;
  if (v4 == self)
  {
    LOBYTE(v65) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (!v6)
      goto LABEL_64;
    v7 = -[HMDDeviceCapabilities supportsKeychainSync](self, "supportsKeychainSync");
    if (v7 != -[HMDDeviceCapabilities supportsKeychainSync](v6, "supportsKeychainSync"))
      goto LABEL_64;
    v8 = -[HMDDeviceCapabilities supportsDeviceSetup](self, "supportsDeviceSetup");
    if (v8 != -[HMDDeviceCapabilities supportsDeviceSetup](v6, "supportsDeviceSetup"))
      goto LABEL_64;
    v9 = -[HMDDeviceCapabilities supportsKeyTransferClient](self, "supportsKeyTransferClient");
    if (v9 != -[HMDDeviceCapabilities supportsKeyTransferClient](v6, "supportsKeyTransferClient"))
      goto LABEL_64;
    v10 = -[HMDDeviceCapabilities supportsKeyTransferServer](self, "supportsKeyTransferServer");
    if (v10 != -[HMDDeviceCapabilities supportsKeyTransferServer](v6, "supportsKeyTransferServer"))
      goto LABEL_64;
    v11 = -[HMDDeviceCapabilities supportsStandaloneMode](self, "supportsStandaloneMode");
    if (v11 != -[HMDDeviceCapabilities supportsStandaloneMode](v6, "supportsStandaloneMode"))
      goto LABEL_64;
    v12 = -[HMDDeviceCapabilities supportsCloudDataSync](self, "supportsCloudDataSync");
    if (v12 != -[HMDDeviceCapabilities supportsCloudDataSync](v6, "supportsCloudDataSync"))
      goto LABEL_64;
    v13 = -[HMDDeviceCapabilities supportsWholeHouseAudio](self, "supportsWholeHouseAudio");
    if (v13 != -[HMDDeviceCapabilities supportsWholeHouseAudio](v6, "supportsWholeHouseAudio"))
      goto LABEL_64;
    v14 = -[HMDDeviceCapabilities supportsAssistantAccessControl](self, "supportsAssistantAccessControl");
    if (v14 != -[HMDDeviceCapabilities supportsAssistantAccessControl](v6, "supportsAssistantAccessControl"))
      goto LABEL_64;
    v15 = -[HMDDeviceCapabilities isResidentCapable](self, "isResidentCapable");
    if (v15 != -[HMDDeviceCapabilities isResidentCapable](v6, "isResidentCapable"))
      goto LABEL_64;
    v16 = -[HMDDeviceCapabilities isRemoteGatewayCapable](self, "isRemoteGatewayCapable");
    if (v16 != -[HMDDeviceCapabilities isRemoteGatewayCapable](v6, "isRemoteGatewayCapable"))
      goto LABEL_64;
    v17 = -[HMDDeviceCapabilities supportsHomeInvitation](self, "supportsHomeInvitation");
    if (v17 != -[HMDDeviceCapabilities supportsHomeInvitation](v6, "supportsHomeInvitation"))
      goto LABEL_64;
    v18 = -[HMDDeviceCapabilities supportsTargetControl](self, "supportsTargetControl");
    if (v18 != -[HMDDeviceCapabilities supportsTargetControl](v6, "supportsTargetControl"))
      goto LABEL_64;
    v19 = -[HMDDeviceCapabilities supportsMultiUser](self, "supportsMultiUser");
    if (v19 != -[HMDDeviceCapabilities supportsMultiUser](v6, "supportsMultiUser"))
      goto LABEL_64;
    v20 = -[HMDDeviceCapabilities supportsHomeLevelLocationServiceSetting](self, "supportsHomeLevelLocationServiceSetting");
    if (v20 != -[HMDDeviceCapabilities supportsHomeLevelLocationServiceSetting](v6, "supportsHomeLevelLocationServiceSetting"))goto LABEL_64;
    v21 = -[HMDDeviceCapabilities supportsCompanionInitiatedRestart](self, "supportsCompanionInitiatedRestart");
    if (v21 != -[HMDDeviceCapabilities supportsCompanionInitiatedRestart](v6, "supportsCompanionInitiatedRestart"))
      goto LABEL_64;
    v22 = -[HMDDeviceCapabilities supportsCompanionInitiatedObliterate](self, "supportsCompanionInitiatedObliterate");
    if (v22 != -[HMDDeviceCapabilities supportsCompanionInitiatedObliterate](v6, "supportsCompanionInitiatedObliterate"))goto LABEL_64;
    v23 = -[HMDDeviceCapabilities supportsCameraRecording](self, "supportsCameraRecording");
    if (v23 != -[HMDDeviceCapabilities supportsCameraRecording](v6, "supportsCameraRecording"))
      goto LABEL_64;
    v24 = -[HMDDeviceCapabilities supportsRouterManagement](self, "supportsRouterManagement");
    if (v24 != -[HMDDeviceCapabilities supportsRouterManagement](v6, "supportsRouterManagement"))
      goto LABEL_64;
    v25 = -[HMDDeviceCapabilities supportsShortcutActions](self, "supportsShortcutActions");
    if (v25 != -[HMDDeviceCapabilities supportsShortcutActions](v6, "supportsShortcutActions"))
      goto LABEL_64;
    v26 = -[HMDDeviceCapabilities supportsMediaActions](self, "supportsMediaActions");
    if (v26 != -[HMDDeviceCapabilities supportsMediaActions](v6, "supportsMediaActions"))
      goto LABEL_64;
    v27 = -[HMDDeviceCapabilities supportsMusicAlarm](self, "supportsMusicAlarm");
    if (v27 != -[HMDDeviceCapabilities supportsMusicAlarm](v6, "supportsMusicAlarm"))
      goto LABEL_64;
    v28 = -[HMDDeviceCapabilities supportsFirmwareUpdate](self, "supportsFirmwareUpdate");
    if (v28 != -[HMDDeviceCapabilities supportsFirmwareUpdate](v6, "supportsFirmwareUpdate"))
      goto LABEL_64;
    v29 = -[HMDDeviceCapabilities supportsResidentFirmwareUpdate](self, "supportsResidentFirmwareUpdate");
    if (v29 != -[HMDDeviceCapabilities supportsResidentFirmwareUpdate](v6, "supportsResidentFirmwareUpdate"))
      goto LABEL_64;
    v30 = -[HMDDeviceCapabilities supportsCameraActivityZones](self, "supportsCameraActivityZones");
    if (v30 != -[HMDDeviceCapabilities supportsCameraActivityZones](v6, "supportsCameraActivityZones"))
      goto LABEL_64;
    v31 = -[HMDDeviceCapabilities supportsFaceClassification](self, "supportsFaceClassification");
    if (v31 != -[HMDDeviceCapabilities supportsFaceClassification](v6, "supportsFaceClassification"))
      goto LABEL_64;
    v32 = -[HMDDeviceCapabilities supportsNaturalLighting](self, "supportsNaturalLighting");
    if (v32 != -[HMDDeviceCapabilities supportsNaturalLighting](v6, "supportsNaturalLighting"))
      goto LABEL_64;
    v33 = -[HMDDeviceCapabilities supportsIDSActivityMonitorPresence](self, "supportsIDSActivityMonitorPresence");
    if (v33 != -[HMDDeviceCapabilities supportsIDSActivityMonitorPresence](v6, "supportsIDSActivityMonitorPresence"))
      goto LABEL_64;
    v34 = -[HMDDeviceCapabilities supportsCameraRecordingReachabilityNotifications](self, "supportsCameraRecordingReachabilityNotifications");
    if (v34 != -[HMDDeviceCapabilities supportsCameraRecordingReachabilityNotifications](v6, "supportsCameraRecordingReachabilityNotifications"))goto LABEL_64;
    v35 = -[HMDDeviceCapabilities supportsAnnounce](self, "supportsAnnounce");
    if (v35 != -[HMDDeviceCapabilities supportsAnnounce](v6, "supportsAnnounce"))
      goto LABEL_64;
    v36 = -[HMDDeviceCapabilities supportsAudioAnalysis](self, "supportsAudioAnalysis");
    if (v36 != -[HMDDeviceCapabilities supportsAudioAnalysis](v6, "supportsAudioAnalysis"))
      goto LABEL_64;
    v37 = -[HMDDeviceCapabilities supportsDropIn](self, "supportsDropIn");
    if (v37 != -[HMDDeviceCapabilities supportsDropIn](v6, "supportsDropIn"))
      goto LABEL_64;
    v38 = -[HMDDeviceCapabilities supportsThirdPartyMusic](self, "supportsThirdPartyMusic");
    if (v38 != -[HMDDeviceCapabilities supportsThirdPartyMusic](v6, "supportsThirdPartyMusic"))
      goto LABEL_64;
    v39 = -[HMDDeviceCapabilities supportsPreferredMediaUser](self, "supportsPreferredMediaUser");
    if (v39 != -[HMDDeviceCapabilities supportsPreferredMediaUser](v6, "supportsPreferredMediaUser"))
      goto LABEL_64;
    v40 = -[HMDDeviceCapabilities supportsThreadBorderRouter](self, "supportsThreadBorderRouter");
    if (v40 != -[HMDDeviceCapabilities supportsThreadBorderRouter](v6, "supportsThreadBorderRouter"))
      goto LABEL_64;
    v41 = -[HMDDeviceCapabilities supportsSiriEndpointSetup](self, "supportsSiriEndpointSetup");
    if (v41 != -[HMDDeviceCapabilities supportsSiriEndpointSetup](v6, "supportsSiriEndpointSetup"))
      goto LABEL_64;
    v42 = -[HMDDeviceCapabilities supportsHomeHub](self, "supportsHomeHub");
    if (v42 != -[HMDDeviceCapabilities supportsHomeHub](v6, "supportsHomeHub"))
      goto LABEL_64;
    v43 = -[HMDDeviceCapabilities supportsWakeOnLAN](self, "supportsWakeOnLAN");
    if (v43 != -[HMDDeviceCapabilities supportsWakeOnLAN](v6, "supportsWakeOnLAN"))
      goto LABEL_64;
    v44 = -[HMDDeviceCapabilities supportsLockNotificationContext](self, "supportsLockNotificationContext");
    if (v44 != -[HMDDeviceCapabilities supportsLockNotificationContext](v6, "supportsLockNotificationContext"))
      goto LABEL_64;
    v45 = -[HMDDeviceCapabilities supportsCoordinationDoorbellChime](self, "supportsCoordinationDoorbellChime");
    if (v45 != -[HMDDeviceCapabilities supportsCoordinationDoorbellChime](v6, "supportsCoordinationDoorbellChime"))
      goto LABEL_64;
    v46 = -[HMDDeviceCapabilities supportsCoordinationFreeDoorbellChime](self, "supportsCoordinationFreeDoorbellChime");
    if (v46 != -[HMDDeviceCapabilities supportsCoordinationFreeDoorbellChime](v6, "supportsCoordinationFreeDoorbellChime"))goto LABEL_64;
    v47 = -[HMDDeviceCapabilities supportsTVOSUpdateManualUpdateAvailableNotification](self, "supportsTVOSUpdateManualUpdateAvailableNotification");
    if (v47 != -[HMDDeviceCapabilities supportsTVOSUpdateManualUpdateAvailableNotification](v6, "supportsTVOSUpdateManualUpdateAvailableNotification"))goto LABEL_64;
    v48 = -[HMDDeviceCapabilities supportsManagedConfigurationProfile](self, "supportsManagedConfigurationProfile");
    if (v48 != -[HMDDeviceCapabilities supportsManagedConfigurationProfile](v6, "supportsManagedConfigurationProfile"))
      goto LABEL_64;
    v49 = -[HMDDeviceCapabilities supportsAudioReturnChannel](self, "supportsAudioReturnChannel");
    if (v49 != -[HMDDeviceCapabilities supportsAudioReturnChannel](v6, "supportsAudioReturnChannel"))
      goto LABEL_64;
    v50 = -[HMDDeviceCapabilities supportsWalletKey](self, "supportsWalletKey");
    if (v50 != -[HMDDeviceCapabilities supportsWalletKey](v6, "supportsWalletKey"))
      goto LABEL_64;
    v51 = -[HMDDeviceCapabilities supportsCameraPackageDetection](self, "supportsCameraPackageDetection");
    if (v51 != -[HMDDeviceCapabilities supportsCameraPackageDetection](v6, "supportsCameraPackageDetection"))
      goto LABEL_64;
    v52 = -[HMDDeviceCapabilities supportsAccessCodes](self, "supportsAccessCodes");
    if (v52 != -[HMDDeviceCapabilities supportsAccessCodes](v6, "supportsAccessCodes"))
      goto LABEL_64;
    v53 = -[HMDDeviceCapabilities supportsCHIP](self, "supportsCHIP");
    if (v53 != -[HMDDeviceCapabilities supportsCHIP](v6, "supportsCHIP"))
      goto LABEL_64;
    v54 = -[HMDDeviceCapabilities supportsUnifiedMediaNotifications](self, "supportsUnifiedMediaNotifications");
    if (v54 != -[HMDDeviceCapabilities supportsUnifiedMediaNotifications](v6, "supportsUnifiedMediaNotifications"))
      goto LABEL_64;
    v55 = -[HMDDeviceCapabilities supportsCaptiveNetworks](self, "supportsCaptiveNetworks");
    if (v55 != -[HMDDeviceCapabilities supportsCaptiveNetworks](v6, "supportsCaptiveNetworks"))
      goto LABEL_64;
    v56 = -[HMDDeviceCapabilities supportsModernTransport](self, "supportsModernTransport");
    if (v56 != -[HMDDeviceCapabilities supportsModernTransport](v6, "supportsModernTransport"))
      goto LABEL_64;
    v57 = -[HMDDeviceCapabilities supportsResidentFirstAccessoryCommunication](self, "supportsResidentFirstAccessoryCommunication");
    if (v57 != -[HMDDeviceCapabilities supportsResidentFirstAccessoryCommunication](v6, "supportsResidentFirstAccessoryCommunication"))goto LABEL_64;
    v58 = -[HMDDeviceCapabilities supportsMessagedHomePodSettings](self, "supportsMessagedHomePodSettings");
    if (v58 == -[HMDDeviceCapabilities supportsMessagedHomePodSettings](v6, "supportsMessagedHomePodSettings")
      && (v59 = -[HMDDeviceCapabilities supportsCustomMediaApplicationDestination](self, "supportsCustomMediaApplicationDestination"), v59 == -[HMDDeviceCapabilities supportsCustomMediaApplicationDestination](v6, "supportsCustomMediaApplicationDestination"))&& (v60 = -[HMDDeviceCapabilities supportsThreadNetworkCredentialSharing](self, "supportsThreadNetworkCredentialSharing"), v60 == -[HMDDeviceCapabilities supportsThreadNetworkCredentialSharing](v6, "supportsThreadNetworkCredentialSharing"))&& (v61 = -[HMDDeviceCapabilities supportsMatterSharedAdminPairing](self, "supportsMatterSharedAdminPairing"), v61 == -[HMDDeviceCapabilities supportsMatterSharedAdminPairing](v6, "supportsMatterSharedAdminPairing"))&& (v62 = -[HMDDeviceCapabilities supportsRMVonAppleTV](self, "supportsRMVonAppleTV"), v62 == -[HMDDeviceCapabilities supportsRMVonAppleTV](v6, "supportsRMVonAppleTV"))&& (v63 = -[HMDDeviceCapabilities supportsJustSiri](self, "supportsJustSiri"), v63 == -[HMDDeviceCapabilities supportsJustSiri](v6, "supportsJustSiri"))&& (v64 = -[HMDDeviceCapabilities supportsThreadService](self, "supportsThreadService"), v64 == -[HMDDeviceCapabilities supportsThreadService](v6, "supportsThreadService")))
    {
      v67 = -[HMDDeviceCapabilities supportsMatterOwnerCertFetch](self, "supportsMatterOwnerCertFetch");
      v65 = v67 ^ -[HMDDeviceCapabilities supportsMatterOwnerCertFetch](v6, "supportsMatterOwnerCertFetch") ^ 1;
    }
    else
    {
LABEL_64:
      LOBYTE(v65) = 0;
    }

  }
  return v65;
}

- (id)shortDescription
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDDeviceCapabilities supportsKeychainSync](self, "supportsKeychainSync"))
    objc_msgSend(v3, "addObject:", CFSTR("KCS"));
  if (-[HMDDeviceCapabilities supportsDeviceSetup](self, "supportsDeviceSetup"))
    objc_msgSend(v3, "addObject:", CFSTR("DS"));
  if (-[HMDDeviceCapabilities supportsKeyTransferClient](self, "supportsKeyTransferClient"))
    objc_msgSend(v3, "addObject:", CFSTR("KTC"));
  if (-[HMDDeviceCapabilities supportsKeyTransferServer](self, "supportsKeyTransferServer"))
    objc_msgSend(v3, "addObject:", CFSTR("KTS"));
  if (-[HMDDeviceCapabilities supportsStandaloneMode](self, "supportsStandaloneMode"))
    objc_msgSend(v3, "addObject:", CFSTR("SAM"));
  if (-[HMDDeviceCapabilities supportsCloudDataSync](self, "supportsCloudDataSync"))
    objc_msgSend(v3, "addObject:", CFSTR("CS"));
  if (-[HMDDeviceCapabilities supportsWholeHouseAudio](self, "supportsWholeHouseAudio"))
    objc_msgSend(v3, "addObject:", CFSTR("WHA"));
  if (-[HMDDeviceCapabilities supportsAssistantAccessControl](self, "supportsAssistantAccessControl"))
    objc_msgSend(v3, "addObject:", CFSTR("AAC"));
  if (-[HMDDeviceCapabilities isResidentCapable](self, "isResidentCapable"))
    objc_msgSend(v3, "addObject:", CFSTR("RC"));
  if (-[HMDDeviceCapabilities isRemoteGatewayCapable](self, "isRemoteGatewayCapable"))
    objc_msgSend(v3, "addObject:", CFSTR("RGC"));
  if (-[HMDDeviceCapabilities supportsHomeInvitation](self, "supportsHomeInvitation"))
    objc_msgSend(v3, "addObject:", CFSTR("HI"));
  if (-[HMDDeviceCapabilities supportsTargetControl](self, "supportsTargetControl"))
    objc_msgSend(v3, "addObject:", CFSTR("TC"));
  if (-[HMDDeviceCapabilities supportsMultiUser](self, "supportsMultiUser"))
    objc_msgSend(v3, "addObject:", CFSTR("MU"));
  if (-[HMDDeviceCapabilities supportsHomeLevelLocationServiceSetting](self, "supportsHomeLevelLocationServiceSetting"))
    objc_msgSend(v3, "addObject:", CFSTR("HLLS"));
  if (-[HMDDeviceCapabilities supportsCompanionInitiatedRestart](self, "supportsCompanionInitiatedRestart"))
    objc_msgSend(v3, "addObject:", CFSTR("CIR"));
  if (-[HMDDeviceCapabilities supportsCompanionInitiatedObliterate](self, "supportsCompanionInitiatedObliterate"))
    objc_msgSend(v3, "addObject:", CFSTR("CIFR"));
  if (-[HMDDeviceCapabilities supportsCameraRecording](self, "supportsCameraRecording"))
    objc_msgSend(v3, "addObject:", CFSTR("CR"));
  if (-[HMDDeviceCapabilities supportsRouterManagement](self, "supportsRouterManagement"))
    objc_msgSend(v3, "addObject:", CFSTR("RM"));
  if (-[HMDDeviceCapabilities supportsShortcutActions](self, "supportsShortcutActions"))
    objc_msgSend(v3, "addObject:", CFSTR("SA"));
  if (-[HMDDeviceCapabilities supportsMediaActions](self, "supportsMediaActions"))
    objc_msgSend(v3, "addObject:", CFSTR("MAS"));
  if (-[HMDDeviceCapabilities supportsMusicAlarm](self, "supportsMusicAlarm"))
    objc_msgSend(v3, "addObject:", CFSTR("MA"));
  if (-[HMDDeviceCapabilities supportsFirmwareUpdate](self, "supportsFirmwareUpdate"))
    objc_msgSend(v3, "addObject:", CFSTR("AFU"));
  if (-[HMDDeviceCapabilities supportsResidentFirmwareUpdate](self, "supportsResidentFirmwareUpdate"))
    objc_msgSend(v3, "addObject:", CFSTR("RAFU"));
  if (-[HMDDeviceCapabilities supportsCameraActivityZones](self, "supportsCameraActivityZones"))
    objc_msgSend(v3, "addObject:", CFSTR("CAZ"));
  if (-[HMDDeviceCapabilities supportsFaceClassification](self, "supportsFaceClassification"))
    objc_msgSend(v3, "addObject:", CFSTR("FC"));
  if (-[HMDDeviceCapabilities supportsNaturalLighting](self, "supportsNaturalLighting"))
    objc_msgSend(v3, "addObject:", CFSTR("NL"));
  if (-[HMDDeviceCapabilities supportsIDSActivityMonitorPresence](self, "supportsIDSActivityMonitorPresence"))
    objc_msgSend(v3, "addObject:", CFSTR("IAMP"));
  if (-[HMDDeviceCapabilities supportsCameraRecordingReachabilityNotifications](self, "supportsCameraRecordingReachabilityNotifications"))
  {
    objc_msgSend(v3, "addObject:", CFSTR("CRRN"));
  }
  if (-[HMDDeviceCapabilities supportsAnnounce](self, "supportsAnnounce"))
    objc_msgSend(v3, "addObject:", CFSTR("AN"));
  if (-[HMDDeviceCapabilities supportsAudioAnalysis](self, "supportsAudioAnalysis"))
    objc_msgSend(v3, "addObject:", CFSTR("SAN"));
  if (-[HMDDeviceCapabilities supportsDropIn](self, "supportsDropIn"))
    objc_msgSend(v3, "addObject:", CFSTR("DIN"));
  if (-[HMDDeviceCapabilities supportsThirdPartyMusic](self, "supportsThirdPartyMusic"))
    objc_msgSend(v3, "addObject:", CFSTR("BLT"));
  if (-[HMDDeviceCapabilities supportsPreferredMediaUser](self, "supportsPreferredMediaUser"))
    objc_msgSend(v3, "addObject:", CFSTR("PMU"));
  if (-[HMDDeviceCapabilities supportsThreadBorderRouter](self, "supportsThreadBorderRouter"))
    objc_msgSend(v3, "addObject:", CFSTR("TDR"));
  if (-[HMDDeviceCapabilities supportsSiriEndpointSetup](self, "supportsSiriEndpointSetup"))
    objc_msgSend(v3, "addObject:", CFSTR("SES"));
  if (-[HMDDeviceCapabilities supportsHomeHub](self, "supportsHomeHub"))
    objc_msgSend(v3, "addObject:", CFSTR("HH"));
  if (-[HMDDeviceCapabilities supportsWakeOnLAN](self, "supportsWakeOnLAN"))
    objc_msgSend(v3, "addObject:", CFSTR("WOL"));
  if (-[HMDDeviceCapabilities supportsLockNotificationContext](self, "supportsLockNotificationContext"))
    objc_msgSend(v3, "addObject:", CFSTR("LNC"));
  if (-[HMDDeviceCapabilities supportsCoordinationDoorbellChime](self, "supportsCoordinationDoorbellChime"))
    objc_msgSend(v3, "addObject:", CFSTR("CDC"));
  if (-[HMDDeviceCapabilities supportsCoordinationFreeDoorbellChime](self, "supportsCoordinationFreeDoorbellChime"))
    objc_msgSend(v3, "addObject:", CFSTR("CFDC"));
  if (-[HMDDeviceCapabilities supportsTVOSUpdateManualUpdateAvailableNotification](self, "supportsTVOSUpdateManualUpdateAvailableNotification"))
  {
    objc_msgSend(v3, "addObject:", CFSTR("TVMUN"));
  }
  if (-[HMDDeviceCapabilities supportsAudioReturnChannel](self, "supportsAudioReturnChannel"))
    objc_msgSend(v3, "addObject:", CFSTR("ARC"));
  if (-[HMDDeviceCapabilities supportsWalletKey](self, "supportsWalletKey"))
    objc_msgSend(v3, "addObject:", CFSTR("WK"));
  if (-[HMDDeviceCapabilities supportsAccessCodes](self, "supportsAccessCodes"))
    objc_msgSend(v3, "addObject:", CFSTR("AC"));
  if (-[HMDDeviceCapabilities supportsCameraPackageDetection](self, "supportsCameraPackageDetection"))
    objc_msgSend(v3, "addObject:", CFSTR("CPD"));
  if (-[HMDDeviceCapabilities supportsCHIP](self, "supportsCHIP"))
    objc_msgSend(v3, "addObject:", CFSTR("CHIP"));
  if (-[HMDDeviceCapabilities supportsUnifiedMediaNotifications](self, "supportsUnifiedMediaNotifications"))
    objc_msgSend(v3, "addObject:", CFSTR("UMN"));
  if (-[HMDDeviceCapabilities supportsManagedConfigurationProfile](self, "supportsManagedConfigurationProfile"))
    objc_msgSend(v3, "addObject:", CFSTR("MCP"));
  if (-[HMDDeviceCapabilities supportsUserMediaSettings](self, "supportsUserMediaSettings"))
    objc_msgSend(v3, "addObject:", CFSTR("UMS"));
  if (-[HMDDeviceCapabilities supportsCaptiveNetworks](self, "supportsCaptiveNetworks"))
    objc_msgSend(v3, "addObject:", CFSTR("CN"));
  if (-[HMDDeviceCapabilities supportsModernTransport](self, "supportsModernTransport"))
    objc_msgSend(v3, "addObject:", CFSTR("MT"));
  if (-[HMDDeviceCapabilities supportsResidentFirstAccessoryCommunication](self, "supportsResidentFirstAccessoryCommunication"))
  {
    objc_msgSend(v3, "addObject:", CFSTR("RFAC"));
  }
  if (-[HMDDeviceCapabilities supportsMessagedHomePodSettings](self, "supportsMessagedHomePodSettings"))
    objc_msgSend(v3, "addObject:", CFSTR("MHPS"));
  if (-[HMDDeviceCapabilities supportsCustomMediaApplicationDestination](self, "supportsCustomMediaApplicationDestination"))
  {
    objc_msgSend(v3, "addObject:", CFSTR("CMDA"));
  }
  if (-[HMDDeviceCapabilities supportsThreadNetworkCredentialSharing](self, "supportsThreadNetworkCredentialSharing"))
    objc_msgSend(v3, "addObject:", CFSTR("TNCS"));
  if (-[HMDDeviceCapabilities supportsMatterSharedAdminPairing](self, "supportsMatterSharedAdminPairing"))
    objc_msgSend(v3, "addObject:", CFSTR("MSAP"));
  if (-[HMDDeviceCapabilities supportsRMVonAppleTV](self, "supportsRMVonAppleTV"))
    objc_msgSend(v3, "addObject:", CFSTR("TVRMV"));
  if (-[HMDDeviceCapabilities supportsJustSiri](self, "supportsJustSiri"))
    objc_msgSend(v3, "addObject:", CFSTR("HSJS"));
  if (-[HMDDeviceCapabilities supportsThreadService](self, "supportsThreadService"))
    objc_msgSend(v3, "addObject:", CFSTR("THRDS"));
  if (-[HMDDeviceCapabilities supportsMatterOwnerCertFetch](self, "supportsMatterOwnerCertFetch"))
    objc_msgSend(v3, "addObject:", CFSTR("MOCF"));
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
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
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  _QWORD v167[56];

  v167[54] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsKeychainSync](self, "supportsKeychainSync");
  HMFBooleanToString();
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v165 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Keychain Sync"), v166);
  v167[0] = v165;
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsDeviceSetup](self, "supportsDeviceSetup");
  HMFBooleanToString();
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v163 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Device Setup"), v164);
  v167[1] = v163;
  v5 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsKeyTransferClient](self, "supportsKeyTransferClient");
  HMFBooleanToString();
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Key Transfer Client"), v162);
  v167[2] = v161;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsKeyTransferServer](self, "supportsKeyTransferServer");
  HMFBooleanToString();
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Key Transfer Server"), v160);
  v167[3] = v159;
  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsStandaloneMode](self, "supportsStandaloneMode");
  HMFBooleanToString();
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Standalone Mode"), v158);
  v167[4] = v157;
  v8 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsCloudDataSync](self, "supportsCloudDataSync");
  HMFBooleanToString();
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Cloud Data Sync"), v156);
  v167[5] = v155;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsWholeHouseAudio](self, "supportsWholeHouseAudio");
  HMFBooleanToString();
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v153 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Whole House Audio"), v154);
  v167[6] = v153;
  v10 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsAssistantAccessControl](self, "supportsAssistantAccessControl");
  HMFBooleanToString();
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("Assistant Access Control"), v152);
  v167[7] = v151;
  v11 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities isResidentCapable](self, "isResidentCapable");
  HMFBooleanToString();
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("Resident"), v150);
  v167[8] = v149;
  v12 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities isRemoteGatewayCapable](self, "isRemoteGatewayCapable");
  HMFBooleanToString();
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Remote Gateway"), v148);
  v167[9] = v147;
  v13 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsTargetControl](self, "supportsTargetControl");
  HMFBooleanToString();
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("Target Control"), v146);
  v167[10] = v145;
  v14 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsMultiUser](self, "supportsMultiUser");
  HMFBooleanToString();
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("Multi-User"), v144);
  v167[11] = v143;
  v15 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsHomeLevelLocationServiceSetting](self, "supportsHomeLevelLocationServiceSetting");
  HMFBooleanToString();
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("Home Level Location Services"), v142);
  v167[12] = v141;
  v16 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsCompanionInitiatedRestart](self, "supportsCompanionInitiatedRestart");
  HMFBooleanToString();
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = (void *)objc_msgSend(v16, "initWithName:value:", CFSTR("Restart"), v140);
  v167[13] = v139;
  v17 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsCompanionInitiatedObliterate](self, "supportsCompanionInitiatedObliterate");
  HMFBooleanToString();
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = (void *)objc_msgSend(v17, "initWithName:value:", CFSTR("Factory Reset"), v138);
  v167[14] = v137;
  v18 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsHomeInvitation](self, "supportsHomeInvitation");
  HMFBooleanToString();
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = (void *)objc_msgSend(v18, "initWithName:value:", CFSTR("Home Invitation"), v136);
  v167[15] = v135;
  v19 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsCameraRecording](self, "supportsCameraRecording");
  HMFBooleanToString();
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = (void *)objc_msgSend(v19, "initWithName:value:", CFSTR("Camera Recording"), v134);
  v167[16] = v133;
  v20 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsRouterManagement](self, "supportsRouterManagement");
  HMFBooleanToString();
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = (void *)objc_msgSend(v20, "initWithName:value:", CFSTR("Router Management"), v132);
  v167[17] = v131;
  v21 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsShortcutActions](self, "supportsShortcutActions");
  HMFBooleanToString();
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = (void *)objc_msgSend(v21, "initWithName:value:", CFSTR("Shortcut Actions"), v130);
  v167[18] = v129;
  v22 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsMediaActions](self, "supportsMediaActions");
  HMFBooleanToString();
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = (void *)objc_msgSend(v22, "initWithName:value:", CFSTR("Media Actions"), v128);
  v167[19] = v127;
  v23 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsFirmwareUpdate](self, "supportsFirmwareUpdate");
  HMFBooleanToString();
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = (void *)objc_msgSend(v23, "initWithName:value:", CFSTR("Firmware Update"), v126);
  v167[20] = v125;
  v24 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsResidentFirmwareUpdate](self, "supportsResidentFirmwareUpdate");
  HMFBooleanToString();
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = (void *)objc_msgSend(v24, "initWithName:value:", CFSTR("Resident Firmware Update"), v124);
  v167[21] = v123;
  v25 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsCameraActivityZones](self, "supportsCameraActivityZones");
  HMFBooleanToString();
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = (void *)objc_msgSend(v25, "initWithName:value:", CFSTR("Camera Activity Zones"), v122);
  v167[22] = v121;
  v26 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsMusicAlarm](self, "supportsMusicAlarm");
  HMFBooleanToString();
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = (void *)objc_msgSend(v26, "initWithName:value:", CFSTR("Music Alarms"), v120);
  v167[23] = v119;
  v27 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsFaceClassification](self, "supportsFaceClassification");
  HMFBooleanToString();
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = (void *)objc_msgSend(v27, "initWithName:value:", CFSTR("Face Classification"), v118);
  v167[24] = v117;
  v28 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsNaturalLighting](self, "supportsNaturalLighting");
  HMFBooleanToString();
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = (void *)objc_msgSend(v28, "initWithName:value:", CFSTR("Natural Lighting"), v116);
  v167[25] = v115;
  v29 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsIDSActivityMonitorPresence](self, "supportsIDSActivityMonitorPresence");
  HMFBooleanToString();
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = (void *)objc_msgSend(v29, "initWithName:value:", CFSTR("IDS Activity Monitor (Presence)"), v114);
  v167[26] = v113;
  v30 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsCameraRecordingReachabilityNotifications](self, "supportsCameraRecordingReachabilityNotifications");
  HMFBooleanToString();
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = (void *)objc_msgSend(v30, "initWithName:value:", CFSTR("Camera Recording Reachability Notifications"), v112);
  v167[27] = v111;
  v31 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsAnnounce](self, "supportsAnnounce");
  HMFBooleanToString();
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = (void *)objc_msgSend(v31, "initWithName:value:", CFSTR("Announce"), v110);
  v167[28] = v109;
  v32 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsAudioAnalysis](self, "supportsAudioAnalysis");
  HMFBooleanToString();
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = (void *)objc_msgSend(v32, "initWithName:value:", CFSTR("Sound Analysis"), v108);
  v167[29] = v107;
  v33 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsDropIn](self, "supportsDropIn");
  HMFBooleanToString();
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = (void *)objc_msgSend(v33, "initWithName:value:", CFSTR("Drop In"), v106);
  v167[30] = v105;
  v34 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsThirdPartyMusic](self, "supportsThirdPartyMusic");
  HMFBooleanToString();
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = (void *)objc_msgSend(v34, "initWithName:value:", CFSTR("ThirdPartyMusic"), v104);
  v167[31] = v103;
  v35 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsPreferredMediaUser](self, "supportsPreferredMediaUser");
  HMFBooleanToString();
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = (void *)objc_msgSend(v35, "initWithName:value:", CFSTR("PreferredMediaUser"), v102);
  v167[32] = v101;
  v36 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsThreadBorderRouter](self, "supportsThreadBorderRouter");
  HMFBooleanToString();
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = (void *)objc_msgSend(v36, "initWithName:value:", CFSTR("Thread Border Router"), v100);
  v167[33] = v99;
  v37 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsSiriEndpointSetup](self, "supportsSiriEndpointSetup");
  HMFBooleanToString();
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = (void *)objc_msgSend(v37, "initWithName:value:", CFSTR("Siri Endpoint Setup"), v98);
  v167[34] = v97;
  v38 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsHomeHub](self, "supportsHomeHub");
  HMFBooleanToString();
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = (void *)objc_msgSend(v38, "initWithName:value:", CFSTR("Home Hub"), v96);
  v167[35] = v95;
  v39 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsWakeOnLAN](self, "supportsWakeOnLAN");
  HMFBooleanToString();
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = (void *)objc_msgSend(v39, "initWithName:value:", CFSTR("LPM Wake On LAN"), v94);
  v167[36] = v93;
  v40 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsLockNotificationContext](self, "supportsLockNotificationContext");
  HMFBooleanToString();
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = (void *)objc_msgSend(v40, "initWithName:value:", CFSTR("Lock Notification Context"), v92);
  v167[37] = v91;
  v41 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsAudioReturnChannel](self, "supportsAudioReturnChannel");
  HMFBooleanToString();
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = (void *)objc_msgSend(v41, "initWithName:value:", CFSTR("Audio Return Channel"), v90);
  v167[38] = v89;
  v42 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsWalletKey](self, "supportsWalletKey");
  HMFBooleanToString();
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = (void *)objc_msgSend(v42, "initWithName:value:", CFSTR("Wallet Key"), v88);
  v167[39] = v87;
  v43 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsCameraPackageDetection](self, "supportsCameraPackageDetection");
  HMFBooleanToString();
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = (void *)objc_msgSend(v43, "initWithName:value:", CFSTR("Camera Package Detection"), v86);
  v167[40] = v85;
  v44 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsAccessCodes](self, "supportsAccessCodes");
  HMFBooleanToString();
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = (void *)objc_msgSend(v44, "initWithName:value:", CFSTR("Access Codes"), v84);
  v167[41] = v83;
  v45 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsCHIP](self, "supportsCHIP");
  HMFBooleanToString();
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = (void *)objc_msgSend(v45, "initWithName:value:", CFSTR("CHIP"), v82);
  v167[42] = v81;
  v46 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsUnifiedMediaNotifications](self, "supportsUnifiedMediaNotifications");
  HMFBooleanToString();
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = (void *)objc_msgSend(v46, "initWithName:value:", CFSTR("Unified Media Notifications"), v80);
  v167[43] = v79;
  v47 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsCaptiveNetworks](self, "supportsCaptiveNetworks");
  HMFBooleanToString();
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = (void *)objc_msgSend(v47, "initWithName:value:", CFSTR("Captive Networks"), v78);
  v167[44] = v77;
  v48 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsModernTransport](self, "supportsModernTransport");
  HMFBooleanToString();
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = (void *)objc_msgSend(v48, "initWithName:value:", CFSTR("Modern Transport"), v76);
  v167[45] = v75;
  v49 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsResidentFirstAccessoryCommunication](self, "supportsResidentFirstAccessoryCommunication");
  HMFBooleanToString();
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (void *)objc_msgSend(v49, "initWithName:value:", CFSTR("Resident First Accessory Communication"), v74);
  v167[46] = v73;
  v50 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsCustomMediaApplicationDestination](self, "supportsCustomMediaApplicationDestination");
  HMFBooleanToString();
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = (void *)objc_msgSend(v50, "initWithName:value:", CFSTR("Custom Destination Media Action"), v72);
  v167[47] = v71;
  v51 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsThreadNetworkCredentialSharing](self, "supportsThreadNetworkCredentialSharing");
  HMFBooleanToString();
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (void *)objc_msgSend(v51, "initWithName:value:", CFSTR("Thread Network Credential Sharing"), v70);
  v167[48] = v69;
  v52 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsMatterSharedAdminPairing](self, "supportsMatterSharedAdminPairing");
  HMFBooleanToString();
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(v52, "initWithName:value:", CFSTR("Matter Shared Admin Pairing"), v53);
  v167[49] = v54;
  v55 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsRMVonAppleTV](self, "supportsRMVonAppleTV");
  HMFBooleanToString();
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)objc_msgSend(v55, "initWithName:value:", CFSTR("RMV on AppleTV"), v56);
  v167[50] = v57;
  v58 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsJustSiri](self, "supportsJustSiri");
  HMFBooleanToString();
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend(v58, "initWithName:value:", CFSTR("Just Siri"), v59);
  v167[51] = v60;
  v61 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsThreadService](self, "supportsThreadService");
  HMFBooleanToString();
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (void *)objc_msgSend(v61, "initWithName:value:", CFSTR("Thread Service"), v62);
  v167[52] = v63;
  v64 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDeviceCapabilities supportsMatterOwnerCertFetch](self, "supportsMatterOwnerCertFetch");
  HMFBooleanToString();
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)objc_msgSend(v64, "initWithName:value:", CFSTR("Matter Owner Cert Fetch"), v65);
  v167[53] = v66;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v167, 54);
  v68 = (id)objc_claimAutoreleasedReturnValue();

  return v68;
}

- (BOOL)supportsDeviceSetup
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsDeviceSetup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsKeyTransferClient
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsKeyTransferClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsKeyTransferServer
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsKeyTransferServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsStandaloneMode
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsStandaloneMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsWholeHouseAudio
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsWholeHouseAudio");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsAssistantAccessControl
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsAssistantAccessControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isRemoteGatewayCapable
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteGatewayCapable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsHomeInvitation
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsHomeInvitation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsTargetControl
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsTargetControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsMultiUser
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsMultiUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsHomeLevelLocationServiceSetting
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsHomeLevelLocationServiceSetting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsAudioReturnChannel
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsAudioReturnChannel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsCompanionInitiatedRestart
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsCompanionInitiatedRestart");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsCompanionInitiatedObliterate
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsCompanionInitiatedObliterate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsCameraRecording
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsCameraRecording");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsRouterManagement
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsRouterManagement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsShortcutActions
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsShortcutActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsMediaActions
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsMediaActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsCameraSignificantEventNotifications
{
  return 0;
}

- (BOOL)supportsFirmwareUpdate
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsFirmwareUpdate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsResidentFirmwareUpdate
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsResidentFirmwareUpdate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsCameraActivityZones
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsCameraActivityZones");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsMusicAlarm
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsMusicAlarm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsCoordinationDoorbellChime
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsCoordinationDoorbellChime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsFaceClassification
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsFaceClassification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsManagedConfigurationProfile
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsManagedConfigurationProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsNaturalLighting
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsNaturalLighting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsWalletKey
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsWalletKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsAccessCodes
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsAccessCodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsIDSActivityMonitorPresence
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsIDSActivityMonitorPresence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsCameraRecordingReachabilityNotifications
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsCameraRecordingReachabilityNotifications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsAnnounce
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsAnnounce");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsAudioAnalysis
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsAudioAnalysis");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsDropIn
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsDropIn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsDoorbellChime
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsDoorbellChime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsUserMediaSettings
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsUserMediaSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "BOOLValue"))
    v4 = _os_feature_enabled_impl();
  else
    v4 = 0;

  return v4;
}

- (BOOL)supportsSiriEndpointSetup
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsSiriEndpointSetup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsHomeHub
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsHomeHub");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsThirdPartyMusic
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsThirdPartyMusic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsPreferredMediaUser
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsPreferredMediaUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsThreadBorderRouter
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsThreadBorderRouter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsWakeOnLAN
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsWakeOnLAN");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsThreadNetworkCredentialSharing
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsThreadNetworkCredentialSharing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsMatterSharedAdminPairing
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsMatterSharedAdminPairing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsLockNotificationContext
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsLockNotificationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsCameraPackageDetection
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsCameraPackageDetection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsCHIP
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsCHIP");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsUnifiedMediaNotifications
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsUnifiedMediaNotifications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsCaptiveNetworks
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsCaptiveNetworks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsModernTransport
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsModernTransport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsResidentFirstAccessoryCommunication
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsResidentFirstAccessoryCommunication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsMessagedHomePodSettings
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsMessagedHomePodSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isMessagedHomePodSettingsFeatureEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportsCustomMediaApplicationDestination
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsCustomMediaApplicationDestination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsRMVonAppleTV
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsRMVonAppleTV");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsJustSiri
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsJustSiri");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsThreadService
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsThreadService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsEventLog
{
  return 0;
}

- (BOOL)supportsUWB
{
  return 0;
}

- (BOOL)supportsMatterTTU
{
  return 0;
}

- (BOOL)supportsResidentActionSetStateEvaluation
{
  return 0;
}

- (BOOL)supportsDistributedExecutionOnPrimary
{
  return 0;
}

- (BOOL)supportsDistributedExecutionOnAppleMediaAccessories
{
  return 0;
}

- (BOOL)supportsRestrictedGuest
{
  return 0;
}

- (BOOL)supportsMatterOwnerCertFetch
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsMatterOwnerCertFetch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsCoordinationFreeDoorbellChime
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsCoordinationFreeDoorbellChime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsTVOSUpdateManualUpdateAvailableNotification
{
  void *v2;
  void *v3;
  char v4;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportsTVOSUpdateManualUpdateAvailableNotification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)supportsLoreto
{
  return 0;
}

- (BOOL)supportsResidentSelection
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[HMDDeviceCapabilities objectModel]((char *)self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  v8 = (void *)objc_msgSend(v5, "initWithObjectModel:", v7);

  return v8;
}

- (HMDDeviceCapabilities)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMDDeviceCapabilitiesModel *v6;
  id v7;
  void *v8;
  id v9;
  HMDDeviceCapabilitiesModel *v10;
  HMDDeviceCapabilities *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  HMDDeviceCapabilitiesModel *v18;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.deviceCapabilities.identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = -[HMDBackingStoreModelObject initWithUUID:]([HMDDeviceCapabilitiesModel alloc], "initWithUUID:", v5);
  v7 = v4;
  __HMDDeviceCapabilitiesModelCodingKeyMapping();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = ____HMDDeviceCapabilitiesModelDecodeWithCoder_block_invoke;
  v16 = &unk_24E791238;
  v17 = v7;
  v18 = v6;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &v13);

  v11 = -[HMDDeviceCapabilities initWithObjectModel:](self, "initWithObjectModel:", v10, v13, v14, v15, v16);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  -[HMDDeviceCapabilities objectModel]((char *)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HM.deviceCapabilities.identifier"));

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  __HMDDeviceCapabilitiesModelCodingKeyMapping();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = ____HMDDeviceCapabilitiesModelEncodeWithCoder_block_invoke;
  v12[3] = &unk_24E791238;
  v13 = v7;
  v14 = v8;
  v10 = v7;
  v11 = v8;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v12);

}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDDeviceCapabilities *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v11;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = (id)objc_opt_class();
    v12 = v19;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectRemoved:message:]", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "respondWithError:", v13);

}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  os_unfair_lock_s *p_lock;
  HMDDeviceCapabilitiesModel *objectModel;
  _BOOL4 v16;
  id v17;
  HMDDeviceCapabilities *v18;
  NSObject *v19;
  void *v20;
  HMDDeviceCapabilitiesModel *v21;
  id v22;
  HMDDeviceCapabilitiesModel *v23;
  void *v24;
  void *v25;
  HMDDeviceCapabilities *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  void *context;
  id v32;
  id v33;
  id v34;
  _BYTE buf[12];
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v33 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    v13 = v12;
    v32 = v9;
    if (self)
    {
      p_lock = &self->_lock;
      os_unfair_lock_lock_with_options();
      objectModel = self->_objectModel;
      v34 = 0;
      v16 = -[HMDBackingStoreModelObject diff:differingFields:](objectModel, "diff:differingFields:", v13, &v34);
      v17 = v34;
      if (v16)
      {
        context = (void *)MEMORY[0x227676638]();
        v18 = self;
        HMFGetOSLogHandle();
        v19 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v20;
          _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Updating device capabilities", buf, 0xCu);

        }
        objc_autoreleasePoolPop(context);
        v21 = (HMDDeviceCapabilitiesModel *)-[HMDDeviceCapabilitiesModel copy](v18->_objectModel, "copy");
        v22 = -[HMDBackingStoreModelObject merge:](v21, "merge:", v13);
        v23 = v18->_objectModel;
        v18->_objectModel = v21;

        os_unfair_lock_unlock(p_lock);
        v40[0] = CFSTR("HMDDeviceCapabilitiesUpdatedDifferingFieldsNotificationKey");
        *(_QWORD *)buf = v17;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, v40, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        logAndPostNotification(CFSTR("HMDDeviceCapabilitiiesUpdatedNotification"), v18, v24);

      }
      else
      {
        os_unfair_lock_unlock(&self->_lock);
      }

    }
  }
  else
  {
    v25 = (void *)MEMORY[0x227676638]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v28;
      v36 = 2112;
      v37 = v10;
      v38 = 2112;
      v39 = (id)objc_opt_class();
      v29 = v39;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated:newValues:message:]", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "respondWithError:", v30);

  }
}

- (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (NSUUID)modelIdentifier
{
  void *v2;
  void *v3;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (NSUUID)modelParentIdentifier
{
  void *v2;
  void *v3;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (void)setModelParentIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  HMDDeviceCapabilitiesModel *v8;
  HMDDeviceCapabilitiesModel *objectModel;
  _BOOL4 v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDDeviceCapabilities *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HMDDeviceCapabilities *v20;
  NSObject *v21;
  void *v22;
  HMDAssertionLogEvent *v23;
  void *v24;
  void *v25;
  HMDDeviceCapabilities *v26;
  NSObject *v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    -[HMDBackingStoreModelObject parentUUID](self->_objectModel, "parentUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v31 = v22;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Parent identifier is already present for this object", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
      v23 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Parent identifier is already present for this object"));
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "submitLogEvent:", v23);

      v25 = (void *)MEMORY[0x227676638]();
      v26 = v20;
      HMFGetOSLogHandle();
      v27 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v31 = v28;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Parent identifier is already present for this object", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v25);
    }
    else
    {
      __identifierForParentUUID(v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[HMDBackingStoreModelObject initWithUUID:parentUUID:]([HMDDeviceCapabilitiesModel alloc], "initWithUUID:parentUUID:", v7, v4);
      objectModel = self->_objectModel;
      v29 = 0;
      v10 = -[HMDBackingStoreModelObject merge:error:](v8, "merge:error:", objectModel, &v29);
      v11 = v29;
      if (v10)
      {
        objc_storeStrong((id *)&self->_objectModel, v8);
      }
      else
      {
        v15 = (void *)MEMORY[0x227676638]();
        v16 = self;
        HMFGetOSLogHandle();
        v17 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v31 = v18;
          v32 = 2112;
          v33 = v11;
          _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to update model with error: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v15);
      }

    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Model parent UUID is a required argument", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  void *v5;
  void *v6;

  -[HMDDeviceCapabilities objectModel]((char *)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v6, "setObjectChangeType:", a3);
  return v6;
}

- (id)backingStoreObjectsWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  -[HMDDeviceCapabilities modelObjectWithChangeType:version:](self, "modelObjectWithChangeType:version:", a3, a4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v8[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v6;
}

- (id)modelBackedObjects
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = self;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)supportsInstallManagedConfigurationProfile
{
  return self->_supportsInstallManagedConfigurationProfile;
}

- (void)setMessagedHomePodSettingsFeatureEnabled:(BOOL)a3
{
  self->_messagedHomePodSettingsFeatureEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectModel, 0);
}

- (id)objectModel
{
  id *v1;
  os_unfair_lock_s *v2;

  v1 = (id *)a1;
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    v1 = (id *)v1[2];
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

+ (BOOL)supportsLocalization
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productClass") != 6;

  return v3;
}

+ (BOOL)supportsHomeApp
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productPlatform");

  return (v3 < 6) & (0x2Cu >> v3);
}

+ (BOOL)supportsIntentDonation
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productPlatform");

  return (v3 < 6) & (0x2Cu >> v3);
}

+ (BOOL)supportsSymptomsHandler
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productPlatform");

  return (v3 < 6) & (0x24u >> v3);
}

+ (BOOL)supportsDeviceLock
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productClass");

  return (v3 > 0xB) | (0xFAFu >> v3) & 1;
}

+ (BOOL)supportsCustomerReset
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productPlatform");

  return (unint64_t)(v3 - 1) < 2;
}

+ (BOOL)isAppleMediaAccessory
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productClass");

  return (v3 & 0xFFFFFFFFFFFFFFFDLL) == 4;
}

+ (unint64_t)appleMediaAccessoryVariant
{
  return 0;
}

+ (BOOL)requiresHomePodMiniPairing
{
  return objc_msgSend(a1, "appleMediaAccessoryVariant") == 2;
}

+ (BOOL)requiresHomePod2ndGenPairing
{
  return objc_msgSend(a1, "appleMediaAccessoryVariant") == 4;
}

+ (BOOL)supportsRemoteAccess
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productPlatform");

  return (v3 < 6) & (0x2Eu >> v3);
}

+ (BOOL)supportsTargetControllerAutoConfigure
{
  void *v2;
  void *v3;
  BOOL IsResidentCapable;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "productClass") == 1)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "productClass") == 3)
  {

LABEL_4:
    IsResidentCapable = 1;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "productClass");

  if (v7 == 2)
    return 1;
  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsResidentCapable = productIsResidentCapable(v2);
LABEL_5:

  return IsResidentCapable;
}

+ (BOOL)supportsCameraSnapshotRequestViaRelay
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productPlatform");

  return (v3 < 6) & (0x2Eu >> v3);
}

+ (BOOL)supportsUserNotifications
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productPlatform");

  return (v3 < 6) & (0x26u >> v3);
}

+ (BOOL)supportsDismissUserNotificationAndDialog
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productPlatform");

  return (v3 < 6) & (0x2Eu >> v3);
}

+ (BOOL)supportsReceivingRemoteCameraStream
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productPlatform");

  return (v3 < 6) & (0x2Eu >> v3);
}

+ (BOOL)supportsBidirectionalAudioForCameraStreaming
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productPlatform");

  return (v3 > 5) | (0x2Fu >> v3) & 1;
}

+ (BOOL)supportsAddingAccessory
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x24BE3F288], "systemInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "productPlatform") == 1)
  {
    objc_msgSend(MEMORY[0x24BE3F288], "systemInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "productVariant") == 3;

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

+ (BOOL)supportsSyncingToSharedUsers
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productClass");

  return (v3 > 0xB) | (0xFDFu >> v3) & 1;
}

+ (BOOL)supportsBackboard
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productClass");

  return (v3 < 0xC) & (0x83Eu >> v3);
}

+ (BOOL)isCompanionCapable
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productClass") == 1;

  return v3;
}

+ (BOOL)supportsHomeKitDataStream
{
  void *v2;
  uint64_t v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productPlatform");

  if (v3)
    v4 = v3 == 3;
  else
    v4 = 1;
  return !v4;
}

+ (BOOL)supportsBulletinBoard
{
  void *v2;
  uint64_t v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productPlatform");

  if (v3)
    v4 = v3 == 3;
  else
    v4 = 1;
  return !v4;
}

+ (BOOL)supportsStereoPairingV1
{
  return 0;
}

+ (BOOL)supportsStereoPairingV2
{
  return 0;
}

+ (BOOL)supportsStereoPairingV3
{
  return 0;
}

+ (BOOL)supportsStereoPairingV4
{
  return 0;
}

+ (BOOL)supportsHostingLocalTempAndHumiditySensor
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productClass") == 6
    && objc_msgSend(v2, "productPlatform") == 4
    && (MGGetProductType() == 3348380076 || MGGetProductType() == 1540760353);

  return v3;
}

+ (BOOL)supportsSiriUnsecuringActionsWithNoPasscode
{
  return 0;
}

+ (BOOL)supportsSiriUnsecuringActionsWithWatchAuth
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productClass") == 1;

  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_203574 != -1)
    dispatch_once(&logCategory__hmf_once_t4_203574, &__block_literal_global_147);
  return (id)logCategory__hmf_once_v5_203575;
}

+ (BOOL)isInternalVirtualDevice
{
  if (isInternalVirtualDevice_onceToken != -1)
    dispatch_once(&isInternalVirtualDevice_onceToken, &__block_literal_global_276);
  if (isInternalVirtualDevice_result)
    return isInternalBuild();
  else
    return 0;
}

+ (BOOL)supportsAudioDestinationControllerCreation
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productClass");

  if (v3 != 4)
    return 0;
  if ((MGGetBoolAnswer() & 1) != 0)
    return 1;
  return +[HMDDeviceCapabilities isInternalVirtualDevice](HMDDeviceCapabilities, "isInternalVirtualDevice");
}

+ (BOOL)supportsAudioDestinationCreation
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productClass");

  if (v3 != 6)
    return 0;
  if ((MGGetBoolAnswer() & 1) != 0)
    return 1;
  return +[HMDDeviceCapabilities isInternalVirtualDevice](HMDDeviceCapabilities, "isInternalVirtualDevice");
}

+ (unint64_t)supportedPairingCapabilities
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productClass");

  if ((unint64_t)(v3 - 1) >= 3)
    return 0;
  else
    return 15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)deviceCapabilitiesModelIdentifierWithParentIdentifier:(id)a3
{
  if (!a3)
    return 0;
  __identifierForParentUUID(a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __48__HMDDeviceCapabilities_isInternalVirtualDevice__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  isInternalVirtualDevice_result = result;
  return result;
}

void __36__HMDDeviceCapabilities_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_203575;
  logCategory__hmf_once_v5_203575 = v0;

}

void __43__HMDDeviceCapabilities_deviceCapabilities__block_invoke()
{
  HMDDeviceCapabilities *v0;
  HMDMobileGestaltClient *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = [HMDDeviceCapabilities alloc];
  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc_init(HMDMobileGestaltClient);
  +[HMDHomeKitVersion currentVersion](HMDHomeKitVersion, "currentVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[HMDDeviceCapabilities initWithProductInfo:mobileGestaltClient:homekitVersion:](v0, "initWithProductInfo:mobileGestaltClient:homekitVersion:", v5, v1, v2);
  v4 = (void *)deviceCapabilities_deviceCapabilities;
  deviceCapabilities_deviceCapabilities = v3;

}

@end
