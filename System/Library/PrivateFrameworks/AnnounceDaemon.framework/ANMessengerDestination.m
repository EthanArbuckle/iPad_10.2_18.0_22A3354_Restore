@implementation ANMessengerDestination

- (ANMessengerDestination)init
{
  ANMessengerDestination *v2;
  ANMessengerDestination *v3;
  NSArray *accessories;
  NSArray *v5;
  NSArray *users;
  NSArray *devices;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ANMessengerDestination;
  v2 = -[ANMessengerDestination init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    accessories = v2->_accessories;
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_accessories = (NSArray *)MEMORY[0x1E0C9AA60];

    users = v3->_users;
    v3->_users = v5;

    devices = v3->_devices;
    v3->_devices = v5;

  }
  return v3;
}

- (id)idsIdentifiersForService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E20];
  -[ANMessengerDestination users](self, "users");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  -[ANMessengerDestination accessories](self, "accessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithCapacity:", objc_msgSend(v8, "count") + v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[ANMessengerDestination users](self, "users");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v15, "userIDSURI");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v15, "userIDSURI");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "prefixedURI");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v18);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v12);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[ANMessengerDestination accessories](self, "accessories", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "device");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "IDSDestinationForIDSService:", v4);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "destinationURIs");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "anyObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
          objc_msgSend(v9, "addObject:", v27);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v21);
  }

  objc_msgSend(v9, "allObjects");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)participantsWithService:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  ANMessengerDestination *v34;
  id obj;
  id v36;
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
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v4 = (void *)MEMORY[0x1E0C99DE8];
  -[ANMessengerDestination users](self, "users");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  -[ANMessengerDestination accessories](self, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count") + v6;
  -[ANMessengerDestination devices](self, "devices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithCapacity:", v8 + objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v34 = self;
  -[ANMessengerDestination users](self, "users");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v46;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v46 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF7E60]), "initWithUser:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v15));
        objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v13);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[ANMessengerDestination accessories](v34, "accessories");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v42;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v42 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v20);
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF7E60]), "initWithAccessory:", v21);
        objc_msgSend(v21, "device");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "IDSDestinationForIDSService:", v36);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "destinationURIs");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "anyObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
          objc_msgSend(v22, "setIdsID:", v26);
        objc_msgSend(v10, "addObject:", v22);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v18);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[ANMessengerDestination devices](v34, "devices");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v38;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v38 != v30)
          objc_enumerationMutation(v27);
        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF7E60]), "initWithDevice:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v31));
        objc_msgSend(v10, "addObject:", v32);

        ++v31;
      }
      while (v29 != v31);
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    }
    while (v29);
  }

  return v10;
}

- (BOOL)addDeviceWithID:(id)a3 rapportConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLForDefault:", *MEMORY[0x1E0CF7C18]);

  if (v9)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v7, "devices", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activeDevicesSupportingAnnounce");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v16, "idsDeviceIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", v6);

          if ((v18 & 1) != 0)
          {
            -[ANMessengerDestination devices](self, "devices");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (void *)objc_msgSend(v20, "mutableCopy");

            objc_msgSend(v21, "addObject:", v16);
            -[ANMessengerDestination setDevices:](self, "setDevices:", v21);

            v19 = 1;
            goto LABEL_13;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v13)
          continue;
        break;
      }
    }
    v19 = 0;
LABEL_13:

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)addUser:(id)a3 inHome:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "hmu_isRemoteAccessAllowedForUser:", v6) & 1) != 0
    || objc_msgSend(v7, "announceAccessAllowedForUser:", v6))
  {
    -[ANMessengerDestination users](self, "users");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "addObject:", v6);
    -[ANMessengerDestination setUsers:](self, "setUsers:", v9);

    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)addUser:(id)a3 inHome:(id)a4 rapportConnection:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a5;
  v9 = a3;
  -[ANMessengerDestination addUser:inHome:](self, "addUser:inHome:", v9, a4);
  -[ANMessengerDestination devices](self, "devices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v8, "devices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "activePersonalDevicesSupportingAnnounce");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "personalDevicesForUser:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addObjectsFromArray:", v13);
  -[ANMessengerDestination setDevices:](self, "setDevices:", v14);

}

