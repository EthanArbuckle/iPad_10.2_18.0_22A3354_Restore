@implementation ANAnnouncementDestination(Home)

- (id)home
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = objc_msgSend(a1, "type");
  if (v2 == 1)
  {
    objc_msgSend(a1, "homeObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[ANHomeManager shared](ANHomeManager, "shared");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "homeForID:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v8 = (void *)v7;

    return v8;
  }
  if (!v2)
  {
    +[ANHomeManager shared](ANHomeManager, "shared");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentAccessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      +[ANHomeManager shared](ANHomeManager, "shared");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "currentAccessory");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "home");
    }
    else
    {
      objc_msgSend(a1, "homeObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[ANHomeManager shared](ANHomeManager, "shared");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "homeWithName:", v5);
    }
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v8 = 0;
  return v8;
}

- (id)zones
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
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
  objc_msgSend(a1, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_msgSend(a1, "type");
    if (v3 == 1)
    {
      v13 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(a1, "zoneObjects");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "arrayWithCapacity:", objc_msgSend(v14, "count"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      objc_msgSend(a1, "zoneObjects", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v22 != v17)
              objc_enumerationMutation(v7);
            objc_msgSend(v2, "hmu_zoneWithUniqueIdentifier:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
              objc_msgSend(v6, "addObject:", v19);

          }
          v16 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        }
        while (v16);
      }
      goto LABEL_24;
    }
    if (!v3)
    {
      v4 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(a1, "zoneObjects");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      objc_msgSend(a1, "zoneObjects");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v26;
        do
        {
          for (j = 0; j != v9; ++j)
          {
            if (*(_QWORD *)v26 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(v2, "hmu_zoneWithName:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
              objc_msgSend(v6, "addObject:", v12);

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        }
        while (v9);
      }
LABEL_24:

      goto LABEL_25;
    }
  }
  v6 = 0;
LABEL_25:

  return v6;
}

- (id)rooms
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
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
  objc_msgSend(a1, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_msgSend(a1, "type");
    if (v3 == 1)
    {
      v13 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(a1, "roomObjects");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "arrayWithCapacity:", objc_msgSend(v14, "count"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      objc_msgSend(a1, "roomObjects", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v22 != v17)
              objc_enumerationMutation(v7);
            objc_msgSend(v2, "hmu_roomWithUniqueIdentifier:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
              objc_msgSend(v6, "addObject:", v19);

          }
          v16 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        }
        while (v16);
      }
      goto LABEL_24;
    }
    if (!v3)
    {
      v4 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(a1, "roomObjects");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      objc_msgSend(a1, "roomObjects");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v26;
        do
        {
          for (j = 0; j != v9; ++j)
          {
            if (*(_QWORD *)v26 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(v2, "hmu_roomWithName:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
              objc_msgSend(v6, "addObject:", v12);

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        }
        while (v9);
      }
LABEL_24:

      goto LABEL_25;
    }
  }
  v6 = 0;
LABEL_25:

  return v6;
}

@end
