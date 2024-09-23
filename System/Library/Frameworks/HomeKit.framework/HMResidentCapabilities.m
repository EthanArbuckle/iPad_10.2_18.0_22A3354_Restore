@implementation HMResidentCapabilities

- (HMResidentCapabilities)initWithTagUUID:(id)a3 capabilities:(_HMResidentCapabilitiesStruct)a4
{
  id v6;
  HMResidentCapabilities *v7;
  uint64_t v8;
  NSString *tag;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMResidentCapabilities;
  v7 = -[HMResidentCapabilities init](&v11, sel_init);
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
  HMResidentCapabilities *v4;
  HMResidentCapabilities *v5;
  HMResidentCapabilities *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMResidentCapabilities *)a3;
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
      -[HMResidentCapabilities tag](self, "tag");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMResidentCapabilities tag](v6, "tag");
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

  -[HMResidentCapabilities tag](self, "tag");
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
  _BOOL4 v43;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (!v6)
    goto LABEL_40;
  v7 = -[HMResidentCapabilities supportsCameraRecording](self, "supportsCameraRecording");
  if (v7 != objc_msgSend(v6, "supportsCameraRecording"))
    goto LABEL_40;
  v8 = -[HMResidentCapabilities supportsRouterManagement](self, "supportsRouterManagement");
  if (v8 != objc_msgSend(v6, "supportsRouterManagement"))
    goto LABEL_40;
  v9 = -[HMResidentCapabilities supportsShortcutActions](self, "supportsShortcutActions");
  if (v9 != objc_msgSend(v6, "supportsShortcutActions"))
    goto LABEL_40;
  v10 = -[HMResidentCapabilities supportsMediaActions](self, "supportsMediaActions");
  if (v10 != objc_msgSend(v6, "supportsMediaActions"))
    goto LABEL_40;
  v11 = -[HMResidentCapabilities supportsCameraSignificantEventNotifications](self, "supportsCameraSignificantEventNotifications");
  if (v11 != objc_msgSend(v6, "supportsCameraSignificantEventNotifications"))
    goto LABEL_40;
  v12 = -[HMResidentCapabilities supportsFirmwareUpdate](self, "supportsFirmwareUpdate");
  if (v12 != objc_msgSend(v6, "supportsFirmwareUpdate"))
    goto LABEL_40;
  v13 = -[HMResidentCapabilities supportsResidentFirmwareUpdate](self, "supportsResidentFirmwareUpdate");
  if (v13 != objc_msgSend(v6, "supportsResidentFirmwareUpdate"))
    goto LABEL_40;
  v14 = -[HMResidentCapabilities supportsCameraActivityZones](self, "supportsCameraActivityZones");
  if (v14 != objc_msgSend(v6, "supportsCameraActivityZones"))
    goto LABEL_40;
  v15 = -[HMResidentCapabilities supportsFaceClassification](self, "supportsFaceClassification");
  if (v15 != objc_msgSend(v6, "supportsFaceClassification"))
    goto LABEL_40;
  v16 = -[HMResidentCapabilities supportsNaturalLighting](self, "supportsNaturalLighting");
  if (v16 != objc_msgSend(v6, "supportsNaturalLighting"))
    goto LABEL_40;
  v17 = -[HMResidentCapabilities supportsCameraRecordingReachabilityNotifications](self, "supportsCameraRecordingReachabilityNotifications");
  if (v17 != objc_msgSend(v6, "supportsCameraRecordingReachabilityNotifications"))
    goto LABEL_40;
  v18 = -[HMResidentCapabilities supportsAnnounce](self, "supportsAnnounce");
  if (v18 != objc_msgSend(v6, "supportsAnnounce"))
    goto LABEL_40;
  v19 = -[HMResidentCapabilities supportsWakeOnLAN](self, "supportsWakeOnLAN");
  if (v19 != objc_msgSend(v6, "supportsWakeOnLAN"))
    goto LABEL_40;
  v20 = -[HMResidentCapabilities supportsLockNotificationContext](self, "supportsLockNotificationContext");
  if (v20 != objc_msgSend(v6, "supportsLockNotificationContext"))
    goto LABEL_40;
  v21 = -[HMResidentCapabilities supportsWalletKey](self, "supportsWalletKey");
  if (v21 != objc_msgSend(v6, "supportsWalletKey"))
    goto LABEL_40;
  v22 = -[HMResidentCapabilities supportsCameraPackageDetection](self, "supportsCameraPackageDetection");
  if (v22 != objc_msgSend(v6, "supportsCameraPackageDetection"))
    goto LABEL_40;
  v23 = -[HMResidentCapabilities supportsAccessCodes](self, "supportsAccessCodes");
  if (v23 != objc_msgSend(v6, "supportsAccessCodes"))
    goto LABEL_40;
  v24 = -[HMResidentCapabilities supportsCHIP](self, "supportsCHIP");
  if (v24 != objc_msgSend(v6, "supportsCHIP"))
    goto LABEL_40;
  v25 = -[HMResidentCapabilities supportsThreadBorderRouter](self, "supportsThreadBorderRouter");
  if (v25 != objc_msgSend(v6, "supportsThreadBorderRouter"))
    goto LABEL_40;
  v26 = -[HMResidentCapabilities supportsSiriEndpointSetup](self, "supportsSiriEndpointSetup");
  if (v26 != objc_msgSend(v6, "supportsSiriEndpointSetup"))
    goto LABEL_40;
  v27 = -[HMResidentCapabilities supportsCustomMediaApplicationDestination](self, "supportsCustomMediaApplicationDestination");
  if (v27 != objc_msgSend(v6, "supportsCustomMediaApplicationDestination"))
    goto LABEL_40;
  v28 = -[HMResidentCapabilities supportsUnifiedMediaNotifications](self, "supportsUnifiedMediaNotifications");
  if (v28 != objc_msgSend(v6, "supportsUnifiedMediaNotifications"))
    goto LABEL_40;
  v29 = -[HMResidentCapabilities supportsHomeHub](self, "supportsHomeHub");
  if (v29 != objc_msgSend(v6, "supportsHomeHub"))
    goto LABEL_40;
  v30 = -[HMResidentCapabilities supportsResidentFirstAccessoryCommunication](self, "supportsResidentFirstAccessoryCommunication");
  if (v30 != objc_msgSend(v6, "supportsResidentFirstAccessoryCommunication"))
    goto LABEL_40;
  v31 = -[HMResidentCapabilities supportsThreadNetworkCredentialSharing](self, "supportsThreadNetworkCredentialSharing");
  if (v31 != objc_msgSend(v6, "supportsThreadNetworkCredentialSharing"))
    goto LABEL_40;
  v32 = -[HMResidentCapabilities supportsMatterSharedAdminPairing](self, "supportsMatterSharedAdminPairing");
  if (v32 != objc_msgSend(v6, "supportsMatterSharedAdminPairing"))
    goto LABEL_40;
  v33 = -[HMResidentCapabilities supportsEventLog](self, "supportsEventLog");
  if (v33 != objc_msgSend(v6, "supportsEventLog"))
    goto LABEL_40;
  v34 = -[HMResidentCapabilities supportsMatterTTU](self, "supportsMatterTTU");
  if (v34 != objc_msgSend(v6, "supportsMatterTTU"))
    goto LABEL_40;
  v35 = -[HMResidentCapabilities supportsDistributedExecutionOnPrimary](self, "supportsDistributedExecutionOnPrimary");
  if (v35 != objc_msgSend(v6, "supportsDistributedExecutionOnPrimary"))
    goto LABEL_40;
  v36 = -[HMResidentCapabilities supportsResidentActionSetStateEvaluation](self, "supportsResidentActionSetStateEvaluation");
  if (v36 != objc_msgSend(v6, "supportsResidentActionSetStateEvaluation"))
    goto LABEL_40;
  v37 = -[HMResidentCapabilities supportsUWB](self, "supportsUWB");
  if (v37 != objc_msgSend(v6, "supportsUWB"))
    goto LABEL_40;
  v38 = -[HMResidentCapabilities supportsRestrictedGuest](self, "supportsRestrictedGuest");
  if (v38 != objc_msgSend(v6, "supportsRestrictedGuest") && (_os_feature_enabled_impl() & 1) != 0)
    goto LABEL_40;
  v39 = -[HMResidentCapabilities supportsMatterOwnerCertFetch](self, "supportsMatterOwnerCertFetch");
  if (v39 == objc_msgSend(v6, "supportsMatterOwnerCertFetch")
    && (v40 = -[HMResidentCapabilities supportsDistributedExecutionOnAppleMediaAccessories](self, "supportsDistributedExecutionOnAppleMediaAccessories"), v40 == objc_msgSend(v6, "supportsDistributedExecutionOnAppleMediaAccessories")))
  {
    v43 = -[HMResidentCapabilities supportsResidentSelection](self, "supportsResidentSelection");
    v41 = v43 ^ objc_msgSend(v6, "supportsResidentSelection") ^ 1;
  }
  else
  {
LABEL_40:
    LOBYTE(v41) = 0;
  }

  return v41;
}

