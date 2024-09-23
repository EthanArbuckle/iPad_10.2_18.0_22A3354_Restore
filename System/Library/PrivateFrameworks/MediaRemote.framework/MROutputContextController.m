@implementation MROutputContextController

void __42__MROutputContextController_outputDevices__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  -[MROutputContextController _onSerialQueue_localOutputDevice](*(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8[1] = 3221225472;
    v8[2] = __42__MROutputContextController_outputDevices__block_invoke_2;
    v8[3] = &unk_1E30C7028;
    v7 = v2;
    v8[0] = MEMORY[0x1E0C809B0];
    v9 = v2;
    objc_msgSend(v3, "msv_map:", v8);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v2 = v7;
  }

}

id __42__MROutputContextController_outputDevices__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "uid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);
  v8 = v4;
  if (v7)
    v8 = *(void **)(a1 + 32);
  v9 = v8;

  return v9;
}

BOOL __61__MROutputContextController__onSerialQueue_localOutputDevice__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deviceType") != 1;
}

- (id)outputDevices
{
  id v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__9;
  v9 = __Block_byref_object_dispose__9;
  -[MRAVOutputContext outputDevices](self->_outputContext, "outputDevices");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (-[MROutputContextController useLocalValues](self, "useLocalValues"))
    msv_dispatch_sync_on_queue();
  v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

- (id)_onSerialQueue_localOutputDevice
{
  uint64_t v2;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[5];
  _QWORD v11[6];

  if (!a1)
  {
    v7 = 0;
    return v7;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 88));
  v2 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__MROutputContextController__onSerialQueue_localOutputDevice__block_invoke;
  v11[3] = &unk_1E30C8A38;
  v11[4] = a1;
  v11[5] = sel__onSerialQueue_localOutputDevice;
  v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x194036C44](v11);
  objc_msgSend(*(id *)(a1 + 48), "outputDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend((id)a1, "isOutputContextEmpty"))
  {
    if (!objc_msgSend((id)a1, "useLocalValues")
      || (objc_msgSend(v4, "msv_firstWhere:", &__block_literal_global_210_0),
          (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v10[0] = v2;
      v10[1] = 3221225472;
      v10[2] = __61__MROutputContextController__onSerialQueue_localOutputDevice__block_invoke_4;
      v10[3] = &unk_1E30C5F68;
      v10[4] = a1;
      objc_msgSend(v4, "msv_firstWhere:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
        goto LABEL_13;
    }
    if (!objc_msgSend((id)a1, "useLocalValues"))
      goto LABEL_13;
LABEL_10:
    ((void (**)(_QWORD, void *))v3)[2](v3, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (!objc_msgSend((id)a1, "isLocalDeviceDesignatedGroupLeader"))
  {
    v7 = 0;
    goto LABEL_13;
  }
  +[MRAVOutputContext sharedSystemAudioContext](MRAVOutputContext, "sharedSystemAudioContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "msv_firstWhere:", &__block_literal_global_209);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_10;
  v8 = 0;
LABEL_11:

  v7 = (void *)v8;
LABEL_13:

  return v7;
}

- (BOOL)useLocalValues
{
  return !-[MROutputContextController useOutputContextValues](self, "useOutputContextValues");
}

- (BOOL)useOutputContextValues
{
  return -[MRAVOutputContext supportsVolumeControl](self->_outputContext, "supportsVolumeControl");
}

- (BOOL)isOutputContextEmpty
{
  void *v2;
  BOOL v3;

  -[MRAVOutputContext outputDevices](self->_outputContext, "outputDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

MRAVDistantOutputDevice *__61__MROutputContextController__onSerialQueue_localOutputDevice__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  MRAVDistantOutputDevice *v8;
  void *v10;

  v3 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("MROutputContextDataSource.m"), 1574, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputDevice"));

  }
  objc_msgSend(v3, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 104) & 2) != 0)
  {
    objc_msgSend(v4, "setIsVolumeControlAvailable:", 1);
    LODWORD(v7) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 100);
    objc_msgSend(v5, "setVolume:", v7);
    objc_msgSend(v5, "setVolumeMuted:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 96));
  }
  else
  {
    objc_msgSend(v4, "setIsVolumeControlAvailable:", 0);
    objc_msgSend(v5, "setHasIsVolumeControlAvailable:", 0);
    LODWORD(v6) = 0;
    objc_msgSend(v5, "setVolume:", v6);
    objc_msgSend(v5, "setHasVolume:", 0);
    objc_msgSend(v5, "setVolumeMuted:", 0);
    objc_msgSend(v5, "setHasVolumeMuted:", 0);
  }
  objc_msgSend(v5, "setVolumeCapabilities:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 104));
  v8 = -[MRAVDistantOutputDevice initWithDescriptor:]([MRAVDistantOutputDevice alloc], "initWithDescriptor:", v5);

  return v8;
}

void __58__MROutputContextController_sharedOutputContextController__block_invoke()
{
  MRSharedOutputContextController *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [MRSharedOutputContextController alloc];
  +[MRAVOutputContext sharedAudioPresentationContext](MRAVOutputContext, "sharedAudioPresentationContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[MROutputContextController initWithOutputContext:](v0, "initWithOutputContext:", v3);
  v2 = (void *)sharedOutputContextController___outputContextController;
  sharedOutputContextController___outputContextController = v1;

}

- (MROutputContextController)initWithOutputContext:(id)a3
{
  id v5;
  MROutputContextController *v6;
  MROutputContextController *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *serialQueue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MROutputContextController;
  v6 = -[MROutputContextController init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputContext, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.MediaRemote.MROutputContextController.serialQueue", v8);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v9;

    -[MROutputContextDataSource setShouldLog:](v7, "setShouldLog:", MRProcessIsMediaRemoteDaemon());
    -[MROutputContextController _inititalizeVolume]((uint64_t)v7);
    -[MROutputContextController _registerNotifications]((uint64_t)v7);
  }

  return v7;
}

- (void)_registerNotifications
{
  id v2;

  if (a1)
  {
    MRMediaRemoteSetWantsVolumeControlNotifications(1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObserver:selector:name:object:", a1, sel__handleLocalDeviceVolumeDidChangeNotification_, CFSTR("kMRMediaRemotePickedRouteVolumeDidChangeNotification"), 0);
    objc_msgSend(v2, "addObserver:selector:name:object:", a1, sel__handleLocalDeviceVolumeControlCapabilitiesDidChangeNotification_, CFSTR("kMRMediaRemotePickedRouteVolumeControlAvailabilityDidChangeNotification"), 0);
    objc_msgSend(v2, "addObserver:selector:name:object:", a1, sel__handleLocalDeviceVolumeMutedDidChangeNotification_, CFSTR("MRMediaRemotePickedRouteVolumeMutedDidChangeNotification"), 0);
    objc_msgSend(v2, "addObserver:selector:name:object:", a1, sel__handleOutputDeviceVolumeDidChangeNotification_, CFSTR("MRAVOutputContextVolumeDidChangeNotification"), *(_QWORD *)(a1 + 48));
    objc_msgSend(v2, "addObserver:selector:name:object:", a1, sel__handleOutputDeviceVolumeControlCapabilitiesDidChangeNotification_, CFSTR("MRAVOutputContextVolumeControlCapabilitiesDidChangeNotification"), *(_QWORD *)(a1 + 48));
    objc_msgSend(v2, "addObserver:selector:name:object:", a1, sel__handleOutputDeviceVolumeMutedDidChangeNotification_, CFSTR("MRAVOutputContextVolumeMutedDidChangeNotification"), *(_QWORD *)(a1 + 48));
    objc_msgSend(v2, "addObserver:selector:name:object:", a1, sel__handleOutputDeviceAddedNotification_, CFSTR("MRAVOutputContextDidAddOutputDeviceNotification"), *(_QWORD *)(a1 + 48));
    objc_msgSend(v2, "addObserver:selector:name:object:", a1, sel__handleOutputDeviceDidChangeNotification_, CFSTR("MRAVOutputContextOutputDeviceDidChangeNotification"), *(_QWORD *)(a1 + 48));
    objc_msgSend(v2, "addObserver:selector:name:object:", a1, sel__handleOutputDeviceRemovedNotification_, CFSTR("MRAVOutputContextDidRemoveOutputDeviceNotification"), *(_QWORD *)(a1 + 48));
    objc_msgSend(v2, "addObserver:selector:name:object:", a1, sel__handleOutputDevicesReloadedNotification_, CFSTR("kMRAVOutputContextDevicesDidChangeNotification"), *(_QWORD *)(a1 + 48));
    objc_msgSend(v2, "addObserver:selector:name:object:", a1, sel__handlePredictedOutputDeviceDidChangeNotification_, CFSTR("kMRAVOutputContextPredictedOutputDeviceDidChangeNotification"), *(_QWORD *)(a1 + 48));

  }
}

- (void)_inititalizeVolume
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3 = *(void **)(a1 + 72);
    *(_QWORD *)(a1 + 72) = v2;

    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = v4;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(*(id *)(a1 + 48), "outputDevices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (objc_msgSend(v11, "isVolumeControlAvailable"))
          {
            objc_msgSend(v11, "uid");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              v13 = *(void **)(a1 + 72);
              v14 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v11, "volume");
              objc_msgSend(v14, "numberWithFloat:");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setObject:forKey:", v15, v12);

              v16 = *(void **)(a1 + 80);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v11, "isVolumeMuted"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setObject:forKey:", v17, v12);

            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v8);
    }

    v18 = *(void **)(a1 + 88);
    v19 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __47__MROutputContextController__inititalizeVolume__block_invoke;
    v27[3] = &unk_1E30C8A80;
    v27[4] = a1;
    MRMediaRemoteGetMediaPlaybackVolume(v18, v27);
    +[MROrigin localOrigin](MROrigin, "localOrigin");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(void **)(a1 + 88);
    v26[0] = v19;
    v26[1] = 3221225472;
    v26[2] = __47__MROutputContextController__inititalizeVolume__block_invoke_213;
    v26[3] = &unk_1E30C8AA8;
    v26[4] = a1;
    MRMediaRemoteGetPickedRoutedVolumeControlCapabilities((uint64_t)v20, v21, v26);

    v22 = *(void **)(a1 + 88);
    v25[0] = v19;
    v25[1] = 3221225472;
    v25[2] = __47__MROutputContextController__inititalizeVolume__block_invoke_215;
    v25[3] = &unk_1E30C8AD0;
    v25[4] = a1;
    MRMediaRemoteGetSystemVolumeMuted(v22, v25);
    v23 = *(NSObject **)(a1 + 88);
    v24[0] = v19;
    v24[1] = 3221225472;
    v24[2] = __47__MROutputContextController__inititalizeVolume__block_invoke_217;
    v24[3] = &unk_1E30C5CA8;
    v24[4] = a1;
    dispatch_async(v23, v24);
  }
}

+ (id)sharedOutputContextController
{
  if (sharedOutputContextController___once != -1)
    dispatch_once(&sharedOutputContextController___once, &__block_literal_global_171);
  return (id)sharedOutputContextController___outputContextController;
}

uint64_t __47__MROutputContextController__inititalizeVolume__block_invoke(uint64_t result, float a2)
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  double v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 65))
  {
    v3 = result;
    _MRLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_opt_class();
      v6 = *(_QWORD *)(v3 + 32);
      v9 = 138543874;
      v10 = v5;
      v11 = 2048;
      v12 = v6;
      v13 = 2048;
      v14 = a2;
      v7 = v5;
      _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Initializing volume with %f", (uint8_t *)&v9, 0x20u);

    }
    *(float *)&v8 = a2;
    return objc_msgSend(*(id *)(v3 + 32), "setLocalVolume:", v8);
  }
  return result;
}

