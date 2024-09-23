@implementation NSArray(GEOMapItemPhoto)

- (id)_geo_firstPhotoOfAtLeastSize:()GEOMapItemPhoto
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = a1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v9), "bestPhotoForSize:allowSmaller:", 0, a2, a3);
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = v5;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (!v12)
    {
      v16 = 0;
      goto LABEL_19;
    }
    v13 = v12;
    v14 = *(_QWORD *)v19;
LABEL_11:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v14)
        objc_enumerationMutation(v11);
      objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15), "bestPhotoForSize:allowSmaller:", 1, a2, a3, (_QWORD)v18);
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
        break;
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        v16 = 0;
        if (v13)
          goto LABEL_11;
        goto LABEL_19;
      }
    }
  }
  v16 = (void *)v10;
LABEL_19:

  return v16;
}

@end