- (BOOL)isResidentCapable
{
  return 1;
}

- (BOOL)supportsCameraRecording
{
  return -[HMResidentCapabilities capabilities](self, "capabilities") & 1;
}

- (BOOL)supportsRouterManagement
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 1) & 1;
}

- (BOOL)supportsShortcutActions
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 2) & 1;
}

- (BOOL)supportsMediaActions
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 3) & 1;
}

- (BOOL)supportsCameraSignificantEventNotifications
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 4) & 1;
}

- (BOOL)supportsFirmwareUpdate
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 5) & 1;
}

- (BOOL)supportsResidentFirmwareUpdate
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 6) & 1;
}

- (BOOL)supportsCameraActivityZones
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 7) & 1;
}

- (BOOL)supportsFaceClassification
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 8) & 1;
}

- (BOOL)supportsNaturalLighting
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 9) & 1;
}

- (BOOL)supportsCameraRecordingReachabilityNotifications
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 10) & 1;
}

- (BOOL)supportsAnnounce
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 11) & 1;
}

- (BOOL)supportsWakeOnLAN
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 12) & 1;
}

- (BOOL)supportsLockNotificationContext
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 13) & 1;
}

- (BOOL)supportsWalletKey
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 14) & 1;
}

- (BOOL)supportsCameraPackageDetection
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 15) & 1;
}

