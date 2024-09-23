@implementation HFHomeKitDispatcher

+ (BOOL)synchronizesHomeDataModel
{
  return !+[HFUtilities isInternalTest](HFUtilities, "isInternalTest") && _MergedGlobals_325
      || byte_1ED379E5A != 0;
}

+ (id)sharedDispatcher
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__HFHomeKitDispatcher_sharedDispatcher__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED379E70 != -1)
    dispatch_once(&qword_1ED379E70, block);
  return (id)qword_1ED379E68;
}

- (HMHome)home
{
  return self->_home;
}

void __55__HFHomeKitDispatcher__setupLocationSensingCoordinator__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (+[HFExecutionEnvironment isHomeApp](HFExecutionEnvironment, "isHomeApp")
    || +[HFExecutionEnvironment isHomeControlService](HFExecutionEnvironment, "isHomeControlService")
    || +[HFExecutionEnvironment isSpringBoard](HFExecutionEnvironment, "isSpringBoard")
    || +[HFExecutionEnvironment isWatchApp](HFExecutionEnvironment, "isWatchApp")
    || +[HFExecutionEnvironment isCarousel](HFExecutionEnvironment, "isCarousel")
    || +[HFExecutionEnvironment isHomeWidgetIntents](HFExecutionEnvironment, "isHomeWidgetIntents"))
  {
    objc_msgSend(*(id *)(a1 + 32), "homeManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentAccessory");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    byte_1ED379E5B = v2 == 0;

  }
  else
  {
    byte_1ED379E5B = 0;
  }
}

- (void)dispatchWalletKeyDeviceStateObserverMessage:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HFHomeKitDispatcher walletKeyDeviceStateObserverDispatcher](self, "walletKeyDeviceStateObserverDispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchMessageExcludingSender:usingBlock:", v6, v7);

}

- (void)dispatchHomeObserverMessage:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HFHomeKitDispatcher homeObserverDispatcher](self, "homeObserverDispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchMessageExcludingSender:usingBlock:", v6, v7);

}

- (void)addSoftwareUpdateObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher softwareUpdateObserverDispatcher](self, "softwareUpdateObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (void)addAccessoryObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher accessoryObserverDispatcher](self, "accessoryObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (void)_setDelegationEnabled:(BOOL)a3 forAccessoryHierarchy:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
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
  id v41;
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
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[5];
  BOOL v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint8_t v77[128];
  uint8_t buf[4];
  id v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v4 = a3;
  v84 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFHomeKitDispatcher home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if ((v9 & 1) == 0)
  {
    HFLogForCategory(0x24uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "home");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFHomeKitDispatcher home](self, "home");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v79 = v6;
      v80 = 2112;
      v81 = v59;
      v82 = 2112;
      v83 = v60;
      _os_log_error_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_ERROR, "Setting delegate for accessory %@ with home %@ not in current home %@", buf, 0x20u);

    }
  }
  if (v4)
  {
    -[HFHomeKitDispatcher accessoryObserverDispatcher](self, "accessoryObserverDispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "proxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", v12);

  }
  else
  {
    objc_msgSend(v6, "setDelegate:", 0);
  }
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  objc_msgSend(v6, "cameraProfiles");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v72;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v72 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v17);
        if (v4)
        {
          -[HFHomeKitDispatcher cameraObserverDispatcher](self, "cameraObserverDispatcher");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "proxy");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v20 = 0;
        }
        objc_msgSend(v18, "snapshotControl");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setDelegate:", v20);

        objc_msgSend(v18, "streamControl");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setDelegate:", v20);

        objc_msgSend(v18, "userSettings");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setDelegate:", v20);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
    }
    while (v15);
  }

  objc_msgSend(v6, "profiles");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "na_map:", &__block_literal_global_597);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __67__HFHomeKitDispatcher__setDelegationEnabled_forAccessoryHierarchy___block_invoke_2;
  v69[3] = &unk_1EA7404D0;
  v70 = v4;
  v69[4] = self;
  objc_msgSend(v25, "na_each:", v69);

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  objc_msgSend(v6, "televisionProfiles");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v66;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v66 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v30);
        if (v4)
        {
          -[HFHomeKitDispatcher televisionObserverDispatcher](self, "televisionObserverDispatcher");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "proxy");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setDelegate:", v33);

        }
        else
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * v30), "setDelegate:", 0);
        }
        ++v30;
      }
      while (v28 != v30);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
    }
    while (v28);
  }

  if (v4)
  {
    -[HFHomeKitDispatcher softwareUpdateControllerObserverDispatcher](self, "softwareUpdateControllerObserverDispatcher");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "proxy");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = 0;
  }
  objc_msgSend(v6, "softwareUpdateController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setDelegate:", v34);

  if (v4)
  {

    -[HFHomeKitDispatcher softwareUpdateObserverDispatcher](self, "softwareUpdateObserverDispatcher");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "proxy");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
  }
  objc_msgSend(v6, "softwareUpdateController");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "availableUpdate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setDelegate:", v36);

  if (v4)
  {

    -[HFHomeKitDispatcher softwareUpdateManager](self, "softwareUpdateManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v6);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "startObservingSoftwareUpdatesForAccessories:", v40);
  }
  else
  {
    -[HFHomeKitDispatcher softwareUpdateManager](self, "softwareUpdateManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v6);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stopObservingSoftwareUpdatesForAccessories:", v40);
  }

  objc_msgSend(v6, "mediaProfile");
  v41 = (id)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    objc_msgSend(v6, "mediaProfile");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFHomeKitDispatcher _setDelegationEnabled:forMediaProfileContainer:session:](self, "_setDelegationEnabled:forMediaProfileContainer:session:", 1, v42, 0);

    v41 = 0;
    if (objc_msgSend(v6, "hf_isAppleTV"))
      v41 = v6;
    if (v4)
    {
      -[HFHomeKitDispatcher mediaDestinationControllerObserverDispatcher](self, "mediaDestinationControllerObserverDispatcher");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "proxy");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v43 = 0;
    }
    objc_msgSend(v41, "audioDestinationController");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setDelegate:", v43);

    if (v4)
    {

    }
  }
  if (!+[HFExecutionEnvironment isHomeWidgetRelatedProcess](HFExecutionEnvironment, "isHomeWidgetRelatedProcess"))
  {
    if (v4)
    {
      -[HFHomeKitDispatcher symptomsHandlerObserverDispatcher](self, "symptomsHandlerObserverDispatcher");
      v41 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "proxy");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v45 = 0;
    }
    objc_msgSend(v6, "symptomsHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setDelegate:", v45);

    if (v4)
    {

    }
  }
  objc_msgSend(v6, "hf_siriEndpointProfile");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    -[HFHomeKitDispatcher siriEndpointProfileObserverDispatcher](self, "siriEndpointProfileObserverDispatcher");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "proxy");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_siriEndpointProfile");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setDelegate:", v49);

  }
  objc_msgSend(v6, "lightProfiles");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v62;
    do
    {
      v55 = 0;
      do
      {
        if (*(_QWORD *)v62 != v54)
          objc_enumerationMutation(v51);
        v56 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v55);
        if (v4)
        {
          -[HFHomeKitDispatcher lightObserverDispatcher](self, "lightObserverDispatcher");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "proxy");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setDelegate:", v58);

        }
        else
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * v55), "setDelegate:", 0);
        }
        ++v55;
      }
      while (v53 != v55);
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
    }
    while (v53);
  }

}

- (NADelegateDispatcher)accessoryObserverDispatcher
{
  return self->_accessoryObserverDispatcher;
}

- (NADelegateDispatcher)softwareUpdateObserverDispatcher
{
  return self->_softwareUpdateObserverDispatcher;
}

- (NADelegateDispatcher)symptomsHandlerObserverDispatcher
{
  return self->_symptomsHandlerObserverDispatcher;
}

- (NADelegateDispatcher)softwareUpdateControllerObserverDispatcher
{
  return self->_softwareUpdateControllerObserverDispatcher;
}

- (void)addHomeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher homeObserverDispatcher](self, "homeObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (NADelegateDispatcher)homeObserverDispatcher
{
  return self->_homeObserverDispatcher;
}

- (void)addHomeManagerObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher homeManagerObserverDispatcher](self, "homeManagerObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (NADelegateDispatcher)homeManagerObserverDispatcher
{
  return self->_homeManagerObserverDispatcher;
}

- (void)addUserObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher userObserverDispatcher](self, "userObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (NADelegateDispatcher)userObserverDispatcher
{
  return self->_userObserverDispatcher;
}

- (void)addSymptomsHandlerObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher symptomsHandlerObserverDispatcher](self, "symptomsHandlerObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (void)addResidentDeviceObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher residentDeviceObserverDispatcher](self, "residentDeviceObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (NADelegateDispatcher)residentDeviceObserverDispatcher
{
  return self->_residentDeviceObserverDispatcher;
}

- (void)addMediaSessionObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher mediaSessionObserverDispatcher](self, "mediaSessionObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (NADelegateDispatcher)mediaSessionObserverDispatcher
{
  return self->_mediaSessionObserverDispatcher;
}

- (void)addMediaObjectObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher mediaObjectObserverDispatcher](self, "mediaObjectObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (NADelegateDispatcher)mediaObjectObserverDispatcher
{
  return self->_mediaObjectObserverDispatcher;
}

- (void)addLightObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher lightObserverDispatcher](self, "lightObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (NADelegateDispatcher)lightObserverDispatcher
{
  return self->_lightObserverDispatcher;
}

- (void)addHomeKitSettingsObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher homeKitSettingsObserverDispatcher](self, "homeKitSettingsObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (NADelegateDispatcher)homeKitSettingsObserverDispatcher
{
  return self->_homeKitSettingsObserverDispatcher;
}

- (void)addCameraObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher cameraObserverDispatcher](self, "cameraObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (NADelegateDispatcher)cameraObserverDispatcher
{
  return self->_cameraObserverDispatcher;
}

- (void)addWalletKeyDeviceStateObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher walletKeyDeviceStateObserverDispatcher](self, "walletKeyDeviceStateObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (NADelegateDispatcher)walletKeyDeviceStateObserverDispatcher
{
  return self->_walletKeyDeviceStateObserverDispatcher;
}

- (void)addTelevisionObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher televisionObserverDispatcher](self, "televisionObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (NADelegateDispatcher)televisionObserverDispatcher
{
  return self->_televisionObserverDispatcher;
}

- (void)addSymptomFixSessionObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher symptomFixSessionObserverDispatcher](self, "symptomFixSessionObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (NADelegateDispatcher)symptomFixSessionObserverDispatcher
{
  return self->_symptomFixSessionObserverDispatcher;
}

- (void)addSoftwareUpdateControllerObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher softwareUpdateControllerObserverDispatcher](self, "softwareUpdateControllerObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (void)addSiriEndpointProfileObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher siriEndpointProfileObserverDispatcher](self, "siriEndpointProfileObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (NADelegateDispatcher)siriEndpointProfileObserverDispatcher
{
  return self->_siriEndpointProfileObserverDispatcher;
}

- (void)addNetworkConfigurationObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher networkConfigurationObserverDispatcher](self, "networkConfigurationObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (NADelegateDispatcher)networkConfigurationObserverDispatcher
{
  return self->_networkConfigurationObserverDispatcher;
}

- (void)addMediaDestinationControllerObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher mediaDestinationControllerObserverDispatcher](self, "mediaDestinationControllerObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (NADelegateDispatcher)mediaDestinationControllerObserverDispatcher
{
  return self->_mediaDestinationControllerObserverDispatcher;
}

- (void)addHomePersonManagerObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher homePersonManagerDispatcher](self, "homePersonManagerDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (NADelegateDispatcher)homePersonManagerDispatcher
{
  return self->_homePersonManagerDispatcher;
}

- (void)addAudioControlObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher audioControlObserverDispatcher](self, "audioControlObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (NADelegateDispatcher)audioControlObserverDispatcher
{
  return self->_audioControlObserverDispatcher;
}

- (HFSoftwareUpdateManager)softwareUpdateManager
{
  return self->_softwareUpdateManager;
}

id __42__HFHomeKitDispatcher__defaultLogSettings__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "hf_prettyDescription");
  else
    objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __44__HFHomeKitDispatcher__requestSelectedHome___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[HFStateRestorationSettings sharedInstance](HFStateRestorationSettings, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setSelectedHomeIdentifier:", v2);

}

- (NAFuture)allHomesFuture
{
  _BOOL4 v3;
  id v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!-[HFHomeKitDispatcher willAcceptHomeFutures](self, "willAcceptHomeFutures"))
    return (NAFuture *)0;
  v3 = -[HFHomeKitDispatcher hasLoadedHomes](self, "hasLoadedHomes");
  v4 = objc_alloc_init(MEMORY[0x1E0D519D8]);
  v5 = v4;
  if (v3)
  {
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFHomeKitDispatcher _finishAllHomesPromises:](self, "_finishAllHomesPromises:", v6);

  }
  else
  {
    -[HFHomeKitDispatcher allHomesPromises](self, "allHomesPromises");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v5);

  }
  objc_msgSend(v5, "future");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NAFuture *)v9;
}

- (NAFuture)homeFuture
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (-[HFHomeKitDispatcher willAcceptHomeFutures](self, "willAcceptHomeFutures"))
  {
    if (-[HFHomeKitDispatcher hasLoadedHomes](self, "hasLoadedHomes")
      || (-[HFHomeKitDispatcher home](self, "home"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v3,
          v3))
    {
      v4 = objc_alloc_init(MEMORY[0x1E0D519D8]);
      v9[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFHomeKitDispatcher _finishHomePromises:](self, "_finishHomePromises:", v5);

    }
    else
    {
      v4 = objc_alloc_init(MEMORY[0x1E0D519D8]);
      -[HFHomeKitDispatcher homePromises](self, "homePromises");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v4);

    }
    objc_msgSend(v4, "future");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NAFuture *)v6;
}

- (BOOL)hasLoadedHomes
{
  return self->_hasLoadedHomes;
}

- (BOOL)willAcceptHomeFutures
{
  return self->_willAcceptHomeFutures;
}

- (void)_finishHomePromises:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        -[HFHomeKitDispatcher home](self, "home");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          -[HFHomeKitDispatcher home](self, "home");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "finishWithResult:", v11);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "finishWithError:", v11);
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)_finishAllHomesPromises:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        -[HFHomeKitDispatcher homeManager](self, "homeManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "homes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          -[HFHomeKitDispatcher homeManager](self, "homeManager");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "homes");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "sortedArrayUsingComparator:", &__block_literal_global_588);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "finishWithResult:", v14);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "finishWithError:", v12);
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

