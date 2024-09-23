@implementation MPVolumeControllerRouteDataSource

- (MPVolumeControllerRouteDataSource)initWithGroupRoute:(id)a3 outputDeviceRoute:(id)a4
{
  id v8;
  id v9;
  MPVolumeControllerRouteDataSource *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MPVolumeControllerRouteDataSource;
  v10 = -[MPVolumeControllerRouteDataSource init](&v19, sel_init);
  if (!v10)
    goto LABEL_10;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("MPVolumeControllerRouteDataSource.m"), 57, CFSTR("Group route must be an endpoint route."));

    if (v9)
    {
LABEL_5:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("MPVolumeControllerRouteDataSource.m"), 58, CFSTR("Output device route must be an output device."));

      }
    }
  }
  else if (v9)
  {
    goto LABEL_5;
  }
  objc_storeStrong((id *)&v10->_groupRoute, a3);
  objc_storeStrong((id *)&v10->_outputDeviceRoute, a4);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", v10, sel__routeVolumeDidChangeNotification_, *MEMORY[0x1E0D4B4D8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", v10, sel__routeVolumeControlCapabilitiesDidChangeNotification_, *MEMORY[0x1E0D4B4D0], 0);

  if (-[MPVolumeControllerRouteDataSource _supportsNativeMute](v10, "_supportsNativeMute"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v10, sel__routeVolumeMutedDidChangeNotification_, *MEMORY[0x1E0D4B4E0], 0);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", v10, sel__routeWasAddedOrRemovedFromGroupRouteNotification_, *MEMORY[0x1E0D4B3F0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:selector:name:object:", v10, sel__routeWasAddedOrRemovedFromGroupRouteNotification_, *MEMORY[0x1E0D4B3F8], 0);

  -[MPVolumeControllerRouteDataSource initializeVolume](v10, "initializeVolume");
LABEL_10:

  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D4B4D8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0D4B4D0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0D4B4E0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0D4B3F0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x1E0D4B3F8], 0);

  v8.receiver = self;
  v8.super_class = (Class)MPVolumeControllerRouteDataSource;
  -[MPVolumeControllerRouteDataSource dealloc](&v8, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  MPAVRoute *outputDeviceRoute;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  outputDeviceRoute = self->_outputDeviceRoute;
  -[MPAVRoute routeName](self->_groupRoute, "routeName");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (outputDeviceRoute)
  {
    -[MPAVRoute routeName](self->_outputDeviceRoute, "routeName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Endpoint: %@ OutputDevice: %@"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Endpoint: %@"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = objc_opt_class();
  if (self->_volumeControlAvailable)
    v11 = CFSTR("available");
  else
    v11 = CFSTR("not available");
  objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@: %p %@ volume control %@>"), v10, self, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (BOOL)applicationShouldOverrideHardwareVolumeBehavior
{
  return 1;
}

- (NSString)volumeAudioCategory
{
  return (NSString *)CFSTR("Audio/Video");
}

- (NSString)volumeControlLabel
{
  void *v3;
  void *v4;
  void *v5;

  -[MPVolumeControllerRouteDataSource outputDeviceRoute](self, "outputDeviceRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[MPVolumeControllerRouteDataSource outputDeviceRoute](self, "outputDeviceRoute");
  else
    -[MPVolumeControllerRouteDataSource groupRoute](self, "groupRoute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "routeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setVolume:(float)a3
{
  id WeakRetained;

  if (self->_volume != a3)
  {
    self->_volume = a3;
    if (!-[MPVolumeControllerRouteDataSource _supportsNativeMute](self, "_supportsNativeMute")
      && self->_volume > 0.0
      && self->_muted)
    {
      self->_muted = 0;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "volumeControllerDataSource:didChangeMuted:", self, 0);

    }
    self->_pendingVolume = a3;
    self->_hasPendingVolume = 1;
    -[MPVolumeControllerRouteDataSource _setPendingVolumeIfNeeded](self, "_setPendingVolumeIfNeeded");
  }
}

- (void)_setPendingVolumeIfNeeded
{
  MPAVRoute *v3;
  MPAVRoute *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  double pendingVolume;
  id v12;
  uint8_t buf[4];
  MPVolumeControllerRouteDataSource *v14;
  __int16 v15;
  double v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_hasPendingVolume && !self->_hasVolumeInFlight)
  {
    *(_WORD *)&self->_hasPendingVolume = 256;
    v3 = self->_groupRoute;
    v4 = self->_outputDeviceRoute;
    v5 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        -[MPAVRoute logicalLeaderOutputDevice](v4, "logicalLeaderOutputDevice");
        v7 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
        *(double *)&v8 = self->_pendingVolume;
        -[MPAVRoute endpointWrapper](v3, "endpointWrapper");
        v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 138413058;
        v14 = self;
        v15 = 2112;
        v16 = *(double *)&v7;
        v17 = 2048;
        v18 = v8;
        v19 = 2112;
        v20 = objc_msgSend(v9, "unwrappedValue");
        _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "%@ setOutputDeviceVolume: %@ to: %f for endpoint: %@", buf, 0x2Au);

      }
      -[MPAVRoute endpointWrapper](v3, "endpointWrapper");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v10, "unwrappedValue");
      -[MPAVRoute logicalLeaderOutputDevice](v4, "logicalLeaderOutputDevice");
      MRAVEndpointSetOutputDeviceVolume();
    }
    else
    {
      if (v6)
      {
        pendingVolume = self->_pendingVolume;
        -[MPAVRoute endpointWrapper](v3, "endpointWrapper");
        v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 138412802;
        v14 = self;
        v15 = 2048;
        v16 = pendingVolume;
        v17 = 2112;
        v18 = objc_msgSend(v12, "unwrappedValue");
        _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "%@ setVolume to: %f endpoint: %@", buf, 0x20u);

      }
      -[MPAVRoute endpointWrapper](v3, "endpointWrapper");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v10, "unwrappedValue");
      MRAVEndpointSetVolume();
    }

  }
}

