@implementation ANHomeManager

- (id)homeForID:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ANHomeManager allHomes](self, "allHomes");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "uniqueIdentifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)homeWithName:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ANHomeManager allHomes](self, "allHomes");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "name", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "caseInsensitiveCompare:", v4);

        if (!v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)homesWithRoomNames:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CBA528];
  v5 = a3;
  -[ANHomeManager allHomes](self, "allHomes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmu_homesFromHomes:withRoomNames:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)homesWithZoneNames:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CBA528];
  v5 = a3;
  -[ANHomeManager allHomes](self, "allHomes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmu_homesFromHomes:withZoneNames:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)homesSupportingAnnounce
{
  void *v2;
  void *v3;

  -[ANHomeManager allHomes](self, "allHomes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "an_homesSupportingAnnounce");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)isLocalDeviceInRoom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (!-[ANHomeManager homesLoaded](self, "homesLoaded"))
    -[ANHomeManager loadHomeSynchronous](self, "loadHomeSynchronous");
  -[ANHomeManager currentAccessory](self, "currentAccessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "room");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "room");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = objc_msgSend(v9, "isEqualToString:", v4);

    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return (char)v7;
}

- (BOOL)isEndpointWithUUID:(id)a3 inRoomWithName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  if (!-[ANHomeManager homesLoaded](self, "homesLoaded"))
    -[ANHomeManager loadHomeSynchronous](self, "loadHomeSynchronous");
  -[ANHomeManager currentAccessory](self, "currentAccessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    v11 = v10;
    if (v6
      && (objc_msgSend(v10, "home"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v12, "accessoryWithUniqueIdentifier:", v6),
          v13 = objc_claimAutoreleasedReturnValue(),
          v11,
          v12,
          (v11 = (void *)v13) == 0))
    {
      LOBYTE(v14) = 0;
    }
    else
    {
      objc_msgSend(v11, "room");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v11, "room");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v14) = objc_msgSend(v16, "isEqualToString:", v7);

      }
    }

  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return (char)v14;
}

- (id)homeNamesForContext:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v12;
  int v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[ANHomeManager homesLoaded](self, "homesLoaded"))
    -[ANHomeManager loadHomeSynchronous](self, "loadHomeSynchronous");
  if (objc_msgSend(v4, "isEmpty"))
  {
    ANLogHandleHomeManager_HomeContext();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "%@Home Context empty. Will find best home names.", (uint8_t *)&v13, 0xCu);
    }

    -[ANHomeManager _findBestHomeNames](self, "_findBestHomeNames");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v10 = (void *)v6;
    goto LABEL_12;
  }
  -[ANHomeManager currentAccessory](self, "currentAccessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  ANLogHandleHomeManager_HomeContext();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      v13 = 138412290;
      v14 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v8, OS_LOG_TYPE_DEFAULT, "%@Will find home names for Accessory.", (uint8_t *)&v13, 0xCu);
    }

    -[ANHomeManager _homeNamesForAccessoryForContext:](self, "_homeNamesForAccessoryForContext:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (v9)
  {
    v13 = 138412290;
    v14 = &stru_1E93913D0;
    _os_log_impl(&dword_1D23A0000, v8, OS_LOG_TYPE_DEFAULT, "%@Will find home names for personal device.", (uint8_t *)&v13, 0xCu);
  }

  -[ANHomeManager _homesForContext:](self, "_homesForContext:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "na_map:", &__block_literal_global_11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v10;
}

uint64_t __50__ANHomeManager_HomeContext__homeNamesForContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

- (id)_homesForContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "homeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    objc_msgSend(v4, "homeName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANHomeManager homeWithName:](self, "homeWithName:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v26[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    -[ANHomeManager currentAccessory](self, "currentAccessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      -[ANHomeManager _currentHomesWeAreIn](self, "_currentHomesWeAreIn");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v12 = objc_msgSend(v11, "count");
    ANLogHandleHomeManager_HomeContext();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        v24 = 138412290;
        v25 = &stru_1E93913D0;
        _os_log_impl(&dword_1D23A0000, v13, OS_LOG_TYPE_DEFAULT, "%@Checking Current Homes we are in for Rooms and Zones", (uint8_t *)&v24, 0xCu);
      }

      v8 = v11;
    }
    else
    {
      if (v14)
      {
        v24 = 138412290;
        v25 = &stru_1E93913D0;
        _os_log_impl(&dword_1D23A0000, v13, OS_LOG_TYPE_DEFAULT, "%@Checking All Homes Supporting Announce for Rooms and Zones", (uint8_t *)&v24, 0xCu);
      }

      -[ANHomeManager allHomes](self, "allHomes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "an_homesSupportingAnnounce");
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    v16 = (void *)objc_opt_new();
    v17 = (void *)MEMORY[0x1E0CBA528];
    objc_msgSend(v4, "roomNames");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hmu_homesFromHomes:withRoomNames:", v8, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObjectsFromArray:", v19);

    v20 = (void *)MEMORY[0x1E0CBA528];
    objc_msgSend(v4, "zoneNames");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "hmu_homesFromHomes:withZoneNames:", v8, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObjectsFromArray:", v22);

    objc_msgSend(v16, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)_homeNamesForAccessoryForContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *v29;
  uint8_t v30[128];
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ANHomeManager currentAccessory](self, "currentAccessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  ANLogHandleHomeManager_HomeContext();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v32 = &stru_1E93913D0;
    v33 = 2112;
    v34 = v8;
    _os_log_impl(&dword_1D23A0000, v7, OS_LOG_TYPE_DEFAULT, "%@Acessory Home Name: %@", buf, 0x16u);

  }
  if (v6)
  {
    objc_msgSend(v4, "homeName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(v4, "homeName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

      if (!v12)
      {
        v13 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_22;
      }
    }
    else
    {

    }
    -[ANHomeManager _homesForContext:](self, "_homesForContext:", v4);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v19, "uniqueIdentifier", (_QWORD)v25);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "uniqueIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v20, "isEqual:", v21);

          if ((v22 & 1) != 0)
          {
            objc_msgSend(v19, "name");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v23;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_21;
          }
        }
        v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v16)
          continue;
        break;
      }
    }

  }
  else
  {
    ANLogHandleHomeManager_HomeContext();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v32 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v14, OS_LOG_TYPE_ERROR, "%@Accessory does not have a home", buf, 0xCu);
    }
  }
  v13 = (void *)MEMORY[0x1E0C9AA60];
