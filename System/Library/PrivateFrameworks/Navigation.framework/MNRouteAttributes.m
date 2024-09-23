@implementation MNRouteAttributes

- (MNRouteAttributes)initWithCoder:(id)a3
{
  id v4;
  MNRouteAttributes *v5;
  MNRouteAttributes *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *latLngs;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MNRouteAttributes;
  v5 = -[MNRouteAttributes initWithCoder:](&v13, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[MNRouteAttributes _commonInit](v5, "_commonInit");
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("LatLngs"));
    v10 = objc_claimAutoreleasedReturnValue();
    latLngs = v6->_latLngs;
    v6->_latLngs = (NSArray *)v10;

    v6->_isStepping = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsStepping"));
  }

  return v6;
}

- (void)_commonInit
{
  geo_isolater *v3;
  geo_isolater *vehicleIsolator;

  v3 = (geo_isolater *)geo_isolater_create();
  vehicleIsolator = self->_vehicleIsolator;
  self->_vehicleIsolator = v3;

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MNRouteAttributes;
  v4 = a3;
  -[MNRouteAttributes encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_latLngs, CFSTR("LatLngs"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_isStepping, CFSTR("IsStepping"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MNRouteAttributes;
  v4 = -[MNRouteAttributes copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[NSArray copy](self->_latLngs, "copy");
  v6 = (void *)*((_QWORD *)v4 + 28);
  *((_QWORD *)v4 + 28) = v5;

  *((_BYTE *)v4 + 233) = self->_isStepping;
  objc_storeStrong((id *)v4 + 30, self->_vehicle);
  objc_storeStrong((id *)v4 + 31, self->_vgError);
  objc_storeStrong((id *)v4 + 34, self->_lprRules);
  *((_BYTE *)v4 + 264) = self->_hasResolvedRules;
  objc_storeStrong((id *)v4 + 35, self->_lprError);
  objc_msgSend(v4, "_commonInit");
  return v4;
}

- (MNRouteAttributes)initWithAttributes:(id)a3 waypoints:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  MNRouteAttributes *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isCurrentLocation");

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "bestLatLng", (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  v17 = -[MNRouteAttributes initWithAttributes:latLngs:isStepping:](self, "initWithAttributes:latLngs:isStepping:", v6, v10, v9 ^ 1u);
  return v17;
}

- (MNRouteAttributes)initWithAttributes:(id)a3 latLngs:(id)a4
{
  return -[MNRouteAttributes initWithAttributes:latLngs:isStepping:](self, "initWithAttributes:latLngs:isStepping:", a3, a4, 0);
}

- (MNRouteAttributes)initWithAttributes:(id)a3 latLngs:(id)a4 isStepping:(BOOL)a5
{
  id v8;
  id v9;
  MNRouteAttributes *v10;
  MNRouteAttributes *v11;
  uint64_t v12;
  NSArray *latLngs;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MNRouteAttributes;
  v10 = -[MNRouteAttributes init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    -[MNRouteAttributes _commonInit](v10, "_commonInit");
    if (v8)
      -[MNRouteAttributes mergeFrom:](v11, "mergeFrom:", v8);
    v12 = objc_msgSend(v9, "copy");
    latLngs = v11->_latLngs;
    v11->_latLngs = (NSArray *)v12;

    v11->_isStepping = a5;
  }

  return v11;
}

- (id)vehicle
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
  v7 = __Block_byref_object_copy__11;
  v8 = __Block_byref_object_dispose__11;
  v9 = 0;
  geo_isolate_sync_data();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __28__MNRouteAttributes_vehicle__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setHasResolvedRules:(BOOL)a3
{
  geo_isolate_sync_data();
}

void __41__MNRouteAttributes_setHasResolvedRules___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  NSObject *v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 264) != v2)
  {
    *(_BYTE *)(v1 + 264) = v2;
    MNGetMNRouteAttributesLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = CFSTR("YES");
      if (!*(_BYTE *)(a1 + 40))
        v6 = CFSTR("NO");
      v11 = 134218242;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_INFO, "%p setHasResolvedRules: %@", (uint8_t *)&v11, 0x16u);
    }

    v7 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v7 + 264))
    {
      v8 = *(void **)(v7 + 272);
      *(_QWORD *)(v7 + 272) = 0;

      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 280);
      *(_QWORD *)(v9 + 280) = 0;

    }
  }
}