- (BOOL)addAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ANMessengerDestination accessories](self, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "addObject:", v4);
  -[ANMessengerDestination setAccessories:](self, "setAccessories:", v6);

  return 1;
}

- (void)removeUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[ANMessengerDestination users](self, "users");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __37__ANMessengerDestination_removeUser___block_invoke;
    v13[3] = &unk_1E93904A0;
    v7 = v4;
    v14 = v7;
    v8 = objc_msgSend(v6, "indexOfObjectPassingTest:", v13);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = v8;
      ANLogHandleMessengerDestination();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "userID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "uniqueIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v16 = &stru_1E93913D0;
        v17 = 2112;
        v18 = v11;
        v19 = 2112;
        v20 = v12;
        _os_log_impl(&dword_1D23A0000, v10, OS_LOG_TYPE_DEFAULT, "%@Removed User from Destination: %@, %@", buf, 0x20u);

      }
      objc_msgSend(v6, "removeObjectAtIndex:", v9);
      -[ANMessengerDestination setUsers:](self, "setUsers:", v6);
    }

  }
}

uint64_t __37__ANMessengerDestination_removeUser___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (void)removeDeviceWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[ANMessengerDestination devices](self, "devices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __45__ANMessengerDestination_removeDeviceWithID___block_invoke;
    v13[3] = &unk_1E93904A0;
    v7 = v4;
    v14 = v7;
    v8 = objc_msgSend(v6, "indexOfObjectPassingTest:", v13);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = v8;
      objc_msgSend(v6, "objectAtIndex:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ANLogHandleMessengerDestination();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v16 = &stru_1E93913D0;
        v17 = 2112;
        v18 = v12;
        v19 = 2112;
        v20 = v7;
        _os_log_impl(&dword_1D23A0000, v11, OS_LOG_TYPE_DEFAULT, "%@Removed Device ID from Destination: %@, %@", buf, 0x20u);

      }
      objc_msgSend(v6, "removeObjectAtIndex:", v9);
      -[ANMessengerDestination setDevices:](self, "setDevices:", v6);

    }
  }

}

uint64_t __45__ANMessengerDestination_removeDeviceWithID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "idsDeviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)removeUser:(id)a3 rapportConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ANMessengerDestination removeUser:](self, "removeUser:", v6);
  objc_msgSend(v7, "devices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activePersonalDevicesSupportingAnnounce");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "personalDevicesForUser:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15), "idsDeviceIdentifier", (_QWORD)v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[ANMessengerDestination removeDeviceWithID:](self, "removeDeviceWithID:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

