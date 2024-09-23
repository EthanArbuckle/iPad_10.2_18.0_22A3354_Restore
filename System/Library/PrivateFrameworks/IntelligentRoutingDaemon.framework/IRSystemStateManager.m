@implementation IRSystemStateManager

void __72__IRSystemStateManager_monitor_didUpdateAppInFocus_isScreenUnlockEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "_updateSystemStateWithAppInFocus:andOpenWindowIfApplicable:isScreenUnlockEvent:", *(_QWORD *)(a1 + 32), 1, *(unsigned __int8 *)(a1 + 40)))objc_msgSend(v3, "_didUpdateContextWithReason:", CFSTR("App in focus"));

}

- (void)_didUpdateContextWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x24BE5B280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B280], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    -[IRSystemStateManager systemState](self, "systemState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[IRLogQEUtility getSystemStateAsString:](IRLogQEUtility, "getSystemStateAsString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRSystemStateManager miloProvider](self, "miloProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRSystemStateManager miloProviderLslPredictionResults](self, "miloProviderLslPredictionResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "getMiloServiceStatusStringQEWithPrediction:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136316162;
    v15 = "#system-state-manager, ";
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v4;
    v20 = 2112;
    v21 = v9;
    v22 = 2112;
    v23 = v12;
    _os_log_impl(&dword_23FFBA000, v7, OS_LOG_TYPE_DEFAULT, "%s[%@], System state might have changed due to %@:\n%@\n%@", (uint8_t *)&v14, 0x34u);

  }
  -[IRSystemStateManager contextObserver](self, "contextObserver");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "didUpdateContextWithReason:andOverrides:", v4, 0);

}

- (IRMiLoProvider)miloProvider
{
  return self->_miloProvider;
}

- (IRPolicyManagerContextObserver)contextObserver
{
  return (IRPolicyManagerContextObserver *)objc_loadWeakRetained((id *)&self->_contextObserver);
}

- (void)_initBiomeIfNeededUponAppInFocus
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  if (!-[IRSystemStateManager isBiomeRegistered](self, "isBiomeRegistered"))
  {
    -[IRSystemStateManager contextObserver](self, "contextObserver");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "servicePackage");

    if (v5 == 1)
    {
      -[IRSystemStateManager systemState](self, "systemState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appInFocusBundleID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", CFSTR("com.apple.TVRemoteUIService")))
      {

      }
      else
      {
        -[IRSystemStateManager systemState](self, "systemState");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "appInFocusBundleID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqual:", CFSTR("com.apple.facetime"));

        if ((v10 & 1) == 0)
          return;
      }
      v11 = 1;
      while (!+[IRSystemStateManager isObservedEventType:](IRSystemStateManager, "isObservedEventType:", v11))
      {
LABEL_16:
        if (++v11 == 4)
        {
          -[IRSystemStateManager setIsBiomeRegistered:](self, "setIsBiomeRegistered:", 1);
          return;
        }
      }
      -[IRSystemStateManager biomeProvider](self, "biomeProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:forEvent:", self, v11);

      -[IRSystemStateManager biomeProvider](self, "biomeProvider");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fetchLatestEventsOfEventType:numEvents:", v11, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 && objc_msgSend(v14, "count") == 1)
      {
        if (v11 == 2)
        {
          objc_msgSend(v14, "firstObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "eventBody");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          -[IRSystemStateManager _updateSystemStateWithMediaRoute:](self, "_updateSystemStateWithMediaRoute:", v16);
          goto LABEL_14;
        }
        if (v11 == 1)
        {
          objc_msgSend(v14, "firstObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "eventBody");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          -[IRSystemStateManager _updateSystemStateWithDeviceWiFi:](self, "_updateSystemStateWithDeviceWiFi:", v16);
LABEL_14:

        }
      }

      goto LABEL_16;
    }
  }
}

- (BOOL)_updateSystemStateWithAppInFocus:(id)a3 andOpenWindowIfApplicable:(BOOL)a4 isScreenUnlockEvent:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
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

  v5 = a5;
  LODWORD(v6) = a4;
  v8 = a3;
  -[IRSystemStateManager systemState](self, "systemState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appInFocusBundleID");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10 != (_QWORD)v8;
  if ((id)v10 == v8)
  {
    v16 = v8;
    goto LABEL_13;
  }
  v12 = (void *)v10;
  -[IRSystemStateManager systemState](self, "systemState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appInFocusBundleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v8, "isEqual:", v14);

  if ((v15 & 1) == 0)
  {
    IRAVInitialRouteSharingPolicyForBundleIdentifier(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRSystemStateManager _cancelAppInFocusWindowTimer](self, "_cancelAppInFocusWindowTimer");
    if (v8)
      v6 = v6;
    else
      v6 = 0;
    if ((_DWORD)v6 == 1)
      -[IRSystemStateManager _startAppInFocusWindowTimer](self, "_startAppInFocusWindowTimer");
    else
      v5 = 0;
    -[IRSystemStateManager systemState](self, "systemState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copyWithReplacementAppInFocusBundleID:", v8);
    -[IRSystemStateManager setSystemState:](self, "setSystemState:", v18);

    -[IRSystemStateManager systemState](self, "systemState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copyWithReplacementAvInitialRouteSharingPolicy:", v9);
    -[IRSystemStateManager setSystemState:](self, "setSystemState:", v20);

    -[IRSystemStateManager systemState](self, "systemState");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copyWithReplacementAppInFocusWindowValid:", v6);
    -[IRSystemStateManager setSystemState:](self, "setSystemState:", v22);

    -[IRSystemStateManager systemState](self, "systemState");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "copyWithReplacementAppInFocusWindowScreenUnlockEvent:", v5);
    -[IRSystemStateManager setSystemState:](self, "setSystemState:", v24);

    -[IRSystemStateManager _initBiomeIfNeededUponAppInFocus](self, "_initBiomeIfNeededUponAppInFocus");
    -[IRSystemStateManager systemState](self, "systemState");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "appInFocusBundleID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      v11 = 1;
      goto LABEL_14;
    }
    -[IRSystemStateManager miloProvider](self, "miloProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "recoverServiceIfRequired");
LABEL_13:

LABEL_14:
    goto LABEL_15;
  }
  v11 = 0;