- (void)setMuted:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  double v6;
  MPAVRoute *groupRoute;
  MPAVRoute *outputDeviceRoute;
  MPAVRoute *v9;
  MPAVRoute *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];

  if (self->_muted != a3)
  {
    v3 = a3;
    self->_muted = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "volumeControllerDataSource:didChangeMuted:", self, v3);

    if (-[MPVolumeControllerRouteDataSource _supportsNativeMute](self, "_supportsNativeMute"))
    {
      groupRoute = self->_groupRoute;
      outputDeviceRoute = self->_outputDeviceRoute;
      v9 = outputDeviceRoute;
      v10 = groupRoute;
      -[MPAVRoute endpointObject](v10, "endpointObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (outputDeviceRoute)
      {
        -[MPAVRoute routeUID](self->_outputDeviceRoute, "routeUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __46__MPVolumeControllerRouteDataSource_setMuted___block_invoke;
        v15[3] = &unk_1E3163100;
        v15[4] = self;
        objc_msgSend(v12, "muteOutputDeviceVolume:outputDevice:queue:completion:", v3, v13, MEMORY[0x1E0C80D38], v15);

      }
      else
      {
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __46__MPVolumeControllerRouteDataSource_setMuted___block_invoke_34;
        v14[3] = &unk_1E3163100;
        v14[4] = self;
        objc_msgSend(v11, "muteVolume:queue:completion:", v3, MEMORY[0x1E0C80D38], v14);
      }

    }
    else
    {
      LODWORD(v6) = 0;
      if (!v3)
        *(float *)&v6 = self->_volume;
      -[MPVolumeControllerRouteDataSource setVolume:](self, "setVolume:", v6);
    }
  }
}

- (void)beginDecreasingRelativeVolume
{
  if ((self->_volumeControlCapabilities & 5) == 1)
    -[MPVolumeControllerRouteDataSource _sendVolumeButtonEventWithUsagePage:usage:down:](self, "_sendVolumeButtonEventWithUsagePage:usage:down:", 12, 234, 1);
}