+ (id)relayDestinationForHome:(id)a3 rooms:(id)a4 rapportConnection:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v37;
  id v38;
  void *v39;
  void *v40;
  uint8_t buf[4];
  const __CFString *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v38 = a5;
  v11 = (void *)MEMORY[0x1E0CBA1A8];
  objc_msgSend(MEMORY[0x1E0CBA7D8], "hmu_accessoriesInRooms:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appleAnnounceHostAccessoriesFromAccessories:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count"))
  {
    v14 = v13;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CBA1A8];
    objc_msgSend(v9, "accessories");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appleAnnounceHostAccessoriesFromAccessories:", v16);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CBA1A8], "accessoriesWithAnnounceEnabledFromAccessories:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count"))
    v18 = v17;
  else
    v18 = v14;
  objc_msgSend(v18, "sortedArrayUsingComparator:", &__block_literal_global_21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "BOOLForDefault:", *MEMORY[0x1E0CF7C18]);

  if (v21)
  {
    v37 = v10;
    +[ANMessengerDestination _destinationForAppleAccessories:home:rooms:rapportConnection:](ANMessengerDestination, "_destinationForAppleAccessories:home:rooms:rapportConnection:", v19, v9, v10, v38);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "devices");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    ANLogHandleMessengerDestination();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v42 = &stru_1E93913D0;
      v43 = 2048;
      v44 = objc_msgSend(v23, "count");
      _os_log_impl(&dword_1D23A0000, v24, OS_LOG_TYPE_DEFAULT, "%@Checking (%lu) nearby Accessories for Relay Viability", buf, 0x16u);
    }

    if (objc_msgSend(v23, "count"))
    {
      objc_msgSend(v23, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      ANLogHandleMessengerDestination();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v42 = &stru_1E93913D0;
        v43 = 2112;
        v44 = (uint64_t)v25;
        _os_log_impl(&dword_1D23A0000, v26, OS_LOG_TYPE_DEFAULT, "%@Relaying Announcement through Nearby Accessory (%@)", buf, 0x16u);
      }

      v27 = (void *)objc_opt_new();
      objc_msgSend(v27, "setHome:", v9);
      v40 = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setDevices:", v28);

      v10 = v37;
      goto LABEL_28;
    }

    v10 = v37;
  }
  if (!objc_msgSend(v9, "hmu_isRemoteAccessAllowedForCurrentUser"))
  {
    if (a6)
    {
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v34 = *MEMORY[0x1E0CF7C58];
      v35 = 1032;
LABEL_26:
      objc_msgSend(v33, "an_errorWithCode:component:", v35, v34);
      v27 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
LABEL_27:
    v27 = 0;
    goto LABEL_28;
  }
  +[ANMessengerDestination _bestRemoteRelayAccessoryFromAccessories:inHome:](ANMessengerDestination, "_bestRemoteRelayAccessoryFromAccessories:inHome:", v19, v9);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  ANLogHandleMessengerDestination();
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (!v29)
  {
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v42 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v31, OS_LOG_TYPE_ERROR, "%@Failed to find Accessory for remote relay", buf, 0xCu);
    }

    if (a6)
    {
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v34 = *MEMORY[0x1E0CF7C58];
      v35 = 1015;
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v42 = &stru_1E93913D0;
    v43 = 2112;
    v44 = (uint64_t)v29;
    _os_log_impl(&dword_1D23A0000, v31, OS_LOG_TYPE_DEFAULT, "%@Relaying Announcement through Accessory %@", buf, 0x16u);
  }

  v27 = (void *)objc_opt_new();
  objc_msgSend(v27, "setHome:", v9);
  v39 = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAccessories:", v32);

LABEL_28:
  return v27;
}

uint64_t __80__ANMessengerDestination_relayDestinationForHome_rooms_rapportConnection_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "softwareVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "softwareVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  v8 = 1;
  if (v7 != -1)
    v8 = v7;
  if (v7 == 1)
    v9 = -1;
  else
    v9 = v8;

  return v9;
}

+ (id)destinationForHome:(id)a3 excludingUsers:(id)a4 excludingAccessories:(id)a5 rapportConnection:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (void *)MEMORY[0x1E0CBA1A8];
  v13 = a5;
  objc_msgSend(v9, "accessories");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appleAnnounceHostAccessoriesFromAccessories:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  objc_msgSend(v16, "removeObjectsInArray:", v13);
  v17 = (void *)objc_msgSend(v16, "copy");
  objc_msgSend(v9, "hmu_allRoomsIncludingRoomForEntireHome");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[ANMessengerDestination _destinationForAppleAccessories:home:rooms:rapportConnection:](ANMessengerDestination, "_destinationForAppleAccessories:home:rooms:rapportConnection:", v17, v9, v18, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setHome:", v9);
  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "BOOLForDefault:", *MEMORY[0x1E0CF7C18]);

  if (v21 && objc_msgSend(MEMORY[0x1E0CF7DE8], "isEnabledForPersonalDevices"))
  {
    objc_msgSend(v11, "devices");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activeAccessoryDevicesSupportingAnnounce");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "allValues");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "mutableCopy");

    objc_msgSend(v19, "devices");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "removeObjectsInArray:", v37);
    objc_msgSend(v11, "devices");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activeDevicesSupportingAnnounce");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "mutableCopy");

    objc_msgSend(v28, "removeObjectsInArray:", v25);
    v29 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v9, "usersIncludingCurrentUserWithAnnounceEnabled");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "arrayWithArray:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "removeObjectsInArray:", v10);
    objc_msgSend(v28, "devicesByRemovingNonAccessoryDevicesNotBelongingToUsers:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDevices:", v32);

  }
  if (objc_msgSend(MEMORY[0x1E0CF7DE8], "isEnabledForPersonalDevices"))
  {
    v33 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v9, "usersIncludingCurrentUserWithAnnounceAndRemoteAccessEnabled");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "arrayWithArray:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "removeObjectsInArray:", v10);
    objc_msgSend(v19, "setUsers:", v35);

  }
  return v19;
}