- (void)_resolveSelectedVehicle:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  MNRouteAttributes *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MNGetMNRouteAttributesLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v11 = self;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_INFO, "%p _resolveSelectedVehicle: calling into MNVirtualGarageManager to get selected vehicle", buf, 0xCu);
  }

  +[MNVirtualGarageManager sharedManager](MNVirtualGarageManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__MNRouteAttributes__resolveSelectedVehicle___block_invoke;
  v8[3] = &unk_1E61D72D0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "updatedVehicleStateWithHandler:", v8);

}

void __45__MNRouteAttributes__resolveSelectedVehicle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  geo_isolate_sync();
  if (!v7 || v6)
  {
    if (v7 && objc_msgSend(v7, "isPureElectricVehicle"))
      objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:", 6094, 0, 0);
    MNGetMNRouteAttributesLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v9 = v12;
    if (v6)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134218242;
        v20 = v13;
        v21 = 2112;
        v22 = v6;
        _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_ERROR, "%p Error getting updated vehicle state when building route attributes: %@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "_navigation_errorWithCode:debugDescription:underlyingError:", 17, CFSTR("Failed to get virtual garage"), v6);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v16 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v20 = v16;
      _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_INFO, "%p No vehicle selected in VirtualGarage when building route attributes.", buf, 0xCu);
    }
  }
  else
  {
    v8 = objc_msgSend(v7, "isPureElectricVehicle");
    MNGetMNRouteAttributesLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (v10)
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134218242;
        v20 = v11;
        v21 = 2112;
        v22 = v7;
        _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_INFO, "%p Got SoC of vehicle: %@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      v14 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v7, "displayName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "length"))
        objc_msgSend(v7, "displayName");
      else
        objc_msgSend(v7, "licensePlate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v20 = v14;
      v21 = 2112;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_INFO, "%p Got selected vehicle: %@ | %@", buf, 0x20u);

    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __45__MNRouteAttributes__resolveSelectedVehicle___block_invoke_2(uint64_t a1)
{
  void *v2;

  if (*(_QWORD *)(a1 + 40))
    v2 = 0;
  else
    v2 = *(void **)(a1 + 48);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 240), v2);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 248), *(id *)(a1 + 40));
}

+ (void)_loadLPRRulesForWaypoints:(id)a3 forceUpdate:(BOOL)a4 queue:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  MNLPRRuleHelper *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD block[4];
  MNLPRRuleHelper *v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v8 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (v11 && v12)
  {
    if (objc_msgSend(v10, "count"))
    {
      v14 = objc_alloc_init(MNLPRRuleHelper);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __76__MNRouteAttributes__loadLPRRulesForWaypoints_forceUpdate_queue_completion___block_invoke_2;
      v16[3] = &unk_1E61D72F8;
      v18 = a1;
      v17 = v13;
      -[MNLPRRuleHelper fetchRulesForWaypoints:forceUpdateManifest:forceUpdateRules:completionQueue:completion:](v14, "fetchRulesForWaypoints:forceUpdateManifest:forceUpdateRules:completionQueue:completion:", v10, 0, v8, v11, v16);

    }
    else
    {
      MNGetMNRouteAttributesLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v22 = a1;
        _os_log_impl(&dword_1B0AD7000, v15, OS_LOG_TYPE_INFO, "%p No waypoints provided, not looking up lpr rules", buf, 0xCu);
      }

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __76__MNRouteAttributes__loadLPRRulesForWaypoints_forceUpdate_queue_completion___block_invoke;
      block[3] = &unk_1E61D2488;
      v20 = v13;
      dispatch_async(v11, block);
      v14 = v20;
    }

  }
}

