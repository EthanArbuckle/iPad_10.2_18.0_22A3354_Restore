@implementation MROutputContextDataSource

- (void)setShouldLog:(BOOL)a3
{
  self->_shouldLog = a3;
}

void __76__MROutputContextDataSource_notifyVolumeCapabilitiesDidChange_outputDevice___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("MROutputContextDataSourceOutputDeviceDidChangeVolumeControlCapabilitiesNotification"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)notifyVolumeCapabilitiesDidChange:(void *)a3 outputDevice:
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  const __CFString *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!a1)
    goto LABEL_20;
  v6 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(a2);
  v7 = objc_msgSend(a1, "shouldLog");
  if (v5)
  {
    if ((v7 & 1) == 0)
    {
      +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "verboseOutputContextDataSourceLogging");

      if (!v9)
      {
        _MRLogForCategory(0);
        v10 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          goto LABEL_17;
        v18 = (void *)objc_opt_class();
        v12 = v18;
        objc_msgSend(v5, "debugName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "uniqueIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v29 = v18;
        v30 = 2048;
        v31 = a1;
        v32 = 2114;
        v33 = v13;
        v34 = 2114;
        v35 = v6;
        v36 = 2112;
        v37 = v14;
        _os_log_debug_impl(&dword_193827000, v10, OS_LOG_TYPE_DEBUG, "<%{public}@: %p> Observed outputDevice volumeCapabilities changed <%{public}@> to <%{public}@> in <%@>", buf, 0x34u);
        goto LABEL_7;
      }
    }
    _MRLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_opt_class();
      v12 = v11;
      objc_msgSend(v5, "debugName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "uniqueIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v29 = v11;
      v30 = 2048;
      v31 = a1;
      v32 = 2114;
      v33 = v13;
      v34 = 2114;
      v35 = v6;
      v36 = 2112;
      v37 = v14;
      _os_log_impl(&dword_193827000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Observed outputDevice volumeCapabilities changed <%{public}@> to <%{public}@> in <%@>", buf, 0x34u);
LABEL_7:

LABEL_12:
    }
  }
  else
  {
    if ((v7 & 1) == 0)
    {
      +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "verboseOutputContextDataSourceLogging");

      if (!v16)
      {
        _MRLogForCategory(0);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[MROutputContextDataSource notifyVolumeCapabilitiesDidChange:outputDevice:].cold.1();
        goto LABEL_17;
      }
    }
    _MRLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_opt_class();
      v12 = v17;
      objc_msgSend(a1, "uniqueIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v29 = v17;
      v30 = 2048;
      v31 = a1;
      v32 = 2114;
      v33 = v13;
      v34 = 2114;
      v35 = v6;
      _os_log_impl(&dword_193827000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Observed endpoint volumeCapabilities changed <%{public}@> to <%{public}@>", buf, 0x2Au);
      goto LABEL_12;
    }
  }
LABEL_17:

  v26 = CFSTR("MROutputContextDataSourceVolumeCapabilitiesUserInfoKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  if (v5)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v5, CFSTR("MROutputContextDataSourceOutputDeviceUserInfoKey"));
  objc_msgSend(a1, "notificationQueue");
  v22 = objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __76__MROutputContextDataSource_notifyVolumeCapabilitiesDidChange_outputDevice___block_invoke;
  v24[3] = &unk_1E30C5F40;
  v24[4] = a1;
  v25 = v21;
  v23 = v21;
  dispatch_async(v22, v24);

LABEL_20:
}

- (BOOL)shouldLog
{
  return self->_shouldLog;
}

- (OS_dispatch_queue)notificationQueue
{
  MROutputContextDataSource *v2;
  OS_dispatch_queue *notificationQueue;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *v5;

  v2 = self;
  objc_sync_enter(v2);
  notificationQueue = v2->_notificationQueue;
  if (notificationQueue)
  {
    v4 = notificationQueue;
  }
  else
  {
    objc_opt_class();
    +[MROutputContextDataSource _notificationSerialQueue]();
    v4 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  objc_sync_exit(v2);

  return v5;
}

+ (id)_notificationSerialQueue
{
  objc_opt_self();
  if (_notificationSerialQueue___once_0 != -1)
    dispatch_once(&_notificationSerialQueue___once_0, &__block_literal_global_31);
  return (id)_notificationSerialQueue___notificationSerialQueue_0;
}

- (void)notifyVolumeDidChange:(float)a3 outputDevice:
{
  id v5;
  char v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  const __CFString *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  double v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_20;
  v6 = objc_msgSend(a1, "shouldLog");
  if (v5)
  {
    if ((v6 & 1) == 0)
    {
      +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "verboseOutputContextDataSourceLogging");

      if (!v8)
      {
        _MRLogForCategory(0);
        v9 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          goto LABEL_17;
        v17 = (void *)objc_opt_class();
        v11 = v17;
        objc_msgSend(v5, "debugName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "uniqueIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v29 = v17;
        v30 = 2048;
        v31 = a1;
        v32 = 2114;
        v33 = v12;
        v34 = 2048;
        v35 = a3;
        v36 = 2114;
        v37 = v13;
        _os_log_debug_impl(&dword_193827000, v9, OS_LOG_TYPE_DEBUG, "<%{public}@: %p> Observed outputDevice volume changed <%{public}@> to <%f> in <%{public}@>", buf, 0x34u);
        goto LABEL_7;
      }
    }
    _MRLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_opt_class();
      v11 = v10;
      objc_msgSend(v5, "debugName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "uniqueIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v29 = v10;
      v30 = 2048;
      v31 = a1;
      v32 = 2114;
      v33 = v12;
      v34 = 2048;
      v35 = a3;
      v36 = 2114;
      v37 = v13;
      _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Observed outputDevice volume changed <%{public}@> to <%f> in <%{public}@>", buf, 0x34u);
LABEL_7:

LABEL_12:
    }
  }
  else
  {
    if ((v6 & 1) == 0)
    {
      +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "verboseOutputContextDataSourceLogging");

      if (!v15)
      {
        _MRLogForCategory(0);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          -[MROutputContextDataSource notifyVolumeDidChange:outputDevice:].cold.1(a1);
        goto LABEL_17;
      }
    }
    _MRLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_opt_class();
      v11 = v16;
      objc_msgSend(a1, "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v29 = v16;
      v30 = 2048;
      v31 = a1;
      v32 = 2114;
      v33 = v12;
      v34 = 2048;
      v35 = a3;
      _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Observed endpoint volume changed <%{public}@> to <%f>", buf, 0x2Au);
      goto LABEL_12;
    }
  }
LABEL_17:

  v26 = CFSTR("MROutputContextDataSourceVolumeUserInfoKey");
  *(float *)&v18 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  if (v5)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v5, CFSTR("MROutputContextDataSourceOutputDeviceUserInfoKey"));
  objc_msgSend(a1, "notificationQueue");
  v22 = objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __64__MROutputContextDataSource_notifyVolumeDidChange_outputDevice___block_invoke;
  v24[3] = &unk_1E30C5F40;
  v24[4] = a1;
  v25 = v21;
  v23 = v21;
  dispatch_async(v22, v24);

LABEL_20:
}