+ (id)destinationForAccessoriesInHome:(id)a3 rooms:(id)a4 rapportConnection:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (void *)MEMORY[0x1E0CBA1A8];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "accessories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appleAnnounceHostAccessoriesFromAccessories:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[ANMessengerDestination _destinationForAppleAccessories:home:rooms:rapportConnection:](ANMessengerDestination, "_destinationForAppleAccessories:home:rooms:rapportConnection:", v12, v10, v9, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setHome:", v10);
  return v13;
}

+ (id)_destinationForAppleAccessories:(id)a3 home:(id)a4 rooms:(id)a5 rapportConnection:(id)a6
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  const __CFString *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a6;
  objc_msgSend(v9, "activateLinkWithOptions:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    ANLogHandleMessengerDestination();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v34 = &stru_1E93913D0;
      v35 = 2112;
      v36 = v10;
      _os_log_impl(&dword_1D23A0000, v11, OS_LOG_TYPE_ERROR, "%@Activate Rapport link failed with error: %@", buf, 0x16u);
    }

  }
  objc_msgSend(v9, "devices");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activeAccessoryDevicesSupportingAnnounce");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLForDefault:", *MEMORY[0x1E0CF7C18]);

  if (v16)
  {
    v26 = a1;
    v27 = v8;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v17 = v8;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v29;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v21), "uniqueIdentifier", v26, v27, (_QWORD)v28);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
            objc_msgSend(v14, "addObject:", v23);

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v19);
    }

    v8 = v27;
  }
  v24 = (void *)objc_opt_new();
  objc_msgSend(v24, "setDevices:", v14);

  return v24;
}

