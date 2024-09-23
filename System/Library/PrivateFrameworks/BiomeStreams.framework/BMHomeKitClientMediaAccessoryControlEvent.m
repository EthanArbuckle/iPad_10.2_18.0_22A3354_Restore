@implementation BMHomeKitClientMediaAccessoryControlEvent

- (BMHomeKitClientMediaAccessoryControlEvent)initWithBase:(id)a3 accessoryUniqueIdentifier:(id)a4 accessoryStateString:(id)a5 accessoryStateNumber:(id)a6 accessoryStateData:(id)a7 accessoryMediaRouteIdentifier:(id)a8 zoneUniqueIdentifiers:(id)a9 roomUniqueIdentifier:(id)a10 accessoryName:(id)a11 roomName:(id)a12 zoneNames:(id)a13 homeName:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  BMHomeKitClientMediaAccessoryControlEvent *v23;
  BMHomeKitClientMediaAccessoryControlEvent *v24;
  id v27;
  id v28;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  objc_super v38;

  v37 = a3;
  v27 = a4;
  v36 = a4;
  v35 = a5;
  v28 = a6;
  v34 = a6;
  v33 = a7;
  v32 = a8;
  v31 = a9;
  v30 = a10;
  v19 = a11;
  v20 = a12;
  v21 = a13;
  v22 = a14;
  v38.receiver = self;
  v38.super_class = (Class)BMHomeKitClientMediaAccessoryControlEvent;
  v23 = -[BMEventBase init](&v38, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_base, a3);
    objc_storeStrong((id *)&v24->_accessoryUniqueIdentifier, v27);
    objc_storeStrong((id *)&v24->_accessoryStateString, a5);
    objc_storeStrong((id *)&v24->_accessoryStateNumber, v28);
    objc_storeStrong((id *)&v24->_accessoryStateData, a7);
    objc_storeStrong((id *)&v24->_accessoryMediaRouteIdentifier, a8);
    objc_storeStrong((id *)&v24->_zoneUniqueIdentifiers, a9);
    objc_storeStrong((id *)&v24->_roomUniqueIdentifier, a10);
    objc_storeStrong((id *)&v24->_accessoryName, a11);
    objc_storeStrong((id *)&v24->_roomName, a12);
    objc_storeStrong((id *)&v24->_zoneNames, a13);
    objc_storeStrong((id *)&v24->_homeName, a14);
  }

  return v24;
}

- (NSString)description
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("BMHomeKitClientMediaAccessoryControlEvent event with base: %@, accessoryUniqueIdentifier: %@, accessoryStateString: %@, accessoryStateNumber: %@, accessoryStateData: %@, accessoryMediaRouteIdentifier: %@, zoneUniqueIdentifiers: %@, roomUniqueIdentifier: %@, accessoryName: %@, roomName: %@, zoneNames: %@, homeName: %@"), self->_base, self->_accessoryUniqueIdentifier, self->_accessoryStateString, self->_accessoryStateNumber, self->_accessoryStateData, self->_accessoryMediaRouteIdentifier, self->_zoneUniqueIdentifiers, self->_roomUniqueIdentifier, self->_accessoryName, self->_roomName, self->_zoneNames, self->_homeName);
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  objc_class *v7;
  void *v8;
  NSObject *v9;

  v6 = a3;
  if (!a4)
  {
    v7 = (objc_class *)a1;
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    v7 = (objc_class *)BMHomeKitClientMediaAccessoryControlEvent_v1;
LABEL_5:
    v8 = (void *)objc_msgSend([v7 alloc], "initWithProtoData:", v6);
    goto LABEL_9;
  }
  __biome_log_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    +[BMHomeKitClientMediaAccessoryControlEvent eventWithData:dataVersion:].cold.1(v9);

  v8 = 0;