- (void)setLocalVolumeMuted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  const __CFString *v9;
  id v10;
  void *v11;
  _BYTE v12[24];
  const __CFString *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (-[MROutputContextDataSource shouldLog](self, "shouldLog")
    || (+[MRUserSettings currentSettings](MRUserSettings, "currentSettings"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "verboseOutputContextDataSourceLogging"),
        v5,
        v6))
  {
    _MRLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_opt_class();
      v9 = CFSTR("NO");
      *(_DWORD *)v12 = 138543874;
      *(_QWORD *)&v12[4] = v8;
      if (v3)
        v9 = CFSTR("YES");
      *(_WORD *)&v12[12] = 2048;
      *(_QWORD *)&v12[14] = self;
      *(_WORD *)&v12[22] = 2112;
      v13 = v9;
      v10 = v8;
      _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Set localVolumeMuted <%@>", v12, 0x20u);

    }
  }
  else
  {
    _MRLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[MROutputContextController setLocalVolumeMuted:].cold.1();
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (!self->_localVolumeMutedInitialized || self->_localVolumeMuted != v3)
  {
    self->_localVolumeMutedInitialized = 1;
    self->_localVolumeMuted = v3;
    if (-[MROutputContextController useLocalValues](self, "useLocalValues", *(_OWORD *)v12, *(_QWORD *)&v12[16], v13))
    {
      -[MROutputContextController _onSerialQueue_localOutputDevice]((uint64_t)self);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        if ((self->_localVolumeControlCapabilities & 8) != 0)
        {
          -[MROutputContextDataSource notifyVolumeMutedDidChange:outputDevice:](self, self->_localVolumeMuted, v11);
          -[MROutputContextController _onSerialQueue_reevaluateGroupVolumeMuted]((unint64_t)self);
        }
      }

    }
  }
}

- (void)setLocalVolume:(float)a3
{
  void *v5;
  int v6;
  NSObject *v7;
  id v8;
  void *v9;
  _BYTE v10[24];
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (-[MROutputContextDataSource shouldLog](self, "shouldLog")
    || (+[MRUserSettings currentSettings](MRUserSettings, "currentSettings"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "verboseOutputContextDataSourceLogging"),
        v5,
        v6))
  {
    _MRLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v10 = 138543874;
      *(_QWORD *)&v10[4] = objc_opt_class();
      *(_WORD *)&v10[12] = 2048;
      *(_QWORD *)&v10[14] = self;
      *(_WORD *)&v10[22] = 2048;
      v11 = a3;
      v8 = *(id *)&v10[4];
      _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Set localVolume <%f>", v10, 0x20u);

    }
  }
  else
  {
    _MRLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[MROutputContextController setLocalVolume:].cold.1();
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (!self->_localVolumeInitialized || vabds_f32(a3, self->_localVolume) > 0.001)
  {
    self->_localVolumeInitialized = 1;
    self->_localVolume = a3;
    if (-[MROutputContextController useLocalValues](self, "useLocalValues", *(_OWORD *)v10, *(_QWORD *)&v10[16], *(_QWORD *)&v11))
    {
      -[MROutputContextController _onSerialQueue_localOutputDevice]((uint64_t)self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        if ((self->_localVolumeControlCapabilities & 2) != 0)
        {
          -[MROutputContextDataSource notifyVolumeDidChange:outputDevice:](self, v9, self->_localVolume);
          -[MROutputContextController _onSerialQueue_reevaluateGroupVolume]((uint64_t)self);
        }
      }

    }
  }
}

