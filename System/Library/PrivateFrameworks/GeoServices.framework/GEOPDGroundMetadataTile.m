@implementation GEOPDGroundMetadataTile

- (GEOPDGroundMetadataTile)init
{
  GEOPDGroundMetadataTile *v2;
  GEOPDGroundMetadataTile *v3;
  GEOPDGroundMetadataTile *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDGroundMetadataTile;
  v2 = -[GEOPDGroundMetadataTile init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDGroundMetadataTile)initWithData:(id)a3
{
  GEOPDGroundMetadataTile *v3;
  GEOPDGroundMetadataTile *v4;
  GEOPDGroundMetadataTile *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDGroundMetadataTile;
  v3 = -[GEOPDGroundMetadataTile initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPhotoPositions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGroundMetadataTileReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhotoPositions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)photoPositions
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDGroundMetadataTile _readPhotoPositions]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)_addNoFlagsPhotoPosition:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readStorefronts
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGroundMetadataTileReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStorefronts_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)storefronts
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDGroundMetadataTile _readStorefronts]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)_addNoFlagsStorefront:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readBuildTables
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGroundMetadataTileReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBuildTables_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)_addNoFlagsBuildTable:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (id)buildTableAtIndex:(id *)a1
{
  id *v3;

  if (a1)
  {
    v3 = a1;
    -[GEOPDGroundMetadataTile _readBuildTables]((uint64_t)a1);
    objc_msgSend(v3[2], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)_readCameraMetadataTables
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGroundMetadataTileReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCameraMetadataTables_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)cameraMetadataTables
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDGroundMetadataTile _readCameraMetadataTables]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)_addNoFlagsCameraMetadataTable:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readCoord
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGroundMetadataTileReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCoord_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)coord
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDGroundMetadataTile _readCoord]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDGroundMetadataTile;
  -[GEOPDGroundMetadataTile description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDGroundMetadataTile dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDGroundMetadataTile _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  __int128 v46;
  __int128 v47;
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
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDGroundMetadataTile readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v6 = *(id *)(a1 + 40);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v59 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("photoPosition");
    else
      v13 = CFSTR("photo_position");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v15 = *(id *)(a1 + 48);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v55;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v55 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
      }
      while (v17);
    }

    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("storefront"));
  }
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v23 = *(id *)(a1 + 16);
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v51;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v51 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v28, "jsonRepresentation");
          else
            objc_msgSend(v28, "dictionaryRepresentation");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v29);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
      }
      while (v25);
    }

    if (a2)
      v30 = CFSTR("buildTable");
    else
      v30 = CFSTR("build_table");
    objc_msgSend(v4, "setObject:forKey:", v22, v30);

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v32 = *(id *)(a1 + 24);
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v47;
      do
      {
        for (m = 0; m != v34; ++m)
        {
          if (*(_QWORD *)v47 != v35)
            objc_enumerationMutation(v32);
          v37 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v37, "jsonRepresentation");
          else
            objc_msgSend(v37, "dictionaryRepresentation", (_QWORD)v46);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v38, (_QWORD)v46);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
      }
      while (v34);
    }

    if (a2)
      v39 = CFSTR("cameraMetadataTable");
    else
      v39 = CFSTR("camera_metadata_table");
    objc_msgSend(v4, "setObject:forKey:", v31, v39, (_QWORD)v46);

  }
  -[GEOPDGroundMetadataTile coord]((id *)a1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (v40)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v40, "jsonRepresentation");
    else
      objc_msgSend(v40, "dictionaryRepresentation");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("coord"));

  }
  if ((*(_BYTE *)(a1 + 72) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 68));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v44 = CFSTR("tileBuildId");
    else
      v44 = CFSTR("tile_build_id");
    objc_msgSend(v4, "setObject:forKey:", v43, v44);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDGroundMetadataTile _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t m;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_15;
      else
        v6 = (int *)&readAll__nonRecursiveTag_15;
      GEOPDGroundMetadataTileReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
    {
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v7 = *(id *)(a1 + 40);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v36 != v9)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "readAll:", 1);
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
        }
        while (v8);
      }

      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v11 = *(id *)(a1 + 48);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v32;
        do
        {
          for (j = 0; j != v12; ++j)
          {
            if (*(_QWORD *)v32 != v13)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "readAll:", 1);
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
        }
        while (v12);
      }

      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v15 = *(id *)(a1 + 16);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v28;
        do
        {
          for (k = 0; k != v16; ++k)
          {
            if (*(_QWORD *)v28 != v17)
              objc_enumerationMutation(v15);
            -[GEOPDGroundDataBuild readAll:](*(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * k), 1);
          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
        }
        while (v16);
      }

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v19 = *(id *)(a1 + 24);
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v23, v39, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v24;
        do
        {
          for (m = 0; m != v20; ++m)
          {
            if (*(_QWORD *)v24 != v21)
              objc_enumerationMutation(v19);
            -[GEOPDCameraMetadata readAll:](*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * m), 1);
          }
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v23, v39, 16);
        }
        while (v20);
      }

      objc_msgSend(*(id *)(a1 + 32), "readAll:", 1, (_QWORD)v23);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDGroundMetadataTileReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  char flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  PBDataReader *v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
  __int128 v35;
  __int128 v36;
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
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader)
    goto LABEL_35;
  os_unfair_lock_assert_owner(&self->_readerLock);
  flags = (char)self->_flags;
  if ((flags & 0x7E) != 0)
    goto LABEL_35;
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v7 = self->_storefronts;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v60;
LABEL_6:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v60 != v9)
          objc_enumerationMutation(v7);
        if ((GEOPDStorefrontBundleIsDirty(*(os_unfair_lock_s **)(*((_QWORD *)&v59 + 1) + 8 * v10)) & 1) != 0)
          goto LABEL_34;
        if (v8 == ++v10)
        {
          v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
          if (v8)
            goto LABEL_6;
          break;
        }
      }
    }

    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v7 = self->_buildTables;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v56;