uint64_t __76__MNRouteAttributes__loadLPRRulesForWaypoints_forceUpdate_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__MNRouteAttributes__loadLPRRulesForWaypoints_forceUpdate_queue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    MNGetMNRouteAttributesLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v14 = 134218242;
      v15 = v9;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_ERROR, "%p Failed to get LPR rules. Error: %@", (uint8_t *)&v14, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "_navigation_errorWithCode:debugDescription:underlyingError:", 17, CFSTR("Failed to get LPR rules"), v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D263E8], "captureUserAction:target:value:", 2191, 0, CFSTR("EmptyRules"));
  }
  else
  {
    v10 = 0;
  }
  MNGetMNRouteAttributesLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = *(_QWORD *)(a1 + 40);
    v13 = objc_msgSend(v5, "count");
    v14 = 134218240;
    v15 = v12;
    v16 = 1024;
    LODWORD(v17) = v13;
    _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_INFO, "%p Found %d lpr rule sets", (uint8_t *)&v14, 0x12u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_loadRulesIfNecessaryWithVehicle:(id)a3 queue:(id)a4 finishedHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  NSArray *latLngs;
  _BOOL8 forceUpdate;
  NSObject *v17;
  void *v18;
  int v19;
  _BOOL4 v20;
  const char *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  MNRouteAttributes *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "licensePlate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    v12 = -[MNRouteAttributes hasResolvedRules](self, "hasResolvedRules");

    if (!v12)
    {
      MNGetMNRouteAttributesLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "licensePlate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218240;
        v26 = self;
        v27 = 1024;
        v28 = objc_msgSend(v14, "length");
        _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_INFO, "%p Will load rules for plate of %d chars length", buf, 0x12u);

      }
      latLngs = self->_latLngs;
      forceUpdate = self->_forceUpdate;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __76__MNRouteAttributes__loadRulesIfNecessaryWithVehicle_queue_finishedHandler___block_invoke;
      v22[3] = &unk_1E61D7320;
      v22[4] = self;
      v24 = v10;
      v23 = v8;
      +[MNRouteAttributes _loadLPRRulesForWaypoints:forceUpdate:queue:completion:](MNRouteAttributes, "_loadLPRRulesForWaypoints:forceUpdate:queue:completion:", latLngs, forceUpdate, v9, v22);

      goto LABEL_12;
    }
  }
  else
  {

  }
  MNGetMNRouteAttributesLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "licensePlate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");
    v20 = -[MNRouteAttributes hasResolvedRules](self, "hasResolvedRules");
    v21 = "NO";
    *(_DWORD *)buf = 134218498;
    v26 = self;
    if (v20)
      v21 = "YES";
    v27 = 1024;
    v28 = v19;
    v29 = 2080;
    v30 = v21;
    _os_log_impl(&dword_1B0AD7000, v17, OS_LOG_TYPE_INFO, "%p Not loading rules plate is %d chars & hasResolvedRules: %s", buf, 0x1Cu);

  }
  (*((void (**)(id, id, uint64_t))v10 + 2))(v10, v8, 1);
LABEL_12:

}