LABEL_21:

LABEL_22:
  return v13;
}

- (id)_findBestHomeNames
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  const __CFString *v24;
  __int16 v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  -[ANHomeManager currentAccessory](self, "currentAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v8 = (void *)objc_opt_new();
    -[ANHomeManager _currentHomesWeAreIn](self, "_currentHomesWeAreIn");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      ANLogHandleHomeManager_HomeContext();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v24 = &stru_1E93913D0;
        v25 = 2112;
        v26 = v7;
        _os_log_impl(&dword_1D23A0000, v9, OS_LOG_TYPE_DEFAULT, "%@Selecting Current Homes: %@", buf, 0x16u);
      }

      v10 = v7;
    }
    else
    {
      -[ANHomeManager homesSupportingAnnounce](self, "homesSupportingAnnounce");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      ANLogHandleHomeManager_HomeContext();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v24 = &stru_1E93913D0;
        v25 = 2112;
        v26 = v10;
        _os_log_impl(&dword_1D23A0000, v11, OS_LOG_TYPE_DEFAULT, "%@Selecting All Homes Supporting announce: %@", buf, 0x16u);
      }

    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v10;
    v12 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "name", (_QWORD)v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v16);

        }
        v13 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

    goto LABEL_20;
  }
  objc_msgSend(v3, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

    goto LABEL_21;
  }
  v8 = (void *)MEMORY[0x1E0C9AA60];
LABEL_21:

  return v8;
}

- (id)_currentHomesWeAreIn
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  ANHomeManager *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  const __CFString *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E20];
  v4 = (void *)MEMORY[0x1E0CBA528];
  -[ANHomeManager allHomes](self, "allHomes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmu_homesFromHomes:withHomeLocationStatus:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ANHomeManager currentHome](self, "currentHome");
  v8 = objc_claimAutoreleasedReturnValue();
  ANLogHandleHomeManager_HomeContext();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v35 = &stru_1E93913D0;
    v36 = 2112;
    v37 = v8;
    _os_log_impl(&dword_1D23A0000, v9, OS_LOG_TYPE_DEFAULT, "%@Current Home: %@", buf, 0x16u);
  }
  v28 = (void *)v8;

  ANLogHandleHomeManager_HomeContext();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v35 = &stru_1E93913D0;
    v36 = 2112;
    v37 = (uint64_t)v7;
    _os_log_impl(&dword_1D23A0000, v10, OS_LOG_TYPE_DEFAULT, "%@Homes with Location Status at Home: %@", buf, 0x16u);
  }
  v29 = v7;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v27 = self;
  -[ANHomeManager allHomes](self, "allHomes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        ANLogHandleHomeManager_HomeContext();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = objc_msgSend(v16, "homeLocationStatus");
          *(_DWORD *)buf = 138412802;
          v35 = &stru_1E93913D0;
          v36 = 2112;
          v37 = (uint64_t)v16;
          v38 = 2048;
          v39 = v18;
          _os_log_impl(&dword_1D23A0000, v17, OS_LOG_TYPE_DEFAULT, "%@HomeKit Location Status: %@: %ld", buf, 0x20u);
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v13);
  }

  if (v28 && !objc_msgSend(v7, "count"))
  {
    ANLogHandleHomeManager_HomeContext();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v25, OS_LOG_TYPE_DEFAULT, "%@Current Home is set but no Homes with Location Status at Home. Falling back to all Homes.", buf, 0xCu);
    }

    -[ANHomeManager allHomes](v27, "allHomes");
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  if (objc_msgSend(v7, "count") == 1)
  {
    objc_msgSend(v7, "allObjects");
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_24:
    v24 = (void *)v19;
    goto LABEL_25;
  }
  v20 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v29, "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "an_homesSupportingAnnounce");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setWithArray:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
    objc_msgSend(v23, "addObject:", v28);
  objc_msgSend(v23, "allObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_25:
  return v24;
}