void __64__MROutputContextDataSource_notifyVolumeDidChange_outputDevice___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("MROutputContextDataSourceOutputDeviceDidChangeVolumeNotification"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __53__MROutputContextDataSource__notificationSerialQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.MediaRemote.MROutputContextDataSource.NotificationQueue", v2);
  v1 = (void *)_notificationSerialQueue___notificationSerialQueue_0;
  _notificationSerialQueue___notificationSerialQueue_0 = (uint64_t)v0;

}

- (id)descriptionForOutputDevice:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  id v12;
  void *v13;
  float v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __CFString *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    objc_msgSend(v3, "clusterComposition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v3, "clusterComposition");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "mr_map:", &__block_literal_global_31);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR(","));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR(" (%@)"), v10);
      v11 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = &stru_1E30D5AF8;
    }
    v12 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v3, "debugName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "volume");
    v15 = v14;
    v16 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(objc_msgSend(v3, "volumeCapabilities"));
    v25 = (__CFString *)v11;
    v17 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@%@, volume = %lf, volume capabilities = %@"), v13, v11, *(_QWORD *)&v15, v16);

    objc_msgSend(v4, "appendString:", v17);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v3, "activatedClusterMembersOutputDevices");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v27;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v18);
          -[MROutputContextDataSource descriptionForOutputDevice:](a1, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v22));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendFormat:", CFSTR("\n  %@"), v23);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v20);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __56__MROutputContextDataSource_descriptionForOutputDevice___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uid");
}

