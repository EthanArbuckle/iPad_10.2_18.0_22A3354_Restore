@implementation _MRDeviceInfoMessageProtobuf

- (BOOL)readFrom:(id)a3
{
  return _MRDeviceInfoMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (BOOL)tightlySyncedGroup
{
  return self->_tightlySyncedGroup;
}

- (NSString)tightSyncUID
{
  return self->_tightSyncUID;
}

- (NSString)systemPodcastApplication
{
  return self->_systemPodcastApplication;
}

- (NSString)systemMediaApplication
{
  return self->_systemMediaApplication;
}

- (NSString)systemBuildVersion
{
  return self->_systemBuildVersion;
}

- (NSString)systemBooksApplication
{
  return self->_systemBooksApplication;
}

- (BOOL)supportsSystemPairing
{
  return self->_supportsSystemPairing;
}

- (BOOL)supportsSharedQueue
{
  return self->_supportsSharedQueue;
}

- (BOOL)supportsOutputContextSync
{
  return self->_supportsOutputContextSync;
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

- (unsigned)sharedQueueVersion
{
  return self->_sharedQueueVersion;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
}

- (void)setTightlySyncedGroup:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_tightlySyncedGroup = a3;
}

- (void)setTightSyncUID:(id)a3
{
  objc_storeStrong((id *)&self->_tightSyncUID, a3);
}

- (void)setSystemPodcastApplication:(id)a3
{
  objc_storeStrong((id *)&self->_systemPodcastApplication, a3);
}

- (void)setSystemMediaApplication:(id)a3
{
  objc_storeStrong((id *)&self->_systemMediaApplication, a3);
}

- (void)setSystemBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_systemBuildVersion, a3);
}

- (void)setSystemBooksApplication:(id)a3
{
  objc_storeStrong((id *)&self->_systemBooksApplication, a3);
}

- (void)setSupportsSystemPairing:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_supportsSystemPairing = a3;
}

- (void)setSupportsSharedQueue:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_supportsSharedQueue = a3;
}

- (void)setSupportsOutputContextSync:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_supportsOutputContextSync = a3;
}

- (void)setSupportsMultiplayer:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_supportsMultiplayer = a3;
}

- (void)setSupportsExtendedMotion:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_supportsExtendedMotion = a3;
}

- (void)setSupportsACL:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_supportsACL = a3;
}

- (void)setSharedQueueVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_sharedQueueVersion = a3;
}

- (void)setSenderDefaultGroupUID:(id)a3
{
  objc_storeStrong((id *)&self->_senderDefaultGroupUID, a3);
}

- (void)setRoutingContextID:(id)a3
{
  objc_storeStrong((id *)&self->_routingContextID, a3);
}

- (void)setProtocolVersion:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_protocolVersion = a3;
}

- (void)setPreferredEncoding:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_preferredEncoding = a3;
}

- (void)setParentGroupContainsDiscoverableGroupLeader:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_parentGroupContainsDiscoverableGroupLeader = a3;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)setModelID:(id)a3
{
  objc_storeStrong((id *)&self->_modelID, a3);
}

- (void)setManagedConfigDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfigDeviceID, a3);
}

- (void)setLogicalDeviceCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_logicalDeviceCount = a3;
}

- (void)setLocalizedModelName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedModelName, a3);
}

- (void)setLinkAgent:(id)a3
{
  objc_storeStrong((id *)&self->_linkAgent, a3);
}

- (void)setLastSupportedMessageType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_lastSupportedMessageType = a3;
}

- (void)setLastKnownClusterType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_lastKnownClusterType = a3;
}

- (void)setIsProxyGroupPlayer:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_isProxyGroupPlayer = a3;
}

- (void)setIsGroupLeader:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isGroupLeader = a3;
}

- (void)setIsClusterAware:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_isClusterAware = a3;
}

- (void)setIsAirplayActive:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_isAirplayActive = a3;
}

- (void)setHasTightlySyncedGroup:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (void)setHasSupportsSystemPairing:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (void)setHasSupportsSharedQueue:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (void)setHasSupportsMultiplayer:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (void)setHasSupportsExtendedMotion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (void)setHasSupportsACL:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (void)setHasSharedQueueVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (void)setHasProtocolVersion:(BOOL)a3
{
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (void)setHasPreferredEncoding:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (void)setHasParentGroupContainsDiscoverableGroupLeader:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (void)setHasLogicalDeviceCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (void)setHasIsProxyGroupPlayer:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (void)setHasIsGroupLeader:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (void)setHasIsAirplayActive:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (void)setHasGroupContainsDiscoverableGroupLeader:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (void)setHasDeviceClass:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (void)setHasConnected:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (void)setHasAllowsPairing:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (void)setGroupedDevices:(id)a3
{
  objc_storeStrong((id *)&self->_groupedDevices, a3);
}

- (void)setGroupUID:(id)a3
{
  objc_storeStrong((id *)&self->_groupUID, a3);
}

- (void)setGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_groupName, a3);
}

- (void)setGroupContainsDiscoverableGroupLeader:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_groupContainsDiscoverableGroupLeader = a3;
}

- (void)setDeviceUID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUID, a3);
}

- (void)setDeviceClass:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_deviceClass = a3;
}

- (void)setConnected:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_connected = a3;
}

- (void)setConfiguredClusterSize:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_configuredClusterSize = a3;
}

- (void)setComputerName:(id)a3
{
  objc_storeStrong((id *)&self->_computerName, a3);
}

- (void)setClusteredDevices:(id)a3
{
  objc_storeStrong((id *)&self->_clusteredDevices, a3);
}

- (void)setClusterType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_clusterType = a3;
}

- (void)setClusterLeaderID:(id)a3
{
  objc_storeStrong((id *)&self->_clusterLeaderID, a3);
}

- (void)setClusterID:(id)a3
{
  objc_storeStrong((id *)&self->_clusterID, a3);
}

- (void)setBluetoothAddress:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothAddress, a3);
}

- (void)setApplicationBundleVersion:(id)a3
{
  objc_storeStrong((id *)&self->_applicationBundleVersion, a3);
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, a3);
}

- (void)setAllowsPairing:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_allowsPairing = a3;
}

- (void)setAllClusteredDevices:(id)a3
{
  objc_storeStrong((id *)&self->_allClusteredDevices, a3);
}

- (void)setAirplayReceivers:(id)a3
{
  objc_storeStrong((id *)&self->_airplayReceivers, a3);
}

- (void)setAirPlayGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_airPlayGroupID, a3);
}

- (NSString)senderDefaultGroupUID
{
  return self->_senderDefaultGroupUID;
}

- (NSString)routingContextID
{
  return self->_routingContextID;
}

- (unint64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (int)preferredEncoding
{
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    return self->_preferredEncoding;
  else
    return 0;
}

- (BOOL)parentGroupContainsDiscoverableGroupLeader
{
  return self->_parentGroupContainsDiscoverableGroupLeader;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)modelID
{
  return self->_modelID;
}

- (NSString)managedConfigDeviceID
{
  return self->_managedConfigDeviceID;
}

- (unsigned)logicalDeviceCount
{
  return self->_logicalDeviceCount;
}

- (NSString)localizedModelName
{
  return self->_localizedModelName;
}

- (NSString)linkAgent
{
  return self->_linkAgent;
}

- (_MRDeviceInfoMessageProtobuf)leaderDeviceInfo
{
  return self->_leaderDeviceInfo;
}

- (unsigned)lastSupportedMessageType
{
  return self->_lastSupportedMessageType;
}

- (unsigned)lastKnownClusterType
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_lastKnownClusterType;
  else
    return 2;
}

- (BOOL)isProxyGroupPlayer
{
  return self->_isProxyGroupPlayer;
}

- (BOOL)isGroupLeader
{
  return self->_isGroupLeader;
}

- (BOOL)isClusterAware
{
  return self->_isClusterAware;
}

- (BOOL)isAirplayActive
{
  return self->_isAirplayActive;
}

- (BOOL)hasTightlySyncedGroup
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (BOOL)hasSupportsSystemPairing
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (BOOL)hasSupportsSharedQueue
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (BOOL)hasSupportsMultiplayer
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (BOOL)hasSupportsExtendedMotion
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (BOOL)hasSupportsACL
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (BOOL)hasSharedQueueVersion
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (BOOL)hasProtocolVersion
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasPreferredEncoding
{
  return *(_BYTE *)&self->_has >> 7;
}

- (BOOL)hasParentGroupContainsDiscoverableGroupLeader
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (BOOL)hasIsProxyGroupPlayer
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (BOOL)hasIsGroupLeader
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (BOOL)hasIsAirplayActive
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasGroupContainsDiscoverableGroupLeader
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (BOOL)hasDeviceClass
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasConnected
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (BOOL)hasAllowsPairing
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (NSMutableArray)groupedDevices
{
  return self->_groupedDevices;
}

- (unint64_t)groupedDevicesCount
{
  return -[NSMutableArray count](self->_groupedDevices, "count");
}

- (NSString)groupUID
{
  return self->_groupUID;
}

- (_MRGroupSessionTokenProtobuf)groupSessionToken
{
  return self->_groupSessionToken;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (BOOL)groupContainsDiscoverableGroupLeader
{
  return self->_groupContainsDiscoverableGroupLeader;
}

- (NSString)deviceUID
{
  return self->_deviceUID;
}

- (int)deviceClass
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_deviceClass;
  else
    return -1;
}

- (BOOL)connected
{
  return self->_connected;
}

- (unsigned)configuredClusterSize
{
  return self->_configuredClusterSize;
}

- (NSString)computerName
{
  return self->_computerName;
}

- (NSMutableArray)clusteredDevices
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

- (NSData)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (NSString)applicationBundleVersion
{
  return self->_applicationBundleVersion;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (BOOL)allowsPairing
{
  return self->_allowsPairing;
}

- (NSMutableArray)allClusteredDevices
{
  return self->_allClusteredDevices;
}

- (NSMutableArray)airplayReceivers
{
  return self->_airplayReceivers;
}

- (NSString)airPlayGroupID
{
  return self->_airPlayGroupID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_tightSyncUID, 0);
  objc_storeStrong((id *)&self->_systemPodcastApplication, 0);
  objc_storeStrong((id *)&self->_systemMediaApplication, 0);
  objc_storeStrong((id *)&self->_systemBuildVersion, 0);
  objc_storeStrong((id *)&self->_systemBooksApplication, 0);
  objc_storeStrong((id *)&self->_senderDefaultGroupUID, 0);
  objc_storeStrong((id *)&self->_routingContextID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_managedConfigDeviceID, 0);
  objc_storeStrong((id *)&self->_localizedModelName, 0);
  objc_storeStrong((id *)&self->_linkAgent, 0);
  objc_storeStrong((id *)&self->_leaderDeviceInfo, 0);
  objc_storeStrong((id *)&self->_groupedDevices, 0);
  objc_storeStrong((id *)&self->_groupUID, 0);
  objc_storeStrong((id *)&self->_groupSessionToken, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_computerName, 0);
  objc_storeStrong((id *)&self->_clusteredDevices, 0);
  objc_storeStrong((id *)&self->_clusterLeaderID, 0);
  objc_storeStrong((id *)&self->_clusterID, 0);
  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
  objc_storeStrong((id *)&self->_applicationBundleVersion, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_allClusteredDevices, 0);
  objc_storeStrong((id *)&self->_airplayReceivers, 0);
  objc_storeStrong((id *)&self->_airPlayGroupID, 0);
  objc_storeStrong((id *)&self->_activeSystemEndpointUID, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  $87FBF03E59C4EA3D4DF569759040E686 has;
  $87FBF03E59C4EA3D4DF569759040E686 v6;
  $87FBF03E59C4EA3D4DF569759040E686 v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  $87FBF03E59C4EA3D4DF569759040E686 v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  $87FBF03E59C4EA3D4DF569759040E686 v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  $87FBF03E59C4EA3D4DF569759040E686 v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  $87FBF03E59C4EA3D4DF569759040E686 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_uniqueIdentifier)
    PBDataWriterWriteStringField();
  if (self->_name)
    PBDataWriterWriteStringField();
  if (self->_localizedModelName)
    PBDataWriterWriteStringField();
  if (self->_systemBuildVersion)
    PBDataWriterWriteStringField();
  if (self->_applicationBundleIdentifier)
    PBDataWriterWriteStringField();
  if (self->_applicationBundleVersion)
    PBDataWriterWriteStringField();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 0x20) == 0)
    {
LABEL_15:
      if ((*(_DWORD *)&has & 0x1000000) == 0)
        goto LABEL_16;
      goto LABEL_125;
    }
  }
  else if ((*(_BYTE *)&has & 0x20) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_126;
  }
LABEL_125:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_126:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
LABEL_18:
    PBDataWriterWriteBOOLField();