- (BOOL)supportsAccessCodes
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 16) & 1;
}

- (BOOL)supportsCHIP
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 17) & 1;
}

- (BOOL)supportsThreadBorderRouter
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 18) & 1;
}

- (BOOL)supportsSiriEndpointSetup
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 19) & 1;
}

- (BOOL)supportsCustomMediaApplicationDestination
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 20) & 1;
}

- (BOOL)supportsUnifiedMediaNotifications
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 21) & 1;
}

- (BOOL)supportsHomeHub
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 22) & 1;
}

- (BOOL)supportsResidentFirstAccessoryCommunication
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 23) & 1;
}

- (BOOL)supportsThreadNetworkCredentialSharing
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 24) & 1;
}

- (BOOL)supportsMatterSharedAdminPairing
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 25) & 1;
}

- (BOOL)supportsEventLog
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 26) & 1;
}

- (BOOL)supportsMatterTTU
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 27) & 1;
}

- (BOOL)supportsDistributedExecutionOnPrimary
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 28) & 1;
}

- (BOOL)supportsResidentActionSetStateEvaluation
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 29) & 1;
}

- (BOOL)supportsUWB
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 30) & 1;
}

- (BOOL)supportsRestrictedGuest
{
  if ((-[HMResidentCapabilities capabilities](self, "capabilities") & 0x80000000) != 0)
    return _os_feature_enabled_impl();
  else
    return 0;
}

- (BOOL)supportsMatterOwnerCertFetch
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 32) & 1;
}

