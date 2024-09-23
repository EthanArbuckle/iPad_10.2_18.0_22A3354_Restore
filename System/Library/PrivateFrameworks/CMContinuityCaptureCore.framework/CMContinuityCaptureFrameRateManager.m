@implementation CMContinuityCaptureFrameRateManager

- (CMContinuityCaptureFrameRateManager)init
{
  CMContinuityCaptureFrameRateManager *v2;
  CMContinuityCaptureFrameRateManager *v3;
  CMContinuityCaptureFrameRateManager *v4;
  uint64_t v5;
  NSHashTable *activeStreamingDevices;
  uint64_t v7;
  NSMapTable *allowedFrameRateRangeForDevice;
  uint64_t v9;
  NSMapTable *clientRequestedFrameRateRangeForDevice;
  void *v11;
  void *v12;
  CMContinuityCaptureFrameRateManager *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CMContinuityCaptureFrameRateManager;
  v2 = -[CMContinuityCaptureFrameRateManager init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    objc_sync_enter(v4);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    activeStreamingDevices = v4->_activeStreamingDevices;
    v4->_activeStreamingDevices = (NSHashTable *)v5;

    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    allowedFrameRateRangeForDevice = v4->_allowedFrameRateRangeForDevice;
    v4->_allowedFrameRateRangeForDevice = (NSMapTable *)v7;

    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    clientRequestedFrameRateRangeForDevice = v4->_clientRequestedFrameRateRangeForDevice;
    v4->_clientRequestedFrameRateRangeForDevice = (NSMapTable *)v9;

    +[CMContinuityCaptureThermalMonitor sharedInstance](CMContinuityCaptureThermalMonitor, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:forKeyPath:options:context:", v4, CFSTR("thermalLevel"), 3, 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v4, sel_lowPowerModeChanged_, *MEMORY[0x24BDD1160], 0);

    v4->_currentThermalLevel = 1;
    objc_sync_exit(v4);

    v13 = v4;
  }

  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[CMContinuityCaptureThermalMonitor sharedInstance](CMContinuityCaptureThermalMonitor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("thermalLevel"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDD1160], 0);

  v5.receiver = self;
  v5.super_class = (Class)CMContinuityCaptureFrameRateManager;
  -[CMContinuityCaptureFrameRateManager dealloc](&v5, sel_dealloc);
}

- (BOOL)throttled
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_throttled);
  return v2 & 1;
}

- (id)allowedFrameRateRangeForDevice:(id)a3
{
  id v4;
  CMContinuityCaptureFrameRateManager *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMapTable objectForKey:](v5->_allowedFrameRateRangeForDevice, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  CMContinuityCaptureFrameRateManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  CMContinuityCaptureFrameRateManager *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = self;
  objc_sync_enter(v12);
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("thermalLevel")))
  {
    CMContinuityCaptureLog(2);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v12;
      v18 = 2112;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_227C5D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Evaluate FPS Throttle due to change in thermal level(%@ -> %@)", (uint8_t *)&v16, 0x20u);

    }
    -[CMContinuityCaptureFrameRateManager updateAllowedFPS](v12, "updateAllowedFPS");
  }
  objc_sync_exit(v12);

}

- (void)lowPowerModeChanged:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v9;
  CMContinuityCaptureFrameRateManager *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD1160]);

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isLowPowerModeEnabled");

    CMContinuityCaptureLog(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543618;
      v10 = self;
      v11 = 1024;
      v12 = v7;
      _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Device PowerState has changed - lowPowerModeEnabled(%d)", (uint8_t *)&v9, 0x12u);
    }

    -[CMContinuityCaptureFrameRateManager updateAllowedFPS](self, "updateAllowedFPS");
  }
}