+ (id)bundleForLocationAuthorization
{
  return (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/LocationBundles/HomeKitDaemon.framework"));
}

- (ANHomeManager)init
{
  return -[ANHomeManager initWithCaching:](self, "initWithCaching:", 1);
}

- (ANHomeManager)initWithCaching:(BOOL)a3
{
  return -[ANHomeManager initWithCaching:homeOptions:](self, "initWithCaching:homeOptions:", a3, +[ANHomeManager defaultHomeOptions](ANHomeManager, "defaultHomeOptions"));
}

- (ANHomeManager)initWithCaching:(BOOL)a3 homeOptions:(unint64_t)a4
{
  _BOOL4 v5;
  ANHomeManager *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *serialQueue;
  uint64_t v9;
  NSMapTable *delegatesToQueues;
  uint64_t v11;
  NSMutableArray *homesLoadedCompletionHandlers;
  uint64_t v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  NSDate *loadHomesStart;
  id v23;
  void *v24;
  uint64_t v25;
  HMHomeManager *homeManager;
  ANAccessorySettingsCache *v27;
  void *v28;
  uint64_t v29;
  ANAccessorySettingsCache *accessorySettingsCache;
  objc_super v32;
  uint8_t buf[4];
  const __CFString *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v5 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)ANHomeManager;
  v6 = -[ANHomeManager init](&v32, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.announce.homeManager", 0);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 517, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    delegatesToQueues = v6->_delegatesToQueues;
    v6->_delegatesToQueues = (NSMapTable *)v9;

    v11 = objc_opt_new();
    homesLoadedCompletionHandlers = v6->_homesLoadedCompletionHandlers;
    v6->_homesLoadedCompletionHandlers = (NSMutableArray *)v11;

    if (v5)
      v13 = 2;
    else
      v13 = 0;
    objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLForDefault:", *MEMORY[0x1E0CF7B40]);

    if (v15)
    {
      ANLogHandleHomeManager();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v34 = &stru_1E93913D0;
        v35 = 2048;
        v36 = v13;
        _os_log_impl(&dword_1D23A0000, v16, OS_LOG_TYPE_DEFAULT, "%@[Override] Setting HomeKit Cache Policy to None. Actual = %lu", buf, 0x16u);
      }

      v13 = 0;
    }
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA6C8]), "initWithOptions:cachePolicy:", a4, v13);
    objc_msgSend(v17, "setDiscretionary:", 0);
    v18 = (void *)objc_opt_new();
    objc_msgSend(v17, "setDelegateQueue:", v18);

    objc_msgSend(v17, "setAdaptive:", 1);
    +[ANHomeManager bundleForLocationAuthorization](ANHomeManager, "bundleForLocationAuthorization");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0D285B8]), "initWithBundle:", v19);
      objc_msgSend(v17, "setLocationAuthorization:", v20);
    }
    else
    {
      ANLogHandleHomeManager();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v34 = &stru_1E93913D0;
        _os_log_impl(&dword_1D23A0000, v20, OS_LOG_TYPE_ERROR, "%@No bundle for location authorization", buf, 0xCu);
      }
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v21 = objc_claimAutoreleasedReturnValue();
    loadHomesStart = v6->_loadHomesStart;
    v6->_loadHomesStart = (NSDate *)v21;

    v23 = objc_alloc(MEMORY[0x1E0CBA550]);
    v24 = (void *)objc_msgSend(v17, "copy");
    v25 = objc_msgSend(v23, "initWithConfiguration:", v24);
    homeManager = v6->_homeManager;
    v6->_homeManager = (HMHomeManager *)v25;

    v27 = [ANAccessorySettingsCache alloc];
    -[HMHomeManager createAccessorySettingsDataSource](v6->_homeManager, "createAccessorySettingsDataSource");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[ANAccessorySettingsCache initWithAccessorySettingsDataSource:](v27, "initWithAccessorySettingsDataSource:", v28);
    accessorySettingsCache = v6->_accessorySettingsCache;
    v6->_accessorySettingsCache = (ANAccessorySettingsCache *)v29;

    -[HMHomeManager setDelegate:](v6->_homeManager, "setDelegate:", v6);
  }
  return v6;
}

