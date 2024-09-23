@implementation MRDeviceInfoOutputDevice

- (MRDeviceInfoOutputDevice)initWithDeviceInfo:(id)a3
{
  return -[MRDeviceInfoOutputDevice initWithDeviceInfo:forExporting:](self, "initWithDeviceInfo:forExporting:", a3, 0);
}

- (MRDeviceInfoOutputDevice)initWithDeviceInfo:(id)a3 forExporting:(BOOL)a4
{
  id v6;
  MRDeviceInfoOutputDevice *v7;
  uint64_t v8;
  MRDeviceInfo *deviceInfo;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRDeviceInfoOutputDevice;
  v7 = -[MRDeviceInfoOutputDevice init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    deviceInfo = v7->_deviceInfo;
    v7->_deviceInfo = (MRDeviceInfo *)v8;

    v7->_exporting = a4;
  }

  return v7;
}

- (MRDeviceInfoOutputDevice)initWithDeviceInfo:(id)a3 fallbackOutputDevice:(id)a4 forExporting:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  MRDeviceInfoOutputDevice *v10;
  MRDeviceInfoOutputDevice *v11;

  v5 = a5;
  v9 = a4;
  v10 = -[MRDeviceInfoOutputDevice initWithDeviceInfo:forExporting:](self, "initWithDeviceInfo:forExporting:", a3, v5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_fallbackOutputDevice, a4);

  return v11;
}

- (id)uid
{
  return -[MRDeviceInfo deviceUID](self->_deviceInfo, "deviceUID");
}

- (id)name
{
  unsigned int v3;
  MRDeviceInfo *deviceInfo;

  v3 = -[MRDeviceInfo clusterType](self->_deviceInfo, "clusterType");
  deviceInfo = self->_deviceInfo;
  if (v3)
    -[MRDeviceInfo groupName](deviceInfo, "groupName");
  else
    -[MRDeviceInfo computerName](deviceInfo, "computerName");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)modelID
{
  return -[MRDeviceInfo modelID](self->_deviceInfo, "modelID");
}

- (id)parentGroupIdentifier
{
  return -[MRDeviceInfo parentGroupID](self->_deviceInfo, "parentGroupID");
}

- (id)airPlayGroupID
{
  return -[MRDeviceInfo airPlayGroupUID](self->_deviceInfo, "airPlayGroupUID");
}

- (BOOL)isGroupable
{
  return 1;
}

- (BOOL)isRemoteControllable
{
  return 1;
}

- (BOOL)supportsMultiplayer
{
  return -[MRDeviceInfo supportsMultiplayer](self->_deviceInfo, "supportsMultiplayer");
}

- (BOOL)canAccessAppleMusic
{
  return -[MRAVOutputDevice canAccessAppleMusic](self->_fallbackOutputDevice, "canAccessAppleMusic");
}

- (BOOL)canAccessiCloudMusicLibrary
{
  return -[MRAVOutputDevice canAccessiCloudMusicLibrary](self->_fallbackOutputDevice, "canAccessiCloudMusicLibrary");
}

- (BOOL)canAccessRemoteAssets
{
  return -[MRAVOutputDevice canAccessRemoteAssets](self->_fallbackOutputDevice, "canAccessRemoteAssets");
}

- (BOOL)supportsBufferedAirPlay
{
  return -[MRAVOutputDevice supportsBufferedAirPlay](self->_fallbackOutputDevice, "supportsBufferedAirPlay");
}