- (void)setLocalVolumeControlCapabilities:(unsigned int)a3
{
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  MROutputContextController *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[MROutputContextDataSource shouldLog](self, "shouldLog")
    || (+[MRUserSettings currentSettings](MRUserSettings, "currentSettings"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "verboseOutputContextDataSourceLogging"),
        v5,
        v6))
  {
    _MRLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_opt_class();
      v9 = v8;
      v10 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(a3);
      v12 = 138543874;
      v13 = v8;
      v14 = 2048;
      v15 = self;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Set localVolumeCapabilities <%@>", (uint8_t *)&v12, 0x20u);

    }
  }
  else
  {
    _MRLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[MROutputContextController setLocalVolumeControlCapabilities:].cold.1();
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (!self->_localVolumeControlCapabilitiesInitialized || self->_localVolumeControlCapabilities != a3)
  {
    self->_localVolumeControlCapabilitiesInitialized = 1;
    self->_localVolumeControlCapabilities = a3;
    if (-[MROutputContextController useLocalValues](self, "useLocalValues"))
    {
      -[MROutputContextController _onSerialQueue_localOutputDevice]((uint64_t)self);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[MROutputContextDataSource notifyVolumeCapabilitiesDidChange:outputDevice:](self, self->_localVolumeControlCapabilities, v11);
        -[MROutputContextController _onSerialQueue_reevaluateGroupVolumeControlCapabilities]((uint64_t)self);
        if ((self->_localVolumeControlCapabilities & 2) != 0 && self->_localVolumeInitialized)
          -[MROutputContextDataSource notifyVolumeDidChange:outputDevice:](self, v11, self->_localVolume);
        -[MROutputContextController _onSerialQueue_reevaluateGroupVolume]((uint64_t)self);
      }

    }
  }
}

- (void)_onSerialQueue_reevaluateGroupVolume
{
  float v2;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 88));
    if ((*(_BYTE *)(a1 + 60) & 2) != 0)
    {
      v2 = -[MROutputContextController _onSerialQueue_calculateMasterVolume](a1);
      if (vabds_f32(v2, *(float *)(a1 + 56)) > 0.001)
      {
        *(float *)(a1 + 56) = v2;
        -[MROutputContextDataSource notifyVolumeDidChange:outputDevice:]((void *)a1, 0, *(float *)(a1 + 56));
      }
    }
  }
}

- (void)_onSerialQueue_reevaluateGroupVolumeControlCapabilities
{
  int v2;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 88));
    v2 = -[MROutputContextController _onSerialQueue_calculateMasterVolumeCapabilities](a1);
    if (v2 != *(_DWORD *)(a1 + 60))
    {
      *(_DWORD *)(a1 + 60) = v2;
      -[MROutputContextDataSource notifyVolumeCapabilitiesDidChange:outputDevice:]((void *)a1, *(unsigned int *)(a1 + 60), 0);
    }
  }
}

- (uint64_t)_onSerialQueue_calculateMasterVolumeCapabilities
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 88));
  if (!objc_msgSend((id)a1, "useOutputContextValues"))
    return *(unsigned int *)(a1 + 104);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 48), "outputDevices", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    LODWORD(v5) = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "volumeCapabilities") | v5;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (float)_onSerialQueue_calculateMasterVolume
{
  float v1;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  float v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = 0.0;
  if (!a1)
    return v1;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 88));
  if (*(_BYTE *)(a1 + 65))
  {
    v3 = *(_DWORD *)(a1 + 104);
    if ((objc_msgSend((id)a1, "useOutputContextValues") & 1) == 0)
    {
      if ((v3 & 2) != 0)
        return *(float *)(a1 + 100);
      return v1;
    }
  }
  else if (!objc_msgSend((id)a1, "useOutputContextValues"))
  {
    return v1;
  }
  if ((*(_BYTE *)(a1 + 60) & 2) != 0)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(*(id *)(a1 + 48), "outputDevices", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if ((objc_msgSend(v9, "volumeCapabilities") & 2) != 0)
          {
            objc_msgSend(v9, "volume");
            if (v10 > v1)
              v1 = v10;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
  return v1;
}

- (void)_onSerialQueue_reevaluateGroupVolumeMuted
{
  int v2;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 88));
    v2 = -[MROutputContextController _onSerialQueue_calculateGroupVolumeMuted](a1);
    if (v2 != *(unsigned __int8 *)(a1 + 64))
    {
      *(_BYTE *)(a1 + 64) = v2;
      -[MROutputContextDataSource notifyVolumeMutedDidChange:outputDevice:]((void *)a1, *(unsigned __int8 *)(a1 + 64), 0);
    }
  }
}

- (unint64_t)_onSerialQueue_calculateGroupVolumeMuted
{
  unint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v1 = a1;
  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 88));
    if (objc_msgSend((id)v1, "useOutputContextValues"))
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      objc_msgSend(*(id *)(v1 + 48), "outputDevices", 0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
      {
        v4 = v3;
        v5 = 0;
        v6 = *(_QWORD *)v11;
        do
        {
          for (i = 0; i != v4; ++i)
          {
            if (*(_QWORD *)v11 != v6)
              objc_enumerationMutation(v2);
            v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
            if (-[MROutputContextController _onSerialQueue_isLocalOutputDevice:](v1, v8))
              v5 = (*(unsigned __int8 *)(v1 + 96) | v5 & 1) != 0;
            else
              v5 |= objc_msgSend(v8, "isVolumeMuted");
          }
          v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v4);
        v1 = v5 & 1;
      }
      else
      {
        v1 = 0;
      }

    }
    else
    {
      return *(unsigned __int8 *)(v1 + 96);
    }
  }
  return v1;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MROutputContextController;
  -[MROutputContextController dealloc](&v4, sel_dealloc);
}

- (id)description
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__9;
  v8 = __Block_byref_object_dispose__9;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __40__MROutputContextController_description__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  int v4;
  uint64_t v5;
  const __CFString *v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_super v12;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v12.receiver = *(id *)(a1 + 32);
  v12.super_class = (Class)MROutputContextController;
  objc_msgSendSuper2(&v12, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "supportsVolumeControl");
  v5 = *(_QWORD *)(a1 + 32);
  if (v4)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v7 = *(float *)(v5 + 100);
  v8 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(*(_DWORD *)(v5 + 104));
  v9 = objc_msgSend(v2, "initWithFormat:", CFSTR("%@ outputContextSupportsVolumeControl = %@ (ignoreThis: localVolume = %lf, local volume capabilities = %@ localVolumeMute = %u)"), v3, v6, *(_QWORD *)&v7, v8, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 96));
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