LABEL_19:
  if (self->_systemMediaApplication)
    PBDataWriterWriteStringField();
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x800000) == 0)
    {
LABEL_23:
      if ((*(_DWORD *)&v6 & 0x100000) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x800000) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
LABEL_24:
    PBDataWriterWriteBOOLField();
LABEL_25:
  if (self->_bluetoothAddress)
    PBDataWriterWriteDataField();
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_deviceUID)
    PBDataWriterWriteStringField();
  if (self->_managedConfigDeviceID)
    PBDataWriterWriteStringField();
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v7 = self->_has;
    if ((*(_BYTE *)&v7 & 0x40) == 0)
    {
LABEL_35:
      if ((*(_DWORD *)&v7 & 0x2000000) == 0)
        goto LABEL_36;
      goto LABEL_133;
    }
  }
  else if ((*(_BYTE *)&v7 & 0x40) == 0)
  {
    goto LABEL_35;
  }
  PBDataWriterWriteUint32Field();
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x2000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v7 & 0x20000) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_133:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
LABEL_37:
    PBDataWriterWriteBOOLField();
LABEL_38:
  if (self->_tightSyncUID)
    PBDataWriterWriteStringField();
  if (self->_groupUID)
    PBDataWriterWriteStringField();
  if (self->_groupName)
    PBDataWriterWriteStringField();
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v8 = self->_groupedDevices;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v45;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v45 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    }
    while (v10);
  }

  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x10000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v13 = self->_has;
  }
  if ((*(_WORD *)&v13 & 0x1000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_systemPodcastApplication)
    PBDataWriterWriteStringField();
  if (self->_senderDefaultGroupUID)
    PBDataWriterWriteStringField();
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v14 = self->_airplayReceivers;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v41;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v41 != v17)
          objc_enumerationMutation(v14);
        PBDataWriterWriteStringField();
        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    }
    while (v16);
  }

  if (self->_linkAgent)
    PBDataWriterWriteStringField();
  if (self->_clusterID)
    PBDataWriterWriteStringField();
  if (self->_clusterLeaderID)
    PBDataWriterWriteStringField();
  v19 = self->_has;
  if ((*(_BYTE *)&v19 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v19 = self->_has;
  }
  if ((*(_WORD *)&v19 & 0x2000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_modelID)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 2) & 0x20) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_routingContextID)
    PBDataWriterWriteStringField();
  if (self->_airPlayGroupID)
    PBDataWriterWriteStringField();
  if (self->_systemBooksApplication)
    PBDataWriterWriteStringField();
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v20 = self->_clusteredDevices;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v37;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v37 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
    }
    while (v22);
  }

  v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v25 = self->_has;
    if ((*(_WORD *)&v25 & 0x800) == 0)
    {
LABEL_95:
      if ((*(_BYTE *)&v25 & 0x10) == 0)
        goto LABEL_97;
      goto LABEL_96;
    }
  }
  else if ((*(_WORD *)&v25 & 0x800) == 0)
  {
    goto LABEL_95;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
LABEL_96:
    PBDataWriterWriteUint32Field();
LABEL_97:
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v26 = self->_allClusteredDevices;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v33;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v33 != v29)
          objc_enumerationMutation(v26);
        PBDataWriterWriteSubmessage();
        ++v30;
      }
      while (v28 != v30);
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
    }
    while (v28);
  }

  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_computerName)
    PBDataWriterWriteStringField();
  v31 = self->_has;
  if ((*(_BYTE *)&v31 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v31 = self->_has;
  }
  if ((*(_BYTE *)&v31 & 0x80) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_groupSessionToken)
    PBDataWriterWriteSubmessage();
  if (self->_leaderDeviceInfo)
    PBDataWriterWriteSubmessage();
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_activeSystemEndpointUID)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
    PBDataWriterWriteBOOLField();

}

- (BOOL)hasUniqueIdentifier
{
  return self->_uniqueIdentifier != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasLocalizedModelName
{
  return self->_localizedModelName != 0;
}

- (BOOL)hasSystemBuildVersion
{
  return self->_systemBuildVersion != 0;
}

- (BOOL)hasApplicationBundleIdentifier
{
  return self->_applicationBundleIdentifier != 0;
}

- (BOOL)hasApplicationBundleVersion
{
  return self->_applicationBundleVersion != 0;
}

- (void)setHasLastSupportedMessageType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasLastSupportedMessageType
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasSystemMediaApplication
{
  return self->_systemMediaApplication != 0;
}

- (BOOL)hasBluetoothAddress
{
  return self->_bluetoothAddress != 0;
}

- (BOOL)hasDeviceUID
{
  return self->_deviceUID != 0;
}

- (BOOL)hasManagedConfigDeviceID
{
  return self->_managedConfigDeviceID != 0;
}

- (id)deviceClassAsString:(int)a3
{
  int v3;
  __CFString *v4;

  v3 = a3 + 1;
  if ((a3 + 1) < 0xF && ((0x7FFDu >> v3) & 1) != 0)
  {
    v4 = off_1E30CD638[v3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsDeviceClass:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Invalid")) & 1) != 0)
  {
    v4 = -1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iPhone")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iPod")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iPad")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppleTV")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iFPGA")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Watch")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Accessory")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Bridge")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Mac")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Android")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Web")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppleDisplay")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RealityDevice")))
  {
    v4 = 13;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (BOOL)hasLogicalDeviceCount
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasTightSyncUID
{
  return self->_tightSyncUID != 0;
}

- (BOOL)hasGroupUID
{
  return self->_groupUID != 0;
}

- (BOOL)hasGroupName
{
  return self->_groupName != 0;
}

- (void)clearGroupedDevices
{
  -[NSMutableArray removeAllObjects](self->_groupedDevices, "removeAllObjects");
}

- (void)addGroupedDevices:(id)a3
{
  id v4;
  NSMutableArray *groupedDevices;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  groupedDevices = self->_groupedDevices;
  v8 = v4;
  if (!groupedDevices)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_groupedDevices;
    self->_groupedDevices = v6;

    v4 = v8;
    groupedDevices = self->_groupedDevices;
  }
  -[NSMutableArray addObject:](groupedDevices, "addObject:", v4);

}

- (id)groupedDevicesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_groupedDevices, "objectAtIndex:", a3);
}

+ (Class)groupedDevicesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSystemPodcastApplication
{
  return self->_systemPodcastApplication != 0;
}

- (BOOL)hasSenderDefaultGroupUID
{
  return self->_senderDefaultGroupUID != 0;
}

- (void)clearAirplayReceivers
{
  -[NSMutableArray removeAllObjects](self->_airplayReceivers, "removeAllObjects");
}

- (void)addAirplayReceivers:(id)a3
{
  id v4;
  NSMutableArray *airplayReceivers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  airplayReceivers = self->_airplayReceivers;
  v8 = v4;
  if (!airplayReceivers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_airplayReceivers;
    self->_airplayReceivers = v6;

    v4 = v8;
    airplayReceivers = self->_airplayReceivers;
  }
  -[NSMutableArray addObject:](airplayReceivers, "addObject:", v4);

}

- (unint64_t)airplayReceiversCount
{
  return -[NSMutableArray count](self->_airplayReceivers, "count");
}

- (id)airplayReceiversAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_airplayReceivers, "objectAtIndex:", a3);
}

+ (Class)airplayReceiversType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasLinkAgent
{
  return self->_linkAgent != 0;
}

- (BOOL)hasClusterID
{
  return self->_clusterID != 0;
}

- (BOOL)hasClusterLeaderID
{
  return self->_clusterLeaderID != 0;
}

- (void)setHasClusterType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasClusterType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsClusterAware:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasIsClusterAware
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (BOOL)hasModelID
{
  return self->_modelID != 0;
}

- (BOOL)hasRoutingContextID
{
  return self->_routingContextID != 0;
}

- (BOOL)hasAirPlayGroupID
{
  return self->_airPlayGroupID != 0;
}

- (BOOL)hasSystemBooksApplication
{
  return self->_systemBooksApplication != 0;
}

- (void)clearClusteredDevices
{
  -[NSMutableArray removeAllObjects](self->_clusteredDevices, "removeAllObjects");
}

- (void)addClusteredDevices:(id)a3
{
  id v4;
  NSMutableArray *clusteredDevices;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  clusteredDevices = self->_clusteredDevices;
  v8 = v4;
  if (!clusteredDevices)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_clusteredDevices;
    self->_clusteredDevices = v6;

    v4 = v8;
    clusteredDevices = self->_clusteredDevices;
  }
  -[NSMutableArray addObject:](clusteredDevices, "addObject:", v4);

}

- (unint64_t)clusteredDevicesCount
{
  return -[NSMutableArray count](self->_clusteredDevices, "count");
}

- (id)clusteredDevicesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_clusteredDevices, "objectAtIndex:", a3);
}

+ (Class)clusteredDevicesType
{
  return (Class)objc_opt_class();
}

- (void)setHasLastKnownClusterType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasLastKnownClusterType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)clearAllClusteredDevices
{
  -[NSMutableArray removeAllObjects](self->_allClusteredDevices, "removeAllObjects");
}

- (void)addAllClusteredDevices:(id)a3
{
  id v4;
  NSMutableArray *allClusteredDevices;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  allClusteredDevices = self->_allClusteredDevices;
  v8 = v4;
  if (!allClusteredDevices)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_allClusteredDevices;
    self->_allClusteredDevices = v6;

    v4 = v8;
    allClusteredDevices = self->_allClusteredDevices;
  }
  -[NSMutableArray addObject:](allClusteredDevices, "addObject:", v4);

}

- (unint64_t)allClusteredDevicesCount
{
  return -[NSMutableArray count](self->_allClusteredDevices, "count");
}

- (id)allClusteredDevicesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_allClusteredDevices, "objectAtIndex:", a3);
}

+ (Class)allClusteredDevicesType
{
  return (Class)objc_opt_class();
}

- (void)setHasSupportsOutputContextSync:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasSupportsOutputContextSync
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (BOOL)hasComputerName
{
  return self->_computerName != 0;
}

- (void)setHasConfiguredClusterSize:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasConfiguredClusterSize
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)preferredEncodingAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Default");
  if (a3 == 1)
  {
    v3 = CFSTR("JSON");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsPreferredEncoding:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Default")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("JSON"));

  return v4;
}

- (BOOL)hasGroupSessionToken
{
  return self->_groupSessionToken != 0;
}

- (BOOL)hasLeaderDeviceInfo
{
  return self->_leaderDeviceInfo != 0;
}

- (void)setIsClusterLeader:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_isClusterLeader = a3;
}

- (void)setHasIsClusterLeader:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasIsClusterLeader
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (BOOL)hasActiveSystemEndpointUID
{
  return self->_activeSystemEndpointUID != 0;
}

- (void)setIsEligibleForHostingGroupSessionExcludingAcknowledgements:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isEligibleForHostingGroupSessionExcludingAcknowledgements = a3;
}

- (void)setHasIsEligibleForHostingGroupSessionExcludingAcknowledgements:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($87FBF03E59C4EA3D4DF569759040E686)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsEligibleForHostingGroupSessionExcludingAcknowledgements
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_MRDeviceInfoMessageProtobuf;
  -[_MRDeviceInfoMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRDeviceInfoMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uniqueIdentifier;
  NSString *name;
  NSString *localizedModelName;
  NSString *systemBuildVersion;
  NSString *applicationBundleIdentifier;
  NSString *applicationBundleVersion;
  $87FBF03E59C4EA3D4DF569759040E686 has;
  void *v12;
  NSString *systemMediaApplication;
  $87FBF03E59C4EA3D4DF569759040E686 v14;
  void *v15;
  NSData *bluetoothAddress;
  void *v17;
  NSString *deviceUID;
  NSString *managedConfigDeviceID;
  $87FBF03E59C4EA3D4DF569759040E686 v20;
  void *v21;
  NSString *tightSyncUID;
  NSString *groupUID;
  NSString *groupName;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  $87FBF03E59C4EA3D4DF569759040E686 v32;
  void *v33;
  void *v34;
  NSString *systemPodcastApplication;
  NSString *senderDefaultGroupUID;
  NSMutableArray *airplayReceivers;
  NSString *linkAgent;
  NSString *clusterID;
  NSString *clusterLeaderID;
  $87FBF03E59C4EA3D4DF569759040E686 v41;
  void *v42;
  void *v43;
  NSString *modelID;
  void *v45;
  NSString *routingContextID;
  NSString *airPlayGroupID;
  NSString *systemBooksApplication;
  void *v49;
  NSMutableArray *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  $87FBF03E59C4EA3D4DF569759040E686 v56;
  void *v57;
  void *v58;
  NSMutableArray *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t k;
  void *v64;
  void *v65;
  NSString *computerName;
  $87FBF03E59C4EA3D4DF569759040E686 v67;
  void *v68;
  int preferredEncoding;
  __CFString *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  unsigned int v77;
  __CFString *v78;
  void *v79;
  void *v80;
  _MRGroupSessionTokenProtobuf *groupSessionToken;
  void *v82;
  _MRDeviceInfoMessageProtobuf *leaderDeviceInfo;
  void *v84;
  void *v85;
  NSString *activeSystemEndpointUID;
  void *v87;
  id v88;
  void *v90;
  void *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
    objc_msgSend(v3, "setObject:forKey:", uniqueIdentifier, CFSTR("uniqueIdentifier"));
  name = self->_name;
  if (name)
    objc_msgSend(v4, "setObject:forKey:", name, CFSTR("name"));
  localizedModelName = self->_localizedModelName;
  if (localizedModelName)
    objc_msgSend(v4, "setObject:forKey:", localizedModelName, CFSTR("localizedModelName"));
  systemBuildVersion = self->_systemBuildVersion;
  if (systemBuildVersion)
    objc_msgSend(v4, "setObject:forKey:", systemBuildVersion, CFSTR("systemBuildVersion"));
  applicationBundleIdentifier = self->_applicationBundleIdentifier;
  if (applicationBundleIdentifier)
    objc_msgSend(v4, "setObject:forKey:", applicationBundleIdentifier, CFSTR("applicationBundleIdentifier"));
  applicationBundleVersion = self->_applicationBundleVersion;
  if (applicationBundleVersion)
    objc_msgSend(v4, "setObject:forKey:", applicationBundleVersion, CFSTR("applicationBundleVersion"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_protocolVersion);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v71, CFSTR("protocolVersion"));

    has = self->_has;
    if ((*(_BYTE *)&has & 0x20) == 0)
    {
LABEL_15:
      if ((*(_DWORD *)&has & 0x1000000) == 0)
        goto LABEL_16;
      goto LABEL_117;
    }
  }
  else if ((*(_BYTE *)&has & 0x20) == 0)
  {
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_lastSupportedMessageType);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v72, CFSTR("lastSupportedMessageType"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_118;
  }