- (void)updateSelectedHome
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HFHomeKitDispatcher *v18;
  HFHomeKitDispatcher *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  NSObject *p_super;
  uint8_t buf[4];
  HFHomeKitDispatcher *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[HFHomeKitDispatcher homeManager](self, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    HFLogForCategory(0x24uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[HFHomeKitDispatcher homeManager](self, "homeManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentAccessory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFHomeKitDispatcher homeManager](self, "homeManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentAccessory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "home");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v34 = self;
      v35 = 2080;
      v36 = "-[HFHomeKitDispatcher updateSelectedHome]";
      v37 = 2112;
      v38 = v8;
      v39 = 2112;
      v40 = v11;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "(%@:%s) selected home is currentAccessory %@ home %@", buf, 0x2Au);

    }
    -[HFHomeKitDispatcher homeManager](self, "homeManager");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject currentAccessory](v12, "currentAccessory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
    goto LABEL_6;
  }
  if (-[HFHomeKitDispatcher selectedHomeFollowsLocation](self, "selectedHomeFollowsLocation"))
  {
    if ((objc_msgSend((id)objc_opt_class(), "allowHomeSensingOverride") & 1) == 0)
    {
      -[HFHomeKitDispatcher homeManager](self, "homeManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "currentHome");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        HFLogForCategory(0x24uLL);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          -[HFHomeKitDispatcher homeManager](self, "homeManager");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "currentHome");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v34 = self;
          v35 = 2080;
          v36 = "-[HFHomeKitDispatcher updateSelectedHome]";
          v37 = 2112;
          v38 = v27;
          _os_log_impl(&dword_1DD34E000, v25, OS_LOG_TYPE_DEFAULT, "(%@:%s) selected home is current home %@", buf, 0x20u);

        }
        -[HFHomeKitDispatcher homeManager](self, "homeManager");
        v12 = objc_claimAutoreleasedReturnValue();
        -[NSObject currentHome](v12, "currentHome");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "uniqueIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_5;
      }
    }
  }
  +[HFStateRestorationSettings sharedInstance](HFStateRestorationSettings, "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "selectedHomeIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x24uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v34 = self;
    v35 = 2080;
    v36 = "-[HFHomeKitDispatcher updateSelectedHome]";
    v37 = 2112;
    v38 = v15;
    _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "(%@:%s) selected home is synced identifier %@", buf, 0x20u);
  }
LABEL_6:

  if (v15)
  {
    -[HFHomeKitDispatcher homeManager](self, "homeManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "homes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __41__HFHomeKitDispatcher_updateSelectedHome__block_invoke;
    v31[3] = &unk_1EA72B630;
    v18 = v15;
    p_super = &v18->super;
    objc_msgSend(v17, "na_firstObjectPassingTest:", v31);
    v19 = (HFHomeKitDispatcher *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory(0x24uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v19)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v19;
        _os_log_impl(&dword_1DD34E000, v21, OS_LOG_TYPE_DEFAULT, "Loaded synced selected home %@", buf, 0xCu);
      }

      v22 = p_super;
      goto LABEL_26;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v18;
      _os_log_error_impl(&dword_1DD34E000, v21, OS_LOG_TYPE_ERROR, "Unable to find synced selected home matching identifier %@", buf, 0xCu);
    }

    v28 = p_super;
  }
  else
  {
    HFLogForCategory(0x24uLL);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD34E000, v28, OS_LOG_TYPE_DEFAULT, "No synced selected home found", buf, 2u);
    }
  }

  -[HFHomeKitDispatcher _primaryHome](self, "_primaryHome");
  v19 = (HFHomeKitDispatcher *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    -[HFHomeKitDispatcher homeManager](self, "homeManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "homes");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "firstObject");
    v19 = (HFHomeKitDispatcher *)objc_claimAutoreleasedReturnValue();

LABEL_26:
  }
  -[HFHomeKitDispatcher _requestSelectedHome:](self, "_requestSelectedHome:", v19);

}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)_requestSelectedHome:(id)a3
{
  HMHome *v4;
  void *v5;
  void *v6;
  HMHome *v7;
  void *v8;
  void *v9;
  HMHome *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  char v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  _QWORD block[4];
  HMHome *v26;
  uint8_t buf[4];
  HMHome *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (HMHome *)a3;
  -[HFHomeKitDispatcher homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v4;
  if (v6)
  {
    -[HFHomeKitDispatcher homeManager](self, "homeManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentAccessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "home");
    v10 = (HMHome *)objc_claimAutoreleasedReturnValue();

    if (v10 != v4)
    {
      HFLogForCategory(0x24uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v4;
        _os_log_error_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_ERROR, "Current accessory set, Ignoring requested home - %@", buf, 0xCu);
      }

    }
    -[HFHomeKitDispatcher homeManager](self, "homeManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentAccessory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "home");
    v7 = (HMHome *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory(0x24uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v7;
      _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "Selected home defaulting to currentAccessory Home - %@", buf, 0xCu);
    }

  }
  if (!v7)
  {
    -[HFHomeKitDispatcher _primaryHome](self, "_primaryHome");
    v7 = (HMHome *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0x24uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v7;
      _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "Selected home not specified - using primary home %@", buf, 0xCu);
    }

    if (!v7)
    {
      -[HFHomeKitDispatcher homeManager](self, "homeManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "homes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v7 = (HMHome *)objc_claimAutoreleasedReturnValue();

      HFLogForCategory(0x24uLL);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v7;
        _os_log_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_DEFAULT, "Primary home not specified - using first home %@", buf, 0xCu);
      }

    }
  }
  if (v7 != self->_selectedHome)
  {
    -[HMHome uniqueIdentifier](v7, "uniqueIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMHome uniqueIdentifier](self->_selectedHome, "uniqueIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) == 0)
    {
      HFLogForCategory(0x24uLL);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v7;
        _os_log_impl(&dword_1DD34E000, v22, OS_LOG_TYPE_DEFAULT, "Selected home is now %@", buf, 0xCu);
      }

      objc_storeStrong((id *)&self->_selectedHome, v7);
      if (-[HFHomeKitDispatcher _shouldPersistSelectedHomeToDefaults](self, "_shouldPersistSelectedHomeToDefaults")
        && !+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
      {
        HFLogForCategory(0x24uLL);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DD34E000, v23, OS_LOG_TYPE_DEFAULT, "Notifying local clients of selected home change and saving to preferences", buf, 2u);
        }

        dispatch_get_global_queue(-32768, 0);
        v24 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __44__HFHomeKitDispatcher__requestSelectedHome___block_invoke;
        block[3] = &unk_1EA727DD8;
        v26 = v7;
        dispatch_async(v24, block);

      }
      -[HFHomeKitDispatcher updateHome](self, "updateHome");
    }
  }

}

- (BOOL)_shouldPersistSelectedHomeToDefaults
{
  void *v2;
  void *v3;
  void *v4;

  -[HFHomeKitDispatcher homeManager](self, "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 0;
  else
    return objc_msgSend((id)objc_opt_class(), "allowHomeSensingOverride");
}

- (void)coordinator:(id)a3 locationSensingAvailabilityDidChange:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  -[HFHomeKitDispatcher homeManagerObserverDispatcher](self, "homeManagerObserverDispatcher", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "proxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFHomeKitDispatcher homeManager](self, "homeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeManager:didUpdateLocationSensingAvailability:", v7, v4);

}

- (void)stateRestorationSettings:(id)a3 selectedHomeIdentifierDidUpdateExternally:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  HFLogForCategory(0x24uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Received selected home changed notification. New selected home identifier: %@", (uint8_t *)&v7, 0xCu);
  }

  -[HFHomeKitDispatcher updateSelectedHome](self, "updateSelectedHome");
}

void __48__HFHomeKitDispatcher__setupHomeManagerObserver__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_handleHomeManagerDidUpdateHomes:", v4);
}

- (void)_handleHomeManagerDidUpdateHomes:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
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
  _BYTE v44[128];
  _BYTE v45[128];
  uint8_t v46[128];
  uint8_t buf[4];
  id v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x24uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "currentHome");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v48 = v4;
    v49 = 2112;
    v50 = v6;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "homeManagerDidUpdateHomes: %@, manager's currentHome: %@", buf, 0x16u);

  }
  if (-[HFHomeKitDispatcher hasLoadedHomes](self, "hasLoadedHomes"))
  {
    -[HFHomeKitDispatcher updateSelectedHome](self, "updateSelectedHome");
    HFLogForCategory(0x24uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "homeManagerDidFinishUnknownChange", buf, 2u);
    }

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    -[HFHomeKitDispatcher homeManagerObserverDispatcher](self, "homeManagerObserverDispatcher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "observers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v41 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v14, "homeManagerDidFinishUnknownChange:", v4);
          }
          else if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v14, "homeManagerDidUpdateHomes:", v4);
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v11);
    }
  }
  else
  {
    HFLogForCategory(0x31uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD34E000, v15, OS_SIGNPOST_INTERVAL_END, 0x1F5uLL, "HomeKitDataLoad", "HomeKit homes DB loaded", buf, 2u);
    }

    -[HFHomeKitDispatcher updateSelectedHome](self, "updateSelectedHome");
    -[HFHomeKitDispatcher setHasLoadedHomes:](self, "setHasLoadedHomes:", 1);
    -[HFHomeKitDispatcher homePromises](self, "homePromises");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFHomeKitDispatcher _finishHomePromises:](self, "_finishHomePromises:", v16);

    -[HFHomeKitDispatcher homePromises](self, "homePromises");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeAllObjects");

    -[HFHomeKitDispatcher allHomesPromises](self, "allHomesPromises");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFHomeKitDispatcher _finishAllHomesPromises:](self, "_finishAllHomesPromises:", v18);

    -[HFHomeKitDispatcher allHomesPromises](self, "allHomesPromises");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeAllObjects");

    HFLogForCategory(0x24uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD34E000, v20, OS_LOG_TYPE_DEFAULT, "homeManagerDidFinishInitialDatabaseLoad", buf, 2u);
    }

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[HFHomeKitDispatcher homeManagerObserverDispatcher](self, "homeManagerObserverDispatcher");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "observers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v37 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v27, "homeManagerDidFinishInitialDatabaseLoad:", v4);
          }
          else if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v27, "homeManagerDidUpdateHomes:", v4);
          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      }
      while (v24);
    }

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v4, "homes", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v33;
      do
      {
        for (k = 0; k != v29; ++k)
        {
          if (*(_QWORD *)v33 != v30)
            objc_enumerationMutation(v9);
          -[HFHomeKitDispatcher _updateRemoteAccessStateForHome:notifyingObservers:](self, "_updateRemoteAccessStateForHome:notifyingObservers:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * k), 0);
        }
        v29 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
      }
      while (v29);
    }
  }

}

- (NSMutableArray)homePromises
{
  return self->_homePromises;
}

- (NSMutableArray)allHomesPromises
{
  return self->_allHomesPromises;
}

- (void)setHasLoadedHomes:(BOOL)a3
{
  self->_hasLoadedHomes = a3;
}

- (void)_updateRemoteAccessStateForHome:(id)a3 notifyingObservers:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  HFHomeKitDispatcher *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    -[HFHomeKitDispatcher remoteAccessStateByHomeID](self, "remoteAccessStateByHomeID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v7, "hf_remoteAccessState");
    if (!v10 || objc_msgSend(v10, "integerValue") != v11)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFHomeKitDispatcher remoteAccessStateByHomeID](self, "remoteAccessStateByHomeID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uniqueIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

      if (v4)
      {
        -[HFHomeKitDispatcher homeObserverDispatcher](self, "homeObserverDispatcher");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "proxy");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "home:remoteAccessStateDidChange:", v7, v11);

      }
    }

  }
  else
  {
    HFLogForCategory(0x24uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = self;
      v21 = 2112;
      v22 = v18;
      _os_log_error_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_ERROR, "%@:%@: Unexpected nil home", (uint8_t *)&v19, 0x16u);

    }
  }

}

- (NSMutableDictionary)remoteAccessStateByHomeID
{
  return self->_remoteAccessStateByHomeID;
}

id __67__HFHomeKitDispatcher__setDelegationEnabled_forAccessoryHierarchy___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)updateHome
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
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
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[HFHomeKitDispatcher overrideHome](self, "overrideHome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[HFHomeKitDispatcher selectedHome](self, "selectedHome");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  -[HFHomeKitDispatcher home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if ((v10 & 1) == 0)
  {
    -[HFHomeKitDispatcher _setDelegationEnabledForObjectsInCurrentHome:](self, "_setDelegationEnabledForObjectsInCurrentHome:", 0);
    HFLogForCategory(0x24uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 138412290;
      v26 = v6;
      _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "Updating dispatcher home to %@", (uint8_t *)&v25, 0xCu);
    }

    -[HFHomeKitDispatcher setHome:](self, "setHome:", v6);
    -[HFHomeKitDispatcher _setDelegationEnabledForObjectsInCurrentHome:](self, "_setDelegationEnabledForObjectsInCurrentHome:", 1);
    -[HFHomeKitDispatcher home](self, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[HFHomeKitDispatcher firstHomeAddedPromises](self, "firstHomeAddedPromises");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFHomeKitDispatcher _finishFirstHomeAddedPromises:](self, "_finishFirstHomeAddedPromises:", v13);

      -[HFHomeKitDispatcher firstHomeAddedPromises](self, "firstHomeAddedPromises");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeAllObjects");

    }
    if (-[HFHomeKitDispatcher hasLoadedHomes](self, "hasLoadedHomes"))
    {
      -[HFHomeKitDispatcher homeManagerObserverDispatcher](self, "homeManagerObserverDispatcher");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "proxy");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFHomeKitDispatcher homeManager](self, "homeManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFHomeKitDispatcher home](self, "home");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "homeKitDispatcher:manager:didChangeHome:", self, v17, v18);

    }
    v19 = (void *)MEMORY[0x1E0C99E60];
    -[HFHomeKitDispatcher home](self, "home");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "hf_allLightProfiles");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithArray:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFHomeKitDispatcher fetchSettingsForLightProfiles:](self, "fetchSettingsForLightProfiles:", v22);
  }
  if (objc_msgSend((id)objc_opt_class(), "synchronizesHomeDataModel"))
  {
    -[HFHomeKitDispatcher home](self, "home");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D32A68], "shared");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setCurrentHome:", v23);

  }
}

- (NSMutableArray)firstHomeAddedPromises
{
  return self->_firstHomeAddedPromises;
}

