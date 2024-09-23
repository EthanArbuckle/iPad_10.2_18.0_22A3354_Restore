@implementation MRDeviceInfo

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v41;
  void *v42;
  void *v43;
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

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setDeviceClass:", -[MRDeviceInfo deviceClass](self, "deviceClass"));
  objc_msgSend(v5, "setHasDeviceClass:", -[MRDeviceInfo hasDeviceClass](self, "hasDeviceClass"));
  objc_msgSend(v5, "setProtocolVersion:", -[MRDeviceInfo protocolVersion](self, "protocolVersion"));
  objc_msgSend(v5, "setHasProtocolVersion:", -[MRDeviceInfo hasProtocolVersion](self, "hasProtocolVersion"));
  objc_msgSend(v5, "setGroupedDeviceCount:", -[MRDeviceInfo groupedDeviceCount](self, "groupedDeviceCount"));
  objc_msgSend(v5, "setHasGroupedDeviceCount:", -[MRDeviceInfo hasGroupedDeviceCount](self, "hasGroupedDeviceCount"));
  objc_msgSend(v5, "setSharedQueueVersion:", -[MRDeviceInfo sharedQueueVersion](self, "sharedQueueVersion"));
  objc_msgSend(v5, "setHasSharedQueueVersion:", -[MRDeviceInfo hasSharedQueueVersion](self, "hasSharedQueueVersion"));
  objc_msgSend(v5, "setGroupLogicalDeviceCount:", -[MRDeviceInfo groupLogicalDeviceCount](self, "groupLogicalDeviceCount"));
  objc_msgSend(v5, "setHasGroupLogicalDeviceCount:", -[MRDeviceInfo hasGroupLogicalDeviceCount](self, "hasGroupLogicalDeviceCount"));
  objc_msgSend(v5, "setSupportsSystemPairing:", -[MRDeviceInfo supportsSystemPairing](self, "supportsSystemPairing"));
  objc_msgSend(v5, "setHasSupportsSystemPairing:", -[MRDeviceInfo hasSupportsSystemPairing](self, "hasSupportsSystemPairing"));
  objc_msgSend(v5, "setSupportsACL:", -[MRDeviceInfo supportsACL](self, "supportsACL"));
  objc_msgSend(v5, "setHasSupportsACL:", -[MRDeviceInfo hasSupportsACL](self, "hasSupportsACL"));
  objc_msgSend(v5, "setSupportsSharedQueue:", -[MRDeviceInfo supportsSharedQueue](self, "supportsSharedQueue"));
  objc_msgSend(v5, "setHasSupportsSharedQueue:", -[MRDeviceInfo hasSupportsSharedQueue](self, "hasSupportsSharedQueue"));
  objc_msgSend(v5, "setSupportsExtendedMotion:", -[MRDeviceInfo supportsExtendedMotion](self, "supportsExtendedMotion"));
  objc_msgSend(v5, "setHasSupportsExtendedMotion:", -[MRDeviceInfo hasSupportsExtendedMotion](self, "hasSupportsExtendedMotion"));
  objc_msgSend(v5, "setTightSyncGroup:", -[MRDeviceInfo isTightSyncGroup](self, "isTightSyncGroup"));
  objc_msgSend(v5, "setHasTightSyncGroup:", -[MRDeviceInfo hasTightSyncGroup](self, "hasTightSyncGroup"));
  objc_msgSend(v5, "setPairingAllowed:", -[MRDeviceInfo isPairingAllowed](self, "isPairingAllowed"));
  objc_msgSend(v5, "setHasPairingAllowed:", -[MRDeviceInfo hasPairingAllowed](self, "hasPairingAllowed"));
  objc_msgSend(v5, "setProxyGroupPlayer:", -[MRDeviceInfo isProxyGroupPlayer](self, "isProxyGroupPlayer"));
  objc_msgSend(v5, "setHasProxyGroupPlayer:", -[MRDeviceInfo hasProxyGroupPlayer](self, "hasProxyGroupPlayer"));
  objc_msgSend(v5, "setConnected:", -[MRDeviceInfo isConnected](self, "isConnected"));
  objc_msgSend(v5, "setHasConnected:", -[MRDeviceInfo hasConnected](self, "hasConnected"));
  objc_msgSend(v5, "setGroupLeader:", -[MRDeviceInfo isGroupLeader](self, "isGroupLeader"));
  objc_msgSend(v5, "setHasGroupLeader:", -[MRDeviceInfo hasGroupLeader](self, "hasGroupLeader"));
  objc_msgSend(v5, "setAirPlayActive:", -[MRDeviceInfo isAirPlayActive](self, "isAirPlayActive"));
  objc_msgSend(v5, "setHasAirPlayActive:", -[MRDeviceInfo hasAirPlayActive](self, "hasAirPlayActive"));
  objc_msgSend(v5, "setSupportsMultiplayer:", -[MRDeviceInfo supportsMultiplayer](self, "supportsMultiplayer"));
  objc_msgSend(v5, "setHasSupportsMultiplayer:", -[MRDeviceInfo hasSupportsMultiplayer](self, "hasSupportsMultiplayer"));
  objc_msgSend(v5, "setParentGroupContainsDiscoverableGroupLeader:", -[MRDeviceInfo parentGroupContainsDiscoverableGroupLeader](self, "parentGroupContainsDiscoverableGroupLeader"));
  objc_msgSend(v5, "setHasParentGroupContainsDiscoverableGroupLeader:", -[MRDeviceInfo hasParentGroupContainsDiscoverableGroupLeader](self, "hasParentGroupContainsDiscoverableGroupLeader"));
  objc_msgSend(v5, "setGroupContainsDiscoverableGroupLeader:", -[MRDeviceInfo groupContainsDiscoverableGroupLeader](self, "groupContainsDiscoverableGroupLeader"));
  objc_msgSend(v5, "setHasGroupContainsDiscoverableGroupLeader:", -[MRDeviceInfo hasGroupContainsDiscoverableGroupLeader](self, "hasGroupContainsDiscoverableGroupLeader"));
  objc_msgSend(v5, "setIsEligibleForHostingGroupSessionExcludingAcknowledgements:", -[MRDeviceInfo isEligibleForHostingGroupSessionExcludingAcknowledgements](self, "isEligibleForHostingGroupSessionExcludingAcknowledgements"));
  objc_msgSend(v5, "setHasIsEligibleForHostingGroupSessionExcludingAcknowledgements:", -[MRDeviceInfo hasIsEligibleForHostingGroupSessionExcludingAcknowledgements](self, "hasIsEligibleForHostingGroupSessionExcludingAcknowledgements"));
  -[MRDeviceInfo name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setName:", v7);

  -[MRDeviceInfo identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setIdentifier:", v9);

  -[MRDeviceInfo localizedModelName](self, "localizedModelName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setLocalizedModelName:", v11);

  -[MRDeviceInfo buildVersion](self, "buildVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setBuildVersion:", v13);

  -[MRDeviceInfo bundleIdentifier](self, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  objc_msgSend(v5, "setBundleIdentifier:", v15);

  -[MRDeviceInfo bundleVersion](self, "bundleVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
  objc_msgSend(v5, "setBundleVersion:", v17);

  -[MRDeviceInfo systemMediaApplication](self, "systemMediaApplication");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
  objc_msgSend(v5, "setSystemMediaApplication:", v19);

  -[MRDeviceInfo systemPodcastApplication](self, "systemPodcastApplication");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copyWithZone:", a3);
  objc_msgSend(v5, "setSystemPodcastApplication:", v21);

  -[MRDeviceInfo systemBooksApplication](self, "systemBooksApplication");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copyWithZone:", a3);
  objc_msgSend(v5, "setSystemBooksApplication:", v23);

  -[MRDeviceInfo deviceUID](self, "deviceUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copyWithZone:", a3);
  objc_msgSend(v5, "setDeviceUID:", v25);

  -[MRDeviceInfo localReceiverPairingIdentity](self, "localReceiverPairingIdentity");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "copyWithZone:", a3);
  objc_msgSend(v5, "setLocalReceiverPairingIdentity:", v27);

  -[MRDeviceInfo managedConfigurationDeviceIdentifier](self, "managedConfigurationDeviceIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v28, "copyWithZone:", a3);
  objc_msgSend(v5, "setManagedConfigurationDeviceIdentifier:", v29);

  -[MRDeviceInfo tightSyncUID](self, "tightSyncUID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v30, "copyWithZone:", a3);
  objc_msgSend(v5, "setTightSyncUID:", v31);

  -[MRDeviceInfo groupUID](self, "groupUID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v32, "copyWithZone:", a3);
  objc_msgSend(v5, "setGroupUID:", v33);

  -[MRDeviceInfo airPlayGroupUID](self, "airPlayGroupUID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v34, "copyWithZone:", a3);
  objc_msgSend(v5, "setAirPlayGroupUID:", v35);

  -[MRDeviceInfo groupName](self, "groupName");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v36, "copyWithZone:", a3);
  objc_msgSend(v5, "setGroupName:", v37);

  -[MRDeviceInfo senderDefaultGroupUID](self, "senderDefaultGroupUID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v38, "copyWithZone:", a3);
  objc_msgSend(v5, "setSenderDefaultGroupUID:", v39);

  -[MRDeviceInfo bluetoothAddress](self, "bluetoothAddress");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v40, "copyWithZone:", a3);
  objc_msgSend(v5, "setBluetoothAddress:", v41);

  -[MRDeviceInfo groupedDevices](self, "groupedDevices");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v42, "copyWithZone:", a3);
  objc_msgSend(v5, "setGroupedDevices:", v43);

  -[MRDeviceInfo clusteredDevices](self, "clusteredDevices");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v44, "copyWithZone:", a3);
  objc_msgSend(v5, "setClusteredDevices:", v45);

  -[MRDeviceInfo allClusteredDevices](self, "allClusteredDevices");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(v46, "copyWithZone:", a3);
  objc_msgSend(v5, "setAllClusteredDevices:", v47);

  -[MRDeviceInfo airPlayReceivers](self, "airPlayReceivers");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_msgSend(v48, "copyWithZone:", a3);
  objc_msgSend(v5, "setAirPlayReceivers:", v49);

  -[MRDeviceInfo linkAgent](self, "linkAgent");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)objc_msgSend(v50, "copyWithZone:", a3);
  objc_msgSend(v5, "setLinkAgent:", v51);

  -[MRDeviceInfo clusterID](self, "clusterID");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)objc_msgSend(v52, "copyWithZone:", a3);
  objc_msgSend(v5, "setClusterID:", v53);

  -[MRDeviceInfo clusterLeaderID](self, "clusterLeaderID");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)objc_msgSend(v54, "copyWithZone:", a3);
  objc_msgSend(v5, "setClusterLeaderID:", v55);

  objc_msgSend(v5, "setClusterType:", -[MRDeviceInfo clusterType](self, "clusterType"));
  objc_msgSend(v5, "setClusterAware:", -[MRDeviceInfo isClusterAware](self, "isClusterAware"));
  objc_msgSend(v5, "setClusterLeader:", -[MRDeviceInfo isClusterLeader](self, "isClusterLeader"));
  objc_msgSend(v5, "setConfiguredClusterSize:", -[MRDeviceInfo configuredClusterSize](self, "configuredClusterSize"));
  -[MRDeviceInfo modelID](self, "modelID");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)objc_msgSend(v56, "copyWithZone:", a3);
  objc_msgSend(v5, "setModelID:", v57);

  -[MRDeviceInfo routingContextID](self, "routingContextID");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)objc_msgSend(v58, "copyWithZone:", a3);
  objc_msgSend(v5, "setRoutingContextID:", v59);

  objc_msgSend(v5, "setLastKnownClusterType:", -[MRDeviceInfo lastKnownClusterType](self, "lastKnownClusterType"));
  objc_msgSend(v5, "setSupportsOutputContextSync:", -[MRDeviceInfo supportsOutputContextSync](self, "supportsOutputContextSync"));
  -[MRDeviceInfo computerName](self, "computerName");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (void *)objc_msgSend(v60, "copyWithZone:", a3);
  objc_msgSend(v5, "setComputerName:", v61);

  objc_msgSend(v5, "setLastSupportedProtocolMessageType:", -[MRDeviceInfo lastSupportedProtocolMessageType](self, "lastSupportedProtocolMessageType"));
  -[MRDeviceInfo groupSessionToken](self, "groupSessionToken");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (void *)objc_msgSend(v62, "copyWithZone:", a3);
  objc_msgSend(v5, "setGroupSessionToken:", v63);

  -[MRDeviceInfo leaderDeviceInfo](self, "leaderDeviceInfo");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (void *)objc_msgSend(v64, "copyWithZone:", a3);
  objc_msgSend(v5, "setLeaderDeviceInfo:", v65);

  -[MRDeviceInfo activeSystemEndpointUID](self, "activeSystemEndpointUID");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (void *)objc_msgSend(v66, "copyWithZone:", a3);
  objc_msgSend(v5, "setActiveSystemEndpointUID:", v67);

  return v5;
}

- (NSString)deviceUID
{
  return self->_deviceUID;
}

- (NSString)airPlayGroupUID
{
  return self->_airPlayGroupUID;
}

- (BOOL)isGroupLeader
{
  return self->_groupLeader;
}

- (NSString)senderDefaultGroupUID
{
  return self->_senderDefaultGroupUID;
}

- (BOOL)isAirPlayActive
{
  return self->_airPlayActive;
}

- (BOOL)parentGroupContainsDiscoverableGroupLeader
{
  return self->_parentGroupContainsDiscoverableGroupLeader;
}

- (NSString)groupUID
{
  return self->_groupUID;
}

- (void)setPairingAllowed:(BOOL)a3
{
  self->_pairingAllowed = a3;
  self->_hasPairingAllowed = 1;
}

- (void)setHasPairingAllowed:(BOOL)a3
{
  self->_hasPairingAllowed = a3;
}

- (BOOL)supportsSystemPairing
{
  return self->_supportsSystemPairing;
}

- (BOOL)supportsSharedQueue
{
  return self->_supportsSharedQueue;
}

- (BOOL)supportsMultiplayer
{
  return self->_supportsMultiplayer;
}

- (BOOL)supportsExtendedMotion
{
  return self->_supportsExtendedMotion;
}

- (BOOL)supportsACL
{
  return self->_supportsACL;
}

- (unint64_t)sharedQueueVersion
{
  return self->_sharedQueueVersion;
}