- (void)endDecreasingRelativeVolume
{
  unsigned int volumeControlCapabilities;
  MPAVRoute *groupRoute;
  MPAVRoute *v4;
  void *v5;
  void *v6;
  MPAVRoute *v7;

  volumeControlCapabilities = self->_volumeControlCapabilities;
  if ((volumeControlCapabilities & 4) != 0)
  {
    groupRoute = self->_groupRoute;
    v4 = self->_outputDeviceRoute;
    v7 = groupRoute;
    -[MPAVRoute endpointObject](v7, "endpointObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAVRoute routeUID](v4, "routeUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "adjustOutputDeviceVolume:outputDevice:queue:completion:", 5, v6, MEMORY[0x1E0C80D38], &__block_literal_global_49463);
  }
  else if ((volumeControlCapabilities & 1) != 0)
  {
    -[MPVolumeControllerRouteDataSource _sendVolumeButtonEventWithUsagePage:usage:down:](self, "_sendVolumeButtonEventWithUsagePage:usage:down:", 12, 234, 0);
  }
}

- (void)beginIncreasingRelativeVolume
{
  if ((self->_volumeControlCapabilities & 5) == 1)
    -[MPVolumeControllerRouteDataSource _sendVolumeButtonEventWithUsagePage:usage:down:](self, "_sendVolumeButtonEventWithUsagePage:usage:down:", 12, 233, 1);
}

- (void)endIncreasingRelativeVolume
{
  unsigned int volumeControlCapabilities;
  MPAVRoute *groupRoute;
  MPAVRoute *v4;
  void *v5;
  void *v6;
  MPAVRoute *v7;

  volumeControlCapabilities = self->_volumeControlCapabilities;
  if ((volumeControlCapabilities & 4) != 0)
  {
    groupRoute = self->_groupRoute;
    v4 = self->_outputDeviceRoute;
    v7 = groupRoute;
    -[MPAVRoute endpointObject](v7, "endpointObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAVRoute routeUID](v4, "routeUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "adjustOutputDeviceVolume:outputDevice:queue:completion:", 2, v6, MEMORY[0x1E0C80D38], &__block_literal_global_35_49462);
  }
  else if ((volumeControlCapabilities & 1) != 0)
  {
    -[MPVolumeControllerRouteDataSource _sendVolumeButtonEventWithUsagePage:usage:down:](self, "_sendVolumeButtonEventWithUsagePage:usage:down:", 12, 233, 0);
  }
}

- (void)_sendVolumeButtonEventWithUsagePage:(unsigned int)a3 usage:(unsigned int)a4 down:(BOOL)a5
{
  MPAVRoute *groupRoute;

  groupRoute = self->_groupRoute;
  if (groupRoute)
  {
    -[MPAVRoute endpoint](groupRoute, "endpoint");
    MRAVEndpointGetExternalDevice();
    MRExternalDeviceSendButtonEvent();
  }
}

- (void)reload
{
  double v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_volumeCapabilitiesInitialized)
    objc_msgSend(WeakRetained, "volumeControllerDataSource:didChangeVolumeControlAvailability:", self, self->_volumeControlAvailable);
  if (self->_volumeInitialized)
  {
    *(float *)&v3 = self->_volume;
    objc_msgSend(WeakRetained, "volumeControllerDataSource:didChangeVolume:", self, v3);
  }
  if (-[MPVolumeControllerRouteDataSource _supportsNativeMute](self, "_supportsNativeMute") && self->_mutedInitialized)
    objc_msgSend(WeakRetained, "volumeControllerDataSource:didChangeMuted:", self, self->_muted);

}

- (void)adjustVolumeValue:(float)a3
{
  float v4;
  float v5;
  NSObject *v6;
  double v7;
  int v8;
  MPVolumeControllerRouteDataSource *v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3 * 100000.0;
  v5 = floorf(v4) * 0.00001;
  v6 = os_log_create("com.apple.amp.mediaplayer", "Volume");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = self;
    v10 = 2048;
    v11 = v5;
    _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Adjusting endpoint volume by: %f", (uint8_t *)&v8, 0x16u);
  }

  v7 = fmax(fmin((float)(self->_volume + v5), 1.0), 0.0);
  *(float *)&v7 = v7;
  -[MPVolumeControllerRouteDataSource setVolume:](self, "setVolume:", v7);
}