void __76__MNRouteAttributes__loadRulesIfNecessaryWithVehicle_queue_finishedHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 272);
  *(_QWORD *)(v7 + 272) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 280);
  *(_QWORD *)(v9 + 280) = v6;
  v11 = v6;

  objc_msgSend(*(id *)(a1 + 32), "setHasResolvedRules:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)_populateRouteAttributesWithVehicle:(id)a3 finishedHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, uint64_t);
  void *v8;
  void *v9;
  int BOOL;
  int v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
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
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  NSObject *v63;
  id v64;
  void *v65;
  void *v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t j;
  void *v77;
  id v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  NSObject *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  id v98;
  MNRouteAttributes *v99;
  NSArray *latLngs;
  void *v101;
  id v102;
  id v103;
  void *v104;
  void *v105;
  double v106;
  void *v107;
  int HasValue;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  double v113;
  double v114;
  void *v115;
  void *v116;
  MNRouteAttributes *v117;
  uint64_t Integer;
  void *v119;
  void *v120;
  void *v121;
  uint64_t v122;
  double v123;
  double v124;
  dispatch_time_t v125;
  void *v126;
  void *v127;
  NSObject *v128;
  void *v129;
  int v130;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  dispatch_time_t v136;
  id v137;
  void (**v138)(id, void *, uint64_t);
  void (**v139)(id, void *, uint64_t);
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  MNRouteAttributes *v144;
  void *v145;
  void *v146;
  void *v147;
  id v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  uint64_t v157;
  const __CFString *v158;
  _BYTE v159[128];
  uint8_t v160[128];
  _BYTE buf[24];
  void *v162;
  uint64_t v163;
  void *v164;
  uint64_t v165;

  v165 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, uint64_t))a4;
  v8 = (void *)-[MNRouteAttributes copy](self, "copy");
  objc_msgSend(v8, "automobileOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setVehicleSpecifications:", 0);

  BOOL = GEOConfigGetBOOL();
  v11 = GEOConfigGetBOOL();
  v144 = self;
  if (self->_isStepping)
    v12 = v11 | BOOL ^ 1;
  else
    v12 = 1;
  v147 = v6;
  if (objc_msgSend(v6, "isPureElectricVehicle") && v12)
  {
    v138 = v7;
    v140 = v8;
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC6BF0], "sharedService");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActiveVehicleIdentifier:", v13);

    v15 = objc_alloc_init(MEMORY[0x1E0D27090]);
    objc_msgSend(v6, "currentVehicleState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "consumptionArguments");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v15, "setConsumptionArguments:", v18);

    objc_msgSend(v6, "currentVehicleState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "chargingArguments");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(v15, "setChargingArguments:", v21);

    objc_msgSend(v6, "currentVehicleState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "maxEVRange");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "measurementByConvertingToUnit:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValue");
    objc_msgSend(v15, "setMaxRange:", v26);

    objc_msgSend(v6, "currentVehicleState");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "minBatteryCapacity");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3AB0], "kilowattHours");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "measurementByConvertingToUnit:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "doubleValue");
    objc_msgSend(v15, "setMinBatteryCharge:", (v31 * 1000.0));

    +[MNVirtualGarageManager sharedManager](MNVirtualGarageManager, "sharedManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v28) = objc_msgSend(v32, "assumesFullCharge");

    objc_msgSend(v6, "currentVehicleState");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if ((_DWORD)v28)
    {
      objc_msgSend(v33, "maxBatteryCapacity");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3AB0], "kilowattHours");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "measurementByConvertingToUnit:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "doubleValue");
      objc_msgSend(v15, "setCurrentBatteryCharge:", (v38 * 1000.0));

      v39 = 100;
    }
    else
    {
      objc_msgSend(v33, "currentBatteryCapacity");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3AB0], "kilowattHours");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "measurementByConvertingToUnit:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "doubleValue");
      objc_msgSend(v15, "setCurrentBatteryCharge:", (v43 * 1000.0));

      v39 = objc_msgSend(v6, "displayedBatteryPercentage");
    }
    objc_msgSend(v15, "setCurrentBatteryPercentage:", v39);
    objc_msgSend(v6, "currentVehicleState");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "maxBatteryCapacity");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3AB0], "kilowattHours");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "measurementByConvertingToUnit:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "doubleValue");
    objc_msgSend(v15, "setMaxBatteryCharge:", (v48 * 1000.0));

    objc_msgSend(v6, "currentVehicleState");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "dateOfUpdate");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "timeIntervalSinceReferenceDate");
    objc_msgSend(v15, "setLastSocUpdateDate:", v51);

    objc_msgSend(v6, "currentVehicleState");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setIsCharging:", objc_msgSend(v52, "isCharging"));

    v53 = objc_alloc_init(MEMORY[0x1E0D26F50]);
    v145 = v15;
    objc_msgSend(v15, "setChargerPlugsInfo:", v53);

    v155 = 0u;
    v156 = 0u;
    v153 = 0u;
    v154 = 0u;
    objc_msgSend(v6, "powerByConnector");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v153, v160, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v154;
      do
      {
        for (i = 0; i != v56; ++i)
        {
          if (*(_QWORD *)v154 != v57)
            objc_enumerationMutation(v54);
          v59 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * i);
          objc_msgSend(v59, "unsignedIntegerValue");
          v60 = GEOEvChargingConnectorTypeFromVGConnectorType();
          if ((_DWORD)v60)
          {
            v61 = v60;
            objc_msgSend(v6, "powerByConnector");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "objectForKeyedSubscript:", v59);
            v63 = objc_claimAutoreleasedReturnValue();

            v64 = objc_alloc_init(MEMORY[0x1E0D26F48]);
            objc_msgSend(v64, "setType:", v61);
            objc_msgSend(MEMORY[0x1E0CB3AE8], "watts");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject measurementByConvertingToUnit:](v63, "measurementByConvertingToUnit:", v65);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "doubleValue");
            objc_msgSend(v64, "setMaximumPower:", v67);

            objc_msgSend(v145, "chargerPlugsInfo");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "addSupportedChargerPlug:", v64);

          }
          else
          {
            MNGetMNRouteAttributesLog();
            v63 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218242;
              *(_QWORD *)&buf[4] = v144;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v59;
              _os_log_impl(&dword_1B0AD7000, v63, OS_LOG_TYPE_ERROR, "%p Skipping unknown VG connector: %@", buf, 0x16u);
            }
          }

        }
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v153, v160, 16);
      }
      while (v56);
    }

    v8 = v140;
    objc_msgSend(v140, "_vehicleSpecifications");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v145;
    objc_msgSend(v69, "setEvInfo:", v145);
    if (objc_msgSend(v6, "usesPreferredNetworksForRouting"))
    {
      v142 = v69;
      v71 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v149 = 0u;
      v150 = 0u;
      v151 = 0u;
      v152 = 0u;
      objc_msgSend(v6, "preferredChargingNetworks");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v149, v159, 16);
      if (v73)
      {
        v74 = v73;
        v75 = *(_QWORD *)v150;
        do
        {
          for (j = 0; j != v74; ++j)
          {
            if (*(_QWORD *)v150 != v75)
              objc_enumerationMutation(v72);
            v77 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * j);
            v78 = objc_alloc_init(MEMORY[0x1E0D27088]);
            v79 = objc_alloc_init(MEMORY[0x1E0D27380]);
            objc_msgSend(v79, "setChargingNetworkMuid:", objc_msgSend(v77, "globalBrandID"));
            objc_msgSend(v78, "setPreferenceEntity:", v79);
            objc_msgSend(v78, "setPreferenceType:", 1);
            objc_msgSend(v71, "addObject:", v78);

          }
          v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v149, v159, 16);
        }
        while (v74);
      }

      v8 = v140;
      objc_msgSend(v140, "_userPreferences");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = (void *)objc_msgSend(v71, "copy");
      objc_msgSend(v80, "setEvChargingPreferences:", v81);

      v70 = v145;
      v6 = v147;
      v69 = v142;
    }

    v7 = v138;
  }
  if (-[NSArray count](v144->_lprRules, "count"))
  {
    objc_msgSend(v6, "licensePlate");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v82, "length");

    if (v83)
    {
      v139 = v7;
      v141 = v8;
      v84 = objc_alloc_init(MEMORY[0x1E0D27130]);
      objc_msgSend(v6, "licensePlate");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setLicensePlate:", v85);

      objc_msgSend(v6, "lprVehicleType");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setVehicleTypeKey:", v86);

      objc_msgSend(v6, "lprPowerType");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setPowerTypeKey:", v87);

      GEOConfigGetDate();
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v146 = v88;
      if (v88)
      {
        v89 = v88;
        MNGetMNRouteAttributesLog();
        v90 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v89;
          _os_log_impl(&dword_1B0AD7000, v90, OS_LOG_TYPE_DEFAULT, "!!!IMPORTANT!!! The date for LPR masking has been overridden to %@ !!!IMPORTANT!!! ", buf, 0xCu);
        }

        v91 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v89 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
        v91 = objc_claimAutoreleasedReturnValue();
      }
      v98 = -[MNLPRRuleMatcher initForVehicle:withRules:]([MNLPRRuleMatcher alloc], "initForVehicle:withRules:", v84, v144->_lprRules);
      v99 = v144;
      latLngs = v144->_latLngs;
      v148 = 0;
      v137 = v98;
      v143 = (void *)v91;
      objc_msgSend(v98, "generateMaskedPlateForWaypoints:date:timeZone:error:", latLngs, v89, v91, &v148);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = v148;
      v103 = objc_alloc_init(MEMORY[0x1E0D27110]);
      objc_msgSend(v147, "lprVehicleType");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "setVehicleTypeKey:", v104);

      objc_msgSend(v147, "lprPowerType");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "setPowerTypeKey:", v105);

      objc_msgSend(v89, "timeIntervalSinceReferenceDate");
      objc_msgSend(v103, "setTimestamp:", (unint64_t)v106);
      objc_msgSend(v103, "setMaskedplateGeneratorValidatorVersion:", 2);
      if (!v144->_forceUpdate)
      {
        objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v107, "isInternalInstall") & 1) != 0)
        {
          HasValue = _GEOConfigHasValue();

          v99 = v144;
          if (HasValue)
          {
            GEOConfigGetString();
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "dataUsingEncoding:", 4);
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "setVersionId:", v110);

            v112 = NavigationConfig_LPRProvideBadVersion_DEBUG;
            v111 = off_1EEECA5C0;
            GEOConfigGetDouble();
            v114 = fmin(v113, 3600.0);
            if (v114 >= 0.1)
            {
              v136 = dispatch_time(0, (uint64_t)(v114 * 1000000000.0));
              *(_QWORD *)buf = MEMORY[0x1E0C809B0];
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = ____scheduleDebugConfigKeyReset_block_invoke;
              v162 = &__block_descriptor_48_e5_v8__0l;
              v163 = v112;
              v164 = v111;
              dispatch_after(v136, MEMORY[0x1E0C80D38], buf);
            }
            else
            {
              _GEOConfigRemoveValue();
            }
            v117 = v144;
            if (v102)
              goto LABEL_58;
            goto LABEL_52;
          }
        }
        else
        {

          v99 = v144;
        }
      }
      -[NSArray firstObject](v99->_lprRules, "firstObject");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "version");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "setVersionId:", v116);

      v117 = v99;
      if (v102)
      {
LABEL_58:
        objc_msgSend(v141, "_vehicleSpecifications");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v101, "length") || v102)
        {
          MNGetMNRouteAttributesLog();
          v128 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218242;
            *(_QWORD *)&buf[4] = v117;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v102;
            _os_log_impl(&dword_1B0AD7000, v128, OS_LOG_TYPE_ERROR, "%p Failed to mask license plate. Error: %@", buf, 0x16u);
          }

          objc_msgSend(v102, "domain");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          v130 = objc_msgSend(v129, "isEqualToString:", CFSTR("MapsNavLPRErrorDomain"));

          v127 = v137;
          if (v130)
          {
            if ((unint64_t)(objc_msgSend(v102, "code") + 12) > 2)
              v131 = 3;
            else
              v131 = 2;
            objc_msgSend(v126, "setLprPlateMissingReason:", v131);
          }
        }
        else
        {
          objc_msgSend(v103, "setLicensePlate:", v101);
          v127 = v137;
        }
        objc_msgSend(v126, "setLprInfo:", v103);

        v6 = v147;
        v7 = v139;
        v8 = v141;
        goto LABEL_69;
      }