LABEL_9:

  return v8;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMHomeKitClientMediaAccessoryControlEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMHomeKitClientMediaAccessoryControlEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BMHomeKitClientBase *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BMHomeKitClientMediaAccessoryControlEvent *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  BMHomeKitClientMediaAccessoryControlEvent *v34;
  id v35;
  void *v36;
  BMHomeKitClientBase *v37;
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
      v34 = self;
      v35 = v4;
      v5 = v4;
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v33 = v5;
      -[NSObject accessoryStates](v5, "accessoryStates");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (!v10)
        goto LABEL_17;
      v11 = v10;
      v12 = *(_QWORD *)v39;
      while (1)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v39 != v12)
            objc_enumerationMutation(v9);
          v14 = *(id *)(*((_QWORD *)&v38 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "valueType");
          if (v15)
          {
            if (v15 == 2)
            {
              v19 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v14, "numValue");
              objc_msgSend(v19, "numberWithDouble:");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "mediaPropertyType");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = v7;
            }
            else
            {
              if (v15 != 1)
                goto LABEL_15;
              objc_msgSend(v14, "stringValue");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "mediaPropertyType");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = v6;
            }
          }
          else
          {
            objc_msgSend(v14, "dataValue");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "mediaPropertyType");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v8;
          }
          objc_msgSend(v18, "setObject:forKey:", v16, v17);

LABEL_15:
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (!v11)
        {
LABEL_17:

          v20 = [BMHomeKitClientBase alloc];
          v21 = v33;
          -[NSObject base](v33, "base");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = -[BMHomeKitClientBase initWithProto:](v20, "initWithProto:", v32);
          -[NSObject accessoryUniqueIdentifier](v33, "accessoryUniqueIdentifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject accessoryMediaRouteIdentifier](v33, "accessoryMediaRouteIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject zoneUniqueIdentifiers](v33, "zoneUniqueIdentifiers");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject roomUniqueIdentifier](v33, "roomUniqueIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject accessoryName](v33, "accessoryName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject roomName](v33, "roomName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject zoneNames](v33, "zoneNames");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject homeName](v33, "homeName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v6;
          self = -[BMHomeKitClientMediaAccessoryControlEvent initWithBase:accessoryUniqueIdentifier:accessoryStateString:accessoryStateNumber:accessoryStateData:accessoryMediaRouteIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:roomName:zoneNames:homeName:](v34, "initWithBase:accessoryUniqueIdentifier:accessoryStateString:accessoryStateNumber:accessoryStateData:accessoryMediaRouteIdentifier:zoneUniqueIdentifiers:roomUniqueIdentifier:accessoryName:roomName:zoneNames:homeName:", v37, v36, v6, v7, v8, v31, v30, v29, v22, v23, v24, v25);

          v27 = self;
          v4 = v35;
          goto LABEL_22;
        }
      }
    }
    __biome_log_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[BMHomeKitClientMediaAccessoryControlEvent initWithProto:].cold.1();
    v27 = 0;