+ (unint64_t)defaultHomeOptions
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForDefault:", *MEMORY[0x1E0CF7B30]);

  if (v3)
    return 34924;
  else
    return 32876;
}

+ (id)shared
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__ANHomeManager_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, block);
  return (id)shared_manager;
}

void __23__ANHomeManager_shared__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)shared_manager;
  shared_manager = v0;

}

- (void)loadHomes:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__ANHomeManager_loadHomes___block_invoke;
  block[3] = &unk_1E938F908;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __27__ANHomeManager_loadHomes___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  ANLogHandleHomeManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = &stru_1E93913D0;
    _os_log_impl(&dword_1D23A0000, v3, OS_LOG_TYPE_DEFAULT, "%@Loading Homes", (uint8_t *)&v8, 0xCu);
  }

  if (*((_BYTE *)WeakRetained + 8))
  {
    ANLogHandleHomeManager();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v4, OS_LOG_TYPE_DEFAULT, "%@Homes Already Loaded", (uint8_t *)&v8, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained[5], "homes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
  else
  {
    objc_msgSend(WeakRetained, "homesLoadedCompletionHandlers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = _Block_copy(*(const void **)(a1 + 32));
    objc_msgSend(v6, "addObject:", v7);

  }
}

- (void)loadHomeSynchronous
{
  void *v2;
  NSObject *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[ANHomeManager allHomes](self, "allHomes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ANLogHandleHomeManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412546;
    v5 = &stru_1E93913D0;
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1D23A0000, v3, OS_LOG_TYPE_DEFAULT, "%@Loaded Homes Synchronous: %@", (uint8_t *)&v4, 0x16u);
  }

}

- (id)refreshHomeSynchronous
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  dispatch_semaphore_t v10;
  HMHomeManager *homeManager;
  NSObject *v12;
  id v13;
  NSObject *v14;
  const __CFString *v15;
  id v16;
  _QWORD v18[4];
  NSObject *v19;
  _BYTE *v20;
  uint8_t v21[4];
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  _BYTE buf[24];
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberForDefault:", *MEMORY[0x1E0CF7B80]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  ANLogHandleHomeManager();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = &stru_1E93913D0;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v7;
    _os_log_impl(&dword_1D23A0000, v8, OS_LOG_TYPE_DEFAULT, "%@Home manager refresh start (%.2fs timeout)", buf, 0x16u);
  }

  objc_msgSend(v3, "dateByAddingTimeInterval:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_semaphore_create(0);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v26 = __Block_byref_object_copy__4;
  v27 = __Block_byref_object_dispose__4;
  v28 = 0;
  homeManager = self->_homeManager;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __39__ANHomeManager_refreshHomeSynchronous__block_invoke;
  v18[3] = &unk_1E938FC70;
  v20 = buf;
  v12 = v10;
  v19 = v12;
  v13 = (id)-[HMHomeManager _refreshBeforeDate:completionHandler:](homeManager, "_refreshBeforeDate:completionHandler:", v9, v18);
  dispatch_semaphore_wait(v12, (unint64_t)(v7 + 0.5));
  ANLogHandleHomeManager();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      v15 = CFSTR("failure");
    else
      v15 = CFSTR("success");
    *(_DWORD *)v21 = 138412546;
    v22 = &stru_1E93913D0;
    v23 = 2112;
    v24 = v15;
    _os_log_impl(&dword_1D23A0000, v14, OS_LOG_TYPE_DEFAULT, "%@Home manager refresh %@", v21, 0x16u);
  }

  v16 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v16;
}