LABEL_15:

  return v11;
}

- (IRSystemStateDO)systemState
{
  return self->_systemState;
}

- (void)setSystemState:(id)a3
{
  objc_storeStrong((id *)&self->_systemState, a3);
}

- (BOOL)isBiomeRegistered
{
  return self->_isBiomeRegistered;
}

- (void)_startAppInFocusWindowTimer
{
  IRTimer *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  IRTimer *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  objc_initWeak(&location, self);
  v3 = [IRTimer alloc];
  +[IRPreferences shared](IRPreferences, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appInFocusWindowInSeconds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;
  -[IRSystemStateManager queue](self, "queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __51__IRSystemStateManager__startAppInFocusWindowTimer__block_invoke;
  v13 = &unk_251043FF8;
  objc_copyWeak(&v14, &location);
  v9 = -[IRTimer initWithInterval:repeats:queue:block:](v3, "initWithInterval:repeats:queue:block:", 0, v8, &v10, v7);
  -[IRSystemStateManager setAppInFocusWindowTimer:](self, "setAppInFocusWindowTimer:", v9, v10, v11, v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)monitor:(id)a3 didUpdateAppInFocus:(id)a4 isScreenUnlockEvent:(BOOL)a5
{
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BOOL v12;

  v7 = a4;
  -[IRSystemStateManager queue](self, "queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__IRSystemStateManager_monitor_didUpdateAppInFocus_isScreenUnlockEvent___block_invoke;
  v10[3] = &unk_2510447C8;
  v11 = v7;
  v12 = a5;
  v9 = v7;
  IRDispatchAsyncWithStrongSelf(v8, self, v10);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (IRMiloLslPredictionDO)miloProviderLslPredictionResults
{
  return self->_miloProviderLslPredictionResults;
}

- (void)setAppInFocusWindowTimer:(id)a3
{
  objc_storeStrong((id *)&self->_appInFocusWindowTimer, a3);
}

- (void)_cancelAppInFocusWindowTimer
{
  void *v3;
  void *v4;

  -[IRSystemStateManager appInFocusWindowTimer](self, "appInFocusWindowTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[IRSystemStateManager appInFocusWindowTimer](self, "appInFocusWindowTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[IRSystemStateManager setAppInFocusWindowTimer:](self, "setAppInFocusWindowTimer:", 0);
  }
}

- (IRTimer)appInFocusWindowTimer
{
  return self->_appInFocusWindowTimer;
}

- (IRNearbyDeviceContainerDO)nearbyDeviceContainer
{
  return self->_nearbyDeviceContainer;
}

- (void)logProviderState
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[IRSystemStateManager nearbyDeviceContainer](self, "nearbyDeviceContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_23FFBA000, v4, OS_LOG_TYPE_DEFAULT, "#system-state-manager, Cached Nearby devices: %@", (uint8_t *)&v6, 0xCu);

  }
}

- (IRSystemStateManager)initWithQueue:(id)a3 contextObserver:(id)a4 biomeProvider:(id)a5 miloProvider:(id)a6 proximityProvider:(id)a7 serviceStore:(id)a8 displayMonitor:(id)a9 audioAVOutputContextController:(id)a10 isLowLatencyMiLo:(BOOL)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  IRSystemStateManager *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  IRNearbyDeviceContainerDO *v32;
  void *v33;
  IRNearbyDeviceContainerDO *v34;
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
  NSObject *v48;
  void *v49;
  uint64_t v51;
  uint64_t v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  objc_super v58;
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v58.receiver = self;
  v58.super_class = (Class)IRSystemStateManager;
  v25 = -[IRSystemStateManager init](&v58, sel_init);
  if (v25)
  {
    v26 = objc_alloc_init(MEMORY[0x24BE29770]);
    -[IRSystemStateManager setQueue:](v25, "setQueue:", v17);
    v57 = v18;
    -[IRSystemStateManager setContextObserver:](v25, "setContextObserver:", v18);
    v56 = v19;
    -[IRSystemStateManager setBiomeProvider:](v25, "setBiomeProvider:", v19);
    v55 = v20;
    -[IRSystemStateManager setMiloProvider:](v25, "setMiloProvider:", v20);
    v53 = v22;
    -[IRSystemStateManager setServiceStore:](v25, "setServiceStore:", v22);
    v54 = v21;
    -[IRSystemStateManager setProximityProvider:](v25, "setProximityProvider:", v21);
    -[IRSystemStateManager setDisplayMonitor:](v25, "setDisplayMonitor:", v23);
    -[IRSystemStateManager setAudioAVOutputContextController:](v25, "setAudioAVOutputContextController:", v24);
    v27 = (void *)objc_msgSend(v26, "copyMyAppleIDAndReturnError:", 0);
    objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "secondsFromGMT");
    -[IRSystemStateManager displayMonitor](v25, "displayMonitor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v52) = objc_msgSend(v30, "isContinuityDisplay");
    LOWORD(v51) = 0;
    +[IRSystemStateDO systemStateDOWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:](IRSystemStateDO, "systemStateDOWithAppInFocusBundleID:appInFocusWindowValid:deviceWiFiSSID:locationSemanticUserSpecificPlaceType:locationSemanticLoiIdentifier:iCloudId:avInitialRouteSharingPolicy:mediaRouteGroupLeaderOutputDeviceID:timeZoneSeconds:outputDeviceName:outputDeviceType:outputDeviceSubType:predictedOutputDeviceName:predictedOutputDeviceType:predictedOutputDeviceSubType:appInFocusWindowScreenUnlockEvent:pdrFenceActive:latestPickerChoiceDate:isContinuityDisplay:", 0, 0, 0, 0, 0, v27, 0, 0, v29, 0, 0, 0, 0, 0,
      0,
      v51,
      0,
      v52);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRSystemStateManager setSystemState:](v25, "setSystemState:", v31);

    v32 = [IRNearbyDeviceContainerDO alloc];
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[IRNearbyDeviceContainerDO initWithFreezeDateNIHomeDevice:nearbyDevices:](v32, "initWithFreezeDateNIHomeDevice:nearbyDevices:", 0, v33);
    -[IRSystemStateManager setNearbyDeviceContainer:](v25, "setNearbyDeviceContainer:", v34);

    -[IRSystemStateManager _registerToMiLo:](v25, "_registerToMiLo:", a11);
    -[IRSystemStateManager proximityProvider](v25, "proximityProvider");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObserver:", v25);

    -[IRSystemStateManager displayMonitor](v25, "displayMonitor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObserver:", v25);

    -[IRSystemStateManager audioAVOutputContextController](v25, "audioAVOutputContextController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObserver:", v25);

    -[IRSystemStateManager displayMonitor](v25, "displayMonitor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "getAppInFocus");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[IRPreferences shared](IRPreferences, "shared");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "appInFocusWindowEnableOnServiceRun");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRSystemStateManager _updateSystemStateWithAppInFocus:andOpenWindowIfApplicable:isScreenUnlockEvent:](v25, "_updateSystemStateWithAppInFocus:andOpenWindowIfApplicable:isScreenUnlockEvent:", v39, objc_msgSend(v41, "BOOLValue"), 0);

    -[IRSystemStateManager audioAVOutputContextController](v25, "audioAVOutputContextController");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "getOutputDevice");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRSystemStateManager _updateSystemStateWithOutputDevice:](v25, "_updateSystemStateWithOutputDevice:", v43);

    -[IRSystemStateManager audioAVOutputContextController](v25, "audioAVOutputContextController");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "getPredictedOutputDevice");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRSystemStateManager _updateSystemStateWithPredictedOutputDevice:](v25, "_updateSystemStateWithPredictedOutputDevice:", v45);

    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)*MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
    {
      v48 = v47;
      -[IRSystemStateManager systemState](v25, "systemState");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v60 = "#system-state-manager, ";
      v61 = 2112;
      v62 = v46;
      v63 = 2112;
      v64 = v49;
      _os_log_impl(&dword_23FFBA000, v48, OS_LOG_TYPE_DEFAULT, "%s[%@], Initial state of system state = %@", buf, 0x20u);

    }
    v18 = v57;
    v20 = v55;
    v19 = v56;
    v21 = v54;
    v22 = v53;
  }

  return v25;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)IRSystemStateManager;
  -[IRSystemStateManager dealloc](&v2, sel_dealloc);
}

