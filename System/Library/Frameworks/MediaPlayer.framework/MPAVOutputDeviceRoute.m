@implementation MPAVOutputDeviceRoute

- (id)description
{
  __CFString *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = (__CFString *)CFCopyDescription(-[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice"));
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByReplacingOccurrencesOfString:withString:](v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("MRAVOutputDevice"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isAirPlayRoute
{
  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  return MRAVOutputDeviceGetType() == 1;
}

- (id)productIdentifier
{
  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  return (id)MRAVOutputDeviceCopyModelID();
}

- (void)logicalLeaderOutputDevice
{
  return self->_logicalLeaderOutputDevice;
}

- (BOOL)isDeviceSpeakerRoute
{
  return -[MPAVOutputDeviceRoute _anyOutputDevicePassesTest:](self, "_anyOutputDevicePassesTest:", &__block_literal_global_36570);
}

- (NSArray)outputDevices
{
  return self->_outputDevices;
}

- (MPAVOutputDeviceRoute)initWithOutputDevices:(id)a3
{
  id v5;
  MPAVOutputDeviceRoute *v6;
  uint64_t v7;
  NSArray *outputDevices;
  uint64_t v9;
  NSString *routeName;
  NSDictionary *avRouteDescription;
  MPAVRoute *wirelessDisplayRoute;
  MPAVBatteryLevel *v13;
  MPAVBatteryLevel *batteryLevel;
  void *v16;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MPAVOutputDeviceRoute;
  v6 = -[MPAVOutputDeviceRoute init](&v17, sel_init);
  if (v6)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("MPAVOutputDeviceRoute.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputDevices"));

    }
    v7 = objc_msgSend(v5, "copy");
    outputDevices = v6->_outputDevices;
    v6->_outputDevices = (NSArray *)v7;

    v6->_logicalLeaderOutputDevice = (void *)objc_msgSend((id)objc_opt_class(), "logicalLeaderFromOutputDevices:", v5);
    v9 = MRAVOutputDeviceCopyName();
    routeName = v6->super._routeName;
    v6->super._routeName = (NSString *)v9;

    v6->super._picked = 0;
    avRouteDescription = v6->super._avRouteDescription;
    v6->super._avRouteDescription = 0;

    wirelessDisplayRoute = v6->super._wirelessDisplayRoute;
    v6->super._wirelessDisplayRoute = 0;

    v6->super._displayRouteType = 0;
    v13 = -[MPAVBatteryLevel initWithOutputDevice:]([MPAVBatteryLevel alloc], "initWithOutputDevice:", v6->_logicalLeaderOutputDevice);
    batteryLevel = v6->super._batteryLevel;
    v6->super._batteryLevel = v13;

  }
  return v6;
}

+ (void)logicalLeaderFromOutputDevices:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_27_36604);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "firstObject");

  return v4;
}

- (BOOL)isPicked
{
  id WeakRetained;
  BOOL v4;
  objc_super v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._parentRoute);
  if ((objc_msgSend(WeakRetained, "isPicked") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MPAVOutputDeviceRoute;
    v4 = -[MPAVRoute isPicked](&v6, sel_isPicked);
  }

  return v4;
}

- (BOOL)_anyOutputDevicePassesTest:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__MPAVOutputDeviceRoute__anyOutputDevicePassesTest___block_invoke;
  v7[3] = &unk_1E315DA88;
  v8 = v4;
  v5 = v4;
  LOBYTE(self) = -[MPAVOutputDeviceRoute _anyOutputDeviceObjPassesTest:](self, "_anyOutputDeviceObjPassesTest:", v7);

  return (char)self;
}

- (BOOL)_anyOutputDeviceObjPassesTest:(id)a3
{
  uint64_t (**v4)(id, _QWORD);
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_outputDevices;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

uint64_t __52__MPAVOutputDeviceRoute__anyOutputDevicePassesTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

BOOL __45__MPAVOutputDeviceRoute_isDeviceSpeakerRoute__block_invoke()
{
  return MRAVOutputDeviceGetType() == 4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDevices, 0);
  objc_storeStrong((id *)&self->_clusterCompositionMembers, 0);
  objc_storeStrong((id *)&self->_clusterMemberRoutes, 0);
  objc_storeStrong((id *)&self->_roomRoutes, 0);
}