LABEL_117:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsSystemPairing);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v73, CFSTR("supportsSystemPairing"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_118:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowsPairing);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v74, CFSTR("allowsPairing"));

  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_connected);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("connected"));

  }
LABEL_19:
  systemMediaApplication = self->_systemMediaApplication;
  if (systemMediaApplication)
    objc_msgSend(v4, "setObject:forKey:", systemMediaApplication, CFSTR("systemMediaApplication"));
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x80000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsACL);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v75, CFSTR("supportsACL"));

    v14 = self->_has;
    if ((*(_DWORD *)&v14 & 0x800000) == 0)
    {
LABEL_23:
      if ((*(_DWORD *)&v14 & 0x100000) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((*(_DWORD *)&v14 & 0x800000) == 0)
  {
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsSharedQueue);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v76, CFSTR("supportsSharedQueue"));

  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsExtendedMotion);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("supportsExtendedMotion"));

  }
LABEL_25:
  bluetoothAddress = self->_bluetoothAddress;
  if (bluetoothAddress)
    objc_msgSend(v4, "setObject:forKey:", bluetoothAddress, CFSTR("bluetoothAddress"));
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_sharedQueueVersion);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("sharedQueueVersion"));

  }
  deviceUID = self->_deviceUID;
  if (deviceUID)
    objc_msgSend(v4, "setObject:forKey:", deviceUID, CFSTR("deviceUID"));
  managedConfigDeviceID = self->_managedConfigDeviceID;
  if (managedConfigDeviceID)
    objc_msgSend(v4, "setObject:forKey:", managedConfigDeviceID, CFSTR("managedConfigDeviceID"));
  v20 = self->_has;
  if ((*(_BYTE *)&v20 & 8) != 0)
  {
    v77 = self->_deviceClass + 1;
    if (v77 < 0xF && ((0x7FFDu >> v77) & 1) != 0)
    {
      v78 = off_1E30CD638[v77];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_deviceClass);
      v78 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "setObject:forKey:", v78, CFSTR("deviceClass"));

    v20 = self->_has;
    if ((*(_BYTE *)&v20 & 0x40) == 0)
    {
LABEL_35:
      if ((*(_DWORD *)&v20 & 0x2000000) == 0)
        goto LABEL_36;
      goto LABEL_146;
    }
  }
  else if ((*(_BYTE *)&v20 & 0x40) == 0)
  {
    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_logicalDeviceCount);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v90, CFSTR("logicalDeviceCount"));

  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x2000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v20 & 0x20000) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_146:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_tightlySyncedGroup);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v91, CFSTR("tightlySyncedGroup"));

  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_37:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isProxyGroupPlayer);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("isProxyGroupPlayer"));

  }
LABEL_38:
  tightSyncUID = self->_tightSyncUID;
  if (tightSyncUID)
    objc_msgSend(v4, "setObject:forKey:", tightSyncUID, CFSTR("tightSyncUID"));
  groupUID = self->_groupUID;
  if (groupUID)
    objc_msgSend(v4, "setObject:forKey:", groupUID, CFSTR("groupUID"));
  groupName = self->_groupName;
  if (groupName)
    objc_msgSend(v4, "setObject:forKey:", groupName, CFSTR("groupName"));
  if (-[NSMutableArray count](self->_groupedDevices, "count"))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_groupedDevices, "count"));
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v26 = self->_groupedDevices;
    v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v100, v106, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v101;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v101 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * i), "dictionaryRepresentation");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v31);

        }
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v100, v106, 16);
      }
      while (v28);
    }

    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("groupedDevices"));
  }
  v32 = self->_has;
  if ((*(_DWORD *)&v32 & 0x10000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isGroupLeader);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("isGroupLeader"));

    v32 = self->_has;
  }
  if ((*(_WORD *)&v32 & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAirplayActive);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("isAirplayActive"));

  }
  systemPodcastApplication = self->_systemPodcastApplication;
  if (systemPodcastApplication)
    objc_msgSend(v4, "setObject:forKey:", systemPodcastApplication, CFSTR("systemPodcastApplication"));
  senderDefaultGroupUID = self->_senderDefaultGroupUID;
  if (senderDefaultGroupUID)
    objc_msgSend(v4, "setObject:forKey:", senderDefaultGroupUID, CFSTR("senderDefaultGroupUID"));
  airplayReceivers = self->_airplayReceivers;
  if (airplayReceivers)
    objc_msgSend(v4, "setObject:forKey:", airplayReceivers, CFSTR("airplayReceivers"));
  linkAgent = self->_linkAgent;
  if (linkAgent)
    objc_msgSend(v4, "setObject:forKey:", linkAgent, CFSTR("linkAgent"));
  clusterID = self->_clusterID;
  if (clusterID)
    objc_msgSend(v4, "setObject:forKey:", clusterID, CFSTR("clusterID"));
  clusterLeaderID = self->_clusterLeaderID;
  if (clusterLeaderID)
    objc_msgSend(v4, "setObject:forKey:", clusterLeaderID, CFSTR("clusterLeaderID"));
  v41 = self->_has;
  if ((*(_BYTE *)&v41 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_clusterType);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("clusterType"));

    v41 = self->_has;
  }
  if ((*(_WORD *)&v41 & 0x2000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isClusterAware);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("isClusterAware"));

  }
  modelID = self->_modelID;
  if (modelID)
    objc_msgSend(v4, "setObject:forKey:", modelID, CFSTR("modelID"));
  if ((*((_BYTE *)&self->_has + 2) & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsMultiplayer);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v45, CFSTR("supportsMultiplayer"));

  }
  routingContextID = self->_routingContextID;
  if (routingContextID)
    objc_msgSend(v4, "setObject:forKey:", routingContextID, CFSTR("routingContextID"));
  airPlayGroupID = self->_airPlayGroupID;
  if (airPlayGroupID)
    objc_msgSend(v4, "setObject:forKey:", airPlayGroupID, CFSTR("airPlayGroupID"));
  systemBooksApplication = self->_systemBooksApplication;
  if (systemBooksApplication)
    objc_msgSend(v4, "setObject:forKey:", systemBooksApplication, CFSTR("systemBooksApplication"));
  if (-[NSMutableArray count](self->_clusteredDevices, "count"))
  {
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_clusteredDevices, "count"));
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v50 = self->_clusteredDevices;
    v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v96, v105, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v97;
      do
      {
        for (j = 0; j != v52; ++j)
        {
          if (*(_QWORD *)v97 != v53)
            objc_enumerationMutation(v50);
          objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * j), "dictionaryRepresentation");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "addObject:", v55);

        }
        v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v96, v105, 16);
      }
      while (v52);
    }

    objc_msgSend(v4, "setObject:forKey:", v49, CFSTR("clusteredDevices"));
  }
  v56 = self->_has;
  if ((*(_DWORD *)&v56 & 0x40000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_parentGroupContainsDiscoverableGroupLeader);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v79, CFSTR("parentGroupContainsDiscoverableGroupLeader"));

    v56 = self->_has;
    if ((*(_WORD *)&v56 & 0x800) == 0)
    {
LABEL_94:
      if ((*(_BYTE *)&v56 & 0x10) == 0)
        goto LABEL_96;
      goto LABEL_95;
    }
  }
  else if ((*(_WORD *)&v56 & 0x800) == 0)
  {
    goto LABEL_94;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_groupContainsDiscoverableGroupLeader);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v80, CFSTR("groupContainsDiscoverableGroupLeader"));

  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_95:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_lastKnownClusterType);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("lastKnownClusterType"));

  }
LABEL_96:
  if (-[NSMutableArray count](self->_allClusteredDevices, "count"))
  {
    v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_allClusteredDevices, "count"));
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v59 = self->_allClusteredDevices;
    v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v92, v104, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v93;
      do
      {
        for (k = 0; k != v61; ++k)
        {
          if (*(_QWORD *)v93 != v62)
            objc_enumerationMutation(v59);
          objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * k), "dictionaryRepresentation");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "addObject:", v64);

        }
        v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v92, v104, 16);
      }
      while (v61);
    }

    objc_msgSend(v4, "setObject:forKey:", v58, CFSTR("allClusteredDevices"));
  }
  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsOutputContextSync);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v65, CFSTR("supportsOutputContextSync"));

  }
  computerName = self->_computerName;
  if (computerName)
    objc_msgSend(v4, "setObject:forKey:", computerName, CFSTR("computerName"));
  v67 = self->_has;
  if ((*(_BYTE *)&v67 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_configuredClusterSize);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v68, CFSTR("configuredClusterSize"));

    v67 = self->_has;
  }
  if ((*(_BYTE *)&v67 & 0x80) != 0)
  {
    preferredEncoding = self->_preferredEncoding;
    if (preferredEncoding)
    {
      if (preferredEncoding == 1)
      {
        v70 = CFSTR("JSON");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_preferredEncoding);
        v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v70 = CFSTR("Default");
    }
    objc_msgSend(v4, "setObject:forKey:", v70, CFSTR("preferredEncoding"));

  }
  groupSessionToken = self->_groupSessionToken;
  if (groupSessionToken)
  {
    -[_MRGroupSessionTokenProtobuf dictionaryRepresentation](groupSessionToken, "dictionaryRepresentation");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v82, CFSTR("groupSessionToken"));

  }
  leaderDeviceInfo = self->_leaderDeviceInfo;
  if (leaderDeviceInfo)
  {
    -[_MRDeviceInfoMessageProtobuf dictionaryRepresentation](leaderDeviceInfo, "dictionaryRepresentation");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v84, CFSTR("leaderDeviceInfo"));

  }
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isClusterLeader);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v85, CFSTR("isClusterLeader"));

  }
  activeSystemEndpointUID = self->_activeSystemEndpointUID;
  if (activeSystemEndpointUID)
    objc_msgSend(v4, "setObject:forKey:", activeSystemEndpointUID, CFSTR("activeSystemEndpointUID"));
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isEligibleForHostingGroupSessionExcludingAcknowledgements);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v87, CFSTR("isEligibleForHostingGroupSessionExcludingAcknowledgements"));

  }
  v88 = v4;

  return v88;
}

- (void)copyTo:(id)a3
{
  id v4;
  $87FBF03E59C4EA3D4DF569759040E686 has;
  $87FBF03E59C4EA3D4DF569759040E686 v6;
  $87FBF03E59C4EA3D4DF569759040E686 v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t i;
  void *v11;
  $87FBF03E59C4EA3D4DF569759040E686 v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t j;
  void *v16;
  _DWORD *v17;
  $87FBF03E59C4EA3D4DF569759040E686 v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t k;
  void *v22;
  $87FBF03E59C4EA3D4DF569759040E686 v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t m;
  void *v27;
  _DWORD *v28;
  $87FBF03E59C4EA3D4DF569759040E686 v29;
  id v30;

  v4 = a3;
  v30 = v4;
  if (self->_uniqueIdentifier)
  {
    objc_msgSend(v4, "setUniqueIdentifier:");
    v4 = v30;
  }
  if (self->_name)
  {
    objc_msgSend(v30, "setName:");
    v4 = v30;
  }
  if (self->_localizedModelName)
  {
    objc_msgSend(v30, "setLocalizedModelName:");
    v4 = v30;
  }
  if (self->_systemBuildVersion)
  {
    objc_msgSend(v30, "setSystemBuildVersion:");
    v4 = v30;
  }
  if (self->_applicationBundleIdentifier)
  {
    objc_msgSend(v30, "setApplicationBundleIdentifier:");
    v4 = v30;
  }
  if (self->_applicationBundleVersion)
  {
    objc_msgSend(v30, "setApplicationBundleVersion:");
    v4 = v30;
  }
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_protocolVersion;
    *((_DWORD *)v4 + 81) |= 1u;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x20) == 0)
    {
LABEL_15:
      if ((*(_DWORD *)&has & 0x1000000) == 0)
        goto LABEL_16;
      goto LABEL_113;
    }
  }
  else if ((*(_BYTE *)&has & 0x20) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)v4 + 41) = self->_lastSupportedMessageType;
  *((_DWORD *)v4 + 81) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_114;
  }