- (void)deallocSync
{
  void *v3;
  void *v4;
  id v5;

  -[IRSystemStateManager _unregisterFromMiLo](self, "_unregisterFromMiLo");
  -[IRSystemStateManager _unregisterForBiomeEvents](self, "_unregisterForBiomeEvents");
  -[IRSystemStateManager proximityProvider](self, "proximityProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[IRSystemStateManager displayMonitor](self, "displayMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[IRSystemStateManager audioAVOutputContextController](self, "audioAVOutputContextController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

}

- (void)addEvent:(id)a3 forCandidate:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;

  v6 = a4;
  v8 = a3;
  -[IRSystemStateManager queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[IRSystemStateManager _updateSystemStateWithAppInFocusWindowEnd](self, "_updateSystemStateWithAppInFocusWindowEnd");
  -[IRSystemStateManager _checkAndStartPDRFenceLogicIfNeededWithEvent:andCandidate:](self, "_checkAndStartPDRFenceLogicIfNeededWithEvent:andCandidate:", v8, v6);

  -[IRSystemStateManager _didUpdateContextWithReason:](self, "_didUpdateContextWithReason:", CFSTR("Add event"));
  -[IRSystemStateManager _checkAndUpdateLatestPickerChoiceDateIfNeededForEvent:](self, "_checkAndUpdateLatestPickerChoiceDateIfNeededForEvent:", v8);

}

- (BOOL)startLowLatencyMiLo
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[IRSystemStateManager miloProvider](self, "miloProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "startLowLatencyMiLo");

  if (v4)
  {
    -[IRSystemStateManager miloProvider](self, "miloProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestSinglePrediction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[IRMiloLslPredictionDO miloLslPredictionDOWithPredictionId:miLoServiceQuality:miLoServiceQualityReasonBitmap:scores:nearbyDevices:predictionTime:confidence:confidenceReasonBitmap:](IRMiloLslPredictionDO, "miloLslPredictionDOWithPredictionId:miLoServiceQuality:miLoServiceQualityReasonBitmap:scores:nearbyDevices:predictionTime:confidence:confidenceReasonBitmap:", v6, 0, 0, v7, v8, v9, +[IRMiLoProvider highConfidenceValue](IRMiLoProvider, "highConfidenceValue"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IRSystemStateManager setMiloProviderLslPredictionResults:](self, "setMiloProviderLslPredictionResults:", v10);

  }
  return v4;
}

- (void)endAppInFocusWindow
{
  if (-[IRSystemStateManager _updateSystemStateWithAppInFocusWindowEnd](self, "_updateSystemStateWithAppInFocusWindowEnd"))
  {
    -[IRSystemStateManager _didUpdateContextWithReason:](self, "_didUpdateContextWithReason:", CFSTR("App in focus window end"));
  }
}

- (void)restartLowLatencyMiLo:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  -[IRSystemStateManager setMiloProviderLslPredictionResults:](self, "setMiloProviderLslPredictionResults:", 0);
  -[IRSystemStateManager _unregisterFromMiLo](self, "_unregisterFromMiLo");
  -[IRSystemStateManager _registerToMiLo:](self, "_registerToMiLo:", v3);
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    v8 = v6;
    objc_msgSend(v7, "numberWithBool:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "#system-state-manager, ";
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_23FFBA000, v8, OS_LOG_TYPE_INFO, "%s[%@], MiLo session restarting with isLowLatencyMiLo: %@", (uint8_t *)&v10, 0x20u);

  }
}

- (void)_registerToMiLo:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  +[IRPreferences shared](IRPreferences, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "miloEnable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) != 0)
  {
    -[IRSystemStateManager miloProvider](self, "miloProvider");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    -[IRSystemStateManager contextObserver](self, "contextObserver");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serviceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x24BDD1880]);
    -[IRSystemStateManager serviceStore](self, "serviceStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fetchMiLoServiceUuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithUUIDString:", v13);
    objc_msgSend(v17, "addObserver:withToken:withLegacyServiceUUID:isLowLatency:", self, v10, v14, v3);

  }
  else
  {
    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "#system-state-manager, ";
      v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_23FFBA000, v16, OS_LOG_TYPE_INFO, "%s[%@], MiLo is not enabled in user defaults", buf, 0x16u);
    }

  }
}