- (id)routeName
{
  uint64_t v3;
  const void *v4;
  char v5;
  int IsLocalDevice;
  int Type;
  BOOL v8;
  void *v9;
  objc_super v11;

  v3 = MRAVOutputDeviceCopySourceInfo();
  if (v3)
  {
    v4 = (const void *)v3;
    v5 = MEMORY[0x194037840]();
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  IsLocalDevice = MRAVOutputDeviceIsLocalDevice();
  Type = MRAVOutputDeviceGetType();
  if (IsLocalDevice)
    v8 = Type == 4;
  else
    v8 = 0;
  if (!v8 || (v5 & 1) != 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)MPAVOutputDeviceRoute;
    -[MPAVRoute routeName](&v11, sel_routeName);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MRAVOutputDeviceCopyLocalDeviceLocalizedName();
  }
  return v9;
}

- (MPAVOutputDeviceRoute)initWithOutputDevices:(id)a3 parentRoute:(id)a4
{
  id v6;
  MPAVOutputDeviceRoute *v7;
  MPAVOutputDeviceRoute *v8;

  v6 = a4;
  v7 = -[MPAVOutputDeviceRoute initWithOutputDevices:](self, "initWithOutputDevices:", a3);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->super._parentRoute, v6);

  return v8;
}

- (NSArray)roomRoutes
{
  NSArray *roomRoutes;
  void *v4;
  NSArray *v5;
  NSArray *v6;
  _QWORD v8[5];

  roomRoutes = self->_roomRoutes;
  if (!roomRoutes)
  {
    -[MPAVOutputDeviceRoute outputDevices](self, "outputDevices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __35__MPAVOutputDeviceRoute_roomRoutes__block_invoke;
    v8[3] = &unk_1E315DA00;
    v8[4] = self;
    objc_msgSend(v4, "msv_flatMap:", v8);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_roomRoutes;
    self->_roomRoutes = v5;

    roomRoutes = self->_roomRoutes;
  }
  return roomRoutes;
}

- (NSArray)clusterMemberRoutes
{
  NSArray *clusterMemberRoutes;
  void *v4;
  NSArray *v5;
  NSArray *v6;
  _QWORD v8[5];

  clusterMemberRoutes = self->_clusterMemberRoutes;
  if (!clusterMemberRoutes)
  {
    -[MPAVOutputDeviceRoute outputDevices](self, "outputDevices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __44__MPAVOutputDeviceRoute_clusterMemberRoutes__block_invoke;
    v8[3] = &unk_1E315DA00;
    v8[4] = self;
    objc_msgSend(v4, "msv_flatMap:", v8);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_clusterMemberRoutes;
    self->_clusterMemberRoutes = v5;

    clusterMemberRoutes = self->_clusterMemberRoutes;
  }
  return clusterMemberRoutes;
}

- (id)clusterCompositionRoutes
{
  NSArray *clusterCompositionMembers;
  void *v4;
  NSArray *v5;
  NSArray *v6;
  _QWORD v8[5];

  clusterCompositionMembers = self->_clusterCompositionMembers;
  if (!clusterCompositionMembers)
  {
    -[MPAVOutputDeviceRoute outputDevices](self, "outputDevices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49__MPAVOutputDeviceRoute_clusterCompositionRoutes__block_invoke;
    v8[3] = &unk_1E315DA00;
    v8[4] = self;
    objc_msgSend(v4, "msv_flatMap:", v8);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_clusterCompositionMembers;
    self->_clusterCompositionMembers = v5;

    clusterCompositionMembers = self->_clusterCompositionMembers;
  }
  return clusterCompositionMembers;
}

- (BOOL)canAccessRemoteAssets
{
  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  return MRAVOutputDeviceCanAccessRemoteAssets();
}

- (BOOL)canPlayEncryptedProgressiveDownloadAssets
{
  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  return MRAVOutputDeviceCanPlayEncryptedProgressiveDownloadAssets();
}

- (BOOL)canFetchMediaDataFromSender
{
  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  return MRAVOutputDeviceCanFetchMediaDataFromSender();
}

- (BOOL)presentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets
{
  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  return MRAVOutputDevicePresentsOptimizedUserInterfaceWhenPlayingFetchedAudioOnlyAssets();
}

- (BOOL)isAppleTVRoute
{
  void *v2;
  char v3;

  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  v2 = (void *)MRAVOutputDeviceCopyModelID();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("TV"));

  return v3;
}

- (BOOL)isCarplayRoute
{
  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  return MRAVOutputDeviceGetType() == 3;
}

- (BOOL)isHomePodRoute
{
  void *v4;
  char v5;

  if (-[MPAVOutputDeviceRoute isClusterRoute](self, "isClusterRoute"))
    return -[MPAVOutputDeviceRoute isStereoPair](self, "isStereoPair");
  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  v4 = (void *)MRAVOutputDeviceCopyModelID();
  v5 = objc_msgSend(v4, "containsString:", CFSTR("AudioAccessory"));

  return v5;
}

- (BOOL)isB520Route
{
  void *v2;
  char v3;

  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  v2 = (void *)MRAVOutputDeviceCopyModelID();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("AudioAccessory5"));

  return v3;
}

- (BOOL)isDeviceRoute
{
  return -[MPAVOutputDeviceRoute _anyOutputDevicePassesMRFunction:](self, "_anyOutputDevicePassesMRFunction:", MEMORY[0x1E0D4B5E0]);
}

- (BOOL)isDeviceSpeakerPhoneRoute
{
  return -[MPAVOutputDeviceRoute _anyOutputDeviceObjPassesTest:](self, "_anyOutputDeviceObjPassesTest:", &__block_literal_global_22);
}

- (BOOL)isProxyGroupPlayer
{
  return -[MPAVOutputDeviceRoute _anyOutputDevicePassesMRFunction:](self, "_anyOutputDevicePassesMRFunction:", MEMORY[0x1E0D4B5F0]);
}

- (BOOL)isGroupLeader
{
  return -[MPAVOutputDeviceRoute _anyOutputDevicePassesMRFunction:](self, "_anyOutputDevicePassesMRFunction:", MEMORY[0x1E0D4B5D0]);
}

- (BOOL)isVolumeControlAvailable
{
  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  return MRAVOutputDeviceIsVolumeControlAvailable();
}

- (BOOL)isPickedOnPairedDevice
{
  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  return MRAVOutputDeviceIsPickedOnPairedDevice();
}

- (id)routeUID
{
  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  return (id)MRAVOutputDeviceCopyUniqueIdentifier();
}

- (id)groupUID
{
  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  return (id)MRAVOutputDeviceCopyGroupIdentifier();
}

- (id)playingPairedDeviceName
{
  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  return (id)MRAVOutputDeviceCopyPlayingPairedDeviceName();
}

- (int64_t)routeType
{
  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  if (MRAVOutputDeviceIsGroupable())
    return 3;
  else
    return 0;
}

- (int64_t)routeSubtype
{
  uint64_t Type;
  uint64_t Subtype;

  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  Type = MRAVOutputDeviceGetType();
  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  Subtype = MRAVOutputDeviceGetSubtype();
  return objc_msgSend((id)objc_opt_class(), "routeSubtypeForMRSubtype:withOverridesFromMRType:", Subtype, Type);
}

- (int64_t)originalRouteSubtype
{
  uint64_t Type;
  uint64_t Subtype;

  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  Type = MRAVOutputDeviceGetType();
  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  Subtype = MRAVOutputDeviceGetSubtype();
  return objc_msgSend((id)objc_opt_class(), "routeSubtypeForMRSubtype:mrType:", Subtype, Type);
}

- (int64_t)pickableRouteType
{
  return objc_msgSend((id)objc_opt_class(), "pickableRouteTypeForOutputDevice:", -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice"));
}

- (BOOL)supportsWirelessDisplay
{
  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  return MRAVOutputDeviceSupportsExternalScreen();
}

- (BOOL)requiresPassword
{
  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  return MRAVOutputDeviceRequiresAuthorization();
}

- (BOOL)isStereoPair
{
  NSArray *v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[MPAVOutputDeviceRoute isClusterRoute](self, "isClusterRoute"))
  {
    -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v4 = -[NSArray clusterType](v3, "clusterType") == 1;
  }
  else
  {
    v4 = -[NSArray count](self->_outputDevices, "count") > 1;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = self->_outputDevices;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v3);
          v4 = v4 && MRAVOutputDeviceGetSubtype() == 12;
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }
  }

  return v4;
}

