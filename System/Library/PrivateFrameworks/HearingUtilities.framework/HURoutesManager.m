@implementation HURoutesManager

void __35__HURoutesManager_clearAudioRoutes__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

}

- (void)pickableAudioRoutesDidChange:(id)a3
{
  NSObject *routingQueue;
  _QWORD block[5];

  routingQueue = self->_routingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__HURoutesManager_pickableAudioRoutesDidChange___block_invoke;
  block[3] = &unk_1EA8E8220;
  block[4] = self;
  dispatch_async(routingQueue, block);
}

void __39__HURoutesManager__savePickableRoutes___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

}

void __38__HURoutesManager__copyPickableRoutes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __58__HURoutesManager_fetchCurrentPickableAudioRoutesIfNeeded__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "valueForKey:", CFSTR("RouteCurrentlyPicked"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("OutputRoute"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6 || objc_msgSend(v6, "BOOLValue"))
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v3, CFSTR("AXSHARoutePicked"));

  }
  objc_msgSend(v3, "valueForKey:", CFSTR("AVAudioRouteName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("RouteUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("RouteType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("RouteName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((!objc_msgSend(v8, "isEqual:", CFSTR("BluetoothLEOutput"))
     || objc_msgSend(v11, "isEqualToString:", CFSTR("Bluetooth Audio")))
    && !objc_msgSend(*(id *)(a1 + 40), "isRouteUIDHearingAidPeripheralUUID:inPeripheralUUIDs:", v9, *(_QWORD *)(a1 + 48)))
  {
    if ((objc_msgSend(v9, "isEqual:", CFSTR("Speaker")) & 1) != 0
      || objc_msgSend(v8, "isEqual:", CFSTR("Speaker")))
    {
      v13 = *(void **)(a1 + 32);
      v14 = CFSTR("AXSHARouteSpeaker");
    }
    else if (((objc_msgSend(v8, "hasPrefix:", CFSTR("Headset")) & 1) != 0
            || (objc_msgSend(v8, "hasPrefix:", CFSTR("Headphone")) & 1) != 0
            || objc_msgSend(v8, "hasPrefix:", CFSTR("CarAudioOutput")))
           && (objc_msgSend(*(id *)(a1 + 32), "valueForKey:", CFSTR("AXSHARouteHeadset")),
               v15 = (void *)objc_claimAutoreleasedReturnValue(),
               v15,
               !v15))
    {
      objc_msgSend(v3, "valueForKey:", CFSTR("IsPreferredExternalRoute"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "BOOLValue");

      objc_msgSend(v3, "valueForKey:", CFSTR("PreferredExternalRouteDetails_IsActive"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "BOOLValue");

      if (v17 && !v19)
        goto LABEL_16;
      v13 = *(void **)(a1 + 32);
      v14 = CFSTR("AXSHARouteHeadset");
    }
    else
    {
      if ((objc_msgSend(v8, "hasPrefix:", CFSTR("AirTunes")) & v5) != 1)
        goto LABEL_16;
      v13 = *(void **)(a1 + 32);
      v14 = CFSTR("AXSHARouteAirTunes");
    }
    objc_msgSend(v13, "setObject:forKey:", v3, v14);
    goto LABEL_16;
  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v3, CFSTR("AXSHARouteHearingAid"));
  HCLogHearingHandoff();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412290;
    v21 = v3;
    _os_log_impl(&dword_1DE311000, v12, OS_LOG_TYPE_DEFAULT, "Detected HA route: %@", (uint8_t *)&v20, 0xCu);
  }

LABEL_16:
  if (objc_msgSend(v10, "isEqual:", CFSTR("Default")))
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v3, CFSTR("AXSHARouteDefault"));
  if (v8)
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v8);

}

void __58__HURoutesManager_fetchCurrentPickableAudioRoutesIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "valueForKey:", *MEMORY[0x1E0D48158]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "BOOLValue") & 1) != 0)
  {
    objc_msgSend(v3, "valueForKey:", *MEMORY[0x1E0D481C8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v3, CFSTR("AXSHARouteLiveListen"));
      v7 = *MEMORY[0x1E0D2F928];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_INFO))
      {
        v8 = 138412290;
        v9 = v3;
        _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_INFO, "Found Live Listen route %@", (uint8_t *)&v8, 0xCu);
      }
    }
  }
  else
  {

  }
}

- (BOOL)isRouteUIDHearingAidPeripheralUUID:(id)a3 inPeripheralUUIDs:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(v5, "containsString:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11) & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

void __48__HURoutesManager_pickableAudioRoutesDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_copyPickableRoutes");
  objc_msgSend(*(id *)(a1 + 32), "clearAudioRoutes");
  v3 = objc_msgSend(*(id *)(a1 + 32), "shouldUpdateClients");
  objc_msgSend(*(id *)(a1 + 32), "fetchCurrentPickableAudioRoutesIfNeeded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HCLogHearingHandoff();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __48__HURoutesManager_pickableAudioRoutesDidChange___block_invoke_cold_1((uint64_t)v2, (uint64_t)v4, v5);

  if ((v3 & 1) != 0 || (objc_msgSend(*(id *)(a1 + 32), "oldRoutes:equalToNewRoutes:", v2, v4) & 1) == 0)
  {
    HCLogHearingHandoff();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1DE311000, v6, OS_LOG_TYPE_DEFAULT, "Posting pickableAudioRoutesDidChange notification", v8, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("com.apple.accessibility.hearingaid.audio.route.changed"), 0);

    objc_msgSend(*(id *)(a1 + 32), "setShouldUpdateClients:", 0);
  }

}