- (void)_unregisterFromMiLo
{
  id v2;

  -[IRSystemStateManager miloProvider](self, "miloProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver");

}

- (void)_unregisterForBiomeEvents
{
  uint64_t i;
  void *v4;

  for (i = 1; i != 4; ++i)
  {
    if (+[IRSystemStateManager isObservedEventType:](IRSystemStateManager, "isObservedEventType:", i))
    {
      -[IRSystemStateManager biomeProvider](self, "biomeProvider");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeObserver:forEvent:", self, i);

    }
  }
}

- (void)_checkAndUpdateLatestPickerChoiceDateIfNeededForEvent:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (objc_msgSend(a3, "isPickerChoiceEvent"))
  {
    -[IRSystemStateManager systemState](self, "systemState");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "copyWithReplacementLatestPickerChoiceDate:", v4);
    -[IRSystemStateManager setSystemState:](self, "setSystemState:", v5);

  }
}

void __51__IRSystemStateManager__startAppInFocusWindowTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "endAppInFocusWindow");
    WeakRetained = v2;
  }

}

- (void)_checkAndStartPDRFenceLogicIfNeededWithEvent:(id)a3 andCandidate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;
  IRCMPDRFenceBridge *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  IRTimer *v29;
  void *v30;
  IRTimer *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[IRSystemStateManager pdrFenceTimer](self, "pdrFenceTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 9);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 10);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[IREventDO eventDOWithMediaType:](IREventDO, "eventDOWithMediaType:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqual:", v9) & 1) != 0
      || (objc_msgSend(v6, "isEqual:", v10) & 1) != 0
      || objc_msgSend(v7, "isBrokeredDevice") && objc_msgSend(v6, "isEqual:", v11))
    {
      dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *MEMORY[0x24BE5B270];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v42 = "#system-state-manager, ";
        v43 = 2112;
        v44 = v12;
        _os_log_impl(&dword_23FFBA000, v13, OS_LOG_TYPE_INFO, "%s[%@], Starting PDRFence PDR fence logic", buf, 0x16u);
      }

      objc_initWeak((id *)buf, self);
      +[IRPreferences shared](IRPreferences, "shared");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "pdrFenceOtherThanRadiusTimeoutInSeconds");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "integerValue");

      if (+[IRCMPDRFenceBridge isAvailable](IRCMPDRFenceBridge, "isAvailable"))
      {
        -[IRSystemStateManager pdrFenceBridge](self, "pdrFenceBridge");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17 == 0;

        if (v18)
        {
          v19 = -[IRCMPDRFenceBridge initWithFenceIdentifier:]([IRCMPDRFenceBridge alloc], "initWithFenceIdentifier:", CFSTR("PDRFence"));
          -[IRSystemStateManager setPdrFenceBridge:](self, "setPdrFenceBridge:", v19);

        }
        -[IRSystemStateManager pdrFenceBridge](self, "pdrFenceBridge");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "startSession");

        +[IRPreferences shared](IRPreferences, "shared");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "pdrFenceRadiusInMeters");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "floatValue");
        v24 = v23;

        -[IRSystemStateManager pdrFenceBridge](self, "pdrFenceBridge");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = MEMORY[0x24BDAC760];
        v39[1] = 3221225472;
        v39[2] = __82__IRSystemStateManager__checkAndStartPDRFenceLogicIfNeededWithEvent_andCandidate___block_invoke;
        v39[3] = &unk_251043FF8;
        objc_copyWeak(&v40, (id *)buf);
        LODWORD(v26) = v24;
        objc_msgSend(v25, "setFence:withCompletion:", v39, v26);

        +[IRPreferences shared](IRPreferences, "shared");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "pdrFenceRadiusTimeoutInSeconds");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v28, "integerValue");

        objc_destroyWeak(&v40);
      }
      v29 = [IRTimer alloc];
      -[IRSystemStateManager queue](self, "queue");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = MEMORY[0x24BDAC760];
      v35 = 3221225472;
      v36 = __82__IRSystemStateManager__checkAndStartPDRFenceLogicIfNeededWithEvent_andCandidate___block_invoke_19;
      v37 = &unk_251043FF8;
      objc_copyWeak(&v38, (id *)buf);
      v31 = -[IRTimer initWithInterval:repeats:queue:block:](v29, "initWithInterval:repeats:queue:block:", 0, v30, &v34, (double)v16);
      -[IRSystemStateManager setPdrFenceTimer:](self, "setPdrFenceTimer:", v31, v34, v35, v36, v37);

      -[IRSystemStateManager systemState](self, "systemState");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v32, "copyWithReplacementPdrFenceActive:", 1);
      -[IRSystemStateManager setSystemState:](self, "setSystemState:", v33);

      objc_destroyWeak(&v38);
      objc_destroyWeak((id *)buf);
    }

  }
}