- (id)debugDescription
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__9;
  v8 = __Block_byref_object_dispose__9;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __45__MROutputContextController_debugDescription__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  const __CFString *v6;
  int v7;
  uint64_t v8;
  const __CFString *v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  objc_super v18;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v18.receiver = *(id *)(a1 + 32);
  v18.super_class = (Class)MROutputContextController;
  objc_msgSendSuper2(&v18, sel_debugDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD **)(a1 + 32);
  v5 = v4[14];
  if (objc_msgSend(v4, "isLocalDeviceDesignatedGroupLeader"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "supportsVolumeControl");
  v8 = *(_QWORD *)(a1 + 32);
  if (v7)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v10 = *(float *)(v8 + 100);
  v11 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(*(_DWORD *)(v8 + 104));
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(unsigned __int8 *)(v12 + 96);
  objc_msgSend(*(id *)(v12 + 48), "mr_formattedDebugDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v2, "initWithFormat:", CFSTR("%@\n  designatedGroupLeader = %@\n  isLocalDeviceDesignatedGroupLeader = %@\n  outputContextSupportsVolumeControl = %@\n  AVSystemController.localVolume = %lf\n  AVSystemController.volumeCapabilities = %@\n  AVSystemController.localVolumeMute = %u\n  OutputContext = %@\n"), v3, v5, v6, v9, *(_QWORD *)&v10, v11, v13, v14);
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

}

- (void)setDesignatedGroupLeaderWhenContextEmpty:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__MROutputContextController_setDesignatedGroupLeaderWhenContextEmpty___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

void __70__MROutputContextController_setDesignatedGroupLeaderWhenContextEmpty___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), *(id *)(a1 + 40));
}

- (float)volume
{
  float v2;
  uint64_t v4;
  float *v5;
  uint64_t v6;
  int v7;

  v4 = 0;
  v5 = (float *)&v4;
  v6 = 0x2020000000;
  v7 = 0;
  msv_dispatch_sync_on_queue();
  v2 = v5[6];
  _Block_object_dispose(&v4, 8);
  return v2;
}

float __35__MROutputContextController_volume__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 32) + 56);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unsigned)volumeControlCapabilities
{
  unsigned int v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  int v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  msv_dispatch_sync_on_queue();
  v2 = *((_DWORD *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __54__MROutputContextController_volumeControlCapabilities__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 60);
  return result;
}

- (id)uniqueIdentifier
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__9;
  v8 = __Block_byref_object_dispose__9;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __45__MROutputContextController_uniqueIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "uniqueIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (float)volumeForOutputDeviceUID:(id)a3 error:(id *)a4
{
  id v5;
  float v6;
  uint64_t v8;
  float *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__9;
  v16 = __Block_byref_object_dispose__9;
  v17 = 0;
  v8 = 0;
  v9 = (float *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  v5 = a3;
  msv_dispatch_sync_on_queue();
  if (a4)
    *a4 = objc_retainAutorelease((id)v13[5]);
  v6 = v9[6];

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);

  return v6;
}

void __60__MROutputContextController_volumeForOutputDeviceUID_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t Error;
  uint64_t v15;
  void *v16;
  id v17;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    objc_msgSend((id)v2, "outputDeviceForUID:");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 40);
    v17 = (id)v4;
    if (v4)
    {
      v6 = objc_msgSend(v5, "useOutputContextValues");
      v7 = *(_QWORD *)(a1 + 40);
      if (v6)
      {
        if ((*(_BYTE *)(v7 + 60) & 2) == 0)
        {
          v8 = 36;
LABEL_19:
          Error = MRMediaRemoteCreateError(v8);
          v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v16 = *(void **)(v15 + 40);
          *(_QWORD *)(v15 + 40) = Error;

          goto LABEL_20;
        }
        if (!objc_msgSend(v17, "isVolumeControlAvailable"))
        {
          v8 = 37;
          goto LABEL_19;
        }
        objc_msgSend(v17, "volume");
      }
      else
      {
        v12 = *(_DWORD *)(v7 + 100);
      }
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    }
    else
    {
      if (!objc_msgSend(v5, "isOutputContextEmpty")
        || !objc_msgSend(*(id *)(a1 + 40), "isLocalDeviceDesignatedGroupLeader"))
      {
        v8 = 39;
        goto LABEL_19;
      }
      v12 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 100);
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    }
    *(_DWORD *)(v13 + 24) = v12;
LABEL_20:

    return;
  }
  if ((*(_BYTE *)(v2 + 60) & 2) != 0)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_DWORD *)(v2 + 56);
  }
  else
  {
    v9 = MRMediaRemoteCreateError(36);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

- (unsigned)volumeControlCapabilitiesForOutputDeviceUID:(id)a3 error:(id *)a4
{
  id v5;
  unsigned int v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__9;
  v16 = __Block_byref_object_dispose__9;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v5 = a3;
  msv_dispatch_sync_on_queue();
  if (a4)
    *a4 = objc_retainAutorelease((id)v13[5]);
  v6 = *((_DWORD *)v9 + 6);

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);

  return v6;
}

void __79__MROutputContextController_volumeControlCapabilitiesForOutputDeviceUID_error___block_invoke(uint64_t a1)
{
  _DWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t Error;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_DWORD **)(a1 + 40);
  if (!v3)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2[15];
    return;
  }
  objc_msgSend(v2, "outputDeviceForUID:");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v9 = (id)v4;
  if (!v4)
  {
    if (!objc_msgSend(v5, "isOutputContextEmpty")
      || !objc_msgSend(*(id *)(a1 + 40), "isLocalDeviceDesignatedGroupLeader"))
    {
      Error = MRMediaRemoteCreateError(39);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = Error;

      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (!objc_msgSend(v5, "useOutputContextValues"))
  {
LABEL_8:
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 104);
    goto LABEL_10;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v9, "volumeCapabilities");
LABEL_10:

}

- (BOOL)volumeMutedForOutputDevice:(id)a3 error:(id *)a4
{
  id v5;
  char v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__9;
  v16 = __Block_byref_object_dispose__9;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v5 = a3;
  msv_dispatch_sync_on_queue();
  if (a4)
    *a4 = objc_retainAutorelease((id)v13[5]);
  v6 = *((_BYTE *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);

  return v6;
}

void __62__MROutputContextController_volumeMutedForOutputDevice_error___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t Error;
  uint64_t v15;
  void *v16;
  id v17;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_BYTE **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "outputDeviceForUID:");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 40);
    v17 = (id)v4;
    if (v4)
    {
      v6 = objc_msgSend(v5, "useOutputContextValues");
      v7 = *(_QWORD *)(a1 + 40);
      if (v6)
      {
        if ((*(_BYTE *)(v7 + 60) & 8) != 0)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v17, "isVolumeMuted");
          goto LABEL_17;
        }
        v8 = 36;
        goto LABEL_15;
      }
      v12 = *(_BYTE *)(v7 + 96);
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    }
    else
    {
      if (!objc_msgSend(v5, "isOutputContextEmpty")
        || !objc_msgSend(*(id *)(a1 + 40), "isLocalDeviceDesignatedGroupLeader"))
      {
        v8 = 39;
LABEL_15:
        Error = MRMediaRemoteCreateError(v8);
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v16 = *(void **)(v15 + 40);
        *(_QWORD *)(v15 + 40) = Error;

        goto LABEL_17;
      }
      v12 = *(_BYTE *)(*(_QWORD *)(a1 + 40) + 96);
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    }
    *(_BYTE *)(v13 + 24) = v12;