void __39__ANHomeManager_refreshHomeSynchronous__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)registerDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ANHomeManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[ANHomeManager serialQueue](self, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ANHomeManager_registerDelegate_queue___block_invoke;
  block[3] = &unk_1E938F668;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __40__ANHomeManager_registerDelegate_queue___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    dispatch_get_global_queue(21, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v3;
  objc_msgSend(*(id *)(a1 + 40), "delegatesToQueues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, *(_QWORD *)(a1 + 48));

}

- (NSArray)allHomes
{
  NSObject *v3;
  NSObject *v4;
  dispatch_time_t v5;
  _QWORD v7[4];
  NSObject *v8;

  if (!self->_homesLoaded)
  {
    v3 = dispatch_group_create();
    dispatch_group_enter(v3);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __25__ANHomeManager_allHomes__block_invoke;
    v7[3] = &unk_1E938FC98;
    v8 = v3;
    v4 = v3;
    -[ANHomeManager loadHomes:](self, "loadHomes:", v7);
    v5 = dispatch_time(0, 10000000000);
    dispatch_group_wait(v4, v5);

  }
  -[HMHomeManager homes](self->_homeManager, "homes");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

void __25__ANHomeManager_allHomes__block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (HMHome)currentHome
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  const __CFString *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[ANHomeManager allHomes](self, "allHomes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ANLogHandleHomeManager();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412546;
    v9 = &stru_1E93913D0;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1D23A0000, v4, OS_LOG_TYPE_DEBUG, "%@Loaded homes %@", (uint8_t *)&v8, 0x16u);
  }

  -[ANHomeManager homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentHome");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMHome *)v6;
}

- (HMAccessory)currentAccessory
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  const __CFString *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[ANHomeManager allHomes](self, "allHomes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ANLogHandleHomeManager();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412546;
    v9 = &stru_1E93913D0;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1D23A0000, v4, OS_LOG_TYPE_DEBUG, "%@Loaded homes %@", (uint8_t *)&v8, 0x16u);
  }

  -[ANHomeManager homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMAccessory *)v6;
}

- (void)_notifyManagerLoadedHomes:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  v5 = self->_homesLoadedCompletionHandlers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        objc_msgSend(v4, "homes", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[NSMutableArray removeAllObjects](self->_homesLoadedCompletionHandlers, "removeAllObjects");
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[ANHomeManager serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__ANHomeManager_homeManagerDidUpdateHomes___block_invoke;
  v7[3] = &unk_1E938FCC0;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __43__ANHomeManager_homeManagerDidUpdateHomes___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  char v4;
  void *v5;
  NSObject *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  id v22;
  NSObject *v23;
  double v24;
  id v25;
  id *location;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint8_t v36[128];
  uint8_t buf[4];
  const __CFString *v38;
  __int16 v39;
  double v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v4 = objc_msgSend(WeakRetained, "homesLoaded");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ANLogHandleHomeManager();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "timeIntervalSince1970");
      v8 = v7;
      objc_msgSend(a1[4], "loadHomesStart");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSince1970");
      *(_DWORD *)buf = 138412546;
      v38 = &stru_1E93913D0;
      v39 = 2048;
      v40 = v8 - v10;
      _os_log_impl(&dword_1D23A0000, v6, OS_LOG_TYPE_DEFAULT, "%@Load Homes took %f seconds", buf, 0x16u);

    }
  }
  location = v2;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(a1[5], "homes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v32 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        objc_msgSend(v16, "accessories");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v28;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v28 != v20)
                objc_enumerationMutation(v17);
              objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "setDelegate:", a1[4]);
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v19);
        }

        objc_msgSend(v16, "setDelegate:", a1[4]);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v13);
  }

  v22 = objc_loadWeakRetained(location);
  objc_msgSend(v22, "setHomesLoaded:", 1);

  ANLogHandleHomeManager();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1[5], "homes");
    v24 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 138412546;
    v38 = &stru_1E93913D0;
    v39 = 2112;
    v40 = v24;
    _os_log_impl(&dword_1D23A0000, v23, OS_LOG_TYPE_DEFAULT, "%@Homes Loaded: %@", buf, 0x16u);

  }
  v25 = objc_loadWeakRetained(location);
  objc_msgSend(v25, "_notifyManagerLoadedHomes:", a1[5]);

}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[ANHomeManager serialQueue](self, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ANHomeManager_homeManager_didAddHome___block_invoke;
  block[3] = &unk_1E938FD10;
  v11 = v7;
  v9 = v7;
  objc_copyWeak(&v12, &location);
  dispatch_async(v8, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __40__ANHomeManager_homeManager_didAddHome___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  const __CFString *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  ANLogHandleHomeManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v20 = &stru_1E93913D0;
    v21 = 2112;
    v22 = v3;
    v23 = 2112;
    v24 = v4;
    _os_log_impl(&dword_1D23A0000, v2, OS_LOG_TYPE_DEFAULT, "%@Added Home %@, %@", buf, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", WeakRetained);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10++), "setDelegate:", WeakRetained);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v11 = objc_loadWeakRetained((id *)(a1 + 40));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__ANHomeManager_homeManager_didAddHome___block_invoke_21;
  v12[3] = &unk_1E938FCE8;
  v13 = *(id *)(a1 + 32);
  objc_msgSend(v11, "_executeBlockForDelegates:", v12);

}

void __40__ANHomeManager_homeManager_didAddHome___block_invoke_21(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didAddHome:", *(_QWORD *)(a1 + 32));

}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[ANHomeManager serialQueue](self, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__ANHomeManager_homeManager_didRemoveHome___block_invoke;
  block[3] = &unk_1E938FD10;
  v11 = v7;
  v9 = v7;
  objc_copyWeak(&v12, &location);
  dispatch_async(v8, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __43__ANHomeManager_homeManager_didRemoveHome___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  const __CFString *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  ANLogHandleHomeManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v9 = &stru_1E93913D0;
    v10 = 2112;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1D23A0000, v2, OS_LOG_TYPE_DEFAULT, "%@Removed Home %@, %@", buf, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__ANHomeManager_homeManager_didRemoveHome___block_invoke_25;
  v6[3] = &unk_1E938FCE8;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "_executeBlockForDelegates:", v6);

}

void __43__ANHomeManager_homeManager_didRemoveHome___block_invoke_25(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didRemoveHome:", *(_QWORD *)(a1 + 32));

}

- (void)homeDidUpdateAccessControlForCurrentUser:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[ANHomeManager serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ANHomeManager_homeDidUpdateAccessControlForCurrentUser___block_invoke;
  block[3] = &unk_1E938FD10;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __58__ANHomeManager_homeDidUpdateAccessControlForCurrentUser___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id WeakRetained;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  const __CFString *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  ANLogHandleHomeManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v8 = &stru_1E93913D0;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1D23A0000, v2, OS_LOG_TYPE_DEFAULT, "%@Access Control Changed for Current User in Home: %@", buf, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__ANHomeManager_homeDidUpdateAccessControlForCurrentUser___block_invoke_28;
  v5[3] = &unk_1E938FCE8;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "_executeBlockForDelegates:", v5);

}

void __58__ANHomeManager_homeDidUpdateAccessControlForCurrentUser___block_invoke_28(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "homeDidUpdateAccessControlForCurrentUser:", *(_QWORD *)(a1 + 32));

}