- (void)_setDelegationEnabledForObjectsInCurrentHome:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
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

  v3 = a3;
  v52 = *MEMORY[0x1E0C80C00];
  -[HFHomeKitDispatcher _setSoftwareUpateControllerV2DelegationEnabled:](self, "_setSoftwareUpateControllerV2DelegationEnabled:");
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[HFHomeKitDispatcher home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v45;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v45 != v9)
          objc_enumerationMutation(v6);
        -[HFHomeKitDispatcher _setDelegationEnabled:forAccessoryHierarchy:](self, "_setDelegationEnabled:forAccessoryHierarchy:", v3, *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    }
    while (v8);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[HFHomeKitDispatcher home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mediaSystems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v41;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v41 != v15)
          objc_enumerationMutation(v12);
        -[HFHomeKitDispatcher _setDelegationEnabled:forMediaProfileContainer:session:](self, "_setDelegationEnabled:forMediaProfileContainer:session:", v3, *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v16++), 0);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    }
    while (v14);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[HFHomeKitDispatcher home](self, "home");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "residentDevices");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v37;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v37 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v22);
        if (v3)
        {
          -[HFHomeKitDispatcher residentDeviceObserverDispatcher](self, "residentDeviceObserverDispatcher");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "proxy");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setDelegate:", v25);

        }
        else
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v22), "setDelegate:", 0);
        }
        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
    }
    while (v20);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[HFHomeKitDispatcher home](self, "home", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "hf_allUsersIncludingCurrentUser");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v33;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v33 != v30)
          objc_enumerationMutation(v27);
        -[HFHomeKitDispatcher _setDelegationEnabled:forUser:](self, "_setDelegationEnabled:forUser:", v3, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v31++));
      }
      while (v29 != v31);
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
    }
    while (v29);
  }

  -[HFHomeKitDispatcher _setHomePersonManagerObservationEnabled:](self, "_setHomePersonManagerObservationEnabled:", v3);
}

- (void)_setSoftwareUpateControllerV2DelegationEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  if (a3)
  {
    -[HFHomeKitDispatcher softwareUpdateControllerV2ObserverDispatcher](self, "softwareUpdateControllerV2ObserverDispatcher");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "proxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[HFHomeKitDispatcher home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "softwareUpdateController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", v5);

  if (v3)
  {

  }
  else
  {
    -[HFHomeKitDispatcher softwareUpdateManager](self, "softwareUpdateManager");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resetCaches");
  }

}

- (void)_setHomePersonManagerObservationEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[HFHomeKitDispatcher home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HFHomeKitDispatcher homePersonManagerDispatcher](self, "homePersonManagerDispatcher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "proxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(v8, "addObserver:", v7);
    else
      objc_msgSend(v8, "removeObserver:", v7);

  }
}

- (void)removeWalletKeyDeviceStateObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher walletKeyDeviceStateObserverDispatcher](self, "walletKeyDeviceStateObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)removeUserObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher userObserverDispatcher](self, "userObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)removeTelevisionObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher televisionObserverDispatcher](self, "televisionObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)removeSymptomsHandlerObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher symptomsHandlerObserverDispatcher](self, "symptomsHandlerObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)removeSymptomFixSessionObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher symptomFixSessionObserverDispatcher](self, "symptomFixSessionObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)removeSoftwareUpdateObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher softwareUpdateObserverDispatcher](self, "softwareUpdateObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)removeSoftwareUpdateControllerObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher softwareUpdateControllerObserverDispatcher](self, "softwareUpdateControllerObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)removeSiriEndpointProfileObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher siriEndpointProfileObserverDispatcher](self, "siriEndpointProfileObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)removeResidentDeviceObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher residentDeviceObserverDispatcher](self, "residentDeviceObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)removeNetworkConfigurationObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher networkConfigurationObserverDispatcher](self, "networkConfigurationObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)removeMediaSessionObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher mediaSessionObserverDispatcher](self, "mediaSessionObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)removeMediaObjectObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher mediaObjectObserverDispatcher](self, "mediaObjectObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)removeMediaDestinationControllerObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher mediaDestinationControllerObserverDispatcher](self, "mediaDestinationControllerObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)removeLightObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher lightObserverDispatcher](self, "lightObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)removeHomePersonManagerObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher homePersonManagerDispatcher](self, "homePersonManagerDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)removeHomeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher homeObserverDispatcher](self, "homeObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)removeHomeManagerObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher homeManagerObserverDispatcher](self, "homeManagerObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)removeHomeKitSettingsObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher homeKitSettingsObserverDispatcher](self, "homeKitSettingsObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)removeCameraObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher cameraObserverDispatcher](self, "cameraObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)removeAudioControlObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher audioControlObserverDispatcher](self, "audioControlObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)removeAccessoryObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher accessoryObserverDispatcher](self, "accessoryObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)addSoftwareUpdateControllerV2Observer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher softwareUpdateControllerV2ObserverDispatcher](self, "softwareUpdateControllerV2ObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (NADelegateDispatcher)softwareUpdateControllerV2ObserverDispatcher
{
  return self->_softwareUpdateControllerV2ObserverDispatcher;
}

void __45__HFHomeKitDispatcher_updateHomeSensingState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  _BYTE v26[14];
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory(0x2AuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v3, "BOOLValue");
    objc_msgSend(WeakRetained, "homeManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentHome");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hf_displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "selectedHome");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hf_displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 67109634;
    *(_DWORD *)v26 = v6;
    *(_WORD *)&v26[4] = 2112;
    *(_QWORD *)&v26[6] = v9;
    v27 = 2112;
    v28 = v11;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "updateHomeSensingState - Home Sensing: isSensingEnabled? %{BOOL}d homeManager.currentHome: %@ selectedHome: %@", (uint8_t *)&v25, 0x1Cu);

  }
  if (objc_msgSend(v3, "BOOLValue"))
  {
    objc_msgSend(WeakRetained, "homeManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentHome");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
LABEL_9:

      goto LABEL_10;
    }
    v14 = (void *)v13;
    objc_msgSend(WeakRetained, "homeManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currentHome");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uniqueIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "selectedHome");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "uniqueIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "isEqual:", v19);

    if ((v20 & 1) == 0)
    {
      HFLogForCategory(0x2AuLL);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(WeakRetained, "homeManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "currentHome");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138412290;
        *(_QWORD *)v26 = v23;
        _os_log_impl(&dword_1DD34E000, v21, OS_LOG_TYPE_DEFAULT, "Home Sensing: requesting home %@", (uint8_t *)&v25, 0xCu);

      }
      objc_msgSend(WeakRetained, "homeManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "currentHome");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_requestSelectedHome:", v24);

      goto LABEL_9;
    }
  }
LABEL_10:

}

- (HMHome)selectedHome
{
  return self->_selectedHome;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (void)_setDelegationEnabled:(BOOL)a3 forUser:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  uint64_t v22;

  v4 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HFHomeKitDispatcher home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userSettingsForHome:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "settings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rootGroup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    HFLogForCategory(0x24uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v20 = 138412290;
      v21 = v6;
      _os_log_error_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_ERROR, "Attempting to set delegate for user %@ settings - but settings are invalid", (uint8_t *)&v20, 0xCu);
    }

  }
  objc_msgSend(v8, "privateSettings");
  v12 = objc_claimAutoreleasedReturnValue();
  -[NSObject rootGroup](v12, "rootGroup");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (v4)
    {
LABEL_7:
      -[HFHomeKitDispatcher homeKitSettingsObserverDispatcher](self, "homeKitSettingsObserverDispatcher");
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject proxy](v12, "proxy");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
  else
  {
    HFLogForCategory(0x24uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v20 = 138412290;
      v21 = v6;
      _os_log_error_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_ERROR, "Attempting to set delegate for user %@ private settings - but private settings are invalid", (uint8_t *)&v20, 0xCu);
    }

    if (v4)
      goto LABEL_7;
  }
  v14 = 0;
LABEL_12:
  objc_msgSend(v8, "settings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDelegate:", v14);

  if (v4)
  {

    -[HFHomeKitDispatcher homeKitSettingsObserverDispatcher](self, "homeKitSettingsObserverDispatcher");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject proxy](v12, "proxy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v8, "privateSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDelegate:", v16);

  if (v4)
  {

    -[HFHomeKitDispatcher userObserverDispatcher](self, "userObserverDispatcher");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "proxy");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", v19);

  }
  else
  {
    objc_msgSend(v6, "setDelegate:", 0);
  }

}

- (void)_finishFirstHomeAddedPromises:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[8];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HFHomeKitDispatcher home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFHomeKitDispatcher.m"), 1603, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.home != nil"));

  }
  if (objc_msgSend(v5, "count"))
  {
    HFLogForCategory(0x24uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Finishing firstHomeAddedPromises now that we have a home", buf, 2u);
    }

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
        -[HFHomeKitDispatcher home](self, "home");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "finishWithResult:", v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v10);
  }

}

uint64_t __46__HFHomeKitDispatcher_homeSensingActiveFuture__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "locationSensingAvailableFuture");
}

uint64_t __41__HFHomeKitDispatcher_updateSelectedHome__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

id __46__HFHomeKitDispatcher_homeSensingActiveFuture__block_invoke_2(id *a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0D519C0];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = objc_msgSend(a2, "BOOLValue");
  if (v5)
  {
    objc_msgSend(a1[4], "locationCoordinator");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(a1, "homeSensingEnabled");
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v4, "numberWithInt:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  return v8;
}

- (NAFuture)locationSensingAvailableFuture
{
  void *v3;
  void *v4;
  void *v5;

  -[HFHomeKitDispatcher locationCoordinator](self, "locationCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HFHomeKitDispatcher locationCoordinator](self, "locationCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationSensingAvailableFuture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAA0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NAFuture *)v5;
}

- (HFLocationSensingCoordinator)locationCoordinator
{
  return self->_locationCoordinator;
}