- (id)description
{
  id v3;
  void *v4;
  const __CFString *v5;
  float v6;
  double v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MROutputContextDataSource uniqueIdentifier](self, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MROutputContextDataSource isAirPlaying](self, "isAirPlaying"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  -[MROutputContextDataSource volume](self, "volume");
  v7 = v6;
  if (-[MROutputContextDataSource isVolumeMuted](self, "isVolumeMuted"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(-[MROutputContextDataSource volumeControlCapabilities](self, "volumeControlCapabilities"));
  -[MROutputContextDataSource outputDevices](self, "outputDevices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __40__MROutputContextDataSource_description__block_invoke;
  v15[3] = &unk_1E30C7028;
  v15[4] = self;
  objc_msgSend(v10, "msv_map:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromArray(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%p> %@\n  isAirPlaying = %@\n  volume = %f\n  volumeMuted = %@\n  volumeCapabilities = %@\n  outputDevices = %@\n"), self, v4, v5, *(_QWORD *)&v7, v8, v9, v12);

  return v13;
}

id __40__MROutputContextDataSource_description__block_invoke(uint64_t a1, void *a2)
{
  return -[MROutputContextDataSource descriptionForOutputDevice:](*(_QWORD *)(a1 + 32), a2);
}

- (id)debugDescription
{
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  float v7;
  double v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[MROutputContextDataSource uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MROutputContextDataSource isAirPlaying](self, "isAirPlaying"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[MROutputContextDataSource volume](self, "volume");
  v8 = v7;
  if (-[MROutputContextDataSource isVolumeMuted](self, "isVolumeMuted"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v10 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(-[MROutputContextDataSource volumeControlCapabilities](self, "volumeControlCapabilities"));
  -[MROutputContextDataSource outputDevices](self, "outputDevices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "msv_map:", &__block_literal_global_47);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromArray(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@:%p> %@\n  isAirPlaying = %@\n  volume = %f\n  volumeMuted = %@\n  volumeCapabilities = %@\n  outputDevices = %@\n"), v4, self, v5, v6, *(_QWORD *)&v8, v9, v10, v13);

  return v14;
}

uint64_t __45__MROutputContextDataSource_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "descriptor");
}

- (BOOL)isAirPlaying
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
  -[MROutputContextDataSource outputDevices](self, "outputDevices", 0);
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
        if (objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "deviceType") == 1)
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

- (void)setNotificationQueue:(id)a3
{
  OS_dispatch_queue *v4;
  OS_dispatch_queue *notificationQueue;
  MROutputContextDataSource *obj;

  v4 = (OS_dispatch_queue *)a3;
  obj = self;
  objc_sync_enter(obj);
  notificationQueue = obj->_notificationQueue;
  obj->_notificationQueue = v4;

  objc_sync_exit(obj);
}

- (id)outputDeviceForUID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[MROutputContextDataSource outputDevices](self, "outputDevices", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "effectiveOutputDeviceForUID:", v4);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (float)volumeForOutputDeviceUID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *Error;
  float v10;
  float v11;
  float v12;

  v6 = a3;
  if (v6)
  {
    -[MROutputContextDataSource outputDeviceForUID:](self, "outputDeviceForUID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "volumeCapabilities") & 2) != 0)
    {
      objc_msgSend(v7, "volume");
      v10 = v11;
      Error = 0;
    }
    else
    {
      if (v7)
        v8 = 37;
      else
        v8 = 39;
      Error = (void *)MRMediaRemoteCreateError(v8);
      v10 = 0.0;
    }

  }
  else if ((-[MROutputContextDataSource volumeControlCapabilities](self, "volumeControlCapabilities") & 2) != 0)
  {
    -[MROutputContextDataSource volume](self, "volume");
    v10 = v12;
    Error = 0;
  }
  else
  {
    Error = (void *)MRMediaRemoteCreateError(36);
    v10 = 0.0;
  }
  if (a4)
    *a4 = objc_retainAutorelease(Error);

  return v10;
}

- (unsigned)volumeControlCapabilitiesForOutputDeviceUID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *Error;

  v6 = a3;
  if (!v6)
  {
    v9 = -[MROutputContextDataSource volumeControlCapabilities](self, "volumeControlCapabilities");
    Error = 0;
    if (!a4)
      goto LABEL_9;
    goto LABEL_8;
  }
  -[MROutputContextDataSource outputDeviceForUID:](self, "outputDeviceForUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "volumeCapabilities");
    Error = 0;
  }
  else
  {
    Error = (void *)MRMediaRemoteCreateError(39);
    v9 = 0;
  }

  if (a4)
LABEL_8:
    *a4 = objc_retainAutorelease(Error);
LABEL_9:

  return v9;
}

