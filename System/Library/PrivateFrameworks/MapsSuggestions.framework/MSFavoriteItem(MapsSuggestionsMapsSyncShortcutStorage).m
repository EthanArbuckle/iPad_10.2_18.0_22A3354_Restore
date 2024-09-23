@implementation MSFavoriteItem(MapsSuggestionsMapsSyncShortcutStorage)

+ (id)favoriteItemWithShortcut:()MapsSuggestionsMapsSyncShortcutStorage
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "storageIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(v3, "identifierForStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setStorageIdentifier:", v5);

  }
  v6 = objc_alloc_init(MEMORY[0x1E0D47368]);
  objc_msgSend(v6, "setVersion:", 0);
  objc_msgSend(v6, "setType:", (__int16)objc_msgSend(v3, "type"));
  objc_msgSend(v3, "storageIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentifier:", v7);

  objc_msgSend(v3, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShortcutIdentifier:", v8);

  MapsSuggestionsMapsSyncSimulateCrashIfMapItemIsNil(v3);
  objc_msgSend(v3, "geoMapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMapItemStorage:", v9);

  objc_msgSend(v3, "customName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCustomName:", v10);

  objc_msgSend(v6, "setHidden:", objc_msgSend(v3, "isHidden"));
  objc_msgSend(v3, "originatingAddressString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOriginatingAddressString:", v11);

  objc_msgSend(v6, "setSource:", (__int16)objc_msgSend(v3, "source"));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v3, "contacts", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "handleValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addContactHandle:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  return v6;
}

- (void)updateWithShortcut:()MapsSuggestionsMapsSyncShortcutStorage didChange:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t i;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t j;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t k;
  void *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  *a4 = 0;
  MapsSuggestionsMapsSyncSimulateCrashIfMapItemIsNil(v6);
  objc_msgSend(a1, "muid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "geoMapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedLongLong:", objc_msgSend(v9, "_muid"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "isEqual:", v10);

  if ((v11 & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "geoMapItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberWithUnsignedLongLong:", objc_msgSend(v13, "_muid"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setMuid:", v14);

    *a4 = 1;
  }
  objc_msgSend(a1, "latitude");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "geoMapItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "coordinate");
  objc_msgSend(v16, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v15, "isEqual:", v18);

  if ((v19 & 1) == 0)
  {
    v20 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "geoMapItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "coordinate");
    objc_msgSend(v20, "numberWithDouble:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setLatitude:", v22);

    *a4 = 1;
  }
  objc_msgSend(a1, "longitude");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "geoMapItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "coordinate");
  objc_msgSend(v24, "numberWithDouble:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v23, "isEqual:", v27);

  if ((v28 & 1) == 0)
  {
    v29 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "geoMapItem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "coordinate");
    objc_msgSend(v29, "numberWithDouble:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setLongitude:", v32);

    *a4 = 1;
  }
  objc_msgSend(a1, "mapItemStorage");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "geoMapItem");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v33, "isEqual:", v34);

  if ((v35 & 1) == 0)
  {
    objc_msgSend(v6, "geoMapItem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setMapItemStorage:", v36);

    *a4 = 1;
  }
  objc_msgSend(a1, "shortcutIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v37, "isEqualToString:", v38);

  if ((v39 & 1) == 0)
  {
    objc_msgSend(v6, "identifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setShortcutIdentifier:", v40);

    *a4 = 1;
  }
  v41 = objc_msgSend(a1, "hidden");
  if (v41 != objc_msgSend(v6, "isHidden"))
  {
    objc_msgSend(a1, "setHidden:", objc_msgSend(v6, "isHidden"));
    *a4 = 1;
  }
  objc_msgSend(a1, "customName");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "customName");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v42, "isEqualToString:", v43);

  if ((v44 & 1) == 0)
  {
    objc_msgSend(v6, "customName");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setCustomName:", v45);

    *a4 = 1;
  }
  objc_msgSend(a1, "shortcutIdentifier");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v46, "isEqualToString:", v47);

  if ((v48 & 1) == 0)
  {
    objc_msgSend(v6, "identifier");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setShortcutIdentifier:", v49);

    *a4 = 1;
  }
  v50 = objc_msgSend(a1, "type");
  if (v50 != (__int16)objc_msgSend(v6, "type"))
  {
    objc_msgSend(a1, "setType:", (__int16)objc_msgSend(v6, "type"));
    *a4 = 1;
  }
  objc_msgSend(a1, "originatingAddressString");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "originatingAddressString");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v51, "isEqualToString:", v52);

  if ((v53 & 1) == 0)
  {
    objc_msgSend(v6, "originatingAddressString");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setOriginatingAddressString:", v54);

    *a4 = 1;
  }
  v55 = objc_msgSend(a1, "source");
  if (v55 != (__int16)objc_msgSend(v6, "source"))
  {
    objc_msgSend(a1, "setSource:", (__int16)objc_msgSend(v6, "source"));
    *a4 = 1;
  }
  v56 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "fetchContactHandles");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setWithArray:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  objc_msgSend(v6, "contacts");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v88;
    do
    {
      for (i = 0; i != v62; ++i)
      {
        if (*(_QWORD *)v88 != v63)
          objc_enumerationMutation(v60);
        objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * i), "handleValue");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "addObject:", v65);

      }
      v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
    }
    while (v62);
  }

  v66 = (void *)objc_msgSend(v59, "mutableCopy");
  objc_msgSend(v66, "minusSet:", v58);
  v78 = v58;
  v67 = (void *)objc_msgSend(v58, "mutableCopy");
  objc_msgSend(v67, "minusSet:", v59);
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v68 = v67;
  v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
  if (v69)
  {
    v70 = v69;
    v71 = *(_QWORD *)v84;
    do
    {
      for (j = 0; j != v70; ++j)
      {
        if (*(_QWORD *)v84 != v71)
          objc_enumerationMutation(v68);
        objc_msgSend(a1, "removeContactHandle:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * j));
        *a4 = 1;
      }
      v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
    }
    while (v70);
  }

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v73 = v66;
  v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
  if (v74)
  {
    v75 = v74;
    v76 = *(_QWORD *)v80;
    do
    {
      for (k = 0; k != v75; ++k)
      {
        if (*(_QWORD *)v80 != v76)
          objc_enumerationMutation(v73);
        objc_msgSend(a1, "addContactHandle:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * k));
        *a4 = 1;
      }
      v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
    }
    while (v75);
  }

}

@end