LABEL_17:

    return;
  }
  if ((v2[60] & 8) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2[96];
  }
  else
  {
    v9 = MRMediaRemoteCreateError(36);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

- (id)setVolume:(float)a3 outputDeviceUID:(id)a4 details:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  __CFString *v14;
  NSObject *v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  const __CFString *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__9;
  v39 = __Block_byref_object_dispose__9;
  v40 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@:%p-%@ -> %lf"), objc_opt_class(), self, v8, a3);
  v12 = objc_alloc(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v9, "requestID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (__CFString *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@<%@>"), CFSTR("outputContextController.setOutputDeviceVolume"), v13);

  if (v11)
    -[__CFString appendFormat:](v14, "appendFormat:", CFSTR(" for %@"), v11);
  _MRLogForCategory(0xAuLL);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v42 = v14;
    _os_log_impl(&dword_193827000, v15, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v16 = v8;
  v17 = v9;
  msv_dispatch_sync_on_queue();
  if (v36[5])
  {
    if (v11)
    {
      _MRLogForCategory(0xAuLL);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v17, "requestID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)v36[5];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSinceDate:", v10);
        *(_DWORD *)buf = 138544386;
        v42 = CFSTR("outputContextController.setOutputDeviceVolume");
        v43 = 2114;
        v44 = v33;
        v45 = 2114;
        v46 = v19;
        v47 = 2114;
        v48 = v11;
        v49 = 2048;
        v50 = v21;
        _os_log_error_impl(&dword_193827000, v18, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);

      }
    }
    else
    {
      _MRLogForCategory(0xAuLL);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v17, "requestID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)v36[5];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "timeIntervalSinceDate:", v10);
        *(_DWORD *)buf = 138544130;
        v42 = CFSTR("outputContextController.setOutputDeviceVolume");
        v43 = 2114;
        v44 = v34;
        v45 = 2114;
        v46 = v25;
        v47 = 2048;
        v48 = v27;
        _os_log_error_impl(&dword_193827000, v18, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", buf, 0x2Au);

      }
    }
  }
  else if (v11)
  {
    _MRLogForCategory(0xAuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v17, "requestID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "timeIntervalSinceDate:", v10);
      *(_DWORD *)buf = 138544130;
      v42 = CFSTR("outputContextController.setOutputDeviceVolume");
      v43 = 2114;
      v44 = v22;
      v45 = 2114;
      v46 = v11;
      v47 = 2048;
      v48 = v24;
      _os_log_impl(&dword_193827000, v18, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds", buf, 0x2Au);

    }
  }
  else
  {
    _MRLogForCategory(0xAuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v17, "requestID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "timeIntervalSinceDate:", v10);
      *(_DWORD *)buf = 138543874;
      v42 = CFSTR("outputContextController.setOutputDeviceVolume");
      v43 = 2114;
      v44 = v28;
      v45 = 2048;
      v46 = v30;
      _os_log_impl(&dword_193827000, v18, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);

    }
  }

  v31 = (id)v36[5];
  _Block_object_dispose(&v35, 8);

  return v31;
}

void __63__MROutputContextController_setVolume_outputDeviceUID_details___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  float v12;
  uint64_t v13;
  uint64_t Error;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "outputDeviceForUID:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 40);
    if (v4)
    {
      if (objc_msgSend(v5, "useOutputContextValues"))
      {
        if (objc_msgSend(v4, "isVolumeControlAvailable"))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            LODWORD(v6) = *(_DWORD *)(a1 + 72);
            objc_msgSend(v4, "setVolume:details:", *(_QWORD *)(a1 + 48), v6);
          }
          else
          {
            v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("OutputContext claims supportsVolumeControl for local device: %@ %@"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), v4);
            _MRLogForCategory(0xAuLL);
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v19 = *(_QWORD *)(a1 + 56);
              objc_msgSend(*(id *)(a1 + 48), "requestID");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v22 = v19;
              v23 = 2114;
              v24 = v20;
              v25 = 2112;
              v26 = v17;
              _os_log_impl(&dword_193827000, v18, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);

            }
          }
          goto LABEL_19;
        }
        v13 = 37;
        goto LABEL_18;
      }
      v12 = *(float *)(a1 + 72);
    }
    else
    {
      if (!objc_msgSend(v5, "isOutputContextEmpty")
        || !objc_msgSend(*(id *)(a1 + 40), "isLocalDeviceDesignatedGroupLeader"))
      {
        v13 = 39;
LABEL_18:
        Error = MRMediaRemoteCreateError(v13);
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v16 = *(void **)(v15 + 40);
        *(_QWORD *)(v15 + 40) = Error;

        goto LABEL_19;
      }
      v12 = *(float *)(a1 + 72);
    }
    MRMediaRemoteSetMediaPlaybackVolume(0, 0, 0, v12);
LABEL_19:

    return;
  }
  if (objc_msgSend(v2, "useOutputContextValues"))
  {
    v8 = *(_QWORD *)(a1 + 40);
    if ((*(_BYTE *)(v8 + 60) & 2) != 0)
    {
      LODWORD(v7) = *(_DWORD *)(a1 + 72);
      objc_msgSend(*(id *)(v8 + 48), "setVolume:details:", *(_QWORD *)(a1 + 48), v7);
    }
    else
    {
      v9 = MRMediaRemoteCreateError(36);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
  }
  else
  {
    MRMediaRemoteSetMediaPlaybackVolume(0, 0, 0, *(float *)(a1 + 72));
  }
}