LABEL_52:
      if (_GEOConfigHasValue())
      {
        Integer = GEOConfigGetInteger();
        v119 = (void *)MEMORY[0x1E0CB35C8];
        v157 = *MEMORY[0x1E0C9AFA8];
        v158 = CFSTR("Error was generated by request of LPRMaskPlateFailureCode_DEBUG key");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v158, &v157, 1);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "errorWithDomain:code:userInfo:", CFSTR("MapsNavLPRErrorDomain"), Integer, v120);
        v102 = (id)objc_claimAutoreleasedReturnValue();

        v122 = NavigationConfig_LPRMaskPlateFailureCode_DEBUG;
        v121 = off_1EEECA5D0;
        GEOConfigGetDouble();
        v124 = fmin(v123, 3600.0);
        if (v124 >= 0.1)
        {
          v125 = dispatch_time(0, (uint64_t)(v124 * 1000000000.0));
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = ____scheduleDebugConfigKeyReset_block_invoke;
          v162 = &__block_descriptor_48_e5_v8__0l;
          v163 = v122;
          v164 = v121;
          dispatch_after(v125, MEMORY[0x1E0C80D38], buf);
        }
        else
        {
          _GEOConfigRemoveValue();
        }
      }
      else
      {
        v102 = 0;
      }
      v117 = v144;
      goto LABEL_58;
    }
  }
  if (!v6)
  {
    +[MNVirtualGarageManager sharedManager](MNVirtualGarageManager, "sharedManager");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v96, "vehiclesCount");

    if (v97)
    {
      objc_msgSend(v8, "_vehicleSpecifications");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = v94;
      v95 = 1;
      goto LABEL_43;
    }
  }
  if (-[MNRouteAttributes hasResolvedRules](v144, "hasResolvedRules"))
  {
    if (!-[NSArray count](v144->_lprRules, "count"))
    {
      objc_msgSend(v6, "licensePlate");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = objc_msgSend(v92, "length");

      if (v93)
      {
        objc_msgSend(v8, "_vehicleSpecifications");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = v94;
        v95 = 3;
LABEL_43:
        objc_msgSend(v94, "setLprPlateMissingReason:", v95);
LABEL_69:

      }
    }
  }
  v132 = (void *)objc_opt_new();
  +[MNCarPlayConnectionMonitor sharedInstance](MNCarPlayConnectionMonitor, "sharedInstance");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "setCarPlayConnectionStatus:", objc_msgSend(v133, "isConnected"));

  +[MNVirtualGarageManager sharedManager](MNVirtualGarageManager, "sharedManager");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "setIntentsConnectionStatus:", objc_msgSend(v134, "isProviderStarted"));

  objc_msgSend(v8, "_vehicleSpecifications");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "setVehicleInfo:", v132);

  v7[2](v7, v8, 1);
}