- (unint64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isTightSyncGroup
{
  return self->_tightSyncGroup;
}

- (BOOL)isProxyGroupPlayer
{
  return self->_proxyGroupPlayer;
}

- (BOOL)isPairingAllowed
{
  return self->_pairingAllowed;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)hasTightSyncGroup
{
  return self->_hasTightSyncGroup;
}

- (BOOL)hasSupportsSystemPairing
{
  return self->_hasSupportsSystemPairing;
}

- (BOOL)hasSupportsSharedQueue
{
  return self->_hasSupportsSharedQueue;
}

- (BOOL)hasSupportsMultiplayer
{
  return self->_hasSupportsMultiplayer;
}

- (BOOL)hasSupportsExtendedMotion
{
  return self->_hasSupportsExtendedMotion;
}

- (BOOL)hasSupportsACL
{
  return self->_hasSupportsACL;
}

- (BOOL)hasSharedQueueVersion
{
  return self->_hasSharedQueueVersion;
}

- (BOOL)hasProxyGroupPlayer
{
  return self->_hasProxyGroupPlayer;
}

- (BOOL)hasParentGroupContainsDiscoverableGroupLeader
{
  return self->_hasParentGroupContainsDiscoverableGroupLeader;
}

- (BOOL)hasPairingAllowed
{
  return self->_hasPairingAllowed;
}

- (BOOL)hasGroupLogicalDeviceCount
{
  return self->_hasGroupLogicalDeviceCount;
}

- (BOOL)hasGroupLeader
{
  return self->_hasGroupLeader;
}

- (BOOL)hasGroupContainsDiscoverableGroupLeader
{
  return self->_hasGroupContainsDiscoverableGroupLeader;
}

- (BOOL)hasDeviceClass
{
  return self->_hasDeviceClass;
}

- (BOOL)hasConnected
{
  return self->_hasConnected;
}

- (BOOL)hasAirPlayActive
{
  return self->_hasAirPlayActive;
}

- (MRGroupSessionToken)groupSessionToken
{
  return self->_groupSessionToken;
}

- (unint64_t)groupLogicalDeviceCount
{
  return self->_groupLogicalDeviceCount;
}

- (BOOL)groupContainsDiscoverableGroupLeader
{
  return self->_groupContainsDiscoverableGroupLeader;
}

- (int64_t)deviceClass
{
  return self->_deviceClass;
}

- (BOOL)hasProtocolVersion
{
  return self->_hasProtocolVersion;
}

- (NSArray)groupedDevices
{
  return self->_groupedDevices;
}

- (void)setTightSyncGroup:(BOOL)a3
{
  self->_tightSyncGroup = a3;
  self->_hasTightSyncGroup = 1;
}

- (void)setSupportsSystemPairing:(BOOL)a3
{
  self->_supportsSystemPairing = a3;
  self->_hasSupportsSystemPairing = 1;
}

- (void)setSupportsSharedQueue:(BOOL)a3
{
  self->_supportsSharedQueue = a3;
  self->_hasSupportsSharedQueue = 1;
}

- (void)setSupportsMultiplayer:(BOOL)a3
{
  self->_supportsMultiplayer = a3;
  self->_hasSupportsMultiplayer = 1;
}

- (void)setSupportsExtendedMotion:(BOOL)a3
{
  self->_supportsExtendedMotion = a3;
  self->_hasSupportsExtendedMotion = 1;
}

- (void)setSupportsACL:(BOOL)a3
{
  self->_supportsACL = a3;
  self->_hasSupportsACL = 1;
}

- (void)setSharedQueueVersion:(unint64_t)a3
{
  self->_sharedQueueVersion = a3;
  self->_hasSharedQueueVersion = 1;
}

- (void)setProxyGroupPlayer:(BOOL)a3
{
  self->_proxyGroupPlayer = a3;
  self->_hasProxyGroupPlayer = 1;
}

- (void)setProtocolVersion:(unint64_t)a3
{
  self->_protocolVersion = a3;
  self->_hasProtocolVersion = 1;
}

- (void)setParentGroupContainsDiscoverableGroupLeader:(BOOL)a3
{
  self->_parentGroupContainsDiscoverableGroupLeader = a3;
  self->_hasParentGroupContainsDiscoverableGroupLeader = 1;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setHasTightSyncGroup:(BOOL)a3
{
  self->_hasTightSyncGroup = a3;
}

- (void)setHasSupportsSystemPairing:(BOOL)a3
{
  self->_hasSupportsSystemPairing = a3;
}

- (void)setHasSupportsSharedQueue:(BOOL)a3
{
  self->_hasSupportsSharedQueue = a3;
}

- (void)setHasSupportsMultiplayer:(BOOL)a3
{
  self->_hasSupportsMultiplayer = a3;
}

- (void)setHasSupportsExtendedMotion:(BOOL)a3
{
  self->_hasSupportsExtendedMotion = a3;
}

- (void)setHasSupportsACL:(BOOL)a3
{
  self->_hasSupportsACL = a3;
}

- (void)setHasSharedQueueVersion:(BOOL)a3
{
  self->_hasSharedQueueVersion = a3;
}

- (void)setHasProxyGroupPlayer:(BOOL)a3
{
  self->_hasProxyGroupPlayer = a3;
}

- (void)setHasProtocolVersion:(BOOL)a3
{
  self->_hasProtocolVersion = a3;
}

- (void)setHasParentGroupContainsDiscoverableGroupLeader:(BOOL)a3
{
  self->_hasParentGroupContainsDiscoverableGroupLeader = a3;
}

- (void)setHasGroupedDeviceCount:(BOOL)a3
{
  self->_hasGroupedDeviceCount = a3;
}

- (void)setHasGroupLogicalDeviceCount:(BOOL)a3
{
  self->_hasGroupLogicalDeviceCount = a3;
}

- (void)setHasGroupLeader:(BOOL)a3
{
  self->_hasGroupLeader = a3;
}

- (void)setHasGroupContainsDiscoverableGroupLeader:(BOOL)a3
{
  self->_hasGroupContainsDiscoverableGroupLeader = a3;
}

- (void)setHasDeviceClass:(BOOL)a3
{
  self->_hasDeviceClass = a3;
}

- (void)setHasConnected:(BOOL)a3
{
  self->_hasConnected = a3;
}

- (void)setHasAirPlayActive:(BOOL)a3
{
  self->_hasAirPlayActive = a3;
}

- (void)setGroupedDeviceCount:(unint64_t)a3
{
  self->_groupedDeviceCount = a3;
  self->_hasGroupedDeviceCount = 1;
}

- (void)setGroupLogicalDeviceCount:(unint64_t)a3
{
  self->_groupLogicalDeviceCount = a3;
  self->_hasGroupLogicalDeviceCount = 1;
}

- (void)setGroupLeader:(BOOL)a3
{
  self->_groupLeader = a3;
  self->_hasGroupLeader = 1;
}

- (void)setGroupContainsDiscoverableGroupLeader:(BOOL)a3
{
  self->_groupContainsDiscoverableGroupLeader = a3;
  self->_hasGroupContainsDiscoverableGroupLeader = 1;
}

- (void)setDeviceClass:(int64_t)a3
{
  self->_deviceClass = a3;
  self->_hasDeviceClass = 1;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
  self->_hasConnected = 1;
}

- (void)setAirPlayActive:(BOOL)a3
{
  self->_airPlayActive = a3;
  self->_hasAirPlayActive = 1;
}

- (BOOL)hasGroupedDeviceCount
{
  return self->_hasGroupedDeviceCount;
}

- (unint64_t)groupedDeviceCount
{
  return self->_groupedDeviceCount;
}

- (NSString)systemMediaApplication
{
  return self->_systemMediaApplication;
}

- (NSString)tightSyncUID
{
  return self->_tightSyncUID;
}

- (NSString)systemPodcastApplication
{
  return self->_systemPodcastApplication;
}

- (NSString)systemBooksApplication
{
  return self->_systemBooksApplication;
}

- (BOOL)supportsOutputContextSync
{
  return self->_supportsOutputContextSync;
}

- (NSString)routingContextID
{
  return self->_routingContextID;
}

- (NSString)modelID
{
  return self->_modelID;
}

- (NSString)managedConfigurationDeviceIdentifier
{
  return self->_managedConfigurationDeviceIdentifier;
}

- (NSString)localizedModelName
{
  return self->_localizedModelName;
}

- (NSString)linkAgent
{
  return self->_linkAgent;
}

- (MRDeviceInfo)leaderDeviceInfo
{
  return self->_leaderDeviceInfo;
}

- (unint64_t)lastSupportedProtocolMessageType
{
  return self->_lastSupportedProtocolMessageType;
}

- (unsigned)lastKnownClusterType
{
  return self->_lastKnownClusterType;
}

- (BOOL)isClusterAware
{
  return self->_clusterAware;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (unint64_t)configuredClusterSize
{
  return self->_configuredClusterSize;
}

- (NSString)computerName
{
  return self->_computerName;
}

- (NSArray)clusteredDevices
{
  return self->_clusteredDevices;
}

- (unsigned)clusterType
{
  return self->_clusterType;
}

- (NSString)clusterLeaderID
{
  return self->_clusterLeaderID;
}

- (NSString)clusterID
{
  return self->_clusterID;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSData)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (NSArray)allClusteredDevices
{
  return self->_allClusteredDevices;
}

- (NSArray)airPlayReceivers
{
  return self->_airPlayReceivers;
}

- (void)setRoutingContextID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (void)setTightSyncUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void)setSystemPodcastApplication:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)setSystemMediaApplication:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setSystemBooksApplication:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setSupportsOutputContextSync:(BOOL)a3
{
  self->_supportsOutputContextSync = a3;
}

- (void)setSenderDefaultGroupUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (void)setModelID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (void)setManagedConfigurationDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void)setLocalizedModelName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setLocalReceiverPairingIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void)setLinkAgent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void)setLeaderDeviceInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (void)setLastSupportedProtocolMessageType:(unint64_t)a3
{
  self->_lastSupportedProtocolMessageType = a3;
}

- (void)setLastKnownClusterType:(unsigned int)a3
{
  self->_lastKnownClusterType = a3;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setGroupedDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void)setGroupUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void)setGroupSessionToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (void)setGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void)setDeviceUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void)setConfiguredClusterSize:(unint64_t)a3
{
  self->_configuredClusterSize = a3;
}

- (void)setComputerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (void)setClusteredDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void)setClusterType:(unsigned int)a3
{
  self->_clusterType = a3;
}

- (void)setClusterLeaderID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void)setClusterID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (void)setClusterAware:(BOOL)a3
{
  self->_clusterAware = a3;
}