LABEL_16:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v56 != v12)
          objc_enumerationMutation(v7);
        if (GEOPDGroundDataBuildIsDirty(*(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v13)))
          goto LABEL_34;
        if (v11 == ++v13)
        {
          v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
          if (v11)
            goto LABEL_16;
          break;
        }
      }
    }

    flags = (char)self->_flags;
  }
  if ((flags & 4) == 0)
  {
LABEL_33:
    v17 = self->_reader;
    objc_sync_enter(v17);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v18);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v17);
    goto LABEL_67;
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v7 = self->_cameraMetadataTables;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
  if (!v14)
  {
LABEL_32:

    goto LABEL_33;
  }
  v15 = *(_QWORD *)v52;
LABEL_26:
  v16 = 0;
  while (1)
  {
    if (*(_QWORD *)v52 != v15)
      objc_enumerationMutation(v7);
    if (GEOPDCameraMetadataIsDirty(*(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v16)))
      break;
    if (v14 == ++v16)
    {
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
      if (v14)
        goto LABEL_26;
      goto LABEL_32;
    }
  }
LABEL_34:

LABEL_35:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDGroundMetadataTile readAll:]((uint64_t)self, 0);
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v19 = self->_photoPositions;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v47, v66, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v48 != v21)
          objc_enumerationMutation(v19);
        PBDataWriterWriteSubmessage();
      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v47, v66, 16);
    }
    while (v20);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v23 = self->_storefronts;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v43, v65, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v44 != v25)
          objc_enumerationMutation(v23);
        PBDataWriterWriteSubmessage();
      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v43, v65, 16);
    }
    while (v24);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v27 = self->_buildTables;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v39, v64, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v40;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v40 != v29)
          objc_enumerationMutation(v27);
        PBDataWriterWriteSubmessage();
      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v39, v64, 16);
    }
    while (v28);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v31 = self->_cameraMetadataTables;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v35, v63, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v36;
    do
    {
      for (m = 0; m != v32; ++m)
      {
        if (*(_QWORD *)v36 != v33)
          objc_enumerationMutation(v31);
        PBDataWriterWriteSubmessage();
      }
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v35, v63, 16);
    }
    while (v32);
  }

  if (self->_coord)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteUint32Field();