+ (id)_bestRemoteRelayAccessoryFromAccessories:(id)a3 inHome:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  NSObject *v40;
  id v41;
  void *v42;
  void *v43;
  id obj;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  const __CFString *v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  int v60;
  __int16 v61;
  int v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  ANLogHandleMessengerDestination();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v54 = &stru_1E93913D0;
    v55 = 2048;
    v56 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1D23A0000, v7, OS_LOG_TYPE_DEFAULT, "%@Checking (%lu) remote Accessories for Relay Viability", buf, 0x16u);
  }

  if (objc_msgSend(v5, "count") == 1)
  {
    ANLogHandleMessengerDestination();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v54 = &stru_1E93913D0;
      v55 = 2112;
      v56 = (uint64_t)v9;
      _os_log_impl(&dword_1D23A0000, v8, OS_LOG_TYPE_DEFAULT, "%@Selected Single Accessory: %@", buf, 0x16u);

    }
    objc_msgSend(v5, "firstObject");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  v41 = v5;
  v43 = v6;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v5;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v50;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v50 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        ANLogHandleMessengerDestination();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v15, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "uniqueIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "settings");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isControllable");
          v21 = objc_msgSend(v15, "supportsAnnounce");
          *(_DWORD *)buf = 138413314;
          v54 = &stru_1E93913D0;
          v55 = 2112;
          v56 = (uint64_t)v17;
          v57 = 2112;
          v58 = v18;
          v59 = 1024;
          v60 = v20;
          v61 = 1024;
          v62 = v21;
          _os_log_impl(&dword_1D23A0000, v16, OS_LOG_TYPE_DEFAULT, "%@Checking if Accessory can Relay: %@, HomeKitID: %@, Controllable: %d, Announce Supported: %d", buf, 0x2Cu);

        }
        objc_msgSend(v15, "settings");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isControllable");

        if (v23)
        {
          ANLogHandleMessengerDestination();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v54 = &stru_1E93913D0;
            v55 = 2112;
            v56 = (uint64_t)v15;
            _os_log_impl(&dword_1D23A0000, v38, OS_LOG_TYPE_DEFAULT, "%@Found controllable accessory: %@", buf, 0x16u);
          }

          v10 = v15;
          goto LABEL_29;
        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
      if (v12)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "BOOLForDefault:", *MEMORY[0x1E0CF7B30]);

  if (v25)
  {
    ANLogHandleMessengerDestination();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v54 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v26, OS_LOG_TYPE_DEFAULT, "%@Checking Residents for Relay", buf, 0xCu);
    }

    objc_msgSend(v43, "residentDevices");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "na_filter:", &__block_literal_global_15);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = (void *)MEMORY[0x1E0CBA1A8];
    objc_msgSend(v43, "accessories");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "appleAnnounceHostAccessoriesFromAccessories:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "na_firstObjectPassingTest:", &__block_literal_global_16);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    v34 = MEMORY[0x1E0C809B0];
    if (v32)
    {
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __74__ANMessengerDestination__bestRemoteRelayAccessoryFromAccessories_inHome___block_invoke_3;
      v47[3] = &unk_1E9390568;
      v48 = v32;
      objc_msgSend(v31, "na_firstObjectPassingTest:", v47);
      v35 = objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        v10 = (id)v35;
        ANLogHandleMessengerDestination();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v54 = &stru_1E93913D0;
          v55 = 2112;
          v56 = (uint64_t)v10;
          _os_log_impl(&dword_1D23A0000, v36, OS_LOG_TYPE_DEFAULT, "%@Selected Primary Resident in Target List: %@", buf, 0x16u);
        }

        v37 = v48;
        v5 = v41;
        v6 = v43;
LABEL_37:

        goto LABEL_30;
      }

    }
    objc_msgSend(v28, "na_map:", &__block_literal_global_20, v41);
    v45[0] = v34;
    v45[1] = 3221225472;
    v45[2] = __74__ANMessengerDestination__bestRemoteRelayAccessoryFromAccessories_inHome___block_invoke_2_21;
    v45[3] = &unk_1E9390568;
    v46 = (id)objc_claimAutoreleasedReturnValue();
    v37 = v46;
    objc_msgSend(v31, "na_firstObjectPassingTest:", v45);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v5 = v42;
    v6 = v43;
    if (v10)
    {
      ANLogHandleMessengerDestination();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v54 = &stru_1E93913D0;
        v55 = 2112;
        v56 = (uint64_t)v10;
        _os_log_impl(&dword_1D23A0000, v40, OS_LOG_TYPE_DEFAULT, "%@Selected any Announce-capable Accessory: %@", buf, 0x16u);
      }

    }
    goto LABEL_37;
  }
  v10 = 0;
LABEL_29:
  v5 = v41;
  v6 = v43;
LABEL_30:

  return v10;
}

unint64_t __74__ANMessengerDestination__bestRemoteRelayAccessoryFromAccessories_inHome___block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "capabilities") >> 15) & 1;
}

unint64_t __74__ANMessengerDestination__bestRemoteRelayAccessoryFromAccessories_inHome___block_invoke_2(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "status") >> 1) & 1;
}

uint64_t __74__ANMessengerDestination__bestRemoteRelayAccessoryFromAccessories_inHome___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  return v7;
}

uint64_t __74__ANMessengerDestination__bestRemoteRelayAccessoryFromAccessories_inHome___block_invoke_18(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "device");
}

uint64_t __74__ANMessengerDestination__bestRemoteRelayAccessoryFromAccessories_inHome___block_invoke_2_21(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3);
  else
    v4 = 0;

  return v4;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (NSArray)accessories
{
  return self->_accessories;
}

- (void)setAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_accessories, a3);
}

- (NSArray)users
{
  return self->_users;
}

- (void)setUsers:(id)a3
{
  objc_storeStrong((id *)&self->_users, a3);
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_users, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