- (id)adjustVolume:(int64_t)a3 outputDeviceUID:(id)a4 details:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  __CFString *v17;
  NSObject *v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[4];
  const __CFString *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__9;
  v42 = __Block_byref_object_dispose__9;
  v43 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  v12 = objc_opt_class();
  MRMediaRemoteVolumeControlAdjustmentDescription(a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%@:%p-%@ -> %@"), v12, self, v8, v13);

  v15 = objc_alloc(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v9, "requestID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (__CFString *)objc_msgSend(v15, "initWithFormat:", CFSTR("%@<%@>"), CFSTR("outputContextController.adjustOutputDeviceVolume"), v16);

  if (v14)
    -[__CFString appendFormat:](v17, "appendFormat:", CFSTR(" for %@"), v14);
  _MRLogForCategory(0xAuLL);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v45 = v17;
    _os_log_impl(&dword_193827000, v18, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v19 = v8;
  v20 = v9;
  msv_dispatch_sync_on_queue();
  if (v39[5])
  {
    if (v14)
    {
      _MRLogForCategory(0xAuLL);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v20, "requestID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)v39[5];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "timeIntervalSinceDate:", v10);
        *(_DWORD *)buf = 138544386;
        v45 = CFSTR("outputContextController.adjustOutputDeviceVolume");
        v46 = 2114;
        v47 = v36;
        v48 = 2114;
        v49 = v22;
        v50 = 2114;
        v51 = v14;
        v52 = 2048;
        v53 = v24;
        _os_log_error_impl(&dword_193827000, v21, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);

      }
    }
    else
    {
      _MRLogForCategory(0xAuLL);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v20, "requestID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)v39[5];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "timeIntervalSinceDate:", v10);
        *(_DWORD *)buf = 138544130;
        v45 = CFSTR("outputContextController.adjustOutputDeviceVolume");
        v46 = 2114;
        v47 = v37;
        v48 = 2114;
        v49 = v28;
        v50 = 2048;
        v51 = v30;
        _os_log_error_impl(&dword_193827000, v21, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", buf, 0x2Au);

      }
    }
  }
  else if (v14)
  {
    _MRLogForCategory(0xAuLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v20, "requestID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "timeIntervalSinceDate:", v10);
      *(_DWORD *)buf = 138544130;
      v45 = CFSTR("outputContextController.adjustOutputDeviceVolume");
      v46 = 2114;
      v47 = v25;
      v48 = 2114;
      v49 = v14;
      v50 = 2048;
      v51 = v27;
      _os_log_impl(&dword_193827000, v21, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds", buf, 0x2Au);

    }
  }
  else
  {
    _MRLogForCategory(0xAuLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v20, "requestID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "timeIntervalSinceDate:", v10);
      *(_DWORD *)buf = 138543874;
      v45 = CFSTR("outputContextController.adjustOutputDeviceVolume");
      v46 = 2114;
      v47 = v31;
      v48 = 2048;
      v49 = v33;
      _os_log_impl(&dword_193827000, v21, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);

    }
  }

  v34 = (id)v39[5];
  _Block_object_dispose(&v38, 8);

  return v34;
}

void __66__MROutputContextController_adjustVolume_outputDeviceUID_details___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t Error;
  uint64_t v13;
  void *v14;
  id v15;

  v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3)
  {
    objc_msgSend(v2, "outputDeviceForUID:");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)a1[5];
    v15 = (id)v4;
    if (v4)
    {
      if (objc_msgSend(v5, "useOutputContextValues"))
      {
        v6 = a1[5];
        if ((*(_BYTE *)(v6 + 60) & 4) == 0)
        {
          v7 = 36;
          goto LABEL_14;
        }
        if (!-[MROutputContextController _onSerialQueue_isLocalOutputDevice:](v6, v15))
        {
          objc_msgSend(v15, "adjustVolume:details:", a1[8], a1[6]);
          goto LABEL_19;
        }
        if ((*(_BYTE *)(a1[5] + 104) & 4) == 0)
        {
          v7 = 37;
          goto LABEL_14;
        }
      }
      MRMediaRemoteAdjustMediaPlaybackVolumeWithAdjustment(a1[8], 0, 0, 0);
      goto LABEL_19;
    }
    if (objc_msgSend(v5, "isOutputContextEmpty")
      && objc_msgSend((id)a1[5], "isLocalDeviceDesignatedGroupLeader"))
    {
      MRMediaRemoteAdjustMediaPlaybackVolume(0, 0, 0, (float)(uint64_t)a1[8]);
LABEL_19:

      return;
    }
    v7 = 39;
LABEL_14:
    Error = MRMediaRemoteCreateError(v7);
    v13 = *(_QWORD *)(a1[7] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = Error;

    goto LABEL_19;
  }
  if (objc_msgSend(v2, "useOutputContextValues"))
  {
    v8 = a1[5];
    if ((*(_BYTE *)(v8 + 60) & 4) != 0)
    {
      objc_msgSend(*(id *)(v8 + 48), "adjustVolume:details:", a1[8], a1[6]);
    }
    else
    {
      v9 = MRMediaRemoteCreateError(36);
      v10 = *(_QWORD *)(a1[7] + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
  }
  else
  {
    MRMediaRemoteAdjustMediaPlaybackVolumeWithAdjustment(a1[8], 0, 0, 0);
  }
}

- (unint64_t)_onSerialQueue_isLocalOutputDevice:(unint64_t)a1
{
  id v3;

  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 88));
    if (!objc_msgSend((id)a1, "useOutputContextValues")
      || objc_msgSend(v3, "deviceType") == 4 && objc_msgSend(v3, "deviceSubtype") == 1)
    {
      a1 = 1;
    }
    else
    {
      a1 = objc_msgSend(v3, "deviceType") == 5 && objc_msgSend(v3, "deviceSubtype") == 8;
    }
  }

  return a1;
}

- (id)muteVolume:(BOOL)a3 outputDeviceUID:(id)a4 details:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  __CFString *v14;
  NSObject *v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  const __CFString *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v6 = a3;
  v51 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__9;
  v39 = __Block_byref_object_dispose__9;
  v40 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@:%p-%@ -> %u"), objc_opt_class(), self, v8, v6);
  v12 = objc_alloc(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v9, "requestID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (__CFString *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@<%@>"), CFSTR("outputContextController.muteOutputDeviceVolume"), v13);

  if (v11)
    -[__CFString appendFormat:](v14, "appendFormat:", CFSTR(" for %@"), v11);
  _MRLogForCategory(0xAuLL);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v42 = v14;
    _os_log_impl(&dword_193827000, v15, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v16 = v8;
  v17 = v9;
  msv_dispatch_sync_on_queue();
  if (v36[5])
  {
    if (v11)
    {
      _MRLogForCategory(0xAuLL);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v17, "requestID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)v36[5];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSinceDate:", v10);
        *(_DWORD *)buf = 138544386;
        v42 = CFSTR("outputContextController.muteOutputDeviceVolume");
        v43 = 2114;
        v44 = v33;
        v45 = 2114;
        v46 = v19;
        v47 = 2114;
        v48 = v11;
        v49 = 2048;
        v50 = v21;
        _os_log_error_impl(&dword_193827000, v18, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);

      }
    }
    else
    {
      _MRLogForCategory(0xAuLL);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v17, "requestID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)v36[5];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "timeIntervalSinceDate:", v10);
        *(_DWORD *)buf = 138544130;
        v42 = CFSTR("outputContextController.muteOutputDeviceVolume");
        v43 = 2114;
        v44 = v34;
        v45 = 2114;
        v46 = v25;
        v47 = 2048;
        v48 = v27;
        _os_log_error_impl(&dword_193827000, v18, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", buf, 0x2Au);

      }
    }
  }
  else if (v11)
  {
    _MRLogForCategory(0xAuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v17, "requestID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "timeIntervalSinceDate:", v10);
      *(_DWORD *)buf = 138544130;
      v42 = CFSTR("outputContextController.muteOutputDeviceVolume");
      v43 = 2114;
      v44 = v22;
      v45 = 2114;
      v46 = v11;
      v47 = 2048;
      v48 = v24;
      _os_log_impl(&dword_193827000, v18, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds", buf, 0x2Au);

    }
  }
  else
  {
    _MRLogForCategory(0xAuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v17, "requestID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "timeIntervalSinceDate:", v10);
      *(_DWORD *)buf = 138543874;
      v42 = CFSTR("outputContextController.muteOutputDeviceVolume");
      v43 = 2114;
      v44 = v28;
      v45 = 2048;
      v46 = v30;
      _os_log_impl(&dword_193827000, v18, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);

    }
  }

  v31 = (id)v36[5];
  _Block_object_dispose(&v35, 8);

  return v31;
}

void __64__MROutputContextController_muteVolume_outputDeviceUID_details___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t Error;
  uint64_t v13;
  void *v14;
  id v15;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "outputDeviceForUID:");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 40);
    v15 = (id)v4;
    if (v4)
    {
      if (objc_msgSend(v5, "useOutputContextValues"))
      {
        v6 = *(_QWORD *)(a1 + 40);
        if ((*(_BYTE *)(v6 + 60) & 8) == 0)
        {
          v7 = 36;
LABEL_12:
          Error = MRMediaRemoteCreateError(v7);
          v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v14 = *(void **)(v13 + 40);
          *(_QWORD *)(v13 + 40) = Error;

LABEL_18:
          return;
        }
        if (!-[MROutputContextController _onSerialQueue_isLocalOutputDevice:](v6, v15))
        {
          objc_msgSend(v15, "setVolumeMuted:details:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));
          goto LABEL_18;
        }
        if ((*(_BYTE *)(*(_QWORD *)(a1 + 40) + 104) & 8) == 0)
        {
          v7 = 37;
          goto LABEL_12;
        }
      }
    }
    else if (!objc_msgSend(v5, "isOutputContextEmpty")
           || !objc_msgSend(*(id *)(a1 + 40), "isLocalDeviceDesignatedGroupLeader"))
    {
      v7 = 39;
      goto LABEL_12;
    }
    MRMediaRemoteMuteSystemVolume(*(unsigned __int8 *)(a1 + 64), 0, 0);
    goto LABEL_18;
  }
  if (objc_msgSend(v2, "useOutputContextValues"))
  {
    v8 = *(_QWORD *)(a1 + 40);
    if ((*(_BYTE *)(v8 + 60) & 8) != 0)
    {
      objc_msgSend(*(id *)(v8 + 48), "setVolumeMuted:details:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));
    }
    else
    {
      v9 = MRMediaRemoteCreateError(36);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
  }
  else
  {
    MRMediaRemoteMuteSystemVolume(*(unsigned __int8 *)(a1 + 64), 0, 0);
  }
}

- (void)_handleLocalDeviceVolumeDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  NSObject *serialQueue;
  id v7;
  _QWORD block[5];
  id v9;

  v7 = a3;
  objc_msgSend(v7, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOriginUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isLocal"))
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__MROutputContextController__handleLocalDeviceVolumeDidChangeNotification___block_invoke;
    block[3] = &unk_1E30C5F40;
    block[4] = self;
    v9 = v7;
    dispatch_sync(serialQueue, block);

  }
}