LABEL_113:
  *((_BYTE *)v4 + 319) = self->_supportsSystemPairing;
  *((_DWORD *)v4 + 81) |= 0x1000000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_114:
  *((_BYTE *)v4 + 304) = self->_allowsPairing;
  *((_DWORD *)v4 + 81) |= 0x200u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_18:
    *((_BYTE *)v4 + 305) = self->_connected;
    *((_DWORD *)v4 + 81) |= 0x400u;
  }
LABEL_19:
  if (self->_systemMediaApplication)
  {
    objc_msgSend(v30, "setSystemMediaApplication:");
    v4 = v30;
  }
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) != 0)
  {
    *((_BYTE *)v4 + 314) = self->_supportsACL;
    *((_DWORD *)v4 + 81) |= 0x80000u;
    v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x800000) == 0)
    {
LABEL_23:
      if ((*(_DWORD *)&v6 & 0x100000) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x800000) == 0)
  {
    goto LABEL_23;
  }
  *((_BYTE *)v4 + 318) = self->_supportsSharedQueue;
  *((_DWORD *)v4 + 81) |= 0x800000u;
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_24:
    *((_BYTE *)v4 + 315) = self->_supportsExtendedMotion;
    *((_DWORD *)v4 + 81) |= 0x100000u;
  }
LABEL_25:
  if (self->_bluetoothAddress)
  {
    objc_msgSend(v30, "setBluetoothAddress:");
    v4 = v30;
  }
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    *((_DWORD *)v4 + 62) = self->_sharedQueueVersion;
    *((_DWORD *)v4 + 81) |= 0x100u;
  }
  if (self->_deviceUID)
  {
    objc_msgSend(v30, "setDeviceUID:");
    v4 = v30;
  }
  if (self->_managedConfigDeviceID)
  {
    objc_msgSend(v30, "setManagedConfigDeviceID:");
    v4 = v30;
  }
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 8) != 0)
  {
    *((_DWORD *)v4 + 29) = self->_deviceClass;
    *((_DWORD *)v4 + 81) |= 8u;
    v7 = self->_has;
    if ((*(_BYTE *)&v7 & 0x40) == 0)
    {
LABEL_35:
      if ((*(_DWORD *)&v7 & 0x2000000) == 0)
        goto LABEL_36;
      goto LABEL_121;
    }
  }
  else if ((*(_BYTE *)&v7 & 0x40) == 0)
  {
    goto LABEL_35;
  }
  *((_DWORD *)v4 + 48) = self->_logicalDeviceCount;
  *((_DWORD *)v4 + 81) |= 0x40u;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x2000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v7 & 0x20000) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_121:
  *((_BYTE *)v4 + 320) = self->_tightlySyncedGroup;
  *((_DWORD *)v4 + 81) |= 0x2000000u;
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_37:
    *((_BYTE *)v4 + 312) = self->_isProxyGroupPlayer;
    *((_DWORD *)v4 + 81) |= 0x20000u;
  }
LABEL_38:
  if (self->_tightSyncUID)
    objc_msgSend(v30, "setTightSyncUID:");
  if (self->_groupUID)
    objc_msgSend(v30, "setGroupUID:");
  if (self->_groupName)
    objc_msgSend(v30, "setGroupName:");
  if (-[_MRDeviceInfoMessageProtobuf groupedDevicesCount](self, "groupedDevicesCount"))
  {
    objc_msgSend(v30, "clearGroupedDevices");
    v8 = -[_MRDeviceInfoMessageProtobuf groupedDevicesCount](self, "groupedDevicesCount");
    if (v8)
    {
      v9 = v8;
      for (i = 0; i != v9; ++i)
      {
        -[_MRDeviceInfoMessageProtobuf groupedDevicesAtIndex:](self, "groupedDevicesAtIndex:", i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addGroupedDevices:", v11);

      }
    }
  }
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x10000) != 0)
  {
    *((_BYTE *)v30 + 311) = self->_isGroupLeader;
    *((_DWORD *)v30 + 81) |= 0x10000u;
    v12 = self->_has;
  }
  if ((*(_WORD *)&v12 & 0x1000) != 0)
  {
    *((_BYTE *)v30 + 307) = self->_isAirplayActive;
    *((_DWORD *)v30 + 81) |= 0x1000u;
  }
  if (self->_systemPodcastApplication)
    objc_msgSend(v30, "setSystemPodcastApplication:");
  if (self->_senderDefaultGroupUID)
    objc_msgSend(v30, "setSenderDefaultGroupUID:");
  if (-[_MRDeviceInfoMessageProtobuf airplayReceiversCount](self, "airplayReceiversCount"))
  {
    objc_msgSend(v30, "clearAirplayReceivers");
    v13 = -[_MRDeviceInfoMessageProtobuf airplayReceiversCount](self, "airplayReceiversCount");
    if (v13)
    {
      v14 = v13;
      for (j = 0; j != v14; ++j)
      {
        -[_MRDeviceInfoMessageProtobuf airplayReceiversAtIndex:](self, "airplayReceiversAtIndex:", j);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addAirplayReceivers:", v16);

      }
    }
  }
  if (self->_linkAgent)
    objc_msgSend(v30, "setLinkAgent:");
  v17 = v30;
  if (self->_clusterID)
  {
    objc_msgSend(v30, "setClusterID:");
    v17 = v30;
  }
  if (self->_clusterLeaderID)
  {
    objc_msgSend(v30, "setClusterLeaderID:");
    v17 = v30;
  }
  v18 = self->_has;
  if ((*(_BYTE *)&v18 & 2) != 0)
  {
    v17[22] = self->_clusterType;
    v17[81] |= 2u;
    v18 = self->_has;
  }
  if ((*(_WORD *)&v18 & 0x2000) != 0)
  {
    *((_BYTE *)v17 + 308) = self->_isClusterAware;
    v17[81] |= 0x2000u;
  }
  if (self->_modelID)
  {
    objc_msgSend(v30, "setModelID:");
    v17 = v30;
  }
  if ((*((_BYTE *)&self->_has + 2) & 0x20) != 0)
  {
    *((_BYTE *)v17 + 316) = self->_supportsMultiplayer;
    v17[81] |= 0x200000u;
  }
  if (self->_routingContextID)
    objc_msgSend(v30, "setRoutingContextID:");
  if (self->_airPlayGroupID)
    objc_msgSend(v30, "setAirPlayGroupID:");
  if (self->_systemBooksApplication)
    objc_msgSend(v30, "setSystemBooksApplication:");
  if (-[_MRDeviceInfoMessageProtobuf clusteredDevicesCount](self, "clusteredDevicesCount"))
  {
    objc_msgSend(v30, "clearClusteredDevices");
    v19 = -[_MRDeviceInfoMessageProtobuf clusteredDevicesCount](self, "clusteredDevicesCount");
    if (v19)
    {
      v20 = v19;
      for (k = 0; k != v20; ++k)
      {
        -[_MRDeviceInfoMessageProtobuf clusteredDevicesAtIndex:](self, "clusteredDevicesAtIndex:", k);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addClusteredDevices:", v22);

      }
    }
  }
  v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x40000) == 0)
  {
    if ((*(_WORD *)&v23 & 0x800) == 0)
      goto LABEL_86;
LABEL_124:
    *((_BYTE *)v30 + 306) = self->_groupContainsDiscoverableGroupLeader;
    *((_DWORD *)v30 + 81) |= 0x800u;
    if ((*(_DWORD *)&self->_has & 0x10) == 0)
      goto LABEL_88;
    goto LABEL_87;
  }
  *((_BYTE *)v30 + 313) = self->_parentGroupContainsDiscoverableGroupLeader;
  *((_DWORD *)v30 + 81) |= 0x40000u;
  v23 = self->_has;
  if ((*(_WORD *)&v23 & 0x800) != 0)
    goto LABEL_124;
LABEL_86:
  if ((*(_BYTE *)&v23 & 0x10) != 0)
  {
LABEL_87:
    *((_DWORD *)v30 + 40) = self->_lastKnownClusterType;
    *((_DWORD *)v30 + 81) |= 0x10u;
  }
LABEL_88:
  if (-[_MRDeviceInfoMessageProtobuf allClusteredDevicesCount](self, "allClusteredDevicesCount"))
  {
    objc_msgSend(v30, "clearAllClusteredDevices");
    v24 = -[_MRDeviceInfoMessageProtobuf allClusteredDevicesCount](self, "allClusteredDevicesCount");
    if (v24)
    {
      v25 = v24;
      for (m = 0; m != v25; ++m)
      {
        -[_MRDeviceInfoMessageProtobuf allClusteredDevicesAtIndex:](self, "allClusteredDevicesAtIndex:", m);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addAllClusteredDevices:", v27);

      }
    }
  }
  v28 = v30;
  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
  {
    *((_BYTE *)v30 + 317) = self->_supportsOutputContextSync;
    *((_DWORD *)v30 + 81) |= 0x400000u;
  }
  if (self->_computerName)
  {
    objc_msgSend(v30, "setComputerName:");
    v28 = v30;
  }
  v29 = self->_has;
  if ((*(_BYTE *)&v29 & 4) != 0)
  {
    v28[28] = self->_configuredClusterSize;
    v28[81] |= 4u;
    v29 = self->_has;
  }
  if ((*(_BYTE *)&v29 & 0x80) != 0)
  {
    v28[56] = self->_preferredEncoding;
    v28[81] |= 0x80u;
  }
  if (self->_groupSessionToken)
  {
    objc_msgSend(v30, "setGroupSessionToken:");
    v28 = v30;
  }
  if (self->_leaderDeviceInfo)
  {
    objc_msgSend(v30, "setLeaderDeviceInfo:");
    v28 = v30;
  }
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    *((_BYTE *)v28 + 309) = self->_isClusterLeader;
    v28[81] |= 0x4000u;
  }
  if (self->_activeSystemEndpointUID)
  {
    objc_msgSend(v30, "setActiveSystemEndpointUID:");
    v28 = v30;
  }
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
  {
    *((_BYTE *)v28 + 310) = self->_isEligibleForHostingGroupSessionExcludingAcknowledgements;
    v28[81] |= 0x8000u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  $87FBF03E59C4EA3D4DF569759040E686 has;
  uint64_t v19;
  void *v20;
  $87FBF03E59C4EA3D4DF569759040E686 v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  $87FBF03E59C4EA3D4DF569759040E686 v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  $87FBF03E59C4EA3D4DF569759040E686 v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  NSMutableArray *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  $87FBF03E59C4EA3D4DF569759040E686 v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  NSMutableArray *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  $87FBF03E59C4EA3D4DF569759040E686 v73;
  NSMutableArray *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  $87FBF03E59C4EA3D4DF569759040E686 v82;
  id v83;
  void *v84;
  id v85;
  void *v86;
  uint64_t v87;
  void *v88;
  id v89;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uniqueIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 296);
  *(_QWORD *)(v5 + 296) = v6;

  v8 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v8;

  v10 = -[NSString copyWithZone:](self->_localizedModelName, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v10;

  v12 = -[NSString copyWithZone:](self->_systemBuildVersion, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 264);
  *(_QWORD *)(v5 + 264) = v12;

  v14 = -[NSString copyWithZone:](self->_applicationBundleIdentifier, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v14;

  v16 = -[NSString copyWithZone:](self->_applicationBundleVersion, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v16;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_protocolVersion;
    *(_DWORD *)(v5 + 324) |= 1u;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x1000000) == 0)
        goto LABEL_4;
      goto LABEL_73;
    }
  }
  else if ((*(_BYTE *)&has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 164) = self->_lastSupportedMessageType;
  *(_DWORD *)(v5 + 324) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_74;
  }
LABEL_73:
  *(_BYTE *)(v5 + 319) = self->_supportsSystemPairing;
  *(_DWORD *)(v5 + 324) |= 0x1000000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_74:
  *(_BYTE *)(v5 + 304) = self->_allowsPairing;
  *(_DWORD *)(v5 + 324) |= 0x200u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_6:
    *(_BYTE *)(v5 + 305) = self->_connected;
    *(_DWORD *)(v5 + 324) |= 0x400u;
  }