- (BOOL)isClusterRoute
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[MPAVOutputDeviceRoute outputDevices](self, "outputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    -[MPAVOutputDeviceRoute outputDevices](self, "outputDevices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "deviceSubtype") == 15;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isHomeTheaterRoute
{
  void *v2;
  BOOL v3;

  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "clusterType") == 2;

  return v3;
}

- (BOOL)isPhoneRoute
{
  void *v2;
  BOOL v3;

  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hostDeviceClass") == 1 && objc_msgSend(v2, "deviceType") == 4;

  return v3;
}

- (BOOL)isPhoneLocalRoute
{
  void *v2;
  BOOL v3;

  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hostDeviceClass") == 1;

  return v3;
}

- (BOOL)isMacRoute
{
  void *v2;
  BOOL v3;

  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceSubtype") == 18;

  return v3;
}

- (BOOL)supportsHeadTrackedSpatialAudio
{
  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  return MRAVOutputDeviceSupportsHeadTrackedSpatialAudio();
}

- (BOOL)headTrackedSpatialAudioEnabled
{
  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  return MRAVOutputDeviceAllowsHeadTrackedSpatialAudio();
}

- (BOOL)supportsGrouping
{
  return -[MPAVOutputDeviceRoute _anyOutputDevicePassesMRFunction:](self, "_anyOutputDevicePassesMRFunction:", MEMORY[0x1E0D4B5D8])|| -[MPAVOutputDeviceRoute _anyOutputDevicePassesMRFunction:](self, "_anyOutputDevicePassesMRFunction:", MEMORY[0x1E0D4B620]);
}