- (void)updateHomeSensingState
{
  NSObject *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[8];
  id location;

  objc_initWeak(&location, self);
  HFLogForCategory(0x2AuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "updateHomeSensingState - Home Sensing: will check and switch homes if necessary", buf, 2u);
  }

  -[HFHomeKitDispatcher homeSensingActiveFuture](self, "homeSensingActiveFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__HFHomeKitDispatcher_updateHomeSensingState__block_invoke;
  v6[3] = &unk_1EA740548;
  objc_copyWeak(&v7, &location);
  v5 = (id)objc_msgSend(v4, "addCompletionBlock:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)setLocationCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_locationCoordinator, a3);
}

- (id)homeSensingActiveFuture
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[5];

  -[HFHomeKitDispatcher locationCoordinatorSetupFuture](self, "locationCoordinatorSetupFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__HFHomeKitDispatcher_homeSensingActiveFuture__block_invoke;
  v11[3] = &unk_1EA72F4A8;
  v11[4] = self;
  objc_msgSend(v3, "flatMap:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __46__HFHomeKitDispatcher_homeSensingActiveFuture__block_invoke_2;
  v10[3] = &unk_1EA740520;
  v10[4] = self;
  objc_msgSend(v5, "flatMap:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reschedule:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NAFuture)locationCoordinatorSetupFuture
{
  return self->_locationCoordinatorSetupFuture;
}

void __39__HFHomeKitDispatcher_sharedDispatcher__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ED379E68;
  qword_1ED379E68 = (uint64_t)v1;

}

- (HFHomeKitDispatcher)init
{
  HFHomeKitDispatcher *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  NSMutableArray *homePromises;
  uint64_t v7;
  NSMutableArray *firstHomeAddedPromises;
  uint64_t v9;
  NSMutableArray *allHomesPromises;
  uint64_t v11;
  NSMutableDictionary *remoteAccessStateByHomeID;
  HFHomeKitPreferencesUtilities *v13;
  HFHomeManagerCreator *v14;
  void *v15;
  uint64_t v16;
  HFHomeManagerCreator *v17;
  void *v18;
  uint64_t v19;
  HFHomeKitDispatcher *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  NSObject *v26;
  id v27;
  HFHomeKitAccessorySettingsDataSource *v28;
  HFHomeKitAccessorySettingsDataSource *accessorySettingsDataSource;
  HFHomeKitDispatcher *v30;
  _QWORD handler[4];
  id v33;
  id buf;
  _QWORD v35[4];
  HFHomeKitDispatcher *v36;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)HFHomeKitDispatcher;
  v2 = -[HFHomeKitDispatcher init](&v37, sel_init);
  if (v2)
  {
    HFLogForCategory(0x24uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Initializing HomeKit dispatcher", (uint8_t *)&buf, 2u);
    }

    HFLogForCategory(0x31uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DD34E000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0x1F5uLL, "HomeKitDataLoad", "Start HomeKit Warmup", (uint8_t *)&buf, 2u);
    }

    -[HFHomeKitDispatcher _initializeObservers](v2, "_initializeObservers");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    homePromises = v2->_homePromises;
    v2->_homePromises = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    firstHomeAddedPromises = v2->_firstHomeAddedPromises;
    v2->_firstHomeAddedPromises = (NSMutableArray *)v7;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    allHomesPromises = v2->_allHomesPromises;
    v2->_allHomesPromises = (NSMutableArray *)v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    remoteAccessStateByHomeID = v2->_remoteAccessStateByHomeID;
    v2->_remoteAccessStateByHomeID = (NSMutableDictionary *)v11;

    v2->_willAcceptHomeFutures = 0;
    v13 = objc_alloc_init(HFHomeKitPreferencesUtilities);
    v14 = [HFHomeManagerCreator alloc];
    +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "hostProcess");
    v17 = -[HFHomeManagerCreator initWithHostProcess:configuration:homeStatus:delegate:](v14, "initWithHostProcess:configuration:homeStatus:delegate:", v16, qword_1ED379E60, v13, v2);
    -[HFHomeKitDispatcher setHomeManagerCreator:](v2, "setHomeManagerCreator:", v17);

    -[HFHomeKitDispatcher _createHomeManagerIfNecessary](v2, "_createHomeManagerIfNecessary");
    -[HFHomeKitDispatcher allHomesFuture](v2, "allHomesFuture");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __27__HFHomeKitDispatcher_init__block_invoke;
    v35[3] = &unk_1EA730B78;
    v20 = v2;
    v36 = v20;
    v21 = (id)objc_msgSend(v18, "addSuccessBlock:", v35);
    -[HFHomeKitDispatcher _setupLocationSensingCoordinator](v20, "_setupLocationSensingCoordinator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFHomeKitDispatcher setLocationCoordinatorSetupFuture:](v20, "setLocationCoordinatorSetupFuture:", v22);

    +[HFHomeAppInstallStateArbiter sharedInstance](HFHomeAppInstallStateArbiter, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:", v20);

    +[HFStateRestorationSettings sharedInstance](HFStateRestorationSettings, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:", v20);

    objc_initWeak(&buf, v20);
    v25 = (const char *)*MEMORY[0x1E0CB9060];
    v26 = MEMORY[0x1E0C80D38];
    v27 = MEMORY[0x1E0C80D38];
    handler[0] = v19;
    handler[1] = 3221225472;
    handler[2] = __27__HFHomeKitDispatcher_init__block_invoke_2;
    handler[3] = &unk_1EA727D48;
    objc_copyWeak(&v33, &buf);
    notify_register_dispatch(v25, &v20->_homeKitPreferencesChangedNotifyToken, v26, handler);

    if (v20->_homeManager)
    {
      v28 = -[HFHomeKitAccessorySettingsDataSource initWithHomeManager:]([HFHomeKitAccessorySettingsDataSource alloc], "initWithHomeManager:", v20->_homeManager);
      accessorySettingsDataSource = v20->_accessorySettingsDataSource;
      v20->_accessorySettingsDataSource = v28;

    }
    -[HFHomeKitDispatcher _setupStateDumpHandlers](v20, "_setupStateDumpHandlers");
    v30 = v20;
    objc_destroyWeak(&v33);
    objc_destroyWeak(&buf);

  }
  return v2;
}

- (void)setLocationCoordinatorSetupFuture:(id)a3
{
  objc_storeStrong((id *)&self->_locationCoordinatorSetupFuture, a3);
}

- (void)setHomeManagerCreator:(id)a3
{
  objc_storeStrong((id *)&self->_homeManagerCreator, a3);
}

- (id)_setupLocationSensingCoordinator
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v11[4];
  id v12;
  id location;
  _QWORD block[5];

  v3 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__HFHomeKitDispatcher__setupLocationSensingCoordinator__block_invoke;
  block[3] = &unk_1EA727DD8;
  block[4] = self;
  if (qword_1ED379E78 != -1)
    dispatch_once(&qword_1ED379E78, block);
  if (byte_1ED379E5B)
  {
    objc_initWeak(&location, self);
    +[HFHomeAppInstallStateArbiter sharedInstance](HFHomeAppInstallStateArbiter, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeAppInstalledFuture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D28698], "mainScheduler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reschedule:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v3;
    v11[1] = 3221225472;
    v11[2] = __55__HFHomeKitDispatcher__setupLocationSensingCoordinator__block_invoke_580;
    v11[3] = &unk_1EA72F828;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v7, "flatMap:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }
  else
  {
    HFLogForCategory(0x2AuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location) = 0;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Skipping setup of Home Sensing", (uint8_t *)&location, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (void)_createHomeManagerIfNecessary
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  -[HFHomeKitDispatcher homeManager](self, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[HFHomeKitDispatcher homeManagerCreator](self, "homeManagerCreator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "canCreateHomeManager");

    if ((_DWORD)v5)
    {
      -[HFHomeKitDispatcher homeManagerCreator](self, "homeManagerCreator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "createHomeManagerIfNeeded");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[HFHomeKitDispatcher setHomeManagerAndUpdateDelegate:](self, "setHomeManagerAndUpdateDelegate:", v7);
        HFLogForCategory(0x24uLL);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Home Manager created inline", buf, 2u);
        }

      }
    }
    else
    {
      HFLogForCategory(0x24uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Not creating home manager, refusing to accept any home futures until one is set.", v10, 2u);
      }

      -[HFHomeKitDispatcher setWillAcceptHomeFutures:](self, "setWillAcceptHomeFutures:", 0);
    }
    -[HFHomeKitDispatcher setWillAcceptHomeFutures:](self, "setWillAcceptHomeFutures:", v5);
  }
}

- (HFHomeManagerCreator)homeManagerCreator
{
  return self->_homeManagerCreator;
}

- (void)setWillAcceptHomeFutures:(BOOL)a3
{
  self->_willAcceptHomeFutures = a3;
}

- (void)setHomeManagerAndUpdateDelegate:(id)a3
{
  id v5;
  NSObject *v6;
  HMHome *home;
  HMHome *overrideHome;
  HMHome *selectedHome;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory(0x24uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v5;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Setting home manager to %@ and awaiting home update", (uint8_t *)&v13, 0xCu);
  }

  self->_hasLoadedHomes = 0;
  home = self->_home;
  self->_home = 0;

  overrideHome = self->_overrideHome;
  self->_overrideHome = 0;

  selectedHome = self->_selectedHome;
  self->_selectedHome = 0;

  objc_storeStrong((id *)&self->_homeManager, a3);
  self->_willAcceptHomeFutures = v5 != 0;
  if (objc_msgSend((id)objc_opt_class(), "synchronizesHomeDataModel"))
  {
    objc_msgSend(MEMORY[0x1E0D32A68], "shared");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHomeManager:", v5);

  }
  -[HFHomeKitDispatcher homeManagerObserverDispatcher](self, "homeManagerObserverDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "proxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMHomeManager setDelegate:](self->_homeManager, "setDelegate:", v12);

  if (!v5)
    -[HFHomeKitDispatcher _initializeObservers](self, "_initializeObservers");

}

- (void)_initializeObservers
{
  HFAccessoryDiagnosticInfoManager *v3;
  HFAccessoryDiagnosticInfoManager *diagnosticInfoManager;
  void *v5;
  void *v6;
  NADelegateDispatcher *v7;
  NADelegateDispatcher *softwareUpdateObserverDispatcher;
  HFSoftwareUpdateManager *v9;
  HFSoftwareUpdateManager *softwareUpdateManager;
  void *v11;
  void *v12;
  NADelegateDispatcher *v13;
  NADelegateDispatcher *siriEndpointProfileObserverDispatcher;
  void *v15;
  void *v16;
  NADelegateDispatcher *v17;
  NADelegateDispatcher *audioControlObserverDispatcher;
  void *v19;
  void *v20;
  NADelegateDispatcher *v21;
  NADelegateDispatcher *cameraObserverDispatcher;
  void *v23;
  void *v24;
  NADelegateDispatcher *v25;
  NADelegateDispatcher *userObserverDispatcher;
  void *v27;
  void *v28;
  NADelegateDispatcher *v29;
  NADelegateDispatcher *symptomsHandlerObserverDispatcher;
  void *v31;
  void *v32;
  NADelegateDispatcher *v33;
  NADelegateDispatcher *homeKitSettingsObserverDispatcher;
  void *v35;
  void *v36;
  NADelegateDispatcher *v37;
  NADelegateDispatcher *networkConfigurationObserverDispatcher;
  void *v39;
  void *v40;
  NADelegateDispatcher *v41;
  NADelegateDispatcher *televisionObserverDispatcher;
  void *v43;
  void *v44;
  NADelegateDispatcher *v45;
  NADelegateDispatcher *homePersonManagerDispatcher;
  void *v47;
  void *v48;
  NADelegateDispatcher *v49;
  NADelegateDispatcher *lightObserverDispatcher;
  void *v51;
  void *v52;
  NADelegateDispatcher *v53;
  NADelegateDispatcher *walletKeyDeviceStateObserverDispatcher;
  void *v55;
  void *v56;
  NADelegateDispatcher *v57;
  NADelegateDispatcher *mediaDestinationControllerObserverDispatcher;
  int64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;

  -[HFHomeKitDispatcher _setupHomeManagerObserver](self, "_setupHomeManagerObserver");
  -[HFHomeKitDispatcher _setupHomeObserver](self, "_setupHomeObserver");
  -[HFHomeKitDispatcher _setupAccessoryObserver](self, "_setupAccessoryObserver");
  -[HFHomeKitDispatcher _setupResidentDeviceObserver](self, "_setupResidentDeviceObserver");
  -[HFHomeKitDispatcher _setupMediaObjectObserver](self, "_setupMediaObjectObserver");
  -[HFHomeKitDispatcher _setupMediaSessionObserver](self, "_setupMediaSessionObserver");
  -[HFHomeKitDispatcher _setupSofwareUpdateControllerObserver](self, "_setupSofwareUpdateControllerObserver");
  -[HFHomeKitDispatcher _setupSofwareUpdateControllerV2Observer](self, "_setupSofwareUpdateControllerV2Observer");
  v3 = -[HFAccessoryDiagnosticInfoManager initWithDispatcher:]([HFAccessoryDiagnosticInfoManager alloc], "initWithDispatcher:", self);
  diagnosticInfoManager = self->_diagnosticInfoManager;
  self->_diagnosticInfoManager = v3;

  v5 = (void *)MEMORY[0x1E0D519A8];
  objc_msgSend((id)objc_opt_class(), "_defaultLogSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dispatcherWithProtocol:logSettings:", &unk_1F040C4A8, v6);
  v7 = (NADelegateDispatcher *)objc_claimAutoreleasedReturnValue();
  softwareUpdateObserverDispatcher = self->_softwareUpdateObserverDispatcher;
  self->_softwareUpdateObserverDispatcher = v7;

  if (!+[HFExecutionEnvironment isHomeWidgetRelatedProcess](HFExecutionEnvironment, "isHomeWidgetRelatedProcess"))
  {
    v9 = -[HFSoftwareUpdateManager initWithDispatcher:]([HFSoftwareUpdateManager alloc], "initWithDispatcher:", self);
    softwareUpdateManager = self->_softwareUpdateManager;
    self->_softwareUpdateManager = v9;

  }
  v11 = (void *)MEMORY[0x1E0D519A8];
  objc_msgSend((id)objc_opt_class(), "_defaultLogSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dispatcherWithProtocol:logSettings:", &unk_1F040CF08, v12);
  v13 = (NADelegateDispatcher *)objc_claimAutoreleasedReturnValue();
  siriEndpointProfileObserverDispatcher = self->_siriEndpointProfileObserverDispatcher;
  self->_siriEndpointProfileObserverDispatcher = v13;

  -[HFHomeKitDispatcher _setupSymptomFixSessionObserver](self, "_setupSymptomFixSessionObserver");
  v15 = (void *)MEMORY[0x1E0D519A8];
  objc_msgSend((id)objc_opt_class(), "_defaultLogSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dispatcherWithProtocol:logSettings:", &unk_1F040BCC8, v16);
  v17 = (NADelegateDispatcher *)objc_claimAutoreleasedReturnValue();
  audioControlObserverDispatcher = self->_audioControlObserverDispatcher;
  self->_audioControlObserverDispatcher = v17;

  v19 = (void *)MEMORY[0x1E0D519A8];
  objc_msgSend((id)objc_opt_class(), "_defaultLogSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dispatcherWithProtocol:logSettings:", &unk_1F040BA68, v20);
  v21 = (NADelegateDispatcher *)objc_claimAutoreleasedReturnValue();
  cameraObserverDispatcher = self->_cameraObserverDispatcher;
  self->_cameraObserverDispatcher = v21;

  v23 = (void *)MEMORY[0x1E0D519A8];
  objc_msgSend((id)objc_opt_class(), "_defaultLogSettings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "dispatcherWithProtocol:logSettings:", &unk_1F040C9A0, v24);
  v25 = (NADelegateDispatcher *)objc_claimAutoreleasedReturnValue();
  userObserverDispatcher = self->_userObserverDispatcher;
  self->_userObserverDispatcher = v25;

  v27 = (void *)MEMORY[0x1E0D519A8];
  objc_msgSend((id)objc_opt_class(), "_defaultLogSettings");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "dispatcherWithProtocol:logSettings:", &unk_1F040C5C8, v28);
  v29 = (NADelegateDispatcher *)objc_claimAutoreleasedReturnValue();
  symptomsHandlerObserverDispatcher = self->_symptomsHandlerObserverDispatcher;
  self->_symptomsHandlerObserverDispatcher = v29;

  v31 = (void *)MEMORY[0x1E0D519A8];
  objc_msgSend((id)objc_opt_class(), "_defaultLogSettings");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "dispatcherWithProtocol:logSettings:", &unk_1F03FC690, v32);
  v33 = (NADelegateDispatcher *)objc_claimAutoreleasedReturnValue();
  homeKitSettingsObserverDispatcher = self->_homeKitSettingsObserverDispatcher;
  self->_homeKitSettingsObserverDispatcher = v33;

  v35 = (void *)MEMORY[0x1E0D519A8];
  objc_msgSend((id)objc_opt_class(), "_defaultLogSettings");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "dispatcherWithProtocol:logSettings:", &unk_1F040BFF0, v36);
  v37 = (NADelegateDispatcher *)objc_claimAutoreleasedReturnValue();
  networkConfigurationObserverDispatcher = self->_networkConfigurationObserverDispatcher;
  self->_networkConfigurationObserverDispatcher = v37;

  v39 = (void *)MEMORY[0x1E0D519A8];
  objc_msgSend((id)objc_opt_class(), "_defaultLogSettings");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "dispatcherWithProtocol:logSettings:", &unk_1F040CA90, v40);
  v41 = (NADelegateDispatcher *)objc_claimAutoreleasedReturnValue();
  televisionObserverDispatcher = self->_televisionObserverDispatcher;
  self->_televisionObserverDispatcher = v41;

  v43 = (void *)MEMORY[0x1E0D519A8];
  objc_msgSend((id)objc_opt_class(), "_defaultLogSettings");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "dispatcherWithProtocol:logSettings:", &unk_1F040CC80, v44);
  v45 = (NADelegateDispatcher *)objc_claimAutoreleasedReturnValue();
  homePersonManagerDispatcher = self->_homePersonManagerDispatcher;
  self->_homePersonManagerDispatcher = v45;

  v47 = (void *)MEMORY[0x1E0D519A8];
  objc_msgSend((id)objc_opt_class(), "_defaultLogSettings");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "dispatcherWithProtocol:logSettings:", &unk_1F040D1A8, v48);
  v49 = (NADelegateDispatcher *)objc_claimAutoreleasedReturnValue();
  lightObserverDispatcher = self->_lightObserverDispatcher;
  self->_lightObserverDispatcher = v49;

  v51 = (void *)MEMORY[0x1E0D519A8];
  objc_msgSend((id)objc_opt_class(), "_defaultLogSettings");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "dispatcherWithProtocol:logSettings:", &unk_1F040D340, v52);
  v53 = (NADelegateDispatcher *)objc_claimAutoreleasedReturnValue();
  walletKeyDeviceStateObserverDispatcher = self->_walletKeyDeviceStateObserverDispatcher;
  self->_walletKeyDeviceStateObserverDispatcher = v53;

  v55 = (void *)MEMORY[0x1E0D519A8];
  objc_msgSend((id)objc_opt_class(), "_defaultLogSettings");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "dispatcherWithProtocol:logSettings:", &unk_1F040D0C8, v56);
  v57 = (NADelegateDispatcher *)objc_claimAutoreleasedReturnValue();
  mediaDestinationControllerObserverDispatcher = self->_mediaDestinationControllerObserverDispatcher;
  self->_mediaDestinationControllerObserverDispatcher = v57;

  if (objc_msgSend((id)objc_opt_class(), "synchronizesHomeDataModel"))
  {
    v59 = -[HFHomeKitDispatcher _dataModelContextForCurrentEnvironment](self, "_dataModelContextForCurrentEnvironment");
    objc_msgSend(MEMORY[0x1E0D32A68], "setContext:", v59);
    objc_msgSend(MEMORY[0x1E0D32A68], "shared");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFHomeKitDispatcher addHomeManagerObserver:](self, "addHomeManagerObserver:", v60);

    objc_msgSend(MEMORY[0x1E0D32A68], "shared");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFHomeKitDispatcher addHomeObserver:](self, "addHomeObserver:", v61);

    objc_msgSend(MEMORY[0x1E0D32A68], "shared");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFHomeKitDispatcher addAccessoryObserver:](self, "addAccessoryObserver:", v62);

    objc_msgSend(MEMORY[0x1E0D32A68], "shared");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFHomeKitDispatcher addMediaSessionObserver:](self, "addMediaSessionObserver:", v63);

    objc_msgSend(MEMORY[0x1E0D32A68], "shared");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFHomeKitDispatcher addMediaObjectObserver:](self, "addMediaObjectObserver:", v64);

    objc_msgSend(MEMORY[0x1E0D32A68], "shared");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFHomeKitDispatcher addResidentDeviceObserver:](self, "addResidentDeviceObserver:", v65);

    objc_msgSend(MEMORY[0x1E0D32A68], "shared");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFHomeKitDispatcher addLightObserver:](self, "addLightObserver:", v66);

    objc_msgSend(MEMORY[0x1E0D32A68], "shared");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFHomeKitDispatcher addSoftwareUpdateObserver:](self, "addSoftwareUpdateObserver:", v67);

    objc_msgSend(MEMORY[0x1E0D32A68], "shared");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFHomeKitDispatcher addSoftwareUpdateControllerV2Observer:](self, "addSoftwareUpdateControllerV2Observer:", v68);

    objc_msgSend(MEMORY[0x1E0D32A68], "shared");
    v69 = (id)objc_claimAutoreleasedReturnValue();
    -[HFHomeKitDispatcher addSymptomsHandlerObserver:](self, "addSymptomsHandlerObserver:", v69);

  }
}

