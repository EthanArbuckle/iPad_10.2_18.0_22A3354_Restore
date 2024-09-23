@implementation HDCloudSyncCloudState

- (HDCloudSyncCloudState)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDCloudSyncCloudState)initWithZones:(id)a3
{
  return -[HDCloudSyncCloudState initWithZones:targets:](self, "initWithZones:targets:", a3, MEMORY[0x1E0C9AA60]);
}

- (HDCloudSyncCloudState)initWithZones:(id)a3 targets:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  HDCloudSyncCloudState *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v6;
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
        objc_msgSend(v14, "zoneIdentifier", (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v15);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v16 = -[HDCloudSyncCloudState initWithZonesByIdentifier:targets:](self, "initWithZonesByIdentifier:targets:", v8, v7);
  return v16;
}

- (HDCloudSyncCloudState)initWithZonesByIdentifier:(id)a3
{
  return -[HDCloudSyncCloudState initWithZonesByIdentifier:targets:](self, "initWithZonesByIdentifier:targets:", a3, MEMORY[0x1E0C9AA60]);
}

- (HDCloudSyncCloudState)initWithZonesByIdentifier:(id)a3 targets:(id)a4
{
  id v6;
  id v7;
  HDCloudSyncCloudState *v8;
  uint64_t v9;
  NSDictionary *zonesByIdentifier;
  uint64_t v11;
  NSArray *targets;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  HDCloudSyncZone *v20;
  HDCloudSyncZone *primaryPushZone;
  HDCloudSyncZone *v22;
  int minimumSupportedProtocolVersion;
  int v24;
  int v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)HDCloudSyncCloudState;
  v8 = -[HDCloudSyncCloudState init](&v31, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    zonesByIdentifier = v8->_zonesByIdentifier;
    v8->_zonesByIdentifier = (NSDictionary *)v9;

    v11 = objc_msgSend(v7, "copy");
    targets = v8->_targets;
    v8->_targets = (NSArray *)v11;

    v8->_minimumSupportedProtocolVersion = 1;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v6, "allValues", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (!v14)
      goto LABEL_18;
    v15 = v14;
    v16 = *(_QWORD *)v28;
    while (1)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "purpose");
        if (v19 == 2)
        {
          objc_msgSend(v18, "storeRecord");
          v22 = (HDCloudSyncZone *)objc_claimAutoreleasedReturnValue();
          primaryPushZone = v22;
          if (v22)
          {
            minimumSupportedProtocolVersion = v8->_minimumSupportedProtocolVersion;
            v24 = -[HDCloudSyncZone supportedProtocolVersion](v22, "supportedProtocolVersion");
            if (minimumSupportedProtocolVersion >= v24)
              v25 = v24;
            else
              v25 = minimumSupportedProtocolVersion;
            v8->_minimumSupportedProtocolVersion = v25;
          }
        }
        else
        {
          if (v19 != 1)
            continue;
          v20 = v18;
          primaryPushZone = v8->_primaryPushZone;
          v8->_primaryPushZone = v20;
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (!v15)
      {
LABEL_18:

        break;
      }
    }
  }

  return v8;
}

- (NSArray)pushTargets
{
  return (NSArray *)-[NSArray hk_filter:](self->_targets, "hk_filter:", &__block_literal_global_227);
}

BOOL __36__HDCloudSyncCloudState_pushTargets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "purpose") == 0;
}

- (NSArray)pullTargets
{
  return (NSArray *)-[NSArray hk_filter:](self->_targets, "hk_filter:", &__block_literal_global_187_0);
}

BOOL __36__HDCloudSyncCloudState_pullTargets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "purpose") == 1;
}

- (id)cloudStateByAddingZone:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncCloudState cloudStateByAddingZones:](self, "cloudStateByAddingZones:", v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)cloudStateByAddingZones:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  HDCloudSyncCloudState *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)-[NSDictionary mutableCopy](self->_zonesByIdentifier, "mutableCopy");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "zoneIdentifier", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = -[HDCloudSyncCloudState initWithZonesByIdentifier:targets:]([HDCloudSyncCloudState alloc], "initWithZonesByIdentifier:targets:", v5, self->_targets);
  return v13;
}