- (void)setBundleVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setBuildVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setBluetoothAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void)setAllClusteredDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void)setAirPlayReceivers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (void)setAirPlayGroupUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSString)localReceiverPairingIdentity
{
  return self->_localReceiverPairingIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSystemEndpointUID, 0);
  objc_storeStrong((id *)&self->_leaderDeviceInfo, 0);
  objc_storeStrong((id *)&self->_groupSessionToken, 0);
  objc_storeStrong((id *)&self->_computerName, 0);
  objc_storeStrong((id *)&self->_routingContextID, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_clusterLeaderID, 0);
  objc_storeStrong((id *)&self->_clusterID, 0);
  objc_storeStrong((id *)&self->_linkAgent, 0);
  objc_storeStrong((id *)&self->_airPlayReceivers, 0);
  objc_storeStrong((id *)&self->_allClusteredDevices, 0);
  objc_storeStrong((id *)&self->_clusteredDevices, 0);
  objc_storeStrong((id *)&self->_groupedDevices, 0);
  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
  objc_storeStrong((id *)&self->_senderDefaultGroupUID, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_airPlayGroupUID, 0);
  objc_storeStrong((id *)&self->_groupUID, 0);
  objc_storeStrong((id *)&self->_tightSyncUID, 0);
  objc_storeStrong((id *)&self->_managedConfigurationDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_localReceiverPairingIdentity, 0);
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_systemBooksApplication, 0);
  objc_storeStrong((id *)&self->_systemPodcastApplication, 0);
  objc_storeStrong((id *)&self->_systemMediaApplication, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_localizedModelName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSData)data
{
  void *v2;
  void *v3;

  -[MRDeviceInfo protobuf](self, "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (MRDeviceInfo)initWithData:(id)a3
{
  id v4;
  _MRDeviceInfoMessageProtobuf *v5;
  MRDeviceInfo *v6;

  v4 = a3;
  if (v4)
  {
    v5 = -[_MRDeviceInfoMessageProtobuf initWithData:]([_MRDeviceInfoMessageProtobuf alloc], "initWithData:", v4);
    v6 = -[MRDeviceInfo initWithProtobuf:](self, "initWithProtobuf:", v5);

  }
  else
  {
    v6 = -[MRDeviceInfo initWithProtobuf:](self, "initWithProtobuf:", 0);
  }

  return v6;
}

- (_MRDeviceInfoMessageProtobuf)protobuf
{
  _MRDeviceInfoMessageProtobuf *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v41;
  void *v42;
  void *v43;
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

  v3 = objc_alloc_init(_MRDeviceInfoMessageProtobuf);
  -[_MRDeviceInfoMessageProtobuf setProtocolVersion:](v3, "setProtocolVersion:", -[MRDeviceInfo protocolVersion](self, "protocolVersion"));
  -[_MRDeviceInfoMessageProtobuf setHasProtocolVersion:](v3, "setHasProtocolVersion:", -[MRDeviceInfo hasProtocolVersion](self, "hasProtocolVersion"));
  -[_MRDeviceInfoMessageProtobuf setDeviceClass:](v3, "setDeviceClass:", _MRDeviceInfoMessageProtobuf_DeviceClassFromModel(-[MRDeviceInfo deviceClass](self, "deviceClass")));
  -[_MRDeviceInfoMessageProtobuf setHasDeviceClass:](v3, "setHasDeviceClass:", -[MRDeviceInfo hasDeviceClass](self, "hasDeviceClass"));
  -[_MRDeviceInfoMessageProtobuf setTightlySyncedGroup:](v3, "setTightlySyncedGroup:", -[MRDeviceInfo isTightSyncGroup](self, "isTightSyncGroup"));
  -[_MRDeviceInfoMessageProtobuf setHasTightlySyncedGroup:](v3, "setHasTightlySyncedGroup:", -[MRDeviceInfo hasTightSyncGroup](self, "hasTightSyncGroup"));
  -[_MRDeviceInfoMessageProtobuf setAllowsPairing:](v3, "setAllowsPairing:", -[MRDeviceInfo isPairingAllowed](self, "isPairingAllowed"));
  -[_MRDeviceInfoMessageProtobuf setHasAllowsPairing:](v3, "setHasAllowsPairing:", -[MRDeviceInfo hasPairingAllowed](self, "hasPairingAllowed"));
  -[_MRDeviceInfoMessageProtobuf setSupportsSystemPairing:](v3, "setSupportsSystemPairing:", -[MRDeviceInfo supportsSystemPairing](self, "supportsSystemPairing"));
  -[_MRDeviceInfoMessageProtobuf setHasSupportsSystemPairing:](v3, "setHasSupportsSystemPairing:", -[MRDeviceInfo hasSupportsSystemPairing](self, "hasSupportsSystemPairing"));
  -[_MRDeviceInfoMessageProtobuf setSupportsACL:](v3, "setSupportsACL:", -[MRDeviceInfo supportsACL](self, "supportsACL"));
  -[_MRDeviceInfoMessageProtobuf setHasSupportsACL:](v3, "setHasSupportsACL:", -[MRDeviceInfo hasSupportsACL](self, "hasSupportsACL"));
  -[_MRDeviceInfoMessageProtobuf setSupportsSharedQueue:](v3, "setSupportsSharedQueue:", -[MRDeviceInfo supportsSharedQueue](self, "supportsSharedQueue"));
  -[_MRDeviceInfoMessageProtobuf setHasSupportsSharedQueue:](v3, "setHasSupportsSharedQueue:", -[MRDeviceInfo hasSupportsSharedQueue](self, "hasSupportsSharedQueue"));
  -[_MRDeviceInfoMessageProtobuf setSharedQueueVersion:](v3, "setSharedQueueVersion:", -[MRDeviceInfo sharedQueueVersion](self, "sharedQueueVersion"));
  -[_MRDeviceInfoMessageProtobuf setHasSharedQueueVersion:](v3, "setHasSharedQueueVersion:", -[MRDeviceInfo hasSharedQueueVersion](self, "hasSharedQueueVersion"));
  -[_MRDeviceInfoMessageProtobuf setIsProxyGroupPlayer:](v3, "setIsProxyGroupPlayer:", -[MRDeviceInfo isProxyGroupPlayer](self, "isProxyGroupPlayer"));
  -[_MRDeviceInfoMessageProtobuf setHasIsProxyGroupPlayer:](v3, "setHasIsProxyGroupPlayer:", -[MRDeviceInfo hasProxyGroupPlayer](self, "hasProxyGroupPlayer"));
  -[_MRDeviceInfoMessageProtobuf setConnected:](v3, "setConnected:", -[MRDeviceInfo isConnected](self, "isConnected"));
  -[_MRDeviceInfoMessageProtobuf setHasConnected:](v3, "setHasConnected:", -[MRDeviceInfo hasConnected](self, "hasConnected"));
  -[_MRDeviceInfoMessageProtobuf setSupportsExtendedMotion:](v3, "setSupportsExtendedMotion:", -[MRDeviceInfo supportsExtendedMotion](self, "supportsExtendedMotion"));
  -[_MRDeviceInfoMessageProtobuf setHasSupportsExtendedMotion:](v3, "setHasSupportsExtendedMotion:", -[MRDeviceInfo hasSupportsExtendedMotion](self, "hasSupportsExtendedMotion"));
  -[_MRDeviceInfoMessageProtobuf setLogicalDeviceCount:](v3, "setLogicalDeviceCount:", -[MRDeviceInfo groupLogicalDeviceCount](self, "groupLogicalDeviceCount"));
  -[_MRDeviceInfoMessageProtobuf setHasLogicalDeviceCount:](v3, "setHasLogicalDeviceCount:", -[MRDeviceInfo hasGroupLogicalDeviceCount](self, "hasGroupLogicalDeviceCount"));
  -[_MRDeviceInfoMessageProtobuf setIsGroupLeader:](v3, "setIsGroupLeader:", -[MRDeviceInfo isGroupLeader](self, "isGroupLeader"));
  -[_MRDeviceInfoMessageProtobuf setHasIsGroupLeader:](v3, "setHasIsGroupLeader:", -[MRDeviceInfo hasGroupLeader](self, "hasGroupLeader"));
  -[_MRDeviceInfoMessageProtobuf setIsAirplayActive:](v3, "setIsAirplayActive:", -[MRDeviceInfo isAirPlayActive](self, "isAirPlayActive"));
  -[_MRDeviceInfoMessageProtobuf setHasIsAirplayActive:](v3, "setHasIsAirplayActive:", -[MRDeviceInfo hasAirPlayActive](self, "hasAirPlayActive"));
  -[_MRDeviceInfoMessageProtobuf setSupportsMultiplayer:](v3, "setSupportsMultiplayer:", -[MRDeviceInfo supportsMultiplayer](self, "supportsMultiplayer"));
  -[_MRDeviceInfoMessageProtobuf setHasSupportsMultiplayer:](v3, "setHasSupportsMultiplayer:", -[MRDeviceInfo hasSupportsMultiplayer](self, "hasSupportsMultiplayer"));
  -[_MRDeviceInfoMessageProtobuf setParentGroupContainsDiscoverableGroupLeader:](v3, "setParentGroupContainsDiscoverableGroupLeader:", -[MRDeviceInfo parentGroupContainsDiscoverableGroupLeader](self, "parentGroupContainsDiscoverableGroupLeader"));
  -[_MRDeviceInfoMessageProtobuf setHasParentGroupContainsDiscoverableGroupLeader:](v3, "setHasParentGroupContainsDiscoverableGroupLeader:", -[MRDeviceInfo hasParentGroupContainsDiscoverableGroupLeader](self, "hasParentGroupContainsDiscoverableGroupLeader"));
  -[_MRDeviceInfoMessageProtobuf setGroupContainsDiscoverableGroupLeader:](v3, "setGroupContainsDiscoverableGroupLeader:", -[MRDeviceInfo groupContainsDiscoverableGroupLeader](self, "groupContainsDiscoverableGroupLeader"));
  -[_MRDeviceInfoMessageProtobuf setHasGroupContainsDiscoverableGroupLeader:](v3, "setHasGroupContainsDiscoverableGroupLeader:", -[MRDeviceInfo hasGroupContainsDiscoverableGroupLeader](self, "hasGroupContainsDiscoverableGroupLeader"));
  -[_MRDeviceInfoMessageProtobuf setHasPreferredEncoding:](v3, "setHasPreferredEncoding:", -[MRDeviceInfo hasPreferredEncoding](self, "hasPreferredEncoding"));
  -[_MRDeviceInfoMessageProtobuf setPreferredEncoding:](v3, "setPreferredEncoding:", -[MRDeviceInfo preferredEncoding](self, "preferredEncoding") == 1);
  -[_MRDeviceInfoMessageProtobuf setHasIsEligibleForHostingGroupSessionExcludingAcknowledgements:](v3, "setHasIsEligibleForHostingGroupSessionExcludingAcknowledgements:", -[MRDeviceInfo hasIsEligibleForHostingGroupSessionExcludingAcknowledgements](self, "hasIsEligibleForHostingGroupSessionExcludingAcknowledgements"));
  -[_MRDeviceInfoMessageProtobuf setIsEligibleForHostingGroupSessionExcludingAcknowledgements:](v3, "setIsEligibleForHostingGroupSessionExcludingAcknowledgements:", -[MRDeviceInfo isEligibleForHostingGroupSessionExcludingAcknowledgements](self, "isEligibleForHostingGroupSessionExcludingAcknowledgements"));
  -[MRDeviceInfo name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  -[_MRDeviceInfoMessageProtobuf setName:](v3, "setName:", v5);

  -[MRDeviceInfo identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  -[_MRDeviceInfoMessageProtobuf setUniqueIdentifier:](v3, "setUniqueIdentifier:", v7);

  -[MRDeviceInfo localizedModelName](self, "localizedModelName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  -[_MRDeviceInfoMessageProtobuf setLocalizedModelName:](v3, "setLocalizedModelName:", v9);

  -[MRDeviceInfo buildVersion](self, "buildVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  -[_MRDeviceInfoMessageProtobuf setSystemBuildVersion:](v3, "setSystemBuildVersion:", v11);

  -[MRDeviceInfo bundleIdentifier](self, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  -[_MRDeviceInfoMessageProtobuf setApplicationBundleIdentifier:](v3, "setApplicationBundleIdentifier:", v13);

  -[MRDeviceInfo bundleVersion](self, "bundleVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");
  -[_MRDeviceInfoMessageProtobuf setApplicationBundleVersion:](v3, "setApplicationBundleVersion:", v15);

  -[MRDeviceInfo systemMediaApplication](self, "systemMediaApplication");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");
  -[_MRDeviceInfoMessageProtobuf setSystemMediaApplication:](v3, "setSystemMediaApplication:", v17);

  -[MRDeviceInfo systemPodcastApplication](self, "systemPodcastApplication");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");
  -[_MRDeviceInfoMessageProtobuf setSystemPodcastApplication:](v3, "setSystemPodcastApplication:", v19);

  -[MRDeviceInfo systemBooksApplication](self, "systemBooksApplication");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copy");
  -[_MRDeviceInfoMessageProtobuf setSystemBooksApplication:](v3, "setSystemBooksApplication:", v21);

  -[MRDeviceInfo deviceUID](self, "deviceUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copy");
  -[_MRDeviceInfoMessageProtobuf setDeviceUID:](v3, "setDeviceUID:", v23);

  -[MRDeviceInfo managedConfigurationDeviceIdentifier](self, "managedConfigurationDeviceIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copy");
  -[_MRDeviceInfoMessageProtobuf setManagedConfigDeviceID:](v3, "setManagedConfigDeviceID:", v25);

  -[MRDeviceInfo tightSyncUID](self, "tightSyncUID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "copy");
  -[_MRDeviceInfoMessageProtobuf setTightSyncUID:](v3, "setTightSyncUID:", v27);

  -[MRDeviceInfo groupUID](self, "groupUID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v28, "copy");
  -[_MRDeviceInfoMessageProtobuf setGroupUID:](v3, "setGroupUID:", v29);

  -[MRDeviceInfo airPlayGroupUID](self, "airPlayGroupUID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRDeviceInfoMessageProtobuf setAirPlayGroupID:](v3, "setAirPlayGroupID:", v30);

  -[MRDeviceInfo groupName](self, "groupName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "copy");
  -[_MRDeviceInfoMessageProtobuf setGroupName:](v3, "setGroupName:", v32);

  -[MRDeviceInfo senderDefaultGroupUID](self, "senderDefaultGroupUID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "copy");
  -[_MRDeviceInfoMessageProtobuf setSenderDefaultGroupUID:](v3, "setSenderDefaultGroupUID:", v34);

  -[MRDeviceInfo bluetoothAddress](self, "bluetoothAddress");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "copy");
  -[_MRDeviceInfoMessageProtobuf setBluetoothAddress:](v3, "setBluetoothAddress:", v36);

  -[MRDeviceInfo airPlayReceivers](self, "airPlayReceivers");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "copy");
  -[_MRDeviceInfoMessageProtobuf setAirplayReceivers:](v3, "setAirplayReceivers:", v38);

  -[MRDeviceInfo linkAgent](self, "linkAgent");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "copy");
  -[_MRDeviceInfoMessageProtobuf setLinkAgent:](v3, "setLinkAgent:", v40);

  -[MRDeviceInfo clusterID](self, "clusterID");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v41, "copy");
  -[_MRDeviceInfoMessageProtobuf setClusterID:](v3, "setClusterID:", v42);

  -[MRDeviceInfo clusterLeaderID](self, "clusterLeaderID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v43, "copy");
  -[_MRDeviceInfoMessageProtobuf setClusterLeaderID:](v3, "setClusterLeaderID:", v44);

  -[_MRDeviceInfoMessageProtobuf setClusterType:](v3, "setClusterType:", -[MRDeviceInfo clusterType](self, "clusterType"));
  -[_MRDeviceInfoMessageProtobuf setIsClusterAware:](v3, "setIsClusterAware:", -[MRDeviceInfo isClusterAware](self, "isClusterAware"));
  -[_MRDeviceInfoMessageProtobuf setIsClusterLeader:](v3, "setIsClusterLeader:", -[MRDeviceInfo isClusterLeader](self, "isClusterLeader"));
  -[MRDeviceInfo computerName](self, "computerName");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v45, "copy");
  -[_MRDeviceInfoMessageProtobuf setComputerName:](v3, "setComputerName:", v46);

  -[_MRDeviceInfoMessageProtobuf setConfiguredClusterSize:](v3, "setConfiguredClusterSize:", -[MRDeviceInfo configuredClusterSize](self, "configuredClusterSize"));
  -[MRDeviceInfo modelID](self, "modelID");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRDeviceInfoMessageProtobuf setModelID:](v3, "setModelID:", v47);

  -[MRDeviceInfo routingContextID](self, "routingContextID");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRDeviceInfoMessageProtobuf setRoutingContextID:](v3, "setRoutingContextID:", v48);

  -[_MRDeviceInfoMessageProtobuf setLastKnownClusterType:](v3, "setLastKnownClusterType:", -[MRDeviceInfo lastKnownClusterType](self, "lastKnownClusterType"));
  -[_MRDeviceInfoMessageProtobuf setSupportsOutputContextSync:](v3, "setSupportsOutputContextSync:", -[MRDeviceInfo supportsOutputContextSync](self, "supportsOutputContextSync"));
  -[MRDeviceInfo activeSystemEndpointUID](self, "activeSystemEndpointUID");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRDeviceInfoMessageProtobuf setActiveSystemEndpointUID:](v3, "setActiveSystemEndpointUID:", v49);

  -[_MRDeviceInfoMessageProtobuf setLastSupportedMessageType:](v3, "setLastSupportedMessageType:", -[MRDeviceInfo lastSupportedProtocolMessageType](self, "lastSupportedProtocolMessageType"));
  -[MRDeviceInfo groupSessionToken](self, "groupSessionToken");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    -[MRDeviceInfo groupSessionToken](self, "groupSessionToken");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "protobuf");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRDeviceInfoMessageProtobuf setGroupSessionToken:](v3, "setGroupSessionToken:", v52);

  }
  -[MRDeviceInfo leaderDeviceInfo](self, "leaderDeviceInfo");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    -[MRDeviceInfo leaderDeviceInfo](self, "leaderDeviceInfo");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "protobuf");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRDeviceInfoMessageProtobuf setLeaderDeviceInfo:](v3, "setLeaderDeviceInfo:", v55);

  }
  -[MRDeviceInfo groupedDevices](self, "groupedDevices");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "mr_map:", &__block_literal_global_16_0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)objc_msgSend(v57, "mutableCopy");
  -[_MRDeviceInfoMessageProtobuf setGroupedDevices:](v3, "setGroupedDevices:", v58);

  -[MRDeviceInfo clusteredDevices](self, "clusteredDevices");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "mr_map:", &__block_literal_global_17_0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (void *)objc_msgSend(v60, "mutableCopy");
  -[_MRDeviceInfoMessageProtobuf setClusteredDevices:](v3, "setClusteredDevices:", v61);

  -[MRDeviceInfo allClusteredDevices](self, "allClusteredDevices");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "mr_map:", &__block_literal_global_18_0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)objc_msgSend(v63, "mutableCopy");
  -[_MRDeviceInfoMessageProtobuf setAllClusteredDevices:](v3, "setAllClusteredDevices:", v64);

  return v3;
}

