@implementation ANLocation(Home)

- (uint64_t)containsAccessory:()Home
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
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
  v4 = a3;
  objc_msgSend(a1, "homeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if (v8)
  {
    if ((objc_msgSend(a1, "flags") & 1) != 0)
    {
      v31 = 1;
    }
    else
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      objc_msgSend(a1, "roomUUIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v46;
        while (2)
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v46 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v13);
            objc_msgSend(v4, "room");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "uniqueIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v14) = objc_msgSend(v14, "isEqual:", v16);

            if ((v14 & 1) != 0)
            {
LABEL_30:
              v31 = 1;
              goto LABEL_31;
            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
          if (v11)
            continue;
          break;
        }
      }

      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      objc_msgSend(a1, "zoneUUIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      if (v34)
      {
        v17 = *(_QWORD *)v42;
        v33 = *(_QWORD *)v42;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v42 != v17)
              objc_enumerationMutation(v9);
            v35 = v18;
            v19 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v18);
            objc_msgSend(v4, "home", v33);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "hmu_zoneWithUniqueIdentifier:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            v39 = 0u;
            v40 = 0u;
            v37 = 0u;
            v38 = 0u;
            v36 = v21;
            objc_msgSend(v21, "rooms");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
            if (v23)
            {
              v24 = v23;
              v25 = *(_QWORD *)v38;
              while (2)
              {
                v26 = 0;
                do
                {
                  if (*(_QWORD *)v38 != v25)
                    objc_enumerationMutation(v22);
                  objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v26), "uniqueIdentifier");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "room");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "uniqueIdentifier");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = objc_msgSend(v27, "isEqual:", v29);

                  if ((v30 & 1) != 0)
                  {

                    goto LABEL_30;
                  }
                  ++v26;
                }
                while (v24 != v26);
                v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
                if (v24)
                  continue;
                break;
              }
            }

            v18 = v35 + 1;
            v17 = v33;
          }
          while (v35 + 1 != v34);
          v34 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
        }
        while (v34);
      }
      v31 = 0;
LABEL_31:

    }
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (id)allRoomsInHome:()Home
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(a1, "roomUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "roomUUIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hmu_roomsWithUniqueIdentifiers:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  objc_msgSend(a1, "zoneUUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(a1, "zoneUUIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hmu_zonesWithUniqueIdentifiers:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }

  objc_msgSend(MEMORY[0x1E0CBA980], "hmu_roomsInZones:appendingRooms:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