void __82__IRSystemStateManager__checkAndStartPDRFenceLogicIfNeededWithEvent_andCandidate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(v2, "queue");
      v4 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __82__IRSystemStateManager__checkAndStartPDRFenceLogicIfNeededWithEvent_andCandidate___block_invoke_2;
      block[3] = &unk_251044310;
      v6 = v2;
      dispatch_async(v4, block);

    }
  }

}

uint64_t __82__IRSystemStateManager__checkAndStartPDRFenceLogicIfNeededWithEvent_andCandidate___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "#system-state-manager, ";
    v7 = 2112;
    v8 = v2;
    _os_log_impl(&dword_23FFBA000, v3, OS_LOG_TYPE_INFO, "%s[%@], PDR fence crossed", (uint8_t *)&v5, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_checkAndStopPDRFenceLogicIfNeeded");
}

void __82__IRSystemStateManager__checkAndStartPDRFenceLogicIfNeededWithEvent_andCandidate___block_invoke_19(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
    {
      v4 = 136315394;
      v5 = "#system-state-manager, ";
      v6 = 2112;
      v7 = v2;
      _os_log_impl(&dword_23FFBA000, v3, OS_LOG_TYPE_INFO, "%s[%@], PDR fence timeout", (uint8_t *)&v4, 0x16u);
    }

    objc_msgSend(WeakRetained, "_checkAndStopPDRFenceLogicIfNeeded");
  }

}

- (void)_checkAndStopPDRFenceLogicIfNeeded
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[IRSystemStateManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[IRSystemStateManager pdrFenceTimer](self, "pdrFenceTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
    {
      v12 = 136315394;
      v13 = "#system-state-manager, ";
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_23FFBA000, v6, OS_LOG_TYPE_INFO, "%s[%@], Stopping PDR fence logic", (uint8_t *)&v12, 0x16u);
    }

    -[IRSystemStateManager pdrFenceBridge](self, "pdrFenceBridge");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clearFence");

    -[IRSystemStateManager pdrFenceBridge](self, "pdrFenceBridge");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endSession");

    -[IRSystemStateManager pdrFenceTimer](self, "pdrFenceTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidate");

    -[IRSystemStateManager setPdrFenceTimer:](self, "setPdrFenceTimer:", 0);
    -[IRSystemStateManager systemState](self, "systemState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copyWithReplacementPdrFenceActive:", 0);
    -[IRSystemStateManager setSystemState:](self, "setSystemState:", v11);

    -[IRSystemStateManager _didUpdateContextWithReason:](self, "_didUpdateContextWithReason:", CFSTR("PDR fence crossed"));
  }
}

- (void)provider:(id)a3 didUpdateDeviceWiFi:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  -[IRSystemStateManager queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__IRSystemStateManager_provider_didUpdateDeviceWiFi___block_invoke;
  v8[3] = &unk_251044760;
  v9 = v5;
  v7 = v5;
  IRDispatchAsyncWithStrongSelf(v6, self, v8);

}

void __53__IRSystemStateManager_provider_didUpdateDeviceWiFi___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "_updateSystemStateWithDeviceWiFi:", *(_QWORD *)(a1 + 32)))
    objc_msgSend(v3, "_didUpdateContextWithReason:", CFSTR("Device WiFi"));

}

- (void)provider:(id)a3 didUpdateMediaRoute:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  -[IRSystemStateManager queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__IRSystemStateManager_provider_didUpdateMediaRoute___block_invoke;
  v8[3] = &unk_251044760;
  v9 = v5;
  v7 = v5;
  IRDispatchAsyncWithStrongSelf(v6, self, v8);

}

void __53__IRSystemStateManager_provider_didUpdateMediaRoute___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "_updateSystemStateWithMediaRoute:", *(_QWORD *)(a1 + 32)))
    objc_msgSend(v3, "_didUpdateContextWithReason:", CFSTR("Media route"));

}