- (MRDeviceInfo)initWithProtobuf:(id)a3
{
  id v4;
  MRDeviceInfo *v5;
  void *v6;
  uint64_t v7;
  NSString *name;
  void *v9;
  uint64_t v10;
  NSString *identifier;
  void *v12;
  uint64_t v13;
  NSString *localizedModelName;
  void *v15;
  uint64_t v16;
  NSString *buildVersion;
  void *v18;
  uint64_t v19;
  NSString *bundleIdentifier;
  void *v21;
  uint64_t v22;
  NSString *bundleVersion;
  void *v24;
  uint64_t v25;
  NSString *systemMediaApplication;
  void *v27;
  uint64_t v28;
  NSString *systemPodcastApplication;
  void *v30;
  uint64_t v31;
  NSString *systemBooksApplication;
  void *v33;
  uint64_t v34;
  NSString *deviceUID;
  void *v36;
  uint64_t v37;
  NSString *managedConfigurationDeviceIdentifier;
  void *v39;
  uint64_t v40;
  NSString *tightSyncUID;
  void *v42;
  uint64_t v43;
  NSString *groupUID;
  void *v45;
  uint64_t v46;
  NSString *airPlayGroupUID;
  void *v48;
  uint64_t v49;
  NSString *groupName;
  void *v51;
  uint64_t v52;
  NSString *senderDefaultGroupUID;
  void *v54;
  uint64_t v55;
  NSData *bluetoothAddress;
  void *v57;
  uint64_t v58;
  NSArray *airPlayReceivers;
  void *v60;
  uint64_t v61;
  NSString *linkAgent;
  void *v63;
  uint64_t v64;
  NSString *clusterID;
  void *v66;
  uint64_t v67;
  NSString *clusterLeaderID;
  void *v69;
  uint64_t v70;
  NSString *modelID;
  void *v72;
  uint64_t v73;
  NSString *routingContextID;
  void *v75;
  uint64_t v76;
  NSString *computerName;
  uint64_t v78;
  NSString *activeSystemEndpointUID;
  void *v80;
  MRGroupSessionToken *v81;
  MRGroupSessionToken *groupSessionToken;
  void *v83;
  MRDeviceInfo *v84;
  void *v85;
  uint64_t v86;
  MRDeviceInfo *leaderDeviceInfo;
  void *v88;
  uint64_t v89;
  NSArray *groupedDevices;
  void *v91;
  uint64_t v92;
  NSArray *clusteredDevices;
  void *v94;
  uint64_t v95;
  NSArray *allClusteredDevices;
  MRDeviceInfo *v97;
  objc_super v99;

  v4 = a3;
  if (v4)
  {
    v99.receiver = self;
    v99.super_class = (Class)MRDeviceInfo;
    v5 = -[MRDeviceInfo init](&v99, sel_init);
    if (v5)
    {
      v5->_protocolVersion = objc_msgSend(v4, "protocolVersion");
      v5->_hasProtocolVersion = objc_msgSend(v4, "hasProtocolVersion");
      v5->_deviceClass = MRDeviceClassFromProtobuf(objc_msgSend(v4, "deviceClass"));
      v5->_hasDeviceClass = objc_msgSend(v4, "hasDeviceClass");
      v5->_groupedDeviceCount = objc_msgSend(v4, "groupedDevicesCount");
      v5->_tightSyncGroup = objc_msgSend(v4, "tightlySyncedGroup");
      v5->_hasTightSyncGroup = objc_msgSend(v4, "hasTightlySyncedGroup");
      v5->_pairingAllowed = objc_msgSend(v4, "allowsPairing");
      v5->_hasPairingAllowed = objc_msgSend(v4, "hasAllowsPairing");
      v5->_supportsSystemPairing = objc_msgSend(v4, "supportsSystemPairing");
      v5->_hasSupportsSystemPairing = objc_msgSend(v4, "hasSupportsSystemPairing");
      v5->_supportsACL = objc_msgSend(v4, "supportsACL");
      v5->_hasSupportsACL = objc_msgSend(v4, "hasSupportsACL");
      v5->_supportsSharedQueue = objc_msgSend(v4, "supportsSharedQueue");
      v5->_hasSupportsSharedQueue = objc_msgSend(v4, "hasSupportsSharedQueue");
      v5->_sharedQueueVersion = objc_msgSend(v4, "sharedQueueVersion");
      v5->_hasSharedQueueVersion = objc_msgSend(v4, "hasSharedQueueVersion");
      v5->_proxyGroupPlayer = objc_msgSend(v4, "isProxyGroupPlayer");
      v5->_hasProxyGroupPlayer = objc_msgSend(v4, "hasIsProxyGroupPlayer");
      v5->_connected = objc_msgSend(v4, "connected");
      v5->_hasConnected = objc_msgSend(v4, "hasConnected");
      v5->_supportsExtendedMotion = objc_msgSend(v4, "supportsExtendedMotion");
      v5->_hasSupportsExtendedMotion = objc_msgSend(v4, "hasSupportsExtendedMotion");
      v5->_groupLogicalDeviceCount = objc_msgSend(v4, "logicalDeviceCount");
      v5->_groupLeader = objc_msgSend(v4, "isGroupLeader");
      v5->_hasGroupLeader = objc_msgSend(v4, "hasIsGroupLeader");
      v5->_airPlayActive = objc_msgSend(v4, "isAirplayActive");
      v5->_hasAirPlayActive = objc_msgSend(v4, "hasIsAirplayActive");
      v5->_supportsMultiplayer = objc_msgSend(v4, "supportsMultiplayer");
      v5->_hasSupportsMultiplayer = objc_msgSend(v4, "hasSupportsMultiplayer");
      v5->_parentGroupContainsDiscoverableGroupLeader = objc_msgSend(v4, "parentGroupContainsDiscoverableGroupLeader");
      v5->_hasParentGroupContainsDiscoverableGroupLeader = objc_msgSend(v4, "hasParentGroupContainsDiscoverableGroupLeader");
      v5->_groupContainsDiscoverableGroupLeader = objc_msgSend(v4, "groupContainsDiscoverableGroupLeader");
      v5->_hasGroupContainsDiscoverableGroupLeader = objc_msgSend(v4, "hasGroupContainsDiscoverableGroupLeader");
      v5->_preferredEncoding = objc_msgSend(v4, "preferredEncoding") == 1;
      v5->_hasPreferredEncoding = objc_msgSend(v4, "hasPreferredEncoding");
      v5->_isEligibleForHostingGroupSessionExcludingAcknowledgements = objc_msgSend(v4, "isEligibleForHostingGroupSessionExcludingAcknowledgements");
      v5->_hasIsEligibleForHostingGroupSessionExcludingAcknowledgements = objc_msgSend(v4, "hasIsEligibleForHostingGroupSessionExcludingAcknowledgements");
      objc_msgSend(v4, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "copy");
      name = v5->_name;
      v5->_name = (NSString *)v7;

      objc_msgSend(v4, "uniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "copy");
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v10;

      objc_msgSend(v4, "localizedModelName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "copy");
      localizedModelName = v5->_localizedModelName;
      v5->_localizedModelName = (NSString *)v13;

      objc_msgSend(v4, "systemBuildVersion");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "copy");
      buildVersion = v5->_buildVersion;
      v5->_buildVersion = (NSString *)v16;

      objc_msgSend(v4, "applicationBundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "copy");
      bundleIdentifier = v5->_bundleIdentifier;
      v5->_bundleIdentifier = (NSString *)v19;

      objc_msgSend(v4, "applicationBundleVersion");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "copy");
      bundleVersion = v5->_bundleVersion;
      v5->_bundleVersion = (NSString *)v22;

      objc_msgSend(v4, "systemMediaApplication");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "copy");
      systemMediaApplication = v5->_systemMediaApplication;
      v5->_systemMediaApplication = (NSString *)v25;

      objc_msgSend(v4, "systemPodcastApplication");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "copy");
      systemPodcastApplication = v5->_systemPodcastApplication;
      v5->_systemPodcastApplication = (NSString *)v28;

      objc_msgSend(v4, "systemBooksApplication");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "copy");
      systemBooksApplication = v5->_systemBooksApplication;
      v5->_systemBooksApplication = (NSString *)v31;

      objc_msgSend(v4, "deviceUID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "copy");
      deviceUID = v5->_deviceUID;
      v5->_deviceUID = (NSString *)v34;

      objc_msgSend(v4, "managedConfigDeviceID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "copy");
      managedConfigurationDeviceIdentifier = v5->_managedConfigurationDeviceIdentifier;
      v5->_managedConfigurationDeviceIdentifier = (NSString *)v37;

      objc_msgSend(v4, "tightSyncUID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "copy");
      tightSyncUID = v5->_tightSyncUID;
      v5->_tightSyncUID = (NSString *)v40;

      objc_msgSend(v4, "groupUID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "copy");
      groupUID = v5->_groupUID;
      v5->_groupUID = (NSString *)v43;

      objc_msgSend(v4, "airPlayGroupID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "copy");
      airPlayGroupUID = v5->_airPlayGroupUID;
      v5->_airPlayGroupUID = (NSString *)v46;

      objc_msgSend(v4, "groupName");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "copy");
      groupName = v5->_groupName;
      v5->_groupName = (NSString *)v49;

      objc_msgSend(v4, "senderDefaultGroupUID");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "copy");
      senderDefaultGroupUID = v5->_senderDefaultGroupUID;
      v5->_senderDefaultGroupUID = (NSString *)v52;

      objc_msgSend(v4, "bluetoothAddress");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "copy");
      bluetoothAddress = v5->_bluetoothAddress;
      v5->_bluetoothAddress = (NSData *)v55;

      objc_msgSend(v4, "airplayReceivers");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "copy");
      airPlayReceivers = v5->_airPlayReceivers;
      v5->_airPlayReceivers = (NSArray *)v58;

      objc_msgSend(v4, "linkAgent");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "copy");
      linkAgent = v5->_linkAgent;
      v5->_linkAgent = (NSString *)v61;

      objc_msgSend(v4, "clusterID");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v63, "copy");
      clusterID = v5->_clusterID;
      v5->_clusterID = (NSString *)v64;

      objc_msgSend(v4, "clusterLeaderID");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v66, "copy");
      clusterLeaderID = v5->_clusterLeaderID;
      v5->_clusterLeaderID = (NSString *)v67;

      v5->_clusterType = objc_msgSend(v4, "clusterType");
      v5->_clusterAware = objc_msgSend(v4, "isClusterAware");
      v5->_configuredClusterSize = objc_msgSend(v4, "configuredClusterSize");
      v5->_clusterLeader = objc_msgSend(v4, "isClusterLeader");
      objc_msgSend(v4, "modelID");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v69, "copy");
      modelID = v5->_modelID;
      v5->_modelID = (NSString *)v70;

      objc_msgSend(v4, "routingContextID");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v72, "copy");
      routingContextID = v5->_routingContextID;
      v5->_routingContextID = (NSString *)v73;

      objc_msgSend(v4, "computerName");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = objc_msgSend(v75, "copy");
      computerName = v5->_computerName;
      v5->_computerName = (NSString *)v76;

      v5->_lastKnownClusterType = objc_msgSend(v4, "lastKnownClusterType");
      v5->_supportsOutputContextSync = objc_msgSend(v4, "supportsOutputContextSync");
      objc_msgSend(v4, "activeSystemEndpointUID");
      v78 = objc_claimAutoreleasedReturnValue();
      activeSystemEndpointUID = v5->_activeSystemEndpointUID;
      v5->_activeSystemEndpointUID = (NSString *)v78;

      v5->_lastSupportedProtocolMessageType = objc_msgSend(v4, "lastSupportedMessageType");
      objc_msgSend(v4, "groupSessionToken");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      if (v80)
      {
        v81 = -[MRGroupSessionToken initWithProtobuf:]([MRGroupSessionToken alloc], "initWithProtobuf:", v80);
        groupSessionToken = v5->_groupSessionToken;
        v5->_groupSessionToken = v81;

      }
      objc_msgSend(v4, "leaderDeviceInfo");
      v83 = (void *)objc_claimAutoreleasedReturnValue();

      if (v83)
      {
        v84 = [MRDeviceInfo alloc];
        objc_msgSend(v4, "leaderDeviceInfo");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = -[MRDeviceInfo initWithProtobuf:](v84, "initWithProtobuf:", v85);
        leaderDeviceInfo = v5->_leaderDeviceInfo;
        v5->_leaderDeviceInfo = (MRDeviceInfo *)v86;

      }
      objc_msgSend(v4, "groupedDevices");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "mr_map:", &__block_literal_global_4_0);
      v89 = objc_claimAutoreleasedReturnValue();
      groupedDevices = v5->_groupedDevices;
      v5->_groupedDevices = (NSArray *)v89;

      objc_msgSend(v4, "clusteredDevices");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "mr_map:", &__block_literal_global_5);
      v92 = objc_claimAutoreleasedReturnValue();
      clusteredDevices = v5->_clusteredDevices;
      v5->_clusteredDevices = (NSArray *)v92;

      objc_msgSend(v4, "allClusteredDevices");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "mr_map:", &__block_literal_global_6_2);
      v95 = objc_claimAutoreleasedReturnValue();
      allClusteredDevices = v5->_allClusteredDevices;
      v5->_allClusteredDevices = (NSArray *)v95;

    }
    self = v5;
    v97 = self;
  }
  else
  {
    v97 = 0;
  }

  return v97;
}

- (int64_t)preferredEncoding
{
  return self->_preferredEncoding;
}

- (BOOL)hasPreferredEncoding
{
  return self->_hasPreferredEncoding;
}

- (MRDeviceInfo)initWithOutputDevice:(id)a3
{
  id v4;
  MRDeviceInfo *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *deviceUID;
  uint64_t v10;
  NSString *localizedModelName;
  uint64_t v12;
  NSString *tightSyncUID;
  uint64_t v14;
  NSString *groupUID;
  uint64_t v16;
  NSString *airPlayGroupUID;
  uint64_t v18;
  NSString *modelID;
  unsigned int v20;
  uint64_t v21;
  NSString *clusterID;
  int v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSArray *clusteredDevices;
  void *v28;
  uint64_t v29;
  NSArray *allClusteredDevices;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)MRDeviceInfo;
  v5 = -[MRDeviceInfo init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "name");
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "primaryID");
    v8 = objc_claimAutoreleasedReturnValue();
    deviceUID = v5->_deviceUID;
    v5->_deviceUID = (NSString *)v8;

    objc_msgSend(v4, "modelID");
    v10 = objc_claimAutoreleasedReturnValue();
    localizedModelName = v5->_localizedModelName;
    v5->_localizedModelName = (NSString *)v10;

    objc_msgSend(v4, "logicalDeviceID");
    v12 = objc_claimAutoreleasedReturnValue();
    tightSyncUID = v5->_tightSyncUID;
    v5->_tightSyncUID = (NSString *)v12;

    objc_msgSend(v4, "groupID");
    v14 = objc_claimAutoreleasedReturnValue();
    groupUID = v5->_groupUID;
    v5->_groupUID = (NSString *)v14;

    objc_msgSend(v4, "airPlayGroupID");
    v16 = objc_claimAutoreleasedReturnValue();
    airPlayGroupUID = v5->_airPlayGroupUID;
    v5->_airPlayGroupUID = (NSString *)v16;

    objc_msgSend(v4, "modelID");
    v18 = objc_claimAutoreleasedReturnValue();
    modelID = v5->_modelID;
    v5->_modelID = (NSString *)v18;

    v20 = objc_msgSend(v4, "clusterType");
    v5->_clusterType = v20;
    if (v20)
    {
      objc_msgSend(v4, "uid");
      v21 = objc_claimAutoreleasedReturnValue();
      clusterID = v5->_clusterID;
      v5->_clusterID = (NSString *)v21;

    }
    if (objc_msgSend(v4, "groupContainsGroupLeader"))
      -[MRDeviceInfo setGroupContainsDiscoverableGroupLeader:](v5, "setGroupContainsDiscoverableGroupLeader:", 1);
    if (objc_msgSend(v4, "parentGroupContainsDiscoverableLeader"))
      -[MRDeviceInfo setParentGroupContainsDiscoverableGroupLeader:](v5, "setParentGroupContainsDiscoverableGroupLeader:", 1);
    v23 = objc_msgSend(v4, "deviceSubtype");
    v24 = 7;
    if (v23 != 12)
      v24 = -1;
    if (v23 == 13)
      v24 = 4;
    v5->_deviceClass = v24;
    objc_msgSend(v4, "clusterCompositionOutputDevices");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "msv_map:", &__block_literal_global_34);
    v26 = objc_claimAutoreleasedReturnValue();
    clusteredDevices = v5->_clusteredDevices;
    v5->_clusteredDevices = (NSArray *)v26;

    objc_msgSend(v4, "allClusterMembersOutputDevices");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "msv_map:", &__block_literal_global_1);
    v29 = objc_claimAutoreleasedReturnValue();
    allClusteredDevices = v5->_allClusteredDevices;
    v5->_allClusteredDevices = (NSArray *)v29;

    v5->_configuredClusterSize = objc_msgSend(v4, "configuredClusterSize");
  }

  return v5;
}

MRDeviceInfo *__37__MRDeviceInfo_initWithOutputDevice___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRDeviceInfo *v3;

  v2 = a2;
  v3 = -[MRDeviceInfo initWithOutputDevice:]([MRDeviceInfo alloc], "initWithOutputDevice:", v2);

  return v3;
}

MRDeviceInfo *__37__MRDeviceInfo_initWithOutputDevice___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  MRDeviceInfo *v3;

  v2 = a2;
  v3 = -[MRDeviceInfo initWithOutputDevice:]([MRDeviceInfo alloc], "initWithOutputDevice:", v2);

  return v3;
}

- (MRDeviceInfo)initWithOutputDeviceDescription:(id)a3
{
  id v4;
  MRDeviceInfo *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *deviceUID;
  uint64_t v10;
  NSString *modelID;
  int v12;
  uint64_t v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MRDeviceInfo;
  v5 = -[MRDeviceInfo init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "name");
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "uid");
    v8 = objc_claimAutoreleasedReturnValue();
    deviceUID = v5->_deviceUID;
    v5->_deviceUID = (NSString *)v8;

    objc_msgSend(v4, "modelID");
    v10 = objc_claimAutoreleasedReturnValue();
    modelID = v5->_modelID;
    v5->_modelID = (NSString *)v10;

    v12 = objc_msgSend(v4, "deviceSubtype");
    v13 = 7;
    if (v12 != 12)
      v13 = -1;
    if (v12 == 13)
      v13 = 4;
    v5->_deviceClass = v13;
  }

  return v5;
}

MRDeviceInfo *__33__MRDeviceInfo_initWithProtobuf___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRDeviceInfo *v3;

  v2 = a2;
  v3 = -[MRDeviceInfo initWithProtobuf:]([MRDeviceInfo alloc], "initWithProtobuf:", v2);

  return v3;
}

MRDeviceInfo *__33__MRDeviceInfo_initWithProtobuf___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  MRDeviceInfo *v3;

  v2 = a2;
  v3 = -[MRDeviceInfo initWithProtobuf:]([MRDeviceInfo alloc], "initWithProtobuf:", v2);

  return v3;
}

MRDeviceInfo *__33__MRDeviceInfo_initWithProtobuf___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  MRDeviceInfo *v3;

  v2 = a2;
  v3 = -[MRDeviceInfo initWithProtobuf:]([MRDeviceInfo alloc], "initWithProtobuf:", v2);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MRDeviceInfo protobuf](self, "protobuf");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobuf"));

}

- (MRDeviceInfo)initWithCoder:(id)a3
{
  id v4;
  MRDeviceInfo *v5;
  void *v6;
  MRDeviceInfo *v7;

  v4 = a3;
  v5 = [MRDeviceInfo alloc];
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobuf"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[MRDeviceInfo initWithProtobuf:](v5, "initWithProtobuf:", v6);
  return v7;
}

+ (id)deviceInfosFromData:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0C99E60];
    v4 = a3;
    v5 = objc_opt_class();
    objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MSVUnarchivedObjectOfClasses();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "mr_map:", &__block_literal_global_13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

MRDeviceInfo *__36__MRDeviceInfo_deviceInfosFromData___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRDeviceInfo *v3;

  v2 = a2;
  v3 = -[MRDeviceInfo initWithData:]([MRDeviceInfo alloc], "initWithData:", v2);

  return v3;
}

+ (id)dataFromDeviceInfos:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    objc_msgSend(a3, "mr_map:", &__block_literal_global_15_0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    MSVArchivedDataWithRootObject();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t __36__MRDeviceInfo_dataFromDeviceInfos___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "data");
}

uint64_t __24__MRDeviceInfo_protobuf__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "protobuf");
}

uint64_t __24__MRDeviceInfo_protobuf__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "protobuf");
}