- (id)cloudStateByRemovingZones:(id)a3
{
  void *v4;
  HDCloudSyncCloudState *v5;
  NSDictionary *zonesByIdentifier;
  uint64_t v7;
  id v8;
  void *v9;
  NSArray *targets;
  id v11;
  void *v12;
  HDCloudSyncCloudState *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  objc_msgSend(a3, "hk_mapToSet:", &__block_literal_global_191_1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [HDCloudSyncCloudState alloc];
  zonesByIdentifier = self->_zonesByIdentifier;
  v7 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __51__HDCloudSyncCloudState_cloudStateByRemovingZones___block_invoke_2;
  v20[3] = &unk_1E6D0E408;
  v8 = v4;
  v21 = v8;
  -[NSDictionary hk_filter:](zonesByIdentifier, "hk_filter:", v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  targets = self->_targets;
  v15 = v7;
  v16 = 3221225472;
  v17 = __51__HDCloudSyncCloudState_cloudStateByRemovingZones___block_invoke_3;
  v18 = &unk_1E6CE9960;
  v19 = v8;
  v11 = v8;
  -[NSArray hk_filter:](targets, "hk_filter:", &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HDCloudSyncCloudState initWithZonesByIdentifier:targets:](v5, "initWithZonesByIdentifier:targets:", v9, v12, v15, v16, v17, v18);

  return v13;
}

uint64_t __51__HDCloudSyncCloudState_cloudStateByRemovingZones___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "zoneIdentifier");
}

uint64_t __51__HDCloudSyncCloudState_cloudStateByRemovingZones___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

uint64_t __51__HDCloudSyncCloudState_cloudStateByRemovingZones___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "zoneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

- (HDCloudSyncCloudState)cloudStateWithTargets:(id)a3
{
  id v4;
  HDCloudSyncCloudState *v5;

  v4 = a3;
  v5 = -[HDCloudSyncCloudState initWithZonesByIdentifier:targets:]([HDCloudSyncCloudState alloc], "initWithZonesByIdentifier:targets:", self->_zonesByIdentifier, v4);

  return v5;
}

- (id)cloudStateByReplacingTargets:(id)a3
{
  id v4;
  NSArray *targets;
  id v6;
  void *v7;
  void *v8;
  HDCloudSyncCloudState *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  targets = self->_targets;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__HDCloudSyncCloudState_cloudStateByReplacingTargets___block_invoke;
  v11[3] = &unk_1E6CE9960;
  v12 = v4;
  v6 = v4;
  -[NSArray hk_filter:](targets, "hk_filter:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HDCloudSyncCloudState initWithZonesByIdentifier:targets:]([HDCloudSyncCloudState alloc], "initWithZonesByIdentifier:targets:", self->_zonesByIdentifier, v8);
  return v9;
}

uint64_t __54__HDCloudSyncCloudState_cloudStateByReplacingTargets___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HDCloudSyncCloudState initWithZonesByIdentifier:targets:](+[HDCloudSyncCloudState allocWithZone:](HDCloudSyncCloudState, "allocWithZone:", a3), "initWithZonesByIdentifier:targets:", self->_zonesByIdentifier, self->_targets);
}

- (id)description
{
  void *v3;
  NSUInteger v4;
  NSUInteger v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[NSDictionary count](self->_zonesByIdentifier, "count");
  v5 = -[NSArray count](self->_targets, "count");
  -[HDCloudSyncCloudState pushTargets](self, "pushTargets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  -[HDCloudSyncCloudState pullTargets](self, "pullTargets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%ld zones, %ld targets (%ld push, %ld pull)>"), v4, v5, v7, objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)detailedDescription
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  void *v31;
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
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@\nMinimum supported protocol: %ld\n\n"), self, -[HDCloudSyncCloudState minimumSupportedProtocolVersion](self, "minimumSupportedProtocolVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary allValues](self->_zonesByIdentifier, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_filter:", &__block_literal_global_200_2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = v5;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("Master Records (%ld):\n"), objc_msgSend(v5, "count"));
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v41 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "masterRecord");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "description");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "hk_stringIndentedBy:", 4);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("%@\n\n"), v13);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v8);
    }

  }
  -[HDCloudSyncCloudState pushTargets](self, "pushTargets");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Push Targets (%lu):\n"), objc_msgSend(v14, "count"));
  if (objc_msgSend(v14, "count"))
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v37 != v18)
            objc_enumerationMutation(v15);
          -[HDCloudSyncCloudState _storeDescriptionForTarget:]((uint64_t)self, *(void **)(*((_QWORD *)&v36 + 1) + 8 * j));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "hk_stringIndentedBy:", 4);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendString:", v21);

          objc_msgSend(v3, "appendString:", CFSTR("\n"));
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      }
      while (v17);
    }

  }
  -[HDCloudSyncCloudState pullTargets](self, "pullTargets");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\nPull Targets (%lu):\n"), objc_msgSend(v22, "count"));
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v23 = v22;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v33;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v33 != v26)
          objc_enumerationMutation(v23);
        -[HDCloudSyncCloudState _storeDescriptionForTarget:]((uint64_t)self, *(void **)(*((_QWORD *)&v32 + 1) + 8 * k));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "hk_stringIndentedBy:", 4);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v29);

        objc_msgSend(v3, "appendString:", CFSTR("\n"));
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    }
    while (v25);
  }

  return v3;
}

