@implementation DSAppPermissionsDescriptor

+ (id)sortSensorDict:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __45__DSAppPermissionsDescriptor_sortSensorDict___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  v5 = a2;
  +[DSUtilities tccServices](DSUtilities, "tccServices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tccPermission");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "indexOfObject:", v7);
  objc_msgSend(v4, "tccPermission");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 < objc_msgSend(v6, "indexOfObject:", v9))
    v10 = -1;
  else
    v10 = 1;

  return v10;
}

+ (void)ensureApp:(id)a3 inSensorDict:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  DSSensor *v15;
  id v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  uint64_t v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v22 = v5;
  objc_msgSend(v5, "permissionsGranted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        +[DSAppPermissionsDescriptor localizedNameForPermission:](DSAppPermissionsDescriptor, "localizedNameForPermission:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        DSLocStringForKey(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v14, "length"))
        {
          v15 = objc_alloc_init(DSSensor);
          -[DSSensor setLocalizedName:](v15, "setLocalizedName:", v14);
          -[DSSensor setTccPermission:](v15, "setTccPermission:", v12);
          objc_msgSend(v6, "setValue:forKey:", v15, v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __53__DSAppPermissionsDescriptor_ensureApp_inSensorDict___block_invoke;
  v23[3] = &unk_24F081D00;
  v24 = v6;
  v16 = v6;
  v17 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x22E2A849C](v23);
  if (objc_msgSend(v22, "hasLocationAccess"))
  {
    v18 = objc_msgSend(v22, "locationAuthorization");
    v19 = CFSTR("DSLocationWhenInUse");
    if (v18 == 2)
      v19 = CFSTR("DSLocationAlways");
    v20 = v19;
    DSLocStringForKey(CFSTR("LOCATION"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, __CFString *))v17)[2](v17, v21, v20);

  }
}

void __53__DSAppPermissionsDescriptor_ensureApp_inSensorDict___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  char v8;
  DSSensor *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v12);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        v8 = objc_msgSend(v5, "isEqualToString:", CFSTR("DSLocationWhenInUse")),
        v7,
        (v8 & 1) == 0))
  {
    v9 = objc_alloc_init(DSSensor);
    -[DSSensor setLocalizedName:](v9, "setLocalizedName:", v12);
    -[DSSensor setTccPermission:](v9, "setTccPermission:", v5);
    v10 = *(void **)(a1 + 32);
    -[DSSensor localizedName](v9, "localizedName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forKey:", v9, v11);

  }
}

+ (id)localizedNameForPermission:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = localizedNameForPermission__token;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&localizedNameForPermission__token, &__block_literal_global_213);
  objc_msgSend((id)localizedNameForPermission__localizedNames, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __57__DSAppPermissionsDescriptor_localizedNameForPermission___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("DSLocationAlways"), CFSTR("BLUETOOTH"), *MEMORY[0x24BEB3838], CFSTR("LOCATION"), CFSTR("DSLocationWhenInUse"), CFSTR("MICROPHONE"), *MEMORY[0x24BEB38C0], CFSTR("CAMERA"), *MEMORY[0x24BEB3848], CFSTR("PHOTOS"), *MEMORY[0x24BEB38D8], CFSTR("MEDIA_LIBRARY"), *MEMORY[0x24BEB38B8], CFSTR("HOMEKIT"), *MEMORY[0x24BEB3998], CFSTR("CALENDAR"), *MEMORY[0x24BEB3840],
    CFSTR("REMINDERS"),
    *MEMORY[0x24BEB38E8],
    CFSTR("CONTACTS"),
    CFSTR("DSContacts"),
    CFSTR("HEALTH"),
    CFSTR("DSHealth"),
    CFSTR("LOCAL_NETWORK"),
    CFSTR("DSLocalNetwork"),
    CFSTR("NEARBY_INTERACTION"),
    *MEMORY[0x24BEB38D0],
    CFSTR("SENSORKIT_LOCATION"),
    *MEMORY[0x24BEB3910],
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)localizedNameForPermission__localizedNames;
  localizedNameForPermission__localizedNames = v0;

}

+ (id)localizedDescriptionFromPermissions:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  +[DSUtilities tccServices](DSUtilities, "tccServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (+[DSApp app:hasPermission:](DSApp, "app:hasPermission:", v3, v10))
        {
          +[DSAppPermissionsDescriptor localizedNameForPermission:](DSAppPermissionsDescriptor, "localizedNameForPermission:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            DSLocStringForKey(v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v13);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  +[DSUtilities localizedDetailStringWithTruncationFromArray:withType:](DSUtilities, "localizedDetailStringWithTruncationFromArray:withType:", v4, CFSTR("com.apple.DigitalSeparation.Permissions"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)appsWithPermission:(id)a3 fromAllApps:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (+[DSApp app:hasPermissionAcceptingAnyLocationAuthorization:](DSApp, "app:hasPermissionAcceptingAnyLocationAuthorization:", v13, v5, (_QWORD)v15))
        {
          objc_msgSend(v7, "addObject:", v13);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

+ (id)localizedDescriptionFromApps:(id)a3 permission:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a4, "tccPermission");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSAppPermissionsDescriptor appsWithPermission:fromAllApps:](DSAppPermissionsDescriptor, "appsWithPermission:fromAllApps:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "displayName", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  +[DSUtilities localizedDetailStringWithTruncationFromArray:withType:](DSUtilities, "localizedDetailStringWithTruncationFromArray:withType:", v8, CFSTR("com.apple.DigitalSeparation.Apps"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)enumerateAppPermissionPairsFromApps:(id)a3 permissions:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        objc_msgSend(v5, "allObjects", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[DSAppPermissionsDescriptor appsWithPermission:fromAllApps:](DSAppPermissionsDescriptor, "appsWithPermission:fromAllApps:", v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "count"))
          objc_msgSend(v7, "setObject:forKey:", v15, v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
}

@end