+ (id)_logSettingsWithFormatter:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0D519B0];
  v4 = a3;
  v5 = [v3 alloc];
  HFLogForCategory(0x24uLL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithLog:logType:argumentFormatter:", v6, 0, v4);

  return v7;
}

+ (id)_defaultLogSettings
{
  return (id)objc_msgSend(a1, "_logSettingsWithFormatter:", &__block_literal_global_209_0);
}

- (void)addDiagnosticInfoObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher diagnosticInfoManager](self, "diagnosticInfoManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (HFAccessoryDiagnosticInfoManager)diagnosticInfoManager
{
  return self->_diagnosticInfoManager;
}

- (void)_setupSymptomFixSessionObserver
{
  void *v3;
  void *v4;
  NADelegateDispatcher *v5;
  NADelegateDispatcher *symptomFixSessionObserverDispatcher;
  NADelegateDispatcher *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0D519A8];
  objc_msgSend((id)objc_opt_class(), "_defaultLogSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dispatcherWithProtocol:logSettings:", &unk_1F040CF90, v4);
  v5 = (NADelegateDispatcher *)objc_claimAutoreleasedReturnValue();
  symptomFixSessionObserverDispatcher = self->_symptomFixSessionObserverDispatcher;
  self->_symptomFixSessionObserverDispatcher = v5;

  v7 = self->_symptomFixSessionObserverDispatcher;
  objc_msgSend((id)objc_opt_class(), "_logSettingsWithFormatter:", &__block_literal_global_551);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NADelegateDispatcher registerCustomLogSettings:forSelector:argumentIndex:](v7, "registerCustomLogSettings:forSelector:argumentIndex:", v8, sel_fixSession_didChangeState_, 1);

}

- (void)_setupSofwareUpdateControllerV2Observer
{
  void *v3;
  void *v4;
  NADelegateDispatcher *v5;
  NADelegateDispatcher *softwareUpdateControllerV2ObserverDispatcher;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0D519A8];
  objc_msgSend((id)objc_opt_class(), "_defaultLogSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dispatcherWithProtocol:logSettings:", &unk_1F0430EC8, v4);
  v5 = (NADelegateDispatcher *)objc_claimAutoreleasedReturnValue();
  softwareUpdateControllerV2ObserverDispatcher = self->_softwareUpdateControllerV2ObserverDispatcher;
  self->_softwareUpdateControllerV2ObserverDispatcher = v5;

  -[HFHomeKitDispatcher softwareUpdateControllerV2ObserverDispatcher](self, "softwareUpdateControllerV2ObserverDispatcher");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "proxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFHomeKitDispatcher home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "softwareUpdateController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", v7);

}

- (void)_setupSofwareUpdateControllerObserver
{
  void *v3;
  void *v4;
  NADelegateDispatcher *v5;
  NADelegateDispatcher *softwareUpdateControllerObserverDispatcher;
  NADelegateDispatcher *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v3 = (void *)MEMORY[0x1E0D519A8];
  objc_msgSend((id)objc_opt_class(), "_defaultLogSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dispatcherWithProtocol:logSettings:", &unk_1F040C0E8, v4);
  v5 = (NADelegateDispatcher *)objc_claimAutoreleasedReturnValue();
  softwareUpdateControllerObserverDispatcher = self->_softwareUpdateControllerObserverDispatcher;
  self->_softwareUpdateControllerObserverDispatcher = v5;

  objc_initWeak(&location, self);
  v7 = self->_softwareUpdateControllerObserverDispatcher;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__HFHomeKitDispatcher__setupSofwareUpdateControllerObserver__block_invoke;
  v8[3] = &unk_1EA740310;
  objc_copyWeak(&v9, &location);
  -[NADelegateDispatcher registerCustomHandlerForSelector:handler:](v7, "registerCustomHandlerForSelector:handler:", sel_softwareUpdateController_didUpdateAvailableUpdate_, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_setupResidentDeviceObserver
{
  void *v3;
  void *v4;
  NADelegateDispatcher *v5;
  NADelegateDispatcher *residentDeviceObserverDispatcher;
  NADelegateDispatcher *v7;
  uint64_t v8;
  NADelegateDispatcher *v9;
  NADelegateDispatcher *v10;
  void *v11;
  NADelegateDispatcher *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  v3 = (void *)MEMORY[0x1E0D519A8];
  objc_msgSend((id)objc_opt_class(), "_defaultLogSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dispatcherWithProtocol:logSettings:", &unk_1F040B548, v4);
  v5 = (NADelegateDispatcher *)objc_claimAutoreleasedReturnValue();
  residentDeviceObserverDispatcher = self->_residentDeviceObserverDispatcher;
  self->_residentDeviceObserverDispatcher = v5;

  objc_initWeak(&location, self);
  v7 = self->_residentDeviceObserverDispatcher;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __51__HFHomeKitDispatcher__setupResidentDeviceObserver__block_invoke;
  v16[3] = &unk_1EA740310;
  objc_copyWeak(&v17, &location);
  -[NADelegateDispatcher registerCustomHandlerForSelector:handler:](v7, "registerCustomHandlerForSelector:handler:", sel_residentDevice_didUpdateEnabled_, v16);
  v9 = self->_residentDeviceObserverDispatcher;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __51__HFHomeKitDispatcher__setupResidentDeviceObserver__block_invoke_2;
  v14[3] = &unk_1EA740310;
  objc_copyWeak(&v15, &location);
  -[NADelegateDispatcher registerCustomHandlerForSelector:handler:](v9, "registerCustomHandlerForSelector:handler:", sel_residentDevice_didUpdateStatus_, v14);
  v10 = self->_residentDeviceObserverDispatcher;
  objc_msgSend((id)objc_opt_class(), "_logSettingsWithFormatter:", &__block_literal_global_501);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NADelegateDispatcher registerCustomLogSettings:forSelector:argumentIndex:](v10, "registerCustomLogSettings:forSelector:argumentIndex:", v11, sel_residentDevice_didUpdateCapabilities_, 1);

  v12 = self->_residentDeviceObserverDispatcher;
  objc_msgSend((id)objc_opt_class(), "_logSettingsWithFormatter:", &__block_literal_global_503);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NADelegateDispatcher registerCustomLogSettings:forSelector:argumentIndex:](v12, "registerCustomLogSettings:forSelector:argumentIndex:", v13, sel_residentDevice_didUpdateStatus_, 1);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_setupMediaSessionObserver
{
  void *v3;
  void *v4;
  NADelegateDispatcher *v5;
  NADelegateDispatcher *mediaSessionObserverDispatcher;
  id v7;

  v3 = (void *)MEMORY[0x1E0D519A8];
  objc_msgSend((id)objc_opt_class(), "_defaultLogSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dispatcherWithProtocol:logSettings:", &unk_1F040BBC8, v4);
  v5 = (NADelegateDispatcher *)objc_claimAutoreleasedReturnValue();
  mediaSessionObserverDispatcher = self->_mediaSessionObserverDispatcher;
  self->_mediaSessionObserverDispatcher = v5;

  objc_msgSend((id)objc_opt_class(), "_logSettingsWithFormatter:", &__block_literal_global_531);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NADelegateDispatcher registerCustomLogSettings:forSelector:argumentIndex:](self->_mediaSessionObserverDispatcher, "registerCustomLogSettings:forSelector:argumentIndex:", v7, sel_mediaSession_willUpdatePlaybackState_, 1);
  -[NADelegateDispatcher registerCustomLogSettings:forSelector:argumentIndex:](self->_mediaSessionObserverDispatcher, "registerCustomLogSettings:forSelector:argumentIndex:", v7, sel_mediaSession_didUpdatePlaybackState_, 1);

}