BOOL __44__HDCloudSyncCloudState_detailedDescription__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "zoneType") == 0;
}

- (id)_storeDescriptionForTarget:(uint64_t)a1
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  if (a1)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    v3 = a2;
    objc_msgSend(v3, "storeRecord");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "storeIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HDCloudSyncTargetPurposeToString(objc_msgSend(v3, "purpose"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HDCloudSyncTargetOptionsToString(objc_msgSend(v3, "options"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "container");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "containerIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "storeRecord");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hk_stringIndentedBy:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("Store %@ (%@, Options: %@) in %@:\n%@\n"), v5, v6, v7, v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDictionary *zonesByIdentifier;
  NSDictionary *v6;
  NSArray *targets;
  NSArray *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  zonesByIdentifier = self->_zonesByIdentifier;
  v6 = (NSDictionary *)v4[2];
  if (zonesByIdentifier != v6 && (!v6 || !-[NSDictionary isEqual:](zonesByIdentifier, "isEqual:")))
    goto LABEL_8;
  targets = self->_targets;
  v8 = (NSArray *)v4[3];
  if (targets == v8)
  {
    v9 = 1;
    goto LABEL_9;
  }
  if (v8)
    v9 = -[NSArray isEqual:](targets, "isEqual:");
  else
LABEL_8:
    v9 = 0;
LABEL_9:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSDictionary hash](self->_zonesByIdentifier, "hash");
  return -[NSArray hash](self->_targets, "hash") ^ v3;
}

- (NSSet)seizedZones
{
  void *v2;
  void *v3;

  -[NSDictionary allValues](self->_zonesByIdentifier, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_mapToSet:", &__block_literal_global_214_4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

id __36__HDCloudSyncCloudState_seizedZones__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (objc_msgSend(v2, "purpose") == 3)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (NSSet)pullZones
{
  void *v2;
  void *v3;

  -[NSDictionary allValues](self->_zonesByIdentifier, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_mapToSet:", &__block_literal_global_215_2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

id __34__HDCloudSyncCloudState_pullZones__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (objc_msgSend(v2, "purpose") == 2)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)masterZoneForContainerID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[NSDictionary allValues](self->_zonesByIdentifier, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__HDCloudSyncCloudState_masterZoneForContainerID___block_invoke;
  v9[3] = &unk_1E6D0E4D0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "hk_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __50__HDCloudSyncCloudState_masterZoneForContainerID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (objc_msgSend(v3, "zoneType"))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "zoneIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "containerIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  return v4;
}

- (id)unifiedSyncZoneForContainerID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[NSDictionary allValues](self->_zonesByIdentifier, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__HDCloudSyncCloudState_unifiedSyncZoneForContainerID___block_invoke;
  v9[3] = &unk_1E6D0E4D0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "hk_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __55__HDCloudSyncCloudState_unifiedSyncZoneForContainerID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(v3, "zoneType") == 2)
  {
    objc_msgSend(v3, "zoneIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "containerIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)zoneForRecordID:(id)a3 containerIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[NSDictionary allValues](self->_zonesByIdentifier, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__HDCloudSyncCloudState_zoneForRecordID_containerIdentifier___block_invoke;
  v13[3] = &unk_1E6D0E4F8;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "hk_firstObjectPassingTest:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __61__HDCloudSyncCloudState_zoneForRecordID_containerIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(v3, "zoneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    objc_msgSend(v3, "zoneIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "containerIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)zonesForContainerID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[NSDictionary allValues](self->_zonesByIdentifier, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__HDCloudSyncCloudState_zonesForContainerID___block_invoke;
  v9[3] = &unk_1E6D0E4D0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "hk_filter:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __45__HDCloudSyncCloudState_zonesForContainerID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "zoneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (NSDictionary)zonesByIdentifier
{
  return self->_zonesByIdentifier;
}

- (NSArray)targets
{
  return self->_targets;
}

- (HDCloudSyncZone)primaryPushZone
{
  return self->_primaryPushZone;
}

- (int)minimumSupportedProtocolVersion
{
  return self->_minimumSupportedProtocolVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryPushZone, 0);
  objc_storeStrong((id *)&self->_targets, 0);
  objc_storeStrong((id *)&self->_zonesByIdentifier, 0);
}

@end