- (void)buildRouteAttributes:(id)a3 queue:(id)a4 result:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSArray *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSArray *latLngs;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10 && !-[MNRouteAttributes mainTransportType](self, "mainTransportType"))
  {
    v11 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "bestLatLng", (_QWORD)v19);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            -[NSArray addObject:](v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v14);
    }

    latLngs = self->_latLngs;
    self->_latLngs = v11;

  }
  -[MNRouteAttributes buildRouteAttributes:result:](self, "buildRouteAttributes:result:", v9, v10, (_QWORD)v19);

}

- (void)buildRouteAttributes:(id)a3 result:(id)a4
{
  NSObject *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  __CFString *v10;
  MNSequence *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  char *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  _QWORD v21[5];
  NSObject *v22;
  _QWORD v23[5];
  _QWORD block[5];
  MNSequence *v25;
  uint8_t buf[4];
  MNRouteAttributes *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  _BYTE v31[14];
  __int16 v32;
  MNSequence *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (-[MNRouteAttributes mainTransportType](self, "mainTransportType"))
    {
      MNGetMNRouteAttributesLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = -[MNRouteAttributes mainTransportType](self, "mainTransportType");
        if (v9 >= 7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v9);
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = off_1E61D73B8[(int)v9];
        }
        -[MNRouteAttributes formattedText](self, "formattedText");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v27 = self;
        v28 = 2112;
        v29 = (const char *)v10;
        v30 = 2112;
        *(_QWORD *)v31 = v17;
        _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_ERROR, "%p Requested updated route attributes for an unsupported transportType: %@, attributes:\n%@", buf, 0x20u);

      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49__MNRouteAttributes_buildRouteAttributes_result___block_invoke;
      block[3] = &unk_1E61D16E0;
      block[4] = self;
      v25 = (MNSequence *)v7;
      dispatch_async(v6, block);
      v11 = v25;
    }
    else
    {
      v13 = +[MNCarPlayConnectionMonitor sharedInstance](MNCarPlayConnectionMonitor, "sharedInstance");
      MNGetMNRouteAttributesLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        -[MNRouteAttributes formattedText](self, "formattedText");
        v15 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v27 = self;
        v28 = 2112;
        v29 = v15;
        _os_log_impl(&dword_1B0AD7000, v14, OS_LOG_TYPE_DEFAULT, "%p Requesting updated route attributes:\n%@", buf, 0x16u);

      }
      v11 = -[MNSequence initWithQueue:]([MNSequence alloc], "initWithQueue:", v6);
      v16 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __49__MNRouteAttributes_buildRouteAttributes_result___block_invoke_85;
      v23[3] = &unk_1E61D3B50;
      v23[4] = self;
      -[MNSequence addStep:](v11, "addStep:", v23);
      v21[0] = v16;
      v21[1] = 3221225472;
      v21[2] = __49__MNRouteAttributes_buildRouteAttributes_result___block_invoke_2;
      v21[3] = &unk_1E61D7348;
      v21[4] = self;
      v22 = v6;
      -[MNSequence addStep:](v11, "addStep:", v21);
      v20[0] = v16;
      v20[1] = 3221225472;
      v20[2] = __49__MNRouteAttributes_buildRouteAttributes_result___block_invoke_3;
      v20[3] = &unk_1E61D7370;
      v20[4] = self;
      -[MNSequence addStep:](v11, "addStep:", v20);
      v18[0] = v16;
      v18[1] = 3221225472;
      v18[2] = __49__MNRouteAttributes_buildRouteAttributes_result___block_invoke_4;
      v18[3] = &unk_1E61D7398;
      v18[4] = self;
      v19 = v7;
      -[MNSequence addStep:](v11, "addStep:", v18);
      -[MNSequence start](v11, "start");

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("defaultRouteAttributesForTransportType called without a handler"));
    v11 = (MNSequence *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v27 = (MNRouteAttributes *)"-[MNRouteAttributes buildRouteAttributes:result:]";
      v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/GEORouteAttributes+MNExtras.m";
      v30 = 1024;
      *(_DWORD *)v31 = 627;
      *(_WORD *)&v31[4] = 2080;
      *(_QWORD *)&v31[6] = "result != nil";
      v32 = 2112;
      v33 = v11;
      _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }

  }
}