- (void)initializeVolume
{
  if (self->_reloading)
    self->_needsReloading = 1;
  else
    -[MPVolumeControllerRouteDataSource _initializeVolume](self, "_initializeVolume");
}

- (void)_initializeVolume
{
  BOOL v3;
  uint64_t v4;
  void *v5;
  void *v6;
  MPAVRoute *v7;
  MPAVRoute *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id *v19;
  id *v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD block[5];
  _QWORD v29[5];
  NSObject *v30;
  _QWORD v31[6];
  NSObject *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t, uint64_t);
  void *v37;
  MPVolumeControllerRouteDataSource *v38;
  NSObject *v39;
  id v40;
  _QWORD v41[5];
  NSObject *v42;
  _QWORD v43[6];
  NSObject *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t, uint64_t, uint64_t);
  void *v49;
  MPVolumeControllerRouteDataSource *v50;
  NSObject *v51;
  id v52;
  _QWORD v53[5];
  _QWORD v54[5];
  _QWORD v55[6];

  *(_WORD *)&self->_volumeInitialized = 0;
  v3 = -[MPVolumeControllerRouteDataSource _supportsNativeMute](self, "_supportsNativeMute");
  v4 = MEMORY[0x1E0C809B0];
  self->_mutedInitialized = !v3;
  v55[0] = v4;
  v55[1] = 3221225472;
  v55[2] = __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke;
  v55[3] = &unk_1E3163188;
  v55[4] = self;
  v5 = (void *)MEMORY[0x19403A810](v55);
  v54[0] = v4;
  v54[1] = 3221225472;
  v54[2] = __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_2;
  v54[3] = &unk_1E31631B0;
  v54[4] = self;
  v6 = (void *)MEMORY[0x19403A810](v54);
  v53[0] = v4;
  v53[1] = 3221225472;
  v53[2] = __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_3;
  v53[3] = &unk_1E31631D8;
  v53[4] = self;
  v27 = (void *)MEMORY[0x19403A810](v53);
  v7 = self->_groupRoute;
  v8 = self->_outputDeviceRoute;
  v9 = dispatch_group_create();
  -[MPAVRoute endpointWrapper](v7, "endpointWrapper");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = objc_msgSend(v10, "unwrappedValue");

  if (v8)
  {
    if (v11)
    {
      dispatch_group_enter(v9);
      -[MPAVRoute endpointWrapper](v7, "endpointWrapper");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v12, "unwrappedValue");
      -[MPAVRoute logicalLeaderOutputDevice](v8, "logicalLeaderOutputDevice");
      v46 = v4;
      v47 = 3221225472;
      v48 = __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_4;
      v49 = &unk_1E3163200;
      v52 = v6;
      v50 = self;
      v51 = v9;
      MRAVEndpointGetOutputDeviceVolumeControlCapabilities();

    }
    -[MPAVRoute endpointWrapper](v7, "endpointWrapper");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = objc_msgSend(v13, "unwrappedValue");

    if (v14)
    {
      dispatch_group_enter(v9);
      -[MPAVRoute endpointWrapper](v7, "endpointWrapper");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v15, "unwrappedValue");
      -[MPAVRoute logicalLeaderOutputDevice](v8, "logicalLeaderOutputDevice");
      v43[1] = v4;
      v43[2] = 3221225472;
      v43[3] = __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_40;
      v43[4] = &unk_1E3163228;
      v45 = v5;
      v43[5] = self;
      v44 = v9;
      MRAVEndpointGetOutputDeviceVolume();

    }
    if (-[MPVolumeControllerRouteDataSource _supportsNativeMute](self, "_supportsNativeMute"))
    {
      -[MPAVRoute endpointObject](v7, "endpointObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v26 = v5;
        dispatch_group_enter(v9);
        -[MPAVRoute endpointObject](v7, "endpointObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPAVRoute routeUID](v8, "routeUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = v4;
        v41[1] = 3221225472;
        v41[2] = __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_42;
        v41[3] = &unk_1E3163250;
        v19 = (id *)v43;
        v43[0] = v27;
        v41[4] = self;
        v20 = (id *)&v42;
        v42 = v9;
        objc_msgSend(v17, "outputDeviceVolumeMuted:queue:completion:", v18, MEMORY[0x1E0C80D38], v41);

LABEL_16:
        v5 = v26;
      }
    }
  }
  else
  {
    if (v11)
    {
      dispatch_group_enter(v9);
      -[MPAVRoute endpointWrapper](v7, "endpointWrapper");
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v21, "unwrappedValue");
      v34 = v4;
      v35 = 3221225472;
      v36 = __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_44;
      v37 = &unk_1E3163200;
      v40 = v6;
      v38 = self;
      v39 = v9;
      MRAVEndpointGetVolumeControlCapabilities();

    }
    -[MPAVRoute endpointWrapper](v7, "endpointWrapper");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = objc_msgSend(v22, "unwrappedValue");

    if (v23)
    {
      dispatch_group_enter(v9);
      -[MPAVRoute endpointWrapper](v7, "endpointWrapper");
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v24, "unwrappedValue");
      v31[1] = v4;
      v31[2] = 3221225472;
      v31[3] = __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_45;
      v31[4] = &unk_1E3163228;
      v33 = v5;
      v31[5] = self;
      v32 = v9;
      MRAVEndpointGetVolume();

    }
    if (-[MPVolumeControllerRouteDataSource _supportsNativeMute](self, "_supportsNativeMute"))
    {
      -[MPAVRoute endpointObject](v7, "endpointObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        v26 = v5;
        dispatch_group_enter(v9);
        -[MPAVRoute endpointObject](v7, "endpointObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = v4;
        v29[1] = 3221225472;
        v29[2] = __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_46;
        v29[3] = &unk_1E3163250;
        v19 = (id *)v31;
        v31[0] = v27;
        v29[4] = self;
        v20 = (id *)&v30;
        v30 = v9;
        objc_msgSend(v17, "volumeMutedOnQueue:completion:", MEMORY[0x1E0C80D38], v29);
        goto LABEL_16;
      }
    }
  }
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_47;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_group_notify(v9, MEMORY[0x1E0C80D38], block);

}