- (BOOL)volumeMutedForOutputDeviceID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  void *Error;

  v6 = a3;
  if (v6)
  {
    -[MROutputContextDataSource outputDeviceForUID:](self, "outputDeviceForUID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "volumeCapabilities") & 8) != 0)
    {
      v8 = 0;
    }
    else
    {
      if (!v7)
      {
        Error = (void *)MRMediaRemoteCreateError(39);
        v8 = 0;
        goto LABEL_11;
      }
      v8 = objc_msgSend(v7, "isVolumeMuted");
    }
    Error = 0;
LABEL_11:

    goto LABEL_12;
  }
  if ((-[MROutputContextDataSource volumeControlCapabilities](self, "volumeControlCapabilities") & 8) != 0)
  {
    v8 = -[MROutputContextDataSource isVolumeMuted](self, "isVolumeMuted");
    Error = 0;
  }
  else
  {
    Error = (void *)MRMediaRemoteCreateError(36);
    v8 = 0;
  }
LABEL_12:
  if (a4)
    *a4 = objc_retainAutorelease(Error);

  return v8;
}

- (void)notifyOutputDeviceAdded:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  _QWORD block[4];
  id v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", sel_notifyOutputDeviceAdded_, a1, CFSTR("MROutputContextDataSource.m"), 244, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputDevice"));

    }
    if ((objc_msgSend(a1, "shouldLog") & 1) != 0
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
        objc_msgSend(v4, "debugName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "uniqueIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v23 = v8;
        v24 = 2048;
        v25 = a1;
        v26 = 2114;
        v27 = v10;
        v28 = 2114;
        v29 = v11;
        _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Observed outputDevice added <%{public}@> to <%{public}@>", buf, 0x2Au);

      }
    }
    else
    {
      _MRLogForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[MROutputContextDataSource notifyOutputDeviceAdded:].cold.2();
    }

    if ((objc_msgSend(a1, "shouldLog") & 1) != 0
      || (+[MRUserSettings currentSettings](MRUserSettings, "currentSettings"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "verboseOutputContextDataSourceLogging"),
          v12,
          v13))
    {
      _MRLogForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v23 = v15;
        v24 = 2048;
        v25 = a1;
        v26 = 2114;
        v27 = a1;
        v16 = v15;
        _os_log_impl(&dword_193827000, v14, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Existing State: %{public}@", buf, 0x20u);

      }
    }
    else
    {
      _MRLogForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[MROutputContextDataSource notifyOutputDeviceAdded:].cold.1();
    }

    objc_msgSend(a1, "notificationQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__MROutputContextDataSource_notifyOutputDeviceAdded___block_invoke;
    block[3] = &unk_1E30C5F40;
    v20 = v4;
    v21 = a1;
    dispatch_async(v17, block);

  }
}