void __49__MNRouteAttributes_buildRouteAttributes_result___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

uint64_t __49__MNRouteAttributes_buildRouteAttributes_result___block_invoke_85(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resolveSelectedVehicle:");
}

uint64_t __49__MNRouteAttributes_buildRouteAttributes_result___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadRulesIfNecessaryWithVehicle:queue:finishedHandler:", a2, *(_QWORD *)(a1 + 40), a3);
}

uint64_t __49__MNRouteAttributes_buildRouteAttributes_result___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_populateRouteAttributesWithVehicle:finishedHandler:", a2, a3);
}

void __49__MNRouteAttributes_buildRouteAttributes_result___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 240);
  v7 = a3;
  objc_msgSend(v6, "combinedDisplayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 248);
  if (v10)
  {
    v11 = v10;
    goto LABEL_4;
  }
  v11 = *(id *)(v9 + 280);
  if (v11)
  {
LABEL_4:
    MNGetMNRouteAttributesLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "formattedText");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 134218754;
      v18 = v13;
      v19 = 2112;
      v20 = v8;
      v21 = 2112;
      v22 = v11;
      v23 = 2112;
      v24 = v14;
      _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_ERROR, "%p Error updating route attributes with vehicle \"%@\". Error: %@.\nRoute attributes:\n%@", (uint8_t *)&v17, 0x2Au);

    }
    goto LABEL_9;
  }
  MNGetMNRouteAttributesLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "formattedText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 134218498;
    v18 = v15;
    v19 = 2112;
    v20 = v8;
    v21 = 2112;
    v22 = v16;
    _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_DEFAULT, "%p Used vehicle \"%@\" to update route attributes:\n%@", (uint8_t *)&v17, 0x20u);

  }
  v11 = 0;