uint64_t __24__MRDeviceInfo_protobuf__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "protobuf");
}

- (NSDictionary)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v41;
  void *v42;
  void *v43;
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
  __CFString *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MRDeviceInfo name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("name"));

  -[MRDeviceInfo identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("identifier"));

  -[MRDeviceInfo localizedModelName](self, "localizedModelName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("localizedModelName"));

  -[MRDeviceInfo buildVersion](self, "buildVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("buildVersion"));

  -[MRDeviceInfo bundleIdentifier](self, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("bundleIdentifier"));

  -[MRDeviceInfo bundleVersion](self, "bundleVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("bundleVersion"));

  -[MRDeviceInfo systemMediaApplication](self, "systemMediaApplication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("systemMediaApplication"));

  -[MRDeviceInfo systemPodcastApplication](self, "systemPodcastApplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("systemPodcastApplication"));

  -[MRDeviceInfo systemBooksApplication](self, "systemBooksApplication");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("systemBooksApplication"));

  -[MRDeviceInfo deviceUID](self, "deviceUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("deviceUID"));

  -[MRDeviceInfo localReceiverPairingIdentity](self, "localReceiverPairingIdentity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("localReceiverPairingIdentity"));

  -[MRDeviceInfo managedConfigurationDeviceIdentifier](self, "managedConfigurationDeviceIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("managedConfigurationDeviceIdentifier"));

  -[MRDeviceInfo tightSyncUID](self, "tightSyncUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("tightSyncUID"));

  -[MRDeviceInfo groupUID](self, "groupUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("groupUID"));

  -[MRDeviceInfo airPlayGroupUID](self, "airPlayGroupUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("airPlayGroupUID"));

  -[MRDeviceInfo groupName](self, "groupName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("groupName"));

  -[MRDeviceInfo senderDefaultGroupUID](self, "senderDefaultGroupUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("senderDefaultGroupUID"));

  -[MRDeviceInfo bluetoothAddress](self, "bluetoothAddress");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("bluetoothAddress"));

  -[MRDeviceInfo groupedDevices](self, "groupedDevices");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("groupedDevices"));

  -[MRDeviceInfo clusteredDevices](self, "clusteredDevices");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("clusteredDevices"));

  -[MRDeviceInfo allClusteredDevices](self, "allClusteredDevices");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("allClusteredDevices"));

  -[MRDeviceInfo airPlayReceivers](self, "airPlayReceivers");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("airPlayReceivers"));

  -[MRDeviceInfo linkAgent](self, "linkAgent");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("linkAgent"));

  -[MRDeviceInfo clusterID](self, "clusterID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("clusterID"));

  -[MRDeviceInfo clusterLeaderID](self, "clusterLeaderID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("clusterLeaderID"));

  -[MRDeviceInfo modelID](self, "modelID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("modelID"));

  -[MRDeviceInfo routingContextID](self, "routingContextID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("routingContextID"));

  -[MRDeviceInfo parentGroupID](self, "parentGroupID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("parentGroupID"));

  -[MRDeviceInfo computerName](self, "computerName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("computerName"));

  if (-[MRDeviceInfo hasDeviceClass](self, "hasDeviceClass"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MRDeviceInfo deviceClass](self, "deviceClass"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("deviceClass"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("deviceClass"));
  }
  if (-[MRDeviceInfo hasProtocolVersion](self, "hasProtocolVersion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MRDeviceInfo protocolVersion](self, "protocolVersion"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("protocolVersion"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("protocolVersion"));
  }
  if (-[MRDeviceInfo hasGroupedDeviceCount](self, "hasGroupedDeviceCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MRDeviceInfo groupedDeviceCount](self, "groupedDeviceCount"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("groupedDeviceCount"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("groupedDeviceCount"));
  }
  if (-[MRDeviceInfo hasSharedQueueVersion](self, "hasSharedQueueVersion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MRDeviceInfo sharedQueueVersion](self, "sharedQueueVersion"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("sharedQueueVersion"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("sharedQueueVersion"));
  }
  if (-[MRDeviceInfo hasGroupLogicalDeviceCount](self, "hasGroupLogicalDeviceCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MRDeviceInfo groupLogicalDeviceCount](self, "groupLogicalDeviceCount"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("groupLogicalDeviceCount"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("groupLogicalDeviceCount"));
  }
  if (-[MRDeviceInfo hasSupportsSystemPairing](self, "hasSupportsSystemPairing"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRDeviceInfo supportsSystemPairing](self, "supportsSystemPairing"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("supportsSystemPairing"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("supportsSystemPairing"));
  }
  if (-[MRDeviceInfo hasSupportsACL](self, "hasSupportsACL"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRDeviceInfo supportsACL](self, "supportsACL"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("supportsACL"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("supportsACL"));
  }
  if (-[MRDeviceInfo hasSupportsSharedQueue](self, "hasSupportsSharedQueue"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRDeviceInfo supportsSharedQueue](self, "supportsSharedQueue"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("supportsSharedQueue"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("supportsSharedQueue"));
  }
  if (-[MRDeviceInfo hasSupportsExtendedMotion](self, "hasSupportsExtendedMotion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRDeviceInfo supportsExtendedMotion](self, "supportsExtendedMotion"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("supportsExtendedMotion"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("supportsExtendedMotion"));
  }
  if (-[MRDeviceInfo hasTightSyncGroup](self, "hasTightSyncGroup"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRDeviceInfo isTightSyncGroup](self, "isTightSyncGroup"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("tightSyncGroup"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("tightSyncGroup"));
  }
  if (-[MRDeviceInfo hasPairingAllowed](self, "hasPairingAllowed"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRDeviceInfo isPairingAllowed](self, "isPairingAllowed"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("pairingAllowed"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("pairingAllowed"));
  }
  if (-[MRDeviceInfo hasProxyGroupPlayer](self, "hasProxyGroupPlayer"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRDeviceInfo isProxyGroupPlayer](self, "isProxyGroupPlayer"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("proxyGroupPlayer"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("proxyGroupPlayer"));
  }
  if (-[MRDeviceInfo hasConnected](self, "hasConnected"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRDeviceInfo isConnected](self, "isConnected"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("connected"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("connected"));
  }
  if (-[MRDeviceInfo hasGroupLeader](self, "hasGroupLeader"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRDeviceInfo isGroupLeader](self, "isGroupLeader"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("groupLeader"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("groupLeader"));
  }
  if (-[MRDeviceInfo hasAirPlayActive](self, "hasAirPlayActive"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRDeviceInfo isAirPlayActive](self, "isAirPlayActive"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("airPlayActive"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("airPlayActive"));
  }
  if (-[MRDeviceInfo clusterType](self, "clusterType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MRDeviceInfo clusterType](self, "clusterType"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("clusterType"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("clusterType"));
  }
  if (-[MRDeviceInfo isClusterAware](self, "isClusterAware"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRDeviceInfo isClusterAware](self, "isClusterAware"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("clusterAware"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("clusterAware"));
  }
  if (-[MRDeviceInfo configuredClusterSize](self, "configuredClusterSize"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MRDeviceInfo configuredClusterSize](self, "configuredClusterSize"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("configuredClusterSize"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("configuredClusterSize"));
  }
  if (-[MRDeviceInfo isClusterLeader](self, "isClusterLeader"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRDeviceInfo isClusterLeader](self, "isClusterLeader"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("clusterLeader"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("clusterLeader"));
  }
  if (-[MRDeviceInfo hasSupportsMultiplayer](self, "hasSupportsMultiplayer"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRDeviceInfo supportsMultiplayer](self, "supportsMultiplayer"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("supportsMultiplayer"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("supportsMultiplayer"));
  }
  if (-[MRDeviceInfo hasParentGroupContainsDiscoverableGroupLeader](self, "hasParentGroupContainsDiscoverableGroupLeader"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRDeviceInfo parentGroupContainsDiscoverableGroupLeader](self, "parentGroupContainsDiscoverableGroupLeader"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("parentGroupContainsGroupLeader"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("parentGroupContainsGroupLeader"));
  }
  if (-[MRDeviceInfo hasGroupContainsDiscoverableGroupLeader](self, "hasGroupContainsDiscoverableGroupLeader"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRDeviceInfo groupContainsDiscoverableGroupLeader](self, "groupContainsDiscoverableGroupLeader"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("groupContainsGroupLeader"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("groupContainsGroupLeader"));
  }
  if (-[MRDeviceInfo hasPreferredEncoding](self, "hasPreferredEncoding"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MRDeviceInfo preferredEncoding](self, "preferredEncoding"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("preferredEncoding"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("preferredEncoding"));
  }
  if (-[MRDeviceInfo lastKnownClusterType](self, "lastKnownClusterType"))
  {
    v56 = off_1E30C8D78[-[MRDeviceInfo lastKnownClusterType](self, "lastKnownClusterType")];
    v57 = v3;
  }
  else
  {
    v57 = v3;
    v56 = 0;
  }
  objc_msgSend(v57, "setObject:forKeyedSubscript:", v56, CFSTR("lastKnownClusterType"));
  if (-[MRDeviceInfo supportsOutputContextSync](self, "supportsOutputContextSync"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRDeviceInfo supportsOutputContextSync](self, "supportsOutputContextSync"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v58, CFSTR("supportsOutputContextSync"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("supportsOutputContextSync"));
  }
  if (-[MRDeviceInfo lastSupportedProtocolMessageType](self, "lastSupportedProtocolMessageType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MRDeviceInfo lastSupportedProtocolMessageType](self, "lastSupportedProtocolMessageType"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("lastSupportedMessageType"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("lastSupportedMessageType"));
  }
  -[MRDeviceInfo groupSessionToken](self, "groupSessionToken");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("groupSessionToken"));

  if (-[MRDeviceInfo isEligibleForHostingGroupSessionExcludingAcknowledgements](self, "isEligibleForHostingGroupSessionExcludingAcknowledgements"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRDeviceInfo isEligibleForHostingGroupSessionExcludingAcknowledgements](self, "isEligibleForHostingGroupSessionExcludingAcknowledgements"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("isEligibleForHostingGroupSessionExcludingAcknowledgements"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("isEligibleForHostingGroupSessionExcludingAcknowledgements"));
  }
  -[MRDeviceInfo activeSystemEndpointUID](self, "activeSystemEndpointUID");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("activeSystemEndpointUID"));

  -[MRDeviceInfo leaderDeviceInfo](self, "leaderDeviceInfo");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "dictionaryRepresentation");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, CFSTR("leaderDeviceInfo"));

  return (NSDictionary *)v3;
}

- (MRDeviceInfo)skeleton
{
  MRDeviceInfo *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = objc_alloc_init(MRDeviceInfo);
  -[MRDeviceInfo identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRDeviceInfo setIdentifier:](v3, "setIdentifier:", v4);

  -[MRDeviceInfo name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MRDeviceInfo name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setName:](v3, "setName:", v6);

  }
  -[MRDeviceInfo deviceUID](self, "deviceUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MRDeviceInfo deviceUID](self, "deviceUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setDeviceUID:](v3, "setDeviceUID:", v8);

  }
  -[MRDeviceInfo groupUID](self, "groupUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[MRDeviceInfo groupUID](self, "groupUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setGroupUID:](v3, "setGroupUID:", v10);

  }
  -[MRDeviceInfo airPlayGroupUID](self, "airPlayGroupUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[MRDeviceInfo airPlayGroupUID](self, "airPlayGroupUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setAirPlayGroupUID:](v3, "setAirPlayGroupUID:", v12);

  }
  -[MRDeviceInfo groupName](self, "groupName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[MRDeviceInfo groupName](self, "groupName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setGroupName:](v3, "setGroupName:", v14);

  }
  if (-[MRDeviceInfo isProxyGroupPlayer](self, "isProxyGroupPlayer"))
    -[MRDeviceInfo setProxyGroupPlayer:](v3, "setProxyGroupPlayer:", 1);
  if (-[MRDeviceInfo isAirPlayActive](self, "isAirPlayActive"))
    -[MRDeviceInfo setAirPlayActive:](v3, "setAirPlayActive:", 1);
  if (-[MRDeviceInfo isGroupLeader](self, "isGroupLeader"))
    -[MRDeviceInfo setGroupLeader:](v3, "setGroupLeader:", 1);
  -[MRDeviceInfo tightSyncUID](self, "tightSyncUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[MRDeviceInfo tightSyncUID](self, "tightSyncUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setTightSyncUID:](v3, "setTightSyncUID:", v16);

  }
  -[MRDeviceInfo routingContextID](self, "routingContextID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[MRDeviceInfo routingContextID](self, "routingContextID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setRoutingContextID:](v3, "setRoutingContextID:", v18);

  }
  return v3;
}

- (NSString)minimalDescription
{
  void *v2;
  void *v3;

  -[MRDeviceInfo skeleton](self, "skeleton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isCompanion
{
  return +[MRDeviceInfo deviceClass](MRDeviceInfo, "deviceClass") == 6
      && -[MRDeviceInfo deviceClass](self, "deviceClass") == 1;
}

- (BOOL)isGizmo
{
  return +[MRDeviceInfo deviceClass](MRDeviceInfo, "deviceClass") == 1
      && -[MRDeviceInfo deviceClass](self, "deviceClass") == 6;
}

+ (int64_t)deviceClass
{
  unsigned int v2;

  v2 = MGGetSInt32Answer() - 1;
  if (v2 > 0xA)
    return -1;
  else
    return qword_193AD9678[v2];
}

- (NSString)WHAIdentifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  -[MRDeviceInfo clusterID](self, "clusterID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[MRDeviceInfo deviceUID](self, "deviceUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[MRDeviceInfo identifier](self, "identifier");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v8;

  }
  return (NSString *)v5;
}

- (BOOL)supportsImplicitChangeShuffleAndRepeatModeInSetPlaybackQueueCommandOptions
{
  return -[MRDeviceInfo sharedQueueVersion](self, "sharedQueueVersion") > 2;
}

- (NSString)parentGroupID
{
  void *v3;

  if (-[MRDeviceInfo isAirPlayActive](self, "isAirPlayActive"))
  {
    -[MRDeviceInfo groupUID](self, "groupUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)hasPlaceholderGroupSession
{
  void *v3;
  BOOL v4;

  -[MRDeviceInfo groupSessionToken](self, "groupSessionToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 0;
  else
    v4 = -[MRDeviceInfo isEligibleForHostingGroupSessionExcludingAcknowledgements](self, "isEligibleForHostingGroupSessionExcludingAcknowledgements");

  return v4;
}

- (void)setPreferredEncoding:(int64_t)a3
{
  self->_preferredEncoding = a3;
  self->_hasPreferredEncoding = 1;
}

- (BOOL)containsLocalDevice
{
  void *v3;

  v3 = (void *)MRMediaRemoteCopyDeviceUID();
  LOBYTE(self) = -[MRDeviceInfo containsDevice:](self, "containsDevice:", v3);

  return (char)self;
}

- (BOOL)containsDevice:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MRDeviceInfo clusterID](self, "clusterID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    -[MRDeviceInfo deviceUID](self, "deviceUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", v4);

    if ((v8 & 1) == 0)
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      -[MRDeviceInfo groupedDevices](self, "groupedDevices");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v31;
LABEL_6:
        v14 = 0;
        while (1)
        {
          if (*(_QWORD *)v31 != v13)
            objc_enumerationMutation(v10);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v14), "containsDevice:", v4) & 1) != 0)
            break;
          if (v12 == ++v14)
          {
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
            if (v12)
              goto LABEL_6;
            goto LABEL_12;
          }
        }
      }
      else
      {
LABEL_12:

        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        -[MRDeviceInfo clusteredDevices](self, "clusteredDevices");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v27;
LABEL_14:
          v18 = 0;
          while (1)
          {
            if (*(_QWORD *)v27 != v17)
              objc_enumerationMutation(v10);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v18), "containsDevice:", v4) & 1) != 0)
              break;
            if (v16 == ++v18)
            {
              v16 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
              if (v16)
                goto LABEL_14;
              goto LABEL_20;
            }
          }
        }
        else
        {
LABEL_20:

          v24 = 0u;
          v25 = 0u;
          v22 = 0u;
          v23 = 0u;
          -[MRDeviceInfo allClusteredDevices](self, "allClusteredDevices", 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
          if (!v9)
          {
LABEL_30:

            goto LABEL_31;
          }
          v19 = *(_QWORD *)v23;
LABEL_22:
          v20 = 0;
          while (1)
          {
            if (*(_QWORD *)v23 != v19)
              objc_enumerationMutation(v10);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v20), "containsDevice:", v4) & 1) != 0)
              break;
            if (v9 == ++v20)
            {
              v9 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
              if (v9)
                goto LABEL_22;
              goto LABEL_30;
            }
          }
        }
      }
      LOBYTE(v9) = 1;
      goto LABEL_30;
    }
  }
  LOBYTE(v9) = 1;
LABEL_31:

  return v9;
}

- (BOOL)isAwareOfCluster:(unsigned int)a3
{
  return -[MRDeviceInfo lastKnownClusterType](self, "lastKnownClusterType") >= a3;
}

- (void)mergeFrom:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v41;
  void *v42;
  void *v43;
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
  id v66;

  v66 = a3;
  if (objc_msgSend(v66, "hasDeviceClass"))
    -[MRDeviceInfo setDeviceClass:](self, "setDeviceClass:", objc_msgSend(v66, "deviceClass"));
  if (objc_msgSend(v66, "hasProtocolVersion"))
    -[MRDeviceInfo setProtocolVersion:](self, "setProtocolVersion:", objc_msgSend(v66, "protocolVersion"));
  if (objc_msgSend(v66, "hasGroupedDeviceCount"))
    -[MRDeviceInfo setGroupedDeviceCount:](self, "setGroupedDeviceCount:", objc_msgSend(v66, "groupedDeviceCount"));
  if (objc_msgSend(v66, "hasSharedQueueVersion"))
    -[MRDeviceInfo setSharedQueueVersion:](self, "setSharedQueueVersion:", objc_msgSend(v66, "sharedQueueVersion"));
  if (objc_msgSend(v66, "hasGroupLogicalDeviceCount"))
    -[MRDeviceInfo setGroupLogicalDeviceCount:](self, "setGroupLogicalDeviceCount:", objc_msgSend(v66, "groupLogicalDeviceCount"));
  if (objc_msgSend(v66, "hasSupportsSystemPairing"))
    -[MRDeviceInfo setSupportsSystemPairing:](self, "setSupportsSystemPairing:", objc_msgSend(v66, "supportsSystemPairing"));
  if (objc_msgSend(v66, "hasSupportsACL"))
    -[MRDeviceInfo setSupportsACL:](self, "setSupportsACL:", objc_msgSend(v66, "supportsACL"));
  if (objc_msgSend(v66, "hasSupportsSharedQueue"))
    -[MRDeviceInfo setSupportsSharedQueue:](self, "setSupportsSharedQueue:", objc_msgSend(v66, "supportsSharedQueue"));
  if (objc_msgSend(v66, "hasSupportsExtendedMotion"))
    -[MRDeviceInfo setSupportsExtendedMotion:](self, "setSupportsExtendedMotion:", objc_msgSend(v66, "supportsExtendedMotion"));
  if (objc_msgSend(v66, "hasTightSyncGroup"))
    -[MRDeviceInfo setTightSyncGroup:](self, "setTightSyncGroup:", objc_msgSend(v66, "isTightSyncGroup"));
  if (objc_msgSend(v66, "hasPairingAllowed"))
    -[MRDeviceInfo setPairingAllowed:](self, "setPairingAllowed:", objc_msgSend(v66, "isPairingAllowed"));
  if (objc_msgSend(v66, "hasProxyGroupPlayer"))
    -[MRDeviceInfo setProxyGroupPlayer:](self, "setProxyGroupPlayer:", objc_msgSend(v66, "isProxyGroupPlayer"));
  if (objc_msgSend(v66, "hasConnected"))
    -[MRDeviceInfo setConnected:](self, "setConnected:", objc_msgSend(v66, "isConnected"));
  if (objc_msgSend(v66, "hasGroupLeader"))
    -[MRDeviceInfo setGroupLeader:](self, "setGroupLeader:", objc_msgSend(v66, "isGroupLeader"));
  if (objc_msgSend(v66, "hasAirPlayActive"))
    -[MRDeviceInfo setAirPlayActive:](self, "setAirPlayActive:", objc_msgSend(v66, "isAirPlayActive"));
  if (objc_msgSend(v66, "hasSupportsMultiplayer"))
    -[MRDeviceInfo setSupportsMultiplayer:](self, "setSupportsMultiplayer:", objc_msgSend(v66, "supportsMultiplayer"));
  if (objc_msgSend(v66, "hasParentGroupContainsDiscoverableGroupLeader"))
    -[MRDeviceInfo setParentGroupContainsDiscoverableGroupLeader:](self, "setParentGroupContainsDiscoverableGroupLeader:", objc_msgSend(v66, "parentGroupContainsDiscoverableGroupLeader"));
  if (objc_msgSend(v66, "hasGroupContainsDiscoverableGroupLeader"))
    -[MRDeviceInfo setGroupContainsDiscoverableGroupLeader:](self, "setGroupContainsDiscoverableGroupLeader:", objc_msgSend(v66, "groupContainsDiscoverableGroupLeader"));
  objc_msgSend(v66, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v66, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setName:](self, "setName:", v5);

  }
  objc_msgSend(v66, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v66, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setIdentifier:](self, "setIdentifier:", v7);

  }
  objc_msgSend(v66, "localizedModelName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v66, "localizedModelName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setLocalizedModelName:](self, "setLocalizedModelName:", v9);

  }
  objc_msgSend(v66, "buildVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v66, "buildVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setBuildVersion:](self, "setBuildVersion:", v11);

  }
  objc_msgSend(v66, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v66, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setBundleIdentifier:](self, "setBundleIdentifier:", v13);

  }
  objc_msgSend(v66, "bundleVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v66, "bundleVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setBundleVersion:](self, "setBundleVersion:", v15);

  }
  objc_msgSend(v66, "systemMediaApplication");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v66, "systemMediaApplication");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setSystemMediaApplication:](self, "setSystemMediaApplication:", v17);

  }
  objc_msgSend(v66, "systemPodcastApplication");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v66, "systemPodcastApplication");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setSystemPodcastApplication:](self, "setSystemPodcastApplication:", v19);

  }
  objc_msgSend(v66, "systemBooksApplication");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v66, "systemBooksApplication");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setSystemBooksApplication:](self, "setSystemBooksApplication:", v21);

  }
  objc_msgSend(v66, "deviceUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v66, "deviceUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setDeviceUID:](self, "setDeviceUID:", v23);

  }
  objc_msgSend(v66, "localReceiverPairingIdentity");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v66, "localReceiverPairingIdentity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setLocalReceiverPairingIdentity:](self, "setLocalReceiverPairingIdentity:", v25);

  }
  objc_msgSend(v66, "managedConfigurationDeviceIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v66, "managedConfigurationDeviceIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setManagedConfigurationDeviceIdentifier:](self, "setManagedConfigurationDeviceIdentifier:", v27);

  }
  objc_msgSend(v66, "tightSyncUID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v66, "tightSyncUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setTightSyncUID:](self, "setTightSyncUID:", v29);

  }
  objc_msgSend(v66, "groupUID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v66, "groupUID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setGroupUID:](self, "setGroupUID:", v31);

  }
  objc_msgSend(v66, "airPlayGroupUID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v66, "airPlayGroupUID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setAirPlayGroupUID:](self, "setAirPlayGroupUID:", v33);

  }
  objc_msgSend(v66, "groupName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v66, "groupName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setGroupName:](self, "setGroupName:", v35);

  }
  objc_msgSend(v66, "senderDefaultGroupUID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(v66, "senderDefaultGroupUID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setSenderDefaultGroupUID:](self, "setSenderDefaultGroupUID:", v37);

  }
  objc_msgSend(v66, "bluetoothAddress");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend(v66, "bluetoothAddress");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setBluetoothAddress:](self, "setBluetoothAddress:", v39);

  }
  objc_msgSend(v66, "groupedDevices");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    objc_msgSend(v66, "groupedDevices");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setGroupedDevices:](self, "setGroupedDevices:", v41);

  }
  objc_msgSend(v66, "clusteredDevices");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend(v66, "clusteredDevices");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setClusteredDevices:](self, "setClusteredDevices:", v43);

  }
  objc_msgSend(v66, "allClusteredDevices");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    objc_msgSend(v66, "allClusteredDevices");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setAllClusteredDevices:](self, "setAllClusteredDevices:", v45);

  }
  objc_msgSend(v66, "airPlayReceivers");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    objc_msgSend(v66, "airPlayReceivers");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setAirPlayReceivers:](self, "setAirPlayReceivers:", v47);

  }
  objc_msgSend(v66, "linkAgent");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    objc_msgSend(v66, "linkAgent");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setLinkAgent:](self, "setLinkAgent:", v49);

  }
  objc_msgSend(v66, "clusterID");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    objc_msgSend(v66, "clusterID");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setClusterID:](self, "setClusterID:", v51);

  }
  objc_msgSend(v66, "clusterLeaderID");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    objc_msgSend(v66, "clusterLeaderID");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setClusterLeaderID:](self, "setClusterLeaderID:", v53);

  }
  if (objc_msgSend(v66, "clusterType"))
    -[MRDeviceInfo setClusterType:](self, "setClusterType:", objc_msgSend(v66, "clusterType"));
  if (objc_msgSend(v66, "isClusterAware"))
    -[MRDeviceInfo setClusterAware:](self, "setClusterAware:", objc_msgSend(v66, "isClusterAware"));
  if (objc_msgSend(v66, "configuredClusterSize"))
    -[MRDeviceInfo setConfiguredClusterSize:](self, "setConfiguredClusterSize:", objc_msgSend(v66, "configuredClusterSize"));
  objc_msgSend(v66, "modelID");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    objc_msgSend(v66, "modelID");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setModelID:](self, "setModelID:", v55);

  }
  objc_msgSend(v66, "routingContextID");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    objc_msgSend(v66, "routingContextID");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setRoutingContextID:](self, "setRoutingContextID:", v57);

  }
  -[MRDeviceInfo setSupportsOutputContextSync:](self, "setSupportsOutputContextSync:", objc_msgSend(v66, "supportsOutputContextSync"));
  objc_msgSend(v66, "computerName");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    objc_msgSend(v66, "computerName");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setComputerName:](self, "setComputerName:", v59);

  }
  -[MRDeviceInfo setLastSupportedProtocolMessageType:](self, "setLastSupportedProtocolMessageType:", objc_msgSend(v66, "lastSupportedProtocolMessageType"));
  objc_msgSend(v66, "groupSessionToken");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60)
  {
    objc_msgSend(v66, "groupSessionToken");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setGroupSessionToken:](self, "setGroupSessionToken:", v61);

  }
  objc_msgSend(v66, "leaderDeviceInfo");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    objc_msgSend(v66, "leaderDeviceInfo");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setLeaderDeviceInfo:](self, "setLeaderDeviceInfo:", v63);

  }
  objc_msgSend(v66, "activeSystemEndpointUID");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    objc_msgSend(v66, "activeSystemEndpointUID");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setActiveSystemEndpointUID:](self, "setActiveSystemEndpointUID:", v65);

  }
  if (objc_msgSend(v66, "hasIsEligibleForHostingGroupSessionExcludingAcknowledgements"))
    -[MRDeviceInfo setIsEligibleForHostingGroupSessionExcludingAcknowledgements:](self, "setIsEligibleForHostingGroupSessionExcludingAcknowledgements:", objc_msgSend(v66, "isEligibleForHostingGroupSessionExcludingAcknowledgements"));

}