LABEL_67:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  GEOPDGroundMetadataTile *v8;
  PBDataReader *v9;
  id v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  id v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  id v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  GEOPDGroundMetadataTile *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
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
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v8 = self;
    v9 = reader;
    objc_sync_enter(v9);
    if ((*(_BYTE *)&v8->_flags & 0x40) == 0)
    {
      *(_QWORD *)((char *)v8->_reader + (int)*MEMORY[0x1E0D82BD8]) = v8->_readerMarkLength;
      -[PBDataReader seekToOffset:](v8->_reader, "seekToOffset:", v8->_readerMarkPos);
      GEOPDGroundMetadataTileReadAllFrom(v5, v8->_reader);
      os_unfair_lock_unlock(p_readerLock);
      v10 = (id)v5;
      objc_sync_exit(v9);

      return (id)v5;
    }
    objc_sync_exit(v9);

    self = v8;
  }
  os_unfair_lock_unlock(p_readerLock);
  -[GEOPDGroundMetadataTile readAll:]((uint64_t)self, 0);
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v42 = self;
  v11 = self->_photoPositions;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v56 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "copyWithZone:", a3);
        v16 = v15;
        if (v5)
        {
          v17 = v15;
          -[GEOPDGroundMetadataTile _readPhotoPositions](v5);
          -[GEOPDGroundMetadataTile _addNoFlagsPhotoPosition:](v5, v17);

          os_unfair_lock_lock_with_options();
          *(_BYTE *)(v5 + 72) |= 0x10u;
          os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 64));
          *(_BYTE *)(v5 + 72) |= 0x40u;
        }

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
    }
    while (v12);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v18 = v42->_storefronts;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v52 != v20)
          objc_enumerationMutation(v18);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * j), "copyWithZone:", a3);
        v23 = v22;
        if (v5)
        {
          v24 = v22;
          -[GEOPDGroundMetadataTile _readStorefronts](v5);
          -[GEOPDGroundMetadataTile _addNoFlagsStorefront:](v5, v24);

          os_unfair_lock_lock_with_options();
          *(_BYTE *)(v5 + 72) |= 0x20u;
          os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 64));
          *(_BYTE *)(v5 + 72) |= 0x40u;
        }

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    }
    while (v19);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v25 = v42->_buildTables;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v48;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v48 != v27)
          objc_enumerationMutation(v25);
        v29 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * k), "copyWithZone:", a3);
        v30 = v29;
        if (v5)
        {
          v31 = v29;
          -[GEOPDGroundMetadataTile _readBuildTables](v5);
          -[GEOPDGroundMetadataTile _addNoFlagsBuildTable:](v5, v31);

          os_unfair_lock_lock_with_options();
          *(_BYTE *)(v5 + 72) |= 2u;
          os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 64));
          *(_BYTE *)(v5 + 72) |= 0x40u;
        }

      }
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
    }
    while (v26);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v32 = v42->_cameraMetadataTables;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v44;
    do
    {
      for (m = 0; m != v33; ++m)
      {
        if (*(_QWORD *)v44 != v34)
          objc_enumerationMutation(v32);
        v36 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * m), "copyWithZone:", a3);
        v37 = v36;
        if (v5)
        {
          v38 = v36;
          -[GEOPDGroundMetadataTile _readCameraMetadataTables](v5);
          -[GEOPDGroundMetadataTile _addNoFlagsCameraMetadataTable:](v5, v38);

          os_unfair_lock_lock_with_options();
          *(_BYTE *)(v5 + 72) |= 4u;
          os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 64));
          *(_BYTE *)(v5 + 72) |= 0x40u;
        }

      }
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
    }
    while (v33);
  }

  v39 = -[GEOTileCoordinate copyWithZone:](v42->_coord, "copyWithZone:", a3);
  v40 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v39;

  if ((*(_BYTE *)&v42->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = v42->_tileBuildId;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *photoPositions;
  NSMutableArray *storefronts;
  NSMutableArray *buildTables;
  NSMutableArray *cameraMetadataTables;
  GEOTileCoordinate *coord;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEOPDGroundMetadataTile readAll:]((uint64_t)self, 1);
  -[GEOPDGroundMetadataTile readAll:]((uint64_t)v4, 1);
  photoPositions = self->_photoPositions;
  if ((unint64_t)photoPositions | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](photoPositions, "isEqual:"))
      goto LABEL_16;
  }
  storefronts = self->_storefronts;
  if ((unint64_t)storefronts | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](storefronts, "isEqual:"))
      goto LABEL_16;
  }
  buildTables = self->_buildTables;
  if ((unint64_t)buildTables | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](buildTables, "isEqual:"))
      goto LABEL_16;
  }
  cameraMetadataTables = self->_cameraMetadataTables;
  if ((unint64_t)cameraMetadataTables | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](cameraMetadataTables, "isEqual:"))
      goto LABEL_16;
  }
  coord = self->_coord;
  if ((unint64_t)coord | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOTileCoordinate isEqual:](coord, "isEqual:"))
      goto LABEL_16;
  }
  v10 = (*((_BYTE *)v4 + 72) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) != 0 && self->_tileBuildId == *((_DWORD *)v4 + 17))
    {
      v10 = 1;
      goto LABEL_17;
    }
LABEL_16:
    v10 = 0;
  }
LABEL_17:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  -[GEOPDGroundMetadataTile readAll:]((uint64_t)self, 1);
  v3 = -[NSMutableArray hash](self->_photoPositions, "hash");
  v4 = -[NSMutableArray hash](self->_storefronts, "hash");
  v5 = -[NSMutableArray hash](self->_buildTables, "hash");
  v6 = -[NSMutableArray hash](self->_cameraMetadataTables, "hash");
  v7 = -[GEOTileCoordinate hash](self->_coord, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v8 = 2654435761 * self->_tileBuildId;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefronts, 0);
  objc_storeStrong((id *)&self->_photoPositions, 0);
  objc_storeStrong((id *)&self->_coord, 0);
  objc_storeStrong((id *)&self->_cameraMetadataTables, 0);
  objc_storeStrong((id *)&self->_buildTables, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