- (BOOL)supportsAirPlayGrouping
{
  return -[MPAVOutputDeviceRoute _anyOutputDevicePassesMRFunction:](self, "_anyOutputDevicePassesMRFunction:", MEMORY[0x1E0D4B5D8]);
}

- (BOOL)isSplitterCapable
{
  return -[MPAVOutputDeviceRoute _anyOutputDevicePassesMRFunction:](self, "_anyOutputDevicePassesMRFunction:", MEMORY[0x1E0D4B620]);
}

- (BOOL)isLowLatencyRoute
{
  if (-[NSArray count](self->_outputDevices, "count") != 1)
    return 0;
  -[NSArray firstObject](self->_outputDevices, "firstObject");

  return (MRAVOutputDeviceGetType() & 0xFFFFFFFE) == 4;
}

- (BOOL)isAppleAccessory
{
  void *v2;
  char v3;

  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAppleAccessory");

  return v3;
}

- (id)clusterComposition
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[MPAVOutputDeviceRoute outputDevices](self, "outputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 <= 1
    && (-[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice"),
        MRAVOutputDeviceGetSubtype() == 15))
  {
    -[MPAVOutputDeviceRoute outputDevices](self, "outputDevices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "clusterCompositionForOutputDevice:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)subRoutes
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "showMembersInsteadOfRooms"))
    -[MPAVOutputDeviceRoute clusterMemberRoutes](self, "clusterMemberRoutes");
  else
    -[MPAVOutputDeviceRoute roomRoutes](self, "roomRoutes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "allowSingleRoomExpandedRows");

    if ((v6 & 1) == 0)
    {

      v4 = 0;
    }
  }
  return v4;
}

- (int64_t)clusterType
{
  void *v2;
  int64_t v3;

  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend((id)objc_opt_class(), "clusterTypeForMRClusterType:", objc_msgSend(v2, "clusterType"));

  return v3;
}

- (BOOL)isLowFidelityRoute
{
  void *v2;
  char v3;

  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "producesLowFidelityAudio");

  return v3;
}

- (NSArray)dnsNames
{
  -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice");
  return (NSArray *)(id)MRAVOutputDeviceCopyDNSNames();
}

- (BOOL)isPickable
{
  void *v2;
  char v3;

  -[MPAVOutputDeviceRoute outputDevice](self, "outputDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPickable");

  return v3;
}