- (id)deltaDescriptionFromDeviceInfo:(id)a3 minimal:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  id v22;
  id v23;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRDeviceInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = 0;
  v21 = 0;
  MRDictionaryCalculateDeltas(v7, v8, &v23, &v22, &v21);
  v9 = v23;
  v10 = v22;
  v11 = v21;

  v12 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  v14 = v13;
  if (v4)
  {
    -[MRDeviceInfo skeleton](self, "skeleton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("%@"), v15);
    objc_msgSend(v12, "appendString:", v16);

  }
  else
  {
    v15 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("DeviceInfo changed from\n %@ \nto\n %@\n"), v6, self);
    objc_msgSend(v12, "appendString:", v15);
  }

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v12, "appendString:", CFSTR("\n"));
    objc_msgSend(v12, "appendString:", CFSTR("Added Fields:\n"));
    objc_msgSend(v9, "description");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendString:", v17);

  }
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v12, "appendString:", CFSTR("\n"));
    objc_msgSend(v12, "appendString:", CFSTR("Removed Fields: \n"));
    objc_msgSend(v10, "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendString:", v18);

  }
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v12, "appendString:", CFSTR("\n"));
    objc_msgSend(v12, "appendString:", CFSTR("Updated values: \n"));
    objc_msgSend(v11, "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendString:", v19);

  }
  objc_msgSend(v12, "appendString:", CFSTR("\n"));

  return v12;
}

- (id)deltaDescriptionFromDeviceInfo:(id)a3
{
  return -[MRDeviceInfo deltaDescriptionFromDeviceInfo:minimal:](self, "deltaDescriptionFromDeviceInfo:minimal:", a3, 0);
}