void __75__MROutputContextController__handleLocalDeviceVolumeDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kMRMediaRemotePickedRouteVolumeUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  objc_msgSend(*(id *)(a1 + 32), "setLocalVolume:");

}

- (void)_handleLocalDeviceVolumeControlCapabilitiesDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  NSObject *serialQueue;
  id v7;
  _QWORD block[5];
  id v9;

  v7 = a3;
  objc_msgSend(v7, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOriginUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isLocal"))
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __94__MROutputContextController__handleLocalDeviceVolumeControlCapabilitiesDidChangeNotification___block_invoke;
    block[3] = &unk_1E30C5F40;
    block[4] = self;
    v9 = v7;
    dispatch_sync(serialQueue, block);

  }
}

void __94__MROutputContextController__handleLocalDeviceVolumeControlCapabilitiesDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kMRMediaRemotePickedRouteVolumeControlCapabilitiesUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLocalVolumeControlCapabilities:", objc_msgSend(v2, "intValue"));

}

- (void)_handleLocalDeviceVolumeMutedDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  NSObject *serialQueue;
  id v7;
  _QWORD block[5];
  id v9;

  v7 = a3;
  objc_msgSend(v7, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOriginUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isLocal"))
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__MROutputContextController__handleLocalDeviceVolumeMutedDidChangeNotification___block_invoke;
    block[3] = &unk_1E30C5F40;
    block[4] = self;
    v9 = v7;
    dispatch_sync(serialQueue, block);

  }
}

void __80__MROutputContextController__handleLocalDeviceVolumeMutedDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_MRMediaRemotePickedRouteIsMutedUserInfoKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLocalVolumeMuted:", objc_msgSend(v2, "BOOLValue"));

}

- (void)_handleOutputDeviceVolumeControlCapabilitiesDidChangeNotification:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  MROutputContextController *v9;

  v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __95__MROutputContextController__handleOutputDeviceVolumeControlCapabilitiesDidChangeNotification___block_invoke;
  v7[3] = &unk_1E30C5F40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

void __95__MROutputContextController__handleOutputDeviceVolumeControlCapabilitiesDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  float v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  float v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("MRAVOutputContextOutputDeviceUserInfoKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MRAVOutputContextVolumeControlCapabilitiesUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  if (v3)
  {
    -[MROutputContextDataSource notifyVolumeCapabilitiesDidChange:outputDevice:](*(void **)(a1 + 40), v6, v3);
    if ((v6 & 2) != 0)
    {
      v7 = *(void **)(a1 + 40);
      objc_msgSend(v3, "volume");
      -[MROutputContextDataSource notifyVolumeDidChange:outputDevice:](v7, v3, v8);
    }
    if ((v6 & 8) != 0)
      -[MROutputContextDataSource notifyVolumeMutedDidChange:outputDevice:](*(void **)(a1 + 40), objc_msgSend(v3, "isVolumeMuted"), v3);
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "outputDevices", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          -[MROutputContextDataSource notifyVolumeCapabilitiesDidChange:outputDevice:](*(void **)(a1 + 40), objc_msgSend(v14, "volumeCapabilities"), v14);
          if ((objc_msgSend(v14, "volumeCapabilities") & 2) != 0)
          {
            v15 = *(void **)(a1 + 40);
            objc_msgSend(v14, "volume");
            -[MROutputContextDataSource notifyVolumeDidChange:outputDevice:](v15, v14, v16);
          }
          if ((objc_msgSend(v14, "volumeCapabilities") & 8) != 0)
            -[MROutputContextDataSource notifyVolumeMutedDidChange:outputDevice:](*(void **)(a1 + 40), objc_msgSend(v14, "isVolumeMuted"), v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

  }
  -[MROutputContextController _onSerialQueue_reevaluateGroupVolumeControlCapabilities](*(_QWORD *)(a1 + 40));
  v17 = *(_QWORD *)(a1 + 40);
  if ((*(_BYTE *)(v17 + 60) & 2) != 0)
  {
    -[MROutputContextController _onSerialQueue_reevaluateGroupVolume](v17);
    -[MROutputContextController _onSerialQueue_reevaluateGroupVolumeMuted](*(_QWORD *)(a1 + 40));
  }

}

- (void)_handleOutputDeviceVolumeDidChangeNotification:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[4];
  id v8;
  MROutputContextController *v9;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__MROutputContextController__handleOutputDeviceVolumeDidChangeNotification___block_invoke;
  block[3] = &unk_1E30C5F40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

void __76__MROutputContextController__handleOutputDeviceVolumeDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  float v5;
  float v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("MRAVOutputContextOutputDeviceUserInfoKey"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MRAVOutputContextVolumeUserInfoKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  objc_msgSend(v14, "uid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v10 = v9;

    v11 = vabds_f32(v10, v6);
    if (v11 <= 0.001)
      goto LABEL_7;
    v12 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
    *(float *)&v11 = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v13, v7);

  }
  else if (vabds_f32(-1.0, v6) <= 0.001)
  {
    goto LABEL_7;
  }
  if ((objc_msgSend(v14, "volumeCapabilities") & 2) != 0)
  {
    -[MROutputContextDataSource notifyVolumeDidChange:outputDevice:](*(void **)(a1 + 40), v14, v6);
    -[MROutputContextController _onSerialQueue_reevaluateGroupVolume](*(_QWORD *)(a1 + 40));
  }
LABEL_7:

}

- (void)_handleOutputDeviceVolumeMutedDidChangeNotification:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[4];
  id v8;
  MROutputContextController *v9;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__MROutputContextController__handleOutputDeviceVolumeMutedDidChangeNotification___block_invoke;
  block[3] = &unk_1E30C5F40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

void __81__MROutputContextController__handleOutputDeviceVolumeMutedDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("MRAVOutputContextOutputDeviceUserInfoKey"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MRAVOutputContextVolumeMutedUserInfoKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(v11, "uid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if ((_DWORD)v5 == v8)
      goto LABEL_7;
    v9 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, v6);

  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_7;
  }
  if ((objc_msgSend(v11, "volumeCapabilities") & 8) != 0)
  {
    -[MROutputContextDataSource notifyVolumeMutedDidChange:outputDevice:](*(void **)(a1 + 40), v5, v11);
    -[MROutputContextController _onSerialQueue_reevaluateGroupVolumeMuted](*(_QWORD *)(a1 + 40));
  }
LABEL_7:

}

- (void)_handleOutputDeviceAddedNotification:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[4];
  id v8;
  MROutputContextController *v9;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MROutputContextController__handleOutputDeviceAddedNotification___block_invoke;
  block[3] = &unk_1E30C5F40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