- (void)deleteLegacyServiceIdentifier
{
  uint64_t v3;
  void *v4;
  const void **v5;
  os_log_t *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[IRSystemStateManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  -[IRSystemStateManager serviceStore](self, "serviceStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "updateMiloServiceWithMiloUuidString:", 0);

  v5 = (const void **)MEMORY[0x24BE5B328];
  v6 = (os_log_t *)MEMORY[0x24BE5B270];
  if ((v3 & 1) == 0)
  {
    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "#system-state-manager, ";
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_23FFBA000, v8, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Milo Save error] Could not update milo service to nil in DB", (uint8_t *)&v11, 0x16u);
    }

  }
  dispatch_get_specific(*v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "#system-state-manager, ";
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_23FFBA000, v10, OS_LOG_TYPE_INFO, "%s[%@], deleteLegacyServiceIdentifier", (uint8_t *)&v11, 0x16u);
  }

}

- (id)_miloLslPredictionToDO:(id)a3
{
  id v3;
  void *v4;
  IRMiloLslPredictionDO *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  IRMiloLslPredictionDO *v14;
  void *v16;

  if (a3)
  {
    v3 = a3;
    objc_msgSend(v3, "predictedEvents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "compactMap:", &__block_literal_global_9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = [IRMiloLslPredictionDO alloc];
    objc_msgSend(v3, "predictionId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "miLoServiceQuality");
    v9 = objc_msgSend(v3, "miLoServiceQualityReasonBitmap");
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "predictionTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v3, "confidence");
    v13 = objc_msgSend(v3, "confidenceReasonBitmap");

    v14 = -[IRMiloLslPredictionDO initWithPredictionId:miLoServiceQuality:miLoServiceQualityReasonBitmap:scores:nearbyDevices:predictionTime:confidence:confidenceReasonBitmap:](v5, "initWithPredictionId:miLoServiceQuality:miLoServiceQualityReasonBitmap:scores:nearbyDevices:predictionTime:confidence:confidenceReasonBitmap:", v7, v8, v9, v10, 0, v11, v12, v13);
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

IRMiloLslSingleScoreDO *__47__IRSystemStateManager__miloLslPredictionToDO___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  IRMiloLslSingleScoreDO *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  IRMiloLslSingleScoreDO *v9;

  v2 = a2;
  v3 = [IRMiloLslSingleScoreDO alloc];
  objc_msgSend(v2, "score");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;
  objc_msgSend(v2, "eventId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[IRMiloLslSingleScoreDO initWithScore:eventID:](v3, "initWithScore:eventID:", v8, v6);

  return v9;
}

- (void)onPrediction:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IRSystemStateManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x24BE5B280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B280], OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = v7;
    objc_msgSend(v8, "numberWithLongLong:", objc_msgSend(v4, "miLoServiceQuality"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v4, "miLoServiceQualityReasonBitmap"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v4, "confidence"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v4, "confidenceReasonBitmap"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "predictedEvents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 136316930;
    v19 = "#system-state-manager, ";
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = v4;
    v24 = 2112;
    v25 = v10;
    v26 = 2112;
    v27 = v11;
    v28 = 2112;
    v29 = v12;
    v30 = 2112;
    v31 = v13;
    v32 = 2112;
    v33 = v16;
    _os_log_impl(&dword_23FFBA000, v9, OS_LOG_TYPE_DEFAULT, "%s[%@], Received MiLo prediction: %@ with quality: %@ and reason: %@, confidence: %@, Confidence Reason: %@, Num Evets = %@", (uint8_t *)&v18, 0x52u);

  }
  -[IRSystemStateManager _miloLslPredictionToDO:](self, "_miloLslPredictionToDO:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRSystemStateManager setMiloProviderLslPredictionResults:](self, "setMiloProviderLslPredictionResults:", v17);

  -[IRSystemStateManager _didUpdateContextWithReason:](self, "_didUpdateContextWithReason:", CFSTR("MiLo prediction"));
}

- (void)onUpdateLOIType:(int)a3 WithLOIIdentifier:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v4 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[IRSystemStateManager queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)*MEMORY[0x24BE5B280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B280], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    IRLocationSemanticUserSpecificPlaceTypeToString(v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315906;
    v13 = "#system-state-manager, ";
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v11;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_23FFBA000, v10, OS_LOG_TYPE_DEFAULT, "%s[%@], Received MiLo LOI update with LOI type: %@ and identifier: %@", (uint8_t *)&v12, 0x2Au);

  }
  -[IRSystemStateManager _updateSystemStateWithLOIType:WithLOIIdentifier:](self, "_updateSystemStateWithLOIType:WithLOIIdentifier:", v4, v6);
  -[IRSystemStateManager _didUpdateContextWithReason:](self, "_didUpdateContextWithReason:", CFSTR("Location Semantic"));

}

- (void)didSpotOnLocationCompleteWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IRSystemStateManager contextObserver](self, "contextObserver");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didSpotOnLocationComplete:", v4);

}