- (id)minimalDeltaDescriptionFromDeviceInfo:(id)a3
{
  return -[MRDeviceInfo deltaDescriptionFromDeviceInfo:minimal:](self, "deltaDescriptionFromDeviceInfo:minimal:", a3, 1);
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[MRDeviceInfo protobuf](self, "protobuf");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  MRDeviceInfo *v4;
  _BOOL4 v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
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
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  int v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  int v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  int v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  int v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  int v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  int v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  int v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  int v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  int v119;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  int v125;
  void *v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  int v131;
  void *v132;
  uint64_t v133;
  void *v134;
  void *v135;
  void *v136;
  int v137;
  void *v138;
  uint64_t v139;
  void *v140;
  void *v141;
  void *v142;
  int v143;
  void *v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  int v149;
  void *v150;
  uint64_t v151;
  void *v152;
  void *v153;
  void *v154;
  int v155;
  void *v156;
  uint64_t v157;
  void *v158;
  void *v159;
  void *v160;
  int v161;
  void *v162;
  uint64_t v163;
  void *v164;
  void *v165;
  void *v166;
  int v167;
  void *v168;
  uint64_t v169;
  void *v170;
  void *v171;
  void *v172;
  int v173;
  void *v174;
  uint64_t v175;
  void *v176;
  void *v177;
  void *v178;
  int v179;
  void *v180;
  uint64_t v181;
  void *v182;
  void *v183;
  void *v184;
  int v185;
  void *v186;
  uint64_t v187;
  void *v188;
  void *v189;
  void *v190;
  int v191;
  void *v192;
  uint64_t v193;
  void *v194;
  void *v195;
  void *v196;
  int v197;
  unsigned int v198;
  _BOOL4 v199;
  uint64_t v200;
  _BOOL4 v201;
  void *v202;
  void *v203;
  id v204;
  id v205;
  void *v206;
  char v207;
  void *v208;
  void *v209;
  id v210;
  id v211;
  void *v212;
  char v213;
  unsigned int v214;
  _BOOL4 v215;
  uint64_t v216;
  void *v217;
  void *v218;
  id v219;
  id v220;
  void *v221;
  char v222;
  void *v223;
  void *v224;
  id v225;
  id v226;
  void *v227;
  char v228;
  void *v229;
  void *v230;
  id v231;
  id v232;
  void *v233;
  char v234;
  _BOOL4 v235;
  _BOOL4 v237;

  v4 = (MRDeviceInfo *)a3;
  if (v4 != self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_208;
    v5 = -[MRDeviceInfo hasDeviceClass](v4, "hasDeviceClass");
    if (v5 != -[MRDeviceInfo hasDeviceClass](self, "hasDeviceClass"))
      goto LABEL_208;
    if (-[MRDeviceInfo hasDeviceClass](v4, "hasDeviceClass"))
    {
      if (-[MRDeviceInfo hasDeviceClass](self, "hasDeviceClass"))
      {
        v6 = -[MRDeviceInfo deviceClass](v4, "deviceClass");
        if (v6 != -[MRDeviceInfo deviceClass](self, "deviceClass"))
          goto LABEL_208;
      }
    }
    v7 = -[MRDeviceInfo hasProtocolVersion](v4, "hasProtocolVersion");
    if (v7 != -[MRDeviceInfo hasProtocolVersion](self, "hasProtocolVersion"))
      goto LABEL_208;
    if (-[MRDeviceInfo hasProtocolVersion](v4, "hasProtocolVersion"))
    {
      if (-[MRDeviceInfo hasProtocolVersion](self, "hasProtocolVersion"))
      {
        v8 = -[MRDeviceInfo protocolVersion](v4, "protocolVersion");
        if (v8 != -[MRDeviceInfo protocolVersion](self, "protocolVersion"))
          goto LABEL_208;
      }
    }
    v9 = -[MRDeviceInfo hasGroupedDeviceCount](v4, "hasGroupedDeviceCount");
    if (v9 != -[MRDeviceInfo hasGroupedDeviceCount](self, "hasGroupedDeviceCount"))
      goto LABEL_208;
    if (-[MRDeviceInfo hasGroupedDeviceCount](v4, "hasGroupedDeviceCount"))
    {
      if (-[MRDeviceInfo hasGroupedDeviceCount](self, "hasGroupedDeviceCount"))
      {
        v10 = -[MRDeviceInfo groupedDeviceCount](v4, "groupedDeviceCount");
        if (v10 != -[MRDeviceInfo groupedDeviceCount](self, "groupedDeviceCount"))
          goto LABEL_208;
      }
    }
    v11 = -[MRDeviceInfo hasSharedQueueVersion](v4, "hasSharedQueueVersion");
    if (v11 != -[MRDeviceInfo hasSharedQueueVersion](self, "hasSharedQueueVersion"))
      goto LABEL_208;
    if (-[MRDeviceInfo hasSharedQueueVersion](v4, "hasSharedQueueVersion"))
    {
      if (-[MRDeviceInfo hasSharedQueueVersion](self, "hasSharedQueueVersion"))
      {
        v12 = -[MRDeviceInfo sharedQueueVersion](v4, "sharedQueueVersion");
        if (v12 != -[MRDeviceInfo sharedQueueVersion](self, "sharedQueueVersion"))
          goto LABEL_208;
      }
    }
    v13 = -[MRDeviceInfo hasGroupLogicalDeviceCount](v4, "hasGroupLogicalDeviceCount");
    if (v13 != -[MRDeviceInfo hasGroupLogicalDeviceCount](self, "hasGroupLogicalDeviceCount"))
      goto LABEL_208;
    if (-[MRDeviceInfo hasGroupLogicalDeviceCount](v4, "hasGroupLogicalDeviceCount"))
    {
      if (-[MRDeviceInfo hasGroupLogicalDeviceCount](self, "hasGroupLogicalDeviceCount"))
      {
        v14 = -[MRDeviceInfo groupLogicalDeviceCount](v4, "groupLogicalDeviceCount");
        if (v14 != -[MRDeviceInfo groupLogicalDeviceCount](self, "groupLogicalDeviceCount"))
          goto LABEL_208;
      }
    }
    v15 = -[MRDeviceInfo hasSupportsSystemPairing](v4, "hasSupportsSystemPairing");
    if (v15 != -[MRDeviceInfo hasSupportsSystemPairing](self, "hasSupportsSystemPairing"))
      goto LABEL_208;
    if (-[MRDeviceInfo hasSupportsSystemPairing](v4, "hasSupportsSystemPairing"))
    {
      if (-[MRDeviceInfo hasSupportsSystemPairing](self, "hasSupportsSystemPairing"))
      {
        v16 = -[MRDeviceInfo supportsSystemPairing](v4, "supportsSystemPairing");
        if (v16 != -[MRDeviceInfo supportsSystemPairing](self, "supportsSystemPairing"))
          goto LABEL_208;
      }
    }
    v17 = -[MRDeviceInfo hasSupportsACL](v4, "hasSupportsACL");
    if (v17 != -[MRDeviceInfo hasSupportsACL](self, "hasSupportsACL"))
      goto LABEL_208;
    if (-[MRDeviceInfo hasSupportsACL](v4, "hasSupportsACL"))
    {
      if (-[MRDeviceInfo hasSupportsACL](self, "hasSupportsACL"))
      {
        v18 = -[MRDeviceInfo supportsACL](v4, "supportsACL");
        if (v18 != -[MRDeviceInfo supportsACL](self, "supportsACL"))
          goto LABEL_208;
      }
    }
    v19 = -[MRDeviceInfo hasSupportsSharedQueue](v4, "hasSupportsSharedQueue");
    if (v19 != -[MRDeviceInfo hasSupportsSharedQueue](self, "hasSupportsSharedQueue"))
      goto LABEL_208;
    if (-[MRDeviceInfo hasSupportsSharedQueue](v4, "hasSupportsSharedQueue"))
    {
      if (-[MRDeviceInfo hasSupportsSharedQueue](self, "hasSupportsSharedQueue"))
      {
        v20 = -[MRDeviceInfo supportsSharedQueue](v4, "supportsSharedQueue");
        if (v20 != -[MRDeviceInfo supportsSharedQueue](self, "supportsSharedQueue"))
          goto LABEL_208;
      }
    }
    v21 = -[MRDeviceInfo hasSupportsExtendedMotion](v4, "hasSupportsExtendedMotion");
    if (v21 != -[MRDeviceInfo hasSupportsExtendedMotion](self, "hasSupportsExtendedMotion"))
      goto LABEL_208;
    if (-[MRDeviceInfo hasSupportsExtendedMotion](v4, "hasSupportsExtendedMotion"))
    {
      if (-[MRDeviceInfo hasSupportsExtendedMotion](self, "hasSupportsExtendedMotion"))
      {
        v22 = -[MRDeviceInfo supportsExtendedMotion](v4, "supportsExtendedMotion");
        if (v22 != -[MRDeviceInfo supportsExtendedMotion](self, "supportsExtendedMotion"))
          goto LABEL_208;
      }
    }
    v23 = -[MRDeviceInfo hasTightSyncGroup](v4, "hasTightSyncGroup");
    if (v23 != -[MRDeviceInfo hasTightSyncGroup](self, "hasTightSyncGroup"))
      goto LABEL_208;
    if (-[MRDeviceInfo hasTightSyncGroup](v4, "hasTightSyncGroup"))
    {
      if (-[MRDeviceInfo hasTightSyncGroup](self, "hasTightSyncGroup"))
      {
        v24 = -[MRDeviceInfo isTightSyncGroup](v4, "isTightSyncGroup");
        if (v24 != -[MRDeviceInfo isTightSyncGroup](self, "isTightSyncGroup"))
          goto LABEL_208;
      }
    }
    v25 = -[MRDeviceInfo hasPairingAllowed](v4, "hasPairingAllowed");
    if (v25 != -[MRDeviceInfo hasPairingAllowed](self, "hasPairingAllowed"))
      goto LABEL_208;
    if (-[MRDeviceInfo hasPairingAllowed](v4, "hasPairingAllowed"))
    {
      if (-[MRDeviceInfo hasPairingAllowed](self, "hasPairingAllowed"))
      {
        v26 = -[MRDeviceInfo isPairingAllowed](v4, "isPairingAllowed");
        if (v26 != -[MRDeviceInfo isPairingAllowed](self, "isPairingAllowed"))
          goto LABEL_208;
      }
    }
    v27 = -[MRDeviceInfo hasProxyGroupPlayer](v4, "hasProxyGroupPlayer");
    if (v27 != -[MRDeviceInfo hasProxyGroupPlayer](self, "hasProxyGroupPlayer"))
      goto LABEL_208;
    if (-[MRDeviceInfo hasProxyGroupPlayer](v4, "hasProxyGroupPlayer"))
    {
      if (-[MRDeviceInfo hasProxyGroupPlayer](self, "hasProxyGroupPlayer"))
      {
        v28 = -[MRDeviceInfo isProxyGroupPlayer](v4, "isProxyGroupPlayer");
        if (v28 != -[MRDeviceInfo isProxyGroupPlayer](self, "isProxyGroupPlayer"))
          goto LABEL_208;
      }
    }
    v29 = -[MRDeviceInfo hasConnected](v4, "hasConnected");
    if (v29 != -[MRDeviceInfo hasConnected](self, "hasConnected"))
      goto LABEL_208;
    if (-[MRDeviceInfo hasConnected](v4, "hasConnected"))
    {
      if (-[MRDeviceInfo hasConnected](self, "hasConnected"))
      {
        v30 = -[MRDeviceInfo isConnected](v4, "isConnected");
        if (v30 != -[MRDeviceInfo isConnected](self, "isConnected"))
          goto LABEL_208;
      }
    }
    v31 = -[MRDeviceInfo hasGroupLeader](v4, "hasGroupLeader");
    if (v31 != -[MRDeviceInfo hasGroupLeader](self, "hasGroupLeader"))
      goto LABEL_208;
    if (-[MRDeviceInfo hasGroupLeader](v4, "hasGroupLeader"))
    {
      if (-[MRDeviceInfo hasGroupLeader](self, "hasGroupLeader"))
      {
        v32 = -[MRDeviceInfo isGroupLeader](v4, "isGroupLeader");
        if (v32 != -[MRDeviceInfo isGroupLeader](self, "isGroupLeader"))
          goto LABEL_208;
      }
    }
    v33 = -[MRDeviceInfo hasAirPlayActive](v4, "hasAirPlayActive");
    if (v33 != -[MRDeviceInfo hasAirPlayActive](self, "hasAirPlayActive"))
      goto LABEL_208;
    if (-[MRDeviceInfo hasAirPlayActive](v4, "hasAirPlayActive"))
    {
      if (-[MRDeviceInfo hasAirPlayActive](self, "hasAirPlayActive"))
      {
        v34 = -[MRDeviceInfo isAirPlayActive](v4, "isAirPlayActive");
        if (v34 != -[MRDeviceInfo isAirPlayActive](self, "isAirPlayActive"))
          goto LABEL_208;
      }
    }
    v35 = -[MRDeviceInfo hasSupportsMultiplayer](v4, "hasSupportsMultiplayer");
    if (v35 != -[MRDeviceInfo hasSupportsMultiplayer](self, "hasSupportsMultiplayer"))
      goto LABEL_208;
    if (-[MRDeviceInfo hasSupportsMultiplayer](v4, "hasSupportsMultiplayer"))
    {
      if (-[MRDeviceInfo hasSupportsMultiplayer](self, "hasSupportsMultiplayer"))
      {
        v36 = -[MRDeviceInfo supportsMultiplayer](v4, "supportsMultiplayer");
        if (v36 != -[MRDeviceInfo supportsMultiplayer](self, "supportsMultiplayer"))
          goto LABEL_208;
      }
    }
    v37 = -[MRDeviceInfo hasParentGroupContainsDiscoverableGroupLeader](v4, "hasParentGroupContainsDiscoverableGroupLeader");
    if (v37 != -[MRDeviceInfo hasParentGroupContainsDiscoverableGroupLeader](self, "hasParentGroupContainsDiscoverableGroupLeader"))goto LABEL_208;
    if (-[MRDeviceInfo hasParentGroupContainsDiscoverableGroupLeader](v4, "hasParentGroupContainsDiscoverableGroupLeader"))
    {
      if (-[MRDeviceInfo hasParentGroupContainsDiscoverableGroupLeader](self, "hasParentGroupContainsDiscoverableGroupLeader"))
      {
        v38 = -[MRDeviceInfo parentGroupContainsDiscoverableGroupLeader](v4, "parentGroupContainsDiscoverableGroupLeader");
        if (v38 != -[MRDeviceInfo parentGroupContainsDiscoverableGroupLeader](self, "parentGroupContainsDiscoverableGroupLeader"))goto LABEL_208;
      }
    }
    v39 = -[MRDeviceInfo hasGroupContainsDiscoverableGroupLeader](v4, "hasGroupContainsDiscoverableGroupLeader");
    if (v39 != -[MRDeviceInfo hasGroupContainsDiscoverableGroupLeader](self, "hasGroupContainsDiscoverableGroupLeader"))
      goto LABEL_208;
    if (-[MRDeviceInfo hasGroupContainsDiscoverableGroupLeader](v4, "hasGroupContainsDiscoverableGroupLeader"))
    {
      if (-[MRDeviceInfo hasGroupContainsDiscoverableGroupLeader](self, "hasGroupContainsDiscoverableGroupLeader"))
      {
        v40 = -[MRDeviceInfo groupContainsDiscoverableGroupLeader](v4, "groupContainsDiscoverableGroupLeader");
        if (v40 != -[MRDeviceInfo groupContainsDiscoverableGroupLeader](self, "groupContainsDiscoverableGroupLeader"))
          goto LABEL_208;
      }
    }
    -[MRDeviceInfo name](v4, "name");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo name](self, "name");
    v42 = objc_claimAutoreleasedReturnValue();
    if (v41 == (void *)v42)
    {

    }
    else
    {
      v43 = (void *)v42;
      -[MRDeviceInfo name](v4, "name");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDeviceInfo name](self, "name");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v44, "isEqualToString:", v45);

      if (!v46)
      {
LABEL_208:
        LOBYTE(v47) = 0;
        goto LABEL_209;
      }
    }
    -[MRDeviceInfo identifier](v4, "identifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo identifier](self, "identifier");
    v49 = objc_claimAutoreleasedReturnValue();
    if (v48 == (void *)v49)
    {

    }
    else
    {
      v50 = (void *)v49;
      -[MRDeviceInfo identifier](v4, "identifier");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDeviceInfo identifier](self, "identifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v51, "isEqualToString:", v52);

      if (!v53)
        goto LABEL_208;
    }
    -[MRDeviceInfo localizedModelName](v4, "localizedModelName");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo localizedModelName](self, "localizedModelName");
    v55 = objc_claimAutoreleasedReturnValue();
    if (v54 == (void *)v55)
    {

    }
    else
    {
      v56 = (void *)v55;
      -[MRDeviceInfo localizedModelName](v4, "localizedModelName");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDeviceInfo localizedModelName](self, "localizedModelName");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v57, "isEqualToString:", v58);

      if (!v59)
        goto LABEL_208;
    }
    -[MRDeviceInfo buildVersion](v4, "buildVersion");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo buildVersion](self, "buildVersion");
    v61 = objc_claimAutoreleasedReturnValue();
    if (v60 == (void *)v61)
    {

    }
    else
    {
      v62 = (void *)v61;
      -[MRDeviceInfo buildVersion](v4, "buildVersion");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDeviceInfo buildVersion](self, "buildVersion");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v63, "isEqualToString:", v64);

      if (!v65)
        goto LABEL_208;
    }
    -[MRDeviceInfo bundleIdentifier](v4, "bundleIdentifier");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo bundleIdentifier](self, "bundleIdentifier");
    v67 = objc_claimAutoreleasedReturnValue();
    if (v66 == (void *)v67)
    {

    }
    else
    {
      v68 = (void *)v67;
      -[MRDeviceInfo bundleIdentifier](v4, "bundleIdentifier");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDeviceInfo bundleIdentifier](self, "bundleIdentifier");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v69, "isEqualToString:", v70);

      if (!v71)
        goto LABEL_208;
    }
    -[MRDeviceInfo bundleVersion](v4, "bundleVersion");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo bundleVersion](self, "bundleVersion");
    v73 = objc_claimAutoreleasedReturnValue();
    if (v72 == (void *)v73)
    {

    }
    else
    {
      v74 = (void *)v73;
      -[MRDeviceInfo bundleVersion](v4, "bundleVersion");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDeviceInfo bundleVersion](self, "bundleVersion");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v75, "isEqualToString:", v76);

      if (!v77)
        goto LABEL_208;
    }
    -[MRDeviceInfo systemMediaApplication](v4, "systemMediaApplication");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo systemMediaApplication](self, "systemMediaApplication");
    v79 = objc_claimAutoreleasedReturnValue();
    if (v78 == (void *)v79)
    {

    }
    else
    {
      v80 = (void *)v79;
      -[MRDeviceInfo systemMediaApplication](v4, "systemMediaApplication");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDeviceInfo systemMediaApplication](self, "systemMediaApplication");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = objc_msgSend(v81, "isEqualToString:", v82);

      if (!v83)
        goto LABEL_208;
    }
    -[MRDeviceInfo systemPodcastApplication](v4, "systemPodcastApplication");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo systemPodcastApplication](self, "systemPodcastApplication");
    v85 = objc_claimAutoreleasedReturnValue();
    if (v84 == (void *)v85)
    {

    }
    else
    {
      v86 = (void *)v85;
      -[MRDeviceInfo systemPodcastApplication](v4, "systemPodcastApplication");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDeviceInfo systemPodcastApplication](self, "systemPodcastApplication");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = objc_msgSend(v87, "isEqualToString:", v88);

      if (!v89)
        goto LABEL_208;
    }
    -[MRDeviceInfo systemBooksApplication](v4, "systemBooksApplication");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo systemBooksApplication](self, "systemBooksApplication");
    v91 = objc_claimAutoreleasedReturnValue();
    if (v90 == (void *)v91)
    {

    }
    else
    {
      v92 = (void *)v91;
      -[MRDeviceInfo systemBooksApplication](v4, "systemBooksApplication");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDeviceInfo systemBooksApplication](self, "systemBooksApplication");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = objc_msgSend(v93, "isEqualToString:", v94);

      if (!v95)
        goto LABEL_208;
    }
    -[MRDeviceInfo deviceUID](v4, "deviceUID");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo deviceUID](self, "deviceUID");
    v97 = objc_claimAutoreleasedReturnValue();
    if (v96 == (void *)v97)
    {

    }
    else
    {
      v98 = (void *)v97;
      -[MRDeviceInfo deviceUID](v4, "deviceUID");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDeviceInfo deviceUID](self, "deviceUID");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = objc_msgSend(v99, "isEqualToString:", v100);

      if (!v101)
        goto LABEL_208;
    }
    -[MRDeviceInfo localReceiverPairingIdentity](v4, "localReceiverPairingIdentity");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo localReceiverPairingIdentity](self, "localReceiverPairingIdentity");
    v103 = objc_claimAutoreleasedReturnValue();
    if (v102 == (void *)v103)
    {

    }
    else
    {
      v104 = (void *)v103;
      -[MRDeviceInfo localReceiverPairingIdentity](v4, "localReceiverPairingIdentity");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDeviceInfo localReceiverPairingIdentity](self, "localReceiverPairingIdentity");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = objc_msgSend(v105, "isEqualToString:", v106);

      if (!v107)
        goto LABEL_208;
    }
    -[MRDeviceInfo managedConfigurationDeviceIdentifier](v4, "managedConfigurationDeviceIdentifier");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo managedConfigurationDeviceIdentifier](self, "managedConfigurationDeviceIdentifier");
    v109 = objc_claimAutoreleasedReturnValue();
    if (v108 == (void *)v109)
    {

    }
    else
    {
      v110 = (void *)v109;
      -[MRDeviceInfo managedConfigurationDeviceIdentifier](v4, "managedConfigurationDeviceIdentifier");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDeviceInfo managedConfigurationDeviceIdentifier](self, "managedConfigurationDeviceIdentifier");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = objc_msgSend(v111, "isEqualToString:", v112);

      if (!v113)
        goto LABEL_208;
    }
    -[MRDeviceInfo tightSyncUID](v4, "tightSyncUID");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo tightSyncUID](self, "tightSyncUID");
    v115 = objc_claimAutoreleasedReturnValue();
    if (v114 == (void *)v115)
    {

    }
    else
    {
      v116 = (void *)v115;
      -[MRDeviceInfo tightSyncUID](v4, "tightSyncUID");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDeviceInfo tightSyncUID](self, "tightSyncUID");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = objc_msgSend(v117, "isEqualToString:", v118);

      if (!v119)
        goto LABEL_208;
    }
    -[MRDeviceInfo groupUID](v4, "groupUID");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo groupUID](self, "groupUID");
    v121 = objc_claimAutoreleasedReturnValue();
    if (v120 == (void *)v121)
    {

    }
    else
    {
      v122 = (void *)v121;
      -[MRDeviceInfo groupUID](v4, "groupUID");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDeviceInfo groupUID](self, "groupUID");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = objc_msgSend(v123, "isEqualToString:", v124);

      if (!v125)
        goto LABEL_208;
    }
    -[MRDeviceInfo airPlayGroupUID](v4, "airPlayGroupUID");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo airPlayGroupUID](self, "airPlayGroupUID");
    v127 = objc_claimAutoreleasedReturnValue();
    if (v126 == (void *)v127)
    {

    }
    else
    {
      v128 = (void *)v127;
      -[MRDeviceInfo airPlayGroupUID](v4, "airPlayGroupUID");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDeviceInfo airPlayGroupUID](self, "airPlayGroupUID");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      v131 = objc_msgSend(v129, "isEqualToString:", v130);

      if (!v131)
        goto LABEL_208;
    }
    -[MRDeviceInfo groupName](v4, "groupName");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo groupName](self, "groupName");
    v133 = objc_claimAutoreleasedReturnValue();
    if (v132 == (void *)v133)
    {

    }
    else
    {
      v134 = (void *)v133;
      -[MRDeviceInfo groupName](v4, "groupName");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDeviceInfo groupName](self, "groupName");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = objc_msgSend(v135, "isEqualToString:", v136);

      if (!v137)
        goto LABEL_208;
    }
    -[MRDeviceInfo senderDefaultGroupUID](v4, "senderDefaultGroupUID");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo senderDefaultGroupUID](self, "senderDefaultGroupUID");
    v139 = objc_claimAutoreleasedReturnValue();
    if (v138 == (void *)v139)
    {

    }
    else
    {
      v140 = (void *)v139;
      -[MRDeviceInfo senderDefaultGroupUID](v4, "senderDefaultGroupUID");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDeviceInfo senderDefaultGroupUID](self, "senderDefaultGroupUID");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      v143 = objc_msgSend(v141, "isEqualToString:", v142);

      if (!v143)
        goto LABEL_208;
    }
    -[MRDeviceInfo bluetoothAddress](v4, "bluetoothAddress");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo bluetoothAddress](self, "bluetoothAddress");
    v145 = objc_claimAutoreleasedReturnValue();
    if (v144 == (void *)v145)
    {

    }
    else
    {
      v146 = (void *)v145;
      -[MRDeviceInfo bluetoothAddress](v4, "bluetoothAddress");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDeviceInfo bluetoothAddress](self, "bluetoothAddress");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      v149 = objc_msgSend(v147, "isEqualToData:", v148);

      if (!v149)
        goto LABEL_208;
    }
    -[MRDeviceInfo groupedDevices](v4, "groupedDevices");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo groupedDevices](self, "groupedDevices");
    v151 = objc_claimAutoreleasedReturnValue();
    if (v150 == (void *)v151)
    {

    }
    else
    {
      v152 = (void *)v151;
      -[MRDeviceInfo groupedDevices](v4, "groupedDevices");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDeviceInfo groupedDevices](self, "groupedDevices");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      v155 = objc_msgSend(v153, "isEqualToArray:", v154);

      if (!v155)
        goto LABEL_208;
    }
    -[MRDeviceInfo clusteredDevices](v4, "clusteredDevices");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo clusteredDevices](self, "clusteredDevices");
    v157 = objc_claimAutoreleasedReturnValue();
    if (v156 == (void *)v157)
    {

    }
    else
    {
      v158 = (void *)v157;
      -[MRDeviceInfo clusteredDevices](v4, "clusteredDevices");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDeviceInfo clusteredDevices](self, "clusteredDevices");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      v161 = objc_msgSend(v159, "isEqualToArray:", v160);

      if (!v161)
        goto LABEL_208;
    }
    -[MRDeviceInfo allClusteredDevices](v4, "allClusteredDevices");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo allClusteredDevices](self, "allClusteredDevices");
    v163 = objc_claimAutoreleasedReturnValue();
    if (v162 == (void *)v163)
    {

    }
    else
    {
      v164 = (void *)v163;
      -[MRDeviceInfo allClusteredDevices](v4, "allClusteredDevices");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDeviceInfo allClusteredDevices](self, "allClusteredDevices");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      v167 = objc_msgSend(v165, "isEqualToArray:", v166);

      if (!v167)
        goto LABEL_208;
    }
    -[MRDeviceInfo airPlayReceivers](v4, "airPlayReceivers");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo airPlayReceivers](self, "airPlayReceivers");
    v169 = objc_claimAutoreleasedReturnValue();
    if (v168 == (void *)v169)
    {

    }
    else
    {
      v170 = (void *)v169;
      -[MRDeviceInfo airPlayReceivers](v4, "airPlayReceivers");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDeviceInfo airPlayReceivers](self, "airPlayReceivers");
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      v173 = objc_msgSend(v171, "isEqualToArray:", v172);

      if (!v173)
        goto LABEL_208;
    }
    -[MRDeviceInfo linkAgent](v4, "linkAgent");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo linkAgent](self, "linkAgent");
    v175 = objc_claimAutoreleasedReturnValue();
    if (v174 == (void *)v175)
    {

    }
    else
    {
      v176 = (void *)v175;
      -[MRDeviceInfo linkAgent](v4, "linkAgent");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDeviceInfo linkAgent](self, "linkAgent");
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      v179 = objc_msgSend(v177, "isEqualToString:", v178);

      if (!v179)
        goto LABEL_208;
    }
    -[MRDeviceInfo clusterID](v4, "clusterID");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo clusterID](self, "clusterID");
    v181 = objc_claimAutoreleasedReturnValue();
    if (v180 == (void *)v181)
    {

    }
    else
    {
      v182 = (void *)v181;
      -[MRDeviceInfo clusterID](v4, "clusterID");
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDeviceInfo clusterID](self, "clusterID");
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      v185 = objc_msgSend(v183, "isEqualToString:", v184);

      if (!v185)
        goto LABEL_208;
    }
    -[MRDeviceInfo clusterLeaderID](v4, "clusterLeaderID");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo clusterLeaderID](self, "clusterLeaderID");
    v187 = objc_claimAutoreleasedReturnValue();
    if (v186 == (void *)v187)
    {

    }
    else
    {
      v188 = (void *)v187;
      -[MRDeviceInfo clusterLeaderID](v4, "clusterLeaderID");
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDeviceInfo clusterLeaderID](self, "clusterLeaderID");
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      v191 = objc_msgSend(v189, "isEqualToString:", v190);

      if (!v191)
        goto LABEL_208;
    }
    -[MRDeviceInfo computerName](v4, "computerName");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo computerName](self, "computerName");
    v193 = objc_claimAutoreleasedReturnValue();
    if (v192 == (void *)v193)
    {

    }
    else
    {
      v194 = (void *)v193;
      -[MRDeviceInfo computerName](v4, "computerName");
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDeviceInfo computerName](self, "computerName");
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      v197 = objc_msgSend(v195, "isEqualToString:", v196);

      if (!v197)
        goto LABEL_208;
    }
    v198 = -[MRDeviceInfo clusterType](v4, "clusterType");
    if (v198 != -[MRDeviceInfo clusterType](self, "clusterType"))
      goto LABEL_208;
    v199 = -[MRDeviceInfo isClusterAware](v4, "isClusterAware");
    if (v199 != -[MRDeviceInfo isClusterAware](self, "isClusterAware"))
      goto LABEL_208;
    v200 = -[MRDeviceInfo configuredClusterSize](v4, "configuredClusterSize");
    if (v200 != -[MRDeviceInfo configuredClusterSize](self, "configuredClusterSize"))
      goto LABEL_208;
    v201 = -[MRDeviceInfo isClusterLeader](v4, "isClusterLeader");
    if (v201 != -[MRDeviceInfo isClusterLeader](self, "isClusterLeader"))
      goto LABEL_208;
    -[MRDeviceInfo modelID](v4, "modelID");
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo modelID](self, "modelID");
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    v204 = v202;
    v205 = v203;
    if (v204 == v205)
    {

    }
    else
    {
      v206 = v205;
      v207 = objc_msgSend(v204, "isEqual:", v205);

      if ((v207 & 1) == 0)
        goto LABEL_208;
    }
    -[MRDeviceInfo routingContextID](v4, "routingContextID");
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo routingContextID](self, "routingContextID");
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    v210 = v208;
    v211 = v209;
    if (v210 == v211)
    {

    }
    else
    {
      v212 = v211;
      v213 = objc_msgSend(v210, "isEqual:", v211);

      if ((v213 & 1) == 0)
        goto LABEL_208;
    }
    v214 = -[MRDeviceInfo lastKnownClusterType](v4, "lastKnownClusterType");
    if (v214 != -[MRDeviceInfo lastKnownClusterType](self, "lastKnownClusterType"))
      goto LABEL_208;
    v215 = -[MRDeviceInfo supportsOutputContextSync](v4, "supportsOutputContextSync");
    if (v215 != -[MRDeviceInfo supportsOutputContextSync](self, "supportsOutputContextSync"))
      goto LABEL_208;
    v216 = -[MRDeviceInfo lastSupportedProtocolMessageType](v4, "lastSupportedProtocolMessageType");
    if (v216 != -[MRDeviceInfo lastSupportedProtocolMessageType](self, "lastSupportedProtocolMessageType"))
      goto LABEL_208;
    -[MRDeviceInfo groupSessionToken](v4, "groupSessionToken");
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo groupSessionToken](self, "groupSessionToken");
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    v219 = v217;
    v220 = v218;
    if (v219 == v220)
    {

    }
    else
    {
      v221 = v220;
      v222 = objc_msgSend(v219, "isEqual:", v220);

      if ((v222 & 1) == 0)
        goto LABEL_208;
    }
    -[MRDeviceInfo leaderDeviceInfo](v4, "leaderDeviceInfo");
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo leaderDeviceInfo](self, "leaderDeviceInfo");
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    v225 = v223;
    v226 = v224;
    if (v225 == v226)
    {

    }
    else
    {
      v227 = v226;
      v228 = objc_msgSend(v225, "isEqual:", v226);

      if ((v228 & 1) == 0)
        goto LABEL_208;
    }
    -[MRDeviceInfo activeSystemEndpointUID](v4, "activeSystemEndpointUID");
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo activeSystemEndpointUID](self, "activeSystemEndpointUID");
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    v231 = v229;
    v232 = v230;
    if (v231 == v232)
    {

    }
    else
    {
      v233 = v232;
      v234 = objc_msgSend(v231, "isEqual:", v232);

      if ((v234 & 1) == 0)
        goto LABEL_208;
    }
    v235 = -[MRDeviceInfo hasIsEligibleForHostingGroupSessionExcludingAcknowledgements](v4, "hasIsEligibleForHostingGroupSessionExcludingAcknowledgements");
    if (v235 == -[MRDeviceInfo hasIsEligibleForHostingGroupSessionExcludingAcknowledgements](self, "hasIsEligibleForHostingGroupSessionExcludingAcknowledgements"))
    {
      v237 = -[MRDeviceInfo isEligibleForHostingGroupSessionExcludingAcknowledgements](v4, "isEligibleForHostingGroupSessionExcludingAcknowledgements");
      v47 = v237 ^ -[MRDeviceInfo isEligibleForHostingGroupSessionExcludingAcknowledgements](self, "isEligibleForHostingGroupSessionExcludingAcknowledgements") ^ 1;
      goto LABEL_209;
    }
    goto LABEL_208;
  }
  LOBYTE(v47) = 1;
LABEL_209:

  return v47;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MRDeviceInfo WHAIdentifier](self, "WHAIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEligibleForHostingGroupSessionExcludingAcknowledgements
{
  return self->_isEligibleForHostingGroupSessionExcludingAcknowledgements;
}

- (void)setIsEligibleForHostingGroupSessionExcludingAcknowledgements:(BOOL)a3
{
  self->_isEligibleForHostingGroupSessionExcludingAcknowledgements = a3;
}

- (BOOL)hasIsEligibleForHostingGroupSessionExcludingAcknowledgements
{
  return self->_hasIsEligibleForHostingGroupSessionExcludingAcknowledgements;
}

- (void)setHasIsEligibleForHostingGroupSessionExcludingAcknowledgements:(BOOL)a3
{
  self->_hasIsEligibleForHostingGroupSessionExcludingAcknowledgements = a3;
}

- (BOOL)isClusterLeader
{
  return self->_clusterLeader;
}

- (void)setClusterLeader:(BOOL)a3
{
  self->_clusterLeader = a3;
}

- (NSString)activeSystemEndpointUID
{
  return self->_activeSystemEndpointUID;
}

- (void)setActiveSystemEndpointUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

@end