- (id)throttledFrameRateByThermalLevelAndLowPowerMode
{
  void *v3;
  int v4;
  void *v5;
  unint64_t v6;
  unint64_t currentThermalLevel;
  void *v8;
  unint64_t v9;
  BOOL v10;
  int v11;
  void *v12;
  NSObject *v13;
  int v15;
  CMContinuityCaptureFrameRateManager *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLowPowerModeEnabled");

  +[CMContinuityCaptureThermalMonitor sharedInstance](CMContinuityCaptureThermalMonitor, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "thermalLevel");
  currentThermalLevel = self->_currentThermalLevel;

  if (v6 > currentThermalLevel)
  {
    +[CMContinuityCaptureThermalMonitor sharedInstance](CMContinuityCaptureThermalMonitor, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_currentThermalLevel = objc_msgSend(v8, "thermalLevel");

  }
  v9 = self->_currentThermalLevel;
  v10 = v9 > 3;
  if (v9 == 3)
    v11 = 1;
  else
    v11 = v4;
  if (v10)
    v11 = 2;
  if (v11 == 1)
  {
    v12 = &unk_24F07FA80;
  }
  else
  {
    if (v11 != 2)
      return 0;
    v12 = &unk_24F07FA98;
  }
  CMContinuityCaptureLog(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543874;
    v16 = self;
    v17 = 1024;
    v18 = v4;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_227C5D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Throttle Reason: Thermal/LPM (%d). Throttled frame rate: %@", (uint8_t *)&v15, 0x1Cu);
  }

  return v12;
}

- (id)throttledFrameRateByActiveStreamingEntities
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSHashTable *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  CMContinuityCaptureFrameRateManager *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  CMContinuityCaptureFrameRateManager *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v3 = self->_activeStreamingDevices;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v4)
  {
    v5 = v4;
    v25 = self;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v32;
    v9 = *MEMORY[0x24BDB1A58];
    v26 = *MEMORY[0x24BDB1A68];
    v27 = *MEMORY[0x24BDB1A58];
    do
    {
      v10 = 0;
      v30 = v5;
      do
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v10);
        objc_msgSend(v11, "activeConfiguration");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "entity");

        if (v13 == 2)
        {
          v6 = 1;
        }
        else
        {
          objc_msgSend(v11, "activeConfiguration");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "entity") == 1)
          {
            objc_msgSend(v11, "videoDevice");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "deviceType");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v16, "isEqualToString:", v9))
            {
              objc_msgSend(v11, "companionDevice");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "videoDevice");
              v28 = v7;
              v29 = v6;
              v18 = v3;
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "deviceType");
              v20 = v8;
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "isEqualToString:", v26);

              v8 = v20;
              v3 = v18;
              v7 = v28;
              v6 = v29;

              v9 = v27;
            }
            else
            {
              v22 = 0;
            }

            v5 = v30;
          }
          else
          {
            v22 = 0;
          }

          v7 |= v22;
        }
        ++v10;
      }
      while (v5 != v10);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v5);

    if ((v6 & v7 & 1) == 0)
      return 0;
    CMContinuityCaptureLog(0);
    v3 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v23 = &unk_24F07FAB0;
    if (os_log_type_enabled(&v3->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v36 = v25;
      v37 = 2112;
      v38 = &unk_24F07FAB0;
      _os_log_impl(&dword_227C5D000, &v3->super, OS_LOG_TYPE_DEFAULT, "%{public}@ Throttle Reason: DeskCam. Throttled frame rate: %@", buf, 0x16u);
    }
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)updateAllowedFPS
{
  CMContinuityCaptureFrameRateManager *v2;
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  unsigned int v16;
  BOOL v17;
  uint64_t v18;
  NSMapTable *allowedFrameRateRangeForDevice;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  unsigned __int8 v30;
  CMContinuityCaptureFrameRateManager *v31;
  void *v32;
  void *v33;
  NSHashTable *obj;
  __CFString *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  unsigned int v41;
  char v42;
  CMContinuityCaptureFrameRateManager *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  CMContinuityCaptureFrameRateManager *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  const __CFString *v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v43 = v2;
  -[CMContinuityCaptureFrameRateManager throttledFrameRateByThermalLevelAndLowPowerMode](v2, "throttledFrameRateByThermalLevelAndLowPowerMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v3;
  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntValue");
  else
    v4 = -1;
  -[CMContinuityCaptureFrameRateManager throttledFrameRateByActiveStreamingEntities](v2, "throttledFrameRateByActiveStreamingEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v5;
  if (v5)
  {
    v6 = objc_msgSend(v5, "unsignedIntValue", v5, v33);
    if (v6 < v4)
      v4 = v6;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v2->_activeStreamingDevices;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v64, 16);
  if (v7)
  {
    v41 = v4;
    v42 = 0;
    v38 = *(_QWORD *)v45;
    do
    {
      v39 = v7;
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v45 != v38)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        -[NSMapTable objectForKey:](v43->_clientRequestedFrameRateRangeForDevice, "objectForKey:", v9, v32);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "maxFrameRate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "unsignedIntValue");

          objc_msgSend(v11, "minFrameRate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "unsignedIntValue");

          if (v13 >= v41)
            v16 = v41;
          else
            v16 = v13;
          v17 = v13 > v41;
          if (v15 >= v16)
            v18 = v16;
          else
            v18 = v15;
          allowedFrameRateRangeForDevice = v43->_allowedFrameRateRangeForDevice;
          +[CMContinuityCaptureFrameRateRange frameRateRangeWithMinRate:maxFrameRate:](CMContinuityCaptureFrameRateRange, "frameRateRangeWithMinRate:maxFrameRate:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable setObject:forKey:](allowedFrameRateRangeForDevice, "setObject:forKey:", v20, v9);

          CMContinuityCaptureLog(2);
          v21 = objc_claimAutoreleasedReturnValue();
          v42 |= v17;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v9, "activeConfiguration");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            CMContinuityCaptureStringForEntity(objc_msgSend(v37, "entity"));
            v40 = (id)objc_claimAutoreleasedReturnValue();
            -[NSMapTable objectForKey:](v43->_clientRequestedFrameRateRangeForDevice, "objectForKey:", v9);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "minFrameRate");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMapTable objectForKey:](v43->_clientRequestedFrameRateRangeForDevice, "objectForKey:", v9);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "maxFrameRate");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMapTable objectForKey:](v43->_allowedFrameRateRangeForDevice, "objectForKey:", v9);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "minFrameRate");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMapTable objectForKey:](v43->_allowedFrameRateRangeForDevice, "objectForKey:", v9);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "maxFrameRate");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (v41 == -1)
            {
              v29 = CFSTR("INT_MAX");
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
              v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v29 = v35;
            }
            *(_DWORD *)buf = 138545154;
            v49 = v43;
            v50 = 2112;
            v51 = v40;
            v52 = 2112;
            v53 = v22;
            v54 = 2112;
            v55 = v24;
            v56 = 2112;
            v57 = v26;
            v58 = 2112;
            v59 = v28;
            v60 = 1024;
            v61 = v42 & 1;
            v62 = 2112;
            v63 = v29;
            _os_log_impl(&dword_227C5D000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ %@ - client requested frame rate min: %@ max: %@, allowed frame rate min: %@ max: %@. Throttled: %d systemThrottledMaxFrameRate: %@", buf, 0x4Eu);
            if (v41 != -1)

          }
        }
        else
        {
          CMContinuityCaptureLog(2);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v49 = v43;
            _os_log_error_impl(&dword_227C5D000, v21, OS_LOG_TYPE_ERROR, "%{public}@ device not found in clientRequestedFrameRateRange dict", buf, 0xCu);
          }
        }

      }
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v64, 16);
    }
    while (v7);
  }
  else
  {
    v42 = 0;
  }

  v30 = atomic_load((unsigned __int8 *)&v43->_throttled);
  objc_sync_exit(v43);

  if (v30 & 1 | v42 & 1)
  {
    -[CMContinuityCaptureFrameRateManager willChangeValueForKey:](v43, "willChangeValueForKey:", CFSTR("throttled"));
    v31 = v43;
    atomic_store(v42 & 1, (unsigned __int8 *)&v43->_throttled);
    -[CMContinuityCaptureFrameRateManager didChangeValueForKey:](v31, "didChangeValueForKey:", CFSTR("throttled"));
  }
}