- (BOOL)_updateSystemStateWithIsContinuityDisplay:(BOOL)a3
{
  _BOOL8 v3;
  IRSystemStateManager *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = self;
  -[IRSystemStateManager systemState](self, "systemState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  -[IRSystemStateManager systemState](v4, "systemState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copyWithReplacementIsContinuityDisplay:", v3);
  -[IRSystemStateManager setSystemState:](v4, "setSystemState:", v8);

  -[IRSystemStateManager systemState](v4, "systemState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v9, "isEqual:", v6) ^ 1;

  return (char)v4;
}

- (BOOL)_updateSystemStateWithDeviceWiFi:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[IRSystemStateManager systemState](self, "systemState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  -[IRSystemStateManager systemState](self, "systemState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "SSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v7, "copyWithReplacementDeviceWiFiSSID:", v8);
  -[IRSystemStateManager setSystemState:](self, "setSystemState:", v9);

  -[IRSystemStateManager systemState](self, "systemState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v10, "isEqual:", v6) ^ 1;

  return (char)v9;
}

- (BOOL)_updateSystemStateWithLOIType:(int)a3 WithLOIIdentifier:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[IRSystemStateManager systemState](self, "systemState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  -[IRSystemStateManager systemState](self, "systemState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copyWithReplacementLocationSemanticUserSpecificPlaceType:", v4);
  -[IRSystemStateManager setSystemState:](self, "setSystemState:", v10);

  -[IRSystemStateManager systemState](self, "systemState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copyWithReplacementLocationSemanticLoiIdentifier:", v6);

  -[IRSystemStateManager setSystemState:](self, "setSystemState:", v12);
  -[IRSystemStateManager systemState](self, "systemState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_msgSend(v13, "isEqual:", v8) ^ 1;

  return (char)v11;
}

- (BOOL)_updateSystemStateWithMediaRoute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[IRSystemStateManager systemState](self, "systemState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v4, "groupLeaderOutputDeviceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v4, "outputDevices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 == 1)
    {
      objc_msgSend(v4, "groupLeaderOutputDeviceID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  -[IRSystemStateManager systemState](self, "systemState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithReplacementMediaRouteGroupLeaderOutputDeviceID:", v7);
  -[IRSystemStateManager setSystemState:](self, "setSystemState:", v11);

  -[IRSystemStateManager systemState](self, "systemState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_msgSend(v12, "isEqual:", v6) ^ 1;

  return (char)v10;
}

- (BOOL)_updateSystemStateWithAppInFocusWindowEnd
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[IRSystemStateManager systemState](self, "systemState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  -[IRSystemStateManager _cancelAppInFocusWindowTimer](self, "_cancelAppInFocusWindowTimer");
  -[IRSystemStateManager systemState](self, "systemState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copyWithReplacementAppInFocusWindowValid:", 0);
  -[IRSystemStateManager setSystemState:](self, "setSystemState:", v6);

  -[IRSystemStateManager systemState](self, "systemState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copyWithReplacementAppInFocusWindowScreenUnlockEvent:", 0);
  -[IRSystemStateManager setSystemState:](self, "setSystemState:", v8);

  -[IRSystemStateManager systemState](self, "systemState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v9, "isEqual:", v4) ^ 1;

  return (char)v7;
}

- (BOOL)_updateSystemStateWithOutputDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[IRSystemStateManager systemState](self, "systemState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  -[IRSystemStateManager systemState](self, "systemState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "copyWithReplacementOutputDeviceName:", v8);
  -[IRSystemStateManager setSystemState:](self, "setSystemState:", v9);

  -[IRSystemStateManager systemState](self, "systemState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithReplacementOutputDeviceType:", objc_msgSend(v4, "deviceType"));
  -[IRSystemStateManager setSystemState:](self, "setSystemState:", v11);

  -[IRSystemStateManager systemState](self, "systemState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "deviceSubType");

  v14 = (void *)objc_msgSend(v12, "copyWithReplacementOutputDeviceSubType:", v13);
  -[IRSystemStateManager setSystemState:](self, "setSystemState:", v14);

  -[IRSystemStateManager systemState](self, "systemState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = objc_msgSend(v15, "isEqual:", v6) ^ 1;

  return (char)v14;
}

- (BOOL)_updateSystemStateWithPredictedOutputDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[IRSystemStateManager systemState](self, "systemState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  -[IRSystemStateManager systemState](self, "systemState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "copyWithReplacementPredictedOutputDeviceName:", v8);
  -[IRSystemStateManager setSystemState:](self, "setSystemState:", v9);

  -[IRSystemStateManager systemState](self, "systemState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithReplacementPredictedOutputDeviceType:", objc_msgSend(v4, "deviceType"));
  -[IRSystemStateManager setSystemState:](self, "setSystemState:", v11);

  -[IRSystemStateManager systemState](self, "systemState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "deviceSubType");

  v14 = (void *)objc_msgSend(v12, "copyWithReplacementPredictedOutputDeviceSubType:", v13);
  -[IRSystemStateManager setSystemState:](self, "setSystemState:", v14);

  -[IRSystemStateManager systemState](self, "systemState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = objc_msgSend(v15, "isEqual:", v6) ^ 1;

  return (char)v14;
}

- (void)provider:(id)a3 didUpdateNearbyDevices:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  -[IRSystemStateManager queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__IRSystemStateManager_provider_didUpdateNearbyDevices___block_invoke;
  v8[3] = &unk_251044760;
  v9 = v5;
  v7 = v5;
  IRDispatchAsyncWithStrongSelf(v6, self, v8);

}

void __56__IRSystemStateManager_provider_didUpdateNearbyDevices___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "nearbyDeviceContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  +[IRPreferences shared](IRPreferences, "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceRangeProximityThreshold");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v8 = +[IRProximityProvider didContainer:changeWithUpdatetContainer:andRangeThreshold:](IRProximityProvider, "didContainer:changeWithUpdatetContainer:andRangeThreshold:", v4, v5);

  v9 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v3, "setNearbyDeviceContainer:", v9);

  if (v8)
  {
    objc_msgSend(v3, "_didUpdateContextWithReason:", CFSTR("nearby device change"));
    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x24BE5B280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B280], OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 136315650;
      v14 = "#system-state-manager, ";
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_23FFBA000, v11, OS_LOG_TYPE_DEFAULT, "%s[%@], Updated cached nearby devices: %@", (uint8_t *)&v13, 0x20u);
    }

  }
}

- (void)monitor:(id)a3 didUpdateIsContinuityDisplay:(BOOL)a4
{
  void *v6;
  _QWORD v7[4];
  BOOL v8;

  -[IRSystemStateManager queue](self, "queue", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__IRSystemStateManager_monitor_didUpdateIsContinuityDisplay___block_invoke;
  v7[3] = &__block_descriptor_33_e30_v16__0__IRSystemStateManager_8l;
  v8 = a4;
  IRDispatchAsyncWithStrongSelf(v6, self, v7);

}

void __61__IRSystemStateManager_monitor_didUpdateIsContinuityDisplay___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "_updateSystemStateWithIsContinuityDisplay:", *(unsigned __int8 *)(a1 + 32)))
    objc_msgSend(v3, "_didUpdateContextWithReason:", CFSTR("Continuity display"));

}

- (void)context:(id)a3 didUpdateOutputDevice:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  -[IRSystemStateManager queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__IRSystemStateManager_context_didUpdateOutputDevice___block_invoke;
  v8[3] = &unk_251044760;
  v9 = v5;
  v7 = v5;
  IRDispatchAsyncWithStrongSelf(v6, self, v8);

}

void __54__IRSystemStateManager_context_didUpdateOutputDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "_updateSystemStateWithOutputDevice:", *(_QWORD *)(a1 + 32)))
    objc_msgSend(v3, "_didUpdateContextWithReason:", CFSTR("Output device"));

}