void __53__MROutputContextDataSource_notifyOutputDeviceAdded___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v5 = CFSTR("MROutputContextDataSourceOutputDeviceUserInfoKey");
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("MROutputContextDataSourceDidAddOutputDeviceNotification"), *(_QWORD *)(a1 + 40), v3);

}

- (void)notifyOutputDeviceChanged:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  _QWORD block[4];
  id v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", sel_notifyOutputDeviceChanged_, a1, CFSTR("MROutputContextDataSource.m"), 259, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputDevice"));

    }
    if ((objc_msgSend(a1, "shouldLog") & 1) != 0
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
        objc_msgSend(v4, "debugName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "uniqueIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v23 = v8;
        v24 = 2048;
        v25 = a1;
        v26 = 2114;
        v27 = v10;
        v28 = 2114;
        v29 = v11;
        _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Observed outputDevice changed <%{public}@> on <%{public}@>", buf, 0x2Au);

      }
    }
    else
    {
      _MRLogForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[MROutputContextDataSource notifyOutputDeviceChanged:].cold.2();
    }

    if ((objc_msgSend(a1, "shouldLog") & 1) != 0
      || (+[MRUserSettings currentSettings](MRUserSettings, "currentSettings"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "verboseOutputContextDataSourceLogging"),
          v12,
          v13))
    {
      _MRLogForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v23 = v15;
        v24 = 2048;
        v25 = a1;
        v26 = 2114;
        v27 = a1;
        v16 = v15;
        _os_log_impl(&dword_193827000, v14, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Existing State: %{public}@", buf, 0x20u);

      }
    }
    else
    {
      _MRLogForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[MROutputContextDataSource notifyOutputDeviceAdded:].cold.1();
    }

    objc_msgSend(a1, "notificationQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__MROutputContextDataSource_notifyOutputDeviceChanged___block_invoke;
    block[3] = &unk_1E30C5F40;
    v20 = v4;
    v21 = a1;
    dispatch_async(v17, block);

  }
}

void __55__MROutputContextDataSource_notifyOutputDeviceChanged___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v5 = CFSTR("MROutputContextDataSourceOutputDeviceUserInfoKey");
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("MROutputContextDataSourceDidChangeOutputDeviceNotification"), *(_QWORD *)(a1 + 40), v3);

}

- (void)notifyOutputDeviceRemoved:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  _QWORD block[4];
  id v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", sel_notifyOutputDeviceRemoved_, a1, CFSTR("MROutputContextDataSource.m"), 274, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputDevice"));

    }
    if ((objc_msgSend(a1, "shouldLog") & 1) != 0
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
        objc_msgSend(v4, "debugName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "uniqueIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v23 = v8;
        v24 = 2048;
        v25 = a1;
        v26 = 2114;
        v27 = v10;
        v28 = 2114;
        v29 = v11;
        _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Observed outputDevice removed <%{public}@> from <%{public}@>", buf, 0x2Au);

      }
    }
    else
    {
      _MRLogForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[MROutputContextDataSource notifyOutputDeviceRemoved:].cold.2();
    }

    if ((objc_msgSend(a1, "shouldLog") & 1) != 0
      || (+[MRUserSettings currentSettings](MRUserSettings, "currentSettings"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "verboseOutputContextDataSourceLogging"),
          v12,
          v13))
    {
      _MRLogForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v23 = v15;
        v24 = 2048;
        v25 = a1;
        v26 = 2114;
        v27 = a1;
        v16 = v15;
        _os_log_impl(&dword_193827000, v14, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Existing State: %{public}@", buf, 0x20u);

      }
    }
    else
    {
      _MRLogForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[MROutputContextDataSource notifyOutputDeviceAdded:].cold.1();
    }

    objc_msgSend(a1, "notificationQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__MROutputContextDataSource_notifyOutputDeviceRemoved___block_invoke;
    block[3] = &unk_1E30C5F40;
    v20 = v4;
    v21 = a1;
    dispatch_async(v17, block);

  }
}