LABEL_7:
  v19 = -[NSString copyWithZone:](self->_systemMediaApplication, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 272);
  *(_QWORD *)(v5 + 272) = v19;

  v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x80000) != 0)
  {
    *(_BYTE *)(v5 + 314) = self->_supportsACL;
    *(_DWORD *)(v5 + 324) |= 0x80000u;
    v21 = self->_has;
    if ((*(_DWORD *)&v21 & 0x800000) == 0)
    {
LABEL_9:
      if ((*(_DWORD *)&v21 & 0x100000) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_DWORD *)&v21 & 0x800000) == 0)
  {
    goto LABEL_9;
  }
  *(_BYTE *)(v5 + 318) = self->_supportsSharedQueue;
  *(_DWORD *)(v5 + 324) |= 0x800000u;
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_10:
    *(_BYTE *)(v5 + 315) = self->_supportsExtendedMotion;
    *(_DWORD *)(v5 + 324) |= 0x100000u;
  }
LABEL_11:
  v22 = -[NSData copyWithZone:](self->_bluetoothAddress, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v22;

  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    *(_DWORD *)(v5 + 248) = self->_sharedQueueVersion;
    *(_DWORD *)(v5 + 324) |= 0x100u;
  }
  v24 = -[NSString copyWithZone:](self->_deviceUID, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v24;

  v26 = -[NSString copyWithZone:](self->_managedConfigDeviceID, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v26;

  v28 = self->_has;
  if ((*(_BYTE *)&v28 & 8) != 0)
  {
    *(_DWORD *)(v5 + 116) = self->_deviceClass;
    *(_DWORD *)(v5 + 324) |= 8u;
    v28 = self->_has;
    if ((*(_BYTE *)&v28 & 0x40) == 0)
    {
LABEL_15:
      if ((*(_DWORD *)&v28 & 0x2000000) == 0)
        goto LABEL_16;
      goto LABEL_81;
    }
  }
  else if ((*(_BYTE *)&v28 & 0x40) == 0)
  {
    goto LABEL_15;
  }
  *(_DWORD *)(v5 + 192) = self->_logicalDeviceCount;
  *(_DWORD *)(v5 + 324) |= 0x40u;
  v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x2000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&v28 & 0x20000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_81:
  *(_BYTE *)(v5 + 320) = self->_tightlySyncedGroup;
  *(_DWORD *)(v5 + 324) |= 0x2000000u;
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_17:
    *(_BYTE *)(v5 + 312) = self->_isProxyGroupPlayer;
    *(_DWORD *)(v5 + 324) |= 0x20000u;
  }
LABEL_18:
  v29 = -[NSString copyWithZone:](self->_tightSyncUID, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 288);
  *(_QWORD *)(v5 + 288) = v29;

  v31 = -[NSString copyWithZone:](self->_groupUID, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v31;

  v33 = -[NSString copyWithZone:](self->_groupName, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v33;

  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v35 = self->_groupedDevices;
  v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v103, v110, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v104;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v104 != v38)
          objc_enumerationMutation(v35);
        v40 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * v39), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addGroupedDevices:", v40);

        ++v39;
      }
      while (v37 != v39);
      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v103, v110, 16);
    }
    while (v37);
  }

  v41 = self->_has;
  if ((*(_DWORD *)&v41 & 0x10000) != 0)
  {
    *(_BYTE *)(v5 + 311) = self->_isGroupLeader;
    *(_DWORD *)(v5 + 324) |= 0x10000u;
    v41 = self->_has;
  }
  if ((*(_WORD *)&v41 & 0x1000) != 0)
  {
    *(_BYTE *)(v5 + 307) = self->_isAirplayActive;
    *(_DWORD *)(v5 + 324) |= 0x1000u;
  }
  v42 = -[NSString copyWithZone:](self->_systemPodcastApplication, "copyWithZone:", a3);
  v43 = *(void **)(v5 + 280);
  *(_QWORD *)(v5 + 280) = v42;

  v44 = -[NSString copyWithZone:](self->_senderDefaultGroupUID, "copyWithZone:", a3);
  v45 = *(void **)(v5 + 240);
  *(_QWORD *)(v5 + 240) = v44;

  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v46 = self->_airplayReceivers;
  v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v99, v109, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v100;
    do
    {
      v50 = 0;
      do
      {
        if (*(_QWORD *)v100 != v49)
          objc_enumerationMutation(v46);
        v51 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * v50), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAirplayReceivers:", v51);

        ++v50;
      }
      while (v48 != v50);
      v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v99, v109, 16);
    }
    while (v48);
  }

  v52 = -[NSString copyWithZone:](self->_linkAgent, "copyWithZone:", a3);
  v53 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v52;

  v54 = -[NSString copyWithZone:](self->_clusterID, "copyWithZone:", a3);
  v55 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v54;

  v56 = -[NSString copyWithZone:](self->_clusterLeaderID, "copyWithZone:", a3);
  v57 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v56;

  v58 = self->_has;
  if ((*(_BYTE *)&v58 & 2) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_clusterType;
    *(_DWORD *)(v5 + 324) |= 2u;
    v58 = self->_has;
  }
  if ((*(_WORD *)&v58 & 0x2000) != 0)
  {
    *(_BYTE *)(v5 + 308) = self->_isClusterAware;
    *(_DWORD *)(v5 + 324) |= 0x2000u;
  }
  v59 = -[NSString copyWithZone:](self->_modelID, "copyWithZone:", a3);
  v60 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v59;

  if ((*((_BYTE *)&self->_has + 2) & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 316) = self->_supportsMultiplayer;
    *(_DWORD *)(v5 + 324) |= 0x200000u;
  }
  v61 = -[NSString copyWithZone:](self->_routingContextID, "copyWithZone:", a3);
  v62 = *(void **)(v5 + 232);
  *(_QWORD *)(v5 + 232) = v61;

  v63 = -[NSString copyWithZone:](self->_airPlayGroupID, "copyWithZone:", a3);
  v64 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v63;

  v65 = -[NSString copyWithZone:](self->_systemBooksApplication, "copyWithZone:", a3);
  v66 = *(void **)(v5 + 256);
  *(_QWORD *)(v5 + 256) = v65;

  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v67 = self->_clusteredDevices;
  v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v67, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
  if (v68)
  {
    v69 = v68;
    v70 = *(_QWORD *)v96;
    do
    {
      v71 = 0;
      do
      {
        if (*(_QWORD *)v96 != v70)
          objc_enumerationMutation(v67);
        v72 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * v71), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addClusteredDevices:", v72);

        ++v71;
      }
      while (v69 != v71);
      v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v67, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
    }
    while (v69);
  }

  v73 = self->_has;
  if ((*(_DWORD *)&v73 & 0x40000) != 0)
  {
    *(_BYTE *)(v5 + 313) = self->_parentGroupContainsDiscoverableGroupLeader;
    *(_DWORD *)(v5 + 324) |= 0x40000u;
    v73 = self->_has;
    if ((*(_WORD *)&v73 & 0x800) == 0)
    {
LABEL_51:
      if ((*(_BYTE *)&v73 & 0x10) == 0)
        goto LABEL_53;
      goto LABEL_52;
    }
  }
  else if ((*(_WORD *)&v73 & 0x800) == 0)
  {
    goto LABEL_51;
  }
  *(_BYTE *)(v5 + 306) = self->_groupContainsDiscoverableGroupLeader;
  *(_DWORD *)(v5 + 324) |= 0x800u;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_52:
    *(_DWORD *)(v5 + 160) = self->_lastKnownClusterType;
    *(_DWORD *)(v5 + 324) |= 0x10u;
  }