- (void)_updateVolumeControlCapabilities:(unsigned int)a3
{
  uint64_t v3;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  MPVolumeControllerRouteDataSource *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v3 = *(_QWORD *)&a3;
  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = WeakRetained;
  if ((!self->_volumeCapabilitiesInitialized || ((v3 >> 1) & 1) != self->_volumeControlAvailable)
    && (self->_volumeControlAvailable = (v3 & 2) >> 1,
        objc_msgSend(WeakRetained, "volumeControllerDataSource:didChangeVolumeControlAvailability:", self, (v3 & 2) != 0), !self->_volumeCapabilitiesInitialized)|| self->_volumeControlCapabilities != (_DWORD)v3)
  {
    self->_volumeCapabilitiesInitialized = 1;
    self->_volumeControlCapabilities = v3;
    v7 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription();
      v9 = 138412546;
      v10 = self;
      v11 = 2114;
      v12 = v8;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "%@ MPLogVolume capabilities: %{public}@", (uint8_t *)&v9, 0x16u);

    }
    objc_msgSend(v6, "volumeControllerDataSource:didChangeVolumeCapabilities:", self, v3);
  }

}

- (void)_updateVolume:(float)a3
{
  id WeakRetained;
  NSObject *v6;
  double v7;
  _BOOL4 v8;
  int v9;
  MPVolumeControllerRouteDataSource *v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  self->_volumeInitialized = 1;
  self->_volume = a3;
  v6 = os_log_create("com.apple.amp.mediaplayer", "Volume");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = self;
    v11 = 2048;
    v12 = a3;
    _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "%@ MPLogVolume volume: %lf", (uint8_t *)&v9, 0x16u);
  }

  if (!self->_hasVolumeInFlight)
  {
    *(float *)&v7 = a3;
    objc_msgSend(WeakRetained, "volumeControllerDataSource:didChangeVolume:", self, v7);
  }
  if (!-[MPVolumeControllerRouteDataSource _supportsNativeMute](self, "_supportsNativeMute"))
  {
    v8 = a3 == 0.0;
    if (self->_muted != v8)
    {
      self->_muted = v8;
      objc_msgSend(WeakRetained, "volumeControllerDataSource:didChangeMuted:", self, a3 == 0.0);
    }
  }

}