void __55__MROutputContextDataSource_notifyOutputDeviceRemoved___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v5 = CFSTR("MROutputContextDataSourceOutputDeviceUserInfoKey");
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("MROutputContextDataSourceDidRemoveOutputDeviceNotification"), *(_QWORD *)(a1 + 40), v3);

}

- (void)notifyDataSourceReloaded
{
  NSObject *v2;
  _QWORD block[5];

  if (a1)
  {
    objc_msgSend(a1, "notificationQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__MROutputContextDataSource_notifyDataSourceReloaded__block_invoke;
    block[3] = &unk_1E30C5CA8;
    block[4] = a1;
    dispatch_async(v2, block);

  }
}

void __53__MROutputContextDataSource_notifyDataSourceReloaded__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("MROutputContextDataSourceDidReloadNotification"), *(_QWORD *)(a1 + 32), 0);

}

- (void)notifyVolumeMutedDidChange:(void *)a3 outputDevice:
{
  id v5;
  char v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  _QWORD v29[5];
  id v30;
  const __CFString *v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!a1)
    goto LABEL_27;
  v6 = objc_msgSend(a1, "shouldLog");
  if (!v5)
  {
    if ((v6 & 1) != 0
      || (+[MRUserSettings currentSettings](MRUserSettings, "currentSettings"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "verboseOutputContextDataSourceLogging"),
          v15,
          v16))
    {
      _MRLogForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (void *)objc_opt_class();
        v18 = v17;
        objc_msgSend(a1, "uniqueIdentifier");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v19;
        v21 = CFSTR("NO");
        *(_DWORD *)buf = 138544130;
        v34 = v17;
        v35 = 2048;
        if ((_DWORD)a2)
          v21 = CFSTR("YES");
        v36 = a1;
        v37 = 2114;
        v38 = v19;
        v39 = 2112;
        v40 = v21;
        _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Observed endpoint volumeMuted changed <%{public}@> to <%@>", buf, 0x2Au);

      }
    }
    else
    {
      _MRLogForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[MROutputContextDataSource notifyVolumeMutedDidChange:outputDevice:].cold.1();
    }
    goto LABEL_24;
  }
  if ((v6 & 1) == 0)
  {
    +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "verboseOutputContextDataSourceLogging");

    if (!v8)
    {
      _MRLogForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        goto LABEL_24;
      v22 = (void *)objc_opt_class();
      v11 = v22;
      objc_msgSend(v5, "debugName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((_DWORD)a2)
        v23 = CFSTR("YES");
      else
        v23 = CFSTR("NO");
      objc_msgSend(a1, "uniqueIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v34 = v22;
      v35 = 2048;
      v36 = a1;
      v37 = 2114;
      v38 = (uint64_t)v12;
      v39 = 2112;
      v40 = v23;
      v41 = 2114;
      v42 = v14;
      _os_log_debug_impl(&dword_193827000, v9, OS_LOG_TYPE_DEBUG, "<%{public}@: %p> Observed outputDevice volumeMuted changed <%{public}@> to <%@> in <%{public}@>", buf, 0x34u);
      goto LABEL_10;
    }
  }
  _MRLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class();
    v11 = v10;
    objc_msgSend(v5, "debugName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)a2)
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    objc_msgSend(a1, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v34 = v10;
    v35 = 2048;
    v36 = a1;
    v37 = 2114;
    v38 = (uint64_t)v12;
    v39 = 2112;
    v40 = v13;
    v41 = 2114;
    v42 = v14;
    _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Observed outputDevice volumeMuted changed <%{public}@> to <%@> in <%{public}@>", buf, 0x34u);
LABEL_10:

  }
LABEL_24:

  v31 = CFSTR("MROutputContextDataSourceVolumeMutedUserInfoKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "mutableCopy");

  if (v5)
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v5, CFSTR("MROutputContextDataSourceOutputDeviceUserInfoKey"));
  objc_msgSend(a1, "notificationQueue");
  v27 = objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __69__MROutputContextDataSource_notifyVolumeMutedDidChange_outputDevice___block_invoke;
  v29[3] = &unk_1E30C5F40;
  v29[4] = a1;
  v30 = v26;
  v28 = v26;
  dispatch_async(v27, v29);

LABEL_27:
}

void __69__MROutputContextDataSource_notifyVolumeMutedDidChange_outputDevice___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("MROutputContextDataSourceOutputDeviceDidChangeVolumeMutedNotification"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (float)volume
{
  return self->_volume;
}

- (unsigned)volumeControlCapabilities
{
  return self->_volumeControlCapabilities;
}

- (BOOL)isVolumeMuted
{
  return self->_volumeMuted;
}

- (NSArray)outputDevices
{
  return self->_outputDevices;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_outputDevices, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

- (void)notifyOutputDeviceAdded:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_10(*MEMORY[0x1E0C80C00]);
  v1 = OUTLINED_FUNCTION_3_2(v0);
  OUTLINED_FUNCTION_0_5(&dword_193827000, v2, v3, "<%{public}@: %p> Existing State: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8_0();
}

- (void)notifyOutputDeviceAdded:.cold.2()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_4();
  v2 = (void *)OUTLINED_FUNCTION_6_1();
  v3 = OUTLINED_FUNCTION_5_1(v2);
  objc_msgSend(v0, "debugName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3(&dword_193827000, v6, v7, "<%{public}@: %p> Observed outputDevice added <%{public}@> to <%{public}@>", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_0();
}

- (void)notifyOutputDeviceChanged:.cold.2()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_4();
  v2 = (void *)OUTLINED_FUNCTION_6_1();
  v3 = OUTLINED_FUNCTION_5_1(v2);
  objc_msgSend(v0, "debugName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3(&dword_193827000, v6, v7, "<%{public}@: %p> Observed outputDevice changed <%{public}@> on <%{public}@>", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_0();
}

- (void)notifyOutputDeviceRemoved:.cold.2()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_4();
  v2 = (void *)OUTLINED_FUNCTION_6_1();
  v3 = OUTLINED_FUNCTION_5_1(v2);
  objc_msgSend(v0, "debugName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3(&dword_193827000, v6, v7, "<%{public}@: %p> Observed outputDevice removed <%{public}@> from <%{public}@>", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_0();
}

- (void)notifyVolumeDidChange:(void *)a1 outputDevice:.cold.1(void *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = (id)OUTLINED_FUNCTION_6_1();
  objc_msgSend(a1, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3(&dword_193827000, v3, v4, "<%{public}@: %p> Observed endpoint volume changed <%{public}@> to <%f>", v5, v6, v7, v8, 2u);

}

- (void)notifyVolumeCapabilitiesDidChange:outputDevice:.cold.1()
{
  void *v0;
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
  v1 = (void *)OUTLINED_FUNCTION_6_1();
  v2 = OUTLINED_FUNCTION_5_1(v1);
  objc_msgSend(v0, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3(&dword_193827000, v3, v4, "<%{public}@: %p> Observed endpoint volumeCapabilities changed <%{public}@> to <%{public}@>", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_0();
}

- (void)notifyVolumeMutedDidChange:outputDevice:.cold.1()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_4();
  v1 = (void *)OUTLINED_FUNCTION_6_1();
  v2 = OUTLINED_FUNCTION_5_1(v1);
  objc_msgSend(v0, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3(&dword_193827000, v4, v5, "<%{public}@: %p> Observed endpoint volumeMuted changed <%{public}@> to <%@>", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_0();
}

@end