- (void)home:(id)a3 didUpdateAccessControlForUser:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[ANHomeManager serialQueue](self, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__ANHomeManager_home_didUpdateAccessControlForUser___block_invoke;
  v11[3] = &unk_1E938FD60;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  objc_copyWeak(&v14, &location);
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __52__ANHomeManager_home_didUpdateAccessControlForUser___block_invoke(id *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  const __CFString *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  ANLogHandleHomeManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1[4], "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v18 = &stru_1E93913D0;
    v19 = 2112;
    v20 = v3;
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_1D23A0000, v2, OS_LOG_TYPE_DEFAULT, "%@Access Control Changed for User %@ in Home: %@", buf, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__ANHomeManager_home_didUpdateAccessControlForUser___block_invoke_31;
  v14[3] = &unk_1E938FD38;
  v15 = a1[5];
  v16 = a1[4];
  objc_msgSend(WeakRetained, "_executeBlockForDelegates:", v14);

  objc_msgSend(a1[4], "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "currentUser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
  {
    v11 = objc_loadWeakRetained(a1 + 6);
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __52__ANHomeManager_home_didUpdateAccessControlForUser___block_invoke_2;
    v12[3] = &unk_1E938FCE8;
    v13 = a1[5];
    objc_msgSend(v11, "_executeBlockForDelegates:", v12);

  }
}

void __52__ANHomeManager_home_didUpdateAccessControlForUser___block_invoke_31(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "home:didUpdateAccessControlForUser:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __52__ANHomeManager_home_didUpdateAccessControlForUser___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "homeDidUpdateAccessControlForCurrentUser:", *(_QWORD *)(a1 + 32));

}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ANHomeManager *v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[ANHomeManager serialQueue](self, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__ANHomeManager_home_didAddAccessory___block_invoke;
  block[3] = &unk_1E938FD88;
  v12 = v7;
  v13 = self;
  v9 = v7;
  objc_copyWeak(&v15, &location);
  v14 = v6;
  v10 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __38__ANHomeManager_home_didAddAccessory___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  _QWORD v6[4];
  id v7;
  id v8;
  uint8_t buf[4];
  const __CFString *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  ANLogHandleHomeManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v10 = &stru_1E93913D0;
    v11 = 2112;
    v12 = v3;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1D23A0000, v2, OS_LOG_TYPE_DEFAULT, "%@Added Accessory %@, %@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", *(_QWORD *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__ANHomeManager_home_didAddAccessory___block_invoke_34;
  v6[3] = &unk_1E938FD38;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "_executeBlockForDelegates:", v6);

}

void __38__ANHomeManager_home_didAddAccessory___block_invoke_34(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "home:didAddAccessory:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[ANHomeManager serialQueue](self, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__ANHomeManager_home_didRemoveAccessory___block_invoke;
  v11[3] = &unk_1E938FDB0;
  v12 = v7;
  v9 = v7;
  objc_copyWeak(&v14, &location);
  v13 = v6;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __41__ANHomeManager_home_didRemoveAccessory___block_invoke(id *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  _QWORD v6[4];
  id v7;
  id v8;
  uint8_t buf[4];
  const __CFString *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  ANLogHandleHomeManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1[4], "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v10 = &stru_1E93913D0;
    v11 = 2112;
    v12 = v3;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1D23A0000, v2, OS_LOG_TYPE_DEFAULT, "%@Removed Accessory %@, %@", buf, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__ANHomeManager_home_didRemoveAccessory___block_invoke_37;
  v6[3] = &unk_1E938FD38;
  v7 = a1[5];
  v8 = a1[4];
  objc_msgSend(WeakRetained, "_executeBlockForDelegates:", v6);

}

void __41__ANHomeManager_home_didRemoveAccessory___block_invoke_37(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "home:didRemoveAccessory:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)home:(id)a3 didAddUser:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[ANHomeManager serialQueue](self, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __33__ANHomeManager_home_didAddUser___block_invoke;
  v11[3] = &unk_1E938FDB0;
  v12 = v7;
  v9 = v7;
  objc_copyWeak(&v14, &location);
  v13 = v6;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __33__ANHomeManager_home_didAddUser___block_invoke(id *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  const __CFString *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  ANLogHandleHomeManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1[4], "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "userID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v11 = &stru_1E93913D0;
    v12 = 2112;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1D23A0000, v2, OS_LOG_TYPE_DEFAULT, "%@HomeKit Added User %@, %@, %@", buf, 0x2Au);

  }
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__ANHomeManager_home_didAddUser___block_invoke_40;
  v7[3] = &unk_1E938FD38;
  v8 = a1[5];
  v9 = a1[4];
  objc_msgSend(WeakRetained, "_executeBlockForDelegates:", v7);

}

void __33__ANHomeManager_home_didAddUser___block_invoke_40(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "home:didAddUser:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)home:(id)a3 didRemoveUser:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[ANHomeManager serialQueue](self, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __36__ANHomeManager_home_didRemoveUser___block_invoke;
  v11[3] = &unk_1E938FDB0;
  v12 = v7;
  v9 = v7;
  objc_copyWeak(&v14, &location);
  v13 = v6;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __36__ANHomeManager_home_didRemoveUser___block_invoke(id *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  const __CFString *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  ANLogHandleHomeManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1[4], "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "userID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v11 = &stru_1E93913D0;
    v12 = 2112;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1D23A0000, v2, OS_LOG_TYPE_DEFAULT, "%@HomeKit Removed User %@, %@, %@", buf, 0x2Au);

  }
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__ANHomeManager_home_didRemoveUser___block_invoke_43;
  v7[3] = &unk_1E938FD38;
  v8 = a1[5];
  v9 = a1[4];
  objc_msgSend(WeakRetained, "_executeBlockForDelegates:", v7);

}

void __36__ANHomeManager_home_didRemoveUser___block_invoke_43(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "home:didRemoveUser:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)accessoryDidUpdateControllable:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[ANHomeManager serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__ANHomeManager_accessoryDidUpdateControllable___block_invoke;
  block[3] = &unk_1E938FD10;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__ANHomeManager_accessoryDidUpdateControllable___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const __CFString *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  ANLogHandleHomeManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "isControllable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v11 = &stru_1E93913D0;
    v12 = 2112;
    v13 = v3;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1D23A0000, v2, OS_LOG_TYPE_DEFAULT, "%@Accessory Controllable Updated: %@, %@", buf, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__ANHomeManager_accessoryDidUpdateControllable___block_invoke_47;
  v8[3] = &unk_1E938FCE8;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "_executeBlockForDelegates:", v8);

}