void __66__MROutputContextController__handleOutputDeviceAddedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("MRAVOutputContextOutputDeviceUserInfoKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "uid");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "volume");
    objc_msgSend(v5, "numberWithFloat:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, v14);

    v7 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isVolumeMuted"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v14);

  }
  objc_msgSend(*(id *)(a1 + 40), "outputDevices", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mr_allOutputDevices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __66__MROutputContextController__handleOutputDeviceAddedNotification___block_invoke_2;
  v16[3] = &unk_1E30C5F68;
  v17 = v3;
  v11 = v3;
  objc_msgSend(v10, "msv_firstWhere:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = v12;
  else
    v13 = v11;
  -[MROutputContextDataSource notifyOutputDeviceAdded:](*(void **)(a1 + 40), v13);
  -[MROutputContextController _onSerialQueue_reevaluateGroupVolumeControlCapabilities](*(_QWORD *)(a1 + 40));
  -[MROutputContextController _onSerialQueue_reevaluateGroupVolume](*(_QWORD *)(a1 + 40));

}

uint64_t __66__MROutputContextController__handleOutputDeviceAddedNotification___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualFuzzy:", *(_QWORD *)(a1 + 32));
}

- (void)_handleOutputDeviceDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MRAVOutputContextOutputDeviceUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MROutputContextController outputDevices](self, "outputDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mr_allOutputDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__MROutputContextController__handleOutputDeviceDidChangeNotification___block_invoke;
  v11[3] = &unk_1E30C5F68;
  v12 = v5;
  v10 = v5;
  objc_msgSend(v7, "msv_firstWhere:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = v8;
  else
    v9 = v10;
  -[MROutputContextDataSource notifyOutputDeviceChanged:](self, v9);

}

uint64_t __70__MROutputContextController__handleOutputDeviceDidChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualFuzzy:", *(_QWORD *)(a1 + 32));
}

- (void)_handleOutputDeviceRemovedNotification:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[4];
  id v8;
  MROutputContextController *v9;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__MROutputContextController__handleOutputDeviceRemovedNotification___block_invoke;
  block[3] = &unk_1E30C5F40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

void __68__MROutputContextController__handleOutputDeviceRemovedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("MRAVOutputContextOutputDeviceUserInfoKey"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "uid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "removeObjectForKey:", v3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "removeObjectForKey:", v3);
  }
  -[MROutputContextDataSource notifyOutputDeviceRemoved:](*(void **)(a1 + 40), v4);
  -[MROutputContextController _onSerialQueue_reevaluateGroupVolume](*(_QWORD *)(a1 + 40));
  -[MROutputContextController _onSerialQueue_reevaluateGroupVolumeControlCapabilities](*(_QWORD *)(a1 + 40));

}

- (void)_handlePredictedOutputDeviceDidChangeNotification:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v5, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MRAVOutputContextOutputDeviceUserInfoKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("MROutputContextDataSourceOutputDeviceUserInfoKey"));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__MROutputContextController__handlePredictedOutputDeviceDidChangeNotification___block_invoke;
  v10[3] = &unk_1E30C5F40;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __79__MROutputContextController__handlePredictedOutputDeviceDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("MROutputContextDataSourceDidChangePredictedOutputDeviceNotification"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (BOOL)isLocalDeviceDesignatedGroupLeader
{
  MRAVOutputDevice *designatedGroupLeaderWhenContextEmpty;

  designatedGroupLeaderWhenContextEmpty = self->_designatedGroupLeaderWhenContextEmpty;
  return !designatedGroupLeaderWhenContextEmpty
      || -[MRAVOutputDevice isLocalDevice](designatedGroupLeaderWhenContextEmpty, "isLocalDevice");
}

uint64_t __61__MROutputContextController__onSerialQueue_localOutputDevice__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isLocalDevice");
}

unint64_t __61__MROutputContextController__onSerialQueue_localOutputDevice__block_invoke_4(uint64_t a1, void *a2)
{
  return -[MROutputContextController _onSerialQueue_isLocalOutputDevice:](*(_QWORD *)(a1 + 32), a2);
}

uint64_t __47__MROutputContextController__inititalizeVolume__block_invoke_213(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 66))
  {
    v3 = result;
    _MRLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_opt_class();
      v6 = *(_QWORD *)(v3 + 32);
      v7 = v5;
      v8 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(a2);
      v9 = 138543874;
      v10 = v5;
      v11 = 2048;
      v12 = v6;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Initializing volumeCapabilities with %@", (uint8_t *)&v9, 0x20u);

    }
    return objc_msgSend(*(id *)(v3 + 32), "setLocalVolumeControlCapabilities:", a2);
  }
  return result;
}

uint64_t __47__MROutputContextController__inititalizeVolume__block_invoke_215(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  id v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 96))
  {
    v3 = result;
    _MRLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_opt_class();
      v6 = *(_QWORD *)(v3 + 32);
      v7 = CFSTR("NO");
      v9 = 138543874;
      v10 = v5;
      if ((_DWORD)a2)
        v7 = CFSTR("YES");
      v11 = 2048;
      v12 = v6;
      v13 = 2112;
      v14 = v7;
      v8 = v5;
      _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Initializing volumeMuted with %@", (uint8_t *)&v9, 0x20u);

    }
    return objc_msgSend(*(id *)(v3 + 32), "setLocalVolumeMuted:", a2);
  }
  return result;
}

void __47__MROutputContextController__inititalizeVolume__block_invoke_217(uint64_t a1)
{
  -[MROutputContextController _onSerialQueue_reevaluateGroupVolumeControlCapabilities](*(_QWORD *)(a1 + 32));
  -[MROutputContextController _onSerialQueue_reevaluateGroupVolume](*(_QWORD *)(a1 + 32));
  -[MROutputContextController _onSerialQueue_reevaluateGroupVolumeMuted](*(_QWORD *)(a1 + 32));
}

- (MRAVOutputDevice)designatedGroupLeaderWhenContextEmpty
{
  return self->_designatedGroupLeaderWhenContextEmpty;
}

- (float)localVolume
{
  return self->_localVolume;
}

- (unsigned)localVolumeControlCapabilities
{
  return self->_localVolumeControlCapabilities;
}

- (BOOL)localVolumeMuted
{
  return self->_localVolumeMuted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_designatedGroupLeaderWhenContextEmpty, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_outputDeviceVolumeMuted, 0);
  objc_storeStrong((id *)&self->_outputDeviceVolume, 0);
  objc_storeStrong((id *)&self->_outputContext, 0);
}

- (void)setLocalVolume:.cold.1()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = (id)OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_5(&dword_193827000, v1, v2, "<%{public}@: %p> Set localVolume <%f>", v3, v4, v5, v6, 2u);

}

- (void)setLocalVolumeControlCapabilities:.cold.1()
{
  int v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  OUTLINED_FUNCTION_4();
  v1 = (void *)OUTLINED_FUNCTION_11();
  v2 = OUTLINED_FUNCTION_5_1(v1);
  v9 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(v0);
  OUTLINED_FUNCTION_0_5(&dword_193827000, v3, v4, "<%{public}@: %p> Set localVolumeCapabilities <%@>", v5, v6, v7, v8, 2u);

}

- (void)setLocalVolumeMuted:.cold.1()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4();
  v0 = (id)OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_5(&dword_193827000, v1, v2, "<%{public}@: %p> Set localVolumeMuted <%@>", v3, v4, v5, v6, 2u);

}

@end
