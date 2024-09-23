@implementation HMDHomeObjectLookup

- (HMDHomeObjectLookup)initWithHome:(id)a3
{
  id v4;
  void *v5;
  HMDHomeObjectLookup *v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "workQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)HMDHomeObjectLookup;
  v6 = -[HMDObjectLookup initWithWorkQueue:](&v8, sel_initWithWorkQueue_, v5);

  if (v6)
    objc_storeWeak((id *)&v6->_home, v4);

  return v6;
}

- (void)scanObjects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDHomeObjectLookup;
  -[HMDObjectLookup scanObjects](&v8, sel_scanObjects);
  -[HMDHomeObjectLookup home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDObjectLookup uuidToObjectMapping](self, "uuidToObjectMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v3, v5);

  -[HMDObjectLookup uuidToObjectMapping](self, "uuidToObjectMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeConfigurationUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v3, v7);

  -[HMDHomeObjectLookup _scanAccessoriesAndServices](self, "_scanAccessoriesAndServices");
  -[HMDHomeObjectLookup _scanRooms](self, "_scanRooms");
  -[HMDHomeObjectLookup _scanZones](self, "_scanZones");
  -[HMDHomeObjectLookup _scanActionSets](self, "_scanActionSets");
  -[HMDHomeObjectLookup _scanServiceGroups](self, "_scanServiceGroups");
  -[HMDHomeObjectLookup _scanTriggers](self, "_scanTriggers");
  -[HMDHomeObjectLookup _scanResidentDevices](self, "_scanResidentDevices");
  -[HMDHomeObjectLookup _scanMediaSystems](self, "_scanMediaSystems");
  -[HMDHomeObjectLookup _scanUsers](self, "_scanUsers");

}

- (void)_scanAccessoriesAndServices
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  void *v35;
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
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[HMDHomeObjectLookup home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v34 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v34)
  {
    v33 = *(_QWORD *)v41;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v41 != v33)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v5);
        -[HMDObjectLookup uuidToObjectMapping](self, "uuidToObjectMapping");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "uuid");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v6, v8);

        v9 = v6;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
        v11 = v10;

        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v35 = v11;
        objc_msgSend(v11, "services");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v37;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v37 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v16);
              -[HMDObjectLookup uuidToObjectMapping](self, "uuidToObjectMapping");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "uuid");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setObject:forKey:", v17, v19);

              ++v16;
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          }
          while (v14);
        }

        v20 = v9;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v21 = v20;
        else
          v21 = 0;
        v22 = v21;

        if (v22)
        {
          objc_msgSend(v22, "audioDestinationManager");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            -[HMDObjectLookup uuidToObjectMapping](self, "uuidToObjectMapping");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "backingStoreHandler");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "identifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKey:", v25, v26);

          }
          objc_msgSend(v22, "audioDestinationController");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            -[HMDObjectLookup uuidToObjectMapping](self, "uuidToObjectMapping");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "backingStoreHandler");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "identifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setObject:forKey:", v29, v30);

          }
          objc_msgSend(v22, "settingsController");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDHomeObjectLookup _scanSettings:](self, "_scanSettings:", v31);

        }
        ++v5;
      }
      while (v5 != v34);
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v34);
  }

}

- (void)_scanSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "childrenIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transactionReceiver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11);
        -[HMDObjectLookup uuidToObjectMapping](self, "uuidToObjectMapping", (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v6, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (void)_scanRooms
{
  void *v3;
  void *v4;
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
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[HMDHomeObjectLookup home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "rooms", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        -[HMDObjectLookup uuidToObjectMapping](self, "uuidToObjectMapping");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v9, v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  -[HMDObjectLookup uuidToObjectMapping](self, "uuidToObjectMapping");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "roomForEntireHome");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "roomForEntireHome");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v13, v15);

}

- (void)_scanZones
{
  void *v3;
  void *v4;
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
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDHomeObjectLookup home](self, "home", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zones");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

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
        -[HMDObjectLookup uuidToObjectMapping](self, "uuidToObjectMapping");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v9, v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)_scanActionSets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
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
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[HMDHomeObjectLookup home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionSets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v21 = v3;
  objc_msgSend(v3, "triggerOwnedActionSets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v7)
  {
    v8 = v7;
    v23 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v9);
        -[HMDObjectLookup uuidToObjectMapping](self, "uuidToObjectMapping");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v10, v12);

        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v10, "actions");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v25;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v25 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v17);
              -[HMDObjectLookup uuidToObjectMapping](self, "uuidToObjectMapping");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "uuid");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setObject:forKey:", v18, v20);

              ++v17;
            }
            while (v15 != v17);
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v15);
        }

        ++v9;
      }
      while (v9 != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v8);
  }

}

- (void)_scanServiceGroups
{
  void *v3;
  void *v4;
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
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDHomeObjectLookup home](self, "home", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

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
        -[HMDObjectLookup uuidToObjectMapping](self, "uuidToObjectMapping");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v9, v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)_scanTriggers
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[HMDHomeObjectLookup home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "triggers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v22 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v28;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v5);
        -[HMDObjectLookup uuidToObjectMapping](self, "uuidToObjectMapping");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "uuid");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v6, v8);

        v9 = v6;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
        v11 = v10;

        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v11, "events");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v24;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v24 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v16);
              -[HMDObjectLookup uuidToObjectMapping](self, "uuidToObjectMapping");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "uuid");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setObject:forKey:", v17, v19);

              ++v16;
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v14);
        }

        ++v5;
      }
      while (v5 != v22);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v22);
  }

}

- (void)_scanResidentDevices
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDHomeObjectLookup home](self, "home", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "residentDeviceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "residentDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        -[HMDObjectLookup uuidToObjectMapping](self, "uuidToObjectMapping");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v10, v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)_scanMediaSystems
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDHomeObjectLookup home](self, "home", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaSystems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        -[HMDObjectLookup uuidToObjectMapping](self, "uuidToObjectMapping");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v9, v11);

        objc_msgSend(v9, "settingsController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeObjectLookup _scanSettings:](self, "_scanSettings:", v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)_scanUsers
{
  void *v3;
  void *v4;
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
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HMDHomeObjectLookup home](self, "home", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "users");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

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
        -[HMDObjectLookup uuidToObjectMapping](self, "uuidToObjectMapping");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v9, v11);

        objc_msgSend(v9, "assistantAccessControlModelUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          -[HMDObjectLookup uuidToObjectMapping](self, "uuidToObjectMapping");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "assistantAccessControlModelUUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKey:", v9, v14);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDHomeObjectLookup home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_home);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_92523 != -1)
    dispatch_once(&logCategory__hmf_once_t3_92523, &__block_literal_global_92524);
  return (id)logCategory__hmf_once_v4_92525;
}

void __34__HMDHomeObjectLookup_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_92525;
  logCategory__hmf_once_v4_92525 = v0;

}

@end