- (void)_setupMediaObjectObserver
{
  void *v3;
  void *v4;
  NADelegateDispatcher *v5;
  NADelegateDispatcher *mediaObjectObserverDispatcher;
  NADelegateDispatcher *v7;
  uint64_t v8;
  NADelegateDispatcher *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v3 = (void *)MEMORY[0x1E0D519A8];
  objc_msgSend((id)objc_opt_class(), "_defaultLogSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dispatcherWithProtocol:logSettings:", &unk_1F03FC9F0, v4);
  v5 = (NADelegateDispatcher *)objc_claimAutoreleasedReturnValue();
  mediaObjectObserverDispatcher = self->_mediaObjectObserverDispatcher;
  self->_mediaObjectObserverDispatcher = v5;

  objc_initWeak(&location, self);
  v7 = self->_mediaObjectObserverDispatcher;
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__HFHomeKitDispatcher__setupMediaObjectObserver__block_invoke;
  v12[3] = &unk_1EA740310;
  objc_copyWeak(&v13, &location);
  -[NADelegateDispatcher registerCustomHandlerForSelector:handler:](v7, "registerCustomHandlerForSelector:handler:", sel_mediaObject_didUpdateSettings_, v12);
  v9 = self->_mediaObjectObserverDispatcher;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __48__HFHomeKitDispatcher__setupMediaObjectObserver__block_invoke_2;
  v10[3] = &unk_1EA740310;
  objc_copyWeak(&v11, &location);
  -[NADelegateDispatcher registerCustomHandlerForSelector:handler:](v9, "registerCustomHandlerForSelector:handler:", sel_mediaObject_didUpdateMediaSession_, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_setupHomeObserver
{
  void *v3;
  void *v4;
  NADelegateDispatcher *v5;
  NADelegateDispatcher *homeObserverDispatcher;
  NADelegateDispatcher *v7;
  uint64_t v8;
  NADelegateDispatcher *v9;
  NADelegateDispatcher *v10;
  NADelegateDispatcher *v11;
  NADelegateDispatcher *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  v3 = (void *)MEMORY[0x1E0D519A8];
  objc_msgSend((id)objc_opt_class(), "_defaultLogSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dispatcherWithProtocol:logSettings:", &unk_1F03F8BF8, v4);
  v5 = (NADelegateDispatcher *)objc_claimAutoreleasedReturnValue();
  homeObserverDispatcher = self->_homeObserverDispatcher;
  self->_homeObserverDispatcher = v5;

  objc_initWeak(&location, self);
  v7 = self->_homeObserverDispatcher;
  v8 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __41__HFHomeKitDispatcher__setupHomeObserver__block_invoke;
  v21[3] = &unk_1EA740310;
  objc_copyWeak(&v22, &location);
  -[NADelegateDispatcher registerCustomHandlerForSelector:handler:](v7, "registerCustomHandlerForSelector:handler:", sel_home_didAddAccessory_, v21);
  v9 = self->_homeObserverDispatcher;
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __41__HFHomeKitDispatcher__setupHomeObserver__block_invoke_2;
  v19[3] = &unk_1EA740310;
  objc_copyWeak(&v20, &location);
  -[NADelegateDispatcher registerCustomHandlerForSelector:handler:](v9, "registerCustomHandlerForSelector:handler:", sel_home_didAddResidentDevice_, v19);
  v10 = self->_homeObserverDispatcher;
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __41__HFHomeKitDispatcher__setupHomeObserver__block_invoke_3;
  v17[3] = &unk_1EA740310;
  objc_copyWeak(&v18, &location);
  -[NADelegateDispatcher registerCustomHandlerForSelector:handler:](v10, "registerCustomHandlerForSelector:handler:", sel_home_didRemoveResidentDevice_, v17);
  v11 = self->_homeObserverDispatcher;
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __41__HFHomeKitDispatcher__setupHomeObserver__block_invoke_4;
  v15[3] = &unk_1EA740310;
  objc_copyWeak(&v16, &location);
  -[NADelegateDispatcher registerCustomHandlerForSelector:handler:](v11, "registerCustomHandlerForSelector:handler:", sel_home_didAddMediaSystem_, v15);
  v12 = self->_homeObserverDispatcher;
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __41__HFHomeKitDispatcher__setupHomeObserver__block_invoke_5;
  v13[3] = &unk_1EA740310;
  objc_copyWeak(&v14, &location);
  -[NADelegateDispatcher registerCustomHandlerForSelector:handler:](v12, "registerCustomHandlerForSelector:handler:", sel_home_didUpdatePersonManagerSettings_, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)_setupHomeManagerObserver
{
  void *v4;
  void *v5;
  NADelegateDispatcher *v6;
  NADelegateDispatcher *homeManagerObserverDispatcher;
  NADelegateDispatcher *v8;
  uint64_t v9;
  NADelegateDispatcher *v10;
  NADelegateDispatcher *v11;
  NADelegateDispatcher *v12;
  _QWORD v13[4];
  id v14[2];
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  objc_initWeak(&location, self);
  v4 = (void *)MEMORY[0x1E0D519A8];
  objc_msgSend((id)objc_opt_class(), "_defaultLogSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dispatcherWithProtocol:logSettings:", &unk_1F03FE730, v5);
  v6 = (NADelegateDispatcher *)objc_claimAutoreleasedReturnValue();
  homeManagerObserverDispatcher = self->_homeManagerObserverDispatcher;
  self->_homeManagerObserverDispatcher = v6;

  v8 = self->_homeManagerObserverDispatcher;
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __48__HFHomeKitDispatcher__setupHomeManagerObserver__block_invoke;
  v19[3] = &unk_1EA740310;
  objc_copyWeak(&v20, &location);
  -[NADelegateDispatcher registerCustomHandlerForSelector:handler:](v8, "registerCustomHandlerForSelector:handler:", sel_homeManagerDidUpdateHomes_, v19);
  v10 = self->_homeManagerObserverDispatcher;
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __48__HFHomeKitDispatcher__setupHomeManagerObserver__block_invoke_2;
  v17[3] = &unk_1EA740310;
  objc_copyWeak(&v18, &location);
  -[NADelegateDispatcher registerCustomHandlerForSelector:handler:](v10, "registerCustomHandlerForSelector:handler:", sel_homeManagerDidUpdatePrimaryHome_, v17);
  v11 = self->_homeManagerObserverDispatcher;
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __48__HFHomeKitDispatcher__setupHomeManagerObserver__block_invoke_2_269;
  v15[3] = &unk_1EA740310;
  objc_copyWeak(&v16, &location);
  -[NADelegateDispatcher registerCustomHandlerForSelector:handler:](v11, "registerCustomHandlerForSelector:handler:", sel_homeManager_didAddHome_, v15);
  v12 = self->_homeManagerObserverDispatcher;
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __48__HFHomeKitDispatcher__setupHomeManagerObserver__block_invoke_3;
  v13[3] = &unk_1EA740388;
  objc_copyWeak(v14, &location);
  v14[1] = (id)a2;
  -[NADelegateDispatcher registerCustomHandlerForSelector:handler:](v12, "registerCustomHandlerForSelector:handler:", sel_homeManager_didRemoveHome_, v13);
  objc_destroyWeak(v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)_setupAccessoryObserver
{
  void *v3;
  void *v4;
  NADelegateDispatcher *v5;
  NADelegateDispatcher *accessoryObserverDispatcher;
  NADelegateDispatcher *v7;
  uint64_t v8;
  NADelegateDispatcher *v9;
  NADelegateDispatcher *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v3 = (void *)MEMORY[0x1E0D519A8];
  objc_msgSend((id)objc_opt_class(), "_volatileLogSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dispatcherWithProtocol:logSettings:", &unk_1F040B3C0, v4);
  v5 = (NADelegateDispatcher *)objc_claimAutoreleasedReturnValue();
  accessoryObserverDispatcher = self->_accessoryObserverDispatcher;
  self->_accessoryObserverDispatcher = v5;

  objc_initWeak(&location, self);
  v7 = self->_accessoryObserverDispatcher;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __46__HFHomeKitDispatcher__setupAccessoryObserver__block_invoke;
  v15[3] = &unk_1EA740310;
  objc_copyWeak(&v16, &location);
  -[NADelegateDispatcher registerCustomHandlerForSelector:handler:](v7, "registerCustomHandlerForSelector:handler:", sel_accessoryDidUpdateServices_, v15);
  v9 = self->_accessoryObserverDispatcher;
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __46__HFHomeKitDispatcher__setupAccessoryObserver__block_invoke_2;
  v13[3] = &unk_1EA740310;
  objc_copyWeak(&v14, &location);
  -[NADelegateDispatcher registerCustomHandlerForSelector:handler:](v9, "registerCustomHandlerForSelector:handler:", sel_accessory_didAddProfile_, v13);
  v10 = self->_accessoryObserverDispatcher;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __46__HFHomeKitDispatcher__setupAccessoryObserver__block_invoke_3;
  v11[3] = &unk_1EA740310;
  objc_copyWeak(&v12, &location);
  -[NADelegateDispatcher registerCustomHandlerForSelector:handler:](v10, "registerCustomHandlerForSelector:handler:", sel_accessoryDidUpdateAudioDestinationController_, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

+ (id)_volatileLogSettings
{
  return (id)objc_msgSend(a1, "_logSettingsWithFormatter:", &__block_literal_global_212_0);
}

- (void)fetchSettingsForLightProfiles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  -[HFHomeKitDispatcher home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
    {
      -[HFHomeKitDispatcher _fetchSettingsForLightProfiles:](self, "_fetchSettingsForLightProfiles:", v4);
    }
    else
    {
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0D28698], "defaultScheduler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __53__HFHomeKitDispatcher_fetchSettingsForLightProfiles___block_invoke;
      v8[3] = &unk_1EA727A48;
      objc_copyWeak(&v10, &location);
      v9 = v4;
      v7 = (id)objc_msgSend(v6, "performWithQualityOfService:block:", 17, v8);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }

}

- (void)dispatchLightProfileUpdate:(id)a3 settings:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    HFLogForCategory(0x24uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v8;
      v17 = 2112;
      v18 = v10;
      _os_log_error_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_ERROR, "Received error trying to fetch light profile settings. Profile: %@ %@", buf, 0x16u);
    }
    goto LABEL_6;
  }
  if ((objc_msgSend(v9, "supportedFeatures") & 1) != 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __65__HFHomeKitDispatcher_dispatchLightProfileUpdate_settings_error___block_invoke;
    v12[3] = &unk_1EA740598;
    v13 = v8;
    v14 = v9;
    -[HFHomeKitDispatcher dispatchLightObserverMessage:sender:](self, "dispatchLightObserverMessage:sender:", v12, 0);

    v11 = v13;
LABEL_6:

  }
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  BOOL v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CBA558], "defaultPrivateConfiguration");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED379E60;
  qword_1ED379E60 = v2;

  v4 = +[HFExecutionEnvironment isHomeApp](HFExecutionEnvironment, "isHomeApp")
    || +[HFExecutionEnvironment isShortcuts](HFExecutionEnvironment, "isShortcuts")
    || +[HFExecutionEnvironment isSpringBoard](HFExecutionEnvironment, "isSpringBoard")
    || +[HFExecutionEnvironment isMacShortcuts](HFExecutionEnvironment, "isMacShortcuts")
    || +[HFExecutionEnvironment isHomeControlService](HFExecutionEnvironment, "isHomeControlService")
    || +[HFExecutionEnvironment isSettings](HFExecutionEnvironment, "isSettings");
  _MergedGlobals_325 = v4;
  if (_os_feature_enabled_impl())
    v5 = !+[HFExecutionEnvironment isSpringBoard](HFExecutionEnvironment, "isSpringBoard");
  else
    v5 = 1;
  byte_1ED379E59 = v5;
}

- (void)_setupStateDumpHandlers
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  +[HFDebugStateDumpManager sharedInstance](HFDebugStateDumpManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __46__HFHomeKitDispatcher__setupStateDumpHandlers__block_invoke;
  v9 = &unk_1EA7266C0;
  objc_copyWeak(&v10, &location);
  v3 = (id)objc_msgSend(v2, "registerStateDumpHandler:withName:", &v6, CFSTR("HFHomeKitState"));

  +[HFDebugStateDumpManager sharedInstance](HFDebugStateDumpManager, "sharedInstance", v6, v7, v8, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "registerStateDumpHandler:withName:", &__block_literal_global_557, CFSTR("ProjectVersions"));

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __53__HFHomeKitDispatcher_fetchSettingsForLightProfiles___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_fetchSettingsForLightProfiles:", *(_QWORD *)(a1 + 32));

}

void __67__HFHomeKitDispatcher__setDelegationEnabled_forAccessoryHierarchy___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  if (*(_BYTE *)(a1 + 40))
  {
    v2 = *(void **)(a1 + 32);
    v3 = a2;
    objc_msgSend(v2, "networkConfigurationObserverDispatcher");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "proxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDelegate:", v4);

  }
  else
  {
    v5 = a2;
    objc_msgSend(v5, "setDelegate:", 0);
  }

}

void __27__HFHomeKitDispatcher_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 32), "homeObserverDispatcher");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "proxy");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setDelegate:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

+ (void)setConfiguration:(id)a3
{
  uint64_t v3;
  void *v4;

  if (a3)
  {
    v3 = objc_msgSend(a3, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CBA558], "defaultPrivateConfiguration");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)qword_1ED379E60;
  qword_1ED379E60 = v3;

}

+ (void)setSynchronizesHomeDataModel:(BOOL)a3
{
  _MergedGlobals_325 = a3;
}

+ (void)setOverrideSynchronizesHomeDataModel:(BOOL)a3
{
  byte_1ED379E5A = a3;
}

+ (HMHomeManagerConfiguration)configuration
{
  return (HMHomeManagerConfiguration *)(id)qword_1ED379E60;
}

+ (BOOL)allowHomeSensingOverride
{
  return byte_1ED379E59;
}

+ (void)setAllowHomeSensingOverride:(BOOL)a3
{
  byte_1ED379E59 = a3;
}

void __27__HFHomeKitDispatcher_init__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  HFLogForCategory(0x24uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "Received HMHomeManagerPreferencesChangedNotification", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_createHomeManagerIfNecessary");

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(-[HFHomeKitDispatcher homeKitPreferencesChangedNotifyToken](self, "homeKitPreferencesChangedNotifyToken"));
  v3.receiver = self;
  v3.super_class = (Class)HFHomeKitDispatcher;
  -[HFHomeKitDispatcher dealloc](&v3, sel_dealloc);
}

id __43__HFHomeKitDispatcher__volatileLogSettings__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[HFStateDumpBuilderContext contextWithDetailLevel:](HFMutableStateDumpBuilderContext, "contextWithDetailLevel:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIncludeVolatileObjects:", 1);
    objc_msgSend(v2, "hf_stateDumpBuilderWithContext:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "buildDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "hf_prettyDescription");
    else
      objc_msgSend(v2, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

void __48__HFHomeKitDispatcher__setupHomeManagerObserver__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[16];

  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "homes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
  {
    HFLogForCategory(0x24uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "homeManagerDidUpdatePrimaryHome: No home left. Reset hasSeenWelcomeView flag.", buf, 2u);
    }

    objc_msgSend(v9, "hf_setHasSeenOnboardingWelcomeView:", 0);
    v13 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v13;
  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __48__HFHomeKitDispatcher__setupHomeManagerObserver__block_invoke_266;
  v16[3] = &unk_1EA740338;
  v16[4] = WeakRetained;
  v17 = v5;
  v14 = v5;
  v15 = (id)objc_msgSend(v8, "addCompletionBlock:", v16);

}

uint64_t __48__HFHomeKitDispatcher__setupHomeManagerObserver__block_invoke_266(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateSelectedHome");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __48__HFHomeKitDispatcher__setupHomeManagerObserver__block_invoke_2_269(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  void (**v5)(_QWORD);
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "homeObserverDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "proxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", v9);

  objc_msgSend(WeakRetained, "_updateRemoteAccessStateForHome:notifyingObservers:", v7, 0);
  v5[2](v5);

}

void __48__HFHomeKitDispatcher__setupHomeManagerObserver__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint8_t buf[16];

  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "homes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (!v12)
  {
    HFLogForCategory(0x24uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "homeManager:didRemoveHome: No home left. Reset hasSeenWelcomeView flag.", buf, 2u);
    }

    objc_msgSend(v10, "hf_setHasSeenOnboardingWelcomeView:", 0);
    v14 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v14;
  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __48__HFHomeKitDispatcher__setupHomeManagerObserver__block_invoke_271;
  v19[3] = &unk_1EA740360;
  v20 = v8;
  v21 = WeakRetained;
  v15 = *(_QWORD *)(a1 + 40);
  v22 = v5;
  v23 = v15;
  v16 = v5;
  v17 = v8;
  v18 = (id)objc_msgSend(v9, "addCompletionBlock:", v19);

}

uint64_t __48__HFHomeKitDispatcher__setupHomeManagerObserver__block_invoke_271(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  HFPinCodeManager *v22;
  void *v23;
  HFPinCodeManager *v24;
  int v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "overrideHome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isEqual:", v4);

  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "setOverrideHome:", 0);
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "selectedHome");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if (v9)
    objc_msgSend(*(id *)(a1 + 40), "setSelectedHome:userInitiated:", 0, 0);
  objc_msgSend(*(id *)(a1 + 40), "remoteAccessStateByHomeID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectForKey:", v11);

  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "pinCodeManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uniqueIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v12, "isEqual:", v15);

  if (v16)
  {
    HFLogForCategory(0x24uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "home");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 32);
      v26 = 138413058;
      v27 = v18;
      v28 = 2112;
      v29 = v19;
      v30 = 2112;
      v31 = v20;
      v32 = 2112;
      v33 = v21;
      _os_log_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_DEFAULT, "%@:%@: Reseting HFPinCodeManager to use current home {%@} now that home {%@} was removed.", (uint8_t *)&v26, 0x2Au);

    }
    v22 = [HFPinCodeManager alloc];
    objc_msgSend(*(id *)(a1 + 40), "home");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[HFPinCodeManager initWithHome:](v22, "initWithHome:", v23);
    objc_msgSend(*(id *)(a1 + 40), "setPinCodeManager:", v24);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __41__HFHomeKitDispatcher__setupHomeObserver__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(_QWORD);
  id WeakRetained;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_setDelegationEnabled:forAccessoryHierarchy:", 1, v10);

  }
  v5[2](v5);

}

void __41__HFHomeKitDispatcher__setupHomeObserver__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(_QWORD);
  id WeakRetained;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "residentDeviceObserverDispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "proxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", v12);

  }
  v5[2](v5);
  objc_msgSend(WeakRetained, "_updateRemoteAccessStateForHome:notifyingObservers:", v7, 1);

}

void __41__HFHomeKitDispatcher__setupHomeObserver__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  void (**v5)(_QWORD);
  id v6;
  void *v7;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  v5[2](v5);

  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_updateRemoteAccessStateForHome:notifyingObservers:", v7, 1);
}

void __41__HFHomeKitDispatcher__setupHomeObserver__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(_QWORD);
  id WeakRetained;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_setDelegationEnabled:forMediaProfileContainer:session:", 1, v10, 0);

  }
  v5[2](v5);

}

void __41__HFHomeKitDispatcher__setupHomeObserver__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(_QWORD);
  id WeakRetained;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_setHomePersonManagerObservationEnabled:", objc_msgSend(v10, "isFaceClassificationEnabled"));

  }
  v5[2](v5);

}