- (void)_updateMuted:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  NSObject *v6;
  _BOOL4 muted;
  int v8;
  MPVolumeControllerRouteDataSource *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!self->_mutedInitialized || self->_muted != v3)
  {
    self->_mutedInitialized = 1;
    self->_muted = v3;
    v6 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      muted = self->_muted;
      v8 = 138412546;
      v9 = self;
      v10 = 1024;
      v11 = muted;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "%@ MPLogVolume muted:%{BOOL}u", (uint8_t *)&v8, 0x12u);
    }

    objc_msgSend(WeakRetained, "volumeControllerDataSource:didChangeMuted:", self, v3);
  }

}

- (void)getVolumeValueWithCompletion:(id)a3
{
  id v4;
  MPAVRoute *groupRoute;
  MPAVRoute *outputDeviceRoute;
  MPAVRoute *v7;
  MPAVRoute *v8;
  id v9;
  void *v10;
  id *v11;
  _QWORD v12[6];
  id v13;

  v4 = a3;
  groupRoute = self->_groupRoute;
  outputDeviceRoute = self->_outputDeviceRoute;
  v7 = outputDeviceRoute;
  v8 = groupRoute;
  -[MPAVRoute endpointWrapper](v8, "endpointWrapper");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v9, "unwrappedValue");
  if (outputDeviceRoute)
  {
    -[MPAVRoute logicalLeaderOutputDevice](v7, "logicalLeaderOutputDevice");
    dispatch_get_global_queue(21, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = MEMORY[0x1E0C809B0];
    v12[2] = 3221225472;
    v12[3] = __66__MPVolumeControllerRouteDataSource_getVolumeValueWithCompletion___block_invoke;
    v12[4] = &unk_1E3163278;
    v12[5] = self;
    v11 = &v13;
    v13 = v4;
    MRAVEndpointGetOutputDeviceVolume();
  }
  else
  {
    dispatch_get_global_queue(21, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id *)v12;
    v12[0] = v4;
    MRAVEndpointGetVolume();
  }

}

- (void)_routeVolumeDidChangeNotification:(id)a3
{
  id v4;
  void (**v5)(_QWORD, float);
  void *v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  int v18;
  char v19;
  _QWORD v20[5];

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __71__MPVolumeControllerRouteDataSource__routeVolumeDidChangeNotification___block_invoke;
  v20[3] = &unk_1E3163188;
  v20[4] = self;
  v4 = a3;
  v5 = (void (**)(_QWORD, float))MEMORY[0x19403A810](v20);
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D4C688]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  objc_msgSend(v4, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D4C660]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D4C668]);
  v13 = objc_claimAutoreleasedReturnValue();

  -[MPAVRoute routeUID](self->_groupRoute, "routeUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", v11);

  -[MPAVRoute logicalLeaderOutputDevice](self->_outputDeviceRoute, "logicalLeaderOutputDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "uid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqual:", v13);

  if ((uint64_t)self->_outputDeviceRoute | v13)
    v19 = 0;
  else
    v19 = v15;
  if ((v19 & 1) != 0 || v18)
    v5[2](v5, v9);

}

- (void)_routeVolumeControlCapabilitiesDidChangeNotification:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  _QWORD v19[5];

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __90__MPVolumeControllerRouteDataSource__routeVolumeControlCapabilitiesDidChangeNotification___block_invoke;
  v19[3] = &unk_1E31631B0;
  v19[4] = self;
  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x19403A810](v19);
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D4C660]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D4C668]);
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D4C680]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "intValue");

  -[MPAVRoute routeUID](self->_groupRoute, "routeUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", v7);

  -[MPAVRoute logicalLeaderOutputDevice](self->_outputDeviceRoute, "logicalLeaderOutputDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqual:", v9);

  if ((uint64_t)self->_outputDeviceRoute | v9)
    v18 = v17;
  else
    v18 = 1;
  if (v18 == 1 && v14)
    v5[2](v5, v12);

}