void __48__ANHomeManager_accessoryDidUpdateControllable___block_invoke_47(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "accessoryDidUpdateControllable:", *(_QWORD *)(a1 + 32));

}

- (void)accessoryDidUpdateName:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[ANHomeManager serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ANHomeManager_accessoryDidUpdateName___block_invoke;
  block[3] = &unk_1E938FD10;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __40__ANHomeManager_accessoryDidUpdateName___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  const __CFString *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  ANLogHandleHomeManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v9 = &stru_1E93913D0;
    v10 = 2112;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1D23A0000, v2, OS_LOG_TYPE_DEFAULT, "%@Accessory Name Updated: %@, %@", buf, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__ANHomeManager_accessoryDidUpdateName___block_invoke_50;
  v6[3] = &unk_1E938FCE8;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "_executeBlockForDelegates:", v6);

}

void __40__ANHomeManager_accessoryDidUpdateName___block_invoke_50(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "accessoryDidUpdateName:", *(_QWORD *)(a1 + 32));

}

- (void)accessoryDidUpdateSupportsAudioAnalysis:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[ANHomeManager serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__ANHomeManager_accessoryDidUpdateSupportsAudioAnalysis___block_invoke;
  block[3] = &unk_1E938FD10;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __57__ANHomeManager_accessoryDidUpdateSupportsAudioAnalysis___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  id WeakRetained;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const __CFString *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  ANLogHandleHomeManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(*(id *)(a1 + 32), "supportsAudioAnalysis");
    *(_DWORD *)buf = 138413058;
    v10 = &stru_1E93913D0;
    v11 = 2112;
    v12 = v3;
    v13 = 2112;
    v14 = v4;
    v15 = 1024;
    v16 = v5;
    _os_log_impl(&dword_1D23A0000, v2, OS_LOG_TYPE_DEFAULT, "%@Accessory Supports Audio Analysis Updated: %@, %@, Supports Audio Analysis = %d", buf, 0x26u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__ANHomeManager_accessoryDidUpdateSupportsAudioAnalysis___block_invoke_53;
  v7[3] = &unk_1E938FCE8;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "_executeBlockForDelegates:", v7);

}