LABEL_9:

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);

}

- (void)buildRouteAttributesForETAUpdateRequest:(id)a3 queue:(id)a4 result:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  NSArray *v18;
  unint64_t v19;
  void *v20;
  NSArray *latLngs;
  id v22;

  v22 = a4;
  v8 = a5;
  objc_msgSend(a3, "currentUserLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (-[NSArray count](self->_latLngs, "count"))
    {
      -[NSArray firstObject](self->_latLngs, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "coordinate");
      v12 = v11;
      v14 = v13;

      objc_msgSend(v9, "coordinate");
      if (vabdd_f64(v15, v12) >= 0.0001 || vabdd_f64(v16, v14) >= 0.0001)
      {
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27140]), "initWithCoordinate:", v15, v16);
        v18 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_latLngs, "count"));
        -[NSArray addObject:](v18, "addObject:", v17);
        if (-[NSArray count](self->_latLngs, "count") >= 2)
        {
          v19 = 1;
          do
          {
            -[NSArray objectAtIndexedSubscript:](self->_latLngs, "objectAtIndexedSubscript:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray addObject:](v18, "addObject:", v20);

            ++v19;
          }
          while (v19 < -[NSArray count](self->_latLngs, "count"));
        }
        latLngs = self->_latLngs;
        self->_latLngs = v18;

        -[MNRouteAttributes setHasResolvedRules:](self, "setHasResolvedRules:", 0);
      }
    }
  }
  -[MNRouteAttributes buildRouteAttributes:result:](self, "buildRouteAttributes:result:", v22, v8);

}

- (BOOL)shouldRetryForError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GEOErrorDomain();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", v6))
  {

    goto LABEL_5;
  }
  v7 = objc_msgSend(v4, "code");

  if (v7 != -28)
  {
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  v8 = 1;
  self->_forceUpdate = 1;
  -[MNRouteAttributes setHasResolvedRules:](self, "setHasResolvedRules:", 0);
LABEL_6:

  return v8;
}

- (BOOL)hasResolvedRules
{
  return self->_hasResolvedRules;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lprError, 0);
  objc_storeStrong((id *)&self->_lprRules, 0);
  objc_storeStrong((id *)&self->_vehicleIsolator, 0);
  objc_storeStrong((id *)&self->_vgError, 0);
  objc_storeStrong((id *)&self->_vehicle, 0);
  objc_storeStrong((id *)&self->_latLngs, 0);
}

@end
