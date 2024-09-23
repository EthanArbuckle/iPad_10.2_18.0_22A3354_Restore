@implementation MKMapItem(MUExtras)

- (MUTrailSelectionInfo)_mapsui_trailSelectionInfoForMap
{
  int v2;
  void *v3;
  uint64_t v4;
  MUTrailSelectionInfo *v5;
  uint64_t v6;
  void *v7;
  MUTrailSelectionInfo *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  MUTrailSelectionInfo *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "_placeCategoryType");
  if (v2 == 2)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(a1, "_geoMapItem", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_trailHead");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trails");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v7);
          v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (objc_msgSend(v15, "shouldHighlight"))
          {
            if (objc_msgSend(v15, "trailId"))
            {
              objc_msgSend(v15, "name");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "length");

              if (v17)
              {
                v19 = [MUTrailSelectionInfo alloc];
                v20 = objc_msgSend(v15, "trailId");
                objc_msgSend(v15, "name");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v8 = -[MUTrailSelectionInfo initWithTrailID:trailName:](v19, "initWithTrailID:trailName:", v20, v21);

                goto LABEL_18;
              }
            }
          }
        }
        v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v12)
          continue;
        break;
      }
    }

    return (MUTrailSelectionInfo *)0;
  }
  if (v2 != 1)
    return (MUTrailSelectionInfo *)0;
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    return (MUTrailSelectionInfo *)0;
  v5 = [MUTrailSelectionInfo alloc];
  v6 = objc_msgSend(a1, "_muid");
  objc_msgSend(a1, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MUTrailSelectionInfo initWithTrailID:trailName:](v5, "initWithTrailID:trailName:", v6, v7);
LABEL_18:

  return v8;
}

- (uint64_t)_mapsui_associatedHikingItemType
{
  int v1;

  v1 = objc_msgSend(a1, "_placeCategoryType");
  if (v1 == 1)
    return 2;
  else
    return v1 == 2;
}

@end