void __57__ANHomeManager_accessoryDidUpdateSupportsAudioAnalysis___block_invoke_53(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "accessoryDidUpdateSupportedCapabilities:", *(_QWORD *)(a1 + 32));

}

- (void)accessoryDidUpdateSupportsDropIn:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[ANHomeManager serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ANHomeManager_accessoryDidUpdateSupportsDropIn___block_invoke;
  block[3] = &unk_1E938FD10;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __50__ANHomeManager_accessoryDidUpdateSupportsDropIn___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  id WeakRetained;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const __CFString *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  ANLogHandleHomeManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(*(id *)(a1 + 32), "supportsDropIn");
    *(_DWORD *)buf = 138413058;
    v10 = &stru_1E93913D0;
    v11 = 2112;
    v12 = v3;
    v13 = 2112;
    v14 = v4;
    v15 = 1024;
    v16 = v5;
    _os_log_impl(&dword_1D23A0000, v2, OS_LOG_TYPE_DEFAULT, "%@Accessory Supports Drop In Updated: %@, %@, Supports Drop In = %d", buf, 0x26u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__ANHomeManager_accessoryDidUpdateSupportsDropIn___block_invoke_56;
  v7[3] = &unk_1E938FCE8;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "_executeBlockForDelegates:", v7);

}

void __50__ANHomeManager_accessoryDidUpdateSupportsDropIn___block_invoke_56(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "accessoryDidUpdateSupportedCapabilities:", *(_QWORD *)(a1 + 32));

}

- (void)_executeBlockForDelegates:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ANHomeManager serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__ANHomeManager__executeBlockForDelegates___block_invoke;
  v7[3] = &unk_1E938F8E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __43__ANHomeManager__executeBlockForDelegates___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  id obj;
  _QWORD block[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegatesToQueues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v9);
        objc_msgSend(*(id *)(a1 + 32), "delegatesToQueues");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v10);
        v12 = objc_claimAutoreleasedReturnValue();

        block[0] = v8;
        block[1] = 3221225472;
        block[2] = __43__ANHomeManager__executeBlockForDelegates___block_invoke_2;
        block[3] = &unk_1E938FDD8;
        v13 = *(id *)(a1 + 40);
        block[4] = v10;
        v16 = v13;
        dispatch_async(v12, block);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

}

uint64_t __43__ANHomeManager__executeBlockForDelegates___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (ANAccessorySettingsCache)accessorySettingsCache
{
  return self->_accessorySettingsCache;
}

- (BOOL)homesLoaded
{
  return self->_homesLoaded;
}

- (void)setHomesLoaded:(BOOL)a3
{
  self->_homesLoaded = a3;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (NSMutableArray)homesLoadedCompletionHandlers
{
  return self->_homesLoadedCompletionHandlers;
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (NSMapTable)delegatesToQueues
{
  return self->_delegatesToQueues;
}

- (NSDate)loadHomesStart
{
  return self->_loadHomesStart;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadHomesStart, 0);
  objc_storeStrong((id *)&self->_delegatesToQueues, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_homesLoadedCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_accessorySettingsCache, 0);
}

@end