- (BOOL)supportsDistributedExecutionOnAppleMediaAccessories
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 33) & 1;
}

- (BOOL)supportsResidentSelection
{
  return ((unint64_t)-[HMResidentCapabilities capabilities](self, "capabilities") >> 34) & 1;
}

- (id)pbCapabilities
{
  HMProtoResidentCapabilities *v3;
  void *v4;

  v3 = objc_alloc_init(HMProtoResidentCapabilities);
  -[HMResidentCapabilities tag](self, "tag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMProtoResidentCapabilities setTag:](v3, "setTag:", v4);

  -[HMProtoResidentCapabilities setSupportsCameraRecording:](v3, "setSupportsCameraRecording:", -[HMResidentCapabilities supportsCameraRecording](self, "supportsCameraRecording"));
  -[HMProtoResidentCapabilities setSupportsRouterManagement:](v3, "setSupportsRouterManagement:", -[HMResidentCapabilities supportsRouterManagement](self, "supportsRouterManagement"));
  -[HMProtoResidentCapabilities setSupportsShortcutActions:](v3, "setSupportsShortcutActions:", -[HMResidentCapabilities supportsShortcutActions](self, "supportsShortcutActions"));
  -[HMProtoResidentCapabilities setSupportsMediaActions:](v3, "setSupportsMediaActions:", -[HMResidentCapabilities supportsMediaActions](self, "supportsMediaActions"));
  -[HMProtoResidentCapabilities setSupportsCameraSignificantEventNotifications:](v3, "setSupportsCameraSignificantEventNotifications:", -[HMResidentCapabilities supportsCameraSignificantEventNotifications](self, "supportsCameraSignificantEventNotifications"));
  -[HMProtoResidentCapabilities setSupportsFirmwareUpdate:](v3, "setSupportsFirmwareUpdate:", -[HMResidentCapabilities supportsFirmwareUpdate](self, "supportsFirmwareUpdate"));
  -[HMProtoResidentCapabilities setSupportsResidentFirmwareUpdate:](v3, "setSupportsResidentFirmwareUpdate:", -[HMResidentCapabilities supportsResidentFirmwareUpdate](self, "supportsResidentFirmwareUpdate"));
  -[HMProtoResidentCapabilities setSupportsCameraActivityZones:](v3, "setSupportsCameraActivityZones:", -[HMResidentCapabilities supportsCameraActivityZones](self, "supportsCameraActivityZones"));
  -[HMProtoResidentCapabilities setSupportsFaceClassification:](v3, "setSupportsFaceClassification:", -[HMResidentCapabilities supportsFaceClassification](self, "supportsFaceClassification"));
  -[HMProtoResidentCapabilities setSupportsNaturalLighting:](v3, "setSupportsNaturalLighting:", -[HMResidentCapabilities supportsNaturalLighting](self, "supportsNaturalLighting"));
  -[HMProtoResidentCapabilities setSupportsCameraRecordingReachabilityNotifications:](v3, "setSupportsCameraRecordingReachabilityNotifications:", -[HMResidentCapabilities supportsCameraRecordingReachabilityNotifications](self, "supportsCameraRecordingReachabilityNotifications"));
  -[HMProtoResidentCapabilities setSupportsAnnounce:](v3, "setSupportsAnnounce:", -[HMResidentCapabilities supportsAnnounce](self, "supportsAnnounce"));
  -[HMProtoResidentCapabilities setSupportsWakeOnLAN:](v3, "setSupportsWakeOnLAN:", -[HMResidentCapabilities supportsWakeOnLAN](self, "supportsWakeOnLAN"));
  -[HMProtoResidentCapabilities setSupportsLockNotificationContext:](v3, "setSupportsLockNotificationContext:", -[HMResidentCapabilities supportsLockNotificationContext](self, "supportsLockNotificationContext"));
  -[HMProtoResidentCapabilities setSupportsWalletKey:](v3, "setSupportsWalletKey:", -[HMResidentCapabilities supportsWalletKey](self, "supportsWalletKey"));
  -[HMProtoResidentCapabilities setSupportsCameraPackageDetection:](v3, "setSupportsCameraPackageDetection:", -[HMResidentCapabilities supportsCameraPackageDetection](self, "supportsCameraPackageDetection"));
  -[HMProtoResidentCapabilities setSupportsAccessCodes:](v3, "setSupportsAccessCodes:", -[HMResidentCapabilities supportsAccessCodes](self, "supportsAccessCodes"));
  -[HMProtoResidentCapabilities setSupportsCHIP:](v3, "setSupportsCHIP:", -[HMResidentCapabilities supportsCHIP](self, "supportsCHIP"));
  -[HMProtoResidentCapabilities setSupportsThreadBorderRouter:](v3, "setSupportsThreadBorderRouter:", -[HMResidentCapabilities supportsThreadBorderRouter](self, "supportsThreadBorderRouter"));
  -[HMProtoResidentCapabilities setSupportsSiriEndpointSetup:](v3, "setSupportsSiriEndpointSetup:", -[HMResidentCapabilities supportsSiriEndpointSetup](self, "supportsSiriEndpointSetup"));
  -[HMProtoResidentCapabilities setSupportsCustomMediaApplicationDestination:](v3, "setSupportsCustomMediaApplicationDestination:", -[HMResidentCapabilities supportsCustomMediaApplicationDestination](self, "supportsCustomMediaApplicationDestination"));
  -[HMProtoResidentCapabilities setSupportsUnifiedMediaNotifications:](v3, "setSupportsUnifiedMediaNotifications:", -[HMResidentCapabilities supportsUnifiedMediaNotifications](self, "supportsUnifiedMediaNotifications"));
  -[HMProtoResidentCapabilities setSupportsHomeHub:](v3, "setSupportsHomeHub:", -[HMResidentCapabilities supportsHomeHub](self, "supportsHomeHub"));
  -[HMProtoResidentCapabilities setSupportsResidentFirstAccessoryCommunication:](v3, "setSupportsResidentFirstAccessoryCommunication:", -[HMResidentCapabilities supportsResidentFirstAccessoryCommunication](self, "supportsResidentFirstAccessoryCommunication"));
  -[HMProtoResidentCapabilities setSupportsThreadNetworkCredentialSharing:](v3, "setSupportsThreadNetworkCredentialSharing:", -[HMResidentCapabilities supportsThreadNetworkCredentialSharing](self, "supportsThreadNetworkCredentialSharing"));
  -[HMProtoResidentCapabilities setSupports5348b248a25f84b0c83e:](v3, "setSupports5348b248a25f84b0c83e:", -[HMResidentCapabilities supportsMatterSharedAdminPairing](self, "supportsMatterSharedAdminPairing"));
  -[HMProtoResidentCapabilities setSupportsEventLog:](v3, "setSupportsEventLog:", -[HMResidentCapabilities supportsEventLog](self, "supportsEventLog"));
  -[HMProtoResidentCapabilities setSupportsMatterTTU:](v3, "setSupportsMatterTTU:", -[HMResidentCapabilities supportsMatterTTU](self, "supportsMatterTTU"));
  -[HMProtoResidentCapabilities setSupportsDistributedExecutionOnPrimary:](v3, "setSupportsDistributedExecutionOnPrimary:", -[HMResidentCapabilities supportsDistributedExecutionOnPrimary](self, "supportsDistributedExecutionOnPrimary"));
  -[HMProtoResidentCapabilities setSupportsResidentActionSetStateEvaluation:](v3, "setSupportsResidentActionSetStateEvaluation:", -[HMResidentCapabilities supportsResidentActionSetStateEvaluation](self, "supportsResidentActionSetStateEvaluation"));
  -[HMProtoResidentCapabilities setSupports9907491178:](v3, "setSupports9907491178:", -[HMResidentCapabilities supportsUWB](self, "supportsUWB"));
  -[HMProtoResidentCapabilities setSupports6b6244b25f264f02:](v3, "setSupports6b6244b25f264f02:", -[HMResidentCapabilities supportsRestrictedGuest](self, "supportsRestrictedGuest"));
  -[HMProtoResidentCapabilities setSupportsMatterOwnerCertFetch:](v3, "setSupportsMatterOwnerCertFetch:", -[HMResidentCapabilities supportsMatterOwnerCertFetch](self, "supportsMatterOwnerCertFetch"));
  -[HMProtoResidentCapabilities setSupportsa15324f096ec183d:](v3, "setSupportsa15324f096ec183d:", -[HMResidentCapabilities supportsDistributedExecutionOnAppleMediaAccessories](self, "supportsDistributedExecutionOnAppleMediaAccessories"));
  -[HMProtoResidentCapabilities setSupports7cbb2355da029df2:](v3, "setSupports7cbb2355da029df2:", -[HMResidentCapabilities supportsResidentSelection](self, "supportsResidentSelection"));
  return v3;
}

- (HMResidentCapabilities)initWithProtoData:(id)a3
{
  id v4;
  HMProtoResidentCapabilities *v5;
  HMResidentCapabilities *v6;

  v4 = a3;
  v5 = -[HMProtoResidentCapabilities initWithData:]([HMProtoResidentCapabilities alloc], "initWithData:", v4);

  if (v5)
  {
    self = -[HMResidentCapabilities initWithProtoCapabilities:](self, "initWithProtoCapabilities:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (HMResidentCapabilities)initWithProtoCapabilities:(id)a3
{
  id v4;
  HMResidentCapabilities *v5;
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
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t v67;
  uint64_t v68;
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
  void *v89;

  v4 = a3;
  objc_msgSend(v4, "tag");
  v5 = (HMResidentCapabilities *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v4, "tag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = (void *)objc_msgSend(v6, "initWithUUIDString:", v7);

    v8 = objc_msgSend(v4, "supportsCameraRecording");
    v9 = objc_msgSend(v4, "supportsRouterManagement");
    v10 = 2;
    if (!v9)
      v10 = 0;
    v11 = v10 | v8;
    if (objc_msgSend(v4, "supportsShortcutActions"))
      v12 = 4;
    else
      v12 = 0;
    v13 = objc_msgSend(v4, "supportsMediaActions");
    v14 = 8;
    if (!v13)
      v14 = 0;
    v88 = v11 | v12 | v14;
    if (objc_msgSend(v4, "supportsCameraSignificantEventNotifications"))
      v15 = 16;
    else
      v15 = 0;
    if (objc_msgSend(v4, "supportsFirmwareUpdate"))
      v16 = 32;
    else
      v16 = 0;
    if (objc_msgSend(v4, "supportsResidentFirmwareUpdate"))
      v17 = 64;
    else
      v17 = 0;
    v86 = v15 | v16;
    v87 = v17;
    v18 = objc_msgSend(v4, "supportsCameraActivityZones");
    v19 = 128;
    if (!v18)
      v19 = 0;
    v85 = v19;
    v20 = objc_msgSend(v4, "supportsFaceClassification");
    v21 = 256;
    if (!v20)
      v21 = 0;
    v84 = v21;
    v22 = objc_msgSend(v4, "supportsNaturalLighting");
    v23 = 512;
    if (!v22)
      v23 = 0;
    v83 = v23;
    v24 = objc_msgSend(v4, "supportsCameraRecordingReachabilityNotifications");
    v25 = 1024;
    if (!v24)
      v25 = 0;
    v82 = v25;
    v26 = objc_msgSend(v4, "supportsAnnounce");
    v27 = 2048;
    if (!v26)
      v27 = 0;
    v81 = v27;
    v28 = objc_msgSend(v4, "supportsWakeOnLAN");
    v29 = 4096;
    if (!v28)
      v29 = 0;
    v80 = v29;
    v30 = objc_msgSend(v4, "supportsLockNotificationContext");
    v31 = 0x2000;
    if (!v30)
      v31 = 0;
    v79 = v31;
    v32 = objc_msgSend(v4, "supportsWalletKey");
    v33 = 0x4000;
    if (!v32)
      v33 = 0;
    v78 = v33;
    v34 = objc_msgSend(v4, "supportsCameraPackageDetection");
    v35 = 0x8000;
    if (!v34)
      v35 = 0;
    v77 = v35;
    v36 = objc_msgSend(v4, "supportsAccessCodes");
    v37 = 0x10000;
    if (!v36)
      v37 = 0;
    v76 = v37;
    v38 = objc_msgSend(v4, "supportsCHIP");
    v39 = 0x20000;
    if (!v38)
      v39 = 0;
    v75 = v39;
    v40 = objc_msgSend(v4, "supportsThreadBorderRouter");
    v41 = 0x40000;
    if (!v40)
      v41 = 0;
    v74 = v41;
    v42 = objc_msgSend(v4, "supportsSiriEndpointSetup");
    v43 = 0x80000;
    if (!v42)
      v43 = 0;
    v73 = v43;
    v44 = objc_msgSend(v4, "supportsCustomMediaApplicationDestination");
    v45 = 0x100000;
    if (!v44)
      v45 = 0;
    v72 = v45;
    v46 = objc_msgSend(v4, "supportsUnifiedMediaNotifications");
    v47 = 0x200000;
    if (!v46)
      v47 = 0;
    v71 = v47;
    v48 = objc_msgSend(v4, "supportsHomeHub");
    v49 = 0x400000;
    if (!v48)
      v49 = 0;
    v70 = v49;
    v50 = objc_msgSend(v4, "supportsResidentFirstAccessoryCommunication");
    v51 = 0x800000;
    if (!v50)
      v51 = 0;
    v69 = v51;
    v52 = objc_msgSend(v4, "supportsThreadNetworkCredentialSharing");
    v53 = 0x1000000;
    if (!v52)
      v53 = 0;
    v68 = v53;
    v54 = objc_msgSend(v4, "supports5348b248a25f84b0c83e");
    v55 = 0x2000000;
    if (!v54)
      v55 = 0;
    if (objc_msgSend(v4, "supportsEventLog", v55))
      v56 = 0x4000000;
    else
      v56 = 0;
    if (objc_msgSend(v4, "supportsMatterTTU"))
      v57 = 0x8000000;
    else
      v57 = 0;
    if (objc_msgSend(v4, "supportsDistributedExecutionOnPrimary"))
      v58 = 0x10000000;
    else
      v58 = 0;
    if (objc_msgSend(v4, "supportsResidentActionSetStateEvaluation"))
      v59 = 0x20000000;
    else
      v59 = 0;
    if (objc_msgSend(v4, "supports9907491178"))
      v60 = 0x40000000;
    else
      v60 = 0;
    if (objc_msgSend(v4, "supports6b6244b25f264f02"))
      v61 = 0x80000000;
    else
      v61 = 0;
    if (objc_msgSend(v4, "supportsMatterOwnerCertFetch"))
      v62 = 0x100000000;
    else
      v62 = 0;
    if (objc_msgSend(v4, "supportsa15324f096ec183d"))
      v63 = 0x200000000;
    else
      v63 = 0;
    v64 = objc_msgSend(v4, "supports7cbb2355da029df2");
    v65 = 0x400000000;
    if (!v64)
      v65 = 0;
    self = -[HMResidentCapabilities initWithTagUUID:capabilities:](self, "initWithTagUUID:capabilities:", v89, v88 | v86 | v87 | v85 | v84 | v83 | v82 | v81 | v80 | v79 | v78 | v77 | v76 | v75 | v74 | v73 | v72 | v71 | v70 | v69 | v68 | v67 | v56 | v57 | v58 | v59 | v60 | v61 | v62 | v63 | v65);

    v5 = self;
  }

  return v5;
}

- (NSString)tag
{
  return self->_tag;
}

- (_HMResidentCapabilitiesStruct)capabilities
{
  return self->_capabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
}

@end
