@implementation BMHomeKitClientMediaAccessoryControlEvent_v1

- (BMHomeKitClientMediaAccessoryControlEvent_v1)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BMHomeKitClientBase *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BMHomeKitClientMediaAccessoryControlEvent_v1 *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v35;
  BMHomeKitClientBase *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = v4;
      v5 = v4;
      v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v34 = v5;
      -[NSObject accessoryStates](v5, "accessoryStates");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (!v9)
        goto LABEL_17;
      v10 = v9;
      v11 = *(_QWORD *)v39;
      while (1)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v39 != v11)
            objc_enumerationMutation(v8);
          v13 = *(id *)(*((_QWORD *)&v38 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "valueType");
          if (v14 == 3)
            goto LABEL_13;
          if (v14 == 2)
          {
            objc_msgSend(v13, "stringValue");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "mediaPropertyType");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setObject:forKey:", v18, v19);

LABEL_13:
            v20 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v13, "numValue");
            objc_msgSend(v20, "numberWithDouble:");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "mediaPropertyType");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v6;
            goto LABEL_14;
          }
          if (v14 != 1)
            goto LABEL_15;
          objc_msgSend(v13, "dataValue");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "mediaPropertyType");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v7;
LABEL_14:
          objc_msgSend(v17, "setObject:forKey:", v15, v16);

LABEL_15:
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (!v10)
        {
LABEL_17:

          v21 = [BMHomeKitClientBase alloc];
          v22 = v34;
          -[NSObject base](v34, "base");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = -[BMHomeKitClientBase initWithProto:](v21, "initWithProto:", v33);
          -[NSObject accessoryUniqueIdentifier](v34, "accessoryUniqueIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject accessoryMediaRouteIdentifier](v34, "accessoryMediaRouteIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject zoneUniqueIdentifiers](v34, "zoneUniqueIdentifiers");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject roomUniqueIdentifier](v34, "roomUniqueIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject accessoryName](v34, "accessoryName");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject roomName](v34, "roomName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject zoneNames](v34, "zoneNames");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject homeName](v34, "homeName");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          self = -[BMHomeKitClientMediaAccessoryControlEvent initWithBase:accessoryUniqueIdentifier:accessoryStateString:accessoryStateNumber:accessoryStateData:accessoryMediaRouteIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:roomName:zoneNames:homeName:](self, "initWithBase:accessoryUniqueIdentifier:accessoryStateString:accessoryStateNumber:accessoryStateData:accessoryMediaRouteIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:roomName:zoneNames:homeName:", v36, v31, v37, v6, v7, v32, v23, v24, v30, v25, v26, v27);

          v28 = self;
          v4 = v35;
          goto LABEL_22;
        }
      }
    }
    __biome_log_for_category();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      -[BMHomeKitClientMediaAccessoryControlEvent initWithProto:].cold.1();
    v28 = 0;
LABEL_22:

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

@end