void __46__HFHomeKitDispatcher__setupAccessoryObserver__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  void (**v5)(_QWORD);
  id v6;
  void *v7;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_setDelegationEnabled:forAccessoryHierarchy:", 1, v7);
  v5[2](v5);

}

void __46__HFHomeKitDispatcher__setupAccessoryObserver__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  void (**v5)(_QWORD);
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_setDelegationEnabled:forAccessoryHierarchy:", 1, v7);
  objc_msgSend(v7, "lightProfiles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "fetchSettingsForLightProfiles:", v8);
  v5[2](v5);

}

void __46__HFHomeKitDispatcher__setupAccessoryObserver__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  void (**v5)(_QWORD);
  id v6;
  void *v7;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_setDelegationEnabled:forAccessoryHierarchy:", 1, v7);
  v5[2](v5);

}

void __51__HFHomeKitDispatcher__setupResidentDeviceObserver__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  void (**v5)(_QWORD);
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v5[2](v5);
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_updateRemoteAccessStateForHome:notifyingObservers:", v8, 1);

}

void __51__HFHomeKitDispatcher__setupResidentDeviceObserver__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  void (**v5)(_QWORD);
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v5[2](v5);
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_updateRemoteAccessStateForHome:notifyingObservers:", v8, 1);

}

uint64_t __51__HFHomeKitDispatcher__setupResidentDeviceObserver__block_invoke_3(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "unsignedIntegerValue");
  return HMResidentDeviceCapabilitiesDescription();
}

uint64_t __51__HFHomeKitDispatcher__setupResidentDeviceObserver__block_invoke_4(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "unsignedIntegerValue");
  return HMResidentDeviceStatusDescription();
}

void __48__HFHomeKitDispatcher__setupMediaObjectObserver__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  void (**v5)(_QWORD);
  id v6;
  void *v7;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_setDelegationEnabled:forMediaProfileContainer:session:", 1, v7, 0);
  v5[2](v5);

}

void __48__HFHomeKitDispatcher__setupMediaObjectObserver__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  void (**v5)(_QWORD);
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_setDelegationEnabled:forMediaProfileContainer:session:", 1, v7, v8);
  v5[2](v5);

}

__CFString *__49__HFHomeKitDispatcher__setupMediaSessionObserver__block_invoke(uint64_t a1, void *a2)
{
  return NSStringFromHMMediaPlaybackState(objc_msgSend(a2, "unsignedIntegerValue"));
}

void __60__HFHomeKitDispatcher__setupSofwareUpdateControllerObserver__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  void (**v5)(_QWORD);
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(WeakRetained, "softwareUpdateObserverDispatcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "proxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", v13);

  HFLogForCategory(0x3FuLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "hf_prettyDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hf_prettyDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    v18 = v15;
    v19 = 2112;
    v20 = v16;
    _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "-[HFHomeKitDispatcher softwareUpdateController: (%@) didUpdateAvailableUpdate: (%@)]", (uint8_t *)&v17, 0x16u);

  }
  v5[2](v5);

}

__CFString *__54__HFHomeKitDispatcher__setupSymptomFixSessionObserver__block_invoke(uint64_t a1, void *a2)
{
  return NSStringFromHMSymptomFixSessionState(objc_msgSend(a2, "unsignedIntegerValue"));
}

id __46__HFHomeKitDispatcher__setupStateDumpHandlers__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;

  +[HFStateDumpBuilderContext contextWithDetailLevel:](HFMutableStateDumpBuilderContext, "contextWithDetailLevel:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_stateDumpBuilderWithContext:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buildPropertyListRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __46__HFHomeKitDispatcher__setupStateDumpHandlers__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if (+[HFUtilities isProxHandOffV2Config](HFUtilities, "isProxHandOffV2Config"))
  {
    v0 = 0;
    v1 = 0;
  }
  else
  {
    +[HFHomeAppInstallStateArbiter sharedInstance](HFHomeAppInstallStateArbiter, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "homeAppBundleURL");
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    if (v1)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v1);
      v0 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v0 = 0;
    }
  }
  v8[0] = CFSTR("Home.framework");
  HFHomeBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __46__HFHomeKitDispatcher__setupStateDumpHandlers__block_invoke_3(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("Home.app");
  v9[0] = v4;
  __46__HFHomeKitDispatcher__setupStateDumpHandlers__block_invoke_3(v0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

__CFString *__46__HFHomeKitDispatcher__setupStateDumpHandlers__block_invoke_3(void *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;

  if (a1)
  {
    objc_msgSend(a1, "infoDictionary");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE90]);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v2;
    v4 = CFSTR("(Unknown)");
    if (v2)
      v4 = (__CFString *)v2;
    v5 = v4;

  }
  else
  {
    v5 = CFSTR("(Bundle not found)");
  }
  return v5;
}

- (void)updateHomeManagerConfiguration:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[HFHomeKitDispatcher configuration](HFHomeKitDispatcher, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "options");
  v7 = objc_msgSend(v4, "options");

  if (v6 != v7)
  {
    HFLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "options");
      HMHomeManagerOptionsToString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Updating Home Manager configuration with options [%@]", (uint8_t *)&v13, 0xCu);

    }
    +[HFHomeKitDispatcher setConfiguration:](HFHomeKitDispatcher, "setConfiguration:", v4);
    -[HFHomeKitDispatcher homeManagerCreator](self, "homeManagerCreator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setConfiguration:", v4);

    -[HFHomeKitDispatcher homeManagerCreator](self, "homeManagerCreator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "createHomeManagerIfNeeded");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      -[HFHomeKitDispatcher setHomeManagerAndUpdateDelegate:](self, "setHomeManagerAndUpdateDelegate:", v12);

  }
}

- (void)homeManagerWasCreated:(id)a3
{
  NSObject *v4;
  HFHomeKitAccessorySettingsDataSource *v5;
  HFHomeKitAccessorySettingsDataSource *accessorySettingsDataSource;
  uint8_t v7[16];

  -[HFHomeKitDispatcher setHomeManagerAndUpdateDelegate:](self, "setHomeManagerAndUpdateDelegate:", a3);
  HFLogForCategory(0x24uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Home Manager created on delegate callback", v7, 2u);
  }

  if (self->_homeManager)
  {
    v5 = -[HFHomeKitAccessorySettingsDataSource initWithHomeManager:]([HFHomeKitAccessorySettingsDataSource alloc], "initWithHomeManager:", self->_homeManager);
    accessorySettingsDataSource = self->_accessorySettingsDataSource;
    self->_accessorySettingsDataSource = v5;

  }
}

- (void)addMediaProfileObserver:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory(0x24uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "This selector, %@, has been deprecated! Please move to addMediaObjectObserver: and move to HFMediaObjectObserver away from HFMediaProfileObserver!", (uint8_t *)&v8, 0xCu);

  }
  -[HFHomeKitDispatcher addMediaObjectObserver:](self, "addMediaObjectObserver:", v5);

}

- (void)removeMediaProfileObserver:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory(0x24uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "This selector, %@, has been deprecated! Please move to removeMediaObjectObserver: and move to HFMediaObjectObserver away from HFMediaProfileObserver!", (uint8_t *)&v8, 0xCu);

  }
  -[HFHomeKitDispatcher removeMediaObjectObserver:](self, "removeMediaObjectObserver:", v5);

}

- (void)removeSoftwareUpdateControllerV2Observer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher softwareUpdateControllerV2ObserverDispatcher](self, "softwareUpdateControllerV2ObserverDispatcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)removeDiagnosticInfoObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFHomeKitDispatcher diagnosticInfoManager](self, "diagnosticInfoManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)dispatchHomeManagerObserverMessage:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HFHomeKitDispatcher homeManagerObserverDispatcher](self, "homeManagerObserverDispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchMessageExcludingSender:usingBlock:", v6, v7);

}

- (void)dispatchAccessoryObserverMessage:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HFHomeKitDispatcher accessoryObserverDispatcher](self, "accessoryObserverDispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchMessageExcludingSender:usingBlock:", v6, v7);

}

- (void)dispatchCameraObserverMessage:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HFHomeKitDispatcher cameraObserverDispatcher](self, "cameraObserverDispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchMessageExcludingSender:usingBlock:", v6, v7);

}

- (void)dispatchMediaSessionObserverMessage:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HFHomeKitDispatcher mediaSessionObserverDispatcher](self, "mediaSessionObserverDispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchMessageExcludingSender:usingBlock:", v6, v7);

}

- (void)dispatchAudioControlObserverMessage:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HFHomeKitDispatcher audioControlObserverDispatcher](self, "audioControlObserverDispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchMessageExcludingSender:usingBlock:", v6, v7);

}

- (void)dispatchMediaObjectObserverMessage:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HFHomeKitDispatcher mediaObjectObserverDispatcher](self, "mediaObjectObserverDispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchMessageExcludingSender:usingBlock:", v6, v7);

}

- (void)dispatchHomeKitSettingMessage:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HFHomeKitDispatcher homeKitSettingsObserverDispatcher](self, "homeKitSettingsObserverDispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchMessageExcludingSender:usingBlock:", v6, v7);

}

- (void)dispatchSiriEndpointObserverMessage:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HFHomeKitDispatcher siriEndpointProfileObserverDispatcher](self, "siriEndpointProfileObserverDispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchMessageExcludingSender:usingBlock:", v6, v7);

}

- (void)dispatchSymptomFixSessionObserverMessage:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HFHomeKitDispatcher symptomFixSessionObserverDispatcher](self, "symptomFixSessionObserverDispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchMessageExcludingSender:usingBlock:", v6, v7);

}

- (void)dispatchSoftwareUpdateControllerMessage:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HFHomeKitDispatcher softwareUpdateControllerObserverDispatcher](self, "softwareUpdateControllerObserverDispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchMessageExcludingSender:usingBlock:", v6, v7);

}

- (void)dispatchSoftwareUpdateMessage:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HFHomeKitDispatcher softwareUpdateObserverDispatcher](self, "softwareUpdateObserverDispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchMessageExcludingSender:usingBlock:", v6, v7);

}

- (void)dispatchSymptomsHandlerMessage:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HFHomeKitDispatcher symptomsHandlerObserverDispatcher](self, "symptomsHandlerObserverDispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchMessageExcludingSender:usingBlock:", v6, v7);

}

- (void)dispatchUserObserverMessage:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HFHomeKitDispatcher userObserverDispatcher](self, "userObserverDispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchMessageExcludingSender:usingBlock:", v6, v7);

}

- (void)dispatchTelevisionObserverMessage:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HFHomeKitDispatcher televisionObserverDispatcher](self, "televisionObserverDispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchMessageExcludingSender:usingBlock:", v6, v7);

}

- (void)dispatchLightObserverMessage:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HFHomeKitDispatcher lightObserverDispatcher](self, "lightObserverDispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchMessageExcludingSender:usingBlock:", v6, v7);

}

- (void)dispatchHomeKitSettingsObserverMessage:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HFHomeKitDispatcher homeKitSettingsObserverDispatcher](self, "homeKitSettingsObserverDispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchMessageExcludingSender:usingBlock:", v6, v7);

}

- (void)dispatchNetworkConfigurationObserverMessage:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HFHomeKitDispatcher networkConfigurationObserverDispatcher](self, "networkConfigurationObserverDispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchMessageExcludingSender:usingBlock:", v6, v7);

}

- (void)dispatchHomePersonManagerObserverMessage:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HFHomeKitDispatcher homePersonManagerDispatcher](self, "homePersonManagerDispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchMessageExcludingSender:usingBlock:", v6, v7);

}

- (void)dispatchMediaDestinationControllerObserverMessage:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HFHomeKitDispatcher mediaDestinationControllerObserverDispatcher](self, "mediaDestinationControllerObserverDispatcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchMessageExcludingSender:usingBlock:", v6, v7);

}

- (void)setSelectedHome:(id)a3
{
  -[HFHomeKitDispatcher setSelectedHome:userInitiated:](self, "setSelectedHome:userInitiated:", a3, 1);
}

- (void)setSelectedHome:(id)a3 userInitiated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HMHome uniqueIdentifier](self->_selectedHome, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFHomeKitDispatcher _requestSelectedHome:](self, "_requestSelectedHome:", v6);
  if (v4)
  {
    if (-[HFHomeKitDispatcher _shouldPersistSelectedHomeToDefaults](self, "_shouldPersistSelectedHomeToDefaults"))
    {
      -[HMHome uniqueIdentifier](self->_selectedHome, "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

      if ((v9 & 1) == 0)
      {
        +[HFStateRestorationSettings sharedInstance](HFStateRestorationSettings, "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "syncToNanoPrefs");

        HFLogForCategory(0x2AuLL);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          -[HMHome name](self->_selectedHome, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 138412290;
          v15 = v12;
          _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "User initiated change to home: %@", (uint8_t *)&v14, 0xCu);

        }
        notify_post(HFHomeSelectedHomeChangedNotification);
        if (objc_msgSend((id)objc_opt_class(), "synchronizesHomeDataModel"))
        {
          objc_msgSend(MEMORY[0x1E0D32A68], "shared");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setCurrentHome:", v6);

        }
      }
    }
  }

}

- (BOOL)setSelectedHomeWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HFHomeKitDispatcher homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__HFHomeKitDispatcher_setSelectedHomeWithName___block_invoke;
  v10[3] = &unk_1EA72B630;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    -[HFHomeKitDispatcher setSelectedHome:userInitiated:](self, "setSelectedHome:userInitiated:", v8, 0);

  return v8 != 0;
}

uint64_t __47__HFHomeKitDispatcher_setSelectedHomeWithName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)setOverrideHome:(id)a3
{
  HMHome *v4;
  NSObject *v5;
  HMHome *overrideHome;
  int v7;
  HMHome *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (HMHome *)a3;
  HFLogForCategory(0x24uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Override home is now %@", (uint8_t *)&v7, 0xCu);
  }

  overrideHome = self->_overrideHome;
  self->_overrideHome = v4;

  -[HFHomeKitDispatcher updateHome](self, "updateHome");
}

- (NAFuture)firstHomeAddedFuture
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!-[HFHomeKitDispatcher willAcceptHomeFutures](self, "willAcceptHomeFutures"))
    return (NAFuture *)0;
  -[HFHomeKitDispatcher home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc_init(MEMORY[0x1E0D519D8]);
  v5 = v4;
  if (v3)
  {
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFHomeKitDispatcher _finishFirstHomeAddedPromises:](self, "_finishFirstHomeAddedPromises:", v6);

  }
  else
  {
    -[HFHomeKitDispatcher firstHomeAddedPromises](self, "firstHomeAddedPromises");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v5);

  }
  objc_msgSend(v5, "future");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NAFuture *)v9;
}