- (id)fetchCurrentPickableAudioRoutesIfNeeded
{
  id v3;
  void *v4;
  char v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  HURoutesManager *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = -[HURoutesManager _copyPickableRoutes](self, "_copyPickableRoutes");
  if (!v3)
  {
    -[HURoutesManager subscribeTimer](self, "subscribeTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isPending");

    if ((v5 & 1) != 0)
      return 0;
    -[HURoutesManager fetchHearingAidsPeripheralUUIDs](self, "fetchHearingAidsPeripheralUUIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "wirelessSplitterEnabled");

    v12 = MEMORY[0x1E0C809B0];
    if ((v11 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pickableRoutesForCategory:andMode:", *MEMORY[0x1E0C89688], *MEMORY[0x1E0C89758]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v12;
      v27[1] = 3221225472;
      v27[2] = __58__HURoutesManager_fetchCurrentPickableAudioRoutesIfNeeded__block_invoke;
      v27[3] = &unk_1EA8EA898;
      v28 = v9;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v27);

    }
    v15 = (void *)MRMediaRemoteCopyPickableRoutes();
    v22[0] = v12;
    v22[1] = 3221225472;
    v22[2] = __58__HURoutesManager_fetchCurrentPickableAudioRoutesIfNeeded__block_invoke_6;
    v22[3] = &unk_1EA8EAE18;
    v16 = v9;
    v23 = v16;
    v24 = self;
    v17 = v7;
    v25 = v17;
    v18 = v8;
    v26 = v18;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v22);
    if (objc_msgSend(v16, "count"))
    {
      -[HURoutesManager setShouldUpdateClients:](self, "setShouldUpdateClients:", 1);
      -[HURoutesManager _savePickableRoutes:](self, "_savePickableRoutes:", v16);
      v3 = v16;
    }
    else
    {
      v3 = 0;
    }
    v19 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_INFO))
    {
      v20 = v19;
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR(","));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v21;
      _os_log_impl(&dword_1DE311000, v20, OS_LOG_TYPE_INFO, "Routes %@", buf, 0xCu);

    }
  }
  return v3;
}

- (id)_copyPickableRoutes
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
  v7 = __Block_byref_object_copy__8;
  v8 = __Block_byref_object_dispose__8;
  v9 = 0;
  AX_PERFORM_WITH_LOCK();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (void)clearAudioRoutes
{
  AX_PERFORM_WITH_LOCK();
}

- (id)fetchHearingAidsPeripheralUUIDs
{
  void *v2;
  void *v3;

  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peripheralUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_savePickableRoutes:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AX_PERFORM_WITH_LOCK();

}