- (void)_routeVolumeMutedDidChangeNotification:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  _QWORD v19[5];

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __76__MPVolumeControllerRouteDataSource__routeVolumeMutedDidChangeNotification___block_invoke;
  v19[3] = &unk_1E31631D8;
  v19[4] = self;
  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x19403A810](v19);
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D4C660]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D4C668]);
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D4B4E8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  -[MPAVRoute routeUID](self->_groupRoute, "routeUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", v7);

  -[MPAVRoute logicalLeaderOutputDevice](self->_outputDeviceRoute, "logicalLeaderOutputDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqual:", v9);

  if ((uint64_t)self->_outputDeviceRoute | v9)
    v18 = v17;
  else
    v18 = 1;
  if (v18 == 1 && v14)
    v5[2](v5, v12);

}

- (void)_routeWasAddedOrRemovedFromGroupRouteNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  BOOL v15;
  _QWORD block[5];

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D4C660]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D4C668]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPAVRoute endpointObject](self->_groupRoute, "endpointObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVRoute logicalLeaderOutputDevice](self->_outputDeviceRoute, "logicalLeaderOutputDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", v6);

  objc_msgSend(v10, "uid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqual:", v8);

  if (v12)
    v15 = v14 == 0;
  else
    v15 = 1;
  if (!v15)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__MPVolumeControllerRouteDataSource__routeWasAddedOrRemovedFromGroupRouteNotification___block_invoke;
    block[3] = &unk_1E3163508;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

- (BOOL)_supportsNativeMute
{
  return _os_feature_enabled_impl();
}

- (MPVolumeControllerDataSourceDelegate)delegate
{
  return (MPVolumeControllerDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isVolumeControlAvailable
{
  return self->_volumeControlAvailable;
}

- (unsigned)volumeControlCapabilities
{
  return self->_volumeControlCapabilities;
}

- (float)volume
{
  return self->_volume;
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (float)EUVolumeLimit
{
  return self->_EUVolumeLimit;
}

- (BOOL)volumeWarningEnabled
{
  return self->_volumeWarningEnabled;
}

- (int64_t)volumeWarningState
{
  return self->_volumeWarningState;
}

- (MPAVRoute)groupRoute
{
  return self->_groupRoute;
}

- (void)setGroupRoute:(id)a3
{
  objc_storeStrong((id *)&self->_groupRoute, a3);
}

- (MPAVRoute)outputDeviceRoute
{
  return self->_outputDeviceRoute;
}

- (void)setOutputDeviceRoute:(id)a3
{
  objc_storeStrong((id *)&self->_outputDeviceRoute, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDeviceRoute, 0);
  objc_storeStrong((id *)&self->_groupRoute, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __87__MPVolumeControllerRouteDataSource__routeWasAddedOrRemovedFromGroupRouteNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "initializeVolume");
}

void __76__MPVolumeControllerRouteDataSource__routeVolumeMutedDidChangeNotification___block_invoke(uint64_t a1, char a2)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __76__MPVolumeControllerRouteDataSource__routeVolumeMutedDidChangeNotification___block_invoke_2;
  v2[3] = &unk_1E3163468;
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

uint64_t __76__MPVolumeControllerRouteDataSource__routeVolumeMutedDidChangeNotification___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMuted:", *(unsigned __int8 *)(a1 + 40));
}

void __90__MPVolumeControllerRouteDataSource__routeVolumeControlCapabilitiesDidChangeNotification___block_invoke(uint64_t a1, int a2)
{
  _QWORD v2[5];
  int v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __90__MPVolumeControllerRouteDataSource__routeVolumeControlCapabilitiesDidChangeNotification___block_invoke_2;
  v2[3] = &unk_1E31632A0;
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

uint64_t __90__MPVolumeControllerRouteDataSource__routeVolumeControlCapabilitiesDidChangeNotification___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVolumeControlCapabilities:", *(unsigned int *)(a1 + 40));
}

void __71__MPVolumeControllerRouteDataSource__routeVolumeDidChangeNotification___block_invoke(uint64_t a1, float a2)
{
  _QWORD v2[5];
  float v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __71__MPVolumeControllerRouteDataSource__routeVolumeDidChangeNotification___block_invoke_2;
  v2[3] = &unk_1E31632A0;
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

uint64_t __71__MPVolumeControllerRouteDataSource__routeVolumeDidChangeNotification___block_invoke_2(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_updateVolume:", a2);
}

uint64_t __66__MPVolumeControllerRouteDataSource_getVolumeValueWithCompletion___block_invoke(uint64_t a1, uint64_t a2, float a3)
{
  NSObject *v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v6 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v9 = 138412546;
      v10 = v7;
      v11 = 2114;
      v12 = a2;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_ERROR, "%@ Error getting output device volume: %{public}@", (uint8_t *)&v9, 0x16u);
    }

  }
  return (*(uint64_t (**)(float))(*(_QWORD *)(a1 + 40) + 16))(a3);
}

uint64_t __66__MPVolumeControllerRouteDataSource_getVolumeValueWithCompletion___block_invoke_49(uint64_t a1, uint64_t a2, float a3)
{
  NSObject *v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v6 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v9 = 138412546;
      v10 = v7;
      v11 = 2114;
      v12 = a2;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_ERROR, "%@ Error getting master volume: %{public}@", (uint8_t *)&v9, 0x16u);
    }

  }
  return (*(uint64_t (**)(float))(*(_QWORD *)(a1 + 40) + 16))(a3);
}