LABEL_22:

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (BMHomeKitClientMediaAccessoryControlEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBHomeKitClientMediaAccessoryControlEvent *v5;
  BMHomeKitClientMediaAccessoryControlEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBHomeKitClientMediaAccessoryControlEvent initWithData:]([BMPBHomeKitClientMediaAccessoryControlEvent alloc], "initWithData:", v4);

    self = -[BMHomeKitClientMediaAccessoryControlEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
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
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[BMHomeKitClientMediaAccessoryControlEvent base](self, "base");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proto");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBase:", v5);

  -[BMHomeKitClientMediaAccessoryControlEvent accessoryUniqueIdentifier](self, "accessoryUniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v3;
  objc_msgSend(v3, "setAccessoryUniqueIdentifier:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  -[BMHomeKitClientMediaAccessoryControlEvent accessoryStateString](self, "accessoryStateString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v57;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v57 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v12);
        v14 = (void *)objc_opt_new();
        objc_msgSend(v14, "setMediaPropertyType:", v13);
        -[BMHomeKitClientMediaAccessoryControlEvent accessoryStateString](self, "accessoryStateString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setStringValue:", v16);

        objc_msgSend(v14, "setValueType:", 1);
        objc_msgSend(v7, "addObject:", v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    }
    while (v10);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[BMHomeKitClientMediaAccessoryControlEvent accessoryStateNumber](self, "accessoryStateNumber");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v53;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v53 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v21);
        v23 = (void *)objc_opt_new();
        objc_msgSend(v23, "setMediaPropertyType:", v22);
        -[BMHomeKitClientMediaAccessoryControlEvent accessoryStateNumber](self, "accessoryStateNumber");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKey:", v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "doubleValue");
        objc_msgSend(v23, "setNumValue:");
        objc_msgSend(v23, "setValueType:", 2);
        objc_msgSend(v7, "addObject:", v23);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
    }
    while (v19);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[BMHomeKitClientMediaAccessoryControlEvent accessoryStateData](self, "accessoryStateData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v49;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v49 != v29)
          objc_enumerationMutation(v26);
        v31 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v30);
        v32 = (void *)objc_opt_new();
        objc_msgSend(v32, "setMediaPropertyType:", v31);
        -[BMHomeKitClientMediaAccessoryControlEvent accessoryStateData](self, "accessoryStateData");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKey:", v31);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setDataValue:", v34);

        objc_msgSend(v32, "setValueType:", 0);
        objc_msgSend(v7, "addObject:", v32);

        ++v30;
      }
      while (v28 != v30);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
    }
    while (v28);
  }

  objc_msgSend(v47, "setAccessoryStates:", v7);
  -[BMHomeKitClientMediaAccessoryControlEvent accessoryMediaRouteIdentifier](self, "accessoryMediaRouteIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setAccessoryMediaRouteIdentifier:", v35);

  v36 = (void *)MEMORY[0x1E0C99DE8];
  -[BMHomeKitClientMediaAccessoryControlEvent zoneUniqueIdentifiers](self, "zoneUniqueIdentifiers");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "arrayWithArray:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setZoneUniqueIdentifiers:", v38);

  -[BMHomeKitClientMediaAccessoryControlEvent roomUniqueIdentifier](self, "roomUniqueIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setRoomUniqueIdentifier:", v39);

  -[BMHomeKitClientMediaAccessoryControlEvent accessoryName](self, "accessoryName");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setAccessoryName:", v40);

  -[BMHomeKitClientMediaAccessoryControlEvent roomName](self, "roomName");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setRoomName:", v41);

  v42 = (void *)MEMORY[0x1E0C99DE8];
  -[BMHomeKitClientMediaAccessoryControlEvent zoneNames](self, "zoneNames");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "arrayWithArray:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setZoneNames:", v44);

  -[BMHomeKitClientMediaAccessoryControlEvent homeName](self, "homeName");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setHomeName:", v45);

  return v47;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  uint64_t v34;
  char v35;
  char v36;
  char v37;
  char v38;
  char v39;
  char v40;

  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    -[BMHomeKitClientMediaAccessoryControlEvent base](self, "base");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 || (objc_msgSend(v10, "base"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[BMHomeKitClientMediaAccessoryControlEvent base](self, "base");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "base");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v4, "isEqual:", v5);

      if (v11)
      {
LABEL_9:

        -[BMHomeKitClientMediaAccessoryControlEvent accessoryUniqueIdentifier](self, "accessoryUniqueIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13
          || (objc_msgSend(v10, "accessoryUniqueIdentifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[BMHomeKitClientMediaAccessoryControlEvent accessoryUniqueIdentifier](self, "accessoryUniqueIdentifier");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "accessoryUniqueIdentifier");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v4, "isEqual:", v5);

          if (v13)
          {
LABEL_15:

            -[BMHomeKitClientMediaAccessoryControlEvent accessoryStateString](self, "accessoryStateString");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14
              || (objc_msgSend(v10, "accessoryStateString"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              -[BMHomeKitClientMediaAccessoryControlEvent accessoryStateString](self, "accessoryStateString");
              v4 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "accessoryStateString");
              v5 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_msgSend(v4, "isEqual:", v5);

              if (v14)
              {
LABEL_21:

                -[BMHomeKitClientMediaAccessoryControlEvent accessoryStateNumber](self, "accessoryStateNumber");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                if (v15
                  || (objc_msgSend(v10, "accessoryStateNumber"),
                      (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                {
                  -[BMHomeKitClientMediaAccessoryControlEvent accessoryStateNumber](self, "accessoryStateNumber");
                  v4 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "accessoryStateNumber");
                  v5 = (void *)objc_claimAutoreleasedReturnValue();
                  v37 = objc_msgSend(v4, "isEqual:", v5);

                  if (v15)
                  {
LABEL_27:

                    -[BMHomeKitClientMediaAccessoryControlEvent accessoryStateData](self, "accessoryStateData");
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v16
                      || (objc_msgSend(v10, "accessoryStateData"),
                          (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                    {
                      -[BMHomeKitClientMediaAccessoryControlEvent accessoryStateData](self, "accessoryStateData");
                      v4 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v10, "accessoryStateData");
                      v5 = (void *)objc_claimAutoreleasedReturnValue();
                      v36 = objc_msgSend(v4, "isEqual:", v5);

                      if (v16)
                      {
LABEL_33:

                        -[BMHomeKitClientMediaAccessoryControlEvent accessoryMediaRouteIdentifier](self, "accessoryMediaRouteIdentifier");
                        v17 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v17
                          || (objc_msgSend(v10, "accessoryMediaRouteIdentifier"),
                              (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                        {
                          -[BMHomeKitClientMediaAccessoryControlEvent accessoryMediaRouteIdentifier](self, "accessoryMediaRouteIdentifier");
                          v4 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v10, "accessoryMediaRouteIdentifier");
                          v5 = (void *)objc_claimAutoreleasedReturnValue();
                          v35 = objc_msgSend(v4, "isEqual:", v5);

                          if (v17)
                          {
LABEL_39:

                            -[BMHomeKitClientMediaAccessoryControlEvent zoneUniqueIdentifiers](self, "zoneUniqueIdentifiers");
                            v18 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v18
                              || (objc_msgSend(v10, "zoneUniqueIdentifiers"),
                                  (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                            {
                              -[BMHomeKitClientMediaAccessoryControlEvent zoneUniqueIdentifiers](self, "zoneUniqueIdentifiers");
                              v4 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v10, "zoneUniqueIdentifiers");
                              v5 = (void *)objc_claimAutoreleasedReturnValue();
                              HIDWORD(v34) = objc_msgSend(v4, "isEqual:", v5);

                              if (v18)
                              {
LABEL_45:

                                -[BMHomeKitClientMediaAccessoryControlEvent roomUniqueIdentifier](self, "roomUniqueIdentifier");
                                v19 = (void *)objc_claimAutoreleasedReturnValue();
                                if (v19
                                  || (objc_msgSend(v10, "roomUniqueIdentifier"),
                                      (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                                {
                                  -[BMHomeKitClientMediaAccessoryControlEvent roomUniqueIdentifier](self, "roomUniqueIdentifier");
                                  v5 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v10, "roomUniqueIdentifier");
                                  v6 = (void *)objc_claimAutoreleasedReturnValue();
                                  LODWORD(v34) = objc_msgSend(v5, "isEqual:", v6);

                                  if (v19)
                                  {
LABEL_51:

                                    -[BMHomeKitClientMediaAccessoryControlEvent accessoryName](self, "accessoryName");
                                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                                    if (v20
                                      || (objc_msgSend(v10, "accessoryName"),
                                          (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                                    {
                                      -[BMHomeKitClientMediaAccessoryControlEvent accessoryName](self, "accessoryName", v34);
                                      v6 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v10, "accessoryName");
                                      v7 = (void *)objc_claimAutoreleasedReturnValue();
                                      v21 = objc_msgSend(v6, "isEqual:", v7);

                                      if (v20)
                                      {
LABEL_57:

                                        -[BMHomeKitClientMediaAccessoryControlEvent roomName](self, "roomName");
                                        v22 = (void *)objc_claimAutoreleasedReturnValue();
                                        if (v22
                                          || (objc_msgSend(v10, "roomName"),
                                              (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                                        {
                                          -[BMHomeKitClientMediaAccessoryControlEvent roomName](self, "roomName", v34);
                                          v7 = (void *)objc_claimAutoreleasedReturnValue();
                                          objc_msgSend(v10, "roomName");
                                          v23 = (void *)objc_claimAutoreleasedReturnValue();
                                          v24 = objc_msgSend(v7, "isEqual:", v23);

                                          if (v22)
                                          {
LABEL_63:

                                            -[BMHomeKitClientMediaAccessoryControlEvent zoneNames](self, "zoneNames");
                                            v25 = (void *)objc_claimAutoreleasedReturnValue();
                                            if (v25
                                              || (objc_msgSend(v10, "zoneNames"),
                                                  (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                                            {
                                              -[BMHomeKitClientMediaAccessoryControlEvent zoneNames](self, "zoneNames", v34);
                                              v26 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_msgSend(v10, "zoneNames");
                                              v27 = (void *)objc_claimAutoreleasedReturnValue();
                                              v28 = objc_msgSend(v26, "isEqual:", v27);

                                              if (v25)
                                              {
LABEL_69:

                                                -[BMHomeKitClientMediaAccessoryControlEvent homeName](self, "homeName");
                                                v29 = (void *)objc_claimAutoreleasedReturnValue();
                                                if (v29
                                                  || (objc_msgSend(v10, "homeName"),
                                                      (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                                                {
                                                  -[BMHomeKitClientMediaAccessoryControlEvent homeName](self, "homeName", v34);
                                                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                                                  objc_msgSend(v10, "homeName");
                                                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                                                  v32 = objc_msgSend(v30, "isEqual:", v31);

                                                  if (v29)
                                                  {
LABEL_75:

                                                    v12 = v40 & v39 & v38 & v37 & v36 & v35 & BYTE4(v34) & v34 & v21 & v24 & v28 & v32;
                                                    goto LABEL_76;
                                                  }
                                                }
                                                else
                                                {
                                                  v32 = 1;
                                                }

                                                goto LABEL_75;
                                              }
                                            }
                                            else
                                            {
                                              v28 = 1;
                                            }

                                            goto LABEL_69;
                                          }
                                        }
                                        else
                                        {
                                          v24 = 1;
                                        }

                                        goto LABEL_63;
                                      }
                                    }
                                    else
                                    {
                                      v21 = 1;
                                    }

                                    goto LABEL_57;
                                  }
                                }
                                else
                                {
                                  LODWORD(v34) = 1;
                                }

                                goto LABEL_51;
                              }
                            }
                            else
                            {
                              HIDWORD(v34) = 1;
                            }

                            goto LABEL_45;
                          }
                        }
                        else
                        {
                          v35 = 1;
                        }

                        goto LABEL_39;
                      }
                    }
                    else
                    {
                      v36 = 1;
                    }

                    goto LABEL_33;
                  }
                }
                else
                {
                  v37 = 1;
                }

                goto LABEL_27;
              }
            }
            else
            {
              v38 = 1;
            }

            goto LABEL_21;
          }
        }
        else
        {
          v39 = 1;
        }

        goto LABEL_15;
      }
    }
    else
    {
      v40 = 1;
    }

    goto LABEL_9;
  }
  v12 = 0;
LABEL_76:

  return v12;
}

- (BMHomeKitClientBase)base
{
  return self->_base;
}

- (NSString)accessoryUniqueIdentifier
{
  return self->_accessoryUniqueIdentifier;
}

- (NSDictionary)accessoryStateString
{
  return self->_accessoryStateString;
}

- (NSDictionary)accessoryStateNumber
{
  return self->_accessoryStateNumber;
}

- (NSDictionary)accessoryStateData
{
  return self->_accessoryStateData;
}

- (NSString)accessoryMediaRouteIdentifier
{
  return self->_accessoryMediaRouteIdentifier;
}

- (NSArray)zoneUniqueIdentifiers
{
  return self->_zoneUniqueIdentifiers;
}

- (NSString)roomUniqueIdentifier
{
  return self->_roomUniqueIdentifier;
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (NSString)roomName
{
  return self->_roomName;
}

- (NSArray)zoneNames
{
  return self->_zoneNames;
}

- (NSString)homeName
{
  return self->_homeName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_zoneNames, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_roomUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_zoneUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_accessoryMediaRouteIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryStateData, 0);
  objc_storeStrong((id *)&self->_accessoryStateNumber, 0);
  objc_storeStrong((id *)&self->_accessoryStateString, 0);
  objc_storeStrong((id *)&self->_accessoryUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

+ (void)eventWithData:(os_log_t)log dataVersion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18D810000, log, OS_LOG_TYPE_ERROR, "Mismatched BMHomeKitClientMediaAccessoryControlEvent data versions, cannot deserialize", v1, 2u);
}

- (void)initWithProto:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2(&dword_18D810000, v2, v3, "%@: tried to initialize with a non-BMPBHomeKitClientMediaAccessoryControlEvent proto", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0_0();
}

@end