- (BOOL)oldRoutes:(id)a3 equalToNewRoutes:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  char v36;
  char v37;

  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "valueForKey:", CFSTR("AXSHARouteSpeaker"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v10, "valueForKey:", CFSTR("AXSHARouteSpeaker"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v37 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(v9, "valueForKey:", CFSTR("AXSHARouteSpeaker"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("RouteUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKey:", CFSTR("AXSHARouteSpeaker"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueForKey:", CFSTR("RouteUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v7, "isEqualToString:", v6);

  if (!v11)
    goto LABEL_6;
LABEL_7:

  objc_msgSend(v9, "valueForKey:", CFSTR("AXSHARouteHeadset"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(v10, "valueForKey:", CFSTR("AXSHARouteHeadset"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v36 = 1;
LABEL_12:

      goto LABEL_13;
    }
  }
  objc_msgSend(v9, "valueForKey:", CFSTR("AXSHARouteHeadset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("RouteUID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKey:", CFSTR("AXSHARouteHeadset"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valueForKey:", CFSTR("RouteUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v14, "isEqualToString:", v7);

  if (!v13)
    goto LABEL_12;
LABEL_13:

  objc_msgSend(v9, "valueForKey:", CFSTR("AXSHARouteDefault"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(v10, "valueForKey:", CFSTR("AXSHARouteDefault"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v20 = 1;
LABEL_18:

      goto LABEL_19;
    }
  }
  objc_msgSend(v9, "valueForKey:", CFSTR("AXSHARouteDefault"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", CFSTR("RouteUID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKey:", CFSTR("AXSHARouteDefault"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "valueForKey:", CFSTR("RouteUID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v17, "isEqualToString:", v19);

  if (!v16)
    goto LABEL_18;
LABEL_19:

  objc_msgSend(v9, "valueForKey:", CFSTR("AXSHARouteHearingAid"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    objc_msgSend(v10, "valueForKey:", CFSTR("AXSHARouteHearingAid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v26 = 1;
LABEL_24:

      goto LABEL_25;
    }
  }
  objc_msgSend(v9, "valueForKey:", CFSTR("AXSHARouteHearingAid"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "valueForKey:", CFSTR("RouteUID"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKey:", CFSTR("AXSHARouteHearingAid"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "valueForKey:", CFSTR("RouteUID"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v23, "isEqualToString:", v25);

  if (!v21)
    goto LABEL_24;
LABEL_25:

  objc_msgSend(v9, "valueForKey:", CFSTR("AXSHARouteLiveListen"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27
    || (objc_msgSend(v10, "valueForKey:", CFSTR("AXSHARouteLiveListen")),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v9, "valueForKey:", CFSTR("AXSHARouteLiveListen"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForKey:", CFSTR("AXSHARouteLiveListen"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqualToDictionary:", v29);

    if (v27)
      goto LABEL_31;
  }
  else
  {
    v30 = 1;
  }

LABEL_31:
  v31 = objc_msgSend(v9, "count");
  v32 = objc_msgSend(v10, "count");
  v33 = v37;
  if (v31 != v32)
    v33 = 0;
  v34 = v33 & v36 & v20 & v26 & v30;

  return v34;
}

- (id)currentPickableAudioRoutes
{
  return self->_pickableRoutes;
}

- (void)fetchCurrentPickableAudioRoutesIfNeededAsync:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HURoutesManager routingQueue](self, "routingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__HURoutesManager_fetchCurrentPickableAudioRoutesIfNeededAsync___block_invoke;
  v7[3] = &unk_1EA8E85B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __64__HURoutesManager_fetchCurrentPickableAudioRoutesIfNeededAsync___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "fetchCurrentPickableAudioRoutesIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    v4 = v2;
    (*(void (**)(void))(v3 + 16))();
    v2 = v4;
  }

}

- (HURoutesManager)init
{
  HURoutesManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *routingQueue;
  uint64_t v6;
  AXDispatchTimer *subscribeTimer;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HURoutesManager;
  v2 = -[HURoutesManager init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("ha_routing_queue", v3);
    routingQueue = v2->_routingQueue;
    v2->_routingQueue = (OS_dispatch_queue *)v4;

    v2->_routingLock._os_unfair_lock_opaque = 0;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF3978]), "initWithTargetSerialQueue:", v2->_routingQueue);
    subscribeTimer = v2->_subscribeTimer;
    v2->_subscribeTimer = (AXDispatchTimer *)v6;

    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:](v2->_subscribeTimer, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
    -[HURoutesManager registerNotifications](v2, "registerNotifications");
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HURoutesManager;
  -[HURoutesManager dealloc](&v4, sel_dealloc);
}

- (void)mediaServerDied
{
  void *v3;
  _QWORD v4[5];

  -[HURoutesManager subscribeTimer](self, "subscribeTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__HURoutesManager_mediaServerDied__block_invoke;
  v4[3] = &unk_1EA8E8220;
  v4[4] = self;
  objc_msgSend(v3, "afterDelay:processBlock:", v4, 2.0);

}

uint64_t __34__HURoutesManager_mediaServerDied__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Media server died. Register on media notifications."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HURoutesManager mediaServerDied]_block_invoke", 194, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_retainAutorelease(v3);
    v6 = v4;
    *(_DWORD *)buf = 136446210;
    v9 = objc_msgSend(v5, "UTF8String");
    _os_log_impl(&dword_1DE311000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "registerNotifications");
}

- (void)registerNotifications
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  MRMediaRemoteSetWantsRouteChangeNotifications();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_pickableAudioRoutesDidChange_, *MEMORY[0x1E0D4CD60], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_pickableAudioRoutesDidChange_, *MEMORY[0x1E0D4CDA0], 0);

  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (uint64_t *)MEMORY[0x1E0D48200];
  v11[0] = *MEMORY[0x1E0D48200];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:error:", v7, *MEMORY[0x1E0D48280], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *v6;
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_mediaServerDied, v9, v10);

}

- (OS_dispatch_queue)routingQueue
{
  return self->_routingQueue;
}

- (void)setRoutingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_routingQueue, a3);
}

- (AXDispatchTimer)subscribeTimer
{
  return self->_subscribeTimer;
}

- (void)setSubscribeTimer:(id)a3
{
  objc_storeStrong((id *)&self->_subscribeTimer, a3);
}

- (BOOL)shouldUpdateClients
{
  return self->_shouldUpdateClients;
}

- (void)setShouldUpdateClients:(BOOL)a3
{
  self->_shouldUpdateClients = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribeTimer, 0);
  objc_storeStrong((id *)&self->_routingQueue, 0);
  objc_storeStrong((id *)&self->_pickableRoutes, 0);
}

void __48__HURoutesManager_pickableAudioRoutesDidChange___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_1DE311000, log, OS_LOG_TYPE_DEBUG, "pickableAudioRoutesDidChange\nold: %@\nnew: %@", (uint8_t *)&v3, 0x16u);
}

@end