LABEL_53:
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v74 = self->_allClusteredDevices;
  v75 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v74, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
  if (v75)
  {
    v76 = v75;
    v77 = *(_QWORD *)v92;
    do
    {
      v78 = 0;
      do
      {
        if (*(_QWORD *)v92 != v77)
          objc_enumerationMutation(v74);
        v79 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * v78), "copyWithZone:", a3, (_QWORD)v91);
        objc_msgSend((id)v5, "addAllClusteredDevices:", v79);

        ++v78;
      }
      while (v76 != v78);
      v76 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v74, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
    }
    while (v76);
  }

  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
  {
    *(_BYTE *)(v5 + 317) = self->_supportsOutputContextSync;
    *(_DWORD *)(v5 + 324) |= 0x400000u;
  }
  v80 = -[NSString copyWithZone:](self->_computerName, "copyWithZone:", a3, (_QWORD)v91);
  v81 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v80;

  v82 = self->_has;
  if ((*(_BYTE *)&v82 & 4) != 0)
  {
    *(_DWORD *)(v5 + 112) = self->_configuredClusterSize;
    *(_DWORD *)(v5 + 324) |= 4u;
    v82 = self->_has;
  }
  if ((*(_BYTE *)&v82 & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 224) = self->_preferredEncoding;
    *(_DWORD *)(v5 + 324) |= 0x80u;
  }
  v83 = -[_MRGroupSessionTokenProtobuf copyWithZone:](self->_groupSessionToken, "copyWithZone:", a3);
  v84 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v83;

  v85 = -[_MRDeviceInfoMessageProtobuf copyWithZone:](self->_leaderDeviceInfo, "copyWithZone:", a3);
  v86 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v85;

  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    *(_BYTE *)(v5 + 309) = self->_isClusterLeader;
    *(_DWORD *)(v5 + 324) |= 0x4000u;
  }
  v87 = -[NSString copyWithZone:](self->_activeSystemEndpointUID, "copyWithZone:", a3);
  v88 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v87;

  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
  {
    *(_BYTE *)(v5 + 310) = self->_isEligibleForHostingGroupSessionExcludingAcknowledgements;
    *(_DWORD *)(v5 + 324) |= 0x8000u;
  }
  v89 = (id)v5;

  return v89;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uniqueIdentifier;
  NSString *name;
  NSString *localizedModelName;
  NSString *systemBuildVersion;
  NSString *applicationBundleIdentifier;
  NSString *applicationBundleVersion;
  $87FBF03E59C4EA3D4DF569759040E686 has;
  int v12;
  NSString *systemMediaApplication;
  int v14;
  NSData *bluetoothAddress;
  int v16;
  NSString *deviceUID;
  NSString *managedConfigDeviceID;
  $87FBF03E59C4EA3D4DF569759040E686 v19;
  int v20;
  NSString *tightSyncUID;
  NSString *groupUID;
  NSString *groupName;
  NSMutableArray *groupedDevices;
  $87FBF03E59C4EA3D4DF569759040E686 v25;
  int v26;
  NSString *systemPodcastApplication;
  NSString *senderDefaultGroupUID;
  NSMutableArray *airplayReceivers;
  NSString *linkAgent;
  NSString *clusterID;
  NSString *clusterLeaderID;
  $87FBF03E59C4EA3D4DF569759040E686 v33;
  int v34;
  NSString *modelID;
  int v36;
  NSString *routingContextID;
  NSString *airPlayGroupID;
  NSString *systemBooksApplication;
  NSMutableArray *clusteredDevices;
  $87FBF03E59C4EA3D4DF569759040E686 v41;
  int v42;
  NSMutableArray *allClusteredDevices;
  int v44;
  NSString *computerName;
  int v46;
  _MRGroupSessionTokenProtobuf *groupSessionToken;
  _MRDeviceInfoMessageProtobuf *leaderDeviceInfo;
  $87FBF03E59C4EA3D4DF569759040E686 v49;
  int v50;
  NSString *activeSystemEndpointUID;
  BOOL v52;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_244;
  uniqueIdentifier = self->_uniqueIdentifier;
  if ((unint64_t)uniqueIdentifier | *((_QWORD *)v4 + 37))
  {
    if (!-[NSString isEqual:](uniqueIdentifier, "isEqual:"))
      goto LABEL_244;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 27))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_244;
  }
  localizedModelName = self->_localizedModelName;
  if ((unint64_t)localizedModelName | *((_QWORD *)v4 + 23))
  {
    if (!-[NSString isEqual:](localizedModelName, "isEqual:"))
      goto LABEL_244;
  }
  systemBuildVersion = self->_systemBuildVersion;
  if ((unint64_t)systemBuildVersion | *((_QWORD *)v4 + 33))
  {
    if (!-[NSString isEqual:](systemBuildVersion, "isEqual:"))
      goto LABEL_244;
  }
  applicationBundleIdentifier = self->_applicationBundleIdentifier;
  if ((unint64_t)applicationBundleIdentifier | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](applicationBundleIdentifier, "isEqual:"))
      goto LABEL_244;
  }
  applicationBundleVersion = self->_applicationBundleVersion;
  if ((unint64_t)applicationBundleVersion | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](applicationBundleVersion, "isEqual:"))
      goto LABEL_244;
  }
  has = self->_has;
  v12 = *((_DWORD *)v4 + 81);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v12 & 1) == 0 || self->_protocolVersion != *((_QWORD *)v4 + 1))
      goto LABEL_244;
  }
  else if ((v12 & 1) != 0)
  {
    goto LABEL_244;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0 || self->_lastSupportedMessageType != *((_DWORD *)v4 + 41))
      goto LABEL_244;
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_244;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v12 & 0x1000000) == 0)
      goto LABEL_244;
    if (self->_supportsSystemPairing)
    {
      if (!*((_BYTE *)v4 + 319))
        goto LABEL_244;
    }
    else if (*((_BYTE *)v4 + 319))
    {
      goto LABEL_244;
    }
  }
  else if ((v12 & 0x1000000) != 0)
  {
    goto LABEL_244;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v12 & 0x200) == 0)
      goto LABEL_244;
    if (self->_allowsPairing)
    {
      if (!*((_BYTE *)v4 + 304))
        goto LABEL_244;
    }
    else if (*((_BYTE *)v4 + 304))
    {
      goto LABEL_244;
    }
  }
  else if ((v12 & 0x200) != 0)
  {
    goto LABEL_244;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v12 & 0x400) == 0)
      goto LABEL_244;
    if (self->_connected)
    {
      if (!*((_BYTE *)v4 + 305))
        goto LABEL_244;
    }
    else if (*((_BYTE *)v4 + 305))
    {
      goto LABEL_244;
    }
  }
  else if ((v12 & 0x400) != 0)
  {
    goto LABEL_244;
  }
  systemMediaApplication = self->_systemMediaApplication;
  if ((unint64_t)systemMediaApplication | *((_QWORD *)v4 + 34))
  {
    if (!-[NSString isEqual:](systemMediaApplication, "isEqual:"))
      goto LABEL_244;
    has = self->_has;
  }
  v14 = *((_DWORD *)v4 + 81);
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v14 & 0x80000) == 0)
      goto LABEL_244;
    if (self->_supportsACL)
    {
      if (!*((_BYTE *)v4 + 314))
        goto LABEL_244;
    }
    else if (*((_BYTE *)v4 + 314))
    {
      goto LABEL_244;
    }
  }
  else if ((v14 & 0x80000) != 0)
  {
    goto LABEL_244;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v14 & 0x800000) == 0)
      goto LABEL_244;
    if (self->_supportsSharedQueue)
    {
      if (!*((_BYTE *)v4 + 318))
        goto LABEL_244;
    }
    else if (*((_BYTE *)v4 + 318))
    {
      goto LABEL_244;
    }
  }
  else if ((v14 & 0x800000) != 0)
  {
    goto LABEL_244;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v14 & 0x100000) == 0)
      goto LABEL_244;
    if (self->_supportsExtendedMotion)
    {
      if (!*((_BYTE *)v4 + 315))
        goto LABEL_244;
    }
    else if (*((_BYTE *)v4 + 315))
    {
      goto LABEL_244;
    }
  }
  else if ((v14 & 0x100000) != 0)
  {
    goto LABEL_244;
  }
  bluetoothAddress = self->_bluetoothAddress;
  if ((unint64_t)bluetoothAddress | *((_QWORD *)v4 + 8))
  {
    if (!-[NSData isEqual:](bluetoothAddress, "isEqual:"))
      goto LABEL_244;
    has = self->_has;
  }
  v16 = *((_DWORD *)v4 + 81);
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v16 & 0x100) == 0 || self->_sharedQueueVersion != *((_DWORD *)v4 + 62))
      goto LABEL_244;
  }
  else if ((v16 & 0x100) != 0)
  {
    goto LABEL_244;
  }
  deviceUID = self->_deviceUID;
  if ((unint64_t)deviceUID | *((_QWORD *)v4 + 15) && !-[NSString isEqual:](deviceUID, "isEqual:"))
    goto LABEL_244;
  managedConfigDeviceID = self->_managedConfigDeviceID;
  if ((unint64_t)managedConfigDeviceID | *((_QWORD *)v4 + 25))
  {
    if (!-[NSString isEqual:](managedConfigDeviceID, "isEqual:"))
      goto LABEL_244;
  }
  v19 = self->_has;
  v20 = *((_DWORD *)v4 + 81);
  if ((*(_BYTE *)&v19 & 8) != 0)
  {
    if ((v20 & 8) == 0 || self->_deviceClass != *((_DWORD *)v4 + 29))
      goto LABEL_244;
  }
  else if ((v20 & 8) != 0)
  {
    goto LABEL_244;
  }
  if ((*(_BYTE *)&v19 & 0x40) != 0)
  {
    if ((v20 & 0x40) == 0 || self->_logicalDeviceCount != *((_DWORD *)v4 + 48))
      goto LABEL_244;
  }
  else if ((v20 & 0x40) != 0)
  {
    goto LABEL_244;
  }
  if ((*(_DWORD *)&v19 & 0x2000000) != 0)
  {
    if ((v20 & 0x2000000) == 0)
      goto LABEL_244;
    if (self->_tightlySyncedGroup)
    {
      if (!*((_BYTE *)v4 + 320))
        goto LABEL_244;
    }
    else if (*((_BYTE *)v4 + 320))
    {
      goto LABEL_244;
    }
  }
  else if ((v20 & 0x2000000) != 0)
  {
    goto LABEL_244;
  }
  if ((*(_DWORD *)&v19 & 0x20000) != 0)
  {
    if ((v20 & 0x20000) == 0)
      goto LABEL_244;
    if (self->_isProxyGroupPlayer)
    {
      if (!*((_BYTE *)v4 + 312))
        goto LABEL_244;
    }
    else if (*((_BYTE *)v4 + 312))
    {
      goto LABEL_244;
    }
  }
  else if ((v20 & 0x20000) != 0)
  {
    goto LABEL_244;
  }
  tightSyncUID = self->_tightSyncUID;
  if ((unint64_t)tightSyncUID | *((_QWORD *)v4 + 36)
    && !-[NSString isEqual:](tightSyncUID, "isEqual:"))
  {
    goto LABEL_244;
  }
  groupUID = self->_groupUID;
  if ((unint64_t)groupUID | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](groupUID, "isEqual:"))
      goto LABEL_244;
  }
  groupName = self->_groupName;
  if ((unint64_t)groupName | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](groupName, "isEqual:"))
      goto LABEL_244;
  }
  groupedDevices = self->_groupedDevices;
  if ((unint64_t)groupedDevices | *((_QWORD *)v4 + 19))
  {
    if (!-[NSMutableArray isEqual:](groupedDevices, "isEqual:"))
      goto LABEL_244;
  }
  v25 = self->_has;
  v26 = *((_DWORD *)v4 + 81);
  if ((*(_DWORD *)&v25 & 0x10000) != 0)
  {
    if ((v26 & 0x10000) == 0)
      goto LABEL_244;
    if (self->_isGroupLeader)
    {
      if (!*((_BYTE *)v4 + 311))
        goto LABEL_244;
    }
    else if (*((_BYTE *)v4 + 311))
    {
      goto LABEL_244;
    }
  }
  else if ((v26 & 0x10000) != 0)
  {
    goto LABEL_244;
  }
  if ((*(_WORD *)&v25 & 0x1000) != 0)
  {
    if ((v26 & 0x1000) == 0)
      goto LABEL_244;
    if (self->_isAirplayActive)
    {
      if (!*((_BYTE *)v4 + 307))
        goto LABEL_244;
    }
    else if (*((_BYTE *)v4 + 307))
    {
      goto LABEL_244;
    }
  }
  else if ((v26 & 0x1000) != 0)
  {
    goto LABEL_244;
  }
  systemPodcastApplication = self->_systemPodcastApplication;
  if ((unint64_t)systemPodcastApplication | *((_QWORD *)v4 + 35)
    && !-[NSString isEqual:](systemPodcastApplication, "isEqual:"))
  {
    goto LABEL_244;
  }
  senderDefaultGroupUID = self->_senderDefaultGroupUID;
  if ((unint64_t)senderDefaultGroupUID | *((_QWORD *)v4 + 30))
  {
    if (!-[NSString isEqual:](senderDefaultGroupUID, "isEqual:"))
      goto LABEL_244;
  }
  airplayReceivers = self->_airplayReceivers;
  if ((unint64_t)airplayReceivers | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](airplayReceivers, "isEqual:"))
      goto LABEL_244;
  }
  linkAgent = self->_linkAgent;
  if ((unint64_t)linkAgent | *((_QWORD *)v4 + 22))
  {
    if (!-[NSString isEqual:](linkAgent, "isEqual:"))
      goto LABEL_244;
  }
  clusterID = self->_clusterID;
  if ((unint64_t)clusterID | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](clusterID, "isEqual:"))
      goto LABEL_244;
  }
  clusterLeaderID = self->_clusterLeaderID;
  if ((unint64_t)clusterLeaderID | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](clusterLeaderID, "isEqual:"))
      goto LABEL_244;
  }
  v33 = self->_has;
  v34 = *((_DWORD *)v4 + 81);
  if ((*(_BYTE *)&v33 & 2) != 0)
  {
    if ((v34 & 2) == 0 || self->_clusterType != *((_DWORD *)v4 + 22))
      goto LABEL_244;
  }
  else if ((v34 & 2) != 0)
  {
    goto LABEL_244;
  }
  if ((*(_WORD *)&v33 & 0x2000) != 0)
  {
    if ((v34 & 0x2000) == 0)
      goto LABEL_244;
    if (self->_isClusterAware)
    {
      if (!*((_BYTE *)v4 + 308))
        goto LABEL_244;
    }
    else if (*((_BYTE *)v4 + 308))
    {
      goto LABEL_244;
    }
  }
  else if ((v34 & 0x2000) != 0)
  {
    goto LABEL_244;
  }
  modelID = self->_modelID;
  if ((unint64_t)modelID | *((_QWORD *)v4 + 26))
  {
    if (!-[NSString isEqual:](modelID, "isEqual:"))
      goto LABEL_244;
    v33 = self->_has;
  }
  v36 = *((_DWORD *)v4 + 81);
  if ((*(_DWORD *)&v33 & 0x200000) != 0)
  {
    if ((v36 & 0x200000) == 0)
      goto LABEL_244;
    if (self->_supportsMultiplayer)
    {
      if (!*((_BYTE *)v4 + 316))
        goto LABEL_244;
    }
    else if (*((_BYTE *)v4 + 316))
    {
      goto LABEL_244;
    }
  }
  else if ((v36 & 0x200000) != 0)
  {
    goto LABEL_244;
  }
  routingContextID = self->_routingContextID;
  if ((unint64_t)routingContextID | *((_QWORD *)v4 + 29)
    && !-[NSString isEqual:](routingContextID, "isEqual:"))
  {
    goto LABEL_244;
  }
  airPlayGroupID = self->_airPlayGroupID;
  if ((unint64_t)airPlayGroupID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](airPlayGroupID, "isEqual:"))
      goto LABEL_244;
  }
  systemBooksApplication = self->_systemBooksApplication;
  if ((unint64_t)systemBooksApplication | *((_QWORD *)v4 + 32))
  {
    if (!-[NSString isEqual:](systemBooksApplication, "isEqual:"))
      goto LABEL_244;
  }
  clusteredDevices = self->_clusteredDevices;
  if ((unint64_t)clusteredDevices | *((_QWORD *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](clusteredDevices, "isEqual:"))
      goto LABEL_244;
  }
  v41 = self->_has;
  v42 = *((_DWORD *)v4 + 81);
  if ((*(_DWORD *)&v41 & 0x40000) != 0)
  {
    if ((v42 & 0x40000) == 0)
      goto LABEL_244;
    if (self->_parentGroupContainsDiscoverableGroupLeader)
    {
      if (!*((_BYTE *)v4 + 313))
        goto LABEL_244;
    }
    else if (*((_BYTE *)v4 + 313))
    {
      goto LABEL_244;
    }
  }
  else if ((v42 & 0x40000) != 0)
  {
    goto LABEL_244;
  }
  if ((*(_WORD *)&v41 & 0x800) != 0)
  {
    if ((v42 & 0x800) == 0)
      goto LABEL_244;
    if (self->_groupContainsDiscoverableGroupLeader)
    {
      if (!*((_BYTE *)v4 + 306))
        goto LABEL_244;
    }
    else if (*((_BYTE *)v4 + 306))
    {
      goto LABEL_244;
    }
  }
  else if ((v42 & 0x800) != 0)
  {
    goto LABEL_244;
  }
  if ((*(_BYTE *)&v41 & 0x10) != 0)
  {
    if ((v42 & 0x10) == 0 || self->_lastKnownClusterType != *((_DWORD *)v4 + 40))
      goto LABEL_244;
  }
  else if ((v42 & 0x10) != 0)
  {
    goto LABEL_244;
  }
  allClusteredDevices = self->_allClusteredDevices;
  if ((unint64_t)allClusteredDevices | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](allClusteredDevices, "isEqual:"))
      goto LABEL_244;
    v41 = self->_has;
  }
  v44 = *((_DWORD *)v4 + 81);
  if ((*(_DWORD *)&v41 & 0x400000) != 0)
  {
    if ((v44 & 0x400000) == 0)
      goto LABEL_244;
    if (self->_supportsOutputContextSync)
    {
      if (!*((_BYTE *)v4 + 317))
        goto LABEL_244;
    }
    else if (*((_BYTE *)v4 + 317))
    {
      goto LABEL_244;
    }
  }
  else if ((v44 & 0x400000) != 0)
  {
    goto LABEL_244;
  }
  computerName = self->_computerName;
  if ((unint64_t)computerName | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](computerName, "isEqual:"))
      goto LABEL_244;
    v41 = self->_has;
  }
  v46 = *((_DWORD *)v4 + 81);
  if ((*(_BYTE *)&v41 & 4) != 0)
  {
    if ((v46 & 4) == 0 || self->_configuredClusterSize != *((_DWORD *)v4 + 28))
      goto LABEL_244;
  }
  else if ((v46 & 4) != 0)
  {
    goto LABEL_244;
  }
  if ((*(_BYTE *)&v41 & 0x80) != 0)
  {
    if ((v46 & 0x80) == 0 || self->_preferredEncoding != *((_DWORD *)v4 + 56))
      goto LABEL_244;
  }
  else if ((v46 & 0x80) != 0)
  {
    goto LABEL_244;
  }
  groupSessionToken = self->_groupSessionToken;
  if ((unint64_t)groupSessionToken | *((_QWORD *)v4 + 17)
    && !-[_MRGroupSessionTokenProtobuf isEqual:](groupSessionToken, "isEqual:"))
  {
    goto LABEL_244;
  }
  leaderDeviceInfo = self->_leaderDeviceInfo;
  if ((unint64_t)leaderDeviceInfo | *((_QWORD *)v4 + 21))
  {
    if (!-[_MRDeviceInfoMessageProtobuf isEqual:](leaderDeviceInfo, "isEqual:"))
      goto LABEL_244;
  }
  v49 = self->_has;
  v50 = *((_DWORD *)v4 + 81);
  if ((*(_WORD *)&v49 & 0x4000) != 0)
  {
    if ((v50 & 0x4000) == 0)
      goto LABEL_244;
    if (self->_isClusterLeader)
    {
      if (!*((_BYTE *)v4 + 309))
        goto LABEL_244;
    }
    else if (*((_BYTE *)v4 + 309))
    {
      goto LABEL_244;
    }
  }
  else if ((v50 & 0x4000) != 0)
  {
    goto LABEL_244;
  }
  activeSystemEndpointUID = self->_activeSystemEndpointUID;
  if ((unint64_t)activeSystemEndpointUID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](activeSystemEndpointUID, "isEqual:"))
      goto LABEL_244;
    v49 = self->_has;
  }
  if ((*(_WORD *)&v49 & 0x8000) != 0)
  {
    if ((*((_DWORD *)v4 + 81) & 0x8000) != 0)
    {
      if (self->_isEligibleForHostingGroupSessionExcludingAcknowledgements)
      {
        if (!*((_BYTE *)v4 + 310))
          goto LABEL_244;
      }
      else if (*((_BYTE *)v4 + 310))
      {
        goto LABEL_244;
      }
      v52 = 1;
      goto LABEL_245;
    }
LABEL_244:
    v52 = 0;
    goto LABEL_245;
  }
  v52 = (*((_DWORD *)v4 + 81) & 0x8000) == 0;