- (void)reportStreamStatus:(BOOL)a3 forDevice:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  CMContinuityCaptureFrameRateManager *v13;
  NSHashTable *activeStreamingDevices;
  NSMapTable *clientRequestedFrameRateRangeForDevice;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  int v25;
  CMContinuityCaptureFrameRateManager *v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v4 = a3;
  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  CMContinuityCaptureLog(2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "activeConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CMContinuityCaptureStringForEntity(objc_msgSend(v8, "entity"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543874;
    v26 = self;
    v27 = 1024;
    v28 = v4;
    v29 = 2112;
    v30 = v9;
    _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ report stream status %d for device %@", (uint8_t *)&v25, 0x1Cu);

  }
  objc_msgSend(v6, "videoDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == 0;

  if (v11)
  {
    CMContinuityCaptureLog(2);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureFrameRateManager reportStreamStatus:forDevice:].cold.1((uint64_t)self, v12);

  }
  v13 = self;
  objc_sync_enter(v13);
  activeStreamingDevices = v13->_activeStreamingDevices;
  if (v4)
  {
    -[NSHashTable addObject:](activeStreamingDevices, "addObject:", v6);
    clientRequestedFrameRateRangeForDevice = v13->_clientRequestedFrameRateRangeForDevice;
    objc_msgSend(v6, "activeConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "minFrameRate");
    objc_msgSend(v6, "activeConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[CMContinuityCaptureFrameRateRange frameRateRangeWithMinRate:maxFrameRate:](CMContinuityCaptureFrameRateRange, "frameRateRangeWithMinRate:maxFrameRate:", v17, objc_msgSend(v18, "maxFrameRate"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](clientRequestedFrameRateRangeForDevice, "setObject:forKey:", v19, v6);
  }
  else
  {
    -[NSHashTable removeObject:](activeStreamingDevices, "removeObject:", v6);
    -[NSMapTable objectForKey:](v13->_clientRequestedFrameRateRangeForDevice, "objectForKey:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v20;
    if (!v20)
      goto LABEL_12;
    objc_msgSend(v20, "maxFrameRate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "unsignedIntValue");
    objc_msgSend(v6, "activeConfiguration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setMaxFrameRate:", v22);

    objc_msgSend(v16, "minFrameRate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v18, "unsignedIntValue");
    objc_msgSend(v6, "activeConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMinFrameRate:", v24);
  }

LABEL_12:
  if (!-[NSHashTable count](v13->_activeStreamingDevices, "count"))
  {
    v13->_currentThermalLevel = 1;
    v13->_throttledDeskCamMultipleCamerasInUse = 0;
  }
  objc_sync_exit(v13);

  if (-[NSHashTable count](v13->_activeStreamingDevices, "count"))
    -[CMContinuityCaptureFrameRateManager updateAllowedFPS](v13, "updateAllowedFPS");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientRequestedFrameRateRangeForDevice, 0);
  objc_storeStrong((id *)&self->_allowedFrameRateRangeForDevice, 0);
  objc_storeStrong((id *)&self->_activeStreamingDevices, 0);
}

- (void)reportStreamStatus:(uint64_t)a1 forDevice:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_227C5D000, a2, OS_LOG_TYPE_ERROR, "%{public}@ reportStreamStatus called but no videoDevice exists for device", (uint8_t *)&v2, 0xCu);
}

@end