- (id)homeFutureWithUser:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HFHomeKitDispatcher allHomesFuture](self, "allHomesFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__HFHomeKitDispatcher_homeFutureWithUser___block_invoke;
  v9[3] = &unk_1EA72ADB0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __42__HFHomeKitDispatcher_homeFutureWithUser___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v3 = a2;
  v20 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v20)
  {
    v4 = *(_QWORD *)v27;
    v21 = v3;
    v19 = *(_QWORD *)v27;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v27 != v4)
          objc_enumerationMutation(v3);
        v6 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v5);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v6, "hf_allUsersIncludingCurrentUser");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v23;
          while (2)
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v23 != v10)
                objc_enumerationMutation(v7);
              objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v11), "uniqueIdentifier");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v12, "hmf_isEqualToUUID:", v13);

              if ((v14 & 1) != 0)
              {
                objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v6);
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                v3 = v21;
                v16 = v21;
                goto LABEL_18;
              }
              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v9)
              continue;
            break;
          }
        }

        ++v5;
        v3 = v21;
        v4 = v19;
      }
      while (v5 != v20);
      v20 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v20);
  }

  v15 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "futureWithError:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v17;
}

- (id)userFutureWithUniqueIdentifierStr:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HFHomeKitDispatcher allHomesFuture](self, "allHomesFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__HFHomeKitDispatcher_userFutureWithUniqueIdentifierStr___block_invoke;
  v9[3] = &unk_1EA72ADB0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __57__HFHomeKitDispatcher_userFutureWithUniqueIdentifierStr___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v3 = a2;
  v20 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v20)
  {
    v4 = *(_QWORD *)v26;
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v26 != v4)
          objc_enumerationMutation(v3);
        v6 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v6, "hf_allUsersIncludingCurrentUser", v19);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v22;
          while (2)
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v22 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
              objc_msgSend(v12, "uniqueIdentifier");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "hmf_isEqualToUUIDString:", *(_QWORD *)(a1 + 32));

              if ((v14 & 1) != 0)
              {
                objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v12);
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                v16 = v3;
                goto LABEL_18;
              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v9)
              continue;
            break;
          }
        }

        v4 = v19;
      }
      v20 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v20);
  }

  v15 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "futureWithError:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v17;
}

- (BOOL)selectedHomeFollowsLocation
{
  void *v2;
  char v3;

  -[HFHomeKitDispatcher locationCoordinator](self, "locationCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "homeSensingEnabled");

  return v3;
}

- (void)setSelectedHomeFollowsLocation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[HFHomeKitDispatcher selectedHomeFollowsLocation](self, "selectedHomeFollowsLocation") != a3)
  {
    -[HFHomeKitDispatcher locationCoordinator](self, "locationCoordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHomeSensingEnabled:", v3);

    -[HFHomeKitDispatcher updateHomeSensingState](self, "updateHomeSensingState");
  }
}

id __55__HFHomeKitDispatcher__setupLocationSensingCoordinator__block_invoke_580(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  char v5;
  NSObject *v6;
  _BOOL4 v7;
  HFLocationSensingCoordinator *v8;
  void *v9;
  uint8_t v11[16];
  uint8_t buf[16];

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = objc_msgSend(v3, "BOOLValue");

  HFLogForCategory(0x2AuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v7)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "HomeApp is installed; initializing HFLocationSensingCoordinator",
        v11,
        2u);
    }

    v8 = -[HFLocationSensingCoordinator initWithDelegate:]([HFLocationSensingCoordinator alloc], "initWithDelegate:", WeakRetained);
    objc_msgSend(WeakRetained, "setLocationCoordinator:", v8);

    objc_msgSend(WeakRetained, "updateHomeSensingState");
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "HomeApp is not installed; avoiding initialization of HFLocationSensingCoordinator",
        buf,
        2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)pinCodeManagerForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  HFPinCodeManager *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;

  v4 = a3;
  -[HFHomeKitDispatcher pinCodeManager](self, "pinCodeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    -[HFHomeKitDispatcher pinCodeManager](self, "pinCodeManager");
    v10 = (HFPinCodeManager *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = -[HFPinCodeManager initWithHome:]([HFPinCodeManager alloc], "initWithHome:", v4);
    -[HFHomeKitDispatcher home](self, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if (v14)
      -[HFHomeKitDispatcher setPinCodeManager:](self, "setPinCodeManager:", v10);
  }

  return v10;
}

- (id)activityLogCoordinatorForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  HFActivityLogCoordinator *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;

  v4 = a3;
  -[HFHomeKitDispatcher activityLogCoordinator](self, "activityLogCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    -[HFHomeKitDispatcher activityLogCoordinator](self, "activityLogCoordinator");
    v10 = (HFActivityLogCoordinator *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = -[HFActivityLogCoordinator initWithHome:]([HFActivityLogCoordinator alloc], "initWithHome:", v4);
    -[HFHomeKitDispatcher home](self, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if (v14)
      -[HFHomeKitDispatcher setActivityLogCoordinator:](self, "setActivityLogCoordinator:", v10);
  }

  return v10;
}

uint64_t __47__HFHomeKitDispatcher__finishAllHomesPromises___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "caseInsensitiveCompare:", v6);
  return v7;
}

- (id)_primaryHome
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[HFHomeKitDispatcher homeManager](self, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[HFHomeKitDispatcher homeManager](self, "homeManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "primaryHome");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)addObservationForCameraClipManager:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[HFHomeKitDispatcher cameraObserverDispatcher](self, "cameraObserverDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v6, "addObserver:", v5);

}

- (void)removeObservationForCameraClipManager:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[HFHomeKitDispatcher cameraObserverDispatcher](self, "cameraObserverDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v6, "removeObserver:", v5);

}

- (void)_setDelegationEnabled:(BOOL)a3 forMediaProfileContainer:(id)a4 session:(id)a5
{
  void *v5;
  _BOOL4 v7;
  id v9;
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
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  _QWORD v27[5];
  BOOL v28;

  v7 = a3;
  v26 = a4;
  v9 = a5;
  v10 = v9;
  if (v7)
  {
    -[HFHomeKitDispatcher mediaSessionObserverDispatcher](self, "mediaSessionObserverDispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "proxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", v12);

    -[HFHomeKitDispatcher mediaObjectObserverDispatcher](self, "mediaObjectObserverDispatcher");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "proxy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setDelegate:", v14);

    -[HFHomeKitDispatcher mediaSessionObserverDispatcher](self, "mediaSessionObserverDispatcher");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "proxy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v9, "setDelegate:", 0);
    objc_msgSend(v26, "setDelegate:", 0);
    v15 = 0;
  }
  objc_msgSend(v26, "mediaSession");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelegate:", v15);

  if (v7)
  {

    -[HFHomeKitDispatcher audioControlObserverDispatcher](self, "audioControlObserverDispatcher");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "proxy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(v26, "mediaSession");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "audioControl");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDelegate:", v17);

  if (v7)
  {

    -[HFHomeKitDispatcher homeKitSettingsObserverDispatcher](self, "homeKitSettingsObserverDispatcher");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "proxy");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v26, "settings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDelegate:", v20);

  if (v7)
  {

  }
  if (!+[HFExecutionEnvironment isHomeWidgetRelatedProcess](HFExecutionEnvironment, "isHomeWidgetRelatedProcess"))
  {
    objc_opt_class();
    v22 = v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;
    v24 = v23;

    objc_msgSend(v24, "accessories");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __78__HFHomeKitDispatcher__setDelegationEnabled_forMediaProfileContainer_session___block_invoke;
    v27[3] = &unk_1EA7404F8;
    v28 = v7;
    v27[4] = self;
    objc_msgSend(v25, "na_each:", v27);

  }
}

void __78__HFHomeKitDispatcher__setDelegationEnabled_forMediaProfileContainer_session___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "symptomsHandlerObserverDispatcher");
    a1 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "proxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v6, "symptomsHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

  if (v3)
  {

  }
}

- (void)_fetchSettingsForLightProfiles:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  -[HFHomeKitDispatcher home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__HFHomeKitDispatcher__fetchSettingsForLightProfiles___block_invoke;
  v6[3] = &unk_1EA740570;
  v6[4] = self;
  objc_msgSend(v5, "fetchSettingsForLightProfiles:withCompletion:", v4, v6);

}

void __54__HFHomeKitDispatcher__fetchSettingsForLightProfiles___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    HFLogForCategory(0x24uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v6;
      _os_log_error_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_ERROR, "Received error trying to fetch settings for light profiles. %@", buf, 0xCu);
    }

  }
  v18 = v6;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(void **)(a1 + 32);
        objc_msgSend(v14, "settings");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "error");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "dispatchLightProfileUpdate:settings:error:", v13, v16, v17);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

}

uint64_t __65__HFHomeKitDispatcher_dispatchLightProfileUpdate_settings_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "lightProfile:didUpdateSettings:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (int64_t)_dataModelContextForCurrentEnvironment
{
  if (+[HFExecutionEnvironment isHomeApp](HFExecutionEnvironment, "isHomeApp"))
    return 1;
  if (+[HFExecutionEnvironment isHomeControlService](HFExecutionEnvironment, "isHomeControlService"))
    return 2;
  return 0;
}

- (void)installStateArbiter:(id)a3 installStateDidChange:(BOOL)a4
{
  id v5;

  if (a4)
  {
    -[HFHomeKitDispatcher _setupLocationSensingCoordinator](self, "_setupLocationSensingCoordinator", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[HFHomeKitDispatcher setLocationCoordinatorSetupFuture:](self, "setLocationCoordinatorSetupFuture:", v5);

  }
  else
  {
    -[HFHomeKitDispatcher setLocationCoordinator:](self, "setLocationCoordinator:", 0);
  }
}

- (void)setHomeManager:(id)a3
{
  objc_storeStrong((id *)&self->_homeManager, a3);
}

- (HFHomeKitAccessorySettingsDataSource)accessorySettingsDataSource
{
  return self->_accessorySettingsDataSource;
}

- (int)homeKitPreferencesChangedNotifyToken
{
  return self->_homeKitPreferencesChangedNotifyToken;
}

- (void)setHomeKitPreferencesChangedNotifyToken:(int)a3
{
  self->_homeKitPreferencesChangedNotifyToken = a3;
}

- (void)setRemoteAccessStateByHomeID:(id)a3
{
  objc_storeStrong((id *)&self->_remoteAccessStateByHomeID, a3);
}

- (void)setHomeManagerObserverDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_homeManagerObserverDispatcher, a3);
}

- (void)setHomeObserverDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_homeObserverDispatcher, a3);
}

- (void)setAccessoryObserverDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryObserverDispatcher, a3);
}

- (void)setResidentDeviceObserverDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_residentDeviceObserverDispatcher, a3);
}

- (void)setCameraObserverDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_cameraObserverDispatcher, a3);
}

- (void)setMediaObjectObserverDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_mediaObjectObserverDispatcher, a3);
}

- (void)setMediaSessionObserverDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_mediaSessionObserverDispatcher, a3);
}

- (void)setAudioControlObserverDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_audioControlObserverDispatcher, a3);
}

- (void)setSoftwareUpdateControllerObserverDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateControllerObserverDispatcher, a3);
}

- (void)setSoftwareUpdateControllerV2ObserverDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateControllerV2ObserverDispatcher, a3);
}

- (void)setSoftwareUpdateObserverDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateObserverDispatcher, a3);
}

- (void)setUserObserverDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_userObserverDispatcher, a3);
}

- (void)setSymptomsHandlerObserverDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_symptomsHandlerObserverDispatcher, a3);
}

- (void)setMediaDestinationControllerObserverDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_mediaDestinationControllerObserverDispatcher, a3);
}

- (void)setSiriEndpointProfileObserverDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_siriEndpointProfileObserverDispatcher, a3);
}

- (void)setSymptomFixSessionObserverDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_symptomFixSessionObserverDispatcher, a3);
}

- (void)setHomeKitSettingsObserverDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitSettingsObserverDispatcher, a3);
}

- (void)setNetworkConfigurationObserverDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_networkConfigurationObserverDispatcher, a3);
}

- (void)setTelevisionObserverDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_televisionObserverDispatcher, a3);
}

- (void)setHomePersonManagerDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_homePersonManagerDispatcher, a3);
}

- (void)setLightObserverDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_lightObserverDispatcher, a3);
}

- (void)setWalletKeyDeviceStateObserverDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_walletKeyDeviceStateObserverDispatcher, a3);
}

- (void)setHomePromises:(id)a3
{
  objc_storeStrong((id *)&self->_homePromises, a3);
}

- (void)setFirstHomeAddedPromises:(id)a3
{
  objc_storeStrong((id *)&self->_firstHomeAddedPromises, a3);
}

- (void)setAllHomesPromises:(id)a3
{
  objc_storeStrong((id *)&self->_allHomesPromises, a3);
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (void)setPinCodeManager:(id)a3
{
  objc_storeStrong((id *)&self->_pinCodeManager, a3);
}

- (HFActivityLogCoordinator)activityLogCoordinator
{
  return self->_activityLogCoordinator;
}

- (void)setActivityLogCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_activityLogCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityLogCoordinator, 0);
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
  objc_storeStrong((id *)&self->_homeManagerCreator, 0);
  objc_storeStrong((id *)&self->_locationCoordinatorSetupFuture, 0);
  objc_storeStrong((id *)&self->_allHomesPromises, 0);
  objc_storeStrong((id *)&self->_firstHomeAddedPromises, 0);
  objc_storeStrong((id *)&self->_homePromises, 0);
  objc_storeStrong((id *)&self->_walletKeyDeviceStateObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_lightObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_homePersonManagerDispatcher, 0);
  objc_storeStrong((id *)&self->_televisionObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_networkConfigurationObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_homeKitSettingsObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_symptomFixSessionObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_siriEndpointProfileObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_mediaDestinationControllerObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_symptomsHandlerObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_userObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_softwareUpdateObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_softwareUpdateControllerV2ObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_softwareUpdateControllerObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_audioControlObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_mediaSessionObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_mediaObjectObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_cameraObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_residentDeviceObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_accessoryObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_homeObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_homeManagerObserverDispatcher, 0);
  objc_storeStrong((id *)&self->_remoteAccessStateByHomeID, 0);
  objc_storeStrong((id *)&self->_locationCoordinator, 0);
  objc_storeStrong((id *)&self->_selectedHome, 0);
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_diagnosticInfoManager, 0);
  objc_storeStrong((id *)&self->_softwareUpdateManager, 0);
  objc_storeStrong((id *)&self->_accessorySettingsDataSource, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
}

@end