LABEL_245:

  return v52;
}

- (unint64_t)hash
{
  $87FBF03E59C4EA3D4DF569759040E686 has;
  $87FBF03E59C4EA3D4DF569759040E686 v4;
  $87FBF03E59C4EA3D4DF569759040E686 v5;
  $87FBF03E59C4EA3D4DF569759040E686 v6;
  $87FBF03E59C4EA3D4DF569759040E686 v7;
  $87FBF03E59C4EA3D4DF569759040E686 v8;
  uint64_t v9;
  NSUInteger v10;
  $87FBF03E59C4EA3D4DF569759040E686 v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  NSUInteger v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSUInteger v26;
  NSUInteger v27;
  NSUInteger v28;
  uint64_t v29;
  NSUInteger v30;
  uint64_t v31;
  uint64_t v32;
  NSUInteger v33;
  NSUInteger v34;
  NSUInteger v35;
  uint64_t v36;
  NSUInteger v37;
  NSUInteger v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSUInteger v42;
  NSUInteger v43;
  NSUInteger v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSUInteger v49;
  NSUInteger v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSUInteger v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  NSUInteger v62;
  NSUInteger v63;
  NSUInteger v64;
  NSUInteger v65;
  NSUInteger v66;
  NSUInteger v67;

  v67 = -[NSString hash](self->_uniqueIdentifier, "hash");
  v66 = -[NSString hash](self->_name, "hash");
  v65 = -[NSString hash](self->_localizedModelName, "hash");
  v64 = -[NSString hash](self->_systemBuildVersion, "hash");
  v63 = -[NSString hash](self->_applicationBundleIdentifier, "hash");
  v62 = -[NSString hash](self->_applicationBundleVersion, "hash");
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v61 = 2654435761u * self->_protocolVersion;
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
LABEL_3:
      v60 = 2654435761 * self->_lastSupportedMessageType;
      if ((*(_DWORD *)&has & 0x1000000) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v61 = 0;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_3;
  }
  v60 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_4:
    v59 = 2654435761 * self->_supportsSystemPairing;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_5;
LABEL_10:
    v58 = 0;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v59 = 0;
  if ((*(_WORD *)&has & 0x200) == 0)
    goto LABEL_10;
LABEL_5:
  v58 = 2654435761 * self->_allowsPairing;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_6:
    v57 = 2654435761 * self->_connected;
    goto LABEL_12;
  }
LABEL_11:
  v57 = 0;
LABEL_12:
  v56 = -[NSString hash](self->_systemMediaApplication, "hash");
  v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x80000) == 0)
  {
    v55 = 0;
    if ((*(_DWORD *)&v4 & 0x800000) != 0)
      goto LABEL_14;
LABEL_17:
    v54 = 0;
    if ((*(_DWORD *)&v4 & 0x100000) != 0)
      goto LABEL_15;
    goto LABEL_18;
  }
  v55 = 2654435761 * self->_supportsACL;
  if ((*(_DWORD *)&v4 & 0x800000) == 0)
    goto LABEL_17;
LABEL_14:
  v54 = 2654435761 * self->_supportsSharedQueue;
  if ((*(_DWORD *)&v4 & 0x100000) != 0)
  {
LABEL_15:
    v53 = 2654435761 * self->_supportsExtendedMotion;
    goto LABEL_19;
  }
LABEL_18:
  v53 = 0;
LABEL_19:
  v52 = -[NSData hash](self->_bluetoothAddress, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    v51 = 2654435761 * self->_sharedQueueVersion;
  else
    v51 = 0;
  v50 = -[NSString hash](self->_deviceUID, "hash");
  v49 = -[NSString hash](self->_managedConfigDeviceID, "hash");
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 8) != 0)
  {
    v48 = 2654435761 * self->_deviceClass;
    if ((*(_BYTE *)&v5 & 0x40) != 0)
    {
LABEL_24:
      v47 = 2654435761 * self->_logicalDeviceCount;
      if ((*(_DWORD *)&v5 & 0x2000000) != 0)
        goto LABEL_25;
LABEL_29:
      v46 = 0;
      if ((*(_DWORD *)&v5 & 0x20000) != 0)
        goto LABEL_26;
      goto LABEL_30;
    }
  }
  else
  {
    v48 = 0;
    if ((*(_BYTE *)&v5 & 0x40) != 0)
      goto LABEL_24;
  }
  v47 = 0;
  if ((*(_DWORD *)&v5 & 0x2000000) == 0)
    goto LABEL_29;
LABEL_25:
  v46 = 2654435761 * self->_tightlySyncedGroup;
  if ((*(_DWORD *)&v5 & 0x20000) != 0)
  {
LABEL_26:
    v45 = 2654435761 * self->_isProxyGroupPlayer;
    goto LABEL_31;
  }
LABEL_30:
  v45 = 0;
LABEL_31:
  v44 = -[NSString hash](self->_tightSyncUID, "hash");
  v43 = -[NSString hash](self->_groupUID, "hash");
  v42 = -[NSString hash](self->_groupName, "hash");
  v41 = -[NSMutableArray hash](self->_groupedDevices, "hash");
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) != 0)
  {
    v40 = 2654435761 * self->_isGroupLeader;
    if ((*(_WORD *)&v6 & 0x1000) != 0)
      goto LABEL_33;
  }
  else
  {
    v40 = 0;
    if ((*(_WORD *)&v6 & 0x1000) != 0)
    {
LABEL_33:
      v39 = 2654435761 * self->_isAirplayActive;
      goto LABEL_36;
    }
  }
  v39 = 0;
LABEL_36:
  v38 = -[NSString hash](self->_systemPodcastApplication, "hash");
  v37 = -[NSString hash](self->_senderDefaultGroupUID, "hash");
  v36 = -[NSMutableArray hash](self->_airplayReceivers, "hash");
  v35 = -[NSString hash](self->_linkAgent, "hash");
  v34 = -[NSString hash](self->_clusterID, "hash");
  v33 = -[NSString hash](self->_clusterLeaderID, "hash");
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 2) != 0)
  {
    v32 = 2654435761 * self->_clusterType;
    if ((*(_WORD *)&v7 & 0x2000) != 0)
      goto LABEL_38;
  }
  else
  {
    v32 = 0;
    if ((*(_WORD *)&v7 & 0x2000) != 0)
    {
LABEL_38:
      v31 = 2654435761 * self->_isClusterAware;
      goto LABEL_41;
    }
  }
  v31 = 0;
LABEL_41:
  v30 = -[NSString hash](self->_modelID, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 0x20) != 0)
    v29 = 2654435761 * self->_supportsMultiplayer;
  else
    v29 = 0;
  v28 = -[NSString hash](self->_routingContextID, "hash");
  v27 = -[NSString hash](self->_airPlayGroupID, "hash");
  v26 = -[NSString hash](self->_systemBooksApplication, "hash");
  v25 = -[NSMutableArray hash](self->_clusteredDevices, "hash");
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x40000) == 0)
  {
    v24 = 0;
    if ((*(_WORD *)&v8 & 0x800) != 0)
      goto LABEL_46;
LABEL_49:
    v23 = 0;
    if ((*(_BYTE *)&v8 & 0x10) != 0)
      goto LABEL_47;
    goto LABEL_50;
  }
  v24 = 2654435761 * self->_parentGroupContainsDiscoverableGroupLeader;
  if ((*(_WORD *)&v8 & 0x800) == 0)
    goto LABEL_49;
LABEL_46:
  v23 = 2654435761 * self->_groupContainsDiscoverableGroupLeader;
  if ((*(_BYTE *)&v8 & 0x10) != 0)
  {
LABEL_47:
    v22 = 2654435761 * self->_lastKnownClusterType;
    goto LABEL_51;
  }
LABEL_50:
  v22 = 0;
LABEL_51:
  v20 = -[NSMutableArray hash](self->_allClusteredDevices, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
    v9 = 2654435761 * self->_supportsOutputContextSync;
  else
    v9 = 0;
  v10 = -[NSString hash](self->_computerName, "hash", v20);
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 4) != 0)
  {
    v12 = 2654435761 * self->_configuredClusterSize;
    if ((*(_BYTE *)&v11 & 0x80) != 0)
      goto LABEL_56;
  }
  else
  {
    v12 = 0;
    if ((*(_BYTE *)&v11 & 0x80) != 0)
    {
LABEL_56:
      v13 = 2654435761 * self->_preferredEncoding;
      goto LABEL_59;
    }
  }
  v13 = 0;