_BYTE *__54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[14])
    return (_BYTE *)objc_msgSend(result, "_updateVolume:");
  return result;
}

_BYTE *__54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_2(uint64_t a1, uint64_t a2)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[15])
    return (_BYTE *)objc_msgSend(result, "_updateVolumeControlCapabilities:", a2);
  return result;
}

_BYTE *__54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_3(uint64_t a1, uint64_t a2)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[16])
    return (_BYTE *)objc_msgSend(result, "_updateMuted:", a2);
  return result;
}

void __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (a3)
  {
    v5 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412546;
      v8 = v6;
      v9 = 2114;
      v10 = a3;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "%@ initializeVolume - Error getting output device volume control capabilities: %{public}@", (uint8_t *)&v7, 0x16u);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_40(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (a2)
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v5;
      v8 = 2114;
      v9 = a2;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "%@ initializeVolume - Error getting output device volume: %{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_42(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (v4)
  {
    v5 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412546;
      v8 = v6;
      v9 = 2114;
      v10 = v4;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "%@ initializeVolume - Error getting output device mute: %{public}@", (uint8_t *)&v7, 0x16u);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (a3)
  {
    v5 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412546;
      v8 = v6;
      v9 = 2114;
      v10 = a3;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "%@ initializeVolume - Error getting group volume control capabilities: %{public}@", (uint8_t *)&v7, 0x16u);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_45(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (a2)
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v5;
      v8 = 2114;
      v9 = a2;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "%@ initializeVolume - Error getting master volume: %{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_46(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (v4)
  {
    v5 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412546;
      v8 = v6;
      v9 = 2114;
      v10 = v4;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "%@ initializeVolume - Error getting output device mute: %{public}@", (uint8_t *)&v7, 0x16u);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __54__MPVolumeControllerRouteDataSource__initializeVolume__block_invoke_47(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)(result + 32) + 17) = 0;
  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 18))
  {
    *(_BYTE *)(v1 + 18) = 0;
    return objc_msgSend(*(id *)(result + 32), "reload");
  }
  return result;
}

void __46__MPVolumeControllerRouteDataSource_setMuted___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v5;
      v8 = 2114;
      v9 = v3;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "%@ Error setting output device mute: %{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
}

void __46__MPVolumeControllerRouteDataSource_setMuted___block_invoke_34(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v5;
      v8 = 2114;
      v9 = v3;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "%@ Error setting mute: %{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
}

void __62__MPVolumeControllerRouteDataSource__setPendingVolumeIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 13) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_setPendingVolumeIfNeeded");
  if (a2)
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v5;
      v8 = 2114;
      v9 = a2;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "%@ Error setting output device volume: %{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
}

void __62__MPVolumeControllerRouteDataSource__setPendingVolumeIfNeeded__block_invoke_32(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 13) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_setPendingVolumeIfNeeded");
  if (a2)
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v5;
      v8 = 2114;
      v9 = a2;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "%@ Error setting group volume: %{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
}

@end