- (void)context:(id)a3 didUpdatePredicatedOutputDevice:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  -[IRSystemStateManager queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__IRSystemStateManager_context_didUpdatePredicatedOutputDevice___block_invoke;
  v8[3] = &unk_251044760;
  v9 = v5;
  v7 = v5;
  IRDispatchAsyncWithStrongSelf(v6, self, v8);

}

void __64__IRSystemStateManager_context_didUpdatePredicatedOutputDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "_updateSystemStateWithPredictedOutputDevice:", *(_QWORD *)(a1 + 32)))
    objc_msgSend(v3, "_didUpdateContextWithReason:", CFSTR("Predicted output device"));

}

+ (BOOL)isObservedEventType:(int64_t)a3
{
  return a3 != 3;
}

- (void)setMiloProviderLslPredictionResults:(id)a3
{
  objc_storeStrong((id *)&self->_miloProviderLslPredictionResults, a3);
}

- (void)setNearbyDeviceContainer:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyDeviceContainer, a3);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setContextObserver:(id)a3
{
  objc_storeWeak((id *)&self->_contextObserver, a3);
}

- (IRBiomeProvider)biomeProvider
{
  return self->_biomeProvider;
}

- (void)setBiomeProvider:(id)a3
{
  objc_storeStrong((id *)&self->_biomeProvider, a3);
}

- (void)setMiloProvider:(id)a3
{
  objc_storeStrong((id *)&self->_miloProvider, a3);
}

- (IRProximityProvider)proximityProvider
{
  return self->_proximityProvider;
}

- (void)setProximityProvider:(id)a3
{
  objc_storeStrong((id *)&self->_proximityProvider, a3);
}

- (IRServiceStore)serviceStore
{
  return self->_serviceStore;
}

- (void)setServiceStore:(id)a3
{
  objc_storeStrong((id *)&self->_serviceStore, a3);
}

- (IRDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (void)setDisplayMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_displayMonitor, a3);
}

- (IRAVOutputContextController)audioAVOutputContextController
{
  return self->_audioAVOutputContextController;
}

- (void)setAudioAVOutputContextController:(id)a3
{
  objc_storeStrong((id *)&self->_audioAVOutputContextController, a3);
}

- (void)setIsBiomeRegistered:(BOOL)a3
{
  self->_isBiomeRegistered = a3;
}

- (IRCMPDRFenceBridge)pdrFenceBridge
{
  return self->_pdrFenceBridge;
}

- (void)setPdrFenceBridge:(id)a3
{
  objc_storeStrong((id *)&self->_pdrFenceBridge, a3);
}

- (IRTimer)pdrFenceTimer
{
  return self->_pdrFenceTimer;
}

- (void)setPdrFenceTimer:(id)a3
{
  objc_storeStrong((id *)&self->_pdrFenceTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdrFenceTimer, 0);
  objc_storeStrong((id *)&self->_pdrFenceBridge, 0);
  objc_storeStrong((id *)&self->_appInFocusWindowTimer, 0);
  objc_storeStrong((id *)&self->_audioAVOutputContextController, 0);
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_serviceStore, 0);
  objc_storeStrong((id *)&self->_proximityProvider, 0);
  objc_storeStrong((id *)&self->_miloProvider, 0);
  objc_storeStrong((id *)&self->_biomeProvider, 0);
  objc_destroyWeak((id *)&self->_contextObserver);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_systemState, 0);
  objc_storeStrong((id *)&self->_nearbyDeviceContainer, 0);
  objc_storeStrong((id *)&self->_miloProviderLslPredictionResults, 0);
}

@end