- (BOOL)_anyOutputDevicePassesMRFunction:(void *)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__MPAVOutputDeviceRoute__anyOutputDevicePassesMRFunction___block_invoke;
  v4[3] = &__block_descriptor_40_e26_B16__0__MRAVOutputDevice_8l;
  v4[4] = a3;
  return -[MPAVOutputDeviceRoute _anyOutputDeviceObjPassesTest:](self, "_anyOutputDeviceObjPassesTest:", v4);
}

- (BOOL)isNearby
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[MPAVOutputDeviceRoute outputDevices](self, "outputDevices", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isNearby") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isKnown
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[MPAVOutputDeviceRoute outputDevices](self, "outputDevices", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isKnown") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

uint64_t __58__MPAVOutputDeviceRoute__anyOutputDevicePassesMRFunction___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 32))(a2);
}

uint64_t __50__MPAVOutputDeviceRoute_isDeviceSpeakerPhoneRoute__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  if (objc_msgSend(v2, "deviceType") == 4 && objc_msgSend(v2, "deviceSubtype") == 1)
  {
    objc_msgSend(v2, "sourceInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "multipleBuiltInDevices");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __49__MPAVOutputDeviceRoute_clusterCompositionRoutes__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(a2, "clusterCompositionMembers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__MPAVOutputDeviceRoute_clusterCompositionRoutes__block_invoke_2;
  v6[3] = &unk_1E315D9D8;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "msv_map:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

MPAVOutputDeviceRoute *__49__MPAVOutputDeviceRoute_clusterCompositionRoutes__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  MPAVOutputDeviceRoute *v4;
  void *v5;
  MPAVOutputDeviceRoute *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = [MPAVOutputDeviceRoute alloc];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPAVOutputDeviceRoute initWithOutputDevices:parentRoute:](v4, "initWithOutputDevices:parentRoute:", v5, *(_QWORD *)(a1 + 32));

  return v6;
}

id __44__MPAVOutputDeviceRoute_clusterMemberRoutes__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(a2, "activatedClusterMembersOutputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__MPAVOutputDeviceRoute_clusterMemberRoutes__block_invoke_2;
  v6[3] = &unk_1E315D9D8;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "msv_map:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

MPAVOutputDeviceRoute *__44__MPAVOutputDeviceRoute_clusterMemberRoutes__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  MPAVOutputDeviceRoute *v4;
  void *v5;
  MPAVOutputDeviceRoute *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = [MPAVOutputDeviceRoute alloc];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPAVOutputDeviceRoute initWithOutputDevices:parentRoute:](v4, "initWithOutputDevices:parentRoute:", v5, *(_QWORD *)(a1 + 32));

  return v6;
}

id __35__MPAVOutputDeviceRoute_roomRoutes__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(a2, "roomOutputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__MPAVOutputDeviceRoute_roomRoutes__block_invoke_2;
  v6[3] = &unk_1E315D9D8;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "msv_map:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

MPAVOutputDeviceRoute *__35__MPAVOutputDeviceRoute_roomRoutes__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  MPAVOutputDeviceRoute *v4;
  void *v5;
  MPAVOutputDeviceRoute *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = [MPAVOutputDeviceRoute alloc];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPAVOutputDeviceRoute initWithOutputDevices:parentRoute:](v4, "initWithOutputDevices:parentRoute:", v5, *(_QWORD *)(a1 + 32));

  return v6;
}

+ (NSString)localDeviceUID
{
  return (NSString *)CFSTR("LOCAL");
}

+ (int64_t)pickableRouteTypeForOutputDevice:(void *)a3
{
  return MRAVOutputDeviceGetType() - 1 < 2;
}

uint64_t __56__MPAVOutputDeviceRoute_logicalLeaderFromOutputDevices___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int IsGroupLeader;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  IsGroupLeader = MRAVOutputDeviceIsGroupLeader();
  v7 = MRAVOutputDeviceIsGroupLeader();
  if (!IsGroupLeader || v7)
  {
    if ((IsGroupLeader | v7 ^ 1) == 1)
    {
      v9 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
      v10 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
      v8 = objc_msgSend(v9, "compare:", v10);

    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

@end