- (BOOL)isLocalDevice
{
  void *v4;
  void *v5;
  char v6;

  if (-[MRDeviceInfoOutputDevice exporting](self, "exporting"))
    return 0;
  -[MRDeviceInfoOutputDevice uid](self, "uid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MRMediaRemoteCopyDeviceUID();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (BOOL)shouldBeLocallyHosted
{
  return 1;
}

- (unsigned)deviceType
{
  return 1;
}

- (unsigned)deviceSubtype
{
  int64_t v4;
  unsigned int v5;

  if (-[MRDeviceInfo clusterType](self->_deviceInfo, "clusterType"))
    return 15;
  v4 = -[MRDeviceInfoOutputDevice hostDeviceClass](self, "hostDeviceClass");
  if (v4 == 7)
    v5 = 12;
  else
    v5 = 0;
  if (v4 == 4)
    return 13;
  else
    return v5;
}

- (int64_t)hostDeviceClass
{
  return -[MRDeviceInfo deviceClass](self->_deviceInfo, "deviceClass");
}

- (id)avOutputDevice
{
  return 0;
}

- (float)volume
{
  float result;

  -[MRAVOutputDevice volume](self->_fallbackOutputDevice, "volume");
  return result;
}

- (unsigned)volumeCapabilities
{
  return -[MRAVOutputDevice volumeCapabilities](self->_fallbackOutputDevice, "volumeCapabilities");
}

- (BOOL)isVolumeMuted
{
  return -[MRAVOutputDevice isVolumeMuted](self->_fallbackOutputDevice, "isVolumeMuted");
}

- (unsigned)clusterType
{
  return -[MRDeviceInfo clusterType](self->_deviceInfo, "clusterType");
}

- (BOOL)isProxyGroupPlayer
{
  return -[MRDeviceInfo isProxyGroupPlayer](self->_deviceInfo, "isProxyGroupPlayer");
}

- (BOOL)isGroupLeader
{
  return -[MRDeviceInfo isGroupLeader](self->_deviceInfo, "isGroupLeader");
}

- (BOOL)isAirPlayReceiverSessionActive
{
  return -[MRDeviceInfo isAirPlayActive](self->_deviceInfo, "isAirPlayActive");
}

- (BOOL)groupContainsGroupLeader
{
  return -[MRDeviceInfo groupContainsDiscoverableGroupLeader](self->_deviceInfo, "groupContainsDiscoverableGroupLeader");
}

- (BOOL)parentGroupContainsDiscoverableLeader
{
  return -[MRDeviceInfo parentGroupContainsDiscoverableGroupLeader](self->_deviceInfo, "parentGroupContainsDiscoverableGroupLeader");
}

- (id)clusterComposition
{
  void *v2;
  void *v3;

  -[MRDeviceInfo clusteredDevices](self->_deviceInfo, "clusteredDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msv_map:", &__block_literal_global_107);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

MRAVOutputDeviceDescription *__46__MRDeviceInfoOutputDevice_clusterComposition__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRAVOutputDeviceDescription *v3;
  void *v4;
  void *v5;
  void *v6;
  MRAVOutputDeviceDescription *v7;

  v2 = a2;
  v3 = [MRAVOutputDeviceDescription alloc];
  objc_msgSend(v2, "deviceUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "computerName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[MRAVOutputDeviceDescription initWithDeviceType:deviceSubtype:uid:name:modelID:](v3, "initWithDeviceType:deviceSubtype:uid:name:modelID:", 1, 12, v4, v5, v6);
  return v7;
}

- (id)clusterCompositionMembers
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[MRDeviceInfo allClusteredDevices](self->_deviceInfo, "allClusteredDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__MRDeviceInfoOutputDevice_clusterCompositionMembers__block_invoke;
  v6[3] = &unk_1E30CFBF8;
  v6[4] = self;
  objc_msgSend(v3, "msv_map:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __53__MRDeviceInfoOutputDevice_clusterCompositionMembers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDeviceInfo:forExporting:", v3, objc_msgSend(*(id *)(a1 + 32), "exporting"));

  return v4;
}

- (id)clusterCompositionOutputDevices
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[MRDeviceInfo allClusteredDevices](self->_deviceInfo, "allClusteredDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__MRDeviceInfoOutputDevice_clusterCompositionOutputDevices__block_invoke;
  v6[3] = &unk_1E30CFBF8;
  v6[4] = self;
  objc_msgSend(v3, "msv_map:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __59__MRDeviceInfoOutputDevice_clusterCompositionOutputDevices__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDeviceInfo:forExporting:", v3, objc_msgSend(*(id *)(a1 + 32), "exporting"));

  return v4;
}

- (unint64_t)configuredClusterSize
{
  return -[MRDeviceInfo configuredClusterSize](self->_deviceInfo, "configuredClusterSize");
}

- (MRDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (BOOL)exporting
{
  return self->_exporting;
}

- (void)setExporting:(BOOL)a3
{
  self->_exporting = a3;
}

- (MRAVOutputDevice)fallbackOutputDevice
{
  return self->_fallbackOutputDevice;
}

- (void)setFallbackOutputDevice:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackOutputDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackOutputDevice, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
}

@end