LABEL_59:
  v14 = -[_MRGroupSessionTokenProtobuf hash](self->_groupSessionToken, "hash");
  v15 = -[_MRDeviceInfoMessageProtobuf hash](self->_leaderDeviceInfo, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    v16 = 2654435761 * self->_isClusterLeader;
  else
    v16 = 0;
  v17 = -[NSString hash](self->_activeSystemEndpointUID, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
    v18 = 2654435761 * self->_isEligibleForHostingGroupSessionExcludingAcknowledgements;
  else
    v18 = 0;
  return v66 ^ v67 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  int v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  int v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  int v31;
  _MRGroupSessionTokenProtobuf *groupSessionToken;
  uint64_t v33;
  _MRDeviceInfoMessageProtobuf *leaderDeviceInfo;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 37))
    -[_MRDeviceInfoMessageProtobuf setUniqueIdentifier:](self, "setUniqueIdentifier:");
  if (*((_QWORD *)v4 + 27))
    -[_MRDeviceInfoMessageProtobuf setName:](self, "setName:");
  if (*((_QWORD *)v4 + 23))
    -[_MRDeviceInfoMessageProtobuf setLocalizedModelName:](self, "setLocalizedModelName:");
  if (*((_QWORD *)v4 + 33))
    -[_MRDeviceInfoMessageProtobuf setSystemBuildVersion:](self, "setSystemBuildVersion:");
  if (*((_QWORD *)v4 + 6))
    -[_MRDeviceInfoMessageProtobuf setApplicationBundleIdentifier:](self, "setApplicationBundleIdentifier:");
  if (*((_QWORD *)v4 + 7))
    -[_MRDeviceInfoMessageProtobuf setApplicationBundleVersion:](self, "setApplicationBundleVersion:");
  v5 = *((_DWORD *)v4 + 81);
  if ((v5 & 1) != 0)
  {
    self->_protocolVersion = *((_QWORD *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    v5 = *((_DWORD *)v4 + 81);
    if ((v5 & 0x20) == 0)
    {
LABEL_15:
      if ((v5 & 0x1000000) == 0)
        goto LABEL_16;
      goto LABEL_117;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_15;
  }
  self->_lastSupportedMessageType = *((_DWORD *)v4 + 41);
  *(_DWORD *)&self->_has |= 0x20u;
  v5 = *((_DWORD *)v4 + 81);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_16:
    if ((v5 & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_118;
  }
LABEL_117:
  self->_supportsSystemPairing = *((_BYTE *)v4 + 319);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v5 = *((_DWORD *)v4 + 81);
  if ((v5 & 0x200) == 0)
  {
LABEL_17:
    if ((v5 & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_118:
  self->_allowsPairing = *((_BYTE *)v4 + 304);
  *(_DWORD *)&self->_has |= 0x200u;
  if ((*((_DWORD *)v4 + 81) & 0x400) != 0)
  {
LABEL_18:
    self->_connected = *((_BYTE *)v4 + 305);
    *(_DWORD *)&self->_has |= 0x400u;
  }
LABEL_19:
  if (*((_QWORD *)v4 + 34))
    -[_MRDeviceInfoMessageProtobuf setSystemMediaApplication:](self, "setSystemMediaApplication:");
  v6 = *((_DWORD *)v4 + 81);
  if ((v6 & 0x80000) != 0)
  {
    self->_supportsACL = *((_BYTE *)v4 + 314);
    *(_DWORD *)&self->_has |= 0x80000u;
    v6 = *((_DWORD *)v4 + 81);
    if ((v6 & 0x800000) == 0)
    {
LABEL_23:
      if ((v6 & 0x100000) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((v6 & 0x800000) == 0)
  {
    goto LABEL_23;
  }
  self->_supportsSharedQueue = *((_BYTE *)v4 + 318);
  *(_DWORD *)&self->_has |= 0x800000u;
  if ((*((_DWORD *)v4 + 81) & 0x100000) != 0)
  {
LABEL_24:
    self->_supportsExtendedMotion = *((_BYTE *)v4 + 315);
    *(_DWORD *)&self->_has |= 0x100000u;
  }
LABEL_25:
  if (*((_QWORD *)v4 + 8))
    -[_MRDeviceInfoMessageProtobuf setBluetoothAddress:](self, "setBluetoothAddress:");
  if ((*((_BYTE *)v4 + 325) & 1) != 0)
  {
    self->_sharedQueueVersion = *((_DWORD *)v4 + 62);
    *(_DWORD *)&self->_has |= 0x100u;
  }
  if (*((_QWORD *)v4 + 15))
    -[_MRDeviceInfoMessageProtobuf setDeviceUID:](self, "setDeviceUID:");
  if (*((_QWORD *)v4 + 25))
    -[_MRDeviceInfoMessageProtobuf setManagedConfigDeviceID:](self, "setManagedConfigDeviceID:");
  v7 = *((_DWORD *)v4 + 81);
  if ((v7 & 8) != 0)
  {
    self->_deviceClass = *((_DWORD *)v4 + 29);
    *(_DWORD *)&self->_has |= 8u;
    v7 = *((_DWORD *)v4 + 81);
    if ((v7 & 0x40) == 0)
    {
LABEL_35:
      if ((v7 & 0x2000000) == 0)
        goto LABEL_36;
      goto LABEL_125;
    }
  }
  else if ((v7 & 0x40) == 0)
  {
    goto LABEL_35;
  }
  self->_logicalDeviceCount = *((_DWORD *)v4 + 48);
  *(_DWORD *)&self->_has |= 0x40u;
  v7 = *((_DWORD *)v4 + 81);
  if ((v7 & 0x2000000) == 0)
  {
LABEL_36:
    if ((v7 & 0x20000) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_125:
  self->_tightlySyncedGroup = *((_BYTE *)v4 + 320);
  *(_DWORD *)&self->_has |= 0x2000000u;
  if ((*((_DWORD *)v4 + 81) & 0x20000) != 0)
  {
LABEL_37:
    self->_isProxyGroupPlayer = *((_BYTE *)v4 + 312);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
LABEL_38:
  if (*((_QWORD *)v4 + 36))
    -[_MRDeviceInfoMessageProtobuf setTightSyncUID:](self, "setTightSyncUID:");
  if (*((_QWORD *)v4 + 18))
    -[_MRDeviceInfoMessageProtobuf setGroupUID:](self, "setGroupUID:");
  if (*((_QWORD *)v4 + 16))
    -[_MRDeviceInfoMessageProtobuf setGroupName:](self, "setGroupName:");
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v8 = *((id *)v4 + 19);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v49 != v11)
          objc_enumerationMutation(v8);
        -[_MRDeviceInfoMessageProtobuf addGroupedDevices:](self, "addGroupedDevices:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
    }
    while (v10);
  }

  v13 = *((_DWORD *)v4 + 81);
  if ((v13 & 0x10000) != 0)
  {
    self->_isGroupLeader = *((_BYTE *)v4 + 311);
    *(_DWORD *)&self->_has |= 0x10000u;
    v13 = *((_DWORD *)v4 + 81);
  }
  if ((v13 & 0x1000) != 0)
  {
    self->_isAirplayActive = *((_BYTE *)v4 + 307);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
  if (*((_QWORD *)v4 + 35))
    -[_MRDeviceInfoMessageProtobuf setSystemPodcastApplication:](self, "setSystemPodcastApplication:");
  if (*((_QWORD *)v4 + 30))
    -[_MRDeviceInfoMessageProtobuf setSenderDefaultGroupUID:](self, "setSenderDefaultGroupUID:");
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v14 = *((id *)v4 + 4);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v45 != v17)
          objc_enumerationMutation(v14);
        -[_MRDeviceInfoMessageProtobuf addAirplayReceivers:](self, "addAirplayReceivers:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    }
    while (v16);
  }

  if (*((_QWORD *)v4 + 22))
    -[_MRDeviceInfoMessageProtobuf setLinkAgent:](self, "setLinkAgent:");
  if (*((_QWORD *)v4 + 9))
    -[_MRDeviceInfoMessageProtobuf setClusterID:](self, "setClusterID:");
  if (*((_QWORD *)v4 + 10))
    -[_MRDeviceInfoMessageProtobuf setClusterLeaderID:](self, "setClusterLeaderID:");
  v19 = *((_DWORD *)v4 + 81);
  if ((v19 & 2) != 0)
  {
    self->_clusterType = *((_DWORD *)v4 + 22);
    *(_DWORD *)&self->_has |= 2u;
    v19 = *((_DWORD *)v4 + 81);
  }
  if ((v19 & 0x2000) != 0)
  {
    self->_isClusterAware = *((_BYTE *)v4 + 308);
    *(_DWORD *)&self->_has |= 0x2000u;
  }
  if (*((_QWORD *)v4 + 26))
    -[_MRDeviceInfoMessageProtobuf setModelID:](self, "setModelID:");
  if ((*((_BYTE *)v4 + 326) & 0x20) != 0)
  {
    self->_supportsMultiplayer = *((_BYTE *)v4 + 316);
    *(_DWORD *)&self->_has |= 0x200000u;
  }
  if (*((_QWORD *)v4 + 29))
    -[_MRDeviceInfoMessageProtobuf setRoutingContextID:](self, "setRoutingContextID:");
  if (*((_QWORD *)v4 + 3))
    -[_MRDeviceInfoMessageProtobuf setAirPlayGroupID:](self, "setAirPlayGroupID:");
  if (*((_QWORD *)v4 + 32))
    -[_MRDeviceInfoMessageProtobuf setSystemBooksApplication:](self, "setSystemBooksApplication:");
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v20 = *((id *)v4 + 12);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v41;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v41 != v23)
          objc_enumerationMutation(v20);
        -[_MRDeviceInfoMessageProtobuf addClusteredDevices:](self, "addClusteredDevices:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * k));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
    }
    while (v22);
  }

  v25 = *((_DWORD *)v4 + 81);
  if ((v25 & 0x40000) != 0)
  {
    self->_parentGroupContainsDiscoverableGroupLeader = *((_BYTE *)v4 + 313);
    *(_DWORD *)&self->_has |= 0x40000u;
    v25 = *((_DWORD *)v4 + 81);
    if ((v25 & 0x800) == 0)
    {
LABEL_95:
      if ((v25 & 0x10) == 0)
        goto LABEL_97;
      goto LABEL_96;
    }
  }
  else if ((v25 & 0x800) == 0)
  {
    goto LABEL_95;
  }
  self->_groupContainsDiscoverableGroupLeader = *((_BYTE *)v4 + 306);
  *(_DWORD *)&self->_has |= 0x800u;
  if ((*((_DWORD *)v4 + 81) & 0x10) != 0)
  {
LABEL_96:
    self->_lastKnownClusterType = *((_DWORD *)v4 + 40);
    *(_DWORD *)&self->_has |= 0x10u;
  }
LABEL_97:
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v26 = *((id *)v4 + 5);
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v37;
    do
    {
      for (m = 0; m != v28; ++m)
      {
        if (*(_QWORD *)v37 != v29)
          objc_enumerationMutation(v26);
        -[_MRDeviceInfoMessageProtobuf addAllClusteredDevices:](self, "addAllClusteredDevices:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * m), (_QWORD)v36);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
    }
    while (v28);
  }

  if ((*((_BYTE *)v4 + 326) & 0x40) != 0)
  {
    self->_supportsOutputContextSync = *((_BYTE *)v4 + 317);
    *(_DWORD *)&self->_has |= 0x400000u;
  }
  if (*((_QWORD *)v4 + 13))
    -[_MRDeviceInfoMessageProtobuf setComputerName:](self, "setComputerName:");
  v31 = *((_DWORD *)v4 + 81);
  if ((v31 & 4) != 0)
  {
    self->_configuredClusterSize = *((_DWORD *)v4 + 28);
    *(_DWORD *)&self->_has |= 4u;
    v31 = *((_DWORD *)v4 + 81);
  }
  if ((v31 & 0x80) != 0)
  {
    self->_preferredEncoding = *((_DWORD *)v4 + 56);
    *(_DWORD *)&self->_has |= 0x80u;
  }
  groupSessionToken = self->_groupSessionToken;
  v33 = *((_QWORD *)v4 + 17);
  if (groupSessionToken)
  {
    if (v33)
      -[_MRGroupSessionTokenProtobuf mergeFrom:](groupSessionToken, "mergeFrom:");
  }
  else if (v33)
  {
    -[_MRDeviceInfoMessageProtobuf setGroupSessionToken:](self, "setGroupSessionToken:");
  }
  leaderDeviceInfo = self->_leaderDeviceInfo;
  v35 = *((_QWORD *)v4 + 21);
  if (leaderDeviceInfo)
  {
    if (v35)
      -[_MRDeviceInfoMessageProtobuf mergeFrom:](leaderDeviceInfo, "mergeFrom:");
  }
  else if (v35)
  {
    -[_MRDeviceInfoMessageProtobuf setLeaderDeviceInfo:](self, "setLeaderDeviceInfo:");
  }
  if ((*((_BYTE *)v4 + 325) & 0x40) != 0)
  {
    self->_isClusterLeader = *((_BYTE *)v4 + 309);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
  if (*((_QWORD *)v4 + 2))
    -[_MRDeviceInfoMessageProtobuf setActiveSystemEndpointUID:](self, "setActiveSystemEndpointUID:");
  if ((*((_BYTE *)v4 + 325) & 0x80) != 0)
  {
    self->_isEligibleForHostingGroupSessionExcludingAcknowledgements = *((_BYTE *)v4 + 310);
    *(_DWORD *)&self->_has |= 0x8000u;
  }

}

- (void)setGroupSessionToken:(id)a3
{
  objc_storeStrong((id *)&self->_groupSessionToken, a3);
}

- (void)setLeaderDeviceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_leaderDeviceInfo, a3);
}

- (BOOL)isClusterLeader
{
  return self->_isClusterLeader;
}

- (NSString)activeSystemEndpointUID
{
  return self->_activeSystemEndpointUID;
}

- (void)setActiveSystemEndpointUID:(id)a3
{
  objc_storeStrong((id *)&self->_activeSystemEndpointUID, a3);
}

- (BOOL)isEligibleForHostingGroupSessionExcludingAcknowledgements
{
  return self->_isEligibleForHostingGroupSessionExcludingAcknowledgements;
}

@end
